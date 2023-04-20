import 'package:fireapp/base/list_extensions.dart';
import 'package:fireapp/base/mutex_extension.dart';
import 'package:fireapp/domain/repository/reference_data_repository.dart';
import 'package:fireapp/domain/request_state.dart';
import 'package:fireapp/global/di.dart';
import 'package:fireapp/presentation/change_roles/change_roles_option_model.dart';
import 'package:fireapp/presentation/fireapp_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mutex/mutex.dart';

@injectable
class ChangeRolesViewModel extends FireAppViewModel {

  final ReferenceDataRepository _referenceDataRepository;
  late String _volunteerId;
  late List<String> _roles;

  final BehaviorSubject<RequestState<List<UserRole>>> _userRoles
    = BehaviorSubject.seeded(RequestState.initial());
  Stream<RequestState<List<UserRole>>> get userRoles => _userRoles;

  final BehaviorSubject<RequestState<void>> _submissionState
    = BehaviorSubject.seeded(RequestState.success(null));
  Stream<RequestState<void>> get submissionState => _submissionState.stream;

  final _changeMutex = Mutex();

  ChangeRolesViewModel(this._referenceDataRepository);

  void load() {
    _userRoles.add(RequestState.loading());
    () async {
      try {
        final options = await _referenceDataRepository.getRoles();

        final userRoles = options.map((o) =>
            UserRole(
                role: o,
                checked: _roles.has((p0) => p0 == o.id)
            )
        ).toList();

      } catch (e) {
        logger.e(e);
        _userRoles.add(RequestState.exception(e));
      }
    }();
  }

  void init(String volunteerId, List<String> roles){
    _volunteerId = volunteerId;
    _roles = roles;
    load();
  }

  void updateRole(UserRole role) async {
    await _changeMutex.protect(() async {
      final state = _userRoles.value;
      if (state is! SuccessRequestState) return;

      final roles = (state as SuccessRequestState<List<UserRole>>).result;
      final index = roles.indexOf(role);
      roles[index] = role.copyWith(checked: !role.checked);
      _userRoles.add(RequestState.success(roles));
    });
  }

  void submit() {
    final state = _userRoles.value;
    if (state is! SuccessRequestState) return;

    final roles = (state as SuccessRequestState<List<UserRole>>).result;
    final checkedRoles = roles.where((r) => r.checked).map((r) => r.role.id).toList();
    _referenceDataRepository.updateRoles(_volunteerId, checkedRoles);
  }

  @override
  Future<void> dispose() async {
    _userRoles.close();
  }
}
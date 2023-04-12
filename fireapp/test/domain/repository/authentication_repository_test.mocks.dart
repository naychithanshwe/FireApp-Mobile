// Mocks generated by Mockito 5.3.2 from annotations
// in fireapp/test/domain/repository/authentication_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:fireapp/data/client/api/rest_client.dart' as _i2;
import 'package:fireapp/data/client/authentication_client.dart' as _i4;
import 'package:fireapp/data/persistence/authentication_persistence.dart'
    as _i6;
import 'package:fireapp/domain/models/token_response.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRestClient_0 extends _i1.SmartFake implements _i2.RestClient {
  _FakeRestClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTokenResponse_1 extends _i1.SmartFake implements _i3.TokenResponse {
  _FakeTokenResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticationClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationClient extends _i1.Mock
    implements _i4.AuthenticationClient {
  @override
  _i2.RestClient get restClient => (super.noSuchMethod(
        Invocation.getter(#restClient),
        returnValue: _FakeRestClient_0(
          this,
          Invocation.getter(#restClient),
        ),
        returnValueForMissingStub: _FakeRestClient_0(
          this,
          Invocation.getter(#restClient),
        ),
      ) as _i2.RestClient);
  @override
  _i5.Future<_i3.TokenResponse> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i5.Future<_i3.TokenResponse>.value(_FakeTokenResponse_1(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.TokenResponse>.value(_FakeTokenResponse_1(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i5.Future<_i3.TokenResponse>);
}

/// A class which mocks [AuthenticationPersistence].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationPersistence extends _i1.Mock
    implements _i6.AuthenticationPersistence {
  @override
  _i5.Future<void> set(_i3.TokenResponse? auth) => (super.noSuchMethod(
        Invocation.method(
          #set,
          [auth],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i3.TokenResponse?> get() => (super.noSuchMethod(
        Invocation.method(
          #get,
          [],
        ),
        returnValue: _i5.Future<_i3.TokenResponse?>.value(),
        returnValueForMissingStub: _i5.Future<_i3.TokenResponse?>.value(),
      ) as _i5.Future<_i3.TokenResponse?>);
}

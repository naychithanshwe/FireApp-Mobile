import 'package:fireapp/global/access.dart';
import 'package:fireapp/pages/settings/reset_pw_simple.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatelessWidget {
  final String email;
  SettingPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SettingBox(
          email: email,
        )),
      ],
    );
  }
}

class SettingBox extends StatefulWidget {
  final String email;
  SettingBox({Key? key, required this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Settings'), automaticallyImplyLeading: false),
      body: SettingsList(sections: [
        SettingsSection(
          title: Text('Account Details'),
          // titleTextStyle: TextStyle(fontSize: 30),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
                leading: const Icon(Icons.password),
                title: const Text('Reset Password'),
                onPressed: (_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResetSimplePage(email: widget.email)),
                  );
                }),
            SettingsTile.navigation(
                leading: Icon(Icons.account_circle),
                title: Text('Update Account Details'),
                onPressed: (_) {
                  // TODO: jump to Update Account Details
                }),
            SettingsTile.navigation(
                leading: Icon(Icons.logout),
                title: Text('log Out'),
                onPressed: (_) {
                  userId = 0;
                  Navigator.pop(
                    context,
                  );
                }),
          ],
        ),
        SettingsSection(
          title: const Text('User Information'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
                leading: Icon(Icons.local_dining),
                title: Text('Dietary Requirements'),
                onPressed: (_) {
                  // TODO: jump to Dietary Requirements
                }),
            SettingsTile.navigation(
                leading: Icon(Icons.health_and_safety),
                title: Text('Medical Details'),
                onPressed: (_) {
                  // TODO: Medical Details
                }),
          ],
        ),
        SettingsSection(
          title: Text('Support'),
          // titleTextStyle: TextStyle(fontSize: 30),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
                leading: Icon(Icons.quiz),
                title: Text('FAQ'),
                onPressed: (_) {
                  // TODO: Contact Supervisor / Support
                }),
            SettingsTile.navigation(
                leading: Icon(Icons.contact_support),
                title: Text('Contact Supervisor / Support'),
                onPressed: (_) {
                  // TODO: Contact Supervisor / Support
                }),
          ],
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import 'settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsSceenState();
}

class _SettingsSceenState extends State<SettingsScreen> {
  var adventure = false;
  var botts = false;
  var bigSmile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('ART'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    if (value == true) {
                      bigSmile = false;
                      botts = false;
                      adventure = true;
                      context.read<Settings>().sellectedImage = "adventurer";
                    } else {
                      adventure = false;
                    }
                  });
                },
                initialValue: adventure,
                leading: Icon(Icons.format_paint),
                title: Text('adventurer'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    if (value == true) {
                      bigSmile = true;
                      botts = false;
                      adventure = false;
                      context.read<Settings>().sellectedImage = "big-smile";
                    } else {
                      bigSmile = false;
                    }
                  });
                },
                initialValue: bigSmile,
                leading: Icon(Icons.format_paint),
                title: Text('big-smile'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    if (value == true) {
                      bigSmile = false;
                      adventure = false;
                      botts = true;
                      context.read<Settings>().sellectedImage = "bottts";
                    } else {
                      botts = false;
                    }
                  });
                },
                initialValue: botts,
                leading: Icon(Icons.format_paint),
                title: Text('botts'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('BlackList'),
            tiles: <SettingsTile>[
              //nsfw,religious,political,racist,sexist,explicit
              SettingsTile.switchTile(
                onToggle: (value) {
                  if (value == true) {
                    context.read<Settings>().addToArr("nsfw");
                  } else {
                    context.read<Settings>().remoweFromArr("nsfw");
                  }
                },
                initialValue: true,
                leading: Icon(Icons.settings_accessibility),
                title: Text('nsfw'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    if (value == true) {
                      context.read<Settings>().addToArr("religious");
                    } else {
                      context.read<Settings>().remoweFromArr("religious");
                    }
                  });
                },
                initialValue: true,
                leading: Icon(Icons.settings_accessibility),
                title: Text('religious'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    if (value == true) {
                      context.read<Settings>().addToArr("political");
                    } else {
                      context.read<Settings>().remoweFromArr("political");
                    }
                  });
                },
                initialValue: true,
                leading: Icon(Icons.settings_accessibility),
                title: Text('political'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    if (value == true) {
                      context.read<Settings>().addToArr("racist");
                    } else {
                      context.read<Settings>().remoweFromArr("racist");
                    }
                  });
                },
                initialValue: true,
                leading: Icon(Icons.settings_accessibility),
                title: Text('racist'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    if (value == true) {
                      context.read<Settings>().addToArr("sexist");
                    } else {
                      context.read<Settings>().remoweFromArr("sexist");
                    }
                  });
                },
                initialValue: true,
                leading: Icon(Icons.settings_accessibility),
                title: Text('sexist'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() {
                    if (value == true) {
                      context.read<Settings>().addToArr("explicit");
                    } else {
                      context.read<Settings>().remoweFromArr("explicit");
                    }
                  });
                },
                initialValue: true,
                leading: Icon(Icons.settings_accessibility),
                title: Text('explicit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

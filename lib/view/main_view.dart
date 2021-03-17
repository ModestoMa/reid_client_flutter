import 'package:flutter/material.dart';
import 'package:reid_client_flutter/view/operation.dart';
import 'package:reid_client_flutter/view/settings.dart';

class ReIDMainView extends StatefulWidget {
  @override
  _ReIDMainViewState createState() => _ReIDMainViewState();
}

class _ReIDMainViewState extends State<ReIDMainView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.format_shapes),
              label: Text('Operation')
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings')
            )
          ],
          leading: Icon(Icons.people),
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              OperationView(),
              SettingsView()
            ],
          ),
        )
      ],
    );
  }
}

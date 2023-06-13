// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[800],
            ),
            child: Center(
              child: Text(
                'MovieBox',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Action Movies'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/action');
            },
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Nollywood Movies'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/nollywood');
            },
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Music Videos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/music');
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/privacy');
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
          ),
        ],
      ),
    );
  }
}

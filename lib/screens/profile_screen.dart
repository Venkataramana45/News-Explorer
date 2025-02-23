import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th?id=OIP.tJYl02NAHsRL3fzirIrpKwHaFe&w=290&h=215&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')),
                SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TheAlphamerc',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Loyal Reader',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '826\nFollowers',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  '251\nFollowing',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  '81K\nNews Read',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 35),
            Divider(),
            SizedBox(height: 35),
            SwitchListTile(
              title: Row(
                children: [
                  Icon(Icons.lightbulb_outline_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Night")
                ],
              ),
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(),
            ),
            SwitchListTile(
                title: Row(
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Notification")
                  ],
                ),
                value: true,
                onChanged: (value) {}),
            SwitchListTile(
                title: Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Social Media")
                  ],
                ),
                value: true,
                onChanged: (value) {}),
            SizedBox(height: 20),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.login_rounded,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

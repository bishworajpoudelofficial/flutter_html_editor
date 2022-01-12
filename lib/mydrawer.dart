import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import 'aboutus_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFFF16528),),
            child: Center(
                child: Text(
              'Thulo Html Editor',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
          ListTile(
            title: Text(
              'Share With Friends',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            leading: Icon(
              Icons.share,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              Share.share("Download Thulo Html Editor and Start Learning Html From Mobile. https://play.google.com/store/apps/details?id=htmleditorapp.thulotechnology.com", subject: "App Share");
            },
          ),
          ListTile(
            title: Text(
              'Send Feedback',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            leading: Icon(
              Icons.feedback,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              launch(
                  "mailto:thulotechnology@gmail.com?subject=Thulo Html Editor App Feedback&body=Write Message Here");
            },
          ),
          ListTile(
            title: Text(
              'Rate Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            leading: Icon(
              Icons.rate_review,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              // Navigator.pushNamed(context, RateUsScreen.routeName);
              launch("https://play.google.com/store/apps/details?id=htmleditorapp.thulotechnology.com");
            },
          ),
          ListTile(
            title: Text(
              'About App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            leading: Icon(
              Icons.info_rounded,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, AboutUsScreen.routeName);
            },
          ),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            leading: Icon(
              Icons.privacy_tip,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              launch(
                  "http://thulotechnology.com/privacy-policy");
            },
          ),
        ],
      ),
    );
  }
}

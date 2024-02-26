import 'package:flutter/material.dart';
import 'package:insta_clone/screens/add_post_screen.dart';
import 'package:insta_clone/screens/feed_screen.dart';

List<Widget> homeScreenItems = [
  FeedScreen(),
  Center(child: Text('Search Page')),
  AddPostScreen(),
  Center(child: Text('Notification Page')),
  Center(child: Text('Profile Page')),
];

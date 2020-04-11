import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/Widgets/DestinationCarousel.dart';
import 'package:travelapp/Widgets/HotelCarousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _Icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.hiking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xffE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(_Icons[index],
            size: 25,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Color(0xFF84C1C4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 30),
              child: Text(
                "What would you like to find?",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _Icons.asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            DestinationCarousel(),
            SizedBox(height: 20),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab=value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza, size: 30),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('https://previews.123rf.com/images/studiostoks/studiostoks1510/studiostoks151000080/46965610-gentleman-businessman-looks-back-pop-art-retro-style-a-man-in-profile.jpg'),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

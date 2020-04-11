import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/Models/activity_model.dart';
import 'package:travelapp/Models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating){
    String stars='';
    for(int i=0;i<rating;i++){
      stars+='⭐';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black26,
                  offset: Offset(0.0,2.0),
                  blurRadius: 6,
                  )
                  ]
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(widget.destination.imageUrl),
                    fit: BoxFit.cover,
                  ),
              ),
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon:Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: ()=>Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon:Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: ()=>Navigator.pop(context),
                        ),
                        IconButton(
                          icon:Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 25.0,
                          color: Colors.black,
                          onPressed: ()=>Navigator.pop(context),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 10,
                            color: Colors.white
                        ),
                        SizedBox(width:5),
                        Text(widget.destination.country,
                          style: TextStyle(
                              color:Colors.white70,
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.location_on,
                  color:Colors.white70,
                  size: 25,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top:15,bottom: 15),
                itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context,int index){
                  Activity activity =  widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40,5,20,5),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100,20,20,20),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:120,
                                  child: Text(activity.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  overflow: TextOverflow.ellipsis,),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('\$${activity.price}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                    Text('per pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                            Text(activity.type,
                            style: TextStyle(
                              color: Colors.grey
                            ),),
                            _buildRatingStars(activity.rating),
                           SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width:70,
                                    decoration:BoxDecoration(
                                      color:Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[0]),
                                ),
SizedBox(width: 10,),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width:70,
                                  decoration:BoxDecoration(
                                    color:Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[1]),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left:20,
                      top:15,
                      bottom:15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          width: 110,
                          image: AssetImage(
                            activity.imageUrl,
                          ),
                          fit:BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      )
    );
  }
}

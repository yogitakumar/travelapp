import 'package:flutter/material.dart';
import 'package:travelapp/Models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Exclusive Hotels",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("See All");
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          //color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                margin: EdgeInsets.all(10),
                width: 240.0,
                //color:Colors.red,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom:15,
                      child: Container(
                        height: 120,
                        width: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: <Widget>[
                              Text(hotel.name,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text(hotel.address,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text('\$${hotel.price}/night',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0,2.0),
                              blurRadius: 6,
                            )
                          ]
                      ),
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(20),
                        child: Image(
                          height: 180,
                          width: 220,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

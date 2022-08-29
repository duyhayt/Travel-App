
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:get/get.dart';
import 'package:travel_app/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Top Destinations',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5
                      ),),
                      GestureDetector(
                        onTap: (){
                          return print('See All');
                        },
                        child: Text('See All', 
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0
                        ),),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300.0,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinations.length,
                    itemBuilder: (BuildContext context, int index){
                      Destination destination = destinations[index];
                       return GestureDetector(
                        onTap: () {
                          Get.to(DestinationScreen(destination));
                      
                        },
                         child: Container(
                          margin: EdgeInsets.all(10),
                          width: 210,
                             
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 15.0,
                                child: Container(
                                  height: 120,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('${destination.activities.length} activities',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),),
                                        Text(destination.description,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0,2),blurRadius: 6.0)]
                       
                                ),
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag: destination.imageUrl,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          height: 180,
                                          width: 180,
                                          image: AssetImage(destination.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      bottom: 10,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(destination.city,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.locationArrow,
                                                size: 10,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5,),
                                              Text(destination.country,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                         ),
                       );
                    }
                  ),
                ),
              ],
            );
  }
}
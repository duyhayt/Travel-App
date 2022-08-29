import 'package:flutter/material.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/screens/home_screen.dart';


class DestinationScreen extends StatefulWidget {
    final Destination destination;

    DestinationScreen(this.destination);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {


  Text _buildRatingStarts(int rating){
    String stars = '';
    for (int i=0; i< rating;i++){
      stars += '⭐';
    }
    stars.trim();
    return Text(stars);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow
                      (color: Colors.black26, offset: Offset(0.0,2.0), blurRadius: 6.0),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30) ,
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: (){
                        // Navigator.pop(context);
                        Get.back();
                        Get.snackbar('Message', 'Go back HomePage',
                        duration: Duration(seconds: 2),
                        icon: Icon(Icons.alarm),);
                      }, 
                      ),
                      Row(
                      children: [
                      IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: (){
                        // Navigator.pop(context);
                      Get.back();
                      }, 
                      ),
                      IconButton(
                      icon: Icon(FontAwesomeIcons.sortAmountDown),
                      iconSize: 25.0,
                      color: Colors.black,
                      onPressed: (){
                        // Navigator.pop(context);
                        Get.back();
                      }, 
                      ),
                      ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  
                  child: Column(
             
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(widget.destination.city,
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
                                                  size: 15,
                                                  color: Colors.white70,
                                                ),
                                                SizedBox(width: 5,),
                                                Text(widget.destination.country,
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 20,
                                                ),),
                                              ],
                                            ),
                                          ],
                                        ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Icon(Icons.location_on,
                  color: Colors.white70,
                  size: 25,),
                ),
              ],
            ),
            Expanded(

              child: ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index){
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100,20,20,20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 120,
                                    child: Text(activity.name,
                                    style: TextStyle(
                                      fontSize: 18.0, fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text('\$${activity.price}',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      ),
                                      Text('per pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(activity.type,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              ),
                              _buildRatingStarts(activity.rating),                              SizedBox(
                                height: 10,   
                              ),
                              Row(
                                children: [
                                  
                                  Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(activity.startTimes[0],
                                    
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(activity.startTimes[1],
                                    
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            width: 110,
                            image: AssetImage(
                              activity.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ],
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}
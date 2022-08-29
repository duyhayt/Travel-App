// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Exclusive Hotels',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5
                      ),),
                      GestureDetector(
                        onTap: (){
                          // ignore: avoid_print
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 300.0,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotels.length,
                    itemBuilder: (BuildContext context, int index){
                      Hotel hotel = hotels[index];
                       return Container(
                        margin: EdgeInsets.all(10),
                        width: 240,
      
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              bottom: 15.0,
                              child: Container(
                                height: 120,
                                width: 240,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                    
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(hotel.name,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(hotel.address,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text('\$${hotel.price} / night',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
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
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0,2),blurRadius: 6.0)]

                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 180,
                                  width: 200,
                                  image: AssetImage(hotel.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                       );
                    }
                  ),
                ),
              ],
            );
  }
}
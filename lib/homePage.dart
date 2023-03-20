// ignore_for_file: prefer_const_constructors, unnecessary_import, must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Havadurumu/getLocation.dart';
import 'package:Havadurumu/weatherData.dart';


class MyHomePage extends StatelessWidget {
    MyHomePage({ Key? key}) :super(key: key);
  var client = WeatherData();
  var data;

  info() async {
      var position = await GetPosition();
      data = await client.getData(position.latitude, position.longitude);
      return data;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(future: info(),builder: ((context, snapshot) {
          return 
          Container(
          child: Column(
            children: [
              Container(
                //color: Colors.red,
                height: size.height * 0.75,
                width: size.width,
                margin: EdgeInsets.only(right: 5, left: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 136, 135, 139),
                      Color.fromARGB(255, 71, 100, 126),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2, 0.75], 
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 65,
                    ),
                    Text(
                      '${data?.cityName}',
                    style: TextStyle(color: Colors.white, fontSize: 30,
                    fontWeight: FontWeight.w400,
                    ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Pazar, 18 Aralık 2022',
                      style: TextStyle(
                        color: Colors.white, fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    // Image.asset('assets/img/sun.png',
                    // width: size.width * 0.3,
                    // ),
                    Image.network(
                      'https:${data?.icon}',
                    width: size.width * 0.5,
                    fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${data?.condition}',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      '${data?.temp}°',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                       children: [
                      Expanded(
                        child: Column(children: [
                        Image.asset('assets/img/wind.png',
                        width: size.width * 0.10,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Rüzgar Hızı',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '${data?.wind} km/h',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hubballi',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      ),
                      ),
                    Expanded(
                        child: Column(children: [
                        Image.asset('assets/img/clouds.png',
                        width: size.width * 0.10,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Nem',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '${data?.humidity}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hubballi',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      ),
                      ),
                    Expanded(
                        child: Column(children: [
                        Image.asset('assets/img/wind-direction.png',
                        width: size.width * 0.10,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Rüzgar Yönü',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Kuzey (N)',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Hubballi',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      ),
                      ),
                    ],

                    )
                  ],
                ),
              ),
            SizedBox(
              height: 30,
            ),
            Row(children: [
              Expanded(child: Column(
                children: [
                  Text(
                    'Gust',
                    style: TextStyle(color: Colors.white.withOpacity(0.5),
                     fontFamily: 'MavenPro',
                      fontSize: 11 ),
                  ),

                  SizedBox(
                    height: 7,
                  ),

                    Text(
                    '32.0 kp/h',
                    style: TextStyle(
                      color: Colors.white,
                     fontFamily: 'Hubballi',
                      fontSize: 14 ),
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Basınç',
                    style: TextStyle(color: Colors.white.withOpacity(0.5),
                     fontFamily: 'MavenPro',
                      fontSize: 11 ),
                  ),

                  SizedBox(
                    height: 7,
                  ),

                    Text(
                    '1025.0 hpa',
                    style: TextStyle(
                      color: Colors.white,
                     fontFamily: 'Hubballi',
                      fontSize: 14 ),
                  ),

                ],
              ),
              ),
              Expanded(child: Column(
                children: [
                  Text(
                    'UV Endeksi',
                    style: TextStyle(color: Colors.white.withOpacity(0.5),
                     fontFamily: 'MavenPro',
                      fontSize: 11 ),
                  ),

                  SizedBox(
                    height: 7,
                  ),

                    Text(
                    '1.0',
                    style: TextStyle(
                      color: Colors.white,
                     fontFamily: 'Hubballi',
                      fontSize: 14 ),
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Yağış',
                    style: TextStyle(color: Colors.white.withOpacity(0.5),
                     fontFamily: 'MavenPro',
                      fontSize: 11 ),
                  ),

                  SizedBox(
                    height: 7,
                  ),

                    Text(
                    '1.0 mm',
                    style: TextStyle(
                      color: Colors.white,
                     fontFamily: 'Hubballi',
                      fontSize: 14 ),
                  ),

                ],
              ),
              ),
              Expanded(child: Column(
                children: [
                  Text(
                    'Rüzgar Hızı',
                    style: TextStyle(color: Colors.white.withOpacity(0.5),
                     fontFamily: 'MavenPro',
                      fontSize: 11 ),
                  ),

                  SizedBox(
                    height: 7,
                  ),

                    Text(
                    '19.1.0 km/h',
                    style: TextStyle(
                      color: Colors.white,
                     fontFamily: 'Hubballi',
                      fontSize: 14 ),
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Son Güncelleme',
                    style: TextStyle(color: Colors.white.withOpacity(0.5),
                     fontFamily: 'MavenPro',
                      fontSize: 11 ),
                  ),

                  SizedBox(
                    height: 7,
                  ),

                    Text(
                    '2023-03-20  03:09',
                    style: TextStyle(
                      color: Colors.green,
                     fontFamily: 'Hubballi',
                      fontSize: 14 ),
                  ),
                ],
              ),
              ),
              ],
            )
            ],
          ),
      );
      }),)
    );
  }
}

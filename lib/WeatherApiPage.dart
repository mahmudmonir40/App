

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;


class WeatherApiPage extends StatefulWidget {
  const WeatherApiPage({Key? key}) : super(key: key);

  @override
  _WeatherApiPageState createState() => _WeatherApiPageState();
}

class _WeatherApiPageState extends State<WeatherApiPage> {

  Future getData() async{
    final sunrise_sunsetapi = await http.get(Uri.parse('https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400'));

    var dekoData = jsonDecode(sunrise_sunsetapi.body);

    setState(() {

      this.sunrise = dekoData['results']['sunrise'];
      this.sunset = dekoData['results']['sunset'];

    });


  }



var cityname,maintemp,status,min,max,clouds,pressure,humidity,windspeed,sunrise,sunset;




  Future getjsonData() async{

  final response = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=cox%27s%20bazar&units=metric&appid=f9298572a59ecc42ca0bc87546eea3dd'));


  var showDatata = jsonDecode(response.body);

setState(() {

this.cityname = showDatata['name'];
this.maintemp = showDatata['main']['temp'];
this.status = showDatata['weather'][0]['description'];
this.min = showDatata['main']['temp_min'];
this.max = showDatata['main']['temp_max'];
this.clouds = showDatata['clouds'];
this.pressure = showDatata['main']['pressure'];
this.humidity = showDatata['main']['humidity'];
this.windspeed = showDatata['wind']['speed'];



});



  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getjsonData();
    this.getData();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Weather",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w100,color: Colors.green[100],fontFamily: 'azonix'),),
        actions: [
          Icon(Icons.search,size: 25,)
        ],
      ),
      body: Column(
        
        children: [
         Card(
           color: Colors.black,

           elevation: 0,
           child: Container(


             height: MediaQuery.of(context).size.height/3,
             width: MediaQuery.of(context).size.width,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(cityname != null ? cityname.toString():"Dhaka",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w100,color: Colors.green[100]),),
                SizedBox(
                  height: 10,
                ),
                 Text(maintemp != null ? maintemp.toString() + "\u00B0 C":"19°",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w100,color: Colors.green[100]),),

ListTile(trailing: Text(status != null ? status.toString():"It's Rainny",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.green[100],fontFamily: "azonix"),),)

               ],
             ),
           ),
         ),








          SizedBox(
            height: 300,
          ),





          Expanded(child: Column(
            children: [
              Container(height: 100,


                color: Colors.green[100],
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(


                    children: [
                      Container(
                        color: Colors.black12,
                        child: Column(
                          children: [

                            FaIcon(FontAwesomeIcons.temperatureHigh,color: Colors.black,),
                            Text("Min Temparature",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "azonix"),),
                            Text(min != null ? min.toString() + "\u00B0 C":"29°",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        color: Colors.black12,
                        child: Column(
                          children: [

                            FaIcon(FontAwesomeIcons.temperatureLow,color: Colors.black,),
                            Text("Max Temparature",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "azonix"),),
                            Text(max != null ? max.toString() + "\u00B0 C":"28°",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),


                      Container(
                        color: Colors.black12,
                        child: Column(
                          children: [

                            FaIcon(FontAwesomeIcons.cloud,color: Colors.black,),
                            Text("Clouds",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "azonix"),),
                            Text(clouds != null ? clouds.toString():"1012 Pa",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        color: Colors.black12,
                        child: Column(
                          children: [

                            FaIcon(FontAwesomeIcons.wpressr,color: Colors.black,),
                            Text("Pressure",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "azonix"),),
                            Text(pressure != null ? pressure.toString() + "mBar":"1012 Pa",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),


                      Container(
                        color: Colors.black12,
                        child: Column(
                          children: [

                            FaIcon(FontAwesomeIcons.accessibleIcon,color: Colors.black,),
                            Text("Humidity",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "azonix"),),
                            Text(humidity != null ? humidity.toString():"57",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),


                      Container(

                        color: Colors.black12,
                        child: Column(
                          children: [

                            FaIcon(FontAwesomeIcons.wind,color: Colors.black,),
                            Text("Wind Spped",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "azonix"),),
                            Text(windspeed != null ? windspeed.toString() + "km/h":"32km/h",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),


                      Container(
                        color: Colors.black12,
                        child: Column(
                          children: [

                            FaIcon(FontAwesomeIcons.cloudSunRain,color: Colors.black,),
                            Text("Sunrise",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "azonix"),),
                            Text(sunrise != null ? sunrise.toString():"6:12 AM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),


                      Container(
                        color: Colors.black12,
                        child: Column(
                          children: [

                            FaIcon(FontAwesomeIcons.cloudSun,color: Colors.black,),
                            Text("Sunset",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "azonix"),),
                            Text(sunset != null ? sunset.toString():"5:15 PM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              )
            ],
          ))

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // <-- import url_launcher

void main() {
  runApp(
    const MyWidget(),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  // Define a function to launch URL
  void _launchURL(String _url) async {
    if (await canLaunchUrl(Uri.parse(_url))) {
      await launchUrl(Uri.parse(_url));
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(
            255, 249, 249, 249), // put your desired color here
        appBar: AppBar(
          title: const Text('Personal Card'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 80, // you can change this value as you need
                      backgroundImage: AssetImage('images/image-one.jpg'),
                    ),
                    const SizedBox(
                      height:
                          10.0, // provide the desired distance between the image and text
                    ),
                    Text(
                      'Rashed Qazizada',
                      style: GoogleFonts.pacifico(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 15.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Student at Linneasu University',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  letterSpacing: 2.5,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                _launchURL('mailto:rq222ah@student.lnu.se'),
                            child: const InfoCard(
                              text: 'rq222ah@student.lnu.se',
                              icon: FontAwesomeIcons.envelope,
                            ),
                          ),
                          const InfoCard(
                            text: '+46 76 75 497',
                            icon: FontAwesomeIcons.phone,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: InkWell(
                              onTap: () => _launchURL(
                                  'https://github.com/rqkohistani/1dv535'),
                              child: const InfoCard(
                                text: 'github.com/rqkohistani',
                                icon: FontAwesomeIcons.github,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.lightBlue[50],
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Assignment 1',
                    style: GoogleFonts.pacifico(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const InfoCard({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey[600], // change the color here
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.teal.shade900,
          fontSize: 15.0,
        ),
      ),
    );
  }
}

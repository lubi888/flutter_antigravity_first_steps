import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    const String goSyncHeading = 'Golang Install on Windows Apple Linux';
    const String goHelloCode =
        ('package main\n\n'
        'import "fmt"\n\n'
        'func main() {\n'
        '\t\t\t\tfmt.Printf("hello golang\\n")\n'
        '\t\t\t\tfmt.Println("hello golang on windows, apple, linux.")\n'
        '}');

    const String goPowerShell =
        ('Windows PowerShell\n\n'
        'Copyright (C) Microsoft Corporation. All rights reserved.\n\n'
        'Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows\n\n'
        'PS C:\\Users\\adam>go env\n\n'
        'PS C:\\Users\\adam>');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Page 2 Content to be added to '),
          const Padding(padding: EdgeInsets.all(8.0)),
          //4rd header bar 'install golang'. terminal green with black background
          Container(
            padding: const EdgeInsets.all(15.0),
            // width: 300.0,
            // height: 84.0,
            decoration: BoxDecoration(
              border: Border.all(
                // style: BorderStyle.none  ,
                width: 10.0,
                color: Colors.green,
              ),
              shape: BoxShape.rectangle,
              // color: Colors.red.shade500,
              color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            ),
            child: const Text(
              // ethInstallGolandHeading,
              // "Golang Install on Windows Apple Linux",
              goSyncHeading,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: TextStyle(
                // color: Colors.blue[900],
                color: Colors.green,
                // backgroundColor: Color.fromARGB(255, 207, 160, 17),
                backgroundColor: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 10.0, color: Colors.green),
              shape: BoxShape.rectangle,
              color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: const SelectableText(
              goHelloCode,
              textAlign: TextAlign.left,
              showCursor: true,
              autofocus: true,
              cursorColor: Colors.green,
              enableInteractiveSelection: true,
              style: TextStyle(
                color: Colors.green,
                backgroundColor: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 10.0, color: Colors.white),
              shape: BoxShape.rectangle,
              color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Linkify(
              onOpen: (link) async {
                if (!await launchUrl(Uri.parse(link.url))) {
                  throw Exception('Could not launch ${link.url}');
                }
              },
              text: goPowerShell,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

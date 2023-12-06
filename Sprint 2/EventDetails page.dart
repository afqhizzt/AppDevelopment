import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Status',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.black, // Set the background color
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white), // Set the text color
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Event Status'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Approved Events'),
              Tab(text: 'Non Approved Events'),
              Tab(text: 'Past Events'),
            ],
            indicatorColor: Colors.black, // Set the indicator color
          ),
        ),
        body: TabBarView(
          children: [
            CategoryPage(
              images: [
                'https://suara.tv/wp-content/uploads/2023/04/WhatsApp-Image-2023-04-04-at-4.16.58-PM.jpeg',
                'https://www.dyeworks.net/images/npca_birdpark_full.png',
                // Add more images as needed for Approved Events
              ],
              descriptions: [
                Description(
                  director: 'Nurul Anisha',
                  eventApprover: 'Encik Saiful',
                  date: 'December 25, 2023',
                ),
                Description(
                  director: 'Lee Chong Wei',
                  eventApprover: 'Encik Nizam',
                  date: 'December 25, 2023',
                ),
                // Add more descriptions as needed for Approved Events
              ],
            ),
            CategoryPage(
              images: [
                'https://inspirasimediaonline.files.wordpress.com/2023/07/hausboom-music-2023_poster.png?w=768',
                'https://www.dyeworks.net/images/npca_birdpark_full.png',
                // Add more images as needed for Non Approved Events
              ],
              descriptions: [
                Description(
                  director: 'Hanis Hidayu',
                  eventApprover: 'Encik Saiful',
                  date: 'September 9&10, 2023',
                ),
                Description(
                  director: 'Lee Chong Wei',
                  eventApprover: 'Encik Nizam',
                  date: 'December 25, 2023',
                ),
                // Add more descriptions as needed for Non Approved Events
              ],
            ),
            CategoryPage(
              images: [
                'https://www.dyeworks.net/images/npca_birdpark_full.png',
                'https://www.dyeworks.net/images/npca_birdpark_full.png',
                // Add more images as needed for Past Events
              ],
              descriptions: [
                Description(
                   director: 'Lee Chong Wei',
                  eventApprover: 'Encik Nizam',
                  date: 'December 25, 2022',
                ),
                Description(
                   director: 'Praveen',
                  eventApprover: 'Encik Nizam',
                  date: 'Mei 10, 2023',
                ),
                // Add more descriptions as needed for Past Events
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final List<String> images;
  final List<Description> descriptions;

  CategoryPage({
    required this.images,
    required this.descriptions,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return ListView(
          children: [
            ImageSection(imageURL: images[index]),
            DescriptionSection(description: descriptions[index]),
          ],
        );
      },
    );
  }
}


class ImageSection extends StatelessWidget {
  final String imageURL;

  ImageSection({required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, // Adjust the height as needed
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 5.0,
        ),
        borderRadius: BorderRadius.circular(15.0), // Make borders round
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0), // Adjust the clip radius
        child: Image.network(
          imageURL,
          fit: BoxFit.cover, // Adjust the fit to cover the entire box
        ),
      ),
    );
  }
}


class DescriptionSection extends StatelessWidget {
  final Description description;

  DescriptionSection({required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Director of the Event: ${description.director}',
            style: TextStyle(fontSize: 20.0), // Adjust the font size here
          ),
          Text(
            'Event Approved By: ${description.eventApprover}',
            style: TextStyle(fontSize: 20.0), // Adjust the font size here
          ),
          Text(
            'Date of Event: ${description.date}',
            style: TextStyle(fontSize: 20.0), // Adjust the font size here
          ),
          // Add more description content as needed
        ],
      ),
    );
  }
}


class Description {
  final String director;
  final String eventApprover;
  final String date;

  Description({
    required this.director,
    required this.eventApprover,
    required this.date,
  });
}

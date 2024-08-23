import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  DetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(product.image),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  product.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\$${product.price}',
                  style: TextStyle(fontSize: 20.0, color: Colors.green),
                ),
              ),
              ListTile(
                title: Text(
                  'Category',
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Text(
                  product.category,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(height: 20),
              Text(
                product.description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              ListTile(
                title: Text(
                  'Rating: ${product.rating}/5 of ${product.ratingCount} ',
                ),
                
                subtitle: RatingBar.builder(
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (value) => print(value),
                  minRating: 0,
                  itemCount: 5,
                  allowHalfRating: true,
                  direction: Axis.horizontal,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  initialRating: product.rating,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category;
  final String description;
  final double rating;
  final int ratingCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
    required this.rating,
    required this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      category: json['category'],
      description: json['description'],
      rating: json['rating']['rate'].toDouble(),
      ratingCount: json['rating']['count'],
    );
  }
}
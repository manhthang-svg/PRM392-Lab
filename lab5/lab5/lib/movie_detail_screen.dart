import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Split genres string into a list
    final List<String> genreList = movie['genres'].toString().split(', ');

    // Get trailers list from the movie object, or an empty list if null
    final List<Map<String, String>> trailers = 
        (movie['trailers'] as List<dynamic>?)?.map((e) => Map<String, String>.from(e as Map)).toList() ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          movie['title'],
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero banner with gradient
            Stack(
              children: [
                Image.network(
                  movie['imageUrl'],
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 220,
                      color: Colors.grey,
                      child: const Icon(Icons.movie, size: 50, color: Colors.white),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    movie['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and genres displayed as chips
                  Wrap(
                    spacing: 8,
                    children: genreList.map((genre) {
                      return Chip(
                        label: Text(
                          genre,
                          style: const TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.black12),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Overview text
                  Text(
                    movie['overview'] ?? 'No overview available.',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Action buttons (Favorite / Rate / Share)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(Icons.favorite, 'Favorite'),
                      _buildActionButton(Icons.star, 'Rate'),
                      _buildActionButton(Icons.share, 'Share'),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // List of trailers
                  const Text(
                    'Trailers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  ...trailers.map((trailer) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.play_circle_fill, color: Colors.black54),
                          title: Text(
                            trailer['title'] ?? '',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        const Divider(height: 1, color: Colors.black12),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black54),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}

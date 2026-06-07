import 'package:flutter/material.dart';
import 'movie_detail_screen.dart';
class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả lập để hiển thị danh sách
    final List<Map<String, dynamic>> movies = [
      {
        'title': 'Dune: Part Two',
        'rating': '8.6',
        'genres': 'Sci-Fi, Adventure, Drama',
        'imageUrl':
            'https://picsum.photos/200/130?random=1', // Thay bằng link ảnh thật của bạn
        'overview': 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
        'trailers': [
          {'title': 'Official Trailer #1'},
          {'title': 'IMAX Sneak Peek'},
        ],
      },
      {
        'title': 'Deadpool & Wolverine',
        'rating': '8.3',
        'genres': 'Action, Comedy',
        'imageUrl':
            'https://picsum.photos/200/130?random=2', // Thay bằng link ảnh thật của bạn
        'overview': 'The multiverse gets messy when Wade Wilson teams up with Wolverine for a not-so-family-friendly mission.',
        'trailers': [
          {'title': 'Red Band Trailer'},
          {'title': 'Behind the Scenes'},
        ],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(
        0xFFF9F8FD,
      ), // Màu nền hơi tím nhạt giống trong ảnh
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề "Movies"
              const Text(
                'Movies',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 20),

              // Danh sách phim
              Expanded(
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(movie: movie),
                          ),
                        );
                      },
                      child: _buildMovieCard(movie),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget đại diện cho từng item phim
  Widget _buildMovieCard(Map<String, dynamic> movie) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EFF7), // Màu nền của card (tím rất nhạt)
        borderRadius: BorderRadius.circular(16), // Bo góc card
      ),
      child: Row(
        children: [
          // 1. Hình ảnh bên trái (Bo góc)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              movie['imageUrl'],
              width: 90,
              height: 60,
              fit: BoxFit.cover,
              // Xử lý khi ảnh lỗi hoặc đang tải (tùy chọn)
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 90,
                  height: 60,
                  color: Colors.grey,
                  child: const Icon(Icons.movie, color: Colors.white),
                );
              },
            ),
          ),
          const SizedBox(width: 16),

          // 2. Thông tin chữ ở giữa
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tên phim
                Text(
                  movie['title'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),

                // Điểm số và Thể loại
                Row(
                  children: [
                    const Icon(
                      Icons
                          .star_border, // Dùng star_border giống icon ngôi sao rỗng trong ảnh của bạn
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${movie['rating']} • ${movie['genres']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // 3. Icon mũi tên bên phải
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF333333),
          ),
        ],
      ),
    );
  }
}

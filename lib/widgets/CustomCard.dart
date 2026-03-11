import 'package:flutter/material.dart';

// 1. Tarjeta para el Grid superior
class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final String image;

  const CategoryCard({
    super.key,
    required this.title,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [

          // IMAGEN DEL ALBUM
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// 2. Tarjeta horizontal (album / artista)
class MediaItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCircle;
  final String image;

  const MediaItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment:
            isCircle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [

          Container(
            height: 155,
            width: 155,
            decoration: BoxDecoration(
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: isCircle ? null : BorderRadius.circular(4),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Tarjeta Radio
class RadioCard extends StatelessWidget {
  final Color color;
  final String name;
  final String img1;
  final String img2;
  final String img3;

  const RadioCard({
    super.key,
    required this.color,
    required this.name,
    required this.img1,
    required this.img2,
    required this.img3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.music_note, color: Colors.black, size: 20),
              Text(
                "RADIO",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),


          const SizedBox(height: 13),

          SizedBox(
            height: 70,
            child: Stack(
              children: [
                Positioned(
                  left: -5,
                  top: 7,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(img1),
                  ),
                ),
                Positioned(
                  left: 85,
                  top: 7,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.white24,
                    backgroundImage: NetworkImage(img3),
                  ),
                ),
                Positioned(
                  left: 32,
                  top: 0,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(img2),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}

class SongCard extends StatelessWidget {
  final String title;
  final String artist;
  final String image;
  final bool explicit;

  const SongCard({
    super.key,
    required this.title,
    required this.artist,
    required this.image,
    this.explicit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [

          // PORTADA
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              image,
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // TEXTO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                Row(
                  children: [

                   

                    Expanded(
                      child: Text(
                        artist,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // BOTON 3 PUNTOS
          const Icon(
            Icons.more_vert,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
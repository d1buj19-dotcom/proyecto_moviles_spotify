import 'package:flutter/material.dart';
import './widgets/CustomCard.dart'; 


void main() {
  runApp(const MainApp()); 
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta roja de "Debug" de la esquina.
      home: const SpotifyHome(), // Indica que la primera pantalla es SpotifyHome.
    );
  }
}

class SpotifyHome extends StatelessWidget {
  const SpotifyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estructura básica de una página (cuerpo, fondo, etc.).
      backgroundColor: const Color(0xFF121212), // El color negro exacto que usa Spotify.
      appBar: AppBar(//Appbar
    backgroundColor: const Color(0xFF121212),
    elevation: 0,
    title: Row(
      children: [

        const CircleAvatar(
          radius: 16,
          backgroundColor: Colors.white24,
          backgroundImage: NetworkImage(
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
  ),
        ),

        const SizedBox(width: 10),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("Todas",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),

        const SizedBox(width: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 51, 49, 49),
            borderRadius: BorderRadius.circular(20),
          ),
         child: const Text( "Música",
         style: TextStyle(
         color: Colors.white,
         fontSize: 15,
         fontWeight: FontWeight.w500,),
          ),
        ),

        const SizedBox(width: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 50, 49, 49),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("podcasts",
          style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,),
          ),
        ),
      ],
    ),
  ),
      body: SingleChildScrollView( // Permite que el contenido se pueda desplazar (hacer scroll).
        padding: const EdgeInsets.all(16.0), // Margen de 16 pixeles en todos los bordes.
        child: Column( // Organiza las secciones de arriba hacia abajo.
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea todo a la izquierda.
          children: [
            
            // --- BLOQUE 1: GRID SUPERIOR ---
            GridView.count( // Crea una cuadrícula.
              shrinkWrap: true, // IMPORTANTE: Hace que el Grid no intente ocupar infinito espacio (evita errores).
              physics: const NeverScrollableScrollPhysics(), // Desactiva el scroll del Grid porque ya tenemos el scroll del body.
              crossAxisCount: 2, // Define que queremos 2 columnas.
              crossAxisSpacing: 8, // Espacio horizontal entre cuadros.
              mainAxisSpacing: 8, // Espacio vertical entre cuadros.
              childAspectRatio: 3, // Proporción: hace que los cuadros sean rectangulares y no cuadrados.
              children: [
              CategoryCard(title: "DJ",color: Colors.blue, image: "https://lexicon-assets.spotifycdn.com/DJ-Beta-CoverArt-300.jpg",),
              CategoryCard(title: "Tus me gusta",color: Colors.deepPurple, image: "https://misc.scdn.co/liked-songs/liked-songs-640.png",),
              CategoryCard(title: "MI MIX",color: Colors.orange,image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTUtM7EOctptm3caiWf_y2C8dP2YRTw3cT4A&s",),
              CategoryCard(title: "NOVEDADES MÚSICA", color: Colors.teal,image: "https://i.pinimg.com/736x/6d/e5/be/6de5bebdbaa333d53a26286821c7fd43.jpg",),
              CategoryCard(title: "POR SI MAÑANA",color: Colors.red,image: "https://i.scdn.co/image/ab67616d0000b27390af5246adcaa93acb721c17",),
              CategoryCard(title: "TU CON EL", color: Colors.green, image: "https://i1.sndcdn.com/artworks-vIPPyTSAwVsy-0-t500x500.jpg",),
              CategoryCard(title: "DATA", color: Colors.white24, image: "https://i.scdn.co/image/ab67616d0000b273f885fb64a381318a1c9c14e4",),
              CategoryCard(title: "SR. SANTOS", color: Colors.brown, image: "https://i.scdn.co/image/ab67616d0000b27330326b23e30ae93d4d48165b",),
            ],
            
            
            
            ),

            const SizedBox(height: 30), // Espacio entre el Grid y la siguiente sección.
            
            // --- BLOQUE 2: SECCIÓN "SIMILARES A" ---
            Row( // Fila para el avatar y el texto de la sección.
              children: [
                const CircleAvatar(radius: 25, backgroundColor: Colors.green,backgroundImage: NetworkImage("https://i.scdn.co/image/ab6761610000517481f47f44084e0a09b5f0fa13"),), // El circulo verde (donde iría la cara de Bad Bunny).
                const SizedBox(width: 12),
                Column( // Columna para poner el texto de "Similares a" arriba de "Bad Bunny".
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Similares a", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text("Bad Bunny", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox( // Contenedor con altura fija para que el ListView horizontal funcione.
              height: 220,
              child: ListView( // Lista que se mueve de lado a lado.
              scrollDirection: Axis.horizontal, // Dirección horizontal.
              children: [
               MediaItemCard(
               title: "Cosa Nuestra",
               subtitle: "Álbum • Rauw Alejandro",
               image: "https://akamai.sscdn.co/uploadfile/letras/albuns/7/2/a/6/2441921731925206.jpg",
               ),

              MediaItemCard(
              title: "J Balvin",
              subtitle: "Artista",
              image: "https://i.scdn.co/image/ab6761610000e5eb0405b03342c2e56751b9923d",
               isCircle: true,
              ),

             MediaItemCard(
             title: "RaiNao",
             subtitle: "Artista",
             image: "https://i.scdn.co/image/ab6761610000e5eb0297054e5768f3daf3f9978a",
             isCircle: true,
             ),

             MediaItemCard(
             title: "Feid",
             subtitle: "Artista",
             image: "https://i.scdn.co/image/ab6761610000e5eb600ee3d2a14da8d038fa7bbf",
             isCircle: true,
             ),
            ],
                
              ),
            ),

            // --- BLOQUE 3: SECCIÓN ESTACIONES ---
            const Text(
              "Estaciones recomendadas",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  RadioCard(
                    color: Color.fromARGB(255, 208, 113, 255), 
                    name: "Bad",
                    img1: "https://i.scdn.co/image/ab6761610000e5eb66041ce9eb4497057cbc3496",
                    img2: "https://i.scdn.co/image/ab6761610000517481f47f44084e0a09b5f0fa13",
                    img3: "https://i.scdn.co/image/ab67616d0000b27330326b23e30ae93d4d48165b",),
                  RadioCard(
                    color: Colors.green, 
                    name: "Arcángel",
                    img1: "https://i.scdn.co/image/ab676161000051749b3298d4e296defddfe37503",
                    img2: "https://i.scdn.co/image/ab67616d0000b27330326b23e30ae93d4d48165b",
                    img3: "https://i.scdn.co/image/ab6761610000e5eba152dd746e0fbfaa7c205c16",),
                  RadioCard(
                    color: Colors.blue, 
                    name: "Rauw",
                    img1: "https://i.scdn.co/image/ab6761610000e5eb463e10d5f1a533ddd6eb9a04",
                    img2: "https://i.scdn.co/image/ab6761610000e5eb43ea45ccf08451d2511d33fa",
                    img3: "https://i.scdn.co/image/ab6761610000e5ebc9154bd840cd45e769c4e480",),
                    RadioCard(
                    color: Color.fromARGB(255, 255, 133, 57), 
                    name: "Karol G",
                    img1: "https://i.scdn.co/image/ab67616100005174f5c59bc5c84435e9a4f11bd6",
                    img2: "https://i.scdn.co/image/ab6761610000e5eb66041ce9eb4497057cbc3496",
                    img3: "https://i.scdn.co/image/ab6761610000e5eb600ee3d2a14da8d038fa7bbf",),
                 ],
              ),
            ),

              SizedBox(height: 15),

             const Text(
              "Tus favoritos del momento",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            
            SongCard(
              title: "Dejame ir",
              artist: "Ándres Cepeda, Morat",
              image:
                  "https://i.scdn.co/image/ab67616d0000b273827e7c88be91d7472e7897c1",
            
            ),

            SongCard(
              title: "Abrázame Muy Fuerte",
              artist: "Juan Gabriel",
              image: "https://i.scdn.co/image/ab67616d0000b273552305f118125cd9b54abf2d",
            ),

            SongCard(
              title: "Titi Me pregunto",
              artist: "Bad Bunny",
              image: "https://i.scdn.co/image/ab67616d0000b2738a16b635c98c3d7209b73ce4",
            ),
          ],
        ),
      ),
//barra inferior de navegación
  bottomNavigationBar: BottomNavigationBar(
  backgroundColor: const Color(0xFF121212),
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.grey,
  type: BottomNavigationBarType.fixed,

  items: const [

    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Inicio",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Buscar",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.library_books),
      label: "Tu biblioteca",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: "Premium",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.add_box),
      label: "Crear",
    ),

  ],
),
    );
  }
}
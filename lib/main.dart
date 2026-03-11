import 'package:flutter/material.dart'; // Importación necesaria para widgets.
import './widgets/CustomCard.dart'; // IMPORTANTE: Trae los diseños que hicimos en el otro archivo.

void main() {
  runApp(const MainApp()); // Arranca la aplicación con el widget MainApp.
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Widget raíz que configura la app.
      debugShowCheckedModeBanner: false, // Quita la etiqueta roja de "Debug" de la esquina.
      //theme: ThemeData.dark(), // Aplica un tema oscuro global (letras blancas, fondos negros).
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
              CategoryCard(title: "DJ",color: Colors.blue, image: "",),
              CategoryCard(title: "Tus me gusta",color: Colors.deepPurple, image: "https://misc.scdn.co/liked-songs/liked-songs-640.png",),
              CategoryCard(title: "MI MIX",color: Colors.orange,image: "",),
              CategoryCard(title: "NOVEDADES MÚSICA", color: Colors.teal,image: "",),
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
                const CircleAvatar(radius: 25, backgroundColor: Colors.green), // El circulo verde (donde iría la cara de Bad Bunny).
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
                  RadioCard(color: Colors.yellow, name: "Bad"),
                  RadioCard(color: Colors.purpleAccent, name: "Arcángel"),
                  RadioCard(color: Colors.orange, name: "Rauw"),
                ],
              ),
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
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
      body: SingleChildScrollView( // Permite que el contenido se pueda desplazar (hacer scroll).
        padding: const EdgeInsets.all(16.0), // Margen de 16 pixeles en todos los bordes.
        child: Column( // Organiza las secciones de arriba hacia abajo.
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea todo a la izquierda.
          children: [
            const SizedBox(height: 40), // Espacio inicial para no chocar con la barra de estado del celular.
            
            // --- BLOQUE 1: GRID SUPERIOR ---
            GridView.count( // Crea una cuadrícula.
              shrinkWrap: true, // IMPORTANTE: Hace que el Grid no intente ocupar infinito espacio (evita errores).
              physics: const NeverScrollableScrollPhysics(), // Desactiva el scroll del Grid porque ya tenemos el scroll del body.
              crossAxisCount: 2, // Define que queremos 2 columnas.
              crossAxisSpacing: 8, // Espacio horizontal entre cuadros.
              mainAxisSpacing: 8, // Espacio vertical entre cuadros.
              childAspectRatio: 3, // Proporción: hace que los cuadros sean rectangulares y no cuadrados.
              children: const [ // Aquí llamamos a los CategoryCard que fabricamos antes.
                CategoryCard(title: "DJ", color: Colors.blue),
                CategoryCard(title: "Tus me gusta", color: Colors.deepPurple),
                CategoryCard(title: "MI MIX", color: Colors.orange),
                CategoryCard(title: "NOVEDADES MÚSICA...", color: Colors.teal),
                CategoryCard(title: "POR SI MAÑANA...", color: Colors.red),
                CategoryCard(title: "TU CON EL", color: Colors.green),
                CategoryCard(title: "DATA", color: Colors.white24),
                CategoryCard(title: "SR. SANTOS", color: Colors.brown),
                
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
                children: const [
                  MediaItemCard(title: "Cosa Nuestra", subtitle: "Álbum • Rauw Alejandro"),
                  MediaItemCard(title: "J Balvin", subtitle: "Artista", isCircle: true), // Aquí activamos el círculo.
                  MediaItemCard(title: "RaiNao", subtitle: "Artista", isCircle: true),
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
    );
  }
}
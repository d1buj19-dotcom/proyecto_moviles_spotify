import 'package:flutter/material.dart'; // Importa la librería básica de diseño de Google (Material Design).

// 1. Tarjeta para el Grid superior (los 8 rectángulos de arriba)
class CategoryCard extends StatelessWidget { // Crea un widget que no cambia su estado internamente.
  final String title; // Variable para guardar el nombre (ej: "DJ").
  final Color color; // Variable para el color de la cajita de la izquierda.

  const CategoryCard({super.key, required this.title, required this.color}); // Constructor: pide el título y color al usarse.

  @override
  Widget build(BuildContext context) { // Método que dibuja el widget en pantalla.
    return Container( // El contenedor principal de la tarjeta.
      decoration: BoxDecoration( // Define el estilo visual.
        color: Colors.white.withOpacity(0.1), // Color de fondo gris traslúcido de cada tarjeta (típico de Spotify).
        borderRadius: BorderRadius.circular(4), // Bordes ligeramente redondeados.
      ),//cierra
      //clipBehavior: Clip.antiAlias, // Corta el contenido que se salga de los bordes redondeados.
      child: Row( // Organiza los elementos de forma horizontal (Imagen | Texto).
        children: [
          Container(width: 55, color: color), // Simula la imagen del álbum con un cuadro de color.
          const SizedBox(width: 8), // Espacio de 8 pixeles entre el color y el texto.
          Expanded( // Hace que el texto use todo el espacio restante sin salirse.
            child: Text(
              title, // Muestra el título que le pasamos.
              style: const TextStyle( // Estilo del texto.
                color: Colors.white, // Color blanco texto.
                fontWeight: FontWeight.bold, // Letra negrita.
                fontSize: 12, // Tamaño de letra pequeño.
              ),
              maxLines: 2, // Si el texto es largo, solo ocupa 2 líneas.
              overflow: TextOverflow.ellipsis, // Si sobra texto, pone puntos suspensivos (...).
            ),
          ),
        ],
      ),
    );
  }
}

// 2. Tarjeta para secciones horizontales (Cosa Nuestra, J Balvin, etc.)
class MediaItemCard extends StatelessWidget {
  final String title; // Título de la canción o artista.
  final String subtitle; // Subtítulo (ej: "Álbum", "Artista").
  final bool isCircle; // Interruptor: ¿Es un círculo (artista) o un cuadrado (álbum)?

  const MediaItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.isCircle = false, // Por defecto es falso (cuadrado).
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 155, // Ancho fijo para que todas las tarjetas midan lo mismo.
      margin: const EdgeInsets.only(right: 10), // Espacio a la derecha para que no se peguen entre sí.
      child: Column( // Organiza los elementos de forma vertical (Imagen -> Título -> Subtítulo).
        crossAxisAlignment: isCircle ? CrossAxisAlignment.center : CrossAxisAlignment.start, // Centra si es círculo.
        children: [
          Container(
            height: 155, // Altura de la imagen.
            width: 155, // Ancho de la imagen.
            decoration: BoxDecoration(
              color: Colors.grey[800], // Fondo gris oscuro mientras carga la imagen.
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle, // Define si es círculo o cuadrado.
              borderRadius: isCircle ? null : BorderRadius.circular(4), // Redondea si es cuadrado.
            ),
          ),
          const SizedBox(height: 10), // Espacio entre imagen y texto.
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1, // Solo una línea para el título.
            overflow: TextOverflow.ellipsis, // ... si es muy largo.
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 13), // Texto gris para el subtítulo.
          ),
        ],
      ),
    );
  }
}

// 3. Tarjeta de Estaciones Recomendadas (Diseño Radio)
class RadioCard extends StatelessWidget {
  final Color color; // Color de fondo de la tarjeta de radio.
  final String name; // Nombre de la radio.

  const RadioCard({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 155,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: color, // Usa el color que le mandemos.
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(10), // Margen interno de 10 pixeles.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row( // Fila superior de la tarjeta de radio.
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Empuja los iconos a los extremos.
            children: [
              Icon(Icons.music_note, color: Colors.black, size: 20), // Icono de nota musical.
              Text("RADIO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.black)), // Texto "RADIO".
            ],
          ),
          const Spacer(), // Empuja todo lo anterior hacia arriba y lo siguiente hacia abajo.
          Text(
            name,
            style: const TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 22, // Texto grande para el nombre de la radio.
            ),
          ),
        ],
      ),
    );
  }
}
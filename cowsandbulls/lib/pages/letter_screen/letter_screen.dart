import 'package:flutter/material.dart';

class LetterScreen extends StatelessWidget {
  const LetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Para Gaby",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            wordSpacing: 1,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 133, 113, 67),
        foregroundColor: Colors.white,
      ),
      body: const Expanded(child: SingleChildScrollView(
        child: Text("""Bueno tengo malas noticias :(, no pude lograr hacer que jugáramos los dos al mismo tiempo. Estuve mucho tiempo intentando pero al ver que no me iba a dar tiempo hice la app de nuevo, la misma que tenías en la pc, pero en el móvil. Pero te prometo que como regalo de navidad tendrás la app completa e incluso otro jueguito también. 

Te mereces todo amor, eres lo mejor que me ha pasado en la vida y ya no me imagino otra cosa que estar a tu lado. Me he roto la cabeza buscándote regalos, tratando de compensar esta lejanía que en verdad no se sustituye con nada, espero que todo te guste y que lo disfrutes. Me siento más unido a ti que nunca y vivo con la firme convicción de que debemos lograr volver a estar juntos y cumplir todas nuestras metas. 

Hoy hace un año llegaste a mi vida a cambiarla para siempre, pero el factor común de todo este tiempo, es que cuando te conocí no tuve dudas y ahora mucho menos. Estoy orgulloso de ti, de nosotros, de lo que soy cuando estamos juntos. Admiro mucho cómo has sido hasta ahora, aunque no lo creas, tu eres un motor fundamental para que yo pueda avanzar, me das fuerzas con cada llamada, con cada mensaje, con estar ahí. La mejor novia del universo y se me queda corto. Gracias a la vida por ponerte delante. Nadie va a saber nunca lo que te extraño, lo que te quiero, lo que te amo, son cosas que son difíciles de expresar porque son muy grandes. Solo el día a día hace que te demuestre todas esas cosas.

Espero que disfrutes de todo, realmente te mereces mucho más. Te amo infinitamente, todo de ti, tus virtudes, tus defectos, tu esencia, yo me enamoré de eso, y sigo enamorado para siempre. 

te amo infinito,

Jorgito."""),
      )),

    );
  }
}
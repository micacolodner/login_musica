import 'package:go_router/go_router.dart';
import 'package:login_musica/presentations/screens/album_detail.dart';
import 'package:login_musica/presentations/screens/home_screen.dart';
import 'package:login_musica/presentations/screens/login_screen.dart';
import 'package:login_musica/entities/datos_usuario.dart';

final appRouter = GoRouter(
  initialLocation: '/login', //pantalla en la que empieza

  routes: [
    GoRoute(path: '/login', builder: (context, state) => Login()),

    GoRoute(
      path: '/home',
      builder: (context, state) {
        final user = state.extra as Datos;
        return Home(user: user);
      },
    ),

    GoRoute(path: '/album_detail', builder: (context, state) => AlbumDetail()),
  ],
);

import 'package:go_router/go_router.dart';
import 'package:login_musica/router/go_router.dart';
import 'package:login_musica/screens/home_screen.dart';
import 'package:login_musica/screens/login_screen.dart';
import 'package:login_musica/entities/product.dart';

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
  ],
);

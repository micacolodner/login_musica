import 'package:go_router/go_router.dart';
import 'package:login_musica/router/go_router.dart';
import 'package:login_musica/presentation/screens/home_screen.dart';
import 'package:login_musica/presentation/screens/login_screen.dart';
import 'package:login_musica/entities/datosUsuario.dart';

final appRouter = GoRouter(
  initialLocation: '/login', //pantalla en la que empieza

  routes: [
    GoRoute(path: '/login', builder: (context, state) => Login()),

    GoRoute(
      path: '/home',
      builder: (context, state) {
        final user = state.extra as datosUsuario;
        return Home(user: user);
      },
    ),
  ],
);

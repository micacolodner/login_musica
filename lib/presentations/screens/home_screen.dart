import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_musica/entities/album.dart';
import 'package:login_musica/entities/datos_usuario.dart';
import 'package:login_musica/presentations/providers.dart';

class Home extends ConsumerStatefulWidget {
  final Datos user;
  const Home({super.key, required this.user});

  @override
  ConsumerState<Home> createState() => _HomeState();
}


class _HomeState extends ConsumerState<Home> {

  @override
  Widget build(BuildContext context) {

    final albumsList = ref.watch(AlbumProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hola ${widget.user.nombre}!', style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/album_detail');
        },
        mini: true,
        child: Icon(Icons.add),
      ),


      body: ListView.builder(
        itemCount: albumsList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(albumsList[index].title),
              subtitle: Text('${albumsList[index].singer} - ${albumsList[index].year}'),
              leading: Image.network(
                albumsList[index].poster,
                width: 50,
                height: 75,
                fit: BoxFit.cover,
              ),
            )
          );
        }
      ),

    );
  }
}
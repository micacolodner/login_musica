import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_musica/entities/album.dart';
import 'package:login_musica/entities/datos_usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_musica/presentations/providers.dart';

class AlbumDetail extends ConsumerStatefulWidget {
  const AlbumDetail({super.key});

  @override
  ConsumerState<AlbumDetail> createState() => _AlbumDetailState();
}

class _AlbumDetailState extends ConsumerState<AlbumDetail> {
  final TextEditingController inputTitle = TextEditingController();
  final TextEditingController inputSinger = TextEditingController();
  final TextEditingController inputYear = TextEditingController();
  final TextEditingController inputPoster = TextEditingController();

   void _add() {
    final newAlbum = Albums(
      title: inputTitle.text,
      singer: inputSinger.text,
      year: inputYear.text,
      poster: inputPoster.text,
      );

    ref.read(AlbumProvider.notifier).addAlbum(newAlbum);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ADD ALBUMS"), centerTitle: true),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: inputTitle,
                decoration: InputDecoration(
                  hintText: 'Ingrese el titulo del album',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              TextField(
                controller: inputSinger,
                decoration: InputDecoration(
                  hintText: 'Ingrese el nombre del cantante',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              TextField(
                controller: inputYear,
                decoration: InputDecoration(
                  hintText: 'Ingrese el año del album',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              TextField(
                controller: inputPoster,
                decoration: InputDecoration(
                  hintText: 'Ingrese la URL de la imagen',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (inputPoster.text != '' &&
                      inputTitle.text != '' &&
                      inputSinger.text != '' &&
                      inputYear.text != '') {
                    _add();
                    context.pop('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor ingrese todos los datos.')),
                    );
                  }
                },
                child: const Text('AGREGAR ALBUM'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_musica/entities/album.dart';
import 'package:login_musica/entities/datosUsuario.dart';


class Home extends StatefulWidget {
  final datosUsuario user;
  const Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

Album album1 = Album (title: 'FOUR (Deluxe)', singer: 'One Direction', year: '2014', poster: 'https://i.scdn.co/image/ab67616d0000b273d304ba2d71de306812eebaf4' );
Album album2 = Album (title: '1989 (Deluxe)', singer: 'Taylor Swift', year: '2014', poster: 'https://upload.wikimedia.org/wikipedia/en/f/f6/Taylor_Swift_-_1989.png');
Album album3 = Album (title: 'Faith In The Future (Deluxe)', singer: 'Louis Tomlinson', year: '2022', poster: 'https://upload.wikimedia.org/wikipedia/en/1/16/Louis_Tomlinson_-_Faith_in_the_Future.png');
Album album4 = Album (title: 'Snow Angel', singer: 'Reneé Rapp', year: '2023', poster: 'https://cdn-images.dzcdn.net/images/cover/e2728454168a221597bd74042eb4bea9/1900x1900-000000-80-0-0.jpg');
Album album5 = Album (title: 'Mind Of Mine', singer: 'ZAYN', year: '2016', poster: 'https://cdn-images.dzcdn.net/images/cover/1224e92320d2d00568fb0327b248acf4/1900x1900-000000-80-0-0.jpg');


class _HomeState extends State<Home> {
  
 List<Album> albumsList = [album1, album2, album3, album4, album5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido: ${widget.user.nombre}. Dirección: ${widget.user.direccion}', style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
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

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundDetails {
  String name;
  String displayName;

  SoundDetails(this.name, this.displayName);
}

final List<SoundDetails> _soundList = [
  SoundDetails('ahuurr-ah-bhruah', 'Ahuurr-ah-bhruah'),
  SoundDetails('ai-mamae', 'Ai Mamãe'),
  SoundDetails('ai-meu-deus', 'Ai Meu Deus'),
  SoundDetails('ai', 'Ai'),
  SoundDetails('aiaiai', 'Ai Ai AI'),
  SoundDetails('atumalaca', 'Atumalaca'),
  SoundDetails('cavalo', 'Cavalo'),
  SoundDetails('cheeeega', 'Cheeeega'),
  SoundDetails('danca-gatinho-danca', 'Dança Gatinho Dança'),
  SoundDetails('demais', 'Demais'),
  SoundDetails('e-brincadeira-ein', 'É Brincadeira Ein'),
  SoundDetails('ele-gosta', 'Ele Gosta'),
  SoundDetails('irra', 'Irra'),
  SoundDetails('nao', 'Não'),
  SoundDetails('pare', 'Pare'),
  SoundDetails('que-cara-mais-sem-graca', 'Que Cara Mais Sem Graça'),
  SoundDetails('que-isso-meu-filho-calma', 'Que Isso Meu Filho Calma'),
  SoundDetails('que-papelao-ein', 'Que Papelão Ein'),
  SoundDetails('tapa', 'Tapa'),
  SoundDetails('tema-da-vitoria-senna', 'Tema da Vitória Senna'),
  SoundDetails('tome', 'Tome'),
  SoundDetails('uepa', 'Uepa'),
  SoundDetails('uuuui', 'Uuuui'),
  SoundDetails('xiiiiii', 'Xiiiiii'),
];

AssetSource _getSoundFilePathByName(String soundName) {
  return AssetSource('sounds/' + soundName + '.mp3');
}

// Home widget
class Home extends StatefulWidget {
  // Defines Home widget
  const Home({Key? key, required this.title}) : super(key: key);

  // Widget title
  final String title;

  // Defines widget state
  @override
  State<Home> createState() => _HomeState();
}

// Home widget state
class _HomeState extends State<Home> {
  final _buttons = _soundList
      .map((SoundDetails soundDetails) => Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    minimumSize: const Size(270, 50)),
                child: Text(soundDetails.displayName),
                onPressed: () async {
                  // AudioPlayer instance
                  final audioPlayer = AudioPlayer();

                  await audioPlayer
                      .play(_getSoundFilePathByName(soundDetails.name));
                }),
          ))
      .toList();

  // Build function
  @override
  Widget build(BuildContext context) {
    // Scaffold key variable
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset('assets/images/icon.png'),
            onPressed: () {},
          ),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _buttons)))));
  }
}

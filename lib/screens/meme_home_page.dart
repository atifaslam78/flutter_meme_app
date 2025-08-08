import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme_app/models/meme_model.dart';
import 'package:meme_app/services/meme_service.dart';
import 'package:meme_app/widgets/meme_card.dart';

class MemeHomePage extends StatefulWidget {
  const MemeHomePage({super.key});

  @override
  State<MemeHomePage> createState() => _MemeHomePageState();
}

class _MemeHomePageState extends State<MemeHomePage> {
  List<Meme> memes = [];
  bool isLoading = true;
  Color backgroundColor = const Color.fromARGB(255, 167, 186, 211);

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    final fetchMemes = await MemeService.fetchMemes(context);
    setState(() {
      memes = fetchMemes ?? [];
      isLoading = false;
    });
  }

  void updateBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meme App'),
        centerTitle: true,
        backgroundColor:backgroundColor,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [backgroundColor, backgroundColor],
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator.adaptive())
            : memes.isEmpty
            ? Center(child: Text('No Memes Found'))
            : ListView.builder(
                itemCount: memes.length,
                itemBuilder: (context, index) {
                  final meme = memes[index];
                  return MemeCard(
                    title: meme.title,
                    imageUrl: meme.url,
                    ups: meme.ups,
                    postLink: meme.postLink,
                    onColorExtracted: updateBackgroundColor,
                  );
                },
              ),
      ),
    );
  }
}

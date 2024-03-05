import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jokester/settings.dart';
import 'package:jokester/settings_screen.dart';
import 'package:provider/provider.dart';

import 'data_source.dart';
import 'joke_dto.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  JokeDto? joke;

  @override
  void initState() {
    super.initState();
    _loadJoke();
  }

  _loadJoke() async {
    setState(() {
      joke = null;
    });
    final newJoke = await context.read<DataSource>().getJokes();
    setState(() {
      joke = newJoke;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final art = "adventurer";
    final art = context.read<Settings>().sellectedImage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Joke"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsScreen())),
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              )),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (joke == null) CircularProgressIndicator.adaptive(),
              if (joke != null)
                SvgPicture.network(
                    height: 300,
                    "https://api.dicebear.com/7.x/$art/svg?seed=${joke?.id}?scale=50"),
              if (joke?.joke != null) Text(joke!.joke!),
              if (joke?.setup != null) Text(joke!.setup!),
              Text(""),
              if (joke?.delivery != null) Text(joke!.delivery!),
              TextButton(onPressed: _loadJoke, child: Text("Tell me WHY!?"))
            ],
          ),
        ),
      ),
    );
  }
}

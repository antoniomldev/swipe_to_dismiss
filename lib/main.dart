// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:swipe_to_dismiss/mensagem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SwipeToDismiss(),
    );
  }
}

class SwipeToDismiss extends StatefulWidget {
  const SwipeToDismiss({super.key});

  @override
  State<SwipeToDismiss> createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismiss> {
  List<Mensagem> minhasMensagens = [
    Mensagem(
        titulo: 'Email do Tony Stark',
        corpo: 'Reunião na Torre dos Vingadores'),
    Mensagem(
        titulo: 'Notícias do Clarim Diario',
        corpo: 'Homem Aranha é inimigo público'),
    Mensagem(
        titulo: 'Cartão de Crédito XYZ', corpo: 'Sua fatura vence amanhã!'),
    Mensagem(
        titulo: 'Confirmação de Presença',
        corpo: 'Confirme sua presença no aniversário de Bruce Banner'),
  ];

  void showSnackBar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Você arquivou essa mensagem!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SwipeToDismiss - Mensagens'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: minhasMensagens.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: UniqueKey(),
                child: ListTile(
                  title: Text(minhasMensagens[index].titulo),
                  subtitle: Text(minhasMensagens[index].corpo),
                ),
                background: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.green[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.archive_rounded),
                    ],
                  ),
                ),
                secondaryBackground: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.red[400],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.delete_sweep_rounded),
                      ],
                    )),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.startToEnd) {
                    return showSnackBar();
                  }
                },
                confirmDismiss: (DismissDirection direction) async {});
          },
        ));
  }
}

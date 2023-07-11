import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socet_example/provider/provider.dart';

import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChatProvider>();
    final event = context.read<ChatProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: ListView.builder(
          reverse: true,
          itemCount: state.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: state.list[index].firstname == state.name
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: state.list[index].firstname == state.name
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).focusColor,
                      borderRadius: BorderRadius.circular(6)),
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.list[index].firstname,
                        style: state.list[index].firstname == state.name
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        state.list[index].message,
                        style: state.list[index].firstname == state.name
                            ? Theme.of(context).textTheme.titleLarge
                            : Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom +
                MediaQuery.of(context).padding.bottom),
        child: CustomTextFormField(
          controller: controller,
          icon: IconButton(
            onPressed: () {
              if (state.name != null) {
                event.sendMessage(message: controller.text);
                controller.clear();
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: CustomTextFormField(
                          controller: name,
                          label: "Name",
                        ),
                        actions: [
                          CustomButton(
                              onTap: () {
                                event.saveName(name.text);
                                Navigator.pop(context);
                              },
                              title: "Save"),
                        ],
                      );
                    });
              }
            },
            icon: const Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}

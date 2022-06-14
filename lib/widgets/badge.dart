import 'package:flutter/material.dart';

class Badge extends StatelessWidget {

  final Widget child;
  final String value;
  final Color color;
  const Badge({ Key? key,required this.child,required this.color,required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          bottom: 20,
           left: 20,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 30,
              minWidth: 30
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                // ignore: prefer_if_null_operators, unnecessary_null_comparison
                color: color != null ? color : Theme.of(context).colorScheme.secondary,
                fontSize: 15,
                ),
              ),
          ),
          ),
      ],
    );
  }
}
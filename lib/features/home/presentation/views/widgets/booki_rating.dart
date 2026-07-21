import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rate,
    required this.count,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num rate;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star_rounded, color: Colors.yellow),
        const SizedBox(width: 6.3),
        Text('$rate', style: Styles.textStyle16),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.7,
          child: Text("($count)", style: Styles.textStyle14),
        ),
      ],
    );
  }
}

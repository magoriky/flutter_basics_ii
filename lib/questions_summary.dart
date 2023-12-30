import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  Color colorChanger(data) {
    if (data["correct_answer"] == data["user_answer"]) {
      return const Color.fromARGB(237, 116, 192, 242);
    }
    return const Color.fromARGB(221, 240, 125, 192);
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 420,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                backgroundColor: colorChanger(data),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: GoogleFonts.lato(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(236, 201, 148, 228),
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      data['user_answer'] as String,
                      style: GoogleFonts.lato(
                          color: const Color.fromARGB(237, 116, 192, 242),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

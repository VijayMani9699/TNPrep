import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../common_widgets/glass_app_bar.dart';
import '../model/exam_model.dart';
import 'question_papers_list_screen.dart';

class ExamSelectionScreen extends StatelessWidget {
  const ExamSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final List<ExamCategory> examCategories = [
      ExamCategory(
        title: l10n.categoryTnpsc,
        exams: [
          ExamItem(
            title: l10n.examGroup1,
            id: 'group1',
            color: Colors.blue.shade50,
            iconColor: AppColors.primary,
            icon: Icons.account_balance,
          ),
          ExamItem(
            title: l10n.examGroup2,
            id: 'group2',
            color: Colors.blue.shade50,
            iconColor: AppColors.primary,
            icon: Icons.assignment,
          ),
          ExamItem(
            title: l10n.examGroup2A,
            id: 'group2a',
            color: Colors.blue.shade50,
            iconColor: AppColors.primary,
            icon: Icons.assignment_outlined,
          ),
          ExamItem(
            title: l10n.examGroup4,
            id: 'group4',
            color: Colors.blue.shade50,
            iconColor: AppColors.primary,
            icon: Icons.group_work,
          ),
        ],
      ),
      ExamCategory(
        title: l10n.categoryTrb,
        exams: [
          ExamItem(
            title: l10n.examTrbSecondary,
            id: 'trb_secondary',
            color: Colors.orange.shade50,
            iconColor: Colors.orange,
            icon: Icons.school,
          ),
          ExamItem(
            title: l10n.examTrbPg,
            id: 'trb_pg',
            color: Colors.orange.shade50,
            iconColor: Colors.orange,
            icon: Icons.school,
          ),
        ],
      ),
      ExamCategory(
        title: l10n.categoryUniformed,
        exams: [
          ExamItem(
            title: l10n.examTnusrbSi,
            id: 'tnusrb_si',
            color: Colors.green.shade50,
            iconColor: Colors.green,
            icon: Icons.local_police,
          ),
          ExamItem(
            title: l10n.examTnusrbPc,
            id: 'tnusrb_pc',
            color: Colors.green.shade50,
            iconColor: Colors.green,
            icon: Icons.local_police,
          ),
        ],
      ),
      ExamCategory(
        title: l10n.categoryOther,
        exams: [
          ExamItem(
            title: l10n.examTnfusrc,
            id: 'tnfusrc',
            color: Colors.brown.shade50,
            iconColor: Colors.brown,
            icon: Icons.forest,
          ),
          ExamItem(
            title: l10n.examTnMrb,
            id: 'tnmrb',
            color: Colors.red.shade50,
            iconColor: Colors.red,
            icon: Icons.local_hospital,
          ),
          ExamItem(
            title: l10n.examTnRrb,
            id: 'tnrrb',
            color: Colors.indigo.shade50,
            iconColor: Colors.indigo,
            icon: Icons.train,
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background
      extendBodyBehindAppBar: true, // Important for glass effect
      appBar: GlassAppBar(
        automaticallyImplyLeading: false,
        title: Text(
          l10n.examSelectionTitle,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 16,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        itemCount: examCategories.length,
        itemBuilder: (context, index) {
          final category = examCategories[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                child: Text(
                  category.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1, // Adjusted for icon + text
                ),
                itemCount: category.exams.length,
                itemBuilder: (context, examIndex) {
                  return _ExamCard(item: category.exams[examIndex]);
                },
              ),
              const SizedBox(height: 16), // Spacing between categories
            ],
          );
        },
      ),
    );
  }
}

class _ExamCard extends StatelessWidget {
  final ExamItem item;

  const _ExamCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionPapersListScreen(
                  examId: item.id,
                  examTitle: item.title,
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (item.icon != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: item.color ?? Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item.icon,
                      size: 28,
                      color: item.iconColor ?? AppColors.primary,
                    ),
                  ),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

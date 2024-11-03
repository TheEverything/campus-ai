import '/flutter_flow/flutter_flow_util.dart';
import 'questions_widget.dart' show QuestionsWidget;
import 'package:flutter/material.dart';

class QuestionsModel extends FlutterFlowModel<QuestionsWidget> {
  ///  Local state fields for this page.

  String? inputContent = '';

  dynamic chatHistory;

  bool isLoading = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  String? inputContent = '';

  dynamic chatHistory;

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final shortcutsFocusNode = FocusNode();
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for Loading component.
  late LoadingModel loadingModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    shortcutsFocusNode.requestFocus();
    listViewController = ScrollController();
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    loadingModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future ask(
    BuildContext context, {
    String? question,
  }) async {
    ApiCallResponse? res;

    res = await TestCall.call(
      question: question,
    );

    if ((res.succeeded ?? true)) {
      chatHistory = functions.saveChatHistory(chatHistory, <String, String?>{
        'role': 'user',
        'content': getJsonField(
          (res.jsonBody ?? ''),
          r'''$['answer']''',
        ).toString().toString(),
      });
      isLoading = false;
    }
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'blank_list_component_model.dart';
export 'blank_list_component_model.dart';

class BlankListComponentWidget extends StatefulWidget {
  const BlankListComponentWidget({
    super.key,
    this.onTap1,
    this.onTap2,
    this.onTap3,
    this.onTap4,
  });

  final Future Function()? onTap1;
  final Future Function()? onTap2;
  final Future Function()? onTap3;
  final Future Function()? onTap4;

  @override
  State<BlankListComponentWidget> createState() =>
      _BlankListComponentWidgetState();
}

class _BlankListComponentWidgetState extends State<BlankListComponentWidget> {
  late BlankListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankListComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.onTap1?.call();
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: () {
                  if (MediaQuery.sizeOf(context).width >= 1170.0) {
                    return 700.0;
                  } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                    return 330.0;
                  } else {
                    return 530.0;
                  }
                }(),
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary30,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '💳 İTÜ kartımı kaybettim ne yapmalıyım?',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.onTap2?.call();
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: () {
                  if (MediaQuery.sizeOf(context).width >= 1170.0) {
                    return 700.0;
                  } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                    return 330.0;
                  } else {
                    return 530.0;
                  }
                }(),
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary30,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '📖 Staj defterimi staj komisyonuna teslim ederken nelere dikkat etmeliyim?',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.onTap3?.call();
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: () {
                  if (MediaQuery.sizeOf(context).width >= 1170.0) {
                    return 700.0;
                  } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                    return 330.0;
                  } else {
                    return 530.0;
                  }
                }(),
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary30,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '📜 Doktora/Yüksek Lisans normal öğrenim sürem bitti fakat tezim için uzatma aldım projemi ne yapmalıyım?',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.onTap4?.call();
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: () {
                  if (MediaQuery.sizeOf(context).width >= 1170.0) {
                    return 700.0;
                  } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                    return 330.0;
                  } else {
                    return 530.0;
                  }
                }(),
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary30,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '🎓 Yüksek Lisans / Doktora proje başvurularını kimler yapabilir?',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

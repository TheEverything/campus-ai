import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'loading_model.dart';
export 'loading_model.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late LoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.temp != 10) {
        await Future.delayed(const Duration(milliseconds: 250));
        _model.temp = _model.temp + 1;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 250));
        _model.temp = _model.temp + 1;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 250));
        _model.temp = _model.temp + 1;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 250));
        _model.temp = 0;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 40.0,
      decoration: const BoxDecoration(),
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: RichText(
        textScaler: MediaQuery.of(context).textScaler,
        text: TextSpan(
          children: [
            TextSpan(
              text: _model.temp > 0 ? '.' : ' ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: _model.temp > 1 ? '.' : ' ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: _model.temp > 2 ? '.' : ' ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Plus Jakarta Sans',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 25.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}

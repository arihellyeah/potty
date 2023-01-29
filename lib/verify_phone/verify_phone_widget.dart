import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyPhoneWidget extends StatefulWidget {
  const VerifyPhoneWidget({Key? key}) : super(key: key);

  @override
  _VerifyPhoneWidgetState createState() => _VerifyPhoneWidgetState();
}

class _VerifyPhoneWidgetState extends State<VerifyPhoneWidget> {
  TextEditingController? smsCodeTextFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    smsCodeTextFieldController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    smsCodeTextFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryColor),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Verify Phone',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Overpass',
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 70, 0),
                      child: Text(
                        'Please enter the code that you received via text message (SMS).',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                      child: TextFormField(
                        controller: smsCodeTextFieldController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Enter Code ',
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Overpass',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                          hintText: '000000',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Overpass',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFEEEFEF),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFEEEFEF),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      final smsCodeVal = smsCodeTextFieldController!.text;
                      if (smsCodeVal == null || smsCodeVal.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Enter SMS verification code.'),
                          ),
                        );
                        return;
                      }
                      final phoneVerifiedUser = await verifySmsCode(
                        context: context,
                        smsCode: smsCodeVal,
                      );
                      if (phoneVerifiedUser == null) {
                        return;
                      }

                      context.goNamedAuth('nearbyPotty', mounted);
                    },
                    text: 'Verify',
                    options: FFButtonOptions(
                      width: 140,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

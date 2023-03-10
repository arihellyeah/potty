import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RatePottyWidget extends StatefulWidget {
  const RatePottyWidget({
    Key? key,
    this.code,
  }) : super(key: key);

  final CodesRecord? code;

  @override
  _RatePottyWidgetState createState() => _RatePottyWidgetState();
}

class _RatePottyWidgetState extends State<RatePottyWidget> {
  TextEditingController? textController1;
  double? ratingBarValue;
  TextEditingController? textController2;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Rate Potty',
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Rate the potty below.',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 90,
                  constraints: BoxConstraints(
                    maxWidth: 350,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).darkBG,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.asset(
                        'assets/images/classHero.jpg',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Color(0x2E000000),
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryColor,
                          FlutterFlowTheme.of(context).secondaryColor
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.code!.name!,
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).white,
                                ),
                          ),
                        ],
                      ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'What would you rate this potty?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: RatingBar.builder(
              onRatingUpdate: (newValue) =>
                  setState(() => ratingBarValue = newValue),
              itemBuilder: (context, index) => FaIcon(
                FontAwesomeIcons.toilet,
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
              direction: Axis.horizontal,
              initialRating: ratingBarValue ??= 0,
              unratedColor: FlutterFlowTheme.of(context).primaryColor,
              itemCount: 5,
              itemPadding: EdgeInsets.fromLTRB(6, 0, 6, 0),
              itemSize: 40,
              glowColor: FlutterFlowTheme.of(context).tertiaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 12),
            child: TextFormField(
              controller: textController1,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Review Title',
                labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                hintText: 'Text here...',
                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).grayLines,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).grayLines,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
              ),
              style: FlutterFlowTheme.of(context).subtitle2,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
            child: TextFormField(
              controller: textController2,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Review Details',
                labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                hintText: 'Text here...',
                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Overpass',
                      color: FlutterFlowTheme.of(context).iconGray,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).grayLines,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).grayLines,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
              ),
              style: FlutterFlowTheme.of(context).subtitle2,
              maxLines: 3,
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              final commentsCreateData = createCommentsRecordData(
                user: currentUserReference,
                text: textController2!.text,
                title: textController1!.text,
                code: widget.code!.reference,
                rating: ratingBarValue,
              );
              await CommentsRecord.collection.doc().set(commentsCreateData);
              context.pop();
            },
            text: 'Submit Rating',
            icon: FaIcon(
              FontAwesomeIcons.toiletPaper,
            ),
            options: FFButtonOptions(
              width: 270,
              height: 50,
              color: FlutterFlowTheme.of(context).primaryColor,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Overpass',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              elevation: 2,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPottyWidget extends StatefulWidget {
  const AddPottyWidget({Key? key}) : super(key: key);

  @override
  _AddPottyWidgetState createState() => _AddPottyWidgetState();
}

class _AddPottyWidgetState extends State<AddPottyWidget> {
  String? dropDownValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).white,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).darkBG,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Add Potty',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Potty Name',
                          labelStyle: FlutterFlowTheme.of(context)
                              .title3
                              .override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context).iconGray,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                          hintText: 'Potty Name...',
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
                        ),
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.of(context).darkBG,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context).iconGray,
                                fontSize: 15,
                              ),
                          hintText: 'Inside the Walmart, in the back...',
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
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.of(context).darkBG,
                              fontSize: 15,
                            ),
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    TextFormField(
                      controller: textController3,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Potty Code',
                        hintText: 'Potty Code',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
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
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    FlutterFlowDropDown<String>(
                      options: ['Unisex', 'Male', 'Female'],
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                      hintText: 'Please select...',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).white,
                        boxShadow: [
                          BoxShadow(
                            color: FlutterFlowTheme.of(context).grayLines,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 30),
                            child: FlutterFlowPlacePicker(
                              iOSGoogleMapsApiKey:
                                  'AIzaSyB8o39vUYmT_Oj0VCsdnMkh0dlo3jawa1w',
                              androidGoogleMapsApiKey:
                                  'AIzaSyDHd9sA-mSADSzQIMqrQ_SvO2I6IURPIuk',
                              webGoogleMapsApiKey:
                                  'AIzaSyAaogvOwhhORVVTeM-CaiMMHPWKTRDsC2U',
                              onSelect: (place) async {
                                setState(() => placePickerValue = place);
                              },
                              defaultText: 'Set Location',
                              icon: Icon(
                                Icons.place,
                                color: FlutterFlowTheme.of(context).iconGray,
                                size: 24,
                              ),
                              buttonOptions: FFButtonOptions(
                                width: 240,
                                height: 50,
                                color: FlutterFlowTheme.of(context).background,
                                textStyle: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Overpass',
                                      color:
                                          FlutterFlowTheme.of(context).iconGray,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final codesCreateData = createCodesRecordData(
                            name: textController1!.text,
                            location: placePickerValue.latLng,
                            createdAt: getCurrentTimestamp,
                            user: currentUserReference,
                            description: textController2!.text,
                            likes: 0,
                            gender: dropDownValue,
                            code: textController3!.text,
                          );
                          await CodesRecord.collection
                              .doc()
                              .set(codesCreateData);

                          context.pushNamed('pottyAddedSuccess');
                        },
                        text: 'Add Potty',
                        icon: FaIcon(
                          FontAwesomeIcons.toilet,
                        ),
                        options: FFButtonOptions(
                          width: 290,
                          height: 50,
                          color: Colors.black,
                          textStyle:
                              FlutterFlowTheme.of(context).title3.override(
                                    fontFamily: 'Overpass',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

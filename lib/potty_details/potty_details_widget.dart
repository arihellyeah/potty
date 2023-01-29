import '../backend/backend.dart';
import '../components/rate_potty_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PottyDetailsWidget extends StatefulWidget {
  const PottyDetailsWidget({
    Key? key,
    this.code,
  }) : super(key: key);

  final CodesRecord? code;

  @override
  _PottyDetailsWidgetState createState() => _PottyDetailsWidgetState();
}

class _PottyDetailsWidgetState extends State<PottyDetailsWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommentsRecord>>(
      stream: queryCommentsRecord(
        queryBuilder: (commentsRecord) =>
            commentsRecord.where('code', isEqualTo: widget.code!.reference),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitFadingCircle(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<CommentsRecord> pottyDetailsCommentsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).white,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 100, 15, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.code!.name!,
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Overpass',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          fontSize: 35,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Text(
                                        widget.code!.description!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Overpass',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 25,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.code!.gender!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Overpass',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 40,
                                      ),
                                ),
                                Text(
                                  ':',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Overpass',
                                        color: Color(0xFFE41655),
                                        fontSize: 40,
                                      ),
                                ),
                                Text(
                                  widget.code!.code!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Overpass',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 40,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.96,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final comments =
                                        pottyDetailsCommentsRecordList.toList();
                                    return Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 50),
                                            child: PageView.builder(
                                              controller: pageViewController ??=
                                                  PageController(
                                                      initialPage: min(0,
                                                          comments.length - 1)),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: comments.length,
                                              itemBuilder:
                                                  (context, commentsIndex) {
                                                final commentsItem =
                                                    comments[commentsIndex];
                                                return StreamBuilder<
                                                    UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          commentsItem.user!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              SpinKitFadingCircle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 50,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final ratingUsersRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 100,
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        12,
                                                                        12,
                                                                        12),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .tag_faces_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      ratingUsersRecord
                                                                          .displayName!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Overpass',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      'Overall',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Overpass',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          commentsItem
                                                                              .rating!
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Overpass',
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                        ),
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .toiletPaper,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        12,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  commentsItem
                                                                      .title!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Overpass',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        12,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  commentsItem
                                                                      .text!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Overpass',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: smooth_page_indicator
                                                  .SmoothPageIndicator(
                                                controller:
                                                    pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                0,
                                                                comments.length -
                                                                    1)),
                                                count: comments.length,
                                                axisDirection: Axis.horizontal,
                                                onDotClicked: (i) {
                                                  pageViewController!
                                                      .animateToPage(
                                                    i,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                effect: smooth_page_indicator
                                                    .ExpandingDotsEffect(
                                                  expansionFactor: 2,
                                                  spacing: 8,
                                                  radius: 16,
                                                  dotWidth: 16,
                                                  dotHeight: 16,
                                                  dotColor: Color(0xFF9E9E9E),
                                                  activeDotColor:
                                                      Color(0xFF3F51B5),
                                                  paintStyle:
                                                      PaintingStyle.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x29000000),
                          offset: Offset(0, -1),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height: 584,
                                    child: RatePottyWidget(
                                      code: widget.code,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          text: 'RATE',
                          icon: FaIcon(
                            FontAwesomeIcons.toiletPaper,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Overpass',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context.pop();
                          },
                          text: 'DONE',
                          icon: FaIcon(
                            FontAwesomeIcons.toilet,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context).white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
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
            ],
          ),
        );
      },
    );
  }
}

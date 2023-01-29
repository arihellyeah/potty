import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NearbyPottyWidget extends StatefulWidget {
  const NearbyPottyWidget({
    Key? key,
    this.searchTerm,
  }) : super(key: key);

  final String? searchTerm;

  @override
  _NearbyPottyWidgetState createState() => _NearbyPottyWidgetState();
}

class _NearbyPottyWidgetState extends State<NearbyPottyWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: SpinKitFadingCircle(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 50,
            ),
          ),
        ),
      );
    }

    return FutureBuilder<List<CodesRecord>>(
      future: CodesRecord.search(
        term: '*',
        location: getCurrentUserLocation(
            defaultLocation: LatLng(37.4298229, -122.1735655)),
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
        List<CodesRecord> nearbyPottyCodesRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            elevation: 8,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                context.pushNamed(
                  'addPotty',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.bottomToTop,
                      duration: Duration(milliseconds: 250),
                    ),
                  },
                );
              },
            ),
          ),
          body: Stack(
            children: [
              FlutterFlowGoogleMap(
                controller: googleMapsController,
                onCameraIdle: (latLng) => googleMapsCenter = latLng,
                initialLocation: googleMapsCenter ??=
                    functions.getInitialMapLocation(currentUserLocationValue),
                markers: nearbyPottyCodesRecordList
                    .map(
                      (nearbyPottyCodesRecord) => FlutterFlowMarker(
                        nearbyPottyCodesRecord.reference.path,
                        nearbyPottyCodesRecord.location!,
                        () async {
                          context.pushNamed(
                            'pottyDetails',
                            queryParams: {
                              'code': serializeParam(
                                nearbyPottyCodesRecord,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'code': nearbyPottyCodesRecord,
                            },
                          );
                        },
                      ),
                    )
                    .toList(),
                markerColor: GoogleMarkerColor.violet,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 14,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: false,
                showLocation: true,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerMapOnMarkerTap: true,
              ),
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).white,
                        Color(0x00FFFFFF)
                      ],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.75, -0.92),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
                  child: Text(
                    'Nearby Potty',
                    style: FlutterFlowTheme.of(context).title2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

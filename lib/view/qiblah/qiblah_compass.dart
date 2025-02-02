import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jadwal_sholat_app/theme.dart';
import 'dart:math';

import '../../shared/custom_circular_progress_indicator.dart';
import '../../shared/location_error_widget.dart';

class QiblahCompass extends StatefulWidget {
  const QiblahCompass({Key? key}) : super(key: key);

  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return SafeArea(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 12),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                )),
                            const SizedBox(
                              width: 22,
                            ),
                            Text(
                              "Arah Kiblat",
                              style: kBlackTextStyle.copyWith(
                                  fontSize: 19, fontWeight: semiBold),
                            ),
                          ],
                        ),
                      ),
                      MediaQuery.of(context).size.width < 600
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                height: 60,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Pastikan Smartphone anda diletakan di tempat yang datar",
                                    style:
                                        kGreenTextStyle.copyWith(fontSize: 12),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      Center(child: QiblahCompassWidget()),
                    ],
                  ),
                );

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: "Location service permission denied",
                  callback: _checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: "Location service Denied Forever !",
                  callback: _checkLocationStatus,
                );
              // case GeolocationStatus.unknown:
              //   return LocationErrorWidget(
              //     error: "Unknown Location service error",
              //     callback: _checkLocationStatus,
              //   );
              default:
                return Container();
            }
          } else {
            return LocationErrorWidget(
              error: "Please enable Location service",
              callback: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset('assets/svg/compass.svg');
  final _needleSvg = SvgPicture.asset(
    'assets/svg/needle.svg',
    fit: BoxFit.contain,
    height: 200,
    alignment: Alignment.center,
  );

  QiblahCompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        }
        try {
          final qiblahDirection = snapshot.data!;

          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: (qiblahDirection.direction * (pi / 180) * -1),
                child: _compassSvg,
              ),
              Transform.rotate(
                angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                alignment: Alignment.center,
                child: _needleSvg,
              ),
              Positioned(
                bottom: 8,
                child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
              )
            ],
          );
        } catch (e) {
          return const LoadingIndicator();
        }
      },
    );
  }
}

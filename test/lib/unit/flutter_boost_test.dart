import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_boost/container/container_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('test onMethodCall', () async {
    FlutterBoost.singleton.registerDefaultPageBuilder(
        (String pageName, Map<dynamic,dynamic> params, String _) =>
            Container());
    FlutterBoost.singleton.addContainerObserver(
      (ContainerOperation operation, BoostContainerSettings settings) {},
    );

    FlutterBoost.singleton.addBoostContainerLifeCycleObserver(
      (ContainerLifeCycle state, BoostContainerSettings settings) {},
    );

    FlutterBoost.singleton.addBoostNavigatorObserver(NavigatorObserver());

    try {
      FlutterBoost.singleton.open('url');
    } catch (e) {
      expect(e, isException);
    }
    try {
      FlutterBoost.singleton.close('url');
    } catch (e) {
      expect(e, isNoSuchMethodError);
    }
    try {
      FlutterBoost.singleton.closeCurrent(
        result: <dynamic,dynamic>{},
        exts: <dynamic,dynamic>{},
      );
    } catch (e) {
      expect(e, isNoSuchMethodError);
    }

    try {
      FlutterBoost.singleton.closeByContext(
        null,
        result: <dynamic,dynamic>{},
        exts: <dynamic,dynamic>{},
      );
    } catch (e) {
      expect(e, isNoSuchMethodError);
    }
  });
}

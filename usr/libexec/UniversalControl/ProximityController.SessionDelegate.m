@implementation ProximityController.SessionDelegate

- (void)sessionDidStartRunning:(id)a3
{
  id v4;
  _TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10010359C();

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_100103718(v6, v8);

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1001038E0(v6, v8);

}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v6;
  _TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate *v7;

  v6 = a3;
  v7 = self;
  sub_100103A40((uint64_t)v6, a4);

}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  id v8;
  _TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate *v9;

  v8 = a3;
  v9 = self;
  sub_100103BD4((uint64_t)v8, a4, a5);

}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v6;
  id v7;
  _TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001040C8((uint64_t)v6, v7);

}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_100104754((uint64_t)v10, v11, a5);

}

- (void)session:(id)a3 didUpdateAlgorithmState:(id)a4 forObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100104EFC((uint64_t)v8, v9, v10);

}

- (_TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate)init
{
  sub_10010532C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10000AEBC((uint64_t)self+ OBJC_IVAR____TtCC13EnsembleAgent19ProximityControllerP33_82913D7117FC4A225C49B8B63103147315SessionDelegate_lifecycleManager);
}

@end

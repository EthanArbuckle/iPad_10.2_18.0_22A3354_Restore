@implementation dockDebug

- (_TtC14dockaccessoryd9dockDebug)init
{
  return (_TtC14dockaccessoryd9dockDebug *)sub_1001AA0D4();
}

- (void)setDockAccessoryStateWithInfo:(id)a3 docked:(int64_t)a4 completion:(id)a5
{
  void *v8;
  id v9;
  _TtC14dockaccessoryd9dockDebug *v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_1001ADF1C(a3, a4, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)triggerSystemEventWithInfo:(id)a3 event:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC14dockaccessoryd9dockDebug *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1001AE500(a3, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)getTrackerDebugNotificationsWithCompletion:(id)a3
{
  sub_1001AA544(self, (int)a2, a3, (void (*)(void))sub_1001AE77C);
}

- (void)stopTrackerDebugNotificationsWithCompletion:(id)a3
{
  sub_1001AA544(self, (int)a2, a3, (void (*)(void))sub_1001AEBC8);
}

- (void)dumpTrackerDiagnosticsWithPath:(id)a3 completion:(id)a4
{
  sub_100093848(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1001AEFE0);
}

- (void)dumpTrackerStateWithPath:(id)a3 completion:(id)a4
{
  sub_100093848(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1001AF17C);
}

- (void)searchWithCalibrate:(BOOL)a3 completion:(id)a4
{
  sub_1001AACC8(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_1001AF318);
}

- (void)stopSearchWithCalibrate:(BOOL)a3 completion:(id)a4
{
  sub_1001AACC8(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_1001AF4AC);
}

- (void)setTrackingButtonStateWithState:(int64_t)a3 completion:(id)a4
{
  void (**v6)(void *, uint64_t, _QWORD);
  uint64_t v7;
  unint64_t v8;
  _TtC14dockaccessoryd9dockDebug *v9;

  v6 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(a4);
  v7 = qword_10026BC00;
  v9 = self;
  if (v7 != -1)
    swift_once(&qword_10026BC00, sub_100158DF8);
  v8 = TrackingButtonState.rawValue.getter(a3);
  if ((v8 & 0x8000000000000000) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, 2, 3451, 0);
  }
  else
  {
    if (v8 < 0x100)
    {
      sub_10015F088(v8);
      v6[2](v6, 1, 0);
      _Block_release(v6);

      return;
    }
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20, 2, 3455, 0);
  }
  __break(1u);
}

- (void)connectedClientsWithCompletion:(id)a3
{
  sub_1000AD708(self, (int)a2, a3, (void (*)(void *))sub_1001AF640);
}

- (void)versionsWithCompletion:(id)a3
{
  sub_1000AD708(self, (int)a2, a3, (void (*)(void *))sub_1001AFE00);
}

- (void)migrateDataWithUpdate:(BOOL)a3 completion:(id)a4
{
  void *v5;
  _TtC14dockaccessoryd9dockDebug *v6;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  sub_1001AFF04((uint64_t)v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd9dockDebug_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end

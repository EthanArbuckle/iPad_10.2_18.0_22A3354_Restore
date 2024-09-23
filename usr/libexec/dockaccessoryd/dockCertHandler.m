@implementation dockCertHandler

- (_TtC14dockaccessoryd15dockCertHandler)init
{
  return (_TtC14dockaccessoryd15dockCertHandler *)sub_1000918B4();
}

- (void)unpairAccessoryWithInfo:(id)a3 completion:(id)a4
{
  sub_100094638(self, (int)a2, a3, a4, (void (*)(void *, id, void *))sub_100094F94);
}

- (void)getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  _TtC14dockaccessoryd15dockCertHandler *v13;

  v8 = _Block_copy(a5);
  v10 = sub_10009B64C(0, v9);
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v10, &protocol witness table for String);
  _Block_copy(v8);
  v12 = a3;
  v13 = self;
  sub_1000955F0(a3, v11, v13, (void (**)(const void *, uint64_t, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

- (void)manualFirmwareUpdateWithFilePath:(id)a3 sandboxExt:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  _TtC14dockaccessoryd15dockCertHandler *v15;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  _Block_copy(v8);
  v15 = self;
  sub_1000966D0(v9, v11, v12, v14, (uint64_t)v15, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
}

- (void)haltWithInfo:(id)a3 completion:(id)a4
{
  sub_100093848(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100097AC0);
}

- (void)rebootWithInfo:(id)a3 completion:(id)a4
{
  sub_100093848(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1000984F4);
}

- (void)dumpStateWithCompletion:(id)a3
{
  void (**v4)(void *, NSString, _QWORD);
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  _TtC14dockaccessoryd15dockCertHandler *v8;

  v4 = (void (**)(void *, NSString, _QWORD))_Block_copy(a3);
  v8 = self;
  sub_1001AD7C0();
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  v4[2](v4, v7, 0);
  swift_bridgeObjectRelease(v6);

  _Block_release(v4);
}

- (void)getAccessoryDescriptionWithInfo:(id)a3 completion:(id)a4
{
  sub_100094638(self, (int)a2, a3, a4, (void (*)(void *, id, void *))sub_100098F28);
}

- (void)returnToBaseWithInfo:(id)a3 completion:(id)a4
{
  sub_100094638(self, (int)a2, a3, a4, (void (*)(void *, id, void *))sub_100099FFC);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd15dockCertHandler_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100094F3C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd15dockCertHandler_fwUpdateProxy), *(void **)&self->fwUpdateProxy[OBJC_IVAR____TtC14dockaccessoryd15dockCertHandler_fwUpdateProxy]);

}

@end

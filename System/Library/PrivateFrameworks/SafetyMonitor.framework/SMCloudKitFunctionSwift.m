@implementation SMCloudKitFunctionSwift

- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)initWithServiceName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_24558F7B8();
  return (_TtC13SafetyMonitor23SMCloudKitFunctionSwift *)SMCloudKitFunctionSwift.init(serviceName:)(v3, v4);
}

- (void)requestSafetyCacheRecordFromZone:(id)a3 token:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _TtC13SafetyMonitor23SMCloudKitFunctionSwift *v14;

  v7 = _Block_copy(a5);
  v8 = sub_24558F7B8();
  v10 = v9;
  if (a4)
  {
    v11 = sub_24558F7B8();
    a4 = v12;
  }
  else
  {
    v11 = 0;
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v7;
  v14 = self;
  SMCloudKitFunctionSwift.requestSafetyCacheRecord(fromZone:token:completion:)(v8, v10, v11, (unint64_t)a4, (char *)sub_245534424, v13);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)init
{
  _TtC13SafetyMonitor23SMCloudKitFunctionSwift *result;

  result = (_TtC13SafetyMonitor23SMCloudKitFunctionSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_logger;
  v4 = sub_24558F728();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end

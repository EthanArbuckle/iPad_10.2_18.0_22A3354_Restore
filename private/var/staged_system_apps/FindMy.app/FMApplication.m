@implementation FMApplication

- (id)_extendLaunchTest
{
  return String._bridgeToObjectiveC()();
}

- (_TtC6FindMy13FMApplication)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMApplication();
  return -[FMApplication init](&v3, "init");
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  objc_class *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC6FindMy13FMApplication *v9;
  char v10;

  v4 = (objc_class *)a4;
  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (v4)
LABEL_3:
    v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v9 = self;
  v10 = sub_1003A7508(v6, v8, v4);

  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

@end

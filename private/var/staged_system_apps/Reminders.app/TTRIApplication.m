@implementation TTRIApplication

- (id)_extendLaunchTest
{
  uint64_t v3;
  objc_class *ObjCClassFromMetadata;
  _TtC9Reminders15TTRIApplication *v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v3 = type metadata accessor for PPTLaunch_ExtendedApp();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v5 = self;
  v6 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v8 = v7;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  return v9;
}

- (_TtC9Reminders15TTRIApplication)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIApplication();
  return -[TTRIApplication init](&v3, "init");
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  unint64_t v4;
  _TtC9Reminders15TTRIApplication *v6;
  unint64_t v7;
  _TtC9Reminders15TTRIApplication *v8;
  _TtC9Reminders15TTRIApplication *v9;
  _TtC9Reminders15TTRIApplication *v10;
  unsigned __int8 v11;
  NSString v12;
  Class isa;
  objc_super v15;

  if (!a3)
  {
    if (!a4)
      goto LABEL_12;
    LOBYTE(self) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, &type metadata for Any[8], &protocol witness table for AnyHashable);
    __break(1u);
    goto LABEL_11;
  }
  v6 = self;
  self = (_TtC9Reminders15TTRIApplication *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v4 = v7;
  if (!a4)
  {
LABEL_11:
    if (v4)
      goto LABEL_13;
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v8 = self;
  self = (_TtC9Reminders15TTRIApplication *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, &type metadata for Any[8], &protocol witness table for AnyHashable);
  if (!v4)
    goto LABEL_12;
  v9 = self;
  if (!self)
  {
LABEL_13:
    __break(1u);
    return (char)self;
  }
  v10 = v6;
  if ((sub_1004C2F68((uint64_t)v8, v4, (uint64_t)v10) & 1) != 0)
  {

    swift_bridgeObjectRelease(v4);
    swift_bridgeObjectRelease(v9);
    v11 = 1;
  }
  else
  {
    v12 = String._bridgeToObjectiveC()();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    v15.receiver = v10;
    v15.super_class = (Class)type metadata accessor for TTRIApplication();
    v11 = -[TTRIApplication runTest:options:](&v15, "runTest:options:", v12, isa);

    swift_bridgeObjectRelease(v4);
    swift_bridgeObjectRelease(v9);

  }
  LOBYTE(self) = v11;
  return (char)self;
}

@end

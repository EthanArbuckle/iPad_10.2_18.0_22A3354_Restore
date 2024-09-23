@implementation ICAppIntentsManager

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11MobileNotes19ICAppIntentsManager_dependencyManager));
  v3 = (char *)self + OBJC_IVAR____TtC11MobileNotes19ICAppIntentsManager_loggingConfiguration;
  v4 = *(_QWORD *)&self->dependencyManager[OBJC_IVAR____TtC11MobileNotes19ICAppIntentsManager_loggingConfiguration];
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 3));
  swift_bridgeObjectRelease(v4);
}

+ (void)registerDependencies
{
  objc_class *ObjCClassMetadata;
  uint64_t v3;
  char *v4;
  char *v5;
  id v6;
  objc_super v7;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata(a1);
  type metadata accessor for AppDependencyManager(0);
  v3 = static AppDependencyManager.shared.getter();
  v4 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(_QWORD *)&v4[OBJC_IVAR____TtC11MobileNotes19ICAppIntentsManager_dependencyManager] = v3;
  v5 = &v4[OBJC_IVAR____TtC11MobileNotes19ICAppIntentsManager_loggingConfiguration];
  *(_QWORD *)v5 = 0x6C7070612E6D6F63;
  *((_QWORD *)v5 + 1) = 0xEF7365746F6E2E65;
  *((_QWORD *)v5 + 2) = 1802398028;
  *((_QWORD *)v5 + 3) = 0xE400000000000000;
  v7.receiver = v4;
  v7.super_class = ObjCClassMetadata;
  v6 = objc_msgSendSuper2(&v7, "init");
  ICAppIntentsManager.registerDependencies()();

}

- (void)registerDependencies
{
  _TtC11MobileNotes19ICAppIntentsManager *v2;

  v2 = self;
  ICAppIntentsManager.registerDependencies()();

}

- (_TtC11MobileNotes19ICAppIntentsManager)init
{
  _TtC11MobileNotes19ICAppIntentsManager *result;

  result = (_TtC11MobileNotes19ICAppIntentsManager *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ICAppIntentsManager", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end

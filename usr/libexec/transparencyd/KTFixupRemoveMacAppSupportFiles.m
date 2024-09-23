@implementation KTFixupRemoveMacAppSupportFiles

+ (NSString)fixupName
{
  char *v2;
  NSString v3;
  _BYTE v5[24];

  swift_beginAccess(&qword_1002A08D0, v5, 0, 0);
  v2 = off_1002A08D8;
  swift_bridgeObjectRetain(off_1002A08D8);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

+ (void)setFixupName:(id)a3
{
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  _BYTE v7[24];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_beginAccess(&qword_1002A08D0, v7, 1, 0);
  v6 = off_1002A08D8;
  qword_1002A08D0 = v3;
  off_1002A08D8 = v5;
  swift_bridgeObjectRelease(v6);
}

- (id)doFixupOperation
{
  return 0;
}

- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)initWithDependencies:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd31KTFixupRemoveMacAppSupportFiles_deps) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for KTFixupRemoveMacAppSupportFiles();
  v4 = a3;
  return -[KTFixupRemoveMacAppSupportFiles init](&v6, "init");
}

- (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles)init
{
  _TtC13transparencyd31KTFixupRemoveMacAppSupportFiles *result;

  result = (_TtC13transparencyd31KTFixupRemoveMacAppSupportFiles *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTFixupRemoveMacAppSupportFiles", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

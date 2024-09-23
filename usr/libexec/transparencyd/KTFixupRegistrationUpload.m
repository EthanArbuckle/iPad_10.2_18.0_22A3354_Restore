@implementation KTFixupRegistrationUpload

+ (NSString)fixupName
{
  void *v2;
  NSString v3;
  _BYTE v5[24];

  swift_beginAccess(&qword_1002A0120, v5, 0, 0);
  v2 = off_1002A0128;
  swift_bridgeObjectRetain(off_1002A0128);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

+ (void)setFixupName:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE v7[24];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_beginAccess(&qword_1002A0120, v7, 1, 0);
  v6 = off_1002A0128;
  qword_1002A0120 = v3;
  off_1002A0128 = v5;
  swift_bridgeObjectRelease(v6);
}

- (id)doFixupOperation
{
  _TtC13transparencyd25KTFixupRegistrationUpload *v2;
  id v3;

  v2 = self;
  v3 = sub_1000A4770();

  return v3;
}

- (_TtC13transparencyd25KTFixupRegistrationUpload)initWithDependencies:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd25KTFixupRegistrationUpload_deps) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for KTFixupRegistrationUpload();
  v4 = a3;
  return -[KTFixupRegistrationUpload init](&v6, "init");
}

- (_TtC13transparencyd25KTFixupRegistrationUpload)init
{
  _TtC13transparencyd25KTFixupRegistrationUpload *result;

  result = (_TtC13transparencyd25KTFixupRegistrationUpload *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTFixupRegistrationUpload", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

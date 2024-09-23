@implementation SDAppleIDAccountInfo

- (SFAppleIDAccount)account
{
  return (SFAppleIDAccount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account));
}

- (void)setAccount:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account) = (Class)a3;
  v3 = a3;

}

- (NSDictionary)personInfo
{
  const char *v2;
  Class isa;

  v2 = *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_personInfo);
  sub_100221EDC(0, &qword_1007BD438, SFAppleIDPersonInfo_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (_TtC16DaemoniOSLibrary20SDAppleIDAccountInfo)init
{
  _TtC16DaemoniOSLibrary20SDAppleIDAccountInfo *result;

  result = (_TtC16DaemoniOSLibrary20SDAppleIDAccountInfo *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAppleIDAccountInfo", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_personInfo));
}

@end

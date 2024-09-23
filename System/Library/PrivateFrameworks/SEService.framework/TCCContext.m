@implementation TCCContext

+ (int64_t)checkTCCAccessWithoutLoadingTo:(int64_t)a3 for:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;

  v5 = sub_20A0E080C();
  _s9SEService10TCCContextC28checkTCCAccessWithoutLoading2to3forAC0D0OAC10TCCServiceO_SStFZ_0((uint64_t *)a3, v5, v6);
  v8 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)checkTCCAccessTo:(int64_t)a3 for:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9SEService10TCCContext *v9;
  int64_t v10;

  v6 = sub_20A0E080C();
  v8 = v7;
  v9 = self;
  v10 = TCCContext.checkTCCAccess(to:for:)(a3, v6, v8);

  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC9SEService10TCCContext)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService10TCCContext_hceService) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService10TCCContext_secService) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[TCCContext init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

@implementation JSAccount

- (NSString)description
{
  _TtC11MusicJSCore9JSAccount *v2;
  NSString v3;

  v2 = self;
  JSAccount.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11MusicJSCore9JSAccount *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11MusicJSCore9JSAccount *v8;
  char v9;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v11, v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v8 = self;
  }
  v9 = JSAccount.isEqual(_:)((uint64_t)v11);

  sub_10004FF60((uint64_t)v11, &qword_10119DCC0);
  return v9 & 1;
}

- (int64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  _TtC11MusicJSCore9JSAccount *v4;
  int64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore9JSAccount_uniqueIdentifier);
  v3 = *(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore9JSAccount_uniqueIdentifier];
  v4 = self;
  v5 = String.hashValue.getter(v2, v3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore9JSAccount_delegate, (uint64_t)a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end

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
  _TtC11MusicJSCore9JSAccount *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = JSAccount.isEqual(_:)((uint64_t)v10);

  sub_56024((uint64_t)v10, (uint64_t *)&unk_14AD640);
  return v8 & 1;
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
  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore9JSAccount_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end

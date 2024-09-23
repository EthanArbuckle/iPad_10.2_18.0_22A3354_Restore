@implementation JSMenuSection

- (NSString)description
{
  _TtC11MusicJSCore13JSMenuSection *v2;
  NSString v3;

  v2 = self;
  JSMenuSection.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore13JSMenuSection_items));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSMenuSection_title]);
}

@end

@implementation JSMenuItem

- (NSString)description
{
  _TtC11MusicJSCore10JSMenuItem *v2;
  NSString v3;

  v2 = self;
  JSMenuItem.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore10JSMenuItem_title]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore10JSMenuItem_submenuTitle]);
}

@end

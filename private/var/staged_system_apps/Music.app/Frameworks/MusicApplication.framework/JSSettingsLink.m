@implementation JSSettingsLink

- (NSString)description
{
  _TtC11MusicJSCore14JSSettingsLink *v2;
  NSString v3;

  v2 = self;
  JSSettingsLink.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore14JSSettingsLink_text]);
}

@end

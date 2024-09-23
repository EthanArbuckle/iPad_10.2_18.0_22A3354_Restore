@implementation JSSettingsItemText

- (NSString)description
{
  _TtC11MusicJSCore18JSSettingsItemText *v2;
  NSString v3;

  v2 = self;
  JSSettingsItemText.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore18JSSettingsItemText_text]);
}

@end

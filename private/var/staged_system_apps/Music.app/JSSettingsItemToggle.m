@implementation JSSettingsItemToggle

- (NSString)description
{
  _TtC11MusicJSCore20JSSettingsItemToggle *v2;
  NSString v3;

  v2 = self;
  JSSettingsItemToggle.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSSettingsItemToggle__isToggled;
  v3 = sub_100007E8C((uint64_t *)&unk_1011A3380);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end

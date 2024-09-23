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
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14B7070);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end

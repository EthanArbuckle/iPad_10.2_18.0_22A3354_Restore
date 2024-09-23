@implementation JSSettingsSection

- (NSString)description
{
  _TtC11MusicJSCore17JSSettingsSection *v2;
  NSString v3;

  v2 = self;
  JSContainerDetailLink.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore17JSSettingsSection__items;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1513F90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore17JSSettingsSection__headerText;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14CF9D0);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC11MusicJSCore17JSSettingsSection__footerText, v6);
}

@end

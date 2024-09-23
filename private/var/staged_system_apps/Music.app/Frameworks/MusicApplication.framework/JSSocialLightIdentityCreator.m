@implementation JSSocialLightIdentityCreator

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore28JSSocialLightIdentityCreator__title;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14DD040);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore28JSSocialLightIdentityCreator__subtitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore28JSSocialLightIdentityCreator__inputFieldTitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore28JSSocialLightIdentityCreator__inputFieldSubtitle, v4);
}

@end

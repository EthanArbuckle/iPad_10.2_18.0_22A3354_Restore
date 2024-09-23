@implementation JSSongDetail

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__creditsSections;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1513130);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__title;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14CF9D0);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__subtitle, v6);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__backgroundArtwork;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1510DB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

@end

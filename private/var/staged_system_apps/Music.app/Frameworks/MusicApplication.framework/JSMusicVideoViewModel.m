@implementation JSMusicVideoViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSMusicVideoViewModel__item;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1513268);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore21JSMusicVideoViewModel_containerDetailLink));
}

@end

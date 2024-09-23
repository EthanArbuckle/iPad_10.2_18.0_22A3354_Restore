@implementation JSItemizedTextListViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore27JSItemizedTextListViewModel_delegate);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSItemizedTextListViewModel__items;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512240);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

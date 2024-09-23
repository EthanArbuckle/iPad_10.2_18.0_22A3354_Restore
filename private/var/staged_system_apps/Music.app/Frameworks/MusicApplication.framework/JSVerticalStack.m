@implementation JSVerticalStack

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore15JSVerticalStack_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSVerticalStack__childViewModelKinds;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512DB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

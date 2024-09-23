@implementation JSVerticalStack

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore15JSVerticalStack_delegate, (uint64_t)a2);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSVerticalStack__childViewModelKinds;
  v4 = sub_100007E8C(&qword_1011EAB90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

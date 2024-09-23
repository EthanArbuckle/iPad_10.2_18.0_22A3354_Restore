@implementation JSGrid

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore6JSGrid__sections;
  v4 = sub_100007E8C(&qword_1011EB2A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore6JSGrid_delegate, v5);
}

@end

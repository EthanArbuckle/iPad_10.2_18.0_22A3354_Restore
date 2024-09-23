@implementation JSMenu

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore6JSMenu__sections;
  v4 = sub_100007E8C(&qword_1011E9AD8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end

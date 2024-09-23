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
  v4 = sub_100007E8C(&qword_1011EAF28);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__title;
  v6 = sub_100007E8C(&qword_10119F090);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__subtitle, v6);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__backgroundArtwork;
  v9 = sub_100007E8C(&qword_1011E8D68);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

@end

@implementation JSBiographyViewModel

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSBiographyViewModel__items;
  v3 = sub_100007E8C(&qword_1011E9E38);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end

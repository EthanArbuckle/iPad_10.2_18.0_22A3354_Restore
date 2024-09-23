@implementation JSBarButtonItem

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem_barButtonItemDelegate, (uint64_t)a2);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem__title;
  v4 = sub_100007E8C((uint64_t *)&unk_1011A3370);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem__menu;
  v6 = sub_100007E8C(&qword_1011E8270);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end

@implementation JSSearchLandingViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore24JSSearchLandingViewModel_delegate, (uint64_t)a2);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore24JSSearchLandingViewModel__items;
  v4 = sub_100007E8C(&qword_1011E94E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

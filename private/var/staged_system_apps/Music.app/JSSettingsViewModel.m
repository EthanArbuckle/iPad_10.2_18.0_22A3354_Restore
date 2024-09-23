@implementation JSSettingsViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel_delegate, (uint64_t)a2);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel__sectionsForAuthenticatedState;
  v4 = sub_100007E8C(&qword_1011E82E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel__unauthenticatedSections;
  v6 = sub_100007E8C(&qword_1011E8300);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end

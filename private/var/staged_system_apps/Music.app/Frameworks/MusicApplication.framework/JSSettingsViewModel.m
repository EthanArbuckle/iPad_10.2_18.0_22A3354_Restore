@implementation JSSettingsViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_64880((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel__sectionsForAuthenticatedState;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_15103D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel__unauthenticatedSections;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_15103F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end

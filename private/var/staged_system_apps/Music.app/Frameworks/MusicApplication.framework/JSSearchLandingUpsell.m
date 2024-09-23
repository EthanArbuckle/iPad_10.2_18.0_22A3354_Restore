@implementation JSSearchLandingUpsell

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  char *v12;
  uint64_t v13;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__marketingID;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14DD040);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__headline, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__subtitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__primaryButtonTitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__accessoryButtonTitle, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__tallArtwork;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1510DB0);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__wideArtwork, v7);
  v9 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__tallVideoArtwork;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1510DD8);
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__wideVideoArtwork, v10);
  v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__shouldDisplayCloseButton;
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14B7070);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
}

@end

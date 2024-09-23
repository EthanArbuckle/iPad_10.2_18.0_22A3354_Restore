@implementation JSWhatsNewFeaturedItemViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__title;
  v4 = sub_100007E8C((uint64_t *)&unk_1011A3370);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__subtitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__imageName, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__imageContext;
  v7 = sub_100007E8C(&qword_1011E93F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__additionalDescription;
  v9 = sub_100007E8C(&qword_10119F090);
  v10 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v10((char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__additionalDescriptionLinkTitle, v9);
  v11 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__nativeFeature;
  v12 = sub_100007E8C(&qword_1011E9418);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__imageBundleIdentifier;
  v14 = sub_100007E8C(&qword_1011E9430);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
}

@end

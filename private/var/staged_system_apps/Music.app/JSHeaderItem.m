@implementation JSHeaderItem

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem_headerItemDelegate, (uint64_t)a2);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__subtitle;
  v4 = sub_100007E8C((uint64_t *)&unk_1011A3370);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__supertitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__title, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__titleHeaderStyle;
  v7 = sub_100007E8C(&qword_1011E97A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__videoDetailArtwork;
  v9 = sub_100007E8C(&qword_1011E8D90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__promotionalBackgroundArtwork;
  v11 = sub_100007E8C(&qword_1011E8D68);
  v12 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__promotionalBackgroundArtworkForRegularWidth, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__promotionalThumbnailArtwork, v11);
  v13 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__promotionalLayoutStyle;
  v14 = sub_100007E8C(&qword_1011E97E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__storeItemMetadata;
  v16 = sub_100007E8C(&qword_1011E9800);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__upsellBanner;
  v18 = sub_100007E8C(&qword_1011E9820);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  v19 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__trailingBarButtonItem;
  v20 = sub_100007E8C(&qword_1011E9840);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  v21 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__contextualPlaybackProvidingURL;
  v22 = sub_100007E8C(&qword_1011E9858);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
  v23 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__isContentFavorited;
  v24 = sub_100007E8C((uint64_t *)&unk_1011A3380);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v23, v24);
  v25 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__inlineBubbleTipPlacement;
  v26 = sub_100007E8C(&qword_10119F090);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v25, v26);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem____lazy_storage___unmappedMusicItem, &qword_1011E9878);
  v27 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSHeaderItem__mappedMusicItem;
  v28 = sub_100007E8C(&qword_1011E9890);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v27, v28);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end

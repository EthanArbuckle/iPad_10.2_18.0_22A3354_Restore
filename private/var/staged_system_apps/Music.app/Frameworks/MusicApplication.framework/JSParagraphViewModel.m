@implementation JSParagraphViewModel

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
  void (*v17)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__title;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14DD040);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__text, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__backgroundStyle;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_15148B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__textStyle;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_15148C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__textSize;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_15148E0);
  v12 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__titleSize, v11);
  v13 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__shouldHideDivider;
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14B7070);
  v17 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8);
  v17(v13, v14);
  v17((char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__shouldTruncate, v14);
  v15 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__allowedNumberOfLinesBeforeTruncating;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_14C2320);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v17((char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__displayingEditorialNotes, v14);
}

@end

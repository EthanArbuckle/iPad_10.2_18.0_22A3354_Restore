@implementation CRLImageRepPlaceHolder

- (NSURL)previewItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  _BYTE v14[24];

  v3 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemURL;
  swift_beginAccess(v6, v14, 0, 0);
  sub_1005773FC((uint64_t)v6, (uint64_t)v5);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v10;
}

- (void)setPreviewItemURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8Freeform22CRLImageRepPlaceHolder *v11;
  _BYTE v13[24];

  v5 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemURL;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemURL, v13, 33, 0);
  v11 = self;
  sub_10067E7F4((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);

}

- (NSString)previewItemTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->previewItemTitle[OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemTitle];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->previewItemTitle[OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemTitle]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (_TtC8Freeform22CRLImageRepPlaceHolder)init
{
  _TtC8Freeform22CRLImageRepPlaceHolder *result;

  result = (_TtC8Freeform22CRLImageRepPlaceHolder *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLImageRepPlaceHolder", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemURL, &qword_1013E04D0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previewItemTitle[OBJC_IVAR____TtC8Freeform22CRLImageRepPlaceHolder_previewItemTitle]);

}

@end

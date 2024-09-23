@implementation CRLFileItem

- (NSURL)url
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC8Freeform11CRLFileItem *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1008F1654(v5);

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

- (_TtC8Freeform8CRLAsset)metadataPayload
{
  _TtC8Freeform11CRLFileItem *v2;
  Class v3;

  v2 = self;
  v3 = sub_1008F1888();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (NSString)previewTooltip
{
  uint64_t v2;
  NSString v3;

  sub_1008F3E14();
  if (v2)
  {
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLFileLayout();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLFileRep(0);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLFileEditor();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  _TtC8Freeform11CRLFileItem *v2;
  Class isa;

  v2 = self;
  sub_1008F378C();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8Freeform11CRLFileItem *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  Class isa;
  uint64_t v16;

  v5 = type metadata accessor for UTType(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)(a3);

  v11 = sub_100A2D3DC((uint64_t)v8);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v13 >> 60 == 15)
    return 0;
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1004BE2FC(v11, v13);
  return isa;
}

- (void)updateGeometryToReplaceBoardItem:(id)a3
{
  _QWORD *v4;
  _TtC8Freeform11CRLFileItem *v5;

  v4 = a3;
  v5 = self;
  sub_1008F39D0(v4);

}

- (BOOL)placeHolderDataNeedsDownload
{
  _TtC8Freeform11CRLFileItem *v2;
  Class v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = self;
  v3 = sub_1008F1888();
  v4 = *(_QWORD *)((char *)v3 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24);
  v5 = *(_QWORD *)((char *)v3 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 32);
  sub_1004BB5A4((Class)((char *)v3 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage), v4);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 64))(v4, v5);

  return v6 & 1;
}

- (void).cxx_destruct
{

}

- (BOOL)shouldCacheBackingAssetOnCopy
{
  return 1;
}

@end

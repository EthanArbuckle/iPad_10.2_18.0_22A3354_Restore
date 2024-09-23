@implementation CRLURLItem

- (NSURL)hyperlinkURL
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _UNKNOWN ****v9;
  uint64_t v10;
  _TtC8Freeform10CRLURLItem *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  NSURL *v16;
  void *v17;
  void *v18;
  _BYTE v21[24];

  v3 = type metadata accessor for CRLURLItemAtomicDataStruct(0);
  __chkstk_darwin(v3);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v6);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = *(_UNKNOWN *****)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v9 == &off_1014007D0)
    v10 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v10 = 0;
  swift_beginAccess(v10 + qword_101480208, v21, 32, 0);
  v11 = self;
  swift_retain(v9);
  v12 = sub_1004B804C(&qword_1013EF360);
  CRRegister.wrappedValue.getter(v12);
  swift_endAccess(v21);
  swift_release(v9);
  v13 = &v5[*(int *)(v3 + 20)];
  v14 = type metadata accessor for URL(0);
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v15 + 16))(v8, v13, v14);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLURLItemAtomicDataStruct);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v8, 0, 1, v14);

  v17 = 0;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
  {
    URL._bridgeToObjectiveC()(v16);
    v17 = v18;
    (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v8, v14);
  }
  return (NSURL *)v17;
}

- (void)setHyperlinkURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  sub_1004CB800((uint64_t)v6, &qword_1013E04D0);
}

- (NSURL)url
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _UNKNOWN ****v9;
  uint64_t v10;
  _TtC8Freeform10CRLURLItem *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  NSURL *v16;
  void *v17;
  void *v18;
  _BYTE v21[24];

  v3 = type metadata accessor for CRLURLItemAtomicDataStruct(0);
  __chkstk_darwin(v3);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v6);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = *(_UNKNOWN *****)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  if (*v9 == &off_1014007D0)
    v10 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  else
    v10 = 0;
  swift_beginAccess(v10 + qword_101480208, v21, 32, 0);
  v11 = self;
  swift_retain(v9);
  v12 = sub_1004B804C(&qword_1013EF360);
  CRRegister.wrappedValue.getter(v12);
  swift_endAccess(v21);
  swift_release(v9);
  v13 = &v5[*(int *)(v3 + 20)];
  v14 = type metadata accessor for URL(0);
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v15 + 16))(v8, v13, v14);
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLURLItemAtomicDataStruct);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v8, 0, 1, v14);

  v17 = 0;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
  {
    URL._bridgeToObjectiveC()(v16);
    v17 = v18;
    (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v8, v14);
  }
  return (NSURL *)v17;
}

- (_TtC8Freeform8CRLAsset)metadataPayload
{
  _TtC8Freeform10CRLURLItem *v2;
  Class v3;

  v2 = self;
  v3 = sub_100838230();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8Freeform10CRLURLItem *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Class isa;
  uint64_t v25;

  v3 = type metadata accessor for UTType(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v9 = (char *)&v25 - v8;
  v10 = sub_1004B804C((uint64_t *)&unk_1013DFC30);
  v11 = swift_allocObject(v10, 64, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100EF5A10;
  v12 = self;
  v13 = static UTType.url.getter();
  v14 = UTType.identifier.getter(v13);
  v16 = v15;
  v17 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
  v18 = v17(v9, v3);
  *(_QWORD *)(v11 + 32) = v14;
  *(_QWORD *)(v11 + 40) = v16;
  v19 = static UTType.utf8PlainText.getter(v18);
  v20 = UTType.identifier.getter(v19);
  v22 = v21;
  v17(v6, v3);
  *(_QWORD *)(v11 + 48) = v20;
  *(_QWORD *)(v11 + 56) = v22;

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
  _TtC8Freeform10CRLURLItem *v10;
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

  v11 = sub_1008388BC((uint64_t)v8);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  isa = 0;
  if (v13 >> 60 != 15)
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1004BE2FC(v11, v13);
  }
  return isa;
}

- (id)promisedStringForCopy
{
  _TtC8Freeform10CRLURLItem *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100838BE0();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
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
  void *v3;
  _TtC8Freeform10CRLURLItem *v4;
  id v5;
  NSString v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v3 = (void *)objc_opt_self(NSBundle);
  v4 = self;
  v5 = objc_msgSend(v3, "mainBundle");
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v7, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v10 = v9;

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLURLLayout();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLURLRep(0);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLURLEditor();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (NSArray)stringContentForSearch
{
  _TtC8Freeform10CRLURLItem *v2;
  Class isa;

  v2 = self;
  sub_10083A7F0();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void).cxx_destruct
{

}

- (_TtC8Freeform10CRLURLItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 url:(id)a5 geometry:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  uint64_t v19;

  v10 = type metadata accessor for URL(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UUID(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = a6;
  return (_TtC8Freeform10CRLURLItem *)sub_10083AC7C((uint64_t)v16, (uint64_t)v15, v12, a6);
}

@end

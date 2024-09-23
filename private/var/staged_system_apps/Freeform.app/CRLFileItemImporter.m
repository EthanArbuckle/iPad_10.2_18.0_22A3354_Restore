@implementation CRLFileItemImporter

+ (NSArray)protected_supportedFileUTTypes
{
  uint64_t v2;
  uint64_t v3;
  Class isa;

  v2 = sub_1004B804C(&qword_1013E7938);
  v3 = *(_QWORD *)(type metadata accessor for UTType(0) - 8);
  *(_OWORD *)(swift_allocObject(v2, ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72), *(unsigned __int8 *)(v3 + 80) | 7)+ 16) = xmmword_100EF5E40;
  static UTType.item.getter();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v14;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  LOBYTE(a3) = sub_10078DF4C((uint64_t)v9, v10, v11);
  v12 = swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, __n128))(v7 + 8))(v9, v6, v12);
  return a3 & 1;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __n128 v17;
  char v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;

  v6 = type metadata accessor for UTType(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1004B804C((uint64_t *)&unk_1013E3620);
  __chkstk_darwin(v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  v16 = a3;
  v17 = swift_bridgeObjectRetain(v15);
  UTType.init(_:)(v13, v15, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
  {
    sub_1004CB800((uint64_t)v12, (uint64_t *)&unk_1013E3620);

    swift_bridgeObjectRelease();
    v18 = 1;
  }
  else
  {
    static UTType.url.getter();
    v19 = UTType.conforms(to:)(v9);
    v20 = *(void (**)(char *, uint64_t))(v7 + 8);
    v20(v9, v6);
    v20(v12, v6);

    swift_bridgeObjectRelease();
    v18 = v19 ^ 1;
  }
  return v18 & 1;
}

- (CRLProgress)progress
{
  return (CRLProgress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter__progress));
}

- (void)cancel
{
  uint64_t v2;
  _TtC8Freeform19CRLFileItemImporter *v3;
  double v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter_importBoardItemTask);
  v3 = self;
  if (v2)
  {
    swift_retain(v2);
    sub_1004B804C(&qword_1013E0210);
    Task.cancel()();
    *(_QWORD *)&v4 = swift_release(v2).n128_u64[0];
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter_fileCoordinator), "cancel", v4);

}

- (void)importBoardItemWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform19CRLFileItemImporter *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10127D390, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10127D3B8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1013F18D0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10127D3E0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10140B7B0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_101405D50, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return (_TtC8Freeform12CRLBoardItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter__boardItem));
}

- (NSError)error
{
  int v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  _BYTE *v6;

  v2 = *((unsigned __int8 *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter__error);
  if (v2 == 3)
  {
    v3 = 0;
  }
  else
  {
    v4 = sub_10078E308();
    v5 = swift_allocError(&type metadata for CRLBoardItemImporterHelperError, v4, 0, 0);
    *v6 = v2;
    v3 = (void *)_convertErrorToNSError(_:)(v5);
    swift_errorRelease(v5);
  }
  return (NSError *)v3;
}

- (unint64_t)embeddedDataLength
{
  return 0;
}

- (unint64_t)uploadDataLength
{
  return 0;
}

- (_TtC8Freeform19CRLFileItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v6 = type metadata accessor for URL(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC8Freeform19CRLFileItemImporter *)sub_10078DB58((uint64_t)v8, a4);
}

- (_TtC8Freeform19CRLFileItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  return (_TtC8Freeform19CRLFileItemImporter *)sub_10078DD1C(a3, a4);
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform19CRLFileItemImporter_importBoardItemTask));

}

@end

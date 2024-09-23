@implementation CRLUSDItemImporter

+ (NSArray)protected_supportedFileUTTypes
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = objc_msgSend((id)objc_opt_self(CRLIngestionTypes), "supported3DFileUTTypes");
  v3 = type metadata accessor for UTType(0);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  LOBYTE(a3) = sub_1008C4D84((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a3 & 1;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  return sub_1001E9750(0x2000000000000uLL);
}

- (CRLProgress)progress
{
  return (CRLProgress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter__progress));
}

- (void)cancel
{
  uint64_t v2;
  _TtC8Freeform18CRLUSDItemImporter *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter_importBoardItemTask);
  if (v2)
  {
    v3 = self;
    swift_retain(v2);
    sub_1004B804C(&qword_1013E0210);
    Task.cancel()();

    swift_release(v2);
  }
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
  _TtC8Freeform18CRLUSDItemImporter *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101285C80, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101285CA8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1013F88B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_101285CD0, 48, 7);
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
                                                                                + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter__boardItem));
}

- (NSError)error
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter__error);
  if (v2)
  {
    swift_errorRetain(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter__error));
    v3 = (void *)_convertErrorToNSError(_:)(v2);
    swift_errorRelease(v2);
  }
  else
  {
    v3 = 0;
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

- (_TtC8Freeform18CRLUSDItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v6 = type metadata accessor for URL(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC8Freeform18CRLUSDItemImporter *)sub_1008C49BC((uint64_t)v8, a4);
}

- (_TtC8Freeform18CRLUSDItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  return (_TtC8Freeform18CRLUSDItemImporter *)sub_1008C4B84(a3, a4);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter_cancellable));

  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter_importBoardItemTask));

  swift_errorRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLUSDItemImporter__error));
}

@end

@implementation CRLURLItemImporter

+ (NSArray)protected_supportedFileUTTypes
{
  uint64_t v2;
  uint64_t v3;
  Class isa;

  v2 = sub_1004B804C(&qword_1013E7938);
  v3 = type metadata accessor for UTType(0);
  *(_OWORD *)(swift_allocObject(v2, ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v3 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) | 7)+ 16) = xmmword_100EF5E40;
  static UTType.url.getter((__n128)xmmword_100EF5E40);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

+ (BOOL)protected_canImportFileAtURL:(id)a3 type:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  LOBYTE(a3) = URL.isFileURL.getter(v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (a3 & 1) == 0;
}

+ (BOOL)protected_canImportFileWithPreinsertionAsset:(id)a3 type:(id)a4
{
  return 0;
}

+ (NSArray)protected_supportedRemoteURLSchemes
{
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

+ (BOOL)protected_canImportFromRemoteURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  char v17;
  uint64_t v19;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = URL.scheme.getter(v9);
  if (v11)
  {
    v13 = v10;
    v14 = v11;
    v15 = objc_msgSend(a1, "protected_supportedRemoteURLSchemes");
    v16 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, &type metadata for String);

    v17 = sub_100C9DD14(v13, v14, v16);
    swift_bridgeObjectRelease();
    v12 = swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v12);
  return v17 & 1;
}

- (CRLProgress)progress
{
  return (CRLProgress *)0;
}

- (BOOL)usesProgressDialog
{
  return 0;
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
  _TtC8Freeform18CRLURLItemImporter *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101283F58, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101283F80, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1013F6E50;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_101283FA8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10140B7B0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_101405D50, (uint64_t)v12);
  swift_release(v14);
}

- (void)cancel
{
  _TtC8Freeform18CRLURLItemImporter *v2;

  v2 = self;
  sub_100892F74();

}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return (_TtC8Freeform12CRLBoardItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform18CRLURLItemImporter__boardItem));
}

- (NSError)error
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLURLItemImporter__error);
  if (v2)
  {
    swift_errorRetain(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLURLItemImporter__error));
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

- (_TtC8Freeform18CRLURLItemImporter)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v6 = type metadata accessor for URL(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC8Freeform18CRLURLItemImporter *)sub_1008932A0((uint64_t)v8, a4);
}

- (_TtC8Freeform18CRLURLItemImporter)initWithData:(id)a3 boardItemFactory:(id)a4
{
  return (_TtC8Freeform18CRLURLItemImporter *)sub_100893418(a3, a4);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLURLItemImporter_importTask));

  swift_errorRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform18CRLURLItemImporter__error));
}

@end

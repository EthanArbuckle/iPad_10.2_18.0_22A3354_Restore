@implementation CRLQAImportFileDocumentPickerDelegate

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform37CRLQAImportFileDocumentPickerDelegate *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100582384(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)documentPickerWasCancelled:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform37CRLQAImportFileDocumentPickerDelegate *v10;
  uint64_t v11;

  v5 = sub_1004B804C(&qword_1013E3AE8);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  swift_storeEnumTagMultiPayload(v7, v5, 0);
  v9 = a3;
  v10 = self;
  sub_100581C70((uint64_t)v7);
  sub_1004CB800((uint64_t)v7, &qword_1013E3AE8);

}

- (_TtC8Freeform37CRLQAImportFileDocumentPickerDelegate)init
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform37CRLQAImportFileDocumentPickerDelegate_result;
  v4 = sub_1004B804C(&qword_1013E3AE8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform37CRLQAImportFileDocumentPickerDelegate_continuation;
  v6 = sub_1004B804C((uint64_t *)&unk_1013E3AF8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLQAImportFileDocumentPickerDelegate(0);
  return -[CRLQAImportFileDocumentPickerDelegate init](&v8, "init");
}

- (void).cxx_destruct
{
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLQAImportFileDocumentPickerDelegate_result, (uint64_t *)&unk_1013E3B10);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLQAImportFileDocumentPickerDelegate_continuation, &qword_1013E3B08);
}

@end

@implementation DOCImportFileController

- (_TtC5Files23DOCImportFileController)init
{
  char *v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files23DOCImportFileController_fileURLsToImport) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files23DOCImportFileController_deferredFileURLImportTimer) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Files23DOCImportFileController_currentImportPicker);
  v3 = (char *)self + OBJC_IVAR____TtC5Files23DOCImportFileController_delegate;
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCImportFileController();
  return -[DOCImportFileController init](&v5, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files23DOCImportFileController_fileURLsToImport));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files23DOCImportFileController_deferredFileURLImportTimer));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files23DOCImportFileController_currentImportPicker);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files23DOCImportFileController_delegate);
}

- (void)documentPicker:(id)a3 didConfirmDocumentsAt:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC5Files23DOCImportFileController *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10048AC70(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)documentPickerDidCancel:(id)a3
{
  id v4;
  _TtC5Files23DOCImportFileController *v5;

  v4 = a3;
  v5 = self;
  sub_10048ADCC((uint64_t)v5);

}

@end

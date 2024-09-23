@implementation ImportExportDataSourceDocumentPickerDelegate

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10001E594(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)documentPickerWasCancelled:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate)init
{
  _TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate *result;

  result = (_TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate *)_swift_stdlib_reportUnimplementedInitializer("Health.ImportExportDataSourceDocumentPickerDelegate", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate_healthStore));
}

@end

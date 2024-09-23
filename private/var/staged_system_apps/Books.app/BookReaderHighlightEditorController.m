@implementation BookReaderHighlightEditorController

- (_TtC5Books35BookReaderHighlightEditorController)init
{
  _TtC5Books35BookReaderHighlightEditorController *result;

  result = (_TtC5Books35BookReaderHighlightEditorController *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderHighlightEditorController", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books35BookReaderHighlightEditorController_annotationProvider);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books35BookReaderHighlightEditorController_annotationProviderService);
  sub_1005D0D20((uint64_t)self + OBJC_IVAR____TtC5Books35BookReaderHighlightEditorController_currentTheme);

}

- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  _TtC5Books35BookReaderHighlightEditorController *v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v10 = self;
  sub_1005D08C4((uint64_t)a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

  swift_bridgeObjectRelease(v9);
}

- (void)didHideAnnotationEditor:(id)a3
{
  _TtC5Books35BookReaderHighlightEditorController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1005D0128(a3);
  swift_unknownObjectRelease(a3);

}

@end

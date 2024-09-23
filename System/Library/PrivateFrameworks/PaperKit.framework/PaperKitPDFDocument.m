@implementation PaperKitPDFDocument

- (Class)pageClass
{
  type metadata accessor for PaperKitPDFPage(0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)annotationSubclassForType:(id)a3
{
  type metadata accessor for CanvasElementPDFAnnotation();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8PaperKit19PaperKitPDFDocument)init
{
  uint64_t v3;
  uint64_t v4;
  _TtC8PaperKit19PaperKitPDFDocument *v5;
  uint64_t v6;
  objc_super v8;

  v3 = MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit19PaperKitPDFDocument_pageProxies) = (Class)MEMORY[0x1E0DEE9D8];
  v4 = OBJC_IVAR____TtC8PaperKit19PaperKitPDFDocument_pdfPageIdMap;
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)specialized Dictionary.init(dictionaryLiteral:)(v3);
  v6 = OBJC_IVAR____TtC8PaperKit19PaperKitPDFDocument_pageIdMap;
  *(Class *)((char *)&v5->super.super.isa + v6) = (Class)specialized Dictionary.init(dictionaryLiteral:)(v3);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for PaperKitPDFDocument();
  return -[PDFDocument init](&v8, sel_init);
}

- (_TtC8PaperKit19PaperKitPDFDocument)initWithURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = type metadata accessor for URL();
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8PaperKit19PaperKitPDFDocument *)PaperKitPDFDocument.init(url:)((uint64_t)v6);
}

- (_TtC8PaperKit19PaperKitPDFDocument)initWithData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  return (_TtC8PaperKit19PaperKitPDFDocument *)PaperKitPDFDocument.init(data:)(v4, v6);
}

- (id)copyWithZone:(void *)a3
{
  _TtC8PaperKit19PaperKitPDFDocument *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  PaperKitPDFDocument.copy(with:)((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (id)pageAtIndex:(int64_t)a3
{
  _TtC8PaperKit19PaperKitPDFDocument *v4;
  PDFPage_optional *v5;
  void *v6;
  void *v7;

  v4 = self;
  PaperKitPDFDocument.page(at:)(v5, a3);
  v7 = v6;

  return v7;
}

- (void)removePageAtIndex:(int64_t)a3
{
  _TtC8PaperKit19PaperKitPDFDocument *v4;

  v4 = self;
  PaperKitPDFDocument.removePage(at:)(a3);

}

- (void)insertPage:(id)a3 atIndex:(int64_t)a4
{
  PDFPage *v6;
  _TtC8PaperKit19PaperKitPDFDocument *v7;

  v6 = (PDFPage *)a3;
  v7 = self;
  PaperKitPDFDocument.insert(_:at:)(v6, a4);

}

- (void)exchangePageAtIndex:(int64_t)a3 withPageAtIndex:(int64_t)a4
{
  _TtC8PaperKit19PaperKitPDFDocument *v6;

  v6 = self;
  PaperKitPDFDocument.exchangePage(at:withPageAt:)(a3, a4);

}

- (BOOL)unlockWithPassword:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8PaperKit19PaperKitPDFDocument *v11;
  void *v12;
  objc_class *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v19;
  objc_super v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PageId?);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = self;
  v12 = (void *)MEMORY[0x1DF0E41AC](v8, v10);
  v13 = (objc_class *)type metadata accessor for PaperKitPDFDocument();
  v20.receiver = v11;
  v20.super_class = v13;
  v14 = -[PDFDocument unlockWithPassword:](&v20, sel_unlockWithPassword_, v12);

  if (v14)
  {
    v15 = type metadata accessor for PageId(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 1, 1, v15);
    v16 = specialized Array.init(repeating:count:)((uint64_t)v7, -[PDFDocument pageCount](v11, sel_pageCount));
    v17 = (uint64_t *)((char *)v11 + OBJC_IVAR____TtC8PaperKit19PaperKitPDFDocument_pageProxies);
    swift_beginAccess();
    *v17 = v16;

    swift_bridgeObjectRelease();
  }
  else
  {

  }
  swift_bridgeObjectRelease();
  return v14;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end

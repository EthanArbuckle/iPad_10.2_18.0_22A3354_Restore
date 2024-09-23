@implementation PaperKitPDFPage

- (id)copyWithZone:(void *)a3
{
  _TtC8PaperKit15PaperKitPDFPage *v4;
  void *v5;
  char *v7[4];

  v4 = self;
  PaperKitPDFPage.copy(with:)((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, (uint64_t)v7[3]);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (NSArray)annotations
{
  _TtC8PaperKit15PaperKitPDFPage *v2;
  Class isa;

  v2 = self;
  PaperKitPDFPage.annotations.getter();

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PDFAnnotation);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (NSString)description
{
  _TtC8PaperKit15PaperKitPDFPage *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = PaperKitPDFPage.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1DF0E41AC](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (char)isCandidateForOCR
{
  _TtC8PaperKit15PaperKitPDFPage *v2;
  char v3;

  v2 = self;
  v3 = PaperKitPDFPage.candidateForOCR.getter();

  return v3;
}

- (void)setCandidateForOCR:(char)a3
{
  uint64_t v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PaperKitPDFPage(0);
  -[PaperKitPDFPage setCandidateForOCR:](&v4, sel_setCandidateForOCR_, v3);
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withOptions:(id)a5
{
  uint64_t v8;
  CGContext *v9;
  _TtC8PaperKit15PaperKitPDFPage *v10;

  if (a5)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v8 = 0;
  v9 = a4;
  v10 = self;
  PaperKitPDFPage.draw(with:in:withOptions:)(a3, a4, v8);

  swift_bridgeObjectRelease();
}

- (Class)annotationSubclassForSubtype:(id)a3
{
  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  type metadata accessor for CanvasElementPDFAnnotation();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8PaperKit15PaperKitPDFPage)init
{
  _QWORD *v3;
  char *v4;
  uint64_t v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_render);
  *v3 = 0;
  v3[1] = 0;
  v4 = (char *)self + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_pageId;
  v5 = type metadata accessor for PageId(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_appearanceStreamAnnotations) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_annotationIDState) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PaperKitPDFPage(0);
  return -[PaperKitPDFPage init](&v7, sel_init);
}

- (_TtC8PaperKit15PaperKitPDFPage)initWithImage:(id)a3 options:(id)a4
{
  type metadata accessor for PDFPageImageInitializationOption(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type PDFPageImageInitializationOption and conformance PDFPageImageInitializationOption, (uint64_t (*)(uint64_t))type metadata accessor for PDFPageImageInitializationOption, (uint64_t)&protocol conformance descriptor for PDFPageImageInitializationOption);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8PaperKit15PaperKitPDFPage *)PaperKitPDFPage.init(image:options:)(a3);
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_render));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_pageId, &demangling cache variable for type metadata for PageId?);
  swift_bridgeObjectRelease();
  outlined consume of PaperKitPDFPage.AnnotationIDState(*(unint64_t *)((char *)&self->super.super.isa
                                                                            + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_annotationIDState));
}

@end

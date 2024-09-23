@implementation TiledDocumentView

- (id)initInScrollView:(id)a3
{
  return TiledDocumentView.init(in:)(a3);
}

- (_TtC8PaperKit17TiledDocumentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized TiledDocumentView.init(coder:)();
}

- (void)didMoveToWindow
{
  _TtC8PaperKit17TiledDocumentView *v2;

  v2 = self;
  TiledDocumentView.didMoveToWindow()();

}

- (id)attachments
{
  _TtC8PaperKit17TiledDocumentView *v2;
  Class isa;

  v2 = self;
  TiledDocumentView.attachments()();

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKAttachment);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6
{
  id v6;
  id result;

  v6 = a3;
  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17TiledDocumentView_currentPaperView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17TiledDocumentView_canvasElementController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17TiledDocumentView_toolPicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17TiledDocumentView_selectionInteractionDelegate));
  swift_bridgeObjectRelease();
}

@end

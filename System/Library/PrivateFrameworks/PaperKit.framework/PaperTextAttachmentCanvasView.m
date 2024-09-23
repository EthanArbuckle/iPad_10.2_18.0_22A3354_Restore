@implementation PaperTextAttachmentCanvasView

- (_TtC8PaperKit29PaperTextAttachmentCanvasView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized PaperTextAttachmentCanvasView.init(coder:)();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;
  __C::CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[PaperTextAttachmentCanvasView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  PaperTextAttachmentCanvasView.updateSubviews(bounds:)(v4);

}

- (_TtC8PaperKit29PaperTextAttachmentCanvasView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit29PaperTextAttachmentCanvasView *result;

  result = (_TtC8PaperKit29PaperTextAttachmentCanvasView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit29PaperTextAttachmentCanvasView_canvasViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29PaperTextAttachmentCanvasView_canvasTiledView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29PaperTextAttachmentCanvasView_attachmentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit29PaperTextAttachmentCanvasView_contentView));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit29PaperTextAttachmentCanvasView_paperURL;
  v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit29PaperTextAttachmentCanvasView_coherenceContextURL, &demangling cache variable for type metadata for URL?);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit29PaperTextAttachmentCanvasView_encryptionDelegate, (uint64_t *)&demangling cache variable for type metadata for EncryptionDelegate?);
}

@end

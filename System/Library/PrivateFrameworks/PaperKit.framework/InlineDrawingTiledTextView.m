@implementation InlineDrawingTiledTextView

- (void)didMoveToWindow
{
  _TtC8PaperKit26InlineDrawingTiledTextView *v2;

  v2 = self;
  InlineDrawingTiledTextView.didMoveToWindow()();

}

- (BOOL)selectionInteraction:(id)a3 canPerformAction:(SEL)a4 withSender:(id)a5 inAttachment:(id)a6
{
  id v8;
  id v9;
  _TtC8PaperKit26InlineDrawingTiledTextView *v10;
  char v11;
  char v12;
  uint64_t v14;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = a6;
  v10 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  specialized InlineDrawingTiledTextView.selectionInteraction(_:canPerformAction:withSender:inAttachment:)();
  v12 = v11;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v12 & 1;
}

- (void)selectionInteractionDidPaste:(id)a3 atPoint:(CGPoint)a4 inAttachment:(id)a5
{
  double y;
  double x;
  _TtC8PaperKit26InlineDrawingTiledTextView *v9;
  _TtC8PaperKit26InlineDrawingTiledTextView *v10;
  _TtC8PaperKit26InlineDrawingTiledTextView *v11;
  _TtC8PaperKit26InlineDrawingTiledTextView *v12;
  id v13;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v9 = (_TtC8PaperKit26InlineDrawingTiledTextView *)a5;
  v10 = self;
  specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
  if (v11)
  {
    v12 = v11;
    specialized InlineDrawingTextAttachmentView.selectionInteractionDidPaste(_:at:in:)(x, y);

    v9 = v10;
    v10 = v12;
  }

}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  uint64_t v11;
  id v12;
  id v13;
  _TtC8PaperKit26InlineDrawingTiledTextView *v14;
  id v15;
  objc_super v17;

  v6 = a6;
  v8 = a4;
  v11 = OBJC_IVAR____TtC8PaperKit26InlineDrawingTiledTextView_inlineDrawingCanvasElementController;
  v12 = objc_allocWithZone((Class)type metadata accessor for InlineDrawingCanvasElementController());
  v13 = a3;
  v14 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = (Class)objc_msgSend(v12, sel_init);

  v17.receiver = v14;
  v17.super_class = (Class)type metadata accessor for InlineDrawingTiledTextView();
  v15 = -[PKTiledView initInScrollView:sixChannelBlending:defaultDrawingClass:readOnly:](&v17, sel_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly_, v13, v8, a5, v6);

  return v15;
}

- (_TtC8PaperKit26InlineDrawingTiledTextView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8PaperKit26InlineDrawingTiledTextView *v8;
  _TtC8PaperKit26InlineDrawingTiledTextView *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC8PaperKit26InlineDrawingTiledTextView_inlineDrawingCanvasElementController;
  v6 = objc_allocWithZone((Class)type metadata accessor for InlineDrawingCanvasElementController());
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for InlineDrawingTiledTextView();
  v9 = -[InlineDrawingTiledTextView initWithCoder:](&v11, sel_initWithCoder_, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26InlineDrawingTiledTextView_inlineDrawingCanvasElementController));
}

@end

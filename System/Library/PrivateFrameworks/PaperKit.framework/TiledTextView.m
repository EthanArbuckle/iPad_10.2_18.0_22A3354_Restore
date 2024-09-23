@implementation TiledTextView

- (void)didMoveToWindow
{
  _TtC8PaperKit13TiledTextView *v2;

  v2 = self;
  TiledTextView.didMoveToWindow()();

}

- (PKLinedPaper)linedPaper
{
  PKLinedPaper *v3;
  _TtC8PaperKit13TiledTextView *v4;
  PKLinedPaper *v5;
  _TtC8PaperKit13TiledTextView *v6;
  PKLinedPaper *v7;
  objc_super v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit13TiledTextView_paperLinedPaper);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for TiledTextView();
    v6 = self;
    v5 = -[PKTiledView linedPaper](&v9, sel_linedPaper);
  }
  v7 = v3;

  return v5;
}

- (void)setLinedPaper:(id)a3
{
  id v4;
  _TtC8PaperKit13TiledTextView *v5;

  v4 = a3;
  v5 = self;
  TiledTextView.linedPaper.setter(v4);

}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6
{
  uint64_t ObjCClassMetadata;
  id v10;
  id v11;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v10 = a3;
  v11 = specialized TiledTextView.init(in:sixChannelBlending:defaultDrawing:readOnly:)((uint64_t)v10, a4, ObjCClassMetadata, a6);

  return v11;
}

- (_TtC8PaperKit13TiledTextView)initWithCoder:(id)a3
{
  return (_TtC8PaperKit13TiledTextView *)TiledTextView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit13TiledTextView_currentPaperView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TiledTextView_paperLinedPaper));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TiledTextView_canvasElementController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TiledTextView_selectionInteractionDelegate));
}

@end

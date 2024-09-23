@implementation LinedPaperView

- (CGAffineTransform)drawingTransform
{
  char *v3;
  __int128 v4;

  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform;
  v4 = *(_OWORD *)((char *)&self->c + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform);
  *(_OWORD *)&retstr->a = *(_OWORD *)((char *)&self->a + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform);
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v3 + 2);
  return self;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;

  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform);
  v4 = *(_OWORD *)&a3->c;
  v5 = *(_OWORD *)&a3->tx;
  *v3 = *(_OWORD *)&a3->a;
  v3[1] = v4;
  v3[2] = v5;
}

- (id)linedPaperLayerLinedPaper:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8PaperKit14LinedPaperView_linedPaper));
}

- (id)linedPaperLayerAttachmentContainerView:(id)a3
{
  return -[LinedPaperView superview](self, sel_superview, a3);
}

- (id)linedPaperLayerTraitCollection:(id)a3
{
  return -[LinedPaperView traitCollection](self, sel_traitCollection, a3);
}

- (_TtC8PaperKit14LinedPaperView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LinedPaperView_linedPaperLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LinedPaperView_linedPaper) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LinedPaperView_drawingTransform);
  *v8 = 0x3FF0000000000000;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = 0x3FF0000000000000;
  v9 = (objc_class *)type metadata accessor for LinedPaperView();
  v8[4] = 0;
  v8[5] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[LinedPaperView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8PaperKit14LinedPaperView)initWithCoder:(id)a3
{
  return (_TtC8PaperKit14LinedPaperView *)LinedPaperView.init(coder:)(a3);
}

- (void).cxx_destruct
{

}

@end

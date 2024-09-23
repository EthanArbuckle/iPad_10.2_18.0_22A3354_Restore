@implementation SignatureStrokeWidthPreview

- (_TtC8PaperKit27SignatureStrokeWidthPreview)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized SignatureStrokeWidthPreview.init(coder:)();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[SignatureStrokeWidthPreview layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthPreview_strokePreview];
  v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = SignatureStrokeWidthPreview.strokePreviewHeightConstant.getter();
  v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (_TtC8PaperKit27SignatureStrokeWidthPreview)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit27SignatureStrokeWidthPreview *result;

  result = (_TtC8PaperKit27SignatureStrokeWidthPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthPreview_strokePreview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27SignatureStrokeWidthPreview_strokeColor));
}

@end

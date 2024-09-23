@implementation TPKTipContentAnnotationView

- (TPKTipContentAnnotationBubbleView)bubbleView
{
  TPKTipContentAnnotationView *v2;
  id v3;

  v2 = self;
  v3 = sub_248A79A60();

  return (TPKTipContentAnnotationBubbleView *)v3;
}

- (void)setBubbleView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView) = (Class)a3;
  v3 = a3;

}

- (unint64_t)arrowDirection
{
  return sub_248A79B28();
}

- (void)setArrowDirection:(unint64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TPKTipContentAnnotationView();
  -[TPKTipContentAnnotationView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TPKTipContentAnnotationView *v7;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  -[TPKTipContentAnnotationView bounds](v7, sel_bounds);
  if (v9 != width || v8 != height)
    *((_BYTE *)&v7->super.super.super.super.super.isa
    + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingViewNeedsReset) = 1;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for TPKTipContentAnnotationView();
  -[TPKTipContentAnnotationView setBounds:](&v11, sel_setBounds_, x, y, width, height);

}

- (TPKTipContentAnnotationView)initWithContentController:(id)a3 tipContent:(id)a4 sourceView:(id)a5
{
  return (TPKTipContentAnnotationView *)TPKTipContentAnnotationView.init(contentController:tipContent:sourceView:)(a3, a4, a5);
}

- (TPKTipContentAnnotationView)initWithContentController:(id)a3 tipContent:(id)a4 sourceBarButtonItem:(id)a5
{
  return (TPKTipContentAnnotationView *)TPKTipContentAnnotationView.init(contentController:tipContent:sourceBarButtonItem:)(a3, a4, a5);
}

- (void)layoutSubviews
{
  TPKTipContentAnnotationView *v2;

  v2 = self;
  sub_248A7A168();

}

- (void)annotationViewNeedsLayout
{
  TPKTipContentAnnotationView *v2;

  v2 = self;
  sub_248A7AB74();

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  TPKTipContentAnnotationView *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v4 = sub_248A9BF68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248A9BF5C();
  v8 = self;
  v9 = sub_248A79A60();
  v10 = objc_msgSend(v9, sel_superview);

  if (v10)
  {
    v11 = sub_248A79A60();
    objc_msgSend(v11, sel_removeFromSuperview);

  }
  sub_248A7A8D4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)deviceOrientationDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  TPKTipContentAnnotationView *v8;
  uint64_t v9;

  v4 = sub_248A9BF68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248A9BF5C();
  v8 = self;
  sub_248A7AB74();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)resetHostingView
{
  id v2;
  id v3;
  id v4;
  TPKTipContentAnnotationView *v5;

  v5 = self;
  v2 = sub_248A79A60();
  v3 = objc_msgSend(v2, sel_superview);

  if (v3)
  {
    v4 = sub_248A79A60();
    objc_msgSend(v4, sel_removeFromSuperview);

  }
  sub_248A7A8D4();

}

- (void)updateContentBackgroundColor:(id)a3
{
  void *v4;
  id v5;
  TPKTipContentAnnotationView *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor) = (Class)a3;
  v5 = a3;
  v6 = self;

  v7 = sub_248A79A60();
  objc_msgSend(v7, sel_setBackgroundColor_, v5);

}

- (TPKTipContentAnnotationView)initWithController:(id)a3 content:(id)a4
{
  return (TPKTipContentAnnotationView *)TPKTipContentAnnotationView.init(controller:content:)(a3, a4);
}

- (TPKTipContentAnnotationView)initWithCoder:(id)a3
{
  return (TPKTipContentAnnotationView *)TPKTipContentAnnotationView.init(coder:)(a3);
}

- (TPKTipContentAnnotationView)initWithReusableTipView:(id)a3
{
  return (TPKTipContentAnnotationView *)sub_248A7B964();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView));
}

@end

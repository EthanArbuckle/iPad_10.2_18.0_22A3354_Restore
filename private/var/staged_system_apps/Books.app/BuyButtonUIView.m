@implementation BuyButtonUIView

- (_TtC5Books15BuyButtonUIView)initWithFrame:(CGRect)a3
{
  return (_TtC5Books15BuyButtonUIView *)sub_1002E8524(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books15BuyButtonUIView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002E8AA0();
}

- (void)layoutSubviews
{
  _TtC5Books15BuyButtonUIView *v2;

  v2 = self;
  sub_1002E8748();

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC5Books15BuyButtonUIView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books15BuyButtonUIView_button);
  v3 = self;
  objc_msgSend(v2, "intrinsicContentSize");
  objc_msgSend(v2, "alignmentRectForFrame:", 0.0, 0.0, v4, v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC5Books15BuyButtonUIView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books15BuyButtonUIView_button);
  v6 = self;
  objc_msgSend(v5, "sizeThatFits:", width, height);
  objc_msgSend(v5, "alignmentRectForFrame:", 0.0, 0.0, v7, v8);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void).cxx_destruct
{

}

@end

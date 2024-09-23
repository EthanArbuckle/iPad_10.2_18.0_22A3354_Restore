@implementation BeatingHeartView

- (_TtC9SeymourUI16BeatingHeartView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI16BeatingHeartView *)sub_22BA657C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI16BeatingHeartView_imageView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[BeatingHeartView sizeThatFits:](self, sel_sizeThatFits_, 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BeatingHeartView();
  v2 = (char *)v4.receiver;
  -[BeatingHeartView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI16BeatingHeartView_imageView];
  objc_msgSend(v3, sel_sizeToFit, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v3, sel_setFrame_, 0.0, 0.0);

}

- (_TtC9SeymourUI16BeatingHeartView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA66B5C();
}

- (void).cxx_destruct
{

  sub_22B355FC4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16BeatingHeartView_state);
}

@end

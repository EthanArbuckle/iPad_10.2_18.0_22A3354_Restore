@implementation SessionIntensityView

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI20SessionIntensityView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20SessionIntensityView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = v4;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  double Width;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionIntensityView();
  v2 = (char *)v5.receiver;
  -[SessionIntensityView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI20SessionIntensityView_label];
  objc_msgSend(v3, sel_sizeToFit, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  Width = CGRectGetWidth(v6);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v3, sel_setFrame_, 0.0, 0.0, Width, CGRectGetHeight(v7));

}

- (_TtC9SeymourUI20SessionIntensityView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B704DA4();
}

- (_TtC9SeymourUI20SessionIntensityView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI20SessionIntensityView *result;

  result = (_TtC9SeymourUI20SessionIntensityView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end

@implementation InstructionsImageView

- (_TtC9SeymourUI21InstructionsImageView)init
{
  return (_TtC9SeymourUI21InstructionsImageView *)sub_22B3753B4();
}

- (_TtC9SeymourUI21InstructionsImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B375924();
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InstructionsImageView();
  v2 = v10.receiver;
  -[InstructionsImageView layoutSubviews](&v10, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v10.receiver, v10.super_class);
  objc_msgSend(v2, sel_bounds);
  v8 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRoundedRect_cornerRadius_, v4, v5, v6, v7, 20.0);
  v9 = objc_msgSend(v8, sel_CGPath);

  objc_msgSend(v3, sel_setShadowPath_, v9);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 410.0;
  v3 = 231.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC9SeymourUI21InstructionsImageView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI21InstructionsImageView *result;

  result = (_TtC9SeymourUI21InstructionsImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end

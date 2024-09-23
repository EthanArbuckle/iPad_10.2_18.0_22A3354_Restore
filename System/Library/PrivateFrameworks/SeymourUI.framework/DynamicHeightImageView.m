@implementation DynamicHeightImageView

- (_TtC9SeymourUI22DynamicHeightImageView)init
{
  return -[DynamicHeightImageView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC9SeymourUI22DynamicHeightImageView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22DynamicHeightImageView *)sub_22BA2819C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22DynamicHeightImageView)initWithCoder:(id)a3
{
  id v4;
  _TtC9SeymourUI22DynamicHeightImageView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI22DynamicHeightImageView_imageViewHeightConstraint) = 0;
  v4 = a3;

  result = (_TtC9SeymourUI22DynamicHeightImageView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI22DynamicHeightImageView *v2;

  v2 = self;
  sub_22BA28328();

}

- (_TtC9SeymourUI22DynamicHeightImageView)initWithImage:(id)a3
{
  id v3;
  _TtC9SeymourUI22DynamicHeightImageView *result;

  v3 = a3;
  result = (_TtC9SeymourUI22DynamicHeightImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI22DynamicHeightImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC9SeymourUI22DynamicHeightImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC9SeymourUI22DynamicHeightImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22DynamicHeightImageView_imageViewHeightConstraint));
}

@end

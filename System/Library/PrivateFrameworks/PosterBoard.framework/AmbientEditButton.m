@implementation AmbientEditButton

- (_TtC11PosterBoard17AmbientEditButton)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard17AmbientEditButton *)sub_1CBB68C48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard17AmbientEditButton)initWithCoder:(id)a3
{
  id v4;
  _TtC11PosterBoard17AmbientEditButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyleCoordinator) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyleItemView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyle) = 0;
  v4 = a3;

  result = (_TtC11PosterBoard17AmbientEditButton *)sub_1CBB82ACC();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[AmbientEditButton intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 50.0;
  v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 10.0;
  v3 = 10.0;
  v4 = 10.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_outerRing));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_innerRing));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyleCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard17AmbientEditButton_contentStyleItemView));
  swift_unknownObjectRelease();
}

@end

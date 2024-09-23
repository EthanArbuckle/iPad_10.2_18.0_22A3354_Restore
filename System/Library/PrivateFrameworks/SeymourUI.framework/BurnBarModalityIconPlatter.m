@implementation BurnBarModalityIconPlatter

- (_TtC9SeymourUI26BurnBarModalityIconPlatter)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26BurnBarModalityIconPlatter *)sub_22B6F2EF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26BurnBarModalityIconPlatter)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6F3810();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI26BurnBarModalityIconPlatter *v2;

  v2 = self;
  sub_22B6F343C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26BurnBarModalityIconPlatter_circleLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26BurnBarModalityIconPlatter_circleGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26BurnBarModalityIconPlatter_modalityIconView));
}

@end

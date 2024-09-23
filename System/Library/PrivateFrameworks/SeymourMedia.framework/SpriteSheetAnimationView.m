@implementation SpriteSheetAnimationView

- (void)layoutSubviews
{
  _TtC12SeymourMedia24SpriteSheetAnimationView *v2;

  v2 = self;
  sub_21A1013E8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SpriteSheetAnimationView bounds](self, sel_bounds, a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtC12SeymourMedia24SpriteSheetAnimationView)initWithCoder:(id)a3
{
  _TtC12SeymourMedia24SpriteSheetAnimationView *result;

  result = (_TtC12SeymourMedia24SpriteSheetAnimationView *)sub_21A1AA450();
  __break(1u);
  return result;
}

- (_TtC12SeymourMedia24SpriteSheetAnimationView)initWithFrame:(CGRect)a3
{
  _TtC12SeymourMedia24SpriteSheetAnimationView *result;

  result = (_TtC12SeymourMedia24SpriteSheetAnimationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12SeymourMedia24SpriteSheetAnimationView_spriteImageLayer));
}

@end

@implementation SpriteSheetView

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI15SpriteSheetView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_22B3E62F8();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SpriteSheetView();
  return -[SpriteSheetView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SpriteSheetView();
  v4 = a3;
  v5 = v6.receiver;
  -[SpriteSheetView setTintColor:](&v6, sel_setTintColor_, v4);
  sub_22B3E646C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SpriteSheetView intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI15SpriteSheetView)initWithFrame:(CGRect)a3
{
  _QWORD *v3;
  _TtC9SeymourUI15SpriteSheetView *result;

  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15SpriteSheetView_offsetAnimationKey);
  *v3 = 0xD00000000000001DLL;
  v3[1] = 0x800000022BAD6E50;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15SpriteSheetView_animations) = (Class)MEMORY[0x24BEE4AF8];

  result = (_TtC9SeymourUI15SpriteSheetView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI15SpriteSheetView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9SeymourUI15SpriteSheetView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15SpriteSheetView_offsetAnimationKey);
  *v4 = 0xD00000000000001DLL;
  v4[1] = 0x800000022BAD6E50;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15SpriteSheetView_animations) = (Class)MEMORY[0x24BEE4AF8];
  v5 = a3;

  result = (_TtC9SeymourUI15SpriteSheetView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end

@implementation IndefiniteSpinnerView

- (_TtC9SeymourUI21IndefiniteSpinnerView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC9SeymourUI21IndefiniteSpinnerView *result;

  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_layout) = xmmword_22BA98C80;
  v5 = OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_spinnerLayer;
  v6 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_isAnimating) = 0;
  v8 = OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_rotationAnimation;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)sub_22B2F782C();

  result = (_TtC9SeymourUI21IndefiniteSpinnerView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI21IndefiniteSpinnerView *v2;

  v2 = self;
  sub_22B2F7C34();

}

- (void)tintColorDidChange
{
  _TtC9SeymourUI21IndefiniteSpinnerView *v2;

  v2 = self;
  sub_22B2F7EB4();

}

- (_TtC9SeymourUI21IndefiniteSpinnerView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI21IndefiniteSpinnerView *result;

  result = (_TtC9SeymourUI21IndefiniteSpinnerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_spinnerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_rotationAnimation));
}

@end

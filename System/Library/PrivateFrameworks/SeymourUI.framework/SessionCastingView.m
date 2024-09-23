@implementation SessionCastingView

- (_TtC9SeymourUI18SessionCastingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6A3DA0();
}

- (void)exitButtonTapped
{
  sub_22B6A3BD8((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_onExitButtonTapped);
}

- (void)airplayButtonTapped
{
  sub_22B6A3BD8((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_onAirplayButtonTapped);
}

- (void)playButtonTapped
{
  _TtC9SeymourUI18SessionCastingView *v2;

  v2 = self;
  sub_22B28B3C4();

}

- (_TtC9SeymourUI18SessionCastingView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI18SessionCastingView *result;

  result = (_TtC9SeymourUI18SessionCastingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionCastingView_exitControlItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionCastingView_airplayControlItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionCastingView_playControlItem));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionCastingView_castingStackView));
}

@end

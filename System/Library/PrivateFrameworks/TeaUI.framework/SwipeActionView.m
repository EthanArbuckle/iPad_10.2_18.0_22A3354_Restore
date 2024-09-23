@implementation SwipeActionView

- (_TtC5TeaUI15SwipeActionView)initWithFrame:(CGRect)a3
{
  sub_1B15966CC();
}

- (_TtC5TeaUI15SwipeActionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B15967A0();
}

- (void)layoutSubviews
{
  _TtC5TeaUI15SwipeActionView *v2;

  v2 = self;
  sub_1B159686C();

}

- (void).cxx_destruct
{
  void *v3;
  id v4;

  v3 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5TeaUI15SwipeActionView_swipeAction);
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI15SwipeActionView_swipeAction);
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29();

}

@end

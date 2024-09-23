@implementation SwipeActionAnimationDelegate

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6;
  _TtC5TeaUI28SwipeActionAnimationDelegate *v7;

  v6 = a3;
  v7 = self;
  sub_1B151234C((uint64_t)v7, a4);

}

- (_TtC5TeaUI28SwipeActionAnimationDelegate)init
{
  sub_1B15123EC();
}

- (void).cxx_destruct
{
  sub_1B1512558((uint64_t)self + OBJC_IVAR____TtC5TeaUI28SwipeActionAnimationDelegate_swipeState);
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI28SwipeActionAnimationDelegate_completion));
}

@end

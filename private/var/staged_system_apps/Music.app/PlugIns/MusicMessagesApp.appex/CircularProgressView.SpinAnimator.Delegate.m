@implementation CircularProgressView.SpinAnimator.Delegate

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (*v4)(id);
  uint64_t v6;
  id v7;
  _TtCCC11MusicCoreUI20CircularProgressViewP33_2327D9925563EEC9FF3A63D4DED4721D12SpinAnimator8Delegate *v8;

  v4 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCCC11MusicCoreUI20CircularProgressViewP33_2327D9925563EEC9FF3A63D4DED4721D12SpinAnimator8Delegate_onAnimationDidStop);
  if (v4)
  {
    v6 = *(_QWORD *)&self->onAnimationDidStop[OBJC_IVAR____TtCCC11MusicCoreUI20CircularProgressViewP33_2327D9925563EEC9FF3A63D4DED4721D12SpinAnimator8Delegate_onAnimationDidStop];
    v7 = a3;
    v8 = self;
    sub_10000DCE8((uint64_t)v4, v6);
    v4(v7);
    sub_10000DCF8((uint64_t)v4, v6);

  }
}

- (_TtCCC11MusicCoreUI20CircularProgressViewP33_2327D9925563EEC9FF3A63D4DED4721D12SpinAnimator8Delegate)init
{
  _TtCCC11MusicCoreUI20CircularProgressViewP33_2327D9925563EEC9FF3A63D4DED4721D12SpinAnimator8Delegate *result;

  result = (_TtCCC11MusicCoreUI20CircularProgressViewP33_2327D9925563EEC9FF3A63D4DED4721D12SpinAnimator8Delegate *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.Delegate", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCCC11MusicCoreUI20CircularProgressViewP33_2327D9925563EEC9FF3A63D4DED4721D12SpinAnimator8Delegate_onAnimationDidStop), *(_QWORD *)&self->onAnimationDidStop[OBJC_IVAR____TtCCC11MusicCoreUI20CircularProgressViewP33_2327D9925563EEC9FF3A63D4DED4721D12SpinAnimator8Delegate_onAnimationDidStop]);
}

@end

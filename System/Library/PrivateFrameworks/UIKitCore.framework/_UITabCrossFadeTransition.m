@implementation _UITabCrossFadeTransition

- (_UITabCrossFadeTransition)initWithBackgroundColor:(id)a3
{
  id v5;
  objc_super v7;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____UITabCrossFadeTransition_wasPreempted) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UITabCrossFadeTransition_backgroundColor) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITabCrossFadeTransition;
  v5 = a3;
  return -[_UITabCrossFadeTransition init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

}

- (int64_t)_navigationBarTransitionVariant
{
  return 1;
}

- (BOOL)_shouldCrossFadeBottomBars
{
  return 1;
}

- (double)transitionDuration:(id)a3
{
  _UITabCrossFadeTransition *v5;
  double v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_185718200((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)animateTransition:(id)a3
{
  _UITabCrossFadeTransition *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_185717090(a3);
  swift_unknownObjectRelease();

}

- (void)animationEnded:(BOOL)a3
{
  _UITabCrossFadeTransition *v3;

  v3 = self;
  sub_185718C8C();

}

- (BOOL)shouldPreemptWithContext:(id)a3
{
  return 1;
}

- (id)preemptWithContext:(id)a3
{
  _UITabCrossFadeTransition *v5;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____UITabCrossFadeTransition_wasPreempted) = 1;
  swift_unknownObjectRetain();
  v5 = self;
  objc_msgSend(a3, sel_completeTransition_, 1);
  swift_unknownObjectRelease();

  return 0;
}

- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4
{
  _UITabCrossFadeTransition *v5;
  uint64_t v6;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = self;
  sub_186507B1C();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v6);
}

- (_UITabCrossFadeTransition)init
{
  _UITabCrossFadeTransition *result;

  result = (_UITabCrossFadeTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

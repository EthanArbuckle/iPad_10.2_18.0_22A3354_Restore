@implementation _UIKeyboardSubstitutePadPresentationController

- (void)presentationTransitionWillBegin
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController *v2;

  v2 = self;
  sub_18571D190();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController *v3;

  v3 = self;
  sub_18571B894(2, 0);

}

- (void)dismissalTransitionWillBegin
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController *v2;

  v2 = self;
  sub_18571B894(3, 1);
  *(Class *)((char *)&v2->super.super.super.isa
           + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1943_UIKeyboardSubstitutePresentationController_keyboardSuppressionAssertion) = 0;

  swift_unknownObjectRelease();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController *v3;

  v3 = self;
  sub_18571B894(3, 0);

}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_18571D340(self, (uint64_t)a2, (double (*)(void))sub_18571D39C);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  sub_18571D9C8(self, a3.width, a3.height, (uint64_t)a2, (uint64_t)a4, (void (*)(uint64_t, double, double))sub_18571D4D0);
}

- (int)overrideTextEffectsVisibilityLevelForTransitionView:(id)a3
{
  return 9;
}

- (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController *)sub_18571EEA0((uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (void).cxx_destruct
{
  sub_18563E558((uint64_t)self+ OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController_dimmingViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController_dimmingView));
}

- (double)transitionDuration:(id)a3
{
  return 0.8;
}

- (void)animateTransition:(id)a3
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1946_UIKeyboardSubstitutePadPresentationController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_18571DB4C(a3);
  swift_unknownObjectRelease();

}

@end

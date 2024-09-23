@implementation _UIKeyboardSubstitutePhonePresentationController

- (void)presentationTransitionWillBegin
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *v2;

  v2 = self;
  sub_18571BFE8();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *v3;

  v3 = self;
  sub_18571EC1C();

}

- (void)dismissalTransitionWillBegin
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *v2;

  v2 = self;
  sub_18571C334();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *v3;

  v3 = self;
  sub_18571ECE8();

}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_18571D340(self, (uint64_t)a2, sub_18571C540);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  sub_18571D9C8(self, a3.width, a3.height, (uint64_t)a2, (uint64_t)a4, (void (*)(uint64_t, double, double))sub_18571C670);
}

- (void)handlePan:(id)a3
{
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *v4;
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186507B1C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_18571CCB8();

  sub_1855BDE94((uint64_t)v6);
}

- (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController *)sub_18571ED8C((uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController_grabberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKitP33_0B439A980771A6A339CDA4EB17012E1948_UIKeyboardSubstitutePhonePresentationController_grabberPanGestureRecognizer));
}

@end

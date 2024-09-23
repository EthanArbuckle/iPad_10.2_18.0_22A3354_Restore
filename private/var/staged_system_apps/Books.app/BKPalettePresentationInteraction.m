@implementation BKPalettePresentationInteraction

- (BKPalettePresentationInteraction)init
{
  return (BKPalettePresentationInteraction *)sub_10001B9F8();
}

- (BKPalettePresentationInteractionDelegate)delegate
{
  return (BKPalettePresentationInteractionDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___BKPalettePresentationInteraction_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKPalettePresentationInteraction_delegate, a3);
}

- (BKPalettePresentationTransitioning)transitioningDelegate
{
  return (BKPalettePresentationTransitioning *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___BKPalettePresentationInteraction_transitioningDelegate);
}

- (void)setTransitioningDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___BKPalettePresentationInteraction_transitioningDelegate, a3);
}

- (UIView)view
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BKPalettePresentationInteraction_view);
  swift_beginAccess((char *)self + OBJC_IVAR___BKPalettePresentationInteraction_view, v4, 0, 0);
  return (UIView *)*v2;
}

- (void)setView:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BKPalettePresentationInteraction_view);
  swift_beginAccess((char *)self + OBJC_IVAR___BKPalettePresentationInteraction_view, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  BKPalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)3
    && !*(Class *)((char *)&v5->super.isa + OBJC_IVAR___BKPalettePresentationInteraction_animationController))
  {
    sub_10030AEA8(0, 0);
  }

}

- (void)panGestureRecognized:(id)a3
{
  id v4;
  BKPalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)1
    && !*(Class *)((char *)&v5->super.isa + OBJC_IVAR___BKPalettePresentationInteraction_animationController))
  {
    sub_10030AEA8(0, 0);
  }

}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKPalettePresentationInteraction_delegate);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKPalettePresentationInteraction_transitioningDelegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BKPalettePresentationInteraction_presentedViewController);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___BKPalettePresentationInteraction_animationController));
}

- (void)willMoveToView:(id)a3
{
  id v5;
  BKPalettePresentationInteraction *v6;
  BKPalettePresentationInteraction *v7;
  UIView_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  PalettePresentationInteraction.willMove(to:)(v8);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  BKPalettePresentationInteraction *v6;
  BKPalettePresentationInteraction *v7;
  UIView_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  PalettePresentationInteraction.didMove(to:)(v8);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  BKPalettePresentationInteraction *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = _s5Books30PalettePresentationInteractionC17gestureRecognizer_33shouldRecognizeSimultaneouslyWithSbSo09UIGestureF0C_AGtF_0((uint64_t)v6);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BKPalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = PalettePresentationInteraction.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  uint64_t v7;
  BKPalettePresentationInteraction *v8;
  BKPalettePresentationInteraction *v9;
  objc_class *v10;
  objc_super v12;

  v7 = objc_opt_self(BKBasePresentingViewController);
  v8 = (BKPalettePresentationInteraction *)swift_dynamicCastObjCClass(a3, v7);
  if (v8)
  {
    v9 = v8;
    v10 = (objc_class *)type metadata accessor for AssetSheetPresentationController();
    v12.receiver = objc_allocWithZone(v10);
    v12.super_class = v10;
    v8 = -[BKPalettePresentationInteraction initWithPresentedViewController:presentingViewController:](&v12, "initWithPresentedViewController:presentingViewController:", v9, a4);
  }
  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKPalettePresentationInteraction *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10030BEF8(v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  BKPalettePresentationInteraction *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = PalettePresentationInteraction.animationController(forDismissed:)(v4);

  return v6;
}

@end

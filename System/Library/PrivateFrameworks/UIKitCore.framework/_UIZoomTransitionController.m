@implementation _UIZoomTransitionController

- (_UIZoomViewControllerTransition)clientTransition
{
  return (_UIZoomViewControllerTransition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____UIZoomTransitionController_clientTransition));
}

- (void)setClientTransition:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_clientTransition);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_clientTransition) = (Class)a3;
  v3 = a3;

}

- (BOOL)isZoomingIn
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_isZoomingIn);
}

- (void)setIsZoomingIn:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_isZoomingIn) = a3;
  (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_toolbarTransitionController))[OBJC_IVAR____TtC5UIKit34_UIZoomToolbarTransitionController_isZoomingIn] = a3;
}

- (BOOL)isForNavigation
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_isForNavigation);
}

- (void)setIsForNavigation:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_isForNavigation) = a3;
}

- (UIViewController)owningViewController
{
  return (UIViewController *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____UIZoomTransitionController_owningViewController, a2);
}

- (void)setOwningViewController:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_UIDismissInteraction)dismissInteraction
{
  return (_UIDismissInteraction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____UIZoomTransitionController_dismissInteraction));
}

- (void)setDismissInteraction:(id)a3
{
  id v4;
  _UIZoomTransitionController *v5;

  v4 = a3;
  v5 = self;
  sub_18559D4D0(v4);

}

- (_UIZoomTransitionController)init
{
  return (_UIZoomTransitionController *)sub_18559D5A8();
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();

}

- (void)startInteractiveTransition:(id)a3
{
  _UIZoomTransitionController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_18559D99C((char *)a3);
  swift_unknownObjectRelease();

}

- (BOOL)wantsInteractiveStart
{
  _UIZoomTransitionController *v2;
  _UIDismissInteraction *v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = -[_UIZoomTransitionController dismissInteraction](v2, sel_dismissInteraction);
  v4 = -[_UIDismissInteraction isActive](v3, sel_isActive);

  return v4;
}

- (double)transitionDuration:(id)a3
{
  _UIZoomTransitionController *v4;
  double v5;
  double v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1855A52E4();
  v6 = v5;
  swift_unknownObjectRelease();

  return v6;
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id result;

  result = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_shimPropertyAnimator);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (int64_t)_navigationBarTransitionVariant
{
  _UIZoomTransitionController *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1855A18F8();

  return v3;
}

- (UIView)_navigationBarTransitionOverlay
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____UIZoomTransitionController_transitionOverlayView));
}

- (BOOL)_shouldCrossFadeBottomBars
{
  return 1;
}

- (BOOL)_shouldAnimateBottomBarVisibility
{
  void *v2;
  _UIZoomTransitionController *v3;
  unsigned __int8 v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_activeTransitionContext);
  if (v2)
  {
    v3 = self;
    swift_unknownObjectRetain();
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      v4 = objc_msgSend(v2, sel_isInteractive);

      swift_unknownObjectRelease();
      return v4 ^ 1;
    }

    swift_unknownObjectRelease();
  }
  return 0;
}

- (id)_navigationToolbarTransitionControllerForContext:(id)a3
{
  _UIZoomTransitionController *v5;
  void *v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1855A1A00(a3);
  swift_unknownObjectRelease();

  return v6;
}

- (BOOL)prefersPreemptionEnabledForPresentations
{
  return 1;
}

- (BOOL)shouldPreemptWithContext:(id)a3
{
  _UIZoomTransitionController *v4;
  char v5;

  objc_opt_self();
  swift_unknownObjectRetain();
  v4 = self;
  if ((+[UIView _fluidZoomTransitionsEnabled]() & 1) != 0
    || +[UIView _uip_fluidPresentationTransitionsEnabled]())
  {
    v5 = 1;
  }
  else
  {
    v5 = *((_BYTE *)&v4->super.isa + OBJC_IVAR____UIZoomTransitionController_isPreempting);
  }
  swift_unknownObjectRelease();

  return v5;
}

- (id)preemptWithContext:(id)a3
{
  _UIZoomTransitionController *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  __int128 v13;
  uint64_t v14;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1855A1B58(a3, &v13);
  swift_unknownObjectRelease();

  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_0Tm(&v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)sub_186507FB4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v11;
}

- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4
{
  _UIZoomTransitionController *v5;
  uint64_t v6;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = self;
  sub_186507B1C();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v6);
}

- (void)prepareToAnimateKeyboard:(id)a3
{
  _UIZoomTransitionController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1855A1F04((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (void)completeKeyboard:(id)a3
{
  _UIZoomTransitionController *v5;
  id v6;
  id v7;

  if (a3)
  {
    swift_unknownObjectRetain_n();
    v5 = self;
    v6 = objc_msgSend(a3, sel_fromKeyboard);
    objc_msgSend(v6, sel_removeFromSuperview);

    v7 = objc_msgSend(a3, sel_toKeyboard);
    objc_msgSend(v7, sel_removeFromSuperview);

    swift_unknownObjectRelease_n();
  }
}

- (double)hysteresisForInteraction:(id)a3
{
  double result;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____UIZoomTransitionController_activeTransitionContext))
    return 0.0;
  objc_msgSend((id)objc_opt_self(), sel__defaultHysteresis);
  return result;
}

- (BOOL)dismissInteraction:(id)a3 shouldBeginWithAxis:(unint64_t)a4 location:(CGPoint)a5 velocity:(CGPoint)a6 proposal:(BOOL)a7
{
  double y;
  double x;
  double v10;
  double v11;
  id v14;
  _UIZoomTransitionController *v15;
  char v16;

  y = a6.y;
  x = a6.x;
  v10 = a5.y;
  v11 = a5.x;
  v14 = a3;
  v15 = self;
  v16 = sub_1855A2138(v14, a4, a7, v11, v10, x, y);

  return v16 & 1;
}

- (void)dismissInteraction:(id)a3 didBeginAtLocation:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  id v6;
  _UIZoomTransitionController *v7;

  v6 = a3;
  v7 = self;
  sub_1855A5408();

}

- (id)trackingViewForInteraction:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____UIZoomTransitionController_morphAnimation)
                                                 + OBJC_IVAR____UIMagicMorphAnimation_morphView));
}

- (void)dismissInteraction:(id)a3 didIssueUpdate:(id)a4
{
  id v6;
  id v7;
  _UIZoomTransitionController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1855A5AE0(v7);

}

- (void)dismissInteraction:(id)a3 didDismissWithVelocity:(CGPoint)a4
{
  id v5;
  _UIZoomTransitionController *v6;

  v5 = a3;
  v6 = self;
  sub_1855A5E54();

}

- (void)dismissInteraction:(id)a3 didCancelWithVelocity:(CGPoint)a4 originalPosition:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  _UIZoomTransitionController *v9;

  y = a5.y;
  x = a5.x;
  v8 = a3;
  v9 = self;
  sub_1855A6230(x, y);

}

@end

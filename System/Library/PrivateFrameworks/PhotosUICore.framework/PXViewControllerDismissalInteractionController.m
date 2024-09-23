@implementation PXViewControllerDismissalInteractionController

- (PXViewControllerDismissalInteractionController)initWithViewController:(id)a3
{
  id v3;
  PXViewControllerDismissalInteractionController *v4;

  v3 = a3;
  v4 = (PXViewControllerDismissalInteractionController *)sub_1A70A72CC();

  return v4;
}

- (void)viewControllerViewWillLayoutSubviews
{
  PXViewControllerDismissalInteractionController *v2;

  v2 = self;
  sub_1A70A4C88();
  sub_1A70A56DC();

}

- (void)containedViewControllerModalStateChanged
{
  PXViewControllerDismissalInteractionController *v2;

  v2 = self;
  sub_1A70A3A84();

}

- (BOOL)swipeDownAllowed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeDownAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setSwipeDownAllowed:(BOOL)a3
{
  PXViewControllerDismissalInteractionController *v4;

  v4 = self;
  sub_1A70A3C54(a3);

}

- (BOOL)swipeUpAllowed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeUpAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setSwipeUpAllowed:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeUpAllowed;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)screenEdgeSwipeAllowed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_screenEdgeSwipeAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setScreenEdgeSwipeAllowed:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_screenEdgeSwipeAllowed;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)wantsChromeVisible
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_wantsChromeVisible;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsChromeVisible:(BOOL)a3
{
  PXViewControllerDismissalInteractionController *v4;

  v4 = self;
  sub_1A70A4248(a3);

}

- (void)dealloc
{
  PXViewControllerDismissalInteractionController *v2;

  v2 = self;
  sub_1A70A486C();
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXViewControllerDismissalInteractionController_delegate);
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_viewControllerTransition));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeUpGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_swipeDownGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_screenEdgePanGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_grabberSwipeDownGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_grabberTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController____lazy_storage___proxy));
  sub_1A67EC074((uint64_t)self + OBJC_IVAR___PXViewControllerDismissalInteractionController____lazy_storage___logger, &qword_1EE8D6838, (void (*)(uint64_t))MEMORY[0x1E0DF2258]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerDismissalInteractionController_currentSwipeDownDismissalController));
  swift_unknownObjectRelease();
  swift_release();
}

- (void)handleSwipeUp:(id)a3
{
  id v4;
  PXViewControllerDismissalInteractionController *v5;

  v4 = a3;
  v5 = self;
  sub_1A70A5A10(v4);

}

- (void)handleSwipeDownOrEdgeSwipe:(id)a3
{
  id v4;
  PXViewControllerDismissalInteractionController *v5;

  v4 = a3;
  v5 = self;
  sub_1A70A5B6C(v4);

}

- (void)handleTapOnGrabAffordance:(id)a3
{
  PXViewControllerDismissalInteractionController *v4;
  PXViewControllerDismissalInteractionController *Strong;
  PXViewControllerDismissalInteractionController *v6;

  v4 = (PXViewControllerDismissalInteractionController *)a3;
  v6 = self;
  if (-[PXViewControllerDismissalInteractionController state](v4, sel_state) == (id)3)
  {
    Strong = (PXViewControllerDismissalInteractionController *)swift_unknownObjectUnownedLoadStrong();
    -[PXViewControllerDismissalInteractionController dismissViewControllerAnimated:completion:](Strong, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v6;
    v6 = Strong;
  }

}

- (PXViewControllerDismissalInteractionController)init
{
  PXViewControllerDismissalInteractionController *result;

  result = (PXViewControllerDismissalInteractionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

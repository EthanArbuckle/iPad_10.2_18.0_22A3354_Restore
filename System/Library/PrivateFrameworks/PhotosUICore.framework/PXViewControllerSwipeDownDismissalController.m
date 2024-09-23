@implementation PXViewControllerSwipeDownDismissalController

- (void)setNeedsUpdate
{
  PXViewControllerSwipeDownDismissalController *v2;

  v2 = self;
  sub_1A6BEC0F0();

}

- (void)updateInitialPlacement
{
  void *v3;
  id v4;
  PXViewControllerSwipeDownDismissalController *v5;

  v3 = (void *)MEMORY[0x1A85CED04]((char *)self + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_viewControllerTransition, a2);
  v5 = self;
  v4 = objc_msgSend(v3, sel_detailItemOriginalPlacement);

  sub_1A6BEC010(v4);
}

- (void)updateSwipeDownTracker
{
  PXViewControllerSwipeDownDismissalController *v2;

  v2 = self;
  sub_1A6BEC3A0();

}

- (void)updateCurrentPlacement
{
  PXViewControllerSwipeDownDismissalController *v2;

  v2 = self;
  sub_1A6BED1D8();

}

- (PXViewControllerSwipeDownDismissalController)init
{
  PXViewControllerSwipeDownDismissalController *result;

  result = (PXViewControllerSwipeDownDismissalController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_initialItemPlacement));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_swipeDownTracker));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_releaseAnimationProgressAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_releaseAnimationDismissalProgressAnimator));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXViewControllerSwipeDownDismissalController_centerOffsetAnimator));

}

@end

@implementation BKSplitViewContentHostingController

- (BKSplitViewContentHostingController)init
{
  BKSplitViewContentHostingController *result;

  result = (BKSplitViewContentHostingController *)_swift_stdlib_reportUnimplementedInitializer("Books.SplitViewContentHostingController", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKSplitViewContentHostingController_viewControllerProvider);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKSplitViewContentHostingController_standardItems));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BKSplitViewContentHostingController_isCreatingContentForNavigationController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKSplitViewContentHostingController_cachedControllers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKSplitViewContentHostingController_cancellables));
  swift_bridgeObjectRelease(*(_QWORD *)&self->viewControllerProvider[OBJC_IVAR___BKSplitViewContentHostingController_selectedIdentifier]);
  v3 = (char *)self + OBJC_IVAR___BKSplitViewContentHostingController__selectedItem;
  v4 = sub_10004CFD4(&qword_1009D33C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___BKSplitViewContentHostingController_userSelectedItemSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___BKSplitViewContentHostingController_accessibilityPopToRootUserSelectedItemSubject));
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___BKSplitViewContentHostingController_rootBarCoordinator);
}

- (BSUIRootBarWrapperViewController)activeRootBarWrapperViewController
{
  return (BSUIRootBarWrapperViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___BKSplitViewContentHostingController_viewController));
}

@end

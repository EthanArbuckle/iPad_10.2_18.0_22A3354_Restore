@implementation ICMoveNavigationController

- (ICMoveViewController)moveViewController
{
  return (ICMoveViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + OBJC_IVAR___ICMoveNavigationController_moveViewController));
}

- (ICMoveNavigationController)initWithViewControllerManager:(id)a3 sourceObjectIds:(id)a4
{
  unint64_t v6;
  uint64_t v7;

  v6 = sub_1001D76F4();
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
  return (ICMoveNavigationController *)sub_1003458CC(a3, v7);
}

- (ICMoveNavigationController)initWithCoder:(id)a3
{
  id v4;
  ICMoveNavigationController *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___ICMoveNavigationController_canAppearAbovePasswordEntryView) = 1;
  v4 = a3;

  result = (ICMoveNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004796E0, "MobileNotes/MoveNavigationController.swift", 42, 2, 28, 0);
  __break(1u);
  return result;
}

- (BOOL)canAppearAbovePasswordEntryView
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  char *v3;
  void (*v4)(_QWORD);
  uint64_t v6;
  id v7;
  ICMoveNavigationController *v8;

  v3 = *(char **)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICMoveNavigationController_moveViewController)
     + OBJC_IVAR___ICMoveViewController_completionHandler;
  v4 = *(void (**)(_QWORD))v3;
  if (*(_QWORD *)v3)
  {
    v6 = *((_QWORD *)v3 + 1);
    v7 = a3;
    v8 = self;
    sub_100166B74((uint64_t)v4, v6);
    v4(0);
    sub_100012C50((uint64_t)v4, v6);

  }
}

- (ICMoveNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  ICMoveNavigationController *result;

  result = (ICMoveNavigationController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.MoveNavigationController", 36, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (ICMoveNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  ICMoveNavigationController *result;

  v3 = a3;
  result = (ICMoveNavigationController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.MoveNavigationController", 36, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (ICMoveNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICMoveNavigationController *result;

  v4 = a4;
  result = (ICMoveNavigationController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.MoveNavigationController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICMoveNavigationController_moveViewController));
}

@end

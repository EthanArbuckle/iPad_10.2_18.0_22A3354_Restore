@implementation RootFlowController

- (void)dismissWrappedControllerFrom:(id)a3
{
  uint64_t Strong;
  id v6;
  id v7;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18RootFlowController_rootViewController);
  if (Strong)
  {
    v7 = (id)Strong;
    v6 = a3;
    swift_retain(self);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

    swift_release(self);
  }
}

@end

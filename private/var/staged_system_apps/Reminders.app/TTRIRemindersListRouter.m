@implementation TTRIRemindersListRouter

- (void)popPresentedViewController
{
  uint64_t Strong;
  void *v4;
  id v5;

  Strong = swift_unknownObjectWeakLoadStrong(self->viewController);
  if (Strong)
  {
    v4 = (void *)Strong;
    swift_retain(self);
    v5 = objc_msgSend(v4, "presentedViewController");

    if (v5)
    {
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
      swift_release(self);

    }
    else
    {
      swift_release(self);
    }
  }
}

@end

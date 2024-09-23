@implementation BKMainContentViewController

- (BSUINavigationController)contentNavigationController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[BKMainContentViewController contentNavigationController](&v3, "contentNavigationController");
}

- (void)setContentNavigationController:(id)a3
{
  id v5;
  BKMainContentViewController *v6;

  v5 = a3;
  v6 = self;
  MainContentViewController.contentNavigationController.setter((char *)a3);

}

- (BKDockableMiniPlayer)miniPlayerViewController
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController];
  swift_beginAccess(&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController], v4, 0, 0);
  return (BKDockableMiniPlayer *)*v2;
}

- (void)setMiniPlayerViewController:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  BKMainContentViewController *v8;
  _BYTE v9[24];

  v5 = (void **)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController];
  swift_beginAccess(&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController], v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_1005347F4(v6);

}

- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures
{
  id v2;
  BSUINavigationController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  v3 = -[BKMainContentViewController contentNavigationController](&v5, "contentNavigationController");

  return (UIViewController *)v3;
}

- (BKMainContentViewController)initWithContentNavigationController:(id)a3
{
  id v4;

  v4 = a3;
  return (BKMainContentViewController *)MainContentViewController.init(contentNavigationController:)(a3);
}

- (void)viewSafeAreaInsetsDidChange
{
  BKMainContentViewController *v2;

  v2 = self;
  MainContentViewController.viewSafeAreaInsetsDidChange()();

}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_toolbarHeightPublisher]);
  sub_100535E84(*(_QWORD *)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_keyboardObserver], *(_QWORD *)&self->toolbarHeightPublisher[OBJC_IVAR___BKMainContentViewController_keyboardObserver], *(_QWORD *)&self->keyboardObserver[OBJC_IVAR___BKMainContentViewController_keyboardObserver], *(_QWORD *)&self->keyboardObserver[OBJC_IVAR___BKMainContentViewController_keyboardObserver + 8]);

}

- (void)dockMiniPlayer:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  BKMainContentViewController *v8;
  _BYTE v9[24];

  v5 = (void **)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController];
  swift_beginAccess(&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController], v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_1005347F4(v6);

}

- (void)undockMiniPlayer
{
  void **v3;
  void *v4;
  BKMainContentViewController *v5;
  _BYTE v6[24];

  v3 = (void **)&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController];
  swift_beginAccess(&self->BSUIRootBarWrapperViewController_opaque[OBJC_IVAR___BKMainContentViewController_miniPlayerViewController], v6, 1, 0);
  v4 = *v3;
  *v3 = 0;
  v5 = self;
  sub_1005347F4(v4);

}

@end

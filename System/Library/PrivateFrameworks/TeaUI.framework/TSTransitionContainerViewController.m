@implementation TSTransitionContainerViewController

- (UIViewController)childViewControllerForStatusBarStyle
{
  id v2;

  TransitionContainerViewController.childForStatusBarStyle.getter();
  return (UIViewController *)v2;
}

- (void)tabBarSplitViewWillChangeDisplayModeToDisplayMode:(int64_t)a3
{
  TSTransitionContainerViewController *v4;

  v4 = self;
  TransitionContainerViewController.tabBarSplitViewWillChangeDisplayMode(to:)((UISplitViewControllerDisplayMode)a3);

}

- (void)tabBarSplitViewDidChangeCollapseStateToCollapseState:(BOOL)a3
{
  TSTransitionContainerViewController *v3;

  v3 = self;
  TransitionContainerViewController.tabBarSplitViewCollapseStateDidChange(to:)(0);

}

- (void)viewWillLayoutSubviews
{
  TSTransitionContainerViewController *v2;

  v2 = self;
  TransitionContainerViewController.viewWillLayoutSubviews()();

}

- (void)viewWillAppear:(BOOL)a3
{
  TSTransitionContainerViewController *v4;

  v4 = self;
  TransitionContainerViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidLoad
{
  TSTransitionContainerViewController *v2;

  v2 = self;
  TransitionContainerViewController.viewDidLoad()();

}

- (TSTransitionContainerViewController)initWithRootViewController:(id)a3 identifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  TSTransitionContainerViewController *result;

  v5 = sub_1B16B9860();
  TransitionContainerViewController.init(rootViewController:identifier:)(a3, v5, v6);
  return result;
}

- (TSTransitionContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B14B30D4();
}

- (NSString)description
{
  TSTransitionContainerViewController *v2;
  void *v3;

  v2 = self;
  TransitionContainerViewController.description.getter();

  v3 = (void *)sub_1B16B983C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (TSTransitionContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  TransitionContainerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TSTransitionContainerViewController_rootViewController));
  sub_1B14B497C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR___TSTransitionContainerViewController_containerIdentifier), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR___TSTransitionContainerViewController_containerIdentifier), *((_BYTE *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR___TSTransitionContainerViewController_containerIdentifier));
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSTransitionContainerViewController_backBarButtonItem);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSTransitionContainerViewController____lazy_storage___sidebarBarButtonItem);
  OUTLINED_FUNCTION_43(OBJC_IVAR___TSTransitionContainerViewController____lazy_storage___doneBarButtonItem);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TSTransitionContainerViewController____lazy_storage___spaceBarButtonItem));
}

- (void)viewDidDisappear:(BOOL)a3
{
  TSTransitionContainerViewController *v4;

  v4 = self;
  TransitionContainerViewController.viewDidDisappear(_:)(a3);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  TSTransitionContainerViewController *v6;

  v6 = self;
  TransitionContainerViewController.setEditing(_:animated:)(a3, a4);

}

- (NSArray)leftBarButtonItems
{
  return (NSArray *)sub_1B14B36C8(self, (uint64_t)a2, (void (*)(void))TransitionContainerViewController.leftBarButtonItems.getter);
}

- (NSArray)rightBarButtonItems
{
  return (NSArray *)sub_1B14B36C8(self, (uint64_t)a2, (void (*)(void))TransitionContainerViewController.rightBarButtonItems.getter);
}

- (BOOL)hidesBottomBarWhenPushed
{
  TSTransitionContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = TransitionContainerViewController.hidesBottomBarWhenPushed.getter();

  return v3 & 1;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)a3
{
  TSTransitionContainerViewController *v3;

  v3 = self;
  TransitionContainerViewController.hidesBottomBarWhenPushed.setter();

}

- (UITabBarItem)tabBarItem
{
  TSTransitionContainerViewController *v2;
  id v3;

  v2 = self;
  v3 = TransitionContainerViewController.tabBarItem.getter();

  return (UITabBarItem *)v3;
}

- (void)setTabBarItem:(id)a3
{
  id v5;
  TSTransitionContainerViewController *v6;

  v5 = a3;
  v6 = self;
  TransitionContainerViewController.tabBarItem.setter(a3);

}

- (void)tabBarSplitViewDidChangeTraitCollectionToTraitCollection:(id)a3
{
  id v4;
  TSTransitionContainerViewController *v5;

  v4 = a3;
  v5 = self;
  TransitionContainerViewController.tabBarSplitViewDidChangeTraitCollection(to:)((UITraitCollection)v5);

}

- (void)handleSidebarWithSender:(id)a3
{
  TSTransitionContainerViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B16BA3AC();
  swift_unknownObjectRelease();
  sub_1B14B3C24();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)handleDismiss
{
  TSTransitionContainerViewController *v2;

  v2 = self;
  sub_1B14B2C80();

}

@end

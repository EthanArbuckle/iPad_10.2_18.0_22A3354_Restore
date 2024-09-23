@implementation BKTransitioningViewController

- (BKTransitioningViewController)initWithContentViewController:(id)a3
{
  id v4;
  BKTransitioningViewController *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKTransitioningViewController;
  v5 = -[BKTransitioningViewController init](&v10, "init");
  if (v5)
  {
    v6 = objc_alloc((Class)UINavigationController);
    if (v4)
      v7 = objc_msgSend(v6, "initWithRootViewController:", v4);
    else
      v7 = objc_msgSend(v6, "initWithNibName:bundle:", 0, 0);
    v8 = v7;
    objc_storeStrong((id *)&v5->_navController, v7);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BKTransitioningViewController;
  -[BKTransitioningViewController viewDidLoad](&v22, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  objc_msgSend(v4, "setToolbarHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  objc_msgSend(v5, "setNavigationBarHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  -[BKTransitioningViewController addChildViewController:](self, "addChildViewController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v18, "addSubview:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  objc_msgSend(v21, "didMoveToParentViewController:", self);

}

- (id)childViewControllerForStatusBarStyle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childViewControllerForStatusBarStyle"));

  return v3;
}

- (id)childViewControllerForStatusBarHidden
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childViewControllerForStatusBarHidden"));

  return v3;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childViewControllerForHomeIndicatorAutoHidden"));

  return v3;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKTransitioningViewController;
  v4 = a3;
  -[BKTransitioningViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, "preferredContentSizeDidChangeForChildContentContainer:", v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[BKTransitioningViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)transitionToContentViewController:(id)a3 withTransition:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100188DD0;
  v12[3] = &unk_1008EC760;
  v12[4] = self;
  v13 = a4;
  v14 = v8;
  v15 = a5;
  v9 = v8;
  v10 = v15;
  v11 = v13;
  -[BKTransitioningViewController im_finishOngoingModalTransitionAnimations:](self, "im_finishOngoingModalTransitionAnimations:", v12);

}

- (UIViewController)contentViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topViewController"));

  return (UIViewController *)v3;
}

- (void)setContentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BKTransitioningViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController contentViewController](self, "contentViewController"));
  -[BKTransitioningViewController setSourceViewController:](self, "setSourceViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
  v8 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  objc_msgSend(v6, "setViewControllers:animated:", v7, 0);
  -[BKTransitioningViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contentViewController"));
}

- (id)transitionCoordinator
{
  void *v3;
  void *v4;
  void *v5;

  if (-[BKTransitioningViewController gettingTransitionCoordinator](self, "gettingTransitionCoordinator"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController parentViewController](self, "parentViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitionCoordinator"));

  }
  else
  {
    -[BKTransitioningViewController setGettingTransitionCoordinator:](self, "setGettingTransitionCoordinator:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController navController](self, "navController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));

    -[BKTransitioningViewController setGettingTransitionCoordinator:](self, "setGettingTransitionCoordinator:", 0);
  }
  return v4;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return -[BKTransitioningViewController transition](self, "transition", a3, a4, a5, a6);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController sourceViewController](self, "sourceViewController"));
  -[BKTransitioningViewController _delegate_willTransitionFromViewController:toViewController:](self, "_delegate_willTransitionFromViewController:toViewController:", v7, v6);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController sourceViewController](self, "sourceViewController"));
  -[BKTransitioningViewController _delegate_didTransitionFromViewController:toViewController:](self, "_delegate_didTransitionFromViewController:toViewController:", v7, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController completion](self, "completion"));
  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController completion](self, "completion"));
    v9[2](v9, 1);

  }
  -[BKTransitioningViewController setCompletion:](self, "setCompletion:", 0);
  -[BKTransitioningViewController setTransition:](self, "setTransition:", 0);
  -[BKTransitioningViewController setSourceViewController:](self, "setSourceViewController:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController wallpaperAssertion](self, "wallpaperAssertion"));
  objc_msgSend(v10, "invalidate");

  -[BKTransitioningViewController setWallpaperAssertion:](self, "setWallpaperAssertion:", 0);
  -[BKTransitioningViewController setTransitioning:](self, "setTransitioning:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController tabBarController](self, "tabBarController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController transitionCoordinator](self, "transitionCoordinator"));
  objc_msgSend(v12, "im_updateTabBarVisibleWithTransitionCoordinator:", v11);

}

- (void)_performTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransition:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init((Class)IMViewControllerOneToOneTransitionContext);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController view](self, "view"));
  objc_msgSend(v14, "setBk_containerView:", v15);

  objc_msgSend(v14, "_setFromViewController:", v13);
  objc_msgSend(v14, "_setToViewController:", v12);

  objc_msgSend(v14, "_setIsAnimated:", 1);
  objc_msgSend(v11, "transitionDuration:", v14);
  objc_msgSend(v14, "_setDuration:");
  objc_msgSend(v14, "_setAnimator:", v11);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001893D4;
  v17[3] = &unk_1008ED5E8;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v14, "_setCompletionHandler:", v17);
  objc_msgSend(v11, "animateTransition:", v14);

}

- (void)_delegate_willTransitionFromViewController:(id)a3 toViewController:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "transitionController:willTransitionFromViewController:toViewController:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController delegate](self, "delegate"));
    objc_msgSend(v9, "transitionController:willTransitionFromViewController:toViewController:", self, v10, v6);

  }
}

- (void)_delegate_didTransitionFromViewController:(id)a3 toViewController:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "transitionController:didTransitionFromViewController:toViewController:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTransitioningViewController delegate](self, "delegate"));
    objc_msgSend(v9, "transitionController:didTransitionFromViewController:toViewController:", self, v10, v6);

  }
}

- (void)im_navigationController:(id)a3 dismissChildViewController:(id)a4 animated:(BOOL)a5
{
  -[BKTransitioningViewController im_dismissAnimated:](self, "im_dismissAnimated:", a5, a4);
}

- (BKTransitioningViewControllerDelegate)delegate
{
  return (BKTransitioningViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (void)setSourceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewController, a3);
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
  objc_storeStrong((id *)&self->_navController, a3);
}

- (UIViewControllerAnimatedTransitioning)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transition, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BUAssertion)wallpaperAssertion
{
  return self->_wallpaperAssertion;
}

- (void)setWallpaperAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperAssertion, a3);
}

- (BOOL)gettingTransitionCoordinator
{
  return self->_gettingTransitionCoordinator;
}

- (void)setGettingTransitionCoordinator:(BOOL)a3
{
  self->_gettingTransitionCoordinator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperAssertion, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

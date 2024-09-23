@implementation CustomContaineePresentationController

- (CustomContaineePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  CustomContaineePresentationController *v8;
  CustomContaineePresentationController *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  double (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CustomContaineePresentationController;
  v8 = -[CustomContaineePresentationController initWithPresentedViewController:presentingViewController:](&v19, "initWithPresentedViewController:presentingViewController:", v6, v7);
  v9 = v8;
  if (v8)
  {
    -[CustomContaineePresentationController setDelegate:](v8, "setDelegate:", v8);
    objc_storeWeak((id *)&v9->_containeeViewController, v6);
    objc_storeWeak((id *)&v9->_containerViewController, v7);
    v9->_containeeViewControllerConformsToCustomPresentationContaineeViewController = objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPresentationContaineeViewController);
    v9->_containerViewControllerSupportsUpdateViewsForCustomPresentationTransition = objc_opt_respondsToSelector(v7, "updateViewsForCustomPresentationTransition") & 1;
    v9->_containerViewControllerSupportsUpdateViewsForCustomDismissalTransition = objc_opt_respondsToSelector(v7, "updateViewsForCustomDismissalTransition") & 1;
    objc_initWeak(&location, v9);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1008CF1D0;
    v16 = &unk_1011DB060;
    objc_copyWeak(&v17, &location);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_UISheetDetent _detentWithContainerViewBlock:](_UISheetDetent, "_detentWithContainerViewBlock:", &v13));
    v20 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1, v13, v14, v15, v16));
    -[CustomContaineePresentationController _setDetents:](v9, "_setDetents:", v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (int64_t)adaptivePresentationStyleForTraitCollection:(id)a3
{
  id v4;
  id WeakRetained;
  unsigned int v6;
  id v7;
  int64_t v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = objc_msgSend(WeakRetained, "allowOnlyStandardStyle");

  v7 = objc_msgSend(v4, "horizontalSizeClass");
  if (v6)
  {
    if (v7 == (id)2 && objc_msgSend(v4, "verticalSizeClass") == (id)1
      || objc_msgSend(v4, "horizontalSizeClass") == (id)2 && objc_msgSend(v4, "verticalSizeClass") == (id)2)
    {
      v8 = 2;
      goto LABEL_13;
    }
LABEL_9:
    v8 = 4;
    goto LABEL_13;
  }
  if (v7 == (id)1 && objc_msgSend(v4, "verticalSizeClass") == (id)2)
    goto LABEL_9;
  if (objc_msgSend(v4, "verticalSizeClass") == (id)1)
    v8 = 5;
  else
    v8 = 2;
LABEL_13:
  self->_presentationStyle = v8;

  return v8;
}

- (void)containerViewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CustomContaineePresentationController;
  -[CustomContaineePresentationController containerViewWillLayoutSubviews](&v12, "containerViewWillLayoutSubviews");
  if (self->_presentationStyle == 4)
  {
    -[CustomContaineePresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CustomContaineePresentationController presentedView](self, "presentedView"));
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  }
}

- (void)presentationTransitionWillBegin
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD *v9;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CustomContaineePresentationController;
  -[CustomContaineePresentationController presentationTransitionWillBegin](&v11, "presentationTransitionWillBegin");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008CF4D4;
  v10[3] = &unk_1011AC860;
  v10[4] = self;
  v3 = objc_retainBlock(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CustomContaineePresentationController presentedViewController](self, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionCoordinator"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CustomContaineePresentationController presentedViewController](self, "presentedViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1008CF538;
    v8[3] = &unk_1011C56F8;
    v9 = v3;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

  }
  else
  {
    ((void (*)(_QWORD *))v3[2])(v3);
  }

}

- (void)dismissalTransitionWillBegin
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD *v9;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CustomContaineePresentationController;
  -[CustomContaineePresentationController dismissalTransitionWillBegin](&v11, "dismissalTransitionWillBegin");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008CF678;
  v10[3] = &unk_1011AC860;
  v10[4] = self;
  v3 = objc_retainBlock(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CustomContaineePresentationController presentedViewController](self, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitionCoordinator"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CustomContaineePresentationController presentedViewController](self, "presentedViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitionCoordinator"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1008CF6E0;
    v8[3] = &unk_1011C56F8;
    v9 = v3;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &stru_1011DB080);

  }
  else
  {
    ((void (*)(_QWORD *))v3[2])(v3);
  }

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CustomContaineePresentationController;
  -[CustomContaineePresentationController dismissalTransitionDidEnd:](&v5, "dismissalTransitionDidEnd:", a3);
  if (!self->_containerContentShown)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "updateViewsForCustomDismissalTransition");

  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[CustomContaineePresentationController dismissContaineeViewController](self, "dismissContaineeViewController", a3);
}

- (void)dismissContaineeViewController
{
  id WeakRetained;

  if (self->_containeeViewControllerConformsToCustomPresentationContaineeViewController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    objc_msgSend(WeakRetained, "dismissCustomPresentationContainee");

  }
}

- (ContaineeViewController)containeeViewController
{
  return (ContaineeViewController *)objc_loadWeakRetained((id *)&self->_containeeViewController);
}

- (void)setContaineeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containeeViewController, a3);
}

- (ContainerViewController)containerViewController
{
  return (ContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (BOOL)containeeViewControllerConformsToCustomPresentationContaineeViewController
{
  return self->_containeeViewControllerConformsToCustomPresentationContaineeViewController;
}

- (void)setContaineeViewControllerConformsToCustomPresentationContaineeViewController:(BOOL)a3
{
  self->_containeeViewControllerConformsToCustomPresentationContaineeViewController = a3;
}

- (BOOL)containerViewControllerSupportsUpdateViewsForCustomPresentationTransition
{
  return self->_containerViewControllerSupportsUpdateViewsForCustomPresentationTransition;
}

- (void)setContainerViewControllerSupportsUpdateViewsForCustomPresentationTransition:(BOOL)a3
{
  self->_containerViewControllerSupportsUpdateViewsForCustomPresentationTransition = a3;
}

- (BOOL)containerViewControllerSupportsUpdateViewsForCustomDismissalTransition
{
  return self->_containerViewControllerSupportsUpdateViewsForCustomDismissalTransition;
}

- (void)setContainerViewControllerSupportsUpdateViewsForCustomDismissalTransition:(BOOL)a3
{
  self->_containerViewControllerSupportsUpdateViewsForCustomDismissalTransition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_containeeViewController);
}

@end

@implementation IMViewController

- (IMViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  IMViewController *v4;
  IMViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMViewController;
  v4 = -[IMViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[IMViewController initCommon](v4, "initCommon");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[IMViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)IMViewController;
  -[IMViewController dealloc](&v3, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMViewController;
  -[IMViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[IMViewController setVisible:](self, "setVisible:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[IMViewController setVisible:](self, "setVisible:", 0);
  v5.receiver = self;
  v5.super_class = (Class)IMViewController;
  -[IMViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)viewDidUnload
{
  objc_super v3;

  -[IMViewController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)IMViewController;
  -[IMViewController viewDidUnload](&v3, "viewDidUnload");
}

- (BOOL)shouldAutorotate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController currentTransition](self, "currentTransition"));

  if (!v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController currentTransition](self, "currentTransition"));
  v5 = objc_msgSend(v4, "shouldAllowInterfaceRotation");

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  BOOL IsIdentity;
  _QWORD v9[5];
  BOOL v10;
  CGAffineTransform v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMViewController;
  -[IMViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&v11, 0, sizeof(v11));
  IsIdentity = CGAffineTransformIsIdentity(&v11);
  if (!IsIdentity)
    self->_rotating = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_29538;
  v9[3] = &unk_28C8B0;
  v10 = !IsIdentity;
  v9[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &stru_28C888, v9);

}

- (void)setTheme:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[IMTheme isEqual:](self->_theme, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_theme, a3);
    v5 = objc_opt_class(IMThemePage);
    v6 = BUDynamicCast(v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[IMViewController setThemePage:](self, "setThemePage:", v7);

    -[IMViewController setNeedsUserInterfaceAppearanceUpdate](self, "setNeedsUserInterfaceAppearanceUpdate");
    -[IMViewController im_notifyThemeDidChange](self, "im_notifyThemeDidChange");
  }

}

- (int64_t)overrideUserInterfaceStyle
{
  int64_t result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMViewController;
  result = -[IMViewController overrideUserInterfaceStyle](&v4, "overrideUserInterfaceStyle");
  if (!result)
    return -[IMThemePage userInterfaceStyle](self->_themePage, "userInterfaceStyle");
  return result;
}

- (BOOL)shouldPerformChildTransition:(id)a3
{
  return 1;
}

- (void)childTransitionDidComplete:(id)a3 finished:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "setParentViewController:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toViewController"));
  objc_msgSend(v6, "didMoveToParentViewController:", self);

  -[IMViewController setCurrentTransition:](self, "setCurrentTransition:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController pendingTransitions](self, "pendingTransitions"));
  objc_msgSend(v7, "removeObject:", v5);

  -[IMViewController processPendingTransitions](self, "processPendingTransitions");
}

- (id)transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6
{
  return -[IMViewController _transitionFromViewController:toViewController:transition:reverse:](self, "_transitionFromViewController:toViewController:transition:reverse:", a3, a4, a5, a6);
}

- (BOOL)definesTransitionContext
{
  return 0;
}

- (id)_transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "copy");
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[IMTransition transition](IMViewControllerTransition, "transition"));
    objc_msgSend(v14, "setAnimated:", 0);
  }
  if (v10 != v11)
  {
    objc_msgSend(v14, "setFromViewController:", v10);
    objc_msgSend(v14, "setToViewController:", v11);
    objc_msgSend(v14, "setParentViewController:", self);
    objc_msgSend(v14, "setReverse:", v6);
    -[IMViewController addTransition:](self, "addTransition:", v14);
  }

  return v14;
}

- (void)addTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController pendingTransitions](self, "pendingTransitions"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[IMViewController setPendingTransitions:](self, "setPendingTransitions:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController pendingTransitions](self, "pendingTransitions"));
  objc_msgSend(v7, "addObject:", v4);

  -[IMViewController processPendingTransitions](self, "processPendingTransitions");
}

- (void)fireTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[IMViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController view](self, "view"));
    objc_msgSend(v4, "setUserInteractionEnabled:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fromViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentViewController"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toViewController"));
  -[IMViewController addChildViewController:](self, "addChildViewController:", v7);

  objc_msgSend(v8, "beginTransition");
}

- (void)processPendingTransitions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController currentTransition](self, "currentTransition"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController pendingTransitions](self, "pendingTransitions"));
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController pendingTransitions](self, "pendingTransitions"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));

      -[IMViewController setCurrentTransition:](self, "setCurrentTransition:", v9);
      -[IMViewController fireTransition:](self, "fireTransition:", v9);

    }
    else if (-[IMViewController isViewLoaded](self, "isViewLoaded"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewController view](self, "view"));
      objc_msgSend(v7, "setUserInteractionEnabled:", 1);

      v8 = objc_opt_class(self);
      if ((objc_opt_respondsToSelector(v8, "attemptRotationToDeviceOrientation") & 1) != 0)
        objc_msgSend((id)objc_opt_class(self), "attemptRotationToDeviceOrientation");
    }
  }
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (IMViewControllerTransition)transitionItem
{
  return self->_transitionItem;
}

- (void)setTransitionItem:(id)a3
{
  objc_storeStrong((id *)&self->_transitionItem, a3);
}

- (NSMutableArray)pendingTransitions
{
  return self->_pendingTransitions;
}

- (void)setPendingTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTransitions, a3);
}

- (IMViewControllerTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransition, a3);
}

- (IMThemePage)themePage
{
  return self->_themePage;
}

- (void)setThemePage:(id)a3
{
  objc_storeStrong((id *)&self->_themePage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themePage, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_pendingTransitions, 0);
  objc_storeStrong((id *)&self->_transitionItem, 0);
  objc_storeStrong((id *)&self->_theme, 0);
}

@end

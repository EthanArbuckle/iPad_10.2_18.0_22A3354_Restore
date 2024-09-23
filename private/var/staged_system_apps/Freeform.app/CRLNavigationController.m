@implementation CRLNavigationController

- (CRLNavigationController)initWithRootViewController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CRLNavigationController *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLNavigationController;
  v11 = -[CRLNavigationController initWithRootViewController:](&v16, "initWithRootViewController:", v4);
  if (v11)
  {
    v12 = sub_100221DDC(v4, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLNextResponderOverrider);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "setNextResponderOverride:", 0);

  }
  return v11;
}

- (id)nextResponder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController nextResponderOverride](self, "nextResponderOverride"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController nextResponderOverride](self, "nextResponderOverride"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLNavigationController;
    v5 = -[CRLNavigationController nextResponder](&v7, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v4;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController topViewController](self, "topViewController"));
  v12 = sub_100221DDC(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLFirstResponderResigning);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v13, "resignFirstResponderForAnyDescendent");
  v17.receiver = self;
  v17.super_class = (Class)CRLNavigationController;
  v14 = -[CRLNavigationController popViewControllerAnimated:](&v17, "popViewControllerAnimated:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLNavigationController;
  -[CRLNavigationController didMoveToParentViewController:](&v7, "didMoveToParentViewController:", a3);
  if (self->_wantsAppearanceUpdateAfterNextMoveToParentVC)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController navigationBar](self, "navigationBar"));
    objc_msgSend(v4, "setTranslucent:", 0);

    -[CRLNavigationController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController view](self, "view"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    self->_wantsAppearanceUpdateAfterNextMoveToParentVC = 0;
  }
}

- (BOOL)crl_optsIntoDoneButtonManagement
{
  return 1;
}

- (BOOL)crl_preserveEditorSelection
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController topViewController](self, "topViewController"));
  v3 = objc_msgSend(v2, "crl_preserveEditorSelection");

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  objc_super v4;

  if (-[CRLNavigationController hasPreferredPartialScreenPresentationStatusBarStyle](self, "hasPreferredPartialScreenPresentationStatusBarStyle"))
  {
    return -[CRLNavigationController preferredPartialScreenPresentationStatusBarStyle](self, "preferredPartialScreenPresentationStatusBarStyle");
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLNavigationController;
  return -[CRLNavigationController preferredStatusBarStyle](&v4, "preferredStatusBarStyle");
}

- (id)childViewControllerForStatusBarHidden
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController viewControllers](self, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return v3;
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)CRLNavigationController;
  -[CRLNavigationController preferredContentSize](&v11, "preferredContentSize");
  v4 = v3;
  v6 = v5;
  -[CRLNavigationController preferredContentHeightOverride](self, "preferredContentHeightOverride");
  if (v7 != 0.0)
  {
    -[CRLNavigationController preferredContentHeightOverride](self, "preferredContentHeightOverride");
    v6 = v8;
  }
  v9 = v4;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (int64_t)preferredPartialScreenPresentationStatusBarStyle
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController preferredPartialScreenPresentationStatusBarStyleNumber](self, "preferredPartialScreenPresentationStatusBarStyleNumber"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (void)setPreferredPartialScreenPresentationStatusBarStyle:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[CRLNavigationController setPreferredPartialScreenPresentationStatusBarStyleNumber:](self, "setPreferredPartialScreenPresentationStatusBarStyleNumber:", v4);

}

- (BOOL)hasPreferredPartialScreenPresentationStatusBarStyle
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController preferredPartialScreenPresentationStatusBarStyleNumber](self, "preferredPartialScreenPresentationStatusBarStyleNumber"));
  v3 = v2 != 0;

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void (**v9)(void);
  objc_super v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNavigationController viewControllers](self, "viewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___CRLDismissBlockPopover))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "onDismiss"));

    if (v8)
    {
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "onDismiss"));
      v9[2]();

      objc_msgSend(v7, "setOnDismiss:", 0);
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)CRLNavigationController;
  -[CRLNavigationController viewDidDisappear:](&v10, "viewDidDisappear:", v3);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLNavigationController;
  v6 = a4;
  -[CRLNavigationController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10034C05C;
  v7[3] = &unk_10123ACD8;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

}

- (UIResponder)nextResponderOverride
{
  return self->_nextResponderOverride;
}

- (void)setNextResponderOverride:(id)a3
{
  objc_storeStrong((id *)&self->_nextResponderOverride, a3);
}

- (BOOL)allowTextInputWhilePresenting
{
  return self->_allowTextInputWhilePresenting;
}

- (void)setAllowTextInputWhilePresenting:(BOOL)a3
{
  self->_allowTextInputWhilePresenting = a3;
}

- (BOOL)wantsAppearanceUpdateAfterNextMoveToParentVC
{
  return self->_wantsAppearanceUpdateAfterNextMoveToParentVC;
}

- (void)setWantsAppearanceUpdateAfterNextMoveToParentVC:(BOOL)a3
{
  self->_wantsAppearanceUpdateAfterNextMoveToParentVC = a3;
}

- (double)preferredContentHeightOverride
{
  return self->_preferredContentHeightOverride;
}

- (void)setPreferredContentHeightOverride:(double)a3
{
  self->_preferredContentHeightOverride = a3;
}

- (NSNumber)preferredPartialScreenPresentationStatusBarStyleNumber
{
  return self->_preferredPartialScreenPresentationStatusBarStyleNumber;
}

- (void)setPreferredPartialScreenPresentationStatusBarStyleNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredPartialScreenPresentationStatusBarStyleNumber, 0);
  objc_storeStrong((id *)&self->_nextResponderOverride, 0);
}

@end

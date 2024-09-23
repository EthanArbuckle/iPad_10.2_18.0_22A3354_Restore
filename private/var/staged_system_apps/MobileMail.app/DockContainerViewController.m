@implementation DockContainerViewController

- (void)_updateDockBackground
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  if (-[DockContainerViewController _isDockedViewFullWidth](self, "_isDockedViewFullWidth")
    || (v22 = (id)objc_claimAutoreleasedReturnValue(-[DockContainerViewController traitCollection](self, "traitCollection")),
        v3 = objc_msgSend(v22, "userInterfaceStyle"),
        v22,
        v3 == (id)2))
  {
    v23 = (id)objc_claimAutoreleasedReturnValue(+[UIColor mailDockViewDarkBackgroundColor](UIColor, "mailDockViewDarkBackgroundColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockView](self, "dockView"));
    objc_msgSend(v4, "setBackgroundColor:", v23);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockShadowView](self, "dockShadowView"));
    if (!v5)
    {
LABEL_6:

      return;
    }
    v24 = v5;
    objc_msgSend(v5, "removeFromSuperview");
    -[DockContainerViewController setDockShadowView:](self, "setDockShadowView:", 0);
LABEL_5:
    v5 = v24;
    goto LABEL_6;
  }
  v25 = (id)objc_claimAutoreleasedReturnValue(+[UIColor mailDockViewLightBackgroundColor](UIColor, "mailDockViewLightBackgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockView](self, "dockView"));
  objc_msgSend(v6, "setBackgroundColor:", v25);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockShadowView](self, "dockShadowView"));
  if (!v7)
  {
    v24 = objc_msgSend(objc_alloc((Class)MUIGradientView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailDockViewShadowGradientColors](UIColor, "mailDockViewShadowGradientColors"));
    objc_msgSend(v24, "setGradientColors:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailDockViewShadowGradientColorLocations](UIColor, "mailDockViewShadowGradientColorLocations"));
    objc_msgSend(v24, "setLocations:", v9);

    objc_msgSend(v24, "setAlpha:", 0.2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockView](self, "dockView"));
    objc_msgSend(v10, "addSubview:", v24);
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 3.0));
    objc_msgSend(v12, "setActive:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widthAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    objc_msgSend(v15, "setActive:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    objc_msgSend(v21, "setActive:", 1);

    -[DockContainerViewController setDockShadowView:](self, "setDockShadowView:", v24);
    goto LABEL_5;
  }
}

- (void)_updateRootViewControllerCornerRadii
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v3 = 0.0;
  if (-[DockContainerViewController _isDockVisible](self, "_isDockVisible")
    && -[DockContainerViewController _isDockedViewFullWidth](self, "_isDockedViewFullWidth"))
  {
    +[SheetMetrics cornerRadius](SheetMetrics, "cornerRadius");
    v3 = v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));

  objc_msgSend(v8, "cornerRadius");
  if (v7 != v3)
    objc_msgSend(v8, "setCornerRadius:", v3);

}

- (BOOL)_isDockedViewFullWidth
{
  DockContainerViewController *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
  void *v13;
  CGRect v15;
  CGRect v16;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  +[SheetMetrics frameForPresentedSheetIn:](SheetMetrics, "frameForPresentedSheetIn:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  Width = CGRectGetWidth(v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](v2, "view"));
  objc_msgSend(v13, "bounds");
  LOBYTE(v2) = Width >= CGRectGetWidth(v16);

  return (char)v2;
}

- (void)_layoutDockedViews
{
  NSObject *v4;
  NSString *v5;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  void *v14;

  if (objc_msgSend(UIApp, "isRunningTest:", CFSTR("launch")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v13 = 138543362;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skip %{public}@ in a test environment", (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    v7 = -[DockContainerViewController dockingTransitionState](self, "dockingTransitionState");
    -[DockContainerViewController _layoutExistingDockedViewsWithIndexOffset:](self, "_layoutExistingDockedViewsWithIndexOffset:", v7 != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews"));
    v9 = objc_msgSend(v8, "count");
    v10 = v9;
    if (v7)
      v11 = -1;
    else
      v11 = 0;
    v12 = v9 != (id)v11;

    if (v12 != -[DockContainerViewController _isDockVisible](self, "_isDockVisible"))
      -[DockContainerViewController _setDockVisible:](self, "_setDockVisible:", v10 != (id)v11);
  }
}

- (DockContainerViewController)initWithPersistence:(id)a3 scene:(id)a4 rootViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  DockContainerViewController *v12;
  DockContainerViewController *v13;
  NSArray *v14;
  NSArray *dockedStates;
  NSMutableDictionary *v16;
  NSMutableDictionary *dockedViews;
  NSMutableArray *v18;
  NSMutableArray *offscreenDockedViews;
  uint64_t v20;
  NSHashTable *presentationControllerDelegateObservers;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DockContainerViewController;
  v12 = -[DockContainerViewController initWithNibName:bundle:](&v23, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_persistence, a3);
    objc_storeWeak((id *)&v13->_scene, v10);
    v14 = (NSArray *)objc_alloc_init((Class)NSArray);
    dockedStates = v13->_dockedStates;
    v13->_dockedStates = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dockedViews = v13->_dockedViews;
    v13->_dockedViews = v16;

    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    offscreenDockedViews = v13->_offscreenDockedViews;
    v13->_offscreenDockedViews = v18;

    objc_storeStrong((id *)&v13->_rootViewController, a5);
    v20 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    presentationControllerDelegateObservers = v13->_presentationControllerDelegateObservers;
    v13->_presentationControllerDelegateObservers = (NSHashTable *)v20;

  }
  return v13;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
  v4 = objc_opt_class(MailSplitViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DockContainerViewController;
    v6 = -[DockContainerViewController childViewControllerForScreenEdgesDeferringSystemGestures](&v9, "childViewControllerForScreenEdgesDeferringSystemGestures");
    v5 = (id)objc_claimAutoreleasedReturnValue(v6);
  }
  v7 = v5;

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)DockContainerViewController;
  -[DockContainerViewController viewDidLoad](&v38, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setOpaque:", 0);
  v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "addSubview:", v5);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 0.0));
  -[DockContainerViewController setDockHeightConstraint:](self, "setDockHeightConstraint:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockHeightConstraint](self, "dockHeightConstraint"));
  objc_msgSend(v8, "setActive:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

  -[DockContainerViewController setDockView:](self, "setDockView:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
  -[DockContainerViewController addChildViewController:](self, "addChildViewController:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
  objc_msgSend(v21, "didMoveToParentViewController:", self);

  objc_msgSend(v3, "addSubview:", v19);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  objc_msgSend(v24, "setActive:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  objc_msgSend(v27, "setActive:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
  objc_msgSend(v30, "setActive:", 1);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  objc_msgSend(v33, "setActive:", 1);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
  objc_msgSend(v34, "setMasksToBounds:", 1);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
  objc_msgSend(v35, "setMaskedCorners:", 12);

  -[DockContainerViewController setView:](self, "setView:", v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController persistence](self, "persistence"));
  objc_msgSend(v36, "registerObserver:", self);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_tiltedTabViewWillBePresented:", CFSTR("kWillShowTiltedTabViewNotification"), 0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DockContainerViewController;
  -[DockContainerViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[DockContainerViewController _layoutDockedViews](self, "_layoutDockedViews");
  -[DockContainerViewController _updateRootViewControllerTraits](self, "_updateRootViewControllerTraits");
  -[DockContainerViewController _updateDockBackground](self, "_updateDockBackground");
  -[DockContainerViewController _updateRootViewControllerCornerRadii](self, "_updateRootViewControllerCornerRadii");
}

- (void)setDockView:(id)a3
{
  objc_storeStrong((id *)&self->_dockView, a3);
}

- (void)setDockHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_dockHeightConstraint, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (NSHashTable)presentationControllerDelegateObservers
{
  return self->_presentationControllerDelegateObservers;
}

- (DockContainerPersistence)persistence
{
  return self->_persistence;
}

- (int64_t)dockingTransitionState
{
  return self->_dockingTransitionState;
}

- (NSArray)dockedStates
{
  return self->_dockedStates;
}

- (UIView)dockView
{
  return self->_dockView;
}

- (MUIGradientView)dockShadowView
{
  return self->_dockShadowView;
}

- (NSLayoutConstraint)dockHeightConstraint
{
  return self->_dockHeightConstraint;
}

- (void)dockContainerPersistence:(id)a3 observer:(id)a4 updatedDockedStates:(id)a5
{
  DockContainerViewController *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;

  v12 = a3;
  v8 = (DockContainerViewController *)a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
  v11 = objc_msgSend(v10, "isEqualToArray:", v9);

  if ((v11 & 1) == 0)
  {
    if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    {
      objc_msgSend(v12, "migrateDockContainerDraftsToWindowsIfNeeded:", v9);
      objc_msgSend(v12, "removeObserver:", self);
    }
    else
    {
      -[DockContainerViewController setDockedStates:](self, "setDockedStates:", v9);
      if (v8 == self)
        -[DockContainerViewController _handlePersistenceChangeFromSelf](v8, "_handlePersistenceChangeFromSelf");
      else
        -[DockContainerViewController _handlePersistenceChangeFromAnotherObserver](self, "_handlePersistenceChangeFromAnotherObserver");
    }
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)addPresentationControllerDelegateObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentationControllerDelegateObservers](self, "presentationControllerDelegateObservers"));
  objc_msgSend(v4, "addObject:", v5);

}

- (void)_updateRootViewControllerTraits
{
  void *v3;
  id v4;

  if (-[DockContainerViewController _isDockVisible](self, "_isDockVisible")
    || -[DockContainerViewController dockingTransitionState](self, "dockingTransitionState"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceLevel:](UITraitCollection, "traitCollectionWithUserInterfaceLevel:", 1));
  }
  else
  {
    v4 = 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
  -[DockContainerViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v4, v3);

}

- (BOOL)_isDockVisible
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockHeightConstraint](self, "dockHeightConstraint"));
  objc_msgSend(v2, "constant");
  v4 = v3 > 0.0;

  return v4;
}

+ (NSArray)menuCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v2 = (void *)qword_1005A9B38;
  if (!qword_1005A9B38)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("m"), 0x100000, "_commandMPressed:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_nonRepeatableKeyCommand"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v4, 3));
    v9 = v5;
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    v7 = (void *)qword_1005A9B38;
    qword_1005A9B38 = v6;

    v2 = (void *)qword_1005A9B38;
  }
  return (NSArray *)v2;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C04C;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9B30 != -1)
    dispatch_once(&qword_1005A9B30, block);
  return (id)qword_1005A9B28;
}

- (void)removePresentationControllerDelegateObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentationControllerDelegateObservers](self, "presentationControllerDelegateObservers"));
  objc_msgSend(v4, "removeObject:", v5);

}

- (UIViewController)activeViewController
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentedViewController](self, "presentedViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentedViewController](self, "presentedViewController"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeTiltedTabViewController](self, "activeTiltedTabViewController"));

    if (v5)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeTiltedTabViewController](self, "activeTiltedTabViewController"));
    else
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
  }
  return (UIViewController *)v4;
}

- (BOOL)isExposeModeActivated
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeTiltedTabViewController](self, "activeTiltedTabViewController"));
  v3 = v2 != 0;

  return v3;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeViewController](self, "activeViewController"));
  if (sub_10008D294(self, v3))
  {
    v13 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  }
  else
  {
    v5 = objc_opt_class(MailSplitViewController);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      v6 = v3;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxPickerNavController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListNavController", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topViewController"));
      v12[1] = v10;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)activateExposeModeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  TiltedTabViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  TiltedTabViewController *v16;

  v3 = a3;
  if (!-[DockContainerViewController isExposeModeActivated](self, "isExposeModeActivated"))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
    v5 = objc_msgSend(v14, "count");

    if (v5)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v15, "postNotificationName:object:", CFSTR("kWillShowTiltedTabViewNotification"), self);

      v6 = [TiltedTabViewController alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController persistence](self, "persistence"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController scene](self, "scene"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "daemonInterface"));
      v16 = -[TiltedTabViewController initWithInitialDockedStates:persistence:primaryViewController:daemonInterface:](v6, "initWithInitialDockedStates:persistence:primaryViewController:daemonInterface:", v7, v8, v9, v11);

      -[TiltedTabViewController setDelegate:](v16, "setDelegate:", self);
      -[DockContainerViewController setActiveTiltedTabViewController:](self, "setActiveTiltedTabViewController:", v16);
      -[DockContainerViewController addChildViewController:](self, "addChildViewController:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TiltedTabViewController view](v16, "view"));
      objc_msgSend(v12, "addSubview:", v13);

      -[TiltedTabViewController didMoveToParentViewController:](v16, "didMoveToParentViewController:", self);
      -[TiltedTabViewController presentAnimated:](v16, "presentAnimated:", v3);
      -[DockContainerViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

    }
  }
}

- (void)deactivateExposeModeAnimated:(BOOL)a3
{
  -[DockContainerViewController _deactivateExposeModeWithSelection:fromSnapshotView:animated:](self, "_deactivateExposeModeWithSelection:fromSnapshotView:animated:", 0, 0, a3);
}

- (void)_deactivateExposeModeWithSelection:(id)a3 fromSnapshotView:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  TabSelectionPresentationAnimationController *v22;
  void *v23;
  id *v24;
  _QWORD v25[4];
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  DockContainerViewController *v29;
  _QWORD v30[5];
  _QWORD *v31;
  _QWORD v32[5];
  _QWORD *v33;
  _QWORD v34[4];
  _QWORD v35[2];
  _QWORD v36[4];
  id v37;
  DockContainerViewController *v38;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[DockContainerViewController isExposeModeActivated](self, "isExposeModeActivated"))
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10008DBE0;
    v36[3] = &unk_10051A910;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeTiltedTabViewController](self, "activeTiltedTabViewController"));
    v37 = v10;
    v38 = self;
    v11 = objc_retainBlock(v36);
    if (v8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController persistence](self, "persistence"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dockIdentifier"));
      objc_msgSend(v12, "removeDockedStateWithIdentifier:sender:", v13, self);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dockIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v15));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dockIdentifier"));
        objc_msgSend(v17, "removeObjectForKey:", v18);

        objc_msgSend(v16, "removeFromSuperview");
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController scene](self, "scene"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "restoreViewControllerWithScene:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController delegate](self, "delegate"));
      objc_msgSend(v21, "dockContainer:didRestoreViewController:", self, v20);

      if (v5)
      {
        objc_msgSend(v20, "setTransitioningDelegate:", self);
        v22 = -[TabSelectionPresentationAnimationController initWithSourceView:]([TabSelectionPresentationAnimationController alloc], "initWithSourceView:", v9);
        -[DockContainerViewController setNextPresentationAnimation:](self, "setNextPresentationAnimation:", v22);

        -[DockContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController transitionCoordinator](self, "transitionCoordinator"));
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10008DC50;
        v34[3] = &unk_10051C608;
        v35[0] = v10;
        v35[1] = self;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10008DCA8;
        v32[3] = &unk_10051C630;
        v32[4] = self;
        v33 = v11;
        objc_msgSend(v23, "animateAlongsideTransition:completion:", v34, v32);
        v24 = (id *)v35;

      }
      else
      {
        objc_msgSend(v10, "dismiss");
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10008DCD8;
        v30[3] = &unk_10051B3B0;
        v30[4] = self;
        v31 = v11;
        -[DockContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 0, v30);
        v24 = (id *)&v31;
      }

    }
    else
    {
      if (!v5)
      {
        objc_msgSend(v10, "dismiss");
        ((void (*)(_QWORD *))v11[2])(v11);
        goto LABEL_12;
      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10008DD34;
      v27[3] = &unk_10051A910;
      v28 = v10;
      v29 = self;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10008DDC4;
      v25[3] = &unk_10051C658;
      v26 = v11;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v27, v25, 0.22, 0.0);

      v16 = v28;
    }

LABEL_12:
  }

}

- (void)setDockingTransitionState:(int64_t)a3
{
  int64_t *p_dockingTransitionState;
  NSObject *v5;

  p_dockingTransitionState = &self->_dockingTransitionState;
  if (self->_dockingTransitionState != a3)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_1003911E0(p_dockingTransitionState, a3, v5);

  }
  *p_dockingTransitionState = a3;
}

- (void)_setDockVisible:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  v5 = 0.0;
  if (a3)
  {
    -[DockContainerViewController _dockHeight](self, "_dockHeight");
    v5 = v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockHeightConstraint](self, "dockHeightConstraint"));
  objc_msgSend(v7, "constant");
  v9 = v8;

  if (v9 != v5)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1003912DC(v3, v10, v11, v12, v13, v14, v15, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockHeightConstraint](self, "dockHeightConstraint"));
    objc_msgSend(v17, "setConstant:", v5);

  }
}

- (double)_dockHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3 + 50.0;

  return v4;
}

- (void)_dockViewTapped
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)1)
  {
    -[DockContainerViewController _popFirstDockedViewAnimated:](self, "_popFirstDockedViewAnimated:", 1);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
    v6 = objc_msgSend(v5, "count");

    if ((unint64_t)v6 >= 2)
      -[DockContainerViewController activateExposeModeAnimated:](self, "activateExposeModeAnimated:", 1);
  }
}

- (void)_popFirstDockedViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController persistence](self, "persistence"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dockIdentifier"));
  objc_msgSend(v7, "removeDockedStateWithIdentifier:sender:", v8, self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController scene](self, "scene"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "restoreViewControllerWithScene:", v9));

  if (v10)
  {
    -[DockContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, v3, 0);
    if (v3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
      v12 = objc_msgSend(v11, "mutableCopy");

      objc_msgSend(v12, "removeObject:", v6);
      v13 = objc_msgSend(v12, "copy");
      -[DockContainerViewController setDockedStates:](self, "setDockedStates:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController transitionCoordinator](self, "transitionCoordinator"));
      v16[4] = self;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10008E230;
      v17[3] = &unk_10051C0B8;
      v17[4] = self;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10008E2A0;
      v16[3] = &unk_10051C0B8;
      objc_msgSend(v14, "animateAlongsideTransition:completion:", v17, v16);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController delegate](self, "delegate"));
    objc_msgSend(v15, "dockContainer:didRestoreViewController:", self, v10);

  }
}

- (void)_layoutExistingDockedViewsWithIndexOffset:(int64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  DockContainerViewController *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  double MaxY;
  double MinX;
  double Width;
  NSObject *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  DockContainerViewController *v44;
  int64_t v45;
  void *j;
  uint64_t v47;
  uint64_t v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double Height;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  NSObject *v68;
  void *v69;
  void *v70;
  __int128 v71;
  double v72;
  __int128 v73;
  CGFloat v74;
  double v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  id obj;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  void *v87;
  CGAffineTransform v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  _OWORD v92[3];
  _QWORD v93[5];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  CGAffineTransform buf;
  _BYTE v105[128];
  _BYTE v106[128];
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  v3 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100391358(a3, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_mapSelector:", "dockIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_10008ED28;
  v102[3] = &unk_10051C680;
  v79 = v11;
  v103 = v79;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ef_filter:", v102));

  v14 = self;
  if ((id)-[DockContainerViewController dockingTransitionState](self, "dockingTransitionState") != (id)2)
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v15 = v77;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v99 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews", v77));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v19));

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews"));
          objc_msgSend(v22, "removeObjectForKey:", v19);

          objc_msgSend(v21, "frame");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
          objc_msgSend(v31, "frame");
          MaxY = CGRectGetMaxY(v107);

          v108.origin.x = v24;
          v108.origin.y = v26;
          v108.size.width = v28;
          v108.size.height = v30;
          MinX = CGRectGetMinX(v108);
          v109.origin.x = v24;
          v109.origin.y = v26;
          v109.size.width = v28;
          v109.size.height = v30;
          Width = CGRectGetWidth(v109);
          v110.origin.x = v24;
          v110.origin.y = v26;
          v110.size.width = v28;
          v110.size.height = v30;
          objc_msgSend(v21, "setFrame:", MinX, MaxY + 2.5, Width, CGRectGetHeight(v110));
          v35 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf.a) = 138543362;
            *(_QWORD *)((char *)&buf.a + 4) = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "View for ID %{public}@ has moved offscreen. Will remove view on cleanup.", (uint8_t *)&buf, 0xCu);
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController offscreenDockedViews](self, "offscreenDockedViews"));
          objc_msgSend(v36, "addObject:", v21);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
      }
      while (v16);
    }

    v14 = self;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](v14, "view", v77));
  +[SheetMetrics frameForPresentedSheetIn:](SheetMetrics, "frameForPresentedSheetIn:", v37);
  v85 = v39;
  v86 = v38;
  v83 = v41;
  v84 = v40;

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeTiltedTabViewController](self, "activeTiltedTabViewController"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "view"));

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v79;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
  v44 = self;
  if (v43)
  {
    v80 = *(_QWORD *)v95;
    v45 = a3;
    do
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(_QWORD *)v95 != v80)
          objc_enumerationMutation(obj);
        v47 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
        if (v45 >= 2)
          v48 = 2;
        else
          v48 = v45;
        v111.origin.y = v85;
        v111.origin.x = v86;
        v111.size.height = v83;
        v111.size.width = v84;
        v49 = CGRectGetWidth(v111);
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](v44, "view"));
        objc_msgSend(v50, "bounds");
        v51 = CGRectGetWidth(v112);

        if (v49 >= v51)
          v52 = v51;
        else
          v52 = v49;
        v113.origin.y = v85;
        v113.origin.x = v86;
        v113.size.height = v83;
        v113.size.width = v84;
        Height = CGRectGetHeight(v113);
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
        objc_msgSend(v54, "bounds");
        v55 = CGRectGetWidth(v114);

        -[DockContainerViewController _yPositionForDockedViewAtDepth:totalDockedCount:](self, "_yPositionForDockedViewAtDepth:totalDockedCount:", v48, (char *)objc_msgSend(obj, "count") + a3);
        v57 = v56;
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v47));

        v60 = (v55 - v52) * 0.5;
        if (!v59)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
          v93[0] = _NSConcreteStackBlock;
          v93[1] = 3221225472;
          v93[2] = sub_10008ED48;
          v93[3] = &unk_10051C500;
          v93[4] = v47;
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "ef_firstObjectPassingTest:", v93));

          v115.origin.x = (v55 - v52) * 0.5;
          v115.origin.y = v57;
          v115.size.width = v52;
          v115.size.height = Height;
          v63 = CGRectGetMinX(v115);
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
          objc_msgSend(v64, "bounds");
          v65 = CGRectGetMaxY(v116);
          v117.origin.x = v60;
          v117.origin.y = v57;
          v117.size.width = v52;
          v117.size.height = Height;
          v66 = CGRectGetWidth(v117);
          v118.origin.x = v60;
          v118.origin.y = v57;
          v118.size.width = v52;
          v118.size.height = Height;
          v67 = CGRectGetHeight(v118);

          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "createDockedViewWithFrame:", v63, v65, v66, v67));
          if (!v59)
          {

            goto LABEL_37;
          }
          v68 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf.a) = 138412290;
            *(_QWORD *)((char *)&buf.a + 4) = v47;
            _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "Created new docked view for ID %@", (uint8_t *)&buf, 0xCu);
          }

          v69 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews"));
          objc_msgSend(v69, "setObject:forKey:", v59, v47);

          objc_msgSend(v59, "setAlpha:", 0.0);
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
          if (v87)
            objc_msgSend(v70, "insertSubview:below:", v59, v87);
          else
            objc_msgSend(v70, "addSubview:", v59);

          -[DockContainerViewController _configureNewDockedView:](self, "_configureNewDockedView:", v59);
        }
        v71 = *(_OWORD *)&CGAffineTransformIdentity.c;
        v92[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
        v92[1] = v71;
        v92[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
        objc_msgSend(v59, "setTransform:", v92);
        objc_msgSend(v59, "setFrame:", v60, v57, v52, Height);
        objc_msgSend(v59, "bounds");
        v72 = CGRectGetHeight(v119);
        *(_QWORD *)&v73 = -1;
        *((_QWORD *)&v73 + 1) = -1;
        *(_OWORD *)&buf.c = v73;
        *(_OWORD *)&buf.tx = v73;
        *(_OWORD *)&buf.a = v73;
        objc_msgSend(v59, "transform");
        v74 = (double)v48 * -0.05 + 1.0;
        v90 = buf;
        CGAffineTransformTranslate(&v91, &v90, 0.0, (v72 - v72 * v74) * -0.5);
        buf = v91;
        v90 = v91;
        CGAffineTransformScale(&v91, &v90, v74, v74);
        buf = v91;
        v89 = v91;
        objc_msgSend(v59, "setTransform:", &v89);
        objc_msgSend(v59, "setShadowVisible:", 1);
        objc_msgSend(v59, "setDimmingAmount:", (double)v48 * 0.1);
        v75 = 0.0;
        if (v45 < 3)
          v75 = 1.0;
        objc_msgSend(v59, "setAlpha:", v75);
        v76 = v59;

        ++v45;
        v87 = v76;
LABEL_37:
        v44 = self;
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
    }
    while (v43);
  }

}

- (double)_yPositionForDockedViewAtDepth:(int64_t)a3 totalDockedCount:(int64_t)a4
{
  void *v7;
  double MaxY;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  CGRect v14;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  MaxY = CGRectGetMaxY(v14);
  -[DockContainerViewController _dockHeight](self, "_dockHeight");
  v10 = 3;
  if (a4 < 3)
    v10 = a4;
  v11 = (double)((v10 & ~(v10 >> 63)) + ~a3) * 4.0;
  v12 = MaxY - v9;

  return v11 + v12 + 2.5;
}

- (void)_cleanupOffscreenDockedViews
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1003913BC();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController offscreenDockedViews](self, "offscreenDockedViews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "removeFromSuperview");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController offscreenDockedViews](self, "offscreenDockedViews"));
  objc_msgSend(v8, "removeAllObjects");

}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _QWORD *v6;
  void *v7;
  NSObject *v8;
  DockedViewControllerState *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[5];
  BOOL v16;
  uint8_t buf[16];

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Popping to root view controller.", buf, 2u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008F204;
  v15[3] = &unk_10051C6A8;
  v15[4] = self;
  v16 = v3;
  v6 = objc_retainBlock(v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentedViewController](self, "presentedViewController"));
  if (v7)
  {
    if (sub_10008D294(self, v7))
    {
      v8 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dockable view controller is currently presented. Will dock on dismissal.", buf, 2u);
      }

      if (v3)
      {
        -[DockContainerViewController _prepareViewControllerForDockingIfPossible:](self, "_prepareViewControllerForDockingIfPossible:", v7);
      }
      else
      {
        v9 = -[DockedViewControllerState initWithDockableViewController:]([DockedViewControllerState alloc], "initWithDockableViewController:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController persistence](self, "persistence"));
        objc_msgSend(v10, "pushNewDockedState:sender:", v9, 0);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController delegate](self, "delegate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DockedViewControllerState dockIdentifier](v9, "dockIdentifier"));
        objc_msgSend(v11, "dockContainer:dockedViewControllerWithIdentifier:", self, v12);

      }
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008F240;
    v13[3] = &unk_10051A870;
    v14 = v6;
    -[DockContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, v13);

  }
  else
  {
    ((void (*)(_QWORD *))v6[2])(v6);
  }

}

- (BOOL)shouldAutorotate
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
  v3 = objc_msgSend(v2, "shouldAutorotate");

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if ((id)-[DockContainerViewController dockingTransitionState](self, "dockingTransitionState") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentedViewController](self, "presentedViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitionCoordinator"));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008F3A0;
    v11[3] = &unk_10051C0B8;
    v11[4] = self;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v11);

  }
  v10.receiver = self;
  v10.super_class = (Class)DockContainerViewController;
  -[DockContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)tiltedTabViewControllerDidCancel:(id)a3
{
  -[DockContainerViewController _deactivateExposeModeWithSelection:fromSnapshotView:animated:](self, "_deactivateExposeModeWithSelection:fromSnapshotView:animated:", 0, 0, 1);
}

- (void)tiltedTabViewController:(id)a3 didSelectView:(id)a4 representingState:(id)a5
{
  -[DockContainerViewController _deactivateExposeModeWithSelection:fromSnapshotView:animated:](self, "_deactivateExposeModeWithSelection:fromSnapshotView:animated:", a5, a4, 1);
}

- (CGRect)tiltedTabViewController:(id)a3 dockedFrameForViewRepresentingState:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dockIdentifier", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedViews](self, "dockedViews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  if (v7)
  {
    objc_msgSend(v7, "frame");
    x = v8;
    y = v10;
    width = v12;
    height = v14;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char isKindOfClass;
  NSObject *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[5];
  id v28;
  id v29;
  BOOL v30;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentedViewController](self, "presentedViewController"));
  if (v10)
  {
    v11 = objc_opt_class(MFMailDebugMenuController);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeViewController](self, "activeViewController"));
      objc_msgSend(v12, "presentViewController:animated:completion:", v8, v6, v9);

    }
    else
    {
      if ((sub_10008D294(self, v10) & 1) != 0
        || objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___TearableViewController))
      {
        objc_msgSend(v10, "setTransitioningDelegate:", self);
      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10008F790;
      v27[3] = &unk_10051C6D0;
      v27[4] = self;
      v28 = v8;
      v30 = v6;
      v29 = v9;
      -[DockContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v6, v27);

    }
  }
  else
  {
    if ((sub_10008D294(self, v8) & 1) != 0
      || objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___TearableViewController))
    {
      v13 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_100391414((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationController"));
      objc_msgSend(v20, "setDelegate:", self);

    }
    if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___TearableViewController))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationController"));
      v22 = objc_opt_class(UISheetPresentationController);
      isKindOfClass = objc_opt_isKindOfClass(v21, v22);

      if ((isKindOfClass & 1) != 0)
      {
        v24 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          sub_1003913E8();

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationController"));
        objc_msgSend(v25, "_setAllowsTearOff:", 1);
        objc_msgSend(v25, "setPrefersGrabberVisible:", 1);

      }
    }
    v26.receiver = self;
    v26.super_class = (Class)DockContainerViewController;
    -[DockContainerViewController presentViewController:animated:completion:](&v26, "presentViewController:animated:completion:", v8, v6, v9);
  }

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100391478();

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  -[DockContainerViewController _prepareViewControllerForDockingIfPossible:](self, "_prepareViewControllerForDockingIfPossible:", v6);

  return 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentationControllerDelegateObservers](self, "presentationControllerDelegateObservers"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8), "presentationControllerWillDismiss:", v4);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  if (sub_10008D294(self, v9))
  {
    -[DockContainerViewController setDockingTransitionState:](self, "setDockingTransitionState:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitionCoordinator"));
    if ((objc_msgSend(v10, "isInterruptible") & 1) != 0
      || objc_msgSend(v10, "isInteractive"))
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10008FA50;
      v11[3] = &unk_10051C608;
      v11[4] = self;
      v12 = v9;
      objc_msgSend(v10, "notifyWhenInteractionChangesUsingBlock:", v11);

    }
  }

}

- (void)_sheetPresentationControllerDidTearOff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;

  v4 = a3;
  -[DockContainerViewController setDraftWasTornOff:](self, "setDraftWasTornOff:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___DockableViewController)
    && objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___TearableViewController))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dockIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dockable view controller with identifier %{public}@ was torn off.", buf, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController delegate](self, "delegate"));
    objc_msgSend(v8, "dockContainer:dockedViewWasTornOffWithIdentifier:", self, v6);

  }
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008FD1C;
  v10[3] = &unk_10051AA98;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008FD78;
  v9[3] = &unk_10051A848;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, v9, 0.2, 0.0);

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  void *v6;

  if (sub_10008D294(self, a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController nextPresentationAnimation](self, "nextPresentationAnimation"));
    -[DockContainerViewController setNextPresentationAnimation:](self, "setNextPresentationAnimation:", 0);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (sub_10008D294(self, v4))
  {
    -[DockContainerViewController setDraftWasTornOff:](self, "setDraftWasTornOff:", 0);
    v5 = -[DockContainerViewController _newDockingAnimatorForDismissedController:](self, "_newDockingAnimatorForDismissedController:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_newDockingAnimatorForDismissedController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MinX;
  double Width;
  double Height;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  DockedViewControllerState *v55;
  id v56;
  id v57;
  void *v58;
  DockedViewControllerState *v59;
  id v60;
  id v61;
  id v62;
  _QWORD v64[5];
  DockedViewControllerState *v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  DockContainerViewController *v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v4 = a3;
  v5 = objc_alloc_init((Class)_UISheetAnimationController);
  objc_msgSend(v5, "setIsReversed:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
  v7 = (char *)objc_msgSend(v6, "count") + 1;

  -[DockContainerViewController _yPositionForDockedViewAtDepth:totalDockedCount:](self, "_yPositionForDockedViewAtDepth:totalDockedCount:", 0, v7);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v11, "convertRect:fromView:", v21, v14, v16, v18, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v73.origin.x = v23;
  v73.origin.y = v25;
  v73.size.width = v27;
  v73.size.height = v29;
  MinX = CGRectGetMinX(v73);
  v74.origin.x = v23;
  v74.origin.y = v25;
  v74.size.width = v27;
  v74.size.height = v29;
  Width = CGRectGetWidth(v74);
  v75.origin.x = v23;
  v75.origin.y = v25;
  v75.size.width = v27;
  v75.size.height = v29;
  Height = CGRectGetHeight(v75);
  objc_msgSend(v5, "setSourceFrame:", MinX, v9, Width, Height);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentationController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "presentedView"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view", v34));
  objc_msgSend(v35, "frame");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v34, "convertRect:fromView:", v44, v37, v39, v41, v43);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dockedViewWithFrame:", v46, v48, v50, v52));
  objc_msgSend(v53, "setAlpha:", 0.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dockedViewWithFrame:", MinX, v9, Width, Height));
  v55 = -[DockedViewControllerState initWithDockableViewController:]([DockedViewControllerState alloc], "initWithDockableViewController:", v4);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000902D0;
  v69[3] = &unk_10051A960;
  v56 = v34;
  v70 = v56;
  v57 = v53;
  v71 = v57;
  v72 = self;
  v58 = v5;
  objc_msgSend(v5, "setNoninteractiveAnimations:", v69);
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100090358;
  v64[3] = &unk_10051C6F8;
  v64[4] = self;
  v59 = v55;
  v65 = v59;
  v60 = v54;
  v66 = v60;
  v61 = v57;
  v67 = v61;
  v62 = v4;
  v68 = v62;
  objc_msgSend(v58, "setNoninteractiveCompletion:", v64);

  return v58;
}

- (void)_configureNewDockedView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_dockViewTapped");
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v4, "addGestureRecognizer:", v5);
  if ((objc_opt_respondsToSelector(v4, "preferredSpringLoadingEffect") & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredSpringLoadingEffect"));
  else
    v6 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = objc_alloc((Class)UISpringLoadedInteraction);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100090638;
  v12 = &unk_10051C720;
  objc_copyWeak(&v13, &location);
  v8 = objc_msgSend(v7, "initWithInteractionBehavior:interactionEffect:activationHandler:", 0, v6, &v9);
  objc_msgSend(v4, "addInteraction:", v8, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (BOOL)_isDockableViewControllerPresented
{
  DockContainerViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeViewController](self, "activeViewController"));
  LOBYTE(v2) = sub_10008D294(v2, v3);

  return (char)v2;
}

- (void)_prepareViewControllerForDockingIfPossible:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  if (sub_10008D294(self, v4))
  {
    v5 = v4;
    objc_msgSend(v5, "setTransitioningDelegate:", self);
    v6 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1003914D0();

    if ((objc_opt_respondsToSelector(v5, "willBeginDocking") & 1) != 0)
      objc_msgSend(v5, "willBeginDocking");

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double MaxY;
  void *v10;
  double v11;
  BOOL v12;
  CGRect v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  objc_msgSend(v4, "locationOfTouch:inView:", 0, v5);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  MaxY = CGRectGetMaxY(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  objc_msgSend(v10, "safeAreaInsets");
  v12 = v7 < MaxY - v11;

  return v12;
}

- (void)_tiltedTabViewWillBePresented:(id)a3
{
  DockContainerViewController *v4;
  id v5;

  v5 = a3;
  if (-[DockContainerViewController isExposeModeActivated](self, "isExposeModeActivated"))
  {
    v4 = (DockContainerViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

    if (v4 != self)
      -[DockContainerViewController deactivateExposeModeAnimated:](self, "deactivateExposeModeAnimated:", 1);
  }

}

- (void)_handlePersistenceChangeFromSelf
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100391554();

  if ((id)-[DockContainerViewController dockingTransitionState](self, "dockingTransitionState") == (id)2)
    -[DockContainerViewController setDockingTransitionState:](self, "setDockingTransitionState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController transitionCoordinator](self, "transitionCoordinator"));
  v5 = objc_msgSend(v4, "isAnimated");

  v6 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      sub_1003914FC();

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController transitionCoordinator](self, "transitionCoordinator"));
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100090A4C;
    v10[3] = &unk_10051C0B8;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100090ABC;
    v9[3] = &unk_10051C0B8;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", v10, v9);
  }
  else
  {
    if (v7)
      sub_100391528();

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
    objc_msgSend(v8, "setNeedsLayout");
  }

}

- (void)_handlePersistenceChangeFromAnotherObserver
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1003915AC();

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsLayout");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController scene](self, "scene"));
  v6 = objc_msgSend(v5, "activationState");

  if (v6 == (id)2)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[DockContainerViewController log](DockContainerViewController, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100391580();

  }
  else
  {
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100090C18;
    v9[3] = &unk_10051AA98;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100090C64;
    v8[3] = &unk_10051A848;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v9, v8, 0.2, 0.0);
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  if ("_commandMPressed:" == a3)
  {
    if (-[DockContainerViewController _isDockableViewControllerPresented](self, "_isDockableViewControllerPresented"))
    {
      v7 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
      if (objc_msgSend(v8, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeViewController](self, "activeViewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));
        v7 = v9 == v10;

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DockContainerViewController;
    v7 = -[DockContainerViewController canPerformAction:withSender:](&v12, "canPerformAction:withSender:", a3, v6);
  }

  return v7;
}

- (void)validateCommand:(id)a3
{
  NSBundle *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSBundle *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "action") == "_commandMPressed:")
  {
    if (-[DockContainerViewController _isDockableViewControllerPresented](self, "_isDockableViewControllerPresented"))
    {
      v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DockContainerViewController));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MINIMIZE_WINDOW"), &stru_100531B00, CFSTR("Main")));
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController dockedStates](self, "dockedStates"));
      if (!objc_msgSend(v5, "count"))
      {
        v7 = 0;
        goto LABEL_9;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController activeViewController](self, "activeViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController rootViewController](self, "rootViewController"));

      if (v8 != v9)
      {
        v7 = 0;
LABEL_10:
        objc_msgSend(v11, "setDiscoverabilityTitle:", v7);

        goto LABEL_11;
      }
      v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DockContainerViewController));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CONTINUE_WINDOW"), &stru_100531B00, CFSTR("Main")));
    }
    v7 = (void *)v6;
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:

}

- (void)_commandMPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (-[DockContainerViewController _isDockableViewControllerPresented](self, "_isDockableViewControllerPresented"))
    -[DockContainerViewController _minimizeKeyCommandPressed:](self, "_minimizeKeyCommandPressed:", v4);
  else
    -[DockContainerViewController _continueKeyCommandPressed:](self, "_continueKeyCommandPressed:", v4);

}

- (void)_minimizeKeyCommandPressed:(id)a3
{
  -[DockContainerViewController dockPresentedViewControllerWithCompletion:](self, "dockPresentedViewControllerWithCompletion:", 0);
}

- (void)dockPresentedViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  if (-[DockContainerViewController _isDockableViewControllerPresented](self, "_isDockableViewControllerPresented")
    && !-[DockContainerViewController dockingTransitionState](self, "dockingTransitionState"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController presentedViewController](self, "presentedViewController"));
    -[DockContainerViewController _prepareViewControllerForDockingIfPossible:](self, "_prepareViewControllerForDockingIfPossible:", v5);

    -[DockContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerViewController transitionCoordinator](self, "transitionCoordinator"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000910FC;
    v10[3] = &unk_10051C0B8;
    v10[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100091178;
    v8[3] = &unk_10051C748;
    v8[4] = self;
    v7 = v4;
    v9 = v7;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", v10, v8);

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

  }
}

- (void)_continueKeyCommandPressed:(id)a3
{
  -[DockContainerViewController _popFirstDockedViewAnimated:](self, "_popFirstDockedViewAnimated:", 1);
}

- (DockContainerViewControllerDelegate)delegate
{
  return (DockContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (MailScene)scene
{
  return (MailScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)setDockedStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableDictionary)dockedViews
{
  return self->_dockedViews;
}

- (void)setDockedViews:(id)a3
{
  objc_storeStrong((id *)&self->_dockedViews, a3);
}

- (NSMutableArray)offscreenDockedViews
{
  return self->_offscreenDockedViews;
}

- (void)setOffscreenDockedViews:(id)a3
{
  objc_storeStrong((id *)&self->_offscreenDockedViews, a3);
}

- (TabSelectionPresentationAnimationController)nextPresentationAnimation
{
  return self->_nextPresentationAnimation;
}

- (void)setNextPresentationAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_nextPresentationAnimation, a3);
}

- (TiltedTabViewController)activeTiltedTabViewController
{
  return self->_activeTiltedTabViewController;
}

- (void)setActiveTiltedTabViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activeTiltedTabViewController, a3);
}

- (BOOL)draftWasTornOff
{
  return self->_draftWasTornOff;
}

- (void)setDraftWasTornOff:(BOOL)a3
{
  self->_draftWasTornOff = a3;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (void)setDockShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_dockShadowView, a3);
}

- (void)setPresentationControllerDelegateObservers:(id)a3
{
  objc_storeStrong((id *)&self->_presentationControllerDelegateObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationControllerDelegateObservers, 0);
  objc_storeStrong((id *)&self->_dockShadowView, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_activeTiltedTabViewController, 0);
  objc_storeStrong((id *)&self->_nextPresentationAnimation, 0);
  objc_storeStrong((id *)&self->_dockHeightConstraint, 0);
  objc_storeStrong((id *)&self->_offscreenDockedViews, 0);
  objc_storeStrong((id *)&self->_dockedViews, 0);
  objc_storeStrong((id *)&self->_dockedStates, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

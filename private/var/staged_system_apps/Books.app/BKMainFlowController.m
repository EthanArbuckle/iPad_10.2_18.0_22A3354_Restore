@implementation BKMainFlowController

- (BKMainFlowControllerNavigationDelegate)navigationDelegate
{
  BKMainFlowController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)BKMainFlowController.navigationDelegate.getter();

  return (BKMainFlowControllerNavigationDelegate *)v3;
}

- (id)presenterFirstVisibleChildConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "im_firstVisibleChildConformingToProtocol:includePresented:", v4, 1));

  return v7;
}

- (BKMainFlowControllerDelegate)delegate
{
  return (BKMainFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)viewControllerForStatusBarHidden
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController statusBarStyling](self, "statusBarStyling"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController statusBarStyling](self, "statusBarStyling"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForStatusBarHidden"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController selectedNavigationController](self, "selectedNavigationController"));
  }

  return v5;
}

- (BKContentOpenStatusBarStyling)statusBarStyling
{
  return (BKContentOpenStatusBarStyling *)objc_loadWeakRetained((id *)&self->_statusBarStyling);
}

- (id)selectedNavigationController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedNavigationController"));

  return v3;
}

- (BKRootBarCoordinating)rootBarCoordinator
{
  BKMainFlowController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)BKMainFlowController.rootBarCoordinator.getter();

  return (BKRootBarCoordinating *)v3;
}

- (id)viewControllerForStatusBarStyle
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController statusBarStyling](self, "statusBarStyling"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController statusBarStyling](self, "statusBarStyling"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForStatusBarStyle"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController selectedNavigationController](self, "selectedNavigationController"));
  }

  return v5;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  BOOL v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _BOOL4 v41;
  id v42;
  CGRect v43;
  CGRect v44;

  v5 = a5;
  v42 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "transitionCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationController"));

  v12 = v42;
  if (v11 != v42)
  {

    v12 = v42;
    v10 = 0;
  }
  v41 = v5;
  if (v5)
    v13 = v9;
  else
    v13 = 0;
  v14 = BCNavBarVisibilityDuration;
  if (!v5)
    v14 = 0.0;
  objc_msgSend(v12, "bc_updateNavBarVisibleWithTransitionCoordinator:duration:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "disappearingViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectedItem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryAllIdentifier](BKRootBarItemsProvider, "LibraryAllIdentifier"));
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (v20 && v15)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "viewControllers"));
    if (objc_msgSend(v21, "indexOfObjectIdenticalTo:", v15) == (id)0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "im_effectiveViewControllerForTabBarVisibility"));
      v23 = objc_msgSend(v22, "im_tabBarVisible");

      if ((v23 & 1) == 0)
      {
        objc_msgSend(v8, "setHidesBottomBarWhenPushed:", 1);
        objc_msgSend(v8, "im_setTabBarVisible:", 0);
      }
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "view"));
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v33, "frame");
  v44.origin.x = v26;
  v44.origin.y = v28;
  v44.size.width = v30;
  v44.size.height = v32;
  v34 = CGRectEqualToRect(v43, v44);

  if (!v34)
  {
    v35 = objc_alloc_init((Class)objc_opt_class(IMViewControllerNullAnimationTransitionCoordinator));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "view"));
    objc_msgSend(v35, "setContainerView:", v36);

    objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v35, v30, v32);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v37, "setFrame:", v26, v28, v30, v32);

    objc_msgSend(v35, "_runAlongsideAnimations");
    objc_msgSend(v35, "_runAlongsideCompletionsAfterCommit");

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[BCLightLevelController sharedInstance](BCLightLevelController, "sharedInstance"));
  v39 = objc_msgSend(v38, "currentLightLevel");

  objc_msgSend(v8, "bc_notifyLightLevelDidChange:", v39);
  -[BKMainFlowController presenterVisibleViewControllerWillChangeAnimated:](self, "presenterVisibleViewControllerWillChangeAnimated:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController navigationDelegate](self, "navigationDelegate"));
  objc_msgSend(v40, "navigationController:willShowViewController:", v42, v8);

}

- (void)setRootBarCoordinator:(id)a3
{
  sub_100011B68(self, (uint64_t)a2, a3, &unk_100A1F103);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)presenterVisibleViewControllerWillChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneManager"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedFlowController"));

  objc_msgSend(v6, "visibleViewControllersUpdatedPreTranstionAnimated:", v3);
}

- (id)presenterViewControllersConformingToProtocol:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A7548;
  v10[3] = &unk_1008E9888;
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "im_enumerateChildrenConformingToProtocol:block:", v4, v10);

  return v8;
}

- (BKMainFlowController)initWithLibraryAssetProvider:(id)a3
{
  id v4;
  BKMainFlowController *v5;
  BKMainFlowController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKMainFlowController;
  v5 = -[BKMainFlowController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_libraryAssetProvider, v4);

  return v6;
}

- (id)presenterSceneController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneControllerForViewController:](BKAppDelegate, "sceneControllerForViewController:", v3));

  return v4;
}

- (id)navigationControllerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationControllerForIdentifier:", v4));

  return v6;
}

- (void)_transition:(id)a3 navigationController:(id)a4 animator:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[BKMainFlowController setAnimator:](self, "setAnimator:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topViewController"));
  -[BKMainFlowController setTransitionPreviousTopViewController:](self, "setTransitionPreviousTopViewController:", v14);

  v15 = objc_retainBlock(v10);
  v16 = v15;
  if (v15)
    (*((void (**)(id, id))v15 + 2))(v15, v11);

  objc_initWeak(&location, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tabBarController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transitionCoordinator"));
  objc_msgSend(v17, "im_updateTabBarVisibleWithTransitionCoordinator:", v18);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001A6094;
  v20[3] = &unk_1008EE0B8;
  objc_copyWeak(&v22, &location);
  v19 = v13;
  v21 = v19;
  -[BKMainFlowController _navigationController:transitionCompletion:](self, "_navigationController:transitionCompletion:", v11, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)_transition:(id)a3 animator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController selectedNavigationController](self, "selectedNavigationController"));
  -[BKMainFlowController _transition:navigationController:animator:completion:](self, "_transition:navigationController:animator:completion:", v10, v11, v9, v8);

}

- (void)_navigationController:(id)a3 transitionCompletion:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "transitionCoordinator"));
    if (v6)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1001A6240;
      v7[3] = &unk_1008EE0E0;
      v8 = v5;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v7);

    }
    else
    {
      (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    }

  }
}

- (BKContentOpenAnimating)bookOpenAnimator
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController animator](self, "animator"));
  v3 = BUProtocolCast(&OBJC_PROTOCOL___BKContentOpenAnimating, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (BKContentOpenAnimating *)v4;
}

- (void)presenterPopToRootAnimated:(BOOL)a3 completion:(id)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001A6310;
  v4[3] = &unk_1008EE100;
  v5 = a3;
  -[BKMainFlowController _transition:animator:completion:](self, "_transition:animator:completion:", v4, 0, a4);
}

- (void)presenterPopToRootWithAnimator:(id)a3 completion:(id)a4
{
  -[BKMainFlowController _transition:animator:completion:](self, "_transition:animator:completion:", &stru_1008EE140, a3, a4);
}

- (BOOL)_hasOpenAssets
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController presenterViewControllersConformingToProtocol:](self, "presenterViewControllersConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_welcomePresenterIsPresentingWelcome
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v3 = objc_msgSend(v2, "isPresentingWelcome");

  return v3;
}

- (BOOL)presenterIsShowingLibrary
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedItem"));
  if (objc_msgSend(v4, "isDefaultCollection")
    && !-[BKMainFlowController _hasOpenAssets](self, "_hasOpenAssets"))
  {
    v5 = !-[BKMainFlowController _welcomePresenterIsPresentingWelcome](self, "_welcomePresenterIsPresentingWelcome");
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)presenterIsShowingStore
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedItem"));

  v5 = objc_msgSend(v4, "isStoreOnly");
  if ((v5 & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v6 = objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
    if (v3 != (void *)v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider SearchIdentifier](BKRootBarItemsProvider, "SearchIdentifier"));
      if (v8 == v9)
      {
        if (-[BKMainFlowController _hasOpenAssets](self, "_hasOpenAssets"))
          LOBYTE(v10) = 0;
        else
          v10 = !-[BKMainFlowController _welcomePresenterIsPresentingWelcome](self, "_welcomePresenterIsPresentingWelcome");
        v9 = v8;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

      goto LABEL_15;
    }
  }
  if (-[BKMainFlowController _hasOpenAssets](self, "_hasOpenAssets"))
    LOBYTE(v10) = 0;
  else
    v10 = !-[BKMainFlowController _welcomePresenterIsPresentingWelcome](self, "_welcomePresenterIsPresentingWelcome");
  v7 = v3;
  if ((v5 & 1) == 0)
  {
LABEL_15:

  }
  return v10;
}

- (void)presenterShowAlertController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, v4, 0);

}

- (id)presenterModalPresentingViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "flowControllerModalPresentingViewController"));

  return v3;
}

- (void)presenterShowModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  void ***v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  BKMainFlowController *v23;
  id v24;
  id v25;
  _QWORD *v26;
  BOOL v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  BOOL v32;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setTransitioningDelegate:", self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001A67CC;
  v28[3] = &unk_1008EE168;
  v31 = v9;
  v28[4] = self;
  v32 = v6;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController presenterModalPresentingViewController](self, "presenterModalPresentingViewController"));
  v29 = v10;
  v11 = v8;
  v30 = v11;
  v12 = v9;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1001A6918;
  v22 = &unk_1008EE1B8;
  v27 = v6;
  v23 = self;
  v24 = v11;
  v26 = objc_retainBlock(v28);
  v13 = v10;
  v25 = v13;
  v14 = v26;
  v15 = v11;
  v16 = objc_retainBlock(&v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bc_descendentPresentedViewController", v19, v20, v21, v22, v23));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bc_descendentPresentedViewController"));
    objc_msgSend(v18, "dismissViewControllerAnimated:completion:", v6, v16);

  }
  else
  {
    ((void (*)(void ***))v16[2])(v16);
  }

}

- (id)_coverViewForPresenter:(id)a3 assetPresenter:(id)a4 includePresented:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;

  v5 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:", &OBJC_PROTOCOL___BCCoverAnimatingHost, &OBJC_PROTOCOL___BCCoverNonAnimating, v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetPresenterAssetID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _bookWithAssetPermanentOrTemporaryAssetID:](self, "_bookWithAssetPermanentOrTemporaryAssetID:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _coverSourceFromHost:assetPresenter:book:opening:](self, "_coverSourceFromHost:assetPresenter:book:opening:", v9, v8, v11, 1));
  LODWORD(v10) = objc_msgSend(v8, "stateDismissInProgress");

  if ((_DWORD)v10)
    objc_msgSend(v9, "coverAnimationHostScrollToMakeVisible:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "coverAnimationSourceView"));
  if (!v13)
  {
    v14 = sub_1001A5DCC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1006A3F60(v11, v15);

  }
  return v13;
}

- (void)presenterDismissModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void ***v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  BKMainFlowController *v19;
  id v20;
  BOOL v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[BKMainFlowController presenterVisibleViewControllerWillChangeAnimated:](self, "presenterVisibleViewControllerWillChangeAnimated:", v6);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1001A71C4;
  v17 = &unk_1008E7360;
  v10 = v8;
  v21 = v6;
  v19 = self;
  v20 = v9;
  v18 = v10;
  v11 = v9;
  v12 = objc_retainBlock(&v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bc_descendentPresentedViewController", v14, v15, v16, v17));
  if (v13)
    -[BKMainFlowController presenterDismissModalController:animated:completion:](self, "presenterDismissModalController:animated:completion:", v13, v6, v12);
  else
    ((void (*)(void ***))v12[2])(v12);

}

- (void)presenterDismissAllModalControllersAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bc_descendentPresentedViewController"));

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001A7390;
    v12[3] = &unk_1008E7388;
    v12[4] = self;
    v14 = v4;
    v13 = v6;
    -[BKMainFlowController presenterDismissModalController:animated:completion:](self, "presenterDismissModalController:animated:completion:", v9, v4, v12);

  }
  else
  {
    v10 = objc_retainBlock(v6);
    v11 = v10;
    if (v10)
      (*((void (**)(id))v10 + 2))(v10);

  }
}

- (BOOL)presenterCanShowStoreProductOnCurrentContent
{
  return 1;
}

- (void)presenterFinishModalTransitionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "isHostingRootBar");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController selectedNavigationController](self, "selectedNavigationController"));
    if (v7)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001A74A4;
      v11[3] = &unk_1008E7818;
      v12 = v4;
      objc_msgSend(v7, "im_finishOngoingModalTransitionAnimations:", v11);

    }
    else
    {
      v9 = objc_retainBlock(v4);
      v10 = v9;
      if (v9)
        (*((void (**)(id))v9 + 2))(v9);

    }
  }
  else
  {
    v8 = objc_retainBlock(v4);
    v7 = v8;
    if (v8)
      (*((void (**)(id))v8 + 2))(v8);
  }

}

- (void)presenterVisibleViewControllerDidChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneManager"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "minifiedFlowController"));

  objc_msgSend(v6, "visibleViewControllersUpdatedPostTranstionAnimated:", v3);
}

- (void)presenterSelectLibraryAllCollection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryAllIdentifier](BKRootBarItemsProvider, "LibraryAllIdentifier"));
  objc_msgSend(v3, "selectWithIdentifier:isUserAction:", v2, 1);

}

- (void)presenterFixInterfaceOrientationIfNeededWithAssetPresenter:(id)a3 completion:(id)a4
{
  -[BKMainFlowController _fixInterfaceOrientationForEndOfBookTransitionForDismissingViewController:completion:](self, "_fixInterfaceOrientationForEndOfBookTransitionForDismissingViewController:completion:", a3, a4);
}

- (void)presenterPrepareEndOfBookExperienceWithAssetPresenter:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(BKAssetPresentationController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentationController"));
  v10 = BUDynamicCast(v8, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController selectedNavigationController](self, "selectedNavigationController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController navigationControllerWithIdentifier:](self, "navigationControllerWithIdentifier:", v12));

  objc_msgSend(v14, "setUseEndOfBookExperience:", v11 == v13);
  -[BKMainFlowController _updateReadingNowFeedWithAssetPresenter:completion:](self, "_updateReadingNowFeedWithAssetPresenter:completion:", v7, v6);

}

- (void)presenterUpdateReadingNowAssetVisibility:(BOOL)a3 assetPresenter:(id)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v6 = a4;
  v7 = -[BKMainFlowController _closeToCurrentBookWithAssetPresenter:opening:](self, "_closeToCurrentBookWithAssetPresenter:opening:", v6, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _refIdFromAssetPresenter:closeToCurrentBook:](self, "_refIdFromAssetPresenter:closeToCurrentBook:", v6, v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _refInstanceFromAssetPresenter:closeToCurrentBook:](self, "_refInstanceFromAssetPresenter:closeToCurrentBook:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetPresenterAssetViewController"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:", &OBJC_PROTOCOL___BCCoverAnimatingHost, &OBJC_PROTOCOL___BCCoverNonAnimating, 1));

  if ((objc_opt_respondsToSelector(v11, "coverAnimationHostUpdateItemVisibility:refId:refInstance:") & 1) != 0)
    objc_msgSend(v11, "coverAnimationHostUpdateItemVisibility:refId:refInstance:", v4, v12, v8);

}

- (void)presenterDidStartReadingExperienceWithAssetPresenter:(id)a3
{
  -[BKMainFlowController _updateReadingNowFeedWithPerformantForReadingExperience:for:](self, "_updateReadingNowFeedWithPerformantForReadingExperience:for:", 1, a3);
}

- (void)presenterDidEndReadingExperienceWithAssetPresenter:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  -[BKMainFlowController _updateReadingNowFeedWithPerformantForReadingExperience:for:](self, "_updateReadingNowFeedWithPerformantForReadingExperience:for:", 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController presenterModalPresentingViewController](self, "presenterModalPresentingViewController"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childViewControllers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "view"));
        objc_msgSend(v10, "setAccessibilityElementsHidden:", 0);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)presenterEnsureCanOpenBookInCurrentContext:(BOOL)a3
{
  void *v5;
  unsigned int v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "isHostingRootBar");

  if (v6 && !-[BKMainFlowController presenterIsShowingLibrary](self, "presenterIsShowingLibrary") && !a3)
    -[BKMainFlowController presenterSelectLibraryAllCollection](self, "presenterSelectLibraryAllCollection");
}

- (BOOL)isBookCurrentlyOpen
{
  id WeakRetained;
  void *v3;
  void *v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "im_firstVisibleChildConformingToProtocol:includePresented:", &OBJC_PROTOCOL___BKAssetPresenting, 1));
  v5 = v4 != 0;

  return v5;
}

- (BOOL)presenterShouldOpenBookUsingLargeCover
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController presenterFirstVisibleChildConformingToProtocol:](self, "presenterFirstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));
  if (v3)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
    if (!objc_msgSend(v5, "isHostingRootBar")
      || -[BKMainFlowController presenterIsShowingLibrary](self, "presenterIsShowingLibrary")
      || -[BKMainFlowController presenterIsShowingStore](self, "presenterIsShowingStore"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appLaunchCoordinator"));
      v4 = objc_msgSend(v7, "appLaunchCoordinatorHasAppLaunched") ^ 1;

    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

- (void)showLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  _QWORD v10[4];
  BOOL v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v8 = objc_msgSend(v7, "isUserSignedInToiTunes");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BDSJaliscoDAAPClient sharedClient](BDSJaliscoDAAPClient, "sharedClient"));
    objc_msgSend(v9, "updatePolitely:reason:completion:", 1, 4, 0);

  }
  -[BKMainFlowController presenterSelectLibraryAllCollection](self, "presenterSelectLibraryAllCollection");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A7B4C;
  v10[3] = &unk_1008EE100;
  v11 = a3;
  -[BKMainFlowController _transition:animator:completion:](self, "_transition:animator:completion:", v10, 0, v6);

}

- (void)showLibraryAnimated:(BOOL)a3 assetID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  BOOL v22;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v11 = objc_msgSend(v10, "isUserSignedInToiTunes");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BDSJaliscoDAAPClient sharedClient](BDSJaliscoDAAPClient, "sharedClient"));
    objc_msgSend(v12, "updatePolitely:reason:completion:", 1, 4, 0);

  }
  -[BKMainFlowController presenterSelectLibraryAllCollection](self, "presenterSelectLibraryAllCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryAllIdentifier](BKRootBarItemsProvider, "LibraryAllIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationControllerForIdentifier:", v14));

  v16 = objc_msgSend(v15, "popToRootViewControllerAnimated:", 0);
  v17 = objc_opt_class(BKLibraryBookshelfCollectionViewController);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topViewController"));
  v19 = BUDynamicCast(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  objc_msgSend(v20, "scrollToMakeLibraryAssetIDVisible:", v9);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001A7D08;
  v21[3] = &unk_1008EE100;
  v22 = a3;
  -[BKMainFlowController _transition:animator:completion:](self, "_transition:animator:completion:", v21, 0, v8);

}

- (id)_bookWithAssetPermanentOrTemporaryAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController libraryAssetProvider](self, "libraryAssetProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:", v4));

  return v6;
}

- (id)_coverImageForAssetID:(id)a3 toViewController:(id)a4 forAssetViewController:(id)a5 source:(id)a6 coverImage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  double v27;
  double v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  __n128 v36;
  double v37;
  double v38;
  uint64_t Image;
  CGImage *v40;
  uint64_t ImageWithStyle;
  CGImage *v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    if (v15)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coverAnimationSourceImage"));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
      objc_msgSend(v17, "bounds");
      v19 = v18;
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _bookWithAssetPermanentOrTemporaryAssetID:](self, "_bookWithAssetPermanentOrTemporaryAssetID:", v12));
      if (!v22
        || (BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKMainFlowController.m", 592, "-[BKMainFlowController _coverImageForAssetID:toViewController:forAssetViewController:source:coverImage:]", "NO", CFSTR("waiting for cover on main thread; this means there's a book-open path that doesn't specify coverImage; please file bug.")),
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager fetchImageForAsset:size:includeSpine:coverEffectsEnvironment:](BKLibraryManager, "fetchImageForAsset:size:includeSpine:coverEffectsEnvironment:", v22, 1, self, v19, v21)), v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", objc_msgSend(v23, "CGImage"))), v23, !v24))
      {
        v25 = objc_msgSend(v22, "isRightToLeft");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v26, "scale");
        v28 = v27;
        v29 = objc_msgSend(v22, "isPreorderBook");
        v30 = 256;
        if (!v29)
          v30 = 0;
        v31 = v30 | v25;
        v32 = objc_msgSend(v22, "isAudiobook");
        v33 = 0x10000;
        if (!v32)
          v33 = 0;
        v34 = v31 | v33;

        v35 = CGSizeScale(v19, v21, v28);
        v37 = v35;
        v38 = v36.n128_f64[0];
        if (v22
          || (ImageWithStyle = BKGenericBookCoverCreateImageWithStyle(0, 0, *(_QWORD *)&v28, v34, 0, 0, 7, v35, v36)) == 0)
        {
          Image = BKGenericBookCoverCreateImage(0, 0, *(_QWORD *)&v28, v34, v37, v38);
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", Image));
          v40 = (CGImage *)Image;
        }
        else
        {
          v42 = (CGImage *)ImageWithStyle;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", ImageWithStyle));
          v40 = v42;
        }
        CGImageRelease(v40);
      }
      v16 = v24;

    }
  }

  return v16;
}

- (id)_minibarRevealAnimatorWithViewController:(id)a3 opening:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BKMinibarRevealAnimator *v12;

  v4 = a4;
  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKAssetPresenting, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedFlowController"));

  if (v6
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetPresenterAssetID")),
        v11 = objc_msgSend(v9, "shouldAnimateAssetWithAssetIDFromMinibar:", v10),
        v10,
        v11))
  {
    v12 = -[BKMinibarRevealAnimator initWithOpening:]([BKMinibarRevealAnimator alloc], "initWithOpening:", v4);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_bookAndCoverAnimatorFrom:(id)a3 to:(id)a4 operation:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  BCCoverAnimatingSource *v24;
  BCCoverAnimatingSource *v25;
  BCCoverAnimatingSource *v26;
  BCCoverAnimatingSource *endOfBookCoverAnimationSource;
  BCCoverAnimatingSource *v28;
  _QWORD *v29;
  uint64_t v30;
  BCCoverAnimatingSource *v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  __CFString *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  BCCoverAnimatingSource *v56;
  id v57;
  BKMainFlowController *v58;
  id v59;
  id v60;
  char v61;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:", &OBJC_PROTOCOL___BCCoverAnimatingHost, &OBJC_PROTOCOL___BCCoverNonAnimating, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "im_firstVisibleChildConformingToProtocol:includePresented:", &OBJC_PROTOCOL___BKAssetPresenting, 0));
  v12 = v11 == 0;

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "im_firstVisibleChildConformingToProtocol:includePresented:", &OBJC_PROTOCOL___BKAssetPresenting, v12));
  v14 = (void *)v13;
  if (v10)
    v15 = v13 == 0;
  else
    v15 = 1;
  v16 = !v15;
  if (!v15)
  {
    if (a5 == 1)
    {
      v17 = (id)v13;
      v18 = v10;
      goto LABEL_10;
    }
LABEL_18:

    endOfBookCoverAnimationSource = self->_endOfBookCoverAnimationSource;
    self->_endOfBookCoverAnimationSource = 0;

    v20 = 0;
    v17 = 0;
    v18 = 0;
    v22 = 0;
    goto LABEL_24;
  }
  if (a5 != 2)
    goto LABEL_18;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetPresenterPermanentOrTemporaryAssetID"));
  v20 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _bookWithAssetPermanentOrTemporaryAssetID:](self, "_bookWithAssetPermanentOrTemporaryAssetID:", v21));

  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:validateItem:", &OBJC_PROTOCOL___BCCoverAnimatingHost, &OBJC_PROTOCOL___BCCoverNonAnimating, 1, v20));
  v22 = 0;
  v23 = v17 != 0;
  if (v18 && v17)
  {
    if (v20)
    {
LABEL_15:
      v24 = self->_endOfBookCoverAnimationSource;
      if (v24)
      {
        v25 = v24;
LABEL_17:
        v26 = v25;
LABEL_20:
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_1001A8574;
        v53[3] = &unk_1008EE208;
        v17 = v17;
        v54 = v17;
        v20 = v20;
        v61 = v16;
        v55 = v20;
        v56 = v26;
        v18 = v18;
        v57 = v18;
        v58 = self;
        v59 = v9;
        v60 = v8;
        v28 = v26;
        v29 = objc_retainBlock(v53);
        v30 = ((uint64_t (*)(_QWORD *, _QWORD))v29[2])(v29, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v30);

        v23 = 1;
        goto LABEL_21;
      }
      v26 = (BCCoverAnimatingSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetPresenterCoverAnimationSource"));
      if (v26)
        goto LABEL_20;
      if ((objc_opt_respondsToSelector(v18, "coverAnimationHostSourceForUUID:uid:refId:refInstance:") & 1) == 0)
      {
        v26 = 0;
        goto LABEL_38;
      }
      if (v16)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "openOptions"));
      }
      else
      {
        v34 = objc_opt_class(BKAssetPresentationController);
        v35 = objc_opt_class(UIViewController);
        v36 = BUDynamicCast(v35, v17);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v37, "presentationController"));
        v39 = BUDynamicCast(v34, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

        LOBYTE(v37) = objc_msgSend(v40, "useEndOfBookExperience");
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "openOptions"));
        v33 = (void *)v41;
        if ((v37 & 1) != 0)
        {
          v51 = (void *)v41;
          v52 = 0;
          v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetPresenterAssetID"));
          v50 = CFSTR("currentBook");
LABEL_37:
          v48 = (void *)v49;
          v26 = (BCCoverAnimatingSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverAnimationHostSourceForUUID:uid:refId:refInstance:", 0, v52, v50, v49, v49));

LABEL_38:
          if (v26 || !v20)
            goto LABEL_20;
          v25 = (BCCoverAnimatingSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverAnimationHostSourceForItem:", v20));
          goto LABEL_17;
        }
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromUid")));
      v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromRefId")));
      v43 = (void *)v42;
      v44 = CFSTR("cover");
      if (v42)
        v44 = (__CFString *)v42;
      v50 = v44;

      v51 = v33;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromRefInstance")));
      v46 = v45;
      if (v45)
        v47 = v45;
      else
        v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetPresenterAssetID"));
      v49 = (uint64_t)v47;

      goto LABEL_37;
    }
LABEL_10:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetPresenterPermanentOrTemporaryAssetID"));
    v20 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _bookWithAssetPermanentOrTemporaryAssetID:](self, "_bookWithAssetPermanentOrTemporaryAssetID:", v19));

    goto LABEL_15;
  }
LABEL_21:
  v31 = self->_endOfBookCoverAnimationSource;
  self->_endOfBookCoverAnimationSource = 0;

  if (!v22 && v23)
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[BKCrossFadeTransition transitionWithDuration:](BKCrossFadeTransition, "transitionWithDuration:", 0.25));
LABEL_24:

  return v22;
}

- (id)_coverSourceFromHost:(id)a3 assetPresenter:(id)a4 book:(id)a5 opening:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  BCCoverAnimatingSource *endOfBookCoverAnimationSource;
  BCCoverAnimatingSource *v14;
  BCCoverAnimatingSource *v15;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  endOfBookCoverAnimationSource = self->_endOfBookCoverAnimationSource;
  if (endOfBookCoverAnimationSource)
  {
    v14 = endOfBookCoverAnimationSource;
  }
  else
  {
    v15 = (BCCoverAnimatingSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetPresenterCoverAnimationSource"));
    if (v15)
      goto LABEL_5;
    if ((objc_opt_respondsToSelector(v10, "coverAnimationHostSourceForUUID:uid:refId:refInstance:") & 1) != 0)
    {
      v17 = -[BKMainFlowController _closeToCurrentBookWithAssetPresenter:opening:](self, "_closeToCurrentBookWithAssetPresenter:opening:", v11, v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "openOptions"));
      v19 = v18;
      v20 = v17
          ? 0
          : (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromUid")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _refIdFromAssetPresenter:closeToCurrentBook:](self, "_refIdFromAssetPresenter:closeToCurrentBook:", v11, v17));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _refInstanceFromAssetPresenter:closeToCurrentBook:](self, "_refInstanceFromAssetPresenter:closeToCurrentBook:", v11, v17));
      v15 = (BCCoverAnimatingSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "coverAnimationHostSourceForUUID:uid:refId:refInstance:", 0, v20, v21, v22));

      if (v15)
        goto LABEL_5;
    }
    v14 = (BCCoverAnimatingSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "coverAnimationHostSourceForItem:", v12));
  }
  v15 = v14;
LABEL_5:
  if (!v6 && v15 && objc_msgSend(v10, "coverAnimationHostWantsScrollOnClose"))
    objc_msgSend(v10, "coverAnimationHostScrollToMakeVisible:", v15);

  return v15;
}

- (BOOL)_closeToCurrentBookWithAssetPresenter:(id)a3 opening:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a4)
    return 0;
  v5 = a3;
  v6 = objc_opt_class(BKAssetPresentationController);
  v7 = objc_opt_class(UIViewController);
  v8 = BUDynamicCast(v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentationController"));
  v11 = BUDynamicCast(v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  LOBYTE(v10) = objc_msgSend(v12, "useEndOfBookExperience");
  return (char)v10;
}

- (id)_refIdFromAssetPresenter:(id)a3 closeToCurrentBook:(BOOL)a4
{
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "openOptions"));
  v6 = v5;
  if (a4)
  {
    v7 = CFSTR("currentBook");
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromRefId")));
    v9 = (void *)v8;
    v10 = CFSTR("cover");
    if (v8)
      v10 = (__CFString *)v8;
    v7 = v10;

  }
  return v7;
}

- (id)_refInstanceFromAssetPresenter:(id)a3 closeToCurrentBook:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "openOptions"));
  v7 = v6;
  if (a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetPresenterAssetID"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKBookPresentingAnimateFromRefInstance")));
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetPresenterAssetID"));
    v8 = v11;

  }
  return v8;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController selectedNavigationController](self, "selectedNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
  v7 = BUProtocolCast(&OBJC_PROTOCOL___BKAssetPresenting, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8 || -[BKMainFlowController presenterIsShowingLibrary](self, "presenterIsShowingLibrary"))
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
    v9 = (unint64_t)objc_msgSend(v10, "count") > 1;

  }
  return v9;
}

- (void)presenterWaitForAssetPresenterTransitionsToFinishIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  objc_msgSend(v5, "im_finishOngoingModalTransitionAnimations:", v4);

}

- (void)presenterSelectTabWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  objc_msgSend(v5, "selectWithIdentifier:isUserAction:", v4, 1);

}

- (id)_animatorFromViewController:(id)a3 toViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = 0;
  if (v10 != v11 && v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController animator](self, "animator"));
    if (!v12)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _minibarRevealAnimatorWithViewController:opening:](self, "_minibarRevealAnimatorWithViewController:opening:", v11, 1));
      if (!v12)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _minibarRevealAnimatorWithViewController:opening:](self, "_minibarRevealAnimatorWithViewController:opening:", v10, 0));
        if (!v12)
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _bookAndCoverAnimatorFrom:to:operation:](self, "_bookAndCoverAnimatorFrom:to:operation:", v10, v11, a5));
      }
    }
  }

  return v12;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController animator](self, "animator"));
  if (v12)
  {
    v13 = BUProtocolCast(&OBJC_PROTOCOL___BKContentOpenStatusBarStyling, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[BKMainFlowController setStatusBarStyling:](self, "setStatusBarStyling:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController statusBarStyling](self, "statusBarStyling"));
    objc_msgSend(v15, "configureWithFromViewController:toViewController:", v10, v11);

    objc_msgSend(v9, "setNeedsStatusBarAppearanceUpdate");
  }

  return v12;
}

- (void)im_navigationController:(id)a3 dismissChildViewController:(id)a4 animated:(BOOL)a5
{
  -[BKMainFlowController im_dismissChildViewController:animated:](self, "im_dismissChildViewController:animated:", a4, a5);
}

- (void)_fixInterfaceOrientationForEndOfBookTransitionForDismissingViewController:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  unsigned int v17;
  id v18;
  void *v19;
  id v20;

  v20 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController navigationControllerWithIdentifier:](self, "navigationControllerWithIdentifier:", v7));

  v9 = objc_opt_class(BSUIFeedViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = BUDynamicCast(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bc_windowForViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "windowScene"));
  v16 = (char *)objc_msgSend(v15, "interfaceOrientation");

  v17 = objc_msgSend(v13, "supportedInterfaceOrientationsForSelf");
  if ((unint64_t)(v16 - 3) > 1 || (v17 & (1 << (char)v16)) != 0)
  {
    v18 = objc_retainBlock(v20);
    v19 = v18;
    if (v18)
      (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);

  }
  else
  {
    -[BKMainFlowController _forceOrientationToPortrait:](self, "_forceOrientationToPortrait:", v20);
  }

}

- (void)_updateReadingNowFeedWithAssetPresenter:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (v19)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController navigationControllerWithIdentifier:](self, "navigationControllerWithIdentifier:", v7));

    v9 = objc_opt_class(BSUIFeedViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v12 = BUDynamicCast(v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewIfLoaded"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewIfLoaded"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));

      if (v17 == v15)
        objc_msgSend(v13, "updateFeedContentWithCompletion:", v6);
    }

  }
  else
  {
    v18 = objc_retainBlock(v6);
    v8 = v18;
    if (v18)
      (*((void (**)(id))v18 + 2))(v18);
  }

}

- (void)_updateReadingNowFeedWithPerformantForReadingExperience:(BOOL)a3 for:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v17 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController navigationControllerWithIdentifier:](self, "navigationControllerWithIdentifier:", v6));

  v8 = objc_opt_class(BSUIFeedViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v11 = BUDynamicCast(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewIfLoaded"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewIfLoaded"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));

    if (v16 == v14)
      objc_msgSend(v12, "setPerformantForReadingExperience:", v4);
  }

}

- (BOOL)_currentlySelectedTabIsStore
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController rootBarCoordinator](self, "rootBarCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  LOBYTE(v2) = +[BKRootBarItemsProvider isStoreOnlyFor:](BKRootBarItemsProvider, "isStoreOnlyFor:", v4);
  return (char)v2;
}

- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController selectedNavigationController](self, "selectedNavigationController"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001A9520;
  v9[3] = &unk_1008E7D78;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "im_finishOngoingModalTransitionAnimations:", v9);

}

- (BOOL)_doesPreviousViewControllerSupportCurrentOrientation
{
  return 1;
}

- (void)_forceOrientationToPortrait:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = objc_opt_class(_BCWindowScene);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bc_windowForViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));
  v10 = BUDynamicCast(v5, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001A9918;
    v16[3] = &unk_1008E9F90;
    v17 = v4;
    objc_msgSend(v11, "attemptRotateToPortraitWithCompletion:", v16);
    v12 = v17;
  }
  else
  {
    v13 = sub_1001A5DCC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1006A3FEC(v14);

    v15 = objc_retainBlock(v4);
    v12 = v15;
    if (v15)
      (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

- (unint64_t)coverEffectsContent
{
  return 0;
}

- (BOOL)coverEffectsNightMode
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController presenterFirstVisibleChildConformingToProtocol:](self, "presenterFirstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BCUCoverEffectsEnvironment));
  v3 = objc_msgSend(v2, "coverEffectsNightMode");

  return v3;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(BKAssetPresentingViewController);
  v10 = BUDynamicCast(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (+[BKUIPFeatures useUIPFluidBookOpenTransition](BKUIPFeatures, "useUIPFluidBookOpenTransition")
    && !objc_msgSend(v11, "useLegacyAnimation"))
  {
    v12 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _animatorFromViewController:toViewController:operation:animated:](self, "_animatorFromViewController:toViewController:operation:animated:", v8, v7, 1, 1));
  }

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BKCloseBookAnimator *v17;
  void *v18;
  BKCloseBookAnimator *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location[2];

  v4 = a3;
  v5 = objc_opt_class(BKAssetPresentingViewController);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (+[BKUIPFeatures useUIPFluidBookOpenTransition](BKUIPFeatures, "useUIPFluidBookOpenTransition")
    && !objc_msgSend(v7, "useLegacyAnimation"))
  {
    v19 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetPresenterAssetViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetPresenterAssetID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _bookWithAssetPermanentOrTemporaryAssetID:](self, "_bookWithAssetPermanentOrTemporaryAssetID:", v10));

    v12 = objc_msgSend(v9, "readerType");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));
    v14 = v13;
    if (v12 == (id)6)
    {
      v32 = v7;
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:", &OBJC_PROTOCOL___BCCoverAnimatingHost, &OBJC_PROTOCOL___BCCoverNonAnimating, 1));

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetPresenterAssetViewController"));
      v30 = (void *)v15;
      v31 = v11;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _coverSourceFromHost:assetPresenter:book:opening:](self, "_coverSourceFromHost:assetPresenter:book:opening:", v15, v8, v11, 0));
      v17 = [BKCloseBookAnimator alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController bookOpenAnimationHelper](self, "bookOpenAnimationHelper"));
      v19 = -[BKCloseBookAnimator initWithContentHelper:coverSource:](v17, "initWithContentHelper:coverSource:", v18, v16);

      objc_initWeak(location, self);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1001A9DFC;
      v36[3] = &unk_1008EAF88;
      objc_copyWeak(&v38, location);
      v20 = v8;
      v37 = v20;
      -[BKCloseBookAnimator setAnimationComplete:](v19, "setAnimationComplete:", v36);
      v21 = BUProtocolCast(&OBJC_PROTOCOL___BCCoverAnimatingCurrentBookSource, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "coverAnimationSourceCurrentBookWidgetInfo"));
      v24 = objc_msgSend(v23, "isCover");
      if (v22)
        v25 = v24;
      else
        v25 = 1;
      if ((v25 & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetPresenterAssetID"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetPresenterCoverImage"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _coverImageForAssetID:toViewController:forAssetViewController:source:coverImage:](self, "_coverImageForAssetID:toViewController:forAssetViewController:source:coverImage:", v26, v4, v33, v16, v27));
        -[BKCloseBookAnimator setCoverImage:](v19, "setCoverImage:", v28);

      }
      else
      {
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1001A9E3C;
        v34[3] = &unk_1008EE280;
        v35 = v22;
        -[BKCloseBookAnimator setSpreadSnapshot:](v19, "setSpreadSnapshot:", v34);
        v26 = v35;
      }

      objc_destroyWeak(&v38);
      objc_destroyWeak(location);

      v11 = v31;
      v7 = v32;
    }
    else
    {
      v19 = (BKCloseBookAnimator *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController _animatorFromViewController:toViewController:operation:animated:](self, "_animatorFromViewController:toViewController:operation:animated:", v4, v13, 2, 1));

    }
  }

  return v19;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  BKAssetPresentationController *v9;

  v6 = a3;
  v7 = a4;
  v8 = BUProtocolCast(&OBJC_PROTOCOL___BKAssetPresenting, v6);
  v9 = (BKAssetPresentationController *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
    v9 = -[BKAssetPresentationController initWithPresentedViewController:presentingViewController:]([BKAssetPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v6, v7);

  return v9;
}

- (void)saveStateClosing:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMainFlowController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "im_firstVisibleChildConformingToProtocol:", &OBJC_PROTOCOL___AEAssetViewController));

  objc_msgSend(v6, "saveStateClosing:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedFlowController"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "minifiedAssetPresenters", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "minifiedAssetPresenterIsAudiobook"))
          objc_msgSend(v15, "minifiedAssetPresenterSaveStateClosing:", v3);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return (BKLibraryAssetProvider *)objc_loadWeakRetained((id *)&self->_libraryAssetProvider);
}

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (void)setStatusBarStyling:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarStyling, a3);
}

- (UIViewController)transitionPreviousTopViewController
{
  return self->_transitionPreviousTopViewController;
}

- (void)setTransitionPreviousTopViewController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPreviousTopViewController, a3);
}

- (unint64_t)viewType
{
  return self->_viewType;
}

- (void)setViewType:(unint64_t)a3
{
  self->_viewType = a3;
}

- (BCCoverAnimatingSource)endOfBookCoverAnimationSource
{
  return self->_endOfBookCoverAnimationSource;
}

- (void)setEndOfBookCoverAnimationSource:(id)a3
{
  objc_storeStrong((id *)&self->_endOfBookCoverAnimationSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endOfBookCoverAnimationSource, 0);
  objc_storeStrong((id *)&self->_transitionPreviousTopViewController, 0);
  objc_destroyWeak((id *)&self->_statusBarStyling);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_destroyWeak((id *)&self->_libraryAssetProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BKContentOpenAnimationHelper)bookOpenAnimationHelper
{
  BKMainFlowController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)BKMainFlowController.bookOpenAnimationHelper.getter();

  return (BKContentOpenAnimationHelper *)v3;
}

- (void)setBookOpenAnimationHelper:(id)a3
{
  sub_100011B68(self, (uint64_t)a2, a3, &unk_100A1F100);
}

- (BKMainFlowControllerDockingDelegate)dockingDelegate
{
  BKMainFlowController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)BKMainFlowController.dockingDelegate.getter();

  return (BKMainFlowControllerDockingDelegate *)v3;
}

- (void)setDockingDelegate:(id)a3
{
  sub_100011B68(self, (uint64_t)a2, a3, &unk_100A1F101);
}

- (void)setNavigationDelegate:(id)a3
{
  sub_100011B68(self, (uint64_t)a2, a3, &unk_100A1F102);
}

@end

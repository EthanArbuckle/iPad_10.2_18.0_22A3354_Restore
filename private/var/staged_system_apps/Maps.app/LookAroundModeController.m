@implementation LookAroundModeController

- (LookAroundModeController)initWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  id v13;
  id v14;
  LookAroundModeController *v15;
  LookAroundContainerViewController *v16;
  LookAroundContainerViewController *containerViewController;
  objc_super v19;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  v13 = a3;
  v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)LookAroundModeController;
  v15 = -[LookAroundModeController init](&v19, "init");
  if (v15)
  {
    v16 = -[LookAroundContainerViewController initWithEntryPoint:lookAroundView:showsFullScreen:]([LookAroundContainerViewController alloc], "initWithEntryPoint:lookAroundView:showsFullScreen:", v13, v14, v10);
    containerViewController = v15->_containerViewController;
    v15->_containerViewController = v16;

    -[ContainerViewController setAllowOnlyStandardStyle:](v15->_containerViewController, "setAllowOnlyStandardStyle:", 0);
    -[LookAroundContainerViewController setAnimationDelegate:](v15->_containerViewController, "setAnimationDelegate:", v15);
    -[LookAroundContainerViewController setOriginFrame:](v15->_containerViewController, "setOriginFrame:", x, y, width, height);
    -[ContainerViewController setChromeContext:](v15->_containerViewController, "setChromeContext:", v15);
  }

  return v15;
}

- (BOOL)isDisplayingLookAroundPIP
{
  return -[LookAroundContainerViewController isDisplayingLookAroundPIP](self->_containerViewController, "isDisplayingLookAroundPIP");
}

- (LookAroundActionCoordination)actionCoordinator
{
  return (LookAroundActionCoordination *)-[LookAroundContainerViewController actionCoordinator](self->_containerViewController, "actionCoordinator");
}

- (IOSBasedChromeViewController)chromeViewController
{
  return -[ContainerViewController chromeViewController](self->_containerViewController, "chromeViewController");
}

- (void)setChromeViewController:(id)a3
{
  -[ContainerViewController setChromeViewController:](self->_containerViewController, "setChromeViewController:", a3);
}

- (MKLookAroundView)lookAroundView
{
  return -[LookAroundContainerViewController lookAroundView](self->_containerViewController, "lookAroundView");
}

- (ShareItemSource)currentShareItemSource
{
  return -[LookAroundContainerViewController currentShareItemSource](self->_containerViewController, "currentShareItemSource");
}

- (id)mapViewDelegate
{
  return self->_containerViewController;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)wantsCompassLayoutControl
{
  return sub_1002A8AA0(self->_containerViewController) != 5;
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (void)mapInsetsDidChangeAnimated:(BOOL)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundModeController actionCoordinator](self, "actionCoordinator", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataCoordinator"));
  objc_msgSend(v3, "synchronizeMapViewIfNeeded");

}

- (id)personalizedItemSources
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchPinsManager"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultsItemSource"));
    v8[0] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "singleSearchResultItemSource"));
    v8[1] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));

  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)fullscreenViewControllerPresentationTransition
{
  return objc_alloc_init(ToLookAroundModeTransitionController);
}

- (id)fullscreenViewControllerDismissalTransition
{
  return objc_alloc_init(FromLookAroundModeTransitionController);
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)fullscreenViewController
{
  return self->_containerViewController;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008FB644;
  v4[3] = &unk_1011AE8F8;
  v4[4] = self;
  objc_msgSend(a4, "addCompletion:", v4);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008FB7AC;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addPreparation:", v4);
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = (void (**)(id, id))a3;
  v5 = -[LookAroundModeController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundModeController lookAroundView](self, "lookAroundView"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sceneTitle"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expandedSceneTitle"));
  v9 = (id)v8;

  v4[2](v4, v9);
}

- (void)prepareForExitWithCompletion:(id)a3
{
  -[LookAroundContainerViewController prepareForExitWithCompletion:](self->_containerViewController, "prepareForExitWithCompletion:", a3);
}

- (void)didCompleteModeTransition
{
  -[LookAroundContainerViewController didCompleteModeTransition](self->_containerViewController, "didCompleteModeTransition");
}

- (void)lookAroundContainerViewControllerDidAnimateFromModeTransition:(id)a3
{
  _LookAroundViewState *lookAroundViewState;
  id v4;

  lookAroundViewState = self->_lookAroundViewState;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lookAroundView"));
  -[_LookAroundViewState restoreStateToLookAroundView:](lookAroundViewState, "restoreStateToLookAroundView:", v4);

}

- (id)viewsToRenderMapsScreenshotService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self->_containerViewController, "chromeViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self->_containerViewController, "lookAroundView"));
  if (-[LookAroundModeController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v13 = v5;
    v7 = &v13;
LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("__internal_kScreenshotMultipages"));

  if (!v9)
  {
    v14 = v6;
    v7 = &v14;
    goto LABEL_6;
  }
  v15[0] = v6;
  v15[1] = v5;
  v7 = (void **)v15;
  v10 = 2;
LABEL_7:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, v10));

  return v11;
}

- (BOOL)wantsWeatherShowing
{
  return 0;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)wantsLookAroundShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5
{
  -[LookAroundContainerViewController animateTransitionToFullScreen:](self->_containerViewController, "animateTransitionToFullScreen:", a5, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundViewState, 0);
  objc_storeStrong((id *)&self->_mapViewState, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end

@implementation IOSTransitNavigationContext

- (IOSTransitNavigationContext)init
{
  IOSTransitNavigationContext *v2;
  IOSTransitContainerViewController *v3;
  IOSTransitContainerViewController *containerViewController;
  void *v5;
  void *v6;
  TransitSteppingAnalyticsDelegate *v7;
  TransitSteppingAnalyticsDelegate *analyticsDelegate;
  NavigationDebugViewsController *v9;
  NavigationDebugViewsController *debugViewsController;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IOSTransitNavigationContext;
  v2 = -[TransitNavigationContext init](&v13, "init");
  if (v2)
  {
    v3 = objc_alloc_init(IOSTransitContainerViewController);
    containerViewController = v2->_containerViewController;
    v2->_containerViewController = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v5, "userInterfaceIdiom") == (id)1)
    {
      -[ContainerViewController setAllowOnlyStandardStyle:](v2->_containerViewController, "setAllowOnlyStandardStyle:", 0);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      -[ContainerViewController setAllowOnlyStandardStyle:](v2->_containerViewController, "setAllowOnlyStandardStyle:", objc_msgSend(v6, "userInterfaceIdiom") != (id)5);

    }
    -[ContainerViewController setChromeContext:](v2->_containerViewController, "setChromeContext:", v2);
    -[ContainerViewController setContainerDelegate:](v2->_containerViewController, "setContainerDelegate:", v2);
    v7 = objc_alloc_init(TransitSteppingAnalyticsDelegate);
    analyticsDelegate = v2->_analyticsDelegate;
    v2->_analyticsDelegate = v7;

    v9 = -[NavigationDebugViewsController initWithDelegate:]([NavigationDebugViewsController alloc], "initWithDelegate:", v2);
    debugViewsController = v2->_debugViewsController;
    v2->_debugViewsController = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "_backlightLuminanceDidChange", CFSTR("BacklightLuminanceDidChangeNotification"), 0);

  }
  return v2;
}

- (id)fullscreenViewController
{
  return self->_containerViewController;
}

- (BOOL)requiresStaleMapEffect
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  TransitNavigationTrayViewController *trayViewController;
  BOOL v11;
  TransitNavigationTrayViewController *v12;
  TransitNavigationTrayViewController *v13;
  _QWORD v14[5];
  char v15;
  _QWORD v16[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IOSTransitNavigationContext;
  v6 = a4;
  -[TransitNavigationContext becomeTopContextInChromeViewController:withAnimation:](&v17, "becomeTopContextInChromeViewController:withAnimation:", a3, v6);
  v7 = objc_msgSend(v6, "isAnimated");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1005925FC;
  v16[3] = &unk_1011AC860;
  v16[4] = self;
  objc_msgSend(v6, "addPreparation:", v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1005928A8;
  v14[3] = &unk_1011ACE58;
  v14[4] = self;
  v15 = (char)v7;
  objc_msgSend(v6, "addAnimations:", v14);

  v8 = objc_claimAutoreleasedReturnValue(-[IOSTransitNavigationContext fetchCurrentRoute](self, "fetchCurrentRoute"));
  v9 = (void *)v8;
  trayViewController = self->_trayViewController;
  if (trayViewController)
    v11 = 1;
  else
    v11 = v8 == 0;
  if (!v11)
  {
    v12 = -[TransitNavigationTrayViewController initWithRoute:stepsListDelegate:]([TransitNavigationTrayViewController alloc], "initWithRoute:stepsListDelegate:", v8, self);
    v13 = self->_trayViewController;
    self->_trayViewController = v12;

    -[TransitNavigationTrayViewController setTrayDelegate:](self->_trayViewController, "setTrayDelegate:", self);
    trayViewController = self->_trayViewController;
  }
  -[ContainerViewController presentController:animated:useDefaultContaineeLayout:](self->_containerViewController, "presentController:animated:useDefaultContaineeLayout:", trayViewController, v7, 1);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  _QWORD v7[5];
  unsigned __int8 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOSTransitNavigationContext;
  v6 = a4;
  -[TransitNavigationContext resignTopContextInChromeViewController:withAnimation:](&v9, "resignTopContextInChromeViewController:withAnimation:", a3, v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100592998;
  v7[3] = &unk_1011ACE58;
  v7[4] = self;
  v8 = objc_msgSend(v6, "isAnimated");
  objc_msgSend(v6, "addPreparation:", v7);

}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (BOOL)shouldResetStateAfterResigning
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext route](self, "route"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep"));
  v6 = objc_msgSend(v4, "shouldReturnToRoutePickerWhenEndingDirectionsAtStepIndex:", objc_msgSend(v5, "stepIndex"));

  return v6 ^ 1;
}

- (id)fetchCurrentRoute
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_maps_platformController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));

  v5 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentRouteCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRoute"));

  return v9;
}

- (id)fetchLastLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastLocation"));

  return v3;
}

- (BOOL)isDisplayingManuallySelectedStep
{
  void *v2;
  BOOL v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v2, "displayedStepIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5 = objc_msgSend(v4, "displayedStepIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v3 = v5 != objc_msgSend(v6, "stepIndex");

  }
  return v3;
}

- (void)startRequestingRealtimeUpdates
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOSTransitNavigationContext;
  -[TransitNavigationContext startRequestingRealtimeUpdates](&v3, "startRequestingRealtimeUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v2, "resumeRealtimeUpdates");

}

- (void)stopRequestingRealtimeUpdates
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "pauseRealtimeUpdates");

  v4.receiver = self;
  v4.super_class = (Class)IOSTransitNavigationContext;
  -[TransitNavigationContext stopRequestingRealtimeUpdates](&v4, "stopRequestingRealtimeUpdates");
}

- (void)recenterOnActiveStep
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  if (-[IOSTransitNavigationContext isDisplayingManuallySelectedStep](self, "isDisplayingManuallySelectedStep"))
  {
    v3 = sub_10043309C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Returning to auto-advance step index (recenter button)", buf, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v5, "setDisplayedStepIndex:", 0x7FFFFFFFFFFFFFFFLL);

  }
  else
  {
    -[ContainerViewController setLayoutIfSupported:animated:](self->_containerViewController, "setLayoutIfSupported:animated:", 2, 1);
  }
  v6.receiver = self;
  v6.super_class = (Class)IOSTransitNavigationContext;
  -[TransitNavigationContext recenterOnActiveStep](&v6, "recenterOnActiveStep");
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  -[IOSTransitNavigationContext _didLeaveDefaultZoomPan](self, "_didLeaveDefaultZoomPan", a3);
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  -[IOSTransitNavigationContext _didLeaveDefaultZoomPan](self, "_didLeaveDefaultZoomPan", a3);
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  -[IOSTransitNavigationContext _didReturnToDefaultZoomPan](self, "_didReturnToDefaultZoomPan", a3);
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  -[IOSTransitNavigationContext _didReturnToDefaultZoomPan](self, "_didReturnToDefaultZoomPan", a3);
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  -[IOSTransitNavigationContext _didLeaveDefaultZoomPan](self, "_didLeaveDefaultZoomPan", a3, a4, a5);
}

- (BOOL)isCameraPanningOrZoomed
{
  return self->_cameraPanningOrZoomed;
}

- (void)_didLeaveDefaultZoomPan
{
  id v3;

  if (!self->_cameraPanningOrZoomed)
  {
    self->_cameraPanningOrZoomed = 1;
    -[IOSTransitNavigationContext canRecenterDidChange](self, "canRecenterDidChange");
    v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self->_trayViewController, "cardPresentationController"));
    objc_msgSend(v3, "wantsLayout:", 1);

  }
}

- (void)_didReturnToDefaultZoomPan
{
  if (self->_cameraPanningOrZoomed)
  {
    self->_cameraPanningOrZoomed = 0;
    -[IOSTransitNavigationContext canRecenterDidChange](self, "canRecenterDidChange");
  }
}

- (void)willManuallyFrameStep
{
  self->_cameraPanningOrZoomed = 0;
}

- (void)willBeginDisplayingInSecureLockScreen
{
  -[ContainerViewController willBeginDisplayingInSecureLockScreen](self->_containerViewController, "willBeginDisplayingInSecureLockScreen");
}

- (void)transitNavigationTrayDidTapClose:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t v13[16];

  v4 = sub_10043309C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tray did tap close", v13, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSTransitNavigationContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platformController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSession"));
  v10 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  if (-[IOSTransitNavigationContext shouldResetStateAfterResigning](self, "shouldResetStateAfterResigning"))
    objc_msgSend(v8, "clearIfCurrentSession:", v12);
  else
    objc_msgSend(v8, "popIfCurrentSession:", v12);

}

- (void)directionsStepsListDidTapShareButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext route](self, "route", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSTransitNavigationContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext route](self, "route"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithRoute:includeRoutingApps:](ShareItem, "shareItemWithRoute:includeRoutingApps:", v6, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController view](self->_trayViewController, "view"));
    objc_msgSend(v9, "shareItem:sourceView:completion:", v7, v8, 0);

  }
}

- (void)directionsStepsListDidTapRAPButton:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext route](self, "route", a3));
  v5 = objc_msgSend(v4, "transportType") - 1;
  if (v5 > 5)
    v6 = 608;
  else
    v6 = dword_100E37A20[v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController displayedItemIndexForAnalytics](self->_trayViewController, "displayedItemIndexForAnalytics"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:transitStep:", 5013, v6, 0, v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController _maps_mapsSceneDelegate](self->_trayViewController, "_maps_mapsSceneDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rapPresenter"));
  objc_msgSend(v9, "presentReportAProblemForRouteFromEntryPoint:", v6);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  TransitSchedulesViewController *v8;
  id v9;

  v5 = a4;
  v6 = -[TransitNavigationContext currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController displayedItemIndexForAnalytics](self->_trayViewController, "displayedItemIndexForAnalytics"));
  +[GEOAPPortal captureUserAction:target:value:transitStep:](GEOAPPortal, "captureUserAction:target:value:transitStep:", 9040, v6, 0, v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "matchingRouteStep"));
  v8 = -[TransitSchedulesViewController initWithTransitRouteStep:]([TransitSchedulesViewController alloc], "initWithTransitRouteStep:", v9);
  -[ContaineeViewController setContaineeDelegate:](v8, "setContaineeDelegate:", self);
  -[ContainerViewController presentController:](self->_containerViewController, "presentController:", v8);

}

- (void)didReselectDisplayedStep
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  char *(__cdecl **v7)(const char *, int);

  v3 = sub_10043309C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = &index;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Reselected displayed step index %lu, docking the tray", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self->_trayViewController, "cardPresentationController"));
  objc_msgSend(v5, "wantsLayout:", 2);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32[2];
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clusteredVehicleItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clusteredSegment"));

  v10 = objc_msgSend(v9, "selectedRideOptionIndex");
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100593584;
  v31[3] = &unk_1011BBF08;
  v32[1] = v10;
  objc_copyWeak(v32, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController clusteredVehiclesSelectionAlertControllerForClusteredSegment:completion:](UIAlertController, "clusteredVehiclesSelectionAlertControllerForClusteredSegment:completion:", v9, v31));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "popoverPresentationController"));
  objc_msgSend(v14, "setSourceView:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v7, "bounds");
  objc_msgSend(v15, "convertRect:fromView:", v7);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "popoverPresentationController"));
  objc_msgSend(v24, "setSourceRect:", v17, v19, v21, v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "popoverPresentationController"));
  objc_msgSend(v25, "setPermittedArrowDirections:", 3);

  objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v27 = -[TransitNavigationContext currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v28 = MapsAnalyticsEventValueForClusteredSegment(v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController displayedItemIndexForAnalytics](self->_trayViewController, "displayedItemIndexForAnalytics"));
  objc_msgSend(v26, "captureUserAction:onTarget:eventValue:transitStep:", 3037, v27, v29, v30);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateDisplayedGuidanceStep:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  IOSTransitNavigationContext *v12;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext displayedStep](self, "displayedStep"));
  v13.receiver = self;
  v13.super_class = (Class)IOSTransitNavigationContext;
  -[TransitNavigationContext transitDirectionsStepsListDataSource:didUpdateDisplayedGuidanceStep:](&v13, "transitDirectionsStepsListDataSource:didUpdateDisplayedGuidanceStep:", v7, v6);

  if (!v8 || (v9 = objc_msgSend(v8, "stepIndex"), v9 != objc_msgSend(v6, "stepIndex")))
  {
    -[TransitNavigationTrayViewController updateForCurrentDisplayedStep](self->_trayViewController, "updateForCurrentDisplayedStep");
    -[TransitNavigationTrayViewController updateBacklightSceneEnvironment](self->_trayViewController, "updateBacklightSceneEnvironment");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100593704;
    v10[3] = &unk_1011AC8B0;
    v11 = v8;
    v12 = self;
    -[IOSTransitNavigationContext _performWhenTrayPresented:](self, "_performWhenTrayPresented:", v10);

  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateActiveGuidanceStep:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IOSTransitNavigationContext;
  -[TransitNavigationContext transitDirectionsStepsListDataSource:didUpdateActiveGuidanceStep:](&v15, "transitDirectionsStepsListDataSource:didUpdateActiveGuidanceStep:", v6, v7);
  -[IOSTransitNavigationContext _updateArrivalEndTimerIfNeeded](self, "_updateArrivalEndTimerIfNeeded");
  v8 = objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep")),
        v11 = objc_msgSend(v10, "stepIndex"),
        v12 = objc_msgSend(v7, "stepIndex"),
        v10,
        v9,
        v11 == v12))
  {
    -[TransitNavigationTrayViewController updateBacklightSceneEnvironment](self->_trayViewController, "updateBacklightSceneEnvironment");
  }
  else
  {
    v13 = -[TransitNavigationContext currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedItemIndexForAnalytics"));
    +[GEOAPPortal captureUserAction:target:value:transitStep:](GEOAPPortal, "captureUserAction:target:value:transitStep:", 3066, v13, 0, v14);

  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 willExpandItem:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self->_trayViewController, "cardPresentationController", a3, a4));
  objc_msgSend(v4, "wantsLayout:", 3);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsForSegments:(id)a4
{
  IOSTransitContainerViewController *containerViewController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  containerViewController = self->_containerViewController;
  v5 = a4;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](containerViewController, "currentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController _maps_alertControllerForTicketedSegments:](UIAlertController, "_maps_alertControllerForTicketedSegments:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v8, "setSourceView:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v19, "setPermittedArrowDirections:", 12);

  objc_msgSend(v20, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = -[TransitNavigationContext currentUITargetForAnalytics](self, "currentUITargetForAnalytics", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController displayedItemIndexForAnalytics](self->_trayViewController, "displayedItemIndexForAnalytics"));
  +[GEOAPPortal captureUserAction:target:value:transitStep:](GEOAPPortal, "captureUserAction:target:value:transitStep:", 4, v5, 0, v6);

  -[ContainerViewController popLastViewControllerAnimated:](self->_containerViewController, "popLastViewControllerAnimated:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapSelectionManager"));
  objc_msgSend(v7, "clearSelectionAnimated:", 1);

}

- (void)_performWhenTrayPresented:(id)a3
{
  id v4;
  id whenTrayPresentedBlock;

  if (a3 && self->_trayPresented)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    v4 = objc_msgSend(a3, "copy");
    whenTrayPresentedBlock = self->_whenTrayPresentedBlock;
    self->_whenTrayPresentedBlock = v4;

  }
}

- (void)container:(id)a3 didPresentContainee:(id)a4 finished:(BOOL)a5
{
  TransitNavigationTrayViewController *v7;
  id whenTrayPresentedBlock;
  void (**v9)(_QWORD);
  id v10;
  id v11;

  v11 = a3;
  v7 = (TransitNavigationTrayViewController *)a4;
  if (self->_trayViewController == v7)
  {
    if (!self->_trayPresented)
    {
      self->_trayPresented = 1;
      whenTrayPresentedBlock = self->_whenTrayPresentedBlock;
      if (whenTrayPresentedBlock)
      {
        v9 = (void (**)(_QWORD))objc_retainBlock(whenTrayPresentedBlock);
        v10 = self->_whenTrayPresentedBlock;
        self->_whenTrayPresentedBlock = 0;

        v9[2](v9);
      }
    }
  }
  else if (self->_trayPresented)
  {
    self->_trayPresented = 0;
  }

}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "annotation"));
  objc_msgSend(v6, "deselectAnnotation:animated:", v7, 0);

  v8 = objc_opt_class(MapsUserLocationView);
  if ((objc_opt_isKindOfClass(v15, v8) & 1) != 0 && objc_msgSend(v15, "isVLFPuckVisible"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSTransitNavigationContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appCoordinator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "platformController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "auxiliaryTasksManager"));
    v13 = objc_msgSend(v12, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    objc_msgSend(v14, "showVLFUI");
  }

}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return objc_msgSend(a4, "isTransitLine", a3) ^ 1;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v5;
  id v6;

  v6 = a4;
  v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "_initWithLabelMarker:", v6);
  -[IOSTransitNavigationContext _presentPlaceCardViewControllerForMapItem:modally:](self, "_presentPlaceCardViewControllerForMapItem:modally:", v5, 0);
  if (objc_msgSend(v6, "isTransit") && (objc_msgSend(v6, "isTransitLine") & 1) == 0)
    -[TransitSteppingAnalyticsDelegate recordTapOnTransitStationPOI](self->_analyticsDelegate, "recordTapOnTransitStationPOI");

}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController", a3, a4));
  v5 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    -[ContainerViewController popLastViewControllerAnimated:](self->_containerViewController, "popLastViewControllerAnimated:", 1);

}

- (void)chromeNavigationDisplay:(id)a3 userDidTapMap:(id)a4 atPoint:(CGPoint)a5
{
  -[IOSTransitNavigationContext didTapMapView:atPoint:](self, "didTapMapView:atPoint:", a4, a5.x, a5.y);
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  NavigationDebugViewsController *debugViewsController;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NavigationDebugViewsController *v16;
  unsigned int v17;
  id v18;

  v5 = a3;
  if (self->_debugViewsController)
  {
    v18 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("PlaybackControls"));

    v5 = v18;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController debugControlsView](self->_debugViewsController, "debugControlsView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self->_containerViewController, "overlayView"));

      debugViewsController = self->_debugViewsController;
      if (v9 == v10)
      {
        v17 = -[NavigationDebugViewsController isShowingTraceControls](self->_debugViewsController, "isShowingTraceControls");
        v16 = self->_debugViewsController;
        if (v17)
        {
          -[NavigationDebugViewsController hideTraceControlsAnimated:](v16, "hideTraceControlsAnimated:", 1);
LABEL_8:
          v5 = v18;
          goto LABEL_9;
        }
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self->_containerViewController, "overlayView"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self->_containerViewController, "innerLayoutGuide"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapView"));
        -[NavigationDebugViewsController addDebugViewsToView:layoutGuide:mapView:modalPresentingViewController:](debugViewsController, "addDebugViewsToView:layoutGuide:mapView:modalPresentingViewController:", v12, v13, v15, self->_containerViewController);

        v16 = self->_debugViewsController;
      }
      -[NavigationDebugViewsController showTraceControls](v16, "showTraceControls");
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (id)_recenterButton
{
  UIButton *recenterButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double height;
  void *v17;
  void *v18;

  recenterButton = self->_recenterButton;
  if (!recenterButton)
  {
    v4 = objc_opt_new(UIButton);
    v5 = self->_recenterButton;
    self->_recenterButton = v4;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_recenterButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UIButton setBackgroundColor:](self->_recenterButton, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIButton setTintColor:](self->_recenterButton, "setTintColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Navigation] Recenter"), CFSTR("localized string not found"), 0));
    -[UIButton setAccessibilityLabel:](self->_recenterButton, "setAccessibilityLabel:", v9);

    -[UIButton addTarget:action:forControlEvents:](self->_recenterButton, "addTarget:action:forControlEvents:", self, "_recenterButtonTapped:", 64);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v11 = self->_recenterButton;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("location.fill"), v10));
    -[UIButton setImage:forState:](v11, "setImage:forState:", v12, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
    objc_msgSend(v13, "setCornerRadius:", 30.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
    LODWORD(v15) = 1045220557;
    objc_msgSend(v14, "setShadowOpacity:", v15);

    height = CGSizeZero.height;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
    objc_msgSend(v17, "setShadowOffset:", CGSizeZero.width, height);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
    objc_msgSend(v18, "setShadowRadius:", 1.0);

    recenterButton = self->_recenterButton;
  }
  return recenterButton;
}

- (void)_recenterButtonTapped:(id)a3
{
  -[IOSTransitNavigationContext recenterOnActiveStep](self, "recenterOnActiveStep", a3);
}

- (void)_updateRecenterButtonVisibility
{
  unsigned int v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;

  v3 = -[TransitNavigationContext shouldShowRecenterButton](self, "shouldShowRecenterButton");
  if (v3 == -[UIButton isHidden](self->_recenterButton, "isHidden"))
  {
    v4 = v3 ^ 1;
    v5 = sub_10043309C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v8 = v7;
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "recenterButton should show? %@", (uint8_t *)&v9, 0xCu);

    }
    -[UIButton setHidden:](self->_recenterButton, "setHidden:", v4);
  }
}

- (void)_backlightLuminanceDidChange
{
  TransitNavigationTrayViewController *trayViewController;
  void *v4;
  unsigned int v5;

  trayViewController = self->_trayViewController;
  if (trayViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationTrayViewController traitCollection](trayViewController, "traitCollection"));
    v5 = objc_msgSend(v4, "isLuminanceReduced");

    if (v5)
      -[ContainerViewController presentController:animated:useDefaultContaineeLayout:](self->_containerViewController, "presentController:animated:useDefaultContaineeLayout:", self->_trayViewController, 0, 0);
  }
}

- (void)_updateArrivalEndTimerIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  NavIdleTimeoutTimer *arrivalEndTimer;
  void *v8;
  unsigned int v9;
  double Double;
  int BOOL;
  id v12;
  NSObject *v13;
  const char *v14;
  NavIdleTimeoutTimer *v15;
  void *v16;
  void *v17;
  NavIdleTimeoutTimer *v18;
  NavIdleTimeoutTimer *v19;
  int v20;
  double v21;
  __int16 v22;
  const char *v23;

  if (self->_arrivalEndTimer)
  {
LABEL_2:
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep"));
    v4 = objc_msgSend(v3, "isArrivalStep");

    if ((v4 & 1) == 0)
    {
      v5 = sub_10043309C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Clearing arrival timer", (uint8_t *)&v20, 2u);
      }

      arrivalEndTimer = self->_arrivalEndTimer;
      self->_arrivalEndTimer = 0;

    }
    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep"));
  v9 = objc_msgSend(v8, "isArrivalStep");

  if (!v9)
  {
    if (!self->_arrivalEndTimer)
      return;
    goto LABEL_2;
  }
  Double = GEOConfigGetDouble(MapsConfig_TransitArrivalEndTimerInterval, off_1014B4358);
  BOOL = GEOConfigGetBOOL(MapsConfig_TransitArrivalEndTimerAllowUserInterruption, off_1014B4368);
  v12 = sub_10043309C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "not ";
    if (BOOL)
      v14 = "";
    v20 = 134218242;
    v21 = Double;
    v22 = 2080;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Scheduling arrival timer for %#.1lfs (%sinterruptible by user)", (uint8_t *)&v20, 0x16u);
  }

  v15 = [NavIdleTimeoutTimer alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  v18 = -[NavIdleTimeoutTimer initWithView:idleTimeout:](v15, "initWithView:idleTimeout:", v17, Double);
  v19 = self->_arrivalEndTimer;
  self->_arrivalEndTimer = v18;

  -[NavIdleTimeoutTimer setDelegate:](self->_arrivalEndTimer, "setDelegate:", self);
  -[NavIdleTimeoutTimer setSuppressInterruptions:](self->_arrivalEndTimer, "setSuppressInterruptions:", BOOL ^ 1u);
}

- (void)idleTimerDidTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t v13[16];

  v4 = sub_10043309C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Arrival timer fired", v13, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSTransitNavigationContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platformController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSession"));
  v10 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v8, "popIfCurrentSession:", v12);
}

- (void)presentAdvisory:(id)a3
{
  id v4;
  MapsIncidentsViewController *v5;
  ModalContaineeViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MapsIncidentsViewController);
  v6 = -[ModalContaineeViewController initWithChildViewController:]([ModalContaineeViewController alloc], "initWithChildViewController:", v5);
  -[MapsIncidentsViewController setAdvisory:](v5, "setAdvisory:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController navigationItem](v5, "navigationItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](v6, "headerView"));
  objc_msgSend(v9, "setTitle:", v8);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005946BC;
  v11[3] = &unk_1011AC860;
  v12 = v4;
  v10 = v4;
  -[ModalContaineeViewController setBlockAlongDismissContainee:](v6, "setBlockAlongDismissContainee:", v11);
  -[ContainerViewController presentController:](self->_containerViewController, "presentController:", v6);

}

- (void)_presentIncidents:(id)a3
{
  id v4;
  ModalContaineeViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  MapsIncidentsViewController *v9;

  v4 = a3;
  v9 = objc_alloc_init(MapsIncidentsViewController);
  v5 = -[ModalContaineeViewController initWithChildViewController:]([ModalContaineeViewController alloc], "initWithChildViewController:", v9);
  -[MapsIncidentsViewController setTransitIncidents:](v9, "setTransitIncidents:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController navigationItem](v9, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](v5, "headerView"));
  objc_msgSend(v8, "setTitle:", v7);

  -[ContainerViewController presentController:](self->_containerViewController, "presentController:", v5);
}

- (void)showVLF
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  IOSTransitContainerViewController *containerViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  VLFContaineeViewController *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
  v4 = objc_opt_class(VLFContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
    objc_msgSend(v14, "handleVLFPuckTapped");

  }
  else
  {
    objc_initWeak(&location, self);
    containerViewController = self->_containerViewController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](containerViewController, "chromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baseActionCoordinator"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1005949D4;
    v15[3] = &unk_1011AD4F0;
    objc_copyWeak(&v16, &location);
    LOBYTE(containerViewController) = -[ContainerViewController showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:](containerViewController, "showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:", self, v9, v15);

    if ((containerViewController & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSTransitNavigationContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userLocationView"));

      if ((objc_msgSend(v11, "isVLFBannerVisible") & 1) != 0)
        v12 = 2;
      else
        v12 = objc_msgSend(v11, "isVLFPuckVisible");
      v13 = -[VLFContaineeViewController initWithEntryPoint:]([VLFContaineeViewController alloc], "initWithEntryPoint:", v12);
      -[ContaineeViewController setContaineeDelegate:](v13, "setContaineeDelegate:", self);
      -[ContainerViewController presentController:](self->_containerViewController, "presentController:", v13);

    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (id)_placeCardViewController
{
  PlaceCardViewController *placeCardViewController;
  PlaceCardViewController *v4;
  PlaceCardViewController *v5;

  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    v4 = -[PlaceCardViewController initWithVisualEffectDisabled:]([PlaceCardViewController alloc], "initWithVisualEffectDisabled:", 1);
    v5 = self->_placeCardViewController;
    self->_placeCardViewController = v4;

    -[PlaceCardViewController setExcludedContent:](self->_placeCardViewController, "setExcludedContent:", 14671);
    -[PlaceCardViewController setPlaceCardDelegate:](self->_placeCardViewController, "setPlaceCardDelegate:", self);
    -[InfoCardViewController setContaineeDelegate:](self->_placeCardViewController, "setContaineeDelegate:", self);
    placeCardViewController = self->_placeCardViewController;
  }
  return placeCardViewController;
}

- (void)_presentPlaceCardViewControllerForMapItem:(id)a3 modally:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  PlaceCardItem *v14;

  v4 = a4;
  v6 = a3;
  v14 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
  v8 = objc_opt_class(PlaceCardViewController);
  LOBYTE(v6) = objc_opt_isKindOfClass(v7, v8);

  if ((v6 & 1) == 0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController")), v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeCardItem")), v11 = -[PlaceCardItem isEqual:](v14, "isEqual:", v10), v10, v9, (v11 & 1) == 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IOSTransitNavigationContext _placeCardViewController](self, "_placeCardViewController"));
    objc_msgSend(v12, "resetState");
    objc_msgSend(v12, "setPlaceCardItem:withHistory:", v14, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cardPresentationController"));
    objc_msgSend(v13, "setPresentedModally:", v4);

    -[ContainerViewController presentController:](self->_containerViewController, "presentController:", v12);
  }

}

- (GEOMapServiceTraits)newTraits
{
  void *v2;
  GEOMapServiceTraits *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v3 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTraits"));

  return v3;
}

- (int64_t)displayedViewMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSTransitNavigationContext iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v3 = objc_msgSend(v2, "displayedViewMode");

  return (int64_t)v3;
}

- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4
{
  -[IOSTransitNavigationContext _presentIncidents:](self, "_presentIncidents:", a4);
}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v5, "openURL:completionHandler:", v4, 0);

}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (BOOL)pptTestSupportStepping
{
  return -[TransitNavigationTrayViewController pptTestSupportStepping](self->_trayViewController, "pptTestSupportStepping");
}

- (int64_t)pptTestCurrentStepIndex
{
  return -[TransitNavigationTrayViewController pptTestCurrentStepIndex](self->_trayViewController, "pptTestCurrentStepIndex");
}

- (BOOL)pptTestHasNextStep
{
  return -[TransitNavigationTrayViewController pptTestHasNextStep](self->_trayViewController, "pptTestHasNextStep");
}

- (void)pptTestMoveToNextStep
{
  -[TransitNavigationTrayViewController pptTestMoveToNextStep](self->_trayViewController, "pptTestMoveToNextStep");
}

- (BOOL)pptTestMoveToBoardStep
{
  return -[TransitNavigationTrayViewController pptTestMoveToBoardStep](self->_trayViewController, "pptTestMoveToBoardStep");
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  return (id)-[ContainerViewController containeeLayout](self->_containerViewController, "containeeLayout") != (id)5
      && (id)-[ContainerViewController containeeLayout](self->_containerViewController, "containeeLayout") != (id)4;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v4 = a4;
  if (a3 < 3)
    v6 = (void *)(a3 + 1);
  else
    v6 = 0;
  if ((void *)-[ContainerViewController containeeLayout](self->_containerViewController, "containeeLayout") == v6)
  {
    v10[0] = CFSTR("ContainerLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
    v10[1] = CFSTR("ContainerContainee");
    v11[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
    v11[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), self, v9);

  }
  else
  {
    -[ContainerViewController setLayoutIfSupported:animated:](self->_containerViewController, "setLayoutIfSupported:animated:", v6, v4);
  }
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  return a3 == 0;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 3)
    -[ContainerViewController popLastViewControllerAnimated:](self->_containerViewController, "popLastViewControllerAnimated:", a3);
}

- (UIScrollView)pptTestScrollView
{
  return -[TransitNavigationTrayViewController pptTestScrollView](self->_trayViewController, "pptTestScrollView");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_whenTrayPresentedBlock, 0);
  objc_storeStrong((id *)&self->_arrivalEndTimer, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_analyticsDelegate, 0);
  objc_storeStrong((id *)&self->_debugViewsController, 0);
  objc_storeStrong((id *)&self->_placeCardViewController, 0);
  objc_storeStrong((id *)&self->_trayViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end

@implementation BaseModeController

- (BaseModeController)initWithPlatformController:(id)a3
{
  id v5;
  BaseModeController *v6;
  BaseModeController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BaseModeController;
  v6 = -[BaseModeController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_platformController, a3);

  return v7;
}

- (id)containerViewController
{
  ControlContainerViewController *containerViewController;
  void *v4;
  id v5;
  __objc2_class **v6;
  ControlContainerViewController *v7;
  ControlContainerViewController *v8;
  void *v9;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;

  containerViewController = self->_containerViewController;
  if (!containerViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v6 = off_101197650;
    if (v5 != (id)5)
      v6 = off_1011960F8;
    v7 = (ControlContainerViewController *)objc_msgSend(objc_alloc(*v6), "initWithPlatformController:", self->_platformController);
    v8 = self->_containerViewController;
    self->_containerViewController = v7;

    -[ContainerViewController setAllowOnlyStandardStyle:](self->_containerViewController, "setAllowOnlyStandardStyle:", 0);
    -[ControlContainerViewController setChromeContext:](self->_containerViewController, "setChromeContext:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContainerViewController coordinator](self->_containerViewController, "coordinator"));
    if ((objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___ChromeMapSelectionDelegate) & 1) == 0)
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136315906;
        v17 = "-[BaseModeController containerViewController]";
        v18 = 2080;
        v19 = "BaseModeController.m";
        v20 = 1024;
        v21 = 145;
        v22 = 2080;
        v23 = "[coordinator conformsToProtocol:@protocol(ChromeMapSelectionDelegate)]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
      }

      if (sub_100A70734())
      {
        v13 = sub_1004318FC();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v16 = 138412290;
          v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

        }
      }
    }

    containerViewController = self->_containerViewController;
  }
  return containerViewController;
}

- (void)setChromeViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_chromeViewController, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
    -[ControlContainerViewController setChromeViewController:](self->_containerViewController, "setChromeViewController:", v6);

    v5 = obj;
  }

}

- (ActionCoordination)actionCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coordinator"));

  return (ActionCoordination *)v3;
}

- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v6, "updateViewMode:animated:", a3, v4);

}

- (void)_setupMapView
{
  void *v3;
  unsigned __int8 v4;
  MKMapView *mapView;
  void *v6;
  id v7;
  uint64_t v8;
  int64x2_t v9;
  void *v10;
  void *v11;
  void *v12;
  UILongPressGestureRecognizer *longPress;
  UILongPressGestureRecognizer *v14;
  UILongPressGestureRecognizer *v15;
  uint64_t v16;
  UILongPressGestureRecognizer *v17;
  UILongPressGestureRecognizer *feedbackPreWarmGestureRecognizer;
  UIImpactFeedbackGenerator *v19;
  UIImpactFeedbackGenerator *feedbackBehavior;
  void *v21;
  int64x2_t v22;
  int64x2_t v23;
  __int128 v24;
  uint64_t v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v4 = objc_msgSend(v3, "shouldUseModernMap");

  if ((v4 & 1) == 0)
  {
    mapView = self->_mapView;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
    v7 = objc_msgSend(v6, "displayedViewMode");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0;
    _MKCartographicConfigurationDefault(&v22, v7);
    v23 = vdupq_n_s64(1uLL);
    *(_QWORD *)&v24 = 0;
    switch((unint64_t)v7)
    {
      case 1uLL:
        v22 = vdupq_n_s64(1uLL);
        v23.i64[0] = 0;
        break;
      case 2uLL:
        v23.i64[0] = 0;
        v22 = (int64x2_t)1uLL;
        break;
      case 3uLL:
        v8 = 4;
        goto LABEL_10;
      case 5uLL:
        v9 = vdupq_n_s64(1uLL);
        goto LABEL_8;
      case 6uLL:
        v9 = (int64x2_t)xmmword_100E2D550;
LABEL_8:
        v22 = v9;
        break;
      case 7uLL:
        v8 = 2;
LABEL_10:
        v22.i64[1] = v8;
        break;
      default:
        break;
    }
    -[MKMapView _setCartographicConfiguration:animated:](mapView, "_setCartographicConfiguration:animated:", &v22, 0);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer", *(_OWORD *)&v22, *(_OWORD *)&v23, (_QWORD)v24));
  objc_msgSend(v10, "setDesiredMapMode:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v11, "setCanonicalSkyHeight:", 0.0520833321);

  -[MKMapView _setCanSelectPOIs:](self->_mapView, "_setCanSelectPOIs:", 1);
  -[MKMapView setScaleEnabled:](self->_mapView, "setScaleEnabled:", 1);
  -[MKMapView _setShowsTrafficIncidents:](self->_mapView, "_setShowsTrafficIncidents:", 1);
  -[MKMapView setShowsUserLocation:](self->_mapView, "setShowsUserLocation:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _longPressGestureRecognizer](self->_mapView, "_longPressGestureRecognizer"));
  objc_msgSend(v12, "setEnabled:", 0);

  longPress = self->_longPress;
  if (!longPress)
  {
    v14 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_handleLongPress:");
    v15 = self->_longPress;
    self->_longPress = v14;

    -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](self->_longPress, "setNumberOfTouchesRequired:", 1);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPress, "setMinimumPressDuration:", GEOConfigGetDouble(MapsConfig_DropPinLongPressDuration, off_1014B4E08));
    -[UILongPressGestureRecognizer setAllowableMovement:](self->_longPress, "setAllowableMovement:", GEOConfigGetDouble(MapsConfig_DropPinLongPressAllowableMovement, off_1014B4E18));
    -[UILongPressGestureRecognizer setDelegate:](self->_longPress, "setDelegate:", self);
    v16 = sub_1002A8AA0(self->_mapView);
    longPress = self->_longPress;
    if (v16 == 5)
    {
      -[UILongPressGestureRecognizer setAllowableMovement:](self->_longPress, "setAllowableMovement:", 2.0);
      longPress = self->_longPress;
    }
  }
  -[MKMapView addGestureRecognizer:](self->_mapView, "addGestureRecognizer:", longPress);
  if (self->_feedbackPreWarmGestureRecognizer)
    goto LABEL_19;
  if (sub_1002A8AA0(self->_mapView) != 5)
  {
    v17 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_handleFeedbackPreWarmGesture:");
    feedbackPreWarmGestureRecognizer = self->_feedbackPreWarmGestureRecognizer;
    self->_feedbackPreWarmGestureRecognizer = v17;

    -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](self->_feedbackPreWarmGestureRecognizer, "setNumberOfTouchesRequired:", 1);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_feedbackPreWarmGestureRecognizer, "setMinimumPressDuration:", 0.25);
    -[UILongPressGestureRecognizer setDelegate:](self->_feedbackPreWarmGestureRecognizer, "setDelegate:", self);
  }
  if (self->_feedbackPreWarmGestureRecognizer)
LABEL_19:
    -[MKMapView addGestureRecognizer:](self->_mapView, "addGestureRecognizer:");
  v19 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc((Class)UIImpactFeedbackGenerator), "initWithStyle:view:", 1, self->_mapView);
  feedbackBehavior = self->_feedbackBehavior;
  self->_feedbackBehavior = v19;

  -[UILongPressGestureRecognizer addTarget:action:](self->_longPress, "addTarget:action:", self, "cancelQuickActionMenuPresentation:");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _longPressGestureRecognizer](self->_mapView, "_longPressGestureRecognizer"));
  objc_msgSend(v21, "addTarget:action:", self, "cancelQuickActionMenuPresentation:");

  -[MKMapView _setAlwaysShowHeadingIndicatorIfSupported:](self->_mapView, "_setAlwaysShowHeadingIndicatorIfSupported:", 1);
  -[MKMapView _setUseBalloonCalloutsForLabels:](self->_mapView, "_setUseBalloonCalloutsForLabels:", 1);
}

- (void)viewReady
{
  -[BaseModeController _loadExpensiveItemSources](self, "_loadExpensiveItemSources");
}

- (void)sidebarDidUpdate
{
  -[BaseModeController _loadExpensiveItemSources](self, "_loadExpensiveItemSources");
}

- (void)_loadExpensiveItemSources
{
  void *v3;
  CalendarItemSource *v4;
  CalendarItemSource *calendarItemSource;
  void *v6;
  id v7;

  if (!self->_includeExpensiveItemSources)
  {
    self->_includeExpensiveItemSources = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionsItemSource"));

    if (v7)
    {
      v4 = objc_alloc_init(CalendarItemSource);
      calendarItemSource = self->_calendarItemSource;
      self->_calendarItemSource = v4;

      -[CalendarItemSource excludeItemsFromSource:](self->_calendarItemSource, "excludeItemsFromSource:", v7);
      -[CalendarItemSource loadCalendarItems](self->_calendarItemSource, "loadCalendarItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("personalizedItemSources"), 1);

    }
  }
}

- (void)_setupUserLocationAnnotation
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userLocationView"));

  objc_msgSend(v3, "setMode:animated:", 0, 1);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  MKMapView *v5;
  MKMapView *mapView;
  MapQuickActionMenuPresenter *v7;
  MapQuickActionMenuPresenter *v8;
  MapQuickActionMenuPresenter *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  MapViewDragSource *v13;
  MapViewDragSource *v14;
  UIDragInteraction *v15;
  UIDragInteraction *dragInteraction;
  MapsDragDestinationHandler *v17;
  MapsDragDestinationHandler *mapsDragDestinationHandler;
  UIDropInteraction *v19;
  UIDropInteraction *dropInteraction;
  void *v21;
  void *v22;
  void *quickActionMenuPresenter;
  MapViewDragSource *mapViewDragSource;
  MKMapView *v25;

  v5 = (MKMapView *)a3;
  mapView = self->_mapView;
  if (mapView != v5)
  {
    v25 = v5;
    -[MKMapView removeGestureRecognizer:](mapView, "removeGestureRecognizer:", self->_longPress);
    -[MKMapView removeGestureRecognizer:](self->_mapView, "removeGestureRecognizer:", self->_feedbackPreWarmGestureRecognizer);
    objc_storeStrong((id *)&self->_mapView, a3);
    if (!self->_mapView)
    {
      quickActionMenuPresenter = self->_quickActionMenuPresenter;
      if (quickActionMenuPresenter)
      {
        objc_msgSend(quickActionMenuPresenter, "setEnabled:", 0);
        quickActionMenuPresenter = self->_mapView;
      }
      objc_msgSend(quickActionMenuPresenter, "removeInteraction:", self->_dragInteraction);
      mapViewDragSource = self->_mapViewDragSource;
      self->_mapViewDragSource = 0;

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView superview](self->_mapView, "superview"));
      objc_msgSend(v22, "removeInteraction:", self->_dropInteraction);
      goto LABEL_15;
    }
    -[ControlContainerViewController refreshControls](self->_containerViewController, "refreshControls");
    -[BaseModeController _setupMapView](self, "_setupMapView");
    v7 = self->_quickActionMenuPresenter;
    if (!v7)
    {
      v8 = -[MapQuickActionMenuPresenter initWithMapView:]([MapQuickActionMenuPresenter alloc], "initWithMapView:", self->_mapView);
      v9 = self->_quickActionMenuPresenter;
      self->_quickActionMenuPresenter = v8;

      -[QuickActionMenuPresenter setDelegate:](self->_quickActionMenuPresenter, "setDelegate:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController fullscreenViewController](self, "fullscreenViewController"));
      -[QuickActionMenuPresenter setContainerViewController:](self->_quickActionMenuPresenter, "setContainerViewController:", v10);

      v7 = self->_quickActionMenuPresenter;
    }
    -[QuickActionMenuPresenter setEnabled:](v7, "setEnabled:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
    v12 = objc_msgSend(v11, "deviceSupportsDragAndDrop");

    v5 = v25;
    if (v12)
    {
      if (!self->_mapViewDragSource)
      {
        v13 = objc_alloc_init(MapViewDragSource);
        v14 = self->_mapViewDragSource;
        self->_mapViewDragSource = v13;

        -[MapViewDragSource setMapView:](self->_mapViewDragSource, "setMapView:", self->_mapView);
        v15 = (UIDragInteraction *)objc_msgSend(objc_alloc((Class)UIDragInteraction), "initWithDelegate:", self->_mapViewDragSource);
        dragInteraction = self->_dragInteraction;
        self->_dragInteraction = v15;

        if (sub_1002A8AA0(v25) == 5)
          -[UIDragInteraction _setLiftDelay:](self->_dragInteraction, "_setLiftDelay:", 0.150000006);
      }
      -[MKMapView addInteraction:](self->_mapView, "addInteraction:", self->_dragInteraction);
      if (!self->_mapsDragDestinationHandler)
      {
        v17 = objc_alloc_init(MapsDragDestinationHandler);
        mapsDragDestinationHandler = self->_mapsDragDestinationHandler;
        self->_mapsDragDestinationHandler = v17;

        v19 = (UIDropInteraction *)objc_msgSend(objc_alloc((Class)UIDropInteraction), "initWithDelegate:", self->_mapsDragDestinationHandler);
        dropInteraction = self->_dropInteraction;
        self->_dropInteraction = v19;

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
        -[MapsDragDestinationHandler setDelegate:](self->_mapsDragDestinationHandler, "setDelegate:", v21);

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView superview](self->_mapView, "superview"));
      objc_msgSend(v22, "addInteraction:", self->_dropInteraction);
LABEL_15:

      v5 = v25;
    }
  }

}

- (void)setCustomSearchResult:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "customSearchManager"));
  objc_msgSend(v7, "setCustomSearchResult:animated:shouldSelectOnMap:", v6, v4, self->_mapView);

}

- (void)_showCustomSearchResult:(id)a3 shouldSelectOnMap:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchPinsManager"));
  v8 = v7;
  if (v10)
  {
    objc_msgSend(v7, "setDroppedPin:animated:shouldSelect:", v10, 1, v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CustomLocationManager sharedManager](CustomLocationManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    v9 = objc_msgSend(v8, "newTraits");
    objc_msgSend(v6, "processSearchResult:traits:", v10, v9);

  }
  else
  {
    objc_msgSend(v7, "clearDroppedPin");
  }

}

- (BOOL)hasDroppedPin
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchPinsManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "droppedPin"));
  v5 = v4 != 0;

  return v5;
}

- (void)removeDroppedPin
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "droppedPin"));

  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    objc_msgSend(v5, "viewController:removeDroppedPin:", 0, v6);

  }
}

- (void)_clearCustomSearchResult
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "customSearchManager"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "customSearchResult"));

  if (v5)
    -[BaseModeController setCustomSearchResult:animated:](self, "setCustomSearchResult:animated:", 0, 0);

}

- (void)createCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  double longitude;
  double latitude;
  id v10;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  -[BaseModeController _clearCustomSearchResult](self, "_clearCustomSearchResult");
  v10 = (id)objc_claimAutoreleasedReturnValue(+[SearchResult customSearchResultWithCoordinate:floorOrdinal:](SearchResult, "customSearchResultWithCoordinate:floorOrdinal:", v6, latitude, longitude));
  objc_msgSend(v10, "setHasIncompleteMetadata:", 1);
  -[BaseModeController setCustomSearchResult:animated:](self, "setCustomSearchResult:animated:", v10, v5);

}

- (void)createCustomSearchResultForDroppedPinAtCenterPoint
{
  double v3;
  double v4;
  id v5;

  if (-[BaseModeController canDropPin](self, "canDropPin"))
  {
    -[MKMapView centerCoordinate](self->_mapView, "centerCoordinate");
    -[BaseModeController createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:](self, "createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:", -[BaseModeController floorOrdinalAtCoordinate:](self, "floorOrdinalAtCoordinate:"), 1, v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 1030, 0, 0);

  }
}

- (BOOL)canDropPin
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentViewController"));

  if ((objc_opt_respondsToSelector(v3, "allowsLongPressToMarkLocation") & 1) != 0)
    v4 = objc_msgSend(v3, "allowsLongPressToMarkLocation");
  else
    v4 = 1;

  return v4;
}

- (void)showSharedTrip:(id)a3
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    p_chromeViewController = &self->_chromeViewController;
    WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sharedTripsAnnotationsController"));
    objc_msgSend(v6, "setSharedTrip:", v9);

    v7 = objc_loadWeakRetained((id *)p_chromeViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharedTripsAnnotationsController"));
    objc_msgSend(v8, "setActive:", 1);

  }
  else
  {
    -[BaseModeController _cleanupSharedTripIfNeeded](self, "_cleanupSharedTripIfNeeded");
  }

}

- (BOOL)isShowingSharedTrip:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "groupIdentifier"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sharedTripsAnnotationsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedTrip"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupIdentifier"));

  v9 = 0;
  if (v4 && v8)
    v9 = objc_msgSend(v4, "isEqualToString:", v8);

  return v9;
}

- (void)_cleanupSharedTripIfNeeded
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sharedTripsAnnotationsController"));
  objc_msgSend(v4, "setActive:", 0);

  v6 = objc_loadWeakRetained((id *)p_chromeViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedTripsAnnotationsController"));
  objc_msgSend(v5, "setSharedTrip:", 0);

}

- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7
{
  -[BaseModeController _showCustomSearchResult:shouldSelectOnMap:](self, "_showCustomSearchResult:shouldSelectOnMap:", a4, self->_mapView == a6, a5);
}

- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5
{
  if (a5)
    -[BaseModeController _showCustomSearchResult:shouldSelectOnMap:](self, "_showCustomSearchResult:shouldSelectOnMap:", a4, 0);
}

- (void)mapCameraControllerWillChangeVisibleRect:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator", a3));
  objc_msgSend(v3, "setUserTrackingViewUserTrackingMode:", 0);

}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  -[MapQuickActionMenuPresenter invalidateIfNeeded](self->_quickActionMenuPresenter, "invalidateIfNeeded", a3, a4);
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sharedTripsAnnotationsController"));
  v8 = objc_msgSend(v7, "automaticallyRecenters");

  if ((v8 & 1) == 0)
  {
    v10 = objc_loadWeakRetained((id *)p_chromeViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sharedTripsAnnotationsController"));
    objc_msgSend(v9, "setAutomaticallyRecenter:", 0);

  }
}

- (void)cancelQuickActionMenuPresentation:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)1)
    -[QuickActionMenuPresenter cancelPresentationGesture](self->_quickActionMenuPresenter, "cancelPresentationGesture");
}

- (int)floorOrdinalAtCoordinate:(CLLocationCoordinate2D)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;

  v4 = VKLocationCoordinate2DMake(a3.latitude, a3.longitude);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueAtLocation:", v4, v6));

  if (v8)
    v9 = -[MKMapView displayedFloorOrdinalForBuildingsInVenue:](self->_mapView, "displayedFloorOrdinalForBuildingsInVenue:", v8);
  else
    v9 = 0x7FFFFFFF;

  return v9;
}

- (void)_handleLongPress:(id)a3
{
  double v4;
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[BaseModeController canDropPin](self, "canDropPin"))
  {
    if (objc_msgSend(v7, "state") == (id)1)
    {
      objc_msgSend(v7, "locationInView:", self->_mapView);
      -[MKMapView convertPoint:toCoordinateFromView:](self->_mapView, "convertPoint:toCoordinateFromView:", self->_mapView);
      if (v5 >= -180.0 && v5 <= 180.0 && v4 >= -90.0 && v4 <= 90.0)
      {
        -[BaseModeController createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:](self, "createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:", -[BaseModeController floorOrdinalAtCoordinate:](self, "floorOrdinalAtCoordinate:", v4, v5), 1, v4, v5);
        -[UIImpactFeedbackGenerator impactOccurredWithIntensity:](self->_feedbackBehavior, "impactOccurredWithIntensity:", 1.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 1030, 0, 0);

      }
    }
  }

}

- (void)_handleFeedbackPreWarmGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)1)
    -[UIImpactFeedbackGenerator prepare](self->_feedbackBehavior, "prepare");
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  BOOL v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  CGPoint v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  objc_msgSend(a4, "locationInView:", self->_mapView);
  v6 = v5;
  v8 = v7;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView subviews](self->_mapView, "subviews", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "frame");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        -[MKMapView bounds](self->_mapView, "bounds");
        v37.origin.x = v23;
        v37.origin.y = v24;
        v37.size.width = v25;
        v37.size.height = v26;
        v35.origin.x = v16;
        v35.origin.y = v18;
        v35.size.width = v20;
        v35.size.height = v22;
        if (!CGRectEqualToRect(v35, v37))
        {
          objc_msgSend(v14, "frame");
          v34.x = v6;
          v34.y = v8;
          if (CGRectContainsPoint(v36, v34))
          {
            v27 = 0;
            goto LABEL_12;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
        continue;
      break;
    }
  }
  v27 = 1;
LABEL_12:

  return v27;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UILongPressGestureRecognizer *v6;
  UILongPressGestureRecognizer *v7;
  UILongPressGestureRecognizer *feedbackPreWarmGestureRecognizer;
  UILongPressGestureRecognizer *longPress;
  _BOOL4 v11;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  char isKindOfClass;
  char v17;
  uint64_t v18;
  BOOL v19;
  char v20;

  v6 = (UILongPressGestureRecognizer *)a4;
  v7 = v6;
  longPress = self->_longPress;
  feedbackPreWarmGestureRecognizer = self->_feedbackPreWarmGestureRecognizer;
  v11 = feedbackPreWarmGestureRecognizer != a3 && feedbackPreWarmGestureRecognizer != v6;
  v13 = longPress == a3 || longPress == v6;
  v14 = a3;
  v15 = objc_opt_class(UIPanGestureRecognizer);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    v18 = objc_opt_class(UIPanGestureRecognizer);
    v17 = objc_opt_isKindOfClass(v7, v18);
  }
  if (v11 || !v13)
  {
    v19 = sub_1002A8AA0(self->_mapView) == 5 && v13;
    v20 = v19 & v17;
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)desiredFloatingControls
{
  void *v2;
  int64_t v3;
  void *v4;
  int BOOL;
  void *v6;
  int v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController containerViewController](self, "containerViewController"));
  v3 = (int64_t)objc_msgSend(v2, "floatingControlsOptions");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if (objc_msgSend(v4, "isInternalInstall"))
    {
      BOOL = GEOConfigGetBOOL(MapsConfig_EnableTapToRadarFloatingControlButton, off_1014B4B48);

      if (BOOL)
        v3 |= 0x200uLL;
    }
    else
    {

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if (objc_msgSend(v6, "isInternalInstall") && MapsFeature_IsAvailable_SSAO())
    {
      v7 = GEOConfigGetBOOL(VectorKitDebugConfig_SSAODemoButtonEnabled[0], VectorKitDebugConfig_SSAODemoButtonEnabled[1]);

      if (v7)
        return v3 | 0x400;
    }
    else
    {

    }
  }
  return v3;
}

- (BOOL)shouldResizingCardDimFloatingControls
{
  void *v2;
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentViewController"));
  v4 = objc_opt_class(VLFContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return (isKindOfClass & 1) == 0;
}

- (void)enterPedestrianAR
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v2, "enterPedestrianAR");

}

- (id)personalizedItemSources
{
  void *v3;
  void *v4;
  PersonalizedCollectionPlaceItemSource *v5;
  PersonalizedCollectionPlaceItemSource *collectionPlaceItemSource;
  ParkedCarItemSource *v7;
  ParkedCarItemSource *parkedCarItemSource;
  _TtC4Maps30PersonalizedFavoriteItemSource *v9;
  _TtC4Maps30PersonalizedFavoriteItemSource *favoritePlaceItemSource;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  TrafficIncidentItemSource *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (v4)
  {
    if (!self->_collectionPlaceItemSource || !self->_parkedCarItemSource)
    {
      v5 = objc_alloc_init(PersonalizedCollectionPlaceItemSource);
      collectionPlaceItemSource = self->_collectionPlaceItemSource;
      self->_collectionPlaceItemSource = v5;

      v7 = objc_alloc_init(ParkedCarItemSource);
      parkedCarItemSource = self->_parkedCarItemSource;
      self->_parkedCarItemSource = v7;

    }
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled")
      && !self->_favoritePlaceItemSource)
    {
      v9 = objc_alloc_init(_TtC4Maps30PersonalizedFavoriteItemSource);
      favoritePlaceItemSource = self->_favoritePlaceItemSource;
      self->_favoritePlaceItemSource = v9;

    }
    v11 = objc_alloc((Class)NSMutableArray);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResultsItemSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "singleSearchResultItemSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "droppedPinsItemSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionPinsItemSource"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeStartEndItemSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeCardLinkedPlacesItemSource"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchDotPlacesItemSource"));
    v19 = objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, v16, v17, v18, self->_collectionPlaceItemSource, self->_parkedCarItemSource, 0);

    if (self->_favoritePlaceItemSource)
      objc_msgSend(v19, "addObject:");
    v20 = objc_alloc_init(TrafficIncidentItemSource);
    objc_msgSend(v19, "addObject:", v20);

    if (self->_includeExpensiveItemSources)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "suggestionsItemSource"));

      if (v22)
        objc_msgSend(v19, "addObject:", v22);
      if (self->_calendarItemSource)
        objc_msgSend(v19, "addObject:");

    }
    v23 = objc_msgSend(v19, "copy");

  }
  else
  {
    v23 = &__NSArray0__struct;
  }

  return v23;
}

- (BOOL)supportsDuplicationInStack
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10048D6F4;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addPreparation:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_becomeTopContextInChromeViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  $2AEA816EAF9616B0E64737FB4BB06332 v9;
  void *v10;
  void *v11;
  $2AEA816EAF9616B0E64737FB4BB06332 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  unsigned int v22;
  double longitude;
  double latitude;
  double latitudeDelta;
  double longitudeDelta;
  id v27;

  v27 = a3;
  v4 = -[BaseModeController _setupUserLocationAnnotation](self, "_setupUserLocationAnnotation");
  +[UIFont setPlacecardShouldUseSmallFont:](UIFont, "setPlacecardShouldUseSmallFont:", _MKPlaceCardUseSmallerFont(v4, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "previousTopContext"));
  v7 = objc_opt_class(RidesharingModeController);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = ($2AEA816EAF9616B0E64737FB4BB06332)MKCoordinateRegionInvalid[1];
    self->_previousRegion.center = (CLLocationCoordinate2D)MKCoordinateRegionInvalid[0];
    self->_previousRegion.span = v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));
  -[BaseModeController setMapView:](self, "setMapView:", v11);

  if ((objc_msgSend(v27, "hasDuplicatesOfContext:", self) & 1) != 0)
    goto LABEL_4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "previousTopContext"));
  if ((sub_1007F7BE8((uint64_t)v18, (Protocol *)&OBJC_PROTOCOL___IOSBasedChromeContext) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "previousTopContext"));
    v20 = objc_opt_respondsToSelector(v19, "shouldResetStateAfterResigning");

    if ((v20 & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "previousTopContext"));
      v22 = objc_msgSend(v21, "shouldResetStateAfterResigning");

      if (!v22)
      {
LABEL_4:
        v12 = ($2AEA816EAF9616B0E64737FB4BB06332)MKCoordinateRegionInvalid[1];
        self->_previousRegion.center = (CLLocationCoordinate2D)MKCoordinateRegionInvalid[0];
        self->_previousRegion.span = v12;
        goto LABEL_5;
      }
    }
  }
  else
  {

  }
  -[ControlContainerViewController resetState](self->_containerViewController, "resetState");
  longitude = self->_previousRegion.center.longitude;
  if (longitude >= -180.0 && longitude <= 180.0)
  {
    latitude = self->_previousRegion.center.latitude;
    if (latitude >= -90.0 && latitude <= 90.0)
    {
      latitudeDelta = self->_previousRegion.span.latitudeDelta;
      if (latitudeDelta >= 0.0 && latitudeDelta <= 180.0)
      {
        longitudeDelta = self->_previousRegion.span.longitudeDelta;
        if (longitudeDelta >= 0.0 && longitudeDelta <= 360.0 && longitudeDelta > 0.0)
          -[MKMapView setRegion:animated:](self->_mapView, "setRegion:animated:", 1);
      }
    }
  }
LABEL_5:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "customSearchManager"));
  objc_msgSend(v14, "addObserver:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapCameraController"));
  objc_msgSend(v16, "addObserver:", self);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v17, "updateMapViewDisplayOptions");

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10048DA84;
  v9[3] = &unk_1011AFE28;
  v9[4] = self;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addPreparation:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_resignTopContextInChromeViewController:(id)a3
{
  MKMapView *mapView;
  CLLocationDegrees v5;
  CLLocationDegrees v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;

  v14 = a3;
  mapView = self->_mapView;
  if (mapView)
  {
    -[MKMapView bounds](mapView, "bounds");
    if (!CGRectIsEmpty(v15))
    {
      -[MKMapView region](self->_mapView, "region");
      self->_previousRegion.center.latitude = v5;
      self->_previousRegion.center.longitude = v6;
      self->_previousRegion.span.latitudeDelta = v7;
      self->_previousRegion.span.longitudeDelta = v8;
    }
  }
  +[UIFont setPlacecardShouldUseSmallFont:](UIFont, "setPlacecardShouldUseSmallFont:", 0);
  -[BaseModeController setMapView:](self, "setMapView:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "removeObserver:name:object:", self, off_1014A94B8, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customSearchManager"));
  objc_msgSend(v11, "removeObserver:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapCameraController"));
  objc_msgSend(v13, "addObserver:", self);

}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v5, "getCurrentSceneTitleWithCompletion:", v4);

}

- (BOOL)mapQuickActionMenuPresenter:(id)a3 shouldBeginOrbGestureForLabelMarkerOnMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "isTransitLine"))
  {
    if ((objc_msgSend(v8, "isFlyoverTour") & 1) == 0
      && (objc_msgSend(v8, "isTrafficIncident") & 1) == 0
      && (objc_msgSend(v8, "isOneWayArrow") & 1) == 0
      && (objc_msgSend(v8, "isRouteAnnotation") & 1) == 0
      && (objc_msgSend(v8, "isCluster") & 1) == 0)
    {
      v12 = objc_msgSend(v8, "featureType");
      if (v12 - 5 < 2 || v12 == 3 && (objc_msgSend(v8, "businessID") || !objc_msgSend(v8, "featureID")))
      {
        LOBYTE(v10) = 1;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  v10 = objc_msgSend(v9, "isRoutePlanningPresented") ^ 1;

LABEL_10:
  return v10;
}

- (BOOL)wantsSidebarControl
{
  return 1;
}

- (int)uiTargetForQuickActionMenu
{
  return 0;
}

- (BOOL)shouldShowAddStopForDirectionsInQuickActionMenuPresenter:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator", a3));
  v4 = objc_msgSend(v3, "shouldAddStopInRoutePlanning");

  return v4;
}

- (void)_addRecentPlaceForSearchResult:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "isHomeOrWork");
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchToSupersedeIfRecordedInHistory"));
      +[HistoryEntryRecentsItem saveMapItem:superseedUUID:](HistoryEntryRecentsItem, "saveMapItem:superseedUUID:", v6, v7);

      v4 = v8;
    }
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4
{
  id v5;
  void *v6;
  id v7;
  SearchFieldItem *v8;
  SearchFieldItem *v9;
  void *v10;
  void *v11;
  SearchFieldItem *v12;
  DirectionItem *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[2];
  SearchFieldItem *v20;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchResult"));
  if (v6)
  {
    v7 = objc_msgSend(v5, "isAdditionalStop");
    v8 = objc_alloc_init(SearchFieldItem);
    v9 = v8;
    if ((_DWORD)v7)
    {
      -[SearchFieldItem setSearchResult:](v8, "setSearchResult:", v6);
      v20 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      -[SearchFieldItem setSearchResult:](v9, "setSearchResult:", v11);

      v12 = objc_alloc_init(SearchFieldItem);
      -[SearchFieldItem setSearchResult:](v12, "setSearchResult:", v6);
      v19[0] = v9;
      v19[1] = v12;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));

    }
    v13 = -[DirectionItem initWithItems:transportType:]([DirectionItem alloc], "initWithItems:transportType:", v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7, CFSTR("DirectionsSessionInitiatorKey"), CFSTR("AppendDirectionItem"), &off_10126D660));
    v18[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, &v17, 2));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    objc_msgSend(v16, "viewController:doDirectionItem:withUserInfo:", 0, v13, v15);

    -[BaseModeController _addRecentPlaceForSearchResult:](self, "_addRecentPlaceForSearchResult:", v6);
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    objc_msgSend(v5, "viewController:doAudioCallToSearchResult:", 0, v6);

    -[BaseModeController _addRecentPlaceForSearchResult:](self, "_addRecentPlaceForSearchResult:", v6);
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    objc_msgSend(v5, "viewController:openWebsiteForSearchResult:", 0, v6);

    -[BaseModeController _addRecentPlaceForSearchResult:](self, "_addRecentPlaceForSearchResult:", v6);
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10048E1F0;
  v13[3] = &unk_1011B8180;
  v13[4] = self;
  v4 = a3;
  v5 = objc_retainBlock(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResult"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v8 = objc_msgSend(v7, "isAuthorizedForPreciseLocation");

  if ((v8 & 1) != 0)
  {
    ((void (*)(_QWORD *, void *))v5[2])(v5, v6);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", 56, 690, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10048E298;
    v11[3] = &unk_1011AE218;
    v12 = v5;
    objc_msgSend(v10, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey:completion:", CFSTR("AppInfoTemporaryPreciseLocationAuthorizationForShareLocationPurposeKey"), v11);

  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MKMapView *mapView;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter labelMarker](self->_quickActionMenuPresenter, "labelMarker"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapSelectionManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[QuickActionMenuPresenter labelMarker](self->_quickActionMenuPresenter, "labelMarker"));
    objc_msgSend(v7, "selectLabelMarker:animated:", v8, 1);

    -[BaseModeController _addRecentPlaceForSearchResult:](self, "_addRecentPlaceForSearchResult:", v12);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapQuickActionMenuPresenter annotation](self->_quickActionMenuPresenter, "annotation"));

    if (v9)
    {
      mapView = self->_mapView;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapQuickActionMenuPresenter annotation](self->_quickActionMenuPresenter, "annotation"));
      -[MKMapView selectAnnotation:animated:](mapView, "selectAnnotation:animated:", v11, 1);

    }
  }

}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentViewController"));

  if ((objc_opt_respondsToSelector(v10, "allowsQuickActionMenuInMap") & 1) != 0
    && !objc_msgSend(v10, "allowsQuickActionMenuInMap"))
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    -[MKMapView convertPoint:fromView:](self->_mapView, "convertPoint:fromView:", v8, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _labelMarkerAtPoint:](self->_mapView, "_labelMarkerAtPoint:"));
    v12 = objc_msgSend(v11, "isFlyoverTour") ^ 1;

  }
  return v12;
}

- (id)mapServiceTraitsForQuickActionPresenter:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator", a3));
  v4 = objc_msgSend(v3, "newTraits");

  return v4;
}

- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResult"));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    objc_msgSend(v5, "viewController:removeDroppedPin:", 0, v6);

  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedViewTransitLinesOnMap:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapSelectionManager"));
  objc_msgSend(v6, "selectLabelMarker:animated:", v5, 1);

}

- (void)quickActionMenuWillPresent:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  if (-[UILongPressGestureRecognizer isEnabled](self->_longPress, "isEnabled", a3))
  {
    -[UILongPressGestureRecognizer setEnabled:](self->_longPress, "setEnabled:", 0);
    -[UILongPressGestureRecognizer setEnabled:](self->_longPress, "setEnabled:", 1);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _longPressGestureRecognizer](self->_mapView, "_longPressGestureRecognizer"));
  v5 = objc_msgSend(v4, "isEnabled");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _longPressGestureRecognizer](self->_mapView, "_longPressGestureRecognizer"));
    objc_msgSend(v6, "setEnabled:", 0);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _longPressGestureRecognizer](self->_mapView, "_longPressGestureRecognizer"));
    objc_msgSend(v7, "setEnabled:", 1);

  }
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

  LOBYTE(v5) = objc_msgSend(v7, "isUserAtSameVenueAsMapItem:", v8) ^ 1;
  return (char)v5;
}

- (void)quickActionMenuPresenter:(id)a3 selectedDropPinAt:(id)a4
{
  -[BaseModeController setCustomSearchResult:animated:](self, "setCustomSearchResult:animated:", a4, 1);
}

- (int)currentUITargetForAnalytics
{
  void *v2;
  id v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController mapViewDelegate](self, "mapViewDelegate"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    v3 = v2;
    if ((objc_opt_respondsToSelector(v3, "currentUITargetForAnalytics") & 1) != 0)
      v4 = objc_msgSend(v3, "currentUITargetForAnalytics");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v2;
  id v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController mapViewDelegate](self, "mapViewDelegate"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    v3 = v2;
    if ((objc_opt_respondsToSelector(v3, "currentMapViewTargetForAnalytics") & 1) != 0)
      v4 = objc_msgSend(v3, "currentMapViewTargetForAnalytics");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)wantsStatusBarControl
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
    if ((objc_opt_respondsToSelector(v4, "prefersStatusBarHidden") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
      if ((objc_opt_respondsToSelector(v6, "preferredStatusBarStyle") & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
        v5 = objc_opt_respondsToSelector(v7, "statusBarBackgroundViewStyle");

      }
    }

  }
  else
  {
    v5 = 1;
  }

  return v5 & 1;
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
  if ((objc_opt_respondsToSelector(v2, "prefersStatusBarHidden") & 1) != 0)
  {
    v3 = objc_msgSend(v2, "prefersStatusBarHidden");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v4, "userInterfaceIdiom") == (id)1)
    {
      v3 = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      if (objc_msgSend(v5, "userInterfaceIdiom") == (id)5)
      {
        v3 = 0;
      }
      else
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
        v3 = objc_msgSend(v6, "verticalSizeClass") == (id)1;

      }
    }

  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self->_containerViewController, "currentViewController"));
  if ((objc_opt_respondsToSelector(v2, "preferredStatusBarStyle") & 1) != 0)
    v3 = objc_msgSend(v2, "preferredStatusBarStyle");
  else
    v3 = 0;

  return (int64_t)v3;
}

- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle
{
  return (StatusBarBackgroundViewStyle *)-[ControlContainerViewController statusBarBackgroundViewStyle](self->_containerViewController, "statusBarBackgroundViewStyle");
}

- (StatusBarSupplementaryView)statusBarSupplementaryView
{
  return (StatusBarSupplementaryView *)-[ControlContainerViewController statusBarSupplementaryView](self->_containerViewController, "statusBarSupplementaryView");
}

- (MKMapItem)mapItemForLookAroundButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  if (objc_msgSend(v3, "isRoutePlanningPresented"))
  {

    v4 = 0;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentMapItem"));

  if (!v4
    || (objc_msgSend(v4, "_hasLookAroundStorefront") & 1) == 0
    && !+[LookAroundButtonContainerViewController isIncompleteMapItem:](LookAroundButtonContainerViewController, "isIncompleteMapItem:", v4))
  {
    goto LABEL_7;
  }
  v4 = v4;
  v6 = v4;
LABEL_8:

  return (MKMapItem *)v6;
}

- (BOOL)wantsLookAroundShowing
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v7;

  if (!-[BaseModeController permitsLookAroundShowing](self, "permitsLookAroundShowing"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
  v4 = objc_msgSend(v3, "isRoutePlanningPresented");

  if ((v4 & 1) != 0
    || (-[ControlContainerViewController floatingControlsOptions](self->_containerViewController, "floatingControlsOptions") & 0x80) == 0)
  {
    return 0;
  }
  if (-[MKMapView _lookAroundAvailability](self->_mapView, "_lookAroundAvailability") == (id)2)
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController mapItemForLookAroundButton](self, "mapItemForLookAroundButton"));
  v5 = v7 != 0;

  return v5;
}

- (BOOL)permitsLookAroundShowing
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  if ((v4 & 1) != 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseModeController chromeViewController](self, "chromeViewController"));
    v5 = sub_1002A8AA0(v7) != 5;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)wantsWeatherShowing
{
  _BOOL8 v3;

  LODWORD(v3) = -[BaseModeController permitsWeatherShowing](self, "permitsWeatherShowing");
  if (v3)
    return ((unint64_t)-[ControlContainerViewController floatingControlsOptions](self->_containerViewController, "floatingControlsOptions") >> 3) & 1;
  return v3;
}

- (BOOL)permitsWeatherShowing
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v3 = objc_msgSend(v2, "isUsingOfflineMaps");

  return v3 ^ 1;
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (id)routeAnnotationsProvider
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  if (sub_1002A8AA0(WeakRetained) != 5)
  {

    goto LABEL_5;
  }
  v5 = objc_loadWeakRetained((id *)p_chromeViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharedTripsAnnotationsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedTrip"));

  if (!v7)
  {
LABEL_5:
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BaseModeController actionCoordinator](self, "actionCoordinator"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeAnnotationsProvider"));
    goto LABEL_6;
  }
  v8 = objc_loadWeakRetained((id *)p_chromeViewController);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharedTripsAnnotationsController"));
LABEL_6:
  v10 = (void *)v9;

  return v10;
}

- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration
{
  return objc_alloc_init(RouteAnnotationsConfiguration);
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (MapQuickActionMenuPresenter)quickActionMenuPresenter
{
  return self->_quickActionMenuPresenter;
}

- (void)setQuickActionMenuPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_cachedViewControllers, 0);
  objc_storeStrong((id *)&self->_mapsDragDestinationHandler, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_mapViewDragSource, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_feedbackBehavior, 0);
  objc_storeStrong((id *)&self->_feedbackPreWarmGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_parkedCarItemSource, 0);
  objc_storeStrong((id *)&self->_favoritePlaceItemSource, 0);
  objc_storeStrong((id *)&self->_collectionPlaceItemSource, 0);
  objc_storeStrong((id *)&self->_calendarItemSource, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end

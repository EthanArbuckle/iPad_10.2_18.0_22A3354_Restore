@implementation _MKHandlerURLHandlingTask

- (id)mapsActivity
{
  MapsActivity *mapsActivity;
  MapsActivity *v4;
  MapsActivity *v5;

  mapsActivity = self->_mapsActivity;
  if (!mapsActivity)
  {
    v4 = objc_alloc_init(MapsActivity);
    v5 = self->_mapsActivity;
    self->_mapsActivity = v4;

    mapsActivity = self->_mapsActivity;
  }
  return mapsActivity;
}

- (id)displayOptions
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask mapsActivity](self, "mapsActivity"));
  v4 = objc_msgSend(v3, "hasDisplayOptions");

  if ((v4 & 1) == 0)
  {
    v5 = objc_alloc_init((Class)GEOURLOptions);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask mapsActivity](self, "mapsActivity"));
    objc_msgSend(v6, "setDisplayOptions:", v5);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask mapsActivity](self, "mapsActivity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayOptions"));

  return v8;
}

- (void)performTask
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _MKURLHandler *v10;
  _MKURLHandler *urlHandler;
  void *v12;
  _MKURLHandler *v13;
  void *v14;
  void *v15;
  void *v16;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = objc_claimAutoreleasedReturnValue(-[URLHandlingTask url](self, "url"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask url](self, "url"));
    if ((+[GEOURLBackedMapItem urlContainsExtraStorage:](GEOURLBackedMapItem, "urlContainsExtraStorage:", v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask url](self, "url"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _mapItemBackedByURL:](MKMapItem, "_mapItemBackedByURL:", v6));

      if (v7)
      {
        v16 = v7;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask mkOptions](self, "mkOptions"));
        -[_MKHandlerURLHandlingTask URLHandler:launchIntoSearchWithMapItems:options:context:](self, "URLHandler:launchIntoSearchWithMapItems:options:context:", 0, v8, v9, self->_urlContext);

        goto LABEL_7;
      }
    }
    else
    {

    }
  }
  v10 = (_MKURLHandler *)objc_alloc_init((Class)_MKURLHandler);
  urlHandler = self->_urlHandler;
  self->_urlHandler = v10;

  -[_MKURLHandler setDelegate:](self->_urlHandler, "setDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask mkOptions](self, "mkOptions"));
  -[_MKHandlerURLHandlingTask URLHandler:launchWithOptions:](self, "URLHandler:launchWithOptions:", 0, v12);

  v13 = self->_urlHandler;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask url](self, "url"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask sourceApplication](self, "sourceApplication"));
  -[_MKURLHandler handleURL:sourceApplication:context:](v13, "handleURL:sourceApplication:context:", v14, v15, self->_urlContext);

LABEL_7:
  if (!self->_asyncTaskInProgress)
    -[_MKHandlerURLHandlingTask _createRichMapsActivity](self, "_createRichMapsActivity");
}

- (void)taskFinished:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKHandlerURLHandlingTask;
  -[URLHandlingTask taskFinished:](&v4, "taskFinished:", a3);
  -[_MKHandlerURLHandlingTask _sendWidgetAnalytics](self, "_sendWidgetAnalytics");
}

- (void)taskFailed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKHandlerURLHandlingTask;
  -[URLHandlingTask taskFailed](&v3, "taskFailed");
  -[_MKHandlerURLHandlingTask _sendWidgetAnalytics](self, "_sendWidgetAnalytics");
}

- (void)_createRichMapsActivity
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ErrorAction *v9;
  MapsAction *currentAction;
  void *v11;
  __objc2_class **v12;
  void *v13;
  unsigned int v14;
  MapsAction *v15;
  MapsAction *v16;
  RichMapsActivity *v17;
  MapsActivity *mapsActivity;
  int v19;
  _MKHandlerURLHandlingTask *v20;

  if (!self->_asyncTaskInProgress && !self->_taskFinished)
  {
    v3 = sub_100431A4C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "URLHandlingTask _createRichMapsActivity %@", (uint8_t *)&v19, 0xCu);
    }

    if (self->_currentError)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Error Title URL"), CFSTR("localized string not found"), 0));

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Error Message URL"), CFSTR("localized string not found"), 0));

      v9 = -[ErrorAction initWithTitle:message:options:]([ErrorAction alloc], "initWithTitle:message:options:", v6, v8, 0);
      currentAction = self->_currentAction;
      self->_currentAction = &v9->super;

    }
    if (!self->_currentAction)
    {
      if (!self->_mapsActivity)
      {
        -[_MKHandlerURLHandlingTask taskFailed](self, "taskFailed");
        return;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask sourceApplication](self, "sourceApplication"));
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.AssistantServices")))
      {

        v12 = &off_101197F98;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask sourceApplication](self, "sourceApplication"));
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.WorkflowKit.BackgroundShortcutRunner"));

        v12 = &off_1011984A8;
        if (v14)
          v12 = &off_101197F98;
      }
      v15 = (MapsAction *)objc_msgSend(objc_alloc(*v12), "initWithResetUI:compatibleWithNavigation:", -[_MKHandlerURLHandlingTask shouldResetUI](self, "shouldResetUI"), -[_MKHandlerURLHandlingTask isCompatibleWithNavigation](self, "isCompatibleWithNavigation"));
      v16 = self->_currentAction;
      self->_currentAction = v15;

    }
    if (self->_needsUserLocation)
      -[MapsAction setUserLocationAccuracy:](self->_currentAction, "setUserLocationAccuracy:", self->_userLocationDesiredAccuracy);
    v17 = -[RichMapsActivity initWithMapsActivity:mapsAction:]([RichMapsActivity alloc], "initWithMapsActivity:mapsAction:", self->_mapsActivity, self->_currentAction);
    mapsActivity = self->_mapsActivity;
    self->_mapsActivity = 0;

    -[_MKHandlerURLHandlingTask taskFinished:](self, "taskFinished:", v17);
    self->_taskFinished = 1;

  }
}

- (BOOL)shouldResetUI
{
  MapsActivity *mapsActivity;
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  mapsActivity = self->_mapsActivity;
  if (mapsActivity && !self->_currentAction && !self->_needsUserLocation && !self->_currentError)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity dictionaryRepresentation](mapsActivity, "dictionaryRepresentation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    if (objc_msgSend(v7, "count") == (id)1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayOptions")));

      if (!v8)
        goto LABEL_14;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](self->_mapsActivity, "displayOptions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryRepresentation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
      if (objc_msgSend(v10, "count") == (id)1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("enableTraffic")));
        if (v11)
        {

LABEL_17:
          v4 = 0;
          goto LABEL_15;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mapType")));

        if (v12)
          goto LABEL_17;
LABEL_14:
        v4 = 1;
LABEL_15:

        return v4;
      }

    }
    goto LABEL_14;
  }
  return 1;
}

- (BOOL)isCompatibleWithNavigation
{
  MapsActivity *mapsActivity;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  mapsActivity = self->_mapsActivity;
  if (mapsActivity)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity dictionaryRepresentation](mapsActivity, "dictionaryRepresentation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayOptions")));

      if (!v6)
        goto LABEL_10;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](self->_mapsActivity, "displayOptions"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryRepresentation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
      if (objc_msgSend(v8, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("userTrackingMode")));

        if (v9)
        {
          v10 = 1;
LABEL_11:

          return v10;
        }
LABEL_10:
        v10 = 0;
        goto LABEL_11;
      }

    }
    goto LABEL_10;
  }
  return 0;
}

- (void)_sendWidgetAnalytics
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask sourceApplication](self, "sourceApplication"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Maps.GeneralMapsWidget"));

  if (v4)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", self->_analyticsAction, self->_analyticsTarget, self->_analyticsValue);
}

- (void)_processMKOptions:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  MKURLContext *v8;
  MKURLContext *urlContext;
  void *v10;
  PresentNearbySearchAction *v11;
  MapsAction *currentAction;
  void *v13;
  uint64_t v14;
  void *v15;
  DisplayModeNavAction *v16;
  void *v17;
  MapsAction *v18;
  MapsAction *v19;
  void *v20;
  PresentNavShareETAAction *v21;
  MapsAction *v22;
  uint64_t v23;
  void *v24;
  ZoomMapAction *v25;
  void *v26;
  MapsAction *v27;
  MapsAction *v28;
  uint64_t v29;
  void *v30;
  ShowKeyboardAction *v31;
  void *v32;
  MapsAction *v33;
  MapsAction *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BOOL8 v45;
  id v46;
  NSObject *v47;
  OpenTraceAction *v48;
  MapsAction *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  int IsNavigating;
  uint64_t v58;
  uint64_t v59;
  char IsEnabled_Maps182;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  NSNumber *v66;
  NSNumber *routeAvoidHighways;
  uint64_t v68;
  void *v69;
  NSNumber *v70;
  NSNumber *routeAvoidTolls;
  uint64_t v72;
  void *v73;
  GEOURLTimePoint *v74;
  GEOURLTimePoint *timePoint;
  uint64_t v76;
  void *v77;
  NSNumber *v78;
  NSNumber *radiusInMeter;
  uint64_t v80;
  void *v81;
  NSString *v82;
  NSString *searchTerm;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  NSString *v95;
  NSString *analyticsValue;
  int v97;
  id v98;

  v4 = a3;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v97 = 138412290;
    v98 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "URLHandlingTask mkOptions %@", (uint8_t *)&v97, 0xCu);
  }

  self->_mkOptionsParsed = 1;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MKURLContext")));

    if (v7)
    {
      v8 = (MKURLContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MKURLContext")));
      urlContext = self->_urlContext;
      self->_urlContext = v8;

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoSearchHomeKey));

    if (v10)
    {
      v11 = objc_alloc_init(PresentNearbySearchAction);
      currentAction = self->_currentAction;
      self->_currentAction = &v11->super;

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoNavOverviewKey));
    if (v13)
    {

      v14 = MKLaunchOptionsLaunchIntoNavDetailKey;
    }
    else
    {
      v14 = MKLaunchOptionsLaunchIntoNavDetailKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoNavDetailKey));

      if (!v15)
      {
LABEL_12:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoNavShareETAKey));

        if (v20)
        {
          v21 = objc_alloc_init(PresentNavShareETAAction);
          v22 = self->_currentAction;
          self->_currentAction = &v21->super;

        }
        v23 = MKLaunchOptionsCameraAltitudeMultiplierKey;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsCameraAltitudeMultiplierKey));

        if (v24)
        {
          v25 = [ZoomMapAction alloc];
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v23));
          objc_msgSend(v26, "doubleValue");
          v27 = -[ZoomMapAction initWithZoomFactor:](v25, "initWithZoomFactor:");
          v28 = self->_currentAction;
          self->_currentAction = v27;

        }
        v29 = MKLaunchOptionsLaunchIntoKeyboardKey;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoKeyboardKey));

        if (v30)
        {
          v31 = [ShowKeyboardAction alloc];
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v29));
          v33 = -[ShowKeyboardAction initWithInteractionModel:](v31, "initWithInteractionModel:", objc_msgSend(v32, "unsignedIntegerValue"));
          v34 = self->_currentAction;
          self->_currentAction = v33;

        }
        v35 = MKLaunchOptionsLaunchIntoNavTraceKey;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoNavTraceKey));

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v35));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByAppendingPathComponent:", v37));
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[MNFilePaths navTraceExtension](MNFilePaths, "navTraceExtension"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringByAppendingPathExtension:", v40));

          v42 = MKLaunchOptionsLaunchIntoNavTraceStartNavKey;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoNavTraceStartNavKey));

          if (v43)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v42));
            v45 = v44 != 0;

          }
          else
          {
            v45 = 0;
          }
          v46 = sub_100431A4C();
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            v97 = 138412290;
            v98 = v41;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "URLHandlingTask OpenTraceAction: %@", (uint8_t *)&v97, 0xCu);
          }

          v48 = -[OpenTraceAction initWithFilePath:shouldStartNav:]([OpenTraceAction alloc], "initWithFilePath:shouldStartNav:", v41, v45);
          v49 = self->_currentAction;
          self->_currentAction = &v48->super;

        }
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsCameraKey));

        if (v50)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsCameraKey));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "geoCamera"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
          objc_msgSend(v53, "setCamera:", v52);

        }
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        v55 = objc_msgSend(v54, "state");
        IsNavigating = MNNavigationServiceStateIsNavigating(v55, v56);

        if (IsNavigating)
        {
          if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v58, v59) & 1) != 0
            || (MapsFeature_IsEnabled_Maps420() & 1) != 0)
          {
            IsEnabled_Maps182 = 1;
          }
          else
          {
            IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
          }
        }
        else
        {
          IsEnabled_Maps182 = 0;
        }
        self->_searchAlongRoute = IsEnabled_Maps182;
        v61 = _MKLaunchOptionsSearchAlongRouteKey;
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _MKLaunchOptionsSearchAlongRouteKey));

        if (v62)
        {
          if (self->_searchAlongRoute)
          {
            self->_searchAlongRoute = 1;
          }
          else
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v61));
            self->_searchAlongRoute = objc_msgSend(v63, "BOOLValue");

          }
        }
        v64 = _MKLaunchOptionsRoutingAvoidHighwaysKey;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _MKLaunchOptionsRoutingAvoidHighwaysKey));

        if (v65)
        {
          v66 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v64));
          routeAvoidHighways = self->_routeAvoidHighways;
          self->_routeAvoidHighways = v66;

        }
        v68 = _MKLaunchOptionsRoutingAvoidTollsKey;
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _MKLaunchOptionsRoutingAvoidTollsKey));

        if (v69)
        {
          v70 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v68));
          routeAvoidTolls = self->_routeAvoidTolls;
          self->_routeAvoidTolls = v70;

        }
        v72 = MKLaunchOptionsTimePointKey;
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsTimePointKey));

        if (v73)
        {
          v74 = (GEOURLTimePoint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v72));
          timePoint = self->_timePoint;
          self->_timePoint = v74;

        }
        v76 = MKLaunchOptionsMapRadiusInMetersKey;
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsMapRadiusInMetersKey));

        if (v77)
        {
          v78 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v76));
          radiusInMeter = self->_radiusInMeter;
          self->_radiusInMeter = v78;

        }
        v80 = MKLaunchOptionsSearchTermsKey;
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsSearchTermsKey));

        if (v81)
        {
          v82 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v80));
          searchTerm = self->_searchTerm;
          self->_searchTerm = v82;

        }
        v84 = MKLaunchOptionsReferralIdentifierKey;
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsReferralIdentifierKey));

        if (v85)
        {
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v84));
          -[URLHandlingTask setSourceApplication:](self, "setSourceApplication:", v86);

        }
        v87 = MKLaunchOptionsAnalyticsActionKey;
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsAnalyticsActionKey));

        if (v88)
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v87));
          self->_analyticsAction = objc_msgSend(v89, "unsignedIntegerValue");

        }
        v90 = MKLaunchOptionsAnalyticsTargetKey;
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsAnalyticsTargetKey));

        if (v91)
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v90));
          self->_analyticsTarget = objc_msgSend(v92, "unsignedIntegerValue");

        }
        v93 = MKLaunchOptionsAnalyticsValueKey;
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MKLaunchOptionsAnalyticsValueKey));

        if (v94)
        {
          v95 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v93));
          analyticsValue = self->_analyticsValue;
          self->_analyticsValue = v95;

        }
        goto LABEL_54;
      }
    }
    v16 = [DisplayModeNavAction alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
    v18 = -[DisplayModeNavAction initWithShowDetails:](v16, "initWithShowDetails:", v17 != 0);
    v19 = self->_currentAction;
    self->_currentAction = v18;

    goto LABEL_12;
  }
LABEL_54:

}

- (BOOL)URLHandlerShouldPerformRefinementRequest:(id)a3
{
  return 0;
}

- (BOOL)URLHandlerShouldPerformReverseGeocoding:(id)a3
{
  return 0;
}

- (BOOL)URLHandlerShouldPerformForwardGeocoding:(id)a3
{
  return 0;
}

- (void)URLHandlerWillStartAsynchronousHandling:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  _MKHandlerURLHandlingTask *v7;

  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "URLHandlingTask URLHandlerStartAsynchonousTask %@", (uint8_t *)&v6, 0xCu);
  }

  self->_asyncTaskInProgress = 1;
}

- (void)URLHandler:(id)a3 didFinishAsynchronousHandlingWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v12;
  _MKHandlerURLHandlingTask *v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = sub_100431A4C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "URLHandlingTask %@ error %@", (uint8_t *)&v12, 0x16u);
    }

    objc_storeStrong((id *)&self->_currentError, a4);
  }
  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "URLHandlingTask URLHandlerFinishedAsynchonousTask %@", (uint8_t *)&v12, 0xCu);
  }

  self->_asyncTaskInProgress = 0;
  -[_MKHandlerURLHandlingTask _createRichMapsActivity](self, "_createRichMapsActivity");

}

- (BOOL)URLHandler:(id)a3 launchWithOptions:(id)a4
{
  -[_MKHandlerURLHandlingTask _processMKOptions:](self, "_processMKOptions:", a4);
  return 1;
}

- (BOOL)URLHandler:(id)a3 setSchemeForCapture:(id)a4 sourceApplication:(id)a5 isLaunchedFromTTL:(BOOL)a6 ttlEventTime:(id)a7
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v13[16];

  v7 = a6;
  v9 = a7;
  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "URLHandlingTask setSchemeForCapture", v13, 2u);
  }

  -[URLHandlingTask setLaunchedFromTTL:](self, "setLaunchedFromTTL:", v7);
  -[URLHandlingTask setTtlEventTime:](self, "setTtlEventTime:", v9);

  return 1;
}

- (BOOL)URLHandler:(id)a3 setContentProvider:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  NSString *contentProvider;
  uint8_t v11[16];

  v5 = a4;
  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "URLHandlingTask setContentProvider", v11, 2u);
  }

  v8 = (NSString *)objc_msgSend(v5, "copy");
  contentProvider = self->_contentProvider;
  self->_contentProvider = v8;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoDirectionsWithMapItems:(id)a4 options:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  DirectionsPlan *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char isKindOfClass;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unsigned int v48;
  uint64_t v49;
  void *v50;
  unsigned int v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  GEOURLTimePoint *timePoint;
  GEOURLTimePoint *v59;
  double v60;
  double v61;
  unsigned int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v69;
  NSObject *v70;
  objc_class *v71;
  NSString *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  id v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _BYTE *v83;
  _BYTE buf[24];
  int v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  void *v89;

  v78 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[_MKHandlerURLHandlingTask _processMKOptions:](self, "_processMKOptions:", v11);
  if (objc_msgSend(v10, "count"))
  {
    v13 = objc_msgSend(v10, "indexOfObjectPassingTest:", &stru_1011B8418);
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", _MKLaunchOptionsFindMyHandleIdentifiersKey));
    v14 = objc_msgSend(v79, "count");
    if (v14)
      v15 = MapsFeature_IsEnabled_MapsWally(v14) ^ 1;
    else
      v15 = 1;
    if (v13 != (id)0x7FFFFFFFFFFFFFFFLL
      || !-[_MKHandlerURLHandlingTask _shouldAddStopWithLaunchOptions:requireLaunchIntoNavOrDirectionsModeOption:requireSearchAlongRouteOption:](self, "_shouldAddStopWithLaunchOptions:requireLaunchIntoNavOrDirectionsModeOption:requireSearchAlongRouteOption:", v11, 1, v15))
    {
      v28 = sub_100431A4C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoDirectionsWithMapItems %@ %@", buf, 0x16u);
      }

      v30 = objc_alloc_init((Class)NSMutableArray);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v85) = 0;
      if (objc_msgSend(v10, "count") == (id)1)
      {
        *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 1;
        v31 = objc_msgSend(objc_alloc((Class)GEOComposedWaypoint), "initWithLocation:isCurrentLocation:", 0, 1);
        objc_msgSend(v30, "addObject:", v31);

      }
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_100499808;
      v80[3] = &unk_1011B8440;
      v32 = v30;
      v81 = v32;
      v83 = buf;
      v82 = v79;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v80);
      v33 = objc_alloc_init(DirectionsPlan);
      v34 = objc_alloc_init((Class)GEOStorageRouteRequestStorage);
      -[DirectionsPlan setRouteRequestStorage:](v33, "setRouteRequestStorage:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v33, "routeRequestStorage"));
      objc_msgSend(v35, "setWaypoints:", v32);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastObject"));
      v37 = objc_opt_class(GEOComposedWaypointToRoute);
      isKindOfClass = objc_opt_isKindOfClass(v36, v37);

      if ((isKindOfClass & 1) != 0)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastObject"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "route"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "persistentData"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v33, "routeRequestStorage"));
        objc_msgSend(v42, "setDestinationRouteData:", v41);

      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MKLaunchOptionsDirectionsModeKey));

      if (v43)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MKLaunchOptionsDirectionsModeKey));
        if ((objc_msgSend(v44, "isEqualToString:", MKLaunchOptionsDirectionsModeDefault) & 1) == 0)
        {
          if ((objc_msgSend(v44, "isEqualToString:", MKLaunchOptionsDirectionsModeWalking) & 1) != 0
            || (objc_msgSend(v44, "isEqualToString:", MKLaunchOptionsDirectionsModeRoutingApps) & 1) != 0)
          {
            v45 = 2;
          }
          else if ((objc_msgSend(v44, "isEqualToString:", MKLaunchOptionsDirectionsModeTransit) & 1) != 0)
          {
            v45 = 1;
          }
          else if ((objc_msgSend(v44, "isEqualToString:", MKLaunchOptionsDirectionsModeDriving) & 1) != 0)
          {
            v45 = 0;
          }
          else if (objc_msgSend(v44, "isEqualToString:", MKLaunchOptionsDirectionsModeCycling))
          {
            v45 = 3;
          }
          else
          {
            v45 = 0;
          }
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v33, "routeRequestStorage"));
          objc_msgSend(v46, "setTransportType:", v45);

        }
      }
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoNavKey));
      v48 = objc_msgSend(v47, "BOOLValue");

      if (v48)
        v49 = 2;
      else
        v49 = 1;
      -[DirectionsPlan setDisplayMethod:](v33, "setDisplayMethod:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", _MKLaunchOptionsRoutingAvoidTollsKey));
      v51 = objc_msgSend(v50, "BOOLValue");

      if (v51)
        -[DirectionsPlan setAvoidTolls:](v33, "setAvoidTolls:", 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", _MKLaunchOptionsRoutingAvoidHighwaysKey));
      v53 = objc_msgSend(v52, "BOOLValue");

      if (v53)
        -[DirectionsPlan setAvoidHighways:](v33, "setAvoidHighways:", 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", MKLaunchOptionsRouteHandleKey));
      if (v54)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v33, "routeRequestStorage"));
        v56 = objc_msgSend(v55, "transportType") == 1;

        if (v56)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan routeRequestStorage](v33, "routeRequestStorage"));
          objc_msgSend(v57, "setRouteHandle:", v54);

        }
      }
      timePoint = self->_timePoint;
      if (timePoint)
      {
        v59 = timePoint;
        if (-[GEOURLTimePoint hasTime](v59, "hasTime"))
        {
          -[GEOURLTimePoint time](v59, "time");
          v61 = v60;
          if (-[GEOURLTimePoint hasType](v59, "hasType"))
          {
            v62 = -[GEOURLTimePoint type](v59, "type");
            if (v62)
            {
              if (v62 == 1)
                -[DirectionsPlan setArrivalTime:](v33, "setArrivalTime:", v61);
            }
            else
            {
              -[DirectionsPlan setDepartureTime:](v33, "setDepartureTime:", v61);
            }
          }
        }

      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "companionRouteContext"));

      if (v64)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "companionRouteContext"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "data"));
        -[DirectionsPlan setCompanionRouteContextData:](v33, "setCompanionRouteContextData:", v66);

      }
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask mapsActivity](self, "mapsActivity"));
      objc_msgSend(v67, "setDirectionsPlan:", v33);

      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        self->_needsUserLocation = 1;
        self->_userLocationDesiredAccuracy = kCLLocationAccuracyBestForNavigation;
      }

      _Block_object_dispose(buf, 8);
      v16 = 1;
      goto LABEL_56;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v17, "captureUserAction:onTarget:eventValue:", 356, 505, 0);

    v18 = objc_msgSend(v79, "count");
    if (!v18 || !MapsFeature_IsEnabled_MapsWally(v18))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
      v16 = -[_MKHandlerURLHandlingTask _URLHandler:addStopWithMapItem:](self, "_URLHandler:addStopWithMapItem:", v78, v63);

LABEL_56:
      goto LABEL_57;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "lastObject"));
    v20 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
    {
      v69 = sub_1004318FC();
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        v71 = (objc_class *)objc_opt_class(v19);
        v72 = NSStringFromClass(v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Find My handle identifier is wrong type: %@"), v73));
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "-[_MKHandlerURLHandlingTask URLHandler:launchIntoDirectionsWithMapItems:options:context:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "URLHandlingTask.m";
        *(_WORD *)&buf[22] = 1024;
        v85 = 991;
        v86 = 2080;
        v87 = "[findMyHandleIdentifier isKindOfClass:NSString.class]";
        v88 = 2112;
        v89 = v74;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v75 = sub_1004318FC();
        v76 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v77;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_geoMapItemStorageForPersistence"));

    if (v22)
    {
      objc_msgSend(v22, "coordinate");
      v25 = v24;
      v26 = -180.0;
      if (v23 >= -180.0 && v23 <= 180.0 && v25 >= -90.0)
      {
        v27 = -180.0;
        if (v25 <= 90.0)
          objc_msgSend(v22, "coordinate", -180.0, -180.0);
        goto LABEL_60;
      }
    }
    else
    {
      v26 = -180.0;
    }
    v27 = -180.0;
LABEL_60:
    v16 = -[_MKHandlerURLHandlingTask _URLHandler:addFindMyStopWithHandleIdentifier:coordinate:](self, "_URLHandler:addFindMyStopWithHandleIdentifier:coordinate:", v78, v19, v26, v27);

    goto LABEL_56;
  }
  v16 = 0;
LABEL_57:

  return v16;
}

- (BOOL)_shouldAddStopWithLaunchOptions:(id)a3 requireLaunchIntoNavOrDirectionsModeOption:(BOOL)a4 requireSearchAlongRouteOption:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  char IsEnabled_Maps182;
  char v20;
  int IsEnabled_DrivingMultiWaypointRoutes;
  const __CFString *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  unsigned int v29;
  int v30;
  id v31;
  NSObject *v32;
  int v33;
  _BOOL4 v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  BOOL v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  id v52;
  const __CFString *v53;
  __CFString *v54;
  uint8_t buf[4];
  __CFString *v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  __CFString *v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  __CFString *v66;
  __int16 v67;
  __CFString *v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  __CFString *v72;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v9 = objc_msgSend(v8, "state");
  if (MNNavigationServiceStateIsNavigating(v9, v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v12 = objc_msgSend(v11, "navigationState") != 6;

  }
  else
  {
    v12 = 0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", _MKLaunchOptionsRoutingAvoidTollsKey));
  if (v13)
  {
    v14 = 1;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", _MKLaunchOptionsRoutingAvoidHighwaysKey));
    v14 = v15 != 0;

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v17 = objc_msgSend(v16, "navigationTransportType");
  switch((int)v17)
  {
    case 1:
    case 6:

      goto LABEL_12;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_11;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_11:
      v20 = IsEnabled_Maps182;

      if ((v20 & 1) != 0)
        goto LABEL_15;
LABEL_12:
      IsEnabled_DrivingMultiWaypointRoutes = 0;
      goto LABEL_13;
    default:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v17, v18);

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_15:
        IsEnabled_DrivingMultiWaypointRoutes = v12 && !v14;
        v22 = CFSTR("YES");
      }
      else
      {
LABEL_13:
        v22 = CFSTR("NO");
      }
      v53 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MKLaunchOptionsLaunchIntoNavKey));
      v24 = objc_msgSend(v23, "BOOLValue");

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", MKLaunchOptionsDirectionsModeKey));
      if (v25)
        v26 = 1;
      else
        v26 = v24;
      v27 = IsEnabled_DrivingMultiWaypointRoutes & v26;
      if (v6)
        IsEnabled_DrivingMultiWaypointRoutes = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", _MKLaunchOptionsSearchAlongRouteKey));
      v29 = objc_msgSend(v28, "BOOLValue");

      if (v5)
        v30 = IsEnabled_DrivingMultiWaypointRoutes & v29;
      else
        v30 = IsEnabled_DrivingMultiWaypointRoutes;
      v31 = sub_100431A4C();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v52 = v7;
        v33 = v30;
        v34 = v14;
        if (v6)
          v35 = CFSTR("YES");
        else
          v35 = CFSTR("NO");
        v54 = v35;
        if (v5)
          v36 = CFSTR("YES");
        else
          v36 = CFSTR("NO");
        v51 = v36;
        if (v12)
          v37 = CFSTR("YES");
        else
          v37 = CFSTR("NO");
        v50 = v37;
        if (v24)
          v38 = CFSTR("YES");
        else
          v38 = CFSTR("NO");
        v49 = v38;
        if (v25)
          v39 = CFSTR("YES");
        else
          v39 = CFSTR("NO");
        v40 = v39;
        v41 = !v34;
        v30 = v33;
        v7 = v52;
        if (v41)
          v42 = CFSTR("NO");
        else
          v42 = CFSTR("YES");
        v48 = v42;
        if (v29)
          v43 = CFSTR("YES");
        else
          v43 = CFSTR("NO");
        v44 = v43;
        if (v30)
          v45 = CFSTR("YES");
        else
          v45 = CFSTR("NO");
        v46 = v45;
        *(_DWORD *)buf = 138545410;
        v56 = v54;
        v57 = 2114;
        v58 = v51;
        v59 = 2114;
        v60 = v50;
        v61 = 2114;
        v62 = v49;
        v63 = 2114;
        v64 = v40;
        v65 = 2114;
        v66 = v48;
        v67 = 2114;
        v68 = v44;
        v69 = 2114;
        v70 = v53;
        v71 = 2114;
        v72 = v46;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "_shouldAddStopWithLaunchOptions: requireLaunchIntoNavOrDirectionsModeOption: %{public}@ requireSearchAlongRouteOption: %{public}@ isNavigating %{public}@, launchIntoNav %{public}@, hasLaunchIntoDirectionsKey %{public}@, hasCustomLaunchOptions %{public}@, searchAlongRoute %{public}@, IsMPREnabled %{public}@, shouldAddStop %{public}@", buf, 0x5Cu);

      }
      return v30;
  }
}

- (BOOL)_URLHandler:(id)a3 addStopWithMapItem:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  AddAStopAction *v8;
  MapsAction *currentAction;
  int v11;
  id v12;

  v5 = a4;
  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "URLHandlingTask addStopWithMapItem %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = -[AddAStopAction initWithMapItem:]([AddAStopAction alloc], "initWithMapItem:", v5);
  currentAction = self->_currentAction;
  self->_currentAction = &v8->super;

  return 1;
}

- (BOOL)_URLHandler:(id)a3 addFindMyStopWithHandleIdentifier:(id)a4 coordinate:(id)a5
{
  double var1;
  double var0;
  id v8;
  id v9;
  NSObject *v10;
  FindMyAction *v11;
  MapsAction *currentAction;
  int v14;
  id v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;

  var1 = a5.var1;
  var0 = a5.var0;
  v8 = a4;
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v14 = 138412803;
    v15 = v8;
    v16 = 2049;
    v17 = var0;
    v18 = 2049;
    v19 = var1;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "URLHandlingTask addFindMyStopWithHandleIdentifier %@ coordinate: {%{private}f, %{private}f}", (uint8_t *)&v14, 0x20u);
  }

  v11 = -[FindMyAction initWithFindMyHandleIdentifier:coordinate:]([FindMyAction alloc], "initWithFindMyHandleIdentifier:coordinate:", v8, var0, var1);
  currentAction = self->_currentAction;
  self->_currentAction = &v11->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoShowMapItems:(id)a4 options:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_100431A4C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v22 = 138412546;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoShowMapItems %@ %@", (uint8_t *)&v22, 0x16u);
  }

  -[_MKHandlerURLHandlingTask _processMKOptions:](self, "_processMKOptions:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v17 = objc_msgSend(v16, "isCarAppSceneHostingNavigation");

  if (-[_MKHandlerURLHandlingTask _shouldAddStopWithLaunchOptions:requireLaunchIntoNavOrDirectionsModeOption:requireSearchAlongRouteOption:](self, "_shouldAddStopWithLaunchOptions:requireLaunchIntoNavOrDirectionsModeOption:requireSearchAlongRouteOption:", v12, v17, 1)&& objc_msgSend(v11, "count") == (id)1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v18, "captureUserAction:onTarget:eventValue:", 356, 505, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v20 = -[_MKHandlerURLHandlingTask _URLHandler:addStopWithMapItem:](self, "_URLHandler:addStopWithMapItem:", v10, v19);

  }
  else
  {
    v20 = -[_MKHandlerURLHandlingTask URLHandler:launchIntoSearchWithMapItems:options:context:](self, "URLHandler:launchIntoSearchWithMapItems:options:context:", v10, v11, v12, v13);
  }

  return v20;
}

- (BOOL)URLHandler:(id)a3 launchIntoSearchWithMapItems:(id)a4 options:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SearchSelectionAction *v18;
  void *v19;
  MapsAction *v20;
  MapsAction *currentAction;
  uint64_t v22;
  uint64_t v23;
  __objc2_class *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  SearchResult *v42;
  MapsAction *v43;
  NSString *v44;
  void *v45;
  void *v46;
  id v47;
  MapsAction *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  int IsNavigating;
  uint64_t v54;
  uint64_t v55;
  uint64_t IsEnabled_Maps182;
  ShowSearchInfoAction *v57;
  MapsAction *v58;
  void *v59;
  id v60;
  MapsAction *v61;
  void *v63;
  unsigned int v64;
  _MKHandlerURLHandlingTask *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  id v72;
  __int16 v73;
  id v74;

  v8 = a4;
  v9 = a5;
  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v72 = v8;
    v73 = 2112;
    v74 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoSearchWithMapItems %@ %@", buf, 0x16u);
  }

  -[_MKHandlerURLHandlingTask _processMKOptions:](self, "_processMKOptions:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", _MKLaunchOptionsPreserveSearchResultsKey));
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = MKLaunchOptionsSelectedIndexKey;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", MKLaunchOptionsSelectedIndexKey));
  v16 = (void *)v15;
  if (!v8 && v13 && v15 != 0)
  {
    v18 = [SearchSelectionAction alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
    v20 = -[SearchSelectionAction initWithSelectedIndex:](v18, "initWithSelectedIndex:", objc_msgSend(v19, "unsignedIntegerValue"));

    currentAction = self->_currentAction;
    self->_currentAction = v20;
    goto LABEL_61;
  }
  if (objc_msgSend(v8, "count") == (id)1)
  {
    currentAction = (MapsAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    if (-[MapsAction isCurrentLocation](currentAction, "isCurrentLocation"))
    {
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", MKLaunchOptionsMapSpanKey));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", MKLaunchOptionsMapCenterKey));
      if (!(v22 | v23))
      {
        v48 = (MapsAction *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
        -[MapsAction setUserTrackingMode:](v48, "setUserTrackingMode:", 1);
LABEL_60:

        goto LABEL_61;
      }

    }
    if (-[MapsAction _hasMuninViewState](currentAction, "_hasMuninViewState"))
    {
      v24 = OpenLookAroundAction;
LABEL_59:
      v61 = (MapsAction *)objc_msgSend([v24 alloc], "initWithMapItem:", currentAction);
      v48 = self->_currentAction;
      self->_currentAction = v61;
      goto LABEL_60;
    }
    if ((-[MapsAction _hasMUID](currentAction, "_hasMUID") & 1) == 0
      && -[MapsAction _hasResolvablePartialInformation](currentAction, "_hasResolvablePartialInformation"))
    {
      v24 = ForwardGeocodeAction;
      goto LABEL_59;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAction _geoAddress](currentAction, "_geoAddress"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "structuredAddress"));
    if (v26)
    {

    }
    else
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAction _geoAddress](currentAction, "_geoAddress"));
      v60 = objc_msgSend(v59, "formattedAddressLinesCount");

      if (v60)
      {
        v24 = RefineMapItemAction;
        goto LABEL_59;
      }
    }

  }
  v64 = v13;
  v65 = self;
  -[_MKHandlerURLHandlingTask regionForLaunchOptions:andMapItems:](self, "regionForLaunchOptions:andMapItems:", v9, v8);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v36 = v8;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v42 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v41);
        if ((objc_msgSend(v41, "isCurrentLocation") & 1) == 0)
        {
          if (!v42)
            continue;
          objc_msgSend(v35, "addObject:", v42);
        }

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    }
    while (v38);
  }

  if (v30 < -180.0 || v30 > 180.0 || v28 < -90.0 || v28 > 90.0 || v32 < 0.0 || v32 > 180.0 || v34 < 0.0 || v34 > 360.0)
    v43 = (MapsAction *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v35));
  else
    v43 = (MapsAction *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:mapRegion:](SearchInfo, "searchInfoWithResults:mapRegion:", v35, v28, v30, v32, v34));
  currentAction = v43;
  if (v16)
    -[MapsAction setSelectedIndex:](v43, "setSelectedIndex:", objc_msgSend(v16, "unsignedIntegerValue"));
  v44 = v65->_searchTerm;
  if (!-[NSString length](v44, "length"))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAction selectedResult](currentAction, "selectedResult"));
    v46 = v45;
    if (v45)
    {
      v47 = v45;
    }
    else
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAction results](currentAction, "results"));
      v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "firstObject"));

    }
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));

    v44 = (NSString *)v49;
  }
  -[MapsAction setShouldPreserveResults:](currentAction, "setShouldPreserveResults:", v64);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v51 = objc_msgSend(v50, "state");
  IsNavigating = MNNavigationServiceStateIsNavigating(v51, v52);

  if (IsNavigating)
  {
    if (v65->_searchAlongRoute
      || (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v54, v55) & 1) != 0
      || (MapsFeature_IsEnabled_Maps420() & 1) != 0)
    {
      IsEnabled_Maps182 = 1;
    }
    else
    {
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
    }
  }
  else
  {
    IsEnabled_Maps182 = 0;
  }
  -[MapsAction setSearchAlongRoute:](currentAction, "setSearchAlongRoute:", IsEnabled_Maps182);
  -[MapsAction setSearchText:](currentAction, "setSearchText:", v44);
  v57 = -[ShowSearchInfoAction initWithSearchInfo:]([ShowSearchInfoAction alloc], "initWithSearchInfo:", currentAction);
  v58 = v65->_currentAction;
  v65->_currentAction = &v57->super;

LABEL_61:
  return 1;
}

- (BOOL)URLHandler:(id)a3 setRegion:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  NSObject *v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  BOOL result;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t v32[16];

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v13 = sub_100431A4C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegion", v32, 2u);
  }

  result = 0;
  if (v10 >= -180.0 && v10 <= 180.0 && v11 >= -90.0 && v11 <= 90.0)
  {
    result = 0;
    if (v9 >= 0.0 && v9 <= 180.0 && v8 >= 0.0 && v8 <= 360.0)
    {
      v15.n128_f64[0] = v11;
      v16.n128_f64[0] = v10;
      v17.n128_f64[0] = v9;
      v18.n128_f64[0] = v8;
      v20 = MKMapRectForCoordinateRegion(v15, v16, v17, v18);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      -[URLHandlingTask windowSize](self, "windowSize");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v20, v22, v24, v26, v27, v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "geoCamera"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
      objc_msgSend(v31, "setCamera:", v30);

      return 1;
    }
  }
  return result;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCamera:(id *)a4 pitch:(double)a5 yaw:(double)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v17;
  NSObject *v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  BOOL result;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t v36[16];

  v10 = v9;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  v17 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCamera", v36, 2u);
  }

  result = 0;
  if (a6 >= -180.0 && a6 <= 180.0 && a5 >= -90.0 && a5 <= 90.0)
  {
    result = 0;
    if (v13 >= 0.0 && v13 <= 180.0 && v12 >= 0.0 && v12 <= 360.0)
    {
      v19.n128_f64[0] = a5;
      v20.n128_f64[0] = a6;
      v21.n128_f64[0] = v13;
      v22.n128_f64[0] = v12;
      v24 = MKMapRectForCoordinateRegion(v19, v20, v21, v22);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      -[URLHandlingTask windowSize](self, "windowSize");
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v24, v26, v28, v30, v31, v32));
      objc_msgSend(v33, "setPitch:", v11);
      objc_msgSend(v33, "setHeading:", v10);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "geoCamera"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
      objc_msgSend(v35, "setCamera:", v34);

      return 1;
    }
  }
  return result;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4 altitude:(double)a5
{
  double longitude;
  double latitude;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];

  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenterAndCamera", v15, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", latitude, longitude, a5, 0.0, 0.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoCamera"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
  objc_msgSend(v13, "setCamera:", v12);

  return 1;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenterAndCamera:(CLLocationCoordinate2D)a4 altitude:(double)a5 pitch:(double)a6 yaw:(double)a7
{
  double longitude;
  double latitude;
  id v13;
  NSObject *v14;
  MKMapCamera *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v20[16];

  longitude = a4.longitude;
  latitude = a4.latitude;
  v13 = sub_100431A4C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenterAndCamera", v20, 2u);
  }

  v15 = +[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", latitude, longitude, (double)(a5 / cos(a6 * 0.0174532925)), a6, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geoCamera"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
  objc_msgSend(v18, "setCamera:", v17);

  return 1;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenterAndCamera:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5 pitch:(double)a6 yaw:(double)a7
{
  double longitude;
  double latitude;
  id v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  CLLocationCoordinate2D v15;
  id v16;
  double v17;
  double v18;
  uint8_t v20[16];

  longitude = a4.longitude;
  latitude = a4.latitude;
  v11 = a3;
  v12 = sub_100431A4C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenter/zoomLevel", v20, 2u);
  }

  v14 = 0;
  if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
  {
    v15 = CLLocationCoordinate2DMake(latitude, longitude);
    v16 = -[URLHandlingTask windowSize](self, "windowSize");
    v14 = -[_MKHandlerURLHandlingTask URLHandler:setRegionWithCamera:pitch:yaw:](self, "URLHandler:setRegionWithCamera:pitch:yaw:", v11, MKCoordinateRegionMakeWithZoomLevel(v16, v15.latitude, v15.longitude, a5, v17, v18));
  }

  return v14;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4 zoomLevel:(double)a5
{
  double longitude;
  double latitude;
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  CLLocationCoordinate2D v13;
  id v14;
  double v15;
  double v16;
  uint8_t v18[16];

  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a3;
  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenter/zoomLevel", v18, 2u);
  }

  v12 = 0;
  if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
  {
    v13 = CLLocationCoordinate2DMake(latitude, longitude);
    v14 = -[URLHandlingTask windowSize](self, "windowSize");
    v12 = -[_MKHandlerURLHandlingTask URLHandler:setRegion:](self, "URLHandler:setRegion:", v9, MKCoordinateRegionMakeWithZoomLevel(v14, v13.latitude, v13.longitude, a5, v15, v16));
  }

  return v12;
}

- (BOOL)URLHandler:(id)a3 setRegionWithCenter:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  uint8_t v12[16];

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  v8 = sub_100431A4C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask setRegionWithCenter", v12, 2u);
  }

  v10 = -[_MKHandlerURLHandlingTask URLHandler:setRegionWithCenter:zoomLevel:](self, "URLHandler:setRegionWithCenter:zoomLevel:", v7, latitude, longitude, (double)(unint64_t)GEOConfigGetUInteger(MapsConfig_DefaultZoomLevelAtLaunch, off_1014B3088));
  return v10;
}

- (BOOL)URLHandler:(id)a3 setUserTrackingMode:(int64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v11;
  int64_t v12;

  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134217984;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "URLHandlingTask setUserTrackingMode %lu", (uint8_t *)&v11, 0xCu);
  }

  if (a4 == 1)
    v8 = 1;
  else
    v8 = 2 * (a4 == 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
  objc_msgSend(v9, "setUserTrackingMode:", v8);

  return 1;
}

- (BOOL)URLHandler:(id)a3 setMapType:(unint64_t)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  int IsNavigating;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  int v18;
  unint64_t v19;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3));
  v7 = objc_msgSend(v6, "state");
  IsNavigating = MNNavigationServiceStateIsNavigating(v7, v8);

  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (IsNavigating)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 134217984;
      v19 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "URLHandlingTask ignoring setMapType %lu", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "URLHandlingTask setMapType %lu", (uint8_t *)&v18, 0xCu);
  }

  switch(a4)
  {
    case 1uLL:
    case 3uLL:
      v13 = 1;
      break;
    case 2uLL:
    case 4uLL:
      v13 = 2;
      break;
    default:
      if (a4 == 108)
        v14 = 4;
      else
        v14 = 0;
      if (a4 == 104)
        v13 = 3;
      else
        v13 = v14;
      break;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
  objc_msgSend(v15, "setMapType:", v13);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
  LODWORD(v15) = objc_msgSend(v16, "hasMapType");

  if ((_DWORD)v15)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
    -[NSObject setIgnoreLabelPreference:](v12, "setIgnoreLabelPreference:", 1);
LABEL_17:

  }
  return IsNavigating ^ 1;
}

- (BOOL)URLHandler:(id)a3 setShowTraffic:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v11;
  const __CFString *v12;

  v4 = a4;
  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "URLHandlingTask setShowTraffic %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
  objc_msgSend(v9, "setEnableTraffic:", v4);

  return 1;
}

- (BOOL)URLHandler:(id)a3 showMapWithoutPinAt:(CLLocationCoordinate2D)a4
{
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = sub_100431A4C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "URLHandlingTask showMapWithoutPinAt", v7, 2u);
  }

  return 1;
}

- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 to:(id)a5 using:(unint64_t)a6
{
  return -[_MKHandlerURLHandlingTask URLHandler:showDirectionsFrom:to:using:muid:providerId:showLabel:](self, "URLHandler:showDirectionsFrom:to:using:muid:providerId:showLabel:", a3, a4, a5, a6, 0, 0, 0);
}

- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 to:(id)a5 using:(unint64_t)a6 muid:(unint64_t)a7 providerId:(int)a8 showLabel:(id)a9
{
  uint64_t v9;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  BOOL v26;
  id v28;

  v9 = *(_QWORD *)&a8;
  v15 = a3;
  v16 = a4;
  v17 = (unint64_t)a5;
  v18 = (unint64_t)a9;
  if (v17 | v18)
  {
    v19 = objc_alloc_init((Class)NSMutableDictionary);
    v20 = v19;
    if (v17)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, MKURLDestinationAddressKey);
    if (a7 && (int)v9 >= 1)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a7));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, MKURLDestinationMUIDKey);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, MKURLDestinationProviderIDKey);

    }
    if (v18)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, MKURLDestinationLabelKey);
    v23 = objc_msgSend(v20, "copy");
    v28 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));

  }
  else
  {
    v24 = 0;
  }
  v25 = objc_msgSend(v24, "copy");
  v26 = -[_MKHandlerURLHandlingTask URLHandler:showDirectionsFrom:toDestinations:using:](self, "URLHandler:showDirectionsFrom:toDestinations:using:", v15, v16, v25, a6);

  return v26;
}

- (BOOL)URLHandler:(id)a3 showDirectionsFrom:(id)a4 toDestinations:(id)a5 using:(unint64_t)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double longitude;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  SearchFieldItem *v26;
  BOOL v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  ExternalURLQuery *v33;
  void *v34;
  SearchFieldItem *v35;
  void *v36;
  SearchFieldItem *v37;
  void *v38;
  id v39;
  uint64_t v40;
  int IsNavigating;
  void *v42;
  void *v43;
  void *v44;
  DirectionItem *v45;
  uint64_t v46;
  DrivePreferences *v47;
  _BOOL8 v48;
  _BOOL8 v49;
  void *v50;
  DrivePreferences *v51;
  uint64_t v52;
  DirectionAction *v53;
  MapsAction *currentAction;
  unint64_t v56;
  uint64_t v57;
  void *v59;
  id v60;
  void *v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[5];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  int v77;
  _BYTE v78[128];

  v56 = a6;
  v60 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v73 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "URLHandlingTask showDirectionsFrom %@...", buf, 0xCu);
  }
  v59 = v8;

  v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  v61 = v12;
  if (v13)
  {
    v14 = v13;
    v65 = *(_QWORD *)v69;
    v63 = MKURLDestinationMUIDKey;
    v64 = MKURLDestinationAddressKey;
    v15 = MKURLDestinationProviderIDKey;
    v16 = MKURLDestinationLabelKey;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v65)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v64, v56));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v63));
        v22 = objc_msgSend(v21, "unsignedLongValue");

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v15));
        v24 = objc_msgSend(v23, "intValue");

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v16));
        v26 = objc_alloc_init(SearchFieldItem);
        if (v22)
          v27 = (int)v24 < 1;
        else
          v27 = 1;
        if (v27)
        {
          if (objc_msgSend(v20, "length"))
          {
            v28 = sub_100431A4C();
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v73 = v20;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "\t-> %@", buf, 0xCu);
            }

            -[SearchFieldItem setSearchString:](v26, "setSearchString:", v20);
          }
        }
        else
        {
          v30 = sub_100431A4C();
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v73 = v25;
            v74 = 2048;
            v75 = v22;
            v76 = 1024;
            v77 = (int)v24;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "\t-> %@ (ID=%llu, providerID=%d)", buf, 0x1Cu);
          }

          v33 = -[ExternalURLQuery initWithQuery:coordinate:muid:resultProviderId:contentProvider:]([ExternalURLQuery alloc], "initWithQuery:coordinate:muid:resultProviderId:contentProvider:", v25, v22, v24, 0, kCLLocationCoordinate2DInvalid.latitude, longitude);
          -[SearchFieldItem setExternalURLQuery:](v26, "setExternalURLQuery:", v33);

          if (v25)
            v34 = v25;
          else
            v34 = v20;
          -[SearchFieldItem setExternalQueryName:](v26, "setExternalQueryName:", v34);
          v12 = v61;
        }
        objc_msgSend(v12, "addObject:", v26);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v14);
  }

  v35 = objc_alloc_init(SearchFieldItem);
  if (objc_msgSend(v59, "length"))
  {
    -[SearchFieldItem setSearchString:](v35, "setSearchString:", v59);
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[SearchFieldItem setSearchResult:](v35, "setSearchResult:", v36);

  }
  objc_msgSend(v12, "insertObject:atIndex:", v35, 0, v56);
  if (objc_msgSend(v12, "count") == (id)1)
  {
    v37 = objc_alloc_init(SearchFieldItem);
    objc_msgSend(v12, "addObject:", v37);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v39 = objc_msgSend(v38, "state");
  IsNavigating = MNNavigationServiceStateIsNavigating(v39, v40);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "searchString"));

  if (IsNavigating && objc_msgSend(v43, "length"))
  {
    -[_MKHandlerURLHandlingTask URLHandlerWillStartAsynchronousHandling:](self, "URLHandlerWillStartAsynchronousHandling:", v60);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v45 = (DirectionItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "ticketForForwardGeocodeString:traits:", v43, 0));

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10049BC7C;
    v66[3] = &unk_1011AE6F0;
    v66[4] = self;
    v67 = v60;
    -[DirectionItem submitWithHandler:networkActivity:](v45, "submitWithHandler:networkActivity:", v66, 0);

  }
  else
  {
    v46 = v57;
    switch(v57)
    {
      case 1:
        break;
      case 2:
        v46 = 2;
        break;
      case 4:
        v46 = 3;
        break;
      case 8:
        v46 = 5;
        break;
      default:
        v46 = 0;
        break;
    }
    v45 = -[DirectionItem initWithItems:transportType:]([DirectionItem alloc], "initWithItems:transportType:", v61, v46);
    if (self->_routeAvoidTolls || self->_routeAvoidHighways)
    {
      v47 = [DrivePreferences alloc];
      v48 = -[NSNumber BOOLValue](self->_routeAvoidTolls, "BOOLValue");
      v49 = -[NSNumber BOOLValue](self->_routeAvoidHighways, "BOOLValue");
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v51 = -[DrivePreferences initWithAvoidTolls:avoidHighways:ignoreLiveTraffic:defaults:](v47, "initWithAvoidTolls:avoidHighways:ignoreLiveTraffic:defaults:", v48, v49, 0, v50);

      -[DirectionItem setDrivePreferences:](v45, "setDrivePreferences:", v51);
    }
    if (-[MKURLContext originatedFromWatch](self->_urlContext, "originatedFromWatch"))
      v52 = 1;
    else
      v52 = 2;
    v53 = -[DirectionAction initWithDirectionItem:timePoint:source:]([DirectionAction alloc], "initWithDirectionItem:timePoint:source:", v45, self->_timePoint, v52);
    -[MapsAction setUserLocationAccuracy:](v53, "setUserLocationAccuracy:", kCLLocationAccuracyBestForNavigation);
    currentAction = self->_currentAction;
    self->_currentAction = &v53->super;

    self->_needsUserLocation = 1;
    self->_userLocationDesiredAccuracy = kCLLocationAccuracyBestForNavigation;
  }

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoRAPForMapItem:(id)a4 options:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  PresentRAPAction *v12;
  MapsAction *currentAction;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoRAPForMapItem %@ options %@", (uint8_t *)&v15, 0x16u);
  }

  v12 = -[PresentRAPAction initWithMapItem:]([PresentRAPAction alloc], "initWithMapItem:", v8);
  currentAction = self->_currentAction;
  self->_currentAction = &v12->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoPhotoThumbnailGalleryForMapItem:(id)a4 albumIndex:(unint64_t)a5 options:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  PresentPhotoThumbnailGalleryAction *v14;
  MapsAction *currentAction;
  int v17;
  unint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v10 = a4;
  v11 = a6;
  v12 = sub_100431A4C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134218498;
    v18 = a5;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoPhotoThumbnailGalleryForMapItem %lu albumIndex %@ options %@", (uint8_t *)&v17, 0x20u);
  }

  v14 = -[PresentPhotoThumbnailGalleryAction initWithMapItem:albumIndex:]([PresentPhotoThumbnailGalleryAction alloc], "initWithMapItem:albumIndex:", v10, a5);
  currentAction = self->_currentAction;
  self->_currentAction = &v14->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoTableBookingForMapItem:(id)a4 options:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  PresentTableBookingAction *v12;
  MapsAction *currentAction;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoTableBookingForMapItem %@ options %@", (uint8_t *)&v15, 0x16u);
  }

  v12 = -[PresentTableBookingAction initWithMapItem:]([PresentTableBookingAction alloc], "initWithMapItem:", v8);
  currentAction = self->_currentAction;
  self->_currentAction = &v12->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showAddressByRecordID:(id)a4 addressID:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  AddressBookAddress *v13;
  void *v14;
  SearchFieldItem *v15;
  SearchAction *v16;
  MapsAction *currentAction;
  int v19;
  id v20;
  __int16 v21;
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412546;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask showAddressByRecordID %@ addressID %@", (uint8_t *)&v19, 0x16u);
  }

  v11 = 0;
  if (v7 && v8)
  {
    v12 = objc_msgSend(v7, "intValue");
    if ((_DWORD)v12 == -1)
    {
      v11 = 0;
    }
    else
    {
      v13 = -[AddressBookAddress initWithRecordID:addressID:]([AddressBookAddress alloc], "initWithRecordID:addressID:", v12, objc_msgSend(v8, "intValue"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](v13, "contact"));
      v11 = v14 != 0;

      if (v14)
      {
        v15 = objc_alloc_init(SearchFieldItem);
        -[SearchFieldItem setAddress:](v15, "setAddress:", v13);
        v16 = -[SearchAction initWithSearchItem:alongRoute:]([SearchAction alloc], "initWithSearchItem:alongRoute:", v15, self->_searchAlongRoute);
        currentAction = self->_currentAction;
        self->_currentAction = &v16->super;

      }
    }
  }

  return v11;
}

- (BOOL)URLHandler:(id)a3 showAddressByCNContactIdentifier:(id)a4 addressIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  AddressBookAddress *v11;
  void *v12;
  BOOL v13;
  SearchFieldItem *v14;
  SearchAction *v15;
  MapsAction *currentAction;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v7 = a4;
  v8 = a5;
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask showAddressByCNContactIdentifier %@ addressID %@", (uint8_t *)&v18, 0x16u);
  }

  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    v11 = -[AddressBookAddress initWithCNContactIdentifier:addressIdentifier:]([AddressBookAddress alloc], "initWithCNContactIdentifier:addressIdentifier:", v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddress contact](v11, "contact"));
    v13 = v12 != 0;

    if (v12)
    {
      v14 = objc_alloc_init(SearchFieldItem);
      -[SearchFieldItem setAddress:](v14, "setAddress:", v11);
      v15 = -[SearchAction initWithSearchItem:alongRoute:]([SearchAction alloc], "initWithSearchItem:alongRoute:", v14, self->_searchAlongRoute);
      currentAction = self->_currentAction;
      self->_currentAction = &v15->super;

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)URLHandler:(id)a3 showAddress:(id)a4 label:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  SearchFieldItem *v11;
  SearchAction *v12;
  MapsAction *currentAction;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask showAddress %@ addressID %@", (uint8_t *)&v15, 0x16u);
  }

  v11 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setAddressString:](v11, "setAddressString:", v7);
  -[SearchFieldItem setAddressStringLabel:](v11, "setAddressStringLabel:", v8);
  v12 = -[SearchAction initWithSearchItem:alongRoute:]([SearchAction alloc], "initWithSearchItem:alongRoute:", v11, self->_searchAlongRoute);
  currentAction = self->_currentAction;
  self->_currentAction = &v12->super;

  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  return 1;
}

- (BOOL)URLHandler:(id)a3 showAddress:(id)a4 label:(id)a5 at:(CLLocationCoordinate2D)a6
{
  double longitude;
  double latitude;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  PlaceRefinementAction *v14;
  MapsAction *currentAction;
  int v17;
  id v18;
  __int16 v19;
  id v20;

  longitude = a6.longitude;
  latitude = a6.latitude;
  v10 = a4;
  v11 = a5;
  v12 = sub_100431A4C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "URLHandlingTask showAddress %@ addressID %@ at coordinate", (uint8_t *)&v17, 0x16u);
  }

  v14 = -[PlaceRefinementAction initWithLabel:atCoordinate:address:]([PlaceRefinementAction alloc], "initWithLabel:atCoordinate:address:", v11, v10, latitude, longitude);
  currentAction = self->_currentAction;
  self->_currentAction = &v14->super.super;

  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  return 1;
}

- (BOOL)URLHandler:(id)a3 showLabel:(id)a4 at:(CLLocationCoordinate2D)a5
{
  double longitude;
  double latitude;
  id v8;
  id v9;
  NSObject *v10;
  ReverseGeocodeAction *v11;
  MapsAction *currentAction;
  int v14;
  id v15;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v8 = a4;
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask label %@  at coordinate", (uint8_t *)&v14, 0xCu);
  }

  v11 = -[ReverseGeocodeAction initWithLabel:atCoordinate:]([ReverseGeocodeAction alloc], "initWithLabel:atCoordinate:", v8, latitude, longitude);
  currentAction = self->_currentAction;
  self->_currentAction = &v11->super;

  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  return 1;
}

- (BOOL)URLHandler:(id)a3 showMUID:(unint64_t)a4 resultProviderID:(int)a5 coordinate:(CLLocationCoordinate2D)a6 query:(id)a7
{
  double longitude;
  double latitude;
  uint64_t v9;
  id v12;
  id v13;
  NSObject *v14;
  ExternalURLQuery *v15;
  SearchFieldItem *v16;
  SearchAction *v17;
  MapsAction *currentAction;
  int v20;
  unint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;

  longitude = a6.longitude;
  latitude = a6.latitude;
  v9 = *(_QWORD *)&a5;
  v12 = a7;
  v13 = sub_100431A4C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v20 = 134218498;
    v21 = a4;
    v22 = 1024;
    v23 = v9;
    v24 = 2112;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "URLHandlingTask showMUID %llu  resultProviderID:%d query:%@", (uint8_t *)&v20, 0x1Cu);
  }

  v15 = -[ExternalURLQuery initWithQuery:coordinate:muid:resultProviderId:contentProvider:]([ExternalURLQuery alloc], "initWithQuery:coordinate:muid:resultProviderId:contentProvider:", v12, a4, v9, self->_contentProvider, latitude, longitude);
  if (v15)
  {
    v16 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setExternalURLQuery:](v16, "setExternalURLQuery:", v15);
    v17 = -[SearchAction initWithSearchItem:alongRoute:]([SearchAction alloc], "initWithSearchItem:alongRoute:", v16, self->_searchAlongRoute);
    currentAction = self->_currentAction;
    self->_currentAction = &v17->super;

    self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  }

  return 1;
}

- (BOOL)URLHandler:(id)a3 showExternalBusinessID:(id)a4 ofContentProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSString *v11;
  NSString *contentProvider;
  ResolveMUIDAction *v13;
  MapsAction *currentAction;
  int v16;
  id v17;
  __int16 v18;
  id v19;

  v7 = a4;
  v8 = a5;
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask showExternalBusinessID %@ contentProvider %@", (uint8_t *)&v16, 0x16u);
  }

  if (!self->_contentProvider)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    contentProvider = self->_contentProvider;
    self->_contentProvider = v11;

  }
  v13 = -[ResolveMUIDAction initWithBusinessID:contentProvider:]([ResolveMUIDAction alloc], "initWithBusinessID:contentProvider:", v7, self->_contentProvider);
  currentAction = self->_currentAction;
  self->_currentAction = &v13->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 search:(id)a4 at:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v8;
  id v9;
  NSObject *v10;
  SearchFieldItem *v11;
  void *v12;
  void *v13;
  CLLocationCoordinate2D v14;
  SearchAction *v15;
  MapsAction *currentAction;
  int v18;
  id v19;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v8 = a4;
  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "URLHandlingTask search %@ searchCoordinate", (uint8_t *)&v18, 0xCu);
  }

  v11 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v11, "setSearchString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](self->_mapsActivity, "displayOptions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "camera"));

  if (!v13)
  {
    v14 = CLLocationCoordinate2DMake(latitude, longitude);
    -[SearchFieldItem setCoordinateHint:](v11, "setCoordinateHint:", v14.latitude, v14.longitude);
  }
  self->_userLocationDesiredAccuracy = kCLLocationAccuracyBest;
  v15 = -[SearchAction initWithSearchItem:alongRoute:]([SearchAction alloc], "initWithSearchItem:alongRoute:", v11, self->_searchAlongRoute);
  currentAction = self->_currentAction;
  self->_currentAction = &v15->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showLineWithID:(unint64_t)a4 name:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  unint64_t v15;
  __int16 v16;
  id v17;

  v7 = a5;
  v8 = sub_100431A4C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218242;
    v15 = a4;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "URLHandlingTask showLineWithID %llu lineName %@", (uint8_t *)&v14, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask mapsActivity](self, "mapsActivity"));
  objc_msgSend(v10, "setSelectedTransitFeatureID:", a4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask mapsActivity](self, "mapsActivity"));
  objc_msgSend(v11, "setSelectedTransitLineName:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MKHandlerURLHandlingTask displayOptions](self, "displayOptions"));
  objc_msgSend(v12, "setMapType:", 3);

  return 1;
}

- (BOOL)URLHandler:(id)a3 showFavoritesType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  OpenFavoritesAction *v8;
  MapsAction *currentAction;
  int v11;
  int64_t v12;

  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134217984;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "URLHandlingTask showFavoritesType %ld", (uint8_t *)&v11, 0xCu);
  }

  v8 = -[OpenFavoritesAction initWithFavoriteType:]([OpenFavoritesAction alloc], "initWithFavoriteType:", a4);
  currentAction = self->_currentAction;
  self->_currentAction = &v8->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 enterLookAroundWithViewState:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  OpenLookAroundAction *v8;
  MapsAction *currentAction;
  int v11;
  id v12;

  v5 = a4;
  v6 = sub_100431A4C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "URLHandlingTask enterLookAroundWithViewState %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = -[OpenLookAroundAction initWithMuninViewState:]([OpenLookAroundAction alloc], "initWithMuninViewState:", v5);
  currentAction = self->_currentAction;
  self->_currentAction = &v8->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 launchIntoTesterWithParam:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  MapsTester *v7;
  int v9;
  id v10;

  v4 = a4;
  v5 = sub_100431A4C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "URLHandlingTask launchIntoTesterWithParam %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = objc_alloc_init(MapsTester);
  -[MapsTester runTestCode](v7, "runTestCode");

  return 1;
}

- (BOOL)URLHandler:(id)a3 showMapItem:(id)a4 label:(id)a5 at:(CLLocationCoordinate2D)a6
{
  return 1;
}

- (BOOL)URLHandler:(id)a3 showCollection:(id)a4
{
  id v5;
  ShowCollectionAction *v6;
  MapsAction *currentAction;

  v5 = a4;
  v6 = -[ShowCollectionAction initWithCollectionStorage:]([ShowCollectionAction alloc], "initWithCollectionStorage:", v5);

  currentAction = self->_currentAction;
  self->_currentAction = &v6->super;

  return 1;
}

- (BOOL)URLHandlerShowCarDestinations:(id)a3
{
  ShowCarDestinationsAction *v4;
  MapsAction *currentAction;

  v4 = objc_alloc_init(ShowCarDestinationsAction);
  currentAction = self->_currentAction;
  self->_currentAction = &v4->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showCuratedCollectionWithID:(unint64_t)a4 resultProviderID:(int)a5
{
  ShowCuratedCollectionAction *v6;
  MapsAction *currentAction;

  v6 = -[ShowCuratedCollectionAction initWithCuratedCollectionID:resultProviderID:]([ShowCuratedCollectionAction alloc], "initWithCuratedCollectionID:resultProviderID:", a4, *(_QWORD *)&a5);
  currentAction = self->_currentAction;
  self->_currentAction = &v6->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 showPublisherWithID:(unint64_t)a4 resultProviderID:(int)a5
{
  ShowPublisherAction *v6;
  MapsAction *currentAction;

  v6 = -[ShowPublisherAction initWithPublisherID:resultProviderID:]([ShowPublisherAction alloc], "initWithPublisherID:resultProviderID:", a4, *(_QWORD *)&a5);
  currentAction = self->_currentAction;
  self->_currentAction = &v6->super;

  return 1;
}

- (BOOL)URLHandlerShowAllCuratedCollections:(id)a3
{
  ShowAllCuratedCollectionsAction *v4;
  MapsAction *currentAction;

  v4 = objc_alloc_init(ShowAllCuratedCollectionsAction);
  currentAction = self->_currentAction;
  self->_currentAction = &v4->super;

  return 1;
}

- (BOOL)URLHandler:(id)a3 initiateOfflineDownloadForRegion:(id)a4 displayName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  OpenOfflineMapsManagementAction *v11;
  RichMapsActivity *v12;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask sourceApplication](self, "sourceApplication"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if (v10)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 381, 702, 0);
  v11 = objc_alloc_init(OpenOfflineMapsManagementAction);
  -[OpenOfflineMapsManagementAction setDownloadRegion:](v11, "setDownloadRegion:", v8);

  -[OpenOfflineMapsManagementAction setDownloadRegionName:](v11, "setDownloadRegionName:", v7);
  v12 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v11);
  -[_MKHandlerURLHandlingTask taskFinished:](self, "taskFinished:", v12);

  return 1;
}

- ($04D47FADD0355EF96E203C25856C2375)regionForLaunchOptions:(SEL)a3 andMapItems:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  double latitude;
  double v14;
  double longitude;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  double v25;
  double v26;
  void *j;
  MKMapPoint v28;
  id v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  double y;
  double width;
  double height;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  double x;
  double v48;
  double v49;
  double v50;
  void *i;
  void *v52;
  void *v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  double v62;
  CLLocationCoordinate2D v63;
  $04D47FADD0355EF96E203C25856C2375 *result;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  CLLocationCoordinate2D v75;
  MKMapPoint v76;
  MKMapRect v77;
  MKMapRect v78;
  MKMapRect v79;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", MKLaunchOptionsMapSpanKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", MKLaunchOptionsMapCenterKey));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", MKLaunchOptionsMapRadiusInMetersKey));
  if (v10)
  {
    objc_msgSend(v10, "MKCoordinateValue");
    latitude = v12;
    longitude = v14;
    if (!(v9 | v11))
    {
      v29 = -[URLHandlingTask windowSize](self, "windowSize");
      MKCoordinateRegionMakeWithZoomLevel(v29, latitude, longitude, 16.0, v30, v31);
      goto LABEL_43;
    }
    if (v11)
      goto LABEL_4;
LABEL_42:
    objc_msgSend((id)v9, "MKCoordinateSpanValue");
    goto LABEL_43;
  }
  if (!objc_msgSend(v8, "count"))
    goto LABEL_43;
  if (!(v9 | v11))
  {
    if (objc_msgSend(v8, "count") == (id)1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
      objc_msgSend(v32, "_coordinate");
      v34 = v33;
      v36 = v35;
      v37 = -[URLHandlingTask windowSize](self, "windowSize");
      MKCoordinateRegionMakeWithZoomLevel(v37, v34, v36, 16.0, v38, v39);

      goto LABEL_43;
    }
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v43 = v8;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v66;
      x = MKMapRectNull.origin.x;
      v48 = y;
      v49 = width;
      v50 = height;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v46)
            objc_enumerationMutation(v43);
          v52 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
          if (x == MKMapRectNull.origin.x && v48 == y && v49 == width && v50 == height)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "_displayMapRegion", (_QWORD)v65));
            v78.origin.x = GEOMapRectForMapRegion(v56, v61);
          }
          else
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "_displayMapRegion"));
            v79.origin.x = GEOMapRectForMapRegion(v56, v57);
            v79.origin.y = v58;
            v79.size.width = v59;
            v79.size.height = v60;
            v77.origin.x = x;
            v77.origin.y = v48;
            v77.size.width = v49;
            v77.size.height = v50;
            v78 = MKMapRectUnion(v77, v79);
          }
          x = v78.origin.x;
          v48 = v78.origin.y;
          v49 = v78.size.width;
          v50 = v78.size.height;

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v45);
    }
    else
    {
      x = MKMapRectNull.origin.x;
      v48 = y;
      v49 = width;
      v50 = height;
    }

    v17 = x;
    v18 = v48;
    v19 = v49;
    v20 = v50;
    goto LABEL_5;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v70;
    v25 = 0.0;
    v26 = 0.0;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v70 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j), "_coordinate");
        v28 = MKMapPointForCoordinate(v75);
        v26 = v26 + v28.x;
        v25 = v25 + v28.y;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v23);
  }
  else
  {
    v25 = 0.0;
    v26 = 0.0;
  }

  v62 = v26 / (double)(unint64_t)objc_msgSend(v21, "count");
  v76.y = v25 / (double)(unint64_t)objc_msgSend(v21, "count");
  v76.x = v62;
  v63 = MKCoordinateForMapPoint(v76);
  latitude = v63.latitude;
  longitude = v63.longitude;
  if (!v11)
    goto LABEL_42;
LABEL_4:
  objc_msgSend((id)v11, "doubleValue");
  v17 = MKMapRectMakeWithRadialDistance(latitude, longitude, v16);
LABEL_5:
  MKCoordinateRegionForMapRect(*(MKMapRect *)&v17);
LABEL_43:

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlContext, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_mapsActivity, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
  objc_storeStrong((id *)&self->_analyticsValue, 0);
  objc_storeStrong((id *)&self->_radiusInMeter, 0);
  objc_storeStrong((id *)&self->_timePoint, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_routeAvoidTolls, 0);
  objc_storeStrong((id *)&self->_routeAvoidHighways, 0);
  objc_storeStrong((id *)&self->_currentAction, 0);
}

@end

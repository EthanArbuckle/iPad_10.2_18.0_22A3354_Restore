@implementation NavigationFeedbackCollector

+ (NavigationFeedbackCollector)sharedFeedbackCollector
{
  if (qword_1014D3C40 != -1)
    dispatch_once(&qword_1014D3C40, &stru_1011DEED8);
  return (NavigationFeedbackCollector *)(id)qword_1014D3C38;
}

- (NavigationFeedbackCollector)initWithNavigationService:(id)a3
{
  id v5;
  NavigationFeedbackCollector *v6;
  NavigationFeedbackCollector *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  void *v14;
  NavigationEVBadTripFeedbackCollector *v15;
  MNNavigationService *navigationService;
  void *v17;
  NavigationEVBadTripFeedbackCollector *v18;
  NavigationEVBadTripFeedbackCollector *badTripCollector;
  void *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NavigationFeedbackCollector;
  v6 = -[NavigationFeedbackCollector init](&v22, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationService, a3);
    -[MNNavigationService registerObserver:](v7->_navigationService, "registerObserver:", v7);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("NavigationFeedbackCollectorQueue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = -[NavigationFeedbackCollector reset](v7, "reset");
    if (MapsFeature_IsEnabled_EVRouting(v12, v13))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      objc_msgSend(v14, "registerObserver:", v7);

      v15 = [NavigationEVBadTripFeedbackCollector alloc];
      navigationService = v7->_navigationService;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v18 = -[NavigationEVBadTripFeedbackCollector initWithNavigationService:virtualGarageService:](v15, "initWithNavigationService:virtualGarageService:", navigationService, v17);
      badTripCollector = v7->_badTripCollector;
      v7->_badTripCollector = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v20, "addObserver:selector:name:object:", v7, "virtualGarageDidBecomeAvailable", off_1014B63B0, 0);

    }
  }

  return v7;
}

- (void)reset
{
  NSData *responseID;
  NSString *traceFileName;
  NSMutableDictionary *v5;
  NSMutableDictionary *guidance;
  GEOStepFeedback *stepFeedback;
  NSMutableSet *junctionViewEventsDisplayed;
  GEOLocation *lastLocation;
  NSDate *v10;
  NSDate *navigationStartTime;
  NSArray *chargingSteps;
  NSMutableArray *v13;
  NSMutableArray *addedStopsDetails;
  NSMutableArray *v15;
  NSMutableArray *removedStopsDetails;
  NSNumber *expectedFinalStateOfCharge;
  NSNumber *initialStateOfCharge;
  id v19;

  -[NavigationFeedbackCollector setAudioFeedbackCollector:](self, "setAudioFeedbackCollector:", 0);
  responseID = self->_responseID;
  self->_responseID = 0;

  traceFileName = self->_traceFileName;
  self->_traceFileName = 0;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  guidance = self->_guidance;
  self->_guidance = v5;

  stepFeedback = self->_stepFeedback;
  self->_stepFeedback = 0;

  junctionViewEventsDisplayed = self->_junctionViewEventsDisplayed;
  self->_junctionViewEventsDisplayed = 0;

  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  v10 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  navigationStartTime = self->_navigationStartTime;
  self->_navigationStartTime = v10;

  *(_WORD *)&self->_wasEverConnectedToCarplay = 0;
  chargingSteps = self->_chargingSteps;
  self->_chargingSteps = 0;

  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  addedStopsDetails = self->_addedStopsDetails;
  self->_addedStopsDetails = v13;

  v15 = objc_opt_new(NSMutableArray);
  removedStopsDetails = self->_removedStopsDetails;
  self->_removedStopsDetails = v15;

  expectedFinalStateOfCharge = self->_expectedFinalStateOfCharge;
  self->_expectedFinalStateOfCharge = 0;

  initialStateOfCharge = self->_initialStateOfCharge;
  self->_initialStateOfCharge = 0;

  self->_batteryDied = 0;
  self->_parkingCount = 0;
  self->_parkedCount = 0;
  self->_arrivedCount = 0;
  *(_WORD *)&self->_addedChargingStationThroughSAR = 0;
  -[NavigationFeedbackCollector setDidArrive:](self, "setDidArrive:", 0);
  v19 = objc_alloc_init((Class)GEODirectionsFeedbackCollector);
  -[NavigationFeedbackCollector setFeedbackCollector:](self, "setFeedbackCollector:", v19);

  -[NavigationFeedbackCollector setPrevStep:](self, "setPrevStep:", 0);
  -[NavigationFeedbackCollector setIsPlayingTrace:](self, "setIsPlayingTrace:", 0);
  -[NavigationFeedbackCollector setPreviousAlert:](self, "setPreviousAlert:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector navigationService](self, "navigationService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NavigationFeedbackCollector;
  -[NavigationFeedbackCollector dealloc](&v4, "dealloc");
}

- (void)virtualGarageDidBecomeAvailable
{
  uint64_t IsEnabled_EVRouting;
  uint64_t Log;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(self, a2);
  if ((IsEnabled_EVRouting & 1) != 0 || MapsFeature_IsEnabled_Alberta(IsEnabled_EVRouting))
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavigationFeedbackCollector");
    v5 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "virtualGarageDidBecomeAvailable, fetching garage.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1009EDE50;
    v7[3] = &unk_1011AD100;
    objc_copyWeak(&v8, buf);
    objc_msgSend(v6, "virtualGarageGetGarageWithReply:", v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)_captureVirtualGarageAnalytics:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    LODWORD(v6) = 0;
    LODWORD(v7) = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "licensePlate"));

        if (v11)
          v7 = (v7 + 1);
        else
          v7 = v7;
        v6 = v6 + objc_msgSend(v10, "isPureElectricVehicle");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v12, "setMapFeatureLicensePlateCount:", v7);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v13, "setMapFeatureElectronicVehicleCount:", v6);

}

- (void)addTrafficRerouteFeedback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
  objc_msgSend(v5, "addTrafficRerouteFeedback:", v4);

}

- (void)setJunctionViewDisplayed:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1009EE230;
    v6[3] = &unk_1011DEF28;
    v6[4] = self;
    v7 = v4;
    -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v6);

  }
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  int wasEverConnectedToCarplay;
  int v4;

  wasEverConnectedToCarplay = self->_wasEverConnectedToCarplay;
  v4 = self->_wasEverConnectedToCarplay || a3;
  self->_wasEverConnectedToCarplay = v4;
  if (wasEverConnectedToCarplay != v4)
    -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DEF68);
}

- (void)setAddedChargingStationThroughSAR:(BOOL)a3
{
  if (self->_addedChargingStationThroughSAR != a3)
    self->_addedChargingStationThroughSAR = a3;
}

- (void)setCurrentRoute:(id)a3
{
  GEOComposedRoute **p_currentRoute;
  id v6;

  p_currentRoute = &self->_currentRoute;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_currentRoute) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentRoute, a3);
    if (v6)
      -[GEODirectionsFeedbackCollector setTransportType:](self->_feedbackCollector, "setTransportType:", objc_msgSend(v6, "transportType"));
    if (-[GEOComposedRoute isEVRoute](*p_currentRoute, "isEVRoute"))
    {
      -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DEF88);
      -[NavigationFeedbackCollector _saveChargingStationInfo](self, "_saveChargingStationInfo");
    }
  }

}

- (void)didSuggestWalkingRoute
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DEFA8);
}

- (void)userAcceptedWalkingRoute
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DEFC8);
}

- (void)didSuggestFindMy
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DEFE8);
}

- (void)userLaunchedFindMy
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DF008);
}

- (id)_stateOfChargeOfCurrentVehicle
{
  VGVehicle *currentVehicle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t Log;
  NSObject *v14;
  uint8_t v16[16];

  currentVehicle = self->_currentVehicle;
  if (currentVehicle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle currentVehicleState](currentVehicle, "currentVehicleState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentBatteryCapacity"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle currentVehicleState](self->_currentVehicle, "currentVehicleState"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentBatteryCapacity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitEnergy kilowattHours](NSUnitEnergy, "kilowattHours"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "measurementByConvertingToUnit:", v8));
      objc_msgSend(v9, "doubleValue");
      v11 = v10 * 1000.0;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
    }
    else
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavigationFeedbackCollector");
      v14 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "_saveExpectedFinalStateOfChargeIfNeeded: there is no vehicle selected", v16, 2u);
      }

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)_routePaused
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DF028);
}

- (void)vehicleBatteryDied
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DF048);
}

- (void)offeredEVRerouteWithAlternateRoute:(id)a3 wasAccepted:(BOOL)a4
{
  id v5;
  _QWORD v6[4];
  NavigationFeedbackCollector *v7;
  id v8;
  BOOL v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009EE870;
  v6[3] = &unk_1011DF070;
  v7 = self;
  v8 = a3;
  v9 = a4;
  v5 = v8;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](v7, "_runAsyncBlockOnLocalQueue:", v6);

}

- (void)_captureInitialEVRouteState
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
  v4 = objc_msgSend(v3, "isEVRoute");

  if (v4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypoints"));
    v6 = sub_10039E080(v5, &stru_1011DF090);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    self->_originalTripIncludedChargingStation = objc_msgSend(v7, "count") != 0;

  }
}

- (void)_captureSessionlessEVRouteMessageIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
  v4 = objc_msgSend(v3, "isEVRoute");

  if (v4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "batteryDied")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_outOfRangeDodgeballDisplayed));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_originalTripIncludedChargingStation));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_addedChargingStationThroughSAR));
    +[GEOAPPortal captureEvTripWithOutOfCharge:outOfRangeAlertDisplayed:originalTripIncludedChargingStation:chargingStopAddedThroughSar:tripIncludedPreferredChargingStation:stopRemovedDetails:realtimeDodgeballs:chargeLocationDetails:stopAddedDetails:](GEOAPPortal, "captureEvTripWithOutOfCharge:outOfRangeAlertDisplayed:originalTripIncludedChargingStation:chargingStopAddedThroughSar:tripIncludedPreferredChargingStation:stopRemovedDetails:realtimeDodgeballs:chargeLocationDetails:stopAddedDetails:", v5, v6, v7, v8, 0, self->_removedStopsDetails, 0, self->_chargingSteps, self->_addedStopsDetails);

  }
}

- (void)_initializeEVRecording
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DF0B0);
}

- (void)_updateFeedbackCollectorWithEVData
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSNumber *initialStateOfCharge;
  void *v14;
  NSNumber *expectedFinalStateOfCharge;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
  v4 = objc_msgSend(v3, "isEVRoute");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle currentVehicleState](self->_currentVehicle, "currentVehicleState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chargingArguments"));
    v7 = objc_msgSend(v6, "copy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v8, "setEvChargingModel:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle currentVehicleState](self->_currentVehicle, "currentVehicleState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "consumptionArguments"));
    v11 = objc_msgSend(v10, "copy");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v12, "setEvConsumptionModel:", v11);

    initialStateOfCharge = self->_initialStateOfCharge;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v14, "setStateOfChargeAtOrigin:", initialStateOfCharge);

    expectedFinalStateOfCharge = self->_expectedFinalStateOfCharge;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v16, "setStateOfChargeAtDestPredicted:", expectedFinalStateOfCharge);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector _stateOfChargeOfCurrentVehicle](self, "_stateOfChargeOfCurrentVehicle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v18, "setStateOfChargeAtDestActual:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "legs"));
    v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v20, "count")));

    v21 = objc_alloc_init((Class)GEOWaypointInfo);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "origin"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "latLng"));
    objc_msgSend(v21, "setPosition:", v24);

    objc_msgSend(v31, "addObject:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "legs"));
    v27 = sub_10039DCD4(v26, &stru_1011DF0F0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    objc_msgSend(v31, "addObjectsFromArray:", v28);
    v29 = objc_msgSend(v31, "copy");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v30, "setWaypoints:", v29);

  }
}

- (void)_saveChargingStationInfo
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DF110);
}

- (void)_captureArrivalAtWaypoint:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009EF1F8;
  v5[3] = &unk_1011DEF00;
  v6 = a3;
  v4 = v6;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v5);

}

- (void)_didSelectAlternate:(unint64_t)a3 forPrimaryString:(BOOL)a4 inSign:(id)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;

  v5 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_guidance, "objectForKeyedSubscript:", a5));
  if (v7)
  {
    v8 = v7;
    if (v5)
      objc_msgSend(v7, "setSelectedPrimaryStringIndex:", a3);
    else
      objc_msgSend(v7, "setSelectedSecondaryStringIndex:", a3);
    v7 = v8;
  }

}

- (void)_runAsyncBlockOnLocalQueue:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009EF5E0;
  v8[3] = &unk_1011DE920;
  objc_copyWeak(v10, &location);
  v9 = v5;
  v10[1] = (id)a2;
  v7 = v5;
  dispatch_async(queue, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_runAsyncBlockOnLocalQueueIfNotSuppressed:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NavigationFeedbackCollector _isSuppressed](self, "_isSuppressed"))
    -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v4);

}

- (void)_runAsyncBlockOnMainQueue:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009EF7E0;
  v7[3] = &unk_1011DE920;
  objc_copyWeak(v9, &location);
  v8 = v5;
  v9[1] = (id)a2;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldSendFeedback
{
  if (-[NavigationFeedbackCollector isPlayingTrace](self, "isPlayingTrace"))
    return GEOConfigGetBOOL(NavigationConfig_TracePlaybackShouldSendAnalytics[0], NavigationConfig_TracePlaybackShouldSendAnalytics[1]);
  else
    return 1;
}

- (BOOL)_isSuppressed
{
  void *v2;
  id v3;
  uint64_t v4;
  char v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector navigationService](self, "navigationService"));
  v3 = objc_msgSend(v2, "state");
  v5 = MNNavigationServiceStateIsNavigating(v3, v4) ^ 1;

  return v5;
}

- (void)addAlightNotificationFeedback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
  objc_msgSend(v5, "addAlightNotificationFeedback:", v4);

}

- (int)_navigationModeTypeForState:(unint64_t)a3
{
  if (a3 == 4)
    return 2;
  else
    return a3 == 5;
}

- (void)_openNewStepFeedbackWithRoute:(id)a3 step:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  GEOStepFeedback *stepFeedback;
  id v17;

  v17 = a3;
  v6 = a4;
  if (self->_stepFeedback)
    -[NavigationFeedbackCollector _completeCurrentStepFeedback:](self, "_completeCurrentStepFeedback:", 0);
  v7 = objc_alloc_init((Class)GEOStepFeedback);
  if (objc_msgSend(v17, "isNewProtocolRoute"))
  {
    v8 = objc_msgSend(v17, "legIndexForStepIndex:", objc_msgSend(v6, "stepIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "legs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v8));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverLegIDForAnalytics"));
    objc_msgSend(v7, "setRouteID:", v11);

    objc_msgSend(v7, "setWaypointRouteID:", objc_msgSend(v17, "serverIdentifier"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serverRouteID"));
    objc_msgSend(v7, "setRouteID:", v10);
  }

  objc_msgSend(v7, "setRouteIndex:", objc_msgSend(v17, "indexInResponse"));
  objc_msgSend(v7, "setStepID:", objc_msgSend(v6, "stepID"));
  objc_msgSend(v7, "setCompletedStep:", 0);
  objc_msgSend(v7, "setStepEndPathPointIndex:", objc_msgSend(v6, "endRouteCoordinate"));
  objc_msgSend(v7, "setStepEndPathPointOffset:", COERCE_FLOAT((unint64_t)objc_msgSend(v6, "endRouteCoordinate") >> 32));
  objc_msgSend(v7, "setManeuverType:", objc_msgSend(v6, "maneuverType"));
  objc_msgSend(v7, "setExpectedTime:", objc_msgSend(v6, "duration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "etauResponseID"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "etauResponseID"));
    objc_msgSend(v7, "setEtaTrafficUpdateResponseId:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "evInfo"));
  if (v14)
  {
    v15 = objc_alloc_init((Class)GEOEVStepFeedbackInfo);
    objc_msgSend(v15, "setRemainingBatteryPercentage:", objc_msgSend(v14, "remainingBatteryPercentage"));
    objc_msgSend(v15, "setRemainingBatteryCharge:", objc_msgSend(v14, "remainingBatteryCharge"));
    objc_msgSend(v7, "setEvStepInfo:", v15);

  }
  stepFeedback = self->_stepFeedback;
  self->_stepFeedback = (GEOStepFeedback *)v7;

}

- (void)_completeCurrentStepFeedback:(BOOL)a3
{
  GEOStepFeedback *stepFeedback;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  uint64_t Log;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  _DWORD v22[2];
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  unsigned int v28;

  stepFeedback = self->_stepFeedback;
  if (stepFeedback)
  {
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStepFeedback evStepInfo](stepFeedback, "evStepInfo"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle currentVehicleState](self->_currentVehicle, "currentVehicleState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentBatteryCapacity"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitEnergy kilowattHours](NSUnitEnergy, "kilowattHours"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "measurementByConvertingToUnit:", v9));
      objc_msgSend(v10, "doubleValue");
      v12 = (v11 * 1000.0);

      v13 = v12;
      if (objc_msgSend(v6, "remainingBatteryCharge") >= v12)
        v13 = objc_msgSend(v6, "remainingBatteryCharge");
      if (objc_msgSend(v6, "remainingBatteryCharge") <= v12)
        v12 = objc_msgSend(v6, "remainingBatteryCharge");
      v14 = v13 - v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStepFeedback evStepInfo](self->_stepFeedback, "evStepInfo"));
      objc_msgSend(v15, "setStateOfChargeDiff:", v14);

    }
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavigationFeedbackCollector");
    v17 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = -[GEOStepFeedback stepID](self->_stepFeedback, "stepID");
      v19 = -[GEOStepFeedback completedStep](self->_stepFeedback, "completedStep");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStepFeedback routeID](self->_stepFeedback, "routeID"));
      v21 = -[GEOStepFeedback waypointRouteID](self->_stepFeedback, "waypointRouteID");
      v22[0] = 67109890;
      v22[1] = v18;
      v23 = 1024;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 1024;
      v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Adding step feedback. ID: %u, completed: %d, route: %@, waypointRouteID: %u", (uint8_t *)v22, 0x1Eu);

    }
    -[GEOStepFeedback setCompletionTimeStamp:](self->_stepFeedback, "setCompletionTimeStamp:", CFAbsoluteTimeGetCurrent());
    -[GEOStepFeedback setCompletedStep:](self->_stepFeedback, "setCompletedStep:", v5);
    -[NavigationFeedbackCollector _flushStepFeedback](self, "_flushStepFeedback");

  }
}

- (void)_flushStepFeedback
{
  void *v3;
  GEOStepFeedback *stepFeedback;

  if (self->_stepFeedback)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v3, "addStepFeedback:", self->_stepFeedback);

    stepFeedback = self->_stepFeedback;
    self->_stepFeedback = 0;

  }
}

- (void)_flushModalitiesFeedback
{
  void *v3;
  NSMutableArray *modalitiesFeedback;

  if (self->_modalitiesFeedback)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v3, "setModalities:", self->_modalitiesFeedback);

    modalitiesFeedback = self->_modalitiesFeedback;
    self->_modalitiesFeedback = 0;

  }
}

- (void)updateAudioPreferences
{
  AudioPreferences *v3;
  void *v4;
  AudioPreferences *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t Log;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id BOOL;
  id v20;
  __int16 v21[8];

  v3 = [AudioPreferences alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = -[AudioPreferences initWithDefaults:](v3, "initWithDefaults:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector navigationService](self, "navigationService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
  v8 = -[AudioPreferences guidanceLevelForTransportType:](v5, "guidanceLevelForTransportType:", objc_msgSend(v7, "transportType"));

  v9 = 1;
  switch(v8)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavigationFeedbackCollector");
      v11 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v21[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Invalid guidance level \"NoOverride\" in NavigationFeedbackCollector.", (uint8_t *)v21, 2u);
      }

      goto LABEL_5;
    case 0uLL:
      break;
    case 1uLL:
      v9 = 2;
      break;
    case 2uLL:
      v9 = 3;
      break;
    default:
LABEL_5:
      v9 = 0;
      break;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
  objc_msgSend(v12, "setVoiceGuidanceLevel:", v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
  if (qword_1014D3C50 != -1)
    dispatch_once(&qword_1014D3C50, &stru_1011DF370);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3C48, "path"));
  v15 = (void *)_CFPreferencesCopyAppValueWithContainer(CFSTR("NavVolumeSettingUseHFP"), CFSTR("com.apple.Maps"), v14);

  v16 = NavigationConfig_SpokenGuidanceUseHFP[1];
  if (v15)
  {
    if ((_GEOConfigHasValue(NavigationConfig_SpokenGuidanceUseHFP[0], v16) & 1) == 0)
    {
      v17 = objc_msgSend(v15, "BOOLValue");
      GEOConfigSetBOOL(NavigationConfig_SpokenGuidanceUseHFP[0], NavigationConfig_SpokenGuidanceUseHFP[1], v17);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
    _CFPreferencesSetValueWithContainer(CFSTR("NavVolumeSettingUseHFP"), 0, CFSTR("com.apple.Maps"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost, objc_msgSend(v18, "homeDirectory"));

    BOOL = objc_msgSend(v15, "BOOLValue");
  }
  else
  {
    BOOL = (id)GEOConfigGetBOOL(NavigationConfig_SpokenGuidanceUseHFP[0], v16);
  }
  v20 = BOOL;

  objc_msgSend(v13, "setIsHandsFreeProfileUsed:", v20);
}

- (void)_didStartManeuver
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector navigationService](self, "navigationService"));
  -[GEOStepFeedback setLightGuidance:](self->_stepFeedback, "setLightGuidance:", objc_msgSend(v3, "state") == (id)5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_guidance, "allValues", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "stepID");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector prevStep](self, "prevStep"));
        v12 = objc_msgSend(v11, "stepID");

        if (v10 == (id)v12)
        {
          objc_msgSend(v9, "maneuverTime");
          if (v13 == 0.0)
            objc_msgSend(v9, "setManeuverTime:", CFAbsoluteTimeGetCurrent());
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)_addGuidance
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _UNKNOWN **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  NavigationFeedbackCollector *v45;
  uint64_t v46;
  _UNKNOWN **v47;
  id v48;
  void *v49;
  NSMutableSet *junctionViewEventsDisplayed;
  id v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_guidance, "allValues"));
  v5 = objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(v5, "sortUsingComparator:", &stru_1011DF1B8);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v6 = v5;
  v54 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v54)
  {
    v7 = CPLaneGuidance_ptr;
    v8 = *(_QWORD *)v56;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v9);
        v11 = objc_alloc_init((Class)v7[126]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeID"));
        objc_msgSend(v11, "setRouteID:", v12);

        if (objc_msgSend(v10, "stepID") != (id)0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v11, "setStepID:", objc_msgSend(v10, "stepID"));
        if (objc_msgSend(v10, "enrouteNoticeIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v11, "setEnrouteNoticeIndex:", objc_msgSend(v10, "enrouteNoticeIndex"));
        if (objc_msgSend(v10, "eventIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v11, "setEventIndex:", objc_msgSend(v10, "eventIndex"));
        objc_msgSend(v10, "startTime");
        if (v13 > 0.0)
        {
          objc_msgSend(v10, "endTime");
          if (v14 > 0.0)
          {
            objc_msgSend(v10, "endTime");
            v16 = v15;
            objc_msgSend(v10, "startTime");
            v18 = v16 - v17;
            *(float *)&v18 = v18;
            objc_msgSend(v11, "setDuration:", v18);
          }
        }
        objc_msgSend(v10, "startTime");
        if (v19 > 0.0)
        {
          objc_msgSend(v10, "maneuverTime");
          if (v20 > 0.0)
          {
            objc_msgSend(v10, "maneuverTime");
            v22 = v21;
            objc_msgSend(v10, "startTime");
            v24 = v22 - v23;
            *(float *)&v24 = v24;
            objc_msgSend(v11, "setTimeToManeuver:", v24);
          }
        }
        objc_msgSend(v10, "vehicleSpeed");
        if (v25 != 0.0)
        {
          objc_msgSend(v10, "vehicleSpeed");
          *(float *)&v26 = v26;
          objc_msgSend(v11, "setVehicleSpeed:", v26);
        }
        objc_msgSend(v11, "setTrafficSpeed:", objc_msgSend(v10, "trafficColor"));
        objc_msgSend(v10, "startDistance");
        if (v27 > 0.0)
        {
          objc_msgSend(v10, "startDistance");
          *(float *)&v28 = v28;
          objc_msgSend(v11, "setDistanceToManeuver:", v28);
        }
        v29 = objc_msgSend(v10, "type");
        if (v29 == (id)4)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "junctionViewImageIDs"));
          v41 = objc_msgSend(v40, "count");

          if (!v41)
            goto LABEL_41;
          v42 = objc_alloc_init((Class)GEOJunctionViewGuidanceFeedback);
          objc_msgSend(v11, "setJunctionViewGuidanceFeedback:", v42);

          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "junctionViewImageIDs"));
          v44 = objc_msgSend(v43, "mutableCopy");
          v45 = self;
          v46 = v8;
          v47 = v7;
          v48 = v6;
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "junctionViewGuidanceFeedback"));
          objc_msgSend(v49, "setImageIDs:", v44);

          v6 = v48;
          v7 = v47;
          v8 = v46;
          self = v45;

          junctionViewEventsDisplayed = v45->_junctionViewEventsDisplayed;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueID"));
          v51 = -[NSMutableSet containsObject:](junctionViewEventsDisplayed, "containsObject:", v35);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "junctionViewGuidanceFeedback"));
          objc_msgSend(v52, "setImageDisplayed:", v51);

          goto LABEL_40;
        }
        if (v29 == (id)2)
        {
          if (objc_msgSend(v10, "selectedPrimaryStringIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v36 = objc_alloc_init((Class)GEOSpokenGuidanceFeedback);
            objc_msgSend(v11, "setSpokenGuidanceFeedback:", v36);

            v37 = objc_msgSend(v10, "selectedPrimaryStringIndex");
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spokenGuidanceFeedback"));
            objc_msgSend(v38, "setSpokenGuidanceIndex:", v37);

            if (objc_msgSend(v10, "trafficCameraType"))
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector _trafficCameraFeedbackForEventFeedback:](self, "_trafficCameraFeedbackForEventFeedback:", v10));
              if (v35)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "spokenGuidanceFeedback"));
                objc_msgSend(v39, "setTrafficCameraGuidanceFeedback:", v35);

              }
              goto LABEL_40;
            }
          }
        }
        else if (v29 == (id)1
               && (objc_msgSend(v10, "selectedPrimaryStringIndex") != (id)0x7FFFFFFFFFFFFFFFLL
                || objc_msgSend(v10, "selectedSecondaryStringIndex") != (id)0x7FFFFFFFFFFFFFFFLL))
        {
          v30 = objc_alloc_init((Class)GEOSignGuidanceFeedback);
          objc_msgSend(v11, "setSignGuidanceFeedback:", v30);

          if (objc_msgSend(v10, "selectedPrimaryStringIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v31 = objc_msgSend(v10, "selectedPrimaryStringIndex");
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "signGuidanceFeedback"));
            objc_msgSend(v32, "setSignTitleIndex:", v31);

          }
          if (objc_msgSend(v10, "selectedSecondaryStringIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v33 = objc_msgSend(v10, "selectedSecondaryStringIndex");
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "signGuidanceFeedback"));
            objc_msgSend(v34, "setSignDetailIndex:", v33);

          }
          if (objc_msgSend(v10, "trafficCameraType"))
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector _trafficCameraFeedbackForEventFeedback:](self, "_trafficCameraFeedbackForEventFeedback:", v10));
            if (v35)
              objc_msgSend(v11, "setTrafficCameraGuidanceFeedback:", v35);
LABEL_40:

          }
        }
LABEL_41:
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
        objc_msgSend(v53, "addGuidanceEventFeedback:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v54 != v9);
      v54 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v54);
  }

  -[NSMutableDictionary removeAllObjects](self->_guidance, "removeAllObjects");
}

- (void)_addArrival
{
  unint64_t arrivedCount;
  void *v4;
  unint64_t parkingCount;
  void *v6;
  _BOOL8 v7;
  id v8;

  arrivedCount = self->_arrivedCount;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
  objc_msgSend(v4, "setArrivedAtDestinationCount:", arrivedCount);

  parkingCount = self->_parkingCount;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
  objc_msgSend(v6, "setInParkingModeCount:", parkingCount);

  v7 = self->_parkingCount != 0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
  objc_msgSend(v8, "setEnteredParkingMode:", v7);

}

- (id)_trafficCameraFeedbackForEventFeedback:(id)a3
{
  id v3;
  unsigned int v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "trafficCameraType"))
  {
    v4 = objc_msgSend(v3, "trafficCameraType");
    if (v4 == 2)
      v5 = 1;
    else
      v5 = 2 * (v4 == 1);
    v6 = objc_alloc_init((Class)GEOTrafficCameraInformation);
    objc_msgSend(v6, "setCameraType:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enrouteNoticeIdentifier"));
    objc_msgSend(v6, "setCameraIdentifier:", v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (void)_handleNavigationErrors
{
  void *v3;
  unsigned int v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    if (-[NSMutableArray count](self->_routingServiceErrors, "count"))
    {
      v5 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1009F0A74;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_initializeDirectionsFeedbackWithNavigationState:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009F10D0;
  v3[3] = &unk_1011DF1F8;
  v3[4] = a3;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v3);
}

- (void)_finalizeDirectionsFeedback
{
  -[NavigationFeedbackCollector _finalizeDirectionsFeedbackWithReason:](self, "_finalizeDirectionsFeedbackWithReason:", 0);
}

- (void)_finalizeDirectionsFeedbackWithReason:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009F1448;
  v3[3] = &unk_1011DF1F8;
  v3[4] = a3;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v3);
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  NavigationFeedbackCollector *v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009F1868;
  v6[3] = &unk_1011DEF28;
  v7 = a4;
  v8 = self;
  v5 = v7;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v6);

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *routingServiceErrors;
  void *v30;
  unsigned int v31;
  id v32;

  v32 = a3;
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "platformController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "auxiliaryTasksManager"));
    v12 = objc_msgSend(v11, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "analyticsTracker"));
    objc_msgSend(v14, "setIsVLFImprovementUsed:", objc_msgSend(v15, "hasVLFLocalizedRecently"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueRouteID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
    v20 = objc_msgSend(v16, "hasUserEnteredARForRoute:entryPoint:", v19, 0);

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
      objc_msgSend(v21, "setARWalkingUsedInRoutePlanning:", 1);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v23 = objc_msgSend(v22, "isAuthorizedForPreciseLocation") ^ 1;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v24, "setIsCoarseLocationUsed:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "route"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "origin"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bestLatLng"));
    objc_msgSend(v25, "setTripOrigin:", v28);

    -[NavigationFeedbackCollector _initializeEVRecording](self, "_initializeEVRecording");
    -[NavigationFeedbackCollector updateAudioPreferences](self, "updateAudioPreferences");
    routingServiceErrors = self->_routingServiceErrors;
    self->_routingServiceErrors = 0;

  }
  else if (MNNavigationServiceStateChangedFromNavigatingToStopped(a4, a5))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    v31 = objc_msgSend(v30, "hasActiveFeedbackSession");

    if (v31)
      -[NavigationFeedbackCollector _finalizeDirectionsFeedbackWithReason:](self, "_finalizeDirectionsFeedbackWithReason:", 1);
    -[NavigationFeedbackCollector _handleNavigationErrors](self, "_handleNavigationErrors");
  }

}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  _QWORD v9[5];

  if (MNNavigationServiceStateIsNavigating(a5, a2))
  {
    if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
    {
      -[NavigationFeedbackCollector _initializeDirectionsFeedbackWithNavigationState:](self, "_initializeDirectionsFeedbackWithNavigationState:", a5);
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1009F1F5C;
      v9[3] = &unk_1011DF1F8;
      v9[4] = a5;
      -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v9);
    }
  }
  else if (MNNavigationServiceStateChangedFromNavigatingToStopped(a4, a5))
  {
    -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DF218);
  }
}

- (void)navigationService:(id)a3 didReceiveRoutingServiceError:(id)a4
{
  NSMutableArray *v5;
  NSMutableArray *routingServiceErrors;
  _NavigationFeedbackCollectorError *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (!self->_routingServiceErrors)
  {
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    routingServiceErrors = self->_routingServiceErrors;
    self->_routingServiceErrors = v5;

  }
  v7 = objc_opt_new(_NavigationFeedbackCollectorError);
  -[_NavigationFeedbackCollectorError setError:](v7, "setError:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[_NavigationFeedbackCollectorError setDate:](v7, "setDate:", v8);

  -[NSMutableArray addObject:](self->_routingServiceErrors, "addObject:", v7);
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  unint64_t v14;

  v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009F2178;
  v11[3] = &unk_1011DF240;
  v13 = a4;
  v14 = a5;
  v12 = v8;
  v9 = v13;
  v10 = v8;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v11);

}

- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", &stru_1011DF260, a4, a5);
}

- (void)navigationService:(id)a3 didEndWithReason:(unint64_t)a4
{
  if (a4 == 3)
    -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", &stru_1011DF280);
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009F237C;
  v9[3] = &unk_1011DF070;
  v10 = a3;
  v11 = a4;
  v12 = !+[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyApplicationOrCarPlayApplicationSceneForeground");
  v7 = v11;
  v8 = v10;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v9);

}

- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009F2784;
  v7[3] = &unk_1011DEF00;
  v8 = a4;
  v6 = v8;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v7);

}

- (void)navigationService:(id)a3 didUpdateETAResponse:(id)a4 forRoute:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v7 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009F2838;
  v10[3] = &unk_1011DEF28;
  v11 = a5;
  v12 = v7;
  v8 = v7;
  v9 = v11;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v10);

}

- (void)navigationService:(id)a3 didUpdateDistanceUntilManeuver:(double)a4 timeUntilManeuver:(double)a5 forStepIndex:(unint64_t)a6
{
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009F2924;
  v9[3] = &unk_1011DF2A8;
  v10 = a3;
  v11 = a4;
  v8 = v10;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v9);

}

- (void)navigationService:(id)a3 newGuidanceEventFeedback:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009F2A28;
  v6[3] = &unk_1011DEF00;
  v7 = a4;
  v5 = v7;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v6);

}

- (void)navigationService:(id)a3 updatedGuidanceEventFeedback:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009F2B08;
  v6[3] = &unk_1011DEF00;
  v7 = a4;
  v5 = v7;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v6);

}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  uint64_t Log;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  __CFString *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v6 = *(id *)&a4;
  v8 = a3;
  if (!-[NavigationFeedbackCollector _isSuppressed](self, "_isSuppressed"))
  {
    if ((_DWORD)v6 == 4)
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "-[NavigationFeedbackCollector navigationService:didSwitchToNewTransportType:newRoute:traffic:]";
        v23 = 2080;
        v24 = "NavigationFeedbackCollector.m";
        v25 = 1024;
        v26 = 1315;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavigationFeedbackCollector");
      v15 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "While navigating there wasn't a transport type.", buf, 2u);
      }

      v6 = objc_msgSend(v8, "desiredTransportType");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector currentRoute](self, "currentRoute"));
    v17 = objc_msgSend(v16, "transportType");

    if ((_DWORD)v6 == v17)
    {
      v18 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavigationFeedbackCollector");
      v19 = (id)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if (v6 >= 7)
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6));
        else
          v20 = off_1011DF390[(int)v6];
        *(_DWORD *)buf = 138412290;
        v22 = (const char *)v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Got a transport type change callback (%@) but we are already on that transport type. Doing nothing.", buf, 0xCu);

      }
    }
    else
    {
      -[NavigationFeedbackCollector _finalizeDirectionsFeedback](self, "_finalizeDirectionsFeedback");
      -[NavigationFeedbackCollector _initializeDirectionsFeedbackWithNavigationState:](self, "_initializeDirectionsFeedbackWithNavigationState:", objc_msgSend(v8, "state"));
      -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", &stru_1011DF2C8);
    }
  }

}

- (void)navigationService:(id)a3 didUpdateMotionType:(unint64_t)a4 confidence:(unint64_t)a5
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009F2F18;
  v5[3] = &unk_1011DF2E8;
  v5[4] = a4;
  v5[5] = a5;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v5);
}

- (void)navigationService:(id)a3 didStartRecordingTraceWithPath:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009F3128;
  v6[3] = &unk_1011DEF00;
  v7 = a4;
  v5 = v7;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v6);

}

- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", &stru_1011DF308, a4);
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", &stru_1011DF328, a4, a5, a6);
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  -[NavigationFeedbackCollector setPreviousAlert:](self, "setPreviousAlert:", v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009F31F0;
  v8[3] = &unk_1011DEF00;
  v9 = v6;
  v7 = v6;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueueIfNotSuppressed:](self, "_runAsyncBlockOnLocalQueueIfNotSuppressed:", v8);

}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  -[NavigationFeedbackCollector setPreviousAlert:](self, "setPreviousAlert:", a4);
}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = (char *)objc_msgSend(a4, "arrivalState");
  if ((unint64_t)(v6 - 5) < 2)
  {
    ++self->_parkingCount;
  }
  else if (v6 == (char *)4)
  {
    ++self->_arrivedCount;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector lastLocation](self, "lastLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v14, "setArrivalLocation:", v13);

  }
  else
  {
    v7 = v6 == (char *)1;
    v8 = v17;
    if (!v7)
      goto LABEL_12;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "alternateWalkingRouteDisplayETAInfo"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "alternateWalkingRouteDisplayETAInfo"));
      v11 = (double)(unint64_t)objc_msgSend(v10, "remainingMinutesToEndOfRoute");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
      objc_msgSend(v12, "setTimeBetweenParkedAndArrival:", v11);

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
      objc_msgSend(v10, "setTimeBetweenParkedAndArrival:", -1.0);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector lastLocation](self, "lastLocation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationFeedbackCollector feedbackCollector](self, "feedbackCollector"));
    objc_msgSend(v16, "setParkingDetectionLocation:", v15);

    ++self->_parkedCount;
  }
  v8 = v17;
LABEL_12:

}

- (void)navSignView:(id)a3 didSelectAlternate:(unint64_t)a4 forPrimaryString:(BOOL)a5 inSign:(id)a6
{
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  BOOL v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009F3474;
  v9[3] = &unk_1011DF350;
  v12 = a5;
  v10 = a6;
  v11 = a4;
  v8 = v10;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v9);

}

- (void)carManeuverView:(id)a3 didSelectAlternate:(unint64_t)a4 forPrimaryString:(BOOL)a5 inSign:(id)a6
{
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  BOOL v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009F3510;
  v9[3] = &unk_1011DF350;
  v12 = a5;
  v10 = a6;
  v11 = a4;
  v8 = v10;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v9);

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009F3598;
  v5[3] = &unk_1011DEF00;
  v6 = a3;
  v4 = v6;
  -[NavigationFeedbackCollector _runAsyncBlockOnLocalQueue:](self, "_runAsyncBlockOnLocalQueue:", v5);

}

- (NavigationAudioFeedbackCollector)audioFeedbackCollector
{
  return self->_audioFeedbackCollector;
}

- (void)setAudioFeedbackCollector:(id)a3
{
  objc_storeStrong((id *)&self->_audioFeedbackCollector, a3);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (GEODirectionsFeedbackCollector)feedbackCollector
{
  return self->_feedbackCollector;
}

- (void)setFeedbackCollector:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackCollector, a3);
}

- (GEOComposedRouteStep)prevStep
{
  return self->_prevStep;
}

- (void)setPrevStep:(id)a3
{
  objc_storeStrong((id *)&self->_prevStep, a3);
}

- (BOOL)isPlayingTrace
{
  return self->_isPlayingTrace;
}

- (void)setIsPlayingTrace:(BOOL)a3
{
  self->_isPlayingTrace = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)didArrive
{
  return self->_didArrive;
}

- (void)setDidArrive:(BOOL)a3
{
  self->_didArrive = a3;
}

- (GEOLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (MNTrafficIncidentAlert)previousAlert
{
  return self->_previousAlert;
}

- (void)setPreviousAlert:(id)a3
{
  objc_storeStrong((id *)&self->_previousAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAlert, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_prevStep, 0);
  objc_storeStrong((id *)&self->_feedbackCollector, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_audioFeedbackCollector, 0);
  objc_storeStrong((id *)&self->_routingServiceErrors, 0);
  objc_storeStrong((id *)&self->_currentVehicle, 0);
  objc_storeStrong((id *)&self->_badTripCollector, 0);
  objc_storeStrong((id *)&self->_expectedFinalStateOfCharge, 0);
  objc_storeStrong((id *)&self->_initialStateOfCharge, 0);
  objc_storeStrong((id *)&self->_removedStopsDetails, 0);
  objc_storeStrong((id *)&self->_addedStopsDetails, 0);
  objc_storeStrong((id *)&self->_chargingSteps, 0);
  objc_storeStrong((id *)&self->_navigationStartTime, 0);
  objc_storeStrong((id *)&self->_modalitiesFeedback, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_etaTrafficUpdateResponse, 0);
  objc_storeStrong((id *)&self->_stepFeedback, 0);
  objc_storeStrong((id *)&self->_junctionViewEventsDisplayed, 0);
  objc_storeStrong((id *)&self->_guidance, 0);
  objc_storeStrong((id *)&self->_traceFileName, 0);
  objc_storeStrong((id *)&self->_responseID, 0);
}

@end

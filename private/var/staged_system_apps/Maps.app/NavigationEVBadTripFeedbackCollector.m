@implementation NavigationEVBadTripFeedbackCollector

- (NavigationEVBadTripFeedbackCollector)initWithNavigationService:(id)a3 virtualGarageService:(id)a4
{
  id v7;
  id v8;
  NavigationEVBadTripFeedbackCollector *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NavigationEVBadTripFeedbackCollector;
  v9 = -[NavigationEVBadTripFeedbackCollector init](&v16, "init");
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("NavigationFeedbackEVBadTripCollector", v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_navigationService, a3);
    -[MNNavigationService registerObserver:](v9->_navigationService, "registerObserver:", v9);
    objc_storeStrong((id *)&v9->_virtualGarageService, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, "_virtualGarageDidBecomeAvailable", off_1014B63B0, 0);

  }
  return v9;
}

- (void)_virtualGarageDidBecomeAvailable
{
  uint64_t IsEnabled_EVRouting;
  id v4;
  NSObject *v5;
  VGVirtualGarageService *virtualGarageService;
  _QWORD v7[4];
  id v8;
  id buf[2];

  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(self, a2);
  if ((IsEnabled_EVRouting & 1) != 0 || MapsFeature_IsEnabled_Alberta(IsEnabled_EVRouting))
  {
    v4 = sub_10051E51C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "virtualGarageDidBecomeAvailable fetching garage", (uint8_t *)buf, 2u);
    }

    -[VGVirtualGarageService registerObserver:](self->_virtualGarageService, "registerObserver:", self);
    objc_initWeak(buf, self);
    virtualGarageService = self->_virtualGarageService;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10051E55C;
    v7[3] = &unk_1011AD100;
    objc_copyWeak(&v8, buf);
    -[VGVirtualGarageService virtualGarageGetGarageWithReply:](virtualGarageService, "virtualGarageGetGarageWithReply:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)startRecording
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10051E734;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopRecording
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10051E8A8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isBadTrip
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10051E9B0;
  v5[3] = &unk_1011AD318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_checkForBadTrip
{
  NavigationEVBadTripFeedbackCollector *v2;
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  NSObject *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  BOOL v43;
  id v44;
  NSObject *v45;
  __CFString *v46;
  __CFString *v47;
  id v48;
  NSMutableArray *v49;
  NSMutableArray *v50;
  void *v51;
  __CFString *v52;
  NavigationEVBadTripFeedbackCollector *v54;
  uint64_t v55;
  NSMutableArray *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  double v62;
  __int16 v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];

  v2 = self;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v3 = self->_routeInfos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
  if (!v4)
  {

    goto LABEL_23;
  }
  v5 = v4;
  v54 = v2;
  v6 = *(_QWORD *)v58;
  v7 = 0.0;
  v8 = 0.0;
  v55 = *(_QWORD *)v58;
  v56 = v3;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v58 != v6)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "initialBatteryCharge"));
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "realArrivalBatteryCharge"));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "expectedArrivalBatteryCharge"));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "realArrivalBatteryCharge"));
            objc_msgSend(v16, "doubleValue");
            v18 = v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "expectedArrivalBatteryCharge"));
            objc_msgSend(v19, "doubleValue");
            v21 = v18 - v20;

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "realArrivalBatteryCharge"));
            objc_msgSend(v22, "doubleValue");
            v24 = v23;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "initialBatteryCharge"));
            objc_msgSend(v25, "doubleValue");
            v27 = vabdd_f64(v24, v26);

            v8 = v8 + v21;
            v7 = v7 + v27;
            v28 = sub_10051E51C();
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              goto LABEL_15;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
            v31 = COERCE_DOUBLE(objc_msgSend(v30, "serverIdentifier"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastTraversedStep"));
            v33 = COERCE_DOUBLE(objc_msgSend(v32, "stepIndex"));
            v34 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "initialBatteryCharge")));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "realArrivalBatteryCharge"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "expectedArrivalBatteryCharge"));
            *(_DWORD *)buf = 134219522;
            v62 = v31;
            v63 = 2048;
            v64 = v33;
            v65 = 2048;
            v66 = v21;
            v67 = 2048;
            v68 = v27;
            v69 = 2112;
            v70 = v34;
            v71 = 2112;
            v72 = v35;
            v73 = 2112;
            v74 = v36;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Added new segment (%lu lastTraveledStep: %lu) with delta: %.4f, consumption: %.2f, initial: %@, real: %@, expected: %@", buf, 0x48u);

            v6 = v55;
            goto LABEL_14;
          }
        }
        else
        {

        }
      }
      v37 = sub_10051E51C();
      v29 = objc_claimAutoreleasedReturnValue(v37);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
      v38 = COERCE_DOUBLE(objc_msgSend(v30, "serverIdentifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastTraversedStep"));
      v39 = COERCE_DOUBLE(objc_msgSend(v32, "stepIndex"));
      v34 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "initialBatteryCharge")));
      v40 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "realArrivalBatteryCharge")));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "expectedArrivalBatteryCharge"));
      *(_DWORD *)buf = 134219010;
      v62 = v38;
      v63 = 2048;
      v64 = v39;
      v6 = v55;
      v65 = 2112;
      v66 = v34;
      v67 = 2112;
      v68 = v40;
      v69 = 2112;
      v70 = *(double *)&v41;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Will not be able to calculate delta for route: %lu, lastTraveledStep: %lu, initial: %@, real: %@, expected: %@", buf, 0x34u);

LABEL_14:
      v3 = v56;

LABEL_15:
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
  }
  while (v5);

  v2 = v54;
  if (v7 >= 2.22044605e-16)
  {
    v42 = fabs(v8 / v7);
    v43 = v42 > 0.05;
    v44 = sub_10051E51C();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = CFSTR("NO");
      if (v42 > 0.05)
        v46 = CFSTR("YES");
      *(double *)&v47 = COERCE_DOUBLE(v46);
      *(_DWORD *)buf = 134218754;
      v62 = v8;
      v63 = 2048;
      v64 = v7;
      v65 = 2048;
      v66 = v8 / v7;
      v67 = 2112;
      v68 = *(double *)&v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Finished adding up segments. deltaSum: %.4f, consumptionSum: %.2f, result: %.4f, isBadTrip: %@", buf, 0x2Au);

    }
    goto LABEL_31;
  }
LABEL_23:
  v48 = sub_10051E51C();
  v45 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v49 = v2->_routeInfos;
    v50 = v49;
    if (v49)
    {
      if (-[NSMutableArray count](v49, "count"))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v50, "componentsJoinedByString:", CFSTR(", ")));
        *(double *)&v52 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v50, v51)));

      }
      else
      {
        *(double *)&v52 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v50)));
      }
    }
    else
    {
      *(double *)&v52 = COERCE_DOUBLE(CFSTR("<nil>"));
    }

    *(_DWORD *)buf = 138412290;
    v62 = *(double *)&v52;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "No consumption for routeInfos: %@", buf, 0xCu);

  }
  v43 = 0;
LABEL_31:

  return v43;
}

- (void)setCurrentVehicleState:(id)a3
{
  id v5;
  VGVehicleState **p_currentVehicleState;
  VGVehicleState *currentVehicleState;
  unint64_t v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  v5 = a3;
  currentVehicleState = self->_currentVehicleState;
  p_currentVehicleState = &self->_currentVehicleState;
  v8 = (unint64_t)v5;
  v9 = currentVehicleState;
  if (v8 | (unint64_t)v9)
  {
    v10 = v9;
    v11 = objc_msgSend((id)v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
      objc_storeStrong((id *)p_currentVehicleState, a3);
      v12 = sub_10051E51C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "currentBatteryCharge"));
        v16 = 138412546;
        v17 = v14;
        v18 = 2048;
        v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "currentVehicleState was changed to: %@, battery charge (Wh): %lu", (uint8_t *)&v16, 0x16u);

      }
    }
  }

}

- (void)setObservedRoute:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  EVBadTripRouteInfo *v7;
  void *v8;
  void *v9;
  EVBadTripRouteInfo *v10;
  uint8_t v11[16];

  v4 = a3;
  if (!self->_isRecording)
  {
    v5 = sub_10051E51C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "observedRoute called when we are not recording", v11, 2u);
    }

    v4 = 0;
  }
  objc_storeStrong((id *)&self->_observedRoute, v4);
  if (self->_observedRoute)
  {
    v7 = [EVBadTripRouteInfo alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationEVBadTripFeedbackCollector observedRoute](self, "observedRoute"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationEVBadTripFeedbackCollector currentVehicleState](self, "currentVehicleState"));
    v10 = -[EVBadTripRouteInfo initWithRoute:currentVehicleState:](v7, "initWithRoute:currentVehicleState:", v8, v9);

    -[NSMutableArray addObject:](self->_routeInfos, "addObject:", v10);
    -[NavigationEVBadTripFeedbackCollector _rebuildExpectedEVInfos](self, "_rebuildExpectedEVInfos");

  }
  else
  {
    -[NavigationEVBadTripFeedbackCollector _reset](self, "_reset");
  }

}

- (void)_rebuildExpectedEVInfos
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  unsigned int v13;
  NSDictionary *v14;
  NSDictionary *stepIDToExpectedEVInfos;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  NavigationEVBadTripFeedbackCollector *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;

  if (!self->_observedRoute)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v28 = "-[NavigationEVBadTripFeedbackCollector _rebuildExpectedEVInfos]";
      v29 = 2080;
      v30 = "NavigationEVBadTripFeedbackCollector.m";
      v31 = 1024;
      v32 = 248;
      v33 = 2080;
      v34 = "_observedRoute";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (self->_isRecording && self->_observedRoute)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_observedRoute, "steps"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "evInfo"));
          if (v10)
          {
            v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "stepID")));
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);
          }
          else
          {
            v12 = sub_10051E51C();
            v11 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              v13 = objc_msgSend(v9, "stepID");
              *(_DWORD *)buf = 134217984;
              v28 = (char *)v13;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "stepID: %lu didn't have evInfo", buf, 0xCu);
            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    v14 = (NSDictionary *)objc_msgSend(v3, "copy");
    stepIDToExpectedEVInfos = v21->_stepIDToExpectedEVInfos;
    v21->_stepIDToExpectedEVInfos = v14;

  }
}

- (void)_reset
{
  GEOComposedRoute *observedRoute;
  NSMutableArray *v4;
  NSMutableArray *routeInfos;
  NSDictionary *stepIDToExpectedEVInfos;

  observedRoute = self->_observedRoute;
  self->_observedRoute = 0;

  v4 = objc_opt_new(NSMutableArray);
  routeInfos = self->_routeInfos;
  self->_routeInfos = v4;

  stepIDToExpectedEVInfos = self->_stepIDToExpectedEVInfos;
  self->_stepIDToExpectedEVInfos = 0;

}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10051F6EC;
  v9[3] = &unk_1011AC8B0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10051F7EC;
  v11[3] = &unk_1011B15D8;
  v13 = a4;
  v14 = a5;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10051FD50;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (VGVirtualGarageService)virtualGarageService
{
  return self->_virtualGarageService;
}

- (void)setVirtualGarageService:(id)a3
{
  objc_storeStrong((id *)&self->_virtualGarageService, a3);
}

- (VGVehicleState)currentVehicleState
{
  return self->_currentVehicleState;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (GEOComposedRoute)observedRoute
{
  return self->_observedRoute;
}

- (NSMutableArray)routeInfos
{
  return self->_routeInfos;
}

- (void)setRouteInfos:(id)a3
{
  objc_storeStrong((id *)&self->_routeInfos, a3);
}

- (NSDictionary)stepIDToExpectedEVInfos
{
  return self->_stepIDToExpectedEVInfos;
}

- (void)setStepIDToExpectedEVInfos:(id)a3
{
  objc_storeStrong((id *)&self->_stepIDToExpectedEVInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIDToExpectedEVInfos, 0);
  objc_storeStrong((id *)&self->_routeInfos, 0);
  objc_storeStrong((id *)&self->_observedRoute, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentVehicleState, 0);
  objc_storeStrong((id *)&self->_virtualGarageService, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end

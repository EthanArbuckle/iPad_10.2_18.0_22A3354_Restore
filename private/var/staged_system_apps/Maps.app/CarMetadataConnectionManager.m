@implementation CarMetadataConnectionManager

- (CarMetadataConnectionManager)init
{
  CarMetadataConnectionManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  CarMetadataNavigationListener *v7;
  CarMetadataNavigationListener *navigationListener;
  id v9;
  void *v10;
  void *v11;
  CPNavigationManager *v12;
  CPNavigationManager *carPlayService;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CarMetadataConnectionManager;
  v2 = -[CarMetadataConnectionManager init](&v15, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("CarMetadataConnectionManager.Queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = -[CarMetadataNavigationListener initWithDelegate:]([CarMetadataNavigationListener alloc], "initWithDelegate:", v2);
    navigationListener = v2->_navigationListener;
    v2->_navigationListener = v7;

    v9 = objc_alloc((Class)CPNavigationManager);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    v12 = (CPNavigationManager *)objc_msgSend(v9, "initWithIdentifier:delegate:", v11, v2);
    carPlayService = v2->_carPlayService;
    v2->_carPlayService = v12;

    -[CPNavigationManager setSupportsAccNav:](v2->_carPlayService, "setSupportsAccNav:", 1);
  }
  return v2;
}

- (void)requestNavigationOwnership
{
  -[CPNavigationManager requestNavigationOwnership](self->_carPlayService, "requestNavigationOwnership");
}

- (void)releaseNavigationOwnership
{
  -[CPNavigationManager releaseNavigationOwnership](self->_carPlayService, "releaseNavigationOwnership");
}

- (BOOL)externalAccessoryIsNavigating
{
  return -[CPNavigationManager owner](self->_carPlayService, "owner") == (id)2;
}

- (void)_setNeedsUpdateOfType:(unint64_t)a3
{
  NSObject *queue;
  _QWORD block[5];

  self->_pendingUpdateTypes |= a3;
  if (!self->_hasPendingUpdates)
  {
    self->_hasPendingUpdates = 1;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005D3F60;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_sendUpdates
{
  _QWORD *v3;
  int v4;
  int v5;
  int v6;
  CPRouteGuidance *pendingRouteGuidance;
  int v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  CPRouteGuidance *v25;
  CPNavigationManager *carPlayService;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSArray *pendingLaneGuidances;
  NSArray *v42;
  NSArray *v43;
  void *v44;
  __CFString *v45;
  CPRouteGuidance *v46;
  NSArray *pendingManeuvers;
  NSArray *v48;
  int v49;
  _QWORD *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  uint8_t buf[4];
  _BYTE v54[18];
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  __CFString *v58;

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1005D4560;
  v52[3] = &unk_1011BD110;
  v52[4] = self;
  v3 = objc_retainBlock(v52);
  v4 = ((uint64_t (*)(_QWORD *, uint64_t))v3[2])(v3, 1);
  v5 = ((uint64_t (*)(_QWORD *, uint64_t))v3[2])(v3, 2);
  v6 = ((uint64_t (*)(_QWORD *, uint64_t))v3[2])(v3, 4);
  pendingRouteGuidance = self->_pendingRouteGuidance;
  if (pendingRouteGuidance && !-[CPRouteGuidance guidanceState](pendingRouteGuidance, "guidanceState"))
    v8 = 1;
  else
    v8 = v5 | v6;
  v9 = sub_1005D4574();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = v11;
    if (v4)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v50 = v3;
    v14 = v6;
    v15 = v13;
    if (v5)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v49 = v4;
    v17 = v5;
    v18 = v16;
    if (v14)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v20 = v19;
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v54 = v12;
    *(_WORD *)&v54[8] = 2112;
    *(_QWORD *)&v54[10] = v15;
    v55 = 2112;
    v56 = v18;
    v57 = 2112;
    v58 = v20;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will send new updates: shouldResetRouteGuidance: %@, shouldModifyRouteGuidance: %@, shouldUpdateManeuvers: %@, shouldUpdateLaneGuidance: %@", buf, 0x2Au);

    v5 = v17;
    v4 = v49;

    v6 = v14;
    v3 = v50;

  }
  if (!v8)
  {
    if (!v4)
      goto LABEL_21;
LABEL_27:
    if (self->_pendingRouteGuidance)
    {
      v23 = sub_1005D4574();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = self->_pendingRouteGuidance;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v54 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Modifying route guidance to: %@.", buf, 0xCu);
      }

      carPlayService = self->_carPlayService;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1005D45B4;
      v51[3] = &unk_1011BD138;
      v51[4] = self;
      -[CPNavigationManager modifyRouteGuidance:](carPlayService, "modifyRouteGuidance:", v51);
      if (v5)
        goto LABEL_41;
    }
    else
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v54 = "-[CarMetadataConnectionManager _sendUpdates]";
        *(_WORD *)&v54[8] = 2080;
        *(_QWORD *)&v54[10] = "CarMetadataConnectionManager.m";
        v55 = 1024;
        LODWORD(v56) = 150;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v29 = sub_1004318FC();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v54 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v32 = sub_1005D4574();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Received a request to modify route guidance, but have no pending update. Ignoring", buf, 2u);
      }

      if (v5)
        goto LABEL_41;
    }
LABEL_22:
    if (!v6)
      goto LABEL_52;
    goto LABEL_44;
  }
  v21 = sub_1005D4574();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Resetting route guidance.", buf, 2u);
  }

  -[CPNavigationManager resetRouteGuidance](self->_carPlayService, "resetRouteGuidance");
  if (v4)
    goto LABEL_27;
LABEL_21:
  if (!v5)
    goto LABEL_22;
LABEL_41:
  v34 = sub_1005D4574();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = -[NSArray count](self->_pendingManeuvers, "count");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray valueForKey:](self->_pendingManeuvers, "valueForKey:", CFSTR("_maps_description")));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n\n")));
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v54 = v36;
    *(_WORD *)&v54[4] = 2112;
    *(_QWORD *)&v54[6] = v38;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Modifying to %d maneuvers:\n%@", buf, 0x12u);

  }
  -[CPNavigationManager setManeuvers:](self->_carPlayService, "setManeuvers:", self->_pendingManeuvers);
  if (v6)
  {
LABEL_44:
    v39 = sub_1005D4574();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      pendingLaneGuidances = self->_pendingLaneGuidances;
      v42 = pendingLaneGuidances;
      v43 = v42;
      if (v42)
      {
        if (-[NSArray count](v42, "count"))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v43, "componentsJoinedByString:", CFSTR(", ")));
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v43, v44));

        }
        else
        {
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v43));
        }
      }
      else
      {
        v45 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v54 = (_DWORD)pendingLaneGuidances;
      *(_WORD *)&v54[4] = 2112;
      *(_QWORD *)&v54[6] = v45;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Modifying to %d lane guidances: %@.", buf, 0x12u);

    }
    -[CPNavigationManager setLaneGuidances:](self->_carPlayService, "setLaneGuidances:", self->_pendingLaneGuidances);
  }
LABEL_52:
  self->_hasPendingUpdates = 0;
  v46 = self->_pendingRouteGuidance;
  self->_pendingRouteGuidance = 0;

  pendingManeuvers = self->_pendingManeuvers;
  self->_pendingManeuvers = 0;

  v48 = self->_pendingLaneGuidances;
  self->_pendingLaneGuidances = 0;

  self->_pendingUpdateTypes = 0;
}

- (void)navigationListener:(id)a3 didUpdateRouteGuidance:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *queue;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v5 = a4;
  v6 = sub_1005D4574();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = NSStringFromCPGuidanceState(objc_msgSend(v5, "guidanceState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 134218242;
    v17 = v5;
    v18 = 2112;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "navigationListener:didUpdateRouteGuidance: <%p, state: %@>", buf, 0x16u);

  }
  v10 = objc_msgSend(v5, "copy");

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005D4A18;
  v13[3] = &unk_1011AD1E8;
  objc_copyWeak(&v15, (id *)buf);
  v14 = v10;
  v12 = v10;
  dispatch_async(queue, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)navigationListener:(id)a3 didUpdateManeuvers:(id)a4 laneGuidances:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v7 = a4;
  v8 = a5;
  v9 = sub_1005D4574();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v21 = objc_msgSend(v7, "count");
    v22 = 2048;
    v23 = objc_msgSend(v8, "count");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "navigationListener:didUpdateManeuvers:laneGuidances: maneuver count: %lu laneGuidance count: %lu", buf, 0x16u);
  }

  v11 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v7, 1);
  v12 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", v8, 1);

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005D4C20;
  block[3] = &unk_1011AFF10;
  objc_copyWeak(&v19, (id *)buf);
  v17 = v11;
  v18 = v12;
  v14 = v12;
  v15 = v11;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 >= 3)
    {
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315650;
        v13 = "NSString *NSStringFromCARNavigationOwner(CARNavigationOwner)";
        v14 = 2080;
        v15 = "CarMetadataConnectionManager.m";
        v16 = 1024;
        v17 = 41;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v12, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v9 = sub_1004318FC();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v12 = 138412290;
          v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

        }
      }
      v6 = 0;
    }
    else
    {
      v6 = off_1011BD198[a3];
    }
    v12 = 138412290;
    v13 = (const char *)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Navigation owner changed to: %@", (uint8_t *)&v12, 0xCu);
  }

  if (a3 == 2)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1011BD158);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingLaneGuidances, 0);
  objc_storeStrong((id *)&self->_pendingManeuvers, 0);
  objc_storeStrong((id *)&self->_pendingRouteGuidance, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_carPlayService, 0);
}

@end

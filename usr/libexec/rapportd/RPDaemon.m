@implementation RPDaemon

+ (id)sharedDaemon
{
  if (qword_100131FF0 != -1)
    dispatch_once(&qword_100131FF0, &stru_1001128A0);
  return (id)qword_100131FE8;
}

- (BOOL)sigTermPending
{
  return self->_sigTermPending;
}

- (BOOL)languageChangePending
{
  return self->_languageChangePending;
}

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

- (RPDaemon)init
{
  RPDaemon *v2;
  RPDaemon *v3;
  NSMutableArray *v4;
  NSMutableArray *subDaemons;
  NSMutableArray *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  NSMutableArray *v18;
  RPRemoteDisplayDaemon *v19;
  NSMutableArray *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  RPDaemon *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)RPDaemon;
  v2 = -[RPDaemon init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_languageChangedNotifier = -1;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    subDaemons = v3->_subDaemons;
    v3->_subDaemons = v4;

    v6 = v3->_subDaemons;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
    -[NSMutableArray addObject:](v6, "addObject:", v7);

    v8 = v3->_subDaemons;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPCompanionLinkDaemon sharedCompanionLinkDaemon](RPCompanionLinkDaemon, "sharedCompanionLinkDaemon"));
    -[NSMutableArray addObject:](v8, "addObject:", v9);

    v10 = v3->_subDaemons;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](RPCloudDaemon, "sharedCloudDaemon"));
    -[NSMutableArray addObject:](v10, "addObject:", v11);

    v12 = v3->_subDaemons;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPNearFieldDaemon sharedNearFieldDaemon](RPNearFieldDaemon, "sharedNearFieldDaemon"));
    -[NSMutableArray addObject:](v12, "addObject:", v13);

    v14 = v3->_subDaemons;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RPNearbyInvitationDaemon sharedInvitationDaemon](RPNearbyInvitationDaemon, "sharedInvitationDaemon"));
    -[NSMutableArray addObject:](v14, "addObject:", v15);

    v16 = v3->_subDaemons;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](RPPeopleDaemon, "sharedPeopleDaemon"));
    -[NSMutableArray addObject:](v16, "addObject:", v17);

    v18 = v3->_subDaemons;
    v19 = objc_alloc_init(RPRemoteDisplayDaemon);
    -[NSMutableArray addObject:](v18, "addObject:", v19);

    v20 = v3->_subDaemons;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPPrivateDaemon sharedPrivateDaemon](RPPrivateDaemon, "sharedPrivateDaemon"));
    -[NSMutableArray addObject:](v20, "addObject:", v21);

    v22 = v3->_subDaemons;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
    -[NSMutableArray addObject:](v22, "addObject:", v23);

    v24 = v3->_subDaemons;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPStatusDaemon sharedStatusDaemon](RPStatusDaemon, "sharedStatusDaemon"));
    -[NSMutableArray addObject:](v24, "addObject:", v25);

    -[RPDaemon _metricsSubmissionSetup](v3, "_metricsSubmissionSetup");
    v26 = v3;
  }

  return v3;
}

- (void)_metricsSubmissionSetup
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *metricsReportQueue;
  OS_dispatch_source *v8;
  OS_dispatch_source *metricsReportTimer;
  NSObject *attr;

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
  attr = objc_claimAutoreleasedReturnValue(v5);

  v6 = (OS_dispatch_queue *)dispatch_queue_create("RPMetricsSubmission", attr);
  metricsReportQueue = self->_metricsReportQueue;
  self->_metricsReportQueue = v6;

  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_metricsReportQueue);
  metricsReportTimer = self->_metricsReportTimer;
  self->_metricsReportTimer = v8;

  dispatch_source_set_event_handler((dispatch_source_t)self->_metricsReportTimer, &stru_1001128C0);
  CUDispatchTimerSet(self->_metricsReportTimer, 86400.0, 86400.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_metricsReportTimer);

}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *j;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t errorFlags;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  int v44;
  uint64_t v45;
  void *k;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id *v52;
  id v53;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  RPDaemon *v58;
  _BOOL4 v59;
  NSMutableSet *obj;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];

  v4 = a3;
  v59 = sub_100018154();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v58 = self;
  v5 = self->_subDaemons;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
  if (v6)
  {
    v9 = v6;
    v10 = 0;
    v11 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v89 != v11)
          objc_enumerationMutation(v5);
        v13 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(RPIdentityDaemon, v7, v8);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
        {
          v87 = v10;
          v15 = CUDescriptionWithLevel(v13, v4);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          NSAppendPrintF(&v87, "%@\n", v16);
          v17 = v87;

          v10 = v17;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v18 = objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetricsNoCreate](RPMetrics, "sharedMetricsNoCreate"));
  v57 = (void *)v18;
  if (v4 <= 0x13 && v18)
  {
    v86 = v10;
    v19 = CUDescriptionWithLevel(v18, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    NSAppendPrintF(&v86, "%@\n", v20);
    v21 = v86;

    v10 = v21;
  }
  v85 = v10;
  NSAppendPrintF(&v85, "-- Daemon XPC Cnx: %d --\n", -[NSMutableSet count](v58->_xpcConnections, "count"));
  v22 = v85;

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v58->_xpcConnections;
  v62 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
  if (v62)
  {
    v61 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v62; j = (char *)j + 1)
      {
        if (*(_QWORD *)v82 != v61)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)j);
        v80 = v22;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "xpcCnx"));
        NSAppendPrintF(&v80, "%#{pid}", objc_msgSend(v25, "processIdentifier"));
        v26 = v80;

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assertions"));
        if (objc_msgSend(v27, "count"))
        {
          v79 = v26;
          NSAppendPrintF(&v79, ", assertions <");
          v28 = v79;

          v77 = 0u;
          v78 = 0u;
          v76 = 0u;
          v75 = 0u;
          v63 = v27;
          v29 = v27;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v76;
            v33 = "";
            do
            {
              v34 = 0;
              v35 = v28;
              do
              {
                if (*(_QWORD *)v76 != v32)
                  objc_enumerationMutation(v29);
                v36 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v34);
                v74 = v35;
                NSAppendPrintF(&v74, "%s%@", v33, v36, v57);
                v28 = v74;

                v34 = (char *)v34 + 1;
                v33 = " ";
                v35 = v28;
              }
              while (v31 != v34);
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
              v33 = " ";
            }
            while (v31);
          }

          v73 = v28;
          NSAppendPrintF(&v73, ">");
          v26 = v73;

          v27 = v63;
        }
        v72 = v26;
        NSAppendPrintF(&v72, "\n");
        v22 = v72;

      }
      v62 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
    }
    while (v62);
  }

  errorFlags = v58->_errorFlags;
  if (errorFlags)
  {
    v71 = v22;
    NSAppendPrintF(&v71, "\nError Flags: %#ll{flags}\n", errorFlags, &unk_10010A2F0, v57);
    v38 = v71;

    v22 = v38;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v39 = (void *)CFPrefs_CopyKeys(CFSTR("com.apple.rapport"), 0);
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v92, 16);
  if (v40)
  {
    v43 = v40;
    v44 = 0;
    v45 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v43; k = (char *)k + 1)
      {
        if (*(_QWORD *)v68 != v45)
          objc_enumerationMutation(v39);
        v47 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)k);
        if (!v44)
        {
          v66 = v22;
          NSAppendPrintF(&v66, "\n");
          v48 = v66;

          v22 = v48;
        }
        v49 = objc_opt_class(NSString, v41, v42);
        if ((objc_opt_isKindOfClass(v47, v49) & 1) != 0)
        {
          v50 = CFPrefs_CopyTypedValue(CFSTR("com.apple.rapport"), v47, 0, 0);
          v51 = (void *)v50;
          if (v59)
          {
            v65 = v22;
            v55 = v47;
            v52 = &v65;
            NSAppendPrintF(&v65, "Pref: '%@' = '%@'\n", v55, v50);
          }
          else
          {
            v64 = v22;
            v56 = v47;
            v52 = &v64;
            NSAppendPrintF(&v64, "Pref: '%@' = '%~@'\n", v56, v50);
          }
          v53 = *v52;

          ++v44;
          v22 = v53;
        }
      }
      v43 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v92, 16);
    }
    while (v43);
  }

  return v22;
}

- (void)activate
{
  uint64_t Int64;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSObject *dispatchQueue;
  NSObject *v15;
  OS_dispatch_source *v16;
  OS_dispatch_source *sigTermSource;
  NSObject *v18;
  CUSystemMonitor *v19;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v21;
  NSObject *v22;
  NSXPCListener *v23;
  NSXPCListener *xpcListener;
  uint64_t v25;
  OS_xpc_event_publisher *v26;
  OS_xpc_event_publisher *xpcPublisher;
  OS_xpc_event_publisher *v28;
  OS_xpc_event_publisher *v29;
  OS_dispatch_queue *v30;
  OS_dispatch_queue *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD handler[5];
  _QWORD block[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon activate]", 30, "Activate\n");
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("xpcMatchingTestMode"), 0);
  v4 = Int64 != 0;
  if (self->_prefXPCMatchingTestMode != v4)
  {
    if (dword_100130728 <= 40)
    {
      v5 = Int64;
      if (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 40))
      {
        v6 = "yes";
        if (v5)
          v7 = "no";
        else
          v7 = "yes";
        if (!v5)
          v6 = "no";
        LogPrintF(&dword_100130728, "-[RPDaemon activate]", 40, "XPC matching test mode enabled: %s -> %s\n", v7, v6);
      }
    }
    self->_prefXPCMatchingTestMode = v4;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = self->_subDaemons;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "setDispatchQueue:", self->_dispatchQueue);
        objc_msgSend(v13, "activate");
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v10);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048170;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  if (self->_languageChangedNotifier == -1)
  {
    v15 = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100048178;
    handler[3] = &unk_1001115C8;
    handler[4] = self;
    notify_register_dispatch("com.apple.language.changed", &self->_languageChangedNotifier, v15, handler);
  }
  if (!self->_sigTermSource)
  {
    v16 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)self->_dispatchQueue);
    sigTermSource = self->_sigTermSource;
    self->_sigTermSource = v16;

    v18 = self->_sigTermSource;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10004820C;
    v41[3] = &unk_1001110F8;
    v41[4] = self;
    dispatch_source_set_event_handler(v18, v41);
    dispatch_resume((dispatch_object_t)self->_sigTermSource);
  }
  if (!self->_systemMonitor)
  {
    v19 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v19;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100048284;
    v40[3] = &unk_1001110F8;
    v40[4] = self;
    -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v40);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000482F4;
    v39[3] = &unk_1001110F8;
    v39[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v39);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100048364;
    v38[3] = &unk_1001110F8;
    v38[4] = self;
    -[CUSystemMonitor setWifiStateChangedHandler:](self->_systemMonitor, "setWifiStateChangedHandler:", v38);
    v21 = self->_systemMonitor;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000483D4;
    v37[3] = &unk_1001110F8;
    v37[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v21, "activateWithCompletion:", v37);
  }
  if (!self->_xpcEventsRegistered)
  {
    v22 = self->_dispatchQueue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000483DC;
    v36[3] = &unk_1001128E8;
    v36[4] = self;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v22, v36);
    self->_xpcEventsRegistered = 1;
  }
  if (!self->_xpcListener)
  {
    v23 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.rapport"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v23;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  if (!self->_xpcPublisher)
  {
    v25 = xpc_event_publisher_create("com.apple.rapport.matching", self->_dispatchQueue);
    v26 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue(v25);
    xpcPublisher = self->_xpcPublisher;
    self->_xpcPublisher = v26;

    v28 = self->_xpcPublisher;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000484EC;
    v35[3] = &unk_100112910;
    v35[4] = self;
    xpc_event_publisher_set_handler(v28, v35);
    v29 = self->_xpcPublisher;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10004850C;
    v34[3] = &unk_1001115C8;
    v34[4] = self;
    xpc_event_publisher_set_error_handler(v29, v34);
    xpc_event_publisher_activate(self->_xpcPublisher);
  }
  if (!self->_stateHandleGeneral)
  {
    v30 = self->_dispatchQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100048590;
    v33[3] = &unk_100112938;
    v33[4] = self;
    self->_stateHandleGeneral = os_state_add_handler(v30, v33);
  }
  if (!self->_stateHandleIdentities)
    self->_stateHandleIdentities = os_state_add_handler(self->_dispatchQueue, &stru_100112978);
  if (!self->_stateHandleKeychain)
  {
    v31 = self->_dispatchQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000485FC;
    v32[3] = &unk_100112938;
    v32[4] = self;
    self->_stateHandleKeychain = os_state_add_handler(v31, v32);
  }
  if (!self->_stateHandlePrivateDiscovery)
    self->_stateHandlePrivateDiscovery = os_state_add_handler(self->_dispatchQueue, &stru_100112998);
}

- (void)invalidate
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  OS_xpc_event_publisher *xpcPublisher;
  int languageChangedNotifier;
  OS_dispatch_source *sigTermSource;
  NSObject *v11;
  OS_dispatch_source *v12;
  CUSystemMonitor *systemMonitor;
  NSXPCListener *xpcListener;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  NSMutableSet *xpcConnections;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon invalidate]", 30, "Invalidate\n");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_subDaemons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "invalidate");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_subDaemons, "removeAllObjects");
  xpcPublisher = self->_xpcPublisher;
  self->_xpcPublisher = 0;

  if (self->_stateHandleGeneral)
  {
    os_state_remove_handler();
    self->_stateHandleGeneral = 0;
  }
  if (self->_stateHandleIdentities)
  {
    os_state_remove_handler();
    self->_stateHandleIdentities = 0;
  }
  if (self->_stateHandleKeychain)
  {
    os_state_remove_handler();
    self->_stateHandleKeychain = 0;
  }
  if (self->_stateHandlePrivateDiscovery)
  {
    os_state_remove_handler();
    self->_stateHandlePrivateDiscovery = 0;
  }
  languageChangedNotifier = self->_languageChangedNotifier;
  if (languageChangedNotifier != -1)
  {
    notify_cancel(languageChangedNotifier);
    self->_languageChangedNotifier = -1;
  }
  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    v11 = sigTermSource;
    dispatch_source_cancel(v11);
    v12 = self->_sigTermSource;
    self->_sigTermSource = 0;

  }
  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_xpcConnections;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j), "xpcCnx", (_QWORD)v22));
        objc_msgSend(v20, "invalidate");

      }
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon invalidate]", 30, "Invalidated\n", (_QWORD)v22);
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  unsigned int v9;
  uint64_t Int64;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("errorFlags"));

  if (v9)
  {
    self->_errorFlagsForceSet = CFDictionaryGetInt64(v6, CFSTR("setFlags"), 0);
    Int64 = CFDictionaryGetInt64(v6, CFSTR("clearFlags"), 0);
    self->_errorFlagsForceClear = Int64;
    if (dword_100130728 <= 30)
    {
      if (dword_100130728 == -1)
      {
        if (!_LogCategory_Initialize(&dword_100130728, 30))
          goto LABEL_6;
        Int64 = self->_errorFlagsForceClear;
      }
      LogPrintF(&dword_100130728, "-[RPDaemon diagnosticCommand:params:]", 30, "Diag: ErrorFlags: Set %#ll{flags}, Clear %#ll{flags}\n", self->_errorFlagsForceSet, &unk_10010A2F0, Int64, &unk_10010A2F0);
    }
LABEL_6:
    -[RPDaemon _updateErrorFlags](self, "_updateErrorFlags");
  }

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  RPDaemonXPCConnection *v6;
  NSMutableSet *xpcConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = -[RPDaemonXPCConnection initWithDaemon:xpcConnection:]([RPDaemonXPCConnection alloc], "initWithDaemon:xpcConnection:", self, v5);
  -[RPDaemonXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPDaemonXPCServerInterface));
  objc_msgSend(v5, "setExportedInterface:", v10);

  objc_msgSend(v5, "setExportedObject:", v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100048C58;
  v13[3] = &unk_100111928;
  v13[4] = self;
  v13[5] = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPDaemonXPCClientInterface));
  objc_msgSend(v5, "setRemoteObjectInterface:", v11);

  objc_msgSend(v5, "resume");
  if (dword_100130728 <= 20 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 20)))
    LogPrintF(&dword_100130728, "-[RPDaemon listener:shouldAcceptNewConnection:]", 20, "XPC connection started from %#{pid}\n", objc_msgSend(v5, "processIdentifier"));

  return 1;
}

- (id)keychainStateString
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  id v22;
  _BYTE v23[128];

  v2 = objc_alloc_init((Class)NSMutableString);
  v3 = objc_alloc_init((Class)CUKeychainItem);
  objc_msgSend(v3, "setAccessGroup:", CFSTR("com.apple.rapport"));
  objc_msgSend(v3, "setSyncType:", 3);
  v4 = objc_alloc_init((Class)CUKeychainManager);
  v22 = 0;
  v5 = objc_msgSend(v4, "copyItemsMatchingItem:flags:error:", v3, 0, &v22);
  v6 = v22;
  v21 = v2;
  NSAppendPrintF(&v21, "-- RPKeychain: %d items, %{error} --\n", objc_msgSend(v5, "count"), v6);
  v7 = v21;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = CUDescriptionWithLevel(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12), 134217778);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        objc_msgSend(v7, "appendString:", v14);

        objc_msgSend(v7, "appendString:", CFSTR("\n"));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v10);
  }

  v15 = v7;
  return v15;
}

- (void)postDaemonInfoChanges:(unint64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048ED0;
  v4[3] = &unk_1001129C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_prefsChanged
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_subDaemons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "prefsChanged", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateErrorFlags
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t errorFlags;
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[CUSystemMonitor manateeAvailable](self->_systemMonitor, "manateeAvailable"))
    v3 = 0;
  else
    v3 = 256;
  if (!-[CUSystemMonitor primaryAppleIDIsHSA2](self->_systemMonitor, "primaryAppleIDIsHSA2"))
    v3 |= 0x20uLL;
  v4 = v3 | (4 * -[CUSystemMonitor wifiFlags](self->_systemMonitor, "wifiFlags")) & 0x80;
  v5 = -[CUSystemMonitor wifiState](self->_systemMonitor, "wifiState");
  v6 = v4 | 4;
  if (v5 != 10)
    v6 = v4;
  v7 = (v6 | self->_errorFlagsForceSet) & ~self->_errorFlagsForceClear;
  errorFlags = self->_errorFlags;
  if (v7 != errorFlags)
  {
    self->_errorFlags = v7;
    if (dword_100130728 <= 30
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemon _updateErrorFlags]", 30, "Error flags changed: %#ll{flags} -> %#ll{flags}\n", errorFlags, &unk_10010A2F0, v7, &unk_10010A2F0);
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](RPDaemon, "sharedDaemon"));
    objc_msgSend(v9, "postDaemonInfoChanges:", 32);

  }
}

- (void)_xpcPublisherAction:(unsigned int)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8;

  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      -[RPDaemon _xpcPublisherRemoveToken:](self, "_xpcPublisherRemoveToken:", a4);
    }
    else if (a3)
    {
      if (dword_100130728 <= 30
        && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
      {
        LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherAction:token:event:]", 30, "Unknown XPC publisher action: %d\n", a3);
      }
    }
    else
    {
      -[RPDaemon _xpcPublisherAddToken:event:](self, "_xpcPublisherAddToken:event:", a4, v8);
    }
  }

}

- (void)_xpcPublisherAddToken:(unint64_t)a3 event:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  unint64_t v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(a4, a2);
  if (!v8)
  {
    if (dword_100130728 > 90 || dword_100130728 == -1 && !_LogCategory_Initialize(&dword_100130728, 90))
      goto LABEL_39;
    v17 = a3;
    v10 = "### XPC publisher add: convert XPC event failed: token %llu\n";
LABEL_12:
    LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherAddToken:event:]", 90, v10, v17);
    goto LABEL_39;
  }
  v9 = objc_opt_class(NSDictionary, v6, v7);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (dword_100130728 > 90 || dword_100130728 == -1 && !_LogCategory_Initialize(&dword_100130728, 90))
      goto LABEL_39;
    v17 = a3;
    v10 = "### XPC publisher add: not a dictionary: token %llu\n";
    goto LABEL_12;
  }
  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherAddToken:event:]", 30, "XPC publisher add token %llu, %##@\n", a3, v8);
  if (self->_prefXPCMatchingTestMode || !CFDictionaryGetInt64(v8, CFSTR("testMode"), 0))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_subDaemons;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100049654;
          v18[3] = &unk_1001129E8;
          v18[4] = self;
          v18[5] = a3;
          if ((objc_msgSend(v16, "addXPCMatchingToken:event:handler:", a3, v8, v18) & 1) != 0)
          {

            goto LABEL_39;
          }
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }

    if (dword_100130728 <= 60
      && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 60)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherAddToken:event:]", 60, "### Add XPC matching not handled: token %llu, event %##@\n", a3, v8);
    }
  }
  else if (dword_100130728 <= 30
         && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
  {
    LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherAddToken:event:]", 30, "Ignoring TestMode XPC matching when not enabled: token %llu, event %##@\n", a3, v8);
  }
LABEL_39:

}

- (void)_xpcPublisherRemoveToken:(unint64_t)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_subDaemons;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "removeXPCMatchingToken:", a3) & 1) != 0)
        {

          return;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (dword_100130728 <= 30 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherRemoveToken:]", 30, "Remove XPC matching not handled: token %llu\n", a3);
}

- (void)_xpcPublisherTriggeredToken:(unint64_t)a3 payload:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OS_xpc_event_publisher *v17;
  void *v18;
  OS_dispatch_queue *dispatchQueue;
  int v20;
  id v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  unint64_t v26;

  v8 = a4;
  v9 = a5;
  v10 = (void (**)(id, _QWORD, void *))objc_retainBlock(v9);
  v17 = self->_xpcPublisher;
  if (v17)
  {
    if (v8)
    {
      v18 = (void *)_CFXPCCreateXPCObjectFromCFObject(v8);
      if (v18)
      {
        if (v10)
        {
LABEL_5:
          dispatchQueue = self->_dispatchQueue;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_100049B60;
          v24[3] = &unk_100112A10;
          v24[4] = self;
          v26 = a3;
          v25 = v9;
          v20 = xpc_event_publisher_fire_with_reply(v17, a3, v18, dispatchQueue, v24);

LABEL_18:
          if (v20)
          {
            if (dword_100130728 <= 90
              && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
            {
              LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherTriggeredToken:payload:responseHandler:]", 90, "### XPC publisher trigger failed: token %llu, %#m\n");
            }
          }
          else if (dword_100130728 <= 30
                 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
          {
            LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherTriggeredToken:payload:responseHandler:]", 30, "XPC publisher triggered: token %llu\n");
          }

          goto LABEL_30;
        }
LABEL_17:
        v20 = xpc_event_publisher_fire(v17, a3, v18);
        goto LABEL_18;
      }
      if (dword_100130728 <= 90
        && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
      {
        LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherTriggeredToken:payload:responseHandler:]", 90, "### XPC publisher trigger payload conversion failed\n");
      }
    }
    v18 = 0;
    if (v10)
      goto LABEL_5;
    goto LABEL_17;
  }
  if (dword_100130728 <= 90 && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
    LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherTriggeredToken:payload:responseHandler:]", 90, "### XPC publisher triggered without publisher, token %llu\n", a3);
  if (v10)
  {
    v21 = RPErrorF(4294960596, (uint64_t)"No XPC publisher", v11, v12, v13, v14, v15, v16, v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v10[2](v10, 0, v22);

  }
LABEL_30:

}

- (void)_xpcPublisherTriggeredReply:(id)a3 token:(unint64_t)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *string;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v7 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_10000F998;
  v49 = sub_10000F958;
  v50 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100049DD4;
  v41[3] = &unk_100112A38;
  v43 = &v45;
  v44 = a4;
  v8 = a5;
  v42 = v8;
  v9 = objc_retainBlock(v41);
  if (xpc_get_type(v7) != (xpc_type_t)&_xpc_type_error)
  {
    v18 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7, v10);
    if (v18)
    {
      v19 = objc_opt_class(NSDictionary, v11, v12);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      {
        if (dword_100130728 <= 30
          && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
        {
          LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherTriggeredReply:token:responseHandler:]", 30, "XPC publisher reply: token %llu, %##@\n", a4, v18);
        }
        (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v18, 0);
        goto LABEL_12;
      }
      v38 = RPErrorF(4294960540, (uint64_t)"XPC reply bad type", v20, v21, v22, v23, v24, v25, v40);
      v37 = objc_claimAutoreleasedReturnValue(v38);
    }
    else
    {
      v36 = RPErrorF(4294960584, (uint64_t)"XPC reply convert failed", v12, v13, v14, v15, v16, v17, v40);
      v37 = objc_claimAutoreleasedReturnValue(v36);
    }
    v39 = (void *)v46[5];
    v46[5] = v37;

    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v7, _xpc_error_key_description);
  v33 = "?";
  if (string)
    v33 = string;
  v34 = RPErrorF(4294960584, (uint64_t)"XPC reply error: %s", v27, v28, v29, v30, v31, v32, (uint64_t)v33);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  v18 = (void *)v46[5];
  v46[5] = v35;
LABEL_12:

  ((void (*)(_QWORD *))v9[2])(v9);
  _Block_object_dispose(&v45, 8);

}

- (void)_xpcPublisherStateChangedForToken:(unint64_t)a3 state:(BOOL)a4
{
  _BOOL8 v4;
  OS_xpc_event_publisher *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BOOL8 v11;
  OS_xpc_event_publisher *v12;

  v4 = a4;
  v6 = self->_xpcPublisher;
  v12 = v6;
  if (v6)
  {
    if (xpc_event_publisher_set_subscriber_keepalive(v6, a3, v4))
    {
      if (dword_100130728 <= 90
        && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
      {
        LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherStateChangedForToken:state:]", 90, "### XPC publisher state change failed: token %llu, state %d, %#m\n");
      }
    }
    else if (dword_100130728 <= 30
           && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
    {
      LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherStateChangedForToken:state:]", 30, "XPC publisher state changed: token %llu, state %d\n");
    }
    if (v4)
    {
      v8 = xpc_event_publisher_fire(v12, a3, 0);
      if ((_DWORD)v8)
      {
        if (dword_100130728 <= 90)
        {
          v9 = v8;
          if (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90))
          {
            v10 = a3;
            v11 = v9;
            v7 = "### XPC publisher state  trigger failed: token %llu, %#m\n";
            goto LABEL_23;
          }
        }
      }
      else if (dword_100130728 <= 30
             && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 30)))
      {
        LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherStateChangedForToken:state:]", 30, "XPC publisher state triggered: token %llu\n");
      }
    }
  }
  else if (dword_100130728 <= 90
         && (dword_100130728 != -1 || _LogCategory_Initialize(&dword_100130728, 90)))
  {
    v10 = a3;
    v11 = v4;
    v7 = "### XPC publisher state changed without publisher, token %llu, state %d\n";
LABEL_23:
    LogPrintF(&dword_100130728, "-[RPDaemon _xpcPublisherStateChangedForToken:state:]", 90, v7, v10, v11);
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_metricsReportQueue, 0);
  objc_storeStrong((id *)&self->_metricsReportTimer, 0);
  objc_storeStrong((id *)&self->_xpcPublisher, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_subDaemons, 0);
  objc_storeStrong((id *)&self->_sigTermSource, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end

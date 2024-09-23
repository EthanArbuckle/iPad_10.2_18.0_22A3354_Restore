@implementation RPNWEndpoint

+ (void)endpointTimerFired
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)qword_1001320D0;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", v6));
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ageOutTimeout"));
        if (v8)
        {
          v9 = (void *)v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ageOutTimeout"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "earlierDate:", v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ageOutTimeout"));

          if (v12 == v13)
          {
            if (dword_100130ED8 <= 30
              && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
            {
              LogPrintF(&dword_100130ED8, "+[RPNWEndpoint endpointTimerFired]", 30, "Endpoint aged out, removing endpoint '%@'\n", v7);
            }
            objc_msgSend(v14, "addObject:", v6);
          }
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

  objc_msgSend((id)qword_1001320D0, "removeObjectsForKeys:", v14);
}

+ (void)initialize
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_opt_self(RPNWEndpoint, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)qword_1001320D0;
    qword_1001320D0 = (uint64_t)v5;

    +[RPNWEndpoint startEndpointTimer](RPNWEndpoint, "startEndpointTimer");
  }
}

- (RPNWEndpoint)init
{
  RPNWEndpoint *v2;
  RPNWEndpoint *v3;
  RPNWEndpoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNWEndpoint;
  v2 = -[RPNWEndpoint init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (RPNWEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  RPNWEndpoint *v16;
  RPNWEndpoint *v17;
  id v18;
  RPNWEndpoint *v19;
  objc_super v21;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)RPNWEndpoint;
  v16 = -[RPNWEndpoint init](&v21, "init");
  v17 = v16;
  if (v16)
  {
    -[RPNWEndpoint setDevice:](v16, "setDevice:", v12);
    -[RPNWEndpoint setApplicationService:](v17, "setApplicationService:", v13);
    -[RPNWEndpoint setEndpointUUID:](v17, "setEndpointUUID:", v14);
    -[RPNWEndpoint setShouldAutomapListener:](v17, "setShouldAutomapListener:", v7);
    v18 = objc_alloc_init((Class)NSMutableArray);
    -[RPNWEndpoint setSessions:](v17, "setSessions:", v18);

    if (v15)
    {
      -[RPNWEndpoint addSession:](v17, "addSession:", v15);
      -[RPNWEndpoint setBrowseSession:](v17, "setBrowseSession:", 1);
    }
    v19 = v17;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RPNWEndpoint;
  -[RPNWEndpoint dealloc](&v2, "dealloc");
}

- (id)description
{
  id v3;
  NSDate *ageOutTimeout;
  void *v5;
  double v6;
  double v7;
  const __CFString *v8;
  double v10;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("RPNWEndpoint[%@:%@] '%@'"), self->_applicationService, self->_endpointUUID, self->_device);
  ageOutTimeout = self->_ageOutTimeout;
  if (ageOutTimeout)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[NSDate timeIntervalSinceDate:](ageOutTimeout, "timeIntervalSinceDate:", v5);
    v7 = v6;

    if (v7 >= 0.0)
    {
      v10 = v7;
      v8 = CFSTR(" ageOut=%.0fs ");
    }
    else
    {
      v8 = CFSTR(" ageOut=stale ");
    }
    objc_msgSend(v3, "appendFormat:", v8, *(_QWORD *)&v10);
  }
  return v3;
}

- (void)startAgeOutTimer
{
  NSDate *v3;
  NSDate *ageOutTimeout;

  if (dword_100130ED8 <= 30 && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
    LogPrintF(&dword_100130ED8, "-[RPNWEndpoint startAgeOutTimer]", 30, "Starting endpoint age-out timer '%@'", self);
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 180.0));
  ageOutTimeout = self->_ageOutTimeout;
  self->_ageOutTimeout = v3;

}

- (void)addSession:(id)a3
{
  NSDate *ageOutTimeout;

  -[NSMutableArray addObject:](self->_sessions, "addObject:", a3);
  ageOutTimeout = self->_ageOutTimeout;
  self->_ageOutTimeout = 0;

}

- (BOOL)seenBySession:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sessions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "isEqual:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)removeDiscoverySession:(id)a3 lastEntry:(BOOL *)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_sessions;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isEqual:", v6, (_QWORD)v13))
        {
          -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v11);
          LODWORD(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  if (a4)
    *a4 = 0;
  if ((_DWORD)v8)
  {
    if (!-[NSMutableArray count](self->_sessions, "count") && self->_browseSession)
    {
      -[RPNWEndpoint startAgeOutTimer](self, "startAgeOutTimer");
      if (a4)
        *a4 = 1;
    }
  }

  return (char)v8;
}

+ (id)listEndpointsForDiscoverySession:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableString);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)qword_1001320D0;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9)));
        if (objc_msgSend(v10, "seenBySession:", v3))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
          objc_msgSend(v4, "appendFormat:", CFSTR("  %@\n"), v11);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)startEndpointTimer
{
  void *v2;
  NSObject *v3;
  dispatch_source_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dispatchQueue"));
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  v5 = (void *)qword_1001320D8;
  qword_1001320D8 = (uint64_t)v4;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1001320D8, &stru_100112FB0);
  CUDispatchTimerSet(qword_1001320D8, 60.0, 60.0, 1.0);
  dispatch_activate((dispatch_object_t)qword_1001320D8);
}

+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  if (dword_100130ED8 <= 30 && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
    LogPrintF(&dword_100130ED8, "+[RPNWEndpoint removeDiscoverySessionFromAllEndpoints:]", 30, "Starting timeout for endpoints for session '%@'", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (id)qword_1001320D0;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)));
        objc_msgSend(v9, "removeDiscoverySession:lastEntry:", v3, 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6 shouldAutomapListener:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  RPNWEndpoint *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  _BOOL4 v37;
  id v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v37 = a7;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (dword_100130ED8 <= 30 && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
    LogPrintF(&dword_100130ED8, "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]", 30, "Adding endpoint mapping [%@:%@] for device '%@' and session '%@'\n", v12, v11, v10, v13);
  v38 = v12;
  v39 = v13;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v14 = (RPNWEndpoint *)(id)qword_1001320D0;
  v15 = -[RPNWEndpoint countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i)));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "device"));
        if ((objc_msgSend(v20, "isEqualToDevice:", v10) & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endpointUUID"));
          v22 = objc_msgSend(v21, "isEqual:", v11);

          if (v22)
          {
            if (dword_100130ED8 <= 40
              && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 40)))
            {
              LogPrintF(&dword_100130ED8, "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]", 40, "Found existing endpoint '%@'\n", v10);
            }
            v23 = v39;
            v24 = v11;
            v25 = v38;
            if (v39 && (objc_msgSend(v19, "seenBySession:", v39) & 1) == 0)
            {
              objc_msgSend(v19, "addSession:", v39);
              v26 = 1;
            }
            else
            {
              v26 = 0;
            }

            goto LABEL_50;
          }
        }
        else
        {

        }
      }
      v16 = -[RPNWEndpoint countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v16)
        continue;
      break;
    }
  }

  v23 = v39;
  if (!v39)
  {
    if (dword_100130ED8 <= 40
      && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 40)))
    {
      LogPrintF(&dword_100130ED8, "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]", 40, "Removing existing device mappings to other peers\n");
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v27 = (id)qword_1001320D0;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", v32));
          if ((objc_msgSend(v33, "browseSession") & 1) == 0)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "device"));
            v35 = objc_msgSend(v34, "isEqualToDevice:", v10);

            if ((v35 & 1) == 0)
            {
              if (dword_100130ED8 <= 40
                && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 40)))
              {
                LogPrintF(&dword_100130ED8, "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]", 40, "Removing endpoint '%@'\n", v33);
              }
              objc_msgSend(v40, "addObject:", v32);
            }
          }

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v29);
    }

    objc_msgSend((id)qword_1001320D0, "removeObjectsForKeys:", v40);
    +[RPNWConnection stopAllOutgoingConnectionsNotForPeer:](RPNWConnection, "stopAllOutgoingConnectionsNotForPeer:", v10);

    v23 = 0;
  }
  v25 = v38;
  v24 = v11;
  v14 = -[RPNWEndpoint initWithDevice:applicationService:endpointID:discoverySessionID:shouldAutomapListener:]([RPNWEndpoint alloc], "initWithDevice:applicationService:endpointID:discoverySessionID:shouldAutomapListener:", v10, v38, v11, v23, v37);
  if (dword_100130ED8 <= 40 && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 40)))
    LogPrintF(&dword_100130ED8, "+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]", 40, "Found no existing endpoint, created new endpoint '%@'\n", v14);
  objc_msgSend((id)qword_1001320D0, "setObject:forKeyedSubscript:", v14, v11);
  v26 = 1;
LABEL_50:

  return v26;
}

+ (BOOL)updateEndpointMapping:(id)a3 discoverySessionID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = a4;
  if (dword_100130ED8 <= 30 && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
    LogPrintF(&dword_100130ED8, "+[RPNWEndpoint updateEndpointMapping:discoverySessionID:]", 30, "Updating endpoint for device '%@'", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)qword_1001320D0;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v16 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i)));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "device"));
        if (objc_msgSend(v13, "isEqualToDevice:", v5))
        {
          v14 = objc_msgSend(v12, "seenBySession:", v6);

          if (v14)
          {
            if (dword_100130ED8 <= 40
              && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 40)))
            {
              LogPrintF(&dword_100130ED8, "+[RPNWEndpoint updateEndpointMapping:discoverySessionID:]", 40, "Found existing endpoint to update '%@'\n", v12);
            }
            objc_msgSend(v12, "setDevice:", v5);
            v16 = 1;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v16 = 0;
  }

  return v16 & 1;
}

+ (void)ageOutEndpointMapping:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  v10 = v3;
  if (dword_100130ED8 <= 30)
  {
    if (dword_100130ED8 != -1 || (v4 = _LogCategory_Initialize(&dword_100130ED8, 30), v3 = v10, v4))
    {
      LogPrintF(&dword_100130ED8, "+[RPNWEndpoint ageOutEndpointMapping:]", 30, "Age out endpoint with ID '%@'", v3);
      v3 = v10;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWEndpoint findEndpoint:](RPNWEndpoint, "findEndpoint:", v3));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessions"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      if (dword_100130ED8 <= 30
        && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
      {
        LogPrintF(&dword_100130ED8, "+[RPNWEndpoint ageOutEndpointMapping:]", 30, "Endpoint still owned by a discovery session", v9);
      }
    }
    else
    {
      objc_msgSend(v6, "startAgeOutTimer");
    }
  }
  else if (dword_100130ED8 <= 30
         && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
  {
    LogPrintF(&dword_100130ED8, "+[RPNWEndpoint ageOutEndpointMapping:]", 30, "Did not find endpoint with ID '%@'", v10);
  }

}

+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4 immediate:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  BOOL v18;
  void *v20;
  _BOOL4 v21;
  unsigned int v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v21 = a5;
  v7 = a3;
  v8 = a4;
  if (dword_100130ED8 <= 30 && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
    LogPrintF(&dword_100130ED8, "+[RPNWEndpoint removeEndpointMapping:discoverySessionID:immediate:]", 30, "Removing endpoint '%@' for device '%@'", a1, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = (id)qword_1001320D0;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    LOBYTE(v22) = 0;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "device"));
        if (objc_msgSend(v16, "isEqualToDevice:", v7))
        {
          v17 = objc_msgSend(v15, "seenBySession:", v8);

          if (v17)
          {
            v23 = 0;
            v22 = objc_msgSend(v15, "removeDiscoverySession:lastEntry:", v8, &v23);
            if (v21)
            {
              if (v22)
                v18 = v23 == 0;
              else
                v18 = 1;
              if (!v18)
                objc_msgSend(v20, "addObject:", v14);
            }
          }
        }
        else
        {

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  objc_msgSend((id)qword_1001320D0, "removeObjectsForKeys:", v20);
  return v22 & 1;
}

+ (void)clearEndpointMappings:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)qword_1001320D0;
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
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "device"));
        v12 = objc_msgSend(v11, "isEqualToDevice:", v3);

        if (v12)
          objc_msgSend(v13, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend((id)qword_1001320D0, "removeObjectsForKeys:", v13);
}

+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 agentClientPID:(int)a6 applicationService:(id)a7 discoverySessionID:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t count;
  uint64_t v27;
  void (**v28)(id, void *);
  id v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v27 = *(_QWORD *)&a6;
  v29 = a3;
  v28 = (void (**)(id, void *))a4;
  v12 = a5;
  v13 = a7;
  v14 = a8;
  v15 = v13;
  v16 = v14;
  v31 = (void *)nw_array_create();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)qword_1001320D0;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  v30 = v13;
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(obj);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i)));
        if (objc_msgSend(v22, "seenBySession:", v16))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWPeer createNWEndpointForEndpoint:agentID:applicationService:](RPNWPeer, "createNWEndpointForEndpoint:agentID:applicationService:", v22, v12, v15));
          if (dword_100130ED8 <= 30
            && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
          {
            LogPrintF(&dword_100130ED8, "+[RPNWEndpoint updateClientBrowseResult:browseResponse:agentUUID:agentClientPID:applicationService:discoverySessionID:]", 30, " %d -> %@", (unsigned __int16)v19++, v23);
            v15 = v30;
          }
          nw_array_append(v31, v23);

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v18);
  }

  if (dword_100130ED8 <= 30 && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
  {
    v24 = v29;
    v25 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v25, "appendFormat:", CFSTR("%p"), v24);

    count = nw_array_get_count(v31);
    LogPrintF(&dword_100130ED8, "+[RPNWEndpoint updateClientBrowseResult:browseResponse:agentUUID:agentClientPID:applicationService:discoverySessionID:]", 30, "Updated browse client [%d:%@] with %zu endpoints", v27, v25, count);

  }
  v28[2](v28, v31);

}

+ (id)findEndpoint:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (dword_100130ED8 <= 30 && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
    LogPrintF(&dword_100130ED8, "+[RPNWEndpoint findEndpoint:]", 30, "Searching for endpoint with UUID='%@'", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001320D0, "objectForKeyedSubscript:", v3));
  if (v4)
  {
    if (dword_100130ED8 <= 30
      && (dword_100130ED8 != -1 || _LogCategory_Initialize(&dword_100130ED8, 30)))
    {
      LogPrintF(&dword_100130ED8, "+[RPNWEndpoint findEndpoint:]", 30, "Found endpoint '%@'", v4);
    }
    v5 = v4;
  }

  return v4;
}

+ (void)listEndpoints:(id)a3
{
  id v3;
  uint64_t *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v3 = a3;
  objc_msgSend(v3, "appendString:", CFSTR("Discovered Endpoints\n"));
  v4 = &qword_100132000;
  if (objc_msgSend((id)qword_1001320D0, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)qword_1001320D0;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v17 = *(_QWORD *)v23;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(obj);
          v8 = v4;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4[26], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v7)));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
          objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), v10);

          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sessions"));
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v3, "appendFormat:", CFSTR("  + Discovered by session '%@'\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15));
                v15 = (char *)v15 + 1;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v13);
          }

          v7 = (char *)v7 + 1;
          v4 = v8;
        }
        while (v7 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("  <empty>\n"));
  }

}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
  objc_storeStrong((id *)&self->_applicationService, a3);
}

- (BOOL)browseSession
{
  return self->_browseSession;
}

- (void)setBrowseSession:(BOOL)a3
{
  self->_browseSession = a3;
}

- (BOOL)shouldAutomapListener
{
  return self->_shouldAutomapListener;
}

- (void)setShouldAutomapListener:(BOOL)a3
{
  self->_shouldAutomapListener = a3;
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (NSDate)ageOutTimeout
{
  return self->_ageOutTimeout;
}

- (void)setAgeOutTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_ageOutTimeout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageOutTimeout, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

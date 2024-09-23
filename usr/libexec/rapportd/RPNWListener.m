@implementation RPNWListener

+ (void)initialize
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_opt_self(RPNWListener, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)qword_100131FC8;
    qword_100131FC8 = (uint64_t)v5;

  }
}

- (RPNWListener)init
{
  RPNWListener *v2;
  NSMutableArray *v3;
  NSMutableArray *peerDevices;
  NSMutableArray *v5;
  NSMutableArray *listenerNotifications;
  RPNWListener *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RPNWListener;
  v2 = -[RPNWListener init](&v9, "init");
  if (v2)
  {
    if (dword_1001306B8 <= 30
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
    {
      LogPrintF(&dword_1001306B8, "-[RPNWListener init]", 30, "Initializing RPNWListener\n");
    }
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peerDevices = v2->_peerDevices;
    v2->_peerDevices = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    listenerNotifications = v2->_listenerNotifications;
    v2->_listenerNotifications = v5;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RPNWListener;
  -[RPNWListener dealloc](&v2, "dealloc");
}

- (id)description
{
  id v3;
  NSDate *ageOutTimeout;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("RPNWListener[%@]=%@ : "), self->_applicationService, self->_mappingID);
  ageOutTimeout = self->_ageOutTimeout;
  if (ageOutTimeout)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[NSDate timeIntervalSinceDate:](ageOutTimeout, "timeIntervalSinceDate:", v5);
    v7 = v6;

    objc_msgSend(v3, "appendFormat:", CFSTR("ageOut=%.0fs "), v7);
  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("ageOut=N/A "));
  }
  v8 = objc_loadWeakRetained((id *)&self->_agentClient);
  v9 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v9, "appendFormat:", CFSTR("%p"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("agentClient=%@ { "), v9);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_peerDevices;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14), "name"));
        objc_msgSend(v3, "appendFormat:", CFSTR("'%@' "), v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (id)longDescription
{
  id v3;
  void *v4;
  NSMutableArray *incomingConnections;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener description](self, "description"));
  objc_msgSend(v3, "appendString:", v4);

  incomingConnections = self->_incomingConnections;
  if (incomingConnections && -[NSMutableArray count](incomingConnections, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("  Incoming Connections:\n"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_incomingConnections;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "appendFormat:", CFSTR("   + %@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v3;
}

+ (void)removeListenerForApplicationService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FC8, "objectForKeyedSubscript:", v3));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingConnections", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "sendStatusUpdate:", 2);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend((id)qword_100131FC8, "removeObjectForKey:", v3);
}

+ (id)addDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  RPNWListener *v11;
  RPNWListener *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, void *, _QWORD);

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (dword_1001306B8 <= 30 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    LogPrintF(&dword_1001306B8, "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]", 30, "addDeviceToApplicationServiceMapping appSvc='%@' device='%@'\n", v7, v10);

  }
  if (v7)
  {
    v11 = (RPNWListener *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FC8, "objectForKeyedSubscript:", v7));
    if (v11)
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener agentClient](v11, "agentClient"));

      if (v13)
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener agentClient](v12, "agentClient"));
      else
        -[RPNWListener setPid:](v12, "setPid:", 0);
    }
    else
    {
      v12 = objc_alloc_init(RPNWListener);
      objc_msgSend((id)qword_100131FC8, "setObject:forKeyedSubscript:", v12, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      -[RPNWListener setMappingID:](v12, "setMappingID:", v14);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:](RPNWAgentClient, "findListenerAgentClientFromApplicationServiceName:", v7));
      if (v13)
      {
        -[RPNWListener setAgentClient:](v12, "setAgentClient:", v13);
        -[RPNWListener setPid:](v12, "setPid:", objc_msgSend(v13, "pid"));
      }
      else
      {
        +[RPNWListener startListenerMappingTimeout:](RPNWListener, "startListenerMappingTimeout:", v7);
      }
      if (dword_1001306B8 <= 30
        && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
      {
        LogPrintF(&dword_1001306B8, "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]", 30, "Created new listener %@\n", v12);
      }
    }
    -[RPNWListener setApplicationService:](v12, "setApplicationService:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener peerDevices](v12, "peerDevices"));
    objc_msgSend(v15, "addObject:", v8);

    if (v9)
    {
      if (v13)
      {
        if (dword_1001306B8 <= 30
          && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
        {
          LogPrintF(&dword_1001306B8, "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]", 30, "agentClient already created, notifying client\n");
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener mappingID](v12, "mappingID"));
        v9[2](v9, v16, 0);
      }
      else
      {
        if (dword_1001306B8 <= 30
          && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
        {
          LogPrintF(&dword_1001306B8, "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]", 30, "No agentClient created, saving client\n");
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWListener listenerNotifications](v12, "listenerNotifications"));
        v17 = objc_retainBlock(v9);
        objc_msgSend(v16, "addObject:", v17);

      }
    }

  }
  else
  {
    if (dword_1001306B8 <= 90
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 90)))
    {
      LogPrintF(&dword_1001306B8, "+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]", 90, "Invalid appSvc, could not add mapping");
    }
    v12 = 0;
  }

  return v12;
}

+ (void)queryDeviceToApplicationServiceMapping:(id)a3 device:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (dword_1001306B8 <= 30 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    LogPrintF(&dword_1001306B8, "+[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]", 30, "queryDeviceToApplicationServiceMapping appSvc='%@' device='%@'\n", v7, v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FC8, "objectForKeyedSubscript:", v7));
  v12 = v11;
  if (v11
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "agentClient")), v13, v13))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerDevices"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v19, "isEqualToDevice:", v8))
          {
            if (dword_1001306B8 <= 30
              && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
            {
              LogPrintF(&dword_1001306B8, "+[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]", 30, "Found matching device '%@'\n", v19);
            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mappingID"));
            v9[2](v9, v20, 0);

            goto LABEL_31;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v16)
          continue;
        break;
      }
    }

    if (dword_1001306B8 <= 30
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
    {
      LogPrintF(&dword_1001306B8, "+[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]", 30, "No matching device\n");
    }
  }
  else if (dword_1001306B8 <= 30
         && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
  {
    LogPrintF(&dword_1001306B8, "+[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]", 30, "No listener for this application service\n");
  }
  v9[2](v9, 0, 0);
LABEL_31:

}

+ (BOOL)addListenerAgentClient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v3 = a3;
  v4 = (void *)qword_100131FC8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
  {
    if (dword_1001306B8 <= 40
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationService"));
      LogPrintF(&dword_1001306B8, "+[RPNWListener addListenerAgentClient:]", 40, "Could not find registered listener for appSvc=%@\n", v8);

    }
    goto LABEL_47;
  }
  if (dword_1001306B8 <= 40 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationService"));
    LogPrintF(&dword_1001306B8, "+[RPNWListener addListenerAgentClient:]", 40, "Found registered listener for appSvc=%@\n", v7);

  }
  if (objc_msgSend(v6, "pid"))
  {
    v9 = objc_msgSend(v6, "pid");
    if (v9 != objc_msgSend(v3, "pid"))
    {
      if (dword_1001306B8 <= 40
        && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
      {
        LogPrintF(&dword_1001306B8, "+[RPNWListener addListenerAgentClient:]", 40, "Agent client PID (was %d, now %d) has changed, removing stale listener\n", objc_msgSend(v6, "pid"), objc_msgSend(v3, "pid"));
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationService"));
      +[RPNWListener removeListenerForApplicationService:](RPNWListener, "removeListenerForApplicationService:", v28);

LABEL_47:
      v27 = 0;
      goto LABEL_48;
    }
  }
  if (dword_1001306B8 <= 30 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
  {
    v10 = v3;
    v11 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v11, "appendFormat:", CFSTR("%p"), v10);

    LogPrintF(&dword_1001306B8, "+[RPNWListener addListenerAgentClient:]", 30, "Adding RPNWAgentClient[%@] to %@\n", v11, v6);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ageOutListenerTimer"));

  if (v12)
  {
    if (dword_1001306B8 <= 40
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
    {
      LogPrintF(&dword_1001306B8, "+[RPNWListener addListenerAgentClient:]", 40, "Canceling listener age out timer for listener");
    }
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ageOutListenerTimer"));
    dispatch_source_cancel(v13);

    objc_msgSend(v6, "setAgeOutTimeout:", 0);
    objc_msgSend(v6, "setAgeOutListenerTimer:", 0);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incomingConnections"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "sendStatusUpdate:", 3);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v16);
  }

  objc_msgSend(v6, "setAgentClient:", v3);
  objc_msgSend(v6, "setPid:", objc_msgSend(v3, "pid"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "listenerNotifications"));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
        if (dword_1001306B8 <= 30
          && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
        {
          LogPrintF(&dword_1001306B8, "+[RPNWListener addListenerAgentClient:]", 30, "Listener already registered, notifying client\n");
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mappingID"));
        (*(void (**)(uint64_t, void *, _QWORD))(v24 + 16))(v24, v25, 0);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v21);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "listenerNotifications"));
  objc_msgSend(v26, "removeAllObjects");

  v27 = 1;
LABEL_48:

  return v27;
}

+ (void)startListenerMappingTimeout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_source_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD handler[4];
  id v16;
  id v17;

  v4 = a3;
  if (dword_1001306B8 <= 40 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
    LogPrintF(&dword_1001306B8, "+[RPNWListener startListenerMappingTimeout:]", 40, "Starting age-out timer for listener=%@\n", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FC8, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setAgentClient:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 180.0));
    objc_msgSend(v6, "setAgeOutTimeout:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](RPNWNetworkAgent, "sharedNetworkAgent"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dispatchQueue"));
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);
    objc_msgSend(v6, "setAgeOutListenerTimer:", v10);

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ageOutListenerTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100042BC0;
    handler[3] = &unk_100111928;
    v12 = v6;
    v16 = v12;
    v17 = v4;
    dispatch_source_set_event_handler(v11, handler);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ageOutListenerTimer"));
    CUDispatchTimerSet(v13, 180.0, -1.0, 1.0);

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ageOutListenerTimer"));
    dispatch_activate(v14);

  }
}

+ (id)findListenerForID:(id)a3 applicationService:(id)a4 fromPeer:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (dword_1001306B8 <= 30 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](RPNWNetworkAgent, "getLogInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForID:applicationService:fromPeer:]", 30, "%@ Finding listener agent client for listener ID=%@, appSvc=%@, peer=%@\n", v10, v7, v8, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FC8, "objectForKeyedSubscript:", v8));
  v13 = v12;
  if (!v12)
  {
    if (dword_1001306B8 <= 30
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
    {
      LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForID:applicationService:fromPeer:]", 30, "Found no matching appSvc\n");
    }
LABEL_36:
    v21 = 0;
    goto LABEL_43;
  }
  if (!objc_msgSend(v12, "automapped"))
  {
    if (dword_1001306B8 <= 30
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
    {
      LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForID:applicationService:fromPeer:]", 30, "Found listener=%@\n", v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mappingID"));
    v15 = objc_msgSend(v14, "isEqual:", v7);

    if ((v15 & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peerDevices"));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v16);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "isEqualToDevice:", v9) & 1) != 0)
            {

              goto LABEL_38;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v18)
            continue;
          break;
        }
      }

      if (dword_1001306B8 <= 30
        && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
      {
        LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForID:applicationService:fromPeer:]", 30, "Failed to find authorized peer in set\n");
      }
    }
    else if (dword_1001306B8 <= 30
           && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
    {
      LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForID:applicationService:fromPeer:]", 30, "Mismatching mapping ID\n");
    }
    goto LABEL_36;
  }
  if (dword_1001306B8 <= 30)
  {
    if (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30))
      LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForID:applicationService:fromPeer:]", 30, "Listener is automapped, bypassing mapping ID and peer validation\n");
LABEL_38:
    if (dword_1001306B8 <= 30
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
    {
      LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForID:applicationService:fromPeer:]", 30, "Found listener for peer %@\n", v9);
    }
  }
  v21 = v13;
LABEL_43:

  return v21;
}

+ (id)findListenerForAgentClient:(id)a3 sender:(id)a4 browseRequest:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v17 = a5;
  v6 = a3;
  v7 = a4;
  if (dword_1001306B8 <= 30 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
    LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForAgentClient:sender:browseRequest:]", 30, "Finding listener mapping for agent client=%@\n", v6);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)qword_100131FC8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FC8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i)));
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "agentClient"));

        if (v14 == v6)
        {
          if (dword_1001306B8 <= 30
            && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 30)))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mappingID"));
            LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForAgentClient:sender:browseRequest:]", 30, "Found listener mapping=%@\n", v15);

          }
          goto LABEL_31;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (dword_1001306B8 <= 90 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 90)))
    LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForAgentClient:sender:browseRequest:]", 90, "Failed to find listener mapping for agent client\n");
  if (v7 && (byte_100131FD0 || v17))
  {
    if (dword_1001306B8 <= 40
      && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
    {
      LogPrintF(&dword_1001306B8, "+[RPNWListener findListenerForAgentClient:sender:browseRequest:]", 40, "Auto-mapping agent client\n");
    }
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationService"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWListener addDeviceToApplicationServiceMapping:device:completion:](RPNWListener, "addDeviceToApplicationServiceMapping:device:completion:", v8, v7, 0));
LABEL_31:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)addIncomingConnection:(id)a3
{
  id v4;
  NSMutableArray *incomingConnections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  incomingConnections = self->_incomingConnections;
  v8 = v4;
  if (!incomingConnections)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_incomingConnections;
    self->_incomingConnections = v6;

    v4 = v8;
    incomingConnections = self->_incomingConnections;
  }
  -[NSMutableArray addObject:](incomingConnections, "addObject:", v4);

}

- (id)getConnectionWithID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_incomingConnections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectionUUID", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)markConnectionAsTriggered:(id)a3
{
  id v4;
  NSMutableArray *triggeredConnection;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  RPNWConnection *v15;
  RPNWListener *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  triggeredConnection = self->_incomingConnections;
  v6 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](triggeredConnection, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v16 = self;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      v11 = &v7[(_QWORD)v8];
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(triggeredConnection);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10), "connectionUUID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectionUUID"));
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if ((v14 & 1) != 0)
        {

          if (dword_1001306B8 <= 40
            && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
          {
            LogPrintF(&dword_1001306B8, "-[RPNWListener markConnectionAsTriggered:]", 40, "Marking connection %@ triggered\n", v4);
          }
          -[NSMutableArray removeObjectAtIndex:](v16->_incomingConnections, "removeObjectAtIndex:", &v10[(_QWORD)v8]);
          v15 = (RPNWConnection *)v4;
          triggeredConnection = (NSMutableArray *)v16->_triggeredConnection;
          v16->_triggeredConnection = v15;
          goto LABEL_15;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](triggeredConnection, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

}

- (id)removeTriggeredConnection
{
  RPNWConnection *v3;
  RPNWConnection *triggeredConnection;

  if (dword_1001306B8 <= 40 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
    LogPrintF(&dword_1001306B8, "-[RPNWListener removeTriggeredConnection]", 40, "Removing triggered connection %@\n", self->_triggeredConnection);
  v3 = self->_triggeredConnection;
  triggeredConnection = self->_triggeredConnection;
  self->_triggeredConnection = 0;

  return v3;
}

+ (void)listAllowedApplicationServices:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = v3;
  if (byte_100131FD0)
    v5 = "on";
  else
    v5 = "off";
  objc_msgSend(v3, "appendFormat:", CFSTR("AutoMapping: %s\n"), v5);
  objc_msgSend(v4, "appendString:", CFSTR("Allowed Application Services\n"));
  if (objc_msgSend((id)qword_100131FC8, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (id)qword_100131FC8;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FC8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10)));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "longDescription"));
          objc_msgSend(v4, "appendFormat:", CFSTR("  %@\n"), v12);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("  <empty>\n"));
  }

}

+ (void)setAutoMapping:(BOOL)a3
{
  _BOOL4 v3;
  const char *v4;
  const char *v5;

  v3 = a3;
  if (dword_1001306B8 <= 40 && (dword_1001306B8 != -1 || _LogCategory_Initialize(&dword_1001306B8, 40)))
  {
    v4 = "off";
    if (v3)
      v5 = "on";
    else
      v5 = "off";
    if (byte_100131FD0)
      v4 = "on";
    LogPrintF(&dword_1001306B8, "+[RPNWListener setAutoMapping:]", 40, "Setting auto-mapping to %s (was %s)\n", v5, v4);
  }
  byte_100131FD0 = v3;
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
  objc_storeStrong((id *)&self->_applicationService, a3);
}

- (NSUUID)mappingID
{
  return self->_mappingID;
}

- (void)setMappingID:(id)a3
{
  objc_storeStrong((id *)&self->_mappingID, a3);
}

- (NSMutableArray)peerDevices
{
  return self->_peerDevices;
}

- (void)setPeerDevices:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevices, a3);
}

- (NSMutableArray)listenerNotifications
{
  return self->_listenerNotifications;
}

- (void)setListenerNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_listenerNotifications, a3);
}

- (NSMutableArray)incomingConnections
{
  return self->_incomingConnections;
}

- (void)setIncomingConnections:(id)a3
{
  objc_storeStrong((id *)&self->_incomingConnections, a3);
}

- (RPNWConnection)triggeredConnection
{
  return self->_triggeredConnection;
}

- (void)setTriggeredConnection:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredConnection, a3);
}

- (RPNWAgentClient)agentClient
{
  return (RPNWAgentClient *)objc_loadWeakRetained((id *)&self->_agentClient);
}

- (void)setAgentClient:(id)a3
{
  objc_storeWeak((id *)&self->_agentClient, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)ageOutTimeout
{
  return self->_ageOutTimeout;
}

- (void)setAgeOutTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_ageOutTimeout, a3);
}

- (OS_dispatch_source)ageOutListenerTimer
{
  return self->_ageOutListenerTimer;
}

- (void)setAgeOutListenerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_ageOutListenerTimer, a3);
}

- (BOOL)automapped
{
  return self->_automapped;
}

- (void)setAutomapped:(BOOL)a3
{
  self->_automapped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageOutListenerTimer, 0);
  objc_storeStrong((id *)&self->_ageOutTimeout, 0);
  objc_destroyWeak((id *)&self->_agentClient);
  objc_storeStrong((id *)&self->_triggeredConnection, 0);
  objc_storeStrong((id *)&self->_incomingConnections, 0);
  objc_storeStrong((id *)&self->_listenerNotifications, 0);
  objc_storeStrong((id *)&self->_peerDevices, 0);
  objc_storeStrong((id *)&self->_mappingID, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
}

@end

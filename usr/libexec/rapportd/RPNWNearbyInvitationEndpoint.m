@implementation RPNWNearbyInvitationEndpoint

+ (void)initialize
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_opt_self(RPNWNearbyInvitationEndpoint, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)qword_100132068;
    qword_100132068 = (uint64_t)v5;

  }
}

- (RPNWNearbyInvitationEndpoint)init
{
  RPNWNearbyInvitationEndpoint *v2;
  RPNWNearbyInvitationEndpoint *v3;
  RPNWNearbyInvitationEndpoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNWNearbyInvitationEndpoint;
  v2 = -[RPNWNearbyInvitationEndpoint init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (RPNWNearbyInvitationEndpoint)initWithDevice:(id)a3 applicationService:(id)a4 endpointID:(id)a5 discoverySessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RPNWNearbyInvitationEndpoint *v14;
  RPNWNearbyInvitationEndpoint *v15;
  id v16;
  RPNWNearbyInvitationEndpoint *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RPNWNearbyInvitationEndpoint;
  v14 = -[RPNWNearbyInvitationEndpoint init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    -[RPNWNearbyInvitationEndpoint setDevice:](v14, "setDevice:", v10);
    -[RPNWNearbyInvitationEndpoint setApplicationService:](v15, "setApplicationService:", v11);
    -[RPNWNearbyInvitationEndpoint setEndpointUUID:](v15, "setEndpointUUID:", v12);
    v16 = objc_alloc_init((Class)NSMutableArray);
    -[RPNWNearbyInvitationEndpoint setSessions:](v15, "setSessions:", v16);

    if (v13)
    {
      -[RPNWNearbyInvitationEndpoint addSession:](v15, "addSession:", v13);
      -[RPNWNearbyInvitationEndpoint setBrowseSession:](v15, "setBrowseSession:", 1);
    }
    v17 = v15;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RPNWNearbyInvitationEndpoint;
  -[RPNWNearbyInvitationEndpoint dealloc](&v2, "dealloc");
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("RPNWNearbyInvitationEndpoint[%@:%@] '%@'"), self->_applicationService, self->_endpointUUID, self->_device);
  return v3;
}

- (void)addSession:(id)a3
{
  -[NSMutableArray addObject:](self->_sessions, "addObject:", a3);
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

- (BOOL)removeDiscoverySession:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  BOOL v11;
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
  v5 = self->_sessions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "isEqual:", v4, (_QWORD)v13) & 1) != 0)
        {
          -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v10);

          -[NSMutableArray count](self->_sessions, "count");
          v11 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = 0;
LABEL_11:

  return v11;
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
  v5 = (id)qword_100132068;
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132068, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9)));
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

+ (void)removeDiscoverySessionFromAllEndpoints:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[128];

  v3 = a3;
  if (dword_100130BD8 <= 30 && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 30)))
    LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint removeDiscoverySessionFromAllEndpoints:]", 30, "Removing endpoints for session '%@'", v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132068, "allKeys"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132068, "objectForKeyedSubscript:", v9));
        if (objc_msgSend(v10, "removeDiscoverySession:", v3))
        {
          v11 = (void *)qword_100132068;
          v17 = v9;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
          objc_msgSend(v11, "removeObjectsForKeys:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }

}

+ (BOOL)addEndpointMapping:(id)a3 endpointID:(id)a4 applicationService:(id)a5 discoverySessionID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t *v13;
  RPNWNearbyInvitationEndpoint *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  uint64_t *v21;
  RPNWNearbyInvitationEndpoint *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (dword_100130BD8 <= 30 && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 30)))
    LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:]", 30, "Adding endpoint mapping [%@:%@] for device '%@' and session '%@'\n", v11, v10, v9, v12);
  v30 = v12;
  v31 = v11;
  v32 = v10;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = &qword_100132000;
  v14 = (RPNWNearbyInvitationEndpoint *)(id)qword_100132068;
  v15 = -[RPNWNearbyInvitationEndpoint countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v13[13], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i)));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "device"));
        if ((objc_msgSend(v20, "isEqualToDevice:", v9) & 1) != 0)
        {
          v21 = v13;
          v22 = v14;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endpointUUID"));
          v24 = objc_msgSend(v23, "isEqual:", v32);

          v14 = v22;
          v13 = v21;

          if (v24)
          {
            if (dword_100130BD8 <= 40
              && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 40)))
            {
              LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:]", 40, "Found existing endpoint '%@'\n", v9);
            }
            v25 = v31;
            v26 = v32;
            v27 = v30;
            if (v30 && (objc_msgSend(v19, "seenBySession:", v30) & 1) == 0)
            {
              objc_msgSend(v19, "addSession:", v30);
              v28 = 1;
            }
            else
            {
              v28 = 0;
            }

            goto LABEL_30;
          }
        }
        else
        {

        }
      }
      v16 = -[RPNWNearbyInvitationEndpoint countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v16)
        continue;
      break;
    }
  }

  v25 = v31;
  v26 = v32;
  v27 = v30;
  v14 = -[RPNWNearbyInvitationEndpoint initWithDevice:applicationService:endpointID:discoverySessionID:]([RPNWNearbyInvitationEndpoint alloc], "initWithDevice:applicationService:endpointID:discoverySessionID:", v9, v31, v32, v30);
  if (dword_100130BD8 <= 40 && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 40)))
    LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:]", 40, "Found no existing endpoint, created new endpoint '%@'\n", v14);
  objc_msgSend((id)v13[13], "setObject:forKeyedSubscript:", v14, v32);
  v28 = 1;
LABEL_30:

  return v28;
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
  if (dword_100130BD8 <= 30 && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 30)))
    LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint updateEndpointMapping:discoverySessionID:]", 30, "Updating endpoint for device '%@'", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)qword_100132068;
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
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132068, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i)));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "device"));
        if (objc_msgSend(v13, "isEqualToDevice:", v5))
        {
          v14 = objc_msgSend(v12, "seenBySession:", v6);

          if (v14)
          {
            if (dword_100130BD8 <= 40
              && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 40)))
            {
              LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint updateEndpointMapping:discoverySessionID:]", 40, "Found existing endpoint to update '%@'\n", v12);
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

+ (BOOL)removeEndpointMapping:(id)a3 discoverySessionID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = a4;
  if (dword_100130BD8 <= 30 && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 30)))
    LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint removeEndpointMapping:discoverySessionID:]", 30, "Removing endpoint '%@' for device '%@'", a1, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = (id)qword_100132068;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v20 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132068, "objectForKeyedSubscript:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "device"));
        if (objc_msgSend(v15, "isEqualToDevice:", v6))
        {
          v16 = objc_msgSend(v14, "seenBySession:", v7);

          if (v16)
          {
            if (objc_msgSend(v14, "removeDiscoverySession:", v7))
            {
              objc_msgSend(v19, "addObject:", v13);
              v20 = 1;
            }
            else
            {
              v20 = 0;
            }
          }
        }
        else
        {

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 = v17;
    }
    while (v17);
  }
  else
  {
    v20 = 0;
  }

  objc_msgSend((id)qword_100132068, "removeObjectsForKeys:", v19);
  return v20 & 1;
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
  v4 = (id)qword_100132068;
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132068, "objectForKeyedSubscript:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "device"));
        v12 = objc_msgSend(v11, "isEqualToDevice:", v3);

        if (v12)
          objc_msgSend(v13, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend((id)qword_100132068, "removeObjectsForKeys:", v13);
}

+ (void)updateClientBrowseResult:(id)a3 browseResponse:(id)a4 agentUUID:(id)a5 applicationService:(id)a6 discoverySessionID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t count;
  void (**v26)(id, void *);
  id v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v27 = a3;
  v26 = (void (**)(id, void *))a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = v12;
  v15 = v13;
  v29 = (void *)nw_array_create();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)qword_100132068;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  v28 = v12;
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(obj);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132068, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i)));
        if (objc_msgSend(v21, "seenBySession:", v15))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNearbyInvitationPeer createNWEndpointForEndpoint:agentID:applicationService:](RPNWNearbyInvitationPeer, "createNWEndpointForEndpoint:agentID:applicationService:", v21, v11, v14));
          if (dword_100130BD8 <= 30
            && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 30)))
          {
            LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint updateClientBrowseResult:browseResponse:agentUUID:applicationService:discoverySessionID:]", 30, " %d -> %@", (unsigned __int16)v18++, v22);
            v14 = v28;
          }
          nw_array_append(v29, v22);

        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }

  if (dword_100130BD8 <= 30 && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 30)))
  {
    v23 = v27;
    v24 = objc_alloc_init((Class)NSMutableString);
    objc_msgSend(v24, "appendFormat:", CFSTR("%p"), v23);

    count = nw_array_get_count(v29);
    LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint updateClientBrowseResult:browseResponse:agentUUID:applicationService:discoverySessionID:]", 30, "Updated browse client [%@] with %zu endpoints", v24, count);

  }
  v26[2](v26, v29);

}

+ (id)findEndpoint:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (dword_100130BD8 <= 30 && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 30)))
    LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint findEndpoint:]", 30, "Searching for endpoint with UUID='%@'", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100132068, "objectForKeyedSubscript:", v3));
  if (v4)
  {
    if (dword_100130BD8 <= 30
      && (dword_100130BD8 != -1 || _LogCategory_Initialize(&dword_100130BD8, 30)))
    {
      LogPrintF(&dword_100130BD8, "+[RPNWNearbyInvitationEndpoint findEndpoint:]", 30, "Found endpoint '%@'", v4);
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
  if (objc_msgSend((id)qword_100132068, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)qword_100132068;
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
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4[13], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v7)));
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

- (RPNearbyInvitationDevice)device
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

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

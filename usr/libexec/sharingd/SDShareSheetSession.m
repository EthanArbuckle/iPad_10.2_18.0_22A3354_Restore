@implementation SDShareSheetSession

- (SDShareSheetSession)initWithSessionID:(id)a3 xpcConnection:(id)a4 instantShareSheet:(BOOL)a5 remoteShareSheet:(BOOL)a6 xrRenderingMode:(unint64_t)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  SDShareSheetSession *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  NSObject *v22;
  NSMutableArray *v23;
  NSArray *airDropNodes;
  NSMutableArray *v25;
  NSArray *peopleNodes;
  NSMutableDictionary *v27;
  NSMutableDictionary *realNameToNodeID;
  NSMutableDictionary *v29;
  NSMutableDictionary *shareActivityToID;
  NSMutableDictionary *v31;
  NSMutableDictionary *actionActivityToID;
  uint64_t v33;
  NSMutableDictionary *sharedItemsMap;
  uint64_t v35;
  NSMutableDictionary *sharedItemsRequestIDToPreviewPhoto;
  NSMutableOrderedSet *v37;
  NSMutableOrderedSet *cachedSharedItems;
  NSOperationQueue *v39;
  NSOperationQueue *operationQueue;
  uint64_t v41;
  NSMutableDictionary *transferNodes;
  uint64_t v43;
  NSMutableArray *activeSecurityContexts;
  SDPeopleBrowser *v45;
  SDPeopleBrowser *peopleBrowser;
  void *v47;
  void *v48;
  SDShareSheetAirDropController *v49;
  void *v50;
  SDShareSheetAirDropController *v51;
  SDShareSheetAirDropController *airDropController;
  SDShareSheetProxyLoaderManager *v53;
  void *v54;
  SDShareSheetProxyLoaderManager *v55;
  SDScreenTimeMonitor *v56;
  SDScreenTimeMonitor *v57;
  SDScreenTimeMonitor *screenTimeMonitor;
  _QWORD v60[4];
  id v61;
  id v62;
  id location;
  objc_super v64;
  uint64_t v65;
  void *v66;
  uint8_t buf[8];

  v9 = a5;
  v13 = a3;
  v14 = a4;
  v64.receiver = self;
  v64.super_class = (Class)SDShareSheetSession;
  v15 = -[SDShareSheetSession init](&v64, "init");
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
    objc_sync_enter(v16);
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v15->__connection, a4);
    if (v9)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForEntitlement:", CFSTR("com.apple.sharesheet.allow-custom-view")));
      if (v18
        && (v19 = objc_opt_class(NSNumber, v17), (objc_opt_isKindOfClass(v18, v19) & 1) != 0)
        && (objc_msgSend(v18, "BOOLValue") & 1) != 0)
      {
        v20 = 1;
      }
      else
      {
        v21 = share_sheet_log();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          sub_10016091C(buf, (int)objc_msgSend(v14, "processIdentifier"), v22);

        v20 = 0;
      }
      v15->_instantShareSheet = v20;

    }
    v15->_remoteShareSheet = a6;
    v23 = objc_opt_new(NSMutableArray);
    airDropNodes = v15->_airDropNodes;
    v15->_airDropNodes = &v23->super;

    v25 = objc_opt_new(NSMutableArray);
    peopleNodes = v15->_peopleNodes;
    v15->_peopleNodes = &v25->super;

    v27 = objc_opt_new(NSMutableDictionary);
    realNameToNodeID = v15->_realNameToNodeID;
    v15->_realNameToNodeID = v27;

    v29 = objc_opt_new(NSMutableDictionary);
    shareActivityToID = v15->_shareActivityToID;
    v15->_shareActivityToID = v29;

    v31 = objc_opt_new(NSMutableDictionary);
    actionActivityToID = v15->_actionActivityToID;
    v15->_actionActivityToID = v31;

    v15->_attachmentCount = 0;
    v15->_sharedItemsCount = 0;
    v33 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sharedItemsMap = v15->_sharedItemsMap;
    v15->_sharedItemsMap = (NSMutableDictionary *)v33;

    v35 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sharedItemsRequestIDToPreviewPhoto = v15->_sharedItemsRequestIDToPreviewPhoto;
    v15->_sharedItemsRequestIDToPreviewPhoto = (NSMutableDictionary *)v35;

    v37 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    cachedSharedItems = v15->_cachedSharedItems;
    v15->_cachedSharedItems = v37;

    v39 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v15->_operationQueue;
    v15->_operationQueue = v39;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v15->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v41 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    transferNodes = v15->_transferNodes;
    v15->_transferNodes = (NSMutableDictionary *)v41;

    v43 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    activeSecurityContexts = v15->_activeSecurityContexts;
    v15->_activeSecurityContexts = (NSMutableArray *)v43;

    v15->_xrRenderingMode = a7;
    v45 = objc_alloc_init(SDPeopleBrowser);
    peopleBrowser = v15->_peopleBrowser;
    v15->_peopleBrowser = v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sd_connectionBundleID"));
    -[SDPeopleBrowser setBundleID:](v15->_peopleBrowser, "setBundleID:", v47);

    if (SFDeviceSupportsRapportOnlyAirDropDiscovery(-[SDPeopleBrowser setSessionID:](v15->_peopleBrowser, "setSessionID:", v13)))
    {
      v65 = kSFBrowserOptionsDelayBonjourUntilTransferKey;
      v66 = &__kCFBooleanTrue;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
      -[SDPeopleBrowser setOptions:](v15->_peopleBrowser, "setOptions:", v48);

    }
    if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled"))
    {
      v49 = [SDShareSheetAirDropController alloc];
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_queue"));
      v51 = -[SDShareSheetAirDropController initWithSessionID:queue:](v49, "initWithSessionID:queue:", v13, v50);
      airDropController = v15->_airDropController;
      v15->_airDropController = v51;

      -[SDShareSheetAirDropController setDelegate:](v15->_airDropController, "setDelegate:", v15);
    }
    v53 = [SDShareSheetProxyLoaderManager alloc];
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession sessionID](v15, "sessionID"));
    v55 = -[SDShareSheetProxyLoaderManager initWithSessionIdentifier:](v53, "initWithSessionIdentifier:", v54);

    -[SDShareSheetProxyLoaderManager setDelegate:](v55, "setDelegate:", v15);
    -[SDShareSheetSession setProxyLoaderManager:](v15, "setProxyLoaderManager:", v55);
    location = 0;
    objc_initWeak(&location, v15);
    v56 = [SDScreenTimeMonitor alloc];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1001459E0;
    v60[3] = &unk_1007188A0;
    objc_copyWeak(&v62, &location);
    v61 = v14;
    v57 = -[SDScreenTimeMonitor initWithPoliciesChangedHandler:](v56, "initWithPoliciesChangedHandler:", v60);
    screenTimeMonitor = v15->_screenTimeMonitor;
    v15->_screenTimeMonitor = v57;

    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);

    objc_sync_exit(v16);
  }

  return v15;
}

- (unint64_t)airDropNearbyCount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "availableNodes"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleBrowser](self, "peopleBrowser"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "people"));
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "count");

  return (unint64_t)v6;
}

- (void)activate
{
  void *v3;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v3);
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    -[SDShareSheetSession addStatusMonitorObservers](self, "addStatusMonitorObservers");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100145C44;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  objc_sync_exit(v3);

}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v3);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    -[SDShareSheetSession removeStatusMonitorObservers](self, "removeStatusMonitorObservers");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleBrowser](self, "peopleBrowser"));
    objc_msgSend(v4, "setDiffableDelegate:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleBrowser](self, "peopleBrowser"));
    -[SDShareSheetSession setPeopleBrowser:](self, "setPeopleBrowser:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));
    objc_msgSend(v6, "invalidate");

    -[SDShareSheetSession setAirDropController:](self, "setAirDropController:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession screenTimeMonitor](self, "screenTimeMonitor"));
    objc_msgSend(v7, "invalidate");

    -[SDShareSheetSession setScreenTimeMonitor:](self, "setScreenTimeMonitor:", 0);
    -[SDShareSheetSession setDisabledNodesUpdatedHandler:](self, "setDisabledNodesUpdatedHandler:", 0);
    -[SDShareSheetSession setProxyLoaderManager:](self, "setProxyLoaderManager:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession xpcHelperCnx](self, "xpcHelperCnx"));
    objc_msgSend(v8, "invalidate");

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100145EA4;
    block[3] = &unk_1007146D8;
    v11 = v5;
    v9 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  objc_sync_exit(v3);

}

- (void)setAirDropAllowed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  SDShareSheetAirDropController *v6;
  void *v7;
  void *v8;
  void *v9;
  SDShareSheetAirDropController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;

  v3 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  if (self->_airDropAllowed != v3)
  {
    self->_airDropAllowed = v3;
    if (v3
      && +[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));

      if (!v5)
      {
        v6 = [SDShareSheetAirDropController alloc];
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession sessionID](self, "sessionID"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession connection](self, "connection"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_queue"));
        v10 = -[SDShareSheetAirDropController initWithSessionID:queue:](v6, "initWithSessionID:queue:", v7, v9);
        -[SDShareSheetSession setAirDropController:](self, "setAirDropController:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));
        objc_msgSend(v11, "setDelegate:", self);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession xpcHelperCnx](self, "xpcHelperCnx"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));
        objc_msgSend(v13, "setHelperConnection:", v12);

        if (self->_activateCalled)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostAppBundleID](self, "hostAppBundleID"));
          objc_msgSend(v14, "activateWithBundleID:", v15);

        }
      }
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));
      objc_msgSend(v16, "invalidate");

      -[SDShareSheetSession setAirDropController:](self, "setAirDropController:", 0);
    }
  }
  objc_sync_exit(obj);

}

- (BOOL)skipSlotsRendering
{
  if (-[SDShareSheetSession instantShareSheet](self, "instantShareSheet"))
    return 1;
  else
    return -[SDShareSheetSession remoteShareSheet](self, "remoteShareSheet");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession sessionID](self, "sessionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostAppBundleID](self, "hostAppBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<SDShareSheetSession: %p, sessionID: %@, hostAppBundleID: %@, airdropAllowed: %i>"), self, v3, v4, -[SDShareSheetSession airDropAllowed](self, "airDropAllowed")));

  return (NSString *)v5;
}

- (id)connection
{
  void *v3;
  NSXPCConnection *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v3);
  v4 = self->__connection;
  objc_sync_exit(v3);

  return v4;
}

- (id)uiServiceConnection
{
  void *v3;
  NSXPCConnection *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v3);
  v4 = self->__uiServiceConnection;
  objc_sync_exit(v3);

  return v4;
}

- (void)setUiServiceConnection:(id)a3
{
  NSXPCConnection *v4;
  NSXPCConnection *uiServiceConnection;
  id obj;

  v4 = (NSXPCConnection *)a3;
  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  uiServiceConnection = self->__uiServiceConnection;
  self->__uiServiceConnection = v4;

  objc_sync_exit(obj);
}

- (void)_activateSecurityContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v4);
  if ((-[NSMutableArray containsObject:](self->_activeSecurityContexts, "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(v5, "activate");
    -[NSMutableArray addObject:](self->_activeSecurityContexts, "addObject:", v5);
  }
  objc_sync_exit(v4);

}

- (void)_deactivateSecurityContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v4);
  if (-[NSMutableArray containsObject:](self->_activeSecurityContexts, "containsObject:", v5))
  {
    objc_msgSend(v5, "deactivate");
    -[NSMutableArray removeObject:](self->_activeSecurityContexts, "removeObject:", v5);
  }
  objc_sync_exit(v4);

}

- (id)airdropNodeForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropPeople](self, "airDropPeople"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession suggestedPeople](self, "suggestedPeople"));
  v7 = v6;
  if (v5)
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6));
  else
    v8 = v6;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nodeIdentifier", (_QWORD)v17));
        v15 = objc_msgSend(v14, "isEqual:", v4);

        if (v15)
        {
          v10 = v13;
          goto LABEL_14;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

  return v10;
}

- (void)addStatusMonitorObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "systemRestrictionsChanged:", CFSTR("com.apple.sharingd.AirDropAllowedChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "systemRestrictionsChanged:", CFSTR("com.apple.sharingd.BlacklistedAppsChanged"), 0);

}

- (void)removeStatusMonitorObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)systemRestrictionsChanged:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v4);
  if (!-[SDShareSheetSession invalidateCalled](self, "invalidateCalled"))
  {
    -[SDShareSheetSession updateRestrictedActivityTypes:](self, "updateRestrictedActivityTypes:", &__NSArray0__struct);
    -[SDShareSheetSession nodesPotentiallyUpdated](self, "nodesPotentiallyUpdated");
  }
  objc_sync_exit(v4);

}

- (void)setHostShareActivityProxies:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v6);
  v7 = self->_hostShareActivityProxies;
  v8 = (NSArray *)v5;
  v14 = v8;
  if (v7 == v8)
  {

  }
  else
  {
    if ((v8 != 0) != (v7 == 0))
    {
      v9 = -[NSArray isEqual:](v7, "isEqual:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_hostShareActivityProxies, a3);
    if (!-[SDShareSheetSession sentInitialConfiguration](self, "sentInitialConfiguration"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession screenTimeMonitor](self, "screenTimeMonitor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession minimumVisibleShareActivities](self, "minimumVisibleShareActivities"));
      objc_msgSend(v10, "requestPoliciesForActivities:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession screenTimeMonitor](self, "screenTimeMonitor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession shareActivitiesInUserOrder](self, "shareActivitiesInUserOrder"));
    objc_msgSend(v12, "updateWithActivities:", v13);

    -[SDShareSheetSession _loadProxySectionWithType:](self, "_loadProxySectionWithType:", 1);
  }
LABEL_10:
  objc_sync_exit(v6);

}

- (void)setHostActionActivityProxies:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  unsigned __int8 v9;
  NSArray *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v6);
  v7 = self->_hostActionActivityProxies;
  v8 = (NSArray *)v5;
  v10 = v8;
  if (v7 == v8)
  {

  }
  else
  {
    if ((v8 != 0) != (v7 == 0))
    {
      v9 = -[NSArray isEqual:](v7, "isEqual:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_hostActionActivityProxies, a3);
    -[SDShareSheetSession _loadProxySectionWithType:](self, "_loadProxySectionWithType:", 2);
  }
LABEL_8:
  objc_sync_exit(v6);

}

- (void)setSuggestedPeople:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  unsigned __int8 v9;
  NSArray *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v6);
  v7 = self->_suggestedPeople;
  v8 = (NSArray *)v5;
  v10 = v8;
  if (v7 == v8)
  {

  }
  else
  {
    if ((v8 != 0) != (v7 == 0))
    {
      v9 = -[NSArray isEqual:](v7, "isEqual:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_suggestedPeople, a3);
    -[SDShareSheetSession checkPolicyForSuggestedPeople](self, "checkPolicyForSuggestedPeople");
  }
LABEL_8:
  objc_sync_exit(v6);

}

- (void)setPeopleNodes:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  unsigned __int8 v9;
  NSArray *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v6);
  v7 = self->_peopleNodes;
  v8 = (NSArray *)v5;
  v10 = v8;
  if (v7 == v8)
  {

  }
  else
  {
    if ((v8 != 0) != (v7 == 0))
    {
      v9 = -[NSArray isEqual:](v7, "isEqual:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_peopleNodes, a3);
    -[SDShareSheetSession checkPolicyForSuggestedPeople](self, "checkPolicyForSuggestedPeople");
    -[SDShareSheetSession _loadProxySectionWithType:](self, "_loadProxySectionWithType:", 0);
  }
LABEL_8:
  objc_sync_exit(v6);

}

- (void)setAirDropNodes:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  unsigned __int8 v9;
  NSArray *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v6);
  v7 = self->_airDropNodes;
  v8 = (NSArray *)v5;
  v10 = v8;
  if (v7 == v8)
  {

  }
  else
  {
    if ((v8 != 0) != (v7 == 0))
    {
      v9 = -[NSArray isEqual:](v7, "isEqual:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_airDropNodes, a3);
    -[SDShareSheetSession checkPolicyForAirDropPeople](self, "checkPolicyForAirDropPeople");
  }
LABEL_8:
  objc_sync_exit(v6);

}

- (void)nodesPotentiallyUpdated
{
  void *v3;
  void (**v4)(void);
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession disabledNodesUpdatedHandler](self, "disabledNodesUpdatedHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDShareSheetSession disabledNodesUpdatedHandler](self, "disabledNodesUpdatedHandler"));
    v4[2]();

  }
  objc_sync_exit(obj);

}

- (void)updateRestrictedActivityTypes:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  unsigned int v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  unsigned int v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  id v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v30 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  v3 = share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v30;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "update restricted activity types:%@", buf, 0xCu);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostShareActivityProxies](self, "hostShareActivityProxies"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v34;
    v31 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v31);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activity"));
        if (!v10)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetSlotManager.m"), 636, CFSTR("activity is nil for proxy:%@"), v9);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
        v12 = UIActivityTypeMail;
        v13 = v11;
        if (v12 == v13)
        {

LABEL_15:
          v14 = (NSString *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString effectiveBlockedAppBundleIDs](v14, "effectiveBlockedAppBundleIDs"));
          objc_msgSend(v9, "setIsRestricted:", -[NSString containsObject:](v12, "containsObject:", CFSTR("com.apple.mobilemail")));
LABEL_17:

          goto LABEL_18;
        }
        v14 = v13;
        if ((UIActivityTypeMail == 0) == (v13 != 0))
        {

          goto LABEL_17;
        }
        v15 = -[NSString isEqual:](v12, "isEqual:", v13);

        if (v15)
          goto LABEL_15;
LABEL_18:
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
        v17 = UIActivityTypeAirDrop;
        v18 = v16;
        if (v17 == v18)
        {

LABEL_23:
          objc_msgSend(v9, "setIsRestricted:", -[SDShareSheetSession airDropAllowed](self, "airDropAllowed") ^ 1);
          goto LABEL_26;
        }
        v19 = v18;
        if ((UIActivityTypeAirDrop == 0) != (v18 != 0))
        {
          v20 = -[NSString isEqual:](v17, "isEqual:", v18);

          if (v20)
            goto LABEL_23;
        }
        else
        {

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
        v22 = objc_msgSend(v30, "containsObject:", v21);

        objc_msgSend(v9, "setIsDisabled:", v22);
LABEL_26:
        v23 = share_sheet_log();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityUUID"));
          *(_DWORD *)buf = 138412802;
          v38 = v25;
          v39 = 2112;
          v40 = v26;
          v41 = 2112;
          v42 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "updating policy for %@/%@, proxy: %@", buf, 0x20u);

        }
      }
      v5 = v31;
      v6 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v6);
  }

  -[SDShareSheetSession checkPolicyForSuggestedPeople](self, "checkPolicyForSuggestedPeople");
  -[SDShareSheetSession checkPolicyForAirDropPeople](self, "checkPolicyForAirDropPeople");
  objc_sync_exit(obj);

}

- (void)checkPolicyForSuggestedPeople
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id obj;
  _QWORD v9[5];
  _QWORD v10[5];

  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession suggestedPeople](self, "suggestedPeople"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001471E8;
  v10[3] = &unk_1007188C8;
  v10[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostConfiguration](self, "hostConfiguration"));
  v5 = objc_msgSend(v4, "requestPeopleSuggestionsData");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession suggestionBrowser](self, "suggestionBrowser"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peopleSuggestions"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100147530;
    v9[3] = &unk_1007188F0;
    v9[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
  objc_sync_exit(obj);

}

- (void)checkPolicyForAirDropPeople
{
  void *v2;
  id v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  const char *v20;
  id obj;
  id v22;
  uint64_t v23;
  id v24;
  unsigned int v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  _BYTE v42[128];
  _BYTE v43[128];

  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropPeople](self, "airDropPeople"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (v3)
  {
    v23 = *(_QWORD *)v33;
    v22 = v2;
    do
    {
      v24 = v3;
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v25 = -[SDShareSheetSession airDropAllowed](self, "airDropAllowed");
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession realNameToNodeID](self, "realNameToNodeID"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "realName"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropNodes](self, "airDropNodes"));
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
              v14 = v7;
              v15 = v13;
              if (v14 == v15)
              {

LABEL_20:
                objc_msgSend(v12, "setIsRestricted:", v25 ^ 1);
                goto LABEL_21;
              }
              v16 = v15;
              if ((v7 == 0) != (v15 != 0))
              {
                v17 = objc_msgSend(v14, "isEqual:", v15);

                if (v17)
                  goto LABEL_20;
              }
              else
              {

              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_21:

        v18 = share_sheet_log();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v20 = "yes";
          if (v25)
            v20 = "no";
          v37 = v27;
          v38 = 2112;
          v39 = v7;
          v40 = 2080;
          v41 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Updating policy for %@/%@, isDisabled: %s", buf, 0x20u);
        }

      }
      v2 = v22;
      v3 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    }
    while (v3);
  }

  objc_sync_exit(obj);
}

- (void)setHostConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_hostConfiguration, a3);
  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "hostIdiom");

  objc_msgSend(v6, "setSh_hostUserInterfaceIdiom:", v5);
}

- (id)_orderedAvailableActivitiesForAuditToken:(id *)a3 WithMatchingContextCustomizationBlock:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostConfiguration](self, "hostConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextForMatchingByActivityItemValueClasses"));
  v10 = objc_msgSend(v9, "copy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityTypesToCreateInShareService"));
  objc_msgSend(v10, "setAllowMatchingExtensionActivities:", objc_msgSend(v11, "containsObject:", CFSTR("com.apple.UIKit.activity.RemoteExtension")));

  objc_msgSend(v10, "setAllowMatchingBuiltInActivities:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostActivityConfigurations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUIHostActivityProxy activitiesForConfigurations:](SUIHostActivityProxy, "activitiesForConfigurations:", v12));
  objc_msgSend(v10, "setExternalMatchBuiltinOrderedActivities:", v13);

  objc_msgSend(v10, "setHostAuditToken:", a3);
  objc_msgSend(v10, "setIsCollaborative:", objc_msgSend(v8, "isCollaborative"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityTypesToCreateInShareService"));
  v15 = objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "removeObject:", CFSTR("com.apple.UIKit.activity.RemoteExtension"));
  objc_msgSend(v10, "setActivityTypesGeneratedByDelegate:", v15);
  if (v6)
    v6[2](v6, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession activityHelper](self, "activityHelper"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "orderedAvailableActivitiesForMatchingContext:", v10));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hiddenActivities"));
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hiddenActivities](self, "hiddenActivities"));
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hiddenActivities](self, "hiddenActivities"));
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hiddenActivities"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23));
      -[SDShareSheetSession setHiddenActivities:](self, "setHiddenActivities:", v24);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hiddenActivities"));
      v23 = objc_msgSend(v22, "copy");
      -[SDShareSheetSession setHiddenActivities:](self, "setHiddenActivities:", v23);
    }

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "orderedActivities"));

  objc_sync_exit(v7);
  return v25;
}

- (void)_loadPresentableActivitiesForAuditToken:(id *)a3
{
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v8[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v5);
  v6 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession _orderedAvailableActivitiesForAuditToken:WithMatchingContextCustomizationBlock:](self, "_orderedAvailableActivitiesForAuditToken:WithMatchingContextCustomizationBlock:", v8, &stru_100718930));
  -[SDShareSheetSession setOrderedPresentableActivities:](self, "setOrderedPresentableActivities:", v7);

  objc_sync_exit(v5);
}

- (id)_orderedActivitiesIncludingUserDisabledExtensionsForAuditToken:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  return (id)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession _orderedAvailableActivitiesForAuditToken:WithMatchingContextCustomizationBlock:](self, "_orderedAvailableActivitiesForAuditToken:WithMatchingContextCustomizationBlock:", v5, &stru_100718950));
}

- (NSString)hostAppBundleID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession connection](self, "connection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sd_connectionBundleID"));

  return (NSString *)v3;
}

- (NSString)hostAppProcessName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession connection](self, "connection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sd_connectionProcessName"));

  return (NSString *)v3;
}

- (void)sendItems:(id)a3 itemData:(id)a4 toEndpointUUID:(id)a5 withNode:(id)a6
{
  void *v6;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  void *v17;
  uint64_t v18;
  void *j;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char isKindOfClass;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSMutableOrderedSet *cachedSharedItems;
  NSMutableDictionary *sharedItemsMap;
  void *v50;
  void *v51;
  NSMutableDictionary *sharedItemsRequestIDToPreviewPhoto;
  void *v53;
  NSMutableOrderedSet *v54;
  void *v55;
  char v56;
  char v57;
  id v58;
  uint64_t v59;
  void *k;
  void *v61;
  void *v62;
  BOOL v63;
  unsigned __int8 v64;
  void *v65;
  unint64_t v66;
  char v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id obj;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];

  v11 = a3;
  v93 = a4;
  v87 = a5;
  v86 = a6;
  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "securityContexts"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v108, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v103 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i), "activate");
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v108, 16);
    }
    while (v13);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v88 = v11;
  v16 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
  v17 = 0;
  if (v16)
  {
    v18 = 0;
    v89 = *(_QWORD *)v99;
    do
    {
      v91 = v16;
      for (j = 0; j != v91; j = (char *)j + 1)
      {
        if (*(_QWORD *)v99 != v89)
          objc_enumerationMutation(v88);
        v20 = *(id *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)j);
        v22 = objc_opt_class(NSString, v21);
        isKindOfClass = objc_opt_isKindOfClass(v20, v22);
        if ((isKindOfClass & 1) != 0)
        {
          v25 = v20;
        }
        else
        {
          v26 = objc_opt_class(NSAttributedString, v23);
          if ((objc_opt_isKindOfClass(v20, v26) & 1) == 0)
            goto LABEL_23;
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "string"));
          v25 = v6;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));
        if ((isKindOfClass & 1) == 0)

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "scheme"));
          v29 = v28 == 0;

          if (!v29)
          {
            v30 = v27;

            v20 = v30;
          }
        }

LABEL_23:
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "attachmentNameForItem:", v20));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "subjectForItem:", v20));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "dataTypeForItem:", v20));
        if (v18 <= 2)
        {
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "previewImageForItem:", v20));

          if (!v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "previewImageDataForItem:", v20));
            if (v36)
              v35 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v36));
            else
              v35 = 0;

          }
          if (v35)
            ++v18;
          v17 = (void *)v35;
        }
        v37 = objc_opt_class(NSString, v33);
        if ((objc_opt_isKindOfClass(v20, v37) & 1) != 0)
        {
          ++self->_sharedItemsCount;
          -[SDShareSheetSession addString:withAttachmentName:description:previewImage:itemIndex:](self, "addString:withAttachmentName:description:previewImage:itemIndex:", v20, v31, v32, v17);
        }
        else
        {
          v39 = objc_opt_class(NSAttributedString, v38);
          if ((objc_opt_isKindOfClass(v20, v39) & 1) != 0)
          {
            ++self->_sharedItemsCount;
            -[SDShareSheetSession addAttributedString:withAttachmentName:description:previewImage:itemIndex:](self, "addAttributedString:withAttachmentName:description:previewImage:itemIndex:", v20, v31, v32, v17);
          }
          else
          {
            v41 = objc_opt_class(NSURL, v40);
            if ((objc_opt_isKindOfClass(v20, v41) & 1) != 0)
            {
              v43 = v20;
              if (!objc_msgSend(v43, "isFileURL")
                || objc_msgSend(v93, "canAccessFileURL:", v43))
              {
                ++self->_sharedItemsCount;
                -[SDShareSheetSession addURL:withAttachmentName:description:previewImage:itemIndex:](self, "addURL:withAttachmentName:description:previewImage:itemIndex:", v43, v31, v32, v17);
              }

            }
            else
            {
              v44 = objc_opt_class(UIImage, v42);
              if ((objc_opt_isKindOfClass(v20, v44) & 1) != 0)
              {
                ++self->_sharedItemsCount;
                -[SDShareSheetSession addImage:withAttachmentName:description:previewImage:itemIndex:](self, "addImage:withAttachmentName:description:previewImage:itemIndex:", v20, v31, v32, v17);
              }
              else
              {
                v46 = objc_opt_class(NSData, v45);
                if ((objc_opt_isKindOfClass(v20, v46) & 1) != 0)
                {
                  ++self->_sharedItemsCount;
                  -[SDShareSheetSession addData:ofType:withAttachmentName:description:previewImage:itemIndex:](self, "addData:ofType:withAttachmentName:description:previewImage:itemIndex:", v20, v34, v31, v32, v17);
                }
              }
            }
          }
        }

      }
      v16 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
    }
    while (v16);
  }

  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_operationQueue, "waitUntilAllOperationsAreFinished");
  if (self->_sharedItemsCount >= 1)
  {
    v47 = 0;
    do
    {
      cachedSharedItems = self->_cachedSharedItems;
      sharedItemsMap = self->_sharedItemsMap;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v47));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sharedItemsMap, "objectForKeyedSubscript:", v50));
      -[NSMutableOrderedSet addObject:](cachedSharedItems, "addObject:", v51);

      v47 = (v47 + 1);
    }
    while ((int)v47 < self->_sharedItemsCount);
  }
  -[SDShareSheetSession generateSpecialPreviewPhotoForRequestID:](self, "generateSpecialPreviewPhotoForRequestID:", self->_sharedItemsRequestID);
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_sharedItemsRequestID));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sharedItemsRequestIDToPreviewPhoto, "objectForKeyedSubscript:", v53));

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v54 = self->_cachedSharedItems;
  v55 = 0;
  v56 = 0;
  v57 = 0;
  v58 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v95;
    do
    {
      for (k = 0; k != v58; k = (char *)k + 1)
      {
        if (*(_QWORD *)v95 != v59)
          objc_enumerationMutation(v54);
        v61 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)k);
        if (objc_msgSend(v61, "identifer") == (id)self->_sharedItemsRequestID)
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "URL"));
          v63 = v62 == 0;

          if (!v63)
          {
            if (!v92)
              v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "previewImage"));
            if (!v55)
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "payloadDescription"));
            v64 = objc_msgSend(v61, "wasString");
            objc_msgSend(v90, "addObject:", v61);
            v56 |= v64;
            v57 |= v64 ^ 1;
          }
        }
      }
      v58 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
    }
    while (v58);
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v90, "count")));
  v66 = 0;
  v67 = v56 & v57;
  while (v66 < (unint64_t)objc_msgSend(v90, "count"))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectAtIndexedSubscript:", v66));
    v69 = v68;
    if ((v67 & 1) == 0 || (objc_msgSend(v68, "wasString") & 1) == 0)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "URL"));
      objc_msgSend(v65, "addObject:", v70);

    }
    ++v66;
  }

  objc_sync_exit(obj);
  if ((+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled") & 1) != 0)
  {
    if (!v87)
    {
      v87 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "endpointUUID"));
      if (!v87)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetSlotManager.m"), 894, CFSTR("endpointUUID is nil for node:%@"), v86);

        v87 = 0;
      }
    }
    v72 = SFScaleAndRotateImage(540.0);
    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v72));
    v74 = objc_msgSend(v73, "CGImage");

    if (v74)
    {
      v75 = SFDataFromCGImage(v74);
      v74 = (id)objc_claimAutoreleasedReturnValue(v75);
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession connection](self, "connection"));
    v78 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "sd_connectionBundleID"));
    objc_msgSend(v76, "send:to:itemPreviewData:requestSource:", v65, v87, v74, v78);
  }
  else
  {
    v79 = objc_opt_class(SFAirDropNode, v71);
    if ((objc_opt_isKindOfClass(v86, v79) & 1) == 0)
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetSlotManager.m"), 900, CFSTR("node is not SFAirDropNode: %@"), v86);

    }
    v80 = v86;
    v74 = (id)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession connection](self, "connection"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "sd_connectionBundleID"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser sessionID](self->_peopleBrowser, "sessionID"));
    v81 = SFScaleAndRotateImage(540.0);
    v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v81));
    objc_msgSend(v80, "startSendForBundleID:sessionID:items:description:previewImage:fromShareSheet:", v76, v77, v65, 0, objc_msgSend(v78, "CGImage"), 1);

  }
  -[SDShareSheetSession resetAfterAirDropTransferWithItemData:](self, "resetAfterAirDropTransferWithItemData:", v93);

}

- (void)cancelAirDropForNode:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = objc_opt_class(SFAirDropNode, v4);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
  {
    objc_msgSend(v7, "cancelSend");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession airDropController](self, "airDropController"));
    objc_msgSend(v6, "cancelCurrentSend");

  }
}

- (void)resetAfterAirDropTransferWithItemData:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *sharedItemsMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *sharedItemsRequestIDToPreviewPhoto;
  NSMutableOrderedSet *v10;
  NSMutableOrderedSet *cachedSharedItems;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v5);
  self->_attachmentCount = 0;
  self->_sharedItemsCount = 0;
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  sharedItemsMap = self->_sharedItemsMap;
  self->_sharedItemsMap = v6;

  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
  self->_sharedItemsRequestIDToPreviewPhoto = v8;

  v10 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
  cachedSharedItems = self->_cachedSharedItems;
  self->_cachedSharedItems = v10;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "securityContexts", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "deactivate");
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  objc_sync_exit(v5);
}

- (BOOL)isValidPayload:(id)a3 toPerson:(id)a4 invalidMessage:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  int MyFriendsLink;
  void *v15;
  int v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  char v32;
  void *j;
  unsigned int v34;
  __CFString *v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  __CFString *v47;
  __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  __CFString *v60;
  id v61;
  __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  id v71;
  id v72;
  uint64_t v73;
  void *i;
  uint64_t v75;
  void *v76;
  void *v77;
  unsigned int v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id obj;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  __int16 v99;
  id v100;
  id v101;
  _BYTE v102[128];
  _QWORD v103[2];
  _QWORD v104[2];
  _BYTE v105[128];

  v6 = a3;
  v7 = a4;
  v100 = 0;
  v101 = 0;
  SFFakeFilesAndItemsArrayForURLs(v6, &v101, &v100);
  v8 = v101;
  v9 = v100;
  v99 = 0;
  v98 = 0;
  v10 = SFContentTypes(v8, v9, &v98, (char *)&v99 + 1, &v99);
  v86 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v84 = v98;
  v85 = v9;
  if (!HIBYTE(v99) || (objc_msgSend(v7, "supportsMixedTypes") & 1) != 0)
  {
    if ((objc_msgSend(v7, "supportsPasses") & 1) != 0)
    {
      if ((objc_msgSend(v7, "supportsFMF") & 1) == 0)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "scheme"));
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "lowercaseString"));

        MyFriendsLink = SFIsFindMyFriendsLink(v13);
        if (MyFriendsLink)
        {
          v59 = objc_msgSend(v7, "isUnknown");
          v60 = CFSTR("TRANSFER_TO_PERSON_NO_FMF_TEXT");
          if (v59)
            v60 = CFSTR("TRANSFER_TO_DEVICE_NO_FMF_TEXT");
          v61 = v13;
          v62 = v60;
          v64 = SFLocalizedStringForKey(CFSTR("TRANSFER_BASE_DIRECTIONALITY_STRING"), v63);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v64);
          v66 = SFLocalizedStringForKey(v62, v65);
          v67 = (void *)objc_claimAutoreleasedReturnValue(v66);

          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v67, v68));
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v69));

          v13 = v61;
          goto LABEL_34;
        }
LABEL_35:
        v32 = MyFriendsLink ^ 1;
        goto LABEL_39;
      }
      if (!objc_msgSend(v7, "supportsCredentials") || objc_msgSend(v7, "isUnknown"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));

        MyFriendsLink = SFIsCredential(v13);
        if (MyFriendsLink)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "firstObject"));
          v16 = SFIsPasskeyCredentialLink();

          if (v16)
            v18 = CFSTR("TRANSFER_TO_PERSON_OR_DEVICE_NO_PASSKEYS_TEXT");
          else
            v18 = CFSTR("TRANSFER_TO_PERSON_OR_DEVICE_NO_CREDENTIALS_TEXT");
          if (v16)
            v19 = CFSTR("Localizable-AirDropPasskeys");
          else
            v19 = CFSTR("Localizable");
          v20 = SFLocalizedStringForKey(CFSTR("TRANSFER_BASE_DIRECTIONALITY_STRING"), v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v22 = SFLocalizedStringForKeyInStringsFileNamed(v18, v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v23));

          v103[0] = CFSTR("supportsCredentials");
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "supportsCredentials")));
          v103[1] = CFSTR("unknownPeer");
          v104[0] = v24;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "isUnknown")));
          v104[1] = v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v104, v103, 2));

          SFMetricsLog(CFSTR("com.apple.sharing.AirDropCredentialsUnsupported"), v26);
LABEL_34:

          goto LABEL_35;
        }
        goto LABEL_35;
      }
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v13 = v6;
      v71 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      if (!v71)
      {
        v32 = 1;
        goto LABEL_39;
      }
      v72 = v71;
      v83 = v8;
      v87 = v7;
      v73 = *(_QWORD *)v91;
      while (2)
      {
        for (i = 0; i != v72; i = (char *)i + 1)
        {
          if (*(_QWORD *)v91 != v73)
            objc_enumerationMutation(v13);
          v75 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i);
          v76 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
          if (objc_msgSend(v76, "isApplicationAvailableToOpenURL:error:", v75, 0))
          {

          }
          else
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
            v78 = objc_msgSend(v77, "isApplicationAvailableToOpenURL:includePrivateURLSchemes:error:", v75, 1, 0);

            if (v78)
            {
              if ((unint64_t)objc_msgSend(v13, "count") <= 1)
                v80 = CFSTR("TRANSFER_PRIVATE_SCHEMES_PLURAL_TEXT");
              else
                v80 = CFSTR("TRANSFER_PRIVATE_SCHEMES_TEXT");
              v81 = SFLocalizedStringForKey(v80, v79);
              v32 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue(v81);
              goto LABEL_38;
            }
          }
        }
        v72 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
        v32 = 1;
        if (v72)
          continue;
        break;
      }
    }
    else
    {
      v87 = v7;
      v82 = v6;
      v83 = v8;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", kSFOperationFileNameKey));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pathExtension"));

      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "allKeys"));
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v95;
        v32 = 1;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(_QWORD *)v95 != v31)
              objc_enumerationMutation(obj);
            if (SFIsPass(*(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j), v13))
            {
              v34 = objc_msgSend(v87, "isUnknown");
              v35 = CFSTR("TRANSFER_TO_PERSON_NO_WALLET_TEXT");
              if (v34)
                v35 = CFSTR("TRANSFER_TO_DEVICE_NO_WALLET_TEXT");
              v36 = v35;
              v38 = SFLocalizedStringForKey(CFSTR("TRANSFER_BASE_DIRECTIONALITY_STRING"), v37);
              v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
              v41 = SFLocalizedStringForKey(v36, v40);
              v42 = v13;
              v43 = (void *)objc_claimAutoreleasedReturnValue(v41);

              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "displayName"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v43, v44));
              *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v39, v45));

              v13 = v42;
              v32 = 0;
            }
          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v105, 16);
        }
        while (v30);
      }
      else
      {
        v32 = 1;
      }

      v6 = v82;
    }
LABEL_38:
    v7 = v87;
    v8 = v83;
    goto LABEL_39;
  }
  v46 = objc_msgSend(v7, "isUnknown");
  v47 = CFSTR("TRANSFER_TO_PERSON_MIXED_TYPES_TEXT");
  if (v46)
    v47 = CFSTR("TRANSFER_TO_DEVICE_MIXED_TYPES_TEXT");
  v48 = v47;
  v50 = SFLocalizedStringForKey(CFSTR("TRANSFER_BASE_DIRECTIONALITY_STRING"), v49);
  v13 = (id)objc_claimAutoreleasedReturnValue(v50);
  v51 = v8;
  v53 = SFLocalizedStringForKey(v48, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v54, v55));
  *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v56));

  v8 = v51;
  v32 = 0;
LABEL_39:

  return v32 & 1;
}

- (BOOL)addURL:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  int64_t generatedPreviews;
  NSOperationQueue *v24;
  NSObject *v25;
  NSOperationQueue *operationQueue;
  uint64_t v27;
  NSString *v29;
  void *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id v34;
  SDShareSheetSession *v35;
  int v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  SDShareSheetSession *v40;
  int v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  CGSize v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  v17 = objc_sync_enter(v16);
  v18 = airdrop_log(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "size");
    v29 = NSStringFromCGSize(v52);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    *(_DWORD *)buf = 138413314;
    v43 = v12;
    v44 = 2112;
    v45 = v13;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v49 = v15;
    v50 = 2112;
    v51 = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "addURL:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "scheme"));
  v21 = v20 == 0;

  if (v21)
  {
    v27 = airdrop_log(v22);
    v25 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100160960();
  }
  else
  {
    self->_itemsReady = 0;
    if (v15 || (generatedPreviews = self->_generatedPreviews, generatedPreviews > 2))
    {
      operationQueue = self->_operationQueue;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10014956C;
      v31[3] = &unk_1007189A0;
      v32 = v12;
      v33 = v14;
      v34 = v15;
      v35 = self;
      v36 = a7;
      -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v31);

      v25 = v32;
    }
    else
    {
      self->_generatedPreviews = generatedPreviews + 1;
      v24 = self->_operationQueue;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10014940C;
      v37[3] = &unk_100718978;
      v38 = v12;
      v39 = v14;
      v40 = self;
      v41 = a7;
      -[NSOperationQueue addOperationWithBlock:](v24, "addOperationWithBlock:", v37);

      v25 = v38;
    }
  }

  objc_sync_exit(v16);
  return 1;
}

- (BOOL)addImage:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSString *sessionID;
  int64_t v19;
  void *v20;
  void *SuggestedFilename;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSOperationQueue *operationQueue;
  id v27;
  id v28;
  id v29;
  id v30;
  NSString *v32;
  id v33;
  NSString *v34;
  void *v35;
  id obj;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  SDShareSheetSession *v43;
  int v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  CGSize v57;
  CGSize v58;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  v15 = objc_sync_enter(obj);
  v16 = airdrop_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "size");
    v32 = NSStringFromCGSize(v57);
    v33 = (id)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(v14, "size");
    v34 = NSStringFromCGSize(v58);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    *(_DWORD *)buf = 138413570;
    v46 = v11;
    v47 = 2112;
    v48 = v33;
    v49 = 2112;
    v50 = v12;
    v51 = 2112;
    v52 = v13;
    v53 = 2112;
    v54 = v14;
    v55 = 2112;
    v56 = v35;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "addImage:[%@]-size:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x3Eu);

  }
  self->_itemsReady = 0;
  if (!v14)
    v14 = v11;
  sessionID = self->_sessionID;
  v19 = self->_attachmentCount + 1;
  self->_attachmentCount = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IMG_%@-%ld"), sessionID, v19));
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename(v20, kUTTypeJPEG);
  v22 = NSTemporaryDirectory();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = v12;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingPathComponent:", SuggestedFilename));
  operationQueue = self->_operationQueue;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001498C4;
  v38[3] = &unk_1007189C8;
  v27 = v11;
  v39 = v27;
  v28 = v25;
  v40 = v28;
  v29 = v13;
  v41 = v29;
  v30 = v14;
  v42 = v30;
  v43 = self;
  v44 = a7;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v38);

  objc_sync_exit(obj);
  return 1;
}

- (BOOL)addData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8
{
  uint64_t v8;
  id v14;
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  BOOL v26;
  NSString *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  CGSize v45;

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  v15 = (__CFString *)a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  v20 = objc_sync_enter(v19);
  v21 = airdrop_log(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v30 = objc_msgSend(v14, "length");
    objc_msgSend(v18, "size");
    v28 = NSStringFromCGSize(v45);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 134219522;
    v32 = v14;
    v33 = 2048;
    v34 = v30;
    v35 = 2112;
    v36 = v15;
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v17;
    v41 = 2112;
    v42 = v18;
    v43 = 2112;
    v44 = v29;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "addData:[%p]-length:[%lu] ofType:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x48u);

  }
  self->_itemsReady = 0;
  v23 = v18;
  v24 = v23;
  if (!v23)
  {
    if (UTTypeConformsTo(v15, kUTTypeImage))
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v14));
    else
      v24 = 0;
  }
  if (v16)
    v25 = v16;
  else
    v25 = v17;
  v26 = -[SDShareSheetSession createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:](self, "createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:", v14, v15, v25, v17, v24, v8, 0);

  objc_sync_exit(v19);
  return v26;
}

- (BOOL)createURLPayloadForData:(id)a3 ofType:(id)a4 withAttachmentName:(id)a5 description:(id)a6 previewImage:(id)a7 itemIndex:(int)a8 completion:(id)a9
{
  id v14;
  const __CFString *v15;
  id v16;
  id v17;
  void *v18;
  void *SuggestedFilename;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  int64_t v23;
  void *v24;
  CFStringRef v25;
  NSString *sessionID;
  int64_t v27;
  uint64_t v28;
  int64_t v29;
  NSString *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  NSOperationQueue *operationQueue;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  id v42;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  SDShareSheetSession *v50;
  id v51;
  int v52;

  v14 = a3;
  v15 = (const __CFString *)a4;
  v16 = a5;
  v17 = a6;
  v41 = a7;
  v42 = a9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v18);
  v44 = v16;
  if (!objc_msgSend(v16, "length"))
  {
    v25 = UTTypeCopyPreferredTagWithClass(v15, kUTTagClassFilenameExtension);
    if (v25)
      v20 = (__CFString *)v25;
    else
      v20 = CFSTR("data");
    v21 = (__CFString *)UTTypeCopyDescription(v15);
    sessionID = self->_sessionID;
    v27 = self->_attachmentCount + 1;
    self->_attachmentCount = v27;
    v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%ld.%@"), v21, sessionID, v27, v20, v41));
    goto LABEL_11;
  }
  SuggestedFilename = (void *)_UTTypeCreateSuggestedFilename(v16, v15);
  v20 = (__CFString *)objc_msgSend(SuggestedFilename, "mutableCopy");

  -[__CFString replaceOccurrencesOfString:withString:options:range:](v20, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("-"), 0, 0, -[__CFString length](v20, "length"));
  -[__CFString replaceOccurrencesOfString:withString:options:range:](v20, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("-"), 0, 0, -[__CFString length](v20, "length"));
  if (self->_attachmentCount)
  {
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString pathExtension](v20, "pathExtension"));
    if (-[__CFString length](v21, "length"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByDeletingPathExtension](v20, "stringByDeletingPathExtension"));
      v23 = self->_attachmentCount + 1;
      self->_attachmentCount = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%ld.%@"), v22, v23, v21));

LABEL_12:
      goto LABEL_13;
    }
    v29 = self->_attachmentCount + 1;
    self->_attachmentCount = v29;
    v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%ld.%@"), v20, v29, v21));
LABEL_11:
    v24 = (void *)v28;
    goto LABEL_12;
  }
  v20 = v20;
  ++self->_attachmentCount;
  v24 = v20;
LABEL_13:

  v30 = NSTemporaryDirectory();
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = (__CFString *)v15;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingPathComponent:", v24));
  operationQueue = self->_operationQueue;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100149F48;
  v45[3] = &unk_1007189F0;
  v35 = v14;
  v46 = v35;
  v36 = v33;
  v47 = v36;
  v37 = v17;
  v48 = v37;
  v38 = v41;
  v49 = v38;
  v50 = self;
  v52 = a8;
  v39 = v42;
  v51 = v39;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v45);

  objc_sync_exit(v18);
  return 1;
}

- (BOOL)addString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSString *v23;
  void *v24;
  BOOL v25;
  NSString *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  CGSize v39;

  v7 = *(_QWORD *)&a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = airdrop_log(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v16, "size");
    v27 = NSStringFromCGSize(v39);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138413314;
    v30 = v13;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v16;
    v37 = 2112;
    v38 = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "addString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);

  }
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataUsingEncoding:", 4));
  v20 = (void *)v19;
  if (v15)
  {
    v21 = airdrop_log(v19);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138412290;
      v30 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ discarding description", buf, 0xCu);

    }
  }
  v25 = -[SDShareSheetSession createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:](self, "createURLPayloadForData:ofType:withAttachmentName:description:previewImage:itemIndex:completion:", v20, kUTTypePlainText, v14, v15, v16, v7, &stru_100718A30);

  return v25;
}

- (BOOL)addAttributedString:(id)a3 withAttachmentName:(id)a4 description:(id)a5 previewImage:(id)a6 itemIndex:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  BOOL v27;
  NSString *v29;
  void *v30;
  id v31;
  NSAttributedStringDocumentAttributeKey v32;
  NSAttributedStringDocumentType v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  CGSize v44;

  v7 = *(_QWORD *)&a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = airdrop_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "size");
    v29 = NSStringFromCGSize(v44);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    *(_DWORD *)buf = 138413314;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v14;
    v40 = 2112;
    v41 = v15;
    v42 = 2112;
    v43 = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "addAttributedString:[%@] withAttachmentName:[%@] description:[%@] previewImage:[%@]-size:[%@]", buf, 0x34u);

  }
  v18 = objc_msgSend(v12, "length");
  v32 = NSDocumentTypeDocumentAttribute;
  v33 = NSHTMLTextDocumentType;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
  v31 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataFromRange:documentAttributes:error:", 0, v18, v19, &v31));
  v21 = v31;

  if (v21)
  {
    v23 = airdrop_log(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100160A20();

    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "string"));
  }
  else
  {
    v25 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v20, 4);
  }
  v26 = v25;
  v27 = -[SDShareSheetSession addString:withAttachmentName:description:previewImage:itemIndex:](self, "addString:withAttachmentName:description:previewImage:itemIndex:", v25, v13, v14, v15, v7);

  return v27;
}

- (void)generateSpecialPreviewPhotoForRequestID:(int64_t)a3
{
  void *v4;
  void *v5;
  NSMutableOrderedSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  __CFString *v20;
  __CFString *PreferredIdentifierForTag;
  void *v22;
  double v23;
  _BOOL4 v24;
  uint64_t v25;
  NSMutableDictionary *sharedItemsRequestIDToPreviewPhoto;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = self->_cachedSharedItems;
  v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "identifer") == (id)a3)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "previewImage"));
            v13 = v12 == 0;

            if (!v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "previewImage"));
              objc_msgSend(v4, "addObject:", v14);

              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
              objc_msgSend(v5, "addObject:", v15);

            }
          }
        }
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v7);
  }

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v30;
      while (2)
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v16);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1)
                                                                                   + 8 * (_QWORD)j), "pathExtension"));
          PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v20, 0);
          if ((SFIsImage() & 1) == 0
            && (SFIsVideo(PreferredIdentifierForTag) & 1) == 0
            && (SFIsLivePhotos(PreferredIdentifierForTag) & 1) == 0)
          {

            goto LABEL_25;
          }

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v17)
          continue;
        break;
      }
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v22, "scale");
    v24 = v23 == 2.0;

    v25 = SFImageStackFromImages(v4, dbl_1005CCB20[v24]);
    v16 = (id)objc_claimAutoreleasedReturnValue(v25);
    sharedItemsRequestIDToPreviewPhoto = self->_sharedItemsRequestIDToPreviewPhoto;
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](sharedItemsRequestIDToPreviewPhoto, "setObject:forKeyedSubscript:", v16, v20);
LABEL_25:

  }
  objc_sync_exit(obj);

}

+ (id)labelColorWithHostConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;

  v3 = a3;
  if (objc_msgSend(v3, "linkedBeforeYukon"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostTraitCollection"));
    if (!v5)
    {
      v6 = share_sheet_log();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(Label color) Creating dummy trait collection because host's is nil on config: %@", (uint8_t *)&v10, 0xCu);
      }

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolvedColorWithTraitCollection:", v5));

  }
  return v4;
}

+ (id)secondaryLabelColorWithHostConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;

  v3 = a3;
  if (objc_msgSend(v3, "linkedBeforeYukon"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.235294118, 0.235294118, 0.262745098, 0.6));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostTraitCollection"));
    if (!v5)
    {
      v6 = share_sheet_log();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(Secondary label color) Creating dummy trait collection because host's is nil on config: %@", (uint8_t *)&v10, 0xCu);
      }

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolvedColorWithTraitCollection:", v5));

  }
  return v4;
}

- (id)minimumVisibleShareActivities
{
  SDShareSheetSession *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SDShareSheetSession *v31;
  void *v32;
  void *v33;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostConfiguration](self, "hostConfiguration"));
  v4 = objc_msgSend(v3, "numberOfVisibleSharingActivities");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostShareActivityProxies](v2, "hostShareActivityProxies"));
  v7 = v4;
  if (objc_msgSend(v6, "count") < v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostShareActivityProxies](v2, "hostShareActivityProxies"));
    v7 = objc_msgSend(v8, "count");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostShareActivityProxies](v2, "hostShareActivityProxies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectsAtIndexes:", v9));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(obj);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v15), "activity"));
        if (v16)
          objc_msgSend(v5, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleNodes](v2, "peopleNodes"));
  if (objc_msgSend(v17, "count") < v4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleNodes](v2, "peopleNodes"));
    v4 = objc_msgSend(v18, "count");

  }
  v19 = objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v4));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleNodes](v2, "peopleNodes"));
  v35 = (void *)v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectsAtIndexes:", v19));

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v26), "suggestionNode"));
        v28 = v27;
        if (v27)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleID"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession bundleIDToActivities](v2, "bundleIDToActivities"));
          v31 = v2;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v29));

          objc_msgSend(v5, "addObjectsFromArray:", v32);
          v2 = v31;

        }
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v24);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  return v33;
}

- (id)_proxySectionForType:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  SDShareSheetProxySection *v10;

  switch(a3)
  {
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostActionActivityProxies](self, "hostActionActivityProxies"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostConfiguration](self, "hostConfiguration"));
      v8 = objc_msgSend(v7, "numberOfVisibleActionActivities");
LABEL_8:
      v9 = v8;

      goto LABEL_10;
    case 1:
      v5 = objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostShareActivityProxies](self, "hostShareActivityProxies"));
      goto LABEL_7;
    case 0:
      v5 = objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleNodes](self, "peopleNodes"));
LABEL_7:
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostConfiguration](self, "hostConfiguration"));
      v8 = objc_msgSend(v7, "numberOfVisibleSharingActivities");
      goto LABEL_8;
  }
  v6 = 0;
  v9 = 0;
LABEL_10:
  if (objc_msgSend(v6, "count"))
  {
    v10 = -[SDShareSheetProxySection initWithType:proxies:]([SDShareSheetProxySection alloc], "initWithType:proxies:", a3, v6);
    -[SDShareSheetProxySection setInitialBatchSize:](v10, "setInitialBatchSize:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_loadProxySectionWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession _proxySectionForType:](self, "_proxySectionForType:", a3));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession proxyLoaderManager](self, "proxyLoaderManager"));
    objc_msgSend(v6, "loadProxySection:", v5);

  }
  objc_sync_exit(obj);

}

- (void)reportCurrentInvocationForDuration:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession activityHelper](self, "activityHelper"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportExtensionsCacheResult"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostAppBundleID](self, "hostAppBundleID"));
  if (!v6)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostAppProcessName](self, "hostAppProcessName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostConfiguration](self, "hostConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostTraitCollection"));
  v20 = objc_msgSend(v8, "userInterfaceStyle");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostConfiguration](self, "hostConfiguration"));
  v10 = objc_msgSend(v9, "isCollaborative");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession suggestedPeople](self, "suggestedPeople"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v15), "displayName"));
        if (v16)
          objc_msgSend(v11, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession xpcHelperCnx](self, "xpcHelperCnx"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession suggestedPeople](self, "suggestedPeople"));
  LOBYTE(v19) = v10;
  objc_msgSend(v17, "sendShareSheetInvocationMetricsWithAppBundleID:numSuggestions:suggestionDisplayNames:extensionsCacheResult:isDarkMode:duration:isCollaborative:", v6, objc_msgSend(v18, "count"), v11, v22, v20 == (id)2, a3, v19);

  objc_sync_exit(v4);
}

- (void)_removeFailedIndexes:(id)a3 forProxySection:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSArray *v15;
  NSArray *peopleNodes;
  NSArray *v17;
  NSArray *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_sync_enter(v7);
  v8 = objc_msgSend(v6, "type");
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession peopleNodes](self, "peopleNodes"));
    v10 = objc_msgSend(v9, "mutableCopy");
    goto LABEL_7;
  }
  if (v8 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostShareActivityProxies](self, "hostShareActivityProxies"));
    v10 = objc_msgSend(v9, "mutableCopy");
    goto LABEL_7;
  }
  if (v8 == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession hostActionActivityProxies](self, "hostActionActivityProxies"));
    v10 = objc_msgSend(v9, "mutableCopy");
LABEL_7:
    v11 = v10;

    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "proxies"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectsAtIndexes:", v19));

  objc_msgSend(v11, "removeObjectsInArray:", v13);
  v14 = objc_msgSend(v6, "type");
  if (!v14)
  {
    v17 = (NSArray *)objc_msgSend(v11, "copy");
    peopleNodes = self->_peopleNodes;
    self->_peopleNodes = v17;
    goto LABEL_15;
  }
  if (v14 == (id)1)
  {
    v18 = (NSArray *)objc_msgSend(v11, "copy");
    peopleNodes = self->_hostShareActivityProxies;
    self->_hostShareActivityProxies = v18;
    goto LABEL_15;
  }
  if (v14 == (id)2)
  {
    v15 = (NSArray *)objc_msgSend(v11, "copy");
    peopleNodes = self->_hostActionActivityProxies;
    self->_hostActionActivityProxies = v15;
LABEL_15:

  }
  objc_sync_exit(v7);

}

- (void)_updateProxiesWithChangeDetails:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "changedProxySections", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "failedIndexesForProxySection:", v10));
        if (objc_msgSend(v11, "count"))
          -[SDShareSheetSession _removeFailedIndexes:forProxySection:](self, "_removeFailedIndexes:forProxySection:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)proxyLoaderManager:(id)a3 didLoadProxiesWithChangeDetails:(id)a4
{
  id v5;

  -[SDShareSheetSession _updateProxiesWithChangeDetails:](self, "_updateProxiesWithChangeDetails:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession delegate](self, "delegate"));
  objc_msgSend(v5, "sessionDidChange:", self);

}

- (void)proxyLoaderManagerDidFinishLoadingProxySection:(id)a3 cancelled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  SDShareSheetSession *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const __CFString *v15;

  v4 = a4;
  v6 = a3;
  v7 = share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    if (v4)
      v9 = CFSTR("YES");
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ did finish loading proxySection:%@ cancelled:%@", (uint8_t *)&v10, 0x20u);
  }

}

- (void)didConnectNearbySharingInteractionWithEndpointUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SDShareSheetSession delegate](self, "delegate"));
  objc_msgSend(v5, "session:didConnectNearbySharingInteractionWithEndpointUUID:", self, v4);

}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (NSXPCConnection)_uiServiceConnection
{
  return self->__uiServiceConnection;
}

- (void)set_uiServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->__uiServiceConnection, a3);
}

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (BOOL)remoteShareSheet
{
  return self->_remoteShareSheet;
}

- (unint64_t)xrRenderingMode
{
  return self->_xrRenderingMode;
}

- (SDShareSheetSessionDelegate)delegate
{
  return (SDShareSheetSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)airDropAllowed
{
  return self->_airDropAllowed;
}

- (BOOL)engagedWithSheet
{
  return self->_engagedWithSheet;
}

- (void)setEngagedWithSheet:(BOOL)a3
{
  self->_engagedWithSheet = a3;
}

- (BOOL)sentInitialConfiguration
{
  return self->_sentInitialConfiguration;
}

- (void)setSentInitialConfiguration:(BOOL)a3
{
  self->_sentInitialConfiguration = a3;
}

- (BOOL)sharingExpanded
{
  return self->_sharingExpanded;
}

- (void)setSharingExpanded:(BOOL)a3
{
  self->_sharingExpanded = a3;
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)hideSuggestions
{
  return self->_hideSuggestions;
}

- (void)setHideSuggestions:(BOOL)a3
{
  self->_hideSuggestions = a3;
}

- (BOOL)isSharePlayAvailable
{
  return self->_isSharePlayAvailable;
}

- (void)setIsSharePlayAvailable:(BOOL)a3
{
  self->_isSharePlayAvailable = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  self->_supportsCollaboration = a3;
}

- (int64_t)sharedItemsRequestID
{
  return self->_sharedItemsRequestID;
}

- (void)setSharedItemsRequestID:(int64_t)a3
{
  self->_sharedItemsRequestID = a3;
}

- (int64_t)attachmentCount
{
  return self->_attachmentCount;
}

- (void)setAttachmentCount:(int64_t)a3
{
  self->_attachmentCount = a3;
}

- (NSMutableOrderedSet)cachedSharedItems
{
  return self->_cachedSharedItems;
}

- (void)setCachedSharedItems:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSharedItems, a3);
}

- (BOOL)itemsRequested
{
  return self->_itemsRequested;
}

- (void)setItemsRequested:(BOOL)a3
{
  self->_itemsRequested = a3;
}

- (BOOL)itemsReady
{
  return self->_itemsReady;
}

- (void)setItemsReady:(BOOL)a3
{
  self->_itemsReady = a3;
}

- (BOOL)firedImpactHaptic
{
  return self->_firedImpactHaptic;
}

- (void)setFiredImpactHaptic:(BOOL)a3
{
  self->_firedImpactHaptic = a3;
}

- (BOOL)transferActive
{
  return self->_transferActive;
}

- (void)setTransferActive:(BOOL)a3
{
  self->_transferActive = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (int64_t)generatedPreviews
{
  return self->_generatedPreviews;
}

- (void)setGeneratedPreviews:(int64_t)a3
{
  self->_generatedPreviews = a3;
}

- (int)sharedItemsCount
{
  return self->_sharedItemsCount;
}

- (void)setSharedItemsCount:(int)a3
{
  self->_sharedItemsCount = a3;
}

- (NSMutableDictionary)sharedItemsMap
{
  return self->_sharedItemsMap;
}

- (void)setSharedItemsMap:(id)a3
{
  objc_storeStrong((id *)&self->_sharedItemsMap, a3);
}

- (NSMutableDictionary)sharedItemsRequestIDToPreviewPhoto
{
  return self->_sharedItemsRequestIDToPreviewPhoto;
}

- (void)setSharedItemsRequestIDToPreviewPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_sharedItemsRequestIDToPreviewPhoto, a3);
}

- (int64_t)lastTransferEvent
{
  return self->_lastTransferEvent;
}

- (void)setLastTransferEvent:(int64_t)a3
{
  self->_lastTransferEvent = a3;
}

- (UINotificationFeedbackGenerator)notificationHaptic
{
  return self->_notificationHaptic;
}

- (void)setNotificationHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHaptic, a3);
}

- (UISelectionFeedbackGenerator)selectionHaptic
{
  return self->_selectionHaptic;
}

- (void)setSelectionHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_selectionHaptic, a3);
}

- (UIImpactFeedbackGenerator)impactHaptic
{
  return self->_impactHaptic;
}

- (void)setImpactHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_impactHaptic, a3);
}

- (SDAirDropActivity)activeAirDropActivity
{
  return self->_activeAirDropActivity;
}

- (void)setActiveAirDropActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activeAirDropActivity, a3);
}

- (_UIUserDefaultsActivity)shareUserDefaultsActivity
{
  return self->_shareUserDefaultsActivity;
}

- (void)setShareUserDefaultsActivity:(id)a3
{
  objc_storeStrong((id *)&self->_shareUserDefaultsActivity, a3);
}

- (SDScreenTimeMonitor)screenTimeMonitor
{
  return self->_screenTimeMonitor;
}

- (void)setScreenTimeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeMonitor, a3);
}

- (SFAirDropNodeProtocol)selectedNode
{
  return self->_selectedNode;
}

- (void)setSelectedNode:(id)a3
{
  objc_storeStrong((id *)&self->_selectedNode, a3);
}

- (NSMutableDictionary)transferNodes
{
  return self->_transferNodes;
}

- (void)setTransferNodes:(id)a3
{
  objc_storeStrong((id *)&self->_transferNodes, a3);
}

- (SFAirDropNode)selectedRecipient
{
  return self->_selectedRecipient;
}

- (void)setSelectedRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRecipient, a3);
}

- (SDPeopleBrowser)peopleBrowser
{
  return self->_peopleBrowser;
}

- (void)setPeopleBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_peopleBrowser, a3);
}

- (SDSuggestionBrowser)suggestionBrowser
{
  return self->_suggestionBrowser;
}

- (void)setSuggestionBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionBrowser, a3);
}

- (double)peopleSuggestionsTimeout
{
  return self->_peopleSuggestionsTimeout;
}

- (void)setPeopleSuggestionsTimeout:(double)a3
{
  self->_peopleSuggestionsTimeout = a3;
}

- (SDXPCHelperConnection)xpcHelperCnx
{
  return self->_xpcHelperCnx;
}

- (void)setXpcHelperCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcHelperCnx, a3);
}

- (_UIActivityHelper)activityHelper
{
  return self->_activityHelper;
}

- (void)setActivityHelper:(id)a3
{
  objc_storeStrong((id *)&self->_activityHelper, a3);
}

- (UISUIActivityViewControllerConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (NSArray)orderedPresentableActivities
{
  return self->_orderedPresentableActivities;
}

- (void)setOrderedPresentableActivities:(id)a3
{
  objc_storeStrong((id *)&self->_orderedPresentableActivities, a3);
}

- (NSArray)hiddenActivities
{
  return self->_hiddenActivities;
}

- (void)setHiddenActivities:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenActivities, a3);
}

- (NSDictionary)bundleIDToActivities
{
  return self->_bundleIDToActivities;
}

- (void)setBundleIDToActivities:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDToActivities, a3);
}

- (NSArray)airDropPeople
{
  return self->_airDropPeople;
}

- (void)setAirDropPeople:(id)a3
{
  objc_storeStrong((id *)&self->_airDropPeople, a3);
}

- (NSArray)suggestedPeople
{
  return self->_suggestedPeople;
}

- (NSArray)shareActivities
{
  return self->_shareActivities;
}

- (void)setShareActivities:(id)a3
{
  objc_storeStrong((id *)&self->_shareActivities, a3);
}

- (NSDictionary)shareActivitiesByUUID
{
  return self->_shareActivitiesByUUID;
}

- (void)setShareActivitiesByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_shareActivitiesByUUID, a3);
}

- (NSArray)shareActivitiesInUserOrder
{
  return self->_shareActivitiesInUserOrder;
}

- (void)setShareActivitiesInUserOrder:(id)a3
{
  objc_storeStrong((id *)&self->_shareActivitiesInUserOrder, a3);
}

- (NSArray)visibleShareActivities
{
  return self->_visibleShareActivities;
}

- (void)setVisibleShareActivities:(id)a3
{
  objc_storeStrong((id *)&self->_visibleShareActivities, a3);
}

- (NSArray)actionActivities
{
  return self->_actionActivities;
}

- (void)setActionActivities:(id)a3
{
  objc_storeStrong((id *)&self->_actionActivities, a3);
}

- (NSDictionary)actionActivitiesByUUID
{
  return self->_actionActivitiesByUUID;
}

- (void)setActionActivitiesByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_actionActivitiesByUUID, a3);
}

- (NSArray)actionActivitiesInUserOrder
{
  return self->_actionActivitiesInUserOrder;
}

- (void)setActionActivitiesInUserOrder:(id)a3
{
  objc_storeStrong((id *)&self->_actionActivitiesInUserOrder, a3);
}

- (NSArray)visibleActionActivities
{
  return self->_visibleActionActivities;
}

- (void)setVisibleActionActivities:(id)a3
{
  objc_storeStrong((id *)&self->_visibleActionActivities, a3);
}

- (NSArray)favoriteApps
{
  return self->_favoriteApps;
}

- (void)setFavoriteApps:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteApps, a3);
}

- (NSArray)favoriteActions
{
  return self->_favoriteActions;
}

- (void)setFavoriteActions:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteActions, a3);
}

- (NSArray)airDropNodes
{
  return self->_airDropNodes;
}

- (NSArray)peopleNodes
{
  return self->_peopleNodes;
}

- (NSArray)hostShareActivityProxies
{
  return self->_hostShareActivityProxies;
}

- (NSArray)hostActionActivityProxies
{
  return self->_hostActionActivityProxies;
}

- (NSMutableDictionary)realNameToNodeID
{
  return self->_realNameToNodeID;
}

- (void)setRealNameToNodeID:(id)a3
{
  objc_storeStrong((id *)&self->_realNameToNodeID, a3);
}

- (NSMutableDictionary)shareActivityToID
{
  return self->_shareActivityToID;
}

- (void)setShareActivityToID:(id)a3
{
  objc_storeStrong((id *)&self->_shareActivityToID, a3);
}

- (NSMutableDictionary)actionActivityToID
{
  return self->_actionActivityToID;
}

- (void)setActionActivityToID:(id)a3
{
  objc_storeStrong((id *)&self->_actionActivityToID, a3);
}

- (NSNumber)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyCountSlotID, a3);
}

- (int64_t)nearbyCountBadge
{
  return self->_nearbyCountBadge;
}

- (void)setNearbyCountBadge:(int64_t)a3
{
  self->_nearbyCountBadge = a3;
}

- (NSURL)urlBeingShared
{
  return self->_urlBeingShared;
}

- (void)setUrlBeingShared:(id)a3
{
  objc_storeStrong((id *)&self->_urlBeingShared, a3);
}

- (NSMutableArray)activeSecurityContexts
{
  return self->_activeSecurityContexts;
}

- (void)setActiveSecurityContexts:(id)a3
{
  objc_storeStrong((id *)&self->_activeSecurityContexts, a3);
}

- (SDShareSheetProxyLoaderManager)proxyLoaderManager
{
  return self->_proxyLoaderManager;
}

- (void)setProxyLoaderManager:(id)a3
{
  objc_storeStrong((id *)&self->_proxyLoaderManager, a3);
}

- (void)setAirDropNearbyCount:(unint64_t)a3
{
  self->_airDropNearbyCount = a3;
}

- (SDShareSheetAirDropController)airDropController
{
  return self->_airDropController;
}

- (void)setAirDropController:(id)a3
{
  objc_storeStrong((id *)&self->_airDropController, a3);
}

- (id)disabledNodesUpdatedHandler
{
  return self->_disabledNodesUpdatedHandler;
}

- (void)setDisabledNodesUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSData)processedImageResultsData
{
  return self->_processedImageResultsData;
}

- (void)setProcessedImageResultsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSString)performActivityType
{
  return self->_performActivityType;
}

- (void)setPerformActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_performActivityType, a3);
}

- (id)performActivityCompletionHandler
{
  return self->_performActivityCompletionHandler;
}

- (void)setPerformActivityCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (id)findSupportedActivitiesCompletionHandler
{
  return self->_findSupportedActivitiesCompletionHandler;
}

- (void)setFindSupportedActivitiesCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_findSupportedActivitiesCompletionHandler, 0);
  objc_storeStrong(&self->_performActivityCompletionHandler, 0);
  objc_storeStrong((id *)&self->_performActivityType, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_processedImageResultsData, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong(&self->_disabledNodesUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_airDropController, 0);
  objc_storeStrong((id *)&self->_proxyLoaderManager, 0);
  objc_storeStrong((id *)&self->_activeSecurityContexts, 0);
  objc_storeStrong((id *)&self->_urlBeingShared, 0);
  objc_storeStrong((id *)&self->_nearbyCountSlotID, 0);
  objc_storeStrong((id *)&self->_actionActivityToID, 0);
  objc_storeStrong((id *)&self->_shareActivityToID, 0);
  objc_storeStrong((id *)&self->_realNameToNodeID, 0);
  objc_storeStrong((id *)&self->_hostActionActivityProxies, 0);
  objc_storeStrong((id *)&self->_hostShareActivityProxies, 0);
  objc_storeStrong((id *)&self->_peopleNodes, 0);
  objc_storeStrong((id *)&self->_airDropNodes, 0);
  objc_storeStrong((id *)&self->_favoriteActions, 0);
  objc_storeStrong((id *)&self->_favoriteApps, 0);
  objc_storeStrong((id *)&self->_visibleActionActivities, 0);
  objc_storeStrong((id *)&self->_actionActivitiesInUserOrder, 0);
  objc_storeStrong((id *)&self->_actionActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_actionActivities, 0);
  objc_storeStrong((id *)&self->_visibleShareActivities, 0);
  objc_storeStrong((id *)&self->_shareActivitiesInUserOrder, 0);
  objc_storeStrong((id *)&self->_shareActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_shareActivities, 0);
  objc_storeStrong((id *)&self->_suggestedPeople, 0);
  objc_storeStrong((id *)&self->_airDropPeople, 0);
  objc_storeStrong((id *)&self->_bundleIDToActivities, 0);
  objc_storeStrong((id *)&self->_hiddenActivities, 0);
  objc_storeStrong((id *)&self->_orderedPresentableActivities, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_activityHelper, 0);
  objc_storeStrong((id *)&self->_xpcHelperCnx, 0);
  objc_storeStrong((id *)&self->_suggestionBrowser, 0);
  objc_storeStrong((id *)&self->_peopleBrowser, 0);
  objc_storeStrong((id *)&self->_selectedRecipient, 0);
  objc_storeStrong((id *)&self->_transferNodes, 0);
  objc_storeStrong((id *)&self->_selectedNode, 0);
  objc_storeStrong((id *)&self->_screenTimeMonitor, 0);
  objc_storeStrong((id *)&self->_shareUserDefaultsActivity, 0);
  objc_storeStrong((id *)&self->_activeAirDropActivity, 0);
  objc_storeStrong((id *)&self->_impactHaptic, 0);
  objc_storeStrong((id *)&self->_selectionHaptic, 0);
  objc_storeStrong((id *)&self->_notificationHaptic, 0);
  objc_storeStrong((id *)&self->_sharedItemsRequestIDToPreviewPhoto, 0);
  objc_storeStrong((id *)&self->_sharedItemsMap, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cachedSharedItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__uiServiceConnection, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end

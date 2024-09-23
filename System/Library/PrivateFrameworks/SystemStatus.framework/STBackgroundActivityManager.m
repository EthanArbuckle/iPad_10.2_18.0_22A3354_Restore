@implementation STBackgroundActivityManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__STBackgroundActivityManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_19 != -1)
    dispatch_once(&_MergedGlobals_19, block);
  return (id)qword_1ED0CB4E0;
}

- (id)resolvedBackgroundActivityFromBackgroundActivities:(id)a3 inPrecedenceScope:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[STBackgroundActivityManager _allValidBackgroundActivitiesInPrecedenceScope:](self, "_allValidBackgroundActivitiesInPrecedenceScope:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "intersectSet:", v6);
  if (!self->_allowAllBackgroundActivities)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithSet:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBackgroundActivityManager _allValidBackgroundActivitiesInPrecedenceScope:](self, "_allValidBackgroundActivitiesInPrecedenceScope:", 999);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusOrderedSet:", v10);

  if (!objc_msgSend(v9, "count"))
  {

LABEL_5:
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v11;
}

- (id)_allValidBackgroundActivitiesInPrecedenceScope:(unint64_t)a3
{
  uint64_t *v4;

  if (qword_1ED0CB500 != -1)
    dispatch_once(&qword_1ED0CB500, &__block_literal_global_23);
  v4 = &qword_1ED0CB4F0;
  if (a3 != 1)
    v4 = &qword_1ED0CB4F8;
  return (id)*v4;
}

- (void)addBackgroundActivityClient:(id)a3
{
  NSHashTable *subscribedClients;
  id v5;
  id v6;

  subscribedClients = self->_subscribedClients;
  v5 = a3;
  -[NSHashTable addObject:](subscribedClients, "addObject:", v5);
  -[STBackgroundActivityManager activeBackgroundActivities](self, "activeBackgroundActivities");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeBackgroundActivitiesDidUpdate:", v6);

}

- (NSSet)activeBackgroundActivities
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_activeBackgroundActivities, "copy");
}

void __45__STBackgroundActivityManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[STSystemStatusDefaults standardDefaults](STSystemStatusDefaults, "standardDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithDefaults:", v4);
  v3 = (void *)qword_1ED0CB4E0;
  qword_1ED0CB4E0 = v2;

}

- (STBackgroundActivityManager)initWithDefaults:(id)a3
{
  id v5;
  STBackgroundActivityManager *v6;
  STBundleManager *v7;
  STBundleManager *bundleManager;
  uint64_t v9;
  NSHashTable *subscribedClients;
  uint64_t v11;
  NSMutableSet *activeBackgroundActivities;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STBackgroundActivityManager;
  v6 = -[STBackgroundActivityManager init](&v14, sel_init);
  if (v6)
  {
    v7 = -[STBundleManager initWithBundleRecordClass:]([STBundleManager alloc], "initWithBundleRecordClass:", objc_opt_class());
    bundleManager = v6->_bundleManager;
    v6->_bundleManager = v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    subscribedClients = v6->_subscribedClients;
    v6->_subscribedClients = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    activeBackgroundActivities = v6->_activeBackgroundActivities;
    v6->_activeBackgroundActivities = (NSMutableSet *)v11;

    objc_storeStrong((id *)&v6->_systemStatusDefaults, a3);
    -[STBackgroundActivityManager _registerForInternalDefaultsChanges](v6, "_registerForInternalDefaultsChanges");
    -[STBundleManager addObserver:](v6->_bundleManager, "addObserver:", v6);
    -[STBackgroundActivityManager _updateSupportedBackgroundActivitiesAndVisualDescriptorsFromBundleRecords](v6, "_updateSupportedBackgroundActivitiesAndVisualDescriptorsFromBundleRecords");
  }

  return v6;
}

- (void)addActiveBackgroundActivities:(id)a3
{
  -[NSMutableSet unionSet:](self->_activeBackgroundActivities, "unionSet:", a3);
  -[STBackgroundActivityManager _updateBackgroundActivitiesForClients](self, "_updateBackgroundActivitiesForClients");
}

- (void)removeActiveBackgroundActivities:(id)a3
{
  -[NSMutableSet minusSet:](self->_activeBackgroundActivities, "minusSet:", a3);
  -[STBackgroundActivityManager _updateBackgroundActivitiesForClients](self, "_updateBackgroundActivitiesForClients");
}

- (void)_updateBackgroundActivitiesForClients
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[STBackgroundActivityManager activeBackgroundActivities](self, "activeBackgroundActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_subscribedClients;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "activeBackgroundActivitiesDidUpdate:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_forceResetBackgroundActivitiesForClients
{
  void *v3;
  void *v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[STBackgroundActivityManager activeBackgroundActivities](self, "activeBackgroundActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_subscribedClients;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "activeBackgroundActivitiesDidUpdate:", v4, (_QWORD)v11);
        objc_msgSend(v10, "activeBackgroundActivitiesDidUpdate:", v3);
      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)removeBackgroundActivityClient:(id)a3
{
  -[NSHashTable removeObject:](self->_subscribedClients, "removeObject:", a3);
}

void __78__STBackgroundActivityManager__allValidBackgroundActivitiesInPrecedenceScope___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[50];
  _QWORD v9[33];

  v9[31] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("com.apple.systemstatus.background-activity.SatelliteSOS");
  v9[1] = CFSTR("com.apple.systemstatus.background-activity.SatelliteSOSDisconnected");
  v9[2] = CFSTR("com.apple.systemstatus.background-activity.Sysdiagnose");
  v9[3] = CFSTR("com.apple.systemstatus.background-activity.ScreenReplayRecording");
  v9[4] = CFSTR("com.apple.systemstatus.background-activity.VideoConferenceRinging");
  v9[5] = CFSTR("com.apple.systemstatus.background-activity.CallRinging");
  v9[6] = CFSTR("com.apple.systemstatus.background-activity.InVideoConference");
  v9[7] = CFSTR("com.apple.systemstatus.background-activity.InCall");
  v9[8] = CFSTR("com.apple.systemstatus.background-activity.CallRecording");
  v9[9] = CFSTR("com.apple.systemstatus.background-activity.VideoConferenceHandoff");
  v9[10] = CFSTR("com.apple.systemstatus.background-activity.CallHandoff");
  v9[11] = CFSTR("com.apple.systemstatus.background-activity.CallScreening");
  v9[12] = CFSTR("com.apple.systemstatus.background-activity.ActivePushToTalkCall");
  v9[13] = CFSTR("com.apple.systemstatus.background-activity.DeveloperTools");
  v9[14] = CFSTR("com.apple.systemstatus.background-activity.AirPrint");
  v9[15] = CFSTR("com.apple.systemstatus.background-activity.Tethering");
  v9[16] = CFSTR("com.apple.systemstatus.background-activity.SharePlay");
  v9[17] = CFSTR("com.apple.systemstatus.background-activity.SharePlayScreenSharing");
  v9[18] = CFSTR("com.apple.systemstatus.background-activity.ScreenSharing");
  v9[19] = CFSTR("com.apple.systemstatus.background-activity.VideoOut");
  v9[20] = CFSTR("com.apple.systemstatus.background-activity.SharePlayInactive");
  v9[21] = CFSTR("com.apple.systemstatus.background-activity.CellularSOS");
  v9[22] = CFSTR("com.apple.systemstatus.background-activity.WebRTCCapture");
  v9[23] = CFSTR("com.apple.systemstatus.background-activity.WebRTCAudioCapture");
  v9[24] = CFSTR("com.apple.systemstatus.background-activity.FullScreenWebRTCCapture");
  v9[25] = CFSTR("com.apple.systemstatus.background-activity.FullScreenWebRTCAudioCapture");
  v9[26] = CFSTR("com.apple.systemstatus.background-activity.Recording");
  v9[27] = CFSTR("com.apple.systemstatus.background-activity.BackgroundLocation");
  v9[28] = CFSTR("com.apple.systemstatus.background-activity.NearbyInteractions");
  v9[29] = CFSTR("com.apple.systemstatus.background-activity.Playgrounds");
  v9[30] = CFSTR("com.apple.systemstatus.background-activity.IdlePushToTalkCall");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("com.apple.systemstatus.background-activity.SatelliteSOS");
  v8[1] = CFSTR("com.apple.systemstatus.background-activity.SatelliteSOSDisconnected");
  v8[2] = CFSTR("com.apple.systemstatus.background-activity.Diagnostics");
  v8[3] = CFSTR("com.apple.systemstatus.background-activity.Sysdiagnose");
  v8[4] = CFSTR("com.apple.systemstatus.background-activity.ScreenSharingServer");
  v8[5] = CFSTR("com.apple.systemstatus.background-activity.ScreenReplayRecording");
  v8[6] = CFSTR("com.apple.systemstatus.background-activity.VideoConferenceRinging");
  v8[7] = CFSTR("com.apple.systemstatus.background-activity.CallRinging");
  v8[8] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-video");
  v8[9] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-audio");
  v8[10] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-none");
  v8[11] = CFSTR("com.apple.systemstatus.background-activity.InVideoConference");
  v8[12] = CFSTR("com.apple.systemstatus.background-activity.InCall");
  v8[13] = CFSTR("com.apple.systemstatus.background-activity.CallRecording");
  v8[14] = CFSTR("com.apple.systemstatus.background-activity.ActivePushToTalkCall");
  v8[15] = CFSTR("com.apple.systemstatus.background-activity.CallHandoff");
  v8[16] = CFSTR("com.apple.systemstatus.background-activity.VideoConferenceHandoff");
  v8[17] = CFSTR("com.apple.systemstatus.background-activity.CallScreening");
  v8[18] = CFSTR("com.apple.systemstatus.background-activity.Navigation");
  v8[19] = CFSTR("com.apple.systemstatus.background-activity.Navigation");
  v8[20] = CFSTR("com.apple.systemstatus.background-activity.CellularSOS");
  v8[21] = CFSTR("com.apple.systemstatus.background-activity.DeveloperTools");
  v8[22] = CFSTR("com.apple.systemstatus.background-activity.AirPrint");
  v8[23] = CFSTR("com.apple.systemstatus.background-activity.WebRTCCapture");
  v8[24] = CFSTR("com.apple.systemstatus.background-activity.WebRTCAudioCapture");
  v8[25] = CFSTR("com.apple.systemstatus.background-activity.FullScreenWebRTCCapture");
  v8[26] = CFSTR("com.apple.systemstatus.background-activity.FullScreenWebRTCAudioCapture");
  v8[27] = CFSTR("com.apple.systemstatus.background-activity.Recording");
  v8[28] = CFSTR("com.apple.systemstatus.background-activity.HearingAidRecording");
  v8[29] = CFSTR("com.apple.systemstatus.background-activity.LoggingCapture");
  v8[30] = CFSTR("com.apple.systemstatus.background-activity.Tethering");
  v8[31] = CFSTR("com.apple.systemstatus.background-activity.SharePlay");
  v8[32] = CFSTR("com.apple.systemstatus.background-activity.SharePlayScreenSharing");
  v8[33] = CFSTR("com.apple.systemstatus.background-activity.SharePlayInactive");
  v8[34] = CFSTR("com.apple.systemstatus.background-activity.ScreenSharing");
  v8[35] = CFSTR("com.apple.systemstatus.background-activity.VideoOut");
  v8[36] = CFSTR("com.apple.systemstatus.background-activity.CarPlay");
  v8[37] = CFSTR("com.apple.mediaremoted.background-activity.routed-audio-pulse");
  v8[38] = CFSTR("com.apple.mediaremoted.background-activity.routed-video");
  v8[39] = CFSTR("com.apple.mediaremoted.background-activity.routed-video-pulse");
  v8[40] = CFSTR("com.apple.mediaremoted.background-activity.routed-audio");
  v8[41] = CFSTR("com.apple.systemstatus.background-activity.AutoAirPlayReady");
  v8[42] = CFSTR("com.apple.systemstatus.background-activity.AutoAirPlayPlaying");
  v8[43] = CFSTR("com.apple.systemstatus.background-activity.AssistantEyesFree");
  v8[44] = CFSTR("com.apple.systemstatus.background-activity.InWorkout");
  v8[45] = CFSTR("com.apple.systemstatus.background-activity.BackgroundLocation");
  v8[46] = CFSTR("com.apple.systemstatus.background-activity.NearbyInteractions");
  v8[47] = CFSTR("com.apple.systemstatus.background-activity.Playgrounds");
  v8[48] = CFSTR("com.apple.systemstatus.background-activity.IdlePushToTalkCall");
  v8[49] = CFSTR("com.apple.activityprogress.backgroundui");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 50);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v7);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED0CB4F0;
  qword_1ED0CB4F0 = v1;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED0CB4F8;
  qword_1ED0CB4F8 = v3;

  v5 = objc_msgSend((id)qword_1ED0CB4F8, "copy");
  v6 = (void *)qword_1ED0CB4E8;
  qword_1ED0CB4E8 = v5;

}

- (id)validBackgroundActivitiesForBackgroundActivities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBackgroundActivityManager _allValidBackgroundActivitiesInPrecedenceScope:](self, "_allValidBackgroundActivitiesInPrecedenceScope:", 999);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectSet:", v7);

  if (self->_allowAllBackgroundActivities)
    objc_msgSend(v5, "unionSet:", v4);

  return v5;
}

- (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_visualDescriptors, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[STBackgroundActivityVisualDescriptor visualDescriptorForBackgroundActivityWithIdentifier:](STBackgroundActivityVisualDescriptor, "visualDescriptorForBackgroundActivityWithIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)_registerForInternalDefaultsChanges
{
  STSystemStatusDefaults *systemStatusDefaults;
  uint64_t v4;
  id v5;
  BSDefaultObserver *v6;
  BSDefaultObserver *internalDefaultsObserver;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_internalDefaultsObserver)
  {
    self->_allowAllBackgroundActivities = -[STSystemStatusDefaults shouldEnableUnknownBackgroundActivities](self->_systemStatusDefaults, "shouldEnableUnknownBackgroundActivities");
    objc_initWeak(&location, self);
    systemStatusDefaults = self->_systemStatusDefaults;
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__STBackgroundActivityManager__registerForInternalDefaultsChanges__block_invoke;
    v8[3] = &unk_1E91E4B50;
    objc_copyWeak(&v9, &location);
    -[BSAbstractDefaultDomain observeDefault:onQueue:withBlock:](systemStatusDefaults, "observeDefault:onQueue:withBlock:", CFSTR("shouldEnableUnknownBackgroundActivities"), v4, v8);
    v6 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
    internalDefaultsObserver = self->_internalDefaultsObserver;
    self->_internalDefaultsObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __66__STBackgroundActivityManager__registerForInternalDefaultsChanges__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = MEMORY[0x1D17E6298]("-[STBackgroundActivityManager _registerForInternalDefaultsChanges]_block_invoke");
    if (v3)
      v3 = objc_msgSend(v4[5], "shouldEnableUnknownBackgroundActivities");
    v2 = v4;
    if (*((unsigned __int8 *)v4 + 56) != v3)
    {
      *((_BYTE *)v4 + 56) = v3;
      objc_msgSend(v4, "_forceResetBackgroundActivitiesForClients");
      v2 = v4;
    }
  }

}

- (void)recordBundlesChangedForBundleManager:(id)a3
{
  STBundleManager *v4;
  id v5;
  id location;

  v4 = (STBundleManager *)a3;
  objc_initWeak(&location, self);
  if (self->_bundleManager == v4)
  {
    objc_copyWeak(&v5, &location);
    BSDispatchMain();
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);

}

void __68__STBackgroundActivityManager_recordBundlesChangedForBundleManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSupportedBackgroundActivitiesAndVisualDescriptorsFromBundleRecords");

}

- (void)_updateSupportedBackgroundActivitiesAndVisualDescriptorsFromBundleRecords
{
  NSDictionary *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  char v20;
  NSDictionary *visualDescriptors;
  uint64_t v22;
  STBackgroundActivityManager *v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  -[STBundleManager recordIdentifiers](self->_bundleManager, "recordIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  STSystemStatusLogBundleLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v4;
    _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "Bundle manager reports background activity bundle identifiers changed: %{public}@", buf, 0xCu);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    v22 = *(_QWORD *)v32;
    v23 = self;
    do
    {
      v9 = 0;
      v24 = v7;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        -[STBundleManager bundleRecordForRecordIdentifier:](self->_bundleManager, "bundleRecordForRecordIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = v9;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v11, "backgroundActivityIdentifiers");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                objc_msgSend(v11, "visualDescriptorForBackgroundActivityWithIdentifier:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  -[NSDictionary setValue:forKey:](v3, "setValue:forKey:", v18, v17);
                  STSystemStatusLogBundleLoading();
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    v36 = v17;
                    v37 = 2114;
                    v38 = v18;
                    _os_log_debug_impl(&dword_1D12C7000, v19, OS_LOG_TYPE_DEBUG, "Background activity identifier %{public}@ associated with visual descriptor %{public}@", buf, 0x16u);
                  }
                }
                else
                {
                  STSystemStatusLogBundleLoading();
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138477827;
                    v36 = v17;
                    _os_log_error_impl(&dword_1D12C7000, v19, OS_LOG_TYPE_ERROR, "No valid visual descriptor for background activity '%{private}@'", buf, 0xCu);
                  }
                }

              }
              v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
            }
            while (v14);
            v8 = v22;
            self = v23;
            v7 = v24;
          }
          v9 = v26;
        }
        else
        {
          STSystemStatusLogBundleLoading();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v36 = v10;
            _os_log_error_impl(&dword_1D12C7000, v12, OS_LOG_TYPE_ERROR, "Bundle %{private}@ is of unexpected type, expected 'BackgroundActivities'", buf, 0xCu);
          }
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v7);
  }

  v20 = BSEqualObjects();
  visualDescriptors = self->_visualDescriptors;
  self->_visualDescriptors = v3;

  if ((v20 & 1) == 0)
    -[STBackgroundActivityManager _forceResetBackgroundActivitiesForClients](self, "_forceResetBackgroundActivitiesForClients");

}

- (NSString)description
{
  return (NSString *)-[STBackgroundActivityManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STBackgroundActivityManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBackgroundActivityManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBackgroundActivityManager _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STBackgroundActivityManager _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[STBackgroundActivityManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  -[NSMutableSet allObjects](self->_activeBackgroundActivities, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("activeBackgroundActivities"), 0);

  objc_msgSend(v7, "appendDictionarySection:withName:skipIfEmpty:", self->_visualDescriptors, CFSTR("registeredVisualDescriptors"), 0);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_systemStatusDefaults, 0);
  objc_storeStrong((id *)&self->_activeBackgroundActivities, 0);
  objc_storeStrong((id *)&self->_subscribedClients, 0);
  objc_storeStrong((id *)&self->_visualDescriptors, 0);
  objc_storeStrong((id *)&self->_bundleManager, 0);
}

@end

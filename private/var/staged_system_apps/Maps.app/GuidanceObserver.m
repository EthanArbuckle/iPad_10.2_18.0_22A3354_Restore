@implementation GuidanceObserver

- (void)dealloc
{
  uint64_t Log;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  GuidanceObserver *v8;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "(%@) dealloc", buf, 0xCu);
  }

  -[GuidanceObserver _tearDownNavigationIfNeeded](self, "_tearDownNavigationIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v5, "unregisterObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)GuidanceObserver;
  -[GuidanceObserver dealloc](&v6, "dealloc");
}

- (GuidanceObserver)init
{
  GuidanceObserver *v2;
  uint64_t Log;
  NSObject *v4;
  uint64_t v5;
  NSHashTable *outlets;
  uint64_t v7;
  NSMutableDictionary *guidanceUpdates;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  GuidanceObserver *v14;

  v12.receiver = self;
  v12.super_class = (Class)GuidanceObserver;
  v2 = -[GuidanceObserver init](&v12, "init");
  if (v2)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
    v4 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "(%@) init", buf, 0xCu);
    }

    v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    outlets = v2->_outlets;
    v2->_outlets = (NSHashTable *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    guidanceUpdates = v2->_guidanceUpdates;
    v2->_guidanceUpdates = (NSMutableDictionary *)v7;

    -[GuidanceObserver _prepareForActiveNavigationIfNeeded](v2, "_prepareForActiveNavigationIfNeeded");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v9, "registerObserver:", v2);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v2->_currentArrivalState = (unint64_t)objc_msgSend(v10, "arrivalState");

  }
  return v2;
}

- (NSMutableDictionary)classicSignIDs
{
  NSMutableDictionary *classicSignIDs;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  classicSignIDs = self->_classicSignIDs;
  if (!classicSignIDs)
  {
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = self->_classicSignIDs;
    self->_classicSignIDs = v4;

    classicSignIDs = self->_classicSignIDs;
  }
  return classicSignIDs;
}

- (void)setCurrentArrivalState:(unint64_t)a3
{
  uint64_t Log;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  GuidanceObserver *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;

  if (self->_currentArrivalState != a3)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
    v6 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = sub_10064BC50(self->_currentArrivalState);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = sub_10064BC50(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138412802;
      v13 = self;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "(%@) will update arrival state from: %@ to: %@", buf, 0x20u);

    }
    self->_currentArrivalState = a3;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100AF36C0;
    v11[3] = &unk_1011E2380;
    v11[4] = a3;
    -[GuidanceObserver _eachGuidanceOutput:](self, "_eachGuidanceOutput:", v11);
    if (a3 - 4 >= 2)
    {
      if (a3 == 1)
      {
        -[GuidanceObserver _updateDestinationDisplayName](self, "_updateDestinationDisplayName");
        -[GuidanceObserver _updateDisplayETA](self, "_updateDisplayETA");
      }
    }
    else
    {
      -[GuidanceObserver _removeAllRepeatableUpdates](self, "_removeAllRepeatableUpdates");
    }
  }
}

- (void)addOutlet:(id)a3 forOwner:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  int v8;
  GuidanceObserver *v9;
  __int16 v10;
  id v11;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "(%@) adding outlet: %@", (uint8_t *)&v8, 0x16u);
  }

  -[NSHashTable addObject:](self->_outlets, "addObject:", v5);
}

- (void)removeOutlet:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  GuidanceObserver *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "(%@) removing outlet: %@", (uint8_t *)&v7, 0x16u);
  }

  -[NSHashTable removeObject:](self->_outlets, "removeObject:", v4);
}

- (void)_clearAllGuidance
{
  uint64_t Log;
  NSObject *v4;
  MNGuidanceLaneInfo *currentLaneInfo;
  MNGuidanceJunctionViewInfo *currentJunctionViewInfo;
  MNGuidanceSignInfo *currentSignInfo;
  NSArray *currentARInfos;
  int v9;
  GuidanceObserver *v10;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "(%@) _clearAllGuidance", (uint8_t *)&v9, 0xCu);
  }

  -[NSMutableDictionary removeAllObjects](self->_guidanceUpdates, "removeAllObjects");
  currentLaneInfo = self->_currentLaneInfo;
  self->_currentLaneInfo = 0;

  currentJunctionViewInfo = self->_currentJunctionViewInfo;
  self->_currentJunctionViewInfo = 0;

  currentSignInfo = self->_currentSignInfo;
  self->_currentSignInfo = 0;

  currentARInfos = self->_currentARInfos;
  self->_currentARInfos = 0;

  self->_needsUpdate = 0;
  *(_DWORD *)&self->_secondarySignVisible = 0;
}

- (id)_orderedUpdateKinds
{
  if (qword_1014D3F48 != -1)
    dispatch_once(&qword_1014D3F48, &stru_1011E23A0);
  return (id)qword_1014D3F40;
}

- (id)_signRepeatableUpdateKeys
{
  _QWORD v3[3];

  v3[0] = CFSTR("recalculating");
  v3[1] = CFSTR("primaryOrProceedToRouteManeuver");
  v3[2] = CFSTR("secondaryManeuver");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

- (void)_performRepeatableUpdateForKey:(id)a3 onEachGuidanceOutput:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GuidanceObserver _eachGuidanceOutput:](self, "_eachGuidanceOutput:", v6);
  v8 = objc_msgSend(v6, "copy");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_guidanceUpdates, "setObject:forKeyedSubscript:", v8, v7);
}

- (void)_eachGuidanceOutput:(id)a3
{
  -[GuidanceObserver _eachGuidanceOutput:ignorePaused:](self, "_eachGuidanceOutput:ignorePaused:", a3, 0);
}

- (void)_eachGuidanceOutput:(id)a3 ignorePaused:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD);
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  v6 = (void (**)(id, _QWORD))a3;
  if (!self->_paused || v4)
  {
    v8 = -[NSHashTable copy](self->_outlets, "copy");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_removeRepeatableUpdateForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_guidanceUpdates, "removeObjectForKey:", a3);
}

- (void)_removeAllRepeatableUpdatesForKeys:(id)a3
{
  -[NSMutableDictionary removeObjectsForKeys:](self->_guidanceUpdates, "removeObjectsForKeys:", a3);
}

- (void)_removeAllRepeatableUpdates
{
  -[NSMutableDictionary removeAllObjects](self->_guidanceUpdates, "removeAllObjects");
}

- (void)repeatAllUpdatesForOutlet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver _orderedUpdateKinds](self, "_orderedUpdateKinds", 0));
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
          v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceUpdates, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9)));
          v11 = (void *)v10;
          if (v10)
            (*(void (**)(uint64_t, id))(v10 + 16))(v10, v4);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceUpdates, "objectForKeyedSubscript:", CFSTR("secondaryManeuver")));
    if (!v12)
      objc_msgSend(v4, "hideSecondaryManeuver");
  }

}

- (void)_repeatAllUpdatesWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver _orderedUpdateKinds](self, "_orderedUpdateKinds", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceUpdates, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11)));
        v13 = v12;
        if (v12)
        {
          v14 = objc_retainBlock(v12);
          objc_msgSend(v6, "performSelector:withObject:", a4, v14);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)_repeatAllUpdates
{
  uint64_t Log;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  GuidanceObserver *v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "(%@) _repeatAllUpdates", buf, 0xCu);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver _orderedUpdateKinds](self, "_orderedUpdateKinds", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceUpdates, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9)));
        if (v10)
          -[GuidanceObserver _eachGuidanceOutput:ignorePaused:](self, "_eachGuidanceOutput:ignorePaused:", v10, 1);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)pauseUpdates
{
  uint64_t Log;
  NSObject *v4;
  int v5;
  GuidanceObserver *v6;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "(%@) pauseUpdates", (uint8_t *)&v5, 0xCu);
  }

  self->_paused = 1;
}

- (void)resumeUpdates
{
  uint64_t Log;
  NSObject *v4;
  int v5;
  GuidanceObserver *v6;

  if (self->_paused)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
    v4 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "(%@) resumeUpdates", (uint8_t *)&v5, 0xCu);
    }

    self->_paused = 0;
    -[GuidanceObserver _repeatAllUpdates](self, "_repeatAllUpdates");
  }
}

- (void)_processPendingUpdates
{
  uint64_t v3;
  uint64_t Log;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  MNGuidanceSignInfo *currentSignInfo;
  uint64_t v9;
  NSObject *v10;
  MNGuidanceLaneInfo *currentLaneInfo;
  uint64_t v12;
  NSObject *v13;
  int v14;
  GuidanceObserver *v15;

  v3 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_processPendingUpdates (%@)", (uint8_t *)&v14, 0xCu);
  }

  if (self->_needsUpdate)
  {
    v6 = GEOFindOrCreateLog(v3, "GuidanceObserver");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      currentSignInfo = self->_currentSignInfo;
      v14 = 138412290;
      v15 = (GuidanceObserver *)currentSignInfo;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_processSignInfo: %@", (uint8_t *)&v14, 0xCu);
    }

    -[GuidanceObserver _processSignInfo:](self, "_processSignInfo:", self->_currentSignInfo);
    if (self->_currentLaneInfo)
    {
      v9 = GEOFindOrCreateLog(v3, "GuidanceObserver");
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        currentLaneInfo = self->_currentLaneInfo;
        v14 = 138412290;
        v15 = (GuidanceObserver *)currentLaneInfo;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_processShowLaneInfo: %@", (uint8_t *)&v14, 0xCu);
      }

      -[GuidanceObserver _processShowLaneInfo:](self, "_processShowLaneInfo:", self->_currentLaneInfo);
    }
    else if (self->_shouldHideLaneGuidanceThisUpdate)
    {
      v12 = GEOFindOrCreateLog(v3, "GuidanceObserver");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "_processHideLaneInfo", (uint8_t *)&v14, 2u);
      }

      -[GuidanceObserver _processHideLaneInfo](self, "_processHideLaneInfo");
      self->_shouldHideLaneGuidanceThisUpdate = 0;
    }
    if (self->_needsJunctionViewUpdate)
    {
      if (self->_currentJunctionViewInfo)
      {
        -[GuidanceObserver _processShowJunctionViewInfo:](self, "_processShowJunctionViewInfo:");
      }
      else if (self->_shouldHideJunctionViewThisUpdate)
      {
        -[GuidanceObserver _processHideJunctionViewInfo](self, "_processHideJunctionViewInfo");
        self->_shouldHideJunctionViewThisUpdate = 0;
      }
    }
    -[GuidanceObserver _processUsePersistentDisplay](self, "_processUsePersistentDisplay");
    if (self->_needsARInfosUpdate)
      -[GuidanceObserver _processARInfosUpdate:](self, "_processARInfosUpdate:", self->_currentARInfos);
    *(_WORD *)&self->_needsUpdate = 0;
    self->_needsARInfosUpdate = 0;
  }
}

- (void)_processSignInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  GuidanceManeuverArtwork *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NavSignManeuverGuidanceInfo *v53;
  void *v54;
  void *v55;
  void *v56;
  NavSignManeuverGuidanceInfo *v57;
  NavSignManeuverGuidanceInfo *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NavSignManeuverGuidanceInfo *v108;
  void *v109;
  void *v110;
  NavSignManeuverGuidanceInfo *v111;
  NavSignManeuverGuidanceInfo *v112;
  GuidanceManeuverArtwork *v113;
  void *v114;
  NavSignManeuverGuidanceInfo *v115;
  id v116;
  void *v117;
  void *v118;
  GuidanceManeuverArtwork *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  GuidanceObserver *v123;
  id v124;
  GuidanceManeuverArtwork *v125;
  _QWORD v126[4];
  NavSignManeuverGuidanceInfo *v127;
  _QWORD v128[4];
  id v129;
  _QWORD v130[4];
  id v131;
  _QWORD v132[4];
  NavSignManeuverGuidanceInfo *v133;
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primarySign"));
    if (v6)
    {

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));

      if (!v7)
        goto LABEL_22;
    }
    v8 = objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "junction"));
    v123 = self;
    v118 = (void *)v8;
    if (objc_msgSend(v10, "numElements"))
    {
      v11 = objc_alloc((Class)MKJunction);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "junction"));
      v124 = objc_msgSend(v11, "initWithJunction:", v13);

    }
    else
    {
      v124 = 0;
    }

    v14 = [GuidanceManeuverArtwork alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "junction"));
    v17 = objc_msgSend(v16, "maneuverType");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "junction"));
    v20 = objc_msgSend(v19, "drivingSide");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "artworkOverride"));
    v125 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v14, "initWithManeuver:junction:drivingSide:artworkDataSource:", v17, v124, v20, v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "primaryStrings"));
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "primaryStrings"));
      v28 = sub_10039DCD4(v27, &stru_1011E23E0);
      v122 = objc_claimAutoreleasedReturnValue(v28);

      v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "secondaryStrings"));
      v31 = sub_10039DCD4(v30, &stru_1011E2400);
      v121 = objc_claimAutoreleasedReturnValue(v31);
    }
    else
    {
      v32 = objc_alloc((Class)MKServerFormattedStringParameters);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
      v34 = objc_msgSend(v33, "distanceDetailLevel");
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "variableOverrides"));
      v37 = objc_msgSend(v32, "initWithInstructionsDistanceDetailLevel:variableOverrides:", v34, v36);

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "titles"));
      v137[0] = _NSConcreteStackBlock;
      v137[1] = 3221225472;
      v137[2] = sub_100AF4F60;
      v137[3] = &unk_1011B1CB8;
      v40 = v37;
      v138 = v40;
      v41 = sub_10039DCD4(v39, v137);
      v122 = objc_claimAutoreleasedReturnValue(v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "details"));
      v135[0] = _NSConcreteStackBlock;
      v135[1] = 3221225472;
      v135[2] = sub_100AF4FB4;
      v135[3] = &unk_1011B1CB8;
      v136 = v40;
      v29 = v40;
      v44 = sub_10039DCD4(v43, v135);
      v121 = objc_claimAutoreleasedReturnValue(v44);

      v30 = v138;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver _signRepeatableUpdateKeys](v123, "_signRepeatableUpdateKeys"));
    -[GuidanceObserver _removeAllRepeatableUpdatesForKeys:](v123, "_removeAllRepeatableUpdatesForKeys:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v47 = objc_msgSend(v46, "shieldID");
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "shieldStringID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "shieldText"));
    v52 = objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", v47, v49, v51));

    v53 = [NavSignManeuverGuidanceInfo alloc];
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primarySign"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "uniqueID"));
    v56 = (void *)v121;
    v117 = (void *)v52;
    v57 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v53, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v55, v125, v122, v121, v52);

    v132[0] = _NSConcreteStackBlock;
    v132[1] = 3221225472;
    v132[2] = sub_100AF5008;
    v132[3] = &unk_1011E2428;
    v58 = v57;
    v133 = v58;
    v59 = v118;
    v134 = v59;
    -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](v123, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("primaryOrProceedToRouteManeuver"), v132);
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));

    if (v60)
    {
      v116 = v59;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "junction"));
      v115 = v58;
      if (objc_msgSend(v62, "numElements"))
      {
        v63 = objc_alloc((Class)MKJunction);
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "junction"));
        v66 = objc_msgSend(v63, "initWithJunction:", v65);

      }
      else
      {
        v66 = 0;
      }

      v119 = [GuidanceManeuverArtwork alloc];
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "junction"));
      v72 = objc_msgSend(v71, "maneuverType");
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "junction"));
      v75 = objc_msgSend(v74, "drivingSide");
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "artworkOverride"));
      v114 = v66;
      v113 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v119, "initWithManeuver:junction:drivingSide:artworkDataSource:", v72, v66, v75, v77);

      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "primaryStrings"));
      v80 = objc_msgSend(v79, "count");

      if (v80)
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "primaryStrings"));
        v83 = sub_10039DCD4(v82, &stru_1011E2448);
        v120 = (void *)objc_claimAutoreleasedReturnValue(v83);

        v84 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "secondaryStrings"));
        v86 = sub_10039DCD4(v85, &stru_1011E2468);
        v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
      }
      else
      {
        v88 = objc_alloc((Class)MKServerFormattedStringParameters);
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
        v90 = objc_msgSend(v89, "distanceDetailLevel");
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "variableOverrides"));
        v93 = objc_msgSend(v88, "initWithInstructionsDistanceDetailLevel:variableOverrides:", v90, v92);

        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "titles"));
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472;
        v130[2] = sub_100AF50D8;
        v130[3] = &unk_1011B1CB8;
        v96 = v93;
        v131 = v96;
        v97 = sub_10039DCD4(v95, v130);
        v120 = (void *)objc_claimAutoreleasedReturnValue(v97);

        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "details"));
        v128[0] = _NSConcreteStackBlock;
        v128[1] = 3221225472;
        v128[2] = sub_100AF512C;
        v128[3] = &unk_1011B1CB8;
        v129 = v96;
        v84 = v96;
        v100 = sub_10039DCD4(v99, v128);
        v87 = (void *)objc_claimAutoreleasedReturnValue(v100);

        v85 = v131;
      }

      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v102 = objc_msgSend(v101, "shieldID");
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "shieldStringID"));
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "shieldText"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", v102, v104, v106));

      v108 = [NavSignManeuverGuidanceInfo alloc];
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "secondarySign"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "uniqueID"));
      v111 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v108, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v110, v113, v120, v87, v107);

      v123->_secondarySignVisible = 1;
      v126[0] = _NSConcreteStackBlock;
      v126[1] = 3221225472;
      v126[2] = sub_100AF5180;
      v126[3] = &unk_1011E2490;
      v127 = v111;
      v112 = v111;
      -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](v123, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("secondaryManeuver"), v126);

      v68 = v124;
      v56 = (void *)v121;
      v67 = (void *)v122;
      v59 = v116;
      v69 = v117;
      v58 = v115;
    }
    else
    {
      v67 = (void *)v122;
      v68 = v124;
      v69 = v117;
      if (v123->_secondarySignVisible)
      {
        v123->_secondarySignVisible = 0;
        -[GuidanceObserver _eachGuidanceOutput:](v123, "_eachGuidanceOutput:", &stru_1011E24D0);
        -[GuidanceObserver _removeRepeatableUpdateForKey:](v123, "_removeRepeatableUpdateForKey:", CFSTR("secondaryManeuver"));
      }
    }

  }
LABEL_22:

}

- (void)_processShowLaneInfo:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100AF5224;
  v5[3] = &unk_1011E2490;
  v6 = a3;
  v4 = v6;
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("showLaneGuidanceInfo"), v5);
  -[GuidanceObserver _removeRepeatableUpdateForKey:](self, "_removeRepeatableUpdateForKey:", CFSTR("hideLaneGuidanceInfo"));

}

- (void)_processHideLaneInfo
{
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("hideLaneGuidanceInfo"), &stru_1011E24F0);
  -[GuidanceObserver _removeRepeatableUpdateForKey:](self, "_removeRepeatableUpdateForKey:", CFSTR("showLaneGuidanceInfo"));
}

- (void)_processShowJunctionViewInfo:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100AF5428;
  v5[3] = &unk_1011E2490;
  v6 = a3;
  v4 = v6;
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("showJunctionViewInfo"), v5);
  -[GuidanceObserver _removeRepeatableUpdateForKey:](self, "_removeRepeatableUpdateForKey:", CFSTR("hideJunctionViewInfo"));

}

- (void)_processHideJunctionViewInfo
{
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("hideJunctionViewInfo"), &stru_1011E2510);
  -[GuidanceObserver _removeRepeatableUpdateForKey:](self, "_removeRepeatableUpdateForKey:", CFSTR("showJunctionViewInfo"));
}

- (void)_processUsePersistentDisplay
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100AF55B8;
  v3[3] = &unk_1011E2538;
  objc_copyWeak(&v4, &location);
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("usePersistentDisplay"), v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_processARInfosUpdate:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100AF569C;
  v5[3] = &unk_1011E2490;
  v6 = a3;
  v4 = v6;
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("ARSignInfos"), v5);

}

- (void)_prepareForActiveNavigationIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v5, "isInNavigatingState"))
  {
    if (!self->_destinationDisplayName)
      -[GuidanceObserver _updateDestinationDisplayName](self, "_updateDestinationDisplayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentMode"));
    objc_msgSend(v4, "size");
    +[NavJunctionViewController updateJunctionImageSizeForScreenSize:](NavJunctionViewController, "updateJunctionImageSizeForScreenSize:");

  }
  else
  {
    -[GuidanceObserver _tearDownNavigationIfNeeded](self, "_tearDownNavigationIfNeeded");
  }

}

- (void)_tearDownNavigationIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  NSString *destinationDisplayName;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = objc_msgSend(v3, "isInNavigatingState");

  if ((v4 & 1) == 0)
  {
    destinationDisplayName = self->_destinationDisplayName;
    self->_destinationDisplayName = 0;

    -[GuidanceObserver _clearAllGuidance](self, "_clearAllGuidance");
  }
}

- (void)_updateDestinationDisplayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSString **p_destinationDisplayName;
  unint64_t v15;
  unint64_t v16;
  NSString *v17;
  unsigned __int8 v18;
  _QWORD v19[4];
  id v20;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));
  v5 = objc_msgSend(v4, "legIndexForStepIndex:", objc_msgSend(v3, "stepIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs"));
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs"));
  v9 = v8;
  if (v5 >= v7)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v5));
  v11 = (void *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destination"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navDisplayName"));

  p_destinationDisplayName = &self->_destinationDisplayName;
  v15 = self->_destinationDisplayName;
  v16 = v13;
  if (v16 | v15)
  {
    v18 = objc_msgSend((id)v15, "isEqual:", v16);

    objc_storeStrong((id *)&self->_destinationDisplayName, v13);
    if ((v18 & 1) == 0)
    {
      -[GuidanceObserver _removeRepeatableUpdateForKey:](self, "_removeRepeatableUpdateForKey:", CFSTR("destinationDisplayName"));
      objc_initWeak(&location, self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100AF59E8;
      v19[3] = &unk_1011E2538;
      objc_copyWeak(&v20, &location);
      -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("destinationDisplayName"), v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v17 = *p_destinationDisplayName;
    *p_destinationDisplayName = 0;

  }
}

- (void)_updateDisplayETA
{
  void *v3;
  GuidanceETA *v4;
  GuidanceETA *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t Log;
  NSObject *v12;
  GuidanceETA *v13;
  _QWORD v14[4];
  GuidanceETA *v15;
  uint8_t buf[4];
  GuidanceObserver *v17;
  __int16 v18;
  GuidanceETA *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v3, "navigationState") == 5)
  {
    v4 = 0;
  }
  else
  {
    v5 = [GuidanceETA alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayEtaInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remainingDistanceInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "batteryChargeInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "upcomingStop"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timezone"));
    v4 = -[GuidanceETA initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:](v5, "initWithDisplayETA:remainingDistance:batteryChargeInfo:destinationTimeZone:transportType:", v6, v7, v8, v10, objc_msgSend(v3, "navigationTransportType"));

  }
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
  v12 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "(%@) _updateDisplayETA to: %@", buf, 0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100AF5C2C;
  v14[3] = &unk_1011E2490;
  v15 = v4;
  v13 = v4;
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("remainingTotalTimeAndDistance"), v14);

}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, a3))
    -[GuidanceObserver _prepareForActiveNavigationIfNeeded](self, "_prepareForActiveNavigationIfNeeded");
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;

  v8 = a3;
  if (MNNavigationServiceStateChangedFromNavigatingToStopped(a4, a5))
  {
    -[GuidanceObserver _eachGuidanceOutput:](self, "_eachGuidanceOutput:", &stru_1011E2558);
    -[GuidanceObserver _removeAllRepeatableUpdates](self, "_removeAllRepeatableUpdates");
    -[GuidanceObserver _tearDownNavigationIfNeeded](self, "_tearDownNavigationIfNeeded");
    -[NSHashTable removeAllObjects](self->_outlets, "removeAllObjects");
  }
  -[GuidanceObserver _updateArrivalStateWithService:](self, "_updateArrivalStateWithService:", v8);

}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AF5D50;
  v4[3] = &unk_1011E2578;
  v5 = a4;
  -[GuidanceObserver _eachGuidanceOutput:](self, "_eachGuidanceOutput:", v4);
}

- (void)navigationService:(id)a3 usePersistentDisplay:(BOOL)a4
{
  self->_usePersistentDisplay = a4;
  self->_needsUpdate = 1;
}

- (void)navigationServiceWillReroute:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver _signRepeatableUpdateKeys](self, "_signRepeatableUpdateKeys", a3));
  -[GuidanceObserver _removeAllRepeatableUpdatesForKeys:](self, "_removeAllRepeatableUpdatesForKeys:", v4);

  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("recalculating"), &stru_1011E2598);
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v7;
  id v8;
  NSMutableDictionary *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_new(NSMutableDictionary);
  -[GuidanceObserver setClassicSignIDs:](self, "setClassicSignIDs:", v9);

  -[GuidanceObserver _updateDestinationDisplayName](self, "_updateDestinationDisplayName");
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AF5EF8;
  v10[3] = &unk_1011E2538;
  objc_copyWeak(&v11, &location);
  -[GuidanceObserver _eachGuidanceOutput:](self, "_eachGuidanceOutput:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)navigationService:(id)a3 failedRerouteWithErrorCode:(int64_t)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver _signRepeatableUpdateKeys](self, "_signRepeatableUpdateKeys", a3, a4));
  -[GuidanceObserver _removeAllRepeatableUpdatesForKeys:](self, "_removeAllRepeatableUpdatesForKeys:", v5);

  -[GuidanceObserver _eachGuidanceOutput:](self, "_eachGuidanceOutput:", &stru_1011E25B8);
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver _signRepeatableUpdateKeys](self, "_signRepeatableUpdateKeys", a3));
  -[GuidanceObserver _removeAllRepeatableUpdatesForKeys:](self, "_removeAllRepeatableUpdatesForKeys:", v4);

  -[GuidanceObserver _eachGuidanceOutput:](self, "_eachGuidanceOutput:", &stru_1011E25D8);
}

- (void)navigationServiceEndGuidanceUpdate:(id)a3
{
  -[GuidanceObserver _processPendingUpdates](self, "_processPendingUpdates", a3);
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (v6)
  {
    self->_usingSignInfo = 1;
    v7 = v6;
    objc_storeStrong((id *)&self->_currentSignInfo, a4);
    v6 = v7;
    self->_needsUpdate = 1;
  }

}

- (void)navigationService:(id)a3 updateSignsWithARInfo:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  id v8;
  void *v9;
  NSArray *v10;
  NSArray *currentARInfos;
  int v12;
  void *v13;

  v5 = a4;
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = sub_10039DCD4(v5, &stru_1011E2618);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Got AR guidance infos: %@", (uint8_t *)&v12, 0xCu);

    }
    v10 = (NSArray *)objc_msgSend(v5, "copy");
    currentARInfos = self->_currentARInfos;
    self->_currentARInfos = v10;

    self->_needsARInfosUpdate = 1;
    self->_needsUpdate = 1;
  }

}

- (void)_updateArrivalStateWithService:(id)a3
{
  -[GuidanceObserver setCurrentArrivalState:](self, "setCurrentArrivalState:", objc_msgSend(a3, "arrivalState"));
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  -[GuidanceObserver _updateArrivalStateWithService:](self, "_updateArrivalStateWithService:", a3, a4, a5, a6);
  -[GuidanceObserver _updateDisplayETA](self, "_updateDisplayETA");
  -[GuidanceObserver _removeAllRepeatableUpdates](self, "_removeAllRepeatableUpdates");
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  MNGuidanceLaneInfo *v6;
  MNGuidanceLaneInfo *v7;

  v6 = (MNGuidanceLaneInfo *)a4;
  if (v6 && self->_currentLaneInfo != v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&self->_currentLaneInfo, a4);
    v6 = v7;
    self->_shouldHideLaneGuidanceThisUpdate = 0;
    self->_needsUpdate = 1;
  }

}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  MNGuidanceLaneInfo *currentLaneInfo;

  if (a4)
  {
    currentLaneInfo = self->_currentLaneInfo;
    self->_currentLaneInfo = 0;

    self->_shouldHideLaneGuidanceThisUpdate = 1;
    self->_needsUpdate = 1;
  }
}

- (void)navigationService:(id)a3 showJunctionView:(id)a4
{
  id v6;
  MNGuidanceJunctionViewInfo *v7;
  MNGuidanceJunctionViewInfo *currentJunctionViewInfo;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t Log;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = (MNGuidanceJunctionViewInfo *)a4;
  if (v7)
  {
    currentJunctionViewInfo = self->_currentJunctionViewInfo;
    if (currentJunctionViewInfo != v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceJunctionViewInfo uniqueID](currentJunctionViewInfo, "uniqueID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MNGuidanceJunctionViewInfo uniqueID](v7, "uniqueID"));
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if ((v11 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_currentJunctionViewInfo, a4);
        self->_shouldHideJunctionViewThisUpdate = 0;
        *(_WORD *)&self->_needsUpdate = 257;
      }
    }
  }
  else
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "GuidanceObserver");
    v13 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No junction view info received from nav service.", v14, 2u);
    }

  }
}

- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4
{
  MNGuidanceJunctionViewInfo *currentJunctionViewInfo;

  if (a4)
  {
    currentJunctionViewInfo = self->_currentJunctionViewInfo;
    self->_currentJunctionViewInfo = 0;

    self->_shouldHideJunctionViewThisUpdate = 1;
    *(_WORD *)&self->_needsUpdate = 257;
  }
}

- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  double v24;

  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v13 = objc_msgSend(v12, "navigationState");

  if (v13 != 5)
  {
    -[GuidanceObserver _removeRepeatableUpdateForKey:](self, "_removeRepeatableUpdateForKey:", CFSTR("recalculating"));
    -[GuidanceObserver _removeRepeatableUpdateForKey:](self, "_removeRepeatableUpdateForKey:", CFSTR("remainingManeuverTimeAndDistance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "steps"));
    v16 = objc_msgSend(v15, "count");

    if ((unint64_t)v16 > a6)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "steps"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", a6));

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100AF6630;
      v21[3] = &unk_1011E2640;
      v24 = a4;
      v22 = v11;
      v23 = v19;
      v20 = v19;
      -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("primaryOrProceedToRouteManeuver"), v21);

    }
  }

}

- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  double v26;
  unint64_t v27;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "steps"));
  v13 = objc_msgSend(v12, "count");

  if ((unint64_t)v13 > a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "steps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", a6));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentsForContext:", 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringForDistance:", a4));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mkServerFormattedString"));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100AF67AC;
    v22[3] = &unk_1011E2668;
    v25 = a5;
    v26 = a4;
    v23 = v19;
    v24 = v16;
    v27 = a6;
    v20 = v16;
    v21 = v19;
    -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("remainingManeuverTimeAndDistance"), v22);

  }
}

- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  GuidanceManeuverArtwork *v24;
  id v25;
  void *v26;
  GuidanceManeuverArtwork *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NavSignManeuverGuidanceInfo *v32;
  void *v33;
  void *v34;
  void *v35;
  NavSignManeuverGuidanceInfo *v36;
  NavSignManeuverGuidanceInfo *v37;
  _QWORD v39[4];
  NavSignManeuverGuidanceInfo *v40;
  unint64_t v41;

  v10 = *(_QWORD *)&a8;
  v14 = a4;
  self->_usingSignInfo = 0;
  v15 = a7;
  v16 = a5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver classicSignIDs](self, "classicSignIDs"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a9));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));

  if (!v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver classicSignIDs](self, "classicSignIDs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a9));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

  }
  if (objc_msgSend(v14, "junctionElements"))
    v23 = objc_msgSend(objc_alloc((Class)MKJunction), "initWithType:maneuver:drivingSide:elements:count:", objc_msgSend(v14, "junctionType"), objc_msgSend(v14, "maneuverType"), v10, objc_msgSend(v14, "junctionElements"), objc_msgSend(v14, "junctionElementsCount"));
  else
    v23 = 0;
  v24 = [GuidanceManeuverArtwork alloc];
  v25 = objc_msgSend(v14, "maneuverType");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "artworkOverride"));
  v27 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v24, "initWithManeuver:junction:drivingSide:artworkDataSource:", v25, v23, v10, v26);

  v28 = sub_10039DCD4(v16, &stru_1011E2688);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver _signRepeatableUpdateKeys](self, "_signRepeatableUpdateKeys"));
  -[GuidanceObserver _removeAllRepeatableUpdatesForKeys:](self, "_removeAllRepeatableUpdatesForKeys:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", a6, 0, v15));
  v32 = [NavSignManeuverGuidanceInfo alloc];
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver classicSignIDs](self, "classicSignIDs"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a9));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v34));
  v36 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v32, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v35, v27, 0, v29, v31);

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100AF6AEC;
  v39[3] = &unk_1011E26B0;
  v40 = v36;
  v41 = a9;
  v37 = v36;
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("primaryOrProceedToRouteManeuver"), v39);

}

- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AF6B50;
  v4[3] = &unk_1011E2380;
  v4[4] = a4;
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("announcementStage"), v4);
}

- (void)navigationService:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  uint64_t v8;
  uint64_t v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  GuidanceManeuverArtwork *v23;
  id v24;
  void *v25;
  GuidanceManeuverArtwork *v26;
  id v27;
  void *v28;
  void *v29;
  NavSignManeuverGuidanceInfo *v30;
  void *v31;
  void *v32;
  void *v33;
  NavSignManeuverGuidanceInfo *v34;
  NavSignManeuverGuidanceInfo *v35;
  _QWORD v36[4];
  NavSignManeuverGuidanceInfo *v37;

  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  v13 = a4;
  v14 = a7;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver classicSignIDs](self, "classicSignIDs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "stepID")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));

  if (!v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver classicSignIDs](self, "classicSignIDs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "stepID")));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

  }
  if (objc_msgSend(v13, "junctionElements"))
    v22 = objc_msgSend(objc_alloc((Class)MKJunction), "initWithType:maneuver:drivingSide:elements:count:", objc_msgSend(v13, "junctionType"), objc_msgSend(v13, "maneuverType"), v8, objc_msgSend(v13, "junctionElements"), objc_msgSend(v13, "junctionElementsCount"));
  else
    v22 = 0;
  v23 = [GuidanceManeuverArtwork alloc];
  v24 = objc_msgSend(v13, "maneuverType");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "artworkOverride"));
  v26 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v23, "initWithManeuver:junction:drivingSide:artworkDataSource:", v24, v22, v8, v25);

  v27 = sub_10039DCD4(v15, &stru_1011E26D0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", v10, 0, v14));
  v30 = [NavSignManeuverGuidanceInfo alloc];
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceObserver classicSignIDs](self, "classicSignIDs"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "stepID")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v32));
  v34 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v30, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v33, v26, 0, v28, v29);

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100AF6E74;
  v36[3] = &unk_1011E2490;
  v37 = v34;
  v35 = v34;
  -[GuidanceObserver _performRepeatableUpdateForKey:onEachGuidanceOutput:](self, "_performRepeatableUpdateForKey:onEachGuidanceOutput:", CFSTR("secondaryManeuver"), v36);

}

- (void)navigationServiceDidHideSecondaryStep:(id)a3
{
  -[GuidanceObserver _eachGuidanceOutput:](self, "_eachGuidanceOutput:", &stru_1011E26F0);
  -[GuidanceObserver _removeRepeatableUpdateForKey:](self, "_removeRepeatableUpdateForKey:", CFSTR("secondaryManeuver"));
}

- (void)setClassicSignIDs:(id)a3
{
  objc_storeStrong((id *)&self->_classicSignIDs, a3);
}

- (unint64_t)currentArrivalState
{
  return self->_currentArrivalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classicSignIDs, 0);
  objc_storeStrong((id *)&self->_currentJunctionViewInfo, 0);
  objc_storeStrong((id *)&self->_currentLaneInfo, 0);
  objc_storeStrong((id *)&self->_currentARInfos, 0);
  objc_storeStrong((id *)&self->_currentSignInfo, 0);
  objc_storeStrong((id *)&self->_destinationDisplayName, 0);
  objc_storeStrong((id *)&self->_outlets, 0);
  objc_storeStrong((id *)&self->_guidanceUpdates, 0);
}

@end

@implementation TVPPlaybackReportingEventCollection

- (void)setVideoType:(int64_t)a3
{
  self->_videoType = a3;
}

- (void)addSingleShotEventWithName:(id)a3 value:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:](self, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", a3, 3, 0, a4, 0, 0, v4);
}

- (void)addOrReplaceStartEventWithName:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    -[TVPPlaybackReportingEventCollection eventArray](self, "eventArray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __75__TVPPlaybackReportingEventCollection_addOrReplaceStartEventWithName_date___block_invoke;
    v16[3] = &unk_24F15BAF8;
    v9 = v6;
    v17 = v9;
    v18 = &v19;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);

    if (v20[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, "Replacing start event with name %@", buf, 0xCu);
      }
      -[TVPPlaybackReportingEventCollection eventArray](self, "eventArray");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectAtIndex:", v20[3]);

      -[TVPPlaybackReportingEventCollection openEvents](self, "openEvents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v9);

    }
  }
  if (v7)
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  LOBYTE(v15) = 0;
  -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:](self, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", v6, 0, 0, 0, v14, 0, v15);

  _Block_object_dispose(&v19, 8);
}

- (void)_addEventWithName:(id)a3 type:(int64_t)a4 identifier:(id)a5 value:(id)a6 timestamp:(id)a7 forceAdd:(BOOL)a8 isUIInteraction:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  TVPPlaybackReportingEvent *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  TVPPlaybackReportingEvent *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t v32[16];

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (a8 || !-[TVPPlaybackReportingEventCollection complete](self, "complete"))
  {
    if (objc_msgSend((id)sFPSIndividualEvents, "containsObject:", v15)
      && -[TVPPlaybackReportingEventCollection initialFPSRequestsComplete](self, "initialFPSRequestsComplete"))
    {
      v19 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring FPS event since initial FPS requests are already complete.", v32, 2u);
      }
    }
    else
    {
      v20 = objc_alloc_init(TVPPlaybackReportingEvent);
      if (!v16)
        v16 = v15;
      -[TVPPlaybackReportingEvent setName:](v20, "setName:", v15);
      if (v18)
        objc_msgSend(v18, "doubleValue");
      else
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      -[TVPPlaybackReportingEvent setTimestamp:](v20, "setTimestamp:");
      -[TVPPlaybackReportingEvent setType:](v20, "setType:", a4);
      -[TVPPlaybackReportingEvent setValue:](v20, "setValue:", v17);
      -[TVPPlaybackReportingEvent setIsUIInteraction:](v20, "setIsUIInteraction:", a9);
      -[TVPPlaybackReportingEventCollection eventArray](self, "eventArray");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v20);

      if (a4)
      {
        if ((unint64_t)a4 <= 2)
        {
          -[TVPPlaybackReportingEventCollection openEvents](self, "openEvents");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[TVPPlaybackReportingEvent setStartEvent:](v20, "setStartEvent:", v23);
          -[TVPPlaybackReportingEventCollection openEvents](self, "openEvents");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObjectForKey:", v16);

          if (!v23)
          {
            v25 = sLogObject_0;
            if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
              -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:].cold.1((uint64_t)v15, v25);
            -[TVPPlaybackReportingEventCollection eventArray](self, "eventArray");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeObject:", v20);

            if (!-[TVPPlaybackReportingEventCollection containsEventWithName:](self, "containsEventWithName:", CFSTR("reportingKeysWereOmittedDueToReportingError")))
            {
              v27 = objc_alloc_init(TVPPlaybackReportingEvent);
              -[TVPPlaybackReportingEvent setName:](v27, "setName:", CFSTR("reportingKeysWereOmittedDueToReportingError"));
              objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
              -[TVPPlaybackReportingEvent setTimestamp:](v27, "setTimestamp:");
              -[TVPPlaybackReportingEvent setType:](v27, "setType:", 3);
              -[TVPPlaybackReportingEvent setValue:](v27, "setValue:", MEMORY[0x24BDBD1C8]);
              -[TVPPlaybackReportingEventCollection eventArray](self, "eventArray");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v27);

            }
          }

        }
      }
      else
      {
        -[TVPPlaybackReportingEventCollection openEvents](self, "openEvents");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", v16);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          -[TVPPlaybackReportingEventCollection openEvents](self, "openEvents");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v20, v16);

        }
      }

    }
  }

}

- (NSMutableDictionary)openEvents
{
  return self->_openEvents;
}

- (NSMutableArray)eventArray
{
  return self->_eventArray;
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)addStartEventWithName:(id)a3
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:](self, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", a3, 0, 0, 0, 0, 0, v3);
}

void __75__TVPPlaybackReportingEventCollection_addOrReplaceStartEventWithName_date___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v8 = objc_msgSend(v9, "type");

    if (!v8)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  else
  {

  }
}

- (TVPPlaybackReportingEventCollection)init
{
  TVPPlaybackReportingEventCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *eventArray;
  NSMutableDictionary *v5;
  NSMutableDictionary *openEvents;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVPPlaybackReportingEventCollection;
  v2 = -[TVPPlaybackReportingEventCollection init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    eventArray = v2->_eventArray;
    v2->_eventArray = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    openEvents = v2->_openEvents;
    v2->_openEvents = v5;

    v2->_videoType = 0;
  }
  return v2;
}

void __49__TVPPlaybackReportingEventCollection_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = os_log_create("com.apple.AppleTV.playback", "TVPPlaybackReportingEventCollection");
  v1 = (void *)sLogObject_0;
  sLogObject_0 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", TVPPlaybackReportingEventTotalStartupSequence, TVPPlaybackReportingEventPrepareForLoading, TVPPlaybackReportingEventEnsureSufficientDiskSpace, TVPPlaybackReportingEventLoadAVAssetKeysPrimary, TVPPlaybackReportingEventLoadAVAssetKeysSecondary, TVPPlaybackReportingEventLoadAVAssetKeysTotal, TVPPlaybackReportingEventPrepareForPlaybackInitiation, TVPPlaybackReportingEventBookmarkSync, TVPPlaybackReportingEventBuyProduct, TVPPlaybackReportingEventBuyProductServerProcessingTimeMS, TVPPlaybackReportingEventBuyProductBlockedPlaybackStartup, TVPPlaybackReportingEventFetchRental, TVPPlaybackReportingEventLoadBumperConfig, TVPPlaybackReportingEventRentalCheckout, TVPPlaybackReportingEventRentalCheckoutServerProcessingTimeMS, TVPPlaybackReportingEventCRABSLease, TVPPlaybackReportingEventCRABSLeaseServerProcessingTimeMS,
    TVPPlaybackReportingEventPlaybackStartupResult,
    TVPPlaybackReportingEventError,
    TVPPlaybackReportingEventErrorEvent,
    TVPPlaybackReportingEventTotalUIStartupTimeNotIncludingUserInteraction,
    CFSTR("fpsLongestCertFetchTime"),
    CFSTR("fpsLongestRequestDataGenerationTime"),
    CFSTR("fpsLongestServerFetchAsMeasuredByAppTime"),
    CFSTR("fpsLongestServerProcessingTime"),
    CFSTR("fpsLongestFetchTime"),
    CFSTR("fpsFetchCount"),
    TVPPlaybackReportingEventRentalCheckoutDoneInParallelWithFPSKeyFetch,
    TVPPlaybackReportingEventBookmarkSyncPerformed,
    TVPPlaybackReportingEventSyncedBookmarkMatchesPreviousBookmark,
    TVPPlaybackReportingEventFPSURLBagFetch,
    TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp,
    TVPPlaybackReportingEventWaitingForTimeControlStatus,
    TVPPlaybackReportingEventUserPlayToLoadingInitiation,
    CFSTR("reportingKeysWereOmittedDueToReportingError"),
    TVPPlaybackReportingEventOpenURLTime,
    TVPPlaybackReportingEventPlaybackInitiationAction,
    TVPPlaybackReportingEventLinearTokenFetch,
    TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus,
    TVPPlaybackReportingEventHLSPlaylistPreloadState,
    0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sReportableEvents;
  sReportableEvents = v2;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", TVPPlaybackReportingEventFPSCertFetch, TVPPlaybackReportingEventFPSRequestDataGeneration, TVPPlaybackReportingEventFPSServerKeyFetch, TVPPlaybackReportingEventFPSServerProcessingTimeMS, TVPPlaybackReportingEventFPSOverallFetch, TVPPlaybackReportingEventFPSUsingCachedCertData, TVPPlaybackReportingEventLinearTokenFetch, TVPPlaybackReportingEventFetchLocationAuthorizationStatus, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)sFPSIndividualEvents;
  sFPSIndividualEvents = v4;

}

- (void)addEndEventWithName:(id)a3
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:](self, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", a3, 1, 0, 0, 0, 0, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openEvents, 0);
  objc_storeStrong((id *)&self->_eventArray, 0);
}

+ (void)initialize
{
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_3);
}

- (void)addStartEventWithName:(id)a3 isUIInteraction:(BOOL)a4
{
  uint64_t v4;

  LOBYTE(v4) = a4;
  -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:](self, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", a3, 0, 0, 0, 0, 0, v4);
}

- (void)addStartEventWithName:(id)a3 identifier:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:](self, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", a3, 0, a4, 0, 0, 0, v4);
}

- (void)addEndEventWithName:(id)a3 identifier:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:](self, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", a3, 1, a4, 0, 0, 0, v4);
}

- (void)addEndEventWithName:(id)a3 identifier:(id)a4 timestamp:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[TVPPlaybackReportingEventCollection _addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:](self, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", a3, 1, a4, 0, a5, 0, v5);
}

- (BOOL)containsEventWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[TVPPlaybackReportingEventCollection eventArray](self, "eventArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__TVPPlaybackReportingEventCollection_containsEventWithName___block_invoke;
  v8[3] = &unk_24F15BAF8;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __61__TVPPlaybackReportingEventCollection_containsEventWithName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setComplete:(BOOL)a3
{
  if (self->_complete != a3)
  {
    self->_complete = a3;
    -[TVPPlaybackReportingEventCollection _closeOpenEvents](self, "_closeOpenEvents");
  }
}

- (NSDictionary)rtcReportingEventDict
{
  void **p_vtable;
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  __objc2_class *v6;
  __objc2_class *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  int v47;
  double v48;
  NSObject *v49;
  __CFString *v50;
  NSObject *v51;
  __CFString *v52;
  double v53;
  void *v54;
  int v55;
  double v56;
  double v57;
  void *v58;
  int v59;
  double v60;
  void *v61;
  int v62;
  double v63;
  double v64;
  void *v65;
  int v66;
  double v67;
  double v68;
  void *v69;
  int v70;
  double v71;
  void *v72;
  int v73;
  double v74;
  void *v75;
  int v76;
  double v77;
  void *v78;
  int v79;
  double v80;
  void *v81;
  __objc2_class *v82;
  __objc2_class *v83;
  void **v84;
  unint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  int v92;
  void *v93;
  int v94;
  double v95;
  NSObject *v96;
  NSObject *v97;
  __CFString *v98;
  double v99;
  void *v100;
  int v101;
  void *v102;
  double v103;
  void *v104;
  int v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  uint64_t v111;
  double v112;
  NSObject *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  NSObject *v117;
  void *v118;
  NSObject *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  NSObject *v123;
  void *v124;
  NSObject *v125;
  void *v126;
  NSObject *v127;
  void *v128;
  NSObject *v129;
  void *v130;
  NSObject *v131;
  const __CFString *cache;
  void *v133;
  double v134;
  NSObject *v135;
  void *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  NSDictionary *v143;
  void *v145;
  char v146;
  uint64_t v147;
  double v149;
  void *v150;
  id v151;
  uint64_t v152;
  id v153;
  double v154;
  double v155;
  double v156;
  uint64_t v157;
  id obj;
  uint64_t v159;
  double v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint8_t buf[4];
  const __CFString *v166;
  __int16 v167;
  double v168;
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x24BDAC8D0];
  v153 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  p_vtable = TVPChapterCollection.vtable;
  v3 = (id)sLogObject_0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "Playback startup events:", buf, 2u);
  }

  v151 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  -[TVPPlaybackReportingEventCollection eventArray](self, "eventArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v169, 16);
  v5 = 0x24BDD1000uLL;
  v6 = TVPSecureKeyStandardLoader;
  v7 = TVPSecureKeyStandardLoader;
  if (!v4)
  {
    v152 = 0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v155 = 0.0;
    v156 = 0.0;
    v154 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    goto LABEL_103;
  }
  v8 = v4;
  v152 = 0;
  v159 = *(_QWORD *)v162;
  v147 = *MEMORY[0x24BDD1398];
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v155 = 0.0;
  v156 = 0.0;
  v154 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  do
  {
    v17 = 0;
    v157 = v8;
    do
    {
      if (*(_QWORD *)v162 != v159)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v17);
      v19 = (void *)sReportableEvents;
      objc_msgSend(v18, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = objc_msgSend(v19, "containsObject:", v20);

      if ((_DWORD)v19)
      {
        if (objc_msgSend(v18, "type") == 3)
        {
          objc_msgSend(v18, "name");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            objc_msgSend(v18, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v18, "name");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "isEqualToString:", TVPPlaybackReportingEventError);

              objc_msgSend(v18, "value");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v25)
                goto LABEL_21;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = v26;
                objc_msgSend(v27, "userInfo");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectForKey:", v147);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                -[TVPPlaybackReportingEventCollection _setError:inEventDict:errorCodeKey:errorDomainKey:](self, "_setError:inEventDict:errorCodeKey:errorDomainKey:", v27, v153, CFSTR("errorCode"), CFSTR("errorDomain"));
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  -[TVPPlaybackReportingEventCollection _setError:inEventDict:errorCodeKey:errorDomainKey:](self, "_setError:inEventDict:errorCodeKey:errorDomainKey:", v29, v153, CFSTR("underlyingErrorCode"), CFSTR("underlyingErrorDomain"));

                v26 = v27;
                goto LABEL_22;
              }
              goto LABEL_23;
            }
          }
        }
        else if (objc_msgSend(v18, "type") == 1 || objc_msgSend(v18, "type") == 2)
        {
          objc_msgSend(v18, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", objc_msgSend(v18, "durationMS"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
            objc_msgSend(v18, "name");
            v27 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "setObject:forKey:", v26, v27);
LABEL_22:

LABEL_23:
            v8 = v157;
          }
        }
      }
      if (objc_msgSend(v18, "type"))
      {
        if (objc_msgSend(v18, "type") == 3)
        {
          objc_msgSend(v18, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqualToString:", TVPPlaybackReportingEventFPSServerProcessingTimeMS);

          if (v32)
          {
            objc_msgSend(v18, "value");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = objc_msgSend(v33, "integerValue");
              v35 = p_vtable[208];
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                v149 = v16;
                v36 = v15;
                v37 = v12;
                v38 = v14;
                v39 = v13;
                v40 = v10;
                v41 = v11;
                v42 = v9;
                v43 = (double)v34 / 1000.0;
                v44 = v35;
                objc_msgSend(v18, "name");
                v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v166 = v45;
                v167 = 2048;
                v168 = v43;
                v9 = v42;
                v11 = v41;
                v10 = v40;
                v13 = v39;
                v14 = v38;
                v12 = v37;
                v15 = v36;
                v16 = v149;
                _os_log_impl(&dword_228A4E000, v44, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);

              }
            }

          }
          else
          {
            v96 = p_vtable[208];
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              v97 = v96;
              objc_msgSend(v18, "name");
              v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "value");
              v99 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 138412546;
              v166 = v98;
              v167 = 2112;
              v168 = v99;
              _os_log_impl(&dword_228A4E000, v97, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

            }
          }
          objc_msgSend(v18, "name");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend(v100, "isEqualToString:", v6[45].vtable);

          if (v101)
          {
            objc_msgSend(v18, "value");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v102, "doubleValue");
              v11 = v103;
            }

          }
          objc_msgSend(v18, "name");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v104, "isEqualToString:", TVPPlaybackReportingEventFPSServerProcessingTimeMS);

          if (v105)
          {
            objc_msgSend(v18, "value");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v107 = objc_msgSend(v106, "integerValue");
              v108 = v152;
              if (v107 > v152)
                v108 = v107;
              v152 = v108;
            }

          }
          goto LABEL_96;
        }
        if (objc_msgSend(v18, "type") != 1 && objc_msgSend(v18, "type") != 2)
          goto LABEL_96;
        if (objc_msgSend(v18, "type") == 2)
        {
          v49 = p_vtable[208];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "name");
            v50 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v166 = v50;
            _os_log_impl(&dword_228A4E000, v49, OS_LOG_TYPE_DEFAULT, "Aborted event: %@", buf, 0xCu);

          }
        }
        v51 = p_vtable[208];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "name");
          v52 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "duration");
          *(_DWORD *)buf = 138412546;
          v166 = v52;
          v167 = 2048;
          v168 = v53;
          _os_log_impl(&dword_228A4E000, v51, OS_LOG_TYPE_DEFAULT, "%@Duration: %f", buf, 0x16u);

        }
        objc_msgSend(v18, "name");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "isEqualToString:", TVPPlaybackReportingEventFPSCertFetch);

        if (v55)
        {
          objc_msgSend(v18, "duration");
          v57 = v154;
          if (v56 >= v154)
            v57 = v56;
          v154 = v57;
        }
        objc_msgSend(v18, "name");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "isEqualToString:", TVPPlaybackReportingEventFPSOverallFetch);

        if (v59)
        {
          objc_msgSend(v151, "addObject:", v18);
          objc_msgSend(v18, "timestamp");
          objc_msgSend(v18, "duration");
          if (v60 >= v14)
            v14 = v60;
        }
        objc_msgSend(v18, "name");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "isEqualToString:", TVPPlaybackReportingEventFPSRequestDataGeneration);

        if (v62)
        {
          objc_msgSend(v18, "duration");
          v64 = v155;
          if (v63 >= v155)
            v64 = v63;
          v155 = v64;
        }
        objc_msgSend(v18, "name");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "isEqualToString:", TVPPlaybackReportingEventFPSServerKeyFetch);

        if (v66)
        {
          objc_msgSend(v18, "duration");
          v68 = v156;
          if (v67 >= v156)
            v68 = v67;
          v156 = v68;
        }
        objc_msgSend(v18, "name");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "isEqualToString:", TVPPlaybackReportingEventLinearTokenFetch);

        if (v70)
        {
          objc_msgSend(v18, "duration");
          if (v71 >= v13)
            v13 = v71;
        }
        objc_msgSend(v18, "name");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "isEqualToString:", TVPPlaybackReportingEventFetchLocationAuthorizationStatus);

        if (v73)
        {
          objc_msgSend(v18, "duration");
          if (v74 >= v9)
            v9 = v74;
        }
        objc_msgSend(v18, "name");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "isEqualToString:", TVPPlaybackReportingEventTotalStartupSequence);

        if (v76)
        {
          objc_msgSend(v18, "duration");
          objc_msgSend(v18, "duration");
          v16 = v16 + v77;
        }
        objc_msgSend(v18, "name");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "isEqualToString:", v7[46].cache);

        if (v79)
        {
          objc_msgSend(v18, "duration");
          v15 = v15 + v80;
        }
        objc_msgSend(v18, "name");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v81, "isEqualToString:", TVPPlaybackReportingEventRestrictionsPasscodeDisplay) & 1) == 0)
        {
          v82 = v7;
          v83 = v6;
          v84 = p_vtable;
          v85 = v5;
          objc_msgSend(v18, "name");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v86, "isEqualToString:", TVPPlaybackReportingEventResumeMenuDisplay) & 1) == 0)
          {
            objc_msgSend(v18, "name");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v87, "isEqualToString:", TVPPlaybackReportingEventPressPlayToStartDisplay) & 1) == 0)
            {
              objc_msgSend(v18, "name");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v88, "isEqualToString:", TVPPlaybackReportingEventBumperVideoDisplay) & 1) == 0)
              {
                objc_msgSend(v18, "name");
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v150, "isEqualToString:", TVPPlaybackReportingEventBumperTextDisplay) & 1) == 0)
                {
                  objc_msgSend(v18, "startEvent");
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  v146 = objc_msgSend(v145, "isUIInteraction");

                  v5 = v85;
                  p_vtable = v84;
                  v6 = v83;
                  v7 = v82;
                  v8 = v157;
                  if ((v146 & 1) == 0)
                  {
LABEL_78:
                    objc_msgSend(v18, "name");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    v92 = objc_msgSend(v91, "isEqualToString:", TVPPlaybackReportingEventRentalCheckout);

                    if (v92)
                    {
                      objc_msgSend(v18, "duration");
                      objc_msgSend(v18, "timestamp");
                    }
                    goto LABEL_96;
                  }
LABEL_77:
                  objc_msgSend(v18, "duration");
                  v16 = v16 - v89;
                  objc_msgSend(v18, "duration");
                  v15 = v15 - v90;
                  goto LABEL_78;
                }

              }
            }

            v8 = v157;
          }

          v5 = v85;
          p_vtable = v84;
          v6 = v83;
          v7 = v82;
        }

        goto LABEL_77;
      }
      objc_msgSend(v18, "name");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToString:", TVPPlaybackReportingEventFPSOverallFetch);

      if (v47)
      {
        objc_msgSend(v18, "timestamp");
        if (v12 == 0.0)
        {
          v12 = v48;
        }
        else if (v48 < v12)
        {
          v12 = v48;
        }
      }
      else
      {
        objc_msgSend(v18, "name");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "isEqualToString:", TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp);

        if (v94)
        {
          objc_msgSend(v18, "timestamp");
          v10 = v95;
        }
      }
LABEL_96:
      ++v17;
    }
    while (v8 != v17);
    v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v169, 16);
    v8 = v109;
  }
  while (v109);
LABEL_103:

  objc_msgSend((id)objc_opt_class(), "_totalTimeSpentDoingFPSFetchesFromEndEvents:", v151);
  v160 = v110;
  v111 = objc_msgSend(v151, "count");
  if (v111)
  {
    v112 = *(double *)&v111;
    v113 = p_vtable[208];
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = CFSTR("fpsFetchCount");
      v167 = 2048;
      v168 = v112;
      _os_log_impl(&dword_228A4E000, v113, OS_LOG_TYPE_DEFAULT, "%@: %lu", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithUnsignedInteger:", *(_QWORD *)&v112);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v114, CFSTR("fpsFetchCount"));

  }
  if (v154 > 0.0)
  {
    v115 = p_vtable[208];
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = CFSTR("fpsLongestCertFetchTime");
      v167 = 2048;
      v168 = v154;
      _os_log_impl(&dword_228A4E000, v115, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v154 * 1000.0));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v116, CFSTR("fpsLongestCertFetchTime"));

  }
  if (v155 > 0.0)
  {
    v117 = p_vtable[208];
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = CFSTR("fpsLongestRequestDataGenerationTime");
      v167 = 2048;
      v168 = v155;
      _os_log_impl(&dword_228A4E000, v117, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v155 * 1000.0));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v118, CFSTR("fpsLongestRequestDataGenerationTime"));

  }
  if (v156 > 0.0)
  {
    v119 = p_vtable[208];
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = CFSTR("fpsLongestServerFetchAsMeasuredByAppTime");
      v167 = 2048;
      v168 = v156;
      _os_log_impl(&dword_228A4E000, v119, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v156 * 1000.0));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v120, CFSTR("fpsLongestServerFetchAsMeasuredByAppTime"));

  }
  if (v152 >= 1)
  {
    v121 = p_vtable[208];
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = CFSTR("fpsLongestServerProcessingTime");
      v167 = 2048;
      v168 = (double)v152 / 1000.0;
      _os_log_impl(&dword_228A4E000, v121, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", v152);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v122, CFSTR("fpsLongestServerProcessingTime"));

  }
  if (v14 > 0.0)
  {
    v123 = p_vtable[208];
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = CFSTR("fpsLongestFetchTime");
      v167 = 2048;
      v168 = v14;
      _os_log_impl(&dword_228A4E000, v123, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v14 * 1000.0));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v124, CFSTR("fpsLongestFetchTime"));

  }
  if (v13 > 0.0)
  {
    v125 = p_vtable[208];
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = (const __CFString *)TVPPlaybackReportingEventLinearTokenFetch;
      v167 = 2048;
      v168 = v13;
      _os_log_impl(&dword_228A4E000, v125, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v13 * 1000.0));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v126, TVPPlaybackReportingEventLinearTokenFetch);

  }
  if (v160 > 0.0)
  {
    v127 = p_vtable[208];
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = (const __CFString *)TVPPlaybackReportingEventTotalTimeSpendDoingFPSFetches;
      v167 = 2048;
      v168 = v160;
      _os_log_impl(&dword_228A4E000, v127, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v160 * 1000.0));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v128, TVPPlaybackReportingEventTotalTimeSpendDoingFPSFetches);

  }
  if (v16 > 0.0)
  {
    v129 = p_vtable[208];
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = (const __CFString *)TVPPlaybackReportingEventTotalUIStartupTimeNotIncludingUserInteraction;
      v167 = 2048;
      v168 = v16;
      _os_log_impl(&dword_228A4E000, v129, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v16 * 1000.0));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v130, TVPPlaybackReportingEventTotalUIStartupTimeNotIncludingUserInteraction);

  }
  if (v15 > 0.0)
  {
    v131 = p_vtable[208];
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      cache = (const __CFString *)v7[46].cache;
      *(_DWORD *)buf = 138412546;
      v166 = cache;
      v167 = 2048;
      v168 = v15;
      _os_log_impl(&dword_228A4E000, v131, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v15 * 1000.0));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v133, v7[46].cache);

  }
  if (v10 > 0.0 && v12 > 0.0)
  {
    v134 = v12 - v10;
    v135 = p_vtable[208];
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = CFSTR("createAVPlayerItemToFirstFPSFetchTime");
      v167 = 2048;
      v168 = v134;
      _os_log_impl(&dword_228A4E000, v135, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    if (v134 > 0.0)
    {
      objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v134 * 1000.0));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "setObject:forKey:", v136, CFSTR("createAVPlayerItemToFirstFPSFetchTime"));

    }
  }
  if (v11 > 0.0)
  {
    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v11 * 1000.0));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v137, v6[45].vtable);

  }
  if (v9 > 0.0)
  {
    v138 = p_vtable[208];
    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v166 = (const __CFString *)TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus;
      v167 = 2048;
      v168 = v9;
      _os_log_impl(&dword_228A4E000, v138, OS_LOG_TYPE_DEFAULT, "%@: %f", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v5 + 1760), "numberWithInteger:", llround(v9 * 1000.0));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKey:", v139, TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus);

  }
  objc_msgSend(*(id *)(v5 + 1760), "numberWithBool:", -[TVPPlaybackReportingEventCollection isDownloaded](self, "isDownloaded"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "setObject:forKey:", v140, CFSTR("isDownloaded"));

  objc_msgSend(*(id *)(v5 + 1760), "numberWithBool:", -[TVPPlaybackReportingEventCollection isGroupActivity](self, "isGroupActivity"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "setObject:forKey:", v141, CFSTR("isGroupActivity"));

  objc_msgSend(*(id *)(v5 + 1760), "numberWithBool:", -[TVPPlaybackReportingEventCollection isGroupActivityOriginator](self, "isGroupActivityOriginator"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "setObject:forKey:", v142, CFSTR("isGroupActivityOriginator"));

  v143 = (NSDictionary *)v153;
  return v143;
}

- (NSDictionary)startupEventsDict
{
  id v3;
  void *v4;
  TVPPlaybackReportingEventCollection *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  double v31;
  uint64_t v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v38;
  id v39;
  id obj;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[8];

  v47[6] = *MEMORY[0x24BDAC8D0];
  -[TVPPlaybackReportingEventCollection rtcReportingEventDict](self, "rtcReportingEventDict");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v47[0] = TVPPlaybackReportingEventUserPlayToLoadingInitiation;
  v47[1] = TVPPlaybackReportingEventPrepareForLoading;
  v47[2] = TVPPlaybackReportingEventPrepareForPlaybackInitiation;
  v47[3] = TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp;
  v47[4] = TVPPlaybackReportingEventWaitingForTimeControlStatus;
  v47[5] = TVPPlaybackReportingEventLoadAVAssetKeysTotal;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v5 = self;
  -[TVPPlaybackReportingEventCollection eventArray](self, "eventArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v43;
    v9 = 0.0;
    v10 = 0.0;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        v12 = v9;
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v14))
        {
          v15 = objc_msgSend(v13, "type");

          if (v15 != 1)
            goto LABEL_10;
          objc_msgSend(v13, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "startEvent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timestamp");
          v18 = v17;

          objc_msgSend(v41, "objectForKey:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVPPlaybackReportingEventCollection _addStartupEventWithName:timestamp:durationMS:toDictionary:](v5, "_addStartupEventWithName:timestamp:durationMS:toDictionary:", v14, v19, v3, v18);

        }
LABEL_10:
        objc_msgSend(v13, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", TVPPlaybackReportingEventTotalStartupSequence);

        if (v21)
        {
          v22 = (id)TVPPlaybackReportingEventTotalUIStartupTimeNotIncludingUserInteraction;
          objc_msgSend(v41, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "startEvent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timestamp");
          -[TVPPlaybackReportingEventCollection _addStartupEventWithName:timestamp:durationMS:toDictionary:](v5, "_addStartupEventWithName:timestamp:durationMS:toDictionary:", v22, v23, v3);

        }
        objc_msgSend(v13, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", TVPPlaybackReportingEventFPSOverallFetch);

        if (v26)
        {
          objc_msgSend(v39, "addObject:", v13);
          objc_msgSend(v13, "timestamp");
          if (v27 >= v10)
            v28 = v10;
          else
            v28 = v27;
          if (v10 == 0.0)
            v10 = v27;
          else
            v10 = v28;
        }
        objc_msgSend(v13, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", TVPPlaybackReportingEventFetchLocationAuthorizationStatus);

        if (v30)
        {
          objc_msgSend(v38, "addObject:", v13);
          objc_msgSend(v13, "timestamp");
          v9 = v31;
          if (v12 != 0.0 && v31 >= v12)
            v9 = v12;
        }
        else
        {
          v9 = v12;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (!v7)
        goto LABEL_29;
    }
  }
  v9 = 0.0;
  v10 = 0.0;
LABEL_29:

  objc_msgSend((id)objc_opt_class(), "_totalTimeSpentDoingFPSFetchesFromEndEvents:", v39);
  v32 = TVPPlaybackReportingEventTotalTimeSpendDoingFPSFetches;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", llround(v33 * 1000.0));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlaybackReportingEventCollection _addStartupEventWithName:timestamp:durationMS:toDictionary:](v5, "_addStartupEventWithName:timestamp:durationMS:toDictionary:", v32, v34, v3, v10);

  v35 = TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus;
  objc_msgSend(v41, "objectForKey:", TVPPlaybackReportingEventLongestFetchLocationAuthorizationStatus);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlaybackReportingEventCollection _addStartupEventWithName:timestamp:durationMS:toDictionary:](v5, "_addStartupEventWithName:timestamp:durationMS:toDictionary:", v35, v36, v3, v9);

  return (NSDictionary *)v3;
}

- (void)_addStartupEventWithName:(id)a3 timestamp:(double)a4 durationMS:(id)a5 toDictionary:(id)a6
{
  id v9;
  id v10;
  TVPPlaybackStartupEvent *v11;
  id v12;

  v12 = a3;
  v9 = a6;
  v10 = a5;
  v11 = -[TVPPlaybackStartupEvent initWithName:timestamp:durationMS:]([TVPPlaybackStartupEvent alloc], "initWithName:timestamp:durationMS:", v12, v10, a4);

  if (v12)
    objc_msgSend(v9, "setObject:forKey:", v11, v12);

}

- (void)_closeOpenEvents
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[TVPPlaybackReportingEventCollection openEvents](self, "openEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__TVPPlaybackReportingEventCollection__closeOpenEvents__block_invoke;
  v5[3] = &unk_24F15BB20;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __55__TVPPlaybackReportingEventCollection__closeOpenEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  objc_msgSend(v4, "_addEventWithName:type:identifier:value:timestamp:forceAdd:isUIInteraction:", v7, 2, v5, 0, 0, 1, v6);

}

- (void)_setError:(id)a3 inEventDict:(id)a4 errorCodeKey:(id)a5 errorDomainKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_msgSend(v11, "code");
  objc_msgSend(v11, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v14, v10);

  if (v13)
    objc_msgSend(v15, "setObject:forKey:", v13, v9);

}

+ (double)_totalTimeSpentDoingFPSFetchesFromEndEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  TVPTimeRange *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  TVPTimeRange *v17;
  void *v18;
  double v19;
  double v20;
  _QWORD v22[6];
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "startEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (!v11)
        {
          v12 = [TVPTimeRange alloc];
          objc_msgSend(v9, "startEvent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timestamp");
          v15 = v14;
          objc_msgSend(v9, "timestamp");
          v17 = -[TVPTimeRange initWithStartTime:endTime:](v12, "initWithStartTime:endTime:", v15, v16);
          objc_msgSend(v4, "addObject:", v17);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_228);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __83__TVPPlaybackReportingEventCollection__totalTimeSpentDoingFPSFetchesFromEndEvents___block_invoke_229;
  v22[3] = &unk_24F15BB88;
  v22[4] = &v27;
  v22[5] = &v23;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v22);
  v18 = (void *)v28[5];
  if (v18)
  {
    objc_msgSend(v18, "duration");
    v20 = v19 + v24[3];
    v24[3] = v20;
  }
  else
  {
    v20 = v24[3];
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v20;
}

uint64_t __83__TVPPlaybackReportingEventCollection__totalTimeSpentDoingFPSFetchesFromEndEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "startTime");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "startTime");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __83__TVPPlaybackReportingEventCollection__totalTimeSpentDoingFPSFetchesFromEndEvents___block_invoke_229(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  TVPTimeRange *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  double v19;
  uint64_t v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v22 = v5;
  if (a3)
  {
    v7 = *(void **)(v6 + 40);
    objc_msgSend(v5, "startTime");
    if (objc_msgSend(v7, "containsTime:"))
    {
      v8 = [TVPTimeRange alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "startTime");
      v10 = v9;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "endTime");
      v12 = v11;
      objc_msgSend(v22, "endTime");
      if (v12 >= v13)
        v14 = v12;
      else
        v14 = v13;
      v15 = -[TVPTimeRange initWithStartTime:endTime:](v8, "initWithStartTime:endTime:", v10, v14);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "duration");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v21 = v22;
      v17 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v21;
    }
  }
  else
  {
    v18 = v5;
    v17 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v18;
  }

}

- (int64_t)videoType
{
  return self->_videoType;
}

- (BOOL)isDownloaded
{
  return self->_isDownloaded;
}

- (void)setIsDownloaded:(BOOL)a3
{
  self->_isDownloaded = a3;
}

- (BOOL)isGroupActivity
{
  return self->_isGroupActivity;
}

- (void)setIsGroupActivity:(BOOL)a3
{
  self->_isGroupActivity = a3;
}

- (BOOL)isGroupActivityOriginator
{
  return self->_isGroupActivityOriginator;
}

- (void)setIsGroupActivityOriginator:(BOOL)a3
{
  self->_isGroupActivityOriginator = a3;
}

- (BOOL)initialFPSRequestsComplete
{
  return self->_initialFPSRequestsComplete;
}

- (void)setInitialFPSRequestsComplete:(BOOL)a3
{
  self->_initialFPSRequestsComplete = a3;
}

- (void)setEventArray:(id)a3
{
  objc_storeStrong((id *)&self->_eventArray, a3);
}

- (void)setOpenEvents:(id)a3
{
  objc_storeStrong((id *)&self->_openEvents, a3);
}

- (void)_addEventWithName:(uint64_t)a1 type:(NSObject *)a2 identifier:value:timestamp:forceAdd:isUIInteraction:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_228A4E000, a2, OS_LOG_TYPE_ERROR, "Event %@ has no corresponding start event.  Removing from event array", (uint8_t *)&v2, 0xCu);
}

@end

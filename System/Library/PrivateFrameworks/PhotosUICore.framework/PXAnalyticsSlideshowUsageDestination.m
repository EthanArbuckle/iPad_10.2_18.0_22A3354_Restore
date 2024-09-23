@implementation PXAnalyticsSlideshowUsageDestination

- (PXAnalyticsSlideshowUsageDestination)init
{
  PXAnalyticsSlideshowUsageDestination *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *slideshowInfos;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAnalyticsSlideshowUsageDestination;
  v2 = -[PXAnalyticsSlideshowUsageDestination init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    slideshowInfos = v2->_slideshowInfos;
    v2->_slideshowInfos = v3;

  }
  return v2;
}

- (id)_createInfoForEvent:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  _PXAnalyticsSlideshowInfo *v7;
  uint8_t v9[16];

  objc_msgSend(a3, "propertyForKey:", CFSTR("slideshowSessionUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_slideshowInfos, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      PXAssertGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "previously existing slideshow info", v9, 2u);
      }

    }
    v7 = objc_alloc_init(_PXAnalyticsSlideshowInfo);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_slideshowInfos, "setObject:forKeyedSubscript:", v7, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_existingInfoForEvent:(id)a3
{
  return -[PXAnalyticsSlideshowUsageDestination _existingInfoForEvent:pop:](self, "_existingInfoForEvent:pop:", a3, 0);
}

- (id)_popInfoForEndEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXAnalyticsSlideshowUsageDestination _existingInfoForEvent:pop:](self, "_existingInfoForEvent:pop:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unpauseWithEvent:", v4);
  objc_msgSend(v5, "setEndEvent:", v4);

  return v5;
}

- (id)_existingInfoForEvent:(id)a3 pop:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "propertyForKey:", CFSTR("slideshowSessionUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_slideshowInfos, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!v4)
        goto LABEL_12;
      goto LABEL_11;
    }
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "missing slideshow info for identifier %@", (uint8_t *)&v12, 0xCu);
    }

    if (v4)
LABEL_11:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_slideshowInfos, "setObject:forKeyedSubscript:", 0, v7);
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "missing expected identifier for %@", (uint8_t *)&v12, 0xCu);
    }

    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)_createDefaultPayloadForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, void *);
  void *v37;
  id v38;
  PXAnalyticsSlideshowUsageDestination *v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "startEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copyRawPayload");
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v4;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "missing startEvent payload for %@", buf, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  v10 = (void *)objc_msgSend(v6, "copyRawPayload");
  objc_msgSend(v8, "addEntriesFromDictionary:", v10);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("slideshowSessionUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "pauseCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadPauseCountKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "timePaused");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadTimePausedKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

  if (v5 && v6)
  {
    objc_msgSend(v6, "timestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "payloadTotalPlaybackTimeKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v21);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("slideshowExpectedDuration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    if (v23 > 0.0)
    {
      objc_msgSend(v4, "timePaused");
      v25 = v19 - v24;
      objc_msgSend(v22, "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25 / v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "payloadTimeFractionPlayedKey");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, v28);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "appSuspensionCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "payloadAppSuspensionCountKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, v30);

  v34 = MEMORY[0x1E0C809B0];
  v35 = 3221225472;
  v36 = __69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke;
  v37 = &unk_1E5138E60;
  v31 = v8;
  v38 = v31;
  v39 = self;
  objc_msgSend(v31, "_px_transformExistingValueForKey:usingBlock:", CFSTR("slideshowAssetCountsByPlaybackStyle"), &v34);
  objc_msgSend(v31, "_px_transformExistingValueForKey:usingBlock:", CFSTR("slideshowTriggerType"), &__block_literal_global_225328, v34, v35, v36, v37);
  objc_msgSend(v31, "_px_transformExistingValueForKey:usingBlock:", CFSTR("slideshowTerminationType"), &__block_literal_global_202_225329);
  v32 = v31;

  return v32;
}

- (id)_payloadFilteredForCoreAnlaytics:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PXAnalyticsSlideshowUsageDestination__payloadFilteredForCoreAnlaytics___block_invoke;
  v9[3] = &unk_1E5138EF8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _PXAnalyticsSlideshowInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  double v40;
  double v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint8_t buf[16];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.slideshowPlaybackStarted")))
  {
    -[PXAnalyticsSlideshowUsageDestination _createInfoForEvent:](self, "_createInfoForEvent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = objc_alloc_init(_PXAnalyticsSlideshowInfo);
    v10 = v8;

    objc_msgSend(v10, "setStartEvent:", v4);
    -[PXAnalyticsSlideshowUsageDestination _createDefaultPayloadForInfo:](self, "_createDefaultPayloadForInfo:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D09910];
    objc_msgSend((id)objc_opt_class(), "playbackStartedCoreAnalyticsEventName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAnalyticsSlideshowUsageDestination _payloadFilteredForCoreAnlaytics:](self, "_payloadFilteredForCoreAnlaytics:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendEvent:withPayload:", v13, v14);

    objc_msgSend((id)objc_opt_class(), "payloadTotalAssetCountKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "integerValue");
    v18 = (void *)MEMORY[0x1E0D09910];
    objc_msgSend((id)objc_opt_class(), "playbackStartedCPAnalyticsEventNameForTotalAssetCount:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendEvent:withPayload:", v19, v11);

LABEL_10:
    goto LABEL_30;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.slideshowPlaybackPaused")))
  {
    -[PXAnalyticsSlideshowUsageDestination _existingInfoForEvent:](self, "_existingInfoForEvent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pauseWithEvent:", v4);
    goto LABEL_29;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.slideshowPlaybackResumed")))
  {
    -[PXAnalyticsSlideshowUsageDestination _existingInfoForEvent:](self, "_existingInfoForEvent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unpauseWithEvent:", v4);
    goto LABEL_29;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D096B0]))
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_slideshowInfos, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v71 != v22)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "setAppSuspensionCount:", objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "appSuspensionCount") + 1);
        }
        v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v21);
    }
    goto LABEL_29;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.slideshowPlaybackEnded")))
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.slideshowExportStarted")))
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.slideshowExportEnded")))goto LABEL_30;
      -[PXAnalyticsSlideshowUsageDestination _popInfoForEndEvent:](self, "_popInfoForEndEvent:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAnalyticsSlideshowUsageDestination _createDefaultPayloadForInfo:](self, "_createDefaultPayloadForInfo:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startEvent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timestamp");
      v33 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "endEvent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timestamp");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("slideshowExportSucceeded"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "BOOLValue");

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("slideshowExportError"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend((id)objc_opt_class(), "_isUserCancelledError:", v38);
      v66 = v35;
      v68 = (void *)v33;
      objc_msgSend(v35, "timeIntervalSinceDate:", v33);
      v41 = v40;
      v42 = CFSTR("failed");
      if (v39)
        v42 = CFSTR("cancelled");
      if ((_DWORD)v37)
        v43 = CFSTR("succeeded");
      else
        v43 = v42;
      objc_msgSend((id)objc_opt_class(), "payloadExportEndStateKey");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v43, v44);

      if (v38 && (v39 & 1) == 0)
      {
        objc_msgSend(v38, "domain");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "payloadExportErrorDomainKey");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v45, v46);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v38, "code"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "payloadExportErrorCodeKey");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v47, v48);

        objc_msgSend(v11, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D09838]);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "payloadExportDurationKey");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v49, v50);

      v51 = (void *)MEMORY[0x1E0D09910];
      objc_msgSend((id)objc_opt_class(), "exportEndedCoreAnalyticsEventName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAnalyticsSlideshowUsageDestination _payloadFilteredForCoreAnlaytics:](self, "_payloadFilteredForCoreAnlaytics:", v11);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "sendEvent:withPayload:", v52, v53);

      v54 = (void *)MEMORY[0x1E0D09910];
      objc_msgSend((id)objc_opt_class(), "exportEndedCPAnalyticsEventNameForSuccess:error:duration:", v37, v38, v41);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "sendEvent:withPayload:", v55, v11);

      if ((_DWORD)v37)
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0D09858]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0D09848]);
        objc_msgSend((id)objc_opt_class(), "exportCPAnalyticsIntervalName");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D09850]);

        v57 = (void *)MEMORY[0x1E0D09910];
        v58 = objc_msgSend(v10, "signpostID");
        objc_msgSend(v57, "endSignpost:forEventName:withPayload:", v58, *MEMORY[0x1E0D09708], v11);
      }

      goto LABEL_10;
    }
    -[PXAnalyticsSlideshowUsageDestination _createInfoForEvent:](self, "_createInfoForEvent:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      PXAssertGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "couldn't create slideshow info", buf, 2u);
      }

    }
    objc_msgSend(v9, "setStartEvent:", v4);
    objc_msgSend(v9, "setSignpostID:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
LABEL_29:

    goto LABEL_30;
  }
  -[PXAnalyticsSlideshowUsageDestination _popInfoForEndEvent:](self, "_popInfoForEndEvent:", v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAnalyticsSlideshowUsageDestination _createDefaultPayloadForInfo:](self, "_createDefaultPayloadForInfo:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("slideshowTerminationType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "integerValue");

  objc_msgSend((id)objc_opt_class(), "payloadTimeFractionPlayedKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v28, "doubleValue");
    v30 = v29;
  }
  else
  {
    v30 = NAN;
  }
  v59 = (void *)MEMORY[0x1E0D09910];
  objc_msgSend((id)objc_opt_class(), "playbackEndedCoreAnalyticsEventName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAnalyticsSlideshowUsageDestination _payloadFilteredForCoreAnlaytics:](self, "_payloadFilteredForCoreAnlaytics:", v24);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sendEvent:withPayload:", v60, v61);

  v62 = (void *)MEMORY[0x1E0D09910];
  objc_msgSend((id)objc_opt_class(), "playbackEndedCPAnalyticsEventNameForTerminationType:", v26);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "sendEvent:withPayload:", v63, v24);

  if (fabs(v30) != INFINITY)
  {
    v64 = (void *)MEMORY[0x1E0D09910];
    objc_msgSend((id)objc_opt_class(), "playbackEndedCPAnalyticsEventNameForTimeFractionPlayed:", v30);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "sendEvent:withPayload:", v65, v24);

  }
LABEL_30:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slideshowInfos, 0);
}

void __73__PXAnalyticsSlideshowUsageDestination__payloadFilteredForCoreAnlaytics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

uint64_t __69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "totalCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "payloadTotalAssetCountKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke_2;
  v11[3] = &unk_1E5138E38;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v8;
  v13 = v9;
  objc_msgSend(v4, "enumerateCountsUsingBlock:", v11);

  return 0;
}

const __CFString *__69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke_4(uint64_t a1, void *a2)
{
  return PXAnalyticsSlideshowTerminationTypeDescription(objc_msgSend(a2, "integerValue"));
}

const __CFString *__69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke_3(uint64_t a1, void *a2)
{
  return PXAnalyticsSlideshowTriggerTypeDescription(objc_msgSend(a2, "integerValue"));
}

void __69__PXAnalyticsSlideshowUsageDestination__createDefaultPayloadForInfo___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  if (a3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "payloadAssetCountKeyForPlaybackStyle:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

+ (NSString)playbackStartedCoreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.Photos.slideshowPlaybackStarted");
}

+ (id)playbackStartedCPAnalyticsEventNameForTotalAssetCount:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForInteger:bucketLimits:", a3, 0, 5, 10, 15, 20, 30, 50, 100, 200, 300, 500, 1000, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.slideshowPlaybackStartedWith%@Assets"), v3);

  return v4;
}

+ (NSString)playbackEndedCoreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.Photos.slideshowPlaybackEnded");
}

+ (id)playbackEndedCPAnalyticsEventNameForTerminationType:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  PXAnalyticsSlideshowTerminationTypeDescription(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.slideshowPlaybackEndedBy%@"), v5);

  return v6;
}

+ (id)playbackEndedCPAnalyticsEventNameForTimeFractionPlayed:(double)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForDouble:bucketLimits:numberFormatter:", &unk_1E53EA830, 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.slideshowPlaybackEndedAfterTimeFraction%@"), v3);

  return v4;
}

+ (NSString)payloadTotalAssetCountKey
{
  return (NSString *)CFSTR("slideshowTotalAssetCount");
}

+ (id)payloadAssetCountKeyForPlaybackStyle:(int64_t)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  PXDisplayAssetPlaybackStyleDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("slideshow%@Count"), v4);

  return v5;
}

+ (NSString)payloadPauseCountKey
{
  return (NSString *)CFSTR("slideshowPauseCount");
}

+ (NSString)payloadTimePausedKey
{
  return (NSString *)CFSTR("slideshowTimePaused");
}

+ (NSString)payloadTotalPlaybackTimeKey
{
  return (NSString *)CFSTR("slideshowTotalPlaybackTime");
}

+ (NSString)payloadTimeFractionPlayedKey
{
  return (NSString *)CFSTR("slideshowTimeFractionPlayed");
}

+ (NSString)payloadAppSuspensionCountKey
{
  return (NSString *)CFSTR("slideshowAppSuspensionCount");
}

+ (NSString)exportEndedCoreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.Photos.slideshowExported");
}

+ (id)exportEndedCPAnalyticsEventNameForSuccess:(BOOL)a3 error:(id)a4 duration:(double)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  v6 = a3;
  v8 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForDouble:bucketLimits:numberFormatter:", &unk_1E53EA848, 0, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.slideshowExportEndedSuccessfullyAfter%@Seconds"), v9);
  }
  else
  {
    if (!objc_msgSend(a1, "_isUserCancelledError:", v8))
    {
      v11 = CFSTR("com.apple.photos.CPAnalytics.slideshowExportFailed");
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForDouble:bucketLimits:numberFormatter:", &unk_1E53EA860, 0, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.slideshowExportCancelledAfter%@Seconds"), v9);
  }
  v11 = (__CFString *)v10;

LABEL_7:
  return v11;
}

+ (NSString)exportFailedCPAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.photos.CPAnalytics.slideshowExportFailed");
}

+ (NSString)exportCPAnalyticsIntervalName
{
  return (NSString *)CFSTR("com.apple.photos.CPAnalytics.slideshowExportDuration");
}

+ (NSString)payloadExportEndStateKey
{
  return (NSString *)CFSTR("slideshowExportEndState");
}

+ (NSString)payloadExportErrorDomainKey
{
  return (NSString *)CFSTR("slideshowExportErrorDomain");
}

+ (NSString)payloadExportErrorCodeKey
{
  return (NSString *)CFSTR("slideshowExportErrorCode");
}

+ (NSString)payloadExportDurationKey
{
  return (NSString *)CFSTR("slideshowExportDuration");
}

+ (BOOL)_isUserCancelledError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && objc_msgSend(v3, "code") == 3072)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("OFNSOperationErrorDomain")))
      v5 = objc_msgSend(v3, "code") == 2;
    else
      v5 = 0;

  }
  return v5;
}

@end

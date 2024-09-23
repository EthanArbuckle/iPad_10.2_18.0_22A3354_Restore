@implementation USUsageAccumulator

- (USUsageAccumulator)initWithApplicationCategories:(id)a3 webCategories:(id)a4
{
  id v5;
  id v6;
  USUsageAccumulator *v7;
  uint64_t v8;
  NSDictionary *applicationCategories;
  uint64_t v10;
  NSDictionary *webCategories;
  uint64_t v12;
  NSMutableDictionary *applicationUsageStartDates;
  uint64_t v14;
  NSMutableDictionary *webUsageStartDatesByWebBrowser;
  uint64_t v16;
  NSMutableDictionary *webUsageStateByUniqueID;
  uint64_t v18;
  NSMutableDictionary *mediaUsageStateByUniqueID;
  uint64_t v20;
  NSMutableArray *backlightIntervals;
  uint64_t v22;
  NSMutableDictionary *applicationUsageIntervals;
  uint64_t v24;
  NSMutableDictionary *webUsageIntervals;
  uint64_t v26;
  NSMutableDictionary *categoryUsageIntervals;
  uint64_t v28;
  NSMutableDictionary *canonicalApplicationUsageIntervals;
  uint64_t v30;
  NSMutableDictionary *primaryWebUsageIntervals;
  uint64_t v32;
  NSMutableDictionary *notifications;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)USUsageAccumulator;
  v5 = a4;
  v6 = a3;
  v7 = -[USUsageAccumulator init](&v35, sel_init);
  v8 = objc_msgSend(v6, "copy", v35.receiver, v35.super_class);

  applicationCategories = v7->_applicationCategories;
  v7->_applicationCategories = (NSDictionary *)v8;

  v10 = objc_msgSend(v5, "copy");
  webCategories = v7->_webCategories;
  v7->_webCategories = (NSDictionary *)v10;

  v12 = objc_opt_new();
  applicationUsageStartDates = v7->_applicationUsageStartDates;
  v7->_applicationUsageStartDates = (NSMutableDictionary *)v12;

  v14 = objc_opt_new();
  webUsageStartDatesByWebBrowser = v7->_webUsageStartDatesByWebBrowser;
  v7->_webUsageStartDatesByWebBrowser = (NSMutableDictionary *)v14;

  v16 = objc_opt_new();
  webUsageStateByUniqueID = v7->_webUsageStateByUniqueID;
  v7->_webUsageStateByUniqueID = (NSMutableDictionary *)v16;

  v7->_quickLookVideoNowPlayingState = 0;
  v18 = objc_opt_new();
  mediaUsageStateByUniqueID = v7->_mediaUsageStateByUniqueID;
  v7->_mediaUsageStateByUniqueID = (NSMutableDictionary *)v18;

  v20 = objc_opt_new();
  backlightIntervals = v7->_backlightIntervals;
  v7->_backlightIntervals = (NSMutableArray *)v20;

  v22 = objc_opt_new();
  applicationUsageIntervals = v7->_applicationUsageIntervals;
  v7->_applicationUsageIntervals = (NSMutableDictionary *)v22;

  v24 = objc_opt_new();
  webUsageIntervals = v7->_webUsageIntervals;
  v7->_webUsageIntervals = (NSMutableDictionary *)v24;

  v26 = objc_opt_new();
  categoryUsageIntervals = v7->_categoryUsageIntervals;
  v7->_categoryUsageIntervals = (NSMutableDictionary *)v26;

  v28 = objc_opt_new();
  canonicalApplicationUsageIntervals = v7->_canonicalApplicationUsageIntervals;
  v7->_canonicalApplicationUsageIntervals = (NSMutableDictionary *)v28;

  v30 = objc_opt_new();
  primaryWebUsageIntervals = v7->_primaryWebUsageIntervals;
  v7->_primaryWebUsageIntervals = (NSMutableDictionary *)v30;

  v32 = objc_opt_new();
  notifications = v7->_notifications;
  v7->_notifications = (NSMutableDictionary *)v32;

  return v7;
}

- (void)accumulateEvent:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[USUsageAccumulator setLastEventDate:](self, "setLastEventDate:", v7);
  objc_msgSend(v6, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[USUsageAccumulator _accumulateAppUsage:timestamp:](self, "_accumulateAppUsage:timestamp:", v8, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[USUsageAccumulator _accumulateAppMediaUsage:timestamp:](self, "_accumulateAppMediaUsage:timestamp:", v8, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[USUsageAccumulator _accumulateAppWebUsage:timestamp:](self, "_accumulateAppWebUsage:timestamp:", v8, v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[USUsageAccumulator _accumulateDeviceBacklight:timestamp:](self, "_accumulateDeviceBacklight:timestamp:", v8, v7);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[USUsageAccumulator _accumulateMediaNowPlaying:timestamp:](self, "_accumulateMediaNowPlaying:timestamp:", v8, v7);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[USUsageAccumulator _accumulateNotificationUsage:](self, "_accumulateNotificationUsage:", v8);
            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              -[USUsageAccumulator accumulateEvent:timestamp:].cold.1();
            }
          }
        }
      }
    }
  }

}

- (void)_accumulateAppUsage:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "parentBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v6, "bundleID"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = objc_msgSend(v6, "starting");
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.springboard.stand-by")))
    {
      -[USUsageAccumulator setStandByEnabled:](self, "setStandByEnabled:", v9);
      if (-[USUsageAccumulator isDeviceBacklit](self, "isDeviceBacklit"))
        -[USUsageAccumulator _accumulateDeviceBacklightWithIsBacklit:timestamp:](self, "_accumulateDeviceBacklightWithIsBacklit:timestamp:", v9 ^ 1, v7);
    }
    else
    {
      -[USUsageAccumulator _accumulateApplication:timestamp:starting:isUsageTrusted:](self, "_accumulateApplication:timestamp:starting:isUsageTrusted:", v8, v7, v9, objc_msgSend(v6, "isUsageTrusted"));
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[USUsageAccumulator _accumulateAppUsage:timestamp:].cold.1();
    v8 = 0;
  }

}

- (void)_accumulateAppMediaUsage:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(v6, "starting");
    -[USUsageAccumulator mediaUsageStateByUniqueID](self, "mediaUsageStateByUniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (_DWORD)v9 == objc_msgSend(v11, "BOOLValue"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v6;
        _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Media usage session has not changed state, not accumulating event: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[USUsageAccumulator mediaUsageStateByUniqueID](self, "mediaUsageStateByUniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v8);

      v14 = objc_msgSend(v6, "isUsageTrusted");
      objc_msgSend(v6, "bundleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[USUsageAccumulator _accumulateApplication:timestamp:starting:isUsageTrusted:](self, "_accumulateApplication:timestamp:starting:isUsageTrusted:", v15, v7, v9, v14);
        objc_msgSend(v6, "URL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_alloc(MEMORY[0x24BDBCF48]);
          objc_msgSend(v6, "URL");
          v21 = v14;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v7;
          v19 = (void *)objc_msgSend(v17, "initWithString:", v18);
          objc_msgSend(v19, "host");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v22;
          if (v20)
          {
            -[USUsageAccumulator _accumulateWebDomain:bundleIdentifier:timestamp:starting:isUsageTrusted:](self, "_accumulateWebDomain:bundleIdentifier:timestamp:starting:isUsageTrusted:", v20, v15, v22, v9, v21);

          }
        }

      }
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[USUsageAccumulator _accumulateAppMediaUsage:timestamp:].cold.1();
  }

}

- (void)_accumulateAppWebUsage:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8 && v9 && v10)
  {
    v12 = objc_msgSend(v6, "isUsageTrusted");
    -[USUsageAccumulator webUsageStateByUniqueID](self, "webUsageStateByUniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v6, "usageState");
    v16 = v15;
    if (v14)
    {
      if (objc_msgSend(v14, "intValue") == 3)
      {
        if ((_DWORD)v16 != 3)
        {
          v17 = 0;
LABEL_13:
          -[USUsageAccumulator _accumulateWebDomain:bundleIdentifier:timestamp:starting:isUsageTrusted:](self, "_accumulateWebDomain:bundleIdentifier:timestamp:starting:isUsageTrusted:", v9, v11, v7, v17, v12);
        }
      }
      else if ((_DWORD)v16 == 3)
      {
        v17 = 1;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[USUsageAccumulator webUsageStateByUniqueID](self, "webUsageStateByUniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v8);

      goto LABEL_15;
    }
    v17 = (_DWORD)v15 == 3;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[USUsageAccumulator _accumulateAppWebUsage:timestamp:].cold.1();
LABEL_15:

}

- (void)_accumulateDeviceBacklight:(id)a3 timestamp:(id)a4
{
  uint64_t v6;
  id v7;

  v7 = a4;
  v6 = objc_msgSend(a3, "backlightLevel");
  -[USUsageAccumulator setDeviceBacklit:](self, "setDeviceBacklit:", v6 != 0);
  if (!-[USUsageAccumulator isStandByEnabled](self, "isStandByEnabled"))
    -[USUsageAccumulator _accumulateDeviceBacklightWithIsBacklit:timestamp:](self, "_accumulateDeviceBacklightWithIsBacklit:timestamp:", v6 != 0, v7);

}

- (void)_accumulateDeviceBacklightWithIsBacklit:(BOOL)a3 timestamp:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  USUsageAccumulator *v30;
  void *v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v4 = a3;
  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[USUsageAccumulator backlightStartDate](self, "backlightStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (!v7)
      -[USUsageAccumulator setBacklightStartDate:](self, "setBacklightStartDate:", v6);
  }
  else if (v7)
  {
    if (objc_msgSend(v7, "compare:", v6) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[USUsageAccumulator _accumulateDeviceBacklightWithIsBacklit:timestamp:].cold.1();
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v8, v6);
      -[USUsageAccumulator backlightIntervals](self, "backlightIntervals");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v12)
      {
        v13 = v12;
        v30 = self;
        v31 = v8;
        v32 = v6;
        v14 = 0;
        v15 = *(_QWORD *)v35;
        v29 = v11;
        v16 = v11;
        do
        {
          v17 = 0;
          v33 = v13;
          do
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(v10);
            v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
            if (objc_msgSend(v18, "intersectsDateInterval:", v16))
            {
              v19 = v10;
              objc_msgSend(v18, "startDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "startDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "earlierDate:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "endDate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "endDate");
              v24 = (void *)v14;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "laterDate:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = (uint64_t)v24;
              v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v22, v26);

              if (v24)
                objc_msgSend(v24, "addObject:", v18);
              else
                v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v18, 0);

              v16 = (void *)v27;
              v10 = v19;
              v13 = v33;
            }
            ++v17;
          }
          while (v13 != v17);
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v13);
        if (v14)
        {
          objc_msgSend(v10, "removeObjectsInArray:", v14);
          v6 = v32;
          v28 = (void *)v14;
        }
        else
        {
          v28 = 0;
          v6 = v32;
        }
        self = v30;
        v8 = v31;
        v11 = v29;
      }
      else
      {
        v28 = 0;
        v16 = v11;
      }
      objc_msgSend(v10, "addObject:", v16);

      -[USUsageAccumulator setBacklightStartDate:](self, "setBacklightStartDate:", 0);
      -[USUsageAccumulator _stopAllUsageWithEndDate:](self, "_stopAllUsageWithEndDate:", v6);

    }
  }

}

- (void)_accumulateMediaNowPlaying:(id)a3 timestamp:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.quicklook.extension.previewUI")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.quicklook.QuickLookUIService")))
  {
    v8 = objc_msgSend(v12, "itemMediaType");

    if (v8 == 2)
    {
      v9 = -[USUsageAccumulator quickLookVideoNowPlayingState](self, "quickLookVideoNowPlayingState");
      v10 = objc_msgSend(v12, "playbackState");
      v11 = v10;
      if (v9 == 1)
      {
        if ((_DWORD)v10 == 1)
        {
LABEL_10:
          -[USUsageAccumulator setQuickLookVideoNowPlayingState:](self, "setQuickLookVideoNowPlayingState:", v11);
          goto LABEL_11;
        }
      }
      else if ((_DWORD)v10 != 1)
      {
        goto LABEL_10;
      }
      -[USUsageAccumulator _accumulateMediaNowPlayingWithTimestamp:starting:](self, "_accumulateMediaNowPlayingWithTimestamp:starting:", v6, v9 != 1);
      goto LABEL_10;
    }
  }
  else
  {

  }
LABEL_11:

}

- (void)_accumulateNotificationUsage:(id)a3
{
  id v4;
  void *v5;
  USTrustIdentifier *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "usageType") == 1
    || objc_msgSend(v4, "usageType") == 17
    || objc_msgSend(v4, "usageType") == 18)
  {
    objc_msgSend(v4, "parentBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 || (objc_msgSend(v4, "bundleID"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v5, 1);
      -[USUsageAccumulator notifications](self, "notifications");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntValue") + 1;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[USUsageAccumulator notifications](self, "notifications");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v6);

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[USUsageAccumulator _accumulateNotificationUsage:].cold.1();
    }
  }

}

- (void)_accumulateApplication:(id)a3 timestamp:(id)a4 starting:(BOOL)a5 isUsageTrusted:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  USTrustIdentifier *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;

  v6 = a6;
  v7 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v10, v6);
  -[USUsageAccumulator applicationUsageStartDates](self, "applicationUsageStartDates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_opt_new();
  v17 = v16;

  if (v7)
  {
    objc_msgSend(v17, "addObject:", v11);
  }
  else
  {
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "compare:", v11) == 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          -[USUsageAccumulator _accumulateApplication:timestamp:starting:isUsageTrusted:].cold.1();
      }
      else
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v19, v11);
        -[USUsageAccumulator _aggregateApplicationUsageInterval:identifier:](self, "_aggregateApplicationUsageInterval:identifier:", v20, v12);
        objc_msgSend(v17, "removeObjectAtIndex:", 0);
        -[USUsageAccumulator _stopAllWebUsageForWebBrowser:endDate:](self, "_stopAllWebUsageForWebBrowser:endDate:", v12, v11);

      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543362;
      v23 = v10;
      _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received end event for %{public}@ without a corresponding start event. This may be because the event was manually ended due to a backlight end event.", (uint8_t *)&v22, 0xCu);
    }

  }
  -[USUsageAccumulator applicationUsageStartDates](self, "applicationUsageStartDates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, v12);

}

- (void)_accumulateWebDomain:(id)a3 bundleIdentifier:(id)a4 timestamp:(id)a5 starting:(BOOL)a6 isUsageTrusted:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  USTrustIdentifier *v15;
  USTrustIdentifier *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v7 = a7;
  v8 = a6;
  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v14, v7);

  v16 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v13, v7);
  -[USUsageAccumulator webUsageStartDatesByWebBrowser](self, "webUsageStartDatesByWebBrowser");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_opt_new();
  v21 = v20;

  objc_msgSend(v21, "objectForKeyedSubscript:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_opt_new();
  v25 = v24;

  if (!v8)
  {
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      if (objc_msgSend(v26, "compare:", v12) == 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          -[USUsageAccumulator _accumulateWebDomain:bundleIdentifier:timestamp:starting:isUsageTrusted:].cold.1((uint64_t)v12, v15);
        goto LABEL_17;
      }
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v27, v12);
      -[USUsageAccumulator _aggregateWebUsageInterval:identifier:](self, "_aggregateWebUsageInterval:identifier:", v28, v15);
      objc_msgSend(v25, "removeObjectAtIndex:", 0);
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        goto LABEL_18;
      }
      -[USTrustIdentifier identifier](v15, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v28;
      _os_log_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received end event for %{public}@ without a corresponding start event. This may be because the event was manually ended due to a backlight end event.", (uint8_t *)&v30, 0xCu);
    }

    goto LABEL_17;
  }
  objc_msgSend(v25, "addObject:", v12);
LABEL_18:
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, v15);
  -[USUsageAccumulator webUsageStartDatesByWebBrowser](self, "webUsageStartDatesByWebBrowser");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v21, v16);

}

- (void)_accumulateMediaNowPlayingWithTimestamp:(id)a3 starting:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[USUsageAccumulator mediaNowPlayingStartDate](self, "mediaNowPlayingStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (!v7)
      -[USUsageAccumulator setMediaNowPlayingStartDate:](self, "setMediaNowPlayingStartDate:", v6);
  }
  else if (v7)
  {
    if (objc_msgSend(v7, "compare:", v6) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[USUsageAccumulator _accumulateMediaNowPlayingWithTimestamp:starting:].cold.1();
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v8, v6);
      -[USUsageAccumulator _aggregateCategoryUsageInterval:identifier:](self, "_aggregateCategoryUsageInterval:identifier:", v9, *MEMORY[0x24BE15790]);
      -[USUsageAccumulator setMediaNowPlayingStartDate:](self, "setMediaNowPlayingStartDate:", 0);

    }
  }

}

- (void)aggregateUsageForInterval:(id)a3 usageReportHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  USUsageAccumulator *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  USUsageAccumulator *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void (**v38)(id, id);
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[18];

  v48[16] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "earlierDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[USUsageAccumulator _aggregateStartDatesUsingEndDate:](self, "_aggregateStartDatesUsingEndDate:", v10);
  -[USUsageAccumulator lastEventDate](self, "lastEventDate");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    v36 = (void *)v11;
    v37 = v10;
    v38 = v7;
    v39 = v6;
    -[USUsageAccumulator backlightIntervals](self, "backlightIntervals");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v19, "duration");
          if (v20 > -1.0)
          {
            v21 = v19;

            v16 = v21;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    v48[0] = 0;
    -[USUsageAccumulator applicationUsageIntervals](self, "applicationUsageIntervals");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    +[USUsageQuerying _generatePickupsByBundleIdentifierWithPickupIntervals:applicationUsageIntervals:pickupsWithoutApplicationUsage:firstPickup:](USUsageQuerying, "_generatePickupsByBundleIdentifierWithPickupIntervals:applicationUsageIntervals:pickupsWithoutApplicationUsage:firstPickup:", v13, v23, v48, &v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v43;

    v34 = v48[0];
    -[USUsageAccumulator applicationUsageIntervals](self, "applicationUsageIntervals");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[USUsageAccumulator webUsageIntervals](self, "webUsageIntervals");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[USUsageAccumulator categoryUsageIntervals](self, "categoryUsageIntervals");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[USUsageAccumulator canonicalApplicationUsageIntervals](self, "canonicalApplicationUsageIntervals");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[USUsageAccumulator primaryWebUsageIntervals](self, "primaryWebUsageIntervals");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[USUsageAccumulator applicationCategories](self, "applicationCategories");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[USUsageAccumulator webCategories](self, "webCategories");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = self;
    v32 = self;
    v26 = (void *)v24;
    -[USUsageAccumulator notifications](v25, "notifications");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v36;
    v6 = v39;
    v22 = +[USUsageQuerying _newReportWithNonIntersectingScreenTimeIntervals:pickupsByBundleIdentifier:pickupsWithoutApplicationUsage:firstPickup:longestSession:applicationUsageIntervals:webUsageIntervals:categoryUsageIntervals:aggregatedApplicationUsageIntervals:aggregatedWebUsageIntervals:categoryByBundleIdentifier:categoryByWebDomain:notifications:interval:timeZone:lastEventDate:](USUsageQuerying, "_newReportWithNonIntersectingScreenTimeIntervals:pickupsByBundleIdentifier:pickupsWithoutApplicationUsage:firstPickup:longestSession:applicationUsageIntervals:webUsageIntervals:categoryUsageIntervals:aggregatedApplicationUsageIntervals:aggregatedWebUsageIntervals:categoryByBundleIdentifier:categoryByWebDomain:notifications:interval:timeZone:lastEventDate:", v13, v42, v34, v35, v16, v33, v41, v40, v31, v30, v29, v26, v27, v39,
            v28,
            v36);

    -[USUsageAccumulator _resetAggregations](v32, "_resetAggregations");
    v10 = v37;
    v7 = v38;
  }
  else
  {
    +[USUsageReport emptyReportForInterval:](USUsageReport, "emptyReportForInterval:", v6);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7[2](v7, v22);

}

- (void)_resetAggregations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[USUsageAccumulator backlightIntervals](self, "backlightIntervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[USUsageAccumulator applicationUsageIntervals](self, "applicationUsageIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[USUsageAccumulator webUsageIntervals](self, "webUsageIntervals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[USUsageAccumulator categoryUsageIntervals](self, "categoryUsageIntervals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[USUsageAccumulator canonicalApplicationUsageIntervals](self, "canonicalApplicationUsageIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[USUsageAccumulator primaryWebUsageIntervals](self, "primaryWebUsageIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[USUsageAccumulator notifications](self, "notifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[USUsageAccumulator setLastEventDate:](self, "setLastEventDate:", 0);
}

- (void)_aggregateApplicationUsageInterval:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  USUsageAccumulator *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  USTrustIdentifier *v44;
  id v45;
  id v46;
  USUsageAccumulator *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v47 = self;
  -[USUsageAccumulator applicationUsageIntervals](self, "applicationUsageIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v13 = v12;
  v14 = v6;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v15)
  {
    v16 = v15;
    v45 = v14;
    v46 = v7;
    v17 = 0;
    v18 = *(_QWORD *)v50;
    do
    {
      v19 = 0;
      v48 = v16;
      do
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v19);
        if (objc_msgSend(v20, "intersectsDateInterval:", v14))
        {
          v21 = v13;
          objc_msgSend(v20, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "earlierDate:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "endDate");
          v26 = v17;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "laterDate:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v26;
          v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v24, v28);

          if (v26)
            objc_msgSend(v26, "addObject:", v20);
          else
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v20, 0);

          v14 = (id)v29;
          v13 = v21;
          v16 = v48;
        }
        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v16);
    v7 = v46;
    if (v17)
      objc_msgSend(v13, "removeObjectsInArray:", v17);
    v30 = v47;
    v31 = v45;
  }
  else
  {
    v17 = 0;
    v31 = v14;
    v30 = v47;
  }
  objc_msgSend(v13, "addObject:", v14);

  -[USUsageAccumulator applicationUsageIntervals](v30, "applicationUsageIntervals");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v13, v7);

  -[USUsageAccumulator applicationCategories](v30, "applicationCategories");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "identifier");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  v38 = (void *)*MEMORY[0x24BE157A8];
  if (v36)
    v38 = (void *)v36;
  v39 = v38;

  -[USUsageAccumulator _aggregateCategoryUsageInterval:identifier:](v30, "_aggregateCategoryUsageInterval:identifier:", v31, v39);
  objc_msgSend(v35, "canonicalBundleIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    v42 = v40;
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }
  v43 = v42;

  v44 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v43, 1);
  -[USUsageAccumulator _aggregateCanonicalApplicationUsageInterval:canonicalIdentifier:](v30, "_aggregateCanonicalApplicationUsageInterval:canonicalIdentifier:", v31, v44);

}

- (void)_aggregateWebUsageInterval:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  USUsageAccumulator *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  USTrustIdentifier *v41;
  USTrustIdentifier *v42;
  id v43;
  id v44;
  USUsageAccumulator *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v45 = self;
  -[USUsageAccumulator webUsageIntervals](self, "webUsageIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v13 = v12;
  v14 = v6;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v15)
  {
    v16 = v15;
    v43 = v14;
    v44 = v7;
    v17 = 0;
    v18 = *(_QWORD *)v48;
    v19 = v14;
    do
    {
      v20 = 0;
      v46 = v16;
      do
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v20);
        if (objc_msgSend(v21, "intersectsDateInterval:", v19))
        {
          v22 = v13;
          objc_msgSend(v21, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "earlierDate:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "endDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "endDate");
          v27 = v17;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "laterDate:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v27;
          v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v25, v29);

          if (v27)
            objc_msgSend(v27, "addObject:", v21);
          else
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v21, 0);

          v19 = (void *)v30;
          v13 = v22;
          v16 = v46;
        }
        ++v20;
      }
      while (v16 != v20);
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v16);
    v7 = v44;
    if (v17)
      objc_msgSend(v13, "removeObjectsInArray:", v17);
    v31 = v45;
    v14 = v43;
  }
  else
  {
    v17 = 0;
    v19 = v14;
    v31 = v45;
  }
  objc_msgSend(v13, "addObject:", v19);

  -[USUsageAccumulator webUsageIntervals](v31, "webUsageIntervals");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v13, v7);

  -[USUsageAccumulator webCategories](v31, "webCategories");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "identifier");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  v38 = (void *)*MEMORY[0x24BE157A8];
  if (v36)
    v38 = (void *)v36;
  v39 = v38;

  -[USUsageAccumulator _aggregateCategoryUsageInterval:identifier:](v31, "_aggregateCategoryUsageInterval:identifier:", v14, v39);
  objc_msgSend(v35, "canonicalBundleIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v40, objc_msgSend(v7, "trusted"));
    -[USUsageAccumulator _aggregateCanonicalApplicationUsageInterval:canonicalIdentifier:](v31, "_aggregateCanonicalApplicationUsageInterval:canonicalIdentifier:", v14, v41);
  }
  else
  {
    objc_msgSend(v35, "primaryWebDomain");
    v41 = (USTrustIdentifier *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v42 = -[USTrustIdentifier initWithIdentifier:trusted:]([USTrustIdentifier alloc], "initWithIdentifier:trusted:", v41, objc_msgSend(v7, "trusted"));
      -[USUsageAccumulator _aggregatePrimaryWebUsageInterval:primaryIdentifier:](v31, "_aggregatePrimaryWebUsageInterval:primaryIdentifier:", v14, v42);

    }
  }

}

- (void)_aggregateCategoryUsageInterval:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  USUsageAccumulator *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32 = self;
  -[USUsageAccumulator categoryUsageIntervals](self, "categoryUsageIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v13 = v12;
  v14 = v6;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v15)
  {
    v16 = v15;
    v30 = v14;
    v31 = v7;
    v33 = 0;
    v17 = *(_QWORD *)v35;
    v18 = v14;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v20, "intersectsDateInterval:", v18))
        {
          objc_msgSend(v20, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "earlierDate:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "laterDate:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v23, v26);
          if (v33)
            objc_msgSend(v33, "addObject:", v20);
          else
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v20, 0);

          v18 = (void *)v27;
        }
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v16);
    v7 = v31;
    v28 = v33;
    if (v33)
      objc_msgSend(v13, "removeObjectsInArray:", v33);
    v14 = v30;
  }
  else
  {
    v28 = 0;
    v18 = v14;
  }
  objc_msgSend(v13, "addObject:", v18);

  -[USUsageAccumulator categoryUsageIntervals](v32, "categoryUsageIntervals");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v13, v7);

}

- (void)_aggregateCanonicalApplicationUsageInterval:(id)a3 canonicalIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  USUsageAccumulator *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32 = self;
  -[USUsageAccumulator canonicalApplicationUsageIntervals](self, "canonicalApplicationUsageIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v13 = v12;
  v14 = v6;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v15)
  {
    v16 = v15;
    v30 = v14;
    v31 = v7;
    v33 = 0;
    v17 = *(_QWORD *)v35;
    v18 = v14;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v20, "intersectsDateInterval:", v18))
        {
          objc_msgSend(v20, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "earlierDate:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "laterDate:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v23, v26);
          if (v33)
            objc_msgSend(v33, "addObject:", v20);
          else
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v20, 0);

          v18 = (void *)v27;
        }
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v16);
    v7 = v31;
    v28 = v33;
    if (v33)
      objc_msgSend(v13, "removeObjectsInArray:", v33);
    v14 = v30;
  }
  else
  {
    v28 = 0;
    v18 = v14;
  }
  objc_msgSend(v13, "addObject:", v18);

  -[USUsageAccumulator canonicalApplicationUsageIntervals](v32, "canonicalApplicationUsageIntervals");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v13, v7);

}

- (void)_aggregatePrimaryWebUsageInterval:(id)a3 primaryIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  USUsageAccumulator *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32 = self;
  -[USUsageAccumulator primaryWebUsageIntervals](self, "primaryWebUsageIntervals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  v13 = v12;
  v14 = v6;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v15)
  {
    v16 = v15;
    v30 = v14;
    v31 = v7;
    v33 = 0;
    v17 = *(_QWORD *)v35;
    v18 = v14;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v20, "intersectsDateInterval:", v18))
        {
          objc_msgSend(v20, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "startDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "earlierDate:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "laterDate:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v23, v26);
          if (v33)
            objc_msgSend(v33, "addObject:", v20);
          else
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v20, 0);

          v18 = (void *)v27;
        }
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v16);
    v7 = v31;
    v28 = v33;
    if (v33)
      objc_msgSend(v13, "removeObjectsInArray:", v33);
    v14 = v30;
  }
  else
  {
    v28 = 0;
    v18 = v14;
  }
  objc_msgSend(v13, "addObject:", v18);

  -[USUsageAccumulator primaryWebUsageIntervals](v32, "primaryWebUsageIntervals");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v13, v7);

}

- (void)_stopAllUsageWithEndDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  id v21;
  USUsageAccumulator *v22;
  _QWORD v23[4];
  id v24;
  USUsageAccumulator *v25;

  v4 = a3;
  -[USUsageAccumulator applicationUsageStartDates](self, "applicationUsageStartDates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke;
  v23[3] = &unk_24C7DB4A0;
  v7 = v4;
  v24 = v7;
  v25 = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v23);

  -[USUsageAccumulator applicationUsageStartDates](self, "applicationUsageStartDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[USUsageAccumulator webUsageStartDatesByWebBrowser](self, "webUsageStartDatesByWebBrowser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  v18 = 3221225472;
  v19 = __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_16;
  v20 = &unk_24C7DB068;
  v10 = v7;
  v21 = v10;
  v22 = self;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v17);

  -[USUsageAccumulator webUsageStartDatesByWebBrowser](self, "webUsageStartDatesByWebBrowser", v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[USUsageAccumulator mediaNowPlayingStartDate](self, "mediaNowPlayingStartDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (objc_msgSend(v12, "compare:", v10) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[USUsageAccumulator _accumulateMediaNowPlayingWithTimestamp:starting:].cold.1();
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, v10);
      -[USUsageAccumulator _aggregateCategoryUsageInterval:identifier:](self, "_aggregateCategoryUsageInterval:identifier:", v14, *MEMORY[0x24BE15790]);

    }
  }
  -[USUsageAccumulator setMediaNowPlayingStartDate:](self, "setMediaNowPlayingStartDate:", 0);
  -[USUsageAccumulator webUsageStateByUniqueID](self, "webUsageStateByUniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  -[USUsageAccumulator mediaUsageStateByUniqueID](self, "mediaUsageStateByUniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

}

void __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v8 = 138543874;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(_QWORD *)(a1 + 32), v17) == 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v5, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v17;
            v23 = v14;
            v24 = 2114;
            v25 = v13;
            v26 = 2114;
            v27 = v15;
            _os_log_fault_impl(&dword_20D894000, v11, OS_LOG_TYPE_FAULT, "Application %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);

          }
        }
        else
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "_aggregateApplicationUsageInterval:identifier:", v16, v5);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

}

void __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_2;
  v7[3] = &unk_24C7DB4A0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __47__USUsageAccumulator__stopAllUsageWithEndDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v8 = 138543874;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(_QWORD *)(a1 + 32), v17) == 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v5, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v17;
            v23 = v14;
            v24 = 2114;
            v25 = v13;
            v26 = 2114;
            v27 = v15;
            _os_log_fault_impl(&dword_20D894000, v11, OS_LOG_TYPE_FAULT, "Web domain %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);

          }
        }
        else
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "_aggregateWebUsageInterval:identifier:", v16, v5);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

}

- (void)_stopAllWebUsageForWebBrowser:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  USUsageAccumulator *v14;

  v6 = a4;
  v7 = a3;
  -[USUsageAccumulator webUsageStartDatesByWebBrowser](self, "webUsageStartDatesByWebBrowser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__USUsageAccumulator__stopAllWebUsageForWebBrowser_endDate___block_invoke;
  v12[3] = &unk_24C7DB4A0;
  v13 = v6;
  v14 = self;
  v11 = v6;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[USUsageAccumulator webUsageStartDatesByWebBrowser](self, "webUsageStartDatesByWebBrowser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v7);

}

void __60__USUsageAccumulator__stopAllWebUsageForWebBrowser_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v8 = 138543874;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(_QWORD *)(a1 + 32), v17) == 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v5, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v17;
            v23 = v14;
            v24 = 2114;
            v25 = v13;
            v26 = 2114;
            v27 = v15;
            _os_log_fault_impl(&dword_20D894000, v11, OS_LOG_TYPE_FAULT, "Web domain %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);

          }
        }
        else
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "_aggregateWebUsageInterval:identifier:", v16, v5);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

}

- (void)_aggregateStartDatesUsingEndDate:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id obj;
  USUsageAccumulator *v44;
  _QWORD v45[5];
  id v46;
  uint64_t *v47;
  _QWORD v48[4];
  id v49;
  USUsageAccumulator *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  USUsageAccumulator *v58;
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v44 = self;
  -[USUsageAccumulator backlightStartDate](self, "backlightStartDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    if (objc_msgSend(v42, "compare:", v41) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[USUsageAccumulator _accumulateDeviceBacklightWithIsBacklit:timestamp:].cold.1();
    }
    else
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v42, v41);
      -[USUsageAccumulator backlightIntervals](v44, "backlightIntervals");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v4;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      obj = v5;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      if (v6)
      {
        v7 = 0;
        v8 = *(_QWORD *)v65;
        v9 = v40;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v65 != v8)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            if (objc_msgSend(v11, "intersectsDateInterval:", v9))
            {
              objc_msgSend(v11, "startDate");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "startDate");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "earlierDate:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "endDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "endDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "laterDate:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v14, v17);
              if (v7)
                objc_msgSend(v7, "addObject:", v11);
              else
                v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v11, 0);

              v9 = (void *)v18;
            }
          }
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        }
        while (v6);

        if (v7)
          objc_msgSend(obj, "removeObjectsInArray:", v7);
      }
      else
      {

        v7 = 0;
        v9 = v40;
      }
      objc_msgSend(obj, "addObject:", v9);

    }
    -[USUsageAccumulator setBacklightStartDate:](v44, "setBacklightStartDate:", v41);
    *((_BYTE *)v61 + 24) = 1;
  }
  v19 = (void *)objc_opt_new();
  -[USUsageAccumulator applicationUsageStartDates](v44, "applicationUsageStartDates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke;
  v56[3] = &unk_24C7DB4C8;
  v22 = v41;
  v57 = v22;
  v58 = v44;
  v23 = v19;
  v59 = v23;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v56);

  -[USUsageAccumulator applicationUsageStartDates](v44, "applicationUsageStartDates");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAllObjects");

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v25 = v23;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v29, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[USUsageAccumulator _accumulateApplication:timestamp:starting:isUsageTrusted:](v44, "_accumulateApplication:timestamp:starting:isUsageTrusted:", v30, v22, 1, objc_msgSend(v29, "trusted"));

        *((_BYTE *)v61 + 24) = 1;
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    }
    while (v26);
  }

  v31 = (void *)objc_opt_new();
  -[USUsageAccumulator webUsageStartDatesByWebBrowser](v44, "webUsageStartDatesByWebBrowser");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v21;
  v48[1] = 3221225472;
  v48[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_19;
  v48[3] = &unk_24C7DB018;
  v33 = v22;
  v49 = v33;
  v50 = v44;
  v34 = v31;
  v51 = v34;
  objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v48);

  -[USUsageAccumulator webUsageStartDatesByWebBrowser](v44, "webUsageStartDatesByWebBrowser");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeAllObjects");

  v45[0] = v21;
  v45[1] = 3221225472;
  v45[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_20;
  v45[3] = &unk_24C7DB518;
  v45[4] = v44;
  v36 = v33;
  v46 = v36;
  v47 = &v60;
  objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v45);
  -[USUsageAccumulator mediaNowPlayingStartDate](v44, "mediaNowPlayingStartDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if (objc_msgSend(v37, "compare:", v36) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[USUsageAccumulator _aggregateStartDatesUsingEndDate:].cold.1();
    }
    else
    {
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v38, v36);
      -[USUsageAccumulator _aggregateCategoryUsageInterval:identifier:](v44, "_aggregateCategoryUsageInterval:identifier:", v39, *MEMORY[0x24BE15790]);

    }
    -[USUsageAccumulator setMediaNowPlayingStartDate:](v44, "setMediaNowPlayingStartDate:", v36);
    *((_BYTE *)v61 + 24) = 1;
  }
  else if (!*((_BYTE *)v61 + 24))
  {
    goto LABEL_38;
  }
  -[USUsageAccumulator setLastEventDate:](v44, "setLastEventDate:", v36);
LABEL_38:

  _Block_object_dispose(&v60, 8);
}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v8 = 138543874;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(_QWORD *)(a1 + 32), v17) == 1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v5, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = v17;
            v23 = v14;
            v24 = 2114;
            v25 = v13;
            v26 = 2114;
            v27 = v15;
            _os_log_fault_impl(&dword_20D894000, v11, OS_LOG_TYPE_FAULT, "Application %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);

          }
        }
        else
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "_aggregateApplicationUsageInterval:identifier:", v16, v5);

        }
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a2;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_2;
  v10[3] = &unk_24C7DB4F0;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    v11 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v8 = 138543874;
    v21 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v13, "compare:", *(_QWORD *)(a1 + 32), v21) == 1
          && os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v5, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = v21;
          v27 = v19;
          v28 = 2114;
          v29 = v13;
          v30 = 2114;
          v31 = v20;
          _os_log_fault_impl(&dword_20D894000, v11, OS_LOG_TYPE_FAULT, "Web domain %{public}@ start date: %{public}@ is later than end date: %{public}@", buf, 0x20u);

        }
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "_aggregateWebUsageInterval:identifier:", v14, v5);

        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
          v17 = v15;
        else
          v17 = (id)objc_opt_new();
        v18 = v17;

        objc_msgSend(v18, "addObject:", v5);
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v18, *(_QWORD *)(a1 + 56));

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v9);
  }

}

void __55__USUsageAccumulator__aggregateStartDatesUsingEndDate___block_invoke_20(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (void *)a1[4];
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_accumulateWebDomain:bundleIdentifier:timestamp:starting:isUsageTrusted:", v12, v13, a1[5], 1, objc_msgSend(v10, "trusted"));

        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (NSDictionary)applicationCategories
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)webCategories
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)backlightStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBacklightStartDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSMutableDictionary)applicationUsageStartDates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)webUsageStartDatesByWebBrowser
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)mediaNowPlayingStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMediaNowPlayingStartDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSMutableDictionary)webUsageStateByUniqueID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (int)quickLookVideoNowPlayingState
{
  return self->_quickLookVideoNowPlayingState;
}

- (void)setQuickLookVideoNowPlayingState:(int)a3
{
  self->_quickLookVideoNowPlayingState = a3;
}

- (NSMutableDictionary)mediaUsageStateByUniqueID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (NSMutableArray)backlightIntervals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableDictionary)applicationUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)webUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableDictionary)categoryUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (NSMutableDictionary)canonicalApplicationUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (NSMutableDictionary)primaryWebUsageIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (NSMutableDictionary)notifications
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)lastEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastEventDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (BOOL)isStandByEnabled
{
  return self->_standByEnabled;
}

- (void)setStandByEnabled:(BOOL)a3
{
  self->_standByEnabled = a3;
}

- (BOOL)isDeviceBacklit
{
  return self->_deviceBacklit;
}

- (void)setDeviceBacklit:(BOOL)a3
{
  self->_deviceBacklit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEventDate, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_primaryWebUsageIntervals, 0);
  objc_storeStrong((id *)&self->_canonicalApplicationUsageIntervals, 0);
  objc_storeStrong((id *)&self->_categoryUsageIntervals, 0);
  objc_storeStrong((id *)&self->_webUsageIntervals, 0);
  objc_storeStrong((id *)&self->_applicationUsageIntervals, 0);
  objc_storeStrong((id *)&self->_backlightIntervals, 0);
  objc_storeStrong((id *)&self->_mediaUsageStateByUniqueID, 0);
  objc_storeStrong((id *)&self->_webUsageStateByUniqueID, 0);
  objc_storeStrong((id *)&self->_mediaNowPlayingStartDate, 0);
  objc_storeStrong((id *)&self->_webUsageStartDatesByWebBrowser, 0);
  objc_storeStrong((id *)&self->_applicationUsageStartDates, 0);
  objc_storeStrong((id *)&self->_backlightStartDate, 0);
  objc_storeStrong((id *)&self->_webCategories, 0);
  objc_storeStrong((id *)&self->_applicationCategories, 0);
}

- (void)accumulateEvent:timestamp:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Received unexpected event type: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

- (void)_accumulateAppUsage:timestamp:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Received malformed app usage event: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

- (void)_accumulateAppMediaUsage:timestamp:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Received malformed app media usage event: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

- (void)_accumulateAppWebUsage:timestamp:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Received malformed app web usage event: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

- (void)_accumulateDeviceBacklightWithIsBacklit:timestamp:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Backlight start date: %{public}@ is later than end date: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

- (void)_accumulateNotificationUsage:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Received notification usage event without bundle identifier: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

- (void)_accumulateApplication:timestamp:starting:isUsageTrusted:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Received end event at %{public}@ for %{public}@ that is earlier than its start date: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_7();
}

- (void)_accumulateWebDomain:(uint64_t)a1 bundleIdentifier:(void *)a2 timestamp:starting:isUsageTrusted:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_20D894000, MEMORY[0x24BDACB70], v3, "Received end event at %{public}@ for %{public}@ that is earlier than its start date: %{public}@", v4, v5, v6, v7, 2u);

}

- (void)_accumulateMediaNowPlayingWithTimestamp:starting:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Media now playing start date: %{public}@ is later than end date: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

- (void)_aggregateStartDatesUsingEndDate:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_20D894000, MEMORY[0x24BDACB70], v0, "Media %{public}@ start date: %{public}@ is later than end date: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_7();
}

@end

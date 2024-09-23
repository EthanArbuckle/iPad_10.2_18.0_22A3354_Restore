@implementation SUAnalyticsManager

- (SUAnalyticsManager)init
{
  SUAnalyticsManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *stateQueue;
  SUCoreAnalyticsEventSubmitter *v6;
  SUCoreAnalyticsEventSubmitter *coreEventSubmitter;
  NSString *savePath;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUAnalyticsManager;
  v2 = -[SUAnalyticsManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.SUServices.SUCoreAnalyticsManagerQueue", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    v6 = (SUCoreAnalyticsEventSubmitter *)objc_alloc_init(MEMORY[0x24BEAE7E0]);
    coreEventSubmitter = v2->_coreEventSubmitter;
    v2->_coreEventSubmitter = v6;

    savePath = v2->_savePath;
    v2->_savePath = (NSString *)CFSTR("/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/");

  }
  return v2;
}

- (SUAnalyticsManager)initWithPath:(id)a3
{
  id v5;
  SUAnalyticsManager *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *stateQueue;
  SUCoreAnalyticsEventSubmitter *v10;
  SUCoreAnalyticsEventSubmitter *coreEventSubmitter;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUAnalyticsManager;
  v6 = -[SUAnalyticsManager init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.SUServices.SUCoreAnalyticsManagerQueue", v7);
    stateQueue = v6->_stateQueue;
    v6->_stateQueue = (OS_dispatch_queue *)v8;

    v10 = (SUCoreAnalyticsEventSubmitter *)objc_alloc_init(MEMORY[0x24BEAE7E0]);
    coreEventSubmitter = v6->_coreEventSubmitter;
    v6->_coreEventSubmitter = v10;

    objc_storeStrong((id *)&v6->_savePath, a3);
  }

  return v6;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_14);
  return (id)sharedManager___manager;
}

void __35__SUAnalyticsManager_sharedManager__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUAnalyticsManager *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "fileExistsAtPath:", CFSTR("/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/")) & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    v11 = 0;
    objc_msgSend(v0, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/"), 1, 0, &v11);
    v1 = v11;
    if (v1)
    {
      SULogAnalytics();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      SULogErrorForSubsystem(v2, CFSTR("Failed to create directory %@ for SUCoreAnalytics: %@"), v3, v4, v5, v6, v7, v8, (uint64_t)CFSTR("/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/"));

    }
  }
  v9 = objc_alloc_init(SUAnalyticsManager);
  v10 = (void *)sharedManager___manager;
  sharedManager___manager = (uint64_t)v9;

}

- (id)copyEventFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v40;
  id v41;
  id v42;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v42);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v42;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (!v8)
    goto LABEL_13;
  v9 = *MEMORY[0x24BDD0D30];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D30]);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v5, "objectForKeyedSubscript:", v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0D40]),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    v41 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v3, 0, &v41);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v41;
    v7 = v15;
    if (!v14 || v15)
    {
      SULogAnalytics();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      SULogErrorForSubsystem(v18, CFSTR("Failed to read contents of event file: %@ (%@)"), v26, v27, v28, v29, v30, v31, (uint64_t)v3);
      v19 = 0;
    }
    else
    {
      v40 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v40);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v40;
      v18 = v17;
      if (!v16 || v17)
      {
        SULogAnalytics();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        SULogErrorForSubsystem(v32, CFSTR("Invalid event data for :%@ (%@)"), v33, v34, v35, v36, v37, v38, (uint64_t)v3);

        v19 = 0;
      }
      else
      {
        v19 = v16;
      }

    }
  }
  else
  {
LABEL_13:
    SULogAnalytics();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v14, CFSTR("Invalid file type found for even at path: %@ [%@] (skipping)"), v20, v21, v22, v23, v24, v25, (uint64_t)v3);
    v19 = 0;
  }

  return v19;
}

- (BOOL)saveEventToDisk:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUAnalyticsManager_saveEventToDisk___block_invoke;
  block[3] = &unk_24CE3D168;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __38__SUAnalyticsManager_saveEventToDisk___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    SULogAnalytics();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v28;
    v36 = CFSTR("Save called on object with no path specified");
LABEL_9:
    SULogErrorForSubsystem(v28, v36, v29, v30, v31, v32, v33, v34, v46);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "eventUUID");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 40), "eventName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    SULogAnalytics();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v28;
    v36 = CFSTR("Invalid event passed to saveEvent.Skipping");
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 40), "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "eventUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%@%s"), v6, v7, ".suanalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SULogAnalytics();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "eventName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "eventUUID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v10, CFSTR("Saving event %@:%@ to %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

  v18 = *(_QWORD *)(a1 + 40);
  v49 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v49);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (__CFString *)v49;
  if (v19 && (objc_msgSend(v19, "writeToFile:atomically:", v9, 1) & 1) != 0)
  {
    SULogAnalytics();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v21, CFSTR("Successfully saved event"), v22, v23, v24, v25, v26, v27, v47);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    SULogAnalytics();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v37;
    v45 = CFSTR("Unknown Archiver Error");
    if (v20)
      v45 = v20;
    SULogErrorForSubsystem(v37, CFSTR("Unable to save SU coreanalytics event(%@)"), v38, v39, v40, v41, v42, v43, (uint64_t)v45);

  }
}

- (void)setEvent:(id)a3
{
  NSObject *stateQueue;
  id v5;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_not_V2(stateQueue);
  -[SUAnalyticsManager saveEventToDisk:](self, "saveEventToDisk:", v5);

}

- (void)removeEvent:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUAnalyticsManager *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SUAnalyticsManager_removeEvent___block_invoke;
  block[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __34__SUAnalyticsManager_removeEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@%s"), v4, v5, ".suanalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v7))
  {
    v19 = 0;
    v8 = objc_msgSend(v2, "removeItemAtPath:error:", v7, &v19);
    v9 = v19;
    if ((v8 & 1) == 0)
    {
      SULogAnalytics();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eventName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eventUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      SULogErrorForSubsystem(v10, CFSTR("Unable to remove event %@ : %@ : %@"), v13, v14, v15, v16, v17, v18, (uint64_t)v11);

    }
  }
  else
  {
    v9 = 0;
  }

}

- (void)removeEventsWithName:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUAnalyticsManager_removeEventsWithName___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __43__SUAnalyticsManager_removeEventsWithName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "savePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v2;
  objc_msgSend(v2, "enumeratorAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSuffix:", CFSTR(".suanalytics")))
        {
          objc_msgSend(*(id *)(a1 + 32), "savePath");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyEventFromPath:", v12);
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "eventName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 40));

            if (v16)
            {
              v27 = 0;
              objc_msgSend(v26, "removeItemAtPath:error:", v12, &v27);
              v17 = v27;
              SULogAnalytics();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v18;
              if (v17)
              {
                SULogErrorForSubsystem(v18, CFSTR("Unable to remove event file %@: %@"), v19, v20, v21, v22, v23, v24, (uint64_t)v12);

                v25 = v17;
              }
              else
              {
                SULogInfoForSubsystem(v18, CFSTR("Succssfully removed event file %@"), v19, v20, v21, v22, v23, v24, (uint64_t)v12);
              }

            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }

}

- (void)removeAllEvents
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SUAnalyticsManager_removeAllEvents__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __37__SUAnalyticsManager_removeAllEvents__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  objc_msgSend(*(id *)(a1 + 32), "savePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v2;
  objc_msgSend(v2, "enumeratorAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasSuffix:", CFSTR(".suanalytics")))
        {
          objc_msgSend(*(id *)(v3 + 32), "savePath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = 0;
          v14 = objc_msgSend(v24, "removeItemAtPath:error:", v13, &v25);
          v15 = v25;
          SULogAnalytics();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v16;
          if ((v14 & 1) != 0)
            SULogInfoForSubsystem(v16, CFSTR("Successfully removed event file %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v13);
          else
            SULogErrorForSubsystem(v16, CFSTR("Unable to remove event file %@: %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

}

- (void)submitEvent:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUAnalyticsManager *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SUAnalyticsManager_submitEvent___block_invoke;
  block[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __34__SUAnalyticsManager_submitEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@%s"), v4, v5, ".suanalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v7))
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyEventFromPath:", v7);
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "_queue_setEvent:", v8);
      objc_msgSend(*(id *)(a1 + 40), "_queue_submitEvent:", v8);
      SULogAnalytics();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfoForSubsystem(v9, CFSTR("Submitted event %@\n"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    }
    else
    {
      SULogAnalytics();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eventName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eventUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      SULogErrorForSubsystem(v9, CFSTR("Unable to find/reconstruct stashed event for event %@ with uuid %@"), v25, v26, v27, v28, v29, v30, (uint64_t)v24);

    }
    v41 = 0;
    objc_msgSend(v2, "removeItemAtPath:error:", v7, &v41);
    v31 = v41;
    if (v31)
    {
      SULogAnalytics();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      SULogErrorForSubsystem(v32, CFSTR("Failed to remove event file after event submission %@: %@"), v33, v34, v35, v36, v37, v38, (uint64_t)v7);

    }
  }
  else
  {
    SULogAnalytics();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventUUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v16, CFSTR("Event %@ with uuid %@ does not exist"), v18, v19, v20, v21, v22, v23, (uint64_t)v17);

  }
}

- (void)submitEventsWithName:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUAnalyticsManager *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUAnalyticsManager_submitEventsWithName___block_invoke;
  block[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

void __43__SUAnalyticsManager_submitEventsWithName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    SULogAnalytics();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v33, CFSTR("Invalid event name passed to submitEventWithName"), v24, v25, v26, v27, v28, v29, v30);

    return;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "savePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v2;
  objc_msgSend(v2, "enumeratorAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v6)
  {
    v32 = 0;
    goto LABEL_20;
  }
  v7 = v6;
  v32 = 0;
  v8 = *(_QWORD *)v36;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v36 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v9);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "stringByAppendingPathComponent:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "hasSuffix:", CFSTR(".suanalytics")))
      {
        v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyEventFromPath:", v11);
        v13 = v12;
        if (!v12)
          goto LABEL_12;
        objc_msgSend(v12, "eventName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (!v15)
          goto LABEL_12;
        objc_msgSend(*(id *)(a1 + 40), "_queue_setEvent:", v13);
        objc_msgSend(*(id *)(a1 + 40), "_queue_submitEvent:", v13);

        v34 = v32;
        objc_msgSend(v31, "removeItemAtPath:error:", v11, &v34);
        v16 = v34;

        if (v16)
        {
          SULogAnalytics();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          SULogErrorForSubsystem(v13, CFSTR("Failed to remove event file %@: %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v11);
          v32 = v16;
LABEL_12:

          goto LABEL_13;
        }
        v32 = 0;
      }
LABEL_13:

      ++v9;
    }
    while (v7 != v9);
    v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    v7 = v23;
  }
  while (v23);
LABEL_20:

}

- (void)submitAllEvents
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SUAnalyticsManager_submitAllEvents__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __37__SUAnalyticsManager_submitAllEvents__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "savePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v2;
  objc_msgSend(v2, "enumeratorAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSuffix:", CFSTR(".suanalytics")))
        {
          objc_msgSend(*(id *)(a1 + 32), "savePath");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyEventFromPath:", v12);
          if (v13)
          {
            objc_msgSend(*(id *)(a1 + 32), "_queue_setEvent:", v13);
            v38 = 0;
            objc_msgSend(v37, "removeItemAtPath:error:", v12, &v38);
            v14 = v38;
            if (v14)
            {
              v15 = v14;
              SULogAnalytics();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              SULogErrorForSubsystem(v16, CFSTR("Failed to remove event file after event submission %@: %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v12);
              goto LABEL_12;
            }
          }
          else
          {
            SULogAnalytics();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            SULogErrorForSubsystem(v23, CFSTR("Unable to read event at %@ for submission..Removing and moving on"), v24, v25, v26, v27, v28, v29, (uint64_t)v12);

            v39 = 0;
            objc_msgSend(v37, "removeItemAtPath:error:", v12, &v39);
            v30 = v39;
            if (v30)
            {
              v15 = v30;
              SULogAnalytics();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              SULogErrorForSubsystem(v16, CFSTR("Failed to remove event file %@: %@"), v31, v32, v33, v34, v35, v36, (uint64_t)v12);
LABEL_12:

            }
          }

          continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_submitAllEvents");
}

- (NSDictionary)events
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__SUAnalyticsManager_events__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __28__SUAnalyticsManager_events__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "events");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_queue_setEvent:(id)a3
{
  NSObject *stateQueue;
  id v5;
  SUCoreAnalyticsEventSubmitter *coreEventSubmitter;
  id v7;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  coreEventSubmitter = self->_coreEventSubmitter;
  -[SUAnalyticsManager coreAnalyticEventforSUAnalyticEvent:](self, "coreAnalyticEventforSUAnalyticEvent:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SUCoreAnalyticsEventSubmitter setEvent:](coreEventSubmitter, "setEvent:", v7);
}

- (void)_queue_submitAllEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[SUCoreAnalyticsEventSubmitter submitAllEvents](self->_coreEventSubmitter, "submitAllEvents");
}

- (void)_queue_submitEvent:(id)a3
{
  NSObject *stateQueue;
  id v5;
  SUCoreAnalyticsEventSubmitter *coreEventSubmitter;
  id v7;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  coreEventSubmitter = self->_coreEventSubmitter;
  -[SUAnalyticsManager coreAnalyticEventforSUAnalyticEvent:](self, "coreAnalyticEventforSUAnalyticEvent:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SUCoreAnalyticsEventSubmitter submitEvent:](coreEventSubmitter, "submitEvent:", v7);
}

- (id)coreAnalyticEventforSUAnalyticEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BEAE7D8]);
  objc_msgSend(v3, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEventName:", v5);

  objc_msgSend(v3, "eventUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEventUUID:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "eventPayload", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend(v3, "eventPayload");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setEventPayloadEntry:value:", v13, v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v6;
}

- (NSString)savePath
{
  return self->_savePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savePath, 0);
  objc_storeStrong((id *)&self->_coreEventSubmitter, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end

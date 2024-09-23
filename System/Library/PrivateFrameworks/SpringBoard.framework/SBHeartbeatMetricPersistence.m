@implementation SBHeartbeatMetricPersistence

+ (NSURL)defaultPersistenceURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  SBHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("HeartbeatMetrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (SBHeartbeatMetricPersistence)initWithPersistenceURL:(id)a3 persistenceDelay:(double)a4 persistenceLeeway:(double)a5
{
  id v8;
  SBHeartbeatMetricPersistence *v9;
  uint64_t v10;
  NSURL *persistenceURL;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBHeartbeatMetricPersistence;
  v9 = -[SBHeartbeatMetricPersistence init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    persistenceURL = v9->_persistenceURL;
    v9->_persistenceURL = (NSURL *)v10;

    v9->_persistenceDelay = a4;
    v9->_persistenceLeeway = a5;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.SpringBoard.Analytics.SBHeartbeatMetricPersistence", v12);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;

  }
  return v9;
}

- (SBHeartbeatMetricPersistence)init
{
  void *v3;
  SBHeartbeatMetricPersistence *v4;

  objc_msgSend((id)objc_opt_class(), "defaultPersistenceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHeartbeatMetricPersistence initWithPersistenceURL:persistenceDelay:persistenceLeeway:](self, "initWithPersistenceURL:persistenceDelay:persistenceLeeway:", v3, 10.0, 5.0);

  return v4;
}

- (NSDictionary)metricsByDatestamp
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBHeartbeatMetricPersistence_metricsByDatestamp__block_invoke;
  v5[3] = &unk_1E8E9E868;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __50__SBHeartbeatMetricPersistence_metricsByDatestamp__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_initializeIfNeeded");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)trackInteractionWithFeatureNamed:(id)a3
{
  -[SBHeartbeatMetricPersistence trackInteractionWithFeatureNamed:duration:](self, "trackInteractionWithFeatureNamed:duration:", a3, 2.22507386e-308);
}

- (void)trackInteractionWithFeatureNamed:(id)a3 duration:(double)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SBHeartbeatMetricPersistence_trackInteractionWithFeatureNamed_duration___block_invoke;
  block[3] = &unk_1E8EA0AF0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __74__SBHeartbeatMetricPersistence_trackInteractionWithFeatureNamed_duration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;

  objc_msgSend(*(id *)(a1 + 32), "_queue_initializeIfNeeded");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", v3);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "stringFromDate:", v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;

  objc_msgSend(v9, "objectForKey:", CFSTR("Counts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v13;

  objc_msgSend(v14, "objectForKey:", *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16 + 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v17, *(_QWORD *)(a1 + 40));

  objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("Counts"));
  if (BSFloatGreaterThanFloat())
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("Durations"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    v20 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = v21;

    objc_msgSend(v22, "objectForKey:", *(_QWORD *)(a1 + 40));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25 + *(double *)(a1 + 48));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v26, *(_QWORD *)(a1 + 40));

    objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("Durations"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v9, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dateByAddingUnit:value:toDate:options:", 16, -30, v32, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __74__SBHeartbeatMetricPersistence_trackInteractionWithFeatureNamed_duration___block_invoke_2;
  v33[3] = &unk_1E8EA3B50;
  v33[4] = *(_QWORD *)(a1 + 32);
  v34 = v27;
  v29 = v27;
  objc_msgSend(v28, "indexesOfObjectsPassingTest:", v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectsAtIndexes:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectsForKeys:", v31);
  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleWriteIfNeeded");

}

BOOL __74__SBHeartbeatMetricPersistence_trackInteractionWithFeatureNamed_duration___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dateFromString:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 40)) == -1;

  return v4;
}

- (void)migrateDataFromDefaultsIfNeeded:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SBHeartbeatMetricPersistence *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SBHeartbeatMetricPersistence_migrateDataFromDefaultsIfNeeded___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __64__SBHeartbeatMetricPersistence_migrateDataFromDefaultsIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v1 = a1;
  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "engagementPlistRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(v1 + 40), "_queue_initializeIfNeeded");
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v26 = v2;
    obj = v2;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v29)
    {
      v27 = *(_QWORD *)v39;
      v28 = v1;
      do
      {
        v3 = 0;
        do
        {
          if (*(_QWORD *)v39 != v27)
            objc_enumerationMutation(obj);
          v4 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v3);
          objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 32), "objectForKey:", v4, v26);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (void *)objc_msgSend(v5, "mutableCopy");
          v7 = v6;
          if (v6)
            v8 = v6;
          else
            v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v9 = v8;

          objc_msgSend(v9, "objectForKey:", CFSTR("Counts"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "mutableCopy");
          v12 = v11;
          v33 = v3;
          v31 = v9;
          if (v11)
            v13 = v11;
          else
            v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v14 = v13;

          v32 = v4;
          objc_msgSend(obj, "objectForKey:", v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v35 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
                objc_msgSend(v14, "objectForKey:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "integerValue");
                objc_msgSend(v15, "objectForKey:", v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "integerValue") + v22;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKey:", v25, v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v17);
          }
          objc_msgSend(v31, "setObject:forKey:", v14, CFSTR("Counts"));
          v1 = v28;
          objc_msgSend(*(id *)(*(_QWORD *)(v28 + 40) + 32), "setObject:forKey:", v31, v32);

          v3 = v33 + 1;
        }
        while (v33 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v29);
    }

    objc_msgSend(*(id *)(v1 + 40), "_queue_writeToPersistenceURL");
    objc_msgSend(*(id *)(v1 + 32), "setEngagementPlistRepresentation:", 0);
    v2 = v26;
  }

}

- (void)_queue_initializeIfNeeded
{
  NSCalendar *v3;
  void *v4;
  NSCalendar *queue_calendar;
  NSISO8601DateFormatter *v6;
  NSISO8601DateFormatter *queue_dateFormatter;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *queue_metricsByDatestamp;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_calendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v3, "setTimeZone:", v4);

    queue_calendar = self->_queue_calendar;
    self->_queue_calendar = v3;

  }
  if (!self->_queue_dateFormatter)
  {
    v6 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E0CB36A8]);
    queue_dateFormatter = self->_queue_dateFormatter;
    self->_queue_dateFormatter = v6;

  }
  if (!self->_queue_metricsByDatestamp)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", self->_persistenceURL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 1, 0, 0);
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      queue_metricsByDatestamp = self->_queue_metricsByDatestamp;
      self->_queue_metricsByDatestamp = v9;

      v8 = v13;
    }
    if (!self->_queue_metricsByDatestamp)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = self->_queue_metricsByDatestamp;
      self->_queue_metricsByDatestamp = v11;

      v8 = v13;
    }

  }
}

- (void)_queue_scheduleWriteIfNeeded
{
  NSObject *v3;
  dispatch_time_t v4;
  OS_dispatch_source *queue_persistenceTimer;
  _QWORD v6[4];
  id v7;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_persistenceTimer)
  {
    objc_initWeak(&location, self);
    v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    v4 = dispatch_time(0, (uint64_t)(self->_persistenceDelay * 1000000000.0));
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_persistenceLeeway * 1000000000.0));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__SBHeartbeatMetricPersistence__queue_scheduleWriteIfNeeded__block_invoke;
    v6[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v7, &location);
    dispatch_source_set_event_handler(v3, v6);
    dispatch_resume(v3);
    queue_persistenceTimer = self->_queue_persistenceTimer;
    self->_queue_persistenceTimer = (OS_dispatch_source *)v3;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __60__SBHeartbeatMetricPersistence__queue_scheduleWriteIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_writeToPersistenceURL");

}

- (BOOL)_queue_writeToPersistenceURL
{
  NSObject *queue_persistenceTimer;
  OS_dispatch_source *v4;
  void *v5;
  char v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_persistenceTimer = self->_queue_persistenceTimer;
  if (queue_persistenceTimer)
  {
    dispatch_source_cancel(queue_persistenceTimer);
    v4 = self->_queue_persistenceTimer;
    self->_queue_persistenceTimer = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_queue_metricsByDatestamp, 100, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "writeToURL:atomically:", self->_persistenceURL, 1);

  return v6;
}

- (NSURL)persistenceURL
{
  return self->_persistenceURL;
}

- (double)persistenceDelay
{
  return self->_persistenceDelay;
}

- (double)persistenceLeeway
{
  return self->_persistenceLeeway;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_queue_persistenceTimer, 0);
  objc_storeStrong((id *)&self->_queue_metricsByDatestamp, 0);
  objc_storeStrong((id *)&self->_queue_dateFormatter, 0);
  objc_storeStrong((id *)&self->_queue_calendar, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

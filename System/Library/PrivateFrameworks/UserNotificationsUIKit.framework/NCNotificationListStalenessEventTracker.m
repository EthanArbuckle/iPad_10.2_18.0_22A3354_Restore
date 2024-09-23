@implementation NCNotificationListStalenessEventTracker

+ (NCNotificationListStalenessEventTracker)eventTrackerWithAutomaticCollation
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "_startAutocollation");
  return (NCNotificationListStalenessEventTracker *)v2;
}

- (NCNotificationListStalenessEventTracker)init
{
  NCNotificationListStalenessEventTracker *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *lastDisplayedDateByNotificationMetadata;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  PETScalarEventTracker *stalenessEventTracker;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[10];
  _QWORD v23[11];

  v23[10] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationListStalenessEventTracker;
  v2 = -[NCNotificationListStalenessEventTracker init](&v20, sel_init);
  if (v2)
  {
    NCGetEventTrackerQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.UserNotificationsUIKit.NotificationListStalenessMetric", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastDisplayedDateByNotificationMetadata = v2->_lastDisplayedDateByNotificationMetadata;
    v2->_lastDisplayedDateByNotificationMetadata = v6;

    v8 = (void *)MEMORY[0x1E0D80F20];
    objc_msgSend((id)objc_opt_class(), "_allMetricsSafeBundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyWithName:possibleValues:autoSanitizeValues:", CFSTR("bundleIdentifier"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D80F20];
    v22[0] = &unk_1E8D5F950;
    v22[1] = &unk_1E8D5F968;
    v23[0] = CFSTR("InsideMinute");
    v23[1] = CFSTR("InsideFiveMinutes");
    v22[2] = &unk_1E8D5F980;
    v22[3] = &unk_1E8D5F998;
    v23[2] = CFSTR("InsideTwentyMinutes");
    v23[3] = CFSTR("InsideHour");
    v22[4] = &unk_1E8D5F9B0;
    v22[5] = &unk_1E8D5F9C8;
    v23[4] = CFSTR("InsideTwoHours");
    v23[5] = CFSTR("InsideSixHours");
    v22[6] = &unk_1E8D5F9E0;
    v22[7] = &unk_1E8D5F9F8;
    v23[6] = CFSTR("InsideDay");
    v23[7] = CFSTR("InsideTwoDays");
    v22[8] = &unk_1E8D5FA10;
    v22[9] = &unk_1E8D5FA28;
    v23[8] = CFSTR("InsideWeek");
    v23[9] = CFSTR("OutsideWeek");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "propertyWithName:enumMapping:", CFSTR("timeInterval"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:rangeMin:rangeMax:", CFSTR("pairedDeviceCount"), 0, 99);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0D80F38]);
    v21[0] = v10;
    v21[1] = v13;
    v21[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFeatureId:event:registerProperties:", CFSTR("NotificationsUI"), CFSTR("lockscreenStaleness"), v16);
    stalenessEventTracker = v2->_stalenessEventTracker;
    v2->_stalenessEventTracker = (PETScalarEventTracker *)v17;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NCNotificationListStalenessEventTracker _stopAutocollation](self, "_stopAutocollation");
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListStalenessEventTracker;
  -[NCNotificationListStalenessEventTracker dealloc](&v3, sel_dealloc);
}

- (void)_startAutocollation
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleSignificantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopAutocollation
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
}

- (void)handleEvent:(unint64_t)a3
{
  if (!a3)
    -[NCNotificationListStalenessEventTracker _handleListPresentedEvent](self, "_handleListPresentedEvent");
}

- (void)_handleListPresentedEvent
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListStalenessEventTracker structuredSectionList](self, "structuredSectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allNotificationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__NCNotificationListStalenessEventTracker__handleListPresentedEvent__block_invoke;
  block[3] = &unk_1E8D1D8C0;
  block[4] = self;
  v10 = v5;
  v11 = v3;
  v7 = v3;
  v8 = v5;
  dispatch_async(queue, block);

}

uint64_t __68__NCNotificationListStalenessEventTracker__handleListPresentedEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processRequests:timestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_processRequests:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        +[NCEventTrackerNotificationMetadata metadataForNotificationRequest:](NCEventTrackerNotificationMetadata, "metadataForNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_lastDisplayedDateByNotificationMetadata, "setObject:forKey:", v7, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)collateAndRecordMetrics
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NCNotificationListStalenessEventTracker_collateAndRecordMetrics__block_invoke;
  block[3] = &unk_1E8D1B568;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __66__NCNotificationListStalenessEventTracker_collateAndRecordMetrics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_collateAndRecordMetrics");
}

- (void)_queue_collateAndRecordMetrics
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NCNotificationListStalenessEventTracker *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  PETScalarEventTracker *stalenessEventTracker;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableDictionary *obj;
  id obja;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[3];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableDictionary count](self->_lastDisplayedDateByNotificationMetadata, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = self->_lastDisplayedDateByNotificationMetadata;
    v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v4)
    {
      v5 = v4;
      v39 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v50 != v39)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_lastDisplayedDateByNotificationMetadata, "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "date");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "timeIntervalSinceDate:", v9);
          v11 = v10;

          v12 = NCTimeIntervalBinForTimeInterval(v11);
          v13 = (void *)objc_opt_class();
          objc_msgSend(v7, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_metricsSafeBundleIdentifierForBundleIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "objectForKey:", v15);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v3, "setObject:forKey:", v16, v15);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") + 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "setObject:forKey:", v19, v17);
        }
        v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v5);
    }
    v20 = self;

    v21 = BBEventTrackingSyncDeviceCount();
    if (v21 >= 0x63)
      v22 = 99;
    else
      v22 = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obja = v3;
    v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v46;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(obja);
          v40 = v24;
          v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v24);
          objc_msgSend(obja, "objectForKey:", v25, v35);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v42 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(v26, "objectForKey:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                stalenessEventTracker = v20->_stalenessEventTracker;
                v53[0] = v25;
                v53[1] = v31;
                v53[2] = v23;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[PETScalarEventTracker trackEventWithPropertyValues:value:](stalenessEventTracker, "trackEventWithPropertyValues:value:", v34, objc_msgSend(v32, "unsignedIntegerValue"));

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
            }
            while (v28);
          }

          v24 = v40 + 1;
        }
        while (v40 + 1 != v36);
        v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v36);
    }

    -[NSMutableDictionary removeAllObjects](v20->_lastDisplayedDateByNotificationMetadata, "removeAllObjects");
  }
}

+ (id)_metricsSafeBundleIdentifierByBundleIdentifier
{
  if (_metricsSafeBundleIdentifierByBundleIdentifier_onceToken != -1)
    dispatch_once(&_metricsSafeBundleIdentifierByBundleIdentifier_onceToken, &__block_literal_global_14);
  return (id)_metricsSafeBundleIdentifierByBundleIdentifier_allowedList;
}

void __89__NCNotificationListStalenessEventTracker__metricsSafeBundleIdentifierByBundleIdentifier__block_invoke()
{
  void *v0;

  v0 = (void *)_metricsSafeBundleIdentifierByBundleIdentifier_allowedList;
  _metricsSafeBundleIdentifierByBundleIdentifier_allowedList = (uint64_t)&unk_1E8D5FE98;

}

+ (id)_allMetricsSafeBundleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_metricsSafeBundleIdentifierByBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = CFSTR("1stParty");
  v7[1] = CFSTR("3rdParty");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_metricsSafeBundleIdentifierForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;

  v4 = a3;
  if (objc_msgSend(v4, "un_isFirstPartyIdentifier"))
  {
    objc_msgSend(a1, "_metricsSafeBundleIdentifierByBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("1stParty");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

  }
  else
  {
    v9 = CFSTR("3rdParty");
  }

  return v9;
}

- (NCNotificationListSection)notificationList
{
  return (NCNotificationListSection *)objc_loadWeakRetained((id *)&self->_notificationList);
}

- (void)setNotificationList:(id)a3
{
  objc_storeWeak((id *)&self->_notificationList, a3);
}

- (NCNotificationStructuredSectionList)structuredSectionList
{
  return (NCNotificationStructuredSectionList *)objc_loadWeakRetained((id *)&self->_structuredSectionList);
}

- (void)setStructuredSectionList:(id)a3
{
  objc_storeWeak((id *)&self->_structuredSectionList, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_structuredSectionList);
  objc_destroyWeak((id *)&self->_notificationList);
  objc_storeStrong((id *)&self->_stalenessEventTracker, 0);
  objc_storeStrong((id *)&self->_lastDisplayedDateByNotificationMetadata, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

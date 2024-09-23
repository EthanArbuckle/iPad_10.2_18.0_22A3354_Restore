@implementation UNCLocalNotificationClient

- (id)_dateFormatter
{
  if (_dateFormatter___once != -1)
    dispatch_once(&_dateFormatter___once, &__block_literal_global_3);
  return (id)_dateFormatter___dateFormatter;
}

uint64_t __44__UNCLocalNotificationClient__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_dateFormatter___dateFormatter;
  _dateFormatter___dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_dateFormatter___dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss'.'SSS Z"));
}

- (UNCLocalNotificationClient)initWithNotificationRepository:(id)a3 pendingNotificationRepository:(id)a4 notificationScheduleRepository:(id)a5 locationMonitor:(id)a6 bundleIdentifier:(id)a7 queue:(id)a8
{
  id v15;
  id v16;
  NSObject *v17;
  UNCLocalNotificationClient *v18;
  UNCLocalNotificationClient *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  dispatch_assert_queue_V2(v17);
  v26.receiver = self;
  v26.super_class = (Class)UNCLocalNotificationClient;
  v18 = -[UNCLocalNotificationClient init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_notificationRepository, a3);
    objc_storeStrong((id *)&v19->_notificationScheduleRepository, a5);
    objc_storeStrong((id *)&v19->_pendingNotificationRepository, a4);
    objc_storeStrong((id *)&v19->_locationMonitor, a6);
    -[UNCLocationMonitor addObserver:forBundleIdentifier:](v19->_locationMonitor, "addObserver:forBundleIdentifier:", v19, v16);
    objc_storeStrong((id *)&v19->_bundleIdentifier, a7);
    objc_storeStrong((id *)&v19->_queue, a8);
    -[UNCLocalNotificationClient _pendingNotificationRecords](v19, "_pendingNotificationRecords");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationClient _sanitizeNotificationRecords:](v19, "_sanitizeNotificationRecords:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationClient _updateTimersAndRegionMonitorsForPendingNotificationRecords:](v19, "_updateTimersAndRegionMonitorsForPendingNotificationRecords:", v21);

  }
  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[UNCLocalNotificationClient _invalidateNotificationRecordTimersAndRegionMonitors](self, "_invalidateNotificationRecordTimersAndRegionMonitors");
  -[UNCLocationMonitor removeObserver:forBundleIdentifier:](self->_locationMonitor, "removeObserver:forBundleIdentifier:", self, self->_bundleIdentifier);
  v3.receiver = self;
  v3.super_class = (Class)UNCLocalNotificationClient;
  -[UNCLocalNotificationClient dealloc](&v3, sel_dealloc);
}

- (void)addPendingNotificationRecords:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSString *bundleIdentifier;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  UNCLocalNotificationClient *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (os_log_t *)MEMORY[0x24BDF89C8];
  v6 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = v6;
    v9 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "valueForKey:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("un_logDigest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = bundleIdentifier;
    v34 = 2048;
    v35 = v9;
    v36 = 2114;
    v37 = v11;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Add %ld pending notifications: %{public}@", buf, 0x20u);

  }
  if (UNIsInternalInstall())
  {
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      -[UNCLocalNotificationClient addPendingNotificationRecords:].cold.1((uint64_t)self, (uint64_t)v4, v12);
  }
  v25 = self;
  -[UNCLocalNotificationClient _pendingNotificationRecords](self, "_pendingNotificationRecords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v14, "addObjectsFromArray:", v13);
  v24 = v13;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    v19 = MEMORY[0x24BDAC760];
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20);
        v26[0] = v19;
        v26[1] = 3221225472;
        v26[2] = __60__UNCLocalNotificationClient_addPendingNotificationRecords___block_invoke;
        v26[3] = &unk_251AE04B0;
        v26[4] = v21;
        objc_msgSend(v14, "indexesOfObjectsPassingTest:", v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
          objc_msgSend(v14, "removeObjectsAtIndexes:", v22);
        objc_msgSend(v14, "addObject:", v21);

        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationClient _setLastLocalNotificationFireDate:](v25, "_setLastLocalNotificationFireDate:", v23);

  -[UNCLocalNotificationClient _setRequestDateForPendingNotificationRecords:](v25, "_setRequestDateForPendingNotificationRecords:", v15);
  -[UNCLocalNotificationClient _setPendingNotificationRecords:](v25, "_setPendingNotificationRecords:", v14);

}

uint64_t __60__UNCLocalNotificationClient_addPendingNotificationRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)setPendingNotificationRecords:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSString *bundleIdentifier;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (os_log_t *)MEMORY[0x24BDF89C8];
  v6 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = v6;
    v9 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "valueForKey:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("un_logDigest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = bundleIdentifier;
    v16 = 2048;
    v17 = v9;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %ld pending notifications: %{public}@", (uint8_t *)&v14, 0x20u);

  }
  if (UNIsInternalInstall())
  {
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      -[UNCLocalNotificationClient setPendingNotificationRecords:].cold.1((uint64_t)self, (uint64_t)v4, v12);
  }
  -[UNCLocalNotificationClient _setRequestDateForPendingNotificationRecords:](self, "_setRequestDateForPendingNotificationRecords:", v4);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationClient _setLastLocalNotificationFireDate:](self, "_setLastLocalNotificationFireDate:", v13);

  -[UNCLocalNotificationClient _setPendingNotificationRecords:](self, "_setPendingNotificationRecords:", v4);
}

- (void)removePendingNotificationRecordsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSString *bundleIdentifier;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = v5;
    v8 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "valueForKey:", CFSTR("un_logDigest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = bundleIdentifier;
    v17 = 2048;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove %ld pending notifications by identifier: %{public}@", buf, 0x20u);

  }
  -[UNCPendingNotificationRepository pendingNotificationRecordsForBundleIdentifier:](self->_pendingNotificationRepository, "pendingNotificationRecordsForBundleIdentifier:", self->_bundleIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__UNCLocalNotificationClient_removePendingNotificationRecordsWithIdentifiers___block_invoke;
  v13[3] = &unk_251AE04D8;
  v14 = v4;
  v11 = v4;
  objc_msgSend(v10, "bs_filter:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationClient _setPendingNotificationRecords:](self, "_setPendingNotificationRecords:", v12);

}

uint64_t __78__UNCLocalNotificationClient_removePendingNotificationRecordsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)removePendingNotificationRecords:(id)a3
{
  id v4;
  NSObject **v5;
  void *v6;
  NSString *bundleIdentifier;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  UNCLocalNotificationClient *v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (NSObject **)MEMORY[0x24BDF89C8];
  v6 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = v6;
    *(_DWORD *)buf = 138543618;
    v25 = bundleIdentifier;
    v26 = 2048;
    v27 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove %ld pending notifications by match", buf, 0x16u);

  }
  -[UNCPendingNotificationRepository pendingNotificationRecordsForBundleIdentifier:](self->_pendingNotificationRepository, "pendingNotificationRecordsForBundleIdentifier:", self->_bundleIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __63__UNCLocalNotificationClient_removePendingNotificationRecords___block_invoke;
  v21 = &unk_251AE0500;
  v10 = v4;
  v22 = v10;
  v23 = self;
  objc_msgSend(v9, "bs_filter:", &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count", v18, v19, v20, v21);
  v13 = objc_msgSend(v9, "count");
  v14 = v13 - objc_msgSend(v10, "count");
  v15 = *v5;
  v16 = *v5;
  if (v12 <= v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_impl(&dword_2499A5000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove pending notifications succeeded", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    -[UNCLocalNotificationClient removePendingNotificationRecords:].cold.1((uint64_t *)&self->_bundleIdentifier, v15);
  }
  -[UNCLocalNotificationClient _setPendingNotificationRecords:](self, "_setPendingNotificationRecords:", v11);

}

uint64_t __63__UNCLocalNotificationClient_removePendingNotificationRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "uns_containsSimilarRecord:", v3);
  if (v4)
  {
    v5 = (void *)*MEMORY[0x24BDF89C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = v5;
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "un_logDigest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will remove notification %{public}@ by match", (uint8_t *)&v11, 0x16u);

    }
  }

  return v4 ^ 1u;
}

- (void)removeAllPendingNotificationRecords
{
  NSObject *v3;
  NSString *bundleIdentifier;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = *MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v5 = 138543362;
    v6 = bundleIdentifier;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove all pending notifications", (uint8_t *)&v5, 0xCu);
  }
  -[UNCLocalNotificationClient _setPendingNotificationRecords:](self, "_setPendingNotificationRecords:", MEMORY[0x24BDBD1A8]);
}

- (id)pendingNotificationRecords
{
  void *v3;
  os_log_t *v4;
  void *v5;
  NSString *bundleIdentifier;
  NSObject *v7;
  os_log_t v8;
  int v10;
  NSString *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNCLocalNotificationClient _pendingNotificationRecords](self, "_pendingNotificationRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (os_log_t *)MEMORY[0x24BDF89C8];
  v5 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = v5;
    v10 = 138543618;
    v11 = bundleIdentifier;
    v12 = 2048;
    v13 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Load pending %ld notifications", (uint8_t *)&v10, 0x16u);

  }
  if (UNIsInternalInstall())
  {
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
      -[UNCLocalNotificationClient pendingNotificationRecords].cold.1((uint64_t)self, v8, v3);
  }
  return v3;
}

- (id)undeliveredNotificationRecords
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UNCLocalNotificationClient _pendingNotificationRecords](self, "_pendingNotificationRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_lazy_pendingNotificationsAwaitingDelivery)
  {
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNCLocalNotificationClient _invalidateNotificationRecordTimersAndRegionMonitors](self, "_invalidateNotificationRecordTimersAndRegionMonitors");
}

- (void)handleApplicationStateRestore
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNCLocalNotificationClient _pendingNotificationRecords](self, "_pendingNotificationRecords");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationClient _updateTimersAndRegionMonitorsForPendingNotificationRecords:](self, "_updateTimersAndRegionMonitorsForPendingNotificationRecords:", v3);

}

- (void)handleLocaleChange
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_monitoringLocaleAndTimeChanges)
  {
    -[UNCLocalNotificationClient _pendingNotificationRecords](self, "_pendingNotificationRecords");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationClient _updateTimersForPendingNotificationRecords:](self, "_updateTimersForPendingNotificationRecords:", v3);

  }
}

- (void)handleSignificantTimeChange
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_monitoringLocaleAndTimeChanges)
  {
    -[UNCLocalNotificationClient _pendingNotificationRecords](self, "_pendingNotificationRecords");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationClient _updateTimersForPendingNotificationRecords:](self, "_updateTimersForPendingNotificationRecords:", v3);

  }
}

- (void)_setRequestDateForPendingNotificationRecords:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setRequestDate:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_setPendingNotificationRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNCLocalNotificationClient _sanitizeNotificationRecords:](self, "_sanitizeNotificationRecords:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__UNCLocalNotificationClient__setPendingNotificationRecords___block_invoke;
  v11[3] = &unk_251AE0528;
  v11[4] = &v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
  v7 = v13[3];
  if (v7 >= 0x15)
    objc_msgSend(v6, "removeObjectsInRange:", 20, v7 - 20);
  if ((unint64_t)objc_msgSend(v6, "count") >= 0x41)
    objc_msgSend(v6, "removeObjectsInRange:", 0, objc_msgSend(v6, "count") - 64);
  v8 = (id)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v10 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138543618;
    v17 = bundleIdentifier;
    v18 = 2048;
    v19 = v10;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save pending %ld notifications to pending notification repository", buf, 0x16u);
  }

  -[UNCPendingNotificationRepository setPendingNotificationRecords:forBundleIdentifier:](self->_pendingNotificationRepository, "setPendingNotificationRecords:forBundleIdentifier:", v6, self->_bundleIdentifier);
  -[UNCLocalNotificationClient _updateTimersAndRegionMonitorsForPendingNotificationRecords:](self, "_updateTimersAndRegionMonitorsForPendingNotificationRecords:", v6);
  _Block_object_dispose(&v12, 8);

}

void __61__UNCLocalNotificationClient__setPendingNotificationRecords___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  void *v6;
  int v7;
  char v8;

  objc_msgSend(a2, "triggerType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Location"));

  if (v7)
  {
    v8 = 0;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v8 = 1;
  }
  *a4 = v8;
}

- (id)_pendingNotificationRecords
{
  return -[UNCPendingNotificationRepository pendingNotificationRecordsForBundleIdentifier:](self->_pendingNotificationRepository, "pendingNotificationRecordsForBundleIdentifier:", self->_bundleIdentifier);
}

- (id)_sanitizeNotificationRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *bundleIdentifier;
  void *v32;
  void *v33;
  __int128 v35;
  id v36;
  id v37;
  UNCLocalNotificationClient *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  NSString *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38 = self;
  -[UNCLocalNotificationClient _lastLocalNotificationFireDate](self, "_lastLocalNotificationFireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v40;
    *(_QWORD *)&v8 = 138543618;
    v35 = v8;
    v36 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        (*((void (**)(uint64_t, void *))UNSNotificationRecordToUNNotificationTrigger + 2))((uint64_t)UNSNotificationRecordToUNNotificationTrigger, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "willNotifyUser") & 1) == 0)
        {
          objc_msgSend(v12, "badge");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "integerValue");

          if (!v15)
          {
            v30 = (void *)*MEMORY[0x24BDF89C8];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
              goto LABEL_19;
            bundleIdentifier = v38->_bundleIdentifier;
            v19 = v30;
            objc_msgSend(v12, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "un_logDigest");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v35;
            v44 = bundleIdentifier;
            v45 = 2114;
            v46 = v33;
            _os_log_impl(&dword_2499A5000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Filtering out notification %{public}@ as it will not notify user on delivery", buf, 0x16u);

            goto LABEL_18;
          }
        }
        if ((objc_msgSend(v12, "triggerRepeats", v35) & 1) == 0)
        {
          objc_msgSend(v12, "date");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = (void *)*MEMORY[0x24BDF89C8];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
              goto LABEL_19;
            v18 = v38->_bundleIdentifier;
            v19 = v17;
            objc_msgSend(v12, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "un_logDigest");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "date");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v44 = v18;
            v6 = v36;
            v45 = 2114;
            v46 = v21;
            v47 = 2114;
            v48 = v22;
            _os_log_impl(&dword_2499A5000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Expiring out non-repeating notification %{public}@ because it triggered at %{public}@", buf, 0x20u);

LABEL_18:
            goto LABEL_19;
          }
        }
        objc_msgSend(v12, "requestDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v13, "willTriggerAfterDate:withRequestedDate:", v5, v23);

        if ((v24 & 1) != 0)
        {
          objc_msgSend(v37, "addObject:", v12);
        }
        else
        {
          v25 = (void *)*MEMORY[0x24BDF89C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
          {
            v26 = v38->_bundleIdentifier;
            v27 = v25;
            objc_msgSend(v12, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "un_logDigest");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v44 = v26;
            v6 = v36;
            v45 = 2114;
            v46 = v29;
            v47 = 2114;
            v48 = v5;
            _os_log_impl(&dword_2499A5000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Expiring out notification %{public}@ because it won't trigger after %{public}@", buf, 0x20u);

          }
        }
LABEL_19:

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v9);
  }

  return v37;
}

- (void)_fireNotification:(id)a3
{
  id v4;
  void *v5;
  NSString *bundleIdentifier;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *lazy_pendingNotificationsAwaitingDelivery;
  NSMutableArray *v14;
  NSMutableArray *v15;
  UNCNotificationRepository *notificationRepository;
  NSString *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = v5;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationClient _dateFormatter](self, "_dateFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = bundleIdentifier;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deliver local notification %{public}@ at %{public}@", buf, 0x20u);

  }
  lazy_pendingNotificationsAwaitingDelivery = self->_lazy_pendingNotificationsAwaitingDelivery;
  if (!lazy_pendingNotificationsAwaitingDelivery)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = self->_lazy_pendingNotificationsAwaitingDelivery;
    self->_lazy_pendingNotificationsAwaitingDelivery = v14;

    lazy_pendingNotificationsAwaitingDelivery = self->_lazy_pendingNotificationsAwaitingDelivery;
  }
  -[NSMutableArray addObject:](lazy_pendingNotificationsAwaitingDelivery, "addObject:", v4);
  v17 = self->_bundleIdentifier;
  notificationRepository = self->_notificationRepository;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__UNCLocalNotificationClient__fireNotification___block_invoke;
  v19[3] = &unk_251AE0550;
  v19[4] = self;
  v20 = v4;
  v18 = v4;
  -[UNCNotificationRepository saveNotificationRecord:shouldRepost:forBundleIdentifier:withCompletionHandler:](notificationRepository, "saveNotificationRecord:shouldRepost:forBundleIdentifier:withCompletionHandler:", v18, 1, v17, v19);

}

void __48__UNCLocalNotificationClient__fireNotification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)*MEMORY[0x24BDF89E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
      __48__UNCLocalNotificationClient__fireNotification___block_invoke_cold_1(a1, v5, (uint64_t)v4);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 64);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__UNCLocalNotificationClient__fireNotification___block_invoke_13;
  v9[3] = &unk_251AE01A0;
  v9[4] = v6;
  v10 = v7;
  dispatch_async(v8, v9);

}

uint64_t __48__UNCLocalNotificationClient__fireNotification___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_updateTimersAndRegionMonitorsForPendingNotificationRecords:(id)a3
{
  id v4;

  v4 = a3;
  -[UNCLocalNotificationClient _updateTimersForPendingNotificationRecords:](self, "_updateTimersForPendingNotificationRecords:", v4);
  -[UNCLocalNotificationClient _updateRegionMonitorsForPendingNotificationRecords:](self, "_updateRegionMonitorsForPendingNotificationRecords:", v4);

}

- (void)_invalidateNotificationRecordTimersAndRegionMonitors
{
  -[UNCLocalNotificationClient _invalidatePendingNotificationRecordTimers](self, "_invalidatePendingNotificationRecordTimers");
  -[UNCLocalNotificationClient _invalidatePendingNotificationRecordRegionMonitors](self, "_invalidatePendingNotificationRecordRegionMonitors");
}

- (void)_queue_triggerDidFireForTimer:(id)a3
{
  void *v4;
  os_log_t *v5;
  void *v6;
  NSString *bundleIdentifier;
  NSObject *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  const __CFDictionary *v14;
  IOReturn v15;
  IOReturn v16;
  NSObject *v17;
  NSString *v18;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  IOReturn v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  UNCPowerLogUserNotificationTriggerEvent((__CFString *)self->_bundleIdentifier, 1u);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_log_t *)MEMORY[0x24BDF89C8];
  v6 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = v6;
    -[UNCLocalNotificationClient _dateFormatter](self, "_dateFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = bundleIdentifier;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persistent timer fired at %{public}@", buf, 0x16u);

  }
  AssertionID = 0;
  v11 = self->_bundleIdentifier;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.usernotifications.time.%@-%ld"), v11, ++_queue_triggerDidFireForTimer__count);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("AssertType");
  v26[1] = CFSTR("AssertLevel");
  v27[0] = CFSTR("NoIdleSleepAssertion");
  v27[1] = &unk_251B126F8;
  v26[2] = CFSTR("AssertName");
  v26[3] = CFSTR("AssertionOnBehalfOfBundleID");
  v13 = self->_bundleIdentifier;
  v27[2] = v12;
  v27[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = IOPMAssertionCreateWithProperties(v14, &AssertionID);
  if (v15)
  {
    v16 = v15;
    v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v18 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543874;
      v21 = v18;
      v22 = 2114;
      v23 = v12;
      v24 = 1024;
      v25 = v16;
      _os_log_error_impl(&dword_2499A5000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to take power assertion %{public}@: %#x", buf, 0x1Cu);
    }
  }
  -[UNCLocalNotificationClient _queue_triggerDidFireForDate:](self, "_queue_triggerDidFireForDate:", v4);
  if (AssertionID)
    IOPMAssertionRelease(AssertionID);

}

- (void)_queue_triggerDidFireForDate:(id)a3
{
  void *v4;
  os_log_t *v5;
  void *v6;
  NSString *bundleIdentifier;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  os_log_t v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  os_log_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  id v48;
  void *v49;
  void *v50;
  id v51;
  __int128 v52;
  void *v53;
  void *v54;
  NSString *v55;
  os_log_t v56;
  NSObject *v57;
  id v58;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  uint64_t v62;
  void *v63;
  UNCLocalNotificationClient *v64;
  id obj;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  os_log_t v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  -[UNCLocalNotificationClient _lastLocalNotificationFireDate](self, "_lastLocalNotificationFireDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_log_t *)MEMORY[0x24BDF89C8];
  v6 = (void *)*MEMORY[0x24BDF89C8];
  v63 = v4;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = v6;
    -[UNCLocalNotificationClient _dateFormatter](self, "_dateFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationClient _dateFormatter](self, "_dateFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v66);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v78 = (os_log_t)bundleIdentifier;
    v79 = 2114;
    v80 = v10;
    v81 = 2114;
    v82 = v12;
    _os_log_impl(&dword_2499A5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Find notifications with current trigger date after last fire date %{public}@ and before %{public}@", buf, 0x20u);

    v4 = v63;
    v5 = (os_log_t *)MEMORY[0x24BDF89C8];

  }
  v64 = self;
  -[UNCLocalNotificationClient _pendingNotificationRecords](self, "_pendingNotificationRecords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v13;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
  if (v67)
  {
    v15 = *(_QWORD *)v73;
    *(_QWORD *)&v14 = 138543874;
    v52 = v14;
    v62 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v73 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        (*((void (**)(uint64_t, void *))UNSNotificationRecordToUNNotificationTrigger + 2))((uint64_t)UNSNotificationRecordToUNNotificationTrigger, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "requestDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "nextTriggerDateAfterLastTriggerDate:withRequestedDate:", v4, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v31 = *v5;
          if (!os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
            goto LABEL_18;
          loga = (os_log_t)v64->_bundleIdentifier;
          v30 = v31;
          objc_msgSend(v17, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "un_logDigest");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationClient _dateFormatter](v64, "_dateFormatter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "requestDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringFromDate:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v52;
          v78 = loga;
          v79 = 2114;
          v80 = v33;
          v81 = 2114;
          v82 = v36;
          _os_log_impl(&dword_2499A5000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification %{public}@ requested at %{public}@ has no trigger date", buf, 0x20u);

          v5 = (os_log_t *)MEMORY[0x24BDF89C8];
          v15 = v62;

          v4 = v63;
          goto LABEL_14;
        }
        v21 = objc_msgSend(v20, "compare:", v66);
        v22 = *v5;
        v23 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
        if (v21 == 1)
        {
          if (!v23)
            goto LABEL_18;
          v56 = (os_log_t)v64->_bundleIdentifier;
          log = v22;
          objc_msgSend(v17, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "un_logDigest");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationClient _dateFormatter](v64, "_dateFormatter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "requestDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringFromDate:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationClient _dateFormatter](v64, "_dateFormatter");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringFromDate:", v20);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v78 = v56;
          v79 = 2114;
          v80 = v54;
          v81 = 2114;
          v82 = v27;
          v83 = 2114;
          v84 = v29;
          v30 = log;
          _os_log_impl(&dword_2499A5000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification %{public}@ requested at %{public}@ has a late trigger date %{public}@", buf, 0x2Au);

          v15 = v62;
          v4 = v63;

          v5 = (os_log_t *)MEMORY[0x24BDF89C8];
LABEL_14:

          goto LABEL_18;
        }
        if (v23)
        {
          v55 = v64->_bundleIdentifier;
          v57 = v22;
          objc_msgSend(v17, "identifier");
          logb = (os_log_t)objc_claimAutoreleasedReturnValue();
          -[NSObject un_logDigest](logb, "un_logDigest");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationClient _dateFormatter](v64, "_dateFormatter");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "requestDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringFromDate:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationClient _dateFormatter](v64, "_dateFormatter");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringFromDate:", v20);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v78 = (os_log_t)v55;
          v79 = 2114;
          v80 = v53;
          v81 = 2114;
          v82 = v39;
          v83 = 2114;
          v84 = v41;
          _os_log_impl(&dword_2499A5000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification %{public}@ requested at %{public}@ has a current trigger date %{public}@", buf, 0x2Au);

          v15 = v62;
          v5 = (os_log_t *)MEMORY[0x24BDF89C8];

          v4 = v63;
        }
        objc_msgSend(v17, "setDate:", v20, v52);
        objc_msgSend(v58, "addObject:", v17);
LABEL_18:

      }
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    }
    while (v67);
  }

  v42 = (id)objc_msgSend(v58, "sortedArrayUsingComparator:", &__block_literal_global_31);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v43 = v58;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v69 != v46)
          objc_enumerationMutation(v43);
        -[UNCLocalNotificationClient _fireNotification:](v64, "_fireNotification:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j), v52);
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v45);
  }

  v48 = v4;
  objc_msgSend(v43, "lastObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "date");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v48;
  if (objc_msgSend(v48, "compare:", v50) == -1)
  {
    v51 = v50;

  }
  -[UNCLocalNotificationClient _setLastLocalNotificationFireDate:](v64, "_setLastLocalNotificationFireDate:", v51, v52);
  -[UNCLocalNotificationClient _setPendingNotificationRecords:](v64, "_setPendingNotificationRecords:", obj);

}

uint64_t __59__UNCLocalNotificationClient__queue_triggerDidFireForDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_lastLocalNotificationFireDate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;

  -[UNCNotificationScheduleRepository scheduleForBundleIdentifier:](self->_notificationScheduleRepository, "scheduleForBundleIdentifier:", self->_bundleIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousTriggerDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v6 > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = objc_claimAutoreleasedReturnValue();

      -[UNCLocalNotificationClient _setLastLocalNotificationFireDate:](self, "_setLastLocalNotificationFireDate:", v7);
      v5 = (void *)v7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)_setLastLocalNotificationFireDate:(id)a3
{
  id v4;
  UNCNotificationSchedule *v5;

  v4 = a3;
  v5 = objc_alloc_init(UNCNotificationSchedule);
  -[UNCNotificationSchedule setPreviousTriggerDate:](v5, "setPreviousTriggerDate:", v4);

  -[UNCNotificationScheduleRepository setSchedule:forBundleIdentifier:](self->_notificationScheduleRepository, "setSchedule:forBundleIdentifier:", v5, self->_bundleIdentifier);
}

- (void)_invalidatePendingNotificationRecordTimers
{
  NSObject *v3;
  NSString *bundleIdentifier;
  PCPersistentTimer *localNotificationTimer;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v6 = 138543362;
    v7 = bundleIdentifier;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidate persistent timer", (uint8_t *)&v6, 0xCu);
  }
  -[PCPersistentTimer invalidate](self->_localNotificationTimer, "invalidate");
  localNotificationTimer = self->_localNotificationTimer;
  self->_localNotificationTimer = 0;

}

- (void)_updateTimersForPendingNotificationRecords:(id)a3
{
  id v4;
  void *v5;
  NSString *bundleIdentifier;
  NSObject *v7;
  uint64_t v8;
  _BOOL4 monitoringLocaleAndTimeChanges;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSString *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  PCPersistentTimer *localNotificationTimer;
  BOOL v51;
  NSObject *v52;
  NSString *v53;
  id v54;
  void *v55;
  id obj;
  UNCLocalNotificationClient *v57;
  void *v58;
  NSString *v59;
  NSObject *log;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  NSString *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = v5;
    v8 = objc_msgSend(v4, "count");
    monitoringLocaleAndTimeChanges = self->_monitoringLocaleAndTimeChanges;
    *(_DWORD *)buf = 138543874;
    v74 = bundleIdentifier;
    v75 = 2048;
    v76 = v8;
    v77 = 1024;
    LODWORD(v78) = monitoringLocaleAndTimeChanges;
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update timers for %ld pending notifications (monitoring: %d)", buf, 0x1Cu);

  }
  -[UNCLocalNotificationClient _invalidatePendingNotificationRecordTimers](self, "_invalidatePendingNotificationRecordTimers");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v4;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
  v57 = self;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v70;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v70 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v14);
        if ((objc_msgSend(v15, "willNotifyUser") & 1) != 0
          || (objc_msgSend(v15, "badge"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "integerValue"),
              v16,
              v17 >= 1))
        {
          objc_msgSend(v10, "addObject:", v15);
        }
        else
        {
          v18 = (void *)*MEMORY[0x24BDF89C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
          {
            v19 = v57->_bundleIdentifier;
            v20 = v18;
            objc_msgSend(v15, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "un_logDigest");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v74 = v19;
            self = v57;
            v75 = 2114;
            v76 = (uint64_t)v22;
            _os_log_impl(&dword_2499A5000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not scheduling notification %{public}@ that does nothing when fired", buf, 0x16u);

          }
        }
        ++v14;
      }
      while (v12 != v14);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      v12 = v23;
    }
    while (v23);
  }

  -[UNCLocalNotificationClient _lastLocalNotificationFireDate](self, "_lastLocalNotificationFireDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_bundleIdentifier;
    v27 = v25;
    -[UNCLocalNotificationClient _dateFormatter](self, "_dateFormatter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringFromDate:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v74 = v26;
    v75 = 2114;
    v76 = (uint64_t)v29;
    _os_log_impl(&dword_2499A5000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Find next notification with current trigger date after last fire date %{public}@", buf, 0x16u);

  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v30 = v10;
  v64 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
  if (v64)
  {
    v31 = 0;
    v63 = *(_QWORD *)v66;
    v54 = v30;
    v55 = v24;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v66 != v63)
          objc_enumerationMutation(v30);
        v33 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        (*((void (**)(uint64_t, void *))UNSNotificationRecordToUNNotificationTrigger + 2))((uint64_t)UNSNotificationRecordToUNNotificationTrigger, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "requestDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "nextTriggerDateAfterLastTriggerDate:withRequestedDate:", v24, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)*MEMORY[0x24BDF89C8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
        {
          v59 = v57->_bundleIdentifier;
          log = v37;
          objc_msgSend(v33, "identifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "un_logDigest");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationClient _dateFormatter](v57, "_dateFormatter");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "requestDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringFromDate:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationClient _dateFormatter](v57, "_dateFormatter");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringFromDate:", v36);
          v62 = v31;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v74 = v59;
          v75 = 2114;
          v76 = (uint64_t)v58;
          v77 = 2114;
          v78 = v40;
          v79 = 2114;
          v80 = v42;
          _os_log_impl(&dword_2499A5000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification %{public}@ requested at %{public}@ has a trigger date %{public}@", buf, 0x2Au);

          v30 = v54;
          v24 = v55;

          v31 = v62;
        }
        if (v36)
        {
          if (v31)
          {
            objc_msgSend(v31, "earlierDate:", v36);
            v43 = objc_claimAutoreleasedReturnValue();

            v31 = (id)v43;
          }
          else
          {
            v31 = v36;
          }
        }

      }
      v64 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    }
    while (v64);

    self = v57;
    if (v31)
    {
      v44 = (void *)*MEMORY[0x24BDF89C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
      {
        v45 = v57->_bundleIdentifier;
        v46 = v44;
        -[UNCLocalNotificationClient _dateFormatter](v57, "_dateFormatter");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringFromDate:", v31);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v45;
        v75 = 2114;
        v76 = (uint64_t)v48;
        _os_log_impl(&dword_2499A5000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling persistent timer for next local notification at %{public}@", buf, 0x16u);

      }
      v49 = objc_msgSend(objc_alloc(MEMORY[0x24BE71A08]), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v31, v57->_bundleIdentifier, v57, sel__queue_triggerDidFireForTimer_, 0);
      localNotificationTimer = v57->_localNotificationTimer;
      v57->_localNotificationTimer = (PCPersistentTimer *)v49;

      -[PCPersistentTimer setMinimumEarlyFireProportion:](v57->_localNotificationTimer, "setMinimumEarlyFireProportion:", 1.0);
      v51 = 1;
      -[PCPersistentTimer setUserVisible:](v57->_localNotificationTimer, "setUserVisible:", 1);
      -[PCPersistentTimer scheduleInQueue:](v57->_localNotificationTimer, "scheduleInQueue:", v57->_queue);
      goto LABEL_39;
    }
  }
  else
  {

  }
  v52 = *MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    v53 = self->_bundleIdentifier;
    *(_DWORD *)buf = 138543362;
    v74 = v53;
    _os_log_impl(&dword_2499A5000, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@] No upcoming local notifications", buf, 0xCu);
  }
  v51 = 0;
  v31 = 0;
LABEL_39:
  self->_monitoringLocaleAndTimeChanges = v51;

}

- (void)locationMonitor:(id)a3 triggerDidFireForRegion:(id)a4 forBundleIdentifier:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__UNCLocalNotificationClient_locationMonitor_triggerDidFireForRegion_forBundleIdentifier___block_invoke;
  v9[3] = &unk_251AE01A0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

uint64_t __90__UNCLocalNotificationClient_locationMonitor_triggerDidFireForRegion_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_triggerDidFireForRegion:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_triggerDidFireForRegion:(id)a3
{
  id v4;
  void *v5;
  NSString *bundleIdentifier;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  UNCLocalNotificationClient *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSString *v31;
  UNCLocalNotificationClient *v32;
  void *v33;
  id v34;
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
  uint8_t v46[128];
  uint8_t buf[4];
  NSString *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  UNCPowerLogUserNotificationTriggerEvent((__CFString *)self->_bundleIdentifier, 2u);
  v5 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = v5;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = bundleIdentifier;
    v49 = 2114;
    v50 = v9;
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Location region fired: region=%{public}@", buf, 0x16u);

  }
  v10 = -[UNCLocationMonitor isBundleIdentifierAuthorizedForRegionMonitoring:](self->_locationMonitor, "isBundleIdentifierAuthorizedForRegionMonitoring:", self->_bundleIdentifier);
  v33 = v4;
  objc_msgSend(v4, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v32 = self;
  -[UNCLocalNotificationClient _pendingNotificationRecords](self, "_pendingNotificationRecords");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v15, "triggerType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Location")) & 1) != 0)
        {
          objc_msgSend(v15, "triggerRegion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v35);

          if (v19)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setDate:", v20);

            objc_msgSend(v34, "addObject:", v15);
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v12);
  }
  if (objc_msgSend(v34, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v21 = v34;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    v23 = v32;
    if (v22)
    {
      v24 = v22;
      v25 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(v21);
          if (v10)
            -[UNCLocalNotificationClient _fireNotification:](v32, "_fireNotification:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
        }
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v24);
    }

    v27 = v33;
  }
  else
  {
    v28 = (void *)*MEMORY[0x24BDF89C8];
    v23 = self;
    v27 = v33;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      objc_msgSend(v33, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "un_logDigest");
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v31;
      _os_log_impl(&dword_2499A5000, v29, OS_LOG_TYPE_DEFAULT, "Region %{public}@ fired which isn't associated with a notification", buf, 0xCu);

    }
  }
  -[UNCLocalNotificationClient _setPendingNotificationRecords:](v23, "_setPendingNotificationRecords:", obj);

}

- (void)_invalidatePendingNotificationRecordRegionMonitors
{
  NSObject *v3;
  NSString *bundleIdentifier;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v5 = 138543362;
    v6 = bundleIdentifier;
    _os_log_impl(&dword_2499A5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidate region monitors", (uint8_t *)&v5, 0xCu);
  }
  -[UNCLocationMonitor setMonitoredRegions:forBundleIdentifier:withCompletionHandler:](self->_locationMonitor, "setMonitoredRegions:forBundleIdentifier:withCompletionHandler:", 0, self->_bundleIdentifier, 0);
}

- (void)_updateRegionMonitorsForPendingNotificationRecords:(id)a3
{
  id v4;
  void *v5;
  NSString *bundleIdentifier;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = v5;
    *(_DWORD *)buf = 138543618;
    v23 = bundleIdentifier;
    v24 = 2048;
    v25 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update regions for %ld pending notifications", buf, 0x16u);

  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "triggerType", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("Location")))
        {
          objc_msgSend(v14, "triggerRegion");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
            continue;
          objc_msgSend(v14, "triggerRegion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[UNCLocalNotificationClient _setMonitoredRegions:](self, "_setMonitoredRegions:", v8);
}

- (void)_setMonitoredRegions:(id)a3
{
  -[UNCLocationMonitor setMonitoredRegions:forBundleIdentifier:withCompletionHandler:](self->_locationMonitor, "setMonitoredRegions:forBundleIdentifier:withCompletionHandler:", a3, self->_bundleIdentifier, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localNotificationTimer, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_lazy_pendingNotificationsAwaitingDelivery, 0);
  objc_storeStrong((id *)&self->_pendingNotificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationScheduleRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)addPendingNotificationRecords:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 8);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_2499A5000, a2, a3, "[%{public}@] Add pending notifications: notifications=%{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_6();
}

- (void)setPendingNotificationRecords:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 8);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_2499A5000, a2, a3, "[%{public}@] Set pending notifications: notifications=%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_6();
}

- (void)removePendingNotificationRecords:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_2499A5000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Did not remove all expected pending notifications", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)pendingNotificationRecords
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 8);
  v5 = a2;
  v6 = 138543874;
  v7 = v4;
  v8 = 2048;
  v9 = objc_msgSend(a3, "count");
  v10 = 2114;
  v11 = a3;
  _os_log_debug_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Load pending %ld notifications: notifications=%{public}@", (uint8_t *)&v6, 0x20u);

}

void __48__UNCLocalNotificationClient__fireNotification___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v5;
  v11 = 2114;
  v12 = v8;
  v13 = 2114;
  v14 = a3;
  _os_log_error_impl(&dword_2499A5000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Not delivering user visible local notification %{public}@ [ error=%{public}@ ]", (uint8_t *)&v9, 0x20u);

}

@end

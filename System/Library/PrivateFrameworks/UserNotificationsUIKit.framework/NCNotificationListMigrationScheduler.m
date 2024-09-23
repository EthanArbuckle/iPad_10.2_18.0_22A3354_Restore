@implementation NCNotificationListMigrationScheduler

- (NSDate)upcomingScheduledMigrationDate
{
  return (NSDate *)(id)-[NSDate copy](self->_currentlyScheduledDate, "copy");
}

- (NSMutableDictionary)migrationDatesForNotificationRequests
{
  return self->_migrationDatesForNotificationRequests;
}

- (NSDate)migrationDateForNotificationDigest
{
  return self->_migrationDateForNotificationDigest;
}

- (NCNotificationListMigrationScheduler)initWithDelegate:(id)a3
{
  id v4;
  NCNotificationListMigrationScheduler *v5;
  NCNotificationListMigrationScheduler *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *scheduleTimerQueue;
  NSDateFormatter *v10;
  NSDateFormatter *dateFormatter;
  NSMutableSet *v12;
  NSMutableSet *migratedTimeSensitiveNotificationRequests;
  NSDateFormatter *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NCNotificationListMigrationScheduler;
  v5 = -[NCNotificationListMigrationScheduler init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.usernotifications.NCNotificationListMigrationSchedulerTimerQueue", v7);
    scheduleTimerQueue = v6->_scheduleTimerQueue;
    v6->_scheduleTimerQueue = (OS_dispatch_queue *)v8;

    v10 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    migratedTimeSensitiveNotificationRequests = v6->_migratedTimeSensitiveNotificationRequests;
    v6->_migratedTimeSensitiveNotificationRequests = v12;

    v14 = v6->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v14, "setLocale:", v15);

    -[NSDateFormatter setDateStyle:](v6->_dateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v6->_dateFormatter, "setTimeStyle:", 3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel__handleTimeOrLocaleChange_, *MEMORY[0x1E0DC4838], 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel__handleTimeOrLocaleChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v6;
}

- (void)addMigrationForNotificationRequests:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__NCNotificationListMigrationScheduler_addMigrationForNotificationRequests_forDate___block_invoke;
  v8[3] = &unk_1E8D1C600;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);
  -[NCNotificationListMigrationScheduler _updateMigrationScheduleTimer](self, "_updateMigrationScheduleTimer");

}

void __84__NCNotificationListMigrationScheduler_addMigrationForNotificationRequests_forDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "stringFromDate:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543874;
    v31 = v8;
    v32 = 2114;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ adding migration for request %{public}@ for date %@", (uint8_t *)&v30, 0x20u);

  }
  v12 = *(_QWORD **)(a1 + 32);
  if (!v12[2])
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 16);
    *(_QWORD *)(v14 + 16) = v13;

    v12 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v12, "_notificationRequestMatchingRequest:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v16)
  {
    objc_msgSend(v17, "objectForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "earlierDate:", *(_QWORD *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 == *(void **)(a1 + 40))
    {

    }
    else
    {
      objc_msgSend(v18, "earlierDate:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 != v18)
      {
        v23 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "notificationIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "un_logDigest");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "stringFromDate:", v18);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138543874;
          v31 = v26;
          v32 = 2114;
          v33 = v28;
          v34 = 2112;
          v35 = v29;
          _os_log_impl(&dword_1CFC3D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ has earlier migration for request %{public}@ for date %@", (uint8_t *)&v30, 0x20u);

        }
        goto LABEL_13;
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", *(_QWORD *)(a1 + 40), v3);
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v17, "setObject:forKey:", *(_QWORD *)(a1 + 40), v3);
LABEL_14:

}

- (void)removeMigrationForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *migrationDatesForNotificationRequests;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationListMigrationScheduler _notificationRequestMatchingRequest:](self, "_notificationRequestMatchingRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ removing scheduled migration for request %{public}@", (uint8_t *)&v14, 0x16u);

    }
    -[NSMutableDictionary objectForKey:](self->_migrationDatesForNotificationRequests, "objectForKey:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_migrationDatesForNotificationRequests, "removeObjectForKey:", v5);
    if (!-[NSMutableDictionary count](self->_migrationDatesForNotificationRequests, "count"))
    {
      migrationDatesForNotificationRequests = self->_migrationDatesForNotificationRequests;
      self->_migrationDatesForNotificationRequests = 0;

    }
    if (objc_msgSend(v12, "isEqualToDate:", self->_currentlyScheduledDate))
      -[NCNotificationListMigrationScheduler _updateMigrationScheduleTimer](self, "_updateMigrationScheduleTimer");

  }
}

- (void)setMigrationDateForNotificationDigest:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NCNotificationListMigrationScheduler migrationDateForNotificationDigest](self, "migrationDateForNotificationDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToDate:", v5) & 1) == 0)
  {
    if (!v5
      || (objc_msgSend(v5, "earlierDate:", v6), v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v7 == v5))
    {
      v8 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v11;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling migration for digest at %@", (uint8_t *)&v13, 0x16u);

      }
      objc_storeStrong((id *)&self->_migrationDateForNotificationDigest, a3);
      -[NCNotificationListMigrationScheduler _updateMigrationScheduleTimer](self, "_updateMigrationScheduleTimer");
    }
  }

}

- (void)addMigratedTimeSensitiveNotificationRequests:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "interruptionLevel") == 2)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ add MigratedTimeSensitiveNotificationRequests %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[NSMutableSet addObject:](self->_migratedTimeSensitiveNotificationRequests, "addObject:", v4);
  }

}

- (void)removeMigratedTimeSensitiveNotificationRequests:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "interruptionLevel") == 2)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ remove MigratedTimeSensitiveNotificationRequests %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[NSMutableSet removeObject:](self->_migratedTimeSensitiveNotificationRequests, "removeObject:", v4);
  }

}

- (id)_notificationRequestMatchingRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[NSMutableDictionary allKeys](self->_migrationDatesForNotificationRequests, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__NCNotificationListMigrationScheduler__notificationRequestMatchingRequest___block_invoke;
  v10[3] = &unk_1E8D1C198;
  v6 = v4;
  v11 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __76__NCNotificationListMigrationScheduler__notificationRequestMatchingRequest___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
    return 1;
  else
    return objc_msgSend(a2, "matchesRequest:");
}

- (void)_updateMigrationScheduleTimer
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSDate *currentlyScheduledDate;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  PCPersistentTimer *scheduleTimer;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NCNotificationListMigrationScheduler _nextScheduleDateForMigration](self, "_nextScheduleDateForMigration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDate isEqualToDate:](self->_currentlyScheduledDate, "isEqualToDate:", v3))
  {
    v4 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_currentlyScheduledDate);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ already scheduled migration schedule timer for date %@", (uint8_t *)&v20, 0x16u);

    }
  }
  else
  {
    objc_storeStrong((id *)&self->_currentlyScheduledDate, v3);
    currentlyScheduledDate = self->_currentlyScheduledDate;
    v10 = (void *)*MEMORY[0x1E0DC5F90];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
    if (currentlyScheduledDate)
    {
      if (v11)
      {
        v12 = v10;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ updating scheduled migration timer to fire at date %@", (uint8_t *)&v20, 0x16u);

      }
      -[NCNotificationListMigrationScheduler _scheduleMigrationTimerForDate:](self, "_scheduleMigrationTimerForDate:", self->_currentlyScheduledDate);
    }
    else
    {
      if (v11)
      {
        v16 = v10;
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing scheduled migration timer since there are no more migrations left", (uint8_t *)&v20, 0xCu);

      }
      -[PCPersistentTimer invalidate](self->_scheduleTimer, "invalidate");
      scheduleTimer = self->_scheduleTimer;
      self->_scheduleTimer = 0;

      -[NCNotificationListMigrationScheduler _sendDigestMigrationSignalIfNecessary](self, "_sendDigestMigrationSignalIfNecessary");
      -[NCNotificationListMigrationScheduler _sendNotificationRequestMigrationSignalIfNecessary](self, "_sendNotificationRequestMigrationSignalIfNecessary");
    }
  }

}

- (void)_scheduleMigrationTimerForDate:(id)a3
{
  id v4;
  PCPersistentTimer *scheduleTimer;
  PCPersistentTimer *v6;
  double v7;
  PCPersistentTimer *v8;
  PCPersistentTimer *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  PCPersistentTimer *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  PCPersistentTimer *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  scheduleTimer = self->_scheduleTimer;
  if (scheduleTimer)
  {
    -[PCPersistentTimer invalidate](scheduleTimer, "invalidate");
    v6 = self->_scheduleTimer;
    self->_scheduleTimer = 0;

  }
  objc_msgSend(v4, "timeIntervalSinceNow");
  if (v7 <= 0.0)
  {
    v16 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationListMigrationScheduler _scheduleMigrationTimerForDate:].cold.1(v16, (uint64_t)self, (uint64_t)v4);
  }
  else
  {
    v8 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v4, CFSTR("com.apple.usernotifications.listMigrationSchedulerTimer"), self, sel__migrationTimerFiredForTimer_, 0);
    v9 = self->_scheduleTimer;
    self->_scheduleTimer = v8;

    -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_scheduleTimer, "setMinimumEarlyFireProportion:", 1.0);
    -[PCPersistentTimer setUserVisible:](self->_scheduleTimer, "setUserVisible:", 1);
    -[PCPersistentTimer scheduleInQueue:](self->_scheduleTimer, "scheduleInQueue:", self->_scheduleTimerQueue);
    v10 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_scheduleTimer;
      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled migration timer %@ for date %@", (uint8_t *)&v17, 0x20u);

    }
  }

}

- (id)_nextScheduleDateForMigration
{
  double v3;
  NSDate *migrationDateForNotificationDigest;
  NSMutableDictionary *migrationDatesForNotificationRequests;
  NSObject *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  NSDate *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  -[NSDate timeIntervalSinceNow](self->_migrationDateForNotificationDigest, "timeIntervalSinceNow");
  if (v3 <= 0.0)
    migrationDateForNotificationDigest = 0;
  else
    migrationDateForNotificationDigest = self->_migrationDateForNotificationDigest;
  v29 = migrationDateForNotificationDigest;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  v23 = 0;
  migrationDatesForNotificationRequests = self->_migrationDatesForNotificationRequests;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__NCNotificationListMigrationScheduler__nextScheduleDateForMigration__block_invoke;
  v17[3] = &unk_1E8D1DB28;
  v17[4] = &v24;
  v17[5] = &v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](migrationDatesForNotificationRequests, "enumerateKeysAndObjectsUsingBlock:", v17);
  if (v19[5])
  {
    v6 = (id)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v19[5], "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v25[5]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v8;
      v32 = 2114;
      v33 = v10;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ next scheduled migration timer for request %{public}@ for date %@", buf, 0x20u);

    }
LABEL_10:

    goto LABEL_11;
  }
  if (v25[5])
  {
    v6 = (id)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v25[5]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ next scheduled migration timer for digest for date %@", buf, 0x16u);

    }
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend((id)v25[5], "dateByAddingTimeInterval:", 5.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __69__NCNotificationListMigrationScheduler__nextScheduleDateForMigration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v7 + 40))
    goto LABEL_5;
  objc_msgSend(v5, "earlierDate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v6, "timeIntervalSinceNow");
  v10 = v9;

  if (v10 > 0.0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_5:
    objc_storeStrong((id *)(v7 + 40), a3);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = v13;
    v8 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_migrationTimerFiredForTimer:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__NCNotificationListMigrationScheduler__migrationTimerFiredForTimer___block_invoke;
  block[3] = &unk_1E8D1B568;
  block[4] = self;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
}

uint64_t __69__NCNotificationListMigrationScheduler__migrationTimerFiredForTimer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendDigestMigrationSignalIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_sendNotificationRequestMigrationSignalIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_updateMigrationScheduleTimer");
}

- (void)_sendDigestMigrationSignalIfNecessary
{
  NSDate *v3;
  NSDate *v4;
  double v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->_migrationDateForNotificationDigest;
  v4 = v3;
  if (v3)
  {
    -[NSDate timeIntervalSinceNow](v3, "timeIntervalSinceNow");
    if (v5 < 0.0)
    {
      v6 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ sending signal for digest migration for scheduled date %@", (uint8_t *)&v12, 0x16u);

      }
      -[NCNotificationListMigrationScheduler delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "notificationListMigrationSchedulerRequestsMigratingNotificationDigest:", self);

    }
  }

}

- (void)_sendNotificationRequestMigrationSignalIfNecessary
{
  id v3;
  uint64_t v4;
  NSMutableDictionary *migrationDatesForNotificationRequests;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = MEMORY[0x1E0C809B0];
  migrationDatesForNotificationRequests = self->_migrationDatesForNotificationRequests;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__NCNotificationListMigrationScheduler__sendNotificationRequestMigrationSignalIfNecessary__block_invoke;
  v9[3] = &unk_1E8D1DB50;
  v9[4] = self;
  v7 = v3;
  v10 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](migrationDatesForNotificationRequests, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (objc_msgSend(v7, "count"))
  {
    -[NCNotificationListMigrationScheduler delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationListMigrationScheduler:requestsMigratingNotificationRequests:", self, v7);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __90__NCNotificationListMigrationScheduler__sendNotificationRequestMigrationSignalIfNecessary__block_invoke_17;
    v8[3] = &unk_1E8D1B4B0;
    v8[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  }
}

void __90__NCNotificationListMigrationScheduler__sendNotificationRequestMigrationSignalIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v7 < 0.0)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "stringFromDate:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2114;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sending signal for migration for request %{public}@ for scheduled date %@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

uint64_t __90__NCNotificationListMigrationScheduler__sendNotificationRequestMigrationSignalIfNecessary__block_invoke_17(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addMigratedTimeSensitiveNotificationRequests:", a2);
}

- (void)_handleTimeOrLocaleChange:(id)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = a3;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ updating migration on time or locale change for notification %@", (uint8_t *)&v11, 0x16u);

  }
  -[NCNotificationListMigrationScheduler _sendDigestMigrationSignalIfNecessary](self, "_sendDigestMigrationSignalIfNecessary");
  -[NCNotificationListMigrationScheduler _sendNotificationRequestMigrationSignalIfNecessary](self, "_sendNotificationRequestMigrationSignalIfNecessary");
  -[NCNotificationListMigrationScheduler _updateMigrationScheduleTimer](self, "_updateMigrationScheduleTimer");
}

- (void)setMigrationDatesForNotificationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_migrationDatesForNotificationRequests, a3);
}

- (NSMutableSet)migratedTimeSensitiveNotificationRequests
{
  return self->_migratedTimeSensitiveNotificationRequests;
}

- (void)setMigratedTimeSensitiveNotificationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_migratedTimeSensitiveNotificationRequests, a3);
}

- (NCNotificationListMigrationSchedulerDelegate)delegate
{
  return (NCNotificationListMigrationSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (NSDate)currentlyScheduledDate
{
  return self->_currentlyScheduledDate;
}

- (void)setCurrentlyScheduledDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyScheduledDate, a3);
}

- (PCPersistentTimer)scheduleTimer
{
  return self->_scheduleTimer;
}

- (void)setScheduleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleTimer, a3);
}

- (OS_dispatch_queue)scheduleTimerQueue
{
  return self->_scheduleTimerQueue;
}

- (void)setScheduleTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleTimerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleTimerQueue, 0);
  objc_storeStrong((id *)&self->_scheduleTimer, 0);
  objc_storeStrong((id *)&self->_currentlyScheduledDate, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_migratedTimeSensitiveNotificationRequests, 0);
  objc_storeStrong((id *)&self->_migrationDatesForNotificationRequests, 0);
  objc_storeStrong((id *)&self->_migrationDateForNotificationDigest, 0);
}

- (void)_scheduleMigrationTimerForDate:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a2 + 40), "stringFromDate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ attempting to schedule migration timer for a date in the past %@", (uint8_t *)&v9, 0x16u);

}

@end

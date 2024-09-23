@implementation NCDigestScheduleManager

- (NCDigestScheduleManager)init
{
  NCDigestScheduleManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *digestScheduleTimerQueue;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCDigestScheduleManager;
  v2 = -[NCDigestScheduleManager init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.usernotifications.ScheduledDeliveryTimerQueue", v3);
    digestScheduleTimerQueue = v2->_digestScheduleTimerQueue;
    v2->_digestScheduleTimerQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleTimeOrLocaleChange_, *MEMORY[0x1E0DC4838], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleTimeOrLocaleChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

- (void)setDigestScheduleTimes:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_digestScheduleTimes, "isEqualToArray:", v5))
  {
    v6 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Updating notification digest schedule times", v7, 2u);
    }
    objc_storeStrong((id *)&self->_digestScheduleTimes, a3);
    -[NCDigestScheduleManager invalidateScheduledTimerSendCancel:](self, "invalidateScheduledTimerSendCancel:", objc_msgSend(v5, "count") == 0);
    -[NCDigestScheduleManager _updateDigestInfosForScheduleTimes:](self, "_updateDigestInfosForScheduleTimes:", v5);
  }

}

- (void)invalidateScheduledTimer
{
  -[NCDigestScheduleManager invalidateScheduledTimerSendCancel:](self, "invalidateScheduledTimerSendCancel:", 1);
}

- (void)invalidateScheduledTimerSendCancel:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  PCPersistentTimer *digestScheduleTimer;
  void *v7;
  NSMutableSet *digestInfos;
  PCPersistentTimer *v9;
  int v10;
  PCPersistentTimer *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    digestScheduleTimer = self->_digestScheduleTimer;
    v10 = 138543362;
    v11 = digestScheduleTimer;
    _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating scheduled notification digest timer %{public}@", (uint8_t *)&v10, 0xCu);
  }
  -[NCDigestScheduleManager upcomingScheduledDigestInfo](self, "upcomingScheduledDigestInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  digestInfos = self->_digestInfos;
  self->_digestInfos = 0;

  -[PCPersistentTimer invalidate](self->_digestScheduleTimer, "invalidate");
  v9 = self->_digestScheduleTimer;
  self->_digestScheduleTimer = 0;

  if (v3)
    -[NCDigestScheduleManager _publishRevokeUpcomingDigest:](self, "_publishRevokeUpcomingDigest:", v7);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;

  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)_publishToAllObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_publishDigestInfo:(id)a3 withUpcomingDigestInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "Publishing scheduled notification digest [info=%{public}@] \t upcoming digest [date=%{public}@]", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__NCDigestScheduleManager__publishDigestInfo_withUpcomingDigestInfo___block_invoke;
  v11[3] = &unk_1E8D1F470;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NCDigestScheduleManager _publishToAllObservers:](self, "_publishToAllObservers:", v11);

}

uint64_t __69__NCDigestScheduleManager__publishDigestInfo_withUpcomingDigestInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "publishScheduledDigest:upcomingDigest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_publishUpcomingDigestInfo:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "Publishing upcoming notification digest [info=%{public}@]", buf, 0xCu);
    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__NCDigestScheduleManager__publishUpcomingDigestInfo___block_invoke;
    v6[3] = &unk_1E8D1F498;
    v7 = v4;
    -[NCDigestScheduleManager _publishToAllObservers:](self, "_publishToAllObservers:", v6);

  }
}

uint64_t __54__NCDigestScheduleManager__publishUpcomingDigestInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "publishUpcomingDigest:", *(_QWORD *)(a1 + 32));
}

- (void)_publishRevokeUpcomingDigest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__NCDigestScheduleManager__publishRevokeUpcomingDigest___block_invoke;
  v6[3] = &unk_1E8D1F498;
  v7 = v4;
  v5 = v4;
  -[NCDigestScheduleManager _publishToAllObservers:](self, "_publishToAllObservers:", v6);

}

uint64_t __56__NCDigestScheduleManager__publishRevokeUpcomingDigest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "revokeUpcomingDigest:", *(_QWORD *)(a1 + 32));
}

- (void)_updateDigestInfosForScheduleTimes:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *digestInfos;
  NCDigestInfo *upcomingScheduledDigestInfo;
  NCDigestInfo *previouslyScheduledDigestInfo;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NCDigestInfo *v16;
  NCDigestInfo *v17;
  os_log_t *v18;
  NSObject *v19;
  NCDigestInfo *v20;
  NSObject *v21;
  NCDigestInfo *v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  NCDigestInfo *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (!self->_digestInfos)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      digestInfos = self->_digestInfos;
      self->_digestInfos = v5;

    }
    upcomingScheduledDigestInfo = self->_upcomingScheduledDigestInfo;
    self->_upcomingScheduledDigestInfo = 0;

    previouslyScheduledDigestInfo = self->_previouslyScheduledDigestInfo;
    self->_previouslyScheduledDigestInfo = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__NCDigestScheduleManager__updateDigestInfosForScheduleTimes___block_invoke_2;
    v23[3] = &unk_1E8D1F4E0;
    v23[4] = self;
    v25 = v11;
    v12 = v9;
    v24 = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23);
    v13 = (void *)-[NCDigestInfo mutableCopy](self->_previouslyScheduledDigestInfo, "mutableCopy");
    objc_msgSend(v13, "scheduleDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingTimeInterval:", -86400.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScheduleDate:", v15);

    v16 = (NCDigestInfo *)objc_msgSend(v13, "copy");
    v17 = self->_previouslyScheduledDigestInfo;
    self->_previouslyScheduledDigestInfo = v16;

    v18 = (os_log_t *)MEMORY[0x1E0DC5F90];
    v19 = *MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_upcomingScheduledDigestInfo;
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "Updated upcoming digest info: %{public}@", buf, 0xCu);
    }
    v21 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_previouslyScheduledDigestInfo;
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_1CFC3D000, v21, OS_LOG_TYPE_DEFAULT, "Updated previously scheduled digest info: %{public}@", buf, 0xCu);
    }
    -[NCDigestScheduleManager _publishUpcomingDigestInfo:](self, "_publishUpcomingDigestInfo:", self->_upcomingScheduledDigestInfo);
    -[NCDigestScheduleManager _scheduleTimerForDigestInfo:](self, "_scheduleTimerForDigestInfo:", self->_upcomingScheduledDigestInfo);

  }
}

uint64_t __62__NCDigestScheduleManager__updateDigestInfosForScheduleTimes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "hour");
  if (v6 <= objc_msgSend(v5, "hour"))
  {
    v8 = objc_msgSend(v4, "hour");
    v7 = -1;
    if (v8 == objc_msgSend(v5, "hour"))
    {
      v9 = objc_msgSend(v4, "minute");
      if (v9 >= objc_msgSend(v5, "minute"))
        v7 = 1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __62__NCDigestScheduleManager__updateDigestInfosForScheduleTimes___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  NCMutableDigestInfo *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  int v37;
  int v38;
  int v39;
  NCMutableDigestInfo *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "_scheduleDateFromScheduleTime:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(NCMutableDigestInfo);
  -[NCMutableDigestInfo setScheduleTime:](v8, "setScheduleTime:", v6);

  -[NCMutableDigestInfo setScheduleDate:](v8, "setScheduleDate:", v7);
  v9 = v7;
  if (objc_msgSend(v9, "nc_isMorning"))
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("NOTIFICATION_SUMMARY_SECTION_TITLE_MORNING");
  }
  else if (objc_msgSend(v9, "nc_isAfternoon"))
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("NOTIFICATION_SUMMARY_SECTION_TITLE_AFTERNOON");
  }
  else if (objc_msgSend(v9, "nc_isEvening"))
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("NOTIFICATION_SUMMARY_SECTION_TITLE_EVENING");
  }
  else
  {
    v37 = objc_msgSend(v9, "nc_isNight");
    NCUserNotificationsUIKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v37)
      v12 = CFSTR("NOTIFICATION_SUMMARY_SECTION_TITLE_NIGHT");
    else
      v12 = CFSTR("NOTIFICATION_SUMMARY_SECTION_TITLE_OVERNIGHT");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E8D21F60, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCMutableDigestInfo setTitleString:](v8, "setTitleString:", v13);
  v14 = v9;
  if (objc_msgSend(v14, "nc_isMorning"))
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("NOTIFICATION_SUMMARY_HEADER_MORNING");
  }
  else if (objc_msgSend(v14, "nc_isAfternoon"))
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("NOTIFICATION_SUMMARY_HEADER_AFTERNOON");
  }
  else if (objc_msgSend(v14, "nc_isEvening"))
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("NOTIFICATION_SUMMARY_HEADER_EVENING");
  }
  else
  {
    v38 = objc_msgSend(v14, "nc_isNight");
    NCUserNotificationsUIKitFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v38)
      v17 = CFSTR("NOTIFICATION_SUMMARY_HEADER_NIGHT");
    else
      v17 = CFSTR("NOTIFICATION_SUMMARY_HEADER_OVERNIGHT");
  }
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E8D21F60, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCMutableDigestInfo setHeaderString:](v8, "setHeaderString:", v18);
  v19 = a1[6];
  if (a3 || v19 <= 1)
  {
    v21 = v19 > 1;
    v22 = v19 - 1;
    v23 = v21;
    v24 = 2 * v23;
    if (v22 == a3)
      v20 = v24;
    else
      v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  -[NCMutableDigestInfo setDeliveryOrder:](v8, "setDeliveryOrder:", v20);
  objc_msgSend(*(id *)(a1[4] + 48), "addObject:", v8);
  v25 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v39 = 138543362;
    v40 = v8;
    _os_log_impl(&dword_1CFC3D000, v25, OS_LOG_TYPE_DEFAULT, "Added notification digest [info=%{public}@]", (uint8_t *)&v39, 0xCu);
  }
  objc_msgSend(v14, "timeIntervalSinceDate:", a1[5]);
  v27 = v26;
  v28 = a1[4];
  v29 = *(void **)(v28 + 16);
  if (v29)
  {
    objc_msgSend(v29, "scheduleDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSinceDate:", a1[5]);
    v32 = v31;

    v28 = a1[4];
  }
  else
  {
    v32 = 2147483650.0;
  }
  if (v27 < v32)
  {
    objc_storeStrong((id *)(v28 + 16), v8);
    v28 = a1[4];
  }
  v33 = *(void **)(v28 + 24);
  if (v33)
  {
    objc_msgSend(v33, "scheduleDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSinceDate:", a1[5]);
    v36 = v35;

  }
  else
  {
    v36 = -2147483650.0;
  }
  if (v27 > v36)
    objc_storeStrong((id *)(a1[4] + 24), v8);

}

- (void)_updateUpcomingScheduledDigestInfo
{
  void *v3;
  NSMutableSet *digestInfos;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  uint64_t *v9;
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  v16 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0x41DFFFFFFFC00000;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  digestInfos = self->_digestInfos;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__NCDigestScheduleManager__updateUpcomingScheduledDigestInfo__block_invoke;
  v6[3] = &unk_1E8D1F508;
  v6[4] = self;
  v5 = v3;
  v7 = v5;
  v8 = v10;
  v9 = &v11;
  -[NSMutableSet enumerateObjectsUsingBlock:](digestInfos, "enumerateObjectsUsingBlock:", v6);
  objc_storeStrong((id *)&self->_upcomingScheduledDigestInfo, (id)v12[5]);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);

}

void __61__NCDigestScheduleManager__updateUpcomingScheduledDigestInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v15 = v3;
  objc_msgSend(v3, "scheduleTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scheduleDateFromScheduleTime:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceDate:", v6);
  if (v7 >= 0.0)
    v8 = v7;
  else
    v8 = -v7;
  if (v8 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 40), "isEqualToDate:", v6) & 1) == 0)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
    v9 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v9, "scheduleDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToDate:", v10);

    if ((v11 & 1) == 0)
      objc_msgSend(v9, "setScheduleDate:", v6);
    v12 = objc_msgSend(v9, "copy");
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

- (void)_scheduleTimerFiredForTimer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Notification digest scheduled timer %{public}@ fired for digest info [%{public}@]", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NCDigestScheduleManager__scheduleTimerFiredForTimer___block_invoke;
  v8[3] = &unk_1E8D1CB40;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v5;
  v7 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __55__NCDigestScheduleManager__scheduleTimerFiredForTimer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  os_log_t *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(WeakRetained, "setPreviouslyScheduledDigestInfo:", v3);

  objc_msgSend(WeakRetained, "_updateUpcomingScheduledDigestInfo");
  v4 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(WeakRetained, "upcomingScheduledDigestInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Updated upcoming digest info: %{public}@", (uint8_t *)&v14, 0xCu);

  }
  v8 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(WeakRetained, "previouslyScheduledDigestInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v10;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "Updated previously scheduled digest info: %{public}@", (uint8_t *)&v14, 0xCu);

  }
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "upcomingScheduledDigestInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_publishDigestInfo:withUpcomingDigestInfo:", v11, v12);

  objc_msgSend(WeakRetained, "upcomingScheduledDigestInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_scheduleTimerForDigestInfo:", v13);

}

- (void)_handleTimeOrLocaleChange:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(a3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "Updating notification digest schedule infos on time or locale change for notification %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[NCDigestScheduleManager _currentScheduleTimes](self, "_currentScheduleTimes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCDigestScheduleManager invalidateScheduledTimerSendCancel:](self, "invalidateScheduledTimerSendCancel:", v8 == 0);
  -[NCDigestScheduleManager _updateDigestInfosForScheduleTimes:](self, "_updateDigestInfosForScheduleTimes:", v8);

}

- (id)_scheduleDateFromScheduleTime:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "setHour:", objc_msgSend(v4, "hour"));
  v9 = objc_msgSend(v4, "minute");

  objc_msgSend(v8, "setMinute:", v9);
  objc_msgSend(v8, "setSecond:", 0);
  objc_msgSend(v8, "setNanosecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v10);

  objc_msgSend(v5, "dateFromComponents:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v6);
  if (v12 < 10.0)
  {
    objc_msgSend(v11, "dateByAddingTimeInterval:", 86400.0);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }

  return v11;
}

- (id)_currentScheduleTimes
{
  id v3;
  NSMutableSet *digestInfos;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  digestInfos = self->_digestInfos;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NCDigestScheduleManager__currentScheduleTimes__block_invoke;
  v7[3] = &unk_1E8D1F530;
  v5 = v3;
  v8 = v5;
  -[NSMutableSet enumerateObjectsUsingBlock:](digestInfos, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __48__NCDigestScheduleManager__currentScheduleTimes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "scheduleTime");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_scheduleTimerForDigestInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  PCPersistentTimer *v14;
  PCPersistentTimer *digestScheduleTimer;
  NSObject *v16;
  PCPersistentTimer *v17;
  int v18;
  PCPersistentTimer *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "scheduleDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "earlierDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (os_log_t *)MEMORY[0x1E0DC5F90];
    if (v8 == v6)
    {
      v10 = *MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
        -[NCDigestScheduleManager _scheduleTimerForDigestInfo:].cold.1((uint64_t)v6, v10);
      objc_msgSend(v6, "dateByAddingTimeInterval:", 86400.0);
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v12, "setScheduleDate:", v11);
      v13 = objc_msgSend(v12, "copy");

      v6 = (void *)v11;
      v5 = (void *)v13;
    }
    v14 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v6, CFSTR("com.apple.usernotifications.scheduledDelivery"), self, sel__scheduleTimerFiredForTimer_, v5);
    digestScheduleTimer = self->_digestScheduleTimer;
    self->_digestScheduleTimer = v14;

    -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_digestScheduleTimer, "setMinimumEarlyFireProportion:", 1.0);
    -[PCPersistentTimer setUserVisible:](self->_digestScheduleTimer, "setUserVisible:", 1);
    -[PCPersistentTimer scheduleInQueue:](self->_digestScheduleTimer, "scheduleInQueue:", self->_digestScheduleTimerQueue);
    v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_digestScheduleTimer;
      v18 = 138543618;
      v19 = v17;
      v20 = 2114;
      v21 = v5;
      _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "Scheduled persistent timer %{public}@ for notification digest [info=%{public}@]", (uint8_t *)&v18, 0x16u);
    }

  }
}

- (NSArray)digestScheduleTimes
{
  return self->_digestScheduleTimes;
}

- (NCDigestInfo)upcomingScheduledDigestInfo
{
  return self->_upcomingScheduledDigestInfo;
}

- (void)setUpcomingScheduledDigestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_upcomingScheduledDigestInfo, a3);
}

- (NCDigestInfo)previouslyScheduledDigestInfo
{
  return self->_previouslyScheduledDigestInfo;
}

- (void)setPreviouslyScheduledDigestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyScheduledDigestInfo, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (PCPersistentTimer)digestScheduleTimer
{
  return self->_digestScheduleTimer;
}

- (void)setDigestScheduleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_digestScheduleTimer, a3);
}

- (NSMutableSet)digestInfos
{
  return self->_digestInfos;
}

- (void)setDigestInfos:(id)a3
{
  objc_storeStrong((id *)&self->_digestInfos, a3);
}

- (OS_dispatch_queue)digestScheduleTimerQueue
{
  return self->_digestScheduleTimerQueue;
}

- (void)setDigestScheduleTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_digestScheduleTimerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestScheduleTimerQueue, 0);
  objc_storeStrong((id *)&self->_digestInfos, 0);
  objc_storeStrong((id *)&self->_digestScheduleTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previouslyScheduledDigestInfo, 0);
  objc_storeStrong((id *)&self->_upcomingScheduledDigestInfo, 0);
  objc_storeStrong((id *)&self->_digestScheduleTimes, 0);
}

- (void)_scheduleTimerForDigestInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_ERROR, "Schedule fire date for persistent timer is before current time! [fireDate=%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end

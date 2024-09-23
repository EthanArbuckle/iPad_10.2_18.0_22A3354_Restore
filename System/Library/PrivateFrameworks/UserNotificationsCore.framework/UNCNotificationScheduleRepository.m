@implementation UNCNotificationScheduleRepository

- (id)_dateFormatter
{
  if (_dateFormatter___once_0 != -1)
    dispatch_once(&_dateFormatter___once_0, &__block_literal_global_17);
  return (id)_dateFormatter___dateFormatter_0;
}

uint64_t __51__UNCNotificationScheduleRepository__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_dateFormatter___dateFormatter_0;
  _dateFormatter___dateFormatter_0 = (uint64_t)v0;

  return objc_msgSend((id)_dateFormatter___dateFormatter_0, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss'.'SSS Z"));
}

- (UNCNotificationScheduleRepository)initWithDirectory:(id)a3 librarian:(id)a4
{
  id v6;
  id v7;
  UNCKeyedDictionaryRepository *v8;
  UNCNotificationScheduleRepository *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = -[UNCKeyedDictionaryRepository initWithDirectory:fileName:pathExtension:librarian:]([UNCKeyedDictionaryRepository alloc], "initWithDirectory:fileName:pathExtension:librarian:", v7, CFSTR("Schedule"), CFSTR("plist"), v6);

  v14.receiver = self;
  v14.super_class = (Class)UNCNotificationScheduleRepository;
  v9 = -[UNCNotificationScheduleRepository init](&v14, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.usernotificationsserver.ScheduleRepository", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_repository, v8);
  }

  return v9;
}

- (id)allBundleIdentifiers
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
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__UNCNotificationScheduleRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__UNCNotificationScheduleRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)scheduleForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__UNCNotificationScheduleRepository_scheduleForBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0278;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __65__UNCNotificationScheduleRepository_scheduleForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSchedule:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__UNCNotificationScheduleRepository_setSchedule_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __69__UNCNotificationScheduleRepository_setSchedule_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setSchedule:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeScheduleForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__UNCNotificationScheduleRepository_removeScheduleForBundleIdentifier___block_invoke;
  v7[3] = &unk_251AE01A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __71__UNCNotificationScheduleRepository_removeScheduleForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeScheduleForBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  UNCNotificationScheduleRepository *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__UNCNotificationScheduleRepository_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_251AE01A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __69__UNCNotificationScheduleRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "bundleIdentifier", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_queue_removeScheduleForBundleIdentifier:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)_queue_scheduleForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNCKeyedDictionaryRepository dictionaryForKey:](self->_repository, "dictionaryForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*((void (**)(uint64_t, void *))UNSDictionaryToUNCNotificationSchedule + 2))((uint64_t)UNSDictionaryToUNCNotificationSchedule, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "previousTriggerDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[UNCNotificationScheduleRepository _dateFormatter](self, "_dateFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = *MEMORY[0x24BDF89C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89C8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_2499A5000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Load last local notification fire date: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  return v6;
}

- (void)_queue_setSchedule:(id)a3 forBundleIdentifier:(id)a4
{
  UNCKeyedDictionaryRepository *repository;
  void *v6;
  void (*v7)(uint64_t, void *);
  id v8;
  id v9;

  repository = self->_repository;
  v6 = UNCNotificationScheduleToDictionary;
  v7 = (void (*)(uint64_t, void *))*((_QWORD *)UNCNotificationScheduleToDictionary + 2);
  v8 = a4;
  v7((uint64_t)v6, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDictionaryRepository setDictionary:forKey:](repository, "setDictionary:forKey:", v9, v8);

}

- (void)_queue_removeScheduleForBundleIdentifier:(id)a3
{
  -[UNCKeyedDictionaryRepository removeDictionaryForKey:](self->_repository, "removeDictionaryForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

@end

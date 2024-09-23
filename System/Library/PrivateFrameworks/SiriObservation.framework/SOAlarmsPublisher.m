@implementation SOAlarmsPublisher

- (SOAlarmsPublisher)init
{
  SOAlarmsPublisher *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  dispatch_group_t v6;
  OS_dispatch_group *group;
  uint64_t v8;
  NSHashTable *subscribers;
  MTAlarmManager *v10;
  MTAlarmManager *alarmManager;
  NSString *typeName;
  NSMutableOrderedSet *v13;
  NSMutableOrderedSet *dismissedAlarms;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SOAlarmsPublisher;
  v2 = -[SOAlarmsPublisher init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("SOAlarmPublisher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 0);
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSHashTable *)v8;

    v10 = (MTAlarmManager *)objc_alloc_init((Class)getMTAlarmManagerClass_151());
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = v10;

    typeName = v2->_typeName;
    v2->_typeName = (NSString *)CFSTR("SOAlarmPublisher");

    v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    dismissedAlarms = v2->_dismissedAlarms;
    v2->_dismissedAlarms = v13;

    -[SOAlarmsPublisher _startObserving](v2, "_startObserving");
  }
  return v2;
}

- (void)getCurrentSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *group;
  NSObject *queue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    group = self->_group;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__SOAlarmsPublisher_getCurrentSnapshotWithCompletion___block_invoke;
    v8[3] = &unk_24CE75E20;
    v8[4] = self;
    v9 = v4;
    dispatch_group_notify(group, queue, v8);

  }
}

- (void)addSubscriber:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __35__SOAlarmsPublisher_addSubscriber___block_invoke;
    v6[3] = &unk_24CE757D8;
    v6[4] = self;
    v7 = v4;
    -[SOAlarmsPublisher getCurrentSnapshotWithCompletion:](self, "getCurrentSnapshotWithCompletion:", v6);

  }
}

- (void)removeSubscriber:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__SOAlarmsPublisher_removeSubscriber___block_invoke;
    v7[3] = &unk_24CE75E70;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)alarmsAdded:(id)a3
{
  -[SOAlarmsPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 2);
}

- (void)alarmsUpdated:(id)a3
{
  -[SOAlarmsPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 6);
}

- (void)alarmsRemoved:(id)a3
{
  -[SOAlarmsPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 3);
}

- (void)alarmFired:(id)a3
{
  -[SOAlarmsPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 4);
}

- (void)firingAlarmChanged:(id)a3
{
  -[SOAlarmsPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 7);
}

- (void)firingAlarmDismissed:(id)a3
{
  -[SOAlarmsPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 5);
}

- (void)stateReset:(id)a3
{
  -[SOAlarmsPublisher _notifySubscribersOfEvent:](self, "_notifySubscribersOfEvent:", 1);
}

- (void)_notifySubscribersOfEvent:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__SOAlarmsPublisher__notifySubscribersOfEvent___block_invoke;
  v3[3] = &unk_24CE75800;
  v3[4] = self;
  v3[5] = a3;
  -[SOAlarmsPublisher _createNewSnapshotWithCompletion:](self, "_createNewSnapshotWithCompletion:", v3);
}

- (void)_startObserving
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_alarmManager)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    getMTAlarmManagerAlarmsAdded_101();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_alarmsAdded_, v3, self->_alarmManager);

    getMTAlarmManagerAlarmsUpdated_104();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_alarmsUpdated_, v4, self->_alarmManager);

    getMTAlarmManagerAlarmsRemoved_107();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_alarmsRemoved_, v5, self->_alarmManager);

    getMTAlarmManagerAlarmFired_110();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_alarmFired_, v6, self->_alarmManager);

    getMTAlarmManagerFiringAlarmChanged_113();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_firingAlarmChanged_, v7, self->_alarmManager);

    getMTAlarmManagerFiringAlarmDismissed_116();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_firingAlarmDismissed_, v8, self->_alarmManager);

    getMTAlarmManagerStateReset_119();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_stateReset_, v9, self->_alarmManager);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SOAlarmsPublisher;
  -[SOAlarmsPublisher dealloc](&v4, sel_dealloc);
}

- (void)_createNewSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_group);
  -[MTAlarmManager alarmsIncludingSleepAlarm:](self->_alarmManager, "alarmsIncludingSleepAlarm:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke;
    v12[3] = &unk_24CE75EE8;
    v12[4] = self;
    v7 = v4;
    v13 = v7;
    v8 = (id)objc_msgSend(v5, "addSuccessBlock:", v12);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke_3;
    v10[3] = &unk_24CE75F10;
    v10[4] = self;
    v11 = v7;
    v9 = (id)objc_msgSend(v5, "addFailureBlock:", v10);

  }
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_dismissedAlarms, 0);
  objc_storeStrong((id *)&self->_alarmsSnapshot, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t i;
  void *v4;
  void *v5;
  SOAlarm *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  SOAlarm *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v21;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v2;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v4, "alarmID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = [SOAlarm alloc];
        objc_msgSend(v4, "alarmURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v4, "hour");
        v10 = objc_msgSend(v4, "minute");
        v11 = objc_msgSend(v4, "repeatSchedule");
        v12 = objc_msgSend(v4, "isEnabled");
        BYTE1(v19) = objc_msgSend(v4, "isFiring");
        LOBYTE(v19) = v12;
        v13 = -[SOAlarm initWithAlarmID:alarmURL:title:hour:minute:repeatSchedule:isEnabled:isFiring:](v6, "initWithAlarmID:alarmURL:title:hour:minute:repeatSchedule:isEnabled:isFiring:", v5, v7, v8, v9, v10, v11, v19);

        objc_msgSend(v24, "setObject:forKey:", v13, v5);
        if (objc_msgSend(v4, "isFiring"))
          objc_msgSend(v21, "addObject:", v5);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v25);
  }

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v16 = *(NSObject **)(v14 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke_2;
  block[3] = &unk_24CE75828;
  block[4] = v14;
  v27 = v21;
  v28 = v24;
  v29 = v15;
  v17 = v24;
  v18 = v21;
  dispatch_async(v16, block);

}

void __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SOAlarmsSnapshot *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SOAlarmsSnapshot *v15;
  uint64_t v16;
  void *v17;
  SOAlarmsSnapshot *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEE0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "firingAlarmIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithOrderedSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "minusOrderedSet:", *(_QWORD *)(a1 + 40));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++), (_QWORD)v19);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v10 = [SOAlarmsSnapshot alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v15 = -[SOAlarmsSnapshot initWithDate:alarmsByID:firingAlarmIDs:dismissedAlarmIDs:](v10, "initWithDate:alarmsByID:firingAlarmIDs:dismissedAlarmIDs:", v11, v12, v13, v14);

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;
  v18 = v15;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));

}

void __47__SOAlarmsPublisher__notifySubscribersOfEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "snapshotAvailable:forEvent:", v5, *(_QWORD *)(a1 + 40), (_QWORD)v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
  if (*(_QWORD *)(a1 + 40) == 5)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");

}

uint64_t __38__SOAlarmsPublisher_removeSubscriber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __35__SOAlarmsPublisher_addSubscriber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  if (v5)
    NSLog(CFSTR("SOAlarmsPublisher received error code when trying to create new snapshot for subscriber: %@"), v5);
  else
    objc_msgSend(*(id *)(a1 + 40), "snapshotAvailable:forEvent:", v6, 0);

}

uint64_t __54__SOAlarmsPublisher_getCurrentSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2[5];
  if (v4)
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40), v4, 0);
  else
    return objc_msgSend(v2, "_createNewSnapshotWithCompletion:", v3);
}

@end

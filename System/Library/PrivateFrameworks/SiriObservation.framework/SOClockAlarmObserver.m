@implementation SOClockAlarmObserver

uint64_t __35__SOClockAlarmObserver_stateReset___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_reset");
  objc_msgSend(*(id *)(a1 + 32), "_beginGroup");
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__SOClockAlarmObserver_stateReset___block_invoke_2;
  v4[3] = &unk_24CE75B10;
  v4[4] = v2;
  return objc_msgSend(v2, "_fetchAlarmsForReason:completion:", CFSTR("state reset"), v4);
}

- (SOClockAlarmObserver)init
{
  void *v3;
  SOClockAlarmObserver *v4;

  objc_msgSend(MEMORY[0x24BE091F8], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SOClockAlarmObserver initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (SOClockAlarmObserver)initWithInstanceContext:(id)a3
{
  id v4;
  SOClockAlarmObserver *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  AFInstanceContext *v11;
  AFInstanceContext *instanceContext;
  uint64_t v13;
  NSHashTable *listeners;
  NSObject *v15;
  _QWORD block[4];
  SOClockAlarmObserver *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SOClockAlarmObserver;
  v5 = -[SOClockAlarmObserver init](&v19, sel_init);
  if (v5)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SOClockAlarmObserver initWithInstanceContext:]";
      _os_log_impl(&dword_212A19000, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.assistant.clock-alarm-observer", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    if (v4)
    {
      v11 = (AFInstanceContext *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
      v11 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 0);
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v13;

    -[SOClockAlarmObserver _beginGroup](v5, "_beginGroup");
    v15 = v5->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__SOClockAlarmObserver_initWithInstanceContext___block_invoke;
    block[3] = &unk_24CE75B38;
    v18 = v5;
    dispatch_async(v15, block);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SOClockAlarmObserver _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)SOClockAlarmObserver;
  -[SOClockAlarmObserver dealloc](&v3, sel_dealloc);
}

- (void)addListener:(id)a3
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
    v7[2] = __36__SOClockAlarmObserver_addListener___block_invoke;
    v7[3] = &unk_24CE75E70;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeListener:(id)a3
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
    v7[2] = __39__SOClockAlarmObserver_removeListener___block_invoke;
    v7[3] = &unk_24CE75E70;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getAlarmSnapshotWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SOClockAlarmObserver getAlarmSnapshotWithCompletion:]";
      _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__SOClockAlarmObserver_getAlarmSnapshotWithCompletion___block_invoke;
    v7[3] = &unk_24CE75E20;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)getFiringAlarmIDsWithCompletion:(id)a3
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
    v7[2] = __56__SOClockAlarmObserver_getFiringAlarmIDsWithCompletion___block_invoke;
    v7[3] = &unk_24CE75E20;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SOClockAlarmObserver_invalidate__block_invoke;
  block[3] = &unk_24CE75B38;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clockItemStorageDidUpdate:(id)a3 insertedItemIDs:(id)a4 updatedItemIDs:(id)a5 deletedItemIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject **v13;
  NSObject *v14;
  AFClockAlarmSnapshot *v15;
  AFClockAlarmSnapshot *alarmSnapshot;
  AFClockAlarmSnapshot *v17;
  _QWORD v18[5];
  AFClockAlarmSnapshot *v19;
  AFClockAlarmSnapshot *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->_alarmStorage == a3)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v13 = (NSObject **)MEMORY[0x24BE08FB0];
    v14 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SOClockAlarmObserver clockItemStorageDidUpdate:insertedItemIDs:updatedItemIDs:deletedItemIDs:]";
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_212A19000, v14, OS_LOG_TYPE_INFO, "%s insertedItemIDs = %@", buf, 0x16u);
      v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SOClockAlarmObserver clockItemStorageDidUpdate:insertedItemIDs:updatedItemIDs:deletedItemIDs:]";
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_212A19000, v14, OS_LOG_TYPE_INFO, "%s  updatedItemIDs = %@", buf, 0x16u);
      v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SOClockAlarmObserver clockItemStorageDidUpdate:insertedItemIDs:updatedItemIDs:deletedItemIDs:]";
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_212A19000, v14, OS_LOG_TYPE_INFO, "%s  deletedItemIDs = %@", buf, 0x16u);
    }
    v15 = self->_alarmSnapshot;
    alarmSnapshot = self->_alarmSnapshot;
    self->_alarmSnapshot = 0;

    -[SOClockAlarmObserver _consolidateNotifiedFiringAlarms](self, "_consolidateNotifiedFiringAlarms");
    -[SOClockAlarmObserver _alarmSnapshot](self, "_alarmSnapshot");
    v17 = (AFClockAlarmSnapshot *)objc_claimAutoreleasedReturnValue();
    if (v15 != v17 && (-[AFClockAlarmSnapshot isEqual:](v15, "isEqual:", v17) & 1) == 0)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __96__SOClockAlarmObserver_clockItemStorageDidUpdate_insertedItemIDs_updatedItemIDs_deletedItemIDs___block_invoke;
      v18[3] = &unk_24CE755E8;
      v18[4] = self;
      v19 = v15;
      v20 = v17;
      -[SOClockAlarmObserver _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v18);

    }
  }

}

- (void)alarmsAdded:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClockAlarmObserver alarmsAdded:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__SOClockAlarmObserver_alarmsAdded___block_invoke;
  v8[3] = &unk_24CE75E70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)alarmsUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClockAlarmObserver alarmsUpdated:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__SOClockAlarmObserver_alarmsUpdated___block_invoke;
  v8[3] = &unk_24CE75E70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)alarmsRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClockAlarmObserver alarmsRemoved:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__SOClockAlarmObserver_alarmsRemoved___block_invoke;
  v8[3] = &unk_24CE75E70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)alarmFired:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClockAlarmObserver alarmFired:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__SOClockAlarmObserver_alarmFired___block_invoke;
  v8[3] = &unk_24CE75E70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)firingAlarmChanged:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClockAlarmObserver firingAlarmChanged:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SOClockAlarmObserver_firingAlarmChanged___block_invoke;
  v8[3] = &unk_24CE75E70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)firingAlarmDismissed:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOClockAlarmObserver firingAlarmDismissed:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke;
  v8[3] = &unk_24CE75E70;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)stateReset:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SOClockAlarmObserver stateReset:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_212A19000, v5, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SOClockAlarmObserver_stateReset___block_invoke;
  block[3] = &unk_24CE75B38;
  block[4] = self;
  dispatch_async(queue, block);

}

- (void)alarmsChanged:(id)a3
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
  v7[2] = __38__SOClockAlarmObserver_alarmsChanged___block_invoke;
  v7[3] = &unk_24CE75E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_beginGroup
{
  NSObject *alarmSnapshotGroup;
  OS_dispatch_group *v4;
  OS_dispatch_group *v5;

  alarmSnapshotGroup = self->_alarmSnapshotGroup;
  if (!alarmSnapshotGroup)
  {
    v4 = (OS_dispatch_group *)dispatch_group_create();
    v5 = self->_alarmSnapshotGroup;
    self->_alarmSnapshotGroup = v4;

    alarmSnapshotGroup = self->_alarmSnapshotGroup;
  }
  dispatch_group_enter(alarmSnapshotGroup);
  ++self->_alarmSnapshotGroupDepth;
}

- (void)_endGroup
{
  NSObject *alarmSnapshotGroup;
  OS_dispatch_group **p_alarmSnapshotGroup;
  OS_dispatch_group *v5;

  p_alarmSnapshotGroup = &self->_alarmSnapshotGroup;
  alarmSnapshotGroup = self->_alarmSnapshotGroup;
  self->_alarmSnapshotGroupDepth = (int64_t)p_alarmSnapshotGroup[1] - 1;
  dispatch_group_leave(alarmSnapshotGroup);
  if (!self->_alarmSnapshotGroupDepth)
  {
    v5 = self->_alarmSnapshotGroup;
    self->_alarmSnapshotGroup = 0;

  }
}

- (id)_alarmSnapshot
{
  AFClockAlarmSnapshot *alarmSnapshot;
  AFClockAlarmSnapshot *v4;
  AFClockAlarmSnapshot *v5;
  _QWORD v7[5];

  alarmSnapshot = self->_alarmSnapshot;
  if (!alarmSnapshot)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__SOClockAlarmObserver__alarmSnapshot__block_invoke;
    v7[3] = &unk_24CE75638;
    v7[4] = self;
    v4 = (AFClockAlarmSnapshot *)objc_msgSend(MEMORY[0x24BE09148], "newWithBuilder:", v7);
    v5 = self->_alarmSnapshot;
    self->_alarmSnapshot = v4;

    alarmSnapshot = self->_alarmSnapshot;
  }
  return alarmSnapshot;
}

- (void)_setUp
{
  NSObject *v3;
  AFClockAlarmSnapshot *alarmSnapshot;
  AFClockItemStorage *v5;
  AFClockItemStorage *alarmStorage;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *notifiedFiringAlarmIDs;
  SOClockAlarmManager *v9;
  SOClockAlarmManager *alarmManager;
  SOClockAlarmManager *v11;
  SOClockAlarmManager *v12;
  uint64_t v13;
  SOClockAlarmManager *v14;
  SOClockAlarmManager *v15;
  SOClockAlarmManager *v16;
  SOClockAlarmManager *v17;
  SOClockAlarmManager *v18;
  SOClockAlarmManager *v19;
  SOClockAlarmManager *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[SOClockAlarmObserver _setUp]";
    _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  alarmSnapshot = self->_alarmSnapshot;
  self->_alarmSnapshot = 0;

  v5 = (AFClockItemStorage *)objc_msgSend(objc_alloc(MEMORY[0x24BE09150]), "initWithIdentifier:delegate:", CFSTR("alarm observer"), self);
  alarmStorage = self->_alarmStorage;
  self->_alarmStorage = v5;

  v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
  notifiedFiringAlarmIDs = self->_notifiedFiringAlarmIDs;
  self->_notifiedFiringAlarmIDs = v7;

  v9 = -[SOClockAlarmManager initWithInstanceContext:]([SOClockAlarmManager alloc], "initWithInstanceContext:", self->_instanceContext);
  alarmManager = self->_alarmManager;
  self->_alarmManager = v9;

  v11 = self->_alarmManager;
  if (v11)
  {
    -[SOClockAlarmManager checkIn](v11, "checkIn");
    objc_initWeak((id *)buf, self);
    v12 = self->_alarmManager;
    v13 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __30__SOClockAlarmObserver__setUp__block_invoke;
    v35[3] = &unk_24CE75C00;
    objc_copyWeak(&v36, (id *)buf);
    -[SOClockAlarmManager addHandler:forEvent:](v12, "addHandler:forEvent:", v35, 1);
    v14 = self->_alarmManager;
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __30__SOClockAlarmObserver__setUp__block_invoke_2;
    v33[3] = &unk_24CE75C00;
    objc_copyWeak(&v34, (id *)buf);
    -[SOClockAlarmManager addHandler:forEvent:](v14, "addHandler:forEvent:", v33, 2);
    v15 = self->_alarmManager;
    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __30__SOClockAlarmObserver__setUp__block_invoke_3;
    v31[3] = &unk_24CE75C00;
    objc_copyWeak(&v32, (id *)buf);
    -[SOClockAlarmManager addHandler:forEvent:](v15, "addHandler:forEvent:", v31, 3);
    v16 = self->_alarmManager;
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __30__SOClockAlarmObserver__setUp__block_invoke_4;
    v29[3] = &unk_24CE75C00;
    objc_copyWeak(&v30, (id *)buf);
    -[SOClockAlarmManager addHandler:forEvent:](v16, "addHandler:forEvent:", v29, 4);
    v17 = self->_alarmManager;
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __30__SOClockAlarmObserver__setUp__block_invoke_5;
    v27[3] = &unk_24CE75C00;
    objc_copyWeak(&v28, (id *)buf);
    -[SOClockAlarmManager addHandler:forEvent:](v17, "addHandler:forEvent:", v27, 6);
    v18 = self->_alarmManager;
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __30__SOClockAlarmObserver__setUp__block_invoke_6;
    v25[3] = &unk_24CE75C00;
    objc_copyWeak(&v26, (id *)buf);
    -[SOClockAlarmManager addHandler:forEvent:](v18, "addHandler:forEvent:", v25, 5);
    v19 = self->_alarmManager;
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __30__SOClockAlarmObserver__setUp__block_invoke_7;
    v23[3] = &unk_24CE75C00;
    objc_copyWeak(&v24, (id *)buf);
    -[SOClockAlarmManager addHandler:forEvent:](v19, "addHandler:forEvent:", v23, 7);
    v20 = self->_alarmManager;
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __30__SOClockAlarmObserver__setUp__block_invoke_8;
    v21[3] = &unk_24CE75C00;
    objc_copyWeak(&v22, (id *)buf);
    -[SOClockAlarmManager addHandler:forEvent:](v20, "addHandler:forEvent:", v21, 8);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_tearDown
{
  NSObject *v3;
  SOClockAlarmManager *alarmManager;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SOClockAlarmObserver _tearDown]";
    _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  alarmManager = self->_alarmManager;
  self->_alarmManager = 0;

  -[SOClockAlarmObserver _reset](self, "_reset");
}

- (void)_reset
{
  NSObject *v3;
  AFClockItemStorage *v4;
  AFClockItemStorage *alarmStorage;
  AFClockAlarmSnapshot *alarmSnapshot;
  NSUUID *alarmsChangedToken;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SOClockAlarmObserver _reset]";
    _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[NSMutableOrderedSet removeAllObjects](self->_notifiedFiringAlarmIDs, "removeAllObjects");
  -[AFClockItemStorage invalidate](self->_alarmStorage, "invalidate");
  if (self->_alarmManager)
    v4 = (AFClockItemStorage *)objc_msgSend(objc_alloc(MEMORY[0x24BE09150]), "initWithIdentifier:delegate:", CFSTR("alarm observer"), self);
  else
    v4 = 0;
  alarmStorage = self->_alarmStorage;
  self->_alarmStorage = v4;

  if (self->_alarmSnapshot)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __30__SOClockAlarmObserver__reset__block_invoke;
    v8[3] = &unk_24CE75660;
    v8[4] = self;
    -[SOClockAlarmObserver _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v8);
    alarmSnapshot = self->_alarmSnapshot;
    self->_alarmSnapshot = 0;

  }
  alarmsChangedToken = self->_alarmsChangedToken;
  self->_alarmsChangedToken = 0;

}

- (void)_fetchAlarmsForReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  OS_dispatch_queue *v10;
  uint64_t v11;
  id v12;
  OS_dispatch_queue *v13;
  id v14;
  id v15;
  OS_dispatch_queue *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  OS_dispatch_queue *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  OS_dispatch_queue *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[SOClockAlarmObserver _fetchAlarmsForReason:completion:]";
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_212A19000, v8, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  -[SOClockAlarmManager alarmsIncludingSleepAlarm:](self->_alarmManager, "alarmsIncludingSleepAlarm:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = self->_queue;
    v11 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke;
    v23[3] = &unk_24CE75C78;
    v12 = v6;
    v24 = v12;
    v13 = v10;
    v25 = v13;
    objc_copyWeak(&v27, (id *)buf);
    v14 = v7;
    v26 = v14;
    v15 = (id)objc_msgSend(v9, "addSuccessBlock:", v23);
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_2;
    v18[3] = &unk_24CE75CA0;
    v19 = v12;
    v16 = v13;
    v20 = v16;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v14;
    v17 = (id)objc_msgSend(v9, "addFailureBlock:", v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 2105);
    v16 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    -[SOClockAlarmObserver _handleFetchAlarmsForReason:error:completion:](self, "_handleFetchAlarmsForReason:error:completion:", v6, v16, v7);
  }

  objc_destroyWeak((id *)buf);
}

- (void)_handleFetchAlarmsForReason:(id)a3 result:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  SOClockAlarmCreateFromMTAlarms(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v12 = 136315650;
    v13 = "-[SOClockAlarmObserver _handleFetchAlarmsForReason:result:completion:]";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_212A19000, v11, OS_LOG_TYPE_INFO, "%s reason = %@, alarms = %@", (uint8_t *)&v12, 0x20u);
  }
  -[AFClockItemStorage beginGrouping](self->_alarmStorage, "beginGrouping");
  -[AFClockItemStorage deleteAllItems](self->_alarmStorage, "deleteAllItems");
  -[AFClockItemStorage insertOrUpdateItems:](self->_alarmStorage, "insertOrUpdateItems:", v10);
  -[AFClockItemStorage endGroupingWithOptions:](self->_alarmStorage, "endGroupingWithOptions:", 0);
  if (v9)
    v9[2](v9, v10, 0);

}

- (void)_handleFetchAlarmsForReason:(id)a3 error:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, id);
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, id))a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v11 = 136315650;
    v12 = "-[SOClockAlarmObserver _handleFetchAlarmsForReason:error:completion:]";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_error_impl(&dword_212A19000, v10, OS_LOG_TYPE_ERROR, "%s reason = %@, error = %@", (uint8_t *)&v11, 0x20u);
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v9)
LABEL_3:
    v9[2](v9, 0, v8);
LABEL_4:

}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
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
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_listeners;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_consolidateNotifiedFiringAlarms
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[AFClockItemStorage itemsByID](self->_alarmStorage, "itemsByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke;
  v23[3] = &unk_24CE75688;
  v23[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v23);
  if (-[NSMutableOrderedSet count](self->_notifiedFiringAlarmIDs, "count"))
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDBCEF0];
    -[NSMutableOrderedSet set](self->_notifiedFiringAlarmIDs, "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)v7;
    objc_msgSend(v10, "minusSet:", v7);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[NSMutableOrderedSet removeObject:](self->_notifiedFiringAlarmIDs, "removeObject:", v16);
          v18[0] = v4;
          v18[1] = 3221225472;
          v18[2] = __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_4;
          v18[3] = &unk_24CE75610;
          v18[4] = self;
          v18[5] = v16;
          -[SOClockAlarmObserver _enumerateListenersUsingBlock:](self, "_enumerateListenersUsingBlock:", v18);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmsChangedToken, 0);
  objc_storeStrong((id *)&self->_notifiedFiringAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_alarmSnapshotGroup, 0);
  objc_storeStrong((id *)&self->_alarmSnapshot, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  void *v20;
  id v21;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "isFiring")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v5);
    v7 = *(void **)(a1 + 32);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_2;
    v19 = &unk_24CE75610;
    v20 = v7;
    v8 = &v21;
    v21 = v5;
    v9 = &v16;
    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "isFiring") & 1) == 0
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v5))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", v5);
    v7 = *(void **)(a1 + 32);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_3;
    v13 = &unk_24CE75610;
    v14 = v7;
    v8 = &v15;
    v15 = v5;
    v9 = &v10;
LABEL_7:
    objc_msgSend(v7, "_enumerateListenersUsingBlock:", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

uint64_t __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:alarmDidDismiss:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:alarmDidFire:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __56__SOClockAlarmObserver__consolidateNotifiedFiringAlarms__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:alarmDidDismiss:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v14 = "-[SOClockAlarmObserver _fetchAlarmsForReason:completion:]_block_invoke";
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_212A19000, v4, OS_LOG_TYPE_INFO, "%s reason = %@, result = %@", buf, 0x20u);
  }
  v6 = *(NSObject **)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_23;
  v8[3] = &unk_24CE75C50;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v12);
}

void __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v14 = "-[SOClockAlarmObserver _fetchAlarmsForReason:completion:]_block_invoke_2";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v3;
    _os_log_error_impl(&dword_212A19000, v4, OS_LOG_TYPE_ERROR, "%s reason = %@, error = %@", buf, 0x20u);
  }
  v5 = *(NSObject **)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_24;
  v8[3] = &unk_24CE75C50;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, v8);

  objc_destroyWeak(&v12);
}

void __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_24(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleFetchAlarmsForReason:error:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __57__SOClockAlarmObserver__fetchAlarmsForReason_completion___block_invoke_23(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleFetchAlarmsForReason:result:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __30__SOClockAlarmObserver__reset__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:snapshotDidUpdateFrom:to:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0);
}

void __30__SOClockAlarmObserver__setUp__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "alarmsAdded:", v3);

}

void __30__SOClockAlarmObserver__setUp__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "alarmsUpdated:", v3);

}

void __30__SOClockAlarmObserver__setUp__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "alarmsRemoved:", v3);

}

void __30__SOClockAlarmObserver__setUp__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "alarmFired:", v3);

}

void __30__SOClockAlarmObserver__setUp__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "firingAlarmChanged:", v3);

}

void __30__SOClockAlarmObserver__setUp__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "firingAlarmDismissed:", v3);

}

void __30__SOClockAlarmObserver__setUp__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "stateReset:", v3);

}

void __30__SOClockAlarmObserver__setUp__block_invoke_8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "alarmsChanged:", v3);

}

void __38__SOClockAlarmObserver__alarmSnapshot__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a2;
  objc_msgSend(v6, "setGeneration:", objc_msgSend(v3, "generation"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDate:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "itemsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlarmsByID:", v5);

  objc_msgSend(v6, "setNotifiedFiringAlarmIDs:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
}

void __38__SOClockAlarmObserver_alarmsChanged___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)*(id *)(a1 + 32);
  if (v2)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v13 = "-[SOClockAlarmObserver alarmsChanged:]_block_invoke";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s alarms = %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v2 + 10, v5);
    objc_initWeak((id *)buf, v2);
    v6 = dispatch_time(0, 250000000);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__SOClockAlarmObserver_alarmsChanged___block_invoke_13;
    v9[3] = &unk_24CE75BB0;
    objc_copyWeak(&v11, (id *)buf);
    v10 = v5;
    v8 = v5;
    dispatch_after(v6, v7, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

}

void __38__SOClockAlarmObserver_alarmsChanged___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 10);
    if (v4)
    {
      if (*(_QWORD *)(a1 + 32) && objc_msgSend(v4, "isEqual:"))
      {
        objc_msgSend(v3, "_beginGroup");
        v5[0] = MEMORY[0x24BDAC760];
        v5[1] = 3221225472;
        v5[2] = __38__SOClockAlarmObserver_alarmsChanged___block_invoke_2;
        v5[3] = &unk_24CE75B10;
        v5[4] = v3;
        objc_msgSend(v3, "_fetchAlarmsForReason:completion:", CFSTR("batched changes"), v5);
      }
    }
  }

}

uint64_t __38__SOClockAlarmObserver_alarmsChanged___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SOClockAlarmObserver alarmsChanged:]_block_invoke_2";
    _os_log_impl(&dword_212A19000, v2, OS_LOG_TYPE_INFO, "%s Alarm fetch complete for batched changes", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_endGroup");
}

uint64_t __35__SOClockAlarmObserver_stateReset___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SOClockAlarmObserver stateReset:]_block_invoke_2";
    _os_log_impl(&dword_212A19000, v2, OS_LOG_TYPE_INFO, "%s Alarm fetch complete for state reset", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_endGroup");
}

void __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  _SOClockAlarmObserverGetAlarmIDsFromAlarms(*(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v11))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", v11);
          v12 = *(void **)(a1 + 32);
          v18[0] = v9;
          v18[1] = 3221225472;
          v18[2] = __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke_2;
          v18[3] = &unk_24CE75610;
          v18[4] = v12;
          v18[5] = v11;
          objc_msgSend(v12, "_enumerateListenersUsingBlock:", v18);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "beginGrouping");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "insertOrUpdateItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "endGroupingWithOptions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_consolidateNotifiedFiringAlarms");
  objc_msgSend(*(id *)(a1 + 32), "_alarmSnapshot");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 != v13 && (objc_msgSend(v2, "isEqual:", v13) & 1) == 0)
  {
    v14 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke_3;
    v15[3] = &unk_24CE755E8;
    v15[4] = v14;
    v16 = v2;
    v17 = v13;
    objc_msgSend(v14, "_enumerateListenersUsingBlock:", v15);

  }
}

uint64_t __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:alarmDidDismiss:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __45__SOClockAlarmObserver_firingAlarmDismissed___block_invoke_3(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:snapshotDidUpdateFrom:to:", a1[4], a1[5], a1[6]);
}

uint64_t __43__SOClockAlarmObserver_firingAlarmChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "insertOrUpdateItems:", *(_QWORD *)(a1 + 40));
}

void __35__SOClockAlarmObserver_alarmFired___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  _SOClockAlarmObserverGetAlarmIDsFromAlarms(*(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v11);
          v12 = *(void **)(a1 + 32);
          v18[0] = v9;
          v18[1] = 3221225472;
          v18[2] = __35__SOClockAlarmObserver_alarmFired___block_invoke_2;
          v18[3] = &unk_24CE75610;
          v18[4] = v12;
          v18[5] = v11;
          objc_msgSend(v12, "_enumerateListenersUsingBlock:", v18);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "beginGrouping");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "insertOrUpdateItems:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "endGroupingWithOptions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_consolidateNotifiedFiringAlarms");
  objc_msgSend(*(id *)(a1 + 32), "_alarmSnapshot");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 != v13 && (objc_msgSend(v2, "isEqual:", v13) & 1) == 0)
  {
    v14 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __35__SOClockAlarmObserver_alarmFired___block_invoke_3;
    v15[3] = &unk_24CE755E8;
    v15[4] = v14;
    v16 = v2;
    v17 = v13;
    objc_msgSend(v14, "_enumerateListenersUsingBlock:", v15);

  }
}

uint64_t __35__SOClockAlarmObserver_alarmFired___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:alarmDidFire:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __35__SOClockAlarmObserver_alarmFired___block_invoke_3(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:snapshotDidUpdateFrom:to:", a1[4], a1[5], a1[6]);
}

void __38__SOClockAlarmObserver_alarmsRemoved___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  _SOClockAlarmObserverGetAlarmIDsFromAlarms(*(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v11))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", v11);
          v12 = *(void **)(a1 + 32);
          v18[0] = v9;
          v18[1] = 3221225472;
          v18[2] = __38__SOClockAlarmObserver_alarmsRemoved___block_invoke_2;
          v18[3] = &unk_24CE75610;
          v18[4] = v12;
          v18[5] = v11;
          objc_msgSend(v12, "_enumerateListenersUsingBlock:", v18);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "beginGrouping");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "deleteItemsWithIDs:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "endGroupingWithOptions:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_consolidateNotifiedFiringAlarms");
  objc_msgSend(*(id *)(a1 + 32), "_alarmSnapshot");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 != v13 && (objc_msgSend(v2, "isEqual:", v13) & 1) == 0)
  {
    v14 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __38__SOClockAlarmObserver_alarmsRemoved___block_invoke_3;
    v15[3] = &unk_24CE755E8;
    v15[4] = v14;
    v16 = v2;
    v17 = v13;
    objc_msgSend(v14, "_enumerateListenersUsingBlock:", v15);

  }
}

uint64_t __38__SOClockAlarmObserver_alarmsRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:alarmDidDismiss:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __38__SOClockAlarmObserver_alarmsRemoved___block_invoke_3(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:snapshotDidUpdateFrom:to:", a1[4], a1[5], a1[6]);
}

uint64_t __38__SOClockAlarmObserver_alarmsUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "insertOrUpdateItems:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__SOClockAlarmObserver_alarmsAdded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "insertOrUpdateItems:", *(_QWORD *)(a1 + 40));
}

uint64_t __96__SOClockAlarmObserver_clockItemStorageDidUpdate_insertedItemIDs_updatedItemIDs_deletedItemIDs___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "clockAlarmObserver:snapshotDidUpdateFrom:to:", a1[4], a1[5], a1[6]);
}

uint64_t __34__SOClockAlarmObserver_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_tearDown");
}

void __56__SOClockAlarmObserver_getFiringAlarmIDsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __55__SOClockAlarmObserver_getAlarmSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[6];
  if (v3)
  {
    v4 = v2[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__SOClockAlarmObserver_getAlarmSnapshotWithCompletion___block_invoke_2;
    v7[3] = &unk_24CE75E20;
    v7[4] = v2;
    v8 = *(id *)(a1 + 40);
    dispatch_group_notify(v3, v4, v7);

  }
  else
  {
    objc_msgSend(v2, "_alarmSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[SOClockAlarmObserver getAlarmSnapshotWithCompletion:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_212A19000, v6, OS_LOG_TYPE_INFO, "%s alarmSnapshot = %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __55__SOClockAlarmObserver_getAlarmSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_alarmSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SOClockAlarmObserver getAlarmSnapshotWithCompletion:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_212A19000, v3, OS_LOG_TYPE_INFO, "%s Notified, alarmSnapshot = %@", (uint8_t *)&v4, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __39__SOClockAlarmObserver_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__SOClockAlarmObserver_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

void __48__SOClockAlarmObserver_initWithInstanceContext___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_setUp");
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__SOClockAlarmObserver_initWithInstanceContext___block_invoke_2;
  v3[3] = &unk_24CE75B10;
  v4 = v2;
  objc_msgSend(v4, "_fetchAlarmsForReason:completion:", CFSTR("initial"), v3);

}

uint64_t __48__SOClockAlarmObserver_initWithInstanceContext___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SOClockAlarmObserver initWithInstanceContext:]_block_invoke_2";
    _os_log_impl(&dword_212A19000, v2, OS_LOG_TYPE_INFO, "%s Initial alarm fetch completed", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_endGroup");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[SOClockAlarmManager warmUp](SOClockAlarmManager, "warmUp");
}

@end

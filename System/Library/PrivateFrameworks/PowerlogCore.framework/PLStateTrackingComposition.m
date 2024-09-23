@implementation PLStateTrackingComposition

void __48__PLStateTrackingComposition_handleStateChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "updateWithEntry:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "setStateChangeMask:", objc_msgSend(*(id *)(a1 + 40), "stateChangeMask") | objc_msgSend(v6, "stateId"));
    objc_msgSend(*(id *)(a1 + 40), "systemStateChangeTime");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stateChangeTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "laterDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSystemStateChangeTime:", v5);

  }
}

uint64_t __50__PLStateTrackingComposition_registerForListeners__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStateChange:", a2);
}

- (void)handleStateChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PLStateTrackingComposition *v13;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    objc_msgSend(v4, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    if (v5)
    {
      objc_msgSend(v10, "entryDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v10;
      if (v6)
      {
        -[PLStateTrackingComposition setStateChangeMask:](self, "setStateChangeMask:", 0);
        -[PLStateTrackingComposition entryKeyToStateMap](self, "entryKeyToStateMap");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "entryKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __48__PLStateTrackingComposition_handleStateChange___block_invoke;
        v11[3] = &unk_1E6A55F30;
        v12 = v10;
        v13 = self;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

        if (-[PLStateTrackingComposition stateChangeMask](self, "stateChangeMask"))
          -[PLStateTrackingComposition triggerBlocks](self, "triggerBlocks");

        v4 = v10;
      }
    }
  }

}

- (unint64_t)stateChangeMask
{
  return self->_stateChangeMask;
}

- (void)setStateChangeMask:(unint64_t)a3
{
  self->_stateChangeMask = a3;
}

- (NSMutableDictionary)entryKeyToStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_49);
  return (id)sharedInstance_instance_3;
}

void __44__PLStateTrackingComposition_sharedInstance__block_invoke()
{
  PLStateTrackingComposition *v0;
  void *v1;

  v0 = objc_alloc_init(PLStateTrackingComposition);
  v1 = (void *)sharedInstance_instance_3;
  sharedInstance_instance_3 = (uint64_t)v0;

}

- (PLStateTrackingComposition)init
{
  PLStateTrackingComposition *v2;
  uint64_t v3;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *executeBlockCache;
  NSMutableArray *v7;
  NSMutableArray *stateChangeNotifications;
  NSMutableDictionary *v9;
  NSMutableDictionary *stateIDToStateMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *entryKeyToStateMap;
  uint64_t v13;
  NSDate *systemStateChangeTime;
  NSObject *v15;
  _QWORD block[4];
  PLStateTrackingComposition *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PLStateTrackingComposition;
  v2 = -[PLStateTrackingComposition init](&v19, sel_init);
  if (v2)
  {
    +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    executeBlockCache = v2->_executeBlockCache;
    v2->_executeBlockCache = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stateChangeNotifications = v2->_stateChangeNotifications;
    v2->_stateChangeNotifications = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stateIDToStateMap = v2->_stateIDToStateMap;
    v2->_stateIDToStateMap = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entryKeyToStateMap = v2->_entryKeyToStateMap;
    v2->_entryKeyToStateMap = v11;

    v2->_stateChangeMask = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = objc_claimAutoreleasedReturnValue();
    systemStateChangeTime = v2->_systemStateChangeTime;
    v2->_systemStateChangeTime = (NSDate *)v13;

    -[PLStateTrackingComposition workQueue](v2, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__PLStateTrackingComposition_init__block_invoke;
    block[3] = &unk_1E6A52050;
    v18 = v2;
    dispatch_async_and_wait(v15, block);

  }
  return v2;
}

uint64_t __34__PLStateTrackingComposition_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "initializeState");
  return objc_msgSend(*(id *)(a1 + 32), "registerForListeners");
}

+ (void)registerState:(Class)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)_registeredStates;
  if (!_registeredStates)
  {
    v5 = objc_opt_new();
    v6 = (void *)_registeredStates;
    _registeredStates = v5;

    v4 = (void *)_registeredStates;
  }
  objc_msgSend(v4, "addObject:", a3);
}

- (void)initializeState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PLStateTrackingComposition_initializeState__block_invoke;
  v2[3] = &unk_1E6A55E90;
  v2[4] = self;
  objc_msgSend((id)_registeredStates, "enumerateObjectsUsingBlock:", v2);
}

void __45__PLStateTrackingComposition_initializeState__block_invoke(uint64_t a1, objc_class *a2)
{
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
  void *v13;
  id v14;

  v14 = objc_alloc_init(a2);
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "stateIDToStateMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "stateId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, v4);

    objc_msgSend(*(id *)(a1 + 32), "entryKeyToStateMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entryKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 32), "entryKeyToStateMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entryKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "entryKeyToStateMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entryKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (void)registerForListeners
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PLStateTrackingComposition entryKeyToStateMap](self, "entryKeyToStateMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PLStateTrackingComposition_registerForListeners__block_invoke;
  v5[3] = &unk_1E6A55D58;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __50__PLStateTrackingComposition_registerForListeners__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PLEntryNotificationOperatorComposition *v4;
  void *v5;
  PLEntryNotificationOperatorComposition *v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  v4 = [PLEntryNotificationOperatorComposition alloc];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PLStateTrackingComposition_registerForListeners__block_invoke_2;
  v8[3] = &unk_1E6A52118;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:withBlock:](v4, "initWithWorkQueue:forEntryKey:withBlock:", v5, v3, v8);

  objc_msgSend(*(id *)(a1 + 32), "stateChangeNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)registerForStates:(unint64_t)a3 withOperator:(id)a4 withBlock:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  unint64_t v14;

  v10 = a4;
  v8 = a5;
  if ((a3 & 0x80) == 0)
  {
    -[PLStateTrackingComposition workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PLStateTrackingComposition_registerForStates_withOperator_withBlock___block_invoke;
    block[3] = &unk_1E6A55EB8;
    block[4] = self;
    v14 = a3;
    v12 = v10;
    v13 = v8;
    dispatch_async_and_wait(v9, block);

  }
}

void __71__PLStateTrackingComposition_registerForStates_withOperator_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  OperatorTask *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OperatorTask *v13;

  objc_msgSend(*(id *)(a1 + 32), "executeBlockCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "executeBlockCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
  v8 = [OperatorTask alloc];
  objc_msgSend(*(id *)(a1 + 40), "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[OperatorTask initWithQueue:withBlock:](v8, "initWithQueue:withBlock:", v9, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "executeBlockCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (void)triggerBlocks
{
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, a1, a3, "Scheduled all agent blocks", a5, a6, a7, a8, 0);
}

void __43__PLStateTrackingComposition_triggerBlocks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  if ((objc_msgSend(*(id *)(a1 + 32), "stateChangeMask") & v3) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "executeBlockCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__PLStateTrackingComposition_triggerBlocks__block_invoke_2;
    v7[3] = &unk_1E6A55EE0;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  }
}

void __43__PLStateTrackingComposition_triggerBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  objc_msgSend(v3, "operatorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PLStateTrackingComposition_triggerBlocks__block_invoke_3;
  block[3] = &unk_1E6A52050;
  v8 = v3;
  v6 = v3;
  dispatch_group_async(v4, v5, block);

}

void __43__PLStateTrackingComposition_triggerBlocks__block_invoke_3(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "operatorBlock");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (BOOL)stateChanged:(unint64_t)a3
{
  return (-[PLStateTrackingComposition stateChangeMask](self, "stateChangeMask") & a3) != 0;
}

- (id)getStateChangeTime:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLStateTrackingComposition stateIDToStateMap](self, "stateIDToStateMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "stateChangeTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLastState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLStateTrackingComposition stateIDToStateMap](self, "stateIDToStateMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "lastValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getCurrState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLStateTrackingComposition stateIDToStateMap](self, "stateIDToStateMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "currValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getStateBeforeSystemStateChange:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLStateTrackingComposition stateIDToStateMap](self, "stateIDToStateMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[PLStateTrackingComposition stateChanged:](self, "stateChanged:", a3))
      objc_msgSend(v7, "lastValue");
    else
      objc_msgSend(v7, "currValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getState:(unint64_t)a3 beforeDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;

  v6 = a4;
  -[PLStateTrackingComposition stateIDToStateMap](self, "stateIDToStateMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "stateChangeTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "stateChangeTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v11);
      v13 = v12;

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v13 <= 0.0)
      {
        if (v15)
          -[PLStateTrackingComposition getState:beforeDate:].cold.2(v9);

        objc_msgSend(v9, "lastValue");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v15)
          -[PLStateTrackingComposition getState:beforeDate:].cold.1(v9);

        objc_msgSend(v9, "currValue");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v10 = (void *)v16;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)executeBlockCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExecuteBlockCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)stateChangeNotifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateChangeNotifications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)systemStateChangeTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSystemStateChangeTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)stateIDToStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStateIDToStateMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setEntryKeyToStateMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryKeyToStateMap, 0);
  objc_storeStrong((id *)&self->_stateIDToStateMap, 0);
  objc_storeStrong((id *)&self->_systemStateChangeTime, 0);
  objc_storeStrong((id *)&self->_stateChangeNotifications, 0);
  objc_storeStrong((id *)&self->_executeBlockCache, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)getState:(void *)a1 beforeDate:.cold.1(void *a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_14_0(&dword_1B6AB6000, v5, v6, "State: %@ Current Value: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8_3();
}

- (void)getState:(void *)a1 beforeDate:.cold.2(void *a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_14_0(&dword_1B6AB6000, v5, v6, "State: %@ Last Value: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8_3();
}

@end

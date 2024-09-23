@implementation HDSPXPCActivityScheduler

- (HDSPXPCActivityScheduler)initWithCallbackScheduler:(id)a3
{
  id v5;
  HDSPXPCActivityScheduler *v6;
  HDSPXPCActivityScheduler *v7;
  NSMutableSet *v8;
  NSMutableSet *eventNames;
  HDSPXPCActivityScheduler *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSPXPCActivityScheduler;
  v6 = -[HDSPXPCActivityScheduler init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackScheduler, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    eventNames = v7->_eventNames;
    v7->_eventNames = v8;

    v7->_eventNamesLock._os_unfair_lock_opaque = 0;
    v10 = v7;
  }

  return v7;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_eventNamesLock;
  void (**v4)(_QWORD);

  p_eventNamesLock = &self->_eventNamesLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_eventNamesLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_eventNamesLock);
}

- (void)scheduleActivity:(id)a3 activityHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  NAScheduler *callbackScheduler;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD handler[4];
  id v21;
  HDSPXPCActivityScheduler *v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v9 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke;
    v24[3] = &unk_24D4E3680;
    v24[4] = self;
    v10 = v8;
    v25 = v10;
    -[HDSPXPCActivityScheduler _withLock:](self, "_withLock:", v24);
    objc_msgSend(v10, "name");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    objc_msgSend(v10, "criteria");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    handler[0] = v9;
    handler[1] = 3221225472;
    handler[2] = __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_2;
    handler[3] = &unk_24D4E5D20;
    v14 = v10;
    v21 = v14;
    v22 = self;
    v15 = v7;
    v23 = v15;
    xpc_activity_register(v12, v13, handler);

    if ((objc_msgSend(v14, "options") & 1) != 0)
    {
      callbackScheduler = self->_callbackScheduler;
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_4;
      v17[3] = &unk_24D4E4520;
      v19 = v15;
      v18 = v14;
      -[NAScheduler performBlock:](callbackScheduler, "performBlock:", v17);

    }
  }

}

void __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HDSPXPCActivity *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HDSPXPCActivity *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  HDSPXPCActivity *v12;
  id v13;

  v3 = a2;
  v4 = [HDSPXPCActivity alloc];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "options");
  objc_msgSend(*(id *)(a1 + 32), "criteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSPXPCActivity initWithEventName:options:criteria:activity:](v4, "initWithEventName:options:criteria:activity:", v5, v6, v7, v3);

  if (!-[HDSPXPCActivity deferIfNecessary](v8, "deferIfNecessary"))
  {
    v9 = *(void **)(a1 + 48);
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_3;
    v11[3] = &unk_24D4E4520;
    v13 = v9;
    v12 = v8;
    objc_msgSend(v10, "performBlock:", v11);

  }
}

uint64_t __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)unscheduleActivities
{
  _QWORD v2[6];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__20;
  v7 = __Block_byref_object_dispose__20;
  v8 = 0;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __48__HDSPXPCActivityScheduler_unscheduleActivities__block_invoke;
  v2[3] = &unk_24D4E3CE8;
  v2[4] = self;
  v2[5] = &v3;
  -[HDSPXPCActivityScheduler _withLock:](self, "_withLock:", v2);
  objc_msgSend((id)v4[5], "na_each:", &__block_literal_global_25);
  _Block_object_dispose(&v3, 8);

}

void __48__HDSPXPCActivityScheduler_unscheduleActivities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48__HDSPXPCActivityScheduler_unscheduleActivities__block_invoke_2(int a1, id a2)
{
  xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (NSMutableSet)eventNames
{
  return self->_eventNames;
}

- (os_unfair_lock_s)eventNamesLock
{
  return self->_eventNamesLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventNames, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
}

@end

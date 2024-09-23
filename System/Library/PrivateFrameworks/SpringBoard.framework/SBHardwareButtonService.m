@implementation SBHardwareButtonService

- (void)_addRegistration:(id)a3 toClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogButtonsInteraction();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Registration add: %{public}@ client:%{public}@", buf, 0x16u);
  }

  v9 = objc_msgSend(v6, "buttonKind");
  objc_msgSend(v7, "registrations");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v6) & 1) == 0)
  {
    if (v10)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = v10;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v15, "buttonKind", (_QWORD)v18) == v9)
            {
              objc_msgSend(v15, "setEventMask:", objc_msgSend(v6, "eventMask"));
              objc_msgSend(v15, "setEventPriority:", objc_msgSend(v6, "eventPriority"));
              v16 = v15;

              v6 = v16;
              goto LABEL_17;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRegistrations:", v10);
    }
    objc_msgSend(v10, "addObject:", v6, (_QWORD)v18);
LABEL_17:
    -[SBHardwareButtonService _mutableRegistrationsForButtonKind:createIfNecessary:](self, "_mutableRegistrationsForButtonKind:createIfNecessary:", v9, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertObject:atIndex:", v6, 0);
    -[SBHardwareButtonService _updateEventMasksForButtonKind:](self, "_updateEventMasksForButtonKind:", v9);

  }
}

void __51__SBHardwareButtonService__process_stateDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "registrations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_updateEventMasksForButtonKind:", objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "buttonKind"));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_process:(id)a3 stateDidUpdate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  int v24;
  int v25;
  NSObject *v26;
  int v27;
  SBHardwareButtonService *v28;
  _QWORD v29[4];
  id v30;
  SBHardwareButtonService *v31;
  uint8_t buf[4];
  _BYTE v33[10];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  SBLogButtonsInteraction();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endowmentNamespaces");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v33 = v6;
    *(_WORD *)&v33[8] = 2114;
    v34 = v7;
    v35 = 2114;
    v36 = v10;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "process %{public}@ update:%{public}@ endowments:%{public}@", buf, 0x20u);

  }
  v27 = objc_msgSend(v6, "pid");
  v28 = self;
  -[BSMutableIntegerMap objectForKey:](self->_clientsByPID, "objectForKey:", v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "taskState");
  v15 = (_QWORD *)MEMORY[0x1E0D22E58];
  if (v14 == 4)
  {
    objc_msgSend(v12, "endowmentNamespaces");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", *v15);

  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v13, "taskState") == 4)
  {
    objc_msgSend(v13, "endowmentNamespaces");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", *v15);

  }
  else
  {
    v19 = 0;
  }
  v20 = objc_msgSend(v11, "canReceiveEvents");
  if (v19 != (_DWORD)v17)
  {
    SBLogButtonsInteraction();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v17)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v33 = v6;
        v23 = "process is running / visible:%{public}@";
LABEL_15:
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
      }
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v33 = v6;
      v23 = "process is not running / not visible:%{public}@";
      goto LABEL_15;
    }

    objc_msgSend(v11, "setRunningVisible:", v17);
  }
  objc_msgSend(v11, "setSuspended:", v14 == 3);
  v24 = objc_msgSend(v11, "canReceiveEvents");
  if (v20 != v24)
  {
    v25 = v24;
    SBLogButtonsInteraction();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v33 = v27;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v20;
      LOWORD(v34) = 1024;
      *(_DWORD *)((char *)&v34 + 2) = v25;
      _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "pid %d canReceiveEvents previously:%{BOOL}u now:%{BOOL}u", buf, 0x14u);
    }

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __51__SBHardwareButtonService__process_stateDidUpdate___block_invoke;
    v29[3] = &unk_1E8E9E820;
    v30 = v11;
    v31 = v28;
    -[SBHardwareButtonService _performButtonRegistrationChangeAndNotifyObservers:](v28, "_performButtonRegistrationChangeAndNotifyObservers:", v29);

  }
}

- (void)_updateEventMasksForButtonKind:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  BSMutableIntegerMap *v14;
  BSMutableIntegerMap *eventMaskPerKind;
  BSMutableIntegerMap *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[SBHardwareButtonService _mutableRegistrationsForButtonKind:createIfNecessary:](self, "_mutableRegistrationsForButtonKind:createIfNecessary:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "client");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "canReceiveEvents");

        if (v13)
          v8 |= objc_msgSend(v11, "eventMask");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (!self->_eventMaskPerKind)
  {
    v14 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    eventMaskPerKind = self->_eventMaskPerKind;
    self->_eventMaskPerKind = v14;

  }
  v16 = self->_eventMaskPerKind;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSMutableIntegerMap setObject:forKey:](v16, "setObject:forKey:", v17, a3);

  }
  else
  {
    -[BSMutableIntegerMap removeObjectForKey:](v16, "removeObjectForKey:", a3);
  }
  SBLogButtonsInteraction();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBSHardwareButtonKind();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2048;
    v27 = v8;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "_updateEventMasksForButtonKind:%{public}@ eventMask:%lX", buf, 0x16u);

  }
}

- (id)_mutableRegistrationsForButtonKind:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  BOOL v8;
  BSMutableIntegerMap *registrationsByButtonKind;
  BSMutableIntegerMap *v10;
  BSMutableIntegerMap *v11;

  v4 = a4;
  -[BSMutableIntegerMap objectForKey:](self->_registrationsByButtonKind, "objectForKey:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    registrationsByButtonKind = self->_registrationsByButtonKind;
    if (!registrationsByButtonKind)
    {
      v10 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
      v11 = self->_registrationsByButtonKind;
      self->_registrationsByButtonKind = v10;

      registrationsByButtonKind = self->_registrationsByButtonKind;
    }
    -[BSMutableIntegerMap setObject:forKey:](registrationsByButtonKind, "setObject:forKey:", v7, a3);
  }
  return v7;
}

- (void)_setSystemServiceClient:(id)a3 buttonKind:(int64_t)a4 eventMask:(unint64_t)a5 priority:(int64_t)a6
{
  id v10;
  int v11;
  void *v12;
  SBButtonConsumerRegistration *v13;
  SBButtonConsumerRegistration *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  SBHardwareButtonService *v20;
  SBButtonConsumerRegistration *v21;
  unint64_t v22;
  int v23;

  v10 = a3;
  v11 = objc_msgSend(v10, "pid");
  -[BSMutableIntegerMap objectForKey:](self->_clientsByPID, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(SBButtonConsumerRegistration);
  -[SBButtonConsumerRegistration setClient:](v13, "setClient:", v12);
  -[SBButtonConsumerRegistration setButtonKind:](v13, "setButtonKind:", a4);
  -[SBButtonConsumerRegistration setEventMask:](v13, "setEventMask:", a5);
  -[SBButtonConsumerRegistration setEventPriority:](v13, "setEventPriority:", a6);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__SBHardwareButtonService__setSystemServiceClient_buttonKind_eventMask_priority___block_invoke;
  v17[3] = &unk_1E8EAC750;
  v21 = v13;
  v22 = a5;
  v18 = v12;
  v19 = v10;
  v23 = v11;
  v20 = self;
  v14 = v13;
  v15 = v10;
  v16 = v12;
  -[SBHardwareButtonService _performButtonRegistrationChangeAndNotifyObservers:](self, "_performButtonRegistrationChangeAndNotifyObservers:", v17);

}

- (void)_performButtonRegistrationChangeAndNotifyObservers:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  BSMutableIntegerMap *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)-[BSMutableIntegerMap copy](self->_eventMaskPerKind, "copy");
  v4[2](v4);
  v6 = self->_eventMaskPerKind;
  for (i = 1; i != 11; ++i)
  {
    objc_msgSend(v5, "objectForKey:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    -[BSMutableIntegerMap objectForKey:](v6, "objectForKey:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    if (v9 != v11)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v12 = self->_observers;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v18;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v18 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "buttonService:buttonKind:eventsConsumedDidChange:", self, i, v11);
          }
          while (v14 != v16);
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v14);
      }

    }
  }

}

void __81__SBHardwareButtonService__setSystemServiceClient_buttonKind_eventMask_priority___block_invoke(uint64_t a1)
{
  SBButtonConsumerClient *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SBButtonConsumerClient *v12;
  SBButtonConsumerClient *v13;

  if (*(_QWORD *)(a1 + 64))
  {
    v2 = (SBButtonConsumerClient *)*(id *)(a1 + 32);
    if (!v2)
    {
      v12 = objc_alloc_init(SBButtonConsumerClient);
      -[SBButtonConsumerClient setSystemServiceClient:](v12, "setSystemServiceClient:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "processHandle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "hasEntitlement:", *MEMORY[0x1E0DAB730]);

      -[SBButtonConsumerClient setEntitledToConsumeButtonsInBackground:](v12, "setEntitledToConsumeButtonsInBackground:", v4);
      objc_msgSend(*(id *)(a1 + 48), "_applicationForClientInfo:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBButtonConsumerClient setApplication:](v12, "setApplication:", v5 != 0);
      v6 = *(void **)(*(_QWORD *)(a1 + 48) + 80);
      if (!v6)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0D017B8]);
        v8 = *(_QWORD *)(a1 + 48);
        v9 = *(void **)(v8 + 80);
        *(_QWORD *)(v8 + 80) = v7;

        v6 = *(void **)(*(_QWORD *)(a1 + 48) + 80);
      }
      objc_msgSend(v6, "setObject:forKey:", v12, *(int *)(a1 + 72));
      objc_msgSend(*(id *)(a1 + 48), "_reconfigureProcessMonitor");

      v2 = v12;
    }
    v13 = v2;
    objc_msgSend(*(id *)(a1 + 56), "setClient:", v2);
    objc_msgSend(*(id *)(a1 + 48), "_addRegistration:toClient:", *(_QWORD *)(a1 + 56), v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_removeRegistration:fromClient:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "registrations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "removeObjectForKey:", *(int *)(a1 + 72));
      objc_msgSend(*(id *)(a1 + 48), "_reconfigureProcessMonitor");
    }
  }
}

- (BOOL)hasConsumersForHomeButtonSinglePress
{
  void *v2;
  int v3;

  -[BSMutableIntegerMap objectForKey:](self->_eventMaskPerKind, "objectForKey:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (*(_QWORD *)&v3 & 0x10002) != 0;
}

- (void)_reconfigureProcessMonitor
{
  id v3;
  BSMutableIntegerMap *clientsByPID;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  clientsByPID = self->_clientsByPID;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SBHardwareButtonService__reconfigureProcessMonitor__block_invoke;
  v6[3] = &unk_1E8EAC6E0;
  v7 = v3;
  v5 = v3;
  -[BSMutableIntegerMap enumerateKeysWithBlock:](clientsByPID, "enumerateKeysWithBlock:", v6);
  -[SBHardwareButtonService _reconfigureProcessMonitorForPredicates:](self, "_reconfigureProcessMonitorForPredicates:", v5);

}

- (void)_reconfigureProcessMonitorForPredicates:(id)a3
{
  id v4;
  RBSProcessMonitor *processMonitor;
  RBSProcessMonitor *v6;
  void *v7;
  RBSProcessMonitor *v8;
  RBSProcessMonitor *v9;
  id v10;
  _QWORD v11[4];
  RBSProcessMonitor *v12;
  _QWORD v13[5];
  RBSProcessMonitor *v14;

  v4 = a3;
  v10 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    processMonitor = self->_processMonitor;
    if (processMonitor)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_4;
      v11[3] = &unk_1E8EA33B0;
      v12 = (RBSProcessMonitor *)v10;
      -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v11);
      v6 = v12;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0D87D90];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke;
      v13[3] = &unk_1E8EA3388;
      v13[4] = self;
      v14 = (RBSProcessMonitor *)v10;
      objc_msgSend(v7, "monitorWithConfiguration:", v13);
      v8 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
      v9 = self->_processMonitor;
      self->_processMonitor = v8;

      v6 = v14;
    }
  }
  else
  {
    -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate", v10);
    v6 = self->_processMonitor;
    self->_processMonitor = 0;
  }

}

- (id)_applicationForClientInfo:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "systemServiceClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pid");

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithPid:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D87DC0];
  v4 = a2;
  objc_msgSend(v3, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0D22E58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndowmentNamespaces:", v6);

  objc_msgSend(v4, "setStateDescriptor:", v5);
  objc_msgSend(v4, "setServiceClass:", 33);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_2;
  v7[3] = &unk_1E8EA3360;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setUpdateHandler:", v7);
  objc_msgSend(v4, "setPredicates:", *(_QWORD *)(a1 + 40));

}

uint64_t __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_process:stateDidUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __87__SBHardwareButtonService_systemServiceServer_client_setEventMask_buttonKind_priority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSystemServiceClient:buttonKind:eventMask:priority:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __53__SBHardwareButtonService__reconfigureProcessMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D87DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateMatchingIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

void __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  BSDispatchMain();

}

- (void)systemServiceServer:(id)a3 client:(id)a4 setEventMask:(unint64_t)a5 buttonKind:(int64_t)a6 priority:(int64_t)a7
{
  id v8;
  FBServiceClientAuthenticator *serviceClientEventConsumerEntitlement;
  int v10;
  char *v11;
  NSObject *v12;
  id v13;
  id v14;

  v8 = a4;
  serviceClientEventConsumerEntitlement = self->_serviceClientEventConsumerEntitlement;
  v14 = 0;
  v10 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientEventConsumerEntitlement, "authenticateClient:error:", v8, &v14);
  v11 = (char *)v14;
  if (v10)
  {
    v13 = v8;
    BSDispatchMain();

  }
  else
  {
    SBLogButtonsInteraction();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHardwareButtonService systemServiceServer:client:setEventMask:buttonKind:priority:].cold.1(v8, v11);

  }
}

+ (SBHardwareButtonService)sharedInstance
{
  if (sharedInstance_onceToken_19 != -1)
    dispatch_once(&sharedInstance_onceToken_19, &__block_literal_global_137);
  return (SBHardwareButtonService *)(id)sharedInstance___sharedInstance_12;
}

void __41__SBHardwareButtonService_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBHardwareButtonService _init]([SBHardwareButtonService alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_12;
  sharedInstance___sharedInstance_12 = (uint64_t)v0;

}

- (id)_initWithSystemServiceServer:(id)a3
{
  id v5;
  SBHardwareButtonService *v6;
  id v7;
  uint64_t v8;
  FBServiceClientAuthenticator *serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator;
  id v10;
  uint64_t v11;
  FBServiceClientAuthenticator *serviceClientEventConsumerEntitlement;
  id v13;
  uint64_t v14;
  FBServiceClientAuthenticator *serviceClientHintViewEntitlement;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBHardwareButtonService;
  v6 = -[SBHardwareButtonService init](&v17, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D22990]);
    v8 = objc_msgSend(v7, "initWithEntitlement:", *MEMORY[0x1E0DAB748]);
    serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator = v6->_serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator;
    v6->_serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator = (FBServiceClientAuthenticator *)v8;

    v10 = objc_alloc(MEMORY[0x1E0D22990]);
    v11 = objc_msgSend(v10, "initWithEntitlement:", *MEMORY[0x1E0DAB740]);
    serviceClientEventConsumerEntitlement = v6->_serviceClientEventConsumerEntitlement;
    v6->_serviceClientEventConsumerEntitlement = (FBServiceClientAuthenticator *)v11;

    v13 = objc_alloc(MEMORY[0x1E0D22990]);
    v14 = objc_msgSend(v13, "initWithEntitlement:", *MEMORY[0x1E0DAB738]);
    serviceClientHintViewEntitlement = v6->_serviceClientHintViewEntitlement;
    v6->_serviceClientHintViewEntitlement = (FBServiceClientAuthenticator *)v14;

    objc_msgSend(v5, "setHardwareButtonDelegate:", v6);
    objc_storeStrong((id *)&v6->_systemServiceServer, a3);
  }

  return v6;
}

- (id)_init
{
  void *v3;
  id v4;

  +[SBSystemServiceServer sharedInstance](SBSystemServiceServer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHardwareButtonService _initWithSystemServiceServer:](self, "_initWithSystemServiceServer:", v3);

  return v4;
}

- (SBHardwareButtonService)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ does not support initialization."), v6);

  return (SBHardwareButtonService *)-[SBHardwareButtonService _init](self, "_init");
}

- (id)addObserver:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  NSMutableArray *observers;
  NSMutableArray *v9;
  NSMutableArray *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  SBHardwareButtonService *v16;
  id v17;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __39__SBHardwareButtonService_addObserver___block_invoke;
  v15 = &unk_1E8EA8488;
  v16 = self;
  v6 = v4;
  v17 = v6;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBHardwareButtonServiceObserver"), CFSTR("buttons!"), &v12);
  observers = self->_observers;
  if (!observers)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_observers;
    self->_observers = v9;

    observers = self->_observers;
  }
  -[NSMutableArray addObject:](observers, "addObject:", v6, v12, v13, v14, v15, v16);

  return v7;
}

uint64_t __39__SBHardwareButtonService_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)hasConsumersForHomeButtonPresses
{
  void *v2;
  uint64_t v3;

  -[BSMutableIntegerMap objectForKey:](self->_eventMaskPerKind, "objectForKey:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3 != 0;
}

- (BOOL)consumeHomeButtonSinglePressUpWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 1, 1, a3);
}

- (BOOL)consumeHomeButtonDoublePressDownWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 2, 1, a3);
}

- (BOOL)consumeHomeButtonTriplePressUpWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 4, 1, a3);
}

- (BOOL)consumeHomeButtonLongPressWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 5, 1, a3);
}

- (BOOL)hasConsumersForLockButtonPresses
{
  void *v2;
  uint64_t v3;

  -[BSMutableIntegerMap objectForKey:](self->_eventMaskPerKind, "objectForKey:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3 != 0;
}

- (BOOL)hasConsumersForLockButtonDoublePressUp
{
  void *v2;
  int v3;

  -[BSMutableIntegerMap objectForKey:](self->_eventMaskPerKind, "objectForKey:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (*(_QWORD *)&v3 & 0x10008) != 0;
}

- (BOOL)consumeLockButtonSinglePressUpWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 1, 2, a3);
}

- (BOOL)consumeLockButtonDoublePressUpWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 3, 2, a3);
}

- (BOOL)consumeLockButtonLongPressWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 5, 2, a3);
}

- (BOOL)consumeVolumeIncreaseButtonSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  uint64_t v13;

  v13 = 0;
  v6 = -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:continuation:](self, "_sendEvent:buttonKind:withPriority:continuation:", 6, 3, a3, &v13);
  v7 = (void *)MEMORY[0x1D17E5550](v13);
  v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__SBHardwareButtonService_consumeVolumeIncreaseButtonSinglePressDownWithPriority_continuation___block_invoke;
    v10[3] = &unk_1E8EA9A80;
    v11 = v7;
    v12 = a3;
    *a4 = (id)MEMORY[0x1D17E5550](v10);

  }
  return v6;
}

uint64_t __95__SBHardwareButtonService_consumeVolumeIncreaseButtonSinglePressDownWithPriority_continuation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, 3, *(_QWORD *)(a1 + 40));
}

- (BOOL)consumeVolumeIncreaseButtonSinglePressUpWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 1, 3, a3);
}

- (BOOL)consumeVolumeDecreaseButtonSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  uint64_t v13;

  v13 = 0;
  v6 = -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:continuation:](self, "_sendEvent:buttonKind:withPriority:continuation:", 6, 4, a3, &v13);
  v7 = (void *)MEMORY[0x1D17E5550](v13);
  v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__SBHardwareButtonService_consumeVolumeDecreaseButtonSinglePressDownWithPriority_continuation___block_invoke;
    v10[3] = &unk_1E8EA9A80;
    v11 = v7;
    v12 = a3;
    *a4 = (id)MEMORY[0x1D17E5550](v10);

  }
  return v6;
}

uint64_t __95__SBHardwareButtonService_consumeVolumeDecreaseButtonSinglePressDownWithPriority_continuation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, 4, *(_QWORD *)(a1 + 40));
}

- (BOOL)consumeVolumeDecreaseButtonSinglePressUpWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 1, 4, a3);
}

- (BOOL)consumeHeadsetPlayPauseSinglePressDownWithPriority:(int64_t)a3 continuation:(id *)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  uint64_t v13;

  v13 = 0;
  v6 = -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:continuation:](self, "_sendEvent:buttonKind:withPriority:continuation:", 6, 5, a3, &v13);
  v7 = (void *)MEMORY[0x1D17E5550](v13);
  v8 = v7;
  if (v6 && v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __91__SBHardwareButtonService_consumeHeadsetPlayPauseSinglePressDownWithPriority_continuation___block_invoke;
    v10[3] = &unk_1E8EA9A80;
    v11 = v7;
    v12 = a3;
    *a4 = (id)MEMORY[0x1D17E5550](v10);

  }
  return v6;
}

uint64_t __91__SBHardwareButtonService_consumeHeadsetPlayPauseSinglePressDownWithPriority_continuation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, 5, *(_QWORD *)(a1 + 40));
}

- (BOOL)consumeHeadsetPlayPauseSinglePressUpWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 1, 5, a3);
}

- (BOOL)consumeRingerSwitchToggleStateOnWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 7, 6, a3);
}

- (BOOL)consumeRingerSwitchToggleStateOffWithPriority:(int64_t)a3
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:](self, "_sendEvent:buttonKind:withPriority:", 8, 6, a3);
}

- (void)_updateAllButtonEventMasks
{
  uint64_t i;

  for (i = 1; i != 11; ++i)
    -[SBHardwareButtonService _updateEventMasksForButtonKind:](self, "_updateEventMasksForButtonKind:", i);
}

uint64_t __67__SBHardwareButtonService__reconfigureProcessMonitorForPredicates___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPredicates:", *(_QWORD *)(a1 + 32));
}

- (id)_mutableRegistrationsForButtonKind:(int64_t)a3
{
  return -[SBHardwareButtonService _mutableRegistrationsForButtonKind:createIfNecessary:](self, "_mutableRegistrationsForButtonKind:createIfNecessary:", a3, 1);
}

- (id)_registrationsForButtonKind:(int64_t)a3
{
  return -[SBHardwareButtonService _mutableRegistrationsForButtonKind:createIfNecessary:](self, "_mutableRegistrationsForButtonKind:createIfNecessary:", a3, 0);
}

- (void)_sendXPCMessageForEvent:(int64_t)a3 buttonKind:(int64_t)a4 priority:(int64_t)a5 toClient:(id)a6
{
  id v10;
  void *v11;
  SBSystemServiceServer *systemServiceServer;
  void *v13;
  NSObject *v14;
  _QWORD v15[7];

  v10 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__SBHardwareButtonService__sendXPCMessageForEvent_buttonKind_priority_toClient___block_invoke;
  v15[3] = &__block_descriptor_56_e33_v16__0__NSObject_OS_xpc_object__8l;
  v15[4] = a3;
  v15[5] = a4;
  v15[6] = a5;
  objc_msgSend(MEMORY[0x1E0D232D0], "messageWithPacker:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  systemServiceServer = self->_systemServiceServer;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacility sendMessage:withType:toClients:](systemServiceServer, "sendMessage:withType:toClients:", v11, 0, v13);

  SBLogButtonsInteraction();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[SBHardwareButtonService _sendXPCMessageForEvent:buttonKind:priority:toClient:].cold.1((uint64_t)v10, v14);

}

void __80__SBHardwareButtonService__sendXPCMessageForEvent_buttonKind_priority_toClient___block_invoke(_QWORD *a1, void *a2)
{
  const char *v3;
  int64_t v4;
  xpc_object_t xdict;

  v3 = (const char *)*MEMORY[0x1E0DAC000];
  v4 = a1[4];
  xdict = a2;
  xpc_dictionary_set_int64(xdict, v3, v4);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0DABFE8], a1[5]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0DAC030], a1[6]);

}

- (BOOL)_sendEvent:(int64_t)a3 buttonKind:(int64_t)a4 withPriority:(int64_t)a5
{
  return -[SBHardwareButtonService _sendEvent:buttonKind:withPriority:continuation:](self, "_sendEvent:buttonKind:withPriority:continuation:", a3, a4, a5, 0);
}

- (BOOL)_sendEvent:(int64_t)a3 buttonKind:(int64_t)a4 withPriority:(int64_t)a5 continuation:(id *)a6
{
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  BOOL v30;
  NSObject *v31;
  SBHardwareButtonService *v32;
  id *v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v35;
  int64_t v37;
  SBHardwareButtonService *v38;
  id *v39;
  id obj;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  _BYTE v49[24];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[SBHardwareButtonService _registrationsForButtonKind:](self, "_registrationsForButtonKind:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogButtonsInteraction();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBSHardwareButtonKind();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v49 = v12;
    *(_WORD *)&v49[8] = 2114;
    *(_QWORD *)&v49[10] = v10;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Registrations for kind:%{public}@ %{public}@", buf, 0x16u);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v13)
  {
    v14 = v13;
    v37 = a4;
    v38 = self;
    v39 = a6;
    v15 = *(_QWORD *)v45;
LABEL_5:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v16);
      objc_msgSend(v17, "client");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "eventPriority");
      if (v19 >= a5)
      {
        if ((objc_msgSend(v18, "canReceiveEvents") & 1) != 0)
        {
          objc_msgSend(v18, "systemServiceClient");
          v21 = objc_claimAutoreleasedReturnValue();
          SBLogButtonsInteraction();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v49 = a3;
            *(_WORD *)&v49[4] = 2114;
            *(_QWORD *)&v49[6] = v18;
            *(_WORD *)&v49[14] = 2114;
            *(_QWORD *)&v49[16] = v17;
            _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "Sending event:%d to %{public}@ (%{public}@)", buf, 0x1Cu);
          }

          v26 = objc_msgSend(v17, "eventMask");
          if ((v26 & (1 << a3)) != 0)
          {
            SBLogButtonsInteraction();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v49 = a3;
              _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, "Sending %d", buf, 8u);
            }

            v32 = v38;
            -[SBHardwareButtonService _sendXPCMessageForEvent:buttonKind:priority:toClient:](v38, "_sendXPCMessageForEvent:buttonKind:priority:toClient:", a3, v37, a5, v21);
            v33 = v39;
            if (v39)
            {
              v43 = MEMORY[0x1E0C809B0];
              v34 = __75__SBHardwareButtonService__sendEvent_buttonKind_withPriority_continuation___block_invoke;
              v35 = &v43;
              goto LABEL_33;
            }
LABEL_34:

            v30 = 1;
            goto LABEL_35;
          }
          v27 = v26;
          SBLogButtonsInteraction();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          if ((v27 & 0x10000) != 0)
          {
            if (v29)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Sending any", buf, 2u);
            }

            v32 = v38;
            -[SBHardwareButtonService _sendXPCMessageForEvent:buttonKind:priority:toClient:](v38, "_sendXPCMessageForEvent:buttonKind:priority:toClient:", a3, v37, a5, v21);
            v33 = v39;
            if (v39)
            {
              v42 = MEMORY[0x1E0C809B0];
              v34 = __75__SBHardwareButtonService__sendEvent_buttonKind_withPriority_continuation___block_invoke_121;
              v35 = &v42;
LABEL_33:
              v35[1] = 3221225472;
              v35[2] = (uint64_t)v34;
              v35[3] = (uint64_t)&unk_1E8EAC728;
              v35[4] = (uint64_t)v32;
              v35[5] = (uint64_t)v21;
              *v33 = (id)MEMORY[0x1D17E5550](v35);

            }
            goto LABEL_34;
          }
          if (v29)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Client doesn't handle this event", buf, 2u);
          }

          goto LABEL_22;
        }
        SBLogButtonsInteraction();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v49 = v18;
          v22 = v21;
          v23 = "Client can't receive events: %{public}@";
          v24 = 12;
          goto LABEL_21;
        }
      }
      else
      {
        v20 = v19;
        SBLogButtonsInteraction();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v49 = v20;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)&v49[6] = a5;
          *(_WORD *)&v49[10] = 2114;
          *(_QWORD *)&v49[12] = v17;
          v22 = v21;
          v23 = "Registration priority %d < required %d: %{public}@";
          v24 = 24;
LABEL_21:
          _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
        }
      }
LABEL_22:

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v14)
          goto LABEL_5;
        break;
      }
    }
  }
  v30 = 0;
LABEL_35:

  return v30;
}

uint64_t __75__SBHardwareButtonService__sendEvent_buttonKind_withPriority_continuation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendXPCMessageForEvent:buttonKind:priority:toClient:", a2, a3, a4, *(_QWORD *)(a1 + 40));
}

uint64_t __75__SBHardwareButtonService__sendEvent_buttonKind_withPriority_continuation___block_invoke_121(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendXPCMessageForEvent:buttonKind:priority:toClient:", a2, a3, a4, *(_QWORD *)(a1 + 40));
}

- (void)_removeRegistration:(id)a3 fromClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  SBHardwareButtonService *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogButtonsInteraction();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = v6;
    v39 = 2114;
    v40 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Registration remove: %{public}@ client:%{public}@", buf, 0x16u);
  }

  v9 = objc_msgSend(v6, "buttonKind");
  v26 = self;
  -[SBHardwareButtonService _mutableRegistrationsForButtonKind:createIfNecessary:](self, "_mutableRegistrationsForButtonKind:createIfNecessary:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v6);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = (void *)objc_msgSend(v10, "copy");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v16, "client");
        v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17 == v7)
          objc_msgSend(v10, "removeObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(v10, "count"))
    -[BSMutableIntegerMap removeObjectForKey:](v26->_registrationsByButtonKind, "removeObjectForKey:", v9);
  objc_msgSend(v7, "registrations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "registrations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        if (objc_msgSend(v25, "buttonKind") == v9)
        {
          objc_msgSend(v18, "removeObject:", v25);
          goto LABEL_24;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_24:

  -[SBHardwareButtonService _updateEventMasksForButtonKind:](v26, "_updateEventMasksForButtonKind:", v9);
}

- (void)systemServiceServer:(id)a3 clientDidDisconnect:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  BSDispatchMain();

}

void __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke_2;
  v5[3] = &unk_1E8E9E820;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "_performButtonRegistrationChangeAndNotifyObservers:", v5);

}

void __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (int)objc_msgSend(*(id *)(a1 + 32), "pid");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke_3;
  v7[3] = &unk_1E8EAC778;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "enumerateWithBlock:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "removeObjectForKey:", v2);
  objc_msgSend(*(id *)(a1 + 40), "_reconfigureProcessMonitor");

}

void __67__SBHardwareButtonService_systemServiceServer_clientDidDisconnect___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_msgSend(v5, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "client");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(a1 + 32);

        if (v12 == v13)
          objc_msgSend(v5, "removeObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 40), "_updateEventMasksForButtonKind:", a2);
}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestsHIDEvents:(BOOL)a5 token:(id)a6 forButtonKind:(int64_t)a7
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a4;
  v11 = a6;
  v9 = v11;
  v10 = v8;
  BSDispatchMain();

}

void __92__SBHardwareButtonService_systemServiceServer_client_requestsHIDEvents_token_forButtonKind___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "pid");
  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend((id)SBApp, "cameraHardwareButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addProcessRequestingCameraButton:token:", v2, *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v4, "removeProcessRequestingCameraButton:", v2);

}

- (void)systemServiceServer:(id)a3 client:(id)a4 setHapticType:(int64_t)a5 buttonKind:(int64_t)a6
{
  id v8;
  FBServiceClientAuthenticator *serviceClientEventConsumerEntitlement;
  int v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  v8 = a4;
  serviceClientEventConsumerEntitlement = self->_serviceClientEventConsumerEntitlement;
  v14 = 0;
  v10 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientEventConsumerEntitlement, "authenticateClient:error:", v8, &v14);
  v11 = (char *)v14;
  if (v10)
  {
    if (a6 == 1)
    {
      BSDispatchMain();
    }
    else
    {
      SBLogButtonsInteraction();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SBHardwareButtonService systemServiceServer:client:setHapticType:buttonKind:].cold.1();

    }
  }
  else
  {
    SBLogButtonsInteraction();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHardwareButtonService systemServiceServer:client:setHapticType:buttonKind:].cold.2(v8, v11);

  }
}

void __79__SBHardwareButtonService_systemServiceServer_client_setHapticType_buttonKind___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)SBApp, "homeHardwareButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHapticType:", *(_QWORD *)(a1 + 32));

}

- (void)systemServiceServer:(id)a3 client:(id)a4 fetchHapticTypeForButtonKind:(int64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  FBServiceClientAuthenticator *serviceClientEventConsumerEntitlement;
  int v15;
  char *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void (**v20)(id, _QWORD);
  id v21;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD))a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonService.m"), 732, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  serviceClientEventConsumerEntitlement = self->_serviceClientEventConsumerEntitlement;
  v21 = 0;
  v15 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientEventConsumerEntitlement, "authenticateClient:error:", v12, &v21);
  v16 = (char *)v21;
  if (!v15)
  {
    SBLogButtonsInteraction();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBHardwareButtonService systemServiceServer:client:fetchHapticTypeForButtonKind:completion:].cold.2(v12, v16);

    goto LABEL_12;
  }
  if (a5 != 1)
  {
    SBLogButtonsInteraction();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SBHardwareButtonService systemServiceServer:client:setHapticType:buttonKind:].cold.1();

LABEL_12:
    v13[2](v13, 0);
    goto LABEL_13;
  }
  v20 = v13;
  BSDispatchMain();

LABEL_13:
}

void __94__SBHardwareButtonService_systemServiceServer_client_fetchHapticTypeForButtonKind_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)SBApp, "homeHardwareButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(v2, "hapticType"));

}

- (void)systemServiceServer:(id)a3 client:(id)a4 acquireAssertionOfType:(int64_t)a5 forReason:(id)a6 withCompletion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  FBServiceClientAuthenticator *v18;
  int v19;
  id v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  int64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke;
  v26[3] = &unk_1E8EA10F0;
  v30 = a5;
  v14 = v12;
  v27 = v14;
  v15 = v11;
  v28 = v15;
  v16 = v13;
  v29 = v16;
  v17 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v26);
  if (a5)
    v18 = 0;
  else
    v18 = self->_serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator;
  v25 = 0;
  v19 = -[FBServiceClientAuthenticator authenticateClient:error:](v18, "authenticateClient:error:", v15, &v25);
  v20 = v25;
  if (v19)
  {
    v17[2](v17);
  }
  else
  {
    SBLogButtonsInteraction();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pid");
      BSProcessDescriptionForPID();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v23;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v20;
      _os_log_error_impl(&dword_1D0540000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to acquire hardware button assertion: %@", buf, 0x20u);

    }
    (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
  }

}

void __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13[2];
  id location;

  if (*(_QWORD *)(a1 + 56))
    v2 = 0;
  else
    v2 = CFSTR("HomeHardwareButtonHintSuppressionAssertion");
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v8, "setObject:forSetting:", v2, 1);
  objc_msgSend(v8, "setObject:forSetting:", v6, 2);
  objc_msgSend(v8, "setObject:forSetting:", v7, 3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01698]), "initWithInfo:timeout:forResponseOnQueue:withHandler:", v8, 0, &__block_literal_global_143, 0.0);
  objc_initWeak(&location, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke_3;
  v12[3] = &unk_1E8EAA320;
  v13[1] = *(id *)(a1 + 56);
  objc_copyWeak(v13, &location);
  objc_msgSend(v9, "setInvalidationHandler:", v12);
  v10 = v9;
  v11 = *(id *)(a1 + 48);
  BSDispatchMain();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

void __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke_3(uint64_t a1)
{
  id v1[2];

  v1[1] = *(id *)(a1 + 40);
  objc_copyWeak(v1, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(v1);
}

void __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)SBApp, "homeHardwareButton");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "removeHintSuppressionAssertion:", WeakRetained);

  }
}

uint64_t __102__SBHardwareButtonService_systemServiceServer_client_acquireAssertionOfType_forReason_withCompletion___block_invoke_5(_QWORD *a1)
{
  void *v2;

  if (!a1[6])
  {
    objc_msgSend((id)SBApp, "homeHardwareButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addHintSuppressionAssertion:", a1[4]);

  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (BOOL)_hwButtonHintViewsSupported
{
  void *v2;
  char v3;
  void *v4;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "deviceSupportsHWButtonBezelEffects") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "BOOLForKey:", CFSTR("SBHardwareButtonHintDropletsEnabled"));

  }
  return v3;
}

- (BOOL)systemServiceServer:(id)a3 getHintViewsSupportedForClient:(id)a4
{
  id v5;
  FBServiceClientAuthenticator *serviceClientHintViewEntitlement;
  int v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  v15 = 0;
  v7 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientHintViewEntitlement, "authenticateClient:error:", v5, &v15);
  v8 = v15;
  if (v7)
  {
    v9 = -[SBHardwareButtonService _hwButtonHintViewsSupported](self, "_hwButtonHintViewsSupported");
  }
  else
  {
    SBLogButtonsInteraction();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pid");
      BSProcessDescriptionForPID();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v8;
      _os_log_error_impl(&dword_1D0540000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to query hardware button service: %@", buf, 0x20u);

    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)systemServiceServer:(id)a3 client:(id)a4 registerAssociatedHintViewContextId:(unsigned int)a5 renderId:(unint64_t)a6 size:(CGSize)a7 buttonKind:(int64_t)a8 clientPort:(id)a9
{
  id v11;
  id v12;
  FBServiceClientAuthenticator *serviceClientHintViewEntitlement;
  int v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a9;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  v24 = 0;
  v14 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientHintViewEntitlement, "authenticateClient:error:", v11, &v24);
  v15 = v24;
  if (!v14)
  {
    SBLogButtonsInteraction();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pid");
      BSProcessDescriptionForPID();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBSHardwareButtonKind();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      v29 = 2114;
      v30 = v22;
      v31 = 2112;
      v32 = v15;
      _os_log_error_impl(&dword_1D0540000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to add hint view to %{public}@ button: %@", buf, 0x2Au);

    }
    goto LABEL_7;
  }
  if (!-[SBHardwareButtonService _hwButtonHintViewsSupported](self, "_hwButtonHintViewsSupported"))
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v23 = v12;
  BSDispatchMain();

  v16 = 1;
LABEL_8:

  return v16;
}

void __126__SBHardwareButtonService_systemServiceServer_client_registerAssociatedHintViewContextId_renderId_size_buttonKind_clientPort___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE58]), "initWithFrame:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v2, "portalLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceContextId:", *(unsigned int *)(a1 + 80));

  objc_msgSend(v2, "portalLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceLayerRenderId:", *(_QWORD *)(a1 + 64));

  objc_msgSend(v2, "setHidesSourceView:", 1);
  objc_msgSend(v2, "setMatchesAlpha:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hardwareButtonBezelEffectsCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associateHintView:withButton:", v2, *(_QWORD *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D01810];
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __126__SBHardwareButtonService_systemServiceServer_client_registerAssociatedHintViewContextId_renderId_size_buttonKind_clientPort___block_invoke_2;
  v10[3] = &unk_1E8E9DED8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "monitorSendRight:withHandler:", v8, v10);

}

void __126__SBHardwareButtonService_systemServiceServer_client_registerAssociatedHintViewContextId_renderId_size_buttonKind_clientPort___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __126__SBHardwareButtonService_systemServiceServer_client_registerAssociatedHintViewContextId_renderId_size_buttonKind_clientPort___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)systemServiceServer:(id)a3 client:(id)a4 updateHintContentVisibility:(int64_t)a5 forButton:(int64_t)a6 animationSettings:(id)a7
{
  id v10;
  id v11;
  FBServiceClientAuthenticator *serviceClientHintViewEntitlement;
  int v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a7;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  v21 = 0;
  v13 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientHintViewEntitlement, "authenticateClient:error:", v10, &v21);
  v14 = v21;
  if (v13)
  {
    v20 = v11;
    BSDispatchMain();

  }
  else
  {
    SBLogButtonsInteraction();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pid");
      BSProcessDescriptionForPID();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBSHardwareButtonKind();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      v26 = 2048;
      v27 = a5;
      v28 = 2114;
      v29 = v19;
      v30 = 2112;
      v31 = v14;
      _os_log_error_impl(&dword_1D0540000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to update hint content appearance state to %ld for %{public}@ button: %@", buf, 0x34u);

    }
  }

}

void __110__SBHardwareButtonService_systemServiceServer_client_updateHintContentVisibility_forButton_animationSettings___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "_hwButtonHintViewsSupported"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hardwareButtonBezelEffectsCoordinator");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateHintContentVisibility:forButton:animationSettings:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)systemServiceServer:(id)a3 client:(id)a4 requestSystemGlowEffectWithInitialStyle:(int64_t)a5 clientPort:(id)a6
{
  id v8;
  id v9;
  FBServiceClientAuthenticator *serviceClientHintViewEntitlement;
  int v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  v21 = 0;
  v11 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientHintViewEntitlement, "authenticateClient:error:", v8, &v21);
  v12 = v21;
  if (!v11)
  {
    SBLogButtonsInteraction();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pid");
      BSProcessDescriptionForPID();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBSHardwareButtonSystemGlowStyle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      v26 = 2114;
      v27 = v19;
      v28 = 2112;
      v29 = v12;
      _os_log_error_impl(&dword_1D0540000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to add system glow effect to %{public}@ buttons: %@", buf, 0x2Au);

    }
    goto LABEL_7;
  }
  if (!-[SBHardwareButtonService _hwButtonHintViewsSupported](self, "_hwButtonHintViewsSupported"))
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v20 = v9;
  BSDispatchMain();

  v13 = 1;
LABEL_8:

  return v13;
}

void __105__SBHardwareButtonService_systemServiceServer_client_requestSystemGlowEffectWithInitialStyle_clientPort___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1[4] + 64), "hardwareButtonBezelEffectsCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestSystemGlowEffectWithInitialStyle:reason:", a1[6], CFSTR("HardwareButtonService request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D01810];
  v5 = a1[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__SBHardwareButtonService_systemServiceServer_client_requestSystemGlowEffectWithInitialStyle_clientPort___block_invoke_2;
  v7[3] = &unk_1E8E9DED8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "monitorSendRight:withHandler:", v5, v7);

}

void __105__SBHardwareButtonService_systemServiceServer_client_requestSystemGlowEffectWithInitialStyle_clientPort___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

uint64_t __105__SBHardwareButtonService_systemServiceServer_client_requestSystemGlowEffectWithInitialStyle_clientPort___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)systemServiceServer:(id)a3 client:(id)a4 updateSystemGlowStyle:(int64_t)a5
{
  id v6;
  FBServiceClientAuthenticator *serviceClientHintViewEntitlement;
  int v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  serviceClientHintViewEntitlement = self->_serviceClientHintViewEntitlement;
  v15 = 0;
  v8 = -[FBServiceClientAuthenticator authenticateClient:error:](serviceClientHintViewEntitlement, "authenticateClient:error:", v6, &v15);
  v9 = v15;
  if (v8)
  {
    BSDispatchMain();
  }
  else
  {
    SBLogButtonsInteraction();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pid");
      BSProcessDescriptionForPID();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBSHardwareButtonSystemGlowStyle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_1D0540000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Client process [%@] is not approved to update system glow effect to %{public}@: %@", buf, 0x2Au);

    }
  }

}

void __76__SBHardwareButtonService_systemServiceServer_client_updateSystemGlowStyle___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "_hwButtonHintViewsSupported"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "hardwareButtonBezelEffectsCoordinator");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateSystemGlowStyle:", *(_QWORD *)(a1 + 40));

  }
}

- (SBWindowScene)mainWindowScene
{
  return self->_mainWindowScene;
}

- (void)setMainWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_mainWindowScene, a3);
}

- (BSMutableIntegerMap)registrationsByButtonKind
{
  return self->_registrationsByButtonKind;
}

- (void)setRegistrationsByButtonKind:(id)a3
{
  objc_storeStrong((id *)&self->_registrationsByButtonKind, a3);
}

- (BSMutableIntegerMap)clientsByPID
{
  return self->_clientsByPID;
}

- (void)setClientsByPID:(id)a3
{
  objc_storeStrong((id *)&self->_clientsByPID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsByPID, 0);
  objc_storeStrong((id *)&self->_registrationsByButtonKind, 0);
  objc_storeStrong((id *)&self->_mainWindowScene, 0);
  objc_storeStrong((id *)&self->_eventMaskPerKind, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_serviceClientHintViewEntitlement, 0);
  objc_storeStrong((id *)&self->_serviceClientEventConsumerEntitlement, 0);
  objc_storeStrong((id *)&self->_serviceClientHomeHardwareButtonHintSuppressionEntitlementAuthenticator, 0);
  objc_storeStrong((id *)&self->_systemServiceServer, 0);
}

- (void)_sendXPCMessageForEvent:(uint64_t)a1 buttonKind:(NSObject *)a2 priority:toClient:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "XPC send to client:%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)systemServiceServer:(void *)a1 client:(const char *)a2 setEventMask:buttonKind:priority:.cold.1(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_5(a1, a2);
  BSProcessDescriptionForPID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSPrettyFunctionName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_9(&dword_1D0540000, v4, v5, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)systemServiceServer:client:setHapticType:buttonKind:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  NSStringFromSBSHardwareButtonKind();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v1, v2, "Button not supported for haptics:%{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)systemServiceServer:(void *)a1 client:(const char *)a2 setHapticType:buttonKind:.cold.2(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_5(a1, a2);
  BSProcessDescriptionForPID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSPrettyFunctionName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_9(&dword_1D0540000, v4, v5, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)systemServiceServer:(void *)a1 client:(const char *)a2 fetchHapticTypeForButtonKind:completion:.cold.2(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_5(a1, a2);
  BSProcessDescriptionForPID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSPrettyFunctionName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_9(&dword_1D0540000, v4, v5, "Failed to authenticate %{public}@ in %{public}@: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

@end

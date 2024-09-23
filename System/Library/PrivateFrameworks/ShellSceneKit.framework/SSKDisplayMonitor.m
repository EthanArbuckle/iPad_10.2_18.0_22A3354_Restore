@implementation SSKDisplayMonitor

- (SSKDisplayMonitor)init
{
  SSKDisplaySource *v3;
  void *v4;
  SSKDisplaySource *v5;
  SSKDisplayMonitor *v6;

  v3 = [SSKDisplaySource alloc];
  objc_msgSend(MEMORY[0x24BE38058], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SSKDisplaySource initWithDisplayManager:](v3, "initWithDisplayManager:", v4);
  v6 = -[SSKDisplayMonitor initWithDisplaySource:](self, "initWithDisplaySource:", v5);

  return v6;
}

- (SSKDisplayMonitor)initWithDisplaySource:(id)a3
{
  id v5;
  SSKDisplayMonitor *v6;
  SSKDisplayMonitor *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *connectedIdentityToRecordMap;
  uint64_t v10;
  NSHashTable *lock_observers;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSKDisplayMonitor;
  v6 = -[SSKDisplayMonitor init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayManager, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    connectedIdentityToRecordMap = v7->_connectedIdentityToRecordMap;
    v7->_connectedIdentityToRecordMap = v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    lock_observers = v7->_lock_observers;
    v7->_lock_observers = (NSHashTable *)v10;

    -[SSKDisplaySourcing mainConfiguration](v7->_displayManager, "mainConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSKDisplayMonitor _connectToIdentity:withConfiguration:forDisplayManagerInit:](v7, "_connectToIdentity:withConfiguration:forDisplayManagerInit:", v13, v12, 1);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SSKDisplaySourcing removeObserver:](self->_displayManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SSKDisplayMonitor;
  -[SSKDisplayMonitor dealloc](&v3, sel_dealloc);
}

- (void)beginMonitoringForExternalDisplays
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SSKDisplaySourcing addObserver:](self->_displayManager, "addObserver:", self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SSKDisplaySourcing connectedIdentities](self->_displayManager, "connectedIdentities", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_connectedIdentityToRecordMap, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          -[SSKDisplaySourcing configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSKDisplayMonitor _connectToIdentity:withConfiguration:forDisplayManagerInit:](self, "_connectToIdentity:withConfiguration:forDisplayManagerInit:", v8, v10, 1);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)addObserver:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (-[NSHashTable containsObject:](self->_lock_observers, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayMonitor.m"), 101, CFSTR("observer already registered: %@"), v5);

  }
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x24BE0BE98]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", &stru_25171E488);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__SSKDisplayMonitor_addObserver___block_invoke;
  v12[3] = &unk_25171C0B0;
  objc_copyWeak(&v14, &location);
  v8 = v5;
  v13 = v8;
  v9 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", v7, CFSTR("displayCoordinator"), v12);

  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_lock);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __33__SSKDisplayMonitor_addObserver___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  id *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 6;
    v4 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 6);
    objc_msgSend(v4[4], "removeObject:", *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock(v3);
    WeakRetained = (os_unfair_lock_s *)v4;
  }

}

- (void)displaySource:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  SSKLogDisplayMonitor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    _SSKLoggingMethodProem(self, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_flbLoggingDescription");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_245FEA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      (uint8_t *)&v14,
      0x20u);

  }
  objc_msgSend(v8, "hardwareIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_7;
  if ((objc_msgSend(v8, "isMainDisplay") & 1) == 0)
  {
    SSKLogDisplayMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      _SSKLoggingMethodProem(self, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v13;
      v16 = 2114;
      v17 = CFSTR("connecting");
      v18 = 2114;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_error_impl(&dword_245FEA000, v12, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        (uint8_t *)&v14,
        0x2Au);

    }
LABEL_7:

  }
  -[SSKDisplayMonitor _connectToIdentity:withConfiguration:forDisplayManagerInit:](self, "_connectToIdentity:withConfiguration:forDisplayManagerInit:", v7, v8, 0);

}

- (void)_connectToIdentity:(id)a3 withConfiguration:(id)a4 forDisplayManagerInit:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *WeakRetained;
  const char *v14;
  void *v15;
  _SSKDisplayMonitorIdentityRecord *v16;
  void *v17;
  void *v18;
  void (**v19)(void *, void *);
  _QWORD aBlock[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  -[NSMutableDictionary objectForKey:](self->_connectedIdentityToRecordMap, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hardwareIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

    goto LABEL_4;
  }
  if ((objc_msgSend(v10, "isMainDisplay") & 1) != 0)
  {
LABEL_4:
    if (objc_msgSend(v11, "didConnectAtInit"))
    {
      SSKLogDisplayMonitor();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v9;
LABEL_13:
        _os_log_impl(&dword_245FEA000, WeakRetained, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
        goto LABEL_16;
      }
    }
    else
    {
      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayMonitor.m"), 134, CFSTR("told an identity is connecting when we're already tracking it. is frontboard telling us things out of order?: %@"), v9);

      }
      v16 = -[_SSKDisplayMonitorIdentityRecord initWithIdentity:connectedAtInit:]([_SSKDisplayMonitorIdentityRecord alloc], "initWithIdentity:connectedAtInit:", v9, v5);

      -[NSMutableDictionary setObject:forKey:](self->_connectedIdentityToRecordMap, "setObject:forKey:", v16, v9);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", WeakRetained);
      else
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_assert_not_owner(&self->_lock);
      os_unfair_lock_lock(&self->_lock);
      v18 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
      os_unfair_lock_unlock(&self->_lock);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __80__SSKDisplayMonitor__connectToIdentity_withConfiguration_forDisplayManagerInit___block_invoke;
      aBlock[3] = &unk_25171C0D8;
      aBlock[4] = self;
      v21 = v9;
      v22 = v10;
      v19 = (void (**)(void *, void *))_Block_copy(aBlock);
      v19[2](v19, v17);
      v19[2](v19, v18);

      v11 = v16;
    }
    goto LABEL_16;
  }
  SSKLogDisplayMonitor();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v9;
    v14 = "got a connect for an external display that is missing its hardwareIdentifier. ignoring: %{public}@";
    goto LABEL_13;
  }
LABEL_16:

}

void __80__SSKDisplayMonitor__connectToIdentity_withConfiguration_forDisplayManagerInit___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "displayMonitor:didConnectIdentity:withConfiguration:", a1[4], a1[5], a1[6]);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)displaySource:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  NSObject *WeakRetained;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  SSKLogDisplayMonitor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    _SSKLoggingMethodProem(self, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_flbLoggingDescription");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_245FEA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      (uint8_t *)&v16,
      0x20u);

  }
  objc_msgSend(v8, "hardwareIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if ((objc_msgSend(v8, "isMainDisplay") & 1) != 0)
      goto LABEL_8;
    SSKLogDisplayMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      _SSKLoggingMethodProem(self, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v15;
      v18 = 2114;
      v19 = CFSTR("updating");
      v20 = 2114;
      v21 = v7;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_245FEA000, v12, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        (uint8_t *)&v16,
        0x2Au);

    }
  }

LABEL_8:
  -[NSMutableDictionary objectForKey:](self->_connectedIdentityToRecordMap, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject displayMonitor:didUpdateIdentity:withConfiguration:](WeakRetained, "displayMonitor:didUpdateIdentity:withConfiguration:", self, v7, v8);
  }
  else
  {
    SSKLogDisplayMonitor();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v7;
      _os_log_impl(&dword_245FEA000, WeakRetained, OS_LOG_TYPE_DEFAULT, "got an update for an identity that we aren't tracking. ignoring update: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void)displaySource:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(void *, void *);
  id v16;
  void (**v17)(void *, void *);
  id WeakRetained;
  NSObject *v19;
  void *v20;
  os_unfair_lock_s *p_lock;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD aBlock[5];
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[SSKDisplaySourcing configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SSKLogDisplayMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SSKLoggingMethodProem(self, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flbLoggingDescription");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v8;
    v35 = 2114;
    v36 = v9;
    v37 = 2114;
    v38 = v5;
    _os_log_impl(&dword_245FEA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      buf,
      0x20u);

  }
  objc_msgSend(v6, "hardwareIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if ((objc_msgSend(v6, "isMainDisplay") & 1) != 0)
      goto LABEL_8;
    SSKLogDisplayMonitor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      _SSKLoggingMethodProem(self, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v34 = v26;
      v35 = 2114;
      v36 = CFSTR("disconnecting");
      v37 = 2114;
      v38 = v5;
      v39 = 2114;
      v40 = v6;
      _os_log_error_impl(&dword_245FEA000, v10, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        buf,
        0x2Au);

    }
  }

LABEL_8:
  -[NSMutableDictionary objectForKey:](self->_connectedIdentityToRecordMap, "objectForKey:", v5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    v27 = (void *)v11;
    v13 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__SSKDisplayMonitor_displaySource_willDisconnectIdentity___block_invoke;
    aBlock[3] = &unk_25171C100;
    aBlock[4] = self;
    v14 = v5;
    v32 = v14;
    v15 = (void (**)(void *, void *))_Block_copy(aBlock);
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __58__SSKDisplayMonitor_displaySource_willDisconnectIdentity___block_invoke_2;
    v29[3] = &unk_25171C100;
    v29[4] = self;
    v16 = v14;
    v30 = v16;
    v17 = (void (**)(void *, void *))_Block_copy(v29);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v28 = v6;
    if (WeakRetained)
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", WeakRetained);
    else
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    v22 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
    os_unfair_lock_unlock(&self->_lock);
    v15[2](v15, v20);
    v15[2](v15, v22);
    -[NSMutableDictionary removeObjectForKey:](self->_connectedIdentityToRecordMap, "removeObjectForKey:", v16);
    v23 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v23)
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v23);
    else
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27;

    v17[2](v17, v24);
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    v25 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");

    os_unfair_lock_unlock(p_lock);
    v17[2](v17, v25);

    v6 = v28;
  }
  else
  {
    SSKLogDisplayMonitor();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v5;
      _os_log_impl(&dword_245FEA000, v19, OS_LOG_TYPE_DEFAULT, "got a disconnect for an identity that we aren't tracking. ignoring disconnect: %{public}@", buf, 0xCu);
    }

  }
}

void __58__SSKDisplayMonitor_displaySource_willDisconnectIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "displayMonitor:willDisconnectIdentity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __58__SSKDisplayMonitor_displaySource_willDisconnectIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "displayMonitor:didDisconnectIdentity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (SSKDisplayMonitorDelegate)delegate
{
  return (SSKDisplayMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_connectedIdentityToRecordMap, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
}

- (void)updateTransformsWithCompletion:(id)a3
{
  -[SSKDisplaySourcing updateTransformsWithCompletion:](self->_displayManager, "updateTransformsWithCompletion:", a3);
}

- (NSArray)connectedIdentities
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_connectedIdentityToRecordMap, "allKeys");
}

- (FBSDisplayIdentity)mainIdentity
{
  return (FBSDisplayIdentity *)-[SSKDisplaySourcing mainIdentity](self->_displayManager, "mainIdentity");
}

- (id)configurationForIdentity:(id)a3
{
  return (id)-[SSKDisplaySourcing configurationForIdentity:](self->_displayManager, "configurationForIdentity:", a3);
}

@end

@implementation SSKRootDisplayDriver

- (SSKRootDisplayDriver)initWithRootIdentity:(id)a3 transformUpdater:(id)a4 assertionCoordinator:(id)a5 builderClass:(Class)a6
{
  id v12;
  id v13;
  id v14;
  SSKRootDisplayDriver *v15;
  SSKRootDisplayDriver *v16;
  uint64_t v17;
  NSMutableSet *trackedDisplays;
  uint64_t v19;
  NSMapTable *lock_recordsByProfile;
  uint64_t v21;
  NSMapTable *lock_seedsByProfile;
  uint64_t v23;
  NSMapTable *lock_index_recordsByDisplay;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transformUpdater"));

    if (v14)
      goto LABEL_4;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootIdentity"));

  if (!v13)
    goto LABEL_12;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionCoordinator"));

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)SSKRootDisplayDriver;
  v15 = -[SSKRootDisplayDriver init](&v30, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rootIdentity, a3);
    objc_storeStrong((id *)&v16->_assertionCoordinator, a5);
    objc_storeStrong((id *)&v16->_transformUpdater, a4);
    if (!a6)
      a6 = (Class)objc_opt_class();
    v16->_ConfigBuilderClass = a6;
    if ((-[objc_class conformsToProtocol:](a6, "conformsToProtocol:", &unk_25753DC60) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("SSKRootDisplayDriver.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_ConfigBuilderClass conformsToProtocol:@protocol(SSKDisplayConfigurationBuilding)]"));

    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    trackedDisplays = v16->_trackedDisplays;
    v16->_trackedDisplays = (NSMutableSet *)v17;

    v16->_lock._os_unfair_lock_opaque = 0;
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 1);
    lock_recordsByProfile = v16->_lock_recordsByProfile;
    v16->_lock_recordsByProfile = (NSMapTable *)v19;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    lock_seedsByProfile = v16->_lock_seedsByProfile;
    v16->_lock_seedsByProfile = (NSMapTable *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 517, 1);
    lock_index_recordsByDisplay = v16->_lock_index_recordsByDisplay;
    v16->_lock_index_recordsByDisplay = (NSMapTable *)v23;

  }
  return v16;
}

- (void)addProfile:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMapTable *lock_seedsByProfile;
  void *v11;
  SSKDisplayDriverRecord *v12;
  SSKDisplayDriverRecord *v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  FBSDisplayIdentity *rootIdentity;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD aBlock[4];
  id v23;
  SSKRootDisplayDriver *v24;
  id v25[2];
  _BYTE location[12];
  __int16 v27;
  FBSDisplayIdentity *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKRootDisplayDriver addProfile:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("SSKRootDisplayDriver.m"), 92, CFSTR("this call must be made on the main thread"));

  }
  SSKLogRootDisplayDriver();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    _SSKLoggingMethodProem(self, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v16;
    v27 = 2112;
    v28 = rootIdentity;
    v29 = 2114;
    v30 = v5;
    _os_log_debug_impl(&dword_245FEA000, v6, OS_LOG_TYPE_DEBUG, "%@:[%@] profile: %{public}@", location, 0x20u);

  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!self->_rootConfiguration)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 97, CFSTR("attemping to add a profile before a root display is connected. how did you evaluate the profile in the first place?: %@"), v5);

  }
  -[NSMapTable objectForKey:](self->_lock_recordsByProfile, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 100, CFSTR("[%@] trying to add a profile we're already tracking. profile: %@\n preexisting: %@"), self->_rootIdentity, v5, v7);

  }
  -[NSMapTable objectForKey:](self->_lock_seedsByProfile, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  lock_seedsByProfile = self->_lock_seedsByProfile;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](lock_seedsByProfile, "setObject:forKey:", v11, v5);

  LODWORD(v11) = objc_msgSend(v5, "usesRootDisplay");
  v12 = [SSKDisplayDriverRecord alloc];
  if ((_DWORD)v11)
  {
    v13 = -[SSKDisplayDriverRecord initWithProfile:rootDisplay:](v12, "initWithProfile:rootDisplay:", v5, self->_rootIdentity);
    -[NSMapTable setObject:forKey:](self->_lock_recordsByProfile, "setObject:forKey:", v13, v5);
    -[NSMapTable setObject:forKey:](self->_lock_index_recordsByDisplay, "setObject:forKey:", v13, self->_rootIdentity);
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak((id *)location, self);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__SSKRootDisplayDriver_addProfile___block_invoke;
    aBlock[3] = &unk_25171C430;
    objc_copyWeak(v25, (id *)location);
    v14 = v5;
    v25[1] = (id)a2;
    v23 = v14;
    v24 = self;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v14, "shouldTransformConnectingDisplays"))
      -[SSKDisplayTransformUpdating updateTransformsWithCompletion:](self->_transformUpdater, "updateTransformsWithCompletion:", v15);
    else
      v15[2](v15);

    objc_destroyWeak(v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v13 = -[SSKDisplayDriverRecord initWithProfile:](v12, "initWithProfile:", v5);
    -[NSMapTable setObject:forKey:](self->_lock_recordsByProfile, "setObject:forKey:", v13, v5);
    os_unfair_lock_unlock(&self->_lock);
    -[SSKDisplayTransformUpdating updateTransformsWithCompletion:](self->_transformUpdater, "updateTransformsWithCompletion:", 0);
  }

}

void __35__SSKRootDisplayDriver_addProfile___block_invoke(uint64_t a1)
{
  os_unfair_lock *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;

  WeakRetained = (os_unfair_lock *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained + 16;
    v12 = (id *)WeakRetained;
    os_unfair_lock_assert_not_owner(WeakRetained + 16);
    os_unfair_lock_lock(v3);
    objc_msgSend(v12[9], "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v3);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "displayControllerForDisplay:configuration:", v12[2], v12[6]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("SSKRootDisplayDriver.m"), 124, CFSTR("[%@] profile usesRootDisplay=YES but got nil controller: %@"), v12[2], *(_QWORD *)(a1 + 32));

      }
      objc_msgSend(v12[3], "acquireAssertionForDisplay:level:delegate:", v12[2], objc_msgSend(*(id *)(a1 + 32), "priorityLevel"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12[2];
      v8 = v12[6];
      v9 = v12[4];
      +[CADisplayQueue queue](_TtC13ShellSceneKit14CADisplayQueue, "queue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "connectToDisplayIdentity:configuration:displayTransformUpdater:caDisplayQueue:assertion:", v7, v8, v9, v10, v6);

      objc_msgSend(v4, "associateController:assertion:", v5, v6);
    }

    WeakRetained = (os_unfair_lock *)v12;
  }

}

- (void)removeProfile:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  SSKDisplayAssertionCoordinator *assertionCoordinator;
  void *v11;
  void *v12;
  void *v13;
  FBSDisplayIdentity *rootIdentity;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  FBSDisplayIdentity *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SSKLogRootDisplayDriver();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    _SSKLoggingMethodProem(self, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138412802;
    v17 = v13;
    v18 = 2112;
    v19 = rootIdentity;
    v20 = 2114;
    v21 = v5;
    _os_log_debug_impl(&dword_245FEA000, v6, OS_LOG_TYPE_DEBUG, "%@:[%@] profile: %{public}@", buf, 0x20u);

  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_recordsByProfile, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 158, CFSTR("[%@] trying to remove a profile we're not tracking: %@"), self->_rootIdentity, v5);

  }
  objc_msgSend(v7, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "usesRootDisplay");

  if (v9)
  {
    -[NSMapTable removeObjectForKey:](self->_lock_recordsByProfile, "removeObjectForKey:", v5);
    os_unfair_lock_unlock(&self->_lock);
    assertionCoordinator = self->_assertionCoordinator;
    objc_msgSend(v7, "assertion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSKDisplayAssertionCoordinator invalidateAssertion:](assertionCoordinator, "invalidateAssertion:", v11);

    objc_msgSend(v7, "controller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayIdentityDidDisconnect:", self->_rootIdentity);

  }
  else
  {
    objc_msgSend(v7, "dissociateFromController");
    os_unfair_lock_unlock(&self->_lock);
    -[SSKDisplayTransformUpdating updateTransformsWithCompletion:](self->_transformUpdater, "updateTransformsWithCompletion:", 0);
  }

}

- (void)_rootDisplayConnected:(id)a3
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 181, CFSTR("asked to connect a root display that isn't a root [%@]"), v7);

  }
  if ((-[FBSDisplayIdentity isEqual:](self->_rootIdentity, "isEqual:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 182, CFSTR("trying to connect a root identity [%@] when we already have one: [%@]"), v7, self->_rootIdentity);

  }
  if (self->_didConnectRootIdentity)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 183, CFSTR("connecting a root identity when we had one connect before. it probably disconnected, and we shouldn't be getting reused: [%@]"), v7);

  }
  objc_storeStrong((id *)&self->_rootConfiguration, a3);
  self->_didConnectRootIdentity = 1;
  -[NSMutableSet addObject:](self->_trackedDisplays, "addObject:", v7);
  -[SSKDisplayAssertionCoordinator rootDisplayDidConnect:](self->_assertionCoordinator, "rootDisplayDidConnect:", v7);
  if (objc_msgSend(v7, "isMainDisplay"))
  {
    -[SSKDisplayAssertionCoordinator activateAssertionsForDisplay:](self->_assertionCoordinator, "activateAssertionsForDisplay:", v7);
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__SSKRootDisplayDriver__rootDisplayConnected___block_invoke;
    block[3] = &unk_25171C458;
    objc_copyWeak(&v14, &location);
    v13 = v7;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __46__SSKRootDisplayDriver__rootDisplayConnected___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "activateAssertionsForDisplay:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_derivedDisplayConnected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  SSKDisplayTransformUpdating *transformUpdater;
  void *v13;
  void *v14;
  FBSDisplayIdentity *v15;
  void *v16;
  FBSDisplayIdentity *rootIdentity;
  void *v18;
  FBSDisplayIdentity *v19;
  int v20;
  void *v21;
  __int16 v22;
  FBSDisplayIdentity *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_index_recordsByDisplay, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  SSKLogRootDisplayDriver();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    _SSKLoggingMethodProem(self, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    rootIdentity = self->_rootIdentity;
    v20 = 138413058;
    v21 = v16;
    v22 = 2112;
    v23 = rootIdentity;
    v24 = 2114;
    v25 = v5;
    v26 = 2114;
    v27 = v6;
    _os_log_debug_impl(&dword_245FEA000, v7, OS_LOG_TYPE_DEBUG, "%@:[%@] %{public}@ record: %{public}@", (uint8_t *)&v20, 0x2Au);

  }
  if (v6)
  {
    -[NSMutableSet addObject:](self->_trackedDisplays, "addObject:", v5);
    objc_msgSend(v6, "profile");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject displayControllerForDisplay:configuration:](v8, "displayControllerForDisplay:configuration:", v5, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSKDisplayAssertionCoordinator acquireAssertionForDisplay:level:delegate:](self->_assertionCoordinator, "acquireAssertionForDisplay:level:delegate:", self->_rootIdentity, -[NSObject priorityLevel](v8, "priorityLevel"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SSKLogRootDisplayDriver();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      _SSKLoggingMethodProem(self, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_rootIdentity;
      v20 = 138413058;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v10;
      _os_log_debug_impl(&dword_245FEA000, v11, OS_LOG_TYPE_DEBUG, "%@:[%@] --> associating %{public}@ with assertion %{public}@", (uint8_t *)&v20, 0x2Au);

    }
    objc_msgSend(v6, "associateController:assertion:", v9, v10);
    transformUpdater = self->_transformUpdater;
    +[CADisplayQueue queue](_TtC13ShellSceneKit14CADisplayQueue, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectToDisplayIdentity:configuration:displayTransformUpdater:caDisplayQueue:assertion:", v5, v4, transformUpdater, v13, v10);

  }
  else
  {
    SSKLogRootDisplayDriver();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      _SSKLoggingMethodProem(self, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_rootIdentity;
      v20 = 138412802;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_245FEA000, v8, OS_LOG_TYPE_DEFAULT, "%@:[%@] ignoring untracked connecting derived display: [%@]", (uint8_t *)&v20, 0x20u);

    }
  }

}

- (void)displayConnected:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  FBSDisplayIdentity *rootIdentity;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  FBSDisplayIdentity *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKRootDisplayDriver displayConnected:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("SSKRootDisplayDriver.m"), 228, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SSKLogRootDisplayDriver();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    _SSKLoggingMethodProem(self, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138412802;
    v26 = v16;
    v27 = 2112;
    v28 = rootIdentity;
    v29 = 2112;
    v30 = v6;
    _os_log_debug_impl(&dword_245FEA000, v7, OS_LOG_TYPE_DEBUG, "%@:[%@] identity: [%@]", buf, 0x20u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_trackedDisplays;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = 0x24BDD1000uLL;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((SSKDisplaysShareRoot(v6, v14) & 1) == 0)
        {
          objc_msgSend(*(id *)(v12 + 1096), "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 233, CFSTR("connecting display [%@] with different root from already connected display [%@]"), v6, v14, (_QWORD)v20);

          v12 = 0x24BDD1000;
        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v6, "isRootIdentity"))
    -[SSKRootDisplayDriver _rootDisplayConnected:](self, "_rootDisplayConnected:", v5);
  else
    -[SSKRootDisplayDriver _derivedDisplayConnected:](self, "_derivedDisplayConnected:", v5);

}

- (void)displayUpdated:(id)a3
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  FBSDisplayIdentity *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  FBSDisplayIdentity *v18;
  void *v19;
  FBSDisplayIdentity *rootIdentity;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  FBSDisplayIdentity *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKRootDisplayDriver displayUpdated:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SSKRootDisplayDriver.m"), 244, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SSKLogRootDisplayDriver();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    _SSKLoggingMethodProem(self, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138412802;
    v25 = v19;
    v26 = 2112;
    v27 = rootIdentity;
    v28 = 2112;
    v29 = v7;
    _os_log_debug_impl(&dword_245FEA000, v8, OS_LOG_TYPE_DEBUG, "%@:[%@] identity: [%@]", buf, 0x20u);

  }
  if ((SSKDisplaysShareRoot(v7, self->_rootIdentity) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 248, CFSTR("updating display [%@] with different root from ours [%@]"), v7, self->_rootIdentity);

  }
  if (objc_msgSend(v7, "isEqual:", self->_rootIdentity))
    objc_storeStrong((id *)&self->_rootConfiguration, a3);
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_index_recordsByDisplay, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v10 = objc_msgSend(v7, "isEqual:", self->_rootIdentity);
  if (v9)
  {
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v9, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", CFSTR(".DisplayConnected"));

      if ((v12 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = self->_rootIdentity;
        objc_msgSend(v9, "state");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 261, CFSTR("[%@] expected record [%@] to be in state %@ but found in state %@"), v14, v9, CFSTR(".DisplayConnected"), v15);

      }
    }
    objc_msgSend(v9, "controller");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject displayIdentityDidUpdate:configuration:](v16, "displayIdentityDidUpdate:configuration:", v7, v6);
  }
  else
  {
    if ((v10 & 1) != 0)
      goto LABEL_15;
    SSKLogRootDisplayDriver();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      _SSKLoggingMethodProem(self, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self->_rootIdentity;
      *(_DWORD *)buf = 138412802;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_245FEA000, v16, OS_LOG_TYPE_DEFAULT, "%@:[%@] ignoring untracked updating derived display [%@]", buf, 0x20u);

    }
  }

LABEL_15:
}

- (void)displayDisconnected:(id)a3
{
  id v5;
  NSObject *v6;
  FBSDisplayConfiguration *rootConfiguration;
  NSObject *v8;
  NSMapTable *lock_recordsByProfile;
  void *v10;
  NSObject *v11;
  int v12;
  char v13;
  void *v14;
  FBSDisplayIdentity *v15;
  SSKDisplayAssertionCoordinator *assertionCoordinator;
  void *v17;
  void *v18;
  void *v19;
  FBSDisplayIdentity *v20;
  void *v21;
  FBSDisplayIdentity *rootIdentity;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  FBSDisplayIdentity *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKRootDisplayDriver displayDisconnected:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("SSKRootDisplayDriver.m"), 269, CFSTR("this call must be made on the main thread"));

  }
  if ((SSKDisplaysShareRoot(v5, self->_rootIdentity) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 270, CFSTR("updating display [%@] with different root from ours [%@]"), v5, self->_rootIdentity);

  }
  SSKLogRootDisplayDriver();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    _SSKLoggingMethodProem(self, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138412802;
    v29 = v21;
    v30 = 2112;
    v31 = rootIdentity;
    v32 = 2112;
    v33 = v5;
    _os_log_debug_impl(&dword_245FEA000, v6, OS_LOG_TYPE_DEBUG, "%@:[%@] identity: [%@]", buf, 0x20u);

  }
  if ((-[NSMutableSet containsObject:](self->_trackedDisplays, "containsObject:", v5) & 1) != 0)
  {
    if (objc_msgSend(v5, "isEqual:", self->_rootIdentity))
    {
      rootConfiguration = self->_rootConfiguration;
      self->_rootConfiguration = 0;

    }
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    -[NSMapTable objectForKey:](self->_lock_index_recordsByDisplay, "objectForKey:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    lock_recordsByProfile = self->_lock_recordsByProfile;
    -[NSObject profile](v8, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](lock_recordsByProfile, "removeObjectForKey:", v10);

    -[NSMapTable removeObjectForKey:](self->_lock_index_recordsByDisplay, "removeObjectForKey:", v5);
    os_unfair_lock_unlock(&self->_lock);
    -[NSMutableSet removeObject:](self->_trackedDisplays, "removeObject:", v5);
    if (v8)
    {
      -[NSObject state](v8, "state");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "isRootIdentity");
      v13 = -[NSObject isEqual:](v11, "isEqual:", CFSTR(".DisplayConnected"));
      if (v12)
      {
        if ((v13 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 296, CFSTR("[%@] expected record [%@] to be in state %@ but found in state %@"), self->_rootIdentity, v8, CFSTR(".DisplayConnected"), v11);

        }
        -[SSKDisplayAssertionCoordinator rootDisplayDidDisconnect:](self->_assertionCoordinator, "rootDisplayDidDisconnect:", self->_rootIdentity);
      }
      else
      {
        if ((v13 & 1) == 0 && (-[NSObject isEqual:](v11, "isEqual:", CFSTR(".AwaitingDisconnect")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 299, CFSTR("[%@] expected record [%@] to be in state %@ or %@ but found in state %@"), self->_rootIdentity, v8, CFSTR(".DisplayConnected"), CFSTR(".AwaitingDisconnect"), v11);

        }
        assertionCoordinator = self->_assertionCoordinator;
        -[NSObject assertion](v8, "assertion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSKDisplayAssertionCoordinator invalidateAssertion:](assertionCoordinator, "invalidateAssertion:", v17);

      }
      -[NSObject controller](v8, "controller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "displayIdentityDidDisconnect:", v5);

LABEL_24:
      goto LABEL_25;
    }
    if (!objc_msgSend(v5, "isEqual:", self->_rootIdentity))
    {
      SSKLogRootDisplayDriver();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        _SSKLoggingMethodProem(self, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = self->_rootIdentity;
        *(_DWORD *)buf = 138412802;
        v29 = v19;
        v30 = 2112;
        v31 = v20;
        v32 = 2112;
        v33 = v5;
        _os_log_impl(&dword_245FEA000, v11, OS_LOG_TYPE_DEFAULT, "%@:[%@] ignoring untracked disconnecting derived display [%@]", buf, 0x20u);

      }
      goto LABEL_24;
    }
    -[SSKDisplayAssertionCoordinator rootDisplayDidDisconnect:](self->_assertionCoordinator, "rootDisplayDidDisconnect:", self->_rootIdentity);
  }
  else
  {
    SSKLogRootDisplayDriver();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      _SSKLoggingMethodProem(self, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_rootIdentity;
      *(_DWORD *)buf = 138412802;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_245FEA000, v8, OS_LOG_TYPE_DEFAULT, "%@:[%@] ignoring untracked disconnecting display: [%@]", buf, 0x20u);

    }
  }
LABEL_25:

}

- (BOOL)isTrackingProfile:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[NSMapTable objectForKey:](self->_lock_recordsByProfile, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isValid");
  os_unfair_lock_unlock(p_lock);
  return (char)v5;
}

- (BOOL)isTrackingProfileForDisplay:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  BOOL v8;
  void *v10;

  v5 = a3;
  if ((SSKDisplaysShareRoot(v5, self->_rootIdentity) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 322, CFSTR("[%@] being asked if tracking unrelated display [%@]"), self->_rootIdentity, v5);

  }
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_index_recordsByDisplay, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)isTrackingDisplays
{
  return -[NSMutableSet count](self->_trackedDisplays, "count") != 0;
}

- (void)_performWithRecordForDisplay:(id)a3 block:(id)a4
{
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(id, void *))a4;
  if ((SSKDisplaysShareRoot(v11, self->_rootIdentity) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 336, CFSTR("[%@] being asked for record of unrelated display [%@]"), self->_rootIdentity, v11);

  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_index_recordsByDisplay, "objectForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 342, CFSTR("not tracking display %@"), v11);

  }
  v7[2](v7, v8);

  os_unfair_lock_unlock(&self->_lock);
}

- (id)controllerForDisplay:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__SSKRootDisplayDriver_controllerForDisplay___block_invoke;
  v10[3] = &unk_25171C480;
  v10[4] = &v11;
  -[SSKRootDisplayDriver _performWithRecordForDisplay:block:](self, "_performWithRecordForDisplay:block:", v5, v10);
  v6 = (void *)v12[5];
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 356, CFSTR("no controller for display"));

    v6 = (void *)v12[5];
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __45__SSKRootDisplayDriver_controllerForDisplay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "controller");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)profileForDisplay:(id)a3
{
  id v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__SSKRootDisplayDriver_profileForDisplay___block_invoke;
  v8[3] = &unk_25171C4A8;
  v8[5] = &v9;
  v8[6] = a2;
  v8[4] = self;
  -[SSKRootDisplayDriver _performWithRecordForDisplay:block:](self, "_performWithRecordForDisplay:block:", v5, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __42__SSKRootDisplayDriver_profileForDisplay___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "profile");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("SSKRootDisplayDriver.m"), 364, CFSTR("no profile for display"));

  }
}

- (id)transformDisplayConfiguration:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SSKSeededDisplayConfigurationBuilder *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  FBSDisplayIdentity *v19;
  void *v20;
  FBSDisplayIdentity *rootIdentity;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v35;
  FBSDisplayIdentity *v36;
  FBSDisplayIdentity *v37;
  os_unfair_lock_t lock;
  void *v39;
  NSMapTable *obj;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  SSKRootDisplayDriver *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  objc_msgSend(v44, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v5;
  if ((objc_msgSend(v5, "isEqual:", self->_rootIdentity) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 373, CFSTR("[%@] asked to transform display configuration that's not our root: [%@]"), self->_rootIdentity, v44);

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = self->_lock_recordsByProfile;
  v45 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v6 = 0;
  if (v45)
  {
    v43 = *(_QWORD *)v49;
    v46 = self;
    do
    {
      v7 = 0;
      do
      {
        v8 = v6;
        if (*(_QWORD *)v49 != v43)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v7);
        v10 = objc_msgSend(objc_alloc(self->_ConfigBuilderClass), "initWithConfiguration:", v44);
        -[NSMapTable objectForKey:](self->_lock_seedsByProfile, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        v47 = (void *)v10;
        v13 = -[SSKSeededDisplayConfigurationBuilder initWithSeed:builder:]([SSKSeededDisplayConfigurationBuilder alloc], "initWithSeed:builder:", v12, v10);
        objc_msgSend(v9, "transformPhysicalDisplayWithBuilder:", v13);
        SSKExtractFromBuilder(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isRootIdentity");
        v17 = objc_msgSend(v9, "usesRootDisplay");
        if (!v16 || (v17 & 1) != 0)
        {
          if (((v16 | v17 ^ 1) & 1) != 0)
            goto LABEL_14;
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          rootIdentity = v46->_rootIdentity;
          objc_msgSend(v15, "rootIdentity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = rootIdentity;
          self = v46;
            v37,
            v15,
            v20,
            v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v46->_rootIdentity;
          objc_msgSend(v15, "rootIdentity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v19;
          self = v46;
            v36,
            v15,
            v20,
            v9);
        }

LABEL_14:
        if (v8)
          v22 = v16;
        else
          v22 = 0;
        if (v22 == 1)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKRootDisplayDriver.m"), 399, CFSTR("[%@] multiple profiles using root display\nfirst: [%@]\nsecond: [%@]"), self->_rootIdentity, v8, v9);

        }
        if (v16)
          v23 = v9;
        else
          v23 = 0;
        v6 = v23;

        -[NSMapTable objectForKey:](self->_lock_recordsByProfile, "objectForKey:", v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "state");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqual:", CFSTR(".ProfileAdded"));

        if (v26)
        {
          objc_msgSend(v24, "associateDisplay:", v15);
          objc_msgSend(v42, "addObject:", v14);
          -[NSMapTable setObject:forKey:](self->_lock_index_recordsByDisplay, "setObject:forKey:", v24, v15);
          v27 = v47;
        }
        else
        {
          objc_msgSend(v24, "state");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqual:", CFSTR(".DisplayTransformed"));

          v27 = v47;
          if (v29)
          {
            objc_msgSend(v42, "addObject:", v14);
          }
          else
          {
            objc_msgSend(v24, "state");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqual:", CFSTR(".DisplayConnected"));

            if (v31)
            {
              SSKExtractFromBuilder(v13);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v32);

            }
          }
        }

        ++v7;
      }
      while (v45 != v7);
      v45 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v45);
  }

  os_unfair_lock_unlock(lock);
  if (!v6)
    objc_msgSend(v42, "addObject:", v44);

  return v42;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  os_unfair_lock_s *p_lock;
  NSMapTable *lock_recordsByProfile;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SSKRootDisplayDriver *v16;
  _QWORD v17[4];
  id v18;
  SSKRootDisplayDriver *v19;

  v4 = a3;
  v5 = objc_opt_class();
  v13 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v13;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke;
  v17[3] = &unk_25171C128;
  v9 = v7;
  v18 = v9;
  v19 = self;
  objc_msgSend(v9, "appendProem:block:", self, v17);
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  lock_recordsByProfile = self->_lock_recordsByProfile;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke_2;
  v14[3] = &unk_25171C518;
  v15 = v9;
  v16 = self;
  v12 = v9;
  objc_msgSend(v12, "appendCollection:withName:itemBlock:", lock_recordsByProfile, 0, v14);
  os_unfair_lock_unlock(p_lock);

}

id __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0);
}

void __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke_3;
  v7[3] = &unk_25171C4F0;
  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(v5 + 8);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v4, "sameLine:", v7);

}

void __53__SSKRootDisplayDriver_appendDescriptionToFormatter___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "appendProem:block:", v7, &__block_literal_global_1);
  v2 = *(void **)(a1 + 48);
  objc_msgSend(v7, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, 0);

  v5 = (id)objc_msgSend(*(id *)(a1 + 48), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "priorityLevel"), CFSTR("lvl"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 48), "appendPointer:withName:", *(_QWORD *)(a1 + 40), CFSTR("profile"));

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_index_recordsByDisplay, 0);
  objc_storeStrong((id *)&self->_lock_seedsByProfile, 0);
  objc_storeStrong((id *)&self->_lock_recordsByProfile, 0);
  objc_storeStrong((id *)&self->_trackedDisplays, 0);
  objc_storeStrong((id *)&self->_rootConfiguration, 0);
  objc_storeStrong((id *)&self->_transformUpdater, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_rootIdentity, 0);
}

@end

@implementation SSKDisplayProfileRegistry

- (SSKDisplayProfileRegistry)initWithDisplayTransformerRegistry:(id)a3 displayMonitor:(id)a4 assertionCoordinator:(id)a5 builderClass:(Class)a6
{
  id v11;
  id v12;
  id v13;
  SSKDisplayProfileRegistry *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  BSInvalidatable *transformerRegistryToken;
  SSKDisplayAssertionCoordinatorPolicy *v19;
  SSKDisplayAssertionCoordinatorPolicy *assertionCoordinatorPolicy;
  uint64_t v21;
  NSMutableSet *registeredProfiles;
  NSMutableDictionary *v23;
  NSMutableDictionary *lock_rootDisplayDrivers;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayMonitor"));

    if (v13)
      goto LABEL_4;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registry"));

  if (!v12)
    goto LABEL_12;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionCoordinator"));

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)SSKDisplayProfileRegistry;
  v14 = -[SSKDisplayProfileRegistry init](&v30, sel_init);
  if (v14)
  {
    if (!a6)
      a6 = (Class)objc_opt_class();
    v14->_ConfigBuilderClass = a6;
    if ((-[objc_class conformsToProtocol:](a6, "conformsToProtocol:", &unk_25753DC60) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SSKDisplayProfileRegistry.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_ConfigBuilderClass conformsToProtocol:@protocol(SSKDisplayConfigurationBuilding)]"));

    }
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTransformer:withIdentifier:", v14, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    transformerRegistryToken = v14->_transformerRegistryToken;
    v14->_transformerRegistryToken = (BSInvalidatable *)v17;

    objc_storeStrong((id *)&v14->_displayMonitor, a4);
    -[SSKDisplayMonitor setDelegate:](v14->_displayMonitor, "setDelegate:", v14);
    v19 = -[SSKDisplayAssertionCoordinatorPolicy initWithDisplayMonitor:]([SSKDisplayAssertionCoordinatorPolicy alloc], "initWithDisplayMonitor:", v14->_displayMonitor);
    assertionCoordinatorPolicy = v14->_assertionCoordinatorPolicy;
    v14->_assertionCoordinatorPolicy = v19;

    objc_storeStrong((id *)&v14->_assertionCoordinator, a5);
    -[SSKDisplayAssertionCoordinator setDelegate:](v14->_assertionCoordinator, "setDelegate:", v14->_assertionCoordinatorPolicy);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    registeredProfiles = v14->_registeredProfiles;
    v14->_registeredProfiles = (NSMutableSet *)v21;

    v14->_lock._os_unfair_lock_opaque = 0;
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    lock_rootDisplayDrivers = v14->_lock_rootDisplayDrivers;
    v14->_lock_rootDisplayDrivers = v23;

  }
  return v14;
}

- (SSKDisplayProfileRegistry)initWithDisplayTransformerRegistry:(id)a3
{
  id v4;
  SSKDisplayMonitor *v5;
  SSKDisplayAssertionCoordinator *v6;
  SSKDisplayProfileRegistry *v7;

  v4 = a3;
  v5 = objc_alloc_init(SSKDisplayMonitor);
  v6 = objc_alloc_init(SSKDisplayAssertionCoordinator);
  v7 = -[SSKDisplayProfileRegistry initWithDisplayTransformerRegistry:displayMonitor:assertionCoordinator:builderClass:](self, "initWithDisplayTransformerRegistry:displayMonitor:assertionCoordinator:builderClass:", v4, v5, v6, self->_ConfigBuilderClass);

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

- (void)activate
{
  SSKDisplayMonitor *displayMonitor;
  void *v4;
  id v5;

  -[SSKDisplayMonitor mainIdentity](self->_displayMonitor, "mainIdentity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  displayMonitor = self->_displayMonitor;
  -[SSKDisplayMonitor configurationForIdentity:](displayMonitor, "configurationForIdentity:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSKDisplayProfileRegistry displayMonitor:didConnectIdentity:withConfiguration:](self, "displayMonitor:didConnectIdentity:withConfiguration:", displayMonitor, v5, v4);

  -[SSKDisplayMonitor beginMonitoringForExternalDisplays](self->_displayMonitor, "beginMonitoringForExternalDisplays");
}

- (void)evaluateProfilesForConnectedDisplays
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKDisplayProfileRegistry evaluateProfilesForConnectedDisplays]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SSKDisplayProfileRegistry.m"), 96, CFSTR("this call must be made on the main thread"));

  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v3 = (void *)-[NSMutableDictionary copy](self->_lock_rootDisplayDrivers, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSKDisplayMonitor configurationForIdentity:](self->_displayMonitor, "configurationForIdentity:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = self->_registeredProfiles;
        v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              -[SSKDisplayProfileRegistry _evaluateForPhysicalDisplay:driver:profile:](self, "_evaluateForPhysicalDisplay:driver:profile:", v10, v9, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j));
            }
            v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

}

- (void)registerDisplayProfile:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (v5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKDisplayProfileRegistry registerDisplayProfile:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SSKDisplayProfileRegistry.m"), 111, CFSTR("this call must be made on the main thread"));

    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayProfile"));

LABEL_3:
  if (-[NSMutableSet containsObject:](self->_registeredProfiles, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 113, CFSTR("attempting to register same profile twice: %@"), v5);

  }
  -[NSMutableSet addObject:](self->_registeredProfiles, "addObject:", v5);
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary copy](self->_lock_rootDisplayDrivers, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSKDisplayMonitor configurationForIdentity:](self->_displayMonitor, "configurationForIdentity:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSKDisplayProfileRegistry _evaluateForPhysicalDisplay:driver:profile:](self, "_evaluateForPhysicalDisplay:driver:profile:", v14, v13, v5);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (id)displayProfileForIdentity:(id)a3
{
  id v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (v5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKDisplayProfileRegistry displayProfileForIdentity:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SSKDisplayProfileRegistry.m"), 127, CFSTR("this call must be made on the main thread"));

    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

LABEL_3:
  objc_msgSend(v5, "rootIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_rootDisplayDrivers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isTrackingProfileForDisplay:", v5))
  {
    objc_msgSend(v8, "profileForDisplay:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  SSKRootDisplayDriver *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "rootIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_rootDisplayDrivers, "objectForKey:", v9);
  v10 = (SSKRootDisplayDriver *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = -[SSKRootDisplayDriver initWithRootIdentity:transformUpdater:assertionCoordinator:builderClass:]([SSKRootDisplayDriver alloc], "initWithRootIdentity:transformUpdater:assertionCoordinator:builderClass:", v9, self->_displayMonitor, self->_assertionCoordinator, self->_ConfigBuilderClass);
    -[NSMutableDictionary setObject:forKey:](self->_lock_rootDisplayDrivers, "setObject:forKey:", v10, v9);
  }
  os_unfair_lock_unlock(&self->_lock);
  -[SSKRootDisplayDriver displayConnected:](v10, "displayConnected:", v8);
  if (objc_msgSend(v7, "isRootIdentity"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_registeredProfiles;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[SSKDisplayProfileRegistry _evaluateForPhysicalDisplay:driver:profile:](self, "_evaluateForPhysicalDisplay:driver:profile:", v8, v10, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  objc_msgSend(v13, "rootIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_rootDisplayDrivers, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allKeys](self->_lock_rootDisplayDrivers, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 174, CFSTR("told a display [%@] -> root: [%@] is updating but we don't have a driver for it, currently have drivers for %@"), v13, v9, v12);

  }
  objc_msgSend(v10, "displayUpdated:", v8);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)displayMonitor:(id)a3 didDisconnectIdentity:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "rootIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_rootDisplayDrivers, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allKeys](self->_lock_rootDisplayDrivers, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 186, CFSTR("told a display [%@] -> root: [%@] is disconnecting but we don't have a driver for it, currently have drivers for %@"), v10, v6, v9);

  }
  objc_msgSend(v7, "displayDisconnected:", v10);
  if ((objc_msgSend(v7, "isTrackingDisplays") & 1) == 0)
    -[NSMutableDictionary removeObjectForKey:](self->_lock_rootDisplayDrivers, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)transformDisplayConfiguration:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 206, CFSTR("asked to transform a non-root identity [%@]"), v7);

  }
  -[NSMutableDictionary objectForKey:](self->_lock_rootDisplayDrivers, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "transformDisplayConfiguration:", v5);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "identity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v14);
  }

  SSKLogDisplayTransforming();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "identity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138544130;
    v28 = v20;
    v29 = 2114;
    v30 = v9;
    v31 = 2048;
    v32 = v21;
    v33 = 2114;
    v34 = v11;
    _os_log_debug_impl(&dword_245FEA000, v18, OS_LOG_TYPE_DEBUG, "Asked to transform %{public}@ and we're using the driver: %{public}@ and we got back %lu identities: %{public}@", buf, 0x2Au);

  }
  return v12;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSMutableSet *registeredProfiles;
  uint64_t v9;
  id v10;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_rootDisplayDrivers;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = objc_opt_class();
  v14 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v14;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  registeredProfiles = self->_registeredProfiles;
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__SSKDisplayProfileRegistry_appendDescriptionToFormatter___block_invoke;
  v17[3] = &unk_25171C150;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v10, "appendCollection:withName:itemBlock:", registeredProfiles, CFSTR("Registered Profiles"), v17);
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  lock_rootDisplayDrivers = self->_lock_rootDisplayDrivers;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __58__SSKDisplayProfileRegistry_appendDescriptionToFormatter___block_invoke_2;
  v15[3] = &unk_25171C178;
  v16 = v10;
  v13 = v10;
  objc_msgSend(v13, "appendDictionary:withName:itemBlock:", lock_rootDisplayDrivers, CFSTR("Display Drivers"), v15);
  os_unfair_lock_unlock(p_lock);

}

id __58__SSKDisplayProfileRegistry_appendDescriptionToFormatter___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", a2, 0);
}

id __58__SSKDisplayProfileRegistry_appendDescriptionToFormatter___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", a3, 0);
}

- (void)_evaluateForPhysicalDisplay:(id)a3 driver:(id)a4 profile:(id)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isRootIdentity");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[rootConfig identity] isRootIdentity]"));

  }
  v13 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("driver"));

    v13 = 0;
    if (v9)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayProfileRegistry.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

    v13 = v19;
    goto LABEL_5;
  }
  if (!v9)
    goto LABEL_12;
LABEL_5:
  v14 = objc_msgSend(v13, "isTrackingProfile:", v9);
  v15 = objc_msgSend(v9, "evaluatePhysicalDisplay:", v10);

  if (!v14 || (v15 & 1) != 0)
  {
    if (((v14 | v15 ^ 1) & 1) == 0)
      objc_msgSend(v19, "addProfile:", v9);
  }
  else
  {
    objc_msgSend(v19, "removeProfile:", v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_rootDisplayDrivers, 0);
  objc_storeStrong((id *)&self->_registeredProfiles, 0);
  objc_storeStrong((id *)&self->_assertionCoordinatorPolicy, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_transformerRegistryToken, 0);
}

@end

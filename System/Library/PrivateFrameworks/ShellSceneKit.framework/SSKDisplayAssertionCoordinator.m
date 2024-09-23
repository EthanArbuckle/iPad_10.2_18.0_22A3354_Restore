@implementation SSKDisplayAssertionCoordinator

- (SSKDisplayAssertionCoordinator)init
{
  SSKDisplayAssertionCoordinator *v2;
  uint64_t v3;
  NSMutableDictionary *assertionStackMap;
  uint64_t v5;
  NSMutableDictionary *assertionPreferencesMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSKDisplayAssertionCoordinator;
  v2 = -[SSKDisplayAssertionCoordinator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    assertionStackMap = v2->_assertionStackMap;
    v2->_assertionStackMap = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    assertionPreferencesMap = v2->_assertionPreferencesMap;
    v2->_assertionPreferencesMap = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *assertionStackMap;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_assertionStackMap;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidateForDisplayDisconnect");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  assertionStackMap = self->_assertionStackMap;
  self->_assertionStackMap = 0;

  v10.receiver = self;
  v10.super_class = (Class)SSKDisplayAssertionCoordinator;
  -[SSKDisplayAssertionCoordinator dealloc](&v10, sel_dealloc);
}

- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;

  v9 = a5;
  v10 = a3;
  if ((objc_msgSend(v10, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SSKDisplayPriorityIsValid(assertionLevel)"));

    if (v9)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionDelegate"));

    goto LABEL_5;
  }
  if (!v9)
    goto LABEL_7;
LABEL_5:
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "acquireAssertionForDisplay:level:delegate:", v10, a4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)activateAssertionsForDisplay:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  SSKLogDisplayAssertions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SSKLoggingMethodProem(self, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_245FEA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ activating assertions for display %{public}@", buf, 0x16u);

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateAssertionsForDisplay:", v5);

}

- (void)rootDisplayDidConnect:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 58, CFSTR("told multiple times about a connecting display: %@"), v5);

  }
  SSKLogDisplayAssertions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SSKLoggingMethodProem(self, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_245FEA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told root display connected %{public}@", buf, 0x16u);

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SSKDisplayAssertionCoordinator _createDisplayAssertionStackForRootDisplay:](self, "_createDisplayAssertionStackForRootDisplay:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_assertionStackMap, "setObject:forKey:", v10, v5);

  }
}

- (void)rootDisplayDidDisconnect:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 68, CFSTR("told about a disconnecting display that we don't know about. were we told it disconnected twice?: %@"), v5);

  }
  SSKLogDisplayAssertions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SSKLoggingMethodProem(self, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_245FEA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told root display disconnected %{public}@", buf, 0x16u);

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_assertionStackMap, "removeObjectForKey:", v5);
  -[NSMutableDictionary objectForKey:](self->_assertionPreferencesMap, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_assertionPreferencesMap, "removeObjectForKey:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "assertionCoordinator:updatedAssertionPreferences:oldPreferences:forDisplay:", self, 0, v10, v5);

  }
  objc_msgSend(v9, "invalidateForDisplayDisconnect");

}

- (void)invalidateAssertion:(id)a3
{
  id v5;
  NSMutableDictionary *assertionStackMap;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

    v5 = 0;
  }
  assertionStackMap = self->_assertionStackMap;
  objc_msgSend(v5, "rootDisplayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](assertionStackMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "invalidateAssertion:", v10);
}

- (void)assertionStack:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5
{
  id v8;
  void *v9;
  NSMutableDictionary *assertionPreferencesMap;
  id WeakRetained;
  id v12;

  v12 = a4;
  v8 = a5;
  objc_msgSend(a3, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  assertionPreferencesMap = self->_assertionPreferencesMap;
  if (v12)
    -[NSMutableDictionary setObject:forKey:](assertionPreferencesMap, "setObject:forKey:", v12, v9);
  else
    -[NSMutableDictionary removeObjectForKey:](assertionPreferencesMap, "removeObjectForKey:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "assertionCoordinator:updatedAssertionPreferences:oldPreferences:forDisplay:", self, v12, v8, v9);

}

- (id)_createDisplayAssertionStackForRootDisplay:(id)a3
{
  id v5;
  void *v6;
  _SSKDisplayAssertionStack *v7;
  void *v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayAssertionCoordinator.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_assertionStackMap objectForKey:rootIdentity] == nil"));

  }
  v7 = -[_SSKDisplayAssertionStack initWithRootDisplay:delegate:]([_SSKDisplayAssertionStack alloc], "initWithRootDisplay:delegate:", v5, self);

  return v7;
}

- (SSKDisplayAssertionCoordinatorDelegate)delegate
{
  return (SSKDisplayAssertionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertionPreferencesMap, 0);
  objc_storeStrong((id *)&self->_assertionStackMap, 0);
}

@end

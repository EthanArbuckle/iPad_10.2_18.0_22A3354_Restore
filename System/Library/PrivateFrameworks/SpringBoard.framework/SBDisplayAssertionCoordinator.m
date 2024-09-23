@implementation SBDisplayAssertionCoordinator

- (SBDisplayAssertionCoordinator)init
{
  SBDisplayAssertionCoordinator *v2;
  uint64_t v3;
  NSMutableDictionary *assertionStackMap;
  uint64_t v5;
  NSMutableDictionary *assertionPreferencesMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDisplayAssertionCoordinator;
  v2 = -[SBDisplayAssertionCoordinator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    assertionStackMap = v2->_assertionStackMap;
    v2->_assertionStackMap = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
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

  v16 = *MEMORY[0x1E0C80C00];
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
  v10.super_class = (Class)SBDisplayAssertionCoordinator;
  -[SBDisplayAssertionCoordinator dealloc](&v10, sel_dealloc);
}

- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 delegate:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v11 = a6;
  v12 = a3;
  if ((objc_msgSend(v12, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  if (!SBDisplayAssertionLevelIsValid(a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBDisplayAssertionLevelIsValid(assertionLevel)"));

    if (v11)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionDelegate"));

    goto LABEL_5;
  }
  if (!v11)
    goto LABEL_7;
LABEL_5:
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "acquireAssertionForDisplay:level:deactivationReasons:delegate:", v12, a4, a5, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  SBLogDisplayAssertions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ activating assertions for display %{public}@", buf, 0x16u);

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

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 61, CFSTR("told multiple times about a connecting display: %@"), v5);

  }
  SBLogDisplayAssertions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told root display connected %{public}@", buf, 0x16u);

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SBDisplayAssertionCoordinator _createDisplayAssertionStackForRootDisplay:](self, "_createDisplayAssertionStackForRootDisplay:", v5);
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

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 71, CFSTR("told about a disconnecting display that we don't know about. were we told it disconnected twice?: %@"), v5);

  }
  SBLogDisplayAssertions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told root display disconnected %{public}@", buf, 0x16u);

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

- (void)invalidateAssertionForDerivedDisplayDisconnect:(id)a3
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
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

    v5 = 0;
  }
  assertionStackMap = self->_assertionStackMap;
  objc_msgSend(v5, "rootDisplayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](assertionStackMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "invalidateAssertionForDerivedDisplayDisconnect:", v10);
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
  _SBDisplayAssertionStack *v7;
  void *v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_assertionStackMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAssertionCoordinator.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_assertionStackMap objectForKey:rootIdentity] == nil"));

  }
  v7 = -[_SBDisplayAssertionStack initWithRootDisplay:delegate:]([_SBDisplayAssertionStack alloc], "initWithRootDisplay:delegate:", v5, self);

  return v7;
}

- (SBDisplayAssertionCoordinatorDelegate)delegate
{
  return (SBDisplayAssertionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

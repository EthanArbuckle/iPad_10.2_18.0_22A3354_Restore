@implementation _SSKDisplayAssertionStack

- (_SSKDisplayAssertionStack)initWithRootDisplay:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  _SSKDisplayAssertionStack *v10;
  _SSKDisplayAssertionStack *v11;
  uint64_t v12;
  NSMapTable *assertionControlPreferences;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isRootIdentity") & 1) != 0)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)_SSKDisplayAssertionStack;
  v10 = -[_SSKDisplayAssertionStack init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_rootIdentity, a3);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_invalidated = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 512, 0x10000);
    v12 = objc_claimAutoreleasedReturnValue();
    assertionControlPreferences = v11->_assertionControlPreferences;
    v11->_assertionControlPreferences = (NSMapTable *)v12;

  }
  return v11;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5.receiver = self;
  v5.super_class = (Class)_SSKDisplayAssertionStack;
  -[_SSKDisplayAssertionStack dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_rootIdentity, CFSTR("display"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)activateAssertionsForDisplay:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((-[FBSDisplayIdentity isEqual:](self->_rootIdentity, "isEqual:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_rootIdentity isEqual:rootIdentity]"));

  }
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_invalidated"));

  }
  if (self->_activated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_activated"));

  }
  SSKLogDisplayAssertions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_245FEA000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] activating assertions for display", buf, 0xCu);
  }

  self->_activated = 1;
  v7 = objc_alloc_init(MEMORY[0x24BDD1650]);
  -[_SSKDisplayAssertionStack _evalAndApplyOldPreferences:newPreferences:](self, "_evalAndApplyOldPreferences:newPreferences:", v7, self->_assertionControlPreferences);

}

- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  NSMapTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  id v20;
  NSObject *v21;
  FBSDisplayIdentity *rootIdentity;
  SSKDisplayAssertionPreferences *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  FBSDisplayIdentity *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  if ((-[FBSDisplayIdentity isEqual:](self->_rootIdentity, "isEqual:", v9) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_rootIdentity isEqual:rootIdentity]"));

  }
  if (a4)
  {
    if (v10)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SSKDisplayPriorityIsValid(assertionLevel)"));

    if (v10)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionDelegate"));

LABEL_5:
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_invalidated"));

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = self->_assertionControlPreferences;
  v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
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
        if (objc_msgSend(v16, "level") == a4)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v30 = v10;
          v17 = v9;
          v18 = a2;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v18, self, CFSTR("_SSKDisplayAssertionStack.m"), 86, CFSTR("we are already tracking an assertion for level %lu: %@"), a4, v16);

          a2 = v18;
          v9 = v17;
          v10 = v30;
        }
      }
      v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v13);
  }

  v20 = -[SSKDisplayAssertion _initWithPhysicalDisplay:level:assertionStack:delegate:]([SSKDisplayAssertion alloc], "_initWithPhysicalDisplay:level:assertionStack:delegate:", v9, a4, self, v10);
  SSKLogDisplayAssertions();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138543618;
    v36 = rootIdentity;
    v37 = 2114;
    v38 = v20;
    _os_log_impl(&dword_245FEA000, v21, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] acquiring new assertion: %{public}@", buf, 0x16u);
  }

  v23 = objc_alloc_init(SSKDisplayAssertionPreferences);
  -[SSKDisplayAssertionPreferences setWantsControlOfDisplay:](v23, "setWantsControlOfDisplay:", 0);
  -[SSKDisplayAssertionPreferences setDisplayArrangement:](v23, "setDisplayArrangement:", 0);
  v24 = (void *)-[NSMapTable copy](self->_assertionControlPreferences, "copy");
  -[NSMapTable setObject:forKey:](self->_assertionControlPreferences, "setObject:forKey:", v23, v20);
  if (self->_activated)
    -[_SSKDisplayAssertionStack _evalAndApplyOldPreferences:newPreferences:](self, "_evalAndApplyOldPreferences:newPreferences:", v24, self->_assertionControlPreferences);

  return v20;
}

- (void)invalidateForDisplayDisconnect
{
  NSObject *v4;
  FBSDisplayIdentity *rootIdentity;
  void *v6;
  NSMapTable *assertionControlPreferences;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  FBSDisplayIdentity *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  FBSDisplayIdentity *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  SSKLogDisplayAssertions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138543362;
    v24 = rootIdentity;
    _os_log_impl(&dword_245FEA000, v4, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] told to invalidate.", buf, 0xCu);
  }

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_invalidated = 1;
  v6 = (void *)-[NSMapTable copy](self->_assertionControlPreferences, "copy");
  assertionControlPreferences = self->_assertionControlPreferences;
  self->_assertionControlPreferences = 0;

  _SSKActiveAssertion(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = v6;
  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        SSKLogDisplayAssertions();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_rootIdentity;
          *(_DWORD *)buf = 138543618;
          v24 = v16;
          v25 = 2114;
          v26 = v14;
          _os_log_impl(&dword_245FEA000, v15, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it's invalidated. assertion: %{public}@", buf, 0x16u);
        }

        if (objc_msgSend(v14, "isEqual:", v8) && self->_activated)
          objc_msgSend(v14, "_didLoseControlOfDisplay");
        objc_msgSend(v14, "_didInvalidateForDisplayDisconnect");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v11);
  }

}

- (void)invalidateAssertion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  FBSDisplayIdentity *rootIdentity;
  int v8;
  FBSDisplayIdentity *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _SSKActiveAssertion(self->_assertionControlPreferences);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v4) && self->_activated)
  {
    SSKLogDisplayAssertions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      v8 = 138543618;
      v9 = rootIdentity;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_245FEA000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it's lost control of the display. assertion: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v4, "_didLoseControlOfDisplay");
  }
  objc_msgSend(v4, "_didInvalidateForDisplayDisconnect");
  -[NSMapTable removeObjectForKey:](self->_assertionControlPreferences, "removeObjectForKey:", v4);

}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_rootIdentity;
}

- (void)_assertion:(id)a3 updatedPreferences:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  FBSDisplayIdentity *rootIdentity;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  FBSDisplayIdentity *v13;
  FBSDisplayIdentity *v14;
  NSObject *v15;
  FBSDisplayIdentity *v16;
  int v17;
  FBSDisplayIdentity *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_invalidated)
  {
    SSKLogDisplayAssertions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      v17 = 138543362;
      v18 = rootIdentity;
      _os_log_impl(&dword_245FEA000, v8, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring wantsControlOfDisplay update because we're invalid.", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    -[NSMapTable objectForKey:](self->_assertionControlPreferences, "objectForKey:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v8);
    SSKLogDisplayAssertions();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 1) != 0)
    {
      if (v12)
      {
        v13 = self->_rootIdentity;
        v17 = 138543874;
        v18 = v13;
        v19 = 2114;
        v20 = v6;
        v21 = 2114;
        v22 = v7;
        _os_log_impl(&dword_245FEA000, v11, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion wantsControlOfDisplay since no change. assertion: %{public}@; preferences: %{public}@",
          (uint8_t *)&v17,
          0x20u);
      }
    }
    else
    {
      if (v12)
      {
        v14 = self->_rootIdentity;
        v17 = 138543874;
        v18 = v14;
        v19 = 2114;
        v20 = v6;
        v21 = 2114;
        v22 = v7;
        _os_log_impl(&dword_245FEA000, v11, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] assertion preferences changed. assertion: %{public}@; preferences: %{public}@",
          (uint8_t *)&v17,
          0x20u);
      }

      v11 = -[NSMapTable copy](self->_assertionControlPreferences, "copy");
      -[NSMapTable setObject:forKey:](self->_assertionControlPreferences, "setObject:forKey:", v7, v6);
      if (self->_activated)
      {
        -[_SSKDisplayAssertionStack _evalAndApplyOldPreferences:newPreferences:](self, "_evalAndApplyOldPreferences:newPreferences:", v11, self->_assertionControlPreferences);
      }
      else
      {
        SSKLogDisplayAssertions();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_rootIdentity;
          v17 = 138543874;
          v18 = v16;
          v19 = 2114;
          v20 = v6;
          v21 = 2114;
          v22 = v7;
          _os_log_impl(&dword_245FEA000, v15, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion wantsControlOfDisplay because we're not active. assertion: %{public}@; "
            "preferences: %{public}@",
            (uint8_t *)&v17,
            0x20u);
        }

      }
    }

  }
}

- (void)_assertionDidInvalidate:(id)a3
{
  id v4;
  _BOOL4 invalidated;
  NSObject *v6;
  _BOOL4 v7;
  FBSDisplayIdentity *rootIdentity;
  FBSDisplayIdentity *v9;
  NSObject *v10;
  FBSDisplayIdentity *v11;
  int v12;
  FBSDisplayIdentity *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  invalidated = self->_invalidated;
  SSKLogDisplayAssertions();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (invalidated)
  {
    if (v7)
    {
      rootIdentity = self->_rootIdentity;
      v12 = 138543362;
      v13 = rootIdentity;
      _os_log_impl(&dword_245FEA000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion invalidation because we're invalid.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      v9 = self->_rootIdentity;
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_245FEA000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] removing invalidated assertion and processing active assertions.", (uint8_t *)&v12, 0xCu);
    }

    v6 = -[NSMapTable copy](self->_assertionControlPreferences, "copy");
    -[NSMapTable removeObjectForKey:](self->_assertionControlPreferences, "removeObjectForKey:", v4);
    if (self->_activated)
    {
      -[_SSKDisplayAssertionStack _evalAndApplyOldPreferences:newPreferences:](self, "_evalAndApplyOldPreferences:newPreferences:", v6, self->_assertionControlPreferences);
    }
    else
    {
      SSKLogDisplayAssertions();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_rootIdentity;
        v12 = 138543618;
        v13 = v11;
        v14 = 2114;
        v15 = v4;
        _os_log_impl(&dword_245FEA000, v10, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion invalidation because we're not active. assertion: %{public}@", (uint8_t *)&v12, 0x16u);
      }

    }
  }

}

- (void)_evalAndApplyOldPreferences:(id)a3 newPreferences:(id)a4
{
  NSMapTable *v7;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  NSObject *v22;
  FBSDisplayIdentity *rootIdentity;
  NSObject *v24;
  FBSDisplayIdentity *v25;
  NSObject *v26;
  FBSDisplayIdentity *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _SSKDisplayAssertionStack *v32;
  uint8_t buf[4];
  FBSDisplayIdentity *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = (NSMapTable *)a3;
  v8 = (NSMapTable *)a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldAssertionPrefs"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newAssertionPrefs"));

LABEL_3:
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_invalidated"));

  }
  if (!self->_activated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SSKDisplayAssertionStack.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_activated"));

  }
  v32 = self;
  v10 = (void *)MEMORY[0x24BDBCEF0];
  NSAllMapTableKeys(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = (void *)MEMORY[0x24BDBCEF0];
  NSAllMapTableKeys(v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "minusSet:", v16);
  objc_msgSend(v16, "minusSet:", v12);
  _SSKActiveAssertion(v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _SSKActiveAssertion(v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v7, "objectForKey:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v9, "objectForKey:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqual:", v20) & 1) == 0 && v19 != v20)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v32->_delegate);
    objc_msgSend(WeakRetained, "assertionStack:updatedAssertionPreferences:oldPreferences:", v32, v20, v19);

  }
  if (v17 != v18)
  {
    SSKLogDisplayAssertions();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = v32->_rootIdentity;
      *(_DWORD *)buf = 138543362;
      v34 = rootIdentity;
      _os_log_impl(&dword_245FEA000, v22, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] assertion data changed. calling back to delegates", buf, 0xCu);
    }

    if (v17 && (objc_msgSend(v13, "containsObject:", v17) & 1) == 0)
    {
      SSKLogDisplayAssertions();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v32->_rootIdentity;
        *(_DWORD *)buf = 138543618;
        v34 = v25;
        v35 = 2114;
        v36 = v17;
        _os_log_impl(&dword_245FEA000, v24, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it lost control of display. assertion: %{public}@", buf, 0x16u);
      }

      objc_msgSend(v17, "_didLoseControlOfDisplay");
    }
    if (v18)
    {
      SSKLogDisplayAssertions();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v32->_rootIdentity;
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        v35 = 2114;
        v36 = v18;
        _os_log_impl(&dword_245FEA000, v26, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it gained control of display. assertion: %{public}@", buf, 0x16u);
      }

      objc_msgSend(v18, "_didGainControlOfDisplay");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionControlPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootIdentity, 0);
}

@end

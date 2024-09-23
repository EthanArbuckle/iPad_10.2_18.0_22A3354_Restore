@implementation _SBDisplayAssertionStack

- (_SBDisplayAssertionStack)initWithRootDisplay:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  _SBDisplayAssertionStack *v10;
  _SBDisplayAssertionStack *v11;
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
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)_SBDisplayAssertionStack;
  v10 = -[_SBDisplayAssertionStack init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_rootIdentity, a3);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_invalidated = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0x10000);
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
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5.receiver = self;
  v5.super_class = (Class)_SBDisplayAssertionStack;
  -[_SBDisplayAssertionStack dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
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

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[FBSDisplayIdentity isEqual:](self->_rootIdentity, "isEqual:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_rootIdentity isEqual:rootIdentity]"));

  }
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_invalidated"));

  }
  if (self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_activated"));

  }
  SBLogDisplayAssertions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] activating assertions for display", buf, 0xCu);
  }

  self->_activated = 1;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  -[_SBDisplayAssertionStack _evalAndApplyOldPreferences:newPreferences:](self, "_evalAndApplyOldPreferences:newPreferences:", v7, self->_assertionControlPreferences);

}

- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 delegate:(id)a6
{
  id v10;
  id v11;
  NSMapTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  FBSDisplayIdentity *rootIdentity;
  SBDisplayAssertionPreferences *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  FBSDisplayIdentity *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if ((-[FBSDisplayIdentity isEqual:](self->_rootIdentity, "isEqual:", v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_rootIdentity isEqual:rootIdentity]"));

  }
  if (SBDisplayAssertionLevelIsValid(a4))
  {
    if (v11)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBDisplayAssertionLevelIsValid(assertionLevel)"));

    if (v11)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionDelegate"));

LABEL_5:
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_invalidated"));

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = self->_assertionControlPreferences;
  v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v17, "level") == a4)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = v10;
          v32 = v11;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          SBDisplayAssertionLevelDescription(a4);
          v19 = a5;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 87, CFSTR("we are already tracking an assertion for level %@: %@"), v20, v17);

          a5 = v19;
          v10 = v31;
          v11 = v32;
        }
      }
      v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v14);
  }

  v21 = -[SBDisplayAssertion _initWithPhysicalDisplay:level:deactivationReasons:assertionStack:delegate:]([SBDisplayAssertion alloc], "_initWithPhysicalDisplay:level:deactivationReasons:assertionStack:delegate:", v10, a4, a5, self, v11);
  SBLogDisplayAssertions();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138543618;
    v39 = rootIdentity;
    v40 = 2114;
    v41 = v21;
    _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] acquiring new assertion: %{public}@", buf, 0x16u);
  }

  v24 = objc_alloc_init(SBDisplayAssertionPreferences);
  -[SBDisplayAssertionPreferences setWantsControlOfDisplay:](v24, "setWantsControlOfDisplay:", 0);
  -[SBDisplayAssertionPreferences setDisplayArrangement:](v24, "setDisplayArrangement:", 0);
  v25 = (void *)-[NSMapTable copy](self->_assertionControlPreferences, "copy");
  -[NSMapTable setObject:forKey:](self->_assertionControlPreferences, "setObject:forKey:", v24, v21);
  if (self->_activated)
    -[_SBDisplayAssertionStack _evalAndApplyOldPreferences:newPreferences:](self, "_evalAndApplyOldPreferences:newPreferences:", v25, self->_assertionControlPreferences);

  return v21;
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

  v28 = *MEMORY[0x1E0C80C00];
  SBLogDisplayAssertions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138543362;
    v24 = rootIdentity;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] told to invalidate.", buf, 0xCu);
  }

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_invalidated = 1;
  v6 = (void *)-[NSMapTable copy](self->_assertionControlPreferences, "copy");
  assertionControlPreferences = self->_assertionControlPreferences;
  self->_assertionControlPreferences = 0;

  _SBActiveAssertion(v6);
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
        SBLogDisplayAssertions();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_rootIdentity;
          *(_DWORD *)buf = 138543618;
          v24 = v16;
          v25 = 2114;
          v26 = v14;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it's invalidated. assertion: %{public}@", buf, 0x16u);
        }

        if (objc_msgSend(v14, "isEqual:", v8) && self->_activated)
          objc_msgSend(v14, "_didLoseControlOfDisplayForDeactivationReasons:", 0);
        objc_msgSend(v14, "_didInvalidateForDisplayDisconnect");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v11);
  }

}

- (void)invalidateAssertionForDerivedDisplayDisconnect:(id)a3
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

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _SBActiveAssertion(self->_assertionControlPreferences);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v4) && self->_activated)
  {
    SBLogDisplayAssertions();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      v8 = 138543618;
      v9 = rootIdentity;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it's lost control of the display. assertion: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v4, "_didLoseControlOfDisplayForDeactivationReasons:", 0);
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

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_invalidated)
  {
    SBLogDisplayAssertions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      v17 = 138543362;
      v18 = rootIdentity;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring wantsControlOfDisplay update because we're invalid.", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    -[NSMapTable objectForKey:](self->_assertionControlPreferences, "objectForKey:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v8);
    SBLogDisplayAssertions();
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
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion wantsControlOfDisplay since no change. assertion: %{public}@; preferences: %{public}@",
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
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] assertion preferences changed. assertion: %{public}@; preferences: %{public}@",
          (uint8_t *)&v17,
          0x20u);
      }

      v11 = -[NSMapTable copy](self->_assertionControlPreferences, "copy");
      -[NSMapTable setObject:forKey:](self->_assertionControlPreferences, "setObject:forKey:", v7, v6);
      if (self->_activated)
      {
        -[_SBDisplayAssertionStack _evalAndApplyOldPreferences:newPreferences:](self, "_evalAndApplyOldPreferences:newPreferences:", v11, self->_assertionControlPreferences);
      }
      else
      {
        SBLogDisplayAssertions();
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
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion wantsControlOfDisplay because we're not active. assertion: %{public}@; "
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

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  invalidated = self->_invalidated;
  SBLogDisplayAssertions();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (invalidated)
  {
    if (v7)
    {
      rootIdentity = self->_rootIdentity;
      v12 = 138543362;
      v13 = rootIdentity;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion invalidation because we're invalid.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      v9 = self->_rootIdentity;
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] removing invalidated assertion and processing active assertions.", (uint8_t *)&v12, 0xCu);
    }

    v6 = -[NSMapTable copy](self->_assertionControlPreferences, "copy");
    -[NSMapTable removeObjectForKey:](self->_assertionControlPreferences, "removeObjectForKey:", v4);
    if (self->_activated)
    {
      -[_SBDisplayAssertionStack _evalAndApplyOldPreferences:newPreferences:](self, "_evalAndApplyOldPreferences:newPreferences:", v6, self->_assertionControlPreferences);
    }
    else
    {
      SBLogDisplayAssertions();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_rootIdentity;
        v12 = 138543618;
        v13 = v11;
        v14 = 2114;
        v15 = v4;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion invalidation because we're not active. assertion: %{public}@", (uint8_t *)&v12, 0x16u);
      }

    }
  }

}

- (void)_evalAndApplyOldPreferences:(id)a3 newPreferences:(id)a4
{
  NSMapTable *v6;
  NSMapTable *v7;
  NSMapTable *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id WeakRetained;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  FBSDisplayIdentity *rootIdentity;
  NSObject *v25;
  void *v26;
  FBSDisplayIdentity *v27;
  void *v28;
  NSMapTable *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  NSObject *v37;
  FBSDisplayIdentity *v38;
  void *v39;
  NSObject *v40;
  FBSDisplayIdentity *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSMapTable *v47;
  NSMapTable *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  FBSDisplayIdentity *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = (NSMapTable *)a3;
  v7 = (NSMapTable *)a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldAssertionPrefs"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newAssertionPrefs"));

LABEL_3:
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_invalidated"));

  }
  if (!self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBDisplayAssertionStack.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_activated"));

  }
  v9 = (void *)MEMORY[0x1E0C99E20];
  NSAllMapTableKeys(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = (void *)MEMORY[0x1E0C99E20];
  NSAllMapTableKeys(v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "minusSet:", v15);
  objc_msgSend(v15, "minusSet:", v11);
  _SBActiveAssertion(v6);
  v16 = objc_claimAutoreleasedReturnValue();
  _SBActiveAssertion(v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v16;
  -[NSMapTable objectForKey:](v6, "objectForKey:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v8, "objectForKey:", v17);
  v19 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v19;
  if ((objc_msgSend(v18, "isEqual:", v19) & 1) == 0 && v18 != (void *)v19)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "assertionStack:updatedAssertionPreferences:oldPreferences:", self, v51, v18);

  }
  v21 = objc_msgSend(v53, "deactivationReasonsWhenActive");
  v22 = objc_msgSend(v17, "deactivationReasonsWhenActive");
  if (v53 != v17 || v21 != v22)
  {
    v55 = v22;
    SBLogDisplayAssertions();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      *(_DWORD *)buf = 138543362;
      v62 = rootIdentity;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] assertion data changed. calling back to delegates", buf, 0xCu);
    }

    if (v53 && v53 != v17 && (objc_msgSend(v12, "containsObject:") & 1) == 0)
    {
      SBLogDisplayAssertions();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v11;
        v27 = self->_rootIdentity;
        UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
        v49 = v18;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v27;
        v11 = v26;
        v63 = 2114;
        v64 = v53;
        v65 = 2114;
        v66 = v28;
        _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it lost control of display. assertion: %{public}@; reasons: %{public}@",
          buf,
          0x20u);

        v18 = v49;
      }

      objc_msgSend(v53, "_didLoseControlOfDisplayForDeactivationReasons:", v55);
    }
    if (v21 != v55)
    {
      v48 = v6;
      v50 = v18;
      v46 = v11;
      v47 = v8;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v29 = v8;
      v30 = -[NSMapTable countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      v31 = v53;
      if (v30)
      {
        v32 = v30;
        v33 = *(_QWORD *)v57;
        v52 = v15;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v57 != v33)
              objc_enumerationMutation(v29);
            v35 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            if ((objc_msgSend(v12, "containsObject:", v35) & 1) == 0
              && (objc_msgSend(v15, "containsObject:", v35) & 1) == 0
              && (objc_msgSend(v35, "isEqual:", v31) & 1) == 0
              && (objc_msgSend(v35, "isEqual:", v17) & 1) == 0)
            {
              v36 = v17;
              SBLogDisplayAssertions();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                v38 = self->_rootIdentity;
                UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v62 = v38;
                v31 = v53;
                v63 = 2114;
                v64 = v35;
                v65 = 2114;
                v66 = v39;
                _os_log_impl(&dword_1D0540000, v37, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion of new deactivation reasons. assertion: %{public}@; reasons: %{public}@",
                  buf,
                  0x20u);

                v15 = v52;
              }

              objc_msgSend(v35, "_didReceiveNewDeactivationReasons:", v55);
              v17 = v36;
            }
          }
          v32 = -[NSMapTable countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        }
        while (v32);
      }

      v8 = v47;
      v6 = v48;
      v11 = v46;
      v18 = v50;
    }
    if (v17)
    {
      SBLogDisplayAssertions();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = self->_rootIdentity;
        *(_DWORD *)buf = 138543618;
        v62 = v41;
        v63 = 2114;
        v64 = v17;
        _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it gained control of display. assertion: %{public}@", buf, 0x16u);
      }

      objc_msgSend(v17, "_didGainControlOfDisplay");
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

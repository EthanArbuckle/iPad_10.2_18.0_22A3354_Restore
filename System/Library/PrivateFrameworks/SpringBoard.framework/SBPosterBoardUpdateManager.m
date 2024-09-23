@implementation SBPosterBoardUpdateManager

+ (SBPosterBoardUpdateManager)sharedInstance
{
  if (sharedInstance_onceToken_29 != -1)
    dispatch_once(&sharedInstance_onceToken_29, &__block_literal_global_194);
  return (SBPosterBoardUpdateManager *)(id)sharedInstance_sharedInstance_3;
}

void __44__SBPosterBoardUpdateManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = v0;

}

- (SBPosterBoardUpdateManager)init
{
  SBPosterBoardUpdateManager *v2;
  SBPosterBoardUpdateManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPosterBoardUpdateManager;
  v2 = -[SBPosterBoardUpdateManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBPosterBoardUpdateManager _registerForWork:](v2, "_registerForWork:", 0);
    -[SBPosterBoardUpdateManager _registerForWork:](v3, "_registerForWork:", 1);
    -[SBPosterBoardUpdateManager _registerForWork:](v3, "_registerForWork:", 2);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SBPosterBoardUpdateManager _unregisterForWork:](self, "_unregisterForWork:", 0);
  -[SBPosterBoardUpdateManager _unregisterForWork:](self, "_unregisterForWork:", 1);
  -[SBPosterBoardUpdateManager _unregisterForWork:](self, "_unregisterForWork:", 2);
  v3.receiver = self;
  v3.super_class = (Class)SBPosterBoardUpdateManager;
  -[SBPosterBoardUpdateManager dealloc](&v3, sel_dealloc);
}

- (void)executeUpdate:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SBPosterBoardUpdateManager_executeUpdate___block_invoke;
  v6[3] = &unk_1E8E9DE88;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performAfterFirstUnlockSinceBootUsingBlock:", v6);

}

void __44__SBPosterBoardUpdateManager_executeUpdate___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__67;
  v14 = __Block_byref_object_dispose__67;
  v15 = objc_alloc_init(MEMORY[0x1E0D7F710]);
  objc_msgSend((id)a1[4], "_notifyWillBeginUpdate:", a1[5]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v2 = a1[5];
  a1 += 5;
  v9[2] = __44__SBPosterBoardUpdateManager_executeUpdate___block_invoke_5;
  v9[3] = &unk_1E8EB1DE0;
  v9[4] = *(a1 - 1);
  v9[5] = &v10;
  v9[6] = v2;
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v9);
  v4 = *a1;
  if (*a1 == 2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)v11[5], "notifyPosterBoardOfApplicationUpdatesWithCompletion:", v3);
      goto LABEL_11;
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D68];
    v19[0] = CFSTR("SBPosterBoardUpdateAppInstallOrUninstall is not implemented.  Please update PosterBoard.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SBPosterBoardUpdateManagerErrorDomain"), 3328, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v7);
LABEL_10:

    goto LABEL_11;
  }
  if (v4 == 1)
  {
    objc_msgSend((id)v11[5], "overnightUpdateWithCompletion:", v3);
    goto LABEL_11;
  }
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v17 = CFSTR("Specified invalid SBPosterBoardUpdate");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SBPosterBoardUpdateManagerErrorDomain"), 3328, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v7);
    goto LABEL_10;
  }
  objc_msgSend((id)v11[5], "prewarmWithCompletion:", v3);
LABEL_11:

  _Block_object_dispose(&v10, 8);
}

void __44__SBPosterBoardUpdateManager_executeUpdate___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDidFinishUpdate:error:", *(_QWORD *)(a1 + 48), a2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (BOOL)_isXPCActivity:(int64_t)a3
{
  return a3 != 2;
}

- (id)_xpcActivityNameForUpdate:(int64_t)a3
{
  void *v6;

  if (!-[SBPosterBoardUpdateManager _isXPCActivity:](self, "_isXPCActivity:"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[self _isXPCActivity:update]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBPosterBoardUpdateManager _xpcActivityNameForUpdate:].cold.2(a2);
    goto LABEL_11;
  }
  if (a3 != 1)
  {
    if (!a3)
      return CFSTR("com.apple.springboard.posterboardupdate.prewarm");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown update type: %ld"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBPosterBoardUpdateManager _xpcActivityNameForUpdate:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0A2B980);
  }
  return CFSTR("com.apple.springboard.posterboardupdate.overnight");
}

- (id)_criteriaForUpdate:(int64_t)a3
{
  xpc_object_t v5;
  void *v6;
  BOOL v7;
  const char **v8;
  int64_t *v9;
  const char **v10;
  BOOL v11;
  double v12;
  xpc_object_t v13;
  id result;
  void *v15;
  xpc_object_t objects;

  if (-[SBPosterBoardUpdateManager _isXPCActivity:](self, "_isXPCActivity:"))
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    v6 = v5;
    if (a3 == 1)
    {
      v11 = 0;
      v8 = (const char **)MEMORY[0x1E0C80860];
      v7 = 1;
      v9 = (int64_t *)MEMORY[0x1E0C807B8];
      v10 = (const char **)MEMORY[0x1E0C80760];
      v12 = 600.0;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
        xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C808B8], 1);
        xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E0C807A0], "PosterBoardUpdate");
        xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E0C80798], 1);
        objects = xpc_string_create("com.apple.PosterBoard");
        v13 = xpc_array_create(&objects, 1uLL);
        xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x1E0C807F8], v13);
        xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x1E0C80780], v13);
        xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C80808], 1);
        xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C80770], 1);

        return v6;
      }
      v7 = 0;
      v8 = (const char **)MEMORY[0x1E0C808E8];
      v9 = (int64_t *)MEMORY[0x1E0C807E0];
      v10 = (const char **)MEMORY[0x1E0C80790];
      v11 = 1;
      v12 = 300.0;
    }
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80738], v11);
    xpc_dictionary_set_int64(v6, *v10, *v9);
    xpc_dictionary_set_double(v6, (const char *)*MEMORY[0x1E0C80788], v12);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C80898], v7);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C808D8], v7);
    xpc_dictionary_set_BOOL(v6, *v8, 1);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[self _isXPCActivity:update]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBPosterBoardUpdateManager _criteriaForUpdate:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_registerForWork:(int64_t)a3
{
  id v5;
  const char *v6;
  void *v7;
  id v8;
  _QWORD handler[6];

  if (-[SBPosterBoardUpdateManager _isXPCActivity:](self, "_isXPCActivity:"))
  {
    -[SBPosterBoardUpdateManager _xpcActivityNameForUpdate:](self, "_xpcActivityNameForUpdate:", a3);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    v7 = (void *)*MEMORY[0x1E0C80748];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47__SBPosterBoardUpdateManager__registerForWork___block_invoke;
    handler[3] = &unk_1E8EB1E08;
    handler[4] = self;
    handler[5] = a3;
    xpc_activity_register(v6, v7, handler);

  }
  else if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__noteApplicationsChanged_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__noteApplicationsChanged_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  }
}

void __47__SBPosterBoardUpdateManager__registerForWork___block_invoke(uint64_t a1, void *a2)
{
  xpc_activity_state_t state;
  void *v4;
  _xpc_activity_s *activity;

  activity = a2;
  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "executeUpdate:", *(_QWORD *)(a1 + 40));
  }
  else if (!state)
  {
    objc_msgSend(*(id *)(a1 + 32), "_criteriaForUpdate:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(activity, v4);

  }
}

- (void)_unregisterForWork:(int64_t)a3
{
  id v5;

  if (-[SBPosterBoardUpdateManager _isXPCActivity:](self, "_isXPCActivity:"))
  {
    -[SBPosterBoardUpdateManager _xpcActivityNameForUpdate:](self, "_xpcActivityNameForUpdate:", a3);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_activity_unregister((const char *)objc_msgSend(v5, "UTF8String"));
  }
  else
  {
    if (a3 != 2)
      return;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
  }

}

- (void)_noteApplicationsChanged:(id)a3
{
  -[SBPosterBoardUpdateManager executeUpdate:](self, "executeUpdate:", 2);
}

- (void)addObserver:(id)a3
{
  SBPosterBoardUpdateManager *v4;
  NSHashTable *observers;
  uint64_t v6;
  NSHashTable *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  observers = v4->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v4->_observers;
    v4->_observers = (NSHashTable *)v6;

    observers = v4->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v8);
  objc_sync_exit(v4);

}

- (void)removeObserver:(id)a3
{
  SBPosterBoardUpdateManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)_notifyWillBeginUpdate:(int64_t)a3
{
  SBPosterBoardUpdateManager *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)-[NSHashTable copy](v4->_observers, "copy");
  objc_sync_exit(v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "updateManager:willBeginUpdate:", v4, a3, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidFinishUpdate:(int64_t)a3 error:(id)a4
{
  id v6;
  SBPosterBoardUpdateManager *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)-[NSHashTable copy](v7->_observers, "copy");
  objc_sync_exit(v7);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "updateManager:didFinishUpdate:error:", v7, a3, v6, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_xpcActivityNameForUpdate:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_xpcActivityNameForUpdate:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_criteriaForUpdate:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

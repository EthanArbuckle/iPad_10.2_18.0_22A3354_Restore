@implementation TRIXPCActivitySupport

+ (id)nameForActivityState:(int64_t)a3
{
  __CFString *v3;

  if ((unint64_t)a3 >= 6)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("XPC_ACTIVITY_STATE_%ld"), a3);
  else
    v3 = off_1E93361F8[a3];
  return v3;
}

+ (id)_registeredActivities
{
  if (qword_1EFC74488 != -1)
    dispatch_once(&qword_1EFC74488, &__block_literal_global_86);
  return (id)_MergedGlobals_45;
}

void __46__TRIXPCActivitySupport__registeredActivities__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)_MergedGlobals_45;
  _MergedGlobals_45 = v3;

  objc_autoreleasePoolPop(v0);
}

+ (void)registerActivityWithLaunchDaemonDescriptor:(id)a3 checkInBlock:(id)a4 asyncHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD handler[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIXPCActivitySupport _registeredActivities](TRIXPCActivitySupport, "_registeredActivities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __94__TRIXPCActivitySupport_registerActivityWithLaunchDaemonDescriptor_checkInBlock_asyncHandler___block_invoke;
  v32[3] = &unk_1E9336138;
  v15 = v12;
  v33 = v15;
  v16 = v11;
  v34 = v16;
  objc_msgSend(v13, "runWithLockAcquired:", v32);
  TRILogCategory_Server();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v15;
    _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "register xpc activity handler for %{public}@", buf, 0xCu);
  }

  v18 = objc_retainAutorelease(v15);
  v19 = (const char *)objc_msgSend(v18, "UTF8String");
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCActivitySupport.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utf8Name"));

  }
  v20 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = v14;
  handler[1] = 3221225472;
  handler[2] = __94__TRIXPCActivitySupport_registerActivityWithLaunchDaemonDescriptor_checkInBlock_asyncHandler___block_invoke_92;
  handler[3] = &unk_1E9336160;
  v27 = v18;
  v28 = v9;
  v30 = v16;
  v31 = a1;
  v29 = v10;
  v21 = v16;
  v22 = v9;
  v23 = v10;
  v24 = v18;
  xpc_activity_register(v19, v20, handler);

}

void __94__TRIXPCActivitySupport_registerActivityWithLaunchDaemonDescriptor_checkInBlock_asyncHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = (id)MEMORY[0x1D8232C48](v3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

}

void __94__TRIXPCActivitySupport_registerActivityWithLaunchDaemonDescriptor_checkInBlock_asyncHandler___block_invoke_92(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  xpc_activity_state_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  TRIRunningXPCActivityDescriptor *v11;
  uint64_t v12;
  const char *v13;
  NSObject *p_super;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_activity_state_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  xpc_activity_state_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    v9 = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (TRIRunningXPCActivityDescriptor *)v10;
    if (!v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v23 = 138543362;
        v24 = v17;
        _os_log_impl(&dword_1D207F000, &v11->super, OS_LOG_TYPE_DEFAULT, "Run activity for %{public}@", (uint8_t *)&v23, 0xCu);
      }

      v11 = -[TRIRunningXPCActivityDescriptor initWithActivity:capabilities:name:]([TRIRunningXPCActivityDescriptor alloc], "initWithActivity:capabilities:name:", v3, objc_msgSend(*(id *)(a1 + 40), "supportedTaskCapabilities"), *(_QWORD *)(a1 + 32));
      v18 = xpc_activity_get_state(v3);
      if (!xpc_activity_set_state(v3, 4))
      {
        TRILogCategory_Server();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 64), "nameForActivityState:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 64), "nameForActivityState:", 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543874;
          v24 = v20;
          v25 = 2114;
          v26 = (xpc_activity_state_t)v21;
          v27 = 2114;
          v28 = v22;
          _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "XPC activity %{public}@ start: unable to transition state %{public}@ --> %{public}@", (uint8_t *)&v23, 0x20u);

        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_20;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v23 = 138543362;
      v24 = v12;
      v13 = "Attempted to run activity %{public}@ before first unlock, doing nothing";
      p_super = &v11->super;
      v15 = 12;
LABEL_12:
      _os_log_error_impl(&dword_1D207F000, p_super, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v23, v15);
    }
LABEL_20:

    goto LABEL_21;
  }
  v5 = state;
  if (state)
  {
    TRILogCategory_Server();
    v11 = (TRIRunningXPCActivityDescriptor *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v23 = 138543618;
      v24 = v16;
      v25 = 2048;
      v26 = v5;
      v13 = "%{public}@ - unexpected xpc activity state: %ld";
      p_super = &v11->super;
      v15 = 22;
      goto LABEL_12;
    }
    goto LABEL_20;
  }
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v23 = 138543362;
    v24 = v7;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Checking in for %{public}@", (uint8_t *)&v23, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, _xpc_activity_s *))(v8 + 16))(v8, v3);
LABEL_21:

}

+ (void)assertRegistrationOfLaunchdPlistActivities:(id)a3
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;
  id v11;

  v5 = a3;
  +[TRIXPCActivitySupport _registeredActivities](TRIXPCActivitySupport, "_registeredActivities");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__TRIXPCActivitySupport_assertRegistrationOfLaunchdPlistActivities___block_invoke;
  v8[3] = &unk_1E9336188;
  v9 = v5;
  v10 = a2;
  v11 = a1;
  v6 = v5;
  objc_msgSend(v7, "runWithLockAcquired:", v8);

}

void __68__TRIXPCActivitySupport_assertRegistrationOfLaunchdPlistActivities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  if ((objc_msgSend(*(id *)(a1 + 32), "isSubsetOfSet:", v6) & 1) == 0)
  {
    v15 = v3;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
          {
            TRILogCategory_Server();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v21 = v12;
              _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "descriptor %{public}@ is not registered", buf, 0xCu);
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("TRIXPCActivitySupport.m"), 218, CFSTR("failed assertRegistrationOfLaunchdPlistActivities"));

    v3 = v15;
  }

}

+ (BOOL)unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v16;
  void *v17;
  _QWORD handler[4];
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[TRIXPCActivitySupport _registeredActivities](TRIXPCActivitySupport, "_registeredActivities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__49;
  v28 = __Block_byref_object_dispose__49;
  v7 = MEMORY[0x1E0C809B0];
  v29 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86__TRIXPCActivitySupport_unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor___block_invoke;
  v21[3] = &unk_1E93361B0;
  v23 = &v24;
  v8 = v5;
  v22 = v8;
  objc_msgSend(v6, "runWithLockAcquired:", v21);
  v9 = v25[5];
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E0C80898], 0);
    xpc_dictionary_set_int64(v10, (const char *)*MEMORY[0x1E0C80760], 0);
    xpc_dictionary_set_int64(v10, (const char *)*MEMORY[0x1E0C80790], 0);
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v12;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Registering TOTALLY SKETCHY IMMEDIATE ACTIVITY FOR TESTING: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v8, "name");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIXPCActivitySupport.m"), 242, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("descriptor.name.UTF8String"));

    }
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = __86__TRIXPCActivitySupport_unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor___block_invoke_103;
    handler[3] = &unk_1E93361D8;
    v19 = v8;
    v20 = &v24;
    xpc_activity_register(v14, v10, handler);

  }
  else
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Unable to immediately schedule %{public}@: activity not yet registered", buf, 0xCu);

    }
  }

  _Block_object_dispose(&v24, 8);
  return v9 != 0;
}

void __86__TRIXPCActivitySupport_unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __86__TRIXPCActivitySupport_unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor___block_invoke_103(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  TRIRunningXPCActivityDescriptor *v7;
  void *v8;
  TRIRunningXPCActivityDescriptor *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Running TOTALLY SKETCHY IMMEDIATE ACTIVITY FOR TESTING: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    v6 = objc_msgSend(*(id *)(a1 + 32), "supportedTaskCapabilities") | 0x1B;
    v7 = [TRIRunningXPCActivityDescriptor alloc];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TRIRunningXPCActivityDescriptor initWithActivity:capabilities:name:](v7, "initWithActivity:capabilities:name:", v3, v6, v8);

    xpc_activity_set_state(v3, 4);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();

  }
}

@end

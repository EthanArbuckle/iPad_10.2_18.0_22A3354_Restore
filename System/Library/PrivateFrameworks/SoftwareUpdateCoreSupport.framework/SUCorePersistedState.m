@implementation SUCorePersistedState

- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5
{
  return -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:](self, "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:", a3, a4, a5, 1);
}

- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5 issuingDefaultLevelLogging:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  SUCorePersistedState *v14;
  SUCorePersistedState *v15;
  NSMutableDictionary *persistedState;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SUCorePersistedState;
  v14 = -[SUCorePersistedState init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_persistedStateQueue, a3);
    objc_storeStrong((id *)&v15->_persistencePath, a4);
    objc_storeStrong((id *)&v15->_versionPolicyLayer, a5);
    v15->_defaultLevelLogging = a6;
    objc_storeStrong((id *)&v15->_versionSUCore, CFSTR("2.1.0"));
    persistedState = v15->_persistedState;
    v15->_persistedState = 0;

  }
  return v15;
}

- (BOOL)isPersistedStateLoaded
{
  SUCorePersistedState *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCorePersistedState persistedState](v2, "persistedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)persistedContentsType
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeStringForKey:", CFSTR("SUCorePersistedStateContentsType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "oslog");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v6;
        _os_log_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] returning persisted contents type with string value: %{public}@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("persisted state is not loaded, unable to load core contents type string"), 8250, 0);

    v6 = 0;
  }
  return v6;
}

- (id)persistedCoreVersion
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeStringForKey:", CFSTR("SUCorePersistedStateCoreVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "oslog");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v6;
        _os_log_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] returning persisted core version with string value: %{public}@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("persisted state is not loaded, unable to load core version string"), 8250, 0);

    v6 = 0;
  }
  return v6;
}

- (id)persistedPolicyVersion
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeStringForKey:", CFSTR("SUCorePersistedStatePolicyVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "oslog");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v6;
        _os_log_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] returning persisted policy version with string value: %{public}@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("persisted state is not loaded, unable to load policy version string"), 8250, 0);

    v6 = 0;
  }
  return v6;
}

- (BOOL)loadPersistedState
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
  if (!v4)
  {
    if (v5)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCorePersistedState summary](self, "summary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v11;
        _os_log_impl(&dword_1B05B8000, v10, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] loading persisted state with summary: %{public}@", buf, 0xCu);

      }
    }
    v12 = (void *)MEMORY[0x1E0C99D50];
    -[SUCorePersistedState persistencePath](self, "persistencePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v12, "dataWithContentsOfFile:options:error:", v13, 0, &v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v32;

    if (v7)
    {
      -[NSObject domain](v7, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        if (-[NSObject code](v7, "code") == 4)
        {

LABEL_27:
          if (!-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
          {
            v8 = 1;
            goto LABEL_35;
          }
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "oslog");
          v18 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B05B8000, v18, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] no persisted state file found at persistence path", buf, 2u);
          }
          v8 = 1;
LABEL_34:

LABEL_35:
          -[SUCorePersistedState persistedState](self, "persistedState");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            -[SUCorePersistedState _createEmptyPersistedState](self, "_createEmptyPersistedState");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePersistedState setPersistedState:](self, "setPersistedState:", v26);

            if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
            {
              +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "oslog");
              v28 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                -[SUCorePersistedState persistedState](self, "persistedState");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v34 = v29;
                _os_log_impl(&dword_1B05B8000, v28, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] created a new, empty persisted state dictionary: %{public}@", buf, 0xCu);

              }
            }
          }

          goto LABEL_41;
        }
        v22 = -[NSObject code](v7, "code");

        if (v22 == 260)
          goto LABEL_27;
      }
      else
      {

      }
    }
    else if (v14)
    {
      v31 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 2, 0, &v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v31;
      v18 = v17;
      v8 = v16 != 0;
      if (v16)
      {
        if (v17)
        {
          +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "trackAnomaly:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("an error occurred when loading the persisted state, but the state was still loaded"), 8251, v18);

        }
        if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "oslog");
          v21 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v16;
            _os_log_impl(&dword_1B05B8000, v21, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] loaded persisted state: %{public}@", buf, 0xCu);
          }

        }
        -[SUCorePersistedState setPersistedState:](self, "setPersistedState:", v16);
      }
      else
      {
        +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("unable to load persisted state as dictionary"), 8106, v18);

      }
      goto LABEL_34;
    }
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject trackError:forReason:withResult:withError:](v18, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("unable to serialize contents of persisted state file"), 8106, v7);
    v8 = 0;
    goto LABEL_34;
  }
  if (v5)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v7, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] attempting to load persisted state, but state is already loaded - no operation to perform", buf, 2u);
    }
    v8 = 1;
LABEL_41:

    return v8;
  }
  return 1;
}

- (void)removePersistedState
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCorePersistedState summary](self, "summary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1B05B8000, v5, OS_LOG_TYPE_DEFAULT, "attempting to remove persisted state with summary: %{public}@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState persistencePath](self, "persistencePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v7, "removeItemAtPath:error:", v8, &v16);
  v10 = v16;
  v11 = v10;
  if ((v9 & 1) != 0)
  {

  }
  else
  {
    v12 = objc_msgSend(v10, "code");

    if (v12 != 4)
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("failed to remove persisted state file"), 8110, v11);

      goto LABEL_14;
    }
  }
  if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v14, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] successfully removed persisted state file", buf, 2u);
    }

  }
  -[SUCorePersistedState setPersistedState:](self, "setPersistedState:", 0);
LABEL_14:

}

- (BOOL)BOOLeanForKey:(id)a3
{
  return -[SUCorePersistedState BOOLeanForKey:forType:](self, "BOOLeanForKey:forType:", a3, 1);
}

- (BOOL)BOOLeanForKey:(id)a3 forType:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("persisted state is not loaded, unable to load BOOLean value for key: %@"), v6);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v13, 8250, 0);

LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  -[SUCorePersistedState persistedState](self, "persistedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeObjectForKey:ofClass:", v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v16);
    objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v17, 8252, 0);

    goto LABEL_6;
  }
  v12 = objc_msgSend(v11, "safeBooleanForKey:", v6);
LABEL_7:

  return v12;
}

- (unint64_t)ullForKey:(id)a3
{
  return -[SUCorePersistedState ullForKey:forType:](self, "ullForKey:forType:", a3, 1);
}

- (unint64_t)ullForKey:(id)a3 forType:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("persisted state is not loaded, unable to load ULL value for key: %@"), v6);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v13, 8250, 0);

LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  -[SUCorePersistedState persistedState](self, "persistedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeObjectForKey:ofClass:", v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v16);
    objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v17, 8252, 0);

    goto LABEL_6;
  }
  v12 = objc_msgSend(v11, "safeULLForKey:", v6);
LABEL_7:

  return v12;
}

- (id)stringForKey:(id)a3
{
  return -[SUCorePersistedState stringForKey:forType:](self, "stringForKey:forType:", a3, 1);
}

- (id)stringForKey:(id)a3 forType:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("persisted state is not loaded, unable to load string value for key: %@"), v6);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v13, 8250, 0);

LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  -[SUCorePersistedState persistedState](self, "persistedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeObjectForKey:ofClass:", v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v16);
    objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v17, 8252, 0);

    goto LABEL_6;
  }
  objc_msgSend(v11, "safeStringForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (id)dictionaryForKey:(id)a3
{
  return -[SUCorePersistedState dictionaryForKey:forType:](self, "dictionaryForKey:forType:", a3, 1);
}

- (id)dictionaryForKey:(id)a3 forType:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("persisted state is not loaded, unable to load dictionary value for key: %@"), v6);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v12, 8250, 0);
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  -[SUCorePersistedState persistedState](self, "persistedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeObjectForKey:ofClass:", v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v15);
    objc_msgSend(v12, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v16, 8252, 0);

    goto LABEL_6;
  }
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeDictionaryForKey:fromBase:withKeyDescription:", v6, CFSTR("SUCorePersistedState fieldSpecificDictionary"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

- (id)dataForKey:(id)a3
{
  return -[SUCorePersistedState dataForKey:forType:](self, "dataForKey:forType:", a3, 1);
}

- (id)dataForKey:(id)a3 forType:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("persisted state is not loaded, unable to load data value for key: %@"), v6);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v13, 8250, 0);

LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  -[SUCorePersistedState persistedState](self, "persistedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeObjectForKey:ofClass:", v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v16);
    objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v17, 8252, 0);

    goto LABEL_6;
  }
  objc_msgSend(v11, "safeDataForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (id)dateForKey:(id)a3
{
  return -[SUCorePersistedState dateForKey:forType:](self, "dateForKey:forType:", a3, 1);
}

- (id)dateForKey:(id)a3 forType:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("persisted state is not loaded, unable to load date value for key: %@"), v6);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v13, 8250, 0);

LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  -[SUCorePersistedState persistedState](self, "persistedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeObjectForKey:ofClass:", v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v16);
    objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v17, 8252, 0);

    goto LABEL_6;
  }
  objc_msgSend(v11, "safeDateForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return -[SUCorePersistedState objectForKey:ofClass:forType:](self, "objectForKey:ofClass:forType:", a3, a4, 1);
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("persisted state is not loaded, unable to load object value for key: %@"), v8);
    objc_msgSend(v13, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v15, 8250, 0);

LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  -[SUCorePersistedState persistedState](self, "persistedState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeObjectForKey:ofClass:", v12, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v18);
    objc_msgSend(v16, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v19, 8252, 0);

    goto LABEL_6;
  }
  objc_msgSend(v13, "safeObjectForKey:ofClass:", v8, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v14;
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C99E60];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithObjects:", a4, 0);
  -[SUCorePersistedState secureCodedObjectForKey:ofClass:encodeClasses:forType:](self, "secureCodedObjectForKey:ofClass:encodeClasses:forType:", v7, a4, v8, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5
{
  return -[SUCorePersistedState secureCodedObjectForKey:ofClass:encodeClasses:forType:](self, "secureCodedObjectForKey:ofClass:encodeClasses:forType:", a3, a4, a5, 3);
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5
{
  uint64_t v5;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a5;
  v8 = (objc_class *)MEMORY[0x1E0C99E60];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithObjects:", a4, 0);
  -[SUCorePersistedState secureCodedObjectForKey:ofClass:encodeClasses:forType:](self, "secureCodedObjectForKey:ofClass:encodeClasses:forType:", v9, a4, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5 forType:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v6 = *(_QWORD *)&a6;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if ((v6 & 0xFFFFFFFE) == 2)
  {
    -[SUCorePersistedState dataForKey:forType:](self, "dataForKey:forType:", v10, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
    if (!v13)
    {
      if (!v14)
      {
        v25 = 0;
LABEL_21:

        goto LABEL_22;
      }
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "oslog");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v10;
        v34 = 2114;
        v35 = v27;
        _os_log_impl(&dword_1B05B8000, v18, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] no data object present in secure coded object persisted state for key %{public}@ and type %{public}@", buf, 0x16u);

      }
      v25 = 0;
LABEL_20:

      goto LABEL_21;
    }
    if (v14)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "oslog");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v33 = v10;
        v34 = 2114;
        v35 = v11;
        _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] attempting to load encoded data for key %{public}@ with classes: %{public}@", buf, 0x16u);
      }

    }
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v11, v13, &v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v31;
    if (v18)
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NSKeyedUnarchiver error found when attempting to unarchive data for key %@"), v10);
      objc_msgSend(v19, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v20, 8254, v18);

    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v17;
LABEL_19:

        goto LABEL_20;
      }
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unarchived object is not of the expected class %@"), a4);
      objc_msgSend(v28, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v29, 8255, 0);

    }
    v25 = 0;
    goto LABEL_19;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("invalid SUCorePersistedStateType (%@) provided for secure coded object persistence"), v23);
  objc_msgSend(v21, "trackAnomaly:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v24, 8253, 0);

  v25 = 0;
LABEL_22:

  return v25;
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4
{
  -[SUCorePersistedState persistBoolean:forKey:shouldPersist:](self, "persistBoolean:forKey:shouldPersist:", a3, a4, 1);
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
  -[SUCorePersistedState persistBoolean:forKey:forType:shouldPersist:](self, "persistBoolean:forKey:forType:shouldPersist:", a3, a4, 1, a5);
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeObjectForKey:ofClass:", v14, objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "oslog");
        v17 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = CFSTR("NO");
          if (v8)
            v18 = CFSTR("YES");
          *(_DWORD *)buf = 138543618;
          v29 = v10;
          v30 = 2114;
          v31 = v18;
          _os_log_impl(&dword_1B05B8000, v17, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with BOOLean value: %{public}@=%{public}@", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v19, v10);

      if (v6)
        -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v26);
      objc_msgSend(v24, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v27, 8252, 0);

    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v22 = CFSTR("NO");
    if (v8)
      v22 = CFSTR("YES");
    v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("unable to persist BOOLean for key with value: %@=%@"), v10, v22);
    objc_msgSend(v20, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v23, 8250, 0);

  }
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4
{
  -[SUCorePersistedState persistULL:forKey:shouldPersist:](self, "persistULL:forKey:shouldPersist:", a3, a4, 1);
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
  -[SUCorePersistedState persistULL:forKey:forType:shouldPersist:](self, "persistULL:forKey:forType:shouldPersist:", a3, a4, 1, a5);
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeObjectForKey:ofClass:", v14, objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "oslog");
        v17 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v26 = v10;
          v27 = 2048;
          v28 = a3;
          _os_log_impl(&dword_1B05B8000, v17, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with ULL value: %{public}@=%lld", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v18, v10);

      if (v6)
        -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v23);
      objc_msgSend(v21, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v24, 8252, 0);

    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to persist ULL for key with value: %@=%lld"), v10, a3);
    objc_msgSend(v19, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v20, 8250, 0);

  }
}

- (void)persistString:(id)a3 forKey:(id)a4
{
  -[SUCorePersistedState persistString:forKey:shouldPersist:](self, "persistString:forKey:shouldPersist:", a3, a4, 1);
}

- (void)persistString:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
  -[SUCorePersistedState persistString:forKey:forType:shouldPersist:](self, "persistString:forKey:forType:shouldPersist:", a3, a4, 1, a5);
}

- (void)persistString:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeObjectForKey:ofClass:", v15, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "oslog");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v11;
            v30 = 2114;
            v31 = v10;
            _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with string value: %{public}@=%{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v16, "setValue:forKey:", v10, v11);
        if (!v6)
          goto LABEL_18;
      }
      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "oslog");
          v27 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v11;
            _os_log_impl(&dword_1B05B8000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state string for key: %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(v16, "removeObjectForKey:", v11);
        if (!v6)
          goto LABEL_18;
      }
      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v24);
      objc_msgSend(v22, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v25, 8252, 0);

    }
LABEL_18:

    goto LABEL_19;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to persist string for key with value: %@=%@"), v11, v10);
  objc_msgSend(v20, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v21, 8250, 0);

LABEL_19:
}

- (void)persistDictionary:(id)a3 forKey:(id)a4
{
  -[SUCorePersistedState persistDictionary:forKey:shouldPersist:](self, "persistDictionary:forKey:shouldPersist:", a3, a4, 1);
}

- (void)persistDictionary:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
  -[SUCorePersistedState persistDictionary:forKey:forType:shouldPersist:](self, "persistDictionary:forKey:forType:shouldPersist:", a3, a4, 1, a5);
}

- (void)persistDictionary:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeObjectForKey:ofClass:", v15, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "oslog");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v11;
            v30 = 2114;
            v31 = v10;
            _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with dictionary value: %{public}@=%{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v16, "setValue:forKey:", v10, v11);
        if (!v6)
          goto LABEL_18;
      }
      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "oslog");
          v27 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v11;
            _os_log_impl(&dword_1B05B8000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state dictionary for key: %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(v16, "removeObjectForKey:", v11);
        if (!v6)
          goto LABEL_18;
      }
      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v24);
      objc_msgSend(v22, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v25, 8252, 0);

    }
LABEL_18:

    goto LABEL_19;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to persist dictionary for key with value: %@=%@"), v11, v10);
  objc_msgSend(v20, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v21, 8250, 0);

LABEL_19:
}

- (void)persistData:(id)a3 forKey:(id)a4
{
  -[SUCorePersistedState persistData:forKey:shouldPersist:](self, "persistData:forKey:shouldPersist:", a3, a4, 1);
}

- (void)persistData:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
  -[SUCorePersistedState persistData:forKey:forType:shouldPersist:](self, "persistData:forKey:forType:shouldPersist:", a3, a4, 1, a5);
}

- (void)persistData:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeObjectForKey:ofClass:", v15, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "oslog");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v11;
            v30 = 2114;
            v31 = v10;
            _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with data value: %{public}@=%{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v16, "setValue:forKey:", v10, v11);
        if (!v6)
          goto LABEL_18;
      }
      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "oslog");
          v27 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v11;
            _os_log_impl(&dword_1B05B8000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state data for key: %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(v16, "removeObjectForKey:", v11);
        if (!v6)
          goto LABEL_18;
      }
      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v24);
      objc_msgSend(v22, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v25, 8252, 0);

    }
LABEL_18:

    goto LABEL_19;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to persist data for key with value: %@=%@"), v11, v10);
  objc_msgSend(v20, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v21, 8250, 0);

LABEL_19:
}

- (void)persistDate:(id)a3 forKey:(id)a4
{
  -[SUCorePersistedState persistDate:forKey:shouldPersist:](self, "persistDate:forKey:shouldPersist:", a3, a4, 1);
}

- (void)persistDate:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
  -[SUCorePersistedState persistDate:forKey:forType:shouldPersist:](self, "persistDate:forKey:forType:shouldPersist:", a3, a4, 1, a5);
}

- (void)persistDate:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeObjectForKey:ofClass:", v15, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "oslog");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v11;
            v30 = 2114;
            v31 = v10;
            _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with date value: %{public}@=%{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v16, "setValue:forKey:", v10, v11);
        if (!v6)
          goto LABEL_18;
      }
      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "oslog");
          v27 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v11;
            _os_log_impl(&dword_1B05B8000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state date for key: %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(v16, "removeObjectForKey:", v11);
        if (!v6)
          goto LABEL_18;
      }
      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v24);
      objc_msgSend(v22, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v25, 8252, 0);

    }
LABEL_18:

    goto LABEL_19;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to persist date for key with value: %@=%@"), v11, v10);
  objc_msgSend(v20, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v21, 8250, 0);

LABEL_19:
}

- (void)persistObject:(id)a3 forKey:(id)a4
{
  -[SUCorePersistedState persistObject:forKey:shouldPersist:](self, "persistObject:forKey:shouldPersist:", a3, a4, 1);
}

- (void)persistObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
  -[SUCorePersistedState persistObject:forKey:forType:shouldPersist:](self, "persistObject:forKey:forType:shouldPersist:", a3, a4, 1, a5);
}

- (void)persistObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeObjectForKey:ofClass:", v15, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "oslog");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = v11;
            v30 = 2114;
            v31 = v10;
            _os_log_impl(&dword_1B05B8000, v19, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] setting persisted state for key with object value: %{public}@=%{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v16, "setValue:forKey:", v10, v11);
        if (!v6)
          goto LABEL_18;
      }
      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "oslog");
          v27 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v11;
            _os_log_impl(&dword_1B05B8000, v27, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] removing persisted state object for key: %{public}@", buf, 0xCu);
          }

        }
        objc_msgSend(v16, "removeObjectForKey:", v11);
        if (!v6)
          goto LABEL_18;
      }
      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("failed to load dictionary for SUCorePersistedStateType=%@"), v24);
      objc_msgSend(v22, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v25, 8252, 0);

    }
LABEL_18:

    goto LABEL_19;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to persist object for key with value: %@=%@"), v11, v10);
  objc_msgSend(v20, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v21, 8250, 0);

LABEL_19:
}

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4
{
  -[SUCorePersistedState persistSecureCodedObject:forKey:shouldPersist:](self, "persistSecureCodedObject:forKey:shouldPersist:", a3, a4, 1);
}

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
  -[SUCorePersistedState persistSecureCodedObject:forKey:forType:shouldPersist:](self, "persistSecureCodedObject:forKey:forType:shouldPersist:", a3, a4, 3, a5);
}

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if ((v7 & 0xFFFFFFFE) == 2)
  {
    if (v10)
    {
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;
      if (v14)
      {
        +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("failed to use NSKeyedArchiver to archive the object into encoded NSData"), 8254, v14);

      }
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    -[SUCorePersistedState persistData:forKey:forType:shouldPersist:](self, "persistData:forKey:forType:shouldPersist:", v13, v11, v7, v6);

  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("invalid SUCorePersistedStateType (%@) provided for secure coded object persistence"), v18);
    objc_msgSend(v16, "trackAnomaly:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v19, 8253, 0);

  }
}

- (void)persistState
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCorePersistedState persistedState](self, "persistedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCorePersistedState description](self, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v13 = v7;
        _os_log_impl(&dword_1B05B8000, v6, OS_LOG_TYPE_DEFAULT, "[PERSISTED_STATE] persisting the state %{public}@", buf, 0xCu);

      }
    }
    -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePersistedState description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("unable to persist state: %@"), v9);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v10, 8250, 0);

  }
}

- (id)summary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePersistedState persistencePath](self, "persistencePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState versionPolicyLayer](self, "versionPolicyLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState versionSUCore](self, "versionSUCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("persistencePath:%@, versionPolicyLayer:%@, versionSUCore:%@"), v4, v5, v6);

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePersistedState persistencePath](self, "persistencePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState versionPolicyLayer](self, "versionPolicyLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState versionSUCore](self, "versionSUCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState persistedState](self, "persistedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("\n[>>>\n    persistencePath: %@\n versionPolicyLayer: %@\n      versionSUCore: %@\n     persistedState: %@\n<<<]"), v4, v5, v6, v7);

  return v8;
}

- (void)_writePersistedState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  int *v16;
  void *v17;
  id v18;
  id v19;

  v3 = (void *)MEMORY[0x1E0CB38B0];
  -[SUCorePersistedState persistedState](self, "persistedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;

  if (v5)
  {
    -[SUCorePersistedState persistencePath](self, "persistencePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6;
    v8 = objc_msgSend(v5, "writeToFile:options:error:", v7, 268435457, &v18);
    v9 = v18;

    if ((v8 & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3608];
      -[SUCorePersistedState persistencePath](self, "persistencePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileHandleForUpdatingAtPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "synchronizeFile");
        objc_msgSend(v12, "closeFile");
      }
      else
      {
        +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc(MEMORY[0x1E0CB3940]);
        v15 = *__error();
        v16 = __error();
        v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("failed to open persistence file: %d - message: %s"), v15, strerror(*v16));
        objc_msgSend(v13, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), v17, 8121, 0);

      }
    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("failed to write persistence file"), 8109, v9);
    }
    v6 = v9;
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackError:forReason:withResult:withError:", CFSTR("[PERSISTED_STATE]"), CFSTR("failed to serialize persisted state to plist"), 8106, v6);
  }

}

- (id)_createEmptyPersistedState
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setValue:forKey:", CFSTR("SoftwareUpdateCorePersistedStateFile"), CFSTR("SUCorePersistedStateContentsType"));
  -[SUCorePersistedState versionSUCore](self, "versionSUCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("SUCorePersistedStateCoreVersion"));

  -[SUCorePersistedState versionPolicyLayer](self, "versionPolicyLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("SUCorePersistedStatePolicyVersion"));

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, v9);

  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, v11);

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v12, v13);

  return v3;
}

- (id)_keyNameForPersistedStateType:(int)a3
{
  if (a3 < 4)
    return *(&off_1E611D128 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SUCorePersistedStateTypeUnknown(%d)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OS_dispatch_queue)persistedStateQueue
{
  return self->_persistedStateQueue;
}

- (NSString)persistencePath
{
  return self->_persistencePath;
}

- (void)setPersistencePath:(id)a3
{
  objc_storeStrong((id *)&self->_persistencePath, a3);
}

- (NSString)versionPolicyLayer
{
  return self->_versionPolicyLayer;
}

- (void)setVersionPolicyLayer:(id)a3
{
  objc_storeStrong((id *)&self->_versionPolicyLayer, a3);
}

- (BOOL)defaultLevelLogging
{
  return self->_defaultLevelLogging;
}

- (void)setDefaultLevelLogging:(BOOL)a3
{
  self->_defaultLevelLogging = a3;
}

- (NSMutableDictionary)persistedState
{
  return self->_persistedState;
}

- (void)setPersistedState:(id)a3
{
  objc_storeStrong((id *)&self->_persistedState, a3);
}

- (NSString)versionSUCore
{
  return self->_versionSUCore;
}

- (void)setVersionSUCore:(id)a3
{
  objc_storeStrong((id *)&self->_versionSUCore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionSUCore, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_versionPolicyLayer, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
  objc_storeStrong((id *)&self->_persistedStateQueue, 0);
}

@end

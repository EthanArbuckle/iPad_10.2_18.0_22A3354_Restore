@implementation _PASDatabaseMigrator

- (_PASDatabaseMigrator)initWithMigrationObjects:(id)a3
{
  id v4;
  _PASDatabaseMigrator *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _PASLock *v16;
  _PASLock *contexts;
  _PASDatabaseMigrator *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_PASDatabaseMigrator;
  v5 = -[_PASDatabaseMigrator init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1A1AFDC98](v8);
          -[_PASDatabaseMigrator _contextForMigrationObject:](v5, "_contextForMigrationObject:", v12, (_QWORD)v20);
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v12;
              _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "could not create context for migration %@", buf, 0xCu);
            }
            objc_autoreleasePoolPop(v13);

            v18 = 0;
            goto LABEL_15;
          }
          v15 = (void *)v14;
          objc_msgSend(v6, "addObject:", v14);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
        v9 = v8;
        if (v8)
          continue;
        break;
      }
    }

    v16 = -[_PASLock initWithGuardedData:]([_PASLock alloc], "initWithGuardedData:", v6);
    contexts = v5->_contexts;
    v5->_contexts = v16;

  }
  v18 = v5;
LABEL_15:

  return v18;
}

- (unsigned)migrateDatabases
{
  return -[_PASDatabaseMigrator migrateDatabasesToVersion:](self, "migrateDatabasesToVersion:", 0xFFFFFFFFLL);
}

- (unsigned)migrateDatabasesToVersion:(unsigned int)a3
{
  _PASLock *contexts;
  unsigned __int8 v4;
  _QWORD v6[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  contexts = self->_contexts;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50___PASDatabaseMigrator_migrateDatabasesToVersion___block_invoke;
  v6[3] = &unk_1E442F9F8;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  -[_PASLock runWithLockAcquired:](contexts, "runWithLockAcquired:", v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unsigned)unmigrateDatabases
{
  _PASLock *contexts;
  unsigned __int8 v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  contexts = self->_contexts;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42___PASDatabaseMigrator_unmigrateDatabases__block_invoke;
  v5[3] = &unk_1E442FA20;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](contexts, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)migrationNeeded
{
  _PASLock *contexts;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  contexts = self->_contexts;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39___PASDatabaseMigrator_migrationNeeded__block_invoke;
  v5[3] = &unk_1E442FA20;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](contexts, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)description
{
  void *v3;
  _PASLock *contexts;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<_PASDatabaseMigrator: "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  contexts = self->_contexts;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35___PASDatabaseMigrator_description__block_invoke;
  v8[3] = &unk_1E442FA48;
  v9 = v3;
  v5 = v3;
  -[_PASLock runWithLockAcquired:](contexts, "runWithLockAcquired:", v8);
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(">"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_contextForMigrationObject:(id)a3
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_opt_new();
  objc_storeStrong((id *)(v7 + 8), a3);
  objc_msgSend(v6, "databaseHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v8;

  if (!*(_QWORD *)(v7 + 16))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed to get database handle from %@", buf, 0xCu);
      if (*(_QWORD *)(v7 + 16))
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDatabaseMigrator.m"), 126, CFSTR("failed to get database handle from %@"), v6);
    goto LABEL_8;
  }
  objc_msgSend(v6, "migrations");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v10;

  if (!*(_QWORD *)(v7 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed to get migrations from %@", buf, 0xCu);
      if (*(_QWORD *)(v7 + 32))
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDatabaseMigrator.m"), 133, CFSTR("failed to get migrations from %@"), v6);
LABEL_8:

LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  *(_DWORD *)(v7 + 24) = objc_msgSend(*(id *)(v7 + 16), "userVersion");
  v12 = (id)v7;
LABEL_10:

  return v12;
}

- (unsigned)_migrateDatabasesWithContexts:(id)a3 toVersion:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  _DWORD *v18;
  int v19;
  _DWORD *v20;
  int v21;
  _DWORD *v22;
  NSObject *v23;
  const char *v24;
  _DWORD *v25;
  int v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  _PASDatabaseMigrator *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v4 = *(_QWORD *)&a4;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1A0957000, "_PASDatabaseMigrator migrateDatabases", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_PASDatabaseMigrator migrateDatabases called", buf, 2u);
  }
  -[_PASDatabaseMigrator _prepareContexts:](self, "_prepareContexts:", v6);
  if (-[_PASDatabaseMigrator _anyContextHasFutureVersionWithContexts:](self, "_anyContextHasFutureVersionWithContexts:", v6))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Future database version detected. Giving up on migration.", buf, 2u);
    }
    LOBYTE(v8) = 3;
    goto LABEL_41;
  }
  if (-[_PASDatabaseMigrator _anyContextHasMismatchedVersionWithContexts:](self, "_anyContextHasMismatchedVersionWithContexts:", v6))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Mismatched database versions detected. Giving up on migration.", buf, 2u);
    }
    LOBYTE(v8) = 5;
    goto LABEL_41;
  }
  if ((_DWORD)v4 != -1)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    if (!v10)
      goto LABEL_21;
    v11 = *(_QWORD *)v30;
LABEL_14:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(v9);
      v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12);
      if (objc_msgSend(*(id *)(v13 + 32), "count") < (unint64_t)v4)
        break;
      if (*(_DWORD *)(v13 + 24) > v4)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_WORD *)buf = 0;
        v23 = MEMORY[0x1E0C81028];
        v24 = "Requested migration to a specific version which is less than the current version";
        goto LABEL_43;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
        if (v10)
          goto LABEL_14;
LABEL_21:

LABEL_24:
        v15 = MEMORY[0x1E0C81028];
        *(_QWORD *)&v14 = 138412802;
        v28 = v14;
        while (1)
        {
          if (!-[_PASDatabaseMigrator _migrationNeededWithContexts:toVersion:](self, "_migrationNeededWithContexts:toVersion:", v6, v4, v28, (_QWORD)v29))
          {
            LOBYTE(v8) = 1;
            goto LABEL_36;
          }
          v16 = -[_PASDatabaseMigrator _canContinueMigratingWithContexts:](self, "_canContinueMigratingWithContexts:", v6);
          v17 = v15;
          if (!v16)
            break;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v18 = (_DWORD *)objc_claimAutoreleasedReturnValue();
            v19 = v18[6];
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v20 = (_DWORD *)objc_claimAutoreleasedReturnValue();
            v21 = v20[6] + 1;
            *(_DWORD *)buf = v28;
            v35 = self;
            v36 = 1024;
            v37 = v19;
            v38 = 1024;
            v39 = v21;
            _os_log_impl(&dword_1A0957000, v15, OS_LOG_TYPE_INFO, "_PASDatabaseMigrator: %@ migrating %u -> %u", buf, 0x18u);

          }
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v22 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          v8 = -[_PASDatabaseMigrator _migrateOneStepToVersion:contexts:](self, "_migrateOneStepToVersion:contexts:", (v22[6] + 1), v6);

          if (v8 != 4)
            goto LABEL_36;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v25 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          v26 = v25[6];
          *(_DWORD *)buf = 67109120;
          LODWORD(v35) = v26;
          _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "database migration bailing out at version %u.", buf, 8u);

        }
        LOBYTE(v8) = 0;
        goto LABEL_41;
      }
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_34:

      LOBYTE(v8) = 2;
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v23 = MEMORY[0x1E0C81028];
    v24 = "Requested migration to a specific version which exceeds the migration step count";
LABEL_43:
    _os_log_error_impl(&dword_1A0957000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_34;
  }
  if (!-[_PASDatabaseMigrator _allContextsAtVersionZeroWithContexts:](self, "_allContextsAtVersionZeroWithContexts:", v6))goto LABEL_24;
  v8 = -[_PASDatabaseMigrator _skipFromZeroSchemaWithContexts:](self, "_skipFromZeroSchemaWithContexts:", v6);
  if (v8 == 4)
    goto LABEL_24;
LABEL_36:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = self;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_PASDatabaseMigrator: %@: done migrating", buf, 0xCu);
  }
LABEL_41:
  os_activity_scope_leave(&state);

  return v8;
}

- (unsigned)_unmigrateDatabasesWithContexts:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PASDatabaseMigrator _prepareContexts:](self, "_prepareContexts:", v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A1AFDC98](v6);
        if (-[_PASDatabaseMigrator _clearDatabase:](self, "_clearDatabase:", *(_QWORD *)(v10 + 16), (_QWORD)v14) == 2)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v10;
            _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed to clear db: %@", buf, 0xCu);
          }
          if (_PASEvaluateLogFaultAndProbCrashCriteria())
            abort();
          objc_autoreleasePoolPop(v11);
          v12 = 2;
          goto LABEL_14;
        }
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)_migrationNeededWithContexts:(id)a3 toVersion:(unsigned int)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_PASDatabaseMigrator _prepareContexts:](self, "_prepareContexts:", v6);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1A1AFDC98](v8);
        v14 = *(unsigned int *)(v12 + 24);
        v15 = a4;
        if (a4 == -1)
          v15 = objc_msgSend(*(id *)(v12 + 32), "count", (_QWORD)v18);
        if (v15 != v14)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "migration needed: %@", buf, 0xCu);
          }
          objc_autoreleasePoolPop(v13);
          v16 = 1;
          goto LABEL_15;
        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)_canContinueMigratingWithContexts:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!+[_PASDeviceState isUnlocked](_PASDeviceState, "isUnlocked"))
  {
    if (+[_PASDeviceState isClassCLocked](_PASDeviceState, "isClassCLocked"))
    {
      v24 = 0uLL;
      v25 = 0uLL;
      v22 = 0uLL;
      v23 = 0uLL;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v23;
LABEL_6:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
          if (+[_PASSqliteDatabase contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:](_PASSqliteDatabase, "contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:", objc_msgSend(*(id *)(v10 + 16), "contentProtectionType", (_QWORD)v22)))
          {
            break;
          }
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            v4 = 1;
            if (v7)
              goto LABEL_6;
            goto LABEL_28;
          }
        }
        v4 = 0;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        v17 = *(_QWORD *)(v10 + 16);
        *(_DWORD *)buf = 138412290;
        v32 = v17;
        v18 = MEMORY[0x1E0C81028];
        v19 = "Migrations cannot continue due to content protection of %@ and device having never been unlocked.";
LABEL_27:
        _os_log_impl(&dword_1A0957000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
        v4 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      v28 = 0uLL;
      v29 = 0uLL;
      v26 = 0uLL;
      v27 = 0uLL;
      v11 = v3;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
LABEL_15:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
          if (+[_PASSqliteDatabase contentProtectionTypeRequiresDeviceToBeUnlocked:](_PASSqliteDatabase, "contentProtectionTypeRequiresDeviceToBeUnlocked:", objc_msgSend(*(id *)(v16 + 16), "contentProtectionType")))
          {
            break;
          }
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
            v4 = 1;
            if (v13)
              goto LABEL_15;
            goto LABEL_28;
          }
        }
        v4 = 0;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        v20 = *(_QWORD *)(v16 + 16);
        *(_DWORD *)buf = 138412290;
        v32 = v20;
        v18 = MEMORY[0x1E0C81028];
        v19 = "Migrations cannot continue due to content protection of %@ and device being locked.";
        goto LABEL_27;
      }
    }
    v4 = 1;
LABEL_28:

    goto LABEL_29;
  }
  v4 = 1;
LABEL_29:

  return v4;
}

- (unsigned)_skipFromZeroSchemaWithContexts:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned __int8 v15;
  void *v16;
  SEL v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v6)
  {
    v7 = v6;
    v18 = a2;
    v8 = *(_QWORD *)v21;
    v9 = MEMORY[0x1E0C81028];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1A1AFDC98]();
        v19 = 0;
        objc_msgSend(*(id *)(v11 + 8), "queriesToSkipFromEmptyToVersion:", &v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v14 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 134218498;
          v25 = v14;
          v26 = 2112;
          v27 = v11;
          v28 = 1024;
          v29 = v19;
          _os_log_impl(&dword_1A0957000, v9, OS_LOG_TYPE_INFO, "%tu skip queries for %@ jump to version %u", buf, 0x1Cu);
        }
        if (v19
          && -[_PASDatabaseMigrator _runQueries:nextVersion:context:](self, "_runQueries:nextVersion:context:", v13) == 2)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v11;
            _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed to migrate using skip queries: %@", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v18, self, CFSTR("_PASDatabaseMigrator.m"), 275, CFSTR("failed to migrate using skip queries: %@"), v11);

          objc_autoreleasePoolPop(v12);
          v15 = 2;
          goto LABEL_16;
        }

        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 4;
LABEL_16:

  return v15;
}

- (BOOL)_anyContextHasFutureVersionWithContexts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1A1AFDC98](v4);
        v10 = *(unsigned int *)(v8 + 24);
        if (objc_msgSend(*(id *)(v8 + 32), "count", (_QWORD)v14) < v10)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v11 = *(_DWORD *)(v8 + 24);
            v12 = *(_QWORD *)(v8 + 16);
            *(_DWORD *)buf = 67109378;
            v19 = v11;
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "future version (%u) detected on %@", buf, 0x12u);
          }
          objc_autoreleasePoolPop(v9);
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

- (BOOL)_anyContextHasMismatchedVersionWithContexts:(id)a3
{
  id v3;
  _DWORD *v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4[6];

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A1AFDC98](v7);
        v13 = v12;
        v14 = *(_DWORD *)(v11 + 24);
        if (v14 != v5)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v15 = *(_QWORD *)(v11 + 16);
            *(_DWORD *)buf = 67109634;
            v22 = v5;
            v23 = 1024;
            v24 = v14;
            v25 = 2112;
            v26 = v15;
            _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "mismatched version (%u != %u) detected on %@", buf, 0x18u);
          }
          objc_autoreleasePoolPop(v13);
          LOBYTE(v8) = 1;
          goto LABEL_13;
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

- (BOOL)_allContextsAtVersionZeroWithContexts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1A1AFDC98](v4);
        LODWORD(v8) = *(_DWORD *)(v8 + 24);
        objc_autoreleasePoolPop(v9);
        if ((_DWORD)v8)
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unsigned)_migrateOneStepToVersion:(unsigned int)a3 contexts:(id)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  uint64_t v49;

  v4 = *(_QWORD *)&a3;
  v49 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v38;
    v10 = v4;
    v11 = v4 - 1;
    while (2)
    {
      v12 = v5;
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v12);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1A1AFDC98]();
        v16 = *(_DWORD *)(v14 + 24);
        if (v16 != v11)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v43 = v14;
            v44 = 1024;
            v45 = v16;
            v46 = 1024;
            v47 = v10;
            _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "attempt to skip or repeat migration: %@ (%u != %u - 1)", buf, 0x18u);
          }
          if (_PASEvaluateLogFaultAndProbCrashCriteria())
            abort();
          v5 = v12;
          v20 = 3;
LABEL_16:
          objc_autoreleasePoolPop(v15);
          goto LABEL_17;
        }
        v17 = *(void **)(v14 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          ++v8;
        objc_autoreleasePoolPop(v15);
      }
      v5 = v12;
      v7 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v10 = v4;
    v8 = 0;
  }

  if (v8 == objc_msgSend(v5, "count"))
  {
    v20 = 1;
  }
  else if (v8)
  {
    v20 = 5;
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v5;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      while (2)
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          v15 = (void *)MEMORY[0x1A1AFDC98]();
          v27 = *(void **)(v26 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[_PASDatabaseMigrator _runQueries:nextVersion:context:](self, "_runQueries:nextVersion:context:", v29, v10, v26);

          if (v30 != 4)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v26;
              _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed to migrate context %@", buf, 0xCu);
            }
            v20 = 2;
            goto LABEL_16;
          }
          objc_autoreleasePoolPop(v15);
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        v20 = 4;
        if (v23)
          continue;
        break;
      }
    }
    else
    {
      v20 = 4;
    }
LABEL_17:

  }
  return v20;
}

- (unsigned)_runQueries:(id)a3 nextVersion:(unsigned int)a4 context:(id)a5
{
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _PASDatabaseMigrator *v16;
  id v17;
  unsigned int v18;

  v8 = a3;
  v9 = a5;
  v10 = (void *)v9[2];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56___PASDatabaseMigrator__runQueries_nextVersion_context___block_invoke;
  v14[3] = &unk_1E442FA70;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = a4;
  v11 = v9;
  v12 = v8;
  LODWORD(v10) = objc_msgSend(v10, "frailWriteTransaction:", v14);

  if ((_DWORD)v10)
    return 4;
  else
    return 2;
}

- (unsigned)_runQuery:(id)a3 context:(id)a4 database:(id)a5
{
  NSString *v7;
  id *v8;
  id v9;
  NSObject *v10;
  id v11;
  SEL v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  NSString *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = (NSString *)a3;
  v8 = (id *)a4;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 4;
  v10 = MEMORY[0x1E0C81028];
  v11 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "filename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "migrator for %@ running query: %@", buf, 0x16u);

  }
  v12 = NSSelectorFromString(v7);
  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      LOBYTE(v12) = ((uint64_t (*)(id, SEL))objc_msgSend(v8[1], "methodForSelector:", v12))(v8[1], v12);
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51___PASDatabaseMigrator__runQuery_context_database___block_invoke;
      v15[3] = &unk_1E442FA98;
      v16 = v9;
      v17 = v7;
      v18 = &v19;
      objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", v17, 0, 0, v15);
      LOBYTE(v12) = *((_BYTE *)v20 + 24);

    }
  }
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (void)_prepareContexts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1A1AFDC98](v4);
        *(_DWORD *)(v8 + 24) = objc_msgSend(*(id *)(v8 + 16), "userVersion", (_QWORD)v10);
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = v4;
    }
    while (v4);
  }

}

- (unsigned)_clearDatabase:(id)a3
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _PASDatabaseMigrator *v10;
  uint64_t *v11;
  SEL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke;
  v8[3] = &unk_1E442FDA0;
  v6 = v5;
  v11 = &v13;
  v12 = a2;
  v9 = v6;
  v10 = self;
  objc_msgSend(v6, "writeTransaction:", v8);
  LOBYTE(a2) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return a2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
}

@end

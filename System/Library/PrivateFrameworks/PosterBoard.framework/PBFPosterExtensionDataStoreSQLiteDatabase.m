@implementation PBFPosterExtensionDataStoreSQLiteDatabase

- (PBFPosterExtensionDataStoreSQLiteDatabase)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  PBFPosterExtensionDataStoreSQLiteDatabase *v10;
  uint64_t v11;
  NSURL *URL;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v21;
  unsigned int v22;
  uint64_t v23;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  int v34;
  NSObject *v35;
  int v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  id v41;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v42;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *lock_readonlyImpl;
  PBFPosterExtensionDataStoreSQLiteDatabase *v44;
  void *v46;
  id *v47;
  id v48;
  void *v49;
  PBFPosterExtensionDataStoreSQLiteDatabase *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  objc_super v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  _QWORD v66[3];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("databaseURL"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreSQLiteDatabase initWithURL:options:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAA2078);
  }
  v9 = v8;
  v61.receiver = self;
  v61.super_class = (Class)PBFPosterExtensionDataStoreSQLiteDatabase;
  v10 = -[PBFPosterExtensionDataStoreSQLiteDatabase init](&v61, sel_init);
  if (!v10)
    goto LABEL_45;
  v11 = objc_msgSend(v9, "copy");
  URL = v10->_URL;
  v10->_URL = (NSURL *)v11;

  v10->_options = a4;
  -[PBFPosterExtensionDataStoreSQLiteDatabase setCheckpointWALOnInvalidate:](v10, "setCheckpointWALOnInvalidate:", 1);
  v10->_lock._os_unfair_lock_opaque = 0;
  v10->_readwriteLock._os_unfair_lock_opaque = 0;
  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v9, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", CFSTR("-shm"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v9, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingString:", CFSTR("-wal"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fileURLWithPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v10;
  v47 = a5;
  if ((a4 & 0xA) != 0)
  {
    v21 = [_PBFPosterExtensionDataStoreSQLiteDatabaseImpl alloc];
    if ((a4 & 2) != 0)
      v22 = 6;
    else
      v22 = 2;
    if ((a4 & 4) != 0)
      v23 = 1;
    else
      v23 = v22;
    v60 = 0;
    v24 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl initWithURL:options:error:](v21, "initWithURL:options:error:", v9, v23, &v60);
    v25 = v60;
    v26 = v25;
    if (((a4 & 8) != 0 || (a4 & 2) != 0) && !v25)
    {
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl setup](v24, "setup");
      v27 = objc_claimAutoreleasedReturnValue();

      v26 = (id)v27;
    }
    goto LABEL_20;
  }
  if ((a4 & 4) != 0)
  {
    if (!objc_msgSend(v16, "checkResourceIsReachableAndReturnError:", 0)
      || (v26 = 0, (objc_msgSend(v20, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0))
    {
      v59 = 0;
      v24 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl initWithURL:options:error:]([_PBFPosterExtensionDataStoreSQLiteDatabaseImpl alloc], "initWithURL:options:error:", v9, 2, &v59);
      v26 = v59;
LABEL_20:
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl invalidate](v24, "invalidate");

    }
  }
  else if ((a4 & 1) != 0)
  {
    v26 = 0;
  }
  else
  {
    _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, 0, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = v26;
  v49 = v20;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v66[0] = v16;
  v66[1] = v20;
  v51 = v9;
  v66[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v56 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v34 = objc_msgSend(v33, "pbf_allowSuspendWithOpenFileHandle");
        PBFLogSQLite();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v63 = v33;
          v64 = 1024;
          LODWORD(v65) = v34;
          _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEFAULT, "Database file at %{public}@ allowSuspendWithOpenFileHandle: %{BOOL}u", buf, 0x12u);
        }

        if ((v34 & 1) == 0)
        {
          v54 = 0;
          v36 = objc_msgSend(v33, "pbf_setAllowSuspendWithOpenFileHandle:error:", 1, &v54);
          v37 = v54;
          PBFLogSQLite();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v36)
          {
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v40 = objc_msgSend(v33, "pbf_allowSuspendWithOpenFileHandle");
              *(_DWORD *)buf = 138543618;
              v63 = v33;
              v64 = 1024;
              LODWORD(v65) = v40;
              _os_log_impl(&dword_1CB9FA000, v39, OS_LOG_TYPE_DEFAULT, "Database file at %{public}@ was updated to allowSuspendWithOpenFileHandle: %{BOOL}u", buf, 0x12u);
            }
          }
          else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v63 = v33;
            v64 = 2114;
            v65 = v37;
            _os_log_error_impl(&dword_1CB9FA000, v39, OS_LOG_TYPE_ERROR, "Database file at %{public}@ failed to update allowSuspendWithOpenFileHandle! Error: %{public}@", buf, 0x16u);
          }

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v30);
  }

  v10 = v50;
  v9 = v51;
  v41 = v48;
  if (!v48)
  {
    v53 = 0;
    v42 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl initWithURL:options:error:]([_PBFPosterExtensionDataStoreSQLiteDatabaseImpl alloc], "initWithURL:options:error:", v51, 1, &v53);
    v41 = v53;
    lock_readonlyImpl = v50->_lock_readonlyImpl;
    v50->_lock_readonlyImpl = v42;

    if (!v41)
    {
      v52 = 0;
      -[PBFPosterExtensionDataStoreSQLiteDatabase validateDatabaseWithError:](v50, "validateDatabaseWithError:", &v52);
      v41 = v52;
      if (!v41)
      {

LABEL_45:
        v44 = v10;
        goto LABEL_46;
      }
    }
  }
  if (v47)
    *v47 = objc_retainAutorelease(v41);
  -[PBFPosterExtensionDataStoreSQLiteDatabase invalidate](v50, "invalidate");

  v44 = 0;
LABEL_46:

  return v44;
}

- (unint64_t)version
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl version](self->_lock_readonlyImpl, "version");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)underlyingReadonlyDatabaseConnection
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v4 = 0;
  }
  else
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl connection](self->_lock_readonlyImpl, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)validateDatabaseWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  BOOL v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a3)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl validateDatabaseWithError:](self->_lock_readonlyImpl, "validateDatabaseWithError:", a3);
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *lock_readonlyImpl;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl invalidate](self->_lock_readonlyImpl, "invalidate");
  lock_readonlyImpl = self->_lock_readonlyImpl;
  self->_lock_readonlyImpl = 0;

  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
}

- (id)dataStoreMetadataWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a3)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl dataStoreMetadataWithError:](self->_lock_readonlyImpl, "dataStoreMetadataWithError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)roleIdentifiersWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a3)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl roleIdentifiersWithError:](self->_lock_readonlyImpl, "roleIdentifiersWithError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)extensionIdentifiersForRole:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a4)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl extensionIdentifiersForRole:error:](self->_lock_readonlyImpl, "extensionIdentifiersForRole:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)attributeIdentifiersForPoster:(id)a3 roleId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  void *v11;

  v8 = a3;
  v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a5)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributeIdentifiersForPoster:roleId:error:](self->_lock_readonlyImpl, "attributeIdentifiersForPoster:roleId:error:", v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)extensionIdentifierForPosterUUID:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a4)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl extensionIdentifierForPosterUUID:error:](self->_lock_readonlyImpl, "extensionIdentifierForPosterUUID:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)posterUUIDsForExtensionIdentifier:(id)a3 role:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  void *v11;

  v8 = a3;
  v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a5)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl posterUUIDsForExtensionIdentifier:role:error:](self->_lock_readonlyImpl, "posterUUIDsForExtensionIdentifier:role:error:", v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  id result;
  void *v11;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      if (a4)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl sortedPosterUUIDsForRole:error:](self->_lock_readonlyImpl, "sortedPosterUUIDsForRole:error:", v7, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_unlock(p_lock);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreSQLiteDatabase sortedPosterUUIDsForRole:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)roleDisplayNamesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  id result;
  void *v11;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "count"))
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      if (self->_lock_invalidated)
      {
        if (a4)
        {
          _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
          v9 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
      }
      else
      {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl roleDisplayNamesForIdentifiers:error:](self->_lock_readonlyImpl, "roleDisplayNamesForIdentifiers:error:", v7, a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA70];
    }

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreSQLiteDatabase roleDisplayNamesForIdentifiers:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)checkIfPosterUUIDs:(id)a3 belongToRole:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  os_unfair_lock_s *p_lock;
  BOOL v12;
  BOOL result;
  void *v14;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v8, "count"))
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      if (self->_lock_invalidated)
      {
        if (a5)
        {
          _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
          v12 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl checkIfPosterUUIDs:belongToRole:error:](self->_lock_readonlyImpl, "checkIfPosterUUIDs:belongToRole:error:", v8, v10, a5);
      }
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v12 = 0;
    }

    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreSQLiteDatabase checkIfPosterUUIDs:belongToRole:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)selectedPosterUUIDForRole:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  id result;
  void *v11;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      if (a4)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl selectedPosterUUIDForRole:error:](self->_lock_readonlyImpl, "selectedPosterUUIDForRole:error:", v7, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_unlock(p_lock);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreSQLiteDatabase selectedPosterUUIDForRole:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)attributeForPoster:(id)a3 roleId:(id)a4 attributeId:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  os_unfair_lock_s *p_lock;
  void *v15;
  id result;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = v12;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      if (a6)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
        v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributeForPoster:roleId:attributeId:error:](self->_lock_readonlyImpl, "attributeForPoster:roleId:attributeId:error:", v10, v11, v13, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_unlock(p_lock);

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreSQLiteDatabase attributeForPoster:roleId:attributeId:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)attributesForPoster:(id)a3 roleId:(id)a4 attributeIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  os_unfair_lock_s *p_lock;
  void *v15;
  id result;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = v12;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      if (a6)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
        v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributesForPoster:roleId:attributeIdentifiers:error:](self->_lock_readonlyImpl, "attributesForPoster:roleId:attributeIdentifiers:error:", v10, v11, v13, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_unlock(p_lock);

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreSQLiteDatabase attributesForPoster:roleId:attributeIdentifiers:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)performChanges:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 lock_invalidated;
  BOOL v9;
  NSObject *v10;
  os_unfair_lock_s *p_readwriteLock;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v12;
  NSURL *URL;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v14;
  id v15;
  id v16;
  BOOL result;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  os_activity_scope_state_s state;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    os_unfair_lock_lock(&self->_lock);
    lock_invalidated = self->_lock_invalidated;
    os_unfair_lock_unlock(&self->_lock);
    if (lock_invalidated)
    {
      v9 = 0;
LABEL_20:

      return v9;
    }
    v10 = _os_activity_create(&dword_1CB9FA000, "-[PBFPosterExtensionDataStoreSQLiteDatabase performChanges:error:]", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DETACHED);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    p_readwriteLock = &self->_readwriteLock;
    os_unfair_lock_lock(&self->_readwriteLock);
    if ((self->_options & 4) != 0)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, CFSTR("readonly database"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v9 = 0;
LABEL_16:
      os_activity_scope_leave(&state);
      os_unfair_lock_unlock(p_readwriteLock);
      if (a4)
      {
        if (v16)
          *a4 = objc_retainAutorelease(v16);
      }

      goto LABEL_20;
    }
    v12 = [_PBFPosterExtensionDataStoreSQLiteDatabaseImpl alloc];
    URL = self->_URL;
    v22 = 0;
    v14 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl initWithURL:options:error:](v12, "initWithURL:options:error:", URL, 2, &v22);
    v15 = v22;
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl setCheckpointWALOnInvalidate:](v14, "setCheckpointWALOnInvalidate:", -[PBFPosterExtensionDataStoreSQLiteDatabase checkpointWALOnInvalidate](self, "checkpointWALOnInvalidate"));
    if (v15)
    {
      v16 = v15;
      v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
    if (v14)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66__PBFPosterExtensionDataStoreSQLiteDatabase_performChanges_error___block_invoke;
      v20[3] = &unk_1E86F6578;
      v21 = v7;
      v19 = 0;
      v9 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl performChanges:error:](v14, "performChanges:error:", v20, &v19);
      v16 = v19;

      if (v9)
      {
LABEL_14:
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl invalidate](v14, "invalidate");
        goto LABEL_15;
      }
    }
    else
    {
      v9 = 0;
      v16 = 0;
    }
    if (!v16)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(4, 0, 0, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("changeHandler"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PBFPosterExtensionDataStoreSQLiteDatabase performChanges:error:].cold.1();
  objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __66__PBFPosterExtensionDataStoreSQLiteDatabase_performChanges_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl cancel](self->_lock_readonlyImpl, "cancel");
  os_unfair_lock_unlock(p_lock);
}

- (NSURL)URL
{
  return self->_URL;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)checkpointWALOnInvalidate
{
  return self->_checkpointWALOnInvalidate;
}

- (void)setCheckpointWALOnInvalidate:(BOOL)a3
{
  self->_checkpointWALOnInvalidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_lock_readonlyImpl, 0);
}

- (void)initWithURL:options:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)sortedPosterUUIDsForRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)roleDisplayNamesForIdentifiers:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)checkIfPosterUUIDs:belongToRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)selectedPosterUUIDForRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributeForPoster:roleId:attributeId:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributesForPoster:roleId:attributeIdentifiers:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)performChanges:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end

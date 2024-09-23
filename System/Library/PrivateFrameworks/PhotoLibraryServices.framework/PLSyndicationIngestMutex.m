@implementation PLSyndicationIngestMutex

- (PLSyndicationIngestMutex)initWithDatabaseContext:(id)a3
{
  id v4;
  PLSyndicationIngestMutex *v5;
  PLSyndicationIngestMutex *v6;
  PLPhotoLibrary *syndicationIngestLibrary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSyndicationIngestMutex;
  v5 = -[PLSyndicationIngestMutex init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_databaseContext, v4);
    syndicationIngestLibrary = v6->_syndicationIngestLibrary;
    v6->_syndicationIngestLibrary = 0;

    v6->_syndicationIngestLibraryLock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v6->_syndicationIngestClientIdentifier = 0;
  }

  return v6;
}

- (id)syndicationIngestMutexStateDescription
{
  os_unfair_lock_s *p_syndicationIngestLibraryLock;
  double v4;
  double v5;
  int requestedSyndicationIngestClientIdentifier;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  p_syndicationIngestLibraryLock = &self->_syndicationIngestLibraryLock;
  os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
  -[NSDate timeIntervalSinceNow](self->_syndicationIngestLibraryUsageStart, "timeIntervalSinceNow");
  v5 = 0.0 - v4;
  requestedSyndicationIngestClientIdentifier = self->_requestedSyndicationIngestClientIdentifier;
  v7 = (void *)MEMORY[0x1E0CB3940];
  PLSyndicationIngestClientStringFromIdentifier(self->_syndicationIngestClientIdentifier);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (requestedSyndicationIngestClientIdentifier)
  {
    PLSyndicationIngestClientStringFromIdentifier(self->_requestedSyndicationIngestClientIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Active: %@ (%f sec), Waiting: %@"), v9, *(_QWORD *)&v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Active: %@ (%f sec), No contention"), v8, *(_QWORD *)&v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
  return v11;
}

- (id)_obtainSyndicationIngestLibraryIfPossibleWithIdentifier:(unsigned __int8)a3
{
  uint64_t v3;
  PLPhotoLibrary *v6;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  PLPhotoLibrary *v12;
  PLPhotoLibrary *syndicationIngestLibrary;
  PLPhotoLibrary *v14;
  NSDate *v15;
  NSDate *syndicationIngestLibraryUsageStart;
  void *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[16];

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_syndicationIngestLibraryLock);
  if (self->_syndicationIngestClientIdentifier == (_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationIngestMutex.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_syndicationIngestClientIdentifier != identifier"));

  }
  if (!self->_syndicationIngestLibrary && self->_requestedSyndicationIngestClientIdentifier <= v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_databaseContext);
    v9 = WeakRetained;
    if (WeakRetained)
    {
      v10 = objc_msgSend(WeakRetained, "wellKnownPhotoLibraryIdentifier");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSharingIngestLibrary(%tu)-%hhu"), v10, v3);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (PLPhotoLibrary *)objc_msgSend(v9, "newShortLivedLibraryWithName:", objc_msgSend(v11, "UTF8String"));
      syndicationIngestLibrary = self->_syndicationIngestLibrary;
      self->_syndicationIngestLibrary = v12;

      v14 = self->_syndicationIngestLibrary;
      if (v14)
      {
        self->_syndicationIngestClientIdentifier = v3;
        self->_requestedSyndicationIngestClientIdentifier = 0;
        v6 = v14;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
        syndicationIngestLibraryUsageStart = self->_syndicationIngestLibraryUsageStart;
        self->_syndicationIngestLibraryUsageStart = v15;

LABEL_15:
        return v6;
      }
      PLSyndicationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "(MUTEX) did not obtain library from database context. Probably shutting down.", buf, 2u);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationIngestMutex.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseContext"));

    }
    v6 = 0;
    goto LABEL_15;
  }
  v6 = 0;
  return v6;
}

- (id)tryUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_syndicationIngestLibraryLock;
  void *v6;
  PLPhotoLibrary *syndicationIngestLibrary;
  NSObject *p_super;
  useconds_t v9;
  __int128 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  PLPhotoLibrary *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v25;
  void *v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  if (!PLSyndicationRuntimeEnabled())
  {
    PLSyndicationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "(MUTEX) Syndication runtime is disabled via internal user defaults", buf, 2u);
    }

    v6 = 0;
    return v6;
  }
  p_syndicationIngestLibraryLock = &self->_syndicationIngestLibraryLock;
  os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
  -[PLSyndicationIngestMutex _obtainSyndicationIngestLibraryIfPossibleWithIdentifier:](self, "_obtainSyndicationIngestLibraryIfPossibleWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || self->_syndicationIngestClientIdentifier >= v3)
  {
LABEL_21:
    os_unfair_lock_unlock(&self->_syndicationIngestLibraryLock);
    return v6;
  }
  syndicationIngestLibrary = self->_syndicationIngestLibrary;
  if (!syndicationIngestLibrary)
  {
    PLSyndicationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_INFO, "(MUTEX) could not get a library and it's not already in use. Probably shutting down.", buf, 2u);
    }

    goto LABEL_21;
  }
  self->_requestedSyndicationIngestClientIdentifier = v3;
  p_super = syndicationIngestLibrary;
  os_unfair_lock_unlock(&self->_syndicationIngestLibraryLock);
  v9 = 10000;
  *(_QWORD *)&v10 = 138412290;
  v27 = v10;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      PLSyndicationIngestClientStringFromIdentifier(v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v27;
      v29 = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "(MUTEX) %@ Waiting for syndication ingest mutex", buf, 0xCu);

    }
    -[NSObject performBlockAndWait:](p_super, "performBlockAndWait:", &__block_literal_global_91234);
    objc_msgSend(v11, "timeIntervalSinceNow");
    v15 = v14;
    PLSyndicationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      PLSyndicationIngestClientStringFromIdentifier(v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v17;
      v30 = 2048;
      v31 = 0.0 - v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "(MUTEX) %@ Done waiting for syndication ingest mutex. Blocked for %f sec", buf, 0x16u);

    }
    os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
    -[PLSyndicationIngestMutex _obtainSyndicationIngestLibraryIfPossibleWithIdentifier:](self, "_obtainSyndicationIngestLibraryIfPossibleWithIdentifier:", v3);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
      break;
    v19 = self->_syndicationIngestLibrary;

    if (!v19)
    {
      PLSyndicationGetLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, p_super, OS_LOG_TYPE_ERROR, "(MUTEX) Unable to obtain syndication ingest library mutex and there's no blocking library", buf, 2u);
      }
      v6 = 0;
      goto LABEL_29;
    }
    os_unfair_lock_unlock(&self->_syndicationIngestLibraryLock);
    PLSyndicationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      PLSyndicationIngestClientStringFromIdentifier(v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v21;
      v30 = 1024;
      LODWORD(v31) = v9;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "(MUTEX) %@ did not get the syndication ingest mutex, retrying after %u usec...", buf, 0x12u);

    }
    usleep(v9);
    v9 <<= v9 < 0x989680;

    p_super = &v19->super;
  }
  v6 = (void *)v18;
  PLSyndicationGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    PLSyndicationIngestClientStringFromIdentifier(v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = v27;
    v29 = v26;
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "(MUTEX) %@ Acquired the syndication ingest mutex", buf, 0xCu);

  }
LABEL_29:

  os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
  return v6;
}

- (BOOL)shouldStopUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3
{
  unsigned int v3;
  os_unfair_lock_s *p_syndicationIngestLibraryLock;
  unsigned int syndicationIngestClientIdentifier;
  unsigned int requestedSyndicationIngestClientIdentifier;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  p_syndicationIngestLibraryLock = &self->_syndicationIngestLibraryLock;
  os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
  syndicationIngestClientIdentifier = self->_syndicationIngestClientIdentifier;
  if (syndicationIngestClientIdentifier == v3)
  {
    requestedSyndicationIngestClientIdentifier = self->_requestedSyndicationIngestClientIdentifier;
    os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
    if (requestedSyndicationIngestClientIdentifier <= v3)
      return 0;
    v8 = &stru_1E36789C0;
  }
  else
  {
    os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
    v9 = (void *)MEMORY[0x1E0CB3940];
    PLSyndicationIngestClientStringFromIdentifier(syndicationIngestClientIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR(" (current owner is %@)"), v10);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  PLSyndicationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    PLSyndicationIngestClientStringFromIdentifier(v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v12;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "(MUTEX) %@ should stop using syndication ingest library%{public}@", buf, 0x16u);

  }
  return 1;
}

- (void)stopUsingSyndicationIngestLibraryWithIdentifier:(unsigned __int8)a3
{
  unsigned int v3;
  os_unfair_lock_s *p_syndicationIngestLibraryLock;
  PLPhotoLibrary *syndicationIngestLibrary;
  void *v8;
  PLPhotoLibrary *v9;
  double v10;
  double v11;
  NSDate *syndicationIngestLibraryUsageStart;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  p_syndicationIngestLibraryLock = &self->_syndicationIngestLibraryLock;
  os_unfair_lock_lock(&self->_syndicationIngestLibraryLock);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationIngestMutex.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != PLSyndicationIngestClientIdentifierNone"));

  }
  if (self->_syndicationIngestClientIdentifier != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationIngestMutex.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_syndicationIngestClientIdentifier == identifier"));

  }
  syndicationIngestLibrary = self->_syndicationIngestLibrary;
  if (!syndicationIngestLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationIngestMutex.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_syndicationIngestLibrary != nil"));

    syndicationIngestLibrary = self->_syndicationIngestLibrary;
  }
  self->_syndicationIngestClientIdentifier = 0;
  -[PLPhotoLibrary name](syndicationIngestLibrary, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_syndicationIngestLibrary;
  self->_syndicationIngestLibrary = 0;

  -[NSDate timeIntervalSinceNow](self->_syndicationIngestLibraryUsageStart, "timeIntervalSinceNow");
  v11 = v10;
  syndicationIngestLibraryUsageStart = self->_syndicationIngestLibraryUsageStart;
  self->_syndicationIngestLibraryUsageStart = 0;

  os_unfair_lock_unlock(p_syndicationIngestLibraryLock);
  PLSyndicationGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    PLSyndicationIngestClientStringFromIdentifier(v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v14;
    v20 = 2112;
    v21 = v8;
    v22 = 2048;
    v23 = 0.0 - v11;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "(MUTEX) %@ stopped using syndication ingest library %@ after %f sec", buf, 0x20u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIngestLibraryUsageStart, 0);
  objc_storeStrong((id *)&self->_syndicationIngestLibrary, 0);
  objc_destroyWeak((id *)&self->_databaseContext);
}

@end

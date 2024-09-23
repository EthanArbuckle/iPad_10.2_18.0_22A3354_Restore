@implementation PLBackgroundJobWorkerCoordinator

- (PLBackgroundJobWorkerCoordinator)initWithWorkerCoordinatorWorkerMode:(signed __int16)a3 statusCenter:(id)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  PLBackgroundJobWorkerCoordinator *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  PLBackgroundJobWorkerCoordinator *v62;
  uint8_t buf[4];
  void *v64;
  void *v65;
  _QWORD v66[13];
  _QWORD v67[7];

  v4 = a3;
  v67[5] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 != 1)
      goto LABEL_10;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v10;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v12;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v14;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v16;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v67[4] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v19);

  }
  else
  {
    v61 = v7;
    v62 = self;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v60;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v59;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v58;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v57;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v56;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v66[5] = v55;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v66[6] = v27;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v66[7] = v29;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v66[8] = v31;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v66[9] = v33;
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v66[10] = v35;
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v66[11] = v37;
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v66[12] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 13);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v40);

    if (_os_feature_enabled_impl())
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v43);

    }
    if (_os_feature_enabled_impl())
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v45);

      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v47);

    }
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);
    v7 = v61;
    self = v62;
  }

LABEL_10:
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(v49, "objectForKey:", CFSTR("PLBackgroundJobServiceBlockedWorkersUserDefaultsKey"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "count"))
  {
    objc_msgSend(v8, "removeObjectsInArray:", v50);
    PLBackgroundJobServiceGetLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v50;
      _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEFAULT, "Blocked workers: %@ Use plphotosctl backgroundjob reset-disable-worker", buf, 0xCu);
    }

  }
  v52 = (void *)objc_msgSend(v8, "copy", v55);
  v53 = -[PLBackgroundJobWorkerCoordinator initWithWorkerClassesAsStrings:workerMode:statusCenter:](self, "initWithWorkerClassesAsStrings:workerMode:statusCenter:", v52, v4, v7);

  return v53;
}

- (PLBackgroundJobWorkerCoordinator)initWithWorkerClassesAsStrings:(id)a3
{
  return -[PLBackgroundJobWorkerCoordinator initWithWorkerClassesAsStrings:workerMode:statusCenter:](self, "initWithWorkerClassesAsStrings:workerMode:statusCenter:", a3, 0, 0);
}

- (PLBackgroundJobWorkerCoordinator)initWithWorkerClassesAsStrings:(id)a3 workerMode:(signed __int16)a4 statusCenter:(id)a5
{
  id v9;
  id v10;
  PLBackgroundJobWorkerCoordinator *v11;
  PLBackgroundJobWorkerCoordinator *v12;
  NSMutableArray *v13;
  NSMutableArray *pendingWorkers;
  NSMutableDictionary *v15;
  NSMutableDictionary *cachedCriteriaForPendingWorkers;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PLBackgroundJobWorkerCoordinator;
  v11 = -[PLBackgroundJobWorkerCoordinator init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_statusCenter, v10);
    v12->_workerMode = a4;
    objc_storeStrong((id *)&v12->_workerClassesAsStrings, a3);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingWorkers = v12->_pendingWorkers;
    v12->_pendingWorkers = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedCriteriaForPendingWorkers = v12->_cachedCriteriaForPendingWorkers;
    v12->_cachedCriteriaForPendingWorkers = v15;

  }
  return v12;
}

- (BOOL)shouldDeferActivity
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldDeferActivity);
  return v2 & 1;
}

- (id)_workersForBundle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readyForAnalysis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReadyForAnalysis");

  objc_msgSend(v4, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "wellKnownPhotoLibraryIdentifier");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_workerClassesAsStrings;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = NSClassFromString(*(NSString **)(*((_QWORD *)&v20 + 1) + 8 * v15));
        if (-[objc_class supportsWellKnownPhotoLibraryIdentifier:](v16, "supportsWellKnownPhotoLibraryIdentifier:", v10, (_QWORD)v20)&& ((v8 & 1) != 0|| -[objc_class allowWorkerToRunDuringCPLInitialSync](v16, "allowWorkerToRunDuringCPLInitialSync")))
        {
          v17 = (void *)objc_msgSend([v16 alloc], "initWithLibraryBundle:", v4);
          objc_msgSend(v5, "addObject:", v17);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_msgSend(v5, "copy");
  return v18;
}

- (id)pendingJobsForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSMutableDictionary *cachedCriteriaForPendingWorkers;
  void *v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSMutableDictionary *v43;
  void *v44;
  void *v45;
  id WeakRetained;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  const __CFString *v51;
  NSObject *v52;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  os_unfair_lock_t lock;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  const __CFString *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "newShortLivedLibraryWithName:", "-[PLBackgroundJobWorkerCoordinator pendingJobsForBundle:]");

  if (!v10
    && (!MEMORY[0x19AEC0720]()
     || (v10 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobWorkerCoordinator pendingJobsForBundle:]", v4)) == 0))
  {
    PLBackgroundJobServiceGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v66 = (uint64_t)v4;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "pendingJobsForBundle: library is nil for bundle %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  -[NSObject globalValues](v10, "globalValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "libraryCreateOptions");

  if ((v12 & 0x40) != 0)
  {
    PLBackgroundJobServiceGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = (uint64_t)v4;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "pendingJobsForBundle: library create options indicate no background jobs for bundle %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (PLIsAssetsd())
  {
    if (PLIsConfiguredForUnitTesting())
    {
      objc_msgSend(v4, "libraryServicesManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "wellKnownPhotoLibraryIdentifier");

      if ((unint64_t)(v14 - 1) <= 2)
      {
        PLBackgroundJobServiceGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "libraryServicesManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134217984;
          v66 = objc_msgSend(v16, "wellKnownPhotoLibraryIdentifier");
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "pendingJobsForBundle: ignoring background jobs during unit testing for well-known library %td", buf, 0xCu);

        }
LABEL_14:

LABEL_15:
        v17 = 0;
        goto LABEL_45;
      }
    }
  }
  v18 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v4, "libraryServicesManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "wellKnownPhotoLibraryIdentifier");
  PLStringFromWellKnownPhotoLibraryIdentifier();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("Workers that reported pending jobs on well known library identifier %@:\n"), v20);

  PLBackgroundJobServiceGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v66 = (uint64_t)v7;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Checking all workers of library %@ for pending jobs", buf, 0xCu);
  }
  v54 = v7;

  v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v55 = v4;
  -[PLBackgroundJobWorkerCoordinator _workersForBundle:](self, "_workersForBundle:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v62;
    v56 = v10;
    v57 = v23;
    while (2)
    {
      v27 = 0;
      v59 = v25;
      do
      {
        if (*(_QWORD *)v62 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v27);
        cachedCriteriaForPendingWorkers = self->_cachedCriteriaForPendingWorkers;
        objc_msgSend(v28, "workerDetailedName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](cachedCriteriaForPendingWorkers, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = self->_cachedCriteriaForPendingWorkers;
          objc_msgSend(v28, "workerDetailedName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "addObject:", v34);
          objc_msgSend(v28, "workerName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "appendFormat:", CFSTR("\t W: %@ C: %@ Cache hit: YES\n"), v35, v36);

        }
        else
        {
          os_unfair_lock_unlock(lock);
          objc_msgSend(v28, "pendingJobsInLibrary:", v10);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_lock(lock);
          objc_msgSend(v34, "workItemsNeedingProcessing");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");

          if (v38)
          {
            objc_msgSend(v28, "workerName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "criteria");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "name");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "appendFormat:", CFSTR("\t W: %@ C: %@ Cache hit: NO\n"), v39, v41);

            objc_msgSend(v34, "criteria");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v42);

            v43 = self->_cachedCriteriaForPendingWorkers;
            objc_msgSend(v34, "criteria");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "workerDetailedName");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v44, v45);

            WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
            objc_msgSend(WeakRetained, "recordWorkerHasPendingJobs:", v28);

            if (objc_msgSend((id)objc_opt_class(), "avoidCheckingOtherWorkersIfThisWorkerHasPendingWork"))
            {
              PLBackgroundJobServiceGetLog();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v28, "workerName");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v66 = (uint64_t)v48;
                _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEFAULT, "Ignoring all other workers in the pending jobs queue since worker %{public}@ returned YES for avoidCheckingOtherWorkersIfThisWorkerHasPendingWork and has pending work to do", buf, 0xCu);

              }
              v10 = v56;
              v23 = v57;
              goto LABEL_35;
            }
            v10 = v56;
            v23 = v57;
          }
          v25 = v59;
        }

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v25)
        continue;
      break;
    }
  }
LABEL_35:

  os_unfair_lock_unlock(lock);
  PLBackgroundJobServiceGetLog();
  v49 = objc_claimAutoreleasedReturnValue();
  v7 = v54;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    v50 = objc_msgSend(v22, "count");
    v51 = CFSTR("YES");
    if (!v50)
      v51 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v66 = (uint64_t)v54;
    v67 = 2112;
    v68 = v51;
    _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_DEBUG, "Checked workers of library %@ for pending jobs. Result: %@", buf, 0x16u);
  }

  if (objc_msgSend(v22, "count"))
  {
    PLBackgroundJobServiceGetLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = (uint64_t)v60;
      _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v17 = (void *)objc_msgSend(v22, "copy");
  }
  else
  {
    v17 = 0;
  }
  v4 = v55;

LABEL_45:
  return v17;
}

- (void)submitBundleForProcessing:(id)a3 withCriteria:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PLBackgroundJobWorkerCriteriaTuple *v14;
  PLBackgroundJobWorkerCriteriaTuple *v15;
  int v16;
  NSObject *v17;
  int workerMode;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PLBackgroundJobWorkerCoordinator _workersForBundle:](self, "_workersForBundle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  atomic_store(0, (unsigned __int8 *)&self->_shouldDeferActivity);
  v19 = -[NSMutableArray count](self->_pendingWorkers, "count");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = -[PLBackgroundJobWorkerCriteriaTuple initWithWorker:withCriteria:]([PLBackgroundJobWorkerCriteriaTuple alloc], "initWithWorker:withCriteria:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13), v7);
        -[NSMutableArray addObject:](self->_pendingWorkers, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v11);
  }

  v15 = self->_currentWorker;
  v16 = -[NSMutableArray count](self->_pendingWorkers, "count");
  PLBackgroundJobServiceGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    workerMode = self->_workerMode;
    *(_DWORD *)buf = 67109376;
    v25 = v16 - v19;
    v26 = 1024;
    v27 = workerMode;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Added %d workers to the pending workers queue. workerCoordinatorMode: %d", buf, 0xEu);
  }

  os_unfair_lock_unlock(&self->_lock);
  if (!v15)
    -[PLBackgroundJobWorkerCoordinator _processNextWorkerInLibraryBundle:](self, "_processNextWorkerInLibraryBundle:", v6);

}

- (void)stopAllBackgorundJobs
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  uint64_t v5;
  int workerMode;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PLBackgroundJobServiceGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSMutableArray count](self->_pendingWorkers, "count");
    workerMode = self->_workerMode;
    v9 = 134218240;
    v10 = v5;
    v11 = 1024;
    v12 = workerMode;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Clearing %tu workers from _pendingWorkers queue. workerCoordinatorMode: %d", (uint8_t *)&v9, 0x12u);
  }

  v7 = -[NSMutableArray count](self->_pendingWorkers, "count");
  -[NSMutableArray removeAllObjects](self->_pendingWorkers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_cachedCriteriaForPendingWorkers, "removeAllObjects");
  -[PLBackgroundJobWorkerCriteriaTuple worker](self->_currentWorker, "worker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v7)
    objc_msgSend(v8, "stopAllWork");

}

- (void)_processNextWorkerInLibraryBundle:(id)a3
{
  id v5;
  PLBackgroundJobWorkerCriteriaTuple *v6;
  PLBackgroundJobWorkerCriteriaTuple *currentWorker;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  int workerMode;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _BYTE *v43;
  _QWORD v44[5];
  id v45;
  SEL v46;
  uint8_t v47[4];
  id v48;
  __int16 v49;
  int v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray firstObject](self->_pendingWorkers, "firstObject");
  v6 = (PLBackgroundJobWorkerCriteriaTuple *)objc_claimAutoreleasedReturnValue();
  currentWorker = self->_currentWorker;
  self->_currentWorker = v6;

  -[PLBackgroundJobWorkerCriteriaTuple worker](self->_currentWorker, "worker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorkerCriteriaTuple criteria](self->_currentWorker, "criteria");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSMutableArray count](self->_pendingWorkers, "count");
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  objc_msgSend(v8, "setStatusCenter:", WeakRetained);

  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    objc_msgSend(v5, "libraryServicesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "databaseContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "photoLibraryWithDatabaseContext:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (MEMORY[0x19AEC0720]())
        v13 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobWorkerCoordinator _processNextWorkerInLibraryBundle:]", v5);
      else
        v13 = 0;
    }
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke;
    v44[3] = &unk_1E3670080;
    v44[4] = self;
    v46 = a2;
    v33 = v12;
    v45 = v33;
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v44);
    if (!v13)
    {
      PLBackgroundJobServiceGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "workerName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        workerMode = self->_workerMode;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v52) = workerMode;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "_processNextWorkerInLibraryBundle: library is nil for worker %{public}@ bundle %@. workerCoordinatorMode: %d", buf, 0x1Cu);

      }
      ((void (**)(_QWORD, void *, uint64_t))v14)[2](v14, v8, 1);
      -[PLBackgroundJobWorkerCoordinator _processNextWorkerInLibraryBundle:](self, "_processNextWorkerInLibraryBundle:", v5);
      goto LABEL_26;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__68728;
    v53 = __Block_byref_object_dispose__68729;
    v54 = 0;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke_94;
    v40[3] = &unk_1E3676EA0;
    v43 = buf;
    v15 = v8;
    v41 = v15;
    v16 = v13;
    v42 = v16;
    v31 = MEMORY[0x19AEC174C](v40);
    if (objc_msgSend((id)objc_opt_class(), "usesMultipleLibrariesConcurrently"))
    {
      +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v31);
    }
    else
    {
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sync:identifyingBlock:library:", v31, 0, v16);

    }
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "workItemsNeedingProcessing", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v34, "count");
    if (v21)
    {
      if (!v35
        || (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "criteria"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v35, "isEqual:", v22),
            v22,
            (v23 & 1) != 0))
      {
        PLBackgroundJobServiceGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = self->_workerMode;
          *(_DWORD *)v47 = 138412546;
          v48 = v15;
          v49 = 1024;
          v50 = v25;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Starting worker %@. workerCoordinatorMode: %d", v47, 0x12u);
        }

        objc_initWeak((id *)v47, v15);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke_98;
        v36[3] = &unk_1E36700A8;
        objc_copyWeak(&v39, (id *)v47);
        v36[4] = self;
        v38 = v14;
        v37 = v5;
        objc_msgSend(v15, "startWorkInLibrary:withWorkItemsNeedingProcessing:withCompletion:", v16, v34, v36);

        objc_destroyWeak(&v39);
        objc_destroyWeak((id *)v47);
        goto LABEL_25;
      }
      PLBackgroundJobServiceGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v15, "workerDetailedName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = self->_workerMode;
        *(_DWORD *)v47 = 138412546;
        v48 = v29;
        v49 = 1024;
        v50 = v30;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "Worker %@ reports it has work to do... but the criteria it needs does not match our running criteria; removing"
          " it from pending workers queue. workerCoordinatorMode: %d",
          v47,
          0x12u);

      }
    }
    else
    {
      PLBackgroundJobServiceGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v15, "workerDetailedName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = self->_workerMode;
        *(_DWORD *)v47 = 138412546;
        v48 = v27;
        v49 = 1024;
        v50 = v28;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "Worker %@ reports it has no work to do; removing it from pending workers queue. workerCoordinatorMode: %d",
          v47,
          0x12u);

      }
    }

    ((void (**)(_QWORD, id, BOOL))v14)[2](v14, v15, v21 == 0);
    -[PLBackgroundJobWorkerCoordinator _processNextWorkerInLibraryBundle:](self, "_processNextWorkerInLibraryBundle:", v5);
LABEL_25:

    _Block_object_dispose(buf, 8);
LABEL_26:

    goto LABEL_27;
  }
  -[PLBackgroundJobWorkerCoordinator _handleAllWorkersCompleted](self, "_handleAllWorkersCompleted");
LABEL_27:

}

- (void)_handleAllWorkersCompleted
{
  qos_class_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = qos_class_self();
  dispatch_get_global_queue(v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PLBackgroundJobWorkerCoordinator__handleAllWorkersCompleted__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (PLBackgroundJobWorkerCoordinatorDelegate)delegate
{
  return (PLBackgroundJobWorkerCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedCriteriaForPendingWorkers, 0);
  objc_storeStrong((id *)&self->_currentWorker, 0);
  objc_storeStrong((id *)&self->_pendingWorkers, 0);
  objc_storeStrong((id *)&self->_workerClassesAsStrings, 0);
  objc_destroyWeak((id *)&self->_statusCenter);
}

void __62__PLBackgroundJobWorkerCoordinator__handleAllWorkersCompleted__block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v4, "workerCoordinatorDidFinishAllSubmittedJobsOnBundle:", *(_QWORD *)(a1 + 32));

  }
}

void __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke(_QWORD *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 48));
  objc_msgSend(*(id *)(a1[4] + 40), "worker");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PLBackgroundJobWorkerCoordinator.m"), 338, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("worker == _currentWorker.worker"));

  }
  objc_msgSend(*(id *)(a1[4] + 40), "worker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldDeferActivity");

  if (v7)
    atomic_store(1u, (unsigned __int8 *)(a1[4] + 52));
  objc_msgSend(*(id *)(a1[4] + 32), "removeObject:", *(_QWORD *)(a1[4] + 40));
  if (a3)
  {
    v8 = a1[4];
    v9 = *(void **)(v8 + 56);
    objc_msgSend(*(id *)(v8 + 40), "worker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workerDetailedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v11);

  }
  v12 = a1[4];
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 48));
  objc_msgSend(v15, "workerDidFinishWithDatabaseContext:", a1[5]);

}

void __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke_94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "workItemsNeedingProcessingInLibrary:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke_98(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  int v5;
  id v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  PLBackgroundJobServiceGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(__int16 *)(*(_QWORD *)(a1 + 32) + 16);
    v5 = 138412546;
    v6 = WeakRetained;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Worker %@ finished. workerCoordinatorMode: %d", (uint8_t *)&v5, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_processNextWorkerInLibraryBundle:", *(_QWORD *)(a1 + 40));

}

@end

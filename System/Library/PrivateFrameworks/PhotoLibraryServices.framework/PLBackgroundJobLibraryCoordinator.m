@implementation PLBackgroundJobLibraryCoordinator

- (PLBackgroundJobLibraryCoordinator)initWithStatusCenter:(id)a3
{
  id v4;
  PLBackgroundJobWorkerCoordinator *v5;
  PLBackgroundJobLibraryCoordinator *v6;

  v4 = a3;
  v5 = -[PLBackgroundJobWorkerCoordinator initWithWorkerCoordinatorWorkerMode:statusCenter:]([PLBackgroundJobWorkerCoordinator alloc], "initWithWorkerCoordinatorWorkerMode:statusCenter:", 0, v4);
  v6 = -[PLBackgroundJobLibraryCoordinator initWithWorkerCoordinator:statusCenter:](self, "initWithWorkerCoordinator:statusCenter:", v5, v4);

  return v6;
}

- (PLBackgroundJobLibraryCoordinator)initWithWorkerCoordinator:(id)a3
{
  return -[PLBackgroundJobLibraryCoordinator initWithWorkerCoordinator:statusCenter:](self, "initWithWorkerCoordinator:statusCenter:", a3, 0);
}

- (PLBackgroundJobLibraryCoordinator)initWithWorkerCoordinator:(id)a3 statusCenter:(id)a4
{
  id v7;
  id v8;
  PLBackgroundJobLibraryCoordinator *v9;
  PLBackgroundJobLibraryCoordinator *v10;
  NSMutableArray *v11;
  NSMutableArray *pendingPhotoLibraryBundles;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLBackgroundJobLibraryCoordinator;
  v9 = -[PLBackgroundJobLibraryCoordinator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_statusCenter, v8);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingPhotoLibraryBundles = v10->_pendingPhotoLibraryBundles;
    v10->_pendingPhotoLibraryBundles = v11;

    objc_storeStrong((id *)&v10->_workerCoordinator, a3);
    -[PLBackgroundJobWorkerCoordinator setDelegate:](v10->_workerCoordinator, "setDelegate:", v10);
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (BOOL)shouldDeferActivity
{
  return -[PLBackgroundJobWorkerCoordinator shouldDeferActivity](self->_workerCoordinator, "shouldDeferActivity");
}

- (id)pendingJobsOnBundles:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  PLBackgroundJobLibraryCoordinator *v17;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLBackgroundJobServiceGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Checking all library bundles for pending jobs", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __58__PLBackgroundJobLibraryCoordinator_pendingJobsOnBundles___block_invoke;
  v16 = &unk_1E366D2A0;
  v17 = self;
  v7 = v6;
  v18 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v13);

  PLBackgroundJobServiceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "count", v13, v14, v15, v16, v17);
    v10 = CFSTR("YES");
    if (!v9)
      v10 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Checked all submitted library bundles. Result: %@", buf, 0xCu);
  }

  if (objc_msgSend(v7, "count"))
    v11 = (void *)objc_msgSend(v7, "copy");
  else
    v11 = 0;

  return v11;
}

- (void)startBackgroundJobsOnBundles:(id)a3 withCriteria:(id)a4
{
  id v6;
  id v7;
  id v8;
  PLPhotoLibraryBundleCriteriaTuple *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  PLBackgroundJobLibraryCoordinator *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __79__PLBackgroundJobLibraryCoordinator_startBackgroundJobsOnBundles_withCriteria___block_invoke;
  v17 = &unk_1E366D2A0;
  v8 = v7;
  v18 = v8;
  v19 = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v14);
  v9 = self->_currentPhotoLibraryBundle;
  v10 = -[NSMutableArray count](self->_pendingPhotoLibraryBundles, "count", v14, v15, v16, v17);
  os_unfair_lock_unlock(&self->_lock);
  PLBackgroundJobServiceGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v21 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Added %tu bundles to the pending bundles queue", buf, 0xCu);
  }

  if (!objc_msgSend(v6, "count"))
  {
    PLBackgroundJobServiceGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_FAULT, "LibraryCoordinator asked to add 0 bundles to pending bundles queue!", buf, 2u);
    }

  }
  if (!v9 && v10)
    -[PLBackgroundJobLibraryCoordinator _submitNextQueuedBundle](self, "_submitNextQueuedBundle");

}

- (void)_submitNextQueuedBundle
{
  os_unfair_lock_s *p_lock;
  PLPhotoLibraryBundleCriteriaTuple *v4;
  PLPhotoLibraryBundleCriteriaTuple *currentPhotoLibraryBundle;
  PLPhotoLibraryBundleCriteriaTuple *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLBackgroundJobWorkerCoordinator *workerCoordinator;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray firstObject](self->_pendingPhotoLibraryBundles, "firstObject");
  v4 = (PLPhotoLibraryBundleCriteriaTuple *)objc_claimAutoreleasedReturnValue();
  currentPhotoLibraryBundle = self->_currentPhotoLibraryBundle;
  self->_currentPhotoLibraryBundle = v4;

  v6 = self->_currentPhotoLibraryBundle;
  os_unfair_lock_unlock(p_lock);
  PLBackgroundJobServiceGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundleCriteriaTuple bundle](v6, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryBundleCriteriaTuple criteria](v6, "criteria");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Submitted bundle %@ for criteria %@ processing", (uint8_t *)&v15, 0x16u);

  }
  workerCoordinator = self->_workerCoordinator;
  -[PLPhotoLibraryBundleCriteriaTuple bundle](v6, "bundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryBundleCriteriaTuple criteria](v6, "criteria");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackgroundJobWorkerCoordinator submitBundleForProcessing:withCriteria:](workerCoordinator, "submitBundleForProcessing:withCriteria:", v13, v14);

}

- (void)_handleBundleComplete:(id)a3
{
  PLBackgroundJobLibraryCoordinatorDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "criteria");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "libraryCoordinatorFinishedJobsOnSubmittedBundle:withCriteria:", v8, v9);

  }
}

- (void)_handleAllBundlesCompleted
{
  PLBackgroundJobLibraryCoordinatorDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "libraryCoordinatorFinishedJobsOnAllSubmittedBundles");

  }
}

- (void)stopBackgroundJobsOnAllBundles
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  PLBackgroundJobServiceGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSMutableArray count](self->_pendingPhotoLibraryBundles, "count");
    *(_DWORD *)buf = 134217984;
    v20 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Clearing %tu bundles from _pendingPhotoLibraryBundles queue", buf, 0xCu);
  }

  v6 = -[NSMutableArray count](self->_pendingPhotoLibraryBundles, "count");
  v7 = (void *)-[NSMutableArray copy](self->_pendingPhotoLibraryBundles, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingPhotoLibraryBundles, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqual:", self->_currentPhotoLibraryBundle, (_QWORD)v14) & 1) == 0)
          -[PLBackgroundJobLibraryCoordinator _handleBundleComplete:](self, "_handleBundleComplete:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  if (v6)
    -[PLBackgroundJobWorkerCoordinator stopAllBackgorundJobs](self->_workerCoordinator, "stopAllBackgorundJobs");

}

- (void)workerCoordinatorDidFinishAllSubmittedJobsOnBundle:(id)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v5;
  NSObject *v6;
  PLPhotoLibraryBundleCriteriaTuple *currentPhotoLibraryBundle;
  NSMutableArray *pendingPhotoLibraryBundles;
  PLPhotoLibraryBundleCriteriaTuple *v9;
  int v10;
  PLPhotoLibraryBundleCriteriaTuple *v11;
  __int16 v12;
  NSMutableArray *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PLBackgroundJobLibraryCoordinator _handleBundleComplete:](self, "_handleBundleComplete:", self->_currentPhotoLibraryBundle);
  -[NSMutableArray removeObject:](self->_pendingPhotoLibraryBundles, "removeObject:", self->_currentPhotoLibraryBundle);
  v5 = -[NSMutableArray count](self->_pendingPhotoLibraryBundles, "count");
  PLBackgroundJobServiceGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    pendingPhotoLibraryBundles = self->_pendingPhotoLibraryBundles;
    currentPhotoLibraryBundle = self->_currentPhotoLibraryBundle;
    v10 = 138412546;
    v11 = currentPhotoLibraryBundle;
    v12 = 2112;
    v13 = pendingPhotoLibraryBundles;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Removed bundle:%@ from pending bundles queue: %@", (uint8_t *)&v10, 0x16u);
  }

  v9 = self->_currentPhotoLibraryBundle;
  self->_currentPhotoLibraryBundle = 0;

  os_unfair_lock_unlock(p_lock);
  if (v5)
    -[PLBackgroundJobLibraryCoordinator _submitNextQueuedBundle](self, "_submitNextQueuedBundle");
  else
    -[PLBackgroundJobLibraryCoordinator _handleAllBundlesCompleted](self, "_handleAllBundlesCompleted");
}

- (PLBackgroundJobLibraryCoordinatorDelegate)delegate
{
  return (PLBackgroundJobLibraryCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workerCoordinator, 0);
  objc_storeStrong((id *)&self->_currentPhotoLibraryBundle, 0);
  objc_storeStrong((id *)&self->_pendingPhotoLibraryBundles, 0);
  objc_destroyWeak((id *)&self->_statusCenter);
}

void __79__PLBackgroundJobLibraryCoordinator_startBackgroundJobsOnBundles_withCriteria___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PLPhotoLibraryBundleCriteriaTuple *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  PLPhotoLibraryBundleCriteriaTuple *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[PLPhotoLibraryBundleCriteriaTuple initWithBundle:withCriteria:]([PLPhotoLibraryBundleCriteriaTuple alloc], "initWithBundle:withCriteria:", v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v4);
  PLBackgroundJobServiceGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Adding bundle %@ to pending bundles queue: %@", (uint8_t *)&v7, 0x16u);
  }

}

void __58__PLBackgroundJobLibraryCoordinator_pendingJobsOnBundles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "libraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackgroundJobServiceGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Checking library %@ for pending jobs", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pendingJobsForBundle:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  PLBackgroundJobServiceGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Library %@ has pending jobs", (uint8_t *)&v12, 0xCu);
    }

    v11 = *(void **)(a1 + 40);
    objc_msgSend(v7, "allObjects");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v9);
  }
  else if (v10)
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Library %@ does not have pending jobs", (uint8_t *)&v12, 0xCu);
  }

}

@end

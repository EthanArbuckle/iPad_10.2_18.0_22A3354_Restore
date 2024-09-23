@implementation PXStoryPersistableRecipeManager

- (PXStoryPersistableRecipeManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPersistableRecipeManager.m"), 66, CFSTR("%s is not available as initializer"), "-[PXStoryPersistableRecipeManager init]");

  abort();
}

- (PXStoryPersistableRecipeManager)initWithModel:(id)a3 styleManager:(id)a4
{
  id v8;
  id v9;
  PXStoryPersistableRecipeManager *v10;
  PXStoryPersistableRecipeManager *v11;
  uint64_t v12;
  PXStoryRecipeManager *recipeManager;
  uint64_t v14;
  PXStoryResourcesDataSourceManager *resourcesDataSourceManager;
  void *v16;
  uint64_t v17;
  PXStoryErrorReporter *errorReporter;
  uint64_t v19;
  OS_dispatch_queue *storyQueue;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *v22;
  OS_dispatch_queue *v23;
  OS_dispatch_queue *v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *v26;
  objc_class *v27;
  id v28;
  const char *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *workQueue;
  uint64_t v34;
  PXUpdater *updater;
  NSObject *v36;
  PXStoryRecipeManager *v37;
  PXStoryResourcesDataSourceManager *v38;
  void *v40;
  void *v41;
  void *v42;
  SEL v43;
  _QWORD v44[4];
  PXStoryPersistableRecipeManager *v45;
  objc_super v46;
  uint8_t buf[4];
  PXStoryPersistableRecipeManager *v48;
  __int16 v49;
  PXStoryRecipeManager *v50;
  __int16 v51;
  PXStoryResourcesDataSourceManager *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PXStoryPersistableRecipeManager;
  v10 = -[PXStoryPersistableRecipeManager init](&v46, sel_init);
  v11 = v10;
  if (v10)
  {
    v43 = a2;
    objc_storeStrong((id *)&v10->_model, a3);
    -[PXStoryModel registerChangeObserver:context:](v11->_model, "registerChangeObserver:context:", v11, ModelObservationContext_133951);
    objc_msgSend(v8, "recipeManager");
    v12 = objc_claimAutoreleasedReturnValue();
    recipeManager = v11->_recipeManager;
    v11->_recipeManager = (PXStoryRecipeManager *)v12;

    -[PXStoryRecipeManager registerChangeObserver:context:](v11->_recipeManager, "registerChangeObserver:context:", v11, RecipeManagerObservationContext_133952);
    objc_msgSend(v8, "resourcesDataSourceManager");
    v14 = objc_claimAutoreleasedReturnValue();
    resourcesDataSourceManager = v11->_resourcesDataSourceManager;
    v11->_resourcesDataSourceManager = (PXStoryResourcesDataSourceManager *)v14;

    -[PXStoryResourcesDataSourceManager registerChangeObserver:context:](v11->_resourcesDataSourceManager, "registerChangeObserver:context:", v11, ResourcesDataSourceManagerObservationContext);
    objc_storeStrong((id *)&v11->_styleManager, a4);
    -[PXStoryStyleManager registerChangeObserver:context:](v11->_styleManager, "registerChangeObserver:context:", v11, StyleManagerObservationContext);
    objc_msgSend(v8, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorReporter");
    v17 = objc_claimAutoreleasedReturnValue();
    errorReporter = v11->_errorReporter;
    v11->_errorReporter = (PXStoryErrorReporter *)v17;

    objc_msgSend(v16, "storyQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    storyQueue = v11->_storyQueue;
    v11->_storyQueue = (OS_dispatch_queue *)v19;

    v21 = v11->_storyQueue;
    -[PXStoryRecipeManager storyQueue](v11->_recipeManager, "storyQueue");
    v22 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();

    if (v21 != v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v43, v11, CFSTR("PXStoryPersistableRecipeManager.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_storyQueue == _recipeManager.storyQueue"));

    }
    v23 = v11->_storyQueue;
    -[PXStoryResourcesDataSourceManager storyQueue](v11->_resourcesDataSourceManager, "storyQueue");
    v24 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();

    if (v23 != v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v43, v11, CFSTR("PXStoryPersistableRecipeManager.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_storyQueue == _resourcesDataSourceManager.storyQueue"));

    }
    v25 = v11->_storyQueue;
    -[PXStoryStyleManager storyQueue](v11->_styleManager, "storyQueue");
    v26 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();

    if (v25 != v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v43, v11, CFSTR("PXStoryPersistableRecipeManager.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_storyQueue == _styleManager.storyQueue"));

    }
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = (const char *)objc_msgSend(v28, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_USER_INITIATED, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create(v29, v31);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v32;

    v34 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v11, sel__setNeedsUpdate);
    updater = v11->_updater;
    v11->_updater = (PXUpdater *)v34;

    -[PXUpdater addUpdateSelector:](v11->_updater, "addUpdateSelector:", sel__updateOriginalPersistableRecipe);
    -[PXUpdater addUpdateSelector:](v11->_updater, "addUpdateSelector:", sel__updateIsReadyToProducePersistableRecipe);
    -[PXUpdater addUpdateSelector:](v11->_updater, "addUpdateSelector:", sel__updateHasUserExperiencedPlayback);
    -[PXUpdater addUpdateSelector:](v11->_updater, "addUpdateSelector:", sel__updateHasUserExperiencedFirstPlaybackEver);
    -[PXUpdater addUpdateSelector:](v11->_updater, "addUpdateSelector:", sel__updatePersistencePermission);
    -[PXUpdater addUpdateSelector:](v11->_updater, "addUpdateSelector:", sel__updatePersistableRecipe);
    PLStoryGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = v11->_recipeManager;
      v38 = v11->_resourcesDataSourceManager;
      *(_DWORD *)buf = 138413058;
      v48 = v11;
      v49 = 2112;
      v50 = v37;
      v51 = 2112;
      v52 = v38;
      v53 = 2112;
      v54 = v9;
      _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEBUG, "%@ initialized with recipeManager: %@ resourcesDataSourceManager: %@ styleManager: %@", buf, 0x2Au);
    }

    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __62__PXStoryPersistableRecipeManager_initWithModel_styleManager___block_invoke;
    v44[3] = &unk_1E51479C8;
    v45 = v11;
    -[PXStoryPersistableRecipeManager performChanges:](v45, "performChanges:", v44);

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress cancel](self->_progress, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryPersistableRecipeManager;
  -[PXStoryPersistableRecipeManager dealloc](&v3, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryPersistableRecipeManager storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryPersistableRecipeManager;
  -[PXStoryPersistableRecipeManager performChanges:](&v6, sel_performChanges_, v4);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryPersistableRecipeManager;
  -[PXStoryPersistableRecipeManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryPersistableRecipeManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setIsOriginalPersistableRecipeValid:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 isOriginalPersistableRecipeValid;
  int v6;
  PXStoryPersistableRecipeManager *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_isOriginalPersistableRecipeValid != a3)
  {
    self->_isOriginalPersistableRecipeValid = a3;
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      isOriginalPersistableRecipeValid = self->_isOriginalPersistableRecipeValid;
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = isOriginalPersistableRecipeValid;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ isOriginalPersistableRecipeValid: %i", (uint8_t *)&v6, 0x12u);
    }

    -[PXStoryPersistableRecipeManager _invalidateHasUserExperiencedFirstPlaybackEver](self, "_invalidateHasUserExperiencedFirstPlaybackEver");
    -[PXStoryPersistableRecipeManager _invalidateIsReadyToProducePersistableRecipe](self, "_invalidateIsReadyToProducePersistableRecipe");
  }
}

- (void)setIsReadyToProducePersistableRecipe:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 isReadyToProducePersistableRecipe;
  int v6;
  PXStoryPersistableRecipeManager *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_isReadyToProducePersistableRecipe != a3)
  {
    self->_isReadyToProducePersistableRecipe = a3;
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      isReadyToProducePersistableRecipe = self->_isReadyToProducePersistableRecipe;
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = isReadyToProducePersistableRecipe;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ isReadyToProducePersistableRecipe: %i", (uint8_t *)&v6, 0x12u);
    }

    -[PXStoryPersistableRecipeManager signalChange:](self, "signalChange:", 1);
    -[PXStoryPersistableRecipeManager _invalidatePersistableRecipe](self, "_invalidatePersistableRecipe");
  }
}

- (void)setHasUserExperiencedPlayback:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 hasUserExperiencedPlayback;
  int v6;
  PXStoryPersistableRecipeManager *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_hasUserExperiencedPlayback != a3)
  {
    self->_hasUserExperiencedPlayback = a3;
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      hasUserExperiencedPlayback = self->_hasUserExperiencedPlayback;
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = hasUserExperiencedPlayback;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ hasUserExperiencedPlayback: %i", (uint8_t *)&v6, 0x12u);
    }

    -[PXStoryPersistableRecipeManager _invalidateHasUserExperiencedFirstPlaybackEver](self, "_invalidateHasUserExperiencedFirstPlaybackEver");
  }
}

- (void)setHasUserExperiencedFirstPlaybackEver:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 hasUserExperiencedFirstPlaybackEver;
  int v6;
  PXStoryPersistableRecipeManager *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_hasUserExperiencedFirstPlaybackEver != a3)
  {
    self->_hasUserExperiencedFirstPlaybackEver = a3;
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      hasUserExperiencedFirstPlaybackEver = self->_hasUserExperiencedFirstPlaybackEver;
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = hasUserExperiencedFirstPlaybackEver;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ hasUserExperiencedFirstPlaybackEver: %i", (uint8_t *)&v6, 0x12u);
    }

    if (self->_hasUserExperiencedFirstPlaybackEver)
      -[PXStoryPersistableRecipeManager _invalidatePersistableRecipe](self, "_invalidatePersistableRecipe");
  }
}

- (void)setHasAnyUserChange:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 hasAnyUserChange;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  PXStoryPersistableRecipeManager *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_hasAnyUserChange != a3)
  {
    self->_hasAnyUserChange = a3;
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      hasAnyUserChange = self->_hasAnyUserChange;
      v9 = 138412546;
      v10 = self;
      v11 = 1024;
      v12 = hasAnyUserChange;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ hasAnyUserChange: %i", (uint8_t *)&v9, 0x12u);
    }

    if (self->_hasAnyUserChange)
    {
      -[PXStoryPersistableRecipeManager model](self, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "persistencePermission");

      if (v7 != 1)
      {
        PXAssertGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v9) = 0;
          _os_log_fault_impl(&dword_1A6789000, v8, OS_LOG_TYPE_FAULT, "Persisting recipe due to user change, but the user never explicitly allowed the creation of the PHMemory.", (uint8_t *)&v9, 2u);
        }

      }
      -[PXStoryPersistableRecipeManager _invalidatePersistableRecipe](self, "_invalidatePersistableRecipe");
    }
  }
}

- (void)setPersistencePermission:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_persistencePermission != a3)
  {
    self->_persistencePermission = a3;
    if (a3 == 1)
    {
      -[PXStoryPersistableRecipeManager model](self, "model");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configuration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryPersistableRecipeManager setHasAnyUserChange:](self, "setHasAnyUserChange:", +[PXStoryPersistableRecipeWriterFactory canPersistForConfiguration:](PXStoryPersistableRecipeWriterFactory, "canPersistForConfiguration:", v4) ^ 1);

    }
    else
    {
      -[PXStoryPersistableRecipeManager setHasAnyUserChange:](self, "setHasAnyUserChange:", 0);
    }
  }
}

- (void)setProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *progress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](progress, "cancel");
    objc_storeStrong((id *)&self->_progress, a3);
    -[PXStoryPersistableRecipeManager setIsProducingPersistableRecipe:](self, "setIsProducingPersistableRecipe:", self->_progress != 0);
    v5 = v7;
  }

}

- (void)setIsProducingPersistableRecipe:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 isProducingPersistableRecipe;
  int v6;
  PXStoryPersistableRecipeManager *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_isProducingPersistableRecipe != a3)
  {
    self->_isProducingPersistableRecipe = a3;
    PLStoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      isProducingPersistableRecipe = self->_isProducingPersistableRecipe;
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = isProducingPersistableRecipe;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ isProducingPersistableRecipe: %i", (uint8_t *)&v6, 0x12u);
    }

    -[PXStoryPersistableRecipeManager signalChange:](self, "signalChange:", 2);
  }
}

- (void)setPersistableRecipe:(id)a3
{
  PFStoryRecipe *v4;
  PFStoryRecipe *v5;
  PFStoryRecipe *v6;
  char v7;
  PFStoryRecipe *v8;
  PFStoryRecipe *persistableRecipe;
  NSObject *v10;
  PFStoryRecipe *v11;
  int v12;
  PXStoryPersistableRecipeManager *v13;
  __int16 v14;
  PFStoryRecipe *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (PFStoryRecipe *)a3;
  v5 = self->_persistableRecipe;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFStoryRecipe isEqual:](v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (PFStoryRecipe *)-[PFStoryRecipe copyWithZone:](v4, "copyWithZone:", 0);
      persistableRecipe = self->_persistableRecipe;
      self->_persistableRecipe = v8;

      PLStoryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = self->_persistableRecipe;
        v12 = 138412546;
        v13 = self;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "%@ persistableRecipe: %@", (uint8_t *)&v12, 0x16u);
      }

      -[PXStoryPersistableRecipeManager signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setRecipeAssetEdits:(id)a3
{
  PXStoryRecipeAssetEdits *v5;
  PXStoryRecipeAssetEdits *v6;
  BOOL v7;
  PXStoryRecipeAssetEdits *v8;

  v8 = (PXStoryRecipeAssetEdits *)a3;
  v5 = self->_recipeAssetEdits;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXStoryRecipeAssetEdits isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_recipeAssetEdits, a3);
      -[PXStoryPersistableRecipeManager signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)setError:(id)a3
{
  NSError *v5;
  NSError *v6;
  NSError *v7;
  char v8;
  NSObject *v9;
  NSError *error;
  int v11;
  PXStoryPersistableRecipeManager *v12;
  __int16 v13;
  NSError *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (NSError *)a3;
  v6 = self->_error;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSError isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_error, a3);
      PLStoryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        error = self->_error;
        v11 = 138412546;
        v12 = self;
        v13 = 2112;
        v14 = error;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "%@ error: %@", (uint8_t *)&v11, 0x16u);
      }

      -[PXStoryPersistableRecipeManager signalChange:](self, "signalChange:", 16);
    }
  }

}

- (id)_persistableRecipeWithOriginalPersistableRecipe:(id)a3 recipe:(id)a4 recipeAssetEdits:(id)a5 currentStyle:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id *v43;
  uint64_t v44;
  uint64_t (**v45)(void *, void *, uint64_t, _QWORD);
  id v46;
  _QWORD v47[4];
  id v48;
  __int128 *v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  uint64_t *v53;
  _OWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;

  v11 = a3;
  v46 = a4;
  v12 = a5;
  v13 = a6;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__133970;
  v70 = __Block_byref_object_dispose__133971;
  v71 = 0;
  objc_msgSend(MEMORY[0x1E0D752C8], "createRecipe");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopyWithZone:", 0);

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  if (v11)
    objc_msgSend(v11, "overallDurationInfo");
  if (v12)
  {
    objc_msgSend(v12, "overallDurationInfo");
    if (v60)
    {
      objc_msgSend(v12, "overallDurationInfo");
      v63 = v57;
      v64 = v58;
      v65 = v59;
      v61 = v55;
      v62 = v56;
    }
  }
  v54[2] = v63;
  v54[3] = v64;
  v54[4] = v65;
  v54[0] = v61;
  v54[1] = v62;
  objc_msgSend(v15, "setOverallDurationInfo:", v54);
  v43 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __126__PXStoryPersistableRecipeManager__persistableRecipeWithOriginalPersistableRecipe_recipe_recipeAssetEdits_currentStyle_error___block_invoke;
  aBlock[3] = &unk_1E512BD18;
  v17 = v16;
  v51 = v17;
  v53 = &v66;
  v18 = v15;
  v52 = v18;
  v45 = (uint64_t (**)(void *, void *, uint64_t, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v13, "originalColorGradeCategory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v12;
  v44 = objc_msgSend(v13, "customColorGradeKind");
  objc_msgSend(v13, "songResource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (PXStorySongResourceIsNullResource(v20))
  {
    v21 = (id)*MEMORY[0x1E0D759C8];
    v22 = 1;
  }
  else
  {
    objc_msgSend(v13, "songResource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "px_storyResourceSongAsset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v22 = v45[2](v45, v24, 2, 0);
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v25);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("recipe doesn't contain audio asset: %@"), v26, v27, v28, v29, v30, v31, (uint64_t)v24);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v67[5];
        v67[5] = v32;

        v21 = 0;
        v22 = 0;
      }
    }
    else
    {
      v21 = 0;
      v22 = 1;
    }

  }
  objc_msgSend(v20, "px_storyResourceSongAsset");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "catalog");

  if (v35 != 4)
  {
    *(_QWORD *)&v55 = 0;
    *((_QWORD *)&v55 + 1) = &v55;
    *(_QWORD *)&v56 = 0x2020000000;
    BYTE8(v56) = 0;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __126__PXStoryPersistableRecipeManager__persistableRecipeWithOriginalPersistableRecipe_recipe_recipeAssetEdits_currentStyle_error___block_invoke_2;
    v47[3] = &unk_1E512BD40;
    v48 = v18;
    v49 = &v55;
    objc_msgSend(v11, "enumerateAssetsWithKind:usingBlock:", 2, v47);
    objc_msgSend(v46, "fallbackSongResource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "px_storyResourceSongAsset");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(*((_QWORD *)&v55 + 1) + 24) && objc_msgSend(v37, "catalog") == 4)
      v45[2](v45, v37, 1, 0);

    _Block_object_dispose(&v55, 8);
  }
  objc_msgSend(MEMORY[0x1E0D752D8], "createStyleWithOriginalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:", v19, v44, v21, objc_msgSend(v13, "isCustomized"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCurrentStyle:", v38);
  objc_msgSend(v11, "seedSongIdentifiersByCatalog");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSeedSongIdentifiersByCatalog:", v39);

  if (v43)
    *v43 = objc_retainAutorelease((id)v67[5]);
  if (v22)
    v40 = (void *)objc_msgSend(v18, "copyWithZone:", 0);
  else
    v40 = 0;

  _Block_object_dispose(&v66, 8);
  return v40;
}

- (void)_setNeedsUpdate
{
  -[PXStoryPersistableRecipeManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateOriginalPersistableRecipe
{
  id v2;

  -[PXStoryPersistableRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateOriginalPersistableRecipe);

}

- (void)_updateOriginalPersistableRecipe
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXStoryPersistableRecipeManager recipeManager](self, "recipeManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "recipeAttributes") & 1) != 0)
  {
    -[PXStoryPersistableRecipeManager setIsOriginalPersistableRecipeValid:](self, "setIsOriginalPersistableRecipeValid:", 1);
    -[PXStoryPersistableRecipeManager recipeManager](self, "recipeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recipe");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourcePersistableRecipe");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPersistableRecipeManager setOriginalPersistableRecipe:](self, "setOriginalPersistableRecipe:", v5);

  }
}

- (void)_invalidateIsReadyToProducePersistableRecipe
{
  id v2;

  -[PXStoryPersistableRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsReadyToProducePersistableRecipe);

}

- (void)_updateIsReadyToProducePersistableRecipe
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  int v10;
  PXStoryPersistableRecipeManager *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXStoryPersistableRecipeManager resourcesDataSourceManager](self, "resourcesDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDataSourceFinal");

  -[PXStoryPersistableRecipeManager styleManager](self, "styleManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentStyleAttributes") & 3;

  v7 = -[PXStoryPersistableRecipeManager isOriginalPersistableRecipeValid](self, "isOriginalPersistableRecipeValid");
  PLStoryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138413058;
    v11 = self;
    v12 = 1024;
    v13 = v4;
    v14 = 1024;
    v15 = v6 != 0;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "%@ areResourcesFinal: %i isCurrentStyleFinal: %i isOriginalPersistableRecipeValid: %i", (uint8_t *)&v10, 0x1Eu);
  }

  if (v6)
    v9 = v4;
  else
    v9 = 0;
  -[PXStoryPersistableRecipeManager setIsReadyToProducePersistableRecipe:](self, "setIsReadyToProducePersistableRecipe:", v9 & v7);
}

- (void)_invalidateHasUserExperiencedPlayback
{
  id v2;

  -[PXStoryPersistableRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateHasUserExperiencedPlayback);

}

- (void)_updateHasUserExperiencedPlayback
{
  void *v3;
  uint64_t v4;

  -[PXStoryPersistableRecipeManager model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "desiredPlayState");

  if (v4 == 1)
    -[PXStoryPersistableRecipeManager setHasUserExperiencedPlayback:](self, "setHasUserExperiencedPlayback:", 1);
}

- (void)_invalidateHasUserExperiencedFirstPlaybackEver
{
  id v2;

  -[PXStoryPersistableRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateHasUserExperiencedFirstPlaybackEver);

}

- (void)_updateHasUserExperiencedFirstPlaybackEver
{
  void *v3;

  if (-[PXStoryPersistableRecipeManager hasUserExperiencedPlayback](self, "hasUserExperiencedPlayback")
    && -[PXStoryPersistableRecipeManager isOriginalPersistableRecipeValid](self, "isOriginalPersistableRecipeValid"))
  {
    -[PXStoryPersistableRecipeManager originalPersistableRecipe](self, "originalPersistableRecipe");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[PXStoryPersistableRecipeManager setHasUserExperiencedFirstPlaybackEver:](self, "setHasUserExperiencedFirstPlaybackEver:", 1);
  }
}

- (void)_invalidatePersistencePermission
{
  id v2;

  -[PXStoryPersistableRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistencePermission);

}

- (void)_updatePersistencePermission
{
  id v3;

  -[PXStoryPersistableRecipeManager model](self, "model");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryPersistableRecipeManager setPersistencePermission:](self, "setPersistencePermission:", objc_msgSend(v3, "persistencePermission"));

}

- (void)_invalidatePersistableRecipe
{
  id v2;

  -[PXStoryPersistableRecipeManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistableRecipe);

}

- (void)_updatePersistableRecipe
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  PXStoryPersistableRecipeManager *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location;

  if (-[PXStoryPersistableRecipeManager isReadyToProducePersistableRecipe](self, "isReadyToProducePersistableRecipe"))
  {
    -[PXStoryPersistableRecipeManager model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "persistencePermission");
    objc_msgSend(v3, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRelated");

    if (v6)
    {
      if (!-[PXStoryPersistableRecipeManager hasAnyUserChange](self, "hasAnyUserChange"))
        goto LABEL_9;
    }
    else if ((!-[PXStoryPersistableRecipeManager hasUserExperiencedFirstPlaybackEver](self, "hasUserExperiencedFirstPlaybackEver")|| v4 != 1)&& !-[PXStoryPersistableRecipeManager hasAnyUserChange](self, "hasAnyUserChange"))
    {
      goto LABEL_9;
    }
    -[PXStoryPersistableRecipeManager setHasAnyUserChange:](self, "setHasAnyUserChange:", 0);
    -[PXStoryPersistableRecipeManager originalPersistableRecipe](self, "originalPersistableRecipe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPersistableRecipeManager recipeManager](self, "recipeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipeAssetEdits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryPersistableRecipeManager recipeManager](self, "recipeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recipe");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryPersistableRecipeManager styleManager](self, "styleManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPersistableRecipeManager storyQueue](self, "storyQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[PXStoryPersistableRecipeManager workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PXStoryPersistableRecipeManager__updatePersistableRecipe__block_invoke;
    block[3] = &unk_1E512BD90;
    v16 = v14;
    v24 = v16;
    v25 = self;
    v17 = v7;
    v26 = v17;
    v18 = v11;
    v27 = v18;
    v19 = v9;
    v28 = v19;
    v20 = v12;
    v29 = v20;
    v21 = v13;
    v30 = v21;
    objc_copyWeak(&v31, &location);
    dispatch_async(v15, block);

    -[PXStoryPersistableRecipeManager setProgress:](self, "setProgress:", v16);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&location);
LABEL_9:

  }
}

- (void)_handlePersistableRecipe:(id)a3 recipeAssetEdits:(id)a4 error:(id)a5 progress:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  PXStoryPersistableRecipeManager *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(a6, "isCancelled") & 1) == 0)
  {
    if (!v10 || v12)
    {
      -[PXStoryPersistableRecipeManager model](self, "model");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reportPersistenceFailureWithError:", v12);

    }
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __92__PXStoryPersistableRecipeManager__handlePersistableRecipe_recipeAssetEdits_error_progress___block_invoke;
    v19 = &unk_1E512D718;
    v20 = self;
    v21 = v10;
    v22 = v11;
    v14 = v12;
    v23 = v14;
    -[PXStoryPersistableRecipeManager performChanges:](self, "performChanges:", &v16);
    -[PXStoryPersistableRecipeManager errorReporter](self, "errorReporter", v16, v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:forComponent:", v14, CFSTR("RecipePersistence"));

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PXStoryPersistableRecipeManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5140090;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryPersistableRecipeManager performChanges:](self, "performChanges:", v5);
}

- (NSString)diagnosticDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p\n"), v5, self);

  if (-[PXStoryPersistableRecipeManager isOriginalPersistableRecipeValid](self, "isOriginalPersistableRecipeValid"))
  {
    -[PXStoryPersistableRecipeManager originalPersistableRecipe](self, "originalPersistableRecipe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PXStoryPersistableRecipeManager originalPersistableRecipe](self, "originalPersistableRecipe");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "diagnosticDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("originalPersistableRecipe: %@\n"), v9);

    }
    else
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("originalPersistableRecipe: %@\n"), CFSTR("-"));
    }

  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("originalPersistableRecipe: %@\n"), CFSTR("?"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("isReadyToProducePersistableRecipe: %i\n"), -[PXStoryPersistableRecipeManager isReadyToProducePersistableRecipe](self, "isReadyToProducePersistableRecipe"));
  objc_msgSend(v6, "appendFormat:", CFSTR("hasUserExperiencedPlayback: %i\n"), -[PXStoryPersistableRecipeManager hasUserExperiencedPlayback](self, "hasUserExperiencedPlayback"));
  objc_msgSend(v6, "appendFormat:", CFSTR("hasUserExperiencedFirstPlaybackEver: %i\n"), -[PXStoryPersistableRecipeManager hasUserExperiencedFirstPlaybackEver](self, "hasUserExperiencedFirstPlaybackEver"));
  objc_msgSend(v6, "appendFormat:", CFSTR("hasAnyUserChange: %i\n"), -[PXStoryPersistableRecipeManager hasAnyUserChange](self, "hasAnyUserChange"));
  if (!-[PXStoryPersistableRecipeManager isReadyToProducePersistableRecipe](self, "isReadyToProducePersistableRecipe"))
  {
    -[PXStoryPersistableRecipeManager recipeManager](self, "recipeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("isRecipeFinal: %i\n"), objc_msgSend(v10, "isRecipeFinal"));

    -[PXStoryPersistableRecipeManager resourcesDataSourceManager](self, "resourcesDataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("areResourcesFinal: %i\n"), objc_msgSend(v11, "isDataSourceFinal"));

    -[PXStoryPersistableRecipeManager styleManager](self, "styleManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("isCurrentStyleFinal: %i\n"), objc_msgSend(v12, "isCurrentStyleFinal"));

  }
  objc_msgSend(v6, "appendFormat:", CFSTR("isProducingPersistableRecipe: %i\n"), -[PXStoryPersistableRecipeManager isProducingPersistableRecipe](self, "isProducingPersistableRecipe"));
  -[PXStoryPersistableRecipeManager persistableRecipe](self, "persistableRecipe");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "diagnosticDescription");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("-");
  objc_msgSend(v6, "appendFormat:", CFSTR("persistableRecipe: %@\n"), v16);

  -[PXStoryPersistableRecipeManager error](self, "error");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("-");
  objc_msgSend(v6, "appendFormat:", CFSTR("error: %@\n"), v19);

  v20 = (void *)objc_msgSend(v6, "copy");
  return (NSString *)v20;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (BOOL)isReadyToProducePersistableRecipe
{
  return self->_isReadyToProducePersistableRecipe;
}

- (BOOL)isProducingPersistableRecipe
{
  return self->_isProducingPersistableRecipe;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (PXStoryRecipeAssetEdits)recipeAssetEdits
{
  return self->_recipeAssetEdits;
}

- (NSError)error
{
  return self->_error;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (PXStoryResourcesDataSourceManager)resourcesDataSourceManager
{
  return self->_resourcesDataSourceManager;
}

- (PXStoryStyleManager)styleManager
{
  return self->_styleManager;
}

- (BOOL)isOriginalPersistableRecipeValid
{
  return self->_isOriginalPersistableRecipeValid;
}

- (PFStoryRecipe)originalPersistableRecipe
{
  return self->_originalPersistableRecipe;
}

- (void)setOriginalPersistableRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_originalPersistableRecipe, a3);
}

- (BOOL)hasUserExperiencedPlayback
{
  return self->_hasUserExperiencedPlayback;
}

- (BOOL)hasUserExperiencedFirstPlaybackEver
{
  return self->_hasUserExperiencedFirstPlaybackEver;
}

- (BOOL)hasAnyUserChange
{
  return self->_hasAnyUserChange;
}

- (int64_t)persistencePermission
{
  return self->_persistencePermission;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_originalPersistableRecipe, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
  objc_storeStrong((id *)&self->_resourcesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_recipeAssetEdits, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

void __64__PXStoryPersistableRecipeManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == ModelObservationContext_133951)
  {
    v10 = *(_QWORD *)(a1 + 48);
    if ((v10 & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateHasUserExperiencedPlayback");
      v10 = *(_QWORD *)(a1 + 48);
    }
    if ((v10 & 0x4000000000) != 0)
    {
      v11 = *(void **)(a1 + 32);
      v5 = (id *)(a1 + 32);
      objc_msgSend(v11, "_invalidatePersistencePermission");
      goto LABEL_23;
    }
  }
  else if (v3 == RecipeManagerObservationContext_133952)
  {
    v12 = *(_QWORD *)(a1 + 48);
    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateIsReadyToProducePersistableRecipe");
      objc_msgSend(*(id *)(a1 + 32), "_invalidateOriginalPersistableRecipe");
      objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistableRecipe");
      v12 = *(_QWORD *)(a1 + 48);
    }
    if ((v12 & 0x40) != 0)
    {
      v13 = *(void **)(a1 + 32);
      v5 = (id *)(a1 + 32);
      v9 = v13;
      goto LABEL_18;
    }
  }
  else if (v3 == ResourcesDataSourceManagerObservationContext)
  {
    v14 = *(_QWORD *)(a1 + 48);
    if ((v14 & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateIsReadyToProducePersistableRecipe");
      v14 = *(_QWORD *)(a1 + 48);
    }
    if ((v14 & 1) != 0)
    {
      v5 = (id *)(a1 + 32);
      goto LABEL_23;
    }
  }
  else
  {
    if (v3 != StyleManagerObservationContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryPersistableRecipeManager.m"), 486, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v4 = *(_QWORD *)(a1 + 48);
    if ((v4 & 0x10) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateIsReadyToProducePersistableRecipe");
      v4 = *(_QWORD *)(a1 + 48);
    }
    if ((v4 & 6) != 0)
    {
      v6 = *(void **)(a1 + 32);
      v5 = (id *)(a1 + 32);
      objc_msgSend(v6, "styleManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "changesOrigin");

      if ((v8 & 2) != 0)
      {
        v9 = *v5;
LABEL_18:
        objc_msgSend(v9, "setHasAnyUserChange:", 1);
      }
LABEL_23:
      objc_msgSend(*v5, "_invalidatePersistableRecipe");
    }
  }

}

uint64_t __92__PXStoryPersistableRecipeManager__handlePersistableRecipe_recipeAssetEdits_error_progress___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPersistableRecipe:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setRecipeAssetEdits:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "setProgress:", 0);
}

void __59__PXStoryPersistableRecipeManager__updatePersistableRecipe__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 72);
    v18 = 0;
    objc_msgSend(v2, "_persistableRecipeWithOriginalPersistableRecipe:recipe:recipeAssetEdits:currentStyle:error:", v3, v4, v5, v6, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    v9 = *(NSObject **)(a1 + 80);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__PXStoryPersistableRecipeManager__updatePersistableRecipe__block_invoke_2;
    v12[3] = &unk_1E512BD68;
    objc_copyWeak(&v17, (id *)(a1 + 88));
    v13 = v7;
    v14 = *(id *)(a1 + 64);
    v15 = v8;
    v16 = *(id *)(a1 + 32);
    v10 = v8;
    v11 = v7;
    dispatch_async(v9, v12);

    objc_destroyWeak(&v17);
  }
}

void __59__PXStoryPersistableRecipeManager__updatePersistableRecipe__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handlePersistableRecipe:recipeAssetEdits:error:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

BOOL __126__PXStoryPersistableRecipeManager__persistableRecipeWithOriginalPersistableRecipe_recipe_recipeAssetEdits_currentStyle_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;

  v7 = a2;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 1;
  }
  else
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v11 + 40);
    +[PFStoryRecipe_PXStoryExtension recipeAssetFromAudioAsset:withCategory:subcategory:error:](PFStoryRecipe_PXStoryExtension, "recipeAssetFromAudioAsset:withCategory:subcategory:error:", v7, a3, a4, &obj);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);
    v10 = v12 != 0;
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "addAsset:", v12);
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v8);

    }
  }

  return v10;
}

void __126__PXStoryPersistableRecipeManager__persistableRecipeWithOriginalPersistableRecipe_recipe_recipeAssetEdits_currentStyle_error___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "catalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0D759F0]);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addAsset:", v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

uint64_t __62__PXStoryPersistableRecipeManager_initWithModel_styleManager___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateOriginalPersistableRecipe");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateIsReadyToProducePersistableRecipe");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateHasUserExperiencedPlayback");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistencePermission");
}

@end

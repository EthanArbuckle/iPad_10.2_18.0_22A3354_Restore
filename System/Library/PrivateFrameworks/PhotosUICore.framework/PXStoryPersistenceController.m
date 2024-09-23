@implementation PXStoryPersistenceController

- (PXStoryPersistenceController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPersistenceController.m"), 46, CFSTR("%s is not available as initializer"), "-[PXStoryPersistenceController initWithObservableModel:]");

  abort();
}

- (PXStoryPersistenceController)initWithModel:(id)a3
{
  id v4;
  PXStoryPersistenceController *v5;
  PXStoryPersistenceController *v6;
  id WeakRetained;
  uint64_t v8;
  PXStoryConfiguration *configuration;
  uint64_t v10;
  PXStoryErrorReporter *errorReporter;
  id v12;
  uint64_t v13;
  PXStoryPersistenceController *v14;
  _QWORD v16[4];
  PXStoryPersistenceController *v17;
  _QWORD v18[4];
  PXStoryPersistenceController *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryPersistenceController;
  v5 = -[PXStoryController initWithObservableModel:](&v20, sel_initWithObservableModel_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    objc_msgSend(v4, "registerChangeObserver:context:", v6, StoryModelObservationContext);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_model);
    objc_msgSend(WeakRetained, "configuration");
    v8 = objc_claimAutoreleasedReturnValue();
    configuration = v6->_configuration;
    v6->_configuration = (PXStoryConfiguration *)v8;

    -[PXStoryConfiguration errorReporter](v6->_configuration, "errorReporter");
    v10 = objc_claimAutoreleasedReturnValue();
    errorReporter = v6->_errorReporter;
    v6->_errorReporter = (PXStoryErrorReporter *)v10;

    v12 = objc_loadWeakRetained((id *)&v6->_model);
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__PXStoryPersistenceController_initWithModel___block_invoke;
    v18[3] = &unk_1E5142E50;
    v14 = v6;
    v19 = v14;
    objc_msgSend(v12, "performChanges:", v18);

    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __46__PXStoryPersistenceController_initWithModel___block_invoke_2;
    v16[3] = &unk_1E51479C8;
    v17 = v14;
    -[PXStoryController performChanges:](v17, "performChanges:", v16);

  }
  return v6;
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryPersistenceController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updatePersistableRecipeManager, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updatePersistableRecipe);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateRecipeAssetEdits);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateWrite);

}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryPersistenceController _invalidatePersistableRecipeManager](self, "_invalidatePersistableRecipeManager");
  }
}

- (void)setConfiguration:(id)a3
{
  PXStoryConfiguration *v5;
  PXStoryPersistableRecipeWriter *writer;
  char v7;
  PXStoryConfiguration *v8;

  v8 = (PXStoryConfiguration *)a3;
  v5 = self->_configuration;
  writer = (PXStoryPersistableRecipeWriter *)v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[PXStoryConfiguration isEqual:](v5, "isEqual:", v8);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    writer = self->_writer;
    self->_writer = 0;
LABEL_4:

  }
}

- (void)setPersistableRecipeManager:(id)a3
{
  PXStoryPersistableRecipeManager *v5;
  PXStoryPersistableRecipeManager *persistableRecipeManager;
  PXStoryPersistableRecipeManager *v7;

  v5 = (PXStoryPersistableRecipeManager *)a3;
  persistableRecipeManager = self->_persistableRecipeManager;
  if (persistableRecipeManager != v5)
  {
    v7 = v5;
    -[PXStoryPersistableRecipeManager unregisterChangeObserver:context:](persistableRecipeManager, "unregisterChangeObserver:context:", self, PersistableRecipeManagerObservationContext);
    objc_storeStrong((id *)&self->_persistableRecipeManager, a3);
    -[PXStoryPersistableRecipeManager registerChangeObserver:context:](self->_persistableRecipeManager, "registerChangeObserver:context:", self, PersistableRecipeManagerObservationContext);
    -[PXStoryPersistenceController _invalidatePersistableRecipe](self, "_invalidatePersistableRecipe");
    -[PXStoryPersistenceController _invalidateRecipeAssetEdits](self, "_invalidateRecipeAssetEdits");
    v5 = v7;
  }

}

- (void)setPersistableRecipe:(id)a3
{
  PFStoryRecipe *v5;
  PFStoryRecipe *v6;
  char v7;
  PFStoryRecipe *v8;

  v5 = (PFStoryRecipe *)a3;
  v6 = v5;
  if (self->_persistableRecipe != v5)
  {
    v8 = v5;
    v7 = -[PFStoryRecipe isEqualToRecipe:](v5, "isEqualToRecipe:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_persistableRecipe, a3);
      -[PXStoryPersistenceController _invalidateWrite](self, "_invalidateWrite");
      v6 = v8;
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
      -[PXStoryPersistenceController _invalidateWrite](self, "_invalidateWrite");
    }
  }

}

- (void)_ensureWriter
{
  PXStoryPersistableRecipeWriter *v3;
  PXStoryPersistableRecipeWriter *writer;
  id v5;

  if (!self->_writer)
  {
    -[PXStoryPersistenceController configuration](self, "configuration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[PXStoryPersistableRecipeWriterFactory defaultPersistableRecipeWriterForConfiguration:](PXStoryPersistableRecipeWriterFactory, "defaultPersistableRecipeWriterForConfiguration:", v5);
    v3 = (PXStoryPersistableRecipeWriter *)objc_claimAutoreleasedReturnValue();
    writer = self->_writer;
    self->_writer = v3;

  }
}

- (void)setWriterProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_writerProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_writerProgress = &self->_writerProgress;
  if (*p_writerProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_writerProgress, "cancel");
    objc_storeStrong((id *)p_writerProgress, a3);
    v5 = v7;
  }

}

- (void)setError:(id)a3
{
  NSError *v5;
  void *v6;
  char v7;
  NSError *v8;

  v8 = (NSError *)a3;
  v5 = self->_error;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[NSError isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_error, a3);
    -[PXStoryPersistenceController errorReporter](self, "errorReporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setError:forComponent:", self->_error, CFSTR("Persistence"));
LABEL_4:

  }
}

- (void)_invalidatePersistableRecipeManager
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistableRecipeManager);

}

- (void)_updatePersistableRecipeManager
{
  void *v3;
  void *v4;
  char v5;
  PXStoryPersistableRecipeManager *v6;
  PXStoryPersistableRecipeManager *v7;
  id v8;

  -[PXStoryPersistenceController model](self, "model");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_4;
  objc_msgSend(v8, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleMusicPreview");

  if ((v5 & 1) == 0)
  {
    v6 = [PXStoryPersistableRecipeManager alloc];
    objc_msgSend(v8, "styleManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXStoryPersistableRecipeManager initWithModel:styleManager:](v6, "initWithModel:styleManager:", v8, v3);
    -[PXStoryPersistenceController setPersistableRecipeManager:](self, "setPersistableRecipeManager:", v7);

LABEL_4:
  }

}

- (void)_invalidatePersistableRecipe
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePersistableRecipe);

}

- (void)_updatePersistableRecipe
{
  void *v3;
  id v4;

  -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistableRecipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPersistenceController setPersistableRecipe:](self, "setPersistableRecipe:", v3);

}

- (void)_invalidateRecipeAssetEdits
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRecipeAssetEdits);

}

- (void)_updateRecipeAssetEdits
{
  void *v3;
  id v4;

  -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipeAssetEdits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPersistenceController setRecipeAssetEdits:](self, "setRecipeAssetEdits:", v3);

}

- (void)_invalidateWrite
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateWrite);

}

- (void)_updateWrite
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26[4];
  uint8_t v27[16];
  id buf[2];

  -[PXStoryPersistenceController writerProgress](self, "writerProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXStoryPersistenceController persistableRecipe](self, "persistableRecipe");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPersistenceController recipeAssetEdits](self, "recipeAssetEdits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryPersistenceController model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryPersistenceController setPersisted:](self, "setPersisted:", 0);
    if (v4)
    {
      PLStoryGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "Writing recipe…", (uint8_t *)buf, 2u);
      }

      -[PXStoryPersistenceController _ensureWriter](self, "_ensureWriter");
      objc_initWeak(buf, self);
      -[PXStoryPersistenceController log](self, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (char *)os_signpost_id_make_with_pointer(v9, self);
      v11 = v9;
      v12 = v11;
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)v27 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "StoryRecipeWrite", ", v27, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v14 = v13;
      -[PXStoryController storyQueue](self, "storyQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)PXSyncCallbackBegin();
      -[PXStoryPersistenceController writer](self, "writer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __44__PXStoryPersistenceController__updateWrite__block_invoke;
      v21[3] = &unk_1E511E390;
      v18 = v12;
      v22 = v18;
      v26[1] = v10;
      v26[2] = v14;
      v26[3] = v16;
      objc_copyWeak(v26, buf);
      v23 = v4;
      v24 = v5;
      v19 = v15;
      v25 = v19;
      objc_msgSend(v17, "writePersistableRecipe:assetEdits:undoManager:resultHandler:", v23, v24, v7, v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(v26);
      objc_destroyWeak(buf);
    }
    else
    {
      v20 = 0;
    }
    -[PXStoryPersistenceController setWriterProgress:](self, "setWriterProgress:", v20);

  }
}

- (void)_handleWriteSuccess:(BOOL)a3 createdAssetCollection:(id)a4 error:(id)a5 forPersistableRecipe:(id)a6 recipeAssetEdits:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  char v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  char v35;
  NSObject *v36;
  _QWORD v37[5];
  _QWORD v38[4];
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v10 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v10)
  {
    v16 = 0;
  }
  else
  {
    PLStoryGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v13;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Recipe failed to be written: %@", buf, 0xCu);
    }

    -[PXStoryPersistenceController model](self, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reportPersistenceFailureWithError:", v13);

    v16 = v13;
  }
  -[PXStoryPersistenceController setPersisted:](self, "setPersisted:", v10);
  -[PXStoryPersistenceController setError:](self, "setError:", v16);
  -[PXStoryPersistenceController setWriterProgress:](self, "setWriterProgress:", 0);
  v19 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    -[PXStoryPersistenceController persistableRecipe](self, "persistableRecipe");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20 == v14)
    {

      v23 = v14;
    }
    else
    {
      v21 = v20;
      v22 = -[NSObject isEqual:](v14, "isEqual:", v20);

      if ((v22 & 1) != 0)
        goto LABEL_13;
      PXAssertGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "New persistable recipe while creating the PHMemory, this shouldn't happen and might lead to lost user changes.", buf, 2u);
      }
    }

LABEL_13:
    -[PXStoryPersistenceController recipeAssetEdits](self, "recipeAssetEdits");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24 == v15)
    {

      v27 = v15;
    }
    else
    {
      v25 = v24;
      v26 = -[NSObject isEqual:](v15, "isEqual:", v24);

      if ((v26 & 1) != 0)
      {
LABEL_19:
        -[PXStoryPersistenceController model](self, "model");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v19;
        v40[1] = 3221225472;
        v40[2] = __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke;
        v40[3] = &unk_1E5142E50;
        v41 = v12;
        objc_msgSend(v28, "performChanges:", v40);

        goto LABEL_20;
      }
      PXAssertGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "New recipeAssetEdits while creating the PHMemory, this shouldn't happen and might lead to lost user changes.", buf, 2u);
      }
    }

    goto LABEL_19;
  }
LABEL_20:
  if (v15 && v10)
  {
    -[PXStoryPersistenceController model](self, "model");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "recipeManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    v38[1] = 3221225472;
    v38[2] = __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke_2;
    v38[3] = &unk_1E5130830;
    v39 = v15;
    objc_msgSend(v30, "performChanges:", v38);

  }
  -[PXStoryPersistenceController persistableRecipe](self, "persistableRecipe");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v31 == v14)
  {

  }
  else
  {
    v32 = -[NSObject isEqual:](v14, "isEqual:", v31);

    if ((v32 & 1) == 0)
    {

LABEL_29:
      PLStoryGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEBUG, "Recipe was updated while writing, writing again…", buf, 2u);
      }

      v37[0] = v19;
      v37[1] = 3221225472;
      v37[2] = __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke_24;
      v37[3] = &unk_1E511E3B8;
      v37[4] = self;
      -[PXStoryController performChanges:](self, "performChanges:", v37);
      goto LABEL_33;
    }
  }
  -[PXStoryPersistenceController recipeAssetEdits](self, "recipeAssetEdits");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (v33 == v15)
  {

    goto LABEL_33;
  }
  v34 = v33;
  v35 = -[NSObject isEqual:](v15, "isEqual:", v33);

  if ((v35 & 1) == 0)
    goto LABEL_29;
LABEL_33:

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  _QWORD *v9;
  objc_super v10;
  _QWORD v11[5];
  _QWORD v12[6];

  v8 = a3;
  if ((void *)PersistableRecipeManagerObservationContext == a5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__PXStoryPersistenceController_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E511E3E0;
    v12[4] = self;
    v12[5] = a4;
    v9 = v12;
    goto LABEL_7;
  }
  if ((void *)StoryModelObservationContext == a5)
  {
    if ((a4 & 0x2000000000) == 0)
      goto LABEL_8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__PXStoryPersistenceController_observable_didChange_context___block_invoke_2;
    v11[3] = &unk_1E511E3B8;
    v11[4] = self;
    v9 = v11;
LABEL_7:
    -[PXStoryController performChanges:](self, "performChanges:", v9);
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXStoryPersistenceController;
  -[PXStoryController observable:didChange:context:](&v10, sel_observable_didChange_context_, v8, a4, a5);
LABEL_8:

}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[PXStoryPersistenceController persisted](self, "persisted"))
  {
    v6 = CFSTR("✅ Changes saved successfully\n");
LABEL_5:
    objc_msgSend(v5, "appendString:", v6);
    goto LABEL_6;
  }
  -[PXStoryPersistenceController writerProgress](self, "writerProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v6 = CFSTR("Writing…\n");
    goto LABEL_5;
  }
  -[PXStoryPersistenceController error](self, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PXStoryPersistenceController error](self, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("❌ Changes failed to be saved: %@\n"), v18);
  }
  else
  {
    if (!-[PXStoryPersistenceController isActive](self, "isActive"))
    {
      v6 = CFSTR("⚠️ Inactive");
      goto LABEL_5;
    }
    -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isReadyToProducePersistableRecipe");

    if ((v20 & 1) != 0)
    {
      -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isProducingPersistableRecipe");

      if (v22)
      {
        v6 = CFSTR("🔳 Producing persistable recipe…\n");
        goto LABEL_5;
      }
      -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        -[PXStoryPersistenceController persistableRecipe](self, "persistableRecipe");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          v6 = CFSTR("❌ Unexpected state\n");
        else
          v6 = CFSTR("🔳 No changes to save\n");
        goto LABEL_5;
      }
      -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("❌ Persistabled recipe failed to be produced: %@\n"), v23);
    }
    else
    {
      objc_msgSend(v5, "appendString:", CFSTR("⚠️ Waiting…\n"));
      -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "diagnosticDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v23);
    }

  }
LABEL_6:
  -[PXStoryPersistenceController writer](self, "writer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXStoryPersistenceController writer](self, "writer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Writer: %@\n"), v11);

  }
  -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PXStoryPersistenceController persistableRecipeManager](self, "persistableRecipeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "diagnosticDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Manager: %@\n"), v14);

  }
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  -[PXStoryPersistenceController error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Persistence"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryPersistableRecipeManager)persistableRecipeManager
{
  return self->_persistableRecipeManager;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (PXStoryRecipeAssetEdits)recipeAssetEdits
{
  return self->_recipeAssetEdits;
}

- (PXStoryPersistableRecipeWriter)writer
{
  return self->_writer;
}

- (NSProgress)writerProgress
{
  return self->_writerProgress;
}

- (BOOL)persisted
{
  return self->_persisted;
}

- (void)setPersisted:(BOOL)a3
{
  self->_persisted = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writerProgress, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_recipeAssetEdits, 0);
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
  objc_storeStrong((id *)&self->_persistableRecipeManager, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_model);
}

void __61__PXStoryPersistenceController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistableRecipe");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 8) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateRecipeAssetEdits");

}

void __61__PXStoryPersistenceController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "model");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v2);

}

uint64_t __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reconfigureWithAssetCollection:", *(_QWORD *)(a1 + 32));
}

uint64_t __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didPersistRecipeAssetEdits:", *(_QWORD *)(a1 + 32));
}

uint64_t __119__PXStoryPersistenceController__handleWriteSuccess_createdAssetCollection_error_forPersistableRecipe_recipeAssetEdits___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWrite");
}

void __44__PXStoryPersistenceController__updateWrite__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  double v13;
  double v14;
  id WeakRetained;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  uint8_t buf[4];
  double v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_END, v11, "StoryRecipeWrite", ", buf, 2u);
  }

  PLStoryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v14 = v13 - *(double *)(a1 + 80);
    *(_DWORD *)buf = 134218498;
    v25 = v14;
    v26 = 1024;
    v27 = a2;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "Recipe written in %0.3fs with success: %i error: %@", buf, 0x1Cu);
  }

  if (PXIsSyncCallback())
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_handleWriteSuccess:createdAssetCollection:error:forPersistableRecipe:recipeAssetEdits:", a2, v7, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    v16 = *(NSObject **)(a1 + 56);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__PXStoryPersistenceController__updateWrite__block_invoke_20;
    v17[3] = &unk_1E511E368;
    objc_copyWeak(&v22, (id *)(a1 + 64));
    v23 = a2;
    v18 = v7;
    v19 = v8;
    v20 = *(id *)(a1 + 40);
    v21 = *(id *)(a1 + 48);
    dispatch_async(v16, v17);

    objc_destroyWeak(&v22);
  }

}

void __44__PXStoryPersistenceController__updateWrite__block_invoke_20(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleWriteSuccess:createdAssetCollection:error:forPersistableRecipe:recipeAssetEdits:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __46__PXStoryPersistenceController_initWithModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 13);
}

uint64_t __46__PXStoryPersistenceController_initWithModel___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePersistableRecipeManager");
}

@end

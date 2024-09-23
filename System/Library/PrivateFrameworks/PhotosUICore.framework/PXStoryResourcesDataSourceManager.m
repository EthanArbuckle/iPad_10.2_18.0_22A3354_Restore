@implementation PXStoryResourcesDataSourceManager

- (PXStoryResourcesDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesDataSourceManager.m"), 42, CFSTR("%s is not available as initializer"), "-[PXStoryResourcesDataSourceManager init]");

  abort();
}

- (PXStoryResourcesDataSourceManager)initWithRecipeManager:(id)a3
{
  id v5;
  PXStoryResourcesDataSourceManager *v6;
  PXStoryResourcesDataSourceManager *v7;
  uint64_t v8;
  OS_dispatch_queue *storyQueue;
  uint64_t v10;
  PXStoryConfiguration *configuration;
  uint64_t v12;
  PXUpdater *updater;
  _QWORD v15[4];
  PXStoryResourcesDataSourceManager *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryResourcesDataSourceManager;
  v6 = -[PXStoryResourcesDataSourceManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PXStoryResourcesDataSourceManager copyLogConfigurationFrom:](v6, "copyLogConfigurationFrom:", v5);
    objc_storeStrong((id *)&v7->_recipeManager, a3);
    -[PXStoryRecipeManager registerChangeObserver:context:](v7->_recipeManager, "registerChangeObserver:context:", v7, RecipeManagerObservationContext_120744);
    -[PXStoryRecipeManager storyQueue](v7->_recipeManager, "storyQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    storyQueue = v7->_storyQueue;
    v7->_storyQueue = (OS_dispatch_queue *)v8;

    -[PXStoryRecipeManager configuration](v7->_recipeManager, "configuration");
    v10 = objc_claimAutoreleasedReturnValue();
    configuration = v7->_configuration;
    v7->_configuration = (PXStoryConfiguration *)v10;

    v12 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v12;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateRecipe);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateDataSource);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateIsDataSourceFinal);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PXStoryResourcesDataSourceManager_initWithRecipeManager___block_invoke;
    v15[3] = &unk_1E51297D0;
    v16 = v7;
    -[PXStoryResourcesDataSourceManager performChanges:](v16, "performChanges:", v15);

  }
  return v7;
}

- (void)setRecipe:(id)a3
{
  PXStoryRecipe *v5;
  PXStoryRecipe *v6;
  PXStoryRecipe *v7;
  char v8;
  PXStoryRecipe *v9;
  id v10;
  id v11;
  int v12;
  id v13;
  id v14;
  int v15;
  id v16;
  id v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  __int128 v39;
  _QWORD v40[8];
  __int128 v41;
  _QWORD v42[4];
  __int128 v43;
  __int128 v44;
  CMTime time2;
  CMTime time1;

  v5 = (PXStoryRecipe *)a3;
  v6 = self->_recipe;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXStoryRecipe isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      v9 = self->_recipe;
      objc_storeStrong((id *)&self->_recipe, a3);
      -[PXStoryRecipe keyAsset](v5, "keyAsset");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipe keyAsset](v9, "keyAsset");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {

      }
      else
      {
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_26;
      }
      -[PXStoryRecipe curatedAssets](v5, "curatedAssets");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipe curatedAssets](v9, "curatedAssets");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {

      }
      else
      {
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (!v15)
          goto LABEL_25;
      }
      -[PXStoryRecipe movieHighlights](v5, "movieHighlights");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipe movieHighlights](v9, "movieHighlights");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v37 = v16;
      if (v16 == v17)
      {

      }
      else
      {
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
          goto LABEL_24;
      }
      -[PXStoryRecipe detailedSaliency](v5, "detailedSaliency");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipe detailedSaliency](v9, "detailedSaliency");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v35 = v20;
      v36 = v19;
      if (v19 == v20)
      {

      }
      else
      {
        v21 = v20;
        v22 = objc_msgSend(v19, "isEqual:", v20);

        if (!v22)
          goto LABEL_23;
      }
      -[PXStoryRecipe chapterCollection](v5, "chapterCollection");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipe chapterCollection](v9, "chapterCollection");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v33 = v24;
      v34 = v23;
      if (v23 == v24)
      {

      }
      else
      {
        v25 = v24;
        v26 = objc_msgSend(v23, "isEqual:", v24);

        if (!v26)
        {

LABEL_23:
LABEL_24:

LABEL_25:
LABEL_26:

LABEL_27:
          -[PXStoryResourcesDataSourceManager _invalidateDataSource](self, "_invalidateDataSource");
LABEL_28:

          goto LABEL_29;
        }
      }
      -[PXStoryRecipe assetCollection](v5, "assetCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRecipe assetCollection](v9, "assetCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 == v28)
      {
        v30 = v28;
        if (v5)
        {
          -[PXStoryRecipe overallDurationInfo](v5, "overallDurationInfo");
        }
        else
        {
          memset(v42, 0, sizeof(v42));
          v41 = 0u;
          memset(&v40[4], 0, 32);
        }
        if (v9)
        {
          -[PXStoryRecipe overallDurationInfo](v9, "overallDurationInfo");
          v31 = v38[0];
        }
        else
        {
          v31 = 0;
          memset(v40, 0, 32);
          v39 = 0u;
          memset(v38, 0, sizeof(v38));
        }
        if (v40[4] != v31)
          goto LABEL_42;
        v44 = v41;
        v43 = v39;
        time1 = *(CMTime *)&v40[5];
        time2 = *(CMTime *)&v38[1];
        if (CMTimeCompare(&time1, &time2)
          || (*(_OWORD *)&time1.value = v44,
              time1.epoch = v42[0],
              *(_OWORD *)&time2.value = v43,
              time2.epoch = v40[0],
              CMTimeCompare(&time1, &time2)))
        {
LABEL_42:
          v32 = 0;
        }
        else
        {
          time1 = *(CMTime *)&v42[1];
          time2 = *(CMTime *)&v40[1];
          v32 = CMTimeCompare(&time1, &time2) == 0;
        }
        v28 = v30;
        v29 = !v32;
      }
      else
      {
        v29 = 1;
      }

      if ((v29 & 1) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
LABEL_29:

}

- (PXStoryResourcesDataSource)dataSource
{
  PXStoryResourcesDataSource *dataSource;
  void *v6;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesDataSourceManager.m"), 91, CFSTR("data source not set"));

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)setDataSource:(id)a3
{
  PXStoryResourcesDataSource *v5;
  char v6;
  PXStoryResourcesDataSource *v7;

  v7 = (PXStoryResourcesDataSource *)a3;
  v5 = self->_dataSource;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryResourcesDataSource isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      -[PXStoryResourcesDataSourceManager signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setIsDataSourceFinal:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;

  if (self->_isDataSourceFinal != a3)
  {
    if (self->_isDataSourceFinal && !a3)
    {
      PXAssertGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Data source expected to remain final.", (uint8_t *)&v18, 2u);
      }

      -[PXStoryResourcesDataSourceManager recipeManager](self, "recipeManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorReporter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryErrorCreateWithCodeDebugFormat(13, CFSTR("Invalid data source attributes change."), v9, v10, v11, v12, v13, v14, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setError:forComponent:", v15, v17);

    }
    self->_isDataSourceFinal = a3;
    -[PXStoryResourcesDataSourceManager signalChange:](self, "signalChange:", 2);
  }
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryResourcesDataSourceManager storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryResourcesDataSourceManager;
  -[PXStoryResourcesDataSourceManager performChanges:](&v6, sel_performChanges_, v4);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesDataSourceManager;
  -[PXStoryResourcesDataSourceManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryResourcesDataSourceManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PXStoryResourcesDataSourceManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateRecipe
{
  id v2;

  -[PXStoryResourcesDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRecipe);

}

- (void)_updateRecipe
{
  void *v3;
  id v4;

  -[PXStoryResourcesDataSourceManager recipeManager](self, "recipeManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryResourcesDataSourceManager setRecipe:](self, "setRecipe:", v3);

}

- (void)_invalidateDataSource
{
  id v2;

  -[PXStoryResourcesDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDataSource);

}

- (void)_updateDataSource
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PXStoryResourcesDataSource *v14;
  void *v15;
  _OWORD v16[5];

  -[PXStoryResourcesDataSourceManager recipe](self, "recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PXStoryResourcesDataSource alloc];
  objc_msgSend(v3, "keyAsset");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "curatedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "movieHighlights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailedSaliency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chapterCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "overallDurationInfo");
  else
    memset(v16, 0, sizeof(v16));
  -[PXStoryResourcesDataSourceManager configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXStoryResourcesDataSource initWithKeyAsset:displayAssets:availableDisplayAssets:movieHighlights:detailedSaliency:chapterCollection:audioAssets:assetCollection:overallDurationInfo:storyConfiguration:](v14, "initWithKeyAsset:displayAssets:availableDisplayAssets:movieHighlights:detailedSaliency:chapterCollection:audioAssets:assetCollection:overallDurationInfo:storyConfiguration:", v4, v5, v6, v7, v8, v9, 0, v10, v16, v11);
  v15 = (void *)v4;
  v13 = (void *)v12;
  -[PXStoryResourcesDataSourceManager setDataSource:](self, "setDataSource:", v12);

}

- (void)_invalidateIsDataSourceFinal
{
  id v2;

  -[PXStoryResourcesDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsDataSourceFinal);

}

- (void)_updateIsDataSourceFinal
{
  id v3;

  -[PXStoryResourcesDataSourceManager recipeManager](self, "recipeManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryResourcesDataSourceManager setIsDataSourceFinal:](self, "setIsDataSourceFinal:", (objc_msgSend(v3, "recipeAttributes") & 3) != 0);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PXStoryResourcesDataSourceManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5140090;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryResourcesDataSourceManager performChanges:](self, "performChanges:", v5);
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (BOOL)isDataSourceFinal
{
  return self->_isDataSourceFinal;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (PXStoryRecipe)recipe
{
  return self->_recipe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

void __66__PXStoryResourcesDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40) != RecipeManagerObservationContext_120744)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryResourcesDataSourceManager.m"), 174, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_invalidateRecipe");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateIsDataSourceFinal");
    v3 = v5;
  }

}

uint64_t __59__PXStoryResourcesDataSourceManager_initWithRecipeManager___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateRecipe");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIsDataSourceFinal");
}

@end

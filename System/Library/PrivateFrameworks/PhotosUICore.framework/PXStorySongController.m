@implementation PXStorySongController

- (PXStorySongController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStorySongController.m"), 32, CFSTR("%s is not available as initializer"), "-[PXStorySongController initWithObservableModel:]");

  abort();
}

- (PXStorySongController)initWithModel:(id)a3
{
  id v4;
  PXStorySongController *v5;
  PXStorySongController *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  PXStorySongController *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXStorySongController;
  v5 = -[PXStoryController initWithObservableModel:](&v12, sel_initWithObservableModel_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    v6->_failedSongDelayBeforeSwitchingToFallback = 0.0;
    objc_msgSend(v4, "recipeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerChangeObserver:context:", v6, RecipeManagerContext);

    objc_msgSend(v4, "styleManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:context:", v6, StyleManagerContext);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__PXStorySongController_initWithModel___block_invoke;
    v10[3] = &unk_1E5146DD8;
    v11 = v6;
    -[PXStorySongController performChanges:](v11, "performChanges:", v10);

  }
  return v6;
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStorySongController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCurrentSongResource, v4.receiver, v4.super_class);

}

- (void)setCurrentSongResource:(id)a3
{
  PXStorySongResource *v5;
  PXStorySongResource *v6;
  PXStorySongResource *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  PXStorySongResource *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (PXStorySongResource *)a3;
  v6 = self->_currentSongResource;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXStorySongResource isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentSongResource, a3);
      -[PXStorySongResource px_storyResourceSongAsset](v5, "px_storyResourceSongAsset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PLStoryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        PXAudioAssetDescription(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_INFO, "current song %@", buf, 0xCu);

      }
      -[PXStorySongController model](self, "model");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __48__PXStorySongController_setCurrentSongResource___block_invoke;
      v13[3] = &unk_1E5142E50;
      v14 = v5;
      objc_msgSend(v12, "performChanges:", v13);

    }
  }

}

- (void)setFailedAudioAssets:(id)a3
{
  NSSet *v4;
  char v5;
  NSSet *v6;
  NSSet *failedAudioAssets;
  NSSet *v8;

  v8 = (NSSet *)a3;
  v4 = self->_failedAudioAssets;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSSet isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSSet *)-[NSSet copy](v8, "copy");
      failedAudioAssets = self->_failedAudioAssets;
      self->_failedAudioAssets = v6;

      -[PXStorySongController _invalidateCurrentSongResource](self, "_invalidateCurrentSongResource");
    }
  }

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStorySongController;
  -[PXStoryController performChanges:](&v3, sel_performChanges_, a3);
}

- (void)_invalidateCurrentSongResource
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentSongResource);

}

- (void)_updateCurrentSongResource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint8_t v21[16];

  -[PXStorySongController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "songResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v3, "recipeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "initialSongResource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXStorySongController failedAudioAssets](self, "failedAudioAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_storyResourceSongAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    PLStoryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Current song resource has failed. Falling back to fallback song resource.", v21, 2u);
    }

    -[PXStorySongController failedSongDelayBeforeSwitchingToFallback](self, "failedSongDelayBeforeSwitchingToFallback");
    if (v12 > 0.0)
    {
      v13 = v12;
      -[PXStorySongController setFailedSongDelayBeforeSwitchingToFallback:](self, "setFailedSongDelayBeforeSwitchingToFallback:", 0.0);
      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v13);
    }
    objc_msgSend(v3, "recipeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recipe");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fallbackSongResource");
    v16 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v16;
  }
  if (objc_msgSend(v3, "isPresentingMusicEditor"))
  {
    objc_msgSend(v3, "editorPreviewSong");
    v17 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  if (objc_msgSend(v3, "viewMode") == 4)
  {
    objc_msgSend(v3, "styleManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectionDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "numberOfStyles") >= 1)
    {
      objc_msgSend(v18, "styleInfoAtIndex:", objc_msgSend(v17, "focusedStyleIndex"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "songResource");
      v20 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v20;
    }

    goto LABEL_15;
  }
LABEL_16:
  -[PXStorySongController setCurrentSongResource:](self, "setCurrentSongResource:", v5);

}

- (void)handleModelChange:(unint64_t)a3
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStorySongController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  if ((a3 & 0x808000010200) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__PXStorySongController_handleModelChange___block_invoke;
    v5[3] = &unk_1E5146DD8;
    v5[4] = self;
    -[PXStorySongController performChanges:](self, "performChanges:", v5);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  _QWORD *v9;
  objc_super v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v8 = a3;
  if ((void *)StyleManagerContext == a5)
  {
    if ((a4 & 0x120) == 0)
      goto LABEL_9;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PXStorySongController_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5146DD8;
    v12[4] = self;
    v9 = v12;
LABEL_8:
    -[PXStorySongController performChanges:](self, "performChanges:", v9);
    goto LABEL_9;
  }
  if ((void *)RecipeManagerContext == a5)
  {
    if ((a4 & 1) == 0)
      goto LABEL_9;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__PXStorySongController_observable_didChange_context___block_invoke_2;
    v11[3] = &unk_1E5146DD8;
    v11[4] = self;
    v9 = v11;
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXStorySongController;
  -[PXStoryController observable:didChange:context:](&v10, sel_observable_didChange_context_, v8, a4, a5);
LABEL_9:

}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (NSSet)failedAudioAssets
{
  return self->_failedAudioAssets;
}

- (PXStorySongResource)currentSongResource
{
  return self->_currentSongResource;
}

- (double)failedSongDelayBeforeSwitchingToFallback
{
  return self->_failedSongDelayBeforeSwitchingToFallback;
}

- (void)setFailedSongDelayBeforeSwitchingToFallback:(double)a3
{
  self->_failedSongDelayBeforeSwitchingToFallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSongResource, 0);
  objc_storeStrong((id *)&self->_failedAudioAssets, 0);
  objc_destroyWeak((id *)&self->_model);
}

uint64_t __54__PXStorySongController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSongResource");
}

uint64_t __54__PXStorySongController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSongResource");
}

uint64_t __43__PXStorySongController_handleModelChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSongResource");
}

uint64_t __48__PXStorySongController_setCurrentSongResource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActiveSongResource:", *(_QWORD *)(a1 + 32));
}

uint64_t __39__PXStorySongController_initWithModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSongResource");
}

@end

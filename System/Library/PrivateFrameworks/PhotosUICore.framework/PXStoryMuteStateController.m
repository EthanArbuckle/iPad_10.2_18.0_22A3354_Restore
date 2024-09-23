@implementation PXStoryMuteStateController

- (PXStoryMuteStateController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMuteStateController.m"), 32, CFSTR("%s is not available as initializer"), "-[PXStoryMuteStateController initWithObservableModel:]");

  abort();
}

- (PXStoryMuteStateController)initWithViewModel:(id)a3 volumeController:(id)a4 userDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXStoryMuteStateController *v11;
  PXStoryMuteStateController *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id WeakRetained;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryMuteStateController;
  v11 = -[PXStoryController initWithObservableModel:](&v19, sel_initWithObservableModel_, v8);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_viewModel, v8);
    objc_storeStrong((id *)&v12->_volumeController, a4);
    -[PXVolumeController registerChangeObserver:context:](v12->_volumeController, "registerChangeObserver:context:", v12, VolumeControllerObservationContext);
    objc_storeStrong((id *)&v12->_userDefaults, a5);
    -[PXStoryMuteStateController userDefaults](v12, "userDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistedValueForKey:", CFSTR("PXStoryPlaybackMutedStatePreference"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;

      if (v15)
      {
        v16 = v15;
        if (!objc_msgSend(v15, "BOOLValue"))
          goto LABEL_10;
        goto LABEL_9;
      }
    }
    else
    {

    }
    v15 = 0;
    v16 = 0;
    if (!-[PXVolumeController isInSilentMode](v12->_volumeController, "isInSilentMode"))
    {
LABEL_10:
      -[PXStoryMuteStateController _updateMainModel](v12, "_updateMainModel");

      goto LABEL_11;
    }
LABEL_9:
    WeakRetained = objc_loadWeakRetained((id *)&v12->_viewModel);
    objc_msgSend(WeakRetained, "performChanges:", &__block_literal_global_42689);

    v16 = v15;
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryMuteStateController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainModel, v4.receiver, v4.super_class);

}

- (void)setMainModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *mainModel;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](mainModel, "unregisterChangeObserver:context:", self, MainModelObservationContext);
    objc_storeStrong((id *)&self->_mainModel, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_mainModel, "registerChangeObserver:context:", self, MainModelObservationContext);
    v5 = v7;
  }

}

- (void)_saveMutedStatePreference
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[PXStoryMuteStateController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMuted");

  -[PXStoryMuteStateController volumeController](self, "volumeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInSilentMode");

  if ((_DWORD)v4 == v6)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PXStoryMuteStateController userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersistedValue:forKey:", v8, CFSTR("PXStoryPlaybackMutedStatePreference"));

}

- (void)_invalidateMainModel
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainModel);

}

- (void)_updateMainModel
{
  void *v3;
  id v4;

  -[PXStoryMuteStateController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMuteStateController setMainModel:](self, "setMainModel:", v3);

}

- (void)handleModelChange:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryMuteStateController;
  -[PXStoryController handleModelChange:](&v8, sel_handleModelChange_);
  if ((a3 & 0x400000000000000) != 0)
  {
    -[PXStoryMuteStateController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "lastMutedChangeReason");

    if (v6 <= 4 && ((1 << v6) & 0x16) != 0)
      -[PXStoryMuteStateController _saveMutedStatePreference](self, "_saveMutedStatePreference");
  }
  if ((a3 & 0x40) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__PXStoryMuteStateController_handleModelChange___block_invoke;
    v7[3] = &unk_1E5146DD8;
    v7[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v7);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v8 = a3;
  if ((void *)VolumeControllerObservationContext == a5)
  {
    if ((a4 & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[PXStoryMuteStateController volumeController](self, "volumeController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isInSilentMode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((a4 & 2) == 0)
      {
        if (!v9)
          goto LABEL_15;
        v15 = 3;
LABEL_14:
        -[PXStoryMuteStateController viewModel](self, "viewModel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __59__PXStoryMuteStateController_observable_didChange_context___block_invoke;
        v19[3] = &unk_1E511C900;
        v20 = v9;
        v21 = v15;
        v17 = v9;
        objc_msgSend(v16, "performChanges:", v19);

        goto LABEL_15;
      }
    }
    else
    {
      if ((a4 & 2) == 0)
        goto LABEL_15;
      v9 = 0;
    }

    v9 = (void *)MEMORY[0x1E0C9AAA0];
    v15 = 2;
    goto LABEL_14;
  }
  if ((void *)MainModelObservationContext == a5)
  {
    if ((a4 & 0x800000000000) != 0)
    {
      -[PXStoryMuteStateController mainModel](self, "mainModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "editorPreviewSong");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[PXStoryMuteStateController viewModel](self, "viewModel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "performChanges:", &__block_literal_global_14);

      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PXStoryMuteStateController;
    -[PXStoryController observable:didChange:context:](&v18, sel_observable_didChange_context_, v8, a4, a5);
  }
LABEL_15:

}

- (PXStoryViewModel)viewModel
{
  return (PXStoryViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (PXVolumeController)volumeController
{
  return self->_volumeController;
}

- (PXUserDefaultsDataSource)userDefaults
{
  return self->_userDefaults;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

void __59__PXStoryMuteStateController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setMuted:reason:", objc_msgSend(v3, "BOOLValue"), *(_QWORD *)(a1 + 40));

}

uint64_t __59__PXStoryMuteStateController_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMuted:reason:", 0, 4);
}

uint64_t __48__PXStoryMuteStateController_handleModelChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateMainModel");
}

void __78__PXStoryMuteStateController_initWithViewModel_volumeController_userDefaults___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setMuted:reason:", 1, 5);
  objc_msgSend(v2, "temporarilyShowMuteToggleButtonWhenChromeIsHidden");

}

@end

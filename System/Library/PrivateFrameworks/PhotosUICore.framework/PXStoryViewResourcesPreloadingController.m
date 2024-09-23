@implementation PXStoryViewResourcesPreloadingController

- (PXStoryViewResourcesPreloadingController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewResourcesPreloadingController.m"), 28, CFSTR("%s is not available as initializer"), "-[PXStoryViewResourcesPreloadingController initWithObservableModel:]");

  abort();
}

- (PXStoryViewResourcesPreloadingController)initWithViewModel:(id)a3
{
  id v5;
  PXStoryViewResourcesPreloadingController *v6;
  PXStoryViewResourcesPreloadingController *v7;
  id v8;
  PXStoryViewResourcesPreloadingController *v9;
  id WeakRetained;
  uint64_t v11;
  PXStoryResourcesPreloadingCoordinator *resourcesPreloadingCoordinator;
  uint64_t v13;
  NSMapTable *resourcesPreloadingControllers;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  PXStoryViewResourcesPreloadingController *v21;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryViewResourcesPreloadingController;
  v6 = -[PXStoryController initWithObservableModel:](&v22, sel_initWithObservableModel_, v5);
  v7 = v6;
  if (v6)
  {
    v8 = objc_storeWeak((id *)&v6->_viewModel, v5);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __62__PXStoryViewResourcesPreloadingController_initWithViewModel___block_invoke;
    v20 = &unk_1E5146E78;
    v9 = v7;
    v21 = v9;
    objc_msgSend(v5, "performChanges:", &v17);

    WeakRetained = objc_loadWeakRetained((id *)&v7->_viewModel);
    objc_msgSend(WeakRetained, "resourcesPreloadingCoordinator");
    v11 = objc_claimAutoreleasedReturnValue();
    resourcesPreloadingCoordinator = v9->_resourcesPreloadingCoordinator;
    v9->_resourcesPreloadingCoordinator = (PXStoryResourcesPreloadingCoordinator *)v11;

    if (!v9->_resourcesPreloadingCoordinator)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXStoryViewResourcesPreloadingController.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_resourcesPreloadingCoordinator != nil"), v17, v18, v19, v20);

    }
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    resourcesPreloadingControllers = v9->_resourcesPreloadingControllers;
    v9->_resourcesPreloadingControllers = (NSMapTable *)v13;

  }
  return v7;
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewResourcesPreloadingController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateResourcesPreloadingControllers, v4.receiver, v4.super_class);

}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryViewResourcesPreloadingController _invalidateResourcesPreloadingControllers](self, "_invalidateResourcesPreloadingControllers");
  }
}

- (id)resourcesPreloadingControllerForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXStoryViewResourcesPreloadingController resourcesPreloadingControllers](self, "resourcesPreloadingControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_invalidateResourcesPreloadingControllers
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateResourcesPreloadingControllers);

}

- (void)_updateResourcesPreloadingControllers
{
  void *v4;
  _BOOL4 v5;
  BOOL v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  SEL v28;
  _QWORD v29[4];
  BOOL v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  PXStoryViewResourcesPreloadingController *v39;
  SEL v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[PXStoryViewResourcesPreloadingController resourcesPreloadingControllers](self, "resourcesPreloadingControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXStoryViewResourcesPreloadingController isActive](self, "isActive");
  v6 = v5;
  v7 = MEMORY[0x1E0C809B0];
  v8 = "LemonadeProfileButtonFactory" + 16;
  if (v5)
  {
    v28 = a2;
    -[PXStoryViewResourcesPreloadingController viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v4, "keyEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v43;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v13);
    }

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "preloadNonKeyRelated");

    -[PXStoryViewResourcesPreloadingController resourcesPreloadingCoordinator](self, "resourcesPreloadingCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v7;
    v8 = "uttonFactory";
    v35[1] = 3221225472;
    v35[2] = __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke;
    v35[3] = &unk_1E512F0E8;
    v36 = v10;
    v37 = v4;
    v38 = v9;
    v39 = self;
    v40 = v28;
    v41 = v17;
    v19 = v9;
    v20 = v10;
    objc_msgSend(v18, "performChanges:", v35);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "objectEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    v25 = *((_QWORD *)v8 + 7);
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v26);
        v29[0] = v7;
        v29[1] = v25;
        v29[2] = __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_5;
        v29[3] = &__block_descriptor_33_e55_v16__0___PXStoryMutableResourcesPreloadingController__8l;
        v30 = v6;
        objc_msgSend(v27, "performChanges:", v29);
        ++v26;
      }
      while (v23 != v26);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
    }
    while (v23);
  }

}

- (void)handleModelChange:(unint64_t)a3
{
  __int16 v3;
  _QWORD v5[5];
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewResourcesPreloadingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  if ((v3 & 0x140) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__PXStoryViewResourcesPreloadingController_handleModelChange___block_invoke;
    v5[3] = &unk_1E512F130;
    v5[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v5);
  }
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v5;
  id v6;
  void (**v7)(void *, const __CFString *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  PXStoryViewResourcesPreloadingController *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __81__PXStoryViewResourcesPreloadingController_diagnosticTextForHUDType_displaySize___block_invoke;
  v17 = &unk_1E512F158;
  v18 = v5;
  v19 = self;
  v6 = v5;
  v7 = (void (**)(void *, const __CFString *, void *))_Block_copy(&v14);
  -[PXStoryViewResourcesPreloadingController viewModel](self, "viewModel", v14, v15, v16, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("Main"), v10);

  objc_msgSend(v8, "relatedModels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("Related"), v11);

  v12 = (void *)objc_msgSend(v6, "copy");
  return v12;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (PXStoryViewModel)viewModel
{
  return (PXStoryViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXStoryResourcesPreloadingCoordinator)resourcesPreloadingCoordinator
{
  return self->_resourcesPreloadingCoordinator;
}

- (NSMapTable)resourcesPreloadingControllers
{
  return self->_resourcesPreloadingControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesPreloadingControllers, 0);
  objc_storeStrong((id *)&self->_resourcesPreloadingCoordinator, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

void __81__PXStoryViewResourcesPreloadingController_diagnosticTextForHUDType_displaySize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:\n"), a2);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "resourcesPreloadingControllerForModel:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v11, "diagnosticDescription");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = (const __CFString *)v13;
        else
          v15 = CFSTR("??");
        objc_msgSend(v12, "appendString:", v15);

        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

uint64_t __62__PXStoryViewResourcesPreloadingController_handleModelChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateResourcesPreloadingControllers");
}

void __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, void *, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_2;
  aBlock[3] = &unk_1E512F0A0;
  v33 = *(id *)(a1 + 32);
  v34 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v38 = *(_QWORD *)(a1 + 64);
  v35 = v4;
  v36 = v5;
  v6 = v3;
  v37 = v6;
  v7 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 48), "mainModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8, 0);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "relatedModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v14, "viewMode") == 3 && objc_msgSend(v14, "thumbnailStyle") == 2)
        {
          v15 = 1;
        }
        else
        {
          if (!*(_BYTE *)(a1 + 72))
            continue;
          v15 = 2;
        }
        v7[2](v7, v14, v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v11);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = *(id *)(a1 + 32);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), CFSTR("PXStoryViewResourcesPreloadingController.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unusedResourcesPreloadingController != nil"));

        }
        objc_msgSend(v22, "performChanges:", &__block_literal_global_158047);
        objc_msgSend(v6, "removePreloadingController:", v22);
        objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
    }
    while (v18);
  }

}

uint64_t __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", *(unsigned __int8 *)(a1 + 32));
}

void __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  PXStoryResourcesPreloadingController *v6;
  PXStoryResourcesPreloadingController *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  _QWORD v15[4];
  char v16;
  BOOL v17;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v5);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v6 = (PXStoryResourcesPreloadingController *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (!*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), CFSTR("PXStoryViewResourcesPreloadingController.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel != nil"));

      }
      v7 = [PXStoryResourcesPreloadingController alloc];
      objc_msgSend(*(id *)(a1 + 48), "mediaProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PXStoryResourcesPreloadingController initWithModel:mediaProvider:](v7, "initWithModel:mediaProvider:", v5, v8);

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
    }
    v9 = 2;
    v10 = a3 == 0;
    if (a3 == 1)
      v10 = 0;
    else
      v9 = a3 == 0;
    v11 = a3 == 2;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    if (a3 == 2)
      v12 = 3;
    else
      v12 = v9;
    v15[2] = __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_3;
    v15[3] = &__block_descriptor_34_e55_v16__0___PXStoryMutableResourcesPreloadingController__8l;
    v13 = !v11 && v10;
    v16 = 0;
    v17 = v13;
    -[PXStoryController performChanges:](v6, "performChanges:", v15);
    objc_msgSend(*(id *)(a1 + 64), "addPreloadingController:withPriority:", v6, v12);

  }
}

uint64_t __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

void __81__PXStoryViewResourcesPreloadingController__updateResourcesPreloadingControllers__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIsSongResourcesPreloadingEnabled:", v3);
  objc_msgSend(v4, "setShouldSkipInitialSegment:", *(unsigned __int8 *)(a1 + 33));

}

uint64_t __62__PXStoryViewResourcesPreloadingController_initWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDiagnosticHUDContentProvider:forType:", *(_QWORD *)(a1 + 32), 5);
}

@end

@implementation PXImportSourcesManager

- (PXImportSourcesManager)init
{
  PXImportSourcesManager *v2;
  uint64_t v3;
  PHImportController *importController;
  uint64_t v5;
  NSMutableArray *importSources;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXImportSourcesManager;
  v2 = -[PXImportSourcesManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD15B8], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    importController = v2->_importController;
    v2->_importController = (PHImportController *)v3;

    -[PHImportController enableDeviceImport](v2->_importController, "enableDeviceImport");
    v5 = objc_opt_new();
    importSources = v2->_importSources;
    v2->_importSources = (NSMutableArray *)v5;

    -[PHImportController addImportControllerObserver:](v2->_importController, "addImportControllerObserver:", v2);
  }
  return v2;
}

- (void)_notifyObserversDidAddImportSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PXImportSourcesManager__notifyObserversDidAddImportSource___block_invoke;
  v6[3] = &unk_1E511E8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXImportSourcesManager enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);

}

- (void)_notifyObserversDidUpdateImportSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PXImportSourcesManager__notifyObserversDidUpdateImportSource___block_invoke;
  v6[3] = &unk_1E511E8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXImportSourcesManager enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);

}

- (void)_notifyObserversDidRemoveImportSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PXImportSourcesManager__notifyObserversDidRemoveImportSource___block_invoke;
  v6[3] = &unk_1E511E8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXImportSourcesManager enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);

}

- (NSArray)importSources
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_importSources, "copy");
}

- (void)_updateImportURLSource:(id)a3
{
  PHImportSource *v4;
  PHImportSource *v5;
  PHImportSource *v6;
  char v7;
  _QWORD v8[5];
  PHImportSource *v9;

  v4 = (PHImportSource *)a3;
  v5 = self->_URLImportSource;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PHImportSource isEqual:](v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__PXImportSourcesManager__updateImportURLSource___block_invoke;
      v8[3] = &unk_1E5144868;
      v8[4] = self;
      v9 = v4;
      -[PXImportSourcesManager performChanges:](self, "performChanges:", v8);

    }
  }

}

- (void)importController:(id)a3 addedImportSource:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXImportSourcesManager *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PXImportSourcesManager_importController_addedImportSource___block_invoke;
  v7[3] = &unk_1E5144868;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PXImportSourcesManager performChanges:](self, "performChanges:", v7);

}

- (void)importController:(id)a3 removedImportSource:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXImportSourcesManager *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PXImportSourcesManager_importController_removedImportSource___block_invoke;
  v7[3] = &unk_1E5144868;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PXImportSourcesManager performChanges:](self, "performChanges:", v7);

}

- (void)importController:(id)a3 failedToAddImportSource:(id)a4 exceptions:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__PXImportSourcesManager_importController_failedToAddImportSource_exceptions___block_invoke;
  v11[3] = &unk_1E511E8F0;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[PXImportSourcesManager enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v11);

}

- (PHImportController)importController
{
  return self->_importController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importController, 0);
  objc_storeStrong((id *)&self->_URLImportSource, 0);
  objc_storeStrong((id *)&self->_importSources, 0);
}

void __78__PXImportSourcesManager_importController_failedToAddImportSource_exceptions___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "importSourcesManager:didFailToAddImportSource:exceptions:", a1[4], a1[5], a1[6]);

}

uint64_t __63__PXImportSourcesManager_importController_removedImportSource___block_invoke(uint64_t a1)
{
  char v2;
  id *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCamera");
  v3 = *(id **)(a1 + 40);
  if ((v2 & 1) == 0)
    return objc_msgSend(v3, "_updateImportURLSource:", 0);
  objc_msgSend(v3[12], "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "removeImportSourceObserver:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversDidRemoveImportSource:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "signalChange:", 1);
}

uint64_t __61__PXImportSourcesManager_importController_addedImportSource___block_invoke(uint64_t a1)
{
  char v2;
  id *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCamera");
  v3 = *(id **)(a1 + 40);
  if ((v2 & 1) == 0)
    return objc_msgSend(v3, "_updateImportURLSource:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3[12], "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "addImportSourceObserver:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "_notifyObserversDidAddImportSource:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "signalChange:", 1);
}

void __49__PXImportSourcesManager__updateImportURLSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD *v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 104);
  v9 = v3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v4 + 104), *(id *)(a1 + 40));
  v7 = *(_QWORD **)(a1 + 32);
  if (!v7[13])
  {
    v8 = 0;
    if (!v5)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v7 = *(_QWORD **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v7, "_notifyObserversDidAddImportSource:", v8);
    v7 = *(_QWORD **)(a1 + 32);
  }
  if (v5)
  {
LABEL_7:
    objc_msgSend(v7, "_notifyObserversDidRemoveImportSource:", v5);
    v7 = *(_QWORD **)(a1 + 32);
  }
LABEL_8:
  objc_msgSend(v7, "signalChange:", 1);

}

void __64__PXImportSourcesManager__notifyObserversDidRemoveImportSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "importSourcesManager:didRemoveImportSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __64__PXImportSourcesManager__notifyObserversDidUpdateImportSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "importSourcesManager:didUpdateImportSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __61__PXImportSourcesManager__notifyObserversDidAddImportSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "importSourcesManager:didAddImportSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (PXImportSourcesManager)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXImportSourcesManager_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken_59230 != -1)
    dispatch_once(&sharedController_onceToken_59230, block);
  return (PXImportSourcesManager *)(id)sharedController_sharedController;
}

void __42__PXImportSourcesManager_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v1;

}

@end

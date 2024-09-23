@implementation PXStoryMemoryFeedChromeController

- (PXStoryMemoryFeedChromeController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedChromeController.m"), 35, CFSTR("%s is not available as initializer"), "-[PXStoryMemoryFeedChromeController init]");

  abort();
}

- (PXStoryMemoryFeedChromeController)initWithViewController:(id)a3 dataSourceManager:(id)a4
{
  id v6;
  id v7;
  PXStoryMemoryFeedChromeController *v8;
  uint64_t v9;
  UINavigationItem *navigationItem;
  void *v11;
  uint64_t v12;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  PXLibraryFilterState *v14;
  PXLibraryFilterState *libraryFilterState;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryMemoryFeedChromeController;
  v8 = -[PXStoryMemoryFeedChromeController init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "navigationItem");
    v9 = objc_claimAutoreleasedReturnValue();
    navigationItem = v8->_navigationItem;
    v8->_navigationItem = (UINavigationItem *)v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v8->_dataSourceManager, a4);
      -[PXSectionedDataSourceManager registerChangeObserver:context:](v8->_dataSourceManager, "registerChangeObserver:context:", v8, DataSourceManagerObservationContext_158353);
    }
    -[PXStoryMemoryFeedDataSourceManager photoLibrary](v8->_dataSourceManager, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v8->_sharedLibraryStatusProvider;
    v8->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v12;

    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v8->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v8, PXSharedLibraryStatusProviderObservationContext_158355);
    v14 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v8->_sharedLibraryStatusProvider);
    libraryFilterState = v8->_libraryFilterState;
    v8->_libraryFilterState = v14;

    -[PXLibraryFilterState registerChangeObserver:context:](v8->_libraryFilterState, "registerChangeObserver:context:", v8, PXLibraryFilterStateObservationContext_158354);
    -[PXStoryMemoryFeedChromeController _invalidateChrome](v8, "_invalidateChrome");
  }

  return v8;
}

- (void)_handleFavoritesToggleButton:(id)a3
{
  id v3;

  -[PXStoryMemoryFeedChromeController dataSourceManager](self, "dataSourceManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_158384);

}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryMemoryFeedChromeController _invalidateChrome](self, "_invalidateChrome");
  }
}

- (void)_updateChrome
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  char v28;
  _QWORD aBlock[4];
  id v30;

  if (-[PXStoryMemoryFeedChromeController isActive](self, "isActive"))
  {
    -[PXStoryMemoryFeedChromeController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMemoryFeedChromeController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasSharedLibraryOrPreview"))
    {
      -[PXStoryMemoryFeedChromeController dataSourceManager](self, "dataSourceManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "wantsFavoritesOnly");
      v7 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke;
      aBlock[3] = &unk_1E5147360;
      v8 = v5;
      v30 = v8;
      v9 = _Block_copy(aBlock);
      if (v6)
        v10 = CFSTR("PXMemoriesFeedFavoritesTitle");
      else
        v10 = CFSTR("PXMemoriesFeedTitle");
      PXLocalizedStringFromTable(v10, CFSTR("PhotosUICore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitle:", v11);

      -[PXStoryMemoryFeedChromeController libraryFilterState](self, "libraryFilterState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend(v4, "hasPreview");
      v22 = v7;
      v23 = 3221225472;
      v24 = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_3;
      v25 = &unk_1E512F348;
      v28 = v6;
      v26 = v8;
      v27 = v9;
      v13 = v9;
      v14 = v8;
      PXSharedLibraryCreateSwitchLibraryButtonItem(v12, (char)v11, &v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setRightBarButtonItem:", v15, v22, v23, v24, v25);

    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXMemoriesFeedTitle"), CFSTR("PhotosUICore"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitle:", v16);

      -[PXStoryMemoryFeedChromeController dataSourceManager](self, "dataSourceManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "hasAnyFavorites")
        && (!objc_msgSend(v17, "wantsFavoritesOnly")
          ? (v18 = CFSTR("PXMemoriesFeedButtonFavoritesTitle"))
          : (v18 = CFSTR("PXMemoriesFeedSeeAllButtonTitle")),
            PXLocalizedStringFromTable(v18, CFSTR("PhotosUICore")),
            (v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v20 = (void *)v19;
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v19, 0, self, sel__handleFavoritesToggleButton_);
        objc_msgSend(v3, "setRightBarButtonItem:", v21);

      }
      else
      {
        objc_msgSend(v3, "setRightBarButtonItem:", 0);
      }

    }
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)DataSourceManagerObservationContext_158353 == a5)
  {
    if ((v6 & 0xC) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((void *)PXLibraryFilterStateObservationContext_158354 == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((void *)PXSharedLibraryStatusProviderObservationContext_158355 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedChromeController.m"), 149, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 3) != 0)
  {
LABEL_5:
    v11 = v9;
    -[PXStoryMemoryFeedChromeController _invalidateChrome](self, "_invalidateChrome");
    v9 = v11;
  }
LABEL_6:

}

- (BOOL)isActive
{
  return self->_isActive;
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (PXStoryMemoryFeedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
}

uint64_t __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_2;
  v4[3] = &__block_descriptor_33_e53_v16__0___PXStoryMutableMemoryFeedDataSourceManager__8l;
  v5 = a2;
  return objc_msgSend(v2, "performChanges:", v4);
}

void __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasAnyFavorites"))
  {
    objc_msgSend(v4, "extraItemsMenuBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_4;
    v5[3] = &unk_1E512F320;
    v7 = *(_BYTE *)(a1 + 48);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "addSectionWithConfiguration:", v5);

  }
}

void __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  PXLocalizedStringFromTable(CFSTR("PXMemoriesFeedAllMemoriesMenuItemTitle"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(_BYTE *)(a1 + 40) == 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_5;
  v11[3] = &unk_1E512F2F8;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addItemWithTitle:systemImageName:state:options:handler:", v4, CFSTR("memories"), v6, 0, v11);

  PXLocalizedStringFromTable(CFSTR("PXMemoriesFeedFavoriteMemoriesMenuItemTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 40);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_6;
  v9[3] = &unk_1E512F2F8;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addItemWithTitle:systemImageName:state:options:handler:", v7, CFSTR("heart"), v8, 0, v9);

}

uint64_t __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__PXStoryMemoryFeedChromeController__updateChrome__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsFavoritesOnly:", *(unsigned __int8 *)(a1 + 32));
}

void __66__PXStoryMemoryFeedChromeController__handleFavoritesToggleButton___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setWantsFavoritesOnly:", objc_msgSend(v2, "wantsFavoritesOnly") ^ 1);

}

@end

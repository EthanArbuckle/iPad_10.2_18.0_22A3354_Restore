@implementation PXPhotosDetailsBarsController

- (PXPhotosDetailsBarsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsBarsController.m"), 109, CFSTR("%s is not available as initializer"), "-[PXPhotosDetailsBarsController init]");

  abort();
}

- (PXPhotosDetailsBarsController)initWithContext:(id)a3 viewModel:(id)a4 extendedTraitCollection:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXPhotosDetailsBarsController *v13;
  PXPhotosDetailsBarsController *v14;
  uint64_t v15;
  PXPhotosDataSource *dataSource;
  PXPhotosBarButtonItemsController *v17;
  PXPhotosBarButtonItemsController *barButtonItemsController;
  uint64_t v19;
  NSMutableDictionary *barButtonItemByActionType;
  uint64_t v21;
  NSMutableDictionary *barButtonItemCacheByBarItemIdentifier;
  PXBlockActionManager *v23;
  PXBlockActionManager *blockActionManager;
  void *v26;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsBarsController.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photosDetailsContext"));

  }
  v27.receiver = self;
  v27.super_class = (Class)PXPhotosDetailsBarsController;
  v13 = -[PXBarsController init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_needsUpdateFlags = ($CAE9C588B8E9E3AD77CEC3411B0007B6)257;
    objc_storeStrong((id *)&v13->__context, a3);
    objc_msgSend(v10, "photosDataSource");
    v15 = objc_claimAutoreleasedReturnValue();
    dataSource = v14->__dataSource;
    v14->__dataSource = (PXPhotosDataSource *)v15;

    -[PXPhotosDataSource registerChangeObserver:](v14->__dataSource, "registerChangeObserver:", v14);
    objc_storeStrong((id *)&v14->__extendedTraitCollection, a5);
    -[PXExtendedTraitCollection registerChangeObserver:context:](v14->__extendedTraitCollection, "registerChangeObserver:context:", v14, PXExtendedTraitCollectionObservationContext_125538);
    objc_storeStrong((id *)&v14->__viewModel, a4);
    -[PXPhotosDetailsViewModel registerChangeObserver:context:](v14->__viewModel, "registerChangeObserver:context:", v14, PXViewModelObservationContext_125537);
    v17 = -[PXPhotosBarButtonItemsController initWithExtendedTraitCollection:viewModel:]([PXPhotosBarButtonItemsController alloc], "initWithExtendedTraitCollection:viewModel:", v12, 0);
    barButtonItemsController = v14->_barButtonItemsController;
    v14->_barButtonItemsController = v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    barButtonItemByActionType = v14->__barButtonItemByActionType;
    v14->__barButtonItemByActionType = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    barButtonItemCacheByBarItemIdentifier = v14->__barButtonItemCacheByBarItemIdentifier;
    v14->__barButtonItemCacheByBarItemIdentifier = (NSMutableDictionary *)v21;

    v14->_shouldAddActionButton = 1;
    v23 = objc_alloc_init(PXBlockActionManager);
    blockActionManager = v14->_blockActionManager;
    v14->_blockActionManager = v23;

    -[PXPhotosDetailsBarsController _setupBlockActionManager](v14, "_setupBlockActionManager");
    -[PXPhotosDetailsBarsController _setShowTitleView:](v14, "_setShowTitleView:", 1);
  }

  return v14;
}

- (id)_assetCollection
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPhotosDetailsBarsController _dataSource](self, "_dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionListFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_invalidateAssetCollectionActionManager
{
  self->_needsUpdateFlags.assetCollectionActionManager = 1;
  -[PXBarsController invalidateBars](self, "invalidateBars");
}

- (PXAssetCollectionActionManager)_assetCollectionActionManager
{
  PXAssetCollectionActionManager *v3;
  PXAssetCollectionActionManager *assetCollectionActionManager;

  if (self->_needsUpdateFlags.assetCollectionActionManager)
  {
    self->_needsUpdateFlags.assetCollectionActionManager = 0;
    -[PXPhotosDetailsBarsController createAssetCollectionActionManager](self, "createAssetCollectionActionManager");
    v3 = (PXAssetCollectionActionManager *)objc_claimAutoreleasedReturnValue();
    assetCollectionActionManager = self->__assetCollectionActionManager;
    self->__assetCollectionActionManager = v3;

    -[PXActionManager setPerformerDelegate:](self->__assetCollectionActionManager, "setPerformerDelegate:", self);
  }
  return self->__assetCollectionActionManager;
}

- (void)_invalidateAssetActionManager
{
  void *v3;

  self->_needsUpdateFlags.assetActionManager = 1;
  -[PXPhotosDetailsBarsController _barButtonItemCacheByBarItemIdentifier](self, "_barButtonItemCacheByBarItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PXBarsController invalidateBars](self, "invalidateBars");
}

- (PXAssetActionManager)_assetActionManager
{
  PXAssetActionManager *v3;
  PXAssetActionManager *assetActionManager;

  if (self->_needsUpdateFlags.assetActionManager)
  {
    self->_needsUpdateFlags.assetActionManager = 0;
    -[PXPhotosDetailsBarsController createAssetActionManager](self, "createAssetActionManager");
    v3 = (PXAssetActionManager *)objc_claimAutoreleasedReturnValue();
    assetActionManager = self->__assetActionManager;
    self->__assetActionManager = v3;

    -[PXActionManager setPerformerDelegate:](self->__assetActionManager, "setPerformerDelegate:", self);
  }
  return self->__assetActionManager;
}

- (void)_setSelectionManager:(id)a3
{
  PXSectionedSelectionManager *v5;
  PXSectionedSelectionManager *selectionManager;
  PXSectionedSelectionManager *v7;

  v5 = (PXSectionedSelectionManager *)a3;
  selectionManager = self->__selectionManager;
  if (selectionManager != v5)
  {
    v7 = v5;
    if (selectionManager)
      -[PXSectionedSelectionManager unregisterChangeObserver:context:](selectionManager, "unregisterChangeObserver:context:", self, PXSelectionManagerObservationContext_125539);
    objc_storeStrong((id *)&self->__selectionManager, a3);
    -[PXSectionedSelectionManager registerChangeObserver:context:](v7, "registerChangeObserver:context:", self, PXSelectionManagerObservationContext_125539);
    v5 = v7;
  }

}

- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "layoutSizeClass") == 1 && objc_msgSend(v3, "layoutOrientation") == 2;

  return v4;
}

- (id)_localizedSelectionTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v4, "selectedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 && objc_msgSend(v8, "count") >= 1)
  {
    objc_msgSend(v7, "assetsAtIndexPaths:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSelectionMessageForAssets(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsBarSelectItemsTitle"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_centeredBarButtonItem
{
  void *v3;
  __CFString **v4;
  void *v5;

  -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsFaceMode") && !objc_msgSend(v3, "isFaceModeEnabled"))
  {
    v4 = PXBarItemIdentifierFaceMode;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "supportsFaceMode") && objc_msgSend(v3, "isFaceModeEnabled"))
  {
    v4 = PXBarItemIdentifierAssetMode;
LABEL_8:
    -[PXPhotosDetailsBarsController _barButtonItemForBarItemIdentifier:](self, "_barButtonItemForBarItemIdentifier:", *v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)_barButtonItemsForBarItems:(id)a3 placement:(unint64_t)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  SEL v22;
  uint8_t buf[4];
  PXPhotosDetailsBarsController *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDetailsBarsController _barButtonItemForBarItemIdentifier:](self, "_barButtonItemForBarItemIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v9, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PXPhotosDetailsBarsController _shouldEnableActionWithBarItemIdentifier:](self, "_shouldEnableActionWithBarItemIdentifier:", v12);

        objc_msgSend(v11, "setEnabled:", v13);
        objc_msgSend(v8, "addObject:", v11);
        if (a4 == 4)
        {
          -[PXPhotosDetailsBarsController _flexibleSpaceBarButtonItem](self, "_flexibleSpaceBarButtonItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "insertObject:atIndex:", v14, 0);

          -[PXPhotosDetailsBarsController _flexibleSpaceBarButtonItem](self, "_flexibleSpaceBarButtonItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
      }
      else
      {
        PXAssertGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v24 = self;
          v25 = 2112;
          v26 = v9;
          _os_log_error_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "%@ unable to create bar button for item: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__PXPhotosDetailsBarsController__barButtonItemsForBarItems_placement___block_invoke;
      v18[3] = &unk_1E512A118;
      v18[4] = self;
      v21 = a4;
      v8 = v8;
      v19 = v8;
      v20 = v7;
      v22 = a2;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v18);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_flexibleSpaceBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

- (id)_barButtonItemForBarItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString **v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  -[PXPhotosDetailsBarsController _barButtonItemCacheByBarItemIdentifier](self, "_barButtonItemCacheByBarItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierShare")) & 1) != 0)
  {
    v7 = PXAssetActionTypeShare;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierTrash")))
    {
      if (v6)
      {
        v9 = 0;
        v10 = (void *)v6;
        goto LABEL_25;
      }
      goto LABEL_14;
    }
    v7 = PXAssetActionTypeUnifiedDestructive;
  }
  v8 = *v7;
  v9 = v8;
  v10 = (void *)v6;
  if (!v6)
  {
    if (v8)
    {
      -[PXPhotosDetailsBarsController _assetActionManager](self, "_assetActionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "barButtonItemForActionType:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_10;
      goto LABEL_8;
    }
LABEL_14:
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierSelect")))
    {
      -[PXPhotosDetailsBarsController barButtonItemsController](self, "barButtonItemsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsBarSelectButton"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = sel_selectBarButtonItemTapped_;
LABEL_20:
      objc_msgSend(v13, "createBarButtonItemWithTitle:target:action:menuAction:", v14, self, v15, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:
LABEL_23:
      v9 = 0;
LABEL_24:
      -[PXPhotosDetailsBarsController _barButtonItemCacheByBarItemIdentifier](self, "_barButtonItemCacheByBarItemIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, v4);

      goto LABEL_25;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierDone")))
    {
      -[PXPhotosDetailsBarsController barButtonItemsController](self, "barButtonItemsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsBarDoneButton"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = sel_doneBarButtonItemTapped_;
      goto LABEL_20;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierCancel")))
    {
      -[PXPhotosDetailsBarsController barButtonItemsController](self, "barButtonItemsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsBarCancelButton"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = sel_cancelBarButtonItemTapped_;
      goto LABEL_20;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierFaceMode")))
    {
      v18 = objc_alloc(MEMORY[0x1E0DC34F0]);
      -[PXPhotosDetailsBarsController _context](self, "_context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "people");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringForPeople(v14, CFSTR("PXPhotosDetailsBarFaceModeButton"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithTitle:style:target:action:", v19, 0, self, sel__toggleFaceMode_);
LABEL_28:
      v10 = (void *)v20;

      goto LABEL_21;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierAssetMode")))
    {
      v21 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsBarAssetModeButton"), CFSTR("PhotosUICore"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v21, "initWithTitle:style:target:action:", v13, 0, self, sel__toggleFaceMode_);
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierActionMenu")))
    {
      -[PXPhotosDetailsBarsController _createActionMenuButton](self, "_createActionMenuButton");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectModeMenu")))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXBarsController delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "barsControllerActionsForSelectionContextMenu:", self);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5149688, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:menu:", v13, v19);
        goto LABEL_28;
      }
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierInterButtonSpacing")))
      {
        v9 = 0;
        v10 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 8.0);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v22;
    goto LABEL_23;
  }
LABEL_8:
  if (v9)
  {
    -[PXPhotosDetailsBarsController _barButtonItemByActionType](self, "_barButtonItemByActionType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v9);

  }
LABEL_10:
  if (!v6)
    goto LABEL_24;
LABEL_25:

  return v10;
}

- (id)_createActionMenuButton
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char *v6;
  char *v7;
  void *v8;

  v3 = -[PXPhotosDetailsBarsController wantsActionMenu](self, "wantsActionMenu");
  -[PXPhotosDetailsBarsController barButtonItemsController](self, "barButtonItemsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = sel_actionMenuButtonItemTapped_;
  if (v3)
  {
    v7 = 0;
  }
  else
  {
    v7 = sel_actionMenuButtonItemTapped_;
    v6 = 0;
  }
  objc_msgSend(v4, "createBarButtonItemWithSystemItem:target:action:menuAction:", 1, self, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_shouldAddBarItemForBarItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v8;

  v4 = a3;
  -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSelecting"))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierShare")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectModeMenu")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierTrash")) & 1) != 0)
    {
      goto LABEL_5;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierFaceMode")))
    {
      if (objc_msgSend(v5, "supportsFaceMode"))
      {
        v6 = objc_msgSend(v5, "isFaceModeEnabled") ^ 1;
        goto LABEL_11;
      }
      goto LABEL_22;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierAssetMode")))
    {
      if (!objc_msgSend(v5, "supportsFaceMode"))
        goto LABEL_22;
      v8 = objc_msgSend(v5, "isFaceModeEnabled");
    }
    else
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierCancel")) & 1) != 0)
      {
LABEL_5:
        LOBYTE(v6) = 1;
        goto LABEL_11;
      }
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierInterButtonSpacing")))
      {
LABEL_22:
        LOBYTE(v6) = 0;
        goto LABEL_11;
      }
      v8 = objc_msgSend(v5, "supportsFaceMode");
    }
    LOBYTE(v6) = v8;
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierDone")) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierSelect"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierActionMenu")))
    v6 |= -[PXPhotosDetailsBarsController shouldAddActionButton](self, "shouldAddActionButton");
LABEL_11:

  return v6;
}

- (BOOL)_shouldEnableActionWithBarItemIdentifier:(id)a3
{
  id v4;
  __CFString **v5;
  void *v6;
  char v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierShare")) & 1) != 0)
  {
    v5 = PXAssetActionTypeShare;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectModeMenu")) & 1) != 0)
  {
    v5 = &PXAssetActionTypeShowActionsMenu;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXBarItemIdentifierTrash")))
    {
      v7 = 1;
      goto LABEL_8;
    }
    v5 = PXAssetActionTypeUnifiedDestructive;
  }
  -[PXPhotosDetailsBarsController _assetActionManager](self, "_assetActionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canPerformActionType:", *v5);

LABEL_8:
  return v7;
}

- (id)createTitleView
{
  PXNavigationTitleView *v2;

  v2 = [PXNavigationTitleView alloc];
  return -[PXNavigationTitleView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)createAssetActionManager
{
  void *v2;
  PXPhotoKitAssetActionManager *v3;

  -[PXPhotosDetailsBarsController _selectionManager](self, "_selectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PXPhotoKitAssetActionManager initWithSelectionManager:]([PXPhotoKitAssetActionManager alloc], "initWithSelectionManager:", v2);

  return v3;
}

- (id)createAssetCollectionActionManager
{
  void *v3;
  PXPhotoKitAssetCollectionActionManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PXPhotosDetailsBarsController _assetCollection](self, "_assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v3, 0);
  }
  else
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PXPhotosDetailsBarsController _dataSource](self, "_dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "collectionListFetchResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected number of asset collections: %@", (uint8_t *)&v9, 0xCu);

    }
    v4 = 0;
  }

  return v4;
}

- (void)shouldShowTitleView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->__showTitleView != a3)
  {
    v4 = a4;
    -[PXPhotosDetailsBarsController _setShowTitleView:](self, "_setShowTitleView:");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __62__PXPhotosDetailsBarsController_shouldShowTitleView_animated___block_invoke;
      v6[3] = &unk_1E5149198;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.25);
    }
    else
    {
      -[PXPhotosDetailsBarsController _updateTitleViewAlpha](self, "_updateTitleViewAlpha");
    }
  }
}

- (void)_updateTitleViewAlpha
{
  double v3;
  id v4;

  if (-[PXPhotosDetailsBarsController _showTitleView](self, "_showTitleView"))
    v3 = 1.0;
  else
    v3 = 0.0;
  -[PXPhotosDetailsBarsController _titleView](self, "_titleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EEA43A50))
    objc_msgSend(v4, "setSubviewsAlpha:", v3);
  else
    objc_msgSend(v4, "setAlpha:", v3);

}

- (BOOL)wantsActionMenu
{
  return 0;
}

- (void)updateBars
{
  void *v3;
  UIView *v4;
  UIView *titleView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  _PXPhotosDetailsBarItem *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PXBarAnimationOptions *v40;
  id v41;
  void *v42;
  void *v43;
  int64_t v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  int64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _QWORD v59[12];

  v59[10] = *MEMORY[0x1E0C80C00];
  -[PXPhotosDetailsBarsController _titleView](self, "_titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXPhotosDetailsBarsController createTitleView](self, "createTitleView");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    titleView = self->__titleView;
    self->__titleView = v4;

  }
  -[PXPhotosDetailsBarsController _updateTitleViewAlpha](self, "_updateTitleViewAlpha");
  -[PXPhotosDetailsBarsController _barButtonItemByActionType](self, "_barButtonItemByActionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[PXBarsController viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_barAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController _setBarAppearance:](self, "_setBarAppearance:", v8);

  v59[0] = CFSTR("PXBarItemIdentifierActionMenu");
  v59[1] = CFSTR("PXBarItemIdentifierSelect");
  v59[2] = CFSTR("PXBarItemIdentifierShare");
  v59[3] = CFSTR("PXBarItemIdentifierSelectModeMenu");
  v59[4] = CFSTR("PXBarItemIdentifierTrash");
  v59[5] = CFSTR("PXBarItemIdentifierDone");
  v59[6] = CFSTR("PXBarItemIdentifierCancel");
  v59[7] = CFSTR("PXBarItemIdentifierFaceMode");
  v59[8] = CFSTR("PXBarItemIdentifierAssetMode");
  v59[9] = CFSTR("PXBarItemIdentifierInterButtonSpacing");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        if (-[PXPhotosDetailsBarsController _shouldAddBarItemForBarItemIdentifier:](self, "_shouldAddBarItemForBarItemIdentifier:", v16))
        {
          v17 = -[_PXPhotosDetailsBarItem initWithIdentifier:]([_PXPhotosDetailsBarItem alloc], "initWithIdentifier:", v16);
          objc_msgSend(v10, "addObject:", v17);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v13);
  }

  -[PXBarsController barSpec](self, "barSpec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedBarItemsByPlacement:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isSelecting");

  v23 = MEMORY[0x1E0C809B0];
  if (v22)
  {
    -[PXPhotosDetailsBarsController _localizedSelectionTitle](self, "_localizedSelectionTitle");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = 0;
  }
  else
  {
    -[PXPhotosDetailsBarsController _titleView](self, "_titleView");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_extendedTraitCollection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[PXPhotosDetailsBarsController _titleViewVerticalSizeClassForExtendedTraitCollection:](self, "_titleViewVerticalSizeClassForExtendedTraitCollection:", v46);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = (void *)v25;
    else
      v26 = 0;
    v50[0] = v23;
    v50[1] = 3221225472;
    v50[2] = __43__PXPhotosDetailsBarsController_updateBars__block_invoke;
    v50[3] = &unk_1E5145560;
    v51 = v26;
    v52 = v7;
    v53 = v44;
    v27 = v51;
    objc_msgSend(v27, "performChanges:", v50);

    v24 = 0;
  }
  objc_msgSend(v20, "setTitle:", v24, v24);
  v43 = (void *)v25;
  objc_msgSend(v20, "setTitleView:", v25);
  v28 = -[PXBarsController wantsAnimatedBarsUpdate](self, "wantsAnimatedBarsUpdate");
  objc_msgSend(v20, "px_setBackButtonDisplayMode:", 2);
  v47 = v7;
  objc_msgSend(v7, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackButtonTitle:", v29);

  objc_msgSend(v19, "objectForKeyedSubscript:", &unk_1E53ED770);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController _barButtonItemsForBarItems:placement:](self, "_barButtonItemsForBarItems:placement:", v30, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLeftBarButtonItems:animated:", v31, v28);

  objc_msgSend(v19, "objectForKeyedSubscript:", &unk_1E53ED788);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController _barButtonItemsForBarItems:placement:](self, "_barButtonItemsForBarItems:placement:", v32, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItems:animated:", v33, v28);

  -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isSelecting");

  objc_msgSend(v20, "setHidesBackButton:animated:", v35, 0);
  v45 = v19;
  objc_msgSend(v19, "objectForKeyedSubscript:", &unk_1E53ED7A0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController viewController](self, "viewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController _barButtonItemsForBarItems:placement:](self, "_barButtonItemsForBarItems:placement:", v36, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setToolbarItems:", v38);

  -[PXPhotosDetailsBarsController _barAppearance](self, "_barAppearance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    v40 = -[PXBarAnimationOptions initWithType:]([PXBarAnimationOptions alloc], "initWithType:", 1);
  else
    v40 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __43__PXPhotosDetailsBarsController_updateBars__block_invoke_228;
  v48[3] = &unk_1E512A140;
  v49 = v36;
  v41 = v36;
  objc_msgSend(v39, "performChangesWithAnimationOptions:changes:", v40, v48);

}

- (void)selectBarButtonItemTapped:(id)a3
{
  id v3;

  -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_125588);

}

- (void)cancelBarButtonItemTapped:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__PXPhotosDetailsBarsController_cancelBarButtonItemTapped___block_invoke;
  v11 = &unk_1E5148D30;
  objc_copyWeak(&v12, &location);
  v5 = (void (**)(_QWORD))_Block_copy(&v8);
  -[PXPhotosDetailsBarsController _activePerformer](self, "_activePerformer", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "isCancellable"))
      objc_msgSend(v7, "cancelActionWithCompletionHandler:", v5);
  }
  else
  {
    v5[2](v5);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)doneBarButtonItemTapped:(id)a3
{
  id v3;

  -[PXBarsController viewController](self, "viewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_toggleFaceMode:(id)a3
{
  id v3;

  -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFaceModeEnabled") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.detailView.showFaces"), MEMORY[0x1E0C9AA70]);
  objc_msgSend(v3, "performChanges:", &__block_literal_global_235_125585);

}

- (void)actionMenuButtonItemTapped:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  PXActivitySharingContext *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SEL v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  objc_class *v44;
  uint64_t v45;
  SEL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  uint64_t v53;
  SEL v54;
  void *v55;
  objc_class *v56;
  SEL v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  uint8_t buf[16];

  v5 = a3;
  -[PXPhotosDetailsBarsController _selectionManager](self, "_selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "numberOfSections"))
  {
    if (-[PXPhotosDetailsBarsController wantsActionMenu](self, "wantsActionMenu"))
    {
      v9 = v5;
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_5:
          -[PXPhotosDetailsBarsController _actionMenu](self, "_actionMenu");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setMenu:", v10);

          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "px_descriptionForAssertionMessage");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = a2;
        v47 = (void *)v45;
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v46, self, CFSTR("PXPhotosDetailsBarsController.m"), 600, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sender"), v43, v45);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsBarsController.m"), 600, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sender"), v43);
      }

      goto LABEL_5;
    }
    -[PXPhotosDetailsBarsController _createActionMenuController](self, "_createActionMenuController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsBarsController.m"), 608, CFSTR("Only support PXAssetsDataSource"));

    }
    if (objc_msgSend(v8, "numberOfSections") != 1)
    {
      PXAssertGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Only support datasources with one section", buf, 2u);
      }

    }
    v64 = objc_msgSend(v8, "identifier");
    v65 = xmmword_1A7C0C1F0;
    v66 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v8, "assetCollectionAtSectionIndexPath:", &v64);
    v14 = objc_claimAutoreleasedReturnValue();
    -[PXBarsController viewController](self, "viewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_sharePresentation");
    v16 = objc_claimAutoreleasedReturnValue();

    v63 = (void *)v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsBarsController.m"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharePresentation"));

    }
    v61 = (void *)v14;
    v17 = -[PXActivitySharingContext initWithAssetCollection:assetsDataSource:]([PXActivitySharingContext alloc], "initWithAssetCollection:assetsDataSource:", v14, v8);
    v62 = v12;
    objc_msgSend(v12, "activityActions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivitySharingContext setActivities:](v17, "setActivities:", v18);

    -[PXActivitySharingContext setWantsActionSheet:](v17, "setWantsActionSheet:", 1);
    -[PXPhotosDetailsBarsController _context](self, "_context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosDetailsBarsController _context](self, "_context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "people");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      v24 = objc_msgSend(v20, "length");

      if (!v24)
      {
        PXLocalizedStringFromTable(CFSTR("PXActionSheetMissingPeopleNameTitle"), CFSTR("PhotosUICore"));
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    else
    {

    }
    objc_msgSend(off_1E50B3470, "defaultHelper");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "displayableTextForTitle:intent:", v20, 1);
    v25 = objc_claimAutoreleasedReturnValue();

    v20 = v26;
LABEL_22:

    -[PXActivitySharingContext setTitle:](v17, "setTitle:", v25);
    -[PXPhotosDetailsBarsController _context](self, "_context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedSubtitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivitySharingContext setSubtitle:](v17, "setSubtitle:", v28);

    -[PXBarsController viewController](self, "viewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "presentedKeyAsset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      -[PXActivitySharingContext setKeyAsset:](v17, "setKeyAsset:", v30);
    }
    else
    {
      objc_msgSend(v8, "keyAsset");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActivitySharingContext setKeyAsset:](v17, "setKeyAsset:", v31);

    }
    -[PXPhotosDetailsBarsController _context](self, "_context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "people");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "count") == 1)
    {
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActivitySharingContext setPerson:](v17, "setPerson:", v34);

    }
    v60 = v5;
    -[PXPhotosDetailsBarsController _context](self, "_context");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivitySharingContext setSourceOrigin:](v17, "setSourceOrigin:", objc_msgSend(v35, "viewSourceOrigin"));

    objc_msgSend(v63, "createActivitySharingControllerWithContext:", v17);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsBarsController.m"), 634, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activitySharingController"));

    }
    v37 = (void *)v25;
    objc_msgSend(v36, "activityViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = a2;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_31:
        -[PXBarsController viewController](self, "viewController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "presentViewController:animated:completion:", v38, 1, 0);

        v5 = v60;
        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "px_descriptionForAssertionMessage");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v39;
      v51 = v59;
      objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", v57, self, CFSTR("PXPhotosDetailsBarsController.m"), 635, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController.activityViewController"), v55, v58);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = a2;
      v55 = (void *)v53;
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", v54, self, CFSTR("PXPhotosDetailsBarsController.m"), 635, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController.activityViewController"), v53);
    }

    goto LABEL_31;
  }
  PXAssertGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Action menu pressed in details view without a container. Aborting because the button should have been disabled", buf, 2u);
  }

LABEL_32:
}

- (id)_createActionMenuController
{
  PXPhotoDetailsActionMenuController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXPhotoDetailsActionMenuController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = [PXPhotoDetailsActionMenuController alloc];
  -[PXPhotosDetailsBarsController _selectionManager](self, "_selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTitleInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController blockActionManager](self, "blockActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPhotoDetailsActionMenuController initWithSelectionManager:displayTitleInfo:blockActionManager:](v3, "initWithSelectionManager:displayTitleInfo:blockActionManager:", v4, v6, v7);

  -[PXPhotosDetailsBarsController _context](self, "_context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "people");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoDetailsActionMenuController setPeople:](v8, "setPeople:", v10);

  -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "disabledActionTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionMenuController setDisabledActionTypes:](v8, "setDisabledActionTypes:", v12);

  -[PXPhotosDetailsBarsController _dataSource](self, "_dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PXPhotosDetailsHeaderTileWidget canShowMovieHeaderForDataSource:](PXPhotosDetailsHeaderTileWidget, "canShowMovieHeaderForDataSource:", v13))
  {
    -[PXActionMenuController setExcludedActionTypes:](v8, "setExcludedActionTypes:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PXAssetCollectionActionTypePlayMovie"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionMenuController setExcludedActionTypes:](v8, "setExcludedActionTypes:", v14);

  }
  -[PXPhotoDetailsActionMenuController setDelegate:](v8, "setDelegate:", self);
  -[PXPhotosDetailsBarsController set_activeMenuController:](self, "set_activeMenuController:", v8);
  return v8;
}

- (id)_actionMenu
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPhotosDetailsBarsController _createActionMenuController](self, "_createActionMenuController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5149688, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setupBlockActionManager
{
  void *v3;
  void *v4;
  PXBlockActionConfiguration *v5;
  uint64_t v6;
  PXBlockActionConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  PXBlockActionConfiguration *v11;
  PXBlockActionConfiguration *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location[2];

  objc_initWeak(location, self);
  -[PXPhotosDetailsBarsController _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "people");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [PXBlockActionConfiguration alloc];
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke;
  v22[3] = &unk_1E512A1C8;
  objc_copyWeak(&v23, location);
  v7 = -[PXBlockActionConfiguration initWithBlock:](v5, "initWithBlock:", v22);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_2;
  v20[3] = &unk_1E512A1F0;
  objc_copyWeak(&v21, location);
  -[PXBlockActionConfiguration setCanPerformBlock:](v7, "setCanPerformBlock:", v20);
  PXLocalizedStringForPeople(v4, CFSTR("PXPhotosDetailsMenuFaceModeAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBlockActionConfiguration setActionName:](v7, "setActionName:", v8);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("face.smiling"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBlockActionConfiguration setImage:](v7, "setImage:", v9);

  -[PXPhotosDetailsBarsController blockActionManager](self, "blockActionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerActionWithConfiguration:forType:", v7, CFSTR("PXPhotosDetailsShowFaceAction"));

  v11 = [PXBlockActionConfiguration alloc];
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_3;
  v18[3] = &unk_1E512A1C8;
  objc_copyWeak(&v19, location);
  v12 = -[PXBlockActionConfiguration initWithBlock:](v11, "initWithBlock:", v18);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_4;
  v16[3] = &unk_1E512A1F0;
  objc_copyWeak(&v17, location);
  -[PXBlockActionConfiguration setCanPerformBlock:](v12, "setCanPerformBlock:", v16);
  PXLocalizedStringForPeople(v4, CFSTR("PXPhotosDetailsMenuFaceModeAction"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBlockActionConfiguration setActionName:](v12, "setActionName:", v13);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("face.smiling"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBlockActionConfiguration setImage:](v12, "setImage:", v14);

  -[PXBlockActionConfiguration setSelected:](v12, "setSelected:", 1);
  -[PXPhotosDetailsBarsController blockActionManager](self, "blockActionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerActionWithConfiguration:forType:", v12, CFSTR("PXPhotosDetailsShowAssetAction"));

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

- (void)removeActionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXPhotosDetailsBarsController setShouldAddActionButton:](self, "setShouldAddActionButton:", 0);
  -[PXPhotosDetailsBarsController _barButtonItemCacheByBarItemIdentifier](self, "_barButtonItemCacheByBarItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PXBarItemIdentifierActionMenu"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PXBarsController viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "rightBarButtonItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeObject:", v10);
    objc_msgSend(v5, "setRightBarButtonItems:", v8);
    -[PXPhotosDetailsBarsController _barButtonItemCacheByBarItemIdentifier](self, "_barButtonItemCacheByBarItemIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("PXBarItemIdentifierActionMenu"));

  }
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[PXPhotosDetailsBarsController _assetCollection](self, "_assetCollection", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController _assetCollectionActionManager](self, "_assetCollectionActionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    -[PXPhotosDetailsBarsController _invalidateAssetCollectionActionManager](self, "_invalidateAssetCollectionActionManager");
    -[PXBarsController updateIfNeeded](self, "updateIfNeeded");
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v8 = a3;
  if ((void *)PXViewModelObservationContext_125537 == a5)
  {
    v11 = v8;
    if ((v6 & 1) != 0)
    {
      -[PXBarsController invalidateBars](self, "invalidateBars");
      -[PXBarsController setWantsAnimatedBarsUpdate:](self, "setWantsAnimatedBarsUpdate:", 1);
    }
    if ((v6 & 0x1A) != 0)
      -[PXBarsController invalidateBars](self, "invalidateBars");
    if ((v6 & 4) != 0)
    {
      -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPhotosDetailsBarsController _setSelectionManager:](self, "_setSelectionManager:", v10);
      -[PXBarsController invalidateBars](self, "invalidateBars");

    }
    goto LABEL_15;
  }
  if ((void *)PXExtendedTraitCollectionObservationContext_125538 == a5)
  {
    if ((v6 & 0xA) != 0)
    {
      v11 = v8;
      goto LABEL_14;
    }
  }
  else if ((v6 & 1) != 0 && (void *)PXSelectionManagerObservationContext_125539 == a5)
  {
    v11 = v8;
    -[PXPhotosDetailsBarsController _invalidateAssetActionManager](self, "_invalidateAssetActionManager");
LABEL_14:
    -[PXBarsController invalidateBars](self, "invalidateBars");
LABEL_15:
    -[PXBarsController updateIfNeeded](self, "updateIfNeeded");
    v8 = v11;
  }

}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v6 = a3;
  v16 = v6;
  if (a4 == 10)
  {
    -[PXPhotosDetailsBarsController _setActivePerformer:](self, "_setActivePerformer:", v6);
    -[PXPhotosDetailsBarsController _setLastActionPerformer:](self, "_setLastActionPerformer:", v16);
  }
  else
  {
    -[PXPhotosDetailsBarsController _activePerformer](self, "_activePerformer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v16)
      -[PXPhotosDetailsBarsController _setActivePerformer:](self, "_setActivePerformer:", 0);
    if (a4 == 30 && objc_msgSend(v16, "success"))
    {
      -[PXPhotosDetailsBarsController _lastActionPerformer](self, "_lastActionPerformer");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 == v16)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v16, "actionType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", CFSTR("PXAssetActionTypeSlideshow"));

          if ((v11 & 1) == 0)
          {
            -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "performChanges:", &__block_literal_global_268);

          }
        }
      }
      else
      {

      }
    }
  }
  -[PXBarsController actionPerformerDelegate](self, "actionPerformerDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[PXBarsController actionPerformerDelegate](self, "actionPerformerDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionPerformer:didChangeState:", v16, a4);

  }
}

- (id)_sourceBarButtonItemForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4
    || (-[PXPhotosDetailsBarsController _barButtonItemByActionType](self, "_barButtonItemByActionType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeHide")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeDuplicate")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeSlideshow"))
      || (-[PXPhotosDetailsBarsController _sourceBarButtonItemForActionType:](self, "_sourceBarButtonItemForActionType:", CFSTR("PXAssetActionTypeShare")), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeTrash")) & 1) != 0
        || objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeRemove")))
      {
        -[PXPhotosDetailsBarsController _sourceBarButtonItemForActionType:](self, "_sourceBarButtonItemForActionType:", CFSTR("PXAssetActionTypeUnifiedDestructive"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
  }

  return v6;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[PXBarsController viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "actionType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosDetailsBarsController _sourceBarButtonItemForActionType:](self, "_sourceBarButtonItemForActionType:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v9, "setBarButtonItem:", v11);
      objc_msgSend(v9, "setDelegate:", self);

    }
    objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

  }
  return v8 != 0;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  -[PXBarsController viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v6);

  return v8 != 0;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  -[PXBarsController viewController](self, "viewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXBarsController viewController](self, "viewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    PXPresentationEnvironmentForSender(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsBarsController _activePerformer](self, "_activePerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
    goto LABEL_4;
  objc_msgSend(v5, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "actionType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsBarsController _sourceBarButtonItemForActionType:](self, "_sourceBarButtonItemForActionType:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setBarButtonItem:", v6);
LABEL_4:

  }
}

- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 presentViewController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v7 = a4;
  v8 = a5;
  -[PXBarsController viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PXPhotosDetailsBarsController _barButtonItemCacheByBarItemIdentifier](self, "_barButtonItemCacheByBarItemIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PXBarItemIdentifierActionMenu"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v10, "setBarButtonItem:", v12);
      objc_msgSend(v10, "setDelegate:", self);

    }
    objc_msgSend(v7, "actionType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeFileRadar"));

    if (v14)
      objc_msgSend(v9, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v8, 1, 0, 0);
    else
      objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

  }
  return v9 != 0;
}

- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 dismissViewController:(id)a5 completionHandler:(id)a6
{
  id v7;
  void *v8;
  void *v9;

  v7 = a6;
  -[PXBarsController viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v7);

  return v9 != 0;
}

- (void)actionMenu:(id)a3 actionPerformer:(id)a4 didChangeState:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v7 = a4;
  objc_msgSend(v7, "actionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a5 == 20)
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeDeleteMemory")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemory")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureHoliday")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePlace")) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson")))
    {
      -[PXPhotosDetailsBarsController _dismissViewControllerIfSafeAnimated:](self, "_dismissViewControllerIfSafeAnimated:", 1);
    }
    objc_msgSend(v7, "actionType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeCreateMemory"));

    if (v11)
    {
      +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "addToTabSimulate");

      if ((v13 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x1E0C99E20];
        -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "disabledActionTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithSet:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObject:", CFSTR("PXAssetCollectionActionTypeCreateMemory"));
        -[PXPhotosDetailsBarsController _viewModel](self, "_viewModel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __75__PXPhotosDetailsBarsController_actionMenu_actionPerformer_didChangeState___block_invoke;
        v23[3] = &unk_1E5130EF0;
        v24 = v17;
        v19 = v17;
        objc_msgSend(v18, "performChanges:", v23);

      }
    }
  }
  -[PXBarsController actionPerformerDelegate](self, "actionPerformerDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    -[PXBarsController actionPerformerDelegate](self, "actionPerformerDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "actionPerformer:didChangeState:", v7, a5);

  }
}

- (void)actionMenu:(id)a3 assetCollectionActionPerformer:(id)a4 playMovieForAssetCollection:(id)a5
{
  id v5;

  -[PXBarsController viewController](self, "viewController", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playMovieWithCompletionHandler:", &__block_literal_global_274);

}

- (id)undoManagerForActionMenuController:(id)a3
{
  void *v3;
  void *v4;

  -[PXBarsController viewController](self, "viewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_dismissViewControllerIfSafeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  -[PXBarsController viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      v8 = (id)objc_msgSend(v6, "popViewControllerAnimated:", v3);
LABEL_7:
      v10 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(v4, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", v3, 0);
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (PXBarAppearance)_barAppearance
{
  return self->__barAppearance;
}

- (void)_setBarAppearance:(id)a3
{
  objc_storeStrong((id *)&self->__barAppearance, a3);
}

- (PXPhotosDetailsViewModel)_viewModel
{
  return self->__viewModel;
}

- (PXSectionedSelectionManager)_selectionManager
{
  return self->__selectionManager;
}

- (PXBlockActionManager)blockActionManager
{
  return self->_blockActionManager;
}

- (PXActionPerformer)_activePerformer
{
  return self->__activePerformer;
}

- (void)_setActivePerformer:(id)a3
{
  objc_storeStrong((id *)&self->__activePerformer, a3);
}

- (PXActionPerformer)_lastActionPerformer
{
  return (PXActionPerformer *)objc_loadWeakRetained((id *)&self->__lastActionPerformer);
}

- (void)_setLastActionPerformer:(id)a3
{
  objc_storeWeak((id *)&self->__lastActionPerformer, a3);
}

- (PXPhotoDetailsActionMenuController)_activeMenuController
{
  return self->__activeMenuController;
}

- (void)set_activeMenuController:(id)a3
{
  objc_storeStrong((id *)&self->__activeMenuController, a3);
}

- (UIView)_titleView
{
  return self->__titleView;
}

- (BOOL)_showTitleView
{
  return self->__showTitleView;
}

- (void)_setShowTitleView:(BOOL)a3
{
  self->__showTitleView = a3;
}

- (PXPhotosDetailsContext)_context
{
  return self->__context;
}

- (PXPhotosDataSource)_dataSource
{
  return self->__dataSource;
}

- (PXExtendedTraitCollection)_extendedTraitCollection
{
  return self->__extendedTraitCollection;
}

- (PXPhotosBarButtonItemsController)barButtonItemsController
{
  return self->_barButtonItemsController;
}

- (NSMutableDictionary)_barButtonItemByActionType
{
  return self->__barButtonItemByActionType;
}

- (NSMutableDictionary)_barButtonItemCacheByBarItemIdentifier
{
  return self->__barButtonItemCacheByBarItemIdentifier;
}

- (BOOL)shouldAddActionButton
{
  return self->_shouldAddActionButton;
}

- (void)setShouldAddActionButton:(BOOL)a3
{
  self->_shouldAddActionButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__barButtonItemCacheByBarItemIdentifier, 0);
  objc_storeStrong((id *)&self->__barButtonItemByActionType, 0);
  objc_storeStrong((id *)&self->_barButtonItemsController, 0);
  objc_storeStrong((id *)&self->__extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->__dataSource, 0);
  objc_storeStrong((id *)&self->__context, 0);
  objc_storeStrong((id *)&self->__titleView, 0);
  objc_storeStrong((id *)&self->__activeMenuController, 0);
  objc_destroyWeak((id *)&self->__lastActionPerformer);
  objc_storeStrong((id *)&self->__activePerformer, 0);
  objc_storeStrong((id *)&self->_blockActionManager, 0);
  objc_storeStrong((id *)&self->__selectionManager, 0);
  objc_storeStrong((id *)&self->__viewModel, 0);
  objc_storeStrong((id *)&self->__barAppearance, 0);
  objc_storeStrong((id *)&self->__assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->__assetActionManager, 0);
}

void __103__PXPhotosDetailsBarsController_actionMenu_assetCollectionActionPerformer_playMovieForAssetCollection___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  __CFString *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLMemoriesGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (a2)
      v4 = CFSTR("YES");
    v5 = v4;
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Playing Memories movie with success: %@", (uint8_t *)&v6, 0xCu);

  }
}

uint64_t __75__PXPhotosDetailsBarsController_actionMenu_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisabledActionTypes:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__PXPhotosDetailsBarsController_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelecting:", 0);
}

uint64_t __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_toggleFaceMode:", v6);
  return 1;
}

uint64_t __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFaceModeEnabled") ^ 1;

  return v3;
}

uint64_t __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_toggleFaceMode:", v6);
  return 1;
}

uint64_t __57__PXPhotosDetailsBarsController__setupBlockActionManager__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFaceModeEnabled");

  return v3;
}

void __49__PXPhotosDetailsBarsController__toggleFaceMode___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFaceModeEnabled:", objc_msgSend(v2, "isFaceModeEnabled") ^ 1);

}

void __59__PXPhotosDetailsBarsController_cancelBarButtonItemTapped___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_viewModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performChanges:", &__block_literal_global_231_125587);

}

uint64_t __59__PXPhotosDetailsBarsController_cancelBarButtonItemTapped___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelecting:", 0);
}

uint64_t __59__PXPhotosDetailsBarsController_selectBarButtonItemTapped___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelecting:", 1);
}

uint64_t __43__PXPhotosDetailsBarsController_updateBars__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "px_subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "setVerticalSizeClass:", *(_QWORD *)(a1 + 48));
}

void __43__PXPhotosDetailsBarsController_updateBars__block_invoke_228(uint64_t a1, void *a2)
{
  uint64_t v3;
  _BOOL8 v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setPrefersStatusBarVisible:", 1);
  objc_msgSend(v5, "setPrefersNavigationBarVisible:", 1);
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  v4 = v3 == 0;
  objc_msgSend(v5, "setPrefersToolbarVisible:", v3 != 0);
  objc_msgSend(v5, "setPrefersTabBarVisible:", v4);

}

uint64_t __62__PXPhotosDetailsBarsController_shouldShowTitleView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTitleViewAlpha");
}

void __70__PXPhotosDetailsBarsController__barButtonItemsForBarItems_placement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_barButtonItemForBarItemIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_shouldEnableActionWithBarItemIdentifier:", v10);

    objc_msgSend(v8, "setEnabled:", v11);
    objc_msgSend(*(id *)(a1 + 32), "_flexibleSpaceBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_centeredBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "isEqual:", v13);

    if (v14)
    {
      if (*(_QWORD *)(a1 + 56) == 4)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
      v15 = (id *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
      v16 = *(void **)(a1 + 48);
    }
    else
    {
      v15 = (id *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
      objc_msgSend(*(id *)(a1 + 32), "_centeredBarButtonItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
LABEL_14:

        goto LABEL_15;
      }
      v16 = *(void **)(a1 + 48);
    }
    if (objc_msgSend(v16, "count") - 1 != a3 && *(_QWORD *)(a1 + 56) == 4)
      objc_msgSend(*v15, "addObject:", v12);
    goto LABEL_14;
  }
  PXAssertGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 138412546;
    v21 = v19;
    v22 = 2112;
    v23 = v5;
    _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "%@ unable to create bar button for item: %@", (uint8_t *)&v20, 0x16u);
  }

LABEL_15:
}

@end

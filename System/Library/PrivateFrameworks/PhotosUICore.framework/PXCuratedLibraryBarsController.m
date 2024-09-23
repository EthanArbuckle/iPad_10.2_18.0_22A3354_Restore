@implementation PXCuratedLibraryBarsController

void __44__PXCuratedLibraryBarsController_updateBars__block_invoke(unsigned __int8 *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = a1[32];
  v4 = a2;
  objc_msgSend(v4, "setPrefersNavigationBarVisible:", v3);
  objc_msgSend(v4, "setPrefersToolbarVisible:", a1[33]);
  objc_msgSend(v4, "setPrefersTabBarVisible:", a1[34]);
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefersStatusBarVisible:", objc_msgSend(v5, "showStatusBar"));

}

- (PXCuratedLibraryBarsController)initWithCuratedLibraryViewController:(id)a3 viewModel:(id)a4
{
  id v6;
  id v7;
  PXCuratedLibraryBarsController *v8;
  PXCuratedLibraryBarsController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXCuratedLibraryBarsController;
  v8 = -[PXBarsController init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PXBarsController setViewController:](v8, "setViewController:", v6);
    objc_storeStrong((id *)&v9->_viewModel, a4);
    objc_msgSend(v7, "registerChangeObserver:context:", v9, PXCuratedLibraryBarsControllerViewModelObserverContext);
    objc_msgSend(v6, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_setBackButtonDisplayMode:", 2);

    objc_msgSend(v6, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_setPreferredLargeTitleDisplayMode:", 2);

    objc_msgSend(v7, "specManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "interbuttonSpacing");
    v9->_interbuttonSpacing = v14;

  }
  return v9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  if ((void *)PXCuratedLibraryBarsControllerViewModelObserverContext == a5)
  {
    v9 = v8;
    if ((*(_QWORD *)&v6 & 0x400041) != 0)
      -[PXBarsController invalidateBars](self, "invalidateBars");
    if ((v6 & 9) != 0)
      -[PXCuratedLibraryBarsController _invalidateToolbarItems](self, "_invalidateToolbarItems");
    if ((v6 & 2) != 0)
      -[PXCuratedLibraryBarsController _updateSelectModeCaption](self, "_updateSelectModeCaption");
    -[PXBarsController updateIfNeeded](self, "updateIfNeeded");
    v8 = v9;
  }

}

- (void)_invalidateToolbarItems
{
  void *v3;
  void *v4;
  void *v5;

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetActionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerformerDelegate:", self);

  -[PXCuratedLibraryBarsController _defaultToolbarItemIdentifiers](self, "_defaultToolbarItemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v5);

  -[PXBarsController invalidateBars](self, "invalidateBars");
}

- (id)_defaultToolbarItemIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  v6[0] = CFSTR("PXBarItemIdentifierShare");
  v6[1] = CFSTR("PXBarItemIdentifierPlaceholder");
  v6[2] = CFSTR("PXBarItemIdentifierSelectModeCaption");
  v6[3] = CFSTR("PXBarItemIdentifierPlaceholder");
  v6[4] = CFSTR("PXBarItemIdentifierTrash");
  v6[5] = CFSTR("PXBarItemIdentifierInterButtonSpacing");
  v6[6] = CFSTR("PXBarItemIdentifierSelectModeMenu");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateBars
{
  void *v3;
  char v4;
  char v5;
  char v6;
  PXBarAnimationOptions *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  char v12;
  char v13;
  char v14;

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsNavigationBarVisible");
  v5 = objc_msgSend(v3, "wantsTabBarVisible");
  v6 = objc_msgSend(v3, "wantsToolbarVisible");
  objc_msgSend(v3, "lastChromeVisibilityChangeReason");
  v7 = -[PXBarAnimationOptions initWithType:]([PXBarAnimationOptions alloc], "initWithType:", 0);
  -[PXCuratedLibraryBarsController barAppearance](self, "barAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__PXCuratedLibraryBarsController_updateBars__block_invoke;
  v11[3] = &__block_descriptor_35_e34_v16__0___PXMutableBarAppearance__8l;
  v12 = v4;
  v13 = v6;
  v14 = v5;
  objc_msgSend(v8, "performChangesWithAnimationOptions:changes:", v7, v11);

  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryBarsController;
  -[PXBarsController updateBars](&v10, sel_updateBars);
  -[PXCuratedLibraryBarsController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "curatedLibraryBarsControllerDidUpdateBars:", self);

}

- (PXBarAppearance)barAppearance
{
  void *v2;
  void *v3;

  -[PXBarsController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_barAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXBarAppearance *)v3;
}

- (id)toolbarItemIdentifiers
{
  void *v3;
  void *v4;

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSelecting"))
  {
    -[PXCuratedLibraryBarsController _defaultToolbarItemIdentifiers](self, "_defaultToolbarItemIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)rightBarButtonItemIdentifiers
{
  void *v2;
  char v3;
  void *v4;
  const __CFString **v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "libraryState");
  if ((PXCuratedLibraryStateIsEmptyLibrary(v3) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else if ((v3 & 2) != 0)
  {
    if ((objc_msgSend(v2, "isSelecting") & 1) != 0)
    {
      v8[0] = CFSTR("PXBarItemIdentifierCancel");
      v5 = (const __CFString **)v8;
    }
    else
    {
      v7 = CFSTR("PXBarItemIdentifierSelect");
      v5 = &v7;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4
{
  id v7;
  void *v8;
  void (**v9)(void *, void *, char *);
  char *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  unsigned __int8 v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD aBlock[5];
  objc_super v39;

  v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PXCuratedLibraryBarsController;
  -[PXBarsController createBarButtonItemForIdentifier:placement:](&v39, sel_createBarButtonItemForIdentifier_placement_, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PXCuratedLibraryBarsController_createBarButtonItemForIdentifier_placement___block_invoke;
  aBlock[3] = &unk_1E511D878;
  aBlock[4] = self;
  v9 = (void (**)(void *, void *, char *))_Block_copy(aBlock);
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSelect")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierCancel")))
    {
      v10 = sel_handleCancelBarButtonItem_;
      goto LABEL_5;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierShare")))
    {
      v12 = CFSTR("PXAssetActionTypeShare");
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierAddTo")))
    {
      v12 = CFSTR("PXAssetActionTypeAddToAlbum");
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierTrash")))
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierPlaceholder")))
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
        }
        else
        {
          if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectModeCaption")))
          {
            if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectModeMenu")))
            {
              objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXCuratedLibraryBarsController delegate](self, "delegate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "barsControllerActionsForSelectionContextMenu:", self);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5149688, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:menu:", v30, v33);

              -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "selectionSnapshot");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "selectedIndexPaths");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setEnabled:", objc_msgSend(v36, "count") > 0);

              goto LABEL_15;
            }
            goto LABEL_6;
          }
          v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
          -[PXCuratedLibraryBarsController selectModeCaptionLabel](self, "selectModeCaptionLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v20, "initWithCustomView:", v21);

          objc_msgSend(v11, "setEnabled:", 1);
          -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "photoLibrary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "hasPreview"))
          {
            objc_msgSend(v8, "selectionSnapshot");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isAnyItemSelected");

            if (v25)
            {
              objc_msgSend(v8, "assetActionManager");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "canPerformActionType:", CFSTR("PXAssetActionTypeMoveToPersonalLibrary"));
              v28 = objc_msgSend(v26, "canPerformActionType:", CFSTR("PXAssetActionTypeMoveToSharedLibrary"));
              if (v27 && (v28 & 1) != 0)
              {
                v29 = CFSTR("PXAssetActionTypeMoveToLibrary");
              }
              else
              {
                v29 = CFSTR("PXAssetActionTypeMoveToPersonalLibrary");
                if (!v27)
                  v29 = CFSTR("PXAssetActionTypeMoveToSharedLibrary");
                if (((v27 | v28) & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryBarsController.m"), 214, CFSTR("Code which should be unreachable has been reached"));

                  abort();
                }
              }
              v12 = v29;

              goto LABEL_14;
            }
          }

        }
        goto LABEL_15;
      }
      v12 = CFSTR("PXAssetActionTypeUnifiedDestructive");
    }
    v13 = v12;
    v11 = v8;
LABEL_14:
    -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetActionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "barButtonItemForActionType:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetActionManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", objc_msgSend(v18, "canPerformActionType:", v12));

    v11 = v16;
    goto LABEL_15;
  }
  v10 = sel_handleSelectBarButtonItem_;
LABEL_5:
  v9[2](v9, v8, v10);
LABEL_6:
  v11 = v8;
LABEL_15:

  return v11;
}

void __77__PXCuratedLibraryBarsController_createBarButtonItemForIdentifier_placement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = a2;
    objc_msgSend(v5, "setTarget:", v4);
    objc_msgSend(v5, "setAction:", a3);

  }
}

- (PXCuratedLibraryBarsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryBarsController.m"), 64, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryBarsController init]");

  abort();
}

- (id)createAssetActionManagerForAssetReference:(id)a3
{
  id v4;
  PXPhotoKitAssetActionManager *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPhotoKitAssetActionManager *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = [PXPhotoKitAssetActionManager alloc];
  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsDataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPhotoKitAssetsDataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXAssetActionManager initWithSelectedObjectReference:dataSourceManager:](v5, "initWithSelectedObjectReference:dataSourceManager:", v4, v8);

  -[PXActionManager setPerformerDelegate:](v9, "setPerformerDelegate:", self);
  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetActionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allowedActionTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionManager setAllowedActionTypes:](v9, "setAllowedActionTypes:", v12);

  return v9;
}

- (id)_selectionModeIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasPreview"))
  {
    objc_msgSend(v2, "libraryFilterState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "viewMode");

    if (v6 != 2)
      goto LABEL_8;
  }
  objc_msgSend(v2, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isAnyItemSelected") & 1) == 0)
  {

LABEL_8:
    v10 = CFSTR("PXBarItemIdentifierSelectModeCaption");
    goto LABEL_9;
  }
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enableMultiSelectMenu");

  if (v9)
    v10 = CFSTR("PXBarItemIdentifierSelectModeMenu");
  else
    v10 = CFSTR("PXBarItemIdentifierSelectModeCaption");
LABEL_9:
  v11 = v10;

  return v11;
}

- (void)_updateSelectModeCaption
{
  void *v3;
  id v4;

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectModeCaption");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  PXPhotosBarsUpdateSelectModeCaption(v4, self->_selectModeCaptionLabel, self->_selectModeChevronButton);
}

- (UILabel)selectModeCaptionLabel
{
  UILabel *selectModeCaptionLabel;
  UILabel *v4;
  UILabel *v5;

  selectModeCaptionLabel = self->_selectModeCaptionLabel;
  if (!selectModeCaptionLabel)
  {
    PXPhotosBarsCreateSelectModeCaptionLabel();
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_selectModeCaptionLabel;
    self->_selectModeCaptionLabel = v4;

    -[PXCuratedLibraryBarsController _updateSelectModeCaption](self, "_updateSelectModeCaption");
    selectModeCaptionLabel = self->_selectModeCaptionLabel;
  }
  return selectModeCaptionLabel;
}

- (UIButton)selectModeChevronButton
{
  UIButton *selectModeChevronButton;
  UIButton *v4;
  UIButton *v5;

  selectModeChevronButton = self->_selectModeChevronButton;
  if (!selectModeChevronButton)
  {
    PXPhotosBarsSelectModeChevronButton(self);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_selectModeChevronButton;
    self->_selectModeChevronButton = v4;

    -[PXCuratedLibraryBarsController _updateSelectModeCaption](self, "_updateSelectModeCaption");
    selectModeChevronButton = self->_selectModeChevronButton;
  }
  return selectModeChevronButton;
}

- (id)_identifierForActionType:(id)a3
{
  id v3;
  __CFString **v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetActionTypeShare")) & 1) != 0)
  {
    v4 = PXBarItemIdentifierShare;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetActionTypeUnifiedDestructive")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetActionTypeTrash")) & 1) != 0)
  {
    v4 = PXBarItemIdentifierTrash;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetActionTypeHide")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = PXBarItemIdentifierSelectModeMenu;
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

- (void)_applyZoomLevel:(int64_t)a3
{
  void *v4;
  _QWORD v5[5];

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PXCuratedLibraryBarsController__applyZoomLevel___block_invoke;
  v5[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
  v5[4] = a3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)handleSelectBarButtonItem:(id)a3
{
  id v3;

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_49669);

}

- (void)handleCancelBarButtonItem:(id)a3
{
  id v3;

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_158);

}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  if (a4 == 10)
  {
    -[PXCuratedLibraryBarsController setActiveActionPerformer:](self, "setActiveActionPerformer:", v6);
    -[PXCuratedLibraryBarsController setLastActionPerformer:](self, "setLastActionPerformer:", v10);
  }
  else
  {
    -[PXCuratedLibraryBarsController activeActionPerformer](self, "activeActionPerformer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v10)
      -[PXCuratedLibraryBarsController setActiveActionPerformer:](self, "setActiveActionPerformer:", 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "shouldExitSelectModeForState:", a4))
    {
      -[PXCuratedLibraryBarsController lastActionPerformer](self, "lastActionPerformer");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v10)
      {
        -[PXCuratedLibraryBarsController viewModel](self, "viewModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "performChanges:", &__block_literal_global_160);

      }
    }
  }

}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, _OWORD *, _BYTE *);
  void *v28;
  id v29;
  PXCuratedLibraryBarsController *v30;
  uint64_t *v31;
  SEL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v10, "popoverPresentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_15;
    objc_msgSend(v7, "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_1EE99F750);

    if (v13)
    {
      objc_msgSend(v7, "sender");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSourceItem:", v14);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:
        objc_msgSend(v11, "sourceItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          objc_msgSend(v11, "sourceView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            goto LABEL_15;
          -[PXBarsController cachedBarButtonItemForIdentifier:](self, "cachedBarButtonItemForIdentifier:", CFSTR("PXBarItemIdentifierSelectModeMenu"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setSourceItem:", v21);
        }

LABEL_15:
        -[PXBarsController viewController](self, "viewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "presentViewController:animated:completion:", v10, 1, 0);

        goto LABEL_16;
      }
      objc_msgSend(v7, "selectionSnapshot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__49652;
      v37 = __Block_byref_object_dispose__49653;
      v38 = 0;
      objc_msgSend(v15, "selectedIndexPaths");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __72__PXCuratedLibraryBarsController_actionPerformer_presentViewController___block_invoke;
      v28 = &unk_1E51437D0;
      v31 = &v33;
      v14 = v15;
      v32 = a2;
      v29 = v14;
      v30 = self;
      objc_msgSend(v16, "enumerateItemIndexPathsUsingBlock:", &v25);

      -[PXCuratedLibraryBarsController curatedLibraryViewController](self, "curatedLibraryViewController", v25, v26, v27, v28);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "viewProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "gridView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34[5])
      {
        objc_msgSend(v19, "regionOfInterestForObjectReference:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v11, "setSourceView:", v19);
          objc_msgSend(v20, "rectInCoordinateSpace:", v19);
          objc_msgSend(v11, "setSourceRect:");
        }
      }
      else
      {
        v20 = 0;
      }

      _Block_object_dispose(&v33, 8);
    }

    goto LABEL_12;
  }
LABEL_16:

  return v9 != 0;
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryBarsController _identifierForActionType:](self, "_identifierForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController cachedBarButtonItemForIdentifier:](self, "cachedBarButtonItemForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXViewControllerPresenter popoverPresenterWithViewController:sourceItem:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceItem:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PXCuratedLibraryBarsController viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0.0;
  if ((unint64_t)(objc_msgSend(v4, "secondaryToolbarPlacement") - 1) <= 1)
  {
    objc_msgSend(v4, "secondaryToolbarPadding");
    v7 = v6;
    objc_msgSend(v4, "secondaryToolbarSize");
    v5 = v7 + v8;
  }

  return v5;
}

- (PXBarsControllerDelegate)delegate
{
  return (PXBarsControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (PXActionPerformer)activeActionPerformer
{
  return self->_activeActionPerformer;
}

- (void)setActiveActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_activeActionPerformer, a3);
}

- (PXActionPerformer)lastActionPerformer
{
  return self->_lastActionPerformer;
}

- (void)setLastActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_lastActionPerformer, a3);
}

- (double)interbuttonSpacing
{
  return self->_interbuttonSpacing;
}

- (void)setInterbuttonSpacing:(double)a3
{
  self->_interbuttonSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActionPerformer, 0);
  objc_storeStrong((id *)&self->_activeActionPerformer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_selectModeChevronButton, 0);
  objc_storeStrong((id *)&self->_selectModeCaptionLabel, 0);
  objc_destroyWeak((id *)&self->delegate);
}

void __72__PXCuratedLibraryBarsController_actionPerformer_presentViewController___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  uint64_t v3;
  void *v4;
  void *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  _OWORD v22[2];

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(_QWORD *)(v3 + 40) = 0;

    *a3 = 1;
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a2[1];
  v22[0] = *a2;
  v22[1] = v9;
  objc_msgSend(v8, "objectReferenceAtIndexPath:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("PXCuratedLibraryBarsController.m"), 339, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]"), v17);
LABEL_9:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 40);
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("PXCuratedLibraryBarsController.m"), 339, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]"), v17, v21);

    goto LABEL_9;
  }
LABEL_5:
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

uint64_t __65__PXCuratedLibraryBarsController_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 0);
}

uint64_t __60__PXCuratedLibraryBarsController_handleCancelBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 0);
}

uint64_t __60__PXCuratedLibraryBarsController_handleSelectBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 1);
}

uint64_t __50__PXCuratedLibraryBarsController__applyZoomLevel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

@end

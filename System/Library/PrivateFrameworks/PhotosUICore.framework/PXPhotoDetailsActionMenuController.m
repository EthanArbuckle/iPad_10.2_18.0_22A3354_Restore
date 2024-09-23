@implementation PXPhotoDetailsActionMenuController

- (PXPhotoDetailsActionMenuController)initWithActionManagers:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoDetailsActionMenuController.m"), 47, CFSTR("%s is not available as initializer"), "-[PXPhotoDetailsActionMenuController initWithActionManagers:]");

  abort();
}

- (PXPhotoDetailsActionMenuController)initWithSelectionManager:(id)a3 displayTitleInfo:(id)a4 blockActionManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  PXPhotoKitAssetCollectionActionManager *v22;
  void *v23;
  PXPhotoKitAssetActionManager *v24;
  PXPhotoKitAssetActionManager *v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  PXPhotoDetailsActionMenuController *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint8_t buf[8];
  _BYTE v50[128];
  _QWORD v51[2];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoDetailsActionMenuController.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectionManager"));

  }
  v12 = v9;
  objc_msgSend(v12, "selectionSnapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAnyItemSelected");

  v15 = v12;
  if ((v14 & 1) == 0)
  {
    v16 = objc_alloc((Class)off_1E50B4A40);
    objc_msgSend(v12, "dataSourceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "initWithDataSourceManager:", v17);

    objc_msgSend(v15, "performChanges:", &__block_literal_global_300514);
  }
  objc_msgSend(v15, "dataSourceManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoDetailsActionMenuController.m"), 62, CFSTR("Only support PXAssetsDataSource"));

  }
  if (objc_msgSend(v19, "numberOfSections") != 1)
  {
    PXAssertGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Only support datasources with one section", buf, 2u);
    }

  }
  v38 = v12;
  v46 = objc_msgSend(v19, "identifier");
  v47 = xmmword_1A7C0C1F0;
  v48 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v19, "assetCollectionAtSectionIndexPath:", &v46);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v10;
  v22 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v21, v10);
  objc_msgSend(v15, "dataSourceManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionManager setAssetsDataSourceManager:](v22, "setAssetsDataSourceManager:", v23);

  v24 = -[PXPhotoKitAssetActionManager initWithSelectionManager:]([PXPhotoKitAssetActionManager alloc], "initWithSelectionManager:", v15);
  v25 = v24;
  v39 = v11;
  if (v11)
  {
    v52[0] = v11;
    v52[1] = v22;
    v52[2] = v24;
    v26 = (void *)MEMORY[0x1E0C99D20];
    v27 = v52;
    v28 = 3;
  }
  else
  {
    v51[0] = v22;
    v51[1] = v24;
    v26 = (void *)MEMORY[0x1E0C99D20];
    v27 = v51;
    v28 = 2;
  }
  objc_msgSend(v26, "arrayWithObjects:count:", v27, v28);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "setPerformerDelegate:", self);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v31);
  }

  v41.receiver = self;
  v41.super_class = (Class)PXPhotoDetailsActionMenuController;
  v34 = -[PXActionMenuController initWithActionManagers:](&v41, sel_initWithActionManagers_, v29);

  return v34;
}

- (id)assetCollectionActionManager
{
  void *v4;
  void *v5;
  void *v7;

  -[PXActionMenuController actionManagers](self, "actionManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXFind();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoDetailsActionMenuController.m"), 82, CFSTR("assetCollectionActionManager not found in actionManagers"));

  }
  return v5;
}

- (void)setPeople:(id)a3
{
  void *v5;
  PHFetchResult *v6;

  v6 = (PHFetchResult *)a3;
  if (self->_people != v6)
  {
    objc_storeStrong((id *)&self->_people, a3);
    -[PXPhotoDetailsActionMenuController assetCollectionActionManager](self, "assetCollectionActionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPeople:", v6);

    -[PXActionMenuController invalidateActions](self, "invalidateActions");
  }

}

- (id)availableActionTypes
{
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXAssetCollectionActionTypeFavorite");
  v3[1] = CFSTR("PXAssetCollectionActionTypeCreateMemory");
  v3[2] = CFSTR("PXAssetCollectionActionTypePlayMovie");
  v3[3] = CFSTR("PXAssetCollectionActionTypeDeleteMemory");
  v3[4] = CFSTR("PXAssetCollectionActionTypeBlockMemory");
  v3[5] = CFSTR("PXAssetCollectionActionTypeSuggestPeople");
  v3[6] = CFSTR("PXAssetCollectionActionTypeChangePersonSortOrder");
  v3[7] = CFSTR("PXAssetCollectionActionTypeFavoritePerson");
  v3[8] = CFSTR("PXAssetCollectionActionTypeCustomizePeopleAlbum");
  v3[9] = CFSTR("PXAssetCollectionActionTypeCustomizeSocialGroupAlbum");
  v3[10] = CFSTR("PXAssetCollectionActionTypeCopyLink");
  v3[11] = CFSTR("PXAssetCollectionActionTypeTrashMomentShare");
  v3[12] = CFSTR("PXAssetCollectionActionTypeStoryDemo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)availableInternalActionTypes
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXAssetCollectionActionTypeAddPersonToAutoCounter");
  v3[1] = CFSTR("PXAssetCollectionActionTypeFileRadar");
  v3[2] = CFSTR("PXAssetCollectionActionTypeCopyInternalURL");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)availableHeaderActionTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PXAssetCollectionActionTypePersonInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldAllowPerformanceOfActionType:(id)a3
{
  return 1;
}

- (BOOL)enableSectionedMenus
{
  void *v2;
  BOOL v3;

  -[PXPhotoDetailsActionMenuController people](self, "people");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)numberOfSections
{
  return 5;
}

- (id)availableActionTypesInSection:(int64_t)a3
{
  void *v3;
  const __CFString **v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v11;
  void *v12;
  SEL v13;
  PXPhotoDetailsActionMenuController *v14;
  uint64_t v15;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      v32 = CFSTR("PXAssetCollectionActionTypePersonInfo");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = &v32;
      v5 = 1;
      goto LABEL_10;
    case 1:
      v28 = CFSTR("PXAssetCollectionActionTypeFavoritePerson");
      v29 = CFSTR("PXAssetCollectionActionTypeAddPersonToHome");
      v30 = CFSTR("PXAssetCollectionActionTypeCustomizePeopleAlbum");
      v31 = CFSTR("PXAssetCollectionActionTypeCustomizeSocialGroupAlbum");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = &v28;
      goto LABEL_5;
    case 2:
      v24 = CFSTR("PXAssetCollectionActionTypeShowMap");
      v25 = CFSTR("PXPhotosDetailsShowFaceAction");
      v26 = CFSTR("PXPhotosDetailsShowAssetAction");
      v27 = CFSTR("PXAssetCollectionActionTypeChangePersonSortOrder");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = &v24;
LABEL_5:
      v5 = 4;
      goto LABEL_10;
    case 3:
      v21 = CFSTR("PXAssetCollectionActionTypeBlockPerson");
      v22 = CFSTR("PXAssetCollectionActionTypeRemovePersonFromHome");
      v23 = CFSTR("PXAssetCollectionActionTypeRemoveSocialGroupFromHome");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = &v21;
      goto LABEL_9;
    case 4:
      +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canShowInternalUI");

      if (!v7)
        return MEMORY[0x1E0C9AA60];
      v18 = CFSTR("PXAssetCollectionActionTypeAddPersonToAutoCounter");
      v19 = CFSTR("PXAssetCollectionActionTypeFileRadar");
      v20 = CFSTR("PXAssetCollectionActionTypeCopyInternalURL");
      v3 = (void *)MEMORY[0x1E0C99D20];
      v4 = &v18;
LABEL_9:
      v5 = 3;
LABEL_10:
      objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32,
        v33);
      return (id)objc_claimAutoreleasedReturnValue();
    case 5:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = a2;
      v14 = self;
      v15 = 184;
      goto LABEL_15;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = a2;
      v14 = self;
      v15 = 187;
LABEL_15:
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("PXPhotoDetailsActionMenuController.m"), v15, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
}

- (id)titleForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  SEL v6;
  PXPhotoDetailsActionMenuController *v7;
  uint64_t v8;

  if ((unint64_t)a3 < 4)
    return &stru_1E5149688;
  if (a3 != 4)
  {
    if (a3 == 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = a2;
      v7 = self;
      v8 = 201;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = a2;
      v7 = self;
      v8 = 204;
    }
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXPhotoDetailsActionMenuController.m"), v8, CFSTR("Code which should be unreachable has been reached"), a2, self);

    abort();
  }
  return CFSTR("Internal");
}

- (id)iconForSection:(int64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  SEL v7;
  PXPhotoDetailsActionMenuController *v8;
  uint64_t v9;

  if ((unint64_t)a3 >= 4)
  {
    if (a3 != 4)
    {
      if (a3 == 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = a2;
        v8 = self;
        v9 = 218;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = a2;
        v8 = self;
        v9 = 221;
      }
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v7, v8, CFSTR("PXPhotoDetailsActionMenuController.m"), v9, CFSTR("Code which should be unreachable has been reached"), a2, self);

      abort();
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("apple.logo"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)sectionDisplaysInline:(int64_t)a3
{
  void *v4;
  void *v5;
  SEL v6;
  PXPhotoDetailsActionMenuController *v7;
  uint64_t v8;

  if ((unint64_t)a3 < 4)
    return 1;
  if (a3 != 4)
  {
    if (a3 == 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = a2;
      v7 = self;
      v8 = 235;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = a2;
      v7 = self;
      v8 = 238;
    }
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXPhotoDetailsActionMenuController.m"), v8, CFSTR("Code which should be unreachable has been reached"), a2, self);

    abort();
  }
  return 0;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PXPhotoDetailsActionMenuController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  LOBYTE(self) = objc_msgSend(v8, "actionMenu:actionPerformer:presentViewController:", self, v7, v9);

  return (char)self;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[PXPhotoDetailsActionMenuController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  LOBYTE(self) = objc_msgSend(v11, "actionMenu:actionPerformer:dismissViewController:completionHandler:", self, v10, v12, v9);

  return (char)self;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PXPhotoDetailsActionMenuController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PXPhotoDetailsActionMenuController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionMenu:actionPerformer:didChangeState:", self, v9, a4);

  }
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXPhotoDetailsActionMenuController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PXPhotoDetailsActionMenuController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationEnvironmentForActionPerformer:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotoDetailsActionMenuController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManagerForActionMenuController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PXPhotoDetailsActionMenuController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PXPhotoDetailsActionMenuController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionMenu:assetCollectionActionPerformer:playMovieForAssetCollection:", self, v10, v6);

  }
}

- (PXPhotosDetailsActionMenuDelegate)delegate
{
  return (PXPhotosDetailsActionMenuDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHFetchResult)people
{
  return self->_people;
}

- (PXPhotoKitAssetCollectionActionManager)assetActionManager
{
  return self->_assetActionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __66__PXPhotoDetailsActionMenuController_assetCollectionActionManager__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __99__PXPhotoDetailsActionMenuController_initWithSelectionManager_displayTitleInfo_blockActionManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

@end

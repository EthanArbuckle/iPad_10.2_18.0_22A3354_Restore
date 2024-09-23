@implementation PXPhotosGridShowFiltersMenuActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a4;
  if (objc_msgSend(v4, "canFilterContent"))
  {
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      objc_msgSend(v4, "dataSourceManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "containerCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "px_isAllPhotosSmartAlbum") & 1) != 0)
        LOBYTE(v8) = 0;
      else
        v8 = objc_msgSend(v7, "px_isRecentsSmartAlbum") ^ 1;

    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeShowFiltersMenu");
  return CFSTR("PXActivityTypeShowFiltersMenu");
}

- (id)activitySystemImageName
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentFilterImageNameForFilterState(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableArray)filterMenuItems
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (filterMenuItems_onceToken_83714 != -1)
    dispatch_once(&filterMenuItems_onceToken_83714, &__block_literal_global_83715);
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridActionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)filterMenuItems_filterActionTypes_83716, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (id)filterMenuItems_filterActionTypes_83716;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "actionPerformerForActionType:", v12, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXActionPerformer sender](self, "sender");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSender:", v14);

        v15 = objc_msgSend(v4, "canPerformActionType:", v12);
        if (v13)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          objc_msgSend(v13, "menuElement");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v6, "addObject:", v17);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return (NSMutableArray *)v6;
}

- (NSMutableArray)viewOptionsMenuItems
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (viewOptionsMenuItems_onceToken_83710 != -1)
    dispatch_once(&viewOptionsMenuItems_onceToken_83710, &__block_literal_global_130_83711);
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridActionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)viewOptionsMenuItems_viewOptionsActionTypes_83712, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)viewOptionsMenuItems_viewOptionsActionTypes_83712;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "standardActionForActionType:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return (NSMutableArray *)v6;
}

- (id)menuElement
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewOptionsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortOrderMenu");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetCollectionActionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "standardActionForActionType:", CFSTR("PXAssetCollectionActionTypeSetSortOrder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_descriptionForAssertionMessage");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridShowFiltersMenuActionPerformer.m"), 131, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("action"), v34, v35);

      }
      objc_msgSend(v12, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
    }
    else
    {
      -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "assetCollectionActionManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "standardActionForActionType:", CFSTR("PXAssetCollectionActionTypeChangePersonSortOrder"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v15;
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "px_descriptionForAssertionMessage");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridShowFiltersMenuActionPerformer.m"), 136, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("action"), v38, v39);

        }
        objc_msgSend(v7, "children");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

  }
  -[PXPhotosGridShowFiltersMenuActionPerformer viewOptionsMenuItems](self, "viewOptionsMenuItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridShowFiltersMenuActionPerformer filterMenuItems](self, "filterMenuItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    if (objc_msgSend(v17, "count"))
      v19 = 0;
    else
      v19 = objc_msgSend(v8, "count") == 0;
    v20 = (void *)MEMORY[0x1E0DC39D0];
    PXLocalizedStringFromTable(CFSTR("PXFilterMenuTitle"), CFSTR("PhotosUICore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "menuWithTitle:image:identifier:options:children:", v21, 0, 0, v19, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v22);
  }
  if (objc_msgSend(v17, "count"))
  {
    v23 = (void *)MEMORY[0x1E0DC39D0];
    PXLocalizedStringFromTable(CFSTR("PXContentViewOptionsMenuTitle"), CFSTR("PhotosUICore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "menuWithTitle:image:identifier:options:children:", v24, 0, 0, 0, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v25);
  }
  -[PXPhotosGridShowFiltersMenuActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0DC3870];
  -[PXPhotosGridShowFiltersMenuActionPerformer activitySystemImageName](self, "activitySystemImageName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "systemImageNamed:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v26, v29, 0, 0, v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsFilter"), CFSTR("PhotosUICore"));
}

void __66__PXPhotosGridShowFiltersMenuActionPerformer_viewOptionsMenuItems__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXPhotosGridActionZoomIn");
  v2[1] = CFSTR("PXPhotosGridActionZoomOut");
  v2[2] = CFSTR("PXPhotosGridActionToggleAspectFit");
  v2[3] = CFSTR("PXPhotosGridActionToggleIncludeOthersInSocialGroupAssetsFilter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)viewOptionsMenuItems_viewOptionsActionTypes_83712;
  viewOptionsMenuItems_viewOptionsActionTypes_83712 = v0;

}

void __61__PXPhotosGridShowFiltersMenuActionPerformer_filterMenuItems__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXPhotosGridActionUnfilter");
  v2[1] = CFSTR("PXPhotosGridActionToggleFavoritesFilter");
  v2[2] = CFSTR("PXPhotosGridActionToggleImagesFilter");
  v2[3] = CFSTR("PXPhotosGridActionToggleEditedFilter");
  v2[4] = CFSTR("PXPhotosGridActionToggleVideosFilter");
  v2[5] = CFSTR("PXPhotosGridActionToggleShowOnlyScreenshotsFilter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)filterMenuItems_filterActionTypes_83716;
  filterMenuItems_filterActionTypes_83716 = v0;

}

@end

@implementation PXPhotosGridPickerShowFiltersMenuActionPerformer

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
  __CFString *v4;
  __CFString *v5;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFiltering"))
    v4 = CFSTR("line.horizontal.3.decrease.circle.fill");
  else
    v4 = CFSTR("line.horizontal.3.decrease.circle");
  v5 = v4;

  return v5;
}

- (id)menuElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (menuElement_onceToken != -1)
    dispatch_once(&menuElement_onceToken, &__block_literal_global_15977);
  -[PXPhotosGridPickerShowFiltersMenuActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3870];
  -[PXPhotosGridPickerShowFiltersMenuActionPerformer activitySystemImageName](self, "activitySystemImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v8 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend((id)menuElement_availableFilterActionTypes, "count"));
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gridActionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (id)menuElement_availableFilterActionTypes;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "standardActionForActionType:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v8, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v3, v6, 0, 0, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsFilter"), CFSTR("PhotosUICore"));
}

void __63__PXPhotosGridPickerShowFiltersMenuActionPerformer_menuElement__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXPhotosGridActionUnfilter");
  v2[1] = CFSTR("PXPhotosGridActionToggleFavoritesFilter");
  v2[2] = CFSTR("PXPhotosGridActionShowFilters");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)menuElement_availableFilterActionTypes;
  menuElement_availableFilterActionTypes = v0;

}

@end

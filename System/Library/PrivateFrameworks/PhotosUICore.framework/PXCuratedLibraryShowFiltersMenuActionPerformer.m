@implementation PXCuratedLibraryShowFiltersMenuActionPerformer

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
  void *v5;

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentContentFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentFilterImageNameForFilterStates(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  objc_msgSend(a4, "activityType", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryShowFiltersMenuActionPerformer activityType](self, "activityType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryShowFiltersMenuActionPerformer.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXStringEqualToString(activity.activityType, self.activityType)"));
LABEL_5:

  }
  return 1;
}

- (id)sharedLibraryModeMenuItems
{
  void *v3;
  void *v4;
  id v5;
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
  void *v17;
  int v18;
  BOOL v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (sharedLibraryModeMenuItems_onceToken != -1)
    dispatch_once(&sharedLibraryModeMenuItems_onceToken, &__block_literal_global_1044);
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)sharedLibraryModeMenuItems_sharedLibraryModeActionTypes, "count"));
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasSharedLibraryOrPreview"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = (id)sharedLibraryModeMenuItems_sharedLibraryModeActionTypes;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v4, "actionPerformerForActionType:", v16, (_QWORD)v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v4, "canPerformActionType:", v16);
          if (v17)
            v19 = v18 == 0;
          else
            v19 = 1;
          if (!v19)
          {
            objc_msgSend(v17, "menuElement");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v6, "addObject:", v20);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

  }
  return v6;
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
  if (filterMenuItems_onceToken != -1)
    dispatch_once(&filterMenuItems_onceToken, &__block_literal_global_137);
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)filterMenuItems_filterActionTypes, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (id)filterMenuItems_filterActionTypes;
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
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  int v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (viewOptionsMenuItems_onceToken != -1)
    dispatch_once(&viewOptionsMenuItems_onceToken, &__block_literal_global_138);
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend((id)viewOptionsMenuItems_viewOptionsActionTypes, "count"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = (id)viewOptionsMenuItems_viewOptionsActionTypes;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v4, "actionPerformerForActionType:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "canPerformActionType:", v12);
        if (v13)
          v15 = v14 == 0;
        else
          v15 = 1;
        if (!v15)
        {
          objc_msgSend(v13, "menuElement");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v6, "addObject:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend((id)viewOptionsMenuItems_viewOptionsShowActionTypes, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = (id)viewOptionsMenuItems_viewOptionsShowActionTypes;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v4, "actionPerformerForActionType:", v24, (_QWORD)v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v4, "canPerformActionType:", v24);
        if (v25)
          v27 = v26 == 0;
        else
          v27 = 1;
        if (!v27)
        {
          objc_msgSend(v25, "menuElement");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend(v18, "addObject:", v28);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v21);
  }

  v29 = (void *)MEMORY[0x1E0DC39D0];
  PXLocalizedStringFromTable(CFSTR("PXContentViewOptionsShowMenuTitle"), CFSTR("PhotosUICore"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "menuWithTitle:image:identifier:options:children:", v30, 0, 0, 1, v18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v31);

  return (NSMutableArray *)v6;
}

- (id)menuElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewOptionsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortOrderMenu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[PXCuratedLibraryShowFiltersMenuActionPerformer sharedLibraryModeMenuItems](self, "sharedLibraryModeMenuItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  -[PXCuratedLibraryShowFiltersMenuActionPerformer filterMenuItems](self, "filterMenuItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)MEMORY[0x1E0DC39D0];
    PXLocalizedStringFromTable(CFSTR("PXFilterMenuTitle"), CFSTR("PhotosUICore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "menuWithTitle:image:identifier:options:children:", v13, 0, 0, 0, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v14);
  }
  -[PXCuratedLibraryShowFiltersMenuActionPerformer viewOptionsMenuItems](self, "viewOptionsMenuItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = (void *)MEMORY[0x1E0DC39D0];
    PXLocalizedStringFromTable(CFSTR("PXContentViewOptionsMenuTitle"), CFSTR("PhotosUICore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "menuWithTitle:image:identifier:options:children:", v17, 0, 0, 0, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v18);
  }
  -[PXCuratedLibraryActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0DC3870];
  -[PXCuratedLibraryShowFiltersMenuActionPerformer activitySystemImageName](self, "activitySystemImageName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "systemImageNamed:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v19, v22, 0, 0, v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __70__PXCuratedLibraryShowFiltersMenuActionPerformer_viewOptionsMenuItems__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("PXCuratedLibraryActionAllPhotosZoomIn");
  v5[1] = CFSTR("PXCuratedLibraryActionAllPhotosZoomOut");
  v5[2] = CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)viewOptionsMenuItems_viewOptionsActionTypes;
  viewOptionsMenuItems_viewOptionsActionTypes = v0;

  v4[0] = CFSTR("PXCuratedLibraryActionToggleIncludeScreenshotFilter");
  v4[1] = CFSTR("PXCuratedLibraryActionToggleIncludeSharedWithYouFilter");
  v4[2] = CFSTR("PXCuratedLibraryActionToggleSharedLibraryBadge");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)viewOptionsMenuItems_viewOptionsShowActionTypes;
  viewOptionsMenuItems_viewOptionsShowActionTypes = v2;

}

void __65__PXCuratedLibraryShowFiltersMenuActionPerformer_filterMenuItems__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXCuratedLibraryActionUnfilter");
  v2[1] = CFSTR("PXCuratedLibraryActionToggleFavoriteFilter");
  v2[2] = CFSTR("PXCuratedLibraryActionToggleEditFilter");
  v2[3] = CFSTR("PXCuratedLibraryActionToggleImageFilter");
  v2[4] = CFSTR("PXCuratedLibraryActionToggleVideoFilter");
  v2[5] = CFSTR("PXCuratedLibraryActionToggleShowOnlyScreenshotFilter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)filterMenuItems_filterActionTypes;
  filterMenuItems_filterActionTypes = v0;

}

void __76__PXCuratedLibraryShowFiltersMenuActionPerformer_sharedLibraryModeMenuItems__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXCuratedLibraryActionSetAllLibrariesFilter");
  v2[1] = CFSTR("PXCuratedLibraryActionSetPersonalLibraryFilter");
  v2[2] = CFSTR("PXCuratedLibraryActionSetSharedLibraryFilter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedLibraryModeMenuItems_sharedLibraryModeActionTypes;
  sharedLibraryModeMenuItems_sharedLibraryModeActionTypes = v0;

}

@end

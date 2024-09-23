@implementation PXPhotosGridActionManager

- (PXPhotosGridActionManager)initWithViewModel:(id)a3
{
  id v4;
  PXPhotosGridActionManager *v5;
  PXPhotosGridActionManager *v6;
  uint64_t v7;
  NSDictionary *actionPerformersByType;
  uint64_t v9;
  NSMapTable *actionTypeByBarButtonItem;
  objc_super v12;
  _QWORD v13[27];
  _QWORD v14[28];

  v14[27] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosGridActionManager;
  v5 = -[PXPhotosGridActionManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewModel, v4);
    v13[0] = CFSTR("PXPhotosGridActionShare");
    v14[0] = objc_opt_class();
    v13[1] = CFSTR("PXPhotosGridActionSetAllLibrariesFilter");
    v14[1] = objc_opt_class();
    v13[2] = CFSTR("PXPhotosGridActionSetPersonalLibraryFilter");
    v14[2] = objc_opt_class();
    v13[3] = CFSTR("PXPhotosGridActionSetSharedLibraryFilter");
    v14[3] = objc_opt_class();
    v13[4] = CFSTR("PXPhotosGridActionToggleSharedLibraryBadge");
    v14[4] = objc_opt_class();
    v13[5] = CFSTR("PXPhotosGridActionShowFiltersMenu");
    v14[5] = objc_opt_class();
    v13[6] = CFSTR("PXPhotosPickerGridActionShowFiltersMenu");
    v14[6] = objc_opt_class();
    v13[7] = CFSTR("PXPhotosGridActionUnfilter");
    v14[7] = objc_opt_class();
    v13[8] = CFSTR("PXPhotosGridActionToggleFavoritesFilter");
    v14[8] = objc_opt_class();
    v13[9] = CFSTR("PXPhotosGridActionToggleEditedFilter");
    v14[9] = objc_opt_class();
    v13[10] = CFSTR("PXPhotosGridActionToggleImagesFilter");
    v14[10] = objc_opt_class();
    v13[11] = CFSTR("PXPhotosGridActionToggleVideosFilter");
    v14[11] = objc_opt_class();
    v13[12] = CFSTR("PXPhotosGridActionToggleShowOnlyScreenshotsFilter");
    v14[12] = objc_opt_class();
    v13[13] = CFSTR("PXPhotosGridActionToggleIncludeScreenshotsFilter");
    v14[13] = objc_opt_class();
    v13[14] = CFSTR("PXPhotosGridActionToggleLiveFilter");
    v14[14] = objc_opt_class();
    v13[15] = CFSTR("PXPhotosGridActionTogglePortraitFilter");
    v14[15] = objc_opt_class();
    v13[16] = CFSTR("PXPhotosGridActionShowFilters");
    v14[16] = objc_opt_class();
    v13[17] = CFSTR("PXPhotosGridActionToggleAspectFit");
    v14[17] = objc_opt_class();
    v13[18] = CFSTR("PXPhotosGridActionZoomIn");
    v14[18] = objc_opt_class();
    v13[19] = CFSTR("PXPhotosGridActionZoomOut");
    v14[19] = objc_opt_class();
    v13[20] = CFSTR("PXPhotosGridActionToggleFaceMode");
    v14[20] = objc_opt_class();
    v13[21] = CFSTR("PXPhotosGridActionShowMap");
    v14[21] = objc_opt_class();
    v13[22] = CFSTR("PXPhotosGridActionSearch");
    v14[22] = objc_opt_class();
    v13[23] = CFSTR("PXPhotosGridActionTogglePreviewHeader");
    v14[23] = objc_opt_class();
    v13[24] = CFSTR("PXPhotosGridActionAddPeople");
    v14[24] = objc_opt_class();
    v13[25] = CFSTR("PXPhotosGridActionManagePeople");
    v14[25] = objc_opt_class();
    v13[26] = CFSTR("PXPhotosGridActionToggleIncludeOthersInSocialGroupAssetsFilter");
    v14[26] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 27);
    v7 = objc_claimAutoreleasedReturnValue();
    actionPerformersByType = v6->_actionPerformersByType;
    v6->_actionPerformersByType = (NSDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    actionTypeByBarButtonItem = v6->_actionTypeByBarButtonItem;
    v6->_actionTypeByBarButtonItem = (NSMapTable *)v9;

  }
  return v6;
}

- (PXPhotosGridActionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridActionManager.m"), 202, CFSTR("%s is not available as initializer"), "-[PXPhotosGridActionManager init]");

  abort();
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PXPhotosGridActionManager viewModel](self, "viewModel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    if (!-[PXActionManager isActionTypeAllowed:](self, "isActionTypeAllowed:", v4))
      goto LABEL_7;
    objc_msgSend(v6, "currentLens");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowsActionType:", v4);

    if (!v9)
      goto LABEL_7;
    -[PXPhotosGridActionManager actionPerformersByType](self, "actionPerformersByType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", v4);

    if (v11)
      v7 = objc_msgSend(v11, "canPerformActionType:withViewModel:", v4, v6);
    else
LABEL_7:
      v7 = 0;
  }

  return v7;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[PXPhotosGridActionManager actionPerformersByType](self, "actionPerformersByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return v6 != 0;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[PXPhotosGridActionManager canPerformActionType:](self, "canPerformActionType:", v4))
  {
    -[PXPhotosGridActionManager actionPerformersByType](self, "actionPerformersByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc((Class)objc_msgSend(v5, "objectForKeyedSubscript:", v4));
    -[PXPhotosGridActionManager viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithViewModel:actionType:", v7, v4);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[PXPhotosGridActionManager actionPerformersByType](self, "actionPerformersByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc((Class)objc_msgSend(v7, "objectForKeyedSubscript:", v6));
  -[PXPhotosGridActionManager viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithViewModel:actionType:", v9, v6);

  objc_msgSend(v10, "localizedTitleForUseCase:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PXPhotosGridActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localizedTitleForUseCase:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "barButtonItemWithTarget:action:", self, sel__handleBarButtonItem_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 0, self, sel__handleBarButtonItem_);
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      objc_msgSend(v8, "setTitle:", v7);

    if (v8)
    {
      -[PXPhotosGridActionManager actionTypeByBarButtonItem](self, "actionTypeByBarButtonItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v4, v8);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_handleBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[PXPhotosGridActionManager actionTypeByBarButtonItem](self, "actionTypeByBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[PXPhotosGridActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performActionWithCompletionHandler:", 0);

  }
}

- (id)standardActionForActionType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosGridActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "menuElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)activityForActionType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosGridActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PXPhotosViewModel)viewModel
{
  return (PXPhotosViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (NSDictionary)actionPerformersByType
{
  return self->_actionPerformersByType;
}

- (NSMapTable)actionTypeByBarButtonItem
{
  return self->_actionTypeByBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTypeByBarButtonItem, 0);
  objc_storeStrong((id *)&self->_actionPerformersByType, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

+ (id)actionsWithActionPerformers
{
  if (actionsWithActionPerformers_onceToken_181705 != -1)
    dispatch_once(&actionsWithActionPerformers_onceToken_181705, &__block_literal_global_181706);
  return (id)actionsWithActionPerformers_actionsWithPerformers_181707;
}

void __56__PXPhotosGridActionManager_actionsWithActionPerformers__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[28];

  v4[27] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("PXPhotosGridActionShare");
  v4[1] = CFSTR("PXPhotosGridActionSetAllLibrariesFilter");
  v4[2] = CFSTR("PXPhotosGridActionSetPersonalLibraryFilter");
  v4[3] = CFSTR("PXPhotosGridActionSetSharedLibraryFilter");
  v4[4] = CFSTR("PXPhotosGridActionToggleSharedLibraryBadge");
  v4[5] = CFSTR("PXPhotosGridActionShowFiltersMenu");
  v4[6] = CFSTR("PXPhotosPickerGridActionShowFiltersMenu");
  v4[7] = CFSTR("PXPhotosGridActionUnfilter");
  v4[8] = CFSTR("PXPhotosGridActionToggleFavoritesFilter");
  v4[9] = CFSTR("PXPhotosGridActionToggleEditedFilter");
  v4[10] = CFSTR("PXPhotosGridActionToggleImagesFilter");
  v4[11] = CFSTR("PXPhotosGridActionToggleVideosFilter");
  v4[12] = CFSTR("PXPhotosGridActionToggleShowOnlyScreenshotsFilter");
  v4[13] = CFSTR("PXPhotosGridActionToggleIncludeScreenshotsFilter");
  v4[14] = CFSTR("PXPhotosGridActionToggleLiveFilter");
  v4[15] = CFSTR("PXPhotosGridActionTogglePortraitFilter");
  v4[16] = CFSTR("PXPhotosGridActionShowFilters");
  v4[17] = CFSTR("PXPhotosGridActionToggleAspectFit");
  v4[18] = CFSTR("PXPhotosGridActionZoomIn");
  v4[19] = CFSTR("PXPhotosGridActionZoomOut");
  v4[20] = CFSTR("PXPhotosGridActionToggleFaceMode");
  v4[21] = CFSTR("PXPhotosGridActionShowMap");
  v4[22] = CFSTR("PXPhotosGridActionSearch");
  v4[23] = CFSTR("PXPhotosGridActionTogglePreviewHeader");
  v4[24] = CFSTR("PXPhotosGridActionAddPeople");
  v4[25] = CFSTR("PXPhotosGridActionManagePeople");
  v4[26] = CFSTR("PXPhotosGridActionToggleIncludeOthersInSocialGroupAssetsFilter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 27);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)actionsWithActionPerformers_actionsWithPerformers_181707;
  actionsWithActionPerformers_actionsWithPerformers_181707 = v2;

}

@end

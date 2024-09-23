@implementation PXCuratedLibraryActionManager

- (id)showAllActionPerformerWithAssetCollectionReference:(id)a3
{
  id v4;
  PXCuratedLibraryShowAllActionPerformer *v5;
  void *v6;
  PXCuratedLibraryShowAllActionPerformer *v7;
  void *v8;

  v4 = a3;
  if (-[PXCuratedLibraryActionManager canPerformActionType:](self, "canPerformActionType:", CFSTR("PXCuratedLibraryActionShowAll")))
  {
    v5 = [PXCuratedLibraryShowAllActionPerformer alloc];
    -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXCuratedLibraryAssetCollectionActionPerformer initWithActionType:viewModel:assetCollectionReference:](v5, "initWithActionType:viewModel:assetCollectionReference:", CFSTR("PXCuratedLibraryActionShowAll"), v6, v4);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer setDelegate:](v7, "setDelegate:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a3;
  if (-[PXCuratedLibraryActionManager canPerformActionType:](self, "canPerformActionType:", v5))
  {
    -[PXCuratedLibraryActionManager actionPerformersByType](self, "actionPerformersByType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", v5);

    if (!v7)
    {
      -[PXCuratedLibraryActionManager assetCollectionActionPerformersByType](self, "assetCollectionActionPerformersByType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "objectForKeyedSubscript:", v5);

      if (!v16)
      {
        -[PXCuratedLibraryActionManager constructorSpecificActionPerformersByType](self, "constructorSpecificActionPerformersByType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "objectForKeyedSubscript:", v5);

        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 292, CFSTR("You must use the specific action performer constructor for %@ Action type."), v5);
        }
        else
        {
          +[PXCuratedLibraryActionManager actionsWithActionPerformers](PXCuratedLibraryActionManager, "actionsWithActionPerformers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", v5);

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if ((v20 & 1) != 0)
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 296, CFSTR("Unknown action type \"%@\"), v5);
          else
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 294, CFSTR("The %@ action isn't currently handled by a PXCuratedLibraryActionPerformer."), v5);
        }

        abort();
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 290, CFSTR("You must use the PXCuratedLibraryAssetCollectionActionPerformer constructor method for this type of action."));

      abort();
    }
    v8 = objc_msgSend(v7, "instancesRespondToSelector:", sel_initWithActionType_viewModel_);
    v9 = objc_alloc((Class)v7);
    v10 = v9;
    if (v8)
    {
      -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithActionType:viewModel:", v5, v11);

    }
    else
    {
      v12 = (void *)objc_msgSend(v9, "initWithActionType:", v5);
    }
    -[PXActionManager performerDelegate](self, "performerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)ellipsisButtonActionPerformerWithAssetCollectionReference:(id)a3
{
  id v4;
  PXCuratedLibraryEllipsisButtonActionPerformer *v5;
  void *v6;
  PXCuratedLibraryEllipsisButtonActionPerformer *v7;
  void *v8;

  v4 = a3;
  if (-[PXCuratedLibraryActionManager canPerformActionType:](self, "canPerformActionType:", CFSTR("PXCuratedLibraryActionEllipsisButton")))
  {
    v5 = [PXCuratedLibraryEllipsisButtonActionPerformer alloc];
    -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXCuratedLibraryEllipsisButtonActionPerformer initWithViewModel:assetCollectionReference:actionManager:](v5, "initWithViewModel:assetCollectionReference:actionManager:", v6, v4, self);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer setDelegate:](v7, "setDelegate:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowedActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return (PXCuratedLibraryViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (id)actionPerformerForActionType:(id)a3 withAssetCollectionReference:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  if (-[PXCuratedLibraryActionManager canPerformActionType:](self, "canPerformActionType:", v7))
  {
    -[PXCuratedLibraryActionManager assetCollectionActionPerformersByType](self, "assetCollectionActionPerformersByType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_msgSend(v9, "objectForKeyedSubscript:", v7);

    if (!v10)
    {
      -[PXCuratedLibraryActionManager actionPerformersByType](self, "actionPerformersByType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "objectForKeyedSubscript:", v7);

      if (!v17)
      {
        -[PXCuratedLibraryActionManager constructorSpecificActionPerformersByType](self, "constructorSpecificActionPerformersByType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "objectForKeyedSubscript:", v7);

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 313, CFSTR("You must use the specific action performer constructor for %@ Action type."), v7);
        }
        else
        {
          +[PXCuratedLibraryActionManager actionsWithActionPerformers](PXCuratedLibraryActionManager, "actionsWithActionPerformers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v7);

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if ((v21 & 1) != 0)
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 317, CFSTR("Unknown action type \"%@\"), v7);
          else
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 315, CFSTR("The %@ action isn't currently handled by a PXCuratedLibraryActionPerformer."), v7);
        }

        abort();
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 311, CFSTR("You must use the -[PXCuratedLibraryActionManager actionPerformerForActionType:] constructor method for this type of action."));

      abort();
    }
    v11 = [v10 alloc];
    -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithActionType:viewModel:assetCollectionReference:", v7, v12, v8);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v14);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSDictionary)actionPerformersByType
{
  return self->_actionPerformersByType;
}

- (PXCuratedLibraryActionManager)initWithViewModel:(id)a3
{
  id v4;
  PXCuratedLibraryActionManager *v5;
  PXCuratedLibraryActionManager *v6;
  uint64_t v7;
  NSDictionary *actionPerformersByType;
  uint64_t v9;
  NSDictionary *assetCollectionActionPerformersByType;
  uint64_t v11;
  NSDictionary *constructorSpecificActionPerformersByType;
  objc_super v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[23];
  _QWORD v20[24];

  v20[23] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryActionManager;
  v5 = -[PXCuratedLibraryActionManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewModel, v4);
    v19[0] = CFSTR("PXCuratedLibraryActionEnterSelectMode");
    v20[0] = objc_opt_class();
    v19[1] = CFSTR("PXCuratedLibraryActionCancelSelectMode");
    v20[1] = objc_opt_class();
    v19[2] = CFSTR("PXCuratedLibraryActionAllPhotosZoomIn");
    v20[2] = objc_opt_class();
    v19[3] = CFSTR("PXCuratedLibraryActionAllPhotosZoomOut");
    v20[3] = objc_opt_class();
    v19[4] = CFSTR("PXCuratedLibraryActionShowSidebar");
    v20[4] = objc_opt_class();
    v19[5] = CFSTR("PXCuratedLibraryActionSetAllLibrariesFilter");
    v20[5] = objc_opt_class();
    v19[6] = CFSTR("PXCuratedLibraryActionSetPersonalLibraryFilter");
    v20[6] = objc_opt_class();
    v19[7] = CFSTR("PXCuratedLibraryActionSetSharedLibraryFilter");
    v20[7] = objc_opt_class();
    v19[8] = CFSTR("PXCuratedLibraryActionToggleSharedLibraryBadge");
    v20[8] = objc_opt_class();
    v19[9] = CFSTR("PXCuratedLibraryActionShowFiltersMenu");
    v20[9] = objc_opt_class();
    v19[10] = CFSTR("PXCuratedLibraryActionShowFilters");
    v20[10] = objc_opt_class();
    v19[11] = CFSTR("PXCuratedLibraryActionUnfilter");
    v20[11] = objc_opt_class();
    v19[12] = CFSTR("PXCuratedLibraryActionToggleFavoriteFilter");
    v20[12] = objc_opt_class();
    v19[13] = CFSTR("PXCuratedLibraryActionToggleEditFilter");
    v20[13] = objc_opt_class();
    v19[14] = CFSTR("PXCuratedLibraryActionToggleImageFilter");
    v20[14] = objc_opt_class();
    v19[15] = CFSTR("PXCuratedLibraryActionToggleVideoFilter");
    v20[15] = objc_opt_class();
    v19[16] = CFSTR("PXCuratedLibraryActionToggleShowOnlyScreenshotFilter");
    v20[16] = objc_opt_class();
    v19[17] = CFSTR("PXCuratedLibraryActionToggleIncludeScreenshotFilter");
    v20[17] = objc_opt_class();
    v19[18] = CFSTR("PXCuratedLibraryActionToggleShowOnlySharedWithYouFilter");
    v20[18] = objc_opt_class();
    v19[19] = CFSTR("PXCuratedLibraryActionToggleIncludeSharedWithYouFilter");
    v20[19] = objc_opt_class();
    v19[20] = CFSTR("PXCuratedLibraryActionToggleLiveFilter");
    v20[20] = objc_opt_class();
    v19[21] = CFSTR("PXCuratedLibraryActionTogglePortraitFilter");
    v20[21] = objc_opt_class();
    v19[22] = CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit");
    v20[22] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 23);
    v7 = objc_claimAutoreleasedReturnValue();
    actionPerformersByType = v6->_actionPerformersByType;
    v6->_actionPerformersByType = (NSDictionary *)v7;

    v17[0] = CFSTR("PXCuratedLibraryActionSelectAllToggle");
    v18[0] = objc_opt_class();
    v17[1] = CFSTR("PXCuratedLibraryActionShowAll");
    v18[1] = objc_opt_class();
    v17[2] = CFSTR("PXCuratedLibraryActionShare");
    v18[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v9 = objc_claimAutoreleasedReturnValue();
    assetCollectionActionPerformersByType = v6->_assetCollectionActionPerformersByType;
    v6->_assetCollectionActionPerformersByType = (NSDictionary *)v9;

    v15[0] = CFSTR("PXCuratedLibraryActionEllipsisButton");
    v16[0] = objc_opt_class();
    v15[1] = CFSTR("PXCuratedLibraryActionTapToRadar");
    v16[1] = objc_opt_class();
    v15[2] = CFSTR("PXCuratedLibraryActionCurationDebug");
    v16[2] = objc_opt_class();
    v15[3] = CFSTR("PXCuratedLibraryActionNavigateToNextZoomLevel");
    v16[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
    v11 = objc_claimAutoreleasedReturnValue();
    constructorSpecificActionPerformersByType = v6->_constructorSpecificActionPerformersByType;
    v6->_constructorSpecificActionPerformersByType = (NSDictionary *)v11;

  }
  return v6;
}

- (PXCuratedLibraryActionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 211, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryActionManager init]");

  abort();
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PXCuratedLibraryActionTitle(v5, v7, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ellipsisButtonActionPerformerWithAssetCollectionReferenceProvider:(id)a3
{
  id v4;
  PXCuratedLibraryEllipsisButtonActionPerformer *v5;
  void *v6;
  PXCuratedLibraryEllipsisButtonActionPerformer *v7;
  void *v8;

  v4 = a3;
  if (-[PXCuratedLibraryActionManager canPerformActionType:](self, "canPerformActionType:", CFSTR("PXCuratedLibraryActionEllipsisButton")))
  {
    v5 = [PXCuratedLibraryEllipsisButtonActionPerformer alloc];
    -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXCuratedLibraryEllipsisButtonActionPerformer initWithViewModel:assetCollectionReferenceProvider:actionManager:](v5, "initWithViewModel:assetCollectionReferenceProvider:actionManager:", v6, v4, self);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer setDelegate:](v7, "setDelegate:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tapToRadarPerformerAssetCollectionReference:(id)a3 diagnosticLayout:(id)a4
{
  id v6;
  id v7;
  PXCuratedLibraryTapToRadarActionPerformer *v8;
  void *v9;
  PXCuratedLibraryTapToRadarActionPerformer *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[PXCuratedLibraryActionManager canPerformActionType:](self, "canPerformActionType:", CFSTR("PXCuratedLibraryActionTapToRadar")))
  {
    v8 = [PXCuratedLibraryTapToRadarActionPerformer alloc];
    -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXCuratedLibraryTapToRadarActionPerformer initWithViewModel:assetCollectionReference:diagnosticLayout:](v8, "initWithViewModel:assetCollectionReference:diagnosticLayout:", v9, v6, v7);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer setDelegate:](v10, "setDelegate:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)curationDebugPerformerAssetCollectionReference:(id)a3 diagnosticLayout:(id)a4
{
  id v6;
  id v7;
  PXCuratedLibraryCurationDebugActionPerformer *v8;
  void *v9;
  PXCuratedLibraryCurationDebugActionPerformer *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[PXCuratedLibraryActionManager canPerformActionType:](self, "canPerformActionType:", CFSTR("PXCuratedLibraryActionCurationDebug")))
  {
    v8 = [PXCuratedLibraryCurationDebugActionPerformer alloc];
    -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXCuratedLibraryCurationDebugActionPerformer initWithViewModel:assetCollectionReference:diagnosticLayout:](v8, "initWithViewModel:assetCollectionReference:diagnosticLayout:", v9, v6, v7);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer setDelegate:](v10, "setDelegate:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForHitTestResult:(id)a3
{
  id v4;
  _PXCuratedLibraryNavigateToNextZoomLevelActionPerformer *v5;
  void *v6;
  void *v7;
  void *v8;
  _PXCuratedLibraryNavigateToNextZoomLevelActionPerformer *v9;

  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "control") - 2) <= 2
    && -[PXCuratedLibraryActionManager canPerformActionType:](self, "canPerformActionType:", CFSTR("PXCuratedLibraryActionNavigateToNextZoomLevel")))
  {
    v5 = [_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer alloc];
    -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spriteReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer initWithActionType:viewModel:layout:hitSpriteReference:](v5, "initWithActionType:viewModel:layout:hitSpriteReference:", CFSTR("PXCuratedLibraryActionNavigateToNextZoomLevel"), v6, v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)actionPerformerForNavigatingToNextZoomLevelInLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PXCuratedLibraryHitTestResult *v14;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;

  v4 = a3;
  -[PXCuratedLibraryActionManager viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "zoomLevel");
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "firstSelectedIndexPath");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }

  if ((unint64_t)(v6 - 1) > 1 || (_QWORD)v17 == *(_QWORD *)off_1E50B7E98)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "currentDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend(v10, "assetCollectionReferenceAtSectionIndexPath:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "spriteReferenceForObjectReference:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == 1)
      v13 = 2;
    else
      v13 = 3;
    v14 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetCollectionReference:]([PXCuratedLibraryHitTestResult alloc], "initWithControl:spriteReference:layout:assetCollectionReference:", v13, v12, v4, v11);
    -[PXCuratedLibraryActionManager actionPerformerForHitTestResult:](self, "actionPerformerForHitTestResult:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSDictionary)assetCollectionActionPerformersByType
{
  return self->_assetCollectionActionPerformersByType;
}

- (NSDictionary)constructorSpecificActionPerformersByType
{
  return self->_constructorSpecificActionPerformersByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constructorSpecificActionPerformersByType, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionPerformersByType, 0);
  objc_storeStrong((id *)&self->_actionPerformersByType, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

+ (id)actionsWithActionPerformers
{
  if (actionsWithActionPerformers_onceToken != -1)
    dispatch_once(&actionsWithActionPerformers_onceToken, &__block_literal_global_95099);
  return (id)actionsWithActionPerformers_actionsWithPerformers;
}

void __60__PXCuratedLibraryActionManager_actionsWithActionPerformers__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[20];

  v4[19] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("PXCuratedLibraryActionEnterSelectMode");
  v4[1] = CFSTR("PXCuratedLibraryActionCancelSelectMode");
  v4[2] = CFSTR("PXCuratedLibraryActionAllPhotosZoomIn");
  v4[3] = CFSTR("PXCuratedLibraryActionAllPhotosZoomOut");
  v4[4] = CFSTR("PXCuratedLibraryActionSelectAllToggle");
  v4[5] = CFSTR("PXCuratedLibraryActionShowAll");
  v4[6] = CFSTR("PXCuratedLibraryActionSetAllLibrariesFilter");
  v4[7] = CFSTR("PXCuratedLibraryActionSetPersonalLibraryFilter");
  v4[8] = CFSTR("PXCuratedLibraryActionSetSharedLibraryFilter");
  v4[9] = CFSTR("PXCuratedLibraryActionToggleSharedLibraryBadge");
  v4[10] = CFSTR("PXCuratedLibraryActionEllipsisButton");
  v4[11] = CFSTR("PXCuratedLibraryActionShowFiltersMenu");
  v4[12] = CFSTR("PXCuratedLibraryActionShowFilters");
  v4[13] = CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit");
  v4[14] = CFSTR("PXCuratedLibraryActionShowMap");
  v4[15] = CFSTR("PXCuratedLibraryActionTapToRadar");
  v4[16] = CFSTR("PXCuratedLibraryActionCurationDebug");
  v4[17] = CFSTR("PXCuratedLibraryActionNavigateToNextZoomLevel");
  v4[18] = CFSTR("PXCuratedLibraryActionShare");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 19);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)actionsWithActionPerformers_actionsWithPerformers;
  actionsWithActionPerformers_actionsWithPerformers = v2;

}

@end

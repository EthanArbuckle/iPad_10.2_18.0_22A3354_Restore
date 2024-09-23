@implementation PXStoryViewLayout

- (PXStoryViewLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewLayout.m"), 126, CFSTR("%s is not available as initializer"), "-[PXStoryViewLayout init]");

  abort();
}

- (PXStoryViewLayout)initWithViewModel:(id)a3
{
  id v5;
  PXStoryViewLayout *v6;
  PXStoryViewLayout *v7;
  id *p_viewModel;
  void *v9;
  PXGLayout *v10;
  PXGLayout *gridPlaceholderLayout;
  __int128 v12;
  PXGLayout *v13;
  PXGLayout *mainStoryPlaceholderLayout;
  void *v15;
  char v16;
  int v17;
  __int16 v18;
  PXStoryViewLegibilityOverlayLayout *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  PXStoryScrubberLayout *v24;
  PXStoryScrubberLayout *scrubberLayout;
  PXStoryChromeLayout *v26;
  PXStoryChromeLayout *chromeLayout;
  PXStoryRelatedOverlayLayout *v28;
  PXStoryRelatedOverlayItemDecorationSource *v29;
  void *v30;
  uint64_t v31;
  PXStoryRelatedOverlayItemDecorationSource *relatedDecorationSource;
  PXGDecoratingLayout *v33;
  PXGLayout *relatedOverlayLayout;
  PXGDecoratingLayout *v35;
  void *v36;
  int v37;
  PXStoryDiagnosticHUDLayout *v38;
  uint64_t v39;
  uint64_t v41;
  objc_super v42;

  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PXStoryViewLayout;
  v6 = -[PXGAbsoluteCompositeLayout init](&v42, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_17;
  p_viewModel = (id *)&v6->_viewModel;
  objc_storeStrong((id *)&v6->_viewModel, a3);
  objc_msgSend(*p_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_219315);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGAbsoluteCompositeLayout setShouldUpdateSublayoutsInStrictOrder:](v7, "setShouldUpdateSublayoutsInStrictOrder:", 1);
  v10 = objc_alloc_init(PXGLayout);
  gridPlaceholderLayout = v7->_gridPlaceholderLayout;
  v7->_gridPlaceholderLayout = v10;

  v7->_gridLayoutIndex = -[PXGLayout addSublayout:](v7, "addSublayout:", v7->_gridPlaceholderLayout);
  v12 = *((_OWORD *)off_1E50B8368 + 1);
  *(_OWORD *)&v7->_presentedGridTransform.affineTransform.a = *(_OWORD *)off_1E50B8368;
  *(_OWORD *)&v7->_presentedGridTransform.affineTransform.c = v12;
  *(_OWORD *)&v7->_presentedGridTransform.affineTransform.tx = *((_OWORD *)off_1E50B8368 + 2);
  v7->_presentedGridTransform.tz = *((double *)off_1E50B8368 + 6);
  v13 = objc_alloc_init(PXGLayout);
  mainStoryPlaceholderLayout = v7->_mainStoryPlaceholderLayout;
  v7->_mainStoryPlaceholderLayout = v13;

  v7->_mainStoryLayoutIndex = -[PXGLayout addSublayout:](v7, "addSublayout:", v7->_mainStoryPlaceholderLayout);
  objc_msgSend(v5, "mainConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isPresentedForAirPlay");
  v17 = objc_msgSend(v15, "isExportPreview");
  v18 = objc_msgSend(v15, "options");
  v19 = -[PXStoryViewLegibilityOverlayLayout initWithViewModel:]([PXStoryViewLegibilityOverlayLayout alloc], "initWithViewModel:", *p_viewModel);
  v20 = -[PXGLayout addSublayout:](v7, "addSublayout:", v19);

  v41 = v20;
  if ((v16 & 1) != 0)
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "wantsScrubber") && v17 != 1 && (v18 & 0x400) == 0)
  {
    v24 = -[PXStoryScrubberLayout initWithViewModel:]([PXStoryScrubberLayout alloc], "initWithViewModel:", *p_viewModel);
    scrubberLayout = v7->_scrubberLayout;
    v7->_scrubberLayout = v24;

    v23 = -[PXGLayout addSublayout:](v7, "addSublayout:", v7->_scrubberLayout);
  }
  else
  {
    v23 = 0x7FFFFFFFFFFFFFFFLL;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v18 & 0x400) != 0)
      goto LABEL_10;
  }
  v26 = -[PXStoryChromeLayout initWithViewModel:]([PXStoryChromeLayout alloc], "initWithViewModel:", *p_viewModel);
  chromeLayout = v7->_chromeLayout;
  v7->_chromeLayout = v26;

  v22 = -[PXGLayout addSublayout:](v7, "addSublayout:", v7->_chromeLayout);
LABEL_10:
  if ((v17 & 1) != 0)
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v28 = -[PXStoryRelatedOverlayLayout initWithViewModel:]([PXStoryRelatedOverlayLayout alloc], "initWithViewModel:", *p_viewModel);
    v29 = [PXStoryRelatedOverlayItemDecorationSource alloc];
    -[PXStoryViewLayout viewModel](v7, "viewModel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PXStoryRelatedOverlayItemDecorationSource initWithViewModel:](v29, "initWithViewModel:", v30);
    relatedDecorationSource = v7->_relatedDecorationSource;
    v7->_relatedDecorationSource = (PXStoryRelatedOverlayItemDecorationSource *)v31;

    v33 = -[PXGDecoratingLayout initWithDecoratedLayout:]([PXGDecoratingLayout alloc], "initWithDecoratedLayout:", v28);
    -[PXGDecoratingLayout setActiveDecorations:](v33, "setActiveDecorations:", &unk_1E53EA800);
    -[PXGDecoratingLayout setContentSource:](v33, "setContentSource:", v7->_relatedDecorationSource);
    -[PXGDecoratingLayout setDecorationSource:](v33, "setDecorationSource:", v7->_relatedDecorationSource);
    -[PXStoryRelatedOverlayItemDecorationSource setDecoratedLayout:](v7->_relatedDecorationSource, "setDecoratedLayout:", v28);
    relatedOverlayLayout = v7->_relatedOverlayLayout;
    v7->_relatedOverlayLayout = &v33->super;
    v35 = v33;

    v21 = -[PXGLayout addSublayout:](v7, "addSublayout:", v35);
  }
LABEL_13:
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isHUDEnabled");

  if (v37)
  {
    v38 = -[PXStoryDiagnosticHUDLayout initWithDataSource:]([PXStoryDiagnosticHUDLayout alloc], "initWithDataSource:", *p_viewModel);
    v39 = -[PXGLayout addSublayout:](v7, "addSublayout:", v38);

  }
  else
  {
    v39 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v7->_chromeLayoutIndex = v22;
  v7->_relatedOverlayLayoutIndex = v21;
  v7->_scrubberLayoutIndex = v23;
  v7->_diagnosticHUDLayoutIndex = v39;
  v7->_legibilityOverlayLayoutIndex = v41;
  -[PXStoryViewLayout _invalidateMainModel](v7, "_invalidateMainModel");
  -[PXStoryViewLayout _invalidateMainStoryLayout](v7, "_invalidateMainStoryLayout");

LABEL_17:
  return v7;
}

- (void)visibleRectDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewLayout;
  -[PXGCompositeLayout visibleRectDidChange](&v6, sel_visibleRectDidChange);
  if (self->_isUpdatingSublayouts)
  {
    if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout visibleRectDidChange]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXStoryViewLayout.m"), 208, CFSTR("invalidating %lu after it already has been updated"), 2048);

      abort();
    }
    self->_postUpdateFlags.needsUpdate |= 0x800uLL;
  }
  else
  {
    -[PXStoryViewLayout _invalidateSublayoutFrames](self, "_invalidateSublayoutFrames");
    -[PXStoryViewLayout _invalidateSublayoutOrigins](self, "_invalidateSublayoutOrigins");
    -[PXStoryViewLayout viewModeTransitionsHelper](self, "viewModeTransitionsHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidatePresentingGeometry");

  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryViewLayout _invalidateContentSize](self, "_invalidateContentSize");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewLayout;
  -[PXGCompositeLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryViewLayout _invalidateSublayoutFrames](self, "_invalidateSublayoutFrames");
}

- (unint64_t)contentChangeTrend
{
  void *v2;
  unint64_t v3;

  -[PXStoryViewLayout mainStoryLayout](self, "mainStoryLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentChangeTrend");

  return v3;
}

- (int64_t)scrollableAxis
{
  return -[PXStoryViewLayout inGridViewMode](self, "inGridViewMode");
}

- (void)setMainModel:(id)a3
{
  PXStoryModel **p_mainModel;
  PXStoryModel *v6;
  char v7;
  void *v8;
  void *v9;
  PXPhotosContentController *gridContentController;
  PXStoryModel *v11;

  v11 = (PXStoryModel *)a3;
  p_mainModel = &self->_mainModel;
  v6 = self->_mainModel;
  if (v6 == v11)
  {

  }
  else
  {
    v7 = -[PXStoryModel isEqual:](v11, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryModel unregisterChangeObserver:context:](*p_mainModel, "unregisterChangeObserver:context:", self, MainModelObservationContext_219316);
      -[PXStoryModel recipeManager](*p_mainModel, "recipeManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unregisterChangeObserver:context:", self, RecipeManagerObservationContext_219317);

      objc_storeStrong((id *)&self->_mainModel, a3);
      -[PXStoryModel recipeManager](*p_mainModel, "recipeManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "registerChangeObserver:context:", self, RecipeManagerObservationContext_219317);

      -[PXStoryModel registerChangeObserver:context:](*p_mainModel, "registerChangeObserver:context:", self, MainModelObservationContext_219316);
      -[PXStoryViewLayout _invalidateMainStoryLayout](self, "_invalidateMainStoryLayout");
      -[PXStoryViewLayout _invalidateGridLayout](self, "_invalidateGridLayout");
      gridContentController = self->_gridContentController;
      self->_gridContentController = 0;

      -[PXStoryViewLayout _axMoveCursorToPlayer](self, "_axMoveCursorToPlayer");
    }
  }

}

- (void)setMainStoryLayout:(id)a3
{
  PXStoryLayout *v5;
  PXStoryLayout **p_mainStoryLayout;
  PXStoryLayout *mainStoryLayout;
  double v8;
  void *v9;
  PXStoryLayout *v10;

  v5 = (PXStoryLayout *)a3;
  p_mainStoryLayout = &self->_mainStoryLayout;
  mainStoryLayout = self->_mainStoryLayout;
  if (mainStoryLayout != v5)
  {
    v10 = v5;
    -[PXStoryLayout setAccessoryItemPlacementLayout:](mainStoryLayout, "setAccessoryItemPlacementLayout:", 0);
    objc_storeStrong((id *)&self->_mainStoryLayout, a3);
    -[PXStoryLayout setAccessoryItemPlacementLayout:](*p_mainStoryLayout, "setAccessoryItemPlacementLayout:", self);
    -[PXGLayout referenceDepth](self, "referenceDepth");
    -[PXStoryLayout setRelativeZPositionAboveLegibilityGradients:](*p_mainStoryLayout, "setRelativeZPositionAboveLegibilityGradients:", 0.2 / (0.1 / v8));
    -[PXGLayout removeSublayoutAtIndex:](self, "removeSublayoutAtIndex:", self->_mainStoryLayoutIndex);
    if (*p_mainStoryLayout)
    {
      -[PXGAbsoluteCompositeLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", *p_mainStoryLayout, self->_mainStoryLayoutIndex);
    }
    else
    {
      -[PXStoryViewLayout mainStoryPlaceholderLayout](self, "mainStoryPlaceholderLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGAbsoluteCompositeLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", v9, self->_mainStoryLayoutIndex);

    }
    -[PXStoryViewLayout _invalidateSublayoutFrames](self, "_invalidateSublayoutFrames");
    v5 = v10;
  }

}

- (void)setGridViewModeTransition:(id)a3
{
  PXStoryViewModeTransition *v5;
  PXStoryViewModeTransition *gridViewModeTransition;
  PXStoryViewModeTransition *v7;

  v5 = (PXStoryViewModeTransition *)a3;
  gridViewModeTransition = self->_gridViewModeTransition;
  if (gridViewModeTransition != v5)
  {
    v7 = v5;
    -[PXStoryViewModeTransition unregisterChangeObserver:context:](gridViewModeTransition, "unregisterChangeObserver:context:", self, GridViewModeTransitionObservationContext);
    objc_storeStrong((id *)&self->_gridViewModeTransition, a3);
    -[PXStoryViewModeTransition registerChangeObserver:context:](self->_gridViewModeTransition, "registerChangeObserver:context:", self, GridViewModeTransitionObservationContext);
    -[PXStoryViewLayout _invalidateGridTransform](self, "_invalidateGridTransform");
    v5 = v7;
  }

}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  int64_t gridLayoutIndex;
  id v5;
  id v6;

  gridLayoutIndex = self->_gridLayoutIndex;
  v5 = a3;
  -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", gridLayoutIndex, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v5);

}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  return 1;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7;
  int64_t gridLayoutIndex;
  id v9;

  v7 = a3;
  if (-[PXStoryViewLayout inGridViewMode](self, "inGridViewMode"))
    gridLayoutIndex = self->_gridLayoutIndex;
  else
    gridLayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
  v9 = objc_retainAutorelease(v7);

  *a5 = v9;
  return gridLayoutIndex;
}

- (void)didUpdateSublayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXStoryViewLayout;
  v4 = a3;
  -[PXGLayout didUpdateSublayout:](&v9, sel_didUpdateSublayout_, v4);
  -[PXStoryViewLayout gridContentController](self, "gridContentController", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    if (-[PXStoryViewLayout inGridViewMode](self, "inGridViewMode"))
      -[PXStoryViewLayout _updateContentSize](self, "_updateContentSize");
    -[PXStoryViewLayout viewModeTransitionsHelper](self, "viewModeTransitionsHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidatePresentingGeometry");

    -[PXStoryViewLayout viewModeTransitionsHelper](self, "viewModeTransitionsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateIfNeeded");

  }
}

- (id)createDefaultAnimationForCurrentContext
{
  void *v3;
  void *v4;
  objc_super v6;

  if (!-[PXStoryViewLayout inGridViewMode](self, "inGridViewMode"))
    return 0;
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModeTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewLayout;
  -[PXGLayout createDefaultAnimationForCurrentContext](&v6, sel_createDefaultAnimationForCurrentContext);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mainItemReference
{
  void *v2;
  void *v3;

  -[PXStoryViewLayout mainStoryLayout](self, "mainStoryLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXStoryViewLayout mainStoryLayout](self, "mainStoryLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemPlacementControllerForItemReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryViewLayout;
  -[PXGCompositeLayout willUpdate](&v7, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryViewLayout.m"), 338, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  _BOOL4 v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 isPerformingUpdate;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL isUpdatingSublayouts;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v3 = -[PXStoryViewLayout inGridViewMode](self, "inGridViewMode");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (v3)
  {
    isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("PXStoryViewLayout.m"), 344, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    needsUpdate |= 1uLL;
    p_updateFlags->needsUpdate = needsUpdate;
    self->_updateFlags.willPerformUpdate = 0;
    if (!isPerformingUpdate)
      goto LABEL_5;
    goto LABEL_53;
  }
  self->_updateFlags.willPerformUpdate = 0;
  if (!needsUpdate)
    goto LABEL_36;
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_53:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXStoryViewLayout.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.isPerformingUpdate = 1;
  self->_updateFlags.updated = 1;
  if ((needsUpdate & 1) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    -[PXStoryViewLayout _updateContentSize](self, "_updateContentSize");
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXStoryViewLayout.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
  }
  v7 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 0x40uLL;
  if ((v7 & 0x40) != 0)
  {
    p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFBFLL;
    -[PXStoryViewLayout _updateMainModel](self, "_updateMainModel");
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXStoryViewLayout.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v8 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((v8 & 2) != 0)
  {
    p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFFDLL;
    -[PXStoryViewLayout _updateMainStoryLayout](self, "_updateMainStoryLayout");
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXStoryViewLayout.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v9 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 4uLL;
  if ((v9 & 4) != 0)
  {
    p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFFBLL;
    -[PXStoryViewLayout _updateTransitionsHelper](self, "_updateTransitionsHelper");
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("PXStoryViewLayout.m"), 360, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v10 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 8uLL;
  if ((v10 & 8) != 0)
  {
    p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFF7;
    -[PXStoryViewLayout _updateGridLayout](self, "_updateGridLayout");
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PXStoryViewLayout.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v11 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 0x10uLL;
  if ((v11 & 0x10) != 0)
  {
    p_updateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFFEFLL;
    -[PXStoryViewLayout _updateSublayoutFrames](self, "_updateSublayoutFrames");
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PXStoryViewLayout.m"), 366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v12 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 0x20uLL;
  if ((v12 & 0x20) != 0)
  {
    p_updateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFFFDFLL;
    -[PXStoryViewLayout _updateSublayoutVisibility](self, "_updateSublayoutVisibility");
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXStoryViewLayout.m"), 369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v13 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 0x80uLL;
  if ((v13 & 0x80) != 0)
  {
    p_updateFlags->needsUpdate = v13 & 0xFFFFFFFFFFFFFF7FLL;
    -[PXStoryViewLayout _updateGridTransform](self, "_updateGridTransform");
    v13 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 0;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("PXStoryViewLayout.m"), 372, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

  }
LABEL_36:
  isUpdatingSublayouts = self->_isUpdatingSublayouts;
  self->_isUpdatingSublayouts = 1;
  v47.receiver = self;
  v47.super_class = (Class)PXStoryViewLayout;
  -[PXGCompositeLayout update](&v47, sel_update);
  self->_isUpdatingSublayouts = isUpdatingSublayouts;
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v16 = self->_postUpdateFlags.needsUpdate;
  if (v16)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("PXStoryViewLayout.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v16 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v16 & 0x400) != 0)
    {
      p_postUpdateFlags->needsUpdate = v16 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXStoryViewLayout _updateHiddenGridAssets](self, "_updateHiddenGridAssets");
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("PXStoryViewLayout.m"), 383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

      }
    }
    v17 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v17 & 0x800) != 0)
    {
      p_postUpdateFlags->needsUpdate = v17 & 0xFFFFFFFFFFFFF7FFLL;
      -[PXStoryViewLayout _updateSublayoutOrigins](self, "_updateSublayoutOrigins");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("PXStoryViewLayout.m"), 386, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v18 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000uLL;
    if ((v18 & 0x1000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v18 & 0xFFFFFFFFFFFFEFFFLL;
      -[PXStoryViewLayout _updateTransitionsHelperAfterSublayouts](self, "_updateTransitionsHelperAfterSublayouts");
      v18 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout update]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("PXStoryViewLayout.m"), 389, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryViewLayout;
  -[PXGCompositeLayout didUpdate](&v7, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryViewLayout.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateMainModel
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateMainModel]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 399, CFSTR("invalidating %lu after it already has been updated"), 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 64;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateMainModel
{
  void *v3;
  id v4;

  -[PXStoryViewLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewLayout setMainModel:](self, "setMainModel:", v3);

}

- (void)_invalidateMainStoryLayout
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateMainStoryLayout]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 407, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateMainStoryLayout
{
  void *v3;
  PXStoryLayout *v4;
  PXStoryViewModeTransitionsHelper *v5;
  void *v6;
  id v7;

  -[PXStoryViewLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PXStoryLayout initWithModel:]([PXStoryLayout alloc], "initWithModel:", v7);
  -[PXStoryViewLayout setMainStoryLayout:](self, "setMainStoryLayout:", v4);

  v5 = -[PXStoryViewModeTransitionsHelper initWithModel:]([PXStoryViewModeTransitionsHelper alloc], "initWithModel:", v7);
  -[PXStoryViewLayout setViewModeTransitionsHelper:](self, "setViewModeTransitionsHelper:", v5);

  -[PXStoryViewLayout viewModeTransitionsHelper](self, "viewModeTransitionsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)_invalidateGridLayout
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateGridLayout]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 418, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateGridLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PXPhotosContentController *gridContentController;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  PXPhotosContentController *v17;
  PXGLayout *v18;
  PXGLayout *gridPlaceholderLayout;
  uint64_t v20;
  id v21;
  PXPhotoKitAssetActionManager *v22;
  void *v23;
  void *v24;
  PXPhotoKitAssetActionManager *v25;
  void *v26;
  PXPhotosViewConfiguration *v27;
  void *v28;
  PXPhotosViewConfiguration *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  PXPhotosContentController *v36;
  void *v37;
  PXPhotosContentController *v38;
  PXPhotosContentController *v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  id v55;
  void *v56;
  unsigned int v57;
  PXPhotoKitAssetActionManager *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  PXStoryViewLayout *v66;
  _QWORD v67[5];
  _QWORD v68[10];

  v68[8] = *MEMORY[0x1E0C80C00];
  self->_isUpdatingGridLayout = 1;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModeTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "wantsGridLayout")
    && (-[PXStoryViewLayout inGridViewMode](self, "inGridViewMode")
     || objc_msgSend(v7, "hasSourceOrDestinationViewMode:", 2)))
  {
    v8 = v7;
    -[PXStoryViewLayout mainModel](self, "mainModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recipeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetsDataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    gridContentController = self->_gridContentController;
    if (gridContentController)
    {
      -[PXPhotosContentController viewModel](gridContentController, "viewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataSourceManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v11)
      {
        v16 = 0;
      }
      else
      {
        -[PXPhotosContentController viewModel](self->_gridContentController, "viewModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isInSelectMode");

        v17 = self->_gridContentController;
        self->_gridContentController = 0;

      }
      if (self->_gridContentController)
      {
LABEL_29:
        -[PXStoryViewLayout gridContentController](self, "gridContentController");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "layout");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v3, "swipeDownBehavior"))
        {
          objc_msgSend(v4, "swipeDownDismissalPreviewFraction");
          objc_msgSend(v48, "setAlpha:", 1.0 - v49);
        }
        -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", -[PXStoryViewLayout gridLayoutIndex](self, "gridLayoutIndex"), 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50 != v48)
        {
          -[PXGLayout removeSublayoutAtIndex:](self, "removeSublayoutAtIndex:", -[PXStoryViewLayout gridLayoutIndex](self, "gridLayoutIndex"));
          -[PXGAbsoluteCompositeLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", v48, -[PXStoryViewLayout gridLayoutIndex](self, "gridLayoutIndex"));
        }
        if (-[PXStoryViewLayout shouldScrollGridToPlaybackPosition](self, "shouldScrollGridToPlaybackPosition"))
        {
          v51 = v11;
          v52 = v7;
          -[PXStoryViewLayout mainModel](self, "mainModel");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 0;
          v54 = objc_msgSend(v53, "getMainVisibleClipIdentifier:assetReferece:", 0, &v62);
          v55 = v62;

          if (v54 && v55)
          {
            -[PXStoryViewLayout gridContentController](self, "gridContentController");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "scrollToRevealAssetReference:completionHandler:", v55, 0);

          }
          -[PXStoryViewLayout setShouldScrollGridToPlaybackPosition:](self, "setShouldScrollGridToPlaybackPosition:", 0);

          v7 = v52;
          v11 = v51;
        }

        goto LABEL_39;
      }
    }
    else
    {
      v16 = 0;
    }
    v57 = v16;
    v20 = objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v11);
    objc_opt_class();
    v61 = v7;
    v59 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v11;
      v22 = -[PXPhotoKitAssetActionManager initWithSelectionManager:]([PXPhotoKitAssetActionManager alloc], "initWithSelectionManager:", v20);
      -[PXPhotoKitAssetActionManager setDataSourceManager:](v22, "setDataSourceManager:", v21);
      v68[0] = CFSTR("PXAssetActionTypeShare");
      v68[1] = CFSTR("PXAssetActionTypeShowInLibrary");
      v68[2] = CFSTR("PXAssetActionTypeStoryMakeKeyPhoto");
      v68[3] = CFSTR("PXAssetActionTypeToggleFavorite");
      v68[4] = CFSTR("PXAssetActionTypeStoryRemoveAsset");
      v68[5] = CFSTR("PXAssetActionTypeUnifiedDestructive");
      v68[6] = CFSTR("PXAssetActionTypeInternalAssetDetails");
      v68[7] = CFSTR("PXAssetActionTypeInternalAssetSearchDetails");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionManager setAllowedActionTypes:](v22, "setAllowedActionTypes:", v24);

      v25 = v22;
      +[PXPhotoKitAssetCollectionActionManager actionManagerWithDataSourceManager:](PXPhotoKitAssetCollectionActionManager, "actionManagerWithDataSourceManager:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
      v25 = 0;
    }
    v27 = [PXPhotosViewConfiguration alloc];
    objc_msgSend(v4, "mediaProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)v20;
    v58 = v25;
    v29 = -[PXPhotosViewConfiguration initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:](v27, "initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:", v11, v28, v20, v25, v26);

    -[PXPhotosViewConfiguration setSectionBodyStyle:](v29, "setSectionBodyStyle:", 1);
    -[PXPhotosViewConfiguration setGridStyle:](v29, "setGridStyle:", 1);
    if (objc_msgSend(v3, "preferTopChromeItemsInAppNavigationBar"))
      v30 = 7;
    else
      v30 = 3;
    -[PXPhotosViewConfiguration setNavBarStyle:](v29, "setNavBarStyle:", v30);
    -[PXPhotosViewConfiguration setAllowsUserDefaults:](v29, "setAllowsUserDefaults:", 0);
    -[PXPhotosViewConfiguration setDelegate:](v29, "setDelegate:", self);
    objc_msgSend(v4, "viewLayoutSpec");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "browseGridAllowsDragGesture");

    v33 = 0;
    if ((_DWORD)v32)
      v33 = objc_msgSend(v3, "allowCustomUserAssets", 0);
    v34 = 65585;
    -[PXPhotosViewConfiguration setAllowsDragIn:](v29, "setAllowsDragIn:", v33);
    -[PXPhotosViewConfiguration setAllowsDragOut:](v29, "setAllowsDragOut:", v32);
    -[PXPhotosViewConfiguration setForbiddenBadges:](v29, "setForbiddenBadges:", 0);
    -[PXPhotosViewConfiguration setSelectionContextOverride:](v29, "setSelectionContextOverride:", 13);
    -[PXPhotosViewConfiguration setAllowsMultiSelectMenu:](v29, "setAllowsMultiSelectMenu:", 0);
    -[PXPhotosViewConfiguration setAlwaysIncludeSharedWithYouAssets:](v29, "setAlwaysIncludeSharedWithYouAssets:", 1);
    -[PXPhotosViewConfiguration setAllowedActions:](v29, "setAllowedActions:", 536903713);
    if (objc_msgSend(v3, "allowCustomUserAssets")
      && (objc_msgSend(v4, "allowedChromeItems") & 0x20000000) == 0)
    {
      objc_msgSend(v4, "viewLayoutSpec");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewConfiguration setPreferredUserInterfaceStyle:](v29, "setPreferredUserInterfaceStyle:", objc_msgSend(v35, "preferredUserInterfaceStyleForBrowseGridInlineAddButton"));

      v34 = 65587;
    }
    -[PXPhotosViewConfiguration setAllowedBehaviors:](v29, "setAllowedBehaviors:", v34);
    -[PXPhotosViewConfiguration setStartsInSelectMode:](v29, "setStartsInSelectMode:", v57);
    -[PXPhotosViewConfiguration setWantsAssetIndexBadge:](v29, "setWantsAssetIndexBadge:", 1);
    -[PXPhotosViewConfiguration setPreferredBackgroundStyle:](v29, "setPreferredBackgroundStyle:", 2);
    v36 = [PXPhotosContentController alloc];
    objc_msgSend(v4, "extendedTraitCollection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PXPhotosContentController initWithConfiguration:traitCollection:](v36, "initWithConfiguration:traitCollection:", v29, v37);
    v39 = self->_gridContentController;
    self->_gridContentController = v38;

    -[PXPhotosContentController setDelegate:](self->_gridContentController, "setDelegate:", self);
    -[PXPhotosContentController viewModel](self->_gridContentController, "viewModel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_opt_respondsToSelector();
    v43 = MEMORY[0x1E0C809B0];
    if ((v42 & 1) != 0)
    {
      v44 = v41;
      v45 = objc_msgSend(v44, "gridDecorationViewClass");
      if (v45)
      {
        v67[0] = v43;
        v67[1] = 3221225472;
        v67[2] = __38__PXStoryViewLayout__updateGridLayout__block_invoke;
        v67[3] = &__block_descriptor_40_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8lu32l8;
        v67[4] = v45;
        objc_msgSend(v40, "performChanges:", v67);
      }

    }
    v63[0] = v43;
    v63[1] = 3221225472;
    v63[2] = __38__PXStoryViewLayout__updateGridLayout__block_invoke_2;
    v63[3] = &unk_1E5137BB0;
    v64 = v40;
    v65 = v4;
    v66 = self;
    v46 = v40;
    objc_msgSend(v65, "performChanges:", v63);

    v7 = v61;
    v8 = v59;
    goto LABEL_29;
  }
  -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", self->_gridLayoutIndex, 0);
  v18 = (PXGLayout *)objc_claimAutoreleasedReturnValue();
  gridPlaceholderLayout = self->_gridPlaceholderLayout;

  if (v18 != gridPlaceholderLayout)
  {
    -[PXGLayout removeSublayoutAtIndex:](self, "removeSublayoutAtIndex:", self->_gridLayoutIndex);
    -[PXGAbsoluteCompositeLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", self->_gridPlaceholderLayout, self->_gridLayoutIndex);
  }
  v8 = 0;
LABEL_39:
  -[PXStoryViewLayout setGridViewModeTransition:](self, "setGridViewModeTransition:", v8);
  -[PXStoryViewLayout _invalidateSublayoutFrames](self, "_invalidateSublayoutFrames");
  self->_isUpdatingGridLayout = 0;

}

- (void)_invalidateSublayoutFrames
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateSublayoutFrames]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 558, CFSTR("invalidating %lu after it already has been updated"), 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 16;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateHeaderSpacing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[PXStoryViewLayout gridContentController](self, "gridContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXStoryViewLayout viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewLayoutSpec");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[PXStoryViewLayout gridContentController](self, "gridContentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "predictedBrowseChromeTextHeight");
    v8 = v7;
    objc_msgSend(v10, "distanceFromBottomChromeTextToGrid");
    objc_msgSend(v6, "setStatusBarHeight:", v8 + v9);
    objc_msgSend(v6, "setWantsHeaderInSafeArea:", 1);

  }
}

- (void)_updateSublayoutFrames
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  -[PXGLayout visibleRect](self, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryViewLayout mainStoryLayoutIndex](self, "mainStoryLayoutIndex"), v3, v5, v7, v9, 0.0, 0.1);
  v18 = v4;
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryViewLayout legibilityOverlayLayoutIndex](self, "legibilityOverlayLayoutIndex"), v4, v6, v8, v10, 0.1, 0.1);
  -[PXStoryViewLayout _scrubberFrame](self, "_scrubberFrame");
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryViewLayout scrubberLayoutIndex](self, "scrubberLayoutIndex"), v11, v12, v13, v14, 0.2, 0.1);
  if (-[PXStoryViewLayout gridLayoutIndex](self, "gridLayoutIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", -[PXStoryViewLayout gridLayoutIndex](self, "gridLayoutIndex"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentSize");
    v17 = v16;

    if (v17 < v10)
      v17 = v10;
    -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryViewLayout gridLayoutIndex](self, "gridLayoutIndex"), 0.0, 0.0, v8, v17, -0.5, 0.1);
  }
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryViewLayout chromeLayoutIndex](self, "chromeLayoutIndex"), v18, v6, v8, v10, 0.3, 0.1);
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryViewLayout relatedOverlayLayoutIndex](self, "relatedOverlayLayoutIndex"), v18, v6, v8, v10, 0.3, 0.1);
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryViewLayout diagnosticHUDLayoutIndex](self, "diagnosticHUDLayoutIndex"), v18, v6, v8, v10, 0.9, 0.1);
  -[PXStoryViewLayout _updateHeaderSpacing](self, "_updateHeaderSpacing");
}

- (void)_invalidateSublayoutVisibility
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateSublayoutVisibility]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 594, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSublayoutVisibility
{
  void *v3;
  int v4;
  id v5;

  -[PXStoryViewLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowedChromeItems");

  -[PXStoryViewLayout scrubberLayout](self, "scrubberLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsHidden:", (v4 & 0x4000000) == 0);

}

- (void)_invalidateGridTransform
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x80;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateGridTransform]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 603, CFSTR("invalidating %lu after it already has been updated"), 128);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 128;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateGridTransform
{
  int64_t v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  _OWORD v19[3];
  uint64_t v20;
  _OWORD v21[3];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v3 = -[PXStoryViewLayout gridLayoutIndex](self, "gridLayoutIndex");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "swipeDownBehavior");

    if (!v6)
    {
      v7 = *((_OWORD *)off_1E50B8368 + 1);
      v23 = *(_OWORD *)off_1E50B8368;
      v24 = v7;
      v25 = *((_OWORD *)off_1E50B8368 + 2);
      v26 = *((_QWORD *)off_1E50B8368 + 6);
      -[PXStoryViewLayout gridViewModeTransition](self, "gridViewModeTransition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "regionOfInterest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryViewLayout gridContentController](self, "gridContentController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 1.0;
      if (v8 && v9 && v11)
      {
        objc_msgSend(v11, "rootLayout");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "coordinateSpace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rectInCoordinateSpace:", v14);
        -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v13);

        PXSizeGetAspectRatio();
        objc_msgSend(v11, "visibleRect");
        -[PXGLayout referenceSize](self, "referenceSize");
        PXRectWithOriginAndSize();
        PXRectWithAspectRatioFittingRect();
        objc_msgSend(v8, "fractionCompleted");
        v16 = v15;
        if (objc_msgSend(v8, "destinationViewMode") == 2)
          v16 = 1.0 - v16;
        v18 = v16;
        PXRectByLinearlyInterpolatingRects();
        PXAffineTransformMakeFromRects();
        PXFloatByLinearlyInterpolatingFloats();
        v12 = v17;

      }
      v21[0] = v23;
      v21[1] = v24;
      v21[2] = v25;
      v22 = v26;
      -[PXGAbsoluteCompositeLayout setSpriteTransform:forSublayoutAtIndex:](self, "setSpriteTransform:forSublayoutAtIndex:", v21, v4, *(_QWORD *)&v18);
      objc_msgSend(v11, "setAlpha:", v12);
      v19[0] = v23;
      v19[1] = v24;
      v19[2] = v25;
      v20 = v26;
      -[PXStoryViewLayout setPresentedGridTransform:](self, "setPresentedGridTransform:", v19);

    }
  }
}

- (void)_invalidateTransitionsHelper
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateTransitionsHelper]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 637, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTransitionsHelper
{
  id v2;

  -[PXStoryViewLayout viewModeTransitionsHelper](self, "viewModeTransitionsHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateIfNeeded");

}

- (void)_invalidateTransitionsHelperAfterSublayouts
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x1000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x1000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateTransitionsHelperAfterSublayouts]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 645, CFSTR("invalidating %lu after it already has been updated"), 4096);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4096;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTransitionsHelperAfterSublayouts
{
  id v2;

  -[PXStoryViewLayout viewModeTransitionsHelper](self, "viewModeTransitionsHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateIfNeeded");

}

- (void)_invalidateHiddenGridAssets
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateHiddenGridAssets]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 653, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 1024;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateSublayoutOrigins
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateSublayoutOrigins]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 664, CFSTR("invalidating %lu after it already has been updated"), 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 2048;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSublayoutOrigins
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[9];

  -[PXGLayout visibleRect](self, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__PXStoryViewLayout__updateSublayoutOrigins__block_invoke;
  v12[3] = &unk_1E5137BD8;
  v12[4] = self;
  v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  objc_msgSend(v11, "enumerateSublayoutsUsingBlock:", v12);

}

- (void)_invalidateContentSize
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryViewLayout _invalidateContentSize]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryViewLayout.m"), 683, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (-[PXStoryViewLayout inGridViewMode](self, "inGridViewMode"))
  {
    -[PXStoryViewLayout gridContentController](self, "gridContentController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    v6 = v9;
    v8 = v10;
  }
  -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:", v6, v8);
}

- (CGRect)_scrubberFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat MinX;
  CGFloat Width;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  -[PXGLayout visibleRect](self, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewLayoutSpec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mainModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "infoPanelVisibilityFraction");
  objc_msgSend(v12, "infoPanelAnimationDistance");
  PXFloatByLinearlyInterpolatingFloats();
  v15 = v14;
  objc_msgSend(v13, "layoutSpec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scrubberCurrentAssetSize");
  v18 = v17;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  v19 = CGRectGetMaxY(v28) - v18;
  objc_msgSend(v16, "scrubberVerticalPadding");
  v21 = v15 + v19 - v20;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  MinX = CGRectGetMinX(v29);
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  Width = CGRectGetWidth(v30);

  v24 = MinX;
  v25 = v21;
  v26 = Width;
  v27 = v18;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)_setFrame:(CGRect)a3 relativeZPosition:(double)a4 depth:(double)a5 forSublayoutAtIndex:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;

  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[PXGLayout referenceDepth](self, "referenceDepth");
    v15 = v14;
    -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:", a6, x, y, width, height);
    -[PXGAbsoluteCompositeLayout setZPosition:forSublayoutAtIndex:](self, "setZPosition:forSublayoutAtIndex:", a6, -(a4 * v15));
    -[PXGAbsoluteCompositeLayout setReferenceDepth:forSublayoutAtIndex:](self, "setReferenceDepth:forSublayoutAtIndex:", a6, v15 * a5);
  }
}

- (BOOL)inGridViewMode
{
  void *v2;
  BOOL v3;

  -[PXStoryViewLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "viewMode") == 2;

  return v3;
}

- (id)transitionsHelper:(id)a3 timelineLayoutSnapshotForViewMode:(int64_t)a4
{
  id v7;
  PXStoryTimelineLayoutSnapshot *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  PXStoryTimelineLayoutSnapshot *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v27;
  _OWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v7 = a3;
  v8 = 0;
  switch(a4)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewLayout.m"), 736, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
    case 3:
    case 5:
      -[PXStoryViewLayout viewModel](self, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "timeline");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "currentSegmentIdentifier");
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
      if (v11)
        objc_msgSend(v11, "timeRangeForSegmentWithIdentifier:", v12);
      objc_msgSend(v11, "frameForSegmentWithIdentifier:", v12);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v21 = [PXStoryTimelineLayoutSnapshot alloc];
      v28[0] = v29;
      v28[1] = v30;
      v28[2] = v31;
      LODWORD(v22) = *(_DWORD *)off_1E50B8248;
      LODWORD(v23) = *((_DWORD *)off_1E50B8248 + 1);
      LODWORD(v24) = *((_DWORD *)off_1E50B8248 + 2);
      LODWORD(v25) = *((_DWORD *)off_1E50B8248 + 3);
      v8 = -[PXStoryTimelineLayoutSnapshot initWithTimeline:timelineRect:timeRange:clipCornerRadius:](v21, "initWithTimeline:timelineRect:timeRange:clipCornerRadius:", v11, v28, v14, v16, v18, v20, v22, v23, v24, v25);

      break;
    default:
      break;
  }

  return v8;
}

- (id)transitionsHelper:(id)a3 regionOfInterestForTransition:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  uint64_t v23;
  CGAffineTransform v25[2];
  uint64_t v26;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect v29;
  CGRect v30;

  v5 = a4;
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllerDismissalTargetPlacement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "swipeDownTriggeringDismissal") && v7)
  {
    objc_msgSend(v7, "regionOfInterest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsRepresentingPlaceholderContent:", 1);
  }
  else if (objc_msgSend(v5, "hasSourceOrDestinationViewMode:", 2))
  {
    objc_msgSend(v5, "assetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PXStoryViewLayout gridContentController](self, "gridContentController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetReference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "regionOfInterestForAssetReference:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0;
      memset(&v25[1], 0, sizeof(CGAffineTransform));
      -[PXStoryViewLayout presentedGridTransform](self, "presentedGridTransform");
      memset(&t1, 0, sizeof(t1));
      v12 = *((_OWORD *)off_1E50B8368 + 1);
      *(_OWORD *)&t2.a = *(_OWORD *)off_1E50B8368;
      *(_OWORD *)&t2.c = v12;
      *(_OWORD *)&t2.tx = *((_OWORD *)off_1E50B8368 + 2);
      if (!CGAffineTransformEqualToTransform(&t1, &t2) || *((double *)off_1E50B8368 + 6) != 0.0)
      {
        -[PXGLayout rootLayout](self, "rootLayout");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "coordinateSpace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "rectInCoordinateSpace:", v14);
        -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v13);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        t1 = v25[1];
        CGAffineTransformInvert(v25, &t1);
        v29.origin.x = v16;
        v29.origin.y = v18;
        v29.size.width = v20;
        v29.size.height = v22;
        v30 = CGRectApplyAffineTransform(v29, v25);
        objc_msgSend(v13, "convertRect:fromLayout:", self, v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
        v23 = objc_msgSend(v8, "copyWithRect:inCoordinateSpace:", v14);

        v8 = (void *)v23;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)photosViewController:(id)a3 didPickAssetReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  __int128 v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  char v31;
  __int128 v32;
  NSObject *v33;
  __int128 v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  _QWORD v47[5];
  _QWORD v48[6];
  _BYTE v49[48];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t v54[4];
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[32];
  __int128 v59;
  _BYTE buf[32];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXStoryViewLayout mainModel](self, "mainModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModeTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v8, "timeline");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourcesDataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v11 = objc_msgSend(v41, "indexForDisplayAssetReference:", v7);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "recipeManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recipe");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "untruncatedCuratedAssets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {

LABEL_11:
        PXAssertGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v7;
          _os_log_error_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "Unable to find resourceIndex for asset:%@. Player won't seek to tapped asset.", buf, 0xCu);
        }
LABEL_37:

        v24 = 0;
        goto LABEL_38;
      }
      objc_msgSend(v7, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "indexOfObject:", v15);

      objc_msgSend(v13, "curatedAssets");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 >= objc_msgSend(v17, "count"))
      {
        PLStoryGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_FAULT, "truncated asset picked, falling back to last available asset", buf, 2u);
        }

        v19 = objc_alloc((Class)off_1E50B1688);
        objc_msgSend(v17, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *((_OWORD *)off_1E50B8778 + 1);
        *(_OWORD *)buf = *(_OWORD *)off_1E50B8778;
        *(_OWORD *)&buf[16] = v21;
        v22 = (void *)objc_msgSend(v19, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v20, 0, buf);

        v11 = objc_msgSend(v41, "indexForDisplayAssetReference:", v22);
      }
      else
      {
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }

      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_11;
    }
    v24 = objc_msgSend(v40, "identifierOfFirstClipContainingResourceAtIndex:inResourcesDataSource:resourceKind:", v11, v41, 1);
    if (!v24)
    {
      objc_msgSend(v41, "keyAssetResource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "px_storyResourceDisplayAsset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "asset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v26;
      v29 = v27;
      if (v28 == v29)
      {

      }
      else
      {
        v30 = v29;
        v31 = objc_msgSend(v28, "isEqual:", v29);

        if ((v31 & 1) == 0)
        {
LABEL_35:
          PXAssertGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v7;
            _os_log_error_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "Unable to find clipIdentifier for resourceIndex:%ld asset:%@. Player won't seek to tapped asset.", buf, 0x16u);
          }
          goto LABEL_37;
        }
      }
      v24 = objc_msgSend(v40, "identifierOfFirstClipContainingResourceAtIndex:inResourcesDataSource:resourceKind:", -1, v41, 1);
      if (!v24)
      {
        v11 = -1;
        goto LABEL_35;
      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x5010000000;
    *(_QWORD *)&buf[24] = &unk_1A7E74EE7;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    if (v40)
      objc_msgSend(v40, "timeRange");
    else
      memset(v49, 0, sizeof(v49));
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke;
    v48[3] = &unk_1E5137C00;
    v48[4] = buf;
    v48[5] = v24;
    objc_msgSend(v40, "enumerateClipsInTimeRange:rect:usingBlock:", v49, v48, *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    if ((*(_BYTE *)(*(_QWORD *)&buf[8] + 44) & 1) == 0
      || (*(_DWORD *)(*(_QWORD *)&buf[8] + 68) & 1) == 0
      || *(_QWORD *)(*(_QWORD *)&buf[8] + 72)
      || (*(_QWORD *)(*(_QWORD *)&buf[8] + 56) & 0x8000000000000000) != 0)
    {
      PXAssertGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v58 = 134218242;
        *(_QWORD *)&v58[4] = v24;
        *(_WORD *)&v58[12] = 2112;
        *(_QWORD *)&v58[14] = v7;
        _os_log_error_impl(&dword_1A6789000, v33, OS_LOG_TYPE_ERROR, "Unable to find timeRange for clipIdentifier:%ld  asset:%@. Player won't seek to tapped asset.", v58, 0x16u);
      }
    }
    else
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_2;
      v47[3] = &unk_1E5144438;
      v47[4] = &v50;
      v32 = *(_OWORD *)(*(_QWORD *)&buf[8] + 48);
      *(_OWORD *)v58 = *(_OWORD *)(*(_QWORD *)&buf[8] + 32);
      *(_OWORD *)&v58[16] = v32;
      v59 = *(_OWORD *)(*(_QWORD *)&buf[8] + 64);
      objc_msgSend(v40, "enumerateSegmentsInTimeRange:usingBlock:", v58, v47);
      if (v51[3])
      {
LABEL_33:
        _Block_object_dispose(buf, 8);
LABEL_38:
        -[PXStoryViewLayout viewModel](self, "viewModel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "performChanges:", &__block_literal_global_219331);

        -[PXStoryViewLayout mainModel](self, "mainModel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_2_211;
        v42[3] = &unk_1E5137C48;
        v46 = v24;
        v43 = v7;
        v45 = &v50;
        v38 = v40;
        v44 = v38;
        objc_msgSend(v37, "performChanges:", v42);

        _Block_object_dispose(&v50, 8);
        goto LABEL_39;
      }
      PXAssertGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = *(_OWORD *)(*(_QWORD *)&buf[8] + 48);
        *(_OWORD *)v58 = *(_OWORD *)(*(_QWORD *)&buf[8] + 32);
        *(_OWORD *)&v58[16] = v34;
        v59 = *(_OWORD *)(*(_QWORD *)&buf[8] + 64);
        PXStoryTimeRangeDescription((uint64_t)v58);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v54 = 138412546;
        v55 = v35;
        v56 = 2112;
        v57 = v7;
        _os_log_error_impl(&dword_1A6789000, v33, OS_LOG_TYPE_ERROR, "Unable to find segmentIdentifier for timeRange:%@ asset:%@. Player won't seek to tapped asset.", v54, 0x16u);

      }
    }

    goto LABEL_33;
  }
LABEL_39:

  return 1;
}

- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory
{
  PXStoryMemoryAssetsActionFactory *v3;
  void *v4;
  PXStoryMemoryAssetsActionFactory *v5;

  v3 = [PXStoryMemoryAssetsActionFactory alloc];
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXStoryMemoryAssetsActionFactory initWithViewModel:](v3, "initWithViewModel:", v4);

  return (PXMemoryAssetsActionFactory *)v5;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXStoryViewLayout viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "presentViewController:animated:completion:", v5, 1, 0);

  return v7 != 0;
}

- (void)dismissPresentedViewControllerForContentController:(id)a3
{
  void *v3;
  id v4;

  -[PXStoryViewLayout viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v5, 1);

  }
  return v8 != 0;
}

- (id)presentingViewControllerForContentController:(id)a3
{
  void *v3;
  void *v4;

  -[PXStoryViewLayout viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIEdgeInsets)maskPaddingForContentController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *(double *)off_1E50B8020;
  v4 = *((double *)off_1E50B8020 + 1);
  v5 = *((double *)off_1E50B8020 + 2);
  v6 = *((double *)off_1E50B8020 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)undoManagerForContentController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXStoryViewLayout viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryViewLayout mainStoryLayout](self, "mainStoryLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v5);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  v9 = a3;
  if ((void *)ViewModelObservationContext_219315 == a5)
  {
    if ((a4 & 0x40) != 0)
    {
      -[PXStoryViewLayout _invalidateMainModel](self, "_invalidateMainModel");
      if ((a4 & 0x2000) == 0)
      {
LABEL_9:
        if ((a4 & 0x400000000) == 0)
          goto LABEL_17;
        goto LABEL_15;
      }
    }
    else if ((a4 & 0x2000) == 0)
    {
      goto LABEL_9;
    }
    -[PXStoryViewLayout setShouldScrollGridToPlaybackPosition:](self, "setShouldScrollGridToPlaybackPosition:", -[PXStoryViewLayout inGridViewMode](self, "inGridViewMode"));
    -[PXStoryViewLayout _invalidateGridLayout](self, "_invalidateGridLayout");
    -[PXStoryViewLayout _invalidateContentSize](self, "_invalidateContentSize");
    -[PXStoryViewLayout _invalidateSublayoutFrames](self, "_invalidateSublayoutFrames");
    -[PXGLayout setNeedsUpdateOfScrollableAxis](self, "setNeedsUpdateOfScrollableAxis");
    -[PXGLayout safeAreaInsetsDidChange](self, "safeAreaInsetsDidChange");
    if ((a4 & 0x400000000) == 0)
      goto LABEL_17;
LABEL_15:
    if (!self->_isUpdatingGridLayout)
    {
      -[PXStoryViewLayout _invalidateGridLayout](self, "_invalidateGridLayout");
      -[PXStoryViewLayout _invalidateHiddenGridAssets](self, "_invalidateHiddenGridAssets");
    }
LABEL_17:
    if ((a4 & 0x20) != 0)
      -[PXStoryViewLayout _invalidateSublayoutFrames](self, "_invalidateSublayoutFrames");
    if ((a4 & 0x3000000000) != 0)
    {
      -[PXStoryViewLayout viewModeTransitionsHelper](self, "viewModeTransitionsHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidatePresentingGeometry");

    }
    if ((a4 & 0x10000000000) != 0)
    {
      -[PXStoryViewLayout _invalidateGridLayout](self, "_invalidateGridLayout");
      if ((a4 & 0x8000) == 0)
      {
LABEL_23:
        if ((a4 & 0x40000000000) == 0)
          goto LABEL_30;
        goto LABEL_27;
      }
    }
    else if ((a4 & 0x8000) == 0)
    {
      goto LABEL_23;
    }
    -[PXStoryViewLayout _axMoveCursorToPlayer](self, "_axMoveCursorToPlayer");
    if ((a4 & 0x40000000000) == 0)
      goto LABEL_30;
LABEL_27:
    -[PXStoryViewLayout _invalidateSublayoutVisibility](self, "_invalidateSublayoutVisibility");
    goto LABEL_30;
  }
  if ((void *)MainModelObservationContext_219316 == a5)
  {
    if ((a4 & 0x800000000000000) != 0)
      -[PXStoryViewLayout _invalidateSublayoutFrames](self, "_invalidateSublayoutFrames");
  }
  else if ((void *)RecipeManagerObservationContext_219317 == a5)
  {
    if ((a4 & 0x10) != 0)
      -[PXStoryViewLayout _invalidateGridLayout](self, "_invalidateGridLayout");
  }
  else
  {
    if ((void *)GridViewModeTransitionObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewLayout.m"), 997, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__PXStoryViewLayout_observable_didChange_context___block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
LABEL_30:

}

- (id)preferredFocusLayouts
{
  id v3;
  id v4;
  void (**v5)(void *, void *);
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PXStoryViewLayout_preferredFocusLayouts__block_invoke;
  aBlock[3] = &unk_1E5137C70;
  v13 = v3;
  v4 = v3;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PXStoryViewLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wantsRelatedOverlayVisible");

  if (v7)
  {
    -[PXStoryViewLayout relatedOverlayLayout](self, "relatedOverlayLayout");
  }
  else
  {
    -[PXStoryViewLayout scrubberLayout](self, "scrubberLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v8);

    -[PXStoryViewLayout chromeLayout](self, "chromeLayout");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9);

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (id)axLocalizedLabel
{
  return PXLocalizedStringFromTable(CFSTR("InteractiveMemoryButtonAccessibilityLabelPlayer"), CFSTR("PhotosUICore"));
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryLayout)mainStoryLayout
{
  return self->_mainStoryLayout;
}

- (PXGLayout)mainStoryPlaceholderLayout
{
  return self->_mainStoryPlaceholderLayout;
}

- (PXGLayout)gridPlaceholderLayout
{
  return self->_gridPlaceholderLayout;
}

- (int64_t)mainStoryLayoutIndex
{
  return self->_mainStoryLayoutIndex;
}

- (int64_t)legibilityOverlayLayoutIndex
{
  return self->_legibilityOverlayLayoutIndex;
}

- (PXStoryChromeLayout)chromeLayout
{
  return self->_chromeLayout;
}

- (int64_t)chromeLayoutIndex
{
  return self->_chromeLayoutIndex;
}

- (PXStoryScrubberLayout)scrubberLayout
{
  return self->_scrubberLayout;
}

- (int64_t)scrubberLayoutIndex
{
  return self->_scrubberLayoutIndex;
}

- (PXGLayout)relatedOverlayLayout
{
  return self->_relatedOverlayLayout;
}

- (int64_t)relatedOverlayLayoutIndex
{
  return self->_relatedOverlayLayoutIndex;
}

- (int64_t)gridLayoutIndex
{
  return self->_gridLayoutIndex;
}

- (int64_t)diagnosticHUDLayoutIndex
{
  return self->_diagnosticHUDLayoutIndex;
}

- (PXPhotosContentController)gridContentController
{
  return self->_gridContentController;
}

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)presentedGridTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[22].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[21].var0.ty;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[22].var0.c;
  retstr->var1 = self[22].var0.tx;
  return self;
}

- (void)setPresentedGridTransform:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)&a3->var0.c;
  v3 = *(_OWORD *)&a3->var0.tx;
  v5 = *(_OWORD *)&a3->var0.a;
  self->_presentedGridTransform.tz = a3->var1;
  *(_OWORD *)&self->_presentedGridTransform.affineTransform.c = v4;
  *(_OWORD *)&self->_presentedGridTransform.affineTransform.tx = v3;
  *(_OWORD *)&self->_presentedGridTransform.affineTransform.a = v5;
}

- (BOOL)shouldScrollGridToPlaybackPosition
{
  return self->_shouldScrollGridToPlaybackPosition;
}

- (void)setShouldScrollGridToPlaybackPosition:(BOOL)a3
{
  self->_shouldScrollGridToPlaybackPosition = a3;
}

- (PXStoryViewModeTransitionsHelper)viewModeTransitionsHelper
{
  return self->_viewModeTransitionsHelper;
}

- (void)setViewModeTransitionsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_viewModeTransitionsHelper, a3);
}

- (PXStoryViewModeTransition)gridViewModeTransition
{
  return self->_gridViewModeTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridViewModeTransition, 0);
  objc_storeStrong((id *)&self->_viewModeTransitionsHelper, 0);
  objc_storeStrong((id *)&self->_gridContentController, 0);
  objc_storeStrong((id *)&self->_relatedOverlayLayout, 0);
  objc_storeStrong((id *)&self->_scrubberLayout, 0);
  objc_storeStrong((id *)&self->_chromeLayout, 0);
  objc_storeStrong((id *)&self->_gridPlaceholderLayout, 0);
  objc_storeStrong((id *)&self->_mainStoryPlaceholderLayout, 0);
  objc_storeStrong((id *)&self->_mainStoryLayout, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_relatedDecorationSource, 0);
}

uint64_t __42__PXStoryViewLayout_preferredFocusLayouts__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __50__PXStoryViewLayout_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateGridTransform");
}

uint64_t __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke(uint64_t result, uint64_t a2, __int128 *a3, uint64_t a4, _QWORD *a5, _BYTE *a6)
{
  _OWORD *v6;
  __int128 v7;
  __int128 v8;

  if (a2 >= 1)
  {
    do
    {
      if (*a5 == *(_QWORD *)(result + 40))
      {
        v6 = *(_OWORD **)(*(_QWORD *)(result + 32) + 8);
        v7 = *a3;
        v8 = a3[2];
        v6[3] = a3[1];
        v6[4] = v8;
        v6[2] = v7;
        *a6 = 1;
      }
      a5 += 96;
      a3 += 3;
      --a2;
    }
    while (a2);
  }
  return result;
}

uint64_t __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4, _BYTE *a5)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *a4;
  *a5 = 1;
  return result;
}

void __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_2_211(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setViewMode:", 1);
  objc_msgSend(v4, "setLastHitClipIdentifier:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setLastHitAssetReference:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v3)
  {
    if (v3 == objc_msgSend(*(id *)(a1 + 40), "firstSegmentIdentifier"))
      objc_msgSend(v4, "restartPlaybackFromBeginning");
    else
      objc_msgSend(v4, "skipToBeginningOfSegmentWithIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }

}

uint64_t __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_210(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAllGridItems");
}

void __44__PXStoryViewLayout__updateSublayoutOrigins__block_invoke(double *a1, uint64_t a2, void *a3)
{
  _QWORD *v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  v5 = (_QWORD *)*((_QWORD *)a1 + 4);
  if (v5[147] == a2)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else if (v5[144] == a2)
  {
    objc_msgSend(v5, "_scrubberFrame");
    v5 = (_QWORD *)*((_QWORD *)a1 + 4);
  }
  else
  {
    v6 = a1[5];
    v7 = a1[6];
  }
  objc_msgSend(v5, "setOrigin:forSublayoutAtIndex:", a2, v6, v7);

}

void __38__PXStoryViewLayout__updateGridLayout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDecorationViewClass:", v2);
  objc_msgSend(v3, "setViewBasedDecorationsEnabled:", 1);

}

void __38__PXStoryViewLayout__updateGridLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "setPhotosGridViewModel:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1192), "interaction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setPhotosGridViewInteraction:", v3);

}

@end

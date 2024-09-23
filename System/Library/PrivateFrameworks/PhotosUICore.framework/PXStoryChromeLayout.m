@implementation PXStoryChromeLayout

- (PXStoryChromeLayout)initWithViewModel:(id)a3
{
  id v5;
  PXStoryChromeLayout *v6;
  PXStoryChromeLayout *v7;
  id *p_viewModel;
  NSMutableDictionary *v9;
  NSMutableDictionary *itemControllers;
  PXStoryStyleChromeContainerLayout *v11;
  uint64_t v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryChromeLayout;
  v6 = -[PXGAbsoluteCompositeLayout init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    p_viewModel = (id *)&v6->_viewModel;
    objc_storeStrong((id *)&v6->_viewModel, a3);
    objc_msgSend(*p_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_114007);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemControllers = v7->_itemControllers;
    v7->_itemControllers = v9;

    v7->_closeButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 1);
    v7->_closeBrowserButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x20000);
    v7->_playButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 4);
    v7->_replayButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 32);
    v7->_errorIndicatorSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x10000);
    v7->_muteToggleButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x1000000);
    v7->_actionMenuButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 2);
    v7->_shareButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 64);
    v7->_browserGridButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 128);
    v7->_browserAddPhotosButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x20000000);
    v7->_fullsizePlayerButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 256);
    v7->_aspectModeButtonIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x4000);
    v7->_bufferingIndicatorSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x8000);
    v7->_toggleFavoriteButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x400000);
    v7->_playbackEndReplayButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x40000);
    v7->_playbackEndShareButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x80000);
    v7->_playbackEndFavoriteButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x100000);
    v7->_playbackEndUnfavoriteButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x200000);
    v7->_provideFeedbackButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 0x2000000);
    v7->_titleSpriteIndex = -[PXStoryChromeLayout _addLabelForChromeItem:](v7, "_addLabelForChromeItem:", 1024);
    v7->_subtitleSpriteIndex = -[PXStoryChromeLayout _addLabelForChromeItem:](v7, "_addLabelForChromeItem:", 1024);
    v7->_styleSwitcherButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 512);
    v7->_editMusicButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 8);
    v7->_editColorGradeButtonSpriteIndex = -[PXStoryChromeLayout _addButtonForChromeItem:](v7, "_addButtonForChromeItem:", 16);
    v7->_leftEdgeHighlightSpriteIndex = -[PXStoryChromeLayout _addEdgeHighlightForChromeItem:](v7, "_addEdgeHighlightForChromeItem:", 4096);
    v7->_rightEdgeHighlightSpriteIndex = -[PXStoryChromeLayout _addEdgeHighlightForChromeItem:](v7, "_addEdgeHighlightForChromeItem:", 0x2000);
    v7->_chromeButtonFocusGuideSpriteIndex = -1;
    v7->_infoPanelSpriteIndex = -1;
    v7->_styleChromeSublayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v11 = (PXStoryStyleChromeContainerLayout *)objc_claimAutoreleasedReturnValue();
    if (-[PXStoryStyleChromeContainerLayout showStyleSwitcher](v11, "showStyleSwitcher"))
    {
      v12 = objc_msgSend(v5, "viewMode");

      if (v12 == 5)
      {
LABEL_6:
        -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
        -[PXStoryChromeLayout _invalidateMainModel](v7, "_invalidateMainModel");
        -[PXStoryChromeLayout _invalidateContentAlpha](v7, "_invalidateContentAlpha");
        goto LABEL_7;
      }
      v11 = -[PXStoryStyleChromeContainerLayout initWithViewModel:]([PXStoryStyleChromeContainerLayout alloc], "initWithViewModel:", *p_viewModel);
      v7->_styleChromeSublayoutIndex = -[PXGLayout addSublayout:](v7, "addSublayout:", v11);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (unsigned)_addButtonForChromeItem:(unint64_t)a3
{
  PXStoryChromeLayoutItemController *v5;
  void *v6;
  PXStoryChromeLayoutItemController *v7;

  v5 = [PXStoryChromeLayoutItemController alloc];
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryChromeLayoutItemController initWithViewModel:chromeItem:](v5, "initWithViewModel:chromeItem:", v6, a3);

  LODWORD(self) = -[PXStoryChromeLayout _addSpriteForChromeItemController:mediaKind:presentationType:](self, "_addSpriteForChromeItemController:mediaKind:presentationType:", v7, 10, 1);
  return self;
}

- (unsigned)_addLabelForChromeItem:(unint64_t)a3
{
  PXStoryChromeLayoutItemController *v5;
  void *v6;
  PXStoryChromeLayoutItemController *v7;

  v5 = [PXStoryChromeLayoutItemController alloc];
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryChromeLayoutItemController initWithViewModel:chromeItem:](v5, "initWithViewModel:chromeItem:", v6, a3);

  LODWORD(self) = -[PXStoryChromeLayout _addSpriteForChromeItemController:mediaKind:presentationType:](self, "_addSpriteForChromeItemController:mediaKind:presentationType:", v7, 3, 0);
  return self;
}

- (unsigned)_addEdgeHighlightForChromeItem:(unint64_t)a3
{
  PXStoryChromeLayoutEdgeHighlightController *v5;
  void *v6;
  PXStoryChromeLayoutEdgeHighlightController *v7;

  v5 = [PXStoryChromeLayoutEdgeHighlightController alloc];
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryChromeLayoutItemController initWithViewModel:chromeItem:](v5, "initWithViewModel:chromeItem:", v6, a3);

  LODWORD(self) = -[PXStoryChromeLayout _addSpriteForChromeItemController:mediaKind:presentationType:](self, "_addSpriteForChromeItemController:mediaKind:presentationType:", v7, 1, 0);
  return self;
}

- (unsigned)_addSpriteForChromeItemController:(id)a3 mediaKind:(unsigned __int8)a4 presentationType:(unsigned __int8)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  unsigned __int8 v12;
  unsigned __int8 v13;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__PXStoryChromeLayout__addSpriteForChromeItemController_mediaKind_presentationType___block_invoke;
  v11[3] = &__block_descriptor_34_e55_v56__0__PXGSpriteIndexRange_II_8___I_________________16l;
  v12 = a4;
  v13 = a5;
  v6 = a3;
  v7 = -[PXGLayout addSpriteWithInitialState:](self, "addSpriteWithInitialState:", v11);
  objc_msgSend(v6, "registerChangeObserver:context:", self, ItemControllerObservationContext);
  -[PXStoryChromeLayout itemControllers](self, "itemControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  return v7;
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  void *v2;
  void *v3;

  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXStoryViewLayoutSpec *)v3;
}

- (id)mainLayoutSpec
{
  void *v2;
  void *v3;

  -[PXStoryChromeLayout mainModel](self, "mainModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PXStoryRelatedLayoutGenerator)layoutGenerator
{
  PXStoryRelatedLayoutGenerator *layoutGenerator;
  PXStoryRelatedLayoutGenerator *v4;
  void *v5;
  void *v6;
  void *v7;
  PXStoryRelatedLayoutGenerator *v8;
  PXStoryRelatedLayoutGenerator *v9;
  void *v10;
  void *v11;
  void *v12;

  layoutGenerator = self->_layoutGenerator;
  if (!layoutGenerator)
  {
    v4 = [PXStoryRelatedLayoutGenerator alloc];
    -[PXStoryChromeLayout viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewLayoutSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relatedLayoutMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXStoryRelatedLayoutGenerator initWithMetrics:](v4, "initWithMetrics:", v7);
    v9 = self->_layoutGenerator;
    self->_layoutGenerator = v8;

    -[PXStoryRelatedLayoutGenerator setItemCount:](self->_layoutGenerator, "setItemCount:", 1);
    -[PXStoryChromeLayout viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewLayoutSpec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relatedLayoutMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRelatedLayoutGenerator setMetrics:](self->_layoutGenerator, "setMetrics:", v12);

    layoutGenerator = self->_layoutGenerator;
  }
  return layoutGenerator;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryChromeLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryChromeLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryChromeLayout;
  -[PXGCompositeLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryChromeLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryChromeLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryChromeLayout _invalidateContentAlpha](self, "_invalidateContentAlpha");
}

- (void)setMainModel:(id)a3
{
  PXStoryModel **p_mainModel;
  PXStoryModel *v6;
  char v7;
  void *v8;
  void *v9;
  PXStoryModel *v10;

  v10 = (PXStoryModel *)a3;
  p_mainModel = &self->_mainModel;
  v6 = self->_mainModel;
  if (v6 == v10)
  {

  }
  else
  {
    v7 = -[PXStoryModel isEqual:](v10, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryModel unregisterChangeObserver:context:](*p_mainModel, "unregisterChangeObserver:context:", self, MainModelObservationContext_114008);
      objc_storeStrong((id *)&self->_mainModel, a3);
      -[PXStoryModel registerChangeObserver:context:](*p_mainModel, "registerChangeObserver:context:", self, MainModelObservationContext_114008);
      -[PXStoryChromeLayout mainModel](self, "mainModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recipeManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeLayout setRecipeManager:](self, "setRecipeManager:", v9);

      -[PXStoryChromeLayout _invalidateActionMenu](self, "_invalidateActionMenu");
    }
  }

}

- (void)setRecipeManager:(id)a3
{
  PXStoryRecipeManager *v5;
  PXStoryRecipeManager *recipeManager;
  PXStoryRecipeManager *v7;

  v5 = (PXStoryRecipeManager *)a3;
  recipeManager = self->_recipeManager;
  if (recipeManager != v5)
  {
    v7 = v5;
    -[PXStoryRecipeManager unregisterChangeObserver:context:](recipeManager, "unregisterChangeObserver:context:", self, RecipeManagerObservationContext);
    objc_storeStrong((id *)&self->_recipeManager, a3);
    -[PXStoryRecipeManager registerChangeObserver:context:](self->_recipeManager, "registerChangeObserver:context:", self, RecipeManagerObservationContext);
    -[PXStoryChromeLayout _invalidateActionMenu](self, "_invalidateActionMenu");
    v5 = v7;
  }

}

- (void)setAlphaOverride:(id)a3
{
  NSNumber *v5;
  char v6;
  NSNumber *v7;

  v7 = (NSNumber *)a3;
  v5 = self->_alphaOverride;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSNumber isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alphaOverride, a3);
      -[PXStoryChromeLayout _invalidateContentAlpha](self, "_invalidateContentAlpha");
    }
  }

}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryChromeLayout;
  -[PXGCompositeLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryChromeLayout.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
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
  objc_super v18;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXStoryChromeLayout.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 4;
    if ((needsUpdate & 4) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryChromeLayout _updateMainModel](self, "_updateMainModel");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout update]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXStoryChromeLayout.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if ((v5 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryChromeLayout _updateContentLayout](self, "_updateContentLayout");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXStoryChromeLayout.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryChromeLayout _updateContentAlpha](self, "_updateContentAlpha");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXStoryChromeLayout.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryChromeLayout _updateAXGroupRole](self, "_updateAXGroupRole");
      v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXStoryChromeLayout.m"), 317, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXStoryChromeLayout;
  -[PXGCompositeLayout update](&v18, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryChromeLayout;
  -[PXGCompositeLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryChromeLayout.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

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
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout _invalidateMainModel]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryChromeLayout.m"), 327, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)_updateMainModel
{
  void *v3;
  id v4;

  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeLayout setMainModel:](self, "setMainModel:", v3);

}

- (void)_invalidateContent
{
  ++self->_contentVersion;
  -[PXStoryChromeLayout _invalidateContentLayout](self, "_invalidateContentLayout");
}

- (void)_invalidateActionMenu
{
  void *v3;
  int v4;

  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isActionMenuOpen");

  if (v4)
  {
    self->_shouldInvalidateActionMenuOnClose = 1;
  }
  else
  {
    ++self->_actionMenuButtonVersion;
    -[PXStoryChromeLayout _invalidateContentLayout](self, "_invalidateContentLayout");
  }
}

- (void)_invalidateContentLayout
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout _invalidateContentLayout]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryChromeLayout.m"), 349, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateContentLayout
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[PXStoryChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "shouldUseUnifiedButtonLayout");
  -[PXGLayout referenceSize](self, "referenceSize");
  v5 = v4;
  v7 = v6;
  PXRectWithOriginAndSize();
  if (self->_styleChromeSublayoutIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:");
  -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:", v5, v7);
  if (v3)
    -[PXStoryChromeLayout _configureUnifiedContentLayout:](self, "_configureUnifiedContentLayout:", v8);
  else
    -[PXStoryChromeLayout _configureDefaultContentLayout:](self, "_configureDefaultContentLayout:", v8);

}

- (void)_configureDefaultContentLayout:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  double v45;
  uint64_t v46;
  CGFloat v47;
  CGFloat rect;
  _QWORD v49[4];
  id v50;
  PXStoryChromeLayout *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  SEL v63;
  uint64_t v64;
  _QWORD v65[4];
  id v66;
  _QWORD *v67;
  _QWORD v68[4];
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  _QWORD *v73;
  _QWORD v74[4];
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  _QWORD *v79;
  _QWORD v80[4];
  __int128 v81;
  __int128 v82;
  _QWORD aBlock[4];
  id v84;
  _QWORD *v85;
  _QWORD v86[4];
  __int128 v87;
  __int128 v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v5 = a3;
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout referenceSize](self, "referenceSize");
  v47 = v7;
  rect = v8;
  -[PXGLayout displayScale](self, "displayScale");
  v46 = v9;
  objc_msgSend(v5, "chromeButtonSize");
  objc_msgSend(v5, "chromeButtonPadding");
  v11 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v45 = v12;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x4010000000;
  v86[3] = &unk_1A7E74EE7;
  v87 = 0u;
  v88 = 0u;
  PXRectWithSizeAlignedToRectEdgesWithPadding();
  *(_QWORD *)&v87 = v13;
  *((_QWORD *)&v87 + 1) = v14;
  v15 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v88 = v16;
  *((_QWORD *)&v88 + 1) = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke;
  aBlock[3] = &unk_1E5128020;
  v85 = v86;
  v18 = v5;
  v84 = v18;
  v19 = _Block_copy(aBlock);
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x4010000000;
  v80[3] = &unk_1A7E74EE7;
  v81 = 0u;
  v82 = 0u;
  PXRectWithSizeAlignedToRectEdgesWithPadding();
  *(_QWORD *)&v81 = v20;
  *((_QWORD *)&v81 + 1) = v21;
  *(_QWORD *)&v82 = v22;
  *((_QWORD *)&v82 + 1) = v23;
  v77[0] = v15;
  v77[1] = 3221225472;
  v77[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_2;
  v77[3] = &unk_1E5128048;
  v79 = v80;
  v24 = v18;
  v78 = v24;
  v25 = _Block_copy(v77);
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x4010000000;
  v74[3] = &unk_1A7E74EE7;
  v75 = 0u;
  v76 = 0u;
  v89.origin.x = v11;
  v89.origin.y = v10;
  v89.size.width = v47;
  v89.size.height = rect;
  CGRectGetMinX(v89);
  objc_msgSend(v24, "distanceFromLateralEdgesToTopButtonCenter");
  v90.origin.x = v11;
  v90.origin.y = v10;
  v90.size.width = v47;
  v90.size.height = rect;
  CGRectGetMinY(v90);
  objc_msgSend(v24, "distanceFromTopEdgeToTopButtonCenter");
  PXRectWithCenterAndSize();
  *(_QWORD *)&v75 = v26;
  *((_QWORD *)&v75 + 1) = v27;
  *(_QWORD *)&v76 = v28;
  *((_QWORD *)&v76 + 1) = v29;
  v71[0] = v15;
  v71[1] = 3221225472;
  v71[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_3;
  v71[3] = &unk_1E5128048;
  v73 = v74;
  v30 = v24;
  v72 = v30;
  v31 = _Block_copy(v71);
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x4010000000;
  v68[3] = &unk_1A7E74EE7;
  v69 = 0u;
  v70 = 0u;
  v91.origin.x = v11;
  v91.origin.y = v10;
  v91.size.width = v47;
  v91.size.height = rect;
  CGRectGetMaxX(v91);
  objc_msgSend(v30, "distanceFromLateralEdgesToTopButtonCenter");
  v92.origin.x = v11;
  v92.origin.y = v10;
  v92.size.width = v47;
  v92.size.height = rect;
  CGRectGetMinY(v92);
  objc_msgSend(v30, "distanceFromTopEdgeToTopButtonCenter");
  PXRectWithCenterAndSize();
  *(_QWORD *)&v69 = v32;
  *((_QWORD *)&v69 + 1) = v33;
  *(_QWORD *)&v70 = v34;
  *((_QWORD *)&v70 + 1) = v35;
  v65[0] = v15;
  v65[1] = 3221225472;
  v65[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_4;
  v65[3] = &unk_1E5128048;
  v67 = v68;
  v36 = v30;
  v66 = v36;
  v37 = _Block_copy(v65);
  v38 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32;
  v49[0] = v15;
  v49[1] = 3221225472;
  v49[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_5;
  v49[3] = &unk_1E5128160;
  v39 = v36;
  v50 = v39;
  v40 = v25;
  v53 = v40;
  v51 = self;
  v58 = -1.0 - v45;
  v41 = v19;
  v59 = v11;
  v60 = v10;
  v61 = v47;
  v62 = rect;
  v54 = v41;
  v57 = v80;
  v42 = v6;
  v52 = v42;
  v43 = v31;
  v55 = v43;
  v44 = v37;
  v56 = v44;
  v63 = a2;
  v64 = v46;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v38, v49);

  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(v86, 8);

}

- (void)_configureUnifiedContentLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  PXStoryChromeLayout *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  id v44;

  v4 = a3;
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeLayout mainLayoutSpec](self, "mainLayoutSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout displayScale](self, "displayScale");
  v28 = v7;
  v37 = *MEMORY[0x1E0C9D538];
  -[PXGLayout referenceSize](self, "referenceSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "chromeButtonSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v4, "chromeButtonPadding");
  v17 = v16;
  v19 = v18;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v21 = -1.0 - v20;
  -[PXStoryChromeLayout mainModel](self, "mainModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "infoPanelVisibilityFraction");

  objc_msgSend(v4, "infoPanelAnimationDistance");
  PXFloatByLinearlyInterpolatingFloats();
  v24 = v23;
  v25 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke;
  v30[3] = &unk_1E5128228;
  v35 = v13;
  v36 = v15;
  v38 = v9;
  v39 = v11;
  v40 = v17;
  v41 = v19;
  v42 = v24;
  v43 = v21;
  v31 = v4;
  v32 = self;
  v33 = v5;
  v34 = v6;
  v44 = v28;
  v26 = v6;
  v27 = v5;
  v29 = v4;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v25, v30);

}

- (void)_invalidateContentAlpha
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout _invalidateContentAlpha]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryChromeLayout.m"), 868, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateContentAlpha
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[7];
  _QWORD v18[10];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];

  -[PXGLayout alpha](self, "alpha");
  v4 = v3;
  -[PXStoryChromeLayout alphaOverride](self, "alphaOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v4 = v7;
  }
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chromeVisibilityFraction");
  v10 = v9;
  -[PXStoryChromeLayout mainModel](self, "mainModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoPanelVisibilityFraction");
  v13 = v12;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v14 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v15 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__PXStoryChromeLayout__updateContentAlpha__block_invoke;
  v18[3] = &unk_1E5128278;
  *(double *)&v18[7] = v4;
  v18[8] = v10;
  v18[9] = v13;
  v18[4] = self;
  v18[5] = v23;
  v18[6] = &v19;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v14 << 32, v18);
  v16 = v20[3];
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __42__PXStoryChromeLayout__updateContentAlpha__block_invoke_3;
  v17[3] = &unk_1E51282A0;
  v17[4] = v23;
  v17[5] = &v19;
  v17[6] = v16;
  objc_msgSend(v8, "performChanges:", v17);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

}

- (void)_invalidateAXGroupRole
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryChromeLayout _invalidateAXGroupRole]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryChromeLayout.m"), 915, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  PXStoryHitTestResult *v6;
  uint64_t v7;
  _QWORD v9[5];
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryChromeLayout;
  -[PXGLayout hitTestResultForSpriteIndex:](&v10, sel_hitTestResultForSpriteIndex_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_titleSpriteIndex == (_DWORD)v3 || self->_subtitleSpriteIndex == (_DWORD)v3)
  {
    v6 = -[PXFeedHitTestResult initWithSpriteIndex:layout:]([PXStoryHitTestResult alloc], "initWithSpriteIndex:layout:", v3, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__PXStoryChromeLayout_hitTestResultForSpriteIndex___block_invoke;
    v9[3] = &unk_1E51282E8;
    v9[4] = self;
    -[PXFeedHitTestResult primaryAction:](v6, "primaryAction:", v9);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  id v6;
  PXStoryPlayButtonConfiguration *v7;
  void *v8;
  PXStoryTVInfoPanelViewConfiguration *v9;
  void *v10;
  void *v11;
  PXGFocusContainerGuideViewConfiguration *v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (self->_playButtonSpriteIndex == (_DWORD)v4)
  {
    v7 = [PXStoryPlayButtonConfiguration alloc];
    -[PXStoryChromeLayout viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXStoryPlayButtonConfiguration initWithViewModel:](v7, "initWithViewModel:", v8);

    -[PXStoryTVInfoPanelViewConfiguration setTarget:](v9, "setTarget:", self);
    -[PXStoryTVInfoPanelViewConfiguration setAction:](v9, "setAction:", sel__handlePlayButton_);
    -[PXStoryChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playButtonSpec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVInfoPanelViewConfiguration setSpec:](v9, "setSpec:", v11);

  }
  else
  {
    if (self->_bufferingIndicatorSpriteIndex != (_DWORD)v4)
    {
      if (self->_chromeButtonFocusGuideSpriteIndex == (_DWORD)v4)
      {
        v12 = objc_alloc_init(PXGFocusContainerGuideViewConfiguration);
      }
      else
      {
        if (self->_infoPanelSpriteIndex == (_DWORD)v4)
        {
          v9 = objc_alloc_init(PXStoryTVInfoPanelViewConfiguration);
          -[PXStoryChromeLayout viewModel](self, "viewModel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXStoryTVInfoPanelViewConfiguration setViewModel:](v9, "setViewModel:", v10);
          goto LABEL_9;
        }
        -[PXStoryChromeLayout _buttonConfigurationForSpriteIndex:](self, "_buttonConfigurationForSpriteIndex:", v4);
        v12 = (PXGFocusContainerGuideViewConfiguration *)objc_claimAutoreleasedReturnValue();
      }
      v9 = (PXStoryTVInfoPanelViewConfiguration *)v12;
      goto LABEL_10;
    }
    v9 = objc_alloc_init(PXStoryBufferingStatusViewConfiguration);
    -[PXStoryChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVInfoPanelViewConfiguration setWantsBackground:](v9, "setWantsBackground:", objc_msgSend(v10, "bufferingIndicatorWantsBackground"));
  }
LABEL_9:

LABEL_10:
  return v9;
}

- (id)_buttonConfigurationForSpriteIndex:(unsigned int)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  int v20;
  __CFString *v21;
  __CFString *v22;
  char *v23;
  uint64_t v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  const __CFString *v35;
  const __CFString *v36;
  PXStoryChromeLayout *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  BOOL v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  void *v54;
  id v55;
  id location;

  -[PXStoryChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_replayButtonSpriteIndex != a3)
  {
    if (self->_shareButtonSpriteIndex == a3)
    {
      -[PXStoryChromeLayout _configurationForShareButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForShareButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", sel__handleShareButton_, CFSTR("square.and.arrow.up"), 0, CFSTR("InteractiveMemoryShareButtonLabel"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shareButtonExtraOffset");
      objc_msgSend(v10, "setOffset:");
      goto LABEL_13;
    }
    if (self->_browserGridButtonSpriteIndex == a3)
    {
      v11 = sel__handleBrowserGridButton_;
      v12 = objc_msgSend(v6, "defaultChromeButtonBackgroundStyle");
      v13 = CFSTR("rectangle.grid.3x2.fill");
      v14 = CFSTR("InteractiveMemoryButtonAccessibilityLabelBrowse");
LABEL_8:
      -[PXStoryChromeLayout _configurationForLargeButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForLargeButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", v11, v13, v12, v14);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (void *)v15;
      goto LABEL_13;
    }
    if (self->_browserAddPhotosButtonSpriteIndex == a3)
    {
      -[PXStoryChromeLayout _configurationForLargeButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForLargeButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", sel__handleBrowserAddPhotosButton_, CFSTR("plus"), 3, CFSTR("InteractiveMemoryButtonAccessibilityLabelAddPhotos"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSolidBackgroundColor:", v16);
LABEL_12:

      goto LABEL_13;
    }
    if (self->_fullsizePlayerButtonSpriteIndex == a3)
    {
      -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:", sel__handleToggleViewModeButton_, CFSTR("play.circle.fill"), objc_msgSend(v6, "defaultChromeButtonBackgroundStyle"), 0, CFSTR("InteractiveMemoryButtonAccessibilityLabelPlay"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (self->_closeButtonSpriteIndex == a3)
    {
      objc_msgSend(v6, "closeButtonImageName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryChromeLayout _configurationForCloseButtonWithAction:systemImageName:axLabelKey:](self, "_configurationForCloseButtonWithAction:systemImageName:axLabelKey:", sel__handleCloseButton_, v8, CFSTR("InteractiveMemoryButtonAccessibilityLabelClose"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    if (self->_closeBrowserButtonSpriteIndex == a3)
    {
      -[PXStoryChromeLayout _configurationForCloseButtonWithAction:systemImageName:axLabelKey:](self, "_configurationForCloseButtonWithAction:systemImageName:axLabelKey:", sel__handleCloseBrowserButton_, CFSTR("chevron.backward"), CFSTR("PXBack"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (self->_aspectModeButtonIndex == a3)
    {
      -[PXStoryChromeLayout viewModel](self, "viewModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mainModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "shouldAspectFitCurrentSegment");
      v21 = CFSTR("rectangle.arrowtriangle.2.inward");
      if (v20)
        v21 = CFSTR("rectangle.arrowtriangle.2.outward");
      v22 = v21;

      -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:", sel__handleAspectModeButton_, v22, objc_msgSend(v7, "defaultChromeButtonBackgroundStyle"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_13;
    }
    if (self->_errorIndicatorSpriteIndex == a3)
    {
      v23 = sel__handleErrorIndicator_;
      v24 = objc_msgSend(v6, "nonblurredChromeButtonBackgroundStyle");
      v25 = CFSTR("exclamationmark.circle");
      v26 = CFSTR("InteractiveMemoryButtonAccessibilityLabelError");
      goto LABEL_27;
    }
    if (self->_muteToggleButtonSpriteIndex == a3)
    {
      -[PXStoryChromeLayout viewModel](self, "viewModel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isMuted");

      if (v28)
        v29 = CFSTR("speaker.slash");
      else
        v29 = CFSTR("speaker.wave.2");
      if (v28)
        v30 = CFSTR("InteractiveMemoryButtonAccessibilityLabelUnmute");
      else
        v30 = CFSTR("InteractiveMemoryButtonAccessibilityLabelMute");
      -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", sel__handleMuteToggleButton_, v29, 0, v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CE86F8], "replaceOffUpTransition");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "transitionWithByLayer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSymbolTransition:", v31);

      goto LABEL_12;
    }
    if (self->_styleSwitcherButtonSpriteIndex == a3)
    {
      v11 = sel__handleAutoEditButton_;
      v12 = objc_msgSend(v6, "defaultChromeButtonBackgroundStyle");
      v13 = CFSTR("music.and.sparkles");
      v14 = CFSTR("InteractiveMemoryButtonAccessibilityLabelStyles");
      goto LABEL_8;
    }
    if (self->_playbackEndReplayButtonSpriteIndex == a3)
    {
      if (objc_msgSend(v6, "onlyShowReplayEndButtonAtTopOfTitle"))
        v32 = objc_msgSend(v7, "defaultChromeButtonBackgroundStyle");
      else
        v32 = 0;
      v34 = sel__handleReplayButton_;
      v35 = CFSTR("arrow.counterclockwise");
      v36 = CFSTR("InteractiveMemoryButtonAccessibilityLabelReplay");
      v37 = self;
    }
    else
    {
      if (self->_playbackEndShareButtonSpriteIndex == a3)
      {
        -[PXStoryChromeLayout _configurationForShareButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForShareButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", sel__handleShareButton_, CFSTR("square.and.arrow.up"), 0, CFSTR("InteractiveMemoryShareButtonLabel"));
        v33 = objc_claimAutoreleasedReturnValue();
LABEL_51:
        v10 = (void *)v33;
        goto LABEL_52;
      }
      if (self->_playbackEndFavoriteButtonSpriteIndex == a3)
      {
        v34 = sel__handleFavoriteButton_;
        v35 = CFSTR("heart");
        v36 = CFSTR("InteractiveMemoryButtonAccessibilityLabelFavorite");
      }
      else
      {
        if (self->_playbackEndUnfavoriteButtonSpriteIndex != a3)
        {
          if (self->_provideFeedbackButtonSpriteIndex != a3)
          {
            if (self->_actionMenuButtonSpriteIndex == a3)
            {
              objc_msgSend(v6, "actionMenuButtonImageName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", 0, v39, objc_msgSend(v7, "nonblurredChromeButtonBackgroundStyle"), CFSTR("InteractiveMemoryButtonAccessibilityLabelActionMenu"));
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              objc_initWeak(&location, self);
              -[PXStoryChromeLayout viewModel](self, "viewModel");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              +[PXMenuBuilder defaultStoryActionsMenuWithViewModel:](PXMenuBuilder, "defaultStoryActionsMenuWithViewModel:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = MEMORY[0x1E0C809B0];
              v52 = 3221225472;
              v53 = __58__PXStoryChromeLayout__buttonConfigurationForSpriteIndex___block_invoke;
              v54 = &unk_1E5148D30;
              objc_copyWeak(&v55, &location);
              objc_msgSend(v41, "onClose:", &v51);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setMenu:", v42, v51, v52, v53, v54);

              objc_destroyWeak(&v55);
              objc_destroyWeak(&location);
              goto LABEL_13;
            }
            if (self->_toggleFavoriteButtonSpriteIndex == a3)
            {
              -[PXStoryChromeLayout viewModel](self, "viewModel");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "mainModel");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "currentAssetCollectionIsFavorite");

              v46 = v45 == 0;
              if (v45)
                v47 = CFSTR("heart.fill");
              else
                v47 = CFSTR("heart");
              v48 = CFSTR("InteractiveMemoryButtonAccessibilityLabelUnfavorite");
              if (v46)
                v48 = CFSTR("InteractiveMemoryButtonAccessibilityLabelFavorite");
              v49 = v48;
              v22 = v47;
              -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", sel__handleFavoriteButton_, v22, objc_msgSend(v7, "defaultChromeButtonBackgroundStyle"), v49);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_24;
            }
            if (self->_editMusicButtonSpriteIndex == a3)
            {
              v23 = sel__handleEditMusicButton_;
              v24 = objc_msgSend(v6, "defaultChromeButtonBackgroundStyle");
              v25 = CFSTR("music.badge.plus");
              v26 = CFSTR("InteractiveMemoryButtonAccessibilityLabelEditMusic");
            }
            else
            {
              if (self->_editColorGradeButtonSpriteIndex != a3)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChromeLayout.m"), 1054, CFSTR("Code which should be unreachable has been reached"));

                abort();
              }
              v23 = sel__handleEditColorGradeButton_;
              v24 = objc_msgSend(v6, "defaultChromeButtonBackgroundStyle");
              v25 = CFSTR("camera.filters");
              v26 = CFSTR("InteractiveMemoryButtonAccessibilityLabelEditColorGrade");
            }
LABEL_27:
            -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", v23, v25, v24, v26);
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", sel__handleFeedbackButton_, CFSTR("exclamationmark.bubble"), 3, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSolidBackgroundColor:", v38);

LABEL_52:
          -[PXStoryChromeLayout _updateConfigurationUpdatedForPlaybackEnd:](self, "_updateConfigurationUpdatedForPlaybackEnd:", v10);
          goto LABEL_13;
        }
        v34 = sel__handleFavoriteButton_;
        v35 = CFSTR("heart.fill");
        v36 = CFSTR("InteractiveMemoryButtonAccessibilityLabelUnfavorite");
      }
      v37 = self;
      v32 = 0;
    }
    -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](v37, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", v34, v35, v32, v36);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  objc_msgSend(v6, "replayButtonImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:", sel__handleReplayButton_, v8, objc_msgSend(v7, "defaultChromeButtonBackgroundStyle"), 0, CFSTR("InteractiveMemoryButtonAccessibilityLabelReplay"));
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v10 = (void *)v9;

LABEL_13:
  return v10;
}

- (id)_configurationForLargeButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6
{
  void *v6;

  -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXEdgeInsetsMakeAll();
  objc_msgSend(v6, "setHitTestEdgeOutsets:");
  return v6;
}

- (id)_configurationForButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6
{
  id v10;
  id v11;
  PXStoryChromeButtonConfiguration *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a4;
  v12 = objc_alloc_init(PXStoryChromeButtonConfiguration);
  -[PXStoryChromeButtonConfiguration setBackgroundStyle:](v12, "setBackgroundStyle:", a5);
  -[PXStoryChromeButtonConfiguration setSystemImageName:](v12, "setSystemImageName:", v11);

  -[PXStoryChromeButtonConfiguration setAction:](v12, "setAction:", a3);
  -[PXStoryChromeButtonConfiguration setTarget:](v12, "setTarget:", self);
  -[PXStoryChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "chromeButtonSpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButtonConfiguration setSpec:](v12, "setSpec:", v14);

  if (v10)
  {
    PXLocalizedStringFromTable(v10, CFSTR("PhotosUICore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setAxLabel:](v12, "setAxLabel:", v15);

  }
  return v12;
}

- (id)_configurationForShareButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6
{
  return -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", a3, a4, 0, a6);
}

- (id)_configurationForCloseButtonWithAction:(SEL)a3 systemImageName:(id)a4 axLabelKey:(id)a5
{
  void *v5;

  -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", a3, a4, 0, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSystemImageWeight:", 6);
  return v5;
}

- (void)_updateConfigurationUpdatedForPlaybackEnd:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  -[PXStoryChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackEndButtonSystemImageWeight");
  objc_msgSend(v4, "setPreferredSystemImageWeight:", (uint64_t)v5);
  objc_msgSend(v6, "playbackEndButtonSystemImagePointSize");
  objc_msgSend(v4, "setPreferredSystemImagePointSize:");

}

- (id)_configurationForButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 label:(id)a6 axLabelKey:(id)a7
{
  id v12;
  void *v13;

  v12 = a6;
  -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", a3, a4, a5, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", v12);

  return v13;
}

- (void)_menuDidClose
{
  if (self->_shouldInvalidateActionMenuOnClose)
  {
    self->_shouldInvalidateActionMenuOnClose = 0;
    -[PXStoryChromeLayout _invalidateActionMenu](self, "_invalidateActionMenu");
  }
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (self->_titleSpriteIndex == a3)
  {
    -[PXStoryChromeLayout viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayTitle");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_subtitleSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChromeLayout.m"), 1120, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXStoryChromeLayout viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displaySubtitle");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  -[PXStoryChromeLayout attributedStringForSpriteAtIndex:inLayout:](self, "attributedStringForSpriteAtIndex:inLayout:", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_1E5149688;
  v7 = v5;

  return v7;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 33;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a4;
  -[PXStoryChromeLayout viewLayoutSpec](self, "viewLayoutSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_leftEdgeHighlightSpriteIndex != a3 && self->_rightEdgeHighlightSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChromeLayout.m"), 1147, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_msgSend(v8, "rightEdgeHighlightImageConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_actionPerformer
{
  void *v2;
  void *v3;

  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handlePlayButton:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  -[PXStoryChromeLayout viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAtPlaybackEnd"))
  {
    objc_msgSend(v3, "performChanges:", &__block_literal_global_320);
  }
  else
  {
    objc_msgSend(v3, "mainModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "desiredPlayState");
    v6 = 1;
    if (v5)
      v6 = v5;
    if (v5 == 1)
      v6 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__PXStoryChromeLayout__handlePlayButton___block_invoke_2;
    v7[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
    v7[4] = v6;
    objc_msgSend(v4, "performChanges:", v7);

  }
}

- (void)_handleEditMusicButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentMusicEditor");

}

- (void)_handleEditColorGradeButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentColorGradeEditor");

}

- (void)_handleReplayButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_323);

}

- (void)_handleShareButton:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAtPlaybackEnd");

  if (v6)
  {
    -[PXStoryChromeLayout viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performChanges:", &__block_literal_global_324_114016);

  }
  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentSharingViewWithSender:", v4);

}

- (void)_handleFeedbackButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provideFeedback");

}

- (void)_handleFavoriteButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleFavoriteState");

}

- (void)_handleErrorIndicator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performActionForChromeActionMenuItem:withValue:sender:", 13, 0, v4);

}

- (void)_handleMuteToggleButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleMuteState");

}

- (void)_handleCloseButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissStoryViewController");

}

- (void)_handleAspectModeButton:(id)a3
{
  void *v3;
  id v4;

  -[PXStoryChromeLayout viewModel](self, "viewModel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_326_114015);

}

- (void)_handleToggleViewModeButton:(id)a3
{
  void *v3;
  id v4;

  -[PXStoryChromeLayout viewModel](self, "viewModel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_327);

}

- (void)_handleAutoEditButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentStyleSwitcher");

}

- (void)_handleBrowserGridButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentBrowserGrid");

}

- (void)_handleBrowserAddPhotosButton:(id)a3
{
  id v3;

  -[PXStoryChromeLayout _actionPerformer](self, "_actionPerformer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentAssetPicker");

}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5;

  v5 = a3;
  -[PXGLayout alpha](self, "alpha");
  objc_msgSend(v5, "setChromeAlpha:");

}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  void *v5;
  id v6;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "chromeAlpha");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeLayout setAlphaOverride:](self, "setAlphaOverride:", v6);

  }
  else
  {
    -[PXStoryChromeLayout setAlphaOverride:](self, "setAlphaOverride:", 0, a4);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)ViewModelObservationContext_114007 != a5)
  {
    if ((void *)ItemControllerObservationContext == a5)
    {
      if ((a4 & 1) == 0)
        goto LABEL_33;
      goto LABEL_32;
    }
    if ((void *)MainModelObservationContext_114008 != a5)
    {
      if ((void *)RecipeManagerObservationContext != a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChromeLayout.m"), 1317, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      if ((a4 & 0x21) != 0)
        -[PXStoryChromeLayout _invalidateActionMenu](self, "_invalidateActionMenu");
      goto LABEL_33;
    }
    if ((a4 & 0x1000010000) != 0)
      -[PXStoryChromeLayout _invalidateContent](self, "_invalidateContent");
    if ((a4 & 0x40) != 0)
    {
      -[PXStoryChromeLayout _invalidateActionMenu](self, "_invalidateActionMenu");
      if ((a4 & 0x200000000000) == 0)
      {
LABEL_25:
        if ((a4 & 0x2000) == 0)
          goto LABEL_26;
        goto LABEL_30;
      }
    }
    else if ((a4 & 0x200000000000) == 0)
    {
      goto LABEL_25;
    }
    -[PXStoryChromeLayout _invalidateActionMenu](self, "_invalidateActionMenu");
    -[PXStoryChromeLayout _invalidateContent](self, "_invalidateContent");
    if ((a4 & 0x2000) == 0)
    {
LABEL_26:
      if ((a4 & 0x800000000000000) == 0)
        goto LABEL_33;
LABEL_31:
      -[PXStoryChromeLayout _invalidateContentLayout](self, "_invalidateContentLayout");
LABEL_32:
      -[PXStoryChromeLayout _invalidateContentAlpha](self, "_invalidateContentAlpha");
      goto LABEL_33;
    }
LABEL_30:
    -[PXStoryChromeLayout _invalidateContent](self, "_invalidateContent");
    if ((a4 & 0x800000000000000) == 0)
      goto LABEL_33;
    goto LABEL_31;
  }
  if ((a4 & 0x80000) != 0)
    -[PXStoryChromeLayout _invalidateContent](self, "_invalidateContent");
  if ((a4 & 0x418000000008020) != 0)
    -[PXStoryChromeLayout _invalidateContent](self, "_invalidateContent");
  if ((a4 & 0x40) != 0)
    -[PXStoryChromeLayout _invalidateMainModel](self, "_invalidateMainModel");
  if ((a4 & 0x4000) != 0)
    -[PXStoryChromeLayout _invalidateContentAlpha](self, "_invalidateContentAlpha");
  if ((a4 & 0x4140002C02) != 0)
    -[PXStoryChromeLayout _invalidateActionMenu](self, "_invalidateActionMenu");
  if ((a4 & 0x8000) != 0)
    -[PXStoryChromeLayout _invalidateAXGroupRole](self, "_invalidateAXGroupRole");
LABEL_33:

}

- (id)_possiblyAccessibleSpriteIndexes
{
  NSIndexSet *cachePossiblyAccessibleSpriteIndexes;
  id v4;
  void *v5;
  id v6;
  NSIndexSet *v7;
  NSIndexSet *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  PXStoryChromeLayout *v14;
  id v15;

  cachePossiblyAccessibleSpriteIndexes = self->_cachePossiblyAccessibleSpriteIndexes;
  if (!cachePossiblyAccessibleSpriteIndexes)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    -[PXStoryChromeLayout itemControllers](self, "itemControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __55__PXStoryChromeLayout__possiblyAccessibleSpriteIndexes__block_invoke;
    v13 = &unk_1E51283D0;
    v14 = self;
    v15 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

    v7 = (NSIndexSet *)objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);
    v8 = self->_cachePossiblyAccessibleSpriteIndexes;
    self->_cachePossiblyAccessibleSpriteIndexes = v7;

    cachePossiblyAccessibleSpriteIndexes = self->_cachePossiblyAccessibleSpriteIndexes;
  }
  return cachePossiblyAccessibleSpriteIndexes;
}

- (id)axVisibleSpriteIndexes
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "chromeItems");

  -[PXStoryChromeLayout itemControllers](self, "itemControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PXStoryChromeLayout_axVisibleSpriteIndexes__block_invoke;
  v9[3] = &unk_1E51283F8;
  v11 = v5;
  v7 = v3;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXStoryChromeLayout;
  -[PXGLayout axContentInfoAtSpriteIndex:](&v11, sel_axContentInfoAtSpriteIndex_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_playButtonSpriteIndex == a3)
  {
    -[PXStoryChromeLayout viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "desiredPlayState");

    if (v7)
    {
      if (v7 != 1)
      {
        v9 = 0;
        goto LABEL_8;
      }
      v8 = CFSTR("InteractiveMemoryButtonAccessibilityLabelPause");
    }
    else
    {
      v8 = CFSTR("InteractiveMemoryButtonAccessibilityLabelPlay");
    }
    PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    objc_msgSend(v5, "setContent:ofContentKind:", v9, 3);

  }
  return v5;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v3 = *(_QWORD *)&a3;
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wantsChromeVisible");

  if (!v6)
    return 0;
  -[PXStoryChromeLayout itemControllers](self, "itemControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (-[PXStoryChromeLayout viewModel](self, "viewModel"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "chromeItems"),
        v12 = objc_msgSend(v9, "chromeItem") & ~v11,
        v10,
        v12))
  {
    v13 = 0;
  }
  else
  {
    v13 = 2 * ((objc_msgSend(v9, "chromeItem") & 0x800C00) == 0);
  }

  return v13;
}

- (id)axLocalizedLabel
{
  return PXLocalizedStringFromTable(CFSTR("InteractiveMemoryButtonAccessibilityLabelCurrentMemory"), CFSTR("PhotosUICore"));
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v8 = a5;
  v9 = a3;
  -[PXStoryChromeLayout viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "viewMode") == 1)
  {
    -[PXStoryChromeLayout viewModel](self, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wantsChromeVisible");

  }
  -[PXGLayout axNextResponder](self, "axNextResponder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "axGroup:didRequestToPerformAction:userInfo:", v9, a4, v8);

  return v14;
}

- (id)preferredFocusLayouts
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)preferredFocusSpriteIndexes
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v3, "addIndex:", self->_actionMenuButtonSpriteIndex);
  objc_msgSend(v3, "addIndex:", self->_browserGridButtonSpriteIndex);
  objc_msgSend(v3, "addIndex:", self->_browserAddPhotosButtonSpriteIndex);
  objc_msgSend(v3, "addIndex:", self->_replayButtonSpriteIndex);
  objc_msgSend(v3, "addIndex:", self->_toggleFavoriteButtonSpriteIndex);
  objc_msgSend(v3, "addIndex:", self->_styleSwitcherButtonSpriteIndex);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (NSMutableDictionary)itemControllers
{
  return self->_itemControllers;
}

- (NSNumber)alphaOverride
{
  return self->_alphaOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaOverride, 0);
  objc_storeStrong((id *)&self->_itemControllers, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_cachePossiblyAccessibleSpriteIndexes, 0);
}

void __45__PXStoryChromeLayout_axVisibleSpriteIndexes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  v5 = *(_QWORD *)(a1 + 40);
  if ((objc_msgSend(a3, "chromeItem") & ~v5) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v6, "integerValue"));

}

uint64_t __55__PXStoryChromeLayout__possiblyAccessibleSpriteIndexes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  _DWORD *v4;

  result = objc_msgSend(a2, "integerValue");
  v4 = *(_DWORD **)(a1 + 32);
  if (v4[275] != (_DWORD)result && v4[276] != (_DWORD)result && v4[281] != (_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

void __51__PXStoryChromeLayout__handleToggleViewModeButton___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v4 = a2;
  v2 = objc_msgSend(v4, "viewMode");
  if (v2 == 1)
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v4, "setViewMode:", v3);
  if (v2 != 1)
    objc_msgSend(v4, "rewindToBeginningOfCurrentSegment");

}

void __47__PXStoryChromeLayout__handleAspectModeButton___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setShouldAspectFitCurrentSegment:", objc_msgSend(v2, "shouldAspectFitCurrentSegment") ^ 1);

}

uint64_t __42__PXStoryChromeLayout__handleShareButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldCountDownToUpNext:", 0);
}

uint64_t __43__PXStoryChromeLayout__handleReplayButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rewindToBeginning:", 1);
}

uint64_t __41__PXStoryChromeLayout__handlePlayButton___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__PXStoryChromeLayout__handlePlayButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rewindToBeginning:", 1);
}

void __58__PXStoryChromeLayout__buttonConfigurationForSpriteIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_menuDidClose");

}

uint64_t __51__PXStoryChromeLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performChanges:", &__block_literal_global_114112);

  return 1;
}

void __51__PXStoryChromeLayout_hitTestResultForSpriteIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setShowSongInTitleWhenPaused:", objc_msgSend(v2, "showSongInTitleWhenPaused") ^ 1);

}

void __42__PXStoryChromeLayout__updateContentAlpha__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "itemControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__PXStoryChromeLayout__updateContentAlpha__block_invoke_2;
  v7[3] = &unk_1E5128250;
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = a4;
  v8 = *(_OWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __42__PXStoryChromeLayout__updateContentAlpha__block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "setBufferingIndicatorVisibilityFraction:", v3);
  objc_msgSend(v4, "setMuteToggleButtonVisibilityFraction:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  objc_msgSend(v4, "setMaximumIndividualTopChromeItemVisibilityFraction:", *(double *)(a1 + 48));

}

void __42__PXStoryChromeLayout__updateContentAlpha__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  _DWORD *v10;
  double v11;
  float v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  objc_msgSend(v5, "alpha");
  v8 = v7;

  v9 = v8 * *(double *)(a1 + 56);
  v10 = *(_DWORD **)(a1 + 32);
  if (v10[276] != v6 && v10[275] != v6 && v10[278] != v6 && v10[258] != v6 && v10[259] != v6)
  {
    v11 = *(double *)(a1 + 64);
    if (v10[281] != v6)
      v11 = v11 * (1.0 - *(double *)(a1 + 72));
    v9 = v9 * v11;
  }
  v12 = v9;
  *(float *)(*(_QWORD *)(a1 + 80) + 160 * v6) = v12;
  v13 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v13 + 1112) == v6)
  {
    v14 = a1 + 40;
  }
  else
  {
    if (*(_DWORD *)(v13 + 1036) != v6)
      return;
    v14 = a1 + 48;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)v14 + 8) + 24) = v9;
}

void __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void (**v18)(void *, _QWORD, uint64_t);
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v23;
  double v24;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v27;
  float v28;
  float64x2_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  float64x2_t v45;
  float32x2_t *v46;
  uint64_t v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  uint64_t v56;
  float v57;
  float64x2_t v58;
  unsigned int v59;
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double (**v67)(void *, _QWORD, uint64_t);
  __int128 v68;
  double (**v69)(void *, _QWORD, double, double, double, double);
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  uint64_t v89;
  CGFloat v90;
  CGFloat v91;
  float v92;
  float64x2_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  float64x2_t v104;
  float32x2_t v105;
  uint64_t v106;
  uint64_t v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  CGFloat v111;
  void *v112;
  void *v113;
  CGFloat v114;
  double v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  uint64_t v119;
  _QWORD v120[4];
  id v121;
  id v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  _QWORD v126[6];
  _QWORD v127[4];
  id v128;
  id v129;
  _QWORD v130[5];
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD aBlock[4];
  id v136;
  uint64_t *v137;
  uint64_t *v138;
  uint64_t v139;
  double *v140;
  uint64_t v141;
  void *v142;
  __int128 v143;
  __int128 v144;
  uint64_t v145;
  double *v146;
  uint64_t v147;
  uint64_t v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;

  v145 = 0;
  v146 = (double *)&v145;
  v147 = 0x2020000000;
  v148 = 0x7FEFFFFFFFFFFFFFLL;
  v139 = 0;
  v140 = (double *)&v139;
  v141 = 0x4010000000;
  v142 = &unk_1A7E74EE7;
  v143 = 0u;
  v144 = 0u;
  v9 = (__int128 *)(a1 + 80);
  PXRectWithSizeAlignedToRectEdgesWithPadding();
  *(_QWORD *)&v143 = v10;
  *((_QWORD *)&v143 + 1) = v11;
  *(_QWORD *)&v144 = v12;
  *((_QWORD *)&v144 + 1) = v13;
  v140[5] = *(double *)(a1 + 128) + v140[5];
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_2;
  aBlock[3] = &unk_1E5128188;
  v137 = &v139;
  v136 = *(id *)(a1 + 32);
  v138 = &v145;
  v130[0] = v14;
  v130[1] = 3221225472;
  v130[2] = __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_3;
  v130[3] = &unk_1E51281B0;
  v15 = _Block_copy(aBlock);
  v131 = v15;
  v132 = a3;
  v133 = *(_QWORD *)(a1 + 136);
  v134 = a5;
  v130[4] = *(_QWORD *)(a1 + 40);
  v16 = _Block_copy(v130);
  v127[0] = v14;
  v127[1] = 3221225472;
  v127[2] = __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_4;
  v127[3] = &unk_1E51281D8;
  v128 = *(id *)(a1 + 48);
  v17 = v16;
  v129 = v17;
  v18 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(v127);
  PXRectWithSizeAlignedToRectEdgesWithPadding();
  x = v149.origin.x;
  y = v149.origin.y;
  width = v149.size.width;
  height = v149.size.height;
  v23 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032);
  v24 = *(double *)(a1 + 136);
  MidX = CGRectGetMidX(v149);
  v150.origin.x = x;
  v150.origin.y = y;
  v150.size.width = width;
  v150.size.height = height;
  MidY = CGRectGetMidY(v150);
  v151.origin.x = x;
  v151.origin.y = y;
  v151.size.width = width;
  v151.size.height = height;
  v117 = CGRectGetWidth(v151);
  v152.origin.x = x;
  v152.origin.y = y;
  v152.size.width = width;
  v152.size.height = height;
  v27 = CGRectGetHeight(v152);
  v28 = v24;
  v29.f64[0] = v117;
  v29.f64[1] = v27;
  v30 = a3 + 32 * v23;
  *(CGFloat *)v30 = MidX;
  *(CGFloat *)(v30 + 8) = MidY;
  *(double *)(v30 + 16) = v28;
  *(float32x2_t *)(v30 + 24) = vcvt_f32_f64(v29);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  v18[2](v18, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1068), 512);
  v18[2](v18, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1116), 0x400000);
  v18[2](v18, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1028), 32);
  v18[2](v18, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1056), 128);
  v18[2](v18, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1060), 0x20000000);
  v18[2](v18, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1040), 2);
  v31 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(v31 + 1124) != -1)
  {
    +[PXStoryTVInfoPanelView sizeThatFits:](PXStoryTVInfoPanelView, "sizeThatFits:", *(double *)(a1 + 96), *(double *)(a1 + 104));
    v33 = v32;
    v35 = v34;
    v36 = CGRectGetWidth(*(CGRect *)(a1 + 80));
    v37 = CGRectGetHeight(*(CGRect *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 32), "infoPanelAnimationDistance");
    v38 = (v36 - v33) * 0.5;
    v40 = v37 - v35 + v39 + *(double *)(a1 + 128);
    v41 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1124);
    v153.origin.x = v38;
    v153.origin.y = v40;
    v153.size.width = v33;
    v153.size.height = v35;
    v42 = CGRectGetMidX(v153);
    v154.origin.x = v38;
    v154.origin.y = v40;
    v154.size.width = v33;
    v154.size.height = v35;
    v43 = CGRectGetMidY(v154);
    v155.origin.x = v38;
    v155.origin.y = v40;
    v155.size.width = v33;
    v155.size.height = v35;
    v118 = CGRectGetWidth(v155);
    v156.origin.x = v38;
    v156.origin.y = v40;
    v156.size.width = v33;
    v156.size.height = v35;
    v44 = CGRectGetHeight(v156);
    v45.f64[0] = v118;
    v45.f64[1] = v44;
    v46 = (float32x2_t *)(a3 + 32 * v41);
    *(CGFloat *)v46 = v42;
    *(CGFloat *)&v46[1] = v43;
    v46[2] = 0;
    v46[3] = vcvt_f32_f64(v45);
    v31 = *(_QWORD *)(a1 + 40);
  }
  v47 = *(unsigned int *)(v31 + 1112);
  CGRectGetMidX(*(CGRect *)(a1 + 80));
  CGRectGetMidY(*(CGRect *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 56), "bufferingIndicatorSize");
  PXRectWithCenterAndSize();
  v48 = v157.origin.x;
  v49 = v157.origin.y;
  v50 = v157.size.width;
  v51 = v157.size.height;
  v52 = *(double *)(a1 + 136);
  v53 = CGRectGetMidX(v157);
  v158.origin.x = v48;
  v158.origin.y = v49;
  v158.size.width = v50;
  v158.size.height = v51;
  v54 = CGRectGetMidY(v158);
  v159.origin.x = v48;
  v159.origin.y = v49;
  v159.size.width = v50;
  v159.size.height = v51;
  v114 = CGRectGetWidth(v159);
  v160.origin.x = v48;
  v160.origin.y = v49;
  v160.size.width = v50;
  v160.size.height = v51;
  v55 = CGRectGetHeight(v160);
  v112 = v17;
  v113 = v15;
  v119 = a5;
  v56 = a3 + 32 * v47;
  v57 = v52;
  v58.f64[0] = v114;
  v58.f64[1] = v55;
  *(CGFloat *)v56 = v53;
  *(CGFloat *)(v56 + 8) = v54;
  *(double *)(v56 + 16) = v57;
  *(float32x2_t *)(v56 + 24) = vcvt_f32_f64(v58);
  v59 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1112);
  objc_msgSend(*(id *)(a1 + 32), "bufferingIndicatorCornerRadius");
  *(float *)&v60 = v60;
  *(int32x4_t *)(a4 + 160 * v59 + 36) = vdupq_lane_s32(*(int32x2_t *)&v60, 0);
  v61 = v146[3];
  objc_msgSend(*(id *)(a1 + 32), "generalChromeTitleSpec");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "numberOfTitleLines");
  v64 = a4;
  v65 = objc_msgSend(v62, "numberOfSubtitleLines");
  v66 = MEMORY[0x1E0C809B0];
  v126[0] = MEMORY[0x1E0C809B0];
  v126[1] = 3221225472;
  v126[2] = __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_5;
  v126[3] = &unk_1E51280E8;
  v126[4] = *(_QWORD *)(a1 + 40);
  *(double *)&v126[5] = v61 + -160.0;
  v67 = (double (**)(void *, _QWORD, uint64_t))_Block_copy(v126);
  v120[0] = v66;
  v120[1] = 3221225472;
  v120[2] = __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_6;
  v120[3] = &unk_1E5128200;
  v68 = v9[1];
  v123 = *v9;
  v124 = v68;
  v121 = *(id *)(a1 + 56);
  v122 = *(id *)(a1 + 32);
  v125 = *(_QWORD *)(a1 + 128);
  v69 = (double (**)(void *, _QWORD, double, double, double, double))_Block_copy(v120);
  v70 = v67[2](v67, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092), v63);
  v72 = v71;
  v115 = v67[2](v67, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1096), v65);
  v74 = v73;
  v75 = v72 + v73;
  v76 = v69[2](v69, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092), v70, v72, v72 + v73, 0.0);
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v116 = v69[2](v69, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1096), v115, v74, v75, v72);
  v84 = v83;
  v86 = v85;
  v88 = v87;
  v89 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092);
  v109 = *(double *)(a1 + 136);
  v161.origin.x = v76;
  v161.origin.y = v78;
  v161.size.width = v80;
  v161.size.height = v82;
  v110 = CGRectGetMidX(v161);
  v162.origin.x = v76;
  v162.origin.y = v78;
  v162.size.width = v80;
  v162.size.height = v82;
  v90 = CGRectGetMidY(v162);
  v163.origin.x = v76;
  v163.origin.y = v78;
  v163.size.width = v80;
  v163.size.height = v82;
  v108 = CGRectGetWidth(v163);
  v164.origin.x = v76;
  v164.origin.y = v78;
  v164.size.width = v80;
  v164.size.height = v82;
  v91 = CGRectGetHeight(v164);
  v92 = v109;
  v93.f64[0] = v108;
  v93.f64[1] = v91;
  v94 = a3 + 32 * v89;
  *(CGFloat *)v94 = v110;
  *(CGFloat *)(v94 + 8) = v90;
  *(double *)(v94 + 16) = v92;
  *(float32x2_t *)(v94 + 24) = vcvt_f32_f64(v93);
  *(_BYTE *)(v64 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092) + 70) = 6;
  *(_WORD *)(v119 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                             + 1144);
  *(float *)&v91 = *(double *)(a1 + 144);
  v95 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092);
  *(float32x2_t *)(v119 + 40 * v95 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v95 + 24), *(float *)&v91);
  v96 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1096);
  v97 = *(double *)(a1 + 136);
  v98 = v116;
  v99 = v84;
  v93.f64[0] = v86;
  v100 = v88;
  v101 = CGRectGetMidX(*(CGRect *)(&v93 - 1));
  v165.origin.x = v116;
  v165.origin.y = v84;
  v165.size.width = v86;
  v165.size.height = v88;
  v102 = CGRectGetMidY(v165);
  v166.origin.x = v116;
  v166.origin.y = v84;
  v166.size.width = v86;
  v166.size.height = v88;
  v111 = CGRectGetWidth(v166);
  v167.origin.x = v116;
  v167.origin.y = v84;
  v167.size.width = v86;
  v167.size.height = v88;
  v103 = CGRectGetHeight(v167);
  v104.f64[0] = v111;
  v104.f64[1] = v103;
  v105 = vcvt_f32_f64(v104);
  *(float *)v104.f64 = v97;
  v106 = a3 + 32 * v96;
  *(CGFloat *)v106 = v101;
  *(CGFloat *)(v106 + 8) = v102;
  *(double *)(v106 + 16) = *(float *)v104.f64;
  *(float32x2_t *)(v106 + 24) = v105;
  *(_BYTE *)(v64 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1096) + 70) = 6;
  *(_WORD *)(v119 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1096) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                             + 1144);
  v107 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1096);
  v105.f32[0] = *(double *)(a1 + 144);
  *(float32x2_t *)(v119 + 40 * v107 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v107 + 24), v105.f32[0]);

  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v145, 8);
}

double __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_2(uint64_t a1, int a2)
{
  CGRect *v3;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v9;
  double v10;
  double v11;
  CGRect v13;

  v3 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
  x = v3[1].origin.x;
  y = v3[1].origin.y;
  width = v3[1].size.width;
  height = v3[1].size.height;
  if (a2)
  {
    MinX = CGRectGetMinX(v3[1]);
    objc_msgSend(*(id *)(a1 + 32), "interChromeButtonSpacing");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = MinX
                                                                - v9
                                                                - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 48);
  }
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v11 = CGRectGetMinX(v13);
  if (v10 < v11)
    v11 = v10;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
  return x;
}

float32x2_t __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_3(uint64_t a1, unsigned int a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v8;
  float v9;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v12;
  float64x2_t v13;
  float32x2_t result;
  CGFloat v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v16.origin.x = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v8 = *(_QWORD *)(a1 + 48) + 32 * a2;
  v9 = *(double *)(a1 + 56);
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidY = CGRectGetMidY(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v15 = CGRectGetWidth(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v12 = CGRectGetHeight(v19);
  v13.f64[0] = v15;
  v13.f64[1] = v12;
  result = vcvt_f32_f64(v13);
  *(CGFloat *)v8 = MidX;
  *(CGFloat *)(v8 + 8) = MidY;
  *(double *)(v8 + 16) = v9;
  *(float32x2_t *)(v8 + 24) = result;
  *(_WORD *)(*(_QWORD *)(a1 + 64) + 40 * a2 + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 1144);
  return result;
}

uint64_t __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "chromeItems");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

double __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "attributedStringForSpriteAtIndex:inLayout:", a2, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length")
    && (objc_msgSend(v5, "px_sizeWithProposedWidth:maximumLines:drawingOptions:", a3, 1, *(double *)(a1 + 40)),
        v6 > 0.0))
  {
    v7 = ceil(v6);
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
  }

  return v7;
}

double __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_6(uint64_t a1)
{
  CGRectGetHeight(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "scrubberVerticalPadding");
  objc_msgSend(*(id *)(a1 + 40), "scrubberRegularAssetSize");
  return 80.0;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke(uint64_t a1, int a2)
{
  CGRect *v2;
  double x;
  double MinX;
  double v6;

  v2 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
  x = v2[1].origin.x;
  if (a2)
  {
    MinX = CGRectGetMinX(v2[1]);
    objc_msgSend(*(id *)(a1 + 32), "interChromeButtonSpacing");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = MinX
                                                                - v6
                                                                - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 48);
  }
  return x;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  double MaxX;
  double v11;
  double v12;
  double v13;

  v5 = a2;
  +[PXStoryChromeButton sizeWithConfiguration:](PXStoryChromeButton, "sizeWithConfiguration:", v5);
  PXRectWithSizeAlignedToRectEdges();
  if (a3)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v6);
    objc_msgSend(*(id *)(a1 + 32), "interChromeButtonSpacing");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = MaxX + v11;
  }
  objc_msgSend(v5, "offset");
  PXPointAdd();
  v13 = v12;

  return v13;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  double MaxX;
  double v11;
  double v12;
  double v13;

  v5 = a2;
  +[PXStoryChromeButton sizeWithConfiguration:](PXStoryChromeButton, "sizeWithConfiguration:", v5);
  PXRectWithSizeAlignedToRectEdges();
  if (a3)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v6);
    objc_msgSend(*(id *)(a1 + 32), "interTopLeadingChromeButtonSpacing");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = MaxX + v11;
  }
  objc_msgSend(v5, "offset");
  PXPointAdd();
  v13 = v12;

  return v13;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_4(uint64_t a1, void *a2, int a3)
{
  id v5;
  CGRect *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = a2;
  +[PXStoryChromeButton sizeWithConfiguration:](PXStoryChromeButton, "sizeWithConfiguration:", v5);
  PXRectWithSizeAlignedToRectEdges();
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "interTopTrailingChromeButtonSpacing");
    v6 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
    v6[1].origin.x = CGRectGetMinX(v6[1]) - v7 - v8;
  }
  objc_msgSend(v5, "offset");
  PXPointAdd();
  v10 = v9;

  return v10;
}

void __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  void *v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  float v18;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v22;
  CGFloat x;
  float64_t y;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  float v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  float64x2_t v32;
  uint64_t v33;
  float v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  float64x2_t v41;
  uint64_t v42;
  float v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  float64x2_t v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double *v58;
  double v59;
  double v60;
  double v61;
  id *v62;
  uint64_t v63;
  float v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  float64x2_t v68;
  uint64_t v69;
  void *v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  uint64_t v78;
  float v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  float64x2_t v83;
  uint64_t v84;
  void *v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  uint64_t v93;
  float v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  float64x2_t v98;
  uint64_t v99;
  void *v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  uint64_t v108;
  float v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  float64x2_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  double v119;
  CGFloat v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  char v125;
  double v126;
  CGFloat v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  uint64_t v143;
  double v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  float v148;
  float64x2_t v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  double v153;
  CGFloat v154;
  CGFloat v155;
  CGFloat v156;
  CGFloat v157;
  CGFloat v158;
  float v159;
  float64x2_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  double v164;
  CGFloat v165;
  CGFloat v166;
  CGFloat v167;
  CGFloat v168;
  CGFloat v169;
  float v170;
  float64x2_t v171;
  uint64_t v172;
  uint64_t v173;
  double v174;
  double v175;
  CGFloat v176;
  CGFloat v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  float v181;
  float64x2_t v182;
  uint64_t v183;
  uint64_t v184;
  double v185;
  double v186;
  CGFloat v187;
  CGFloat v188;
  CGFloat v189;
  CGFloat v190;
  CGFloat v191;
  float v192;
  float64x2_t v193;
  uint64_t v194;
  uint64_t v195;
  CGFloat v196;
  CGFloat v197;
  CGFloat v198;
  CGFloat v199;
  double v200;
  CGFloat v201;
  CGFloat v202;
  CGFloat v203;
  uint64_t v204;
  float v205;
  float64x2_t v206;
  double v207;
  uint64_t v208;
  void *v209;
  CGFloat v210;
  double v211;
  CGFloat v212;
  double v213;
  CGFloat v214;
  double v215;
  CGFloat v216;
  uint64_t v217;
  double v218;
  CGFloat v219;
  CGFloat v220;
  CGFloat v221;
  float v222;
  float64x2_t v223;
  uint64_t v224;
  uint64_t v225;
  CGFloat v226;
  void *v227;
  __int128 *v228;
  __int128 v229;
  id v230;
  uint64_t v231;
  id v232;
  uint64_t v233;
  void *v234;
  CGFloat v235;
  double v236;
  CGFloat v237;
  double v238;
  CGFloat v239;
  double v240;
  CGFloat v241;
  uint64_t v242;
  double v243;
  CGFloat v244;
  CGFloat v245;
  CGFloat v246;
  float v247;
  float64x2_t v248;
  uint64_t v249;
  __int128 v250;
  id v251;
  uint64_t v252;
  void (**v253)(void *, _QWORD, uint64_t);
  char v254;
  uint64_t v255;
  uint64_t v256;
  void (**v257)(void *, _QWORD, uint64_t);
  void *v258;
  int v259;
  void *v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  double v265;
  double v266;
  double v267;
  int v268;
  void *v269;
  double v270;
  double v271;
  double v272;
  double MaxX;
  double v274;
  double MinX;
  uint64_t v276;
  void *v277;
  void *v278;
  double v279;
  double v280;
  void *v281;
  BOOL v282;
  char v283;
  NSObject *v284;
  CGFloat v285;
  void *v286;
  int v287;
  int *v288;
  double v289;
  CGFloat v290;
  CGFloat v291;
  CGFloat v292;
  CGFloat v293;
  uint64_t v294;
  uint64_t v295;
  double v296;
  double v297;
  double v298;
  void *v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  void *v306;
  void *v307;
  void *v308;
  CGFloat v309;
  CGFloat v310;
  CGFloat v311;
  uint64_t v312;
  CGFloat v313;
  double v314;
  CGFloat v315;
  CGFloat v316;
  CGFloat v317;
  float v318;
  float64x2_t v319;
  uint64_t v320;
  CGFloat v321;
  CGFloat v322;
  CGFloat v323;
  uint64_t v324;
  double v325;
  CGFloat v326;
  CGFloat v327;
  CGFloat v328;
  float v329;
  float64x2_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  double v335;
  CGFloat v336;
  CGFloat v337;
  CGFloat v338;
  CGFloat v339;
  CGFloat v340;
  CGFloat v341;
  float v342;
  float64x2_t v343;
  uint64_t v344;
  uint64_t v345;
  __int128 v346;
  double (**v347)(void *, uint64_t);
  __int16 v348;
  uint64_t v349;
  CGFloat v350;
  CGFloat v351;
  CGFloat v352;
  CGFloat v353;
  double v354;
  CGFloat v355;
  CGFloat v356;
  CGFloat v357;
  uint64_t v358;
  float v359;
  float64x2_t v360;
  uint64_t v361;
  uint64_t v362;
  CGFloat v363;
  CGFloat v364;
  CGFloat v365;
  CGFloat v366;
  double v367;
  CGFloat v368;
  CGFloat v369;
  CGFloat v370;
  float64x2_t v371;
  float32x2_t v372;
  uint64_t v373;
  uint64_t v374;
  id v375;
  id v376;
  uint64_t v377;
  uint64_t v378;
  __int128 v379;
  double (**v380)(void *, _QWORD, double, double, double, double);
  double v381;
  double v382;
  double v383;
  double v384;
  double v385;
  double v386;
  uint64_t v387;
  double v388;
  CGFloat v389;
  double v390;
  double v391;
  double v392;
  void *v393;
  CGFloat v394;
  CGFloat v395;
  double v396;
  double v397;
  CGFloat v398;
  double v399;
  CGFloat v400;
  CGFloat v401;
  double v402;
  __int128 *v403;
  double v404;
  double v405;
  double (**v406)(void *, _QWORD, uint64_t);
  CGFloat v407;
  CGFloat v408;
  double v409;
  CGFloat v410;
  uint64_t v411;
  CGFloat v412;
  uint64_t v413;
  CGFloat v414;
  uint64_t v415;
  CGFloat v416;
  double v417;
  CGFloat r2;
  id r2a;
  CGFloat v420;
  CGFloat v421;
  double v422;
  CGFloat v423;
  CGFloat v424;
  double v425;
  CGFloat v426;
  CGFloat v427;
  CGFloat v428;
  double v429;
  double v430;
  CGFloat rect;
  CGFloat recta;
  double r1;
  void *r1a;
  CGFloat r1b;
  CGFloat r1c;
  double (**v437)(void);
  double v438;
  CGFloat v439;
  CGFloat v440;
  void (**v441)(void *, _QWORD, uint64_t);
  double v442;
  CGFloat v443;
  CGFloat v444;
  CGFloat v445;
  void *v446;
  CGFloat Width;
  CGFloat v449;
  CGFloat v450;
  CGFloat v451;
  CGFloat v452;
  CGFloat v453;
  CGFloat v454;
  CGFloat v455;
  CGFloat v456;
  CGFloat v457;
  _QWORD v458[4];
  id v459;
  __int128 v460;
  __int128 v461;
  _QWORD v462[4];
  id v463;
  id v464;
  id v465;
  uint64_t v466;
  uint64_t *v467;
  uint64_t *v468;
  CGFloat v469;
  CGFloat v470;
  CGFloat v471;
  CGFloat v472;
  CGFloat v473;
  CGFloat v474;
  CGFloat v475;
  CGFloat v476;
  uint64_t v477;
  uint64_t v478;
  __int128 v479;
  __int128 v480;
  uint64_t v481;
  double v482;
  uint64_t v483;
  double v484;
  _QWORD v485[6];
  _QWORD v486[5];
  id v487;
  id v488;
  uint64_t *v489;
  uint64_t v490;
  CGRect *v491;
  uint64_t v492;
  void *v493;
  __int128 v494;
  __int128 v495;
  _QWORD v496[5];
  id v497;
  id v498;
  uint64_t *v499;
  uint64_t v500;
  CGRect *v501;
  uint64_t v502;
  void *v503;
  __int128 v504;
  __int128 v505;
  _QWORD v506[8];
  _QWORD aBlock[4];
  id v508;
  uint64_t *v509;
  uint64_t v510;
  CGRect *v511;
  uint64_t v512;
  void *v513;
  __int128 v514;
  __int128 v515;
  CGRect buf;
  uint64_t v517;
  CGRect v518;
  CGRect v519;
  CGRect v520;
  CGRect v521;
  CGRect v522;
  CGRect v523;
  CGRect v524;
  CGRect v525;
  CGRect v526;
  CGRect v527;
  CGRect v528;
  CGRect v529;
  CGRect v530;
  CGRect v531;
  CGRect v532;
  CGRect v533;
  CGRect v534;
  CGRect v535;
  CGRect v536;
  CGRect v537;
  CGRect v538;
  CGRect v539;
  CGRect v540;
  CGRect v541;
  CGRect v542;
  CGRect v543;
  CGRect v544;
  CGRect v545;
  CGRect v546;
  CGRect v547;
  CGRect v548;
  CGRect v549;
  CGRect v550;
  CGRect v551;
  CGRect v552;
  CGRect v553;
  CGRect v554;
  CGRect v555;
  CGRect v556;
  CGRect v557;
  CGRect v558;
  CGRect v559;
  CGRect v560;
  CGRect v561;
  CGRect v562;
  CGRect v563;
  CGRect v564;
  CGRect v565;
  CGRect v566;
  CGRect v567;
  CGRect v568;
  CGRect v569;
  CGRect v570;
  CGRect v571;
  CGRect v572;
  CGRect v573;
  CGRect v574;
  CGRect v575;
  CGRect v576;
  CGRect v577;
  CGRect v578;
  CGRect v579;
  CGRect v580;
  CGRect v581;
  CGRect v582;
  CGRect v583;
  CGRect v584;
  CGRect v585;
  CGRect v586;
  CGRect v587;
  CGRect v588;
  CGRect v589;
  CGRect v590;
  CGRect v591;
  CGRect v592;
  CGRect v593;
  CGRect v594;
  CGRect v595;
  CGRect v596;
  CGRect v597;
  CGRect v598;
  CGRect v599;
  CGRect v600;
  CGRect v601;
  CGRect v602;
  CGRect v603;
  CGRect v604;
  CGRect v605;
  CGRect v606;

  v517 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "styleSwitcherButtonPlacement") == 4)
  {
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "_buttonConfigurationForSpriteIndex:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1068));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (*(double (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1068);
    v18 = *(double *)(a1 + 96);
    v518.origin.x = v10;
    v518.origin.y = v12;
    v518.size.width = v14;
    v518.size.height = v16;
    MidX = CGRectGetMidX(v518);
    v519.origin.x = v10;
    v519.origin.y = v12;
    v519.size.width = v14;
    v519.size.height = v16;
    MidY = CGRectGetMidY(v519);
    v520.origin.x = v10;
    v520.origin.y = v12;
    v520.size.width = v14;
    v520.size.height = v16;
    Width = CGRectGetWidth(v520);
    v521.origin.x = v10;
    v521.origin.y = v12;
    v521.size.width = v14;
    v521.size.height = v16;
    Height = CGRectGetHeight(v521);
    v22.f64[0] = Width;
    v22.f64[1] = Height;
    *(CGFloat *)v17 = MidX;
    *(CGFloat *)(v17 + 8) = MidY;
    *(double *)(v17 + 16) = v18;
    *(float32x2_t *)(v17 + 24) = vcvt_f32_f64(v22);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1068) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                             + 1144);
  }
  v522.origin.x = (*(double (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  x = v522.origin.x;
  y = v522.origin.y;
  v25 = v522.size.width;
  v26 = v522.size.height;
  v27 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1056);
  v28 = *(double *)(a1 + 96);
  v29 = CGRectGetMidX(v522);
  v523.origin.x = x;
  v523.origin.y = y;
  v523.size.width = v25;
  v523.size.height = v26;
  v30 = CGRectGetMidY(v523);
  v524.origin.x = x;
  v524.origin.y = y;
  v524.size.width = v25;
  v524.size.height = v26;
  v449 = CGRectGetWidth(v524);
  v525.origin.x = x;
  v525.origin.y = y;
  v525.size.width = v25;
  v525.size.height = v26;
  v31 = CGRectGetHeight(v525);
  v32.f64[0] = v449;
  v32.f64[1] = v31;
  *(CGFloat *)v27 = v29;
  *(CGFloat *)(v27 + 8) = v30;
  *(double *)(v27 + 16) = v28;
  *(float32x2_t *)(v27 + 24) = vcvt_f32_f64(v32);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1056) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  v33 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1060);
  v34 = *(double *)(a1 + 96);
  v35 = x;
  v32.f64[0] = y;
  v36 = v25;
  v37 = v26;
  v38 = CGRectGetMidX(*(CGRect *)((char *)&v32 - 8));
  v526.origin.x = x;
  v526.origin.y = y;
  v526.size.width = v25;
  v526.size.height = v26;
  v39 = CGRectGetMidY(v526);
  v527.origin.x = x;
  v527.origin.y = y;
  v527.size.width = v25;
  v527.size.height = v26;
  v450 = CGRectGetWidth(v527);
  v528.origin.x = x;
  v528.origin.y = y;
  v528.size.width = v25;
  v528.size.height = v26;
  v40 = CGRectGetHeight(v528);
  v41.f64[0] = v450;
  v41.f64[1] = v40;
  *(CGFloat *)v33 = v38;
  *(CGFloat *)(v33 + 8) = v39;
  *(double *)(v33 + 16) = v34;
  *(float32x2_t *)(v33 + 24) = vcvt_f32_f64(v41);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1060) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  v42 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1064);
  v43 = *(double *)(a1 + 96);
  v44 = x;
  v41.f64[0] = y;
  v45 = v25;
  v46 = v26;
  v47 = CGRectGetMidX(*(CGRect *)((char *)&v41 - 8));
  v529.origin.x = x;
  v529.origin.y = y;
  v529.size.width = v25;
  v529.size.height = v26;
  v48 = CGRectGetMidY(v529);
  v530.origin.x = x;
  v530.origin.y = y;
  v530.size.width = v25;
  v530.size.height = v26;
  v451 = CGRectGetWidth(v530);
  v531.origin.x = x;
  v531.origin.y = y;
  v531.size.width = v25;
  v531.size.height = v26;
  v49 = CGRectGetHeight(v531);
  v50.f64[0] = v451;
  v50.f64[1] = v49;
  *(CGFloat *)v42 = v47;
  *(CGFloat *)(v42 + 8) = v48;
  *(double *)(v42 + 16) = v43;
  *(float32x2_t *)(v42 + 24) = vcvt_f32_f64(v50);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1064) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  if (objc_msgSend(*(id *)(a1 + 32), "playButtonPlacement") == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v57 = CGRectGetMidX(*(CGRect *)(a1 + 104)) + v53 * -0.5;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "playButtonPlacement") == 4)
  {
    v58 = *(double **)(*(_QWORD *)(a1 + 88) + 8);
    v57 = v58[4];
    v52 = v58[5];
    v54 = v58[6];
    v56 = v58[7];
  }
  else
  {
    v57 = (*(double (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v52 = v59;
    v54 = v60;
    v56 = v61;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldVerticallyCenterPlayButton"))
    v52 = CGRectGetMidY(*(CGRect *)(a1 + 104)) + v56 * -0.5;
  v62 = (id *)(a1 + 40);
  v63 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1024);
  v64 = *(double *)(a1 + 96);
  v532.origin.x = v57;
  v532.origin.y = v52;
  v532.size.width = v54;
  v532.size.height = v56;
  v65 = CGRectGetMidX(v532);
  v533.origin.x = v57;
  v533.origin.y = v52;
  v533.size.width = v54;
  v533.size.height = v56;
  v66 = CGRectGetMidY(v533);
  v534.origin.x = v57;
  v534.origin.y = v52;
  v534.size.width = v54;
  v534.size.height = v56;
  v452 = CGRectGetWidth(v534);
  v535.origin.x = v57;
  v535.origin.y = v52;
  v535.size.width = v54;
  v535.size.height = v56;
  v67 = CGRectGetHeight(v535);
  v68.f64[0] = v452;
  v68.f64[1] = v67;
  *(CGFloat *)v63 = v65;
  *(CGFloat *)(v63 + 8) = v66;
  *(double *)(v63 + 16) = v64;
  *(float32x2_t *)(v63 + 24) = vcvt_f32_f64(v68);
  *(_WORD *)(a5 + 40 * *((unsigned int *)*v62 + 256) + 32) = *((_WORD *)*v62 + 572);
  v69 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*v62, "_buttonConfigurationForSpriteIndex:", *((unsigned int *)*v62 + 257));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (*(double (**)(uint64_t, void *, uint64_t))(v69 + 16))(v69, v70, 1);
  v73 = v72;
  v75 = v74;
  v77 = v76;

  v78 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1028);
  v79 = *(double *)(a1 + 96);
  v536.origin.x = v71;
  v536.origin.y = v73;
  v536.size.width = v75;
  v536.size.height = v77;
  v80 = CGRectGetMidX(v536);
  v537.origin.x = v71;
  v537.origin.y = v73;
  v537.size.width = v75;
  v537.size.height = v77;
  v81 = CGRectGetMidY(v537);
  v538.origin.x = v71;
  v538.origin.y = v73;
  v538.size.width = v75;
  v538.size.height = v77;
  v453 = CGRectGetWidth(v538);
  v539.origin.x = v71;
  v539.origin.y = v73;
  v539.size.width = v75;
  v539.size.height = v77;
  v82 = CGRectGetHeight(v539);
  v83.f64[0] = v453;
  v83.f64[1] = v82;
  *(CGFloat *)v78 = v80;
  *(CGFloat *)(v78 + 8) = v81;
  *(double *)(v78 + 16) = v79;
  *(float32x2_t *)(v78 + 24) = vcvt_f32_f64(v83);
  *(_WORD *)(a5 + 40 * *((unsigned int *)*v62 + 257) + 32) = *((_WORD *)*v62 + 572);
  v84 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*v62, "_buttonConfigurationForSpriteIndex:", *((unsigned int *)*v62 + 282));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (*(double (**)(uint64_t, void *, uint64_t))(v84 + 16))(v84, v85, 1);
  v88 = v87;
  v90 = v89;
  v92 = v91;

  v93 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1128);
  v94 = *(double *)(a1 + 96);
  v540.origin.x = v86;
  v540.origin.y = v88;
  v540.size.width = v90;
  v540.size.height = v92;
  v95 = CGRectGetMidX(v540);
  v541.origin.x = v86;
  v541.origin.y = v88;
  v541.size.width = v90;
  v541.size.height = v92;
  v96 = CGRectGetMidY(v541);
  v542.origin.x = v86;
  v542.origin.y = v88;
  v542.size.width = v90;
  v542.size.height = v92;
  v454 = CGRectGetWidth(v542);
  v543.origin.x = v86;
  v543.origin.y = v88;
  v543.size.width = v90;
  v543.size.height = v92;
  v97 = CGRectGetHeight(v543);
  v98.f64[0] = v454;
  v98.f64[1] = v97;
  *(CGFloat *)v93 = v95;
  *(CGFloat *)(v93 + 8) = v96;
  *(double *)(v93 + 16) = v94;
  *(float32x2_t *)(v93 + 24) = vcvt_f32_f64(v98);
  *(_WORD *)(a5 + 40 * *((unsigned int *)*v62 + 282) + 32) = *((_WORD *)*v62 + 572);
  v99 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*v62, "_buttonConfigurationForSpriteIndex:", *((unsigned int *)*v62 + 283));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (*(double (**)(uint64_t, void *, uint64_t))(v99 + 16))(v99, v100, 1);
  v103 = v102;
  v105 = v104;
  v107 = v106;

  v108 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1132);
  v109 = *(double *)(a1 + 96);
  v544.origin.x = v101;
  v544.origin.y = v103;
  v544.size.width = v105;
  v544.size.height = v107;
  v110 = CGRectGetMidX(v544);
  v545.origin.x = v101;
  v545.origin.y = v103;
  v545.size.width = v105;
  v545.size.height = v107;
  v111 = CGRectGetMidY(v545);
  v546.origin.x = v101;
  v546.origin.y = v103;
  v546.size.width = v105;
  v546.size.height = v107;
  v455 = CGRectGetWidth(v546);
  v547.origin.x = v101;
  v547.origin.y = v103;
  v547.size.width = v105;
  v547.size.height = v107;
  v112 = CGRectGetHeight(v547);
  v113.f64[0] = v455;
  v113.f64[1] = v112;
  *(CGFloat *)v108 = v110;
  *(CGFloat *)(v108 + 8) = v111;
  *(double *)(v108 + 16) = v109;
  *(float32x2_t *)(v108 + 24) = vcvt_f32_f64(v113);
  *(_WORD *)(a5 + 40 * *((unsigned int *)*v62 + 283) + 32) = *((_WORD *)*v62 + 572);
  v510 = 0;
  v511 = (CGRect *)&v510;
  v512 = 0x4010000000;
  v513 = &unk_1A7E74EE7;
  v514 = 0u;
  v515 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "playbackEndButtonSize");
  objc_msgSend(*(id *)(a1 + 32), "playbackEndButtonPadding");
  v403 = (__int128 *)(a1 + 104);
  PXRectWithSizeAlignedToRectEdgesWithPadding();
  *(_QWORD *)&v514 = v114;
  *((_QWORD *)&v514 + 1) = v115;
  *(_QWORD *)&v515 = v116;
  *((_QWORD *)&v515 + 1) = v117;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_6;
  aBlock[3] = &unk_1E5128070;
  v509 = &v510;
  v508 = *(id *)(a1 + 32);
  v437 = (double (**)(void))_Block_copy(aBlock);
  v118 = v437[2]();
  v120 = v119;
  v122 = v121;
  v124 = v123;
  v125 = objc_msgSend(*(id *)(a1 + 32), "onlyShowReplayEndButtonAtTopOfTitle");
  v126 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v127 = v126;
  v128 = *MEMORY[0x1E0C9D648];
  v129 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v410 = v129;
  v412 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v438 = *MEMORY[0x1E0C9D648];
  v423 = v412;
  v426 = v126;
  r2 = v126;
  v420 = v129;
  v442 = *MEMORY[0x1E0C9D648];
  v404 = *MEMORY[0x1E0C9D648];
  v405 = v412;
  v414 = v129;
  v416 = v412;
  v430 = v118;
  rect = v124;
  r1 = v122;
  v407 = v120;
  if ((v125 & 1) == 0)
  {
    v130 = ((double (*)(double (**)(void)))v437[2])(v437);
    v414 = v131;
    v416 = v132;
    r2 = v133;
    v128 = v130;
    v442 = ((double (*)(double (**)(void)))v437[2])(v437);
    v420 = v134;
    v423 = v135;
    v426 = v136;
    v127 = v126;
    v410 = v129;
    v438 = v404;
    if (objc_msgSend(*(id *)(a1 + 48), "wantsFeedbackAction"))
    {
      v438 = v437[2]();
      v410 = v137;
      v412 = v138;
      v127 = v139;
    }
    v548.origin.x = v118;
    v548.origin.y = v120;
    v548.size.width = v122;
    v548.size.height = v124;
    v604.origin.x = v128;
    v604.origin.y = v414;
    v604.size.width = v416;
    v604.size.height = r2;
    v549 = CGRectUnion(v548, v604);
    v605.origin.x = v442;
    v605.origin.y = v420;
    v605.size.width = v423;
    v605.size.height = v426;
    v550 = CGRectUnion(v549, v605);
    v430 = v550.origin.x;
    rect = v550.size.height;
    v407 = v550.origin.y;
    r1 = v550.size.width;
    if (objc_msgSend(*(id *)(a1 + 48), "wantsFeedbackAction"))
    {
      v551.origin.x = v430;
      v551.size.height = rect;
      v551.origin.y = v407;
      v551.size.width = r1;
      v606.origin.x = v438;
      v606.origin.y = v410;
      v606.size.width = v412;
      v606.size.height = v127;
      v552 = CGRectUnion(v551, v606);
      v430 = v552.origin.x;
      rect = v552.size.height;
      v407 = v552.origin.y;
      r1 = v552.size.width;
    }
  }
  v396 = v129;
  v397 = v126;
  v398 = v127;
  if (objc_msgSend(*(id *)(a1 + 32), "playButtonPlacement") == 1)
  {
    v140 = v124;
    v141 = CGRectGetMidX(*(CGRect *)(a1 + 104));
    v553.origin.x = v430;
    v553.origin.y = v407;
    v553.size.width = r1;
    v553.size.height = rect;
    v142 = v141 - CGRectGetMidX(v553);
    v118 = v118 + v142;
    v442 = v442 + v142;
    v128 = v128 + v142;
    v438 = v438 + v142;
    v430 = v430 + v142;
    v124 = v140;
  }
  v143 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1072);
  v144 = *(double *)(a1 + 96);
  v554.origin.x = v118;
  v554.origin.y = v120;
  v554.size.width = v122;
  v554.size.height = v124;
  v145 = CGRectGetMidX(v554);
  v555.origin.x = v118;
  v555.origin.y = v120;
  v555.size.width = v122;
  v555.size.height = v124;
  v146 = CGRectGetMidY(v555);
  v556.origin.x = v118;
  v556.origin.y = v120;
  v556.size.width = v122;
  v556.size.height = v124;
  v400 = CGRectGetWidth(v556);
  v557.origin.x = v118;
  v557.origin.y = v120;
  v557.size.width = v122;
  v557.size.height = v124;
  v147 = CGRectGetHeight(v557);
  v408 = v118;
  v394 = v120;
  v395 = v124;
  v148 = v144;
  v149.f64[0] = v400;
  v149.f64[1] = v147;
  v150 = a3 + 32 * v143;
  *(CGFloat *)v150 = v145;
  *(CGFloat *)(v150 + 8) = v146;
  *(double *)(v150 + 16) = v148;
  *(float32x2_t *)(v150 + 24) = vcvt_f32_f64(v149);
  v151 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1076);
  v152 = *(double *)(a1 + 96);
  v153 = v442;
  v154 = v420;
  v149.f64[0] = v423;
  v155 = v426;
  v156 = CGRectGetMidX(*(CGRect *)(&v149 - 1));
  v558.origin.x = v442;
  v558.origin.y = v420;
  v558.size.width = v423;
  v558.size.height = v426;
  v157 = CGRectGetMidY(v558);
  v559.origin.x = v442;
  v559.origin.y = v420;
  v559.size.width = v423;
  v559.size.height = v426;
  v401 = CGRectGetWidth(v559);
  v560.origin.x = v442;
  v560.origin.y = v420;
  v560.size.width = v423;
  v560.size.height = v426;
  v158 = CGRectGetHeight(v560);
  v159 = v152;
  v160.f64[0] = v401;
  v160.f64[1] = v158;
  v161 = a3 + 32 * v151;
  *(CGFloat *)v161 = v156;
  *(CGFloat *)(v161 + 8) = v157;
  *(double *)(v161 + 16) = v159;
  *(float32x2_t *)(v161 + 24) = vcvt_f32_f64(v160);
  v162 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1080);
  v163 = *(double *)(a1 + 96);
  v164 = v128;
  v165 = v414;
  v160.f64[0] = v416;
  v166 = r2;
  v167 = CGRectGetMidX(*(CGRect *)(&v160 - 1));
  v561.origin.x = v128;
  v561.origin.y = v414;
  v561.size.width = v416;
  v561.size.height = r2;
  v168 = CGRectGetMidY(v561);
  v562.origin.x = v128;
  v562.origin.y = v414;
  v562.size.width = v416;
  v562.size.height = r2;
  v443 = CGRectGetWidth(v562);
  v563.origin.x = v128;
  v563.origin.y = v414;
  v563.size.width = v416;
  v563.size.height = r2;
  v169 = CGRectGetHeight(v563);
  v170 = v163;
  v171.f64[0] = v443;
  v171.f64[1] = v169;
  v172 = a3 + 32 * v162;
  *(CGFloat *)v172 = v167;
  *(CGFloat *)(v172 + 8) = v168;
  *(double *)(v172 + 16) = v170;
  *(float32x2_t *)(v172 + 24) = vcvt_f32_f64(v171);
  v173 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1084);
  v174 = *(double *)(a1 + 96);
  v175 = v128;
  v176 = v414;
  v171.f64[0] = v416;
  v177 = r2;
  v178 = CGRectGetMidX(*(CGRect *)(&v171 - 1));
  v564.origin.x = v128;
  v564.origin.y = v414;
  v564.size.width = v416;
  v564.size.height = r2;
  v179 = CGRectGetMidY(v564);
  v565.origin.x = v128;
  v565.origin.y = v414;
  v565.size.width = v416;
  v565.size.height = r2;
  v444 = CGRectGetWidth(v565);
  v566.origin.x = v128;
  v566.origin.y = v414;
  v566.size.width = v416;
  v566.size.height = r2;
  v180 = CGRectGetHeight(v566);
  v181 = v174;
  v182.f64[0] = v444;
  v182.f64[1] = v180;
  v183 = a3 + 32 * v173;
  *(CGFloat *)v183 = v178;
  *(CGFloat *)(v183 + 8) = v179;
  *(double *)(v183 + 16) = v181;
  *(float32x2_t *)(v183 + 24) = vcvt_f32_f64(v182);
  v184 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1088);
  v185 = *(double *)(a1 + 96);
  v186 = v438;
  v187 = v410;
  v182.f64[0] = v412;
  v188 = v398;
  v189 = CGRectGetMidX(*(CGRect *)(&v182 - 1));
  v567.origin.x = v438;
  v567.origin.y = v410;
  v567.size.width = v412;
  v567.size.height = v398;
  v190 = CGRectGetMidY(v567);
  v568.origin.x = v438;
  v568.origin.y = v410;
  v568.size.width = v412;
  v568.size.height = v398;
  v445 = CGRectGetWidth(v568);
  v569.origin.x = v438;
  v569.origin.y = v410;
  v569.size.width = v412;
  v569.size.height = v398;
  v191 = CGRectGetHeight(v569);
  v192 = v185;
  v193.f64[0] = v445;
  v193.f64[1] = v191;
  v194 = a3 + 32 * v184;
  *(CGFloat *)v194 = v189;
  *(CGFloat *)(v194 + 8) = v190;
  *(double *)(v194 + 16) = v192;
  *(float32x2_t *)(v194 + 24) = vcvt_f32_f64(v193);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1072) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1076) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1080) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1084) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1088) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1072) + 24) = 0x20000;
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1076) + 24) = 0x20000;
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1080) + 24) = 0x20000;
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1084) + 24) = 0x20000;
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1088) + 24) = 0x20000;
  objc_msgSend(*(id *)(a1 + 40), "mainLayoutSpec");
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1112);
  CGRectGetMidX(*(CGRect *)(a1 + 104));
  CGRectGetMaxY(*(CGRect *)(a1 + 104));
  objc_msgSend(v446, "distanceBetweenBufferingIndicatorCenterAndBottom");
  objc_msgSend(v446, "bufferingIndicatorSize");
  PXRectWithCenterAndSize();
  v196 = v570.origin.x;
  v197 = v570.origin.y;
  v198 = v570.size.width;
  v199 = v570.size.height;
  v200 = *(double *)(a1 + 96);
  v201 = CGRectGetMidX(v570);
  v571.origin.x = v196;
  v571.origin.y = v197;
  v571.size.width = v198;
  v571.size.height = v199;
  v202 = CGRectGetMidY(v571);
  v572.origin.x = v196;
  v572.origin.y = v197;
  v572.size.width = v198;
  v572.size.height = v199;
  v439 = CGRectGetWidth(v572);
  v573.origin.x = v196;
  v573.origin.y = v197;
  v573.size.width = v198;
  v573.size.height = v199;
  v203 = CGRectGetHeight(v573);
  v204 = a3 + 32 * v195;
  v205 = v200;
  v206.f64[0] = v439;
  v206.f64[1] = v203;
  *(CGFloat *)v204 = v201;
  *(CGFloat *)(v204 + 8) = v202;
  *(double *)(v204 + 16) = v205;
  *(float32x2_t *)(v204 + 24) = vcvt_f32_f64(v206);
  LODWORD(v143) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1112);
  objc_msgSend(*(id *)(a1 + 32), "bufferingIndicatorCornerRadius");
  *(float *)&v207 = v207;
  *(int32x4_t *)(a4 + 160 * v143 + 36) = vdupq_lane_s32(*(int32x2_t *)&v207, 0);
  v208 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_buttonConfigurationForSpriteIndex:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1108));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = (*(double (**)(uint64_t, void *, _QWORD))(v208 + 16))(v208, v209, 0);
  v212 = v211;
  v214 = v213;
  v216 = v215;

  v217 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1108);
  v218 = *(double *)(a1 + 96);
  v574.origin.x = v210;
  v574.origin.y = v212;
  v574.size.width = v214;
  v574.size.height = v216;
  v219 = CGRectGetMidX(v574);
  v575.origin.x = v210;
  v575.origin.y = v212;
  v575.size.width = v214;
  v575.size.height = v216;
  v220 = CGRectGetMidY(v575);
  v576.origin.x = v210;
  v576.origin.y = v212;
  v576.size.width = v214;
  v576.size.height = v216;
  v440 = CGRectGetWidth(v576);
  v577.origin.x = v210;
  v577.origin.y = v212;
  v577.size.width = v214;
  v577.size.height = v216;
  v221 = CGRectGetHeight(v577);
  v222 = v218;
  v223.f64[0] = v440;
  v223.f64[1] = v221;
  v224 = a3 + 32 * v217;
  *(CGFloat *)v224 = v219;
  *(CGFloat *)(v224 + 8) = v220;
  *(double *)(v224 + 16) = v222;
  *(float32x2_t *)(v224 + 24) = vcvt_f32_f64(v223);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1108) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  v506[0] = MEMORY[0x1E0C809B0];
  v506[1] = 3221225472;
  v506[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_7;
  v506[3] = &unk_1E5128098;
  v506[6] = *(_QWORD *)(a1 + 96);
  v506[7] = a5;
  v225 = *(_QWORD *)(a1 + 40);
  v506[5] = a3;
  v506[4] = v225;
  v226 = v408;
  v227 = _Block_copy(v506);
  v500 = 0;
  v501 = (CGRect *)&v500;
  v502 = 0x4010000000;
  v503 = &unk_1A7E74EE7;
  v228 = (__int128 *)MEMORY[0x1E0C9D628];
  v229 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v504 = *MEMORY[0x1E0C9D628];
  v505 = v229;
  v496[0] = MEMORY[0x1E0C809B0];
  v496[1] = 3221225472;
  v496[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_8;
  v496[3] = &unk_1E51280C0;
  v230 = *(id *)(a1 + 72);
  v231 = *(_QWORD *)(a1 + 40);
  v497 = v230;
  v496[4] = v231;
  v232 = v227;
  v498 = v232;
  v499 = &v500;
  v441 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(v496);
  v441[2](v441, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1048), objc_msgSend(*(id *)(a1 + 48), "allowedChromeItems") & 1);
  (*((void (**)(id, _QWORD))v232 + 2))(v232, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1052));
  if (objc_msgSend(*(id *)(a1 + 32), "styleSwitcherButtonPlacement") == 2)
  {
    v233 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "_buttonConfigurationForSpriteIndex:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1068));
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    v235 = (*(double (**)(uint64_t, void *, _QWORD))(v233 + 16))(v233, v234, 0);
    v237 = v236;
    v239 = v238;
    v241 = v240;

    v242 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1068);
    v243 = *(double *)(a1 + 96);
    v578.origin.x = v235;
    v578.origin.y = v237;
    v578.size.width = v239;
    v578.size.height = v241;
    v244 = CGRectGetMidX(v578);
    v579.origin.x = v235;
    v579.origin.y = v237;
    v579.size.width = v239;
    v579.size.height = v241;
    v245 = CGRectGetMidY(v579);
    v580.origin.x = v235;
    v580.origin.y = v237;
    v580.size.width = v239;
    v580.size.height = v241;
    v427 = CGRectGetWidth(v580);
    v581.origin.x = v235;
    v581.origin.y = v237;
    v581.size.width = v239;
    v581.size.height = v241;
    v246 = CGRectGetHeight(v581);
    v247 = v243;
    v248.f64[0] = v427;
    v248.f64[1] = v246;
    v249 = a3 + 32 * v242;
    *(CGFloat *)v249 = v244;
    *(CGFloat *)(v249 + 8) = v245;
    *(double *)(v249 + 16) = v247;
    *(float32x2_t *)(v249 + 24) = vcvt_f32_f64(v248);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1068) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                             + 1144);
    v226 = v408;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "muteToggleButtonPlacement") == 2)
    v441[2](v441, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1036), objc_msgSend(*(id *)(a1 + 32), "canShowMuteToggleButton"));
  v490 = 0;
  v491 = (CGRect *)&v490;
  v492 = 0x4010000000;
  v493 = &unk_1A7E74EE7;
  v250 = v228[1];
  v494 = *v228;
  v495 = v250;
  v486[0] = MEMORY[0x1E0C809B0];
  v486[1] = 3221225472;
  v486[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_9;
  v486[3] = &unk_1E51280C0;
  v251 = *(id *)(a1 + 80);
  v252 = *(_QWORD *)(a1 + 40);
  v487 = v251;
  v486[4] = v252;
  r2a = v232;
  v488 = r2a;
  v489 = &v490;
  v253 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(v486);
  v254 = objc_msgSend(*(id *)(a1 + 48), "allowedChromeItems");
  v255 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032);
  if ((v254 & 1) != 0)
  {
    v256 = objc_msgSend(*(id *)(a1 + 48), "shouldShowErrorIndicator");
    v257 = v253;
  }
  else
  {
    v256 = objc_msgSend(*(id *)(a1 + 48), "shouldShowErrorIndicator");
    v257 = v441;
  }
  v257[2](v257, v255, v256);
  v253[2](v253, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1040), 1);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1040) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1146);
  v253[2](v253, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1044), 1);
  if (objc_msgSend(*(id *)(a1 + 32), "muteToggleButtonPlacement") == 3)
    v253[2](v253, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1036), objc_msgSend(*(id *)(a1 + 32), "canShowMuteToggleButton"));
  if (objc_msgSend(*(id *)(a1 + 48), "viewMode") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "browseChromeTitleSpec");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v259 = objc_msgSend(*(id *)(a1 + 48), "wantsRelatedOverlayVisible");
    v260 = *(void **)(a1 + 32);
    if (v259)
      objc_msgSend(v260, "playbackEndChromeTitleSpec");
    else
      objc_msgSend(v260, "generalChromeTitleSpec");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v261 = v258;
  v262 = objc_msgSend(v258, "textAlignment");
  objc_msgSend(v261, "margins");
  v413 = v264;
  v415 = v263;
  v417 = v265;
  v267 = v266;
  v268 = objc_msgSend(*(id *)(a1 + 48), "wantsRelatedOverlayVisible");
  if (v268)
  {
    objc_msgSend(*(id *)(a1 + 32), "maximumWidthForRelatedTitleAndSubtitle");
    v269 = *(void **)(a1 + 32);
    if (v270 == 1.79769313e308)
    {
      v276 = objc_msgSend(v269, "playButtonPlacement");
      v277 = *(void **)(a1 + 32);
      if (v276 == 1)
      {
        objc_msgSend(v277, "relatedLayoutMetrics");
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v278, "margins");
        PXEdgeInsetsInsetRect();
        v272 = v279;

      }
      else
      {
        objc_msgSend(v277, "playbackEndButtonPadding");
        v272 = r1 + (v280 + -40.0) * 2.0;
      }
    }
    else
    {
      objc_msgSend(v269, "maximumWidthForRelatedTitleAndSubtitle");
      v272 = v271;
    }
  }
  else if (v262 == 1)
  {
    MaxX = CGRectGetMaxX(v501[1]);
    v274 = CGRectGetMaxX(*(CGRect *)(a1 + 104));
    MinX = CGRectGetMinX(v491[1]);
    v272 = CGRectGetWidth(*(CGRect *)(a1 + 104)) + fmax(fmax(MaxX, v267), fmax(v274 - MinX, v417)) * -2.0;
  }
  else
  {
    if (v262)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v393 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v393, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 40), CFSTR("PXStoryChromeLayout.m"), 626, CFSTR("unsupported text alignment %li"), v262);

      abort();
    }
    v272 = CGRectGetWidth(*(CGRect *)(a1 + 104)) - v267 - v417;
  }
  objc_msgSend(*(id *)(a1 + 40), "mainModel");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v411 = v262;
  v282 = objc_msgSend(v281, "viewMode") != 1;

  v283 = v272 > 0.0 || v282;
  if ((v283 & 1) == 0)
  {
    PXAssertGetLog();
    v284 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v284, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.origin.x) = 134217984;
      *(double *)((char *)&buf.origin.x + 4) = v272;
      _os_log_error_impl(&dword_1A6789000, v284, OS_LOG_TYPE_ERROR, "Incorrect max label width (%f) for label", (uint8_t *)&buf, 0xCu);
    }

  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v285 = v397;
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v287 = objc_msgSend(v286, "preferTopChromeItemsInAppNavigationBar");
  objc_msgSend(*(id *)(a1 + 32), "minimumWidthRequiredForChromeText");
  v288 = &OBJC_IVAR___PXSwipeDownSettings__rotationVerticalMotionResistanceDistance;
  if (v272 > v289 && v287 ^ 1 | v268)
  {
    v409 = v267;
    v290 = v404;
    v291 = v405;
    v292 = v396;
    v424 = v396;
    v428 = v404;
    v421 = v405;
    v293 = v397;
    if ((objc_msgSend(v261, "hidden") & 1) == 0)
    {
      v294 = objc_msgSend(v261, "numberOfTitleLines");
      v295 = objc_msgSend(v261, "numberOfSubtitleLines");
      v485[0] = MEMORY[0x1E0C809B0];
      v485[1] = 3221225472;
      v485[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_189;
      v485[3] = &unk_1E51280E8;
      v485[4] = *(_QWORD *)(a1 + 40);
      *(double *)&v485[5] = v272;
      v406 = (double (**)(void *, _QWORD, uint64_t))_Block_copy(v485);
      v429 = v406[2](v406, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092), v294);
      v297 = v296;
      v422 = v406[2](v406, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1096), v295);
      v399 = v298;
      v402 = v297;
      v425 = v297 + v298;
      if (objc_msgSend(*(id *)(a1 + 32), "onlyShowReplayEndButtonAtTopOfTitle"))
      {
        memset(&buf, 0, sizeof(buf));
        objc_msgSend(*(id *)(a1 + 40), "layoutGenerator");
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v299, "metrics");
        r1a = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(r1a, "referenceSize");
        v301 = v300;
        v303 = v302;
        objc_msgSend(*(id *)(a1 + 40), "referenceSize");
        if (v301 != v305 || v303 != v304)
        {
          v306 = (void *)objc_msgSend(r1a, "copy");
          objc_msgSend(*(id *)(a1 + 40), "referenceSize");
          objc_msgSend(v306, "setReferenceSize:");
          objc_msgSend(*(id *)(a1 + 40), "layoutGenerator");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v307, "setMetrics:", v306);

        }
        objc_msgSend(*(id *)(a1 + 40), "layoutGenerator");
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v308, "getFrames:forItemsInRange:", &buf, 0, 1);

        v582.origin.x = v226;
        v582.origin.y = v394;
        v582.size.width = v122;
        v582.size.height = v395;
        CGRectGetMidX(v582);
        CGRectGetMidY(buf);
        v583.origin.x = v408;
        v583.origin.y = v394;
        v583.size.width = v122;
        v583.size.height = v395;
        CGRectGetHeight(v583);
        objc_msgSend(*(id *)(a1 + 32), "spacingBetweenPlaybackEndButtonAndTitles");
        v584.origin.x = v408;
        v584.origin.y = v394;
        v584.size.width = v122;
        v584.size.height = v395;
        CGRectGetWidth(v584);
        PXRectWithCenterAndSize();
        PXRectWithSizeAlignedToRectEdgesWithPadding();
        v309 = v585.origin.x;
        v310 = v585.size.width;
        v311 = v585.size.height;
        v511[1] = v585;
        v312 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1072);
        v313 = v585.origin.y;
        v314 = *(double *)(a1 + 96);
        v315 = CGRectGetMidX(v585);
        v586.origin.x = v309;
        v586.origin.y = v313;
        v586.size.width = v310;
        v586.size.height = v311;
        v316 = CGRectGetMidY(v586);
        v587.origin.x = v309;
        v587.origin.y = v313;
        v587.size.width = v310;
        v587.size.height = v311;
        recta = CGRectGetWidth(v587);
        v588.origin.x = v309;
        v588.origin.y = v313;
        v588.size.width = v310;
        v588.size.height = v311;
        v317 = CGRectGetHeight(v588);
        v318 = v314;
        v319.f64[0] = recta;
        v319.f64[1] = v317;
        v320 = a3 + 32 * v312;
        *(CGFloat *)v320 = v315;
        *(CGFloat *)(v320 + 8) = v316;
        *(double *)(v320 + 16) = v318;
        *(float32x2_t *)(v320 + 24) = vcvt_f32_f64(v319);

        v321 = v311;
        v322 = v311;
        v122 = v310;
        v323 = v313;
        v226 = v309;
      }
      else
      {
        v323 = v394;
        v310 = r1;
        v313 = v407;
        v309 = v430;
        v322 = rect;
        v321 = v395;
      }
      v462[0] = MEMORY[0x1E0C809B0];
      v462[1] = 3221225472;
      v462[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_2_191;
      v462[3] = &unk_1E5128110;
      v463 = *(id *)(a1 + 48);
      v375 = *(id *)(a1 + 32);
      v469 = v226;
      v470 = v323;
      v471 = v122;
      v472 = v321;
      v464 = v375;
      v467 = &v510;
      v473 = v309;
      v474 = v313;
      v475 = v310;
      v476 = v322;
      v376 = v261;
      v377 = *(_QWORD *)(a1 + 40);
      v378 = *(_QWORD *)(a1 + 136);
      v465 = v376;
      v466 = v377;
      v477 = v378;
      v468 = &v490;
      v478 = v411;
      v379 = *(_OWORD *)(a1 + 120);
      v479 = *v403;
      v480 = v379;
      v481 = v415;
      v482 = v409;
      v483 = v413;
      v484 = v417;
      v380 = (double (**)(void *, _QWORD, double, double, double, double))_Block_copy(v462);
      v290 = v380[2](v380, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092), v429, v402, v425, 0.0);
      v382 = v381;
      v384 = v383;
      v386 = v385;
      v387 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1096);
      objc_msgSend(*(id *)(a1 + 32), "spacingBetweenPlaybackEndTitleAndSubtitle");
      v389 = v380[2](v380, v387, v422, v399, v425, v402 + v388);
      v293 = v390;
      v421 = v392;
      v424 = v391;
      v428 = v389;

      v291 = v384;
      v285 = v386;
      v292 = v382;
      v288 = &OBJC_IVAR___PXSwipeDownSettings__rotationVerticalMotionResistanceDistance;
    }
  }
  else
  {
    v290 = v404;
    v291 = v405;
    v292 = v396;
    v424 = v396;
    v428 = v404;
    v421 = v405;
    v293 = v397;
  }
  v324 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092);
  v325 = *(double *)(a1 + 96);
  v589.origin.x = v290;
  v589.origin.y = v292;
  v589.size.width = v291;
  v589.size.height = v285;
  v326 = CGRectGetMidX(v589);
  v590.origin.x = v290;
  v590.origin.y = v292;
  v590.size.width = v291;
  v590.size.height = v285;
  v327 = CGRectGetMidY(v590);
  v591.origin.x = v290;
  v591.origin.y = v292;
  v591.size.width = v291;
  v591.size.height = v285;
  r1b = CGRectGetWidth(v591);
  v592.origin.x = v290;
  v592.origin.y = v292;
  v592.size.width = v291;
  v592.size.height = v285;
  v328 = CGRectGetHeight(v592);
  v329 = v325;
  v330.f64[0] = r1b;
  v330.f64[1] = v328;
  v331 = a3 + 32 * v324;
  *(CGFloat *)v331 = v326;
  *(CGFloat *)(v331 + 8) = v327;
  *(double *)(v331 + 16) = v329;
  *(float32x2_t *)(v331 + 24) = vcvt_f32_f64(v330);
  *(_BYTE *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092) + 70) = 6;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1144);
  *(float *)&v328 = *(double *)(a1 + 144);
  v332 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092);
  *(float32x2_t *)(a5 + 40 * v332 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v332 + 24), *(float *)&v328);
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1092) + 24) = 0x20000;
  v333 = v288[880];
  v334 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + v333);
  v335 = *(double *)(a1 + 96);
  v336 = v428;
  v337 = v424;
  v330.f64[0] = v421;
  v338 = v293;
  v339 = CGRectGetMidX(*(CGRect *)(&v330 - 1));
  v593.origin.x = v428;
  v593.origin.y = v424;
  v593.size.width = v421;
  v593.size.height = v293;
  v340 = CGRectGetMidY(v593);
  v594.origin.x = v428;
  v594.origin.y = v424;
  v594.size.width = v421;
  v594.size.height = v293;
  r1c = CGRectGetWidth(v594);
  v595.origin.x = v428;
  v595.origin.y = v424;
  v595.size.width = v421;
  v595.size.height = v293;
  v341 = CGRectGetHeight(v595);
  v342 = v335;
  v343.f64[0] = r1c;
  v343.f64[1] = v341;
  v344 = a3 + 32 * v334;
  *(CGFloat *)v344 = v339;
  *(CGFloat *)(v344 + 8) = v340;
  *(double *)(v344 + 16) = v342;
  *(float32x2_t *)(v344 + 24) = vcvt_f32_f64(v343);
  *(_BYTE *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + v333) + 70) = 6;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + v333) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 1144);
  *(float *)&v341 = *(double *)(a1 + 144);
  v345 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + v333);
  *(float32x2_t *)(a5 + 40 * v345 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v345 + 24), *(float *)&v341);
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + v333) + 24) = 0x20000;
  v458[0] = MEMORY[0x1E0C809B0];
  v458[1] = 3221225472;
  v458[2] = __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_3_193;
  v458[3] = &unk_1E5128138;
  v459 = *(id *)(a1 + 32);
  v346 = *(_OWORD *)(a1 + 120);
  v460 = *v403;
  v461 = v346;
  v347 = (double (**)(void *, uint64_t))_Block_copy(v458);
  v348 = objc_msgSend(*(id *)(a1 + 32), "rightEdgeHighlightImageVersion");
  v349 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1100);
  v596.origin.x = v347[2](v347, 2);
  v350 = v596.origin.x;
  v351 = v596.origin.y;
  v352 = v596.size.width;
  v353 = v596.size.height;
  v354 = *(double *)(a1 + 96);
  v355 = CGRectGetMidX(v596);
  v597.origin.x = v350;
  v597.origin.y = v351;
  v597.size.width = v352;
  v597.size.height = v353;
  v356 = CGRectGetMidY(v597);
  v598.origin.x = v350;
  v598.origin.y = v351;
  v598.size.width = v352;
  v598.size.height = v353;
  v456 = CGRectGetWidth(v598);
  v599.origin.x = v350;
  v599.origin.y = v351;
  v599.size.width = v352;
  v599.size.height = v353;
  v357 = CGRectGetHeight(v599);
  v358 = a3 + 32 * v349;
  v359 = v354;
  v360.f64[0] = v456;
  v360.f64[1] = v357;
  *(CGFloat *)v358 = v355;
  *(CGFloat *)(v358 + 8) = v356;
  *(double *)(v358 + 16) = v359;
  *(float32x2_t *)(v358 + 24) = vcvt_f32_f64(v360);
  *(_BYTE *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1100) + 70) = 2;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1100) + 32) = v348;
  v361 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1100);
  *(float *)&v357 = *(double *)(a1 + 144);
  *(float32x2_t *)(a5 + 40 * v361 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v361 + 24), *(float *)&v357);
  v362 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1104);
  v600.origin.x = v347[2](v347, 8);
  v363 = v600.origin.x;
  v364 = v600.origin.y;
  v365 = v600.size.width;
  v366 = v600.size.height;
  v367 = *(double *)(a1 + 96);
  v368 = CGRectGetMidX(v600);
  v601.origin.x = v363;
  v601.origin.y = v364;
  v601.size.width = v365;
  v601.size.height = v366;
  v369 = CGRectGetMidY(v601);
  v602.origin.x = v363;
  v602.origin.y = v364;
  v602.size.width = v365;
  v602.size.height = v366;
  v457 = CGRectGetWidth(v602);
  v603.origin.x = v363;
  v603.origin.y = v364;
  v603.size.width = v365;
  v603.size.height = v366;
  v370 = CGRectGetHeight(v603);
  v371.f64[0] = v457;
  v371.f64[1] = v370;
  v372 = vcvt_f32_f64(v371);
  *(float *)v371.f64 = v367;
  v373 = a3 + 32 * v362;
  *(CGFloat *)v373 = v368;
  *(CGFloat *)(v373 + 8) = v369;
  *(double *)(v373 + 16) = *(float *)v371.f64;
  *(float32x2_t *)(v373 + 24) = v372;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1104) + 32) = v348;
  v374 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1104);
  v372.f32[0] = *(double *)(a1 + 144);
  *(float32x2_t *)(a5 + 40 * v374 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v374 + 24), v372.f32[0]);

  _Block_object_dispose(&v490, 8);
  _Block_object_dispose(&v500, 8);

  _Block_object_dispose(&v510, 8);
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_6(uint64_t a1)
{
  double *v2;
  double v3;
  double MaxX;
  double v5;
  CGRect v7;

  v2 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = v2[4];
  v7.origin.x = v3;
  v7.origin.y = v2[5];
  v7.size.width = v2[6];
  v7.size.height = v2[7];
  MaxX = CGRectGetMaxX(v7);
  objc_msgSend(*(id *)(a1 + 32), "interPlaybackEndButtonSpacing");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = MaxX + v5;
  return v3;
}

float32x2_t __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_7(uint64_t a1, unsigned int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12;
  float v13;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v17;
  float32x2_t result;
  CGFloat Width;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v12 = *(_QWORD *)(a1 + 40) + 32 * a2;
  v13 = *(double *)(a1 + 48);
  MidX = CGRectGetMidX(*(CGRect *)&a3);
  v20.origin.x = a3;
  v20.origin.y = a4;
  v20.size.width = a5;
  v20.size.height = a6;
  MidY = CGRectGetMidY(v20);
  v21.origin.x = a3;
  v21.origin.y = a4;
  v21.size.width = a5;
  v21.size.height = a6;
  Width = CGRectGetWidth(v21);
  v22.origin.x = a3;
  v22.origin.y = a4;
  v22.size.width = a5;
  v22.size.height = a6;
  Height = CGRectGetHeight(v22);
  v17.f64[0] = Width;
  v17.f64[1] = Height;
  result = vcvt_f32_f64(v17);
  *(CGFloat *)v12 = MidX;
  *(CGFloat *)(v12 + 8) = MidY;
  *(double *)(v12 + 16) = v13;
  *(float32x2_t *)(v12 + 24) = result;
  *(_WORD *)(*(_QWORD *)(a1 + 56) + 40 * a2 + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 1144);
  return result;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_buttonConfigurationForSpriteIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(double (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, a3);
  v9 = v8;
  v11 = v10;
  v13 = v12;

  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(v7, v9, v11, v13);
  if ((_DWORD)a3)
  {
    v14 = *(double **)(*(_QWORD *)(a1 + 56) + 8);
    v14[4] = v7;
    v14[5] = v9;
    v14[6] = v11;
    v14[7] = v13;
  }
  return v7;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_buttonConfigurationForSpriteIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(double (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, a3);
  v9 = v8;
  v11 = v10;
  v13 = v12;

  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(v7, v9, v11, v13);
  if ((_DWORD)a3)
  {
    v14 = *(double **)(*(_QWORD *)(a1 + 56) + 8);
    v14[4] = v7;
    v14[5] = v9;
    v14[6] = v11;
    v14[7] = v13;
  }
  return v7;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_189(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "attributedStringForSpriteAtIndex:inLayout:", a2, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length")
    && (objc_msgSend(v5, "px_sizeWithProposedWidth:maximumLines:drawingOptions:", a3, 1, *(double *)(a1 + 40)),
        v6 > 0.0))
  {
    v7 = ceil(v6);
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
  }

  return v7;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_2_191(uint64_t a1, double a2)
{
  uint64_t v4;
  double MidX;
  double v6;
  double v7;
  float v8;
  void *v10;

  if (objc_msgSend(*(id *)(a1 + 32), "wantsRelatedOverlayVisible"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "onlyShowReplayEndButtonAtTopOfTitle"))
      CGRectGetMaxY(*(CGRect *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 40), "spacingBetweenPlaybackEndButtonAndTitles");
    v7 = CGRectGetMidX(*(CGRect *)(a1 + 112)) + a2 * -0.5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "safeAreaInsets");
    CGRectGetMidY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
    v4 = *(_QWORD *)(a1 + 152);
    if (v4 == 1)
    {
      MidX = CGRectGetMidX(*(CGRect *)(a1 + 160));
      v6 = a2 * -0.5;
    }
    else
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 56), CFSTR("PXStoryChromeLayout.m"), 695, CFSTR("unsupported text alignment %li"), *(_QWORD *)(a1 + 152));

        abort();
      }
      MidX = CGRectGetMinX(*(CGRect *)(a1 + 160));
      v6 = *(double *)(a1 + 200);
    }
    v7 = MidX + v6;
  }
  v8 = v7;
  return roundf(v8);
}

uint64_t __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_3_193(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "rightEdgeHighlightImageSize");
  CGRectGetHeight(*(CGRect *)(a1 + 40));
  PXSizeScale();
  return PXRectWithSizeAlignedToRectEdges();
}

__n128 __84__PXStoryChromeLayout__addSpriteForChromeItemController_mediaKind_presentationType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  _BYTE *v10;

  v3 = *(_OWORD **)(a3 + 24);
  v4 = *((_OWORD *)off_1E50B83A0 + 7);
  v3[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v3[7] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 9);
  v3[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v3[9] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 3);
  v3[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v3[3] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 5);
  v3[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v3[5] = v7;
  result = *(__n128 *)off_1E50B83A0;
  v9 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v9;
  v10 = *(_BYTE **)(a3 + 32);
  v10[1] = *(_BYTE *)(a1 + 32);
  *v10 = *(_BYTE *)(a1 + 33);
  return result;
}

@end

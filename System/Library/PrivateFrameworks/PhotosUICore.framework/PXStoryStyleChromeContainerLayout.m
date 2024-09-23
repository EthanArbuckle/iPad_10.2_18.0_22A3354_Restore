@implementation PXStoryStyleChromeContainerLayout

- (PXStoryStyleChromeContainerLayout)initWithViewModel:(id)a3
{
  id v5;
  PXStoryStyleChromeContainerLayout *v6;
  uint64_t v7;
  PXCArrayStore *framesArrayStore;
  uint64_t v9;
  PXNumberAnimator *visibilityAnimator;
  NSSet *v11;
  NSSet *artworkPreloadingRecords;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryStyleChromeContainerLayout;
  v6 = -[PXGAbsoluteCompositeLayout init](&v15, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 32);
    framesArrayStore = v6->_framesArrayStore;
    v6->_framesArrayStore = (PXCArrayStore *)v7;

    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[PXStoryViewModel registerChangeObserver:context:](v6->_viewModel, "registerChangeObserver:context:", v6, StoryViewModelObservationContext);
    v9 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    visibilityAnimator = v6->_visibilityAnimator;
    v6->_visibilityAnimator = (PXNumberAnimator *)v9;

    -[PXNumberAnimator registerChangeObserver:context:](v6->_visibilityAnimator, "registerChangeObserver:context:", v6, VisibilityAnimatorObservationContext);
    v6->_styleSublayoutRange.location = 0;
    v6->_styleSublayoutRange.length = 0;
    v11 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    artworkPreloadingRecords = v6->_artworkPreloadingRecords;
    v6->_artworkPreloadingRecords = v11;

    objc_msgSend(v5, "mainModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryStyleChromeContainerLayout setStoryModel:](v6, "setStoryModel:", v13);

    -[PXStoryStyleChromeContainerLayout _updateVisibilityAnimator:](v6, "_updateVisibilityAnimator:", 0);
  }

  return v6;
}

- (PXStoryStyleChromeContainerLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleChromeContainerLayout.m"), 76, CFSTR("%s is not available as initializer"), "-[PXStoryStyleChromeContainerLayout init]");

  abort();
}

- (void)setStoryModel:(id)a3
{
  PXStoryModel **p_storyModel;
  PXStoryModel *v6;
  char v7;
  PXStoryModel *v8;

  v8 = (PXStoryModel *)a3;
  p_storyModel = &self->_storyModel;
  v6 = self->_storyModel;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PXStoryModel isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryModel unregisterChangeObserver:context:](*p_storyModel, "unregisterChangeObserver:context:", self, StoryModelObservationContext_258337);
      objc_storeStrong((id *)&self->_storyModel, a3);
      -[PXStoryModel registerChangeObserver:context:](*p_storyModel, "registerChangeObserver:context:", self, StoryModelObservationContext_258337);
      -[PXStoryStyleChromeContainerLayout _invalidateStyleManager](self, "_invalidateStyleManager");
      -[PXStoryStyleChromeContainerLayout _invalidateVisibilityAnimator](self, "_invalidateVisibilityAnimator");
    }
  }

}

- (void)setStyleManager:(id)a3
{
  PXStoryStyleManager **p_styleManager;
  PXStoryStyleManager *v6;
  char v7;
  PXStoryStyleManager *v8;

  v8 = (PXStoryStyleManager *)a3;
  p_styleManager = &self->_styleManager;
  v6 = self->_styleManager;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PXStoryStyleManager isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryStyleManager unregisterChangeObserver:context:](*p_styleManager, "unregisterChangeObserver:context:", self, StyleManagerObservationContext_258338);
      objc_storeStrong((id *)&self->_styleManager, a3);
      -[PXStoryStyleManager registerChangeObserver:context:](*p_styleManager, "registerChangeObserver:context:", self, StyleManagerObservationContext_258338);
      -[PXStoryStyleChromeContainerLayout _invalidateStyleLayouts](self, "_invalidateStyleLayouts");
    }
  }

}

- (void)setArtworkPreloadingRecords:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  char v6;
  NSSet *v7;
  NSSet *v8;
  NSSet *artworkPreloadingRecords;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  NSSet *v14;
  _QWORD v15[4];
  NSSet *v16;
  _QWORD v17[4];
  NSSet *v18;

  v14 = (NSSet *)a3;
  v4 = self->_artworkPreloadingRecords;
  v5 = v14;
  if (v4 == v14)
    goto LABEL_4;
  v6 = -[NSSet isEqual:](v14, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = self->_artworkPreloadingRecords;
    v8 = (NSSet *)-[NSSet copy](v14, "copy");
    artworkPreloadingRecords = self->_artworkPreloadingRecords;
    self->_artworkPreloadingRecords = v8;

    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke;
    v17[3] = &unk_1E5140B40;
    v11 = v14;
    v18 = v11;
    -[NSSet objectsPassingTest:](v7, "objectsPassingTest:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke_2;
    v15[3] = &unk_1E5140B40;
    v16 = v7;
    v5 = v7;
    -[NSSet objectsPassingTest:](v11, "objectsPassingTest:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_258394);
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_9_258395);

LABEL_4:
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSSet enumerateObjectsUsingBlock:](self->_artworkPreloadingRecords, "enumerateObjectsUsingBlock:", &__block_literal_global_10_258391);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeContainerLayout;
  -[PXGCompositeLayout dealloc](&v3, sel_dealloc);
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeContainerLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryStyleChromeContainerLayout _invalidateStyleLayoutsContent](self, "_invalidateStyleLayoutsContent");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeContainerLayout;
  -[PXGCompositeLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryStyleChromeContainerLayout _invalidateStyleLayoutsContent](self, "_invalidateStyleLayoutsContent");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeContainerLayout;
  -[PXGCompositeLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXStoryStyleChromeContainerLayout _invalidateResourcePreloading](self, "_invalidateResourcePreloading");
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
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
  objc_super v24;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXStoryStyleChromeContainerLayout.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryStyleChromeContainerLayout _updateStoryModel](self, "_updateStoryModel");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout update]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXStoryStyleChromeContainerLayout.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryStyleChromeContainerLayout _updateStyleManager](self, "_updateStyleManager");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXStoryStyleChromeContainerLayout.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80uLL;
    if ((v6 & 0x80) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFF7FLL;
      -[PXStoryStyleChromeContainerLayout _updateResourcePreloading](self, "_updateResourcePreloading");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXStoryStyleChromeContainerLayout.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryStyleChromeContainerLayout _updateStyleLayouts](self, "_updateStyleLayouts");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout update]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXStoryStyleChromeContainerLayout.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXStoryStyleChromeContainerLayout _updateVisibilityAnimator:](self, "_updateVisibilityAnimator:", 1);
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout update]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXStoryStyleChromeContainerLayout.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v9 & 0x40) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFBFLL;
      -[PXStoryStyleChromeContainerLayout _updateStyleLayoutsContent](self, "_updateStyleLayoutsContent");
      v9 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout update]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PXStoryStyleChromeContainerLayout.m"), 165, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v24.receiver = self;
  v24.super_class = (Class)PXStoryStyleChromeContainerLayout;
  -[PXGCompositeLayout update](&v24, sel_update);
}

- (void)_invalidateStoryModel
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout _invalidateStoryModel]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleChromeContainerLayout.m"), 170, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateStoryModel
{
  void *v3;
  id v4;

  -[PXStoryStyleChromeContainerLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleChromeContainerLayout setStoryModel:](self, "setStoryModel:", v3);

}

- (void)_invalidateStyleManager
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout _invalidateStyleManager]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleChromeContainerLayout.m"), 178, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateStyleManager
{
  void *v3;
  id v4;

  -[PXStoryStyleChromeContainerLayout storyModel](self, "storyModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleChromeContainerLayout setStyleManager:](self, "setStyleManager:", v3);

}

- (void)_invalidateStyleLayouts
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout _invalidateStyleLayouts]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleChromeContainerLayout.m"), 186, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)_updateStyleLayouts
{
  _NSRange *p_styleSublayoutRange;
  void *v4;
  void *v5;
  NSUInteger v6;
  PXStoryStyleChromeLayout *v7;
  void *v8;
  PXStoryStyleChromeLayout *v9;

  p_styleSublayoutRange = &self->_styleSublayoutRange;
  if (self->_styleSublayoutRange.length)
    -[PXGAbsoluteCompositeLayout removeSublayoutsInRange:](self, "removeSublayoutsInRange:", p_styleSublayoutRange->location);
  -[PXStoryStyleChromeContainerLayout styleManager](self, "styleManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_styleSublayoutRange->length = objc_msgSend(v5, "numberOfStyles");

  if (p_styleSublayoutRange->length)
  {
    v6 = 0;
    do
    {
      v7 = [PXStoryStyleChromeLayout alloc];
      -[PXStoryStyleChromeContainerLayout viewModel](self, "viewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PXStoryStyleChromeLayout initWithViewModel:](v7, "initWithViewModel:", v8);
      -[PXGLayout addSublayout:](self, "addSublayout:", v9);

      ++v6;
    }
    while (p_styleSublayoutRange->length > v6);
  }
  -[PXStoryStyleChromeContainerLayout _invalidateStyleLayoutsContent](self, "_invalidateStyleLayoutsContent");
}

- (void)_invalidateVisibilityAnimator
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout _invalidateVisibilityAnimator]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleChromeContainerLayout.m"), 201, CFSTR("invalidating %lu after it already has been updated"), 32);

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

- (void)_updateVisibilityAnimator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a3;
  -[PXStoryStyleChromeContainerLayout storyModel](self, "storyModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (objc_msgSend(v5, "viewMode") == 4)
  {
    -[PXStoryStyleChromeContainerLayout viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (double)(objc_msgSend(v7, "wantsRelatedOverlayVisible") ^ 1);

  }
  -[PXStoryStyleChromeContainerLayout visibilityAnimator](self, "visibilityAnimator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__PXStoryStyleChromeContainerLayout__updateVisibilityAnimator___block_invoke;
    v11[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v11[4] = v6;
    objc_msgSend(v8, "performChangesUsingDefaultOpacityAnimation:", v11);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__PXStoryStyleChromeContainerLayout__updateVisibilityAnimator___block_invoke_2;
    v10[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v10[4] = v6;
    objc_msgSend(v8, "performChangesWithoutAnimation:", v10);
  }

}

- (void)_invalidateStyleLayoutsContent
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout _invalidateStyleLayoutsContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleChromeContainerLayout.m"), 219, CFSTR("invalidating %lu after it already has been updated"), 64);

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

- (void)_updateStyleLayoutsContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t length;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  PXCArrayStore *framesArrayStore;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSUInteger location;
  NSUInteger v37;
  id v38;
  uint64_t v39;
  double v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  _QWORD v52[12];
  CGRect v53;

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXStoryStyleChromeContainerLayout storyModel](self, "storyModel");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleChromeContainerLayout viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewLayoutSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "styleSwitcherViewportSpacing");
  v11 = v10;
  objc_msgSend(v7, "styleSwitcherChromeInset");
  PXEdgeInsetsInsetRect();
  length = self->_styleSublayoutRange.length;
  if (length >= 1)
  {
    v17 = v12;
    v18 = v13;
    v19 = v14;
    v20 = v15;
    objc_msgSend(v41, "styleManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "selectionFocus");
    v40 = v4;
    v23 = v22;

    -[PXGLayout referenceDepth](self, "referenceDepth");
    v39 = v24;
    v53.origin.x = v17;
    v53.origin.y = v18;
    v53.size.width = v19;
    v53.size.height = v20;
    v25 = v11 + CGRectGetWidth(v53);
    objc_msgSend(v7, "styleSwitcherViewportInset");
    v27 = v25 + v26 * 2.0;
    -[PXStoryStyleChromeContainerLayout styleManager](self, "styleManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "selectionDataSource");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    framesArrayStore = self->_framesArrayStore;
    v31 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __63__PXStoryStyleChromeContainerLayout__updateStyleLayoutsContent__block_invoke;
    v52[3] = &unk_1E5140BE8;
    *(double *)&v52[6] = v27;
    v52[7] = v23;
    *(CGFloat *)&v52[8] = v17;
    *(CGFloat *)&v52[9] = v18;
    *(CGFloat *)&v52[10] = v19;
    *(CGFloat *)&v52[11] = v20;
    v52[4] = self;
    v52[5] = length;
    -[PXCArrayStore accessArrayWithElementsCount:accessBlock:](framesArrayStore, "accessArrayWithElementsCount:accessBlock:", length, v52);
    -[PXStoryStyleChromeContainerLayout visibilityAnimator](self, "visibilityAnimator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "presentationValue");
    v34 = v33;

    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v31;
    v42[1] = 3221225472;
    v42[2] = __63__PXStoryStyleChromeContainerLayout__updateStyleLayoutsContent__block_invoke_2;
    v42[3] = &unk_1E5140C10;
    v46 = v34;
    v4 = v40;
    v43 = v29;
    v44 = v9;
    v47 = v39;
    v48 = v17;
    v49 = v18;
    v50 = v19;
    v51 = v20;
    v45 = v41;
    location = self->_styleSublayoutRange.location;
    v37 = self->_styleSublayoutRange.length;
    v38 = v29;
    objc_msgSend(v35, "enumerateSublayoutsInRange:options:usingBlock:", location, v37, 0, v42);

  }
  -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:", v4, v6, v39);

}

- (void)_invalidateResourcePreloading
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleChromeContainerLayout _invalidateResourcePreloading]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleChromeContainerLayout.m"), 261, CFSTR("invalidating %lu after it already has been updated"), 128);

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

- (void)_updateResourcePreloading
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _PXStoryStyleChromePreloadingRecord *v11;
  void *v12;
  id v13;

  -[PXStoryStyleChromeContainerLayout styleManager](self, "styleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionDataSource");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryStyleChromeContainerLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewLayoutSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGLayout displayScale](self, "displayScale");
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v13, "numberOfStyles"));
  if (objc_msgSend(v13, "numberOfStyles") >= 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v13, "styleInfoAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_PXStoryStyleChromePreloadingRecord initWithDisplayScale:styleInfo:viewLayoutSpec:]([_PXStoryStyleChromePreloadingRecord alloc], "initWithDisplayScale:styleInfo:viewLayoutSpec:", v10, v5, v7);
      objc_msgSend(v8, "addObject:", v11);

      ++v9;
    }
    while (v9 < objc_msgSend(v13, "numberOfStyles"));
  }
  v12 = (void *)objc_msgSend(v8, "copy");
  -[PXStoryStyleChromeContainerLayout setArtworkPreloadingRecords:](self, "setArtworkPreloadingRecords:", v12);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)StoryViewModelObservationContext == a5)
  {
    v11 = v9;
    if ((v6 & 0x40) != 0)
    {
      -[PXStoryStyleChromeContainerLayout _invalidateStoryModel](self, "_invalidateStoryModel");
      v9 = v11;
      if ((v6 & 0x20) == 0)
      {
LABEL_9:
        if ((v6 & 0x8000) == 0)
          goto LABEL_21;
        goto LABEL_15;
      }
    }
    else if ((v6 & 0x20) == 0)
    {
      goto LABEL_9;
    }
    -[PXStoryStyleChromeContainerLayout _invalidateStyleLayoutsContent](self, "_invalidateStyleLayoutsContent");
    -[PXStoryStyleChromeContainerLayout _invalidateResourcePreloading](self, "_invalidateResourcePreloading");
    v9 = v11;
    if ((v6 & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_15;
  }
  if ((void *)StoryModelObservationContext_258337 == a5)
  {
    if ((v6 & 0x10000) == 0)
      goto LABEL_21;
    v11 = v9;
LABEL_15:
    -[PXStoryStyleChromeContainerLayout _invalidateVisibilityAnimator](self, "_invalidateVisibilityAnimator");
LABEL_20:
    v9 = v11;
    goto LABEL_21;
  }
  if ((void *)StyleManagerObservationContext_258338 == a5)
  {
    v11 = v9;
    if ((v6 & 0x20) != 0)
    {
      -[PXStoryStyleChromeContainerLayout _invalidateStyleLayouts](self, "_invalidateStyleLayouts");
      -[PXStoryStyleChromeContainerLayout _invalidateResourcePreloading](self, "_invalidateResourcePreloading");
      v9 = v11;
    }
    if ((v6 & 0x100) != 0)
      goto LABEL_19;
  }
  else
  {
    if ((void *)VisibilityAnimatorObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleChromeContainerLayout.m"), 307, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 2) != 0)
    {
      v11 = v9;
LABEL_19:
      -[PXStoryStyleChromeContainerLayout _invalidateStyleLayoutsContent](self, "_invalidateStyleLayoutsContent");
      goto LABEL_20;
    }
  }
LABEL_21:

}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (PXNumberAnimator)visibilityAnimator
{
  return self->_visibilityAnimator;
}

- (PXStoryStyleManager)styleManager
{
  return self->_styleManager;
}

- (PXStoryModel)storyModel
{
  return self->_storyModel;
}

- (NSSet)artworkPreloadingRecords
{
  return self->_artworkPreloadingRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkPreloadingRecords, 0);
  objc_storeStrong((id *)&self->_storyModel, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
  objc_storeStrong((id *)&self->_visibilityAnimator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_framesArrayStore, 0);
}

uint64_t __63__PXStoryStyleChromeContainerLayout__updateStyleLayoutsContent__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if (*(uint64_t *)(a1 + 40) >= 1)
  {
    v4 = 0;
    v5 = a2 + 16;
    do
    {
      *(CGRect *)(v5 - 16) = CGRectOffset(*(CGRect *)(a1 + 64), *(double *)(a1 + 48) * ((double)(int)v4 - *(double *)(a1 + 56)), 0.0);
      v5 += 32;
      ++v4;
    }
    while (*(_QWORD *)(a1 + 40) > v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFrames:forSublayoutsInRange:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));
}

void __63__PXStoryStyleChromeContainerLayout__updateStyleLayoutsContent__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(double *)(a1 + 56);
  v6 = a3;
  objc_msgSend(v6, "setAlpha:", v5);
  objc_msgSend(*(id *)(a1 + 32), "styleInfoAtIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyleInfo:", v7);

  objc_msgSend(v6, "setViewLayoutSpec:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setReferenceDepth:", *(double *)(a1 + 64));
  objc_msgSend(v6, "setReferenceSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 48), "colorGradingRepository");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColorGradingRepository:", v8);

}

uint64_t __63__PXStoryStyleChromeContainerLayout__updateVisibilityAnimator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __63__PXStoryStyleChromeContainerLayout__updateVisibilityAnimator___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __44__PXStoryStyleChromeContainerLayout_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "styleInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");
  v5 = v4;

  +[PXStoryStyleChromeLayout stopCachingResourcesForStyleInfo:viewLayoutSpec:displayScale:](PXStoryStyleChromeLayout, "stopCachingResourcesForStyleInfo:viewLayoutSpec:displayScale:", v6, v3, v5);
}

uint64_t __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "styleInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");
  v5 = v4;

  +[PXStoryStyleChromeLayout stopCachingResourcesForStyleInfo:viewLayoutSpec:displayScale:](PXStoryStyleChromeLayout, "stopCachingResourcesForStyleInfo:viewLayoutSpec:displayScale:", v6, v3, v5);
}

void __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "styleInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");
  v5 = v4;

  +[PXStoryStyleChromeLayout startCachingResourcesForStyleInfo:viewLayoutSpec:displayScale:](PXStoryStyleChromeLayout, "startCachingResourcesForStyleInfo:viewLayoutSpec:displayScale:", v6, v3, v5);
}

@end

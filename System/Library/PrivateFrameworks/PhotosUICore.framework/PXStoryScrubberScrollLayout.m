@implementation PXStoryScrubberScrollLayout

- (PXStoryScrubberScrollLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberScrollLayout.m"), 45, CFSTR("%s is not available as initializer"), "-[PXStoryScrubberScrollLayout init]");

  abort();
}

- (PXStoryScrubberScrollLayout)initWithViewModel:(id)a3 model:(id)a4
{
  id v7;
  id v8;
  PXStoryScrubberScrollLayout *v9;
  PXStoryScrubberScrollLayout *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  id modelChangeOrigin;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryScrubberScrollLayout;
  v9 = -[PXGLayout init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_model, a4);
    objc_storeStrong((id *)&v10->_viewModel, a3);
    objc_msgSend(v7, "registerChangeObserver:context:", v10, ViewModelObservationContext_158192);
    objc_msgSend(v8, "registerChangeObserver:context:", v10, ModelObservationContext_158191);
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithFormat:", CFSTR("changeOrigin-%@-%p"), v13, v10);
    modelChangeOrigin = v10->_modelChangeOrigin;
    v10->_modelChangeOrigin = (id)v14;

    -[PXGLayout setContentSource:](v10, "setContentSource:", v10);
    v10->_firstPageSpriteIndex = 0;
    -[PXGLayout addSpriteCount:withInitialState:](v10, "addSpriteCount:withInitialState:", 1, 0);
    -[PXStoryScrubberScrollLayout _invalidateDisplayedTimeline](v10, "_invalidateDisplayedTimeline");
  }

  return v10;
}

- (void)setDisplayedTimeline:(id)a3
{
  PXStoryTimeline *v5;
  char v6;
  PXStoryTimeline *v7;

  v7 = (PXStoryTimeline *)a3;
  v5 = self->_displayedTimeline;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryTimeline isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedTimeline, a3);
      -[PXStoryScrubberScrollLayout _invalidatePages](self, "_invalidatePages");
      -[PXStoryScrubberScrollLayout _invalidateCurrentScrollPosition](self, "_invalidateCurrentScrollPosition");
    }
  }

}

- (void)setNumberOfPages:(int64_t)a3
{
  if (self->_numberOfPages != a3)
  {
    self->_numberOfPages = a3;
    -[PXStoryScrubberScrollLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberScrollLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryScrubberScrollLayout _invalidateContent](self, "_invalidateContent");
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberScrollLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXStoryScrubberScrollLayout _invalidatePresentedScrubberPosition](self, "_invalidatePresentedScrubberPosition");
}

- (void)setPresentedScrubberPosition:(id *)a3
{
  BOOL v3;
  __int128 v4;

  if (self->_presentedScrubberPosition.firstSegmentIdentifier != a3->var0
    || (self->_presentedScrubberPosition.secondSegmentMixFactor == a3->var1
      ? (v3 = self->_presentedScrubberPosition.secondSegmentIdentifier == a3->var2)
      : (v3 = 0),
        !v3))
  {
    v4 = *(_OWORD *)&a3->var0;
    self->_presentedScrubberPosition.secondSegmentIdentifier = a3->var2;
    *(_OWORD *)&self->_presentedScrubberPosition.firstSegmentIdentifier = v4;
    -[PXStoryScrubberScrollLayout _invalidateModelScrubberPosition](self, "_invalidateModelScrubberPosition");
  }
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrubberScrollLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryScrubberScrollLayout.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXStoryScrubberScrollLayout.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryScrubberScrollLayout _updateDisplayedTimeline](self, "_updateDisplayedTimeline");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout update]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXStoryScrubberScrollLayout.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryScrubberScrollLayout _updatePages](self, "_updatePages");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXStoryScrubberScrollLayout.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryScrubberScrollLayout _updateContent](self, "_updateContent");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXStoryScrubberScrollLayout.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryScrubberScrollLayout _updatePresentedScrubberPosition](self, "_updatePresentedScrubberPosition");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout update]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXStoryScrubberScrollLayout.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXStoryScrubberScrollLayout _updateCurrentScrollPosition](self, "_updateCurrentScrollPosition");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout update]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXStoryScrubberScrollLayout.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v9 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXStoryScrubberScrollLayout _updateModelScrubberPosition](self, "_updateModelScrubberPosition");
      v9 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout update]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PXStoryScrubberScrollLayout.m"), 130, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v24.receiver = self;
  v24.super_class = (Class)PXStoryScrubberScrollLayout;
  -[PXGLayout update](&v24, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrubberScrollLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryScrubberScrollLayout.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateDisplayedTimeline
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout _invalidateDisplayedTimeline]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberScrollLayout.m"), 140, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateDisplayedTimeline
{
  void *v3;
  id v4;

  -[PXStoryScrubberScrollLayout model](self, "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberScrollLayout setDisplayedTimeline:](self, "setDisplayedTimeline:", v3);

}

- (void)_invalidatePages
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout _invalidatePages]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberScrollLayout.m"), 148, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updatePages
{
  id v3;

  -[PXStoryScrubberScrollLayout displayedTimeline](self, "displayedTimeline");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberScrollLayout setNumberOfPages:](self, "setNumberOfPages:", objc_msgSend(v3, "numberOfSegments"));

}

- (void)_invalidateContent
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberScrollLayout.m"), 156, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  id v19;
  _QWORD v20[7];
  CGRect v21;

  -[PXStoryScrubberScrollLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewLayoutSpec");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryScrubberScrollLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "scrubberRegularAssetSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "scrubberCurrentAssetSize");
  v12 = v11;
  objc_msgSend(v19, "scrubberRegularAssetPadding");
  v14 = v13;
  objc_msgSend(v19, "scrubberCurrentAssetPadding");
  v16 = v15;
  v17 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __45__PXStoryScrubberScrollLayout__updateContent__block_invoke;
  v20[3] = &unk_1E51472A8;
  *(double *)&v20[5] = v8;
  v20[6] = v10;
  v20[4] = self;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v17 << 32, v20);
  v18 = v16
      + v14 * -2.0
      + (double)(-[PXStoryScrubberScrollLayout numberOfPages](self, "numberOfPages") - 1) * (v8 + v14);
  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGLayout setContentSize:](self, "setContentSize:", CGRectGetWidth(v21) + v18, v12);

}

- (void)_invalidateCurrentScrollPosition
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout _invalidateCurrentScrollPosition]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberScrollLayout.m"), 183, CFSTR("invalidating %lu after it already has been updated"), 16);

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

- (void)_updateCurrentScrollPosition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v12 = 0uLL;
  v13 = 0;
  -[PXStoryScrubberScrollLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currentScrollPosition");
  }
  else
  {
    v12 = 0uLL;
    v13 = 0;
  }

  -[PXStoryScrubberScrollLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isScrubbing") & 1) != 0)
    goto LABEL_11;
  -[PXStoryScrubberScrollLayout presentedScrubberPosition](self, "presentedScrubberPosition");
  if ((_QWORD)v12 != v9 || *((double *)&v12 + 1) != v10)
  {

    goto LABEL_10;
  }

  if (v13 != v11)
  {
LABEL_10:
    v7 = v12;
    v8 = v13;
    -[PXStoryScrubberScrollLayout createAnchorForScrollingToPosition:](self, "createAnchorForScrollingToPosition:", &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "autoInvalidate");
LABEL_11:

  }
}

- (id)createAnchorForScrollingToPosition:(id *)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  $7DA682ECC7253F641496E0B6E9C98204 v10;
  id location;

  objc_initWeak(&location, self);
  -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:", self->_firstPageSpriteIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PXStoryScrubberScrollLayout_createAnchorForScrollingToPosition___block_invoke;
  v8[3] = &unk_1E5139090;
  objc_copyWeak(&v9, &location);
  v10 = *a3;
  -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", v5, 9, v8, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

- (CGPoint)_offsetFromFirstPageForScrollingToPosition:(id *)a3 visibleRect:(CGRect)a4
{
  void *v6;
  double *v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  -[PXStoryScrubberScrollLayout displayedTimeline](self, "displayedTimeline", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double *)MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9 = objc_msgSend(v6, "indexOfSegmentWithIdentifier:", a3->var0);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = *v7;
  }
  else
  {
    v11 = v9;
    -[PXStoryScrubberScrollLayout viewModel](self, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewLayoutSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "scrubberRegularAssetSize");
    v15 = v14;
    objc_msgSend(v13, "scrubberRegularAssetPadding");
    v16 = a3->var1 + (double)v11;
    v18 = v15 + v17;
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v10 = v19 + v16 * v18;

  }
  v20 = v10;
  v21 = v8;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)_invalidatePresentedScrubberPosition
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout _invalidatePresentedScrubberPosition]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberScrollLayout.m"), 216, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)_updatePresentedScrubberPosition
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  CGRect v14;

  -[PXStoryScrubberScrollLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewLayoutSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scrubberRegularAssetSize");
  objc_msgSend(v4, "scrubberRegularAssetPadding");
  -[PXGLayout visibleRect](self, "visibleRect");
  CGRectGetMinX(v14);
  -[PXStoryScrubberScrollLayout displayedTimeline](self, "displayedTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfSegments") > 1)
  {
    PXClamp();
    v10 = (uint64_t)v9;
    v11 = (uint64_t)v9 + 1;
    PXFloatNormalize();
    v8 = v12;
    v6 = objc_msgSend(v5, "identifierForSegmentAtIndex:", v10);
    v7 = objc_msgSend(v5, "identifierForSegmentAtIndex:", v11);
  }
  else
  {
    v6 = objc_msgSend(v5, "firstSegmentIdentifier");
    v7 = 0;
    v8 = 0;
  }
  v13[0] = v6;
  v13[1] = v8;
  v13[2] = v7;
  -[PXStoryScrubberScrollLayout setPresentedScrubberPosition:](self, "setPresentedScrubberPosition:", v13);

}

- (void)_invalidateModelScrubberPosition
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberScrollLayout _invalidateModelScrubberPosition]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberScrollLayout.m"), 240, CFSTR("invalidating %lu after it already has been updated"), 32);

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

- (void)_updateModelScrubberPosition
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v11 = 0uLL;
  v12 = 0;
  -[PXStoryScrubberScrollLayout presentedScrubberPosition](self, "presentedScrubberPosition");
  -[PXStoryScrubberScrollLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PXStoryScrubberScrollLayout__updateModelScrubberPosition__block_invoke;
  v8[3] = &__block_descriptor_56_e35_v16__0___PXStoryMutableViewModel__8l;
  v9 = v11;
  v10 = v12;
  objc_msgSend(v3, "performChanges:", v8);

  -[PXStoryScrubberScrollLayout model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberScrollLayout modelChangeOrigin](self, "modelChangeOrigin", v4, 3221225472, __59__PXStoryScrubberScrollLayout__updateModelScrubberPosition__block_invoke_2, &unk_1E512F1A0, self, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChanges:origin:", &v7, v6);

}

- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[PXStoryScrubberScrollLayout viewModel](self, "viewModel", a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewLayoutSpec");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "scrubberRegularAssetSize");
  v7 = v6;
  objc_msgSend(v9, "scrubberRegularAssetPadding");
  a3->x = (v7 + v8) * round(a3->x / (v7 + v8));

}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  long double __y;

  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (double)modf((double)a3 / 10.0, &__y), 1.0, 1.0, 0.3);
}

- (void)scrollLayoutWillBeginScrolling:(id)a3
{
  id v3;

  -[PXStoryScrubberScrollLayout viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_158198);

}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  -[PXStoryScrubberScrollLayout adjustScrollTargetContentOffset:withVelocity:](self, "adjustScrollTargetContentOffset:withVelocity:", a5, a4.x, a4.y, a6.x, a6.y);
}

- (void)scrollLayoutDidEndScrolling:(id)a3
{
  id v3;

  -[PXStoryScrubberScrollLayout viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_33);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  if ((void *)ModelObservationContext_158191 == a5)
  {
    if ((v6 & 0x10) != 0)
    {
      -[PXStoryScrubberScrollLayout _invalidateDisplayedTimeline](self, "_invalidateDisplayedTimeline");
      if ((v6 & 0x2000) == 0)
      {
LABEL_10:
        if ((v6 & 4) == 0)
          goto LABEL_16;
        goto LABEL_14;
      }
    }
    else if ((v6 & 0x2000) == 0)
    {
      goto LABEL_10;
    }
    -[PXStoryScrubberScrollLayout _invalidatePages](self, "_invalidatePages");
    if ((v6 & 4) == 0)
      goto LABEL_16;
LABEL_14:
    -[PXStoryScrubberScrollLayout model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changesOrigins");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryScrubberScrollLayout modelChangeOrigin](self, "modelChangeOrigin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if ((v12 & 1) == 0)
      -[PXStoryScrubberScrollLayout _invalidateCurrentScrollPosition](self, "_invalidateCurrentScrollPosition");
LABEL_16:
    if ((v6 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if ((void *)ViewModelObservationContext_158192 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberScrollLayout.m"), 329, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x20) != 0)
  {
    -[PXStoryScrubberScrollLayout _invalidateContent](self, "_invalidateContent");
    -[PXStoryScrubberScrollLayout _invalidateCurrentScrollPosition](self, "_invalidateCurrentScrollPosition");
  }
  if ((v6 & 0x40) != 0)
LABEL_6:
    -[PXStoryScrubberScrollLayout _invalidateContent](self, "_invalidateContent");
LABEL_7:

}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryTimeline)displayedTimeline
{
  return self->_displayedTimeline;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- ($7DA682ECC7253F641496E0B6E9C98204)presentedScrubberPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)((char *)self + 928);
  return self;
}

- (id)modelChangeOrigin
{
  return self->_modelChangeOrigin;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelChangeOrigin, 0);
  objc_storeStrong((id *)&self->_displayedTimeline, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __59__PXStoryScrubberScrollLayout_scrollLayoutDidEndScrolling___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsScrubbing:", 0);
}

uint64_t __62__PXStoryScrubberScrollLayout_scrollLayoutWillBeginScrolling___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsScrubbing:", 1);
}

uint64_t __59__PXStoryScrubberScrollLayout__updateModelScrubberPosition__block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "setScrubberPosition:", &v3);
}

void __59__PXStoryScrubberScrollLayout__updateModelScrubberPosition__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  _QWORD *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrubbing");

  if (v4)
  {
    v5 = (_QWORD *)(a1 + 40);
    if (*(double *)(a1 + 48) > 0.5)
      v5 = (_QWORD *)(a1 + 56);
    objc_msgSend(v6, "skipToBeginningOfSegmentWithIdentifier:", *v5);
  }

}

double __66__PXStoryScrubberScrollLayout_createAnchorForScrollingToPosition___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained;
  double v11;
  double v12;
  __int128 v14;
  uint64_t v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v14 = *(_OWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 56);
  objc_msgSend(WeakRetained, "_offsetFromFirstPageForScrollingToPosition:visibleRect:", &v14, a2, a3, a4, a5);
  v12 = v11;

  return v12;
}

__n128 __45__PXStoryScrubberScrollLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float32x2_t *v13;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v16;
  float64x2_t v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __n128 result;
  __int128 v24;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  PXRectWithOriginAndSize();
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v13 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880));
  MidX = CGRectGetMidX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MidY = CGRectGetMidY(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v25 = CGRectGetWidth(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v16 = CGRectGetHeight(v29);
  v17.f64[0] = v25;
  v17.f64[1] = v16;
  *(CGFloat *)v13 = MidX;
  *(CGFloat *)&v13[1] = MidY;
  v13[2] = 0;
  v13[3] = vcvt_f32_f64(v17);
  v18 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880));
  v19 = *((_OWORD *)off_1E50B83A0 + 7);
  v18[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v18[7] = v19;
  v20 = *((_OWORD *)off_1E50B83A0 + 9);
  v18[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v18[9] = v20;
  v21 = *((_OWORD *)off_1E50B83A0 + 3);
  v18[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v18[3] = v21;
  v22 = *((_OWORD *)off_1E50B83A0 + 5);
  v18[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v18[5] = v22;
  result = *(__n128 *)off_1E50B83A0;
  v24 = *((_OWORD *)off_1E50B83A0 + 1);
  *v18 = *(_OWORD *)off_1E50B83A0;
  v18[1] = v24;
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880)) = 0;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 880) + 1) = 0;
  return result;
}

@end

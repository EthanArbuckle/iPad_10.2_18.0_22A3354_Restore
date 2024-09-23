@implementation PXStoryScrollLayout

- (PXStoryScrollLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrollLayout.m"), 61, CFSTR("%s is not available as initializer"), "-[PXStoryScrollLayout init]");

  abort();
}

- (PXStoryScrollLayout)initWithModel:(id)a3
{
  id v5;
  PXStoryScrollLayout *v6;
  PXStoryScrollLayout *v7;
  id *p_model;
  void *v9;
  PXStoryPagedScrollContentLayout *v10;
  PXStoryPagedScrollContentLayout *pagedScrollContentLayout;
  PXStoryStyleScrollContentLayout *v12;
  PXStoryStyleScrollContentLayout *styleScrollContentLayout;
  id v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  id modelChangeOrigin;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryScrollLayout;
  v6 = -[PXGScrollLayout init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    objc_msgSend(*p_model, "registerChangeObserver:context:", v7, ModelObservationContext_187520);
    objc_msgSend(*p_model, "styleManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerChangeObserver:context:", v7, StyleManagerObservationContext_187521);

    v10 = -[PXStoryPagedScrollContentLayout initWithModel:]([PXStoryPagedScrollContentLayout alloc], "initWithModel:", *p_model);
    pagedScrollContentLayout = v7->_pagedScrollContentLayout;
    v7->_pagedScrollContentLayout = v10;

    v12 = -[PXStoryStyleScrollContentLayout initWithModel:]([PXStoryStyleScrollContentLayout alloc], "initWithModel:", *p_model);
    styleScrollContentLayout = v7->_styleScrollContentLayout;
    v7->_styleScrollContentLayout = v12;

    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithFormat:", CFSTR("changeOrigin-%@-%p"), v16, v7);
    modelChangeOrigin = v7->_modelChangeOrigin;
    v7->_modelChangeOrigin = (id)v17;

    -[PXGScrollLayout setShowsHorizontalScrollIndicator:](v7, "setShowsHorizontalScrollIndicator:", 0);
    -[PXGScrollLayout setShowsVerticalScrollIndicator:](v7, "setShowsVerticalScrollIndicator:", 0);
    -[PXGScrollLayout setContentLayout:](v7, "setContentLayout:", v7->_pagedScrollContentLayout);
    -[PXGScrollLayout setDelegate:](v7, "setDelegate:", v7);
    -[PXStoryScrollLayout _invalidateContentView](v7, "_invalidateContentView");
    -[PXStoryScrollLayout _invalidateScrollDecelerationRate](v7, "_invalidateScrollDecelerationRate");
    -[PXStoryScrollLayout _invalidateWantsScrollView](v7, "_invalidateWantsScrollView");
  }

  return v7;
}

- (void)isScrollingDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrollLayout;
  -[PXGScrollLayout isScrollingDidChange](&v3, sel_isScrollingDidChange);
  -[PXStoryScrollLayout _invalidateModelIsScrolling](self, "_invalidateModelIsScrolling");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrollLayout;
  -[PXGScrollLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryScrollLayout _invalidateScrollViewZPosition](self, "_invalidateScrollViewZPosition");
}

- (void)contentLayoutDidChange
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryScrollLayout;
  -[PXGScrollLayout contentLayoutDidChange](&v6, sel_contentLayoutDidChange);
  -[PXStoryScrollLayout _invalidateScrollDecelerationRate](self, "_invalidateScrollDecelerationRate");
  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PXGScrollLayout contentLayout](self, "contentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryScrollLayout setTargetContentOffsetAdjuster:](self, "setTargetContentOffsetAdjuster:", v5);

  }
  else
  {
    -[PXStoryScrollLayout setTargetContentOffsetAdjuster:](self, "setTargetContentOffsetAdjuster:", 0);
  }
}

- (int64_t)scrollPositionComparedToEnd
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v14;
  uint64_t v16;
  double v17;
  uint64_t v18;

  -[PXStoryScrollLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "viewMode") != 1)
  {
    v9 = -1;
    goto LABEL_18;
  }
  -[PXStoryScrollLayout pagedScrollContentLayout](self, "pagedScrollContentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v16 = 0;
    v6 = 0.0;
    v18 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "presentedScrollPosition");
  v6 = v17;
  if (v17 <= 0.5)
  {
LABEL_7:
    v7 = v16;
    v8 = v18;
    goto LABEL_8;
  }
  v6 = 1.0 - v17;
  v7 = v18;
  v8 = v16;
LABEL_8:

  objc_msgSend(v3, "timeline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6 > 0.5)
    v7 = v8;
  if (v7 == objc_msgSend(v10, "lastSegmentIdentifier"))
  {
    v12 = 1.0 - v6;
    if (v6 <= 0.5)
      v12 = v6;
    if (v12 == 0.0 || objc_msgSend(v11, "numberOfSegments") < 2)
    {
      v9 = 0;
    }
    else
    {
      v14 = objc_msgSend(v11, "identifierForSegmentAtIndex:", objc_msgSend(v11, "numberOfSegments") - 2);
      if (v6 < 0.0 && v8 == v14)
        v9 = 1;
      else
        v9 = -1;
    }
  }
  else
  {
    v9 = -1;
  }

LABEL_18:
  return v9;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryScrollLayout;
  -[PXGScrollLayout willUpdate](&v7, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryScrollLayout.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrollLayout.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  BOOL isUpdating;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v11;
  unint64_t v12;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  isUpdating = self->_isUpdating;
  self->_isUpdating = 1;
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryScrollLayout.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 4;
    if ((needsUpdate & 4) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryScrollLayout _updateContentView](self, "_updateContentView");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("PXStoryScrollLayout.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if ((v6 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryScrollLayout _updateContentScrollPosition](self, "_updateContentScrollPosition");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXStoryScrollLayout.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v7 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryScrollLayout _updateScrollDecelerationRate](self, "_updateScrollDecelerationRate");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXStoryScrollLayout.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v8 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryScrollLayout _updateScrollViewZPosition](self, "_updateScrollViewZPosition");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXStoryScrollLayout.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v9 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXStoryScrollLayout _updateWantsScrollView](self, "_updateWantsScrollView");
      v9 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXStoryScrollLayout.m"), 154, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v31.receiver = self;
  v31.super_class = (Class)PXStoryScrollLayout;
  -[PXGScrollLayout update](&v31, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v11 = self->_postUpdateFlags.needsUpdate;
  if (v11)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXStoryScrollLayout.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v11 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v11 & 0x400) != 0)
    {
      p_postUpdateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXStoryScrollLayout _updateModelIsScrolling](self, "_updateModelIsScrolling");
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PXStoryScrollLayout.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

      }
    }
    v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v12 & 0x800) != 0)
    {
      p_postUpdateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFF7FFLL;
      -[PXStoryScrollLayout _updateModelScrollPosition](self, "_updateModelScrollPosition");
      v12 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout update]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXStoryScrollLayout.m"), 165, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
  self->_isUpdating = isUpdating;
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryScrollLayout;
  -[PXGScrollLayout didUpdate](&v7, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryScrollLayout.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrollLayout.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateContentView
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout _invalidateContentView]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrollLayout.m"), 177, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)_updateContentView
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[PXStoryScrollLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "viewMode");

  v6 = 0;
  switch(v5)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrollLayout.m"), 185, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
    case 3:
    case 5:
      -[PXStoryScrollLayout pagedScrollContentLayout](self, "pagedScrollContentLayout");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[PXStoryScrollLayout styleScrollContentLayout](self, "styleScrollContentLayout");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  v8 = (id)v6;
  -[PXGScrollLayout setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", 0);
  -[PXGScrollLayout setContentLayout:](self, "setContentLayout:", v8);

}

- (void)_invalidateContentScrollPositionWithReason:(unint64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;

  -[PXGScrollLayout stopScrolling](self, "stopScrolling");
  self->_scrollPositionUpdateReason = a3;
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
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout _invalidateContentScrollPositionWithReason:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXStoryScrollLayout.m"), 211, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateContentScrollPosition
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[3];

  -[PXStoryScrollLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode");

  if (v4 != 3)
  {
    -[PXGScrollLayout contentLayout](self, "contentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryScrollLayout pagedScrollContentLayout](self, "pagedScrollContentLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      if (!self->_scrollPositionUpdateReason)
      {
        -[PXStoryScrollLayout pagedScrollContentLayout](self, "pagedScrollContentLayout");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryScrollLayout model](self, "model");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v13;
        if (v13)
          objc_msgSend(v13, "currentScrollPosition");
        else
          memset(v15, 0, sizeof(v15));
        objc_msgSend(v8, "createAnchorForScrollingToPosition:", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (id)objc_msgSend(v10, "autoInvalidate");
        goto LABEL_10;
      }
    }
    else
    {
      -[PXStoryScrollLayout styleScrollContentLayout](self, "styleScrollContentLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v7)
      {
        -[PXStoryScrollLayout styleScrollContentLayout](self, "styleScrollContentLayout");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryScrollLayout model](self, "model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "styleManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "selectionFocus");
        objc_msgSend(v8, "createAnchorForScrollingToStyleFocus:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "autoInvalidate");

LABEL_10:
      }
    }

  }
}

- (void)_invalidateScrollDecelerationRate
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout _invalidateScrollDecelerationRate]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrollLayout.m"), 230, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateScrollDecelerationRate
{
  void *v3;
  id v4;

  -[PXStoryScrollLayout model](self, "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGScrollLayout setScrollDecelerationRate:](self, "setScrollDecelerationRate:", objc_msgSend(v3, "scrollDecelerationRate"));

}

- (void)_invalidateScrollViewZPosition
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout _invalidateScrollViewZPosition]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrollLayout.m"), 238, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)_updateScrollViewZPosition
{
  double v3;

  -[PXGLayout referenceDepth](self, "referenceDepth");
  *(float *)&v3 = v3;
  *(float *)&v3 = -*(float *)&v3;
  -[PXGScrollLayout setScrollViewSpriteZPosition:](self, "setScrollViewSpriteZPosition:", v3);
}

- (void)_invalidateWantsScrollView
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout _invalidateWantsScrollView]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrollLayout.m"), 246, CFSTR("invalidating %lu after it already has been updated"), 16);

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

- (void)_updateWantsScrollView
{
  id v3;

  -[PXStoryScrollLayout model](self, "model");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGScrollLayout setWantsScrollView:](self, "setWantsScrollView:", objc_msgSend(v3, "allowsScrolling"));

}

- (void)_invalidatePostUpdateEntities:(unint64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (!a3 || needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_9:
      p_postUpdateFlags->needsUpdate = needsUpdate | a3;
      return;
    }
LABEL_8:
    if ((self->_postUpdateFlags.updated & a3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrollLayout _invalidatePostUpdateEntities:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryScrollLayout.m"), 254, CFSTR("invalidating %lu after it already has been updated"), a3);

      abort();
    }
    goto LABEL_9;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_8;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = a3;
  if (!willPerformUpdate && !self->_isUpdating)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateModelIsScrolling
{
  -[PXStoryScrollLayout _invalidatePostUpdateEntities:](self, "_invalidatePostUpdateEntities:", 1024);
}

- (void)_updateModelIsScrolling
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PXStoryScrollLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PXStoryScrollLayout__updateModelIsScrolling__block_invoke;
  v5[3] = &unk_1E5142E50;
  v5[4] = self;
  -[PXStoryScrollLayout modelChangeOrigin](self, "modelChangeOrigin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:origin:", v5, v4);

}

- (void)_invalidateModelScrollPosition
{
  -[PXStoryScrollLayout _invalidatePostUpdateEntities:](self, "_invalidatePostUpdateEntities:", 2048);
}

- (void)_updateModelScrollPosition
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  PXStoryScrollLayout *v9;

  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrollLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = v3;
  v9 = self;
  v5 = v3;
  -[PXStoryScrollLayout modelChangeOrigin](self, "modelChangeOrigin", v7, 3221225472, __49__PXStoryScrollLayout__updateModelScrollPosition__block_invoke, &unk_1E51337A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performChanges:origin:", &v7, v6);

}

- (void)scrollLayoutWillBeginScrolling:(id)a3
{
  -[PXStoryScrollLayout setScrollBeganAtTimelineEnd:](self, "setScrollBeganAtTimelineEnd:", -[PXStoryScrollLayout scrollPositionComparedToEnd](self, "scrollPositionComparedToEnd", a3) == 0);
}

- (void)scrollLayoutDidScroll:(id)a3
{
  if (-[PXGScrollLayout isScrolling](self, "isScrolling", a3))
    -[PXStoryScrollLayout _invalidateModelScrollPosition](self, "_invalidateModelScrollPosition");
}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y;
  double x;
  void *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  -[PXStoryScrollLayout targetContentOffsetAdjuster](self, "targetContentOffsetAdjuster", a3, a4.x, a4.y, a6.x, a6.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adjustScrollTargetContentOffset:withVelocity:", a5, x, y);

  if (-[PXStoryScrollLayout scrollBeganAtTimelineEnd](self, "scrollBeganAtTimelineEnd")
    && x > 0.0
    && -[PXStoryScrollLayout scrollPositionComparedToEnd](self, "scrollPositionComparedToEnd") != -1)
  {
    -[PXStoryScrollLayout model](self, "model");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performChanges:", &__block_literal_global_187524);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  objc_super v16;

  v8 = a3;
  if ((void *)ModelObservationContext_187520 == a5)
  {
    if ((a4 & 0x10000) != 0)
      -[PXStoryScrollLayout _invalidateContentView](self, "_invalidateContentView");
    if ((a4 & 0x10004) != 0)
    {
      -[PXStoryScrollLayout model](self, "model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "changesOrigins");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryScrollLayout modelChangeOrigin](self, "modelChangeOrigin");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);

      if ((v12 & 1) == 0)
        -[PXStoryScrollLayout _invalidateContentScrollPositionWithReason:](self, "_invalidateContentScrollPositionWithReason:", 0);
    }
    if ((a4 & 0x2000) != 0)
      -[PXStoryScrollLayout _invalidateScrollDecelerationRate](self, "_invalidateScrollDecelerationRate");
    if ((a4 & 0x8000000) != 0)
      -[PXStoryScrollLayout _invalidateWantsScrollView](self, "_invalidateWantsScrollView");
  }
  else if ((void *)StyleManagerObservationContext_187521 == a5)
  {
    if ((a4 & 0x100) != 0)
    {
      -[PXStoryScrollLayout model](self, "model");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "styleManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "changesOrigin");

      if ((v15 & 4) != 0)
        -[PXStoryScrollLayout _invalidateContentScrollPositionWithReason:](self, "_invalidateContentScrollPositionWithReason:", 0);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PXStoryScrollLayout;
    -[PXGScrollLayout observable:didChange:context:](&v16, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryPagedScrollContentLayout)pagedScrollContentLayout
{
  return self->_pagedScrollContentLayout;
}

- (PXStoryStyleScrollContentLayout)styleScrollContentLayout
{
  return self->_styleScrollContentLayout;
}

- (id)modelChangeOrigin
{
  return self->_modelChangeOrigin;
}

- (PXStoryScrollLayoutTargetContentOffsetAdjuster)targetContentOffsetAdjuster
{
  return self->_targetContentOffsetAdjuster;
}

- (void)setTargetContentOffsetAdjuster:(id)a3
{
  objc_storeStrong((id *)&self->_targetContentOffsetAdjuster, a3);
}

- (BOOL)scrollBeganAtTimelineEnd
{
  return self->_scrollBeganAtTimelineEnd;
}

- (void)setScrollBeganAtTimelineEnd:(BOOL)a3
{
  self->_scrollBeganAtTimelineEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentOffsetAdjuster, 0);
  objc_storeStrong(&self->_modelChangeOrigin, 0);
  objc_storeStrong((id *)&self->_styleScrollContentLayout, 0);
  objc_storeStrong((id *)&self->_pagedScrollContentLayout, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

uint64_t __106__PXStoryScrollLayout_scrollLayoutWillEndScrolling_withVelocity_targetContentOffset_currentContentOffset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "flickedPastEnd");
}

void __49__PXStoryScrollLayout__updateModelScrollPosition__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[3];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pagedScrollContentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  if (v4 == v5)
  {
    objc_msgSend(v6, "pagedScrollContentLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13)
      objc_msgSend(v13, "presentedScrollPosition");
    else
      memset(v16, 0, sizeof(v16));
    objc_msgSend(v3, "scrollToPosition:", v16);
    goto LABEL_8;
  }
  objc_msgSend(v6, "contentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "styleScrollContentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "styleScrollContentLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "styleManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PXStoryScrollLayout__updateModelScrollPosition__block_invoke_2;
    v14[3] = &unk_1E5133780;
    v15 = v9;
    v12 = v9;
    objc_msgSend(v11, "performChanges:origin:", v14, 1);

LABEL_8:
  }

}

void __49__PXStoryScrollLayout__updateModelScrollPosition__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  v4 = (double)objc_msgSend(v3, "focusedStyleIndex");
  objc_msgSend(*(id *)(a1 + 32), "focusOffset");
  objc_msgSend(v6, "setSelectionFocus:", v5 + v4);

}

void __46__PXStoryScrollLayout__updateModelIsScrolling__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIsScrolling:", objc_msgSend(v2, "isScrolling"));

}

@end

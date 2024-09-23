@implementation PXFeedViewScrollLayout

- (PXFeedViewScrollLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedViewScrollLayout.m"), 38, CFSTR("%s is not available as initializer"), "-[PXFeedViewScrollLayout init]");

  abort();
}

- (PXFeedViewScrollLayout)initWithViewModel:(id)a3 displayingFeedContentLayout:(id)a4
{
  id v7;
  id v8;
  PXFeedViewScrollLayout *v9;
  PXFeedViewScrollLayout *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedViewScrollLayout;
  v9 = -[PXGScrollLayout init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    -[PXFeedViewModel registerChangeObserver:context:](v10->_viewModel, "registerChangeObserver:context:", v10, ViewModelObservationContext_180110);
    objc_storeStrong((id *)&v10->_feedContentLayout, a4);
    -[PXGScrollLayout setContentLayout:](v10, "setContentLayout:", v8);
    -[PXGScrollLayout setDelegate:](v10, "setDelegate:", v10);
    -[PXFeedViewScrollLayout _invalidateScrollParameters](v10, "_invalidateScrollParameters");
  }

  return v10;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedViewScrollLayout;
  -[PXGScrollLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXFeedViewScrollLayout _invalidateContentSize](self, "_invalidateContentSize");
}

- (unint64_t)contentChangeTrend
{
  return 4;
}

- (int64_t)scrollableAxis
{
  return 0;
}

- (UIEdgeInsets)safeAreaInsets
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  objc_super v17;
  UIEdgeInsets result;

  -[PXFeedViewScrollLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "wantsSafeAreaInsets"))
  {
    v17.receiver = self;
    v17.super_class = (Class)PXFeedViewScrollLayout;
    -[PXGLayout safeAreaInsets](&v17, sel_safeAreaInsets);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *(double *)off_1E50B8020;
    v8 = *((double *)off_1E50B8020 + 1);
    v10 = *((double *)off_1E50B8020 + 2);
    v12 = *((double *)off_1E50B8020 + 3);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7;
  void *v8;
  int64_t v9;
  id v10;

  v7 = a3;
  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[PXGLayout indexOfSublayout:](self, "indexOfSublayout:", v8);
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = objc_retainAutorelease(v7);
  *a5 = v10;

  return v9;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXFeedViewScrollLayout feedContentLayout](self, "feedContentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemPlacementControllerForItemReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedViewScrollLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXFeedViewScrollLayout.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 4;
    if ((needsUpdate & 4) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
      -[PXFeedViewScrollLayout _updateAnchorForVisibleArea](self, "_updateAnchorForVisibleArea");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedViewScrollLayout update]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXFeedViewScrollLayout.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if ((v5 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      -[PXFeedViewScrollLayout _updateContentSize](self, "_updateContentSize");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedViewScrollLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXFeedViewScrollLayout.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXFeedViewScrollLayout _updateScrollParameters](self, "_updateScrollParameters");
      v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedViewScrollLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXFeedViewScrollLayout.m"), 99, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXFeedViewScrollLayout;
  -[PXGScrollLayout update](&v15, sel_update);
}

- (void)_invalidateAnchorForVisibleArea
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedViewScrollLayout _invalidateAnchorForVisibleArea]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedViewScrollLayout.m"), 104, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)_updateAnchorForVisibleArea
{
  void *v2;
  id v3;
  id v4;

  -[PXGLayout rootLayout](self, "rootLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createAnchorForVisibleArea");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "autoInvalidate");

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedViewScrollLayout _invalidateContentSize]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedViewScrollLayout.m"), 113, CFSTR("invalidating %lu after it already has been updated"), 1);

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
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXFeedViewScrollLayout viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spec");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "sizeThatFits:", v4, v6);
    v4 = v8;
    v6 = v9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGScrollLayout setFixedWidth:](self, "setFixedWidth:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGScrollLayout setFixedHeight:](self, "setFixedHeight:", v11);

}

- (void)_invalidateScrollParameters
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedViewScrollLayout _invalidateScrollParameters]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedViewScrollLayout.m"), 125, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateScrollParameters
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;

  -[PXFeedViewScrollLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scrollBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "decelerationRate");

  if (v5 <= 1)
    -[PXGScrollLayout setScrollDecelerationRate:](self, "setScrollDecelerationRate:", v5);
  -[PXGScrollLayout setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", objc_msgSend(v6, "wantsScrollIndicators"));
  -[PXGScrollLayout setShowsHorizontalScrollIndicator:](self, "setShowsHorizontalScrollIndicator:", objc_msgSend(v6, "wantsScrollIndicators"));
  objc_msgSend(v6, "verticalScrollIndicatorInsets");
  -[PXGScrollLayout setVerticalScrollIndicatorInsets:](self, "setVerticalScrollIndicatorInsets:");
  objc_msgSend(v6, "horizontalScrollIndicatorInsets");
  -[PXGScrollLayout setHorizontalScrollIndicatorInsets:](self, "setHorizontalScrollIndicatorInsets:");

}

- (void)clearLastVisibleAreaAnchoringInformation
{
  void *v3;
  objc_super v4;

  if (self->_isClearingLastVisibleAreaAnchoringInformation)
  {
    v4.receiver = self;
    v4.super_class = (Class)PXFeedViewScrollLayout;
    -[PXGLayout clearLastVisibleAreaAnchoringInformation](&v4, sel_clearLastVisibleAreaAnchoringInformation);
  }
  else
  {
    self->_isClearingLastVisibleAreaAnchoringInformation = 1;
    -[PXGLayout rootLayout](self, "rootLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearLastVisibleAreaAnchoringInformation");

    self->_isClearingLastVisibleAreaAnchoringInformation = 0;
  }
}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  id v16;

  -[PXFeedViewScrollLayout viewModel](self, "viewModel", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spec");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "scrollBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGScrollLayout contentLayout](self, "contentLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visibleRect");
  v11 = v10;

  objc_msgSend(v8, "axis");
  PXPointValueForAxis();
  if (objc_msgSend(v8, "pagingEnabled"))
  {
    objc_msgSend(v8, "axis");
    PXPointValueForAxis();
    objc_msgSend(v8, "axis");
    PXPointValueForAxis();
    objc_msgSend(v8, "pagingOrigin");
    objc_msgSend(v8, "pageOffset");
    PXFloatRoundInDirection();
    if ((objc_msgSend(v8, "allowFlickAcrossMultiplePages") & 1) == 0)
    {
      objc_msgSend(v8, "axis");
      PXPointValueForAxis();
      objc_msgSend(v8, "pagingOrigin");
      objc_msgSend(v8, "pageOffset");
      PXFloatRoundInDirection();
    }
    objc_msgSend(v8, "pagingOrigin");
    objc_msgSend(v8, "pageOffset");
    goto LABEL_9;
  }
  -[PXFeedViewScrollLayout viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "wantsFirstItemFullscreen");

  if (v14)
  {
    objc_msgSend(v8, "intrinsicContentOffset");
    if (v11 > 0.0 && v11 < v15)
    {
      PXFloatRoundInDirection();
LABEL_9:
      objc_msgSend(v8, "axis");
      PXPointSetValueForAxis();
    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v8 = a3;
  if ((void *)ViewModelObservationContext_180110 == a5)
  {
    if ((a4 & 8) != 0)
    {
      -[PXFeedViewScrollLayout _invalidateContentSize](self, "_invalidateContentSize");
      -[PXFeedViewScrollLayout _invalidateScrollParameters](self, "_invalidateScrollParameters");
    }
    if ((a4 & 0xA) != 0)
      -[PXFeedViewScrollLayout _invalidateAnchorForVisibleArea](self, "_invalidateAnchorForVisibleArea");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXFeedViewScrollLayout;
    -[PXGScrollLayout observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (PXFeedContentLayout)feedContentLayout
{
  return self->_feedContentLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedContentLayout, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end

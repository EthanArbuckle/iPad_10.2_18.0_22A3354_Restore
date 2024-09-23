@implementation PXStoryScrubberLayout

- (PXStoryScrubberLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberLayout.m"), 58, CFSTR("%s is not available as initializer"), "-[PXStoryScrubberLayout init]");

  abort();
}

- (PXStoryScrubberLayout)initWithViewModel:(id)a3
{
  id v5;
  PXStoryScrubberLayout *v6;
  PXStoryScrubberLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryScrubberLayout;
  v6 = -[PXGLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    objc_msgSend(v5, "registerChangeObserver:context:", v7, ViewModelObservationContext_153763);
    -[PXGSplitLayout setMode:](v7, "setMode:", 5);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    v7->_focusGuideSpriteIndex = -1;
    -[PXStoryScrubberLayout _invalidateMainModel](v7, "_invalidateMainModel");
    -[PXStoryScrubberLayout _invalidateSublayouts](v7, "_invalidateSublayouts");
    -[PXStoryScrubberLayout _invalidateVisibilityFraction](v7, "_invalidateVisibilityFraction");
    -[PXStoryScrubberLayout _invalidateWantsVisible](v7, "_invalidateWantsVisible");
    -[PXStoryScrubberLayout _invalidateFocusGuide](v7, "_invalidateFocusGuide");
  }

  return v7;
}

- (void)setIsHidden:(BOOL)a3
{
  if (self->_isHidden != a3)
  {
    self->_isHidden = a3;
    -[PXStoryScrubberLayout _invalidateVisibilityFraction](self, "_invalidateVisibilityFraction");
  }
}

- (void)setCurrentSkipSegmentActionDate:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_currentSkipSegmentActionDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_currentSkipSegmentActionDate, a3);
    -[PXStoryScrubberLayout _invalidateWantsVisible](self, "_invalidateWantsVisible");
  }

}

- (void)setLastScrubbedDate:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_lastScrubbedDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_lastScrubbedDate, a3);
    -[PXStoryScrubberLayout _invalidateWantsVisible](self, "_invalidateWantsVisible");
  }

}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberLayout;
  -[PXGSplitLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryScrubberLayout _invalidateFocusGuide](self, "_invalidateFocusGuide");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberLayout;
  -[PXGSplitLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryScrubberLayout _invalidateFocusGuide](self, "_invalidateFocusGuide");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryScrubberLayout _invalidateSublayoutsAlpha](self, "_invalidateSublayoutsAlpha");
  -[PXStoryScrubberLayout _invalidateFocusGuide](self, "_invalidateFocusGuide");
}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  return 1;
}

- (BOOL)disableDebugAssertionForSublayoutUpdates
{
  return 1;
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
      -[PXStoryScrubberLayout _invalidateSublayoutsAlpha](self, "_invalidateSublayoutsAlpha");
    }
  }

}

- (void)setMainModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *mainModel;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](mainModel, "unregisterChangeObserver:context:", self, MainModelObservationContext_153764);
    objc_storeStrong((id *)&self->_mainModel, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_mainModel, "registerChangeObserver:context:", self, MainModelObservationContext_153764);
    -[PXStoryScrubberLayout _invalidateWantsVisible](self, "_invalidateWantsVisible");
    v5 = v7;
  }

}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrubberLayout;
  -[PXGSplitLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryScrubberLayout.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

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
  unint64_t v10;
  unint64_t v11;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXStoryScrubberLayout.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 64;
    if ((needsUpdate & 0x40) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFBFLL;
      -[PXStoryScrubberLayout _updateMainModel](self, "_updateMainModel");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PXStoryScrubberLayout.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if ((v5 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryScrubberLayout _updateSkipSegmentActionDate](self, "_updateSkipSegmentActionDate");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXStoryScrubberLayout.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryScrubberLayout _updateLastScrubbedDate](self, "_updateLastScrubbedDate");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXStoryScrubberLayout.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v7 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryScrubberLayout _updateWantsVisible](self, "_updateWantsVisible");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXStoryScrubberLayout.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v8 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryScrubberLayout _updateVisibilityFraction](self, "_updateVisibilityFraction");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PXStoryScrubberLayout.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v9 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXStoryScrubberLayout _updateSublayouts](self, "_updateSublayouts");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXStoryScrubberLayout.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v10 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXStoryScrubberLayout _updateSublayoutsAlpha](self, "_updateSublayoutsAlpha");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PXStoryScrubberLayout.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v11 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80uLL;
    if ((v11 & 0x80) != 0)
    {
      p_updateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFF7FLL;
      -[PXStoryScrubberLayout _updateFocusGuide](self, "_updateFocusGuide");
      v11 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout update]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXStoryScrubberLayout.m"), 186, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v30.receiver = self;
  v30.super_class = (Class)PXStoryScrubberLayout;
  -[PXGSplitLayout update](&v30, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrubberLayout;
  -[PXGSplitLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryScrubberLayout.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout _invalidateMainModel]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberLayout.m"), 196, CFSTR("invalidating %lu after it already has been updated"), 64);

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

  -[PXStoryScrubberLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberLayout setMainModel:](self, "setMainModel:", v3);

}

- (void)_invalidateSublayouts
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout _invalidateSublayouts]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberLayout.m"), 204, CFSTR("invalidating %lu after it already has been updated"), 16);

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

- (void)_updateSublayouts
{
  void *v3;
  id v4;

  -[PXStoryScrubberLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "wantsChromeVisible") & 1) != 0
    || (objc_msgSend(v4, "wantsScrubberVisible") & 1) != 0
    || (-[PXGSplitLayout firstSublayout](self, "firstSublayout"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[PXStoryScrubberLayout _loadSublayoutsIfNeeded](self, "_loadSublayoutsIfNeeded");
  }
  -[PXStoryScrubberLayout _invalidateSublayoutsAlpha](self, "_invalidateSublayoutsAlpha");

}

- (void)_loadTVSublayoutsIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXStoryScrubberContentLayout *v8;
  PXGScrollLayout *v9;
  void *v10;
  PXGScrollLayout *v11;
  double v12;
  id v13;

  -[PXStoryScrubberLayout viewModel](self, "viewModel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberLayout contentLayout](self, "contentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v13)
  {

LABEL_4:
    v8 = -[PXStoryScrubberContentLayout initWithViewModel:]([PXStoryScrubberContentLayout alloc], "initWithViewModel:", v13);
    -[PXStoryScrubberLayout setContentLayout:](self, "setContentLayout:", v8);

    v9 = [PXGScrollLayout alloc];
    -[PXStoryScrubberLayout contentLayout](self, "contentLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXGScrollLayout initWithContentLayout:](v9, "initWithContentLayout:", v10);

    -[PXGScrollLayout setClipsToBounds:](v11, "setClipsToBounds:", 0);
    -[PXGScrollLayout setShowsHorizontalScrollIndicator:](v11, "setShowsHorizontalScrollIndicator:", 0);
    -[PXGScrollLayout setShowsVerticalScrollIndicator:](v11, "setShowsVerticalScrollIndicator:", 0);
    -[PXGScrollLayout setDraggingPerformsScroll:](v11, "setDraggingPerformsScroll:", 1);
    -[PXGLayout referenceDepth](self, "referenceDepth");
    *(float *)&v12 = v12;
    -[PXGScrollLayout setScrollViewSpriteZPosition:](v11, "setScrollViewSpriteZPosition:", v12);
    -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", v11);

    goto LABEL_5;
  }
  -[PXStoryScrubberLayout contentLayout](self, "contentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mainModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    goto LABEL_4;
LABEL_5:

}

- (void)_loadSublayoutsIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXStoryScrubberContentLayout *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  PXStoryScrubberScrollLayout *v15;
  void *v16;
  PXStoryScrubberScrollLayout *v17;
  PXGScrollLayout *v18;
  double v19;
  id v20;

  -[PXStoryScrubberLayout viewModel](self, "viewModel");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberLayout contentLayout](self, "contentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v20)
  {
    -[PXStoryScrubberLayout contentLayout](self, "contentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mainModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      goto LABEL_5;
  }
  else
  {

  }
  v8 = -[PXStoryScrubberContentLayout initWithViewModel:]([PXStoryScrubberContentLayout alloc], "initWithViewModel:", v20);
  -[PXStoryScrubberLayout setContentLayout:](self, "setContentLayout:", v8);

  -[PXStoryScrubberLayout contentLayout](self, "contentLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", v9);

LABEL_5:
  -[PXStoryScrubberLayout scrollLayout](self, "scrollLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v20)
  {

LABEL_8:
    v15 = [PXStoryScrubberScrollLayout alloc];
    objc_msgSend(v20, "mainModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXStoryScrubberScrollLayout initWithViewModel:model:](v15, "initWithViewModel:model:", v20, v16);

    v18 = -[PXGScrollLayout initWithContentLayout:]([PXGScrollLayout alloc], "initWithContentLayout:", v17);
    -[PXGScrollLayout setDelegate:](v18, "setDelegate:", v17);
    -[PXGScrollLayout setShowsHorizontalScrollIndicator:](v18, "setShowsHorizontalScrollIndicator:", 0);
    -[PXGScrollLayout setShowsVerticalScrollIndicator:](v18, "setShowsVerticalScrollIndicator:", 0);
    -[PXGScrollLayout setDraggingPerformsScroll:](v18, "setDraggingPerformsScroll:", 1);
    -[PXGLayout referenceDepth](self, "referenceDepth");
    *(float *)&v19 = v19;
    -[PXGScrollLayout setScrollViewSpriteZPosition:](v18, "setScrollViewSpriteZPosition:", v19);
    -[PXGSplitLayout setSecondSublayout:](self, "setSecondSublayout:", v18);
    -[PXStoryScrubberLayout setScrollLayout:](self, "setScrollLayout:", v17);

    goto LABEL_9;
  }
  -[PXStoryScrubberLayout scrollLayout](self, "scrollLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mainModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v14)
    goto LABEL_8;
LABEL_9:

}

- (void)_invalidateSublayoutsAlpha
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout _invalidateSublayoutsAlpha]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberLayout.m"), 259, CFSTR("invalidating %lu after it already has been updated"), 32);

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

- (void)_updateSublayoutsAlpha
{
  double v3;
  double v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  id v9;

  -[PXGLayout alpha](self, "alpha");
  v4 = v3;
  -[PXStoryScrubberLayout alphaOverride](self, "alphaOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v4 = v6;
  }
  -[PXGSplitLayout firstSublayout](self, "firstSublayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v4);

  -[PXGSplitLayout secondSublayout](self, "secondSublayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v4);

}

- (void)_invalidateSkipSegmentActionDate
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout _invalidateSkipSegmentActionDate]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberLayout.m"), 276, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateSkipSegmentActionDate
{
  void *v3;
  id v4;

  -[PXStoryScrubberLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastSkipSegmentActionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberLayout setCurrentSkipSegmentActionDate:](self, "setCurrentSkipSegmentActionDate:", v3);

}

- (void)_invalidateLastScrubbedDate
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout _invalidateLastScrubbedDate]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberLayout.m"), 284, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateLastScrubbedDate
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[PXStoryScrubberLayout setLastScrubbedDate:](self, "setLastScrubbedDate:", v3);

}

- (void)_invalidateWantsVisible
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout _invalidateWantsVisible]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberLayout.m"), 292, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)_updateWantsVisible
{
  BOOL isUpdatingWantsVisible;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v15[4];
  char v16;

  isUpdatingWantsVisible = self->_isUpdatingWantsVisible;
  self->_isUpdatingWantsVisible = 1;
  -[PXStoryScrubberLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scrubberDisplayMode");
  if (v6)
  {
    v7 = v6 == 1;
    v8 = 1;
  }
  else
  {
    v9 = objc_msgSend(v4, "viewMode");
    v10 = objc_msgSend(v4, "wantsChromeVisible");
    v11 = objc_msgSend(v4, "wantsRelatedOverlayVisible");
    objc_msgSend(v4, "mainModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "desiredInfoPanelVisibilityFraction");
    v14 = v13;

    if (v14 == 1.0)
      v8 = 0;
    else
      v8 = v10;
    if ((v11 & 1) != 0)
      v8 = 0;
    v7 = v9 == 1;
  }
  if (!v7)
    v8 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__PXStoryScrubberLayout__updateWantsVisible__block_invoke;
  v15[3] = &__block_descriptor_33_e35_v16__0___PXStoryMutableViewModel__8l;
  v16 = v8;
  objc_msgSend(v4, "performChanges:", v15);
  self->_isUpdatingWantsVisible = isUpdatingWantsVisible;

}

- (void)_invalidateVisibilityFraction
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout _invalidateVisibilityFraction]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberLayout.m"), 327, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)_updateVisibilityFraction
{
  id v3;

  if (-[PXStoryScrubberLayout isHidden](self, "isHidden"))
  {
    -[PXGLayout setAlpha:](self, "setAlpha:", 0.0);
  }
  else
  {
    -[PXStoryScrubberLayout viewModel](self, "viewModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrubberVisibilityFraction");
    -[PXGLayout setAlpha:](self, "setAlpha:");

  }
}

- (void)_invalidateFocusGuide
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_focusGuideSpriteIndex != -1)
  {
    -[PXStoryScrubberLayout setFocusGuideContentVersion:](self, "setFocusGuideContentVersion:", (unsigned __int16)(-[PXStoryScrubberLayout focusGuideContentVersion](self, "focusGuideContentVersion") + 1));
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0x80;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x80) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberLayout _invalidateFocusGuide]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXStoryScrubberLayout.m"), 339, CFSTR("invalidating %lu after it already has been updated"), 128);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 128;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)_updateFocusGuide
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[9];

  if (self->_focusGuideSpriteIndex != -1)
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    PXRectWithOriginAndSize();
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__PXStoryScrubberLayout__updateFocusGuide__block_invoke;
    v12[3] = &unk_1E513AEF0;
    v12[4] = self;
    v12[5] = v4;
    v12[6] = v6;
    v12[7] = v8;
    v12[8] = v10;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v11 << 32, v12);
  }
}

- (BOOL)_shouldEnableFocusGuide
{
  void *v2;
  int v3;

  -[PXStoryScrubberLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "viewMode") == 1 && objc_msgSend(v2, "wantsChromeVisible"))
    v3 = objc_msgSend(v2, "wantsRelatedOverlayVisible") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5;

  v5 = a3;
  -[PXGLayout alpha](self, "alpha");
  objc_msgSend(v5, "setScrubberAlpha:");

}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  void *v5;
  id v6;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "scrubberAlpha");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryScrubberLayout setAlphaOverride:](self, "setAlphaOverride:", v6);

  }
  else
  {
    -[PXStoryScrubberLayout setAlphaOverride:](self, "setAlphaOverride:", 0, a4);
  }
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_focusGuideSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberLayout.m"), 379, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  PXGFocusGuideViewConfiguration *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (self->_focusGuideSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberLayout.m"), 389, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  v9 = objc_alloc_init(PXGFocusGuideViewConfiguration);
  PXGDeepestPreferredFocusEnvironmentsForLayout(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGFocusGuideViewConfiguration setPreferredFocusEnvironments:](v9, "setPreferredFocusEnvironments:", v10);

  return v9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((void *)ViewModelObservationContext_153763 == a5)
  {
    if ((a4 & 0x800000) != 0)
      -[PXStoryScrubberLayout _invalidateLastScrubbedDate](self, "_invalidateLastScrubbedDate");
    if ((a4 & 0x4000000A008) != 0 && !self->_isUpdatingWantsVisible)
      -[PXStoryScrubberLayout _invalidateWantsVisible](self, "_invalidateWantsVisible");
    if ((a4 & 0x1000000) != 0)
      -[PXStoryScrubberLayout _invalidateVisibilityFraction](self, "_invalidateVisibilityFraction");
    if ((a4 & 0x4000000) != 0)
      -[PXStoryScrubberLayout _invalidateSkipSegmentActionDate](self, "_invalidateSkipSegmentActionDate");
    if ((a4 & 0x2000048) != 0)
      -[PXStoryScrubberLayout _invalidateSublayouts](self, "_invalidateSublayouts");
    if ((a4 & 0x40) != 0)
      -[PXStoryScrubberLayout _invalidateMainModel](self, "_invalidateMainModel");
    v9 = 16818184;
  }
  else
  {
    if ((void *)MainModelObservationContext_153764 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberLayout.m"), 426, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 0x400000000000000) != 0)
      -[PXStoryScrubberLayout _invalidateWantsVisible](self, "_invalidateWantsVisible");
    v9 = 34;
  }
  if ((a4 & v9) != 0)
    -[PXStoryScrubberLayout _invalidateFocusGuide](self, "_invalidateFocusGuide");

}

- (id)preferredFocusLayouts
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[PXStoryScrubberLayout contentLayout](self, "contentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryScrubberLayout contentLayout](self, "contentLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)axSpriteIndexes
{
  id v2;

  if (self->_focusGuideSpriteIndex == -1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (NSDate)currentSkipSegmentActionDate
{
  return self->_currentSkipSegmentActionDate;
}

- (NSDate)lastScrubbedDate
{
  return self->_lastScrubbedDate;
}

- (PXStoryScrubberContentLayout)contentLayout
{
  return self->_contentLayout;
}

- (void)setContentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayout, a3);
}

- (PXStoryScrubberScrollLayout)scrollLayout
{
  return self->_scrollLayout;
}

- (void)setScrollLayout:(id)a3
{
  objc_storeStrong((id *)&self->_scrollLayout, a3);
}

- (NSNumber)alphaOverride
{
  return self->_alphaOverride;
}

- (unsigned)focusGuideContentVersion
{
  return self->_focusGuideContentVersion;
}

- (void)setFocusGuideContentVersion:(unsigned __int16)a3
{
  self->_focusGuideContentVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaOverride, 0);
  objc_storeStrong((id *)&self->_scrollLayout, 0);
  objc_storeStrong((id *)&self->_contentLayout, 0);
  objc_storeStrong((id *)&self->_lastScrubbedDate, 0);
  objc_storeStrong((id *)&self->_currentSkipSegmentActionDate, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

float32x2_t __42__PXStoryScrubberLayout__updateFocusGuide__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  char v16;
  float32x2_t *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v25;
  float32x2_t result;
  CGFloat Width;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v9 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1044));
  v10 = *((_OWORD *)off_1E50B83A0 + 7);
  v9[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v9[7] = v10;
  v11 = *((_OWORD *)off_1E50B83A0 + 9);
  v9[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v9[9] = v11;
  v12 = *((_OWORD *)off_1E50B83A0 + 3);
  v9[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v9[3] = v12;
  v13 = *((_OWORD *)off_1E50B83A0 + 5);
  v9[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v9[5] = v13;
  v14 = *((_OWORD *)off_1E50B83A0 + 1);
  *v9 = *(_OWORD *)off_1E50B83A0;
  v9[1] = v14;
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  *(float *)&v15 = v15;
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1044)) = LODWORD(v15);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1044) + 32) = objc_msgSend(*(id *)(a1 + 32), "focusGuideContentVersion");
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldEnableFocusGuide"))
    v16 = 10;
  else
    v16 = 0;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1044) + 1) = v16;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1044)) = 1;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1044) + 34) = 2;
  v17 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1044));
  v18 = *(double *)(a1 + 40);
  v19 = *(double *)(a1 + 48);
  v20 = *(double *)(a1 + 56);
  v21 = *(double *)(a1 + 64);
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v20;
  v28.size.height = v21;
  MidX = CGRectGetMidX(v28);
  v29.origin.x = v18;
  v29.origin.y = v19;
  v29.size.width = v20;
  v29.size.height = v21;
  MidY = CGRectGetMidY(v29);
  v30.origin.x = v18;
  v30.origin.y = v19;
  v30.size.width = v20;
  v30.size.height = v21;
  Width = CGRectGetWidth(v30);
  v31.origin.x = v18;
  v31.origin.y = v19;
  v31.size.width = v20;
  v31.size.height = v21;
  Height = CGRectGetHeight(v31);
  v25.f64[0] = Width;
  v25.f64[1] = Height;
  result = vcvt_f32_f64(v25);
  *(CGFloat *)v17 = MidX;
  *(CGFloat *)&v17[1] = MidY;
  v17[2] = 0;
  v17[3] = result;
  return result;
}

uint64_t __44__PXStoryScrubberLayout__updateWantsVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsScrubberVisible:", *(unsigned __int8 *)(a1 + 32));
}

@end

@implementation PXStoryStyleSwitchingFullsizeLayout

- (PXStoryStyleSwitchingFullsizeLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 85, CFSTR("%s is not available as initializer"), "-[PXStoryStyleSwitchingFullsizeLayout init]");

  abort();
}

- (PXStoryStyleSwitchingFullsizeLayout)initWithModel:(id)a3
{
  id v5;
  PXStoryStyleSwitchingFullsizeLayout *v6;
  uint64_t v7;
  PXCArrayStore *fullsizeFrameRectsStore;
  void *v9;
  void *v10;
  unsigned int spriteCount;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  NSMutableIndexSet *axSpriteIndexes;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  v6 = -[PXGAbsoluteCompositeLayout init](&v17, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 32);
    fullsizeFrameRectsStore = v6->_fullsizeFrameRectsStore;
    v6->_fullsizeFrameRectsStore = (PXCArrayStore *)v7;

    objc_storeStrong((id *)&v6->_model, a3);
    -[PXStoryModel registerChangeObserver:context:](v6->_model, "registerChangeObserver:context:", v6, ModelObservationContext_143305);
    -[PXStoryModel styleManager](v6->_model, "styleManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerChangeObserver:context:", v6, StyleManagerObservationContext_143306);
    objc_msgSend(v9, "selectionDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryStyleSwitchingFullsizeLayout setDataSource:](v6, "setDataSource:", v10);

    -[PXGCompositeLayout setSublayoutFaultingDelegate:](v6, "setSublayoutFaultingDelegate:", v6);
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyles](v6, "_invalidateDisplayedStyles");
    -[PXGLayout setContentSource:](v6, "setContentSource:", v6);
    spriteCount = v6->_spriteCount;
    v6->_spriteCount = spriteCount + 1;
    v6->_styleSwitcherTitleSpriteIndex = spriteCount;
    v12 = v6->_spriteCount;
    v6->_spriteCount = v12 + 1;
    v6->_pageControlSpriteIndex = v12;
    v13 = v6->_spriteCount;
    v6->_spriteCount = v13 + 1;
    v6->_restartButtonSpriteIndex = v13;
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](v6, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", 0, v6->_spriteCount, 0, 0);
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateTitleString](v6, "_invalidateTitleString");
    -[PXStoryStyleSwitchingFullsizeLayout _invalidatePageControl](v6, "_invalidatePageControl");
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateRestartButton](v6, "_invalidateRestartButton");
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, v6->_spriteCount);
    axSpriteIndexes = v6->_axSpriteIndexes;
    v6->_axSpriteIndexes = (NSMutableIndexSet *)v14;

  }
  return v6;
}

- (PXStoryFullsizeLayout)dominantFullsizePlayerLayout
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleSwitcherVisibilityFraction");
  if (v6 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "styleManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "focusedStyleIndex");
    v9 = v8 - -[PXStoryStyleSwitchingFullsizeLayout displayedStyleRange](self, "displayedStyleRange");

  }
  if (v9 < objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "sublayoutAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secondSublayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 127, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("splitLayout.secondSublayout"), v16, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 127, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("splitLayout.secondSublayout"), v16);
    }

    goto LABEL_7;
  }
  PLStoryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v20 = v9;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Unable to return the dominant fullsize player layout, because there is no sublayout at index %ld", buf, 0xCu);
  }

  v11 = 0;
LABEL_11:

  return (PXStoryFullsizeLayout *)v11;
}

- (void)setDataSource:(id)a3
{
  PXStoryStyleSelectionDataSource *v5;
  BOOL v6;
  PXStoryStyleSelectionDataSource *v7;

  v7 = (PXStoryStyleSelectionDataSource *)a3;
  v5 = self->_dataSource;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStyleSelectionDataSource isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      -[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyleRange](self, "_invalidateDisplayedStyleRange");
      -[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyles](self, "_invalidateDisplayedStyles");
    }
  }

}

- (void)setDisplayedStyleRange:(_NSRange)a3
{
  if (a3.location != self->_displayedStyleRange.location || a3.length != self->_displayedStyleRange.length)
  {
    self->_displayedStyleRange = a3;
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyles](self, "_invalidateDisplayedStyles");
  }
}

- (void)setDisplayedStyleInfos:(id)a3
{
  NSArray *v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *displayedStyleInfos;
  NSArray *v10;

  v10 = (NSArray *)a3;
  v4 = self->_displayedStyleInfos;
  v5 = v10;
  if (v4 == v10)
  {
LABEL_8:

    goto LABEL_9;
  }
  v6 = -[NSArray isEqual:](v10, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    if (-[NSArray count](self->_displayedStyleInfos, "count") == 1 && -[NSArray count](v10, "count") == 1)
    {
      objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", self->_displayedStyleInfos, v10, MEMORY[0x1E0C9AA60]);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;
    v8 = (NSArray *)-[NSArray copy](v10, "copy");
    displayedStyleInfos = self->_displayedStyleInfos;
    self->_displayedStyleInfos = v8;

    -[PXGLayout applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:](self, "applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:", v5, -[NSArray count](v10, "count"), self);
    -[PXStoryStyleSwitchingFullsizeLayout _invalidatePageControl](self, "_invalidatePageControl");
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
    goto LABEL_8;
  }
LABEL_9:

}

- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3
{
  if (self->_relativeZPositionAboveLegibilityGradients != a3)
  {
    self->_relativeZPositionAboveLegibilityGradients = a3;
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
  -[PXStoryStyleSwitchingFullsizeLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  -[PXGCompositeLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
  -[PXStoryStyleSwitchingFullsizeLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  return 0;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  -[PXGCompositeLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

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
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 2;
    if ((needsUpdate & 2) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryStyleSwitchingFullsizeLayout _updateDisplayedStyleRange](self, "_updateDisplayedStyleRange");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout update]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v5 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryStyleSwitchingFullsizeLayout _updateDisplayedStyles](self, "_updateDisplayedStyles");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v6 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryStyleSwitchingFullsizeLayout _updateTitleString](self, "_updateTitleString");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v7 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXStoryStyleSwitchingFullsizeLayout _updatePageControl](self, "_updatePageControl");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXStoryStyleSwitchingFullsizeLayout _updateRestartButton](self, "_updateRestartButton");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout update]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if ((v9 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryStyleSwitchingFullsizeLayout _updateContent](self, "_updateContent");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout update]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v10 & 0x40) != 0)
    {
      p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFBFLL;
      -[PXStoryStyleSwitchingFullsizeLayout _updateAXSpriteIndexes](self, "_updateAXSpriteIndexes");
      v10 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout update]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 233, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v27.receiver = self;
  v27.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  -[PXGCompositeLayout update](&v27, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
  -[PXGCompositeLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateTitleString
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout _invalidateTitleString]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 243, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)_updateTitleString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryStyleSwitcherTitle"), CFSTR("PhotosUICore"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleSwitcherTitleAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:attributes:", v8, v6);
  -[PXStoryStyleSwitchingFullsizeLayout setStyleSwitcherTitleString:](self, "setStyleSwitcherTitleString:", v7);

}

- (void)_invalidatePageControl
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout _invalidatePageControl]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 252, CFSTR("invalidating %lu after it already has been updated"), 16);

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

- (void)_updatePageControl
{
  void *v3;
  PXGPageControlConfiguration *v4;
  void *v5;
  id v6;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PXGPageControlConfiguration);
  -[PXGPageControlConfiguration setCurrentPage:](v4, "setCurrentPage:", objc_msgSend(v3, "focusedStyleIndex"));
  objc_msgSend(v3, "selectionDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGPageControlConfiguration setNumberOfPages:](v4, "setNumberOfPages:", objc_msgSend(v5, "numberOfStyles"));

  -[PXGPageControlConfiguration setHidesForSinglePage:](v4, "setHidesForSinglePage:", 1);
  -[PXGPageControlConfiguration setTarget:](v4, "setTarget:", self);
  -[PXGPageControlConfiguration setAction:](v4, "setAction:", sel__handlePageControl_);
  -[PXStoryStyleSwitchingFullsizeLayout setPageControlConfiguration:](self, "setPageControlConfiguration:", v4);

}

- (void)_invalidateRestartButton
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout _invalidateRestartButton]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 268, CFSTR("invalidating %lu after it already has been updated"), 32);

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

- (void)_updateRestartButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXStoryChromeButtonConfiguration *v7;

  v7 = objc_alloc_init(PXStoryChromeButtonConfiguration);
  -[PXStoryChromeButtonConfiguration setBackgroundStyle:](v7, "setBackgroundStyle:", 0);
  -[PXStoryChromeButtonConfiguration setTarget:](v7, "setTarget:", self);
  -[PXStoryChromeButtonConfiguration setAction:](v7, "setAction:", sel__handleRestartButton_);
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleSwitcherChromeButtonSpec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButtonConfiguration setSpec:](v7, "setSpec:", v5);

  -[PXStoryChromeButtonConfiguration setSystemImageName:](v7, "setSystemImageName:", CFSTR("arrow.counterclockwise"));
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryButtonAccessibilityLabelRestart"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryChromeButtonConfiguration setAxLabel:](v7, "setAxLabel:", v6);

  -[PXStoryStyleSwitchingFullsizeLayout setRestartButtonConfiguration:](self, "setRestartButtonConfiguration:", v7);
}

- (void)_invalidateDisplayedStyleRange
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyleRange]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 283, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateDisplayedStyleRange
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "styleSwitcherVisibilityFraction");
  if (v5 <= 0.0)
  {
    if (objc_msgSend(v4, "indexOfCurrentStyle") != 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v4, "numberOfStyles") <= 0)
      objc_msgSend(v4, "indexOfCurrentStyle");
  }
  else
  {
    objc_msgSend(v4, "numberOfStyles");
    objc_msgSend(v7, "styleManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "focusedStyleIndex");

  }
  -[PXStoryStyleSwitchingFullsizeLayout setDisplayedStyleRange:](self, "setDisplayedStyleRange:");

}

- (void)_invalidateDisplayedStyles
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyles]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 308, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)_updateDisplayedStyles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "numberOfStyles") < 1)
  {
    +[_PXStoryFallbackStyleDescriptor defaultFallbackStyleDescriptor](_PXStoryFallbackStyleDescriptor, "defaultFallbackStyleDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = -[PXStoryStyleSwitchingFullsizeLayout displayedStyleRange](self, "displayedStyleRange");
    objc_msgSend(v5, "infosForStylesInRange:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXStoryStyleSwitchingFullsizeLayout setDisplayedStyleInfos:](self, "setDisplayedStyleInfos:", v8);

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
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 325, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateContent
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  _QWORD v38[13];
  char v39;
  _QWORD v40[6];
  _QWORD v41[12];
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleSwitcherVisibilityFraction");
  v8 = v7;
  -[PXGLayout referenceSize](self, "referenceSize");
  PXRectWithOriginAndSize();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "layoutSpec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "options") & 1) != 0)
    v18 = 0;
  else
    v18 = objc_msgSend(v6, "isAsync") ^ 1;
  v19 = v16;
  v37 = v14;
  v20 = v12;
  v21 = v10;
  if (v8 > 0.0)
  {
    objc_msgSend(v17, "styleSwitcherViewportInset");
    PXEdgeInsetsInsetRectEdges();
    v36 = v8;
    PXRectByLinearlyInterpolatingRects();
    v21 = v22;
    v12 = v23;
    v14 = v24;
    v19 = v25;
  }
  -[PXStoryStyleSwitchingFullsizeLayout fullsizeFrameRectsStore](self, "fullsizeFrameRectsStore", *(_QWORD *)&v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke;
  v41[3] = &unk_1E5140BE8;
  v41[6] = v21;
  v41[7] = v12;
  v41[8] = v14;
  v41[9] = v19;
  v41[4] = self;
  v41[5] = v5;
  v41[10] = 0;
  v41[11] = v5;
  objc_msgSend(v26, "accessArrayWithElementsCount:accessBlock:", v5, v41);

  if (v8 <= 0.0 && v5 >= 2)
  {
    PXAssertGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v43 = v5;
      _os_log_error_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "Expected at most 1 sublayout when not in PXStoryViewModeStyleSwitcher, but found %ld", buf, 0xCu);
    }

  }
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v27;
  v40[1] = 3221225472;
  v40[2] = __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke_182;
  v40[3] = &unk_1E512D400;
  v40[4] = self;
  v40[5] = a2;
  objc_msgSend(v29, "enumerateSublayoutsInRange:options:usingBlock:", 0, v5, 0, v40);

  -[PXGLayout displayScale](self, "displayScale");
  v31 = v30;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v33 = v32;
  -[PXGLayout alpha](self, "alpha");
  v34 = (unint64_t)self->_spriteCount << 32;
  v38[0] = v27;
  v38[1] = 3221225472;
  v38[2] = __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke_2;
  v38[3] = &unk_1E512D428;
  v38[6] = v10;
  v38[7] = v20;
  v38[8] = v37;
  v38[9] = v16;
  v38[4] = v17;
  v38[5] = self;
  v38[10] = v33;
  *(double *)&v38[11] = v8 * v35;
  v38[12] = v31;
  v39 = v18;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v34, v38);

}

- (void)_invalidateAXSpriteIndexes
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleSwitchingFullsizeLayout _invalidateAXSpriteIndexes]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 406, CFSTR("invalidating %lu after it already has been updated"), 64);

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

- (void)_updateAXSpriteIndexes
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void (**v11)(void *, _BOOL8, uint64_t);
  _BOOL8 v12;
  _QWORD aBlock[5];

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode") == 4;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "focusedStyleIndex");
  objc_msgSend(v6, "selectionDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfStyles") - 1;

  v10 = v7 != v9 && v4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PXStoryStyleSwitchingFullsizeLayout__updateAXSpriteIndexes__block_invoke;
  aBlock[3] = &unk_1E5142A88;
  aBlock[4] = self;
  v11 = (void (**)(void *, _BOOL8, uint64_t))_Block_copy(aBlock);
  v11[2](v11, v4, 1001);
  v11[2](v11, v10, 1002);
  if (v7)
    v12 = v4;
  else
    v12 = 0;
  v11[2](v11, v12, 1000);

}

- (void)_handlePageControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v4 = a3;
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "currentPage");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PXStoryStyleSwitchingFullsizeLayout__handlePageControl___block_invoke;
  v8[3] = &__block_descriptor_40_e38_v16__0___PXStoryMutableStyleManager__8l;
  v8[4] = v7;
  objc_msgSend(v6, "performChanges:origin:", v8, 6);

}

- (void)_handleRestartButton:(id)a3
{
  id v3;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_143316);

}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return &stru_1E5149688;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_styleSwitcherTitleSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 473, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXStoryStyleSwitchingFullsizeLayout styleSwitcherTitleString](self, "styleSwitcherTitleString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a4;
  if (self->_pageControlSpriteIndex != a3 && self->_restartButtonSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 484, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_pageControlSpriteIndex == a3)
  {
    -[PXStoryStyleSwitchingFullsizeLayout pageControlConfiguration](self, "pageControlConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_restartButtonSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 493, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXStoryStyleSwitchingFullsizeLayout restartButtonConfiguration](self, "restartButtonConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4
{
  return 1;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PXStoryFullsizeLayout *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PXGSplitLayout *v17;
  PXGRoundedCornerMaskLayout *v18;
  void *v19;
  PXGRoundedCornerMaskLayout *v20;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryStyleSwitchingFullsizeLayout displayedStyleRange](self, "displayedStyleRange") + a4;
  -[PXStoryStyleSwitchingFullsizeLayout dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfCurrentStyle");

  if (v8 == v10)
  {
    v11 = 0;
  }
  else
  {
    -[PXStoryStyleSwitchingFullsizeLayout displayedStyleInfos](self, "displayedStyleInfos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = -[PXStoryFullsizeLayout initWithModel:overrideStyleInfo:]([PXStoryFullsizeLayout alloc], "initWithModel:overrideStyleInfo:", v6, v11);
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extendedTraitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 == 5)
  {
    -[PXStoryStyleSwitchingFullsizeLayout _configureTimelineLayout:maskLayout:forIndex:](self, "_configureTimelineLayout:maskLayout:forIndex:", v13, 0, a4);
    v17 = v13;
  }
  else
  {
    v18 = [PXGRoundedCornerMaskLayout alloc];
    objc_msgSend(v7, "backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PXGRoundedCornerMaskLayout initWithCornerRadius:continuousCorners:maskColor:](v18, "initWithCornerRadius:continuousCorners:maskColor:", 1, v19, 16.0);

    -[PXStoryStyleSwitchingFullsizeLayout _configureTimelineLayout:maskLayout:forIndex:](self, "_configureTimelineLayout:maskLayout:forIndex:", v13, v20, a4);
    v17 = objc_alloc_init(PXGSplitLayout);
    -[PXGSplitLayout setFirstSublayout:](v17, "setFirstSublayout:", v20);
    -[PXGSplitLayout setSecondSublayout:](v17, "setSecondSublayout:", v13);
    -[PXGSplitLayout setMode:](v17, "setMode:", 4);

  }
  return v17;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((void *)ModelObservationContext_143305 == a5)
  {
    if ((a4 & 0x2000) != 0)
    {
      -[PXStoryStyleSwitchingFullsizeLayout _invalidateTitleString](self, "_invalidateTitleString");
      -[PXStoryStyleSwitchingFullsizeLayout _invalidatePageControl](self, "_invalidatePageControl");
      -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
      -[PXStoryStyleSwitchingFullsizeLayout _invalidateRestartButton](self, "_invalidateRestartButton");
      if ((a4 & 0x2000000000000) == 0)
      {
LABEL_9:
        if ((a4 & 0x10000) == 0)
          goto LABEL_11;
LABEL_10:
        -[PXStoryStyleSwitchingFullsizeLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
        goto LABEL_11;
      }
    }
    else if ((a4 & 0x2000000000000) == 0)
    {
      goto LABEL_9;
    }
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyleRange](self, "_invalidateDisplayedStyleRange");
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
    if ((a4 & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((void *)StyleManagerObservationContext_143306 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 564, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 0x100) != 0)
  {
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateDisplayedStyleRange](self, "_invalidateDisplayedStyleRange");
    -[PXStoryStyleSwitchingFullsizeLayout _invalidatePageControl](self, "_invalidatePageControl");
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
    -[PXStoryStyleSwitchingFullsizeLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
  }
  if ((a4 & 0x20) != 0)
  {
    -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styleManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryStyleSwitchingFullsizeLayout setDataSource:](self, "setDataSource:", v11);

  }
LABEL_11:

}

- (void)_configureTimelineLayout:(id)a3 maskLayout:(id)a4 forIndex:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double MinX;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  double v54;
  double v55;
  id v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v56 = a3;
  v8 = a4;
  -[PXGLayout alpha](self, "alpha");
  v10 = v9;
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutSpec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "styleSwitcherLayoutDirection");
  objc_msgSend(v11, "styleSwitcherVisibilityFraction");
  v15 = v14;
  if (v14 <= 0.0)
  {
    MinX = *((double *)off_1E50B8020 + 1);
    v33 = *((double *)off_1E50B8020 + 3);
    v37 = 0.0;
    v55 = 0.0;
  }
  else
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    v17 = v16;
    objc_msgSend(v12, "styleSwitcherViewportSpacing");
    v19 = v18;
    objc_msgSend(v11, "styleManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectionFocus");
    v22 = v21;

    v54 = v10;
    v23 = (double)(unint64_t)(-[PXStoryStyleSwitchingFullsizeLayout displayedStyleRange](self, "displayedStyleRange")+ a5)- v22;
    PXRectWithOriginAndSize();
    objc_msgSend(v12, "styleSwitcherViewportInset");
    PXEdgeInsetsInsetRectEdges();
    PXRectByLinearlyInterpolatingRects();
    x = v57.origin.x;
    y = v57.origin.y;
    width = v57.size.width;
    height = v57.size.height;
    v28 = v23 * (v19 + CGRectGetWidth(v57));
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v59 = CGRectOffset(v58, v28, 0.0);
    v29 = v59.origin.x;
    v30 = v59.origin.y;
    v31 = v59.size.width;
    v32 = v59.size.height;
    v33 = v17 - CGRectGetMaxX(v59);
    v60.origin.x = v29;
    v60.origin.y = v30;
    v60.size.width = v31;
    v60.size.height = v32;
    MinX = CGRectGetMinX(v60);
    if (a5)
      v35 = v19 * 0.75;
    else
      v35 = MinX;
    v55 = v35;
    -[PXStoryStyleSwitchingFullsizeLayout displayedStyleRange](self, "displayedStyleRange", *(_QWORD *)&v15);
    if (v36 - 1 == a5)
      v37 = v33;
    else
      v37 = v19 * 0.75;
    v10 = v54;
  }
  v38 = *(double *)off_1E50B8020;
  v39 = *((double *)off_1E50B8020 + 2);
  v40 = v10;
  objc_msgSend(v56, "setAlpha:", v10);
  objc_msgSend(v56, "setTextAlpha:", 1.0 - v15);
  v41 = v33;
  v42 = v39;
  v43 = MinX;
  v44 = v38;
  if (v13 == 2)
    PXEdgeInsetsByFlippingHorizontally();
  objc_msgSend(v56, "setClippingInsets:", v44, v43, v42, v41);
  -[PXGLayout referenceDepth](self, "referenceDepth");
  objc_msgSend(v56, "setReferenceDepth:");
  objc_msgSend(v56, "referenceDepth");
  v46 = v45;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v48 = v46 / v47;
  -[PXStoryStyleSwitchingFullsizeLayout relativeZPositionAboveLegibilityGradients](self, "relativeZPositionAboveLegibilityGradients");
  objc_msgSend(v56, "setRelativeZPositionAboveLegibilityGradients:", v49 / v48);
  if (v8)
  {
    objc_msgSend(v8, "setInsets:", v38, MinX, v39, v33);
    objc_msgSend(v8, "setAlpha:", v40);
    objc_msgSend(v8, "setMaskScale:", v15);
    objc_msgSend(v8, "setLeftMaskWidth:", v55);
    objc_msgSend(v8, "setRightMaskWidth:", v37);
    objc_msgSend(v12, "backgroundColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "wantsHighContrastColors");

    if (v52)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (double)fmod((double)(-[PXStoryStyleSwitchingFullsizeLayout displayedStyleRange](self, "displayedStyleRange") + a5)* 0.2, 1.0), 1.0, 1.0, 1.0);
      v53 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)v53;
    }
    objc_msgSend(v8, "setMaskColor:", v50);

  }
}

- (void)setStyleSwitcherTitleString:(id)a3
{
  NSAttributedString *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *styleSwitcherTitleString;
  NSAttributedString *v8;

  v8 = (NSAttributedString *)a3;
  v4 = self->_styleSwitcherTitleString;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSAttributedString isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
      styleSwitcherTitleString = self->_styleSwitcherTitleString;
      self->_styleSwitcherTitleString = v6;

      -[PXStoryStyleSwitchingFullsizeLayout setStyleSwitcherTitleVersion:](self, "setStyleSwitcherTitleVersion:", -[PXStoryStyleSwitchingFullsizeLayout styleSwitcherTitleVersion](self, "styleSwitcherTitleVersion") + 1);
      -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (void)setPageControlConfiguration:(id)a3
{
  PXGPageControlConfiguration *v4;
  BOOL v5;
  PXGPageControlConfiguration *v6;
  PXGPageControlConfiguration *pageControlConfiguration;
  PXGPageControlConfiguration *v8;

  v8 = (PXGPageControlConfiguration *)a3;
  v4 = self->_pageControlConfiguration;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXGPageControlConfiguration isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXGPageControlConfiguration *)-[PXGPageControlConfiguration copy](v8, "copy");
      pageControlConfiguration = self->_pageControlConfiguration;
      self->_pageControlConfiguration = v6;

      -[PXStoryStyleSwitchingFullsizeLayout setPageControlVersion:](self, "setPageControlVersion:", -[PXStoryStyleSwitchingFullsizeLayout pageControlVersion](self, "pageControlVersion") + 1);
      -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (void)setRestartButtonConfiguration:(id)a3
{
  PXStoryChromeButtonConfiguration *v5;
  BOOL v6;
  PXStoryChromeButtonConfiguration *v7;

  v7 = (PXStoryChromeButtonConfiguration *)a3;
  v5 = self->_restartButtonConfiguration;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryChromeButtonConfiguration isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_restartButtonConfiguration, a3);
      -[PXStoryStyleSwitchingFullsizeLayout setRestartButtonVersion:](self, "setRestartButtonVersion:", -[PXStoryStyleSwitchingFullsizeLayout restartButtonVersion](self, "restartButtonVersion") + 1);
      -[PXStoryStyleSwitchingFullsizeLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (CGRect)axFrame
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
  CGRect result;

  -[PXGLayout referenceSize](self, "referenceSize");
  PXRectWithOriginAndSize();
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "styleSwitcherViewportInset");
  PXEdgeInsetsInsetRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)axSpriteIndexes
{
  return (id)-[NSMutableIndexSet copy](self->_axSpriteIndexes, "copy");
}

- (id)axVisibleSpriteIndexes
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleSwitcherVisibilityFraction");
  v5 = v4;

  if (v5 <= 0.5)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  }
  else
  {
    -[PXStoryStyleSwitchingFullsizeLayout axSpriteIndexes](self, "axSpriteIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeIndex:", 1000);
    objc_msgSend(v7, "removeIndex:", 1002);
    objc_msgSend(v7, "removeIndex:", 1001);
    v8 = (id)objc_msgSend(v7, "copy");

  }
  return v8;
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  void *v5;
  unsigned int v6;
  unsigned int v7;

  if (a4 - 4 < 2)
  {
    -[PXStoryStyleSwitchingFullsizeLayout axSpriteIndexes](self, "axSpriteIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexGreaterThanIndex:", a3);
  }
  else
  {
    if (a4 != 6 && a4 != 3)
      return -1;
    -[PXStoryStyleSwitchingFullsizeLayout axSpriteIndexes](self, "axSpriteIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexLessThanIndex:", a3);
  }
  v7 = v6;

  return v7;
}

- (BOOL)_isFakeAXSpriteIndex:(unint64_t)a3
{
  return a3 == 1002 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 1000;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v21;
  CGFloat Width;
  _QWORD v24[4];
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = *(_QWORD *)&a3;
  if (-[PXStoryStyleSwitchingFullsizeLayout _isFakeAXSpriteIndex:](self, "_isFakeAXSpriteIndex:", a3))
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    PXRectWithOriginAndSize();
    -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "styleSwitcherViewportInset");
    PXEdgeInsetsInsetRect();
    v10 = v9;
    v11 = v8;
    v13 = v12;
    v14 = 0.0;
    if ((_DWORD)v3 == 1000)
      v14 = -1.0;
    if ((_DWORD)v3 == 1002)
      v14 = 1.0;
    v15 = v7 + v14 * v8;
    +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "checkOutReusableObjectWithReuseIdentifier:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setSpriteIndex:", v3);
    v26.origin.x = v15;
    v26.origin.y = v10;
    v26.size.width = v11;
    v26.size.height = v13;
    MidX = CGRectGetMidX(v26);
    v27.origin.x = v15;
    v27.origin.y = v10;
    v27.size.width = v11;
    v27.size.height = v13;
    MidY = CGRectGetMidY(v27);
    v28.origin.x = v15;
    v28.origin.y = v10;
    v28.size.width = v11;
    v28.size.height = v13;
    Width = CGRectGetWidth(v28);
    v29.origin.x = v15;
    v29.origin.y = v10;
    v29.size.width = v11;
    v29.size.height = v13;
    Height = CGRectGetHeight(v29);
    v21.f64[0] = Width;
    v21.f64[1] = Height;
    *(CGFloat *)v24 = MidX;
    *(CGFloat *)&v24[1] = MidY;
    v24[2] = 0;
    v24[3] = vcvt_f32_f64(v21);
    objc_msgSend(v17, "setSpriteGeometry:", v24);

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)PXStoryStyleSwitchingFullsizeLayout;
    -[PXGLayout axContentInfoAtSpriteIndex:](&v25, sel_axContentInfoAtSpriteIndex_, v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v17;
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXStoryStyleSwitchingFullsizeLayout axNextResponder](self, "axNextResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axContainingScrollViewForAXGroup:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[PXStoryStyleSwitchingFullsizeLayout axNextResponder](self, "axNextResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "axGroup:didChange:userInfo:", v9, a4, v8);

}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;

  v9 = a3;
  v10 = a5;
  PXGAXGetElementForUserInfo(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 744, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("axGroup"), v20);
LABEL_10:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 744, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("axGroup"), v20, v22);

    goto LABEL_10;
  }
LABEL_3:
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "viewMode");

  if (a4 == 4 && v14 == 4)
  {
    v15 = -[PXStoryStyleSwitchingFullsizeLayout _handleSwitchStyle:inGroup:](self, "_handleSwitchStyle:inGroup:", v11, v12);
  }
  else
  {
    -[PXStoryStyleSwitchingFullsizeLayout axNextResponder](self, "axNextResponder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "axGroup:didRequestToPerformAction:userInfo:", v12, a4, v10);

  }
  return v15;
}

- (BOOL)_handleSwitchStyle:(id)a3 inGroup:(id)a4
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[5];
  uint8_t buf[16];

  objc_msgSend(a3, "axFrame");
  v6 = v5;
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "focusedStyleIndex");
  if (v6 <= 0.0)
    v10 = v9;
  else
    v10 = v9 + 1;
  if (v6 < 0.0)
    v11 = v9 - 1;
  else
    v11 = v10;
  if (v11 < 0
    || (objc_msgSend(v8, "selectionDataSource"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "numberOfStyles"),
        v12,
        v11 >= v13))
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "It should not be possible to go out of bounds due to prev/next ax indices being appropriately hidden", buf, 2u);
    }

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__PXStoryStyleSwitchingFullsizeLayout__handleSwitchStyle_inGroup___block_invoke;
  v16[3] = &__block_descriptor_40_e38_v16__0___PXStoryMutableStyleManager__8l;
  v16[4] = v11;
  objc_msgSend(v8, "performChanges:origin:", v16, 6);

  return 1;
}

- (unint64_t)_axSwitcherFractionNumerator
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "styleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "focusedStyleIndex") + 1;
  return v4;
}

- (unint64_t)_axSwitcherFractionDenominator
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "styleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "selectionDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfStyles");

  return v5;
}

- (id)_axStyleTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorGradingRepository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryStyleSwitchingFullsizeLayout dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleInfoAtIndex:", objc_msgSend(v7, "focusedStyleIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedTitleForColorGradeKind:", objc_msgSend(v8, "customColorGradeKind"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_axSongArtistName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PXStoryStyleSwitchingFullsizeLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleInfoAtIndex:", objc_msgSend(v5, "focusedStyleIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "songResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_storyResourceSongAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artistName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_axSongTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PXStoryStyleSwitchingFullsizeLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleInfoAtIndex:", objc_msgSend(v5, "focusedStyleIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "songResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_storyResourceSongAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_axAssetsVisible
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  void *v27;
  id v28;
  PXStoryStyleSwitchingFullsizeLayout *v29;
  id v30;
  SEL v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  -[PXStoryStyleSwitchingFullsizeLayout dominantFullsizePlayerLayout](self, "dominantFullsizePlayerLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleSwitchingFullsizeLayout model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentSegmentIdentifier");

  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  if (v5)
    objc_msgSend(v5, "timeRangeForSegmentWithIdentifier:", v7);
  objc_msgSend(v4, "displayedTimelineRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __55__PXStoryStyleSwitchingFullsizeLayout__axAssetsVisible__block_invoke;
  v27 = &unk_1E5139440;
  v28 = v5;
  v29 = self;
  v30 = v16;
  v31 = a2;
  v21 = v32;
  v22 = v33;
  v23 = v34;
  v17 = v16;
  v18 = v5;
  objc_msgSend(v18, "enumerateClipsInTimeRange:rect:usingBlock:", &v21, &v24, v9, v11, v13, v15);
  v19 = (void *)objc_msgSend(v17, "copy", v21, v22, v23, v24, v25, v26, v27);

  return v19;
}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->axNextResponder);
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->axNextResponder, a3);
}

- (PXStoryModel)model
{
  return self->_model;
}

- (double)relativeZPositionAboveLegibilityGradients
{
  return self->_relativeZPositionAboveLegibilityGradients;
}

- (PXStoryStyleSelectionDataSource)dataSource
{
  return self->_dataSource;
}

- (_NSRange)displayedStyleRange
{
  _NSRange *p_displayedStyleRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_displayedStyleRange = &self->_displayedStyleRange;
  location = self->_displayedStyleRange.location;
  length = p_displayedStyleRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)displayedStyleInfos
{
  return self->_displayedStyleInfos;
}

- (PXCArrayStore)fullsizeFrameRectsStore
{
  return self->_fullsizeFrameRectsStore;
}

- (NSAttributedString)styleSwitcherTitleString
{
  return self->_styleSwitcherTitleString;
}

- (int64_t)styleSwitcherTitleVersion
{
  return self->_styleSwitcherTitleVersion;
}

- (void)setStyleSwitcherTitleVersion:(int64_t)a3
{
  self->_styleSwitcherTitleVersion = a3;
}

- (PXStoryChromeButtonConfiguration)restartButtonConfiguration
{
  return self->_restartButtonConfiguration;
}

- (int64_t)restartButtonVersion
{
  return self->_restartButtonVersion;
}

- (void)setRestartButtonVersion:(int64_t)a3
{
  self->_restartButtonVersion = a3;
}

- (PXGPageControlConfiguration)pageControlConfiguration
{
  return self->_pageControlConfiguration;
}

- (int64_t)pageControlVersion
{
  return self->_pageControlVersion;
}

- (void)setPageControlVersion:(int64_t)a3
{
  self->_pageControlVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControlConfiguration, 0);
  objc_storeStrong((id *)&self->_restartButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_styleSwitcherTitleString, 0);
  objc_storeStrong((id *)&self->_fullsizeFrameRectsStore, 0);
  objc_storeStrong((id *)&self->_displayedStyleInfos, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

void __55__PXStoryStyleSwitchingFullsizeLayout__axAssetsVisible__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a2 >= 1)
  {
    v21 = v10;
    v22 = v9;
    v23 = v8;
    v24 = v7;
    v25 = v6;
    v26 = v5;
    v27 = v11;
    v28 = v12;
    v14 = a2;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *a5, v21, v22, v23, v24, v25, v26, v27, v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "px_storyResourceKind");

      if (v18 == 1)
      {
        objc_msgSend(v16, "resource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "px_storyResourceDisplayAsset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v20);
      }
      a5 += 96;

      --v14;
    }
    while (v14);
  }
}

uint64_t __66__PXStoryStyleSwitchingFullsizeLayout__handleSwitchStyle_inGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectionFocus:", (double)*(uint64_t *)(a1 + 32));
}

uint64_t __60__PXStoryStyleSwitchingFullsizeLayout__handleRestartButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "restartPlaybackFromBeginning");
}

uint64_t __58__PXStoryStyleSwitchingFullsizeLayout__handlePageControl___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectionFocus:", (double)*(uint64_t *)(a1 + 32));
}

uint64_t __61__PXStoryStyleSwitchingFullsizeLayout__updateAXSpriteIndexes__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  if (a2)
    return objc_msgSend(v2, "addIndex:");
  else
    return objc_msgSend(v2, "removeIndex:");
}

uint64_t __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  _OWORD *v3;
  __int128 v4;

  if (*(uint64_t *)(a1 + 40) >= 1)
  {
    v2 = 0;
    v3 = a2;
    do
    {
      v4 = *(_OWORD *)(a1 + 64);
      *v3 = *(_OWORD *)(a1 + 48);
      v3[1] = v4;
      v3 += 2;
      ++v2;
    }
    while (*(_QWORD *)(a1 + 40) > v2);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFrames:forSublayoutsInRange:", a2, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

void __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke_182(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  id v29;

  v29 = a3;
  objc_msgSend(*(id *)(a1 + 32), "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 != 5)
  {
    v8 = v29;
    objc_msgSend(v8, "secondSublayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_5;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 359, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("splitLayout.secondSublayout"), v15, v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 359, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("splitLayout.secondSublayout"), v15);
    }

LABEL_5:
    objc_msgSend(v8, "firstSublayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:
        objc_msgSend(*(id *)(a1 + 32), "_configureTimelineLayout:maskLayout:forIndex:", v9, v10, a2);

        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 360, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("splitLayout.firstSublayout"), v24, v28);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v21, v22, CFSTR("PXStoryStyleSwitchingFullsizeLayout.m"), 360, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("splitLayout.firstSublayout"), v24);
    }

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_configureTimelineLayout:maskLayout:forIndex:", v29, 0, a2);
LABEL_8:

}

uint64_t __53__PXStoryStyleSwitchingFullsizeLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  float v22;
  float v23;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v27;
  _OWORD *v28;
  char v29;
  uint64_t v30;
  float v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  uint64_t v41;
  float v42;
  CGFloat v43;
  CGFloat v44;
  __int128 v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  float64x2_t v50;
  _OWORD *v51;
  char v52;
  uint64_t v53;
  float v54;
  CGFloat y;
  CGFloat v56;
  CGFloat v57;
  CGFloat x;
  double MaxY;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  uint64_t v65;
  float v66;
  CGFloat v67;
  CGFloat v68;
  __int128 v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  float64x2_t v74;
  _OWORD *v75;
  char v76;
  uint64_t result;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  CGFloat Width;
  __int128 v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherChromeInset");
  PXEdgeInsetsInsetRect();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 40), "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutSpec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "styleSwitcherTitleAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lineHeight");
  v20 = v19;

  v21 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1024);
  v22 = *(double *)(a1 + 80);
  v23 = -v22;
  v91.origin.x = v10;
  v91.origin.y = v12;
  v91.size.width = v14;
  v91.size.height = v20;
  MidX = CGRectGetMidX(v91);
  v92.origin.x = v10;
  v92.origin.y = v12;
  v92.size.width = v14;
  v92.size.height = v20;
  MidY = CGRectGetMidY(v92);
  v93.origin.x = v10;
  v93.origin.y = v12;
  v93.size.width = v14;
  v93.size.height = v20;
  Width = CGRectGetWidth(v93);
  v94.origin.x = v10;
  v94.origin.y = v12;
  v94.size.width = v14;
  v94.size.height = v20;
  Height = CGRectGetHeight(v94);
  v27.f64[0] = Width;
  v27.f64[1] = Height;
  *(CGFloat *)v21 = MidX;
  *(CGFloat *)(v21 + 8) = MidY;
  *(double *)(v21 + 16) = v23;
  *(float32x2_t *)(v21 + 24) = vcvt_f32_f64(v27);
  v28 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1024));
  v88 = *((_OWORD *)off_1E50B83A0 + 7);
  v90 = *((_OWORD *)off_1E50B83A0 + 6);
  v28[6] = v90;
  v28[7] = v88;
  v86 = *((_OWORD *)off_1E50B83A0 + 9);
  v87 = *((_OWORD *)off_1E50B83A0 + 8);
  v28[8] = v87;
  v28[9] = v86;
  v84 = *((_OWORD *)off_1E50B83A0 + 3);
  v85 = *((_OWORD *)off_1E50B83A0 + 2);
  v28[2] = v85;
  v28[3] = v84;
  v82 = *((_OWORD *)off_1E50B83A0 + 5);
  v83 = *((_OWORD *)off_1E50B83A0 + 4);
  v28[4] = v83;
  v28[5] = v82;
  v80 = *((_OWORD *)off_1E50B83A0 + 1);
  v81 = *(_OWORD *)off_1E50B83A0;
  *v28 = *(_OWORD *)off_1E50B83A0;
  v28[1] = v80;
  *(float *)&Height = *(double *)(a1 + 88);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1024)) = LODWORD(Height);
  if (objc_msgSend(*(id *)(a1 + 32), "styleSwitcherShowsTitle"))
    v29 = 3;
  else
    v29 = 0;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1024) + 1) = v29;
  v30 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1024);
  v31 = *(double *)(a1 + 96);
  *(float32x2_t *)(a5 + 40 * v30 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v30 + 24), v31);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1024) + 32) = objc_msgSend(*(id *)(a1 + 40), "styleSwitcherTitleVersion");
  objc_msgSend(*(id *)(a1 + 40), "restartButtonConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStoryChromeButton sizeWithConfiguration:](PXStoryChromeButton, "sizeWithConfiguration:", v32);

  if (objc_msgSend(*(id *)(a1 + 32), "styleSwitcherWantsChromeButtonsTitleCenterAligned"))
    PXRectGetCenter();
  else
    objc_msgSend(*(id *)(a1 + 32), "styleSwitcherChromeInset");
  PXRectWithCenterAndSize();
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherChromeButtonHorizontalMargin");
  v40 = v39;
  v41 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032);
  *(float *)&v39 = *(double *)(a1 + 80);
  v42 = -*(float *)&v39;
  v95.origin.x = v40;
  v95.origin.y = v34;
  v95.size.width = v36;
  v95.size.height = v38;
  v43 = CGRectGetMidX(v95);
  v96.origin.x = v40;
  v96.origin.y = v34;
  v96.size.width = v36;
  v96.size.height = v38;
  v44 = CGRectGetMidY(v96);
  v97.origin.x = v40;
  v97.origin.y = v34;
  v97.size.width = v36;
  v97.size.height = v38;
  *(double *)&v45 = CGRectGetWidth(v97);
  v78 = v45;
  *(CGFloat *)&v45 = v40;
  v46 = v34;
  v47 = v36;
  v48 = v38;
  v49 = CGRectGetHeight(*(CGRect *)&v45);
  *(_QWORD *)&v50.f64[0] = v78;
  v50.f64[1] = v49;
  *(CGFloat *)v41 = v43;
  *(CGFloat *)(v41 + 8) = v44;
  *(double *)(v41 + 16) = v42;
  *(float32x2_t *)(v41 + 24) = vcvt_f32_f64(v50);
  v51 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032));
  v51[6] = v90;
  v51[7] = v88;
  v51[8] = v87;
  v51[9] = v86;
  v51[2] = v85;
  v51[3] = v84;
  v51[4] = v83;
  v51[5] = v82;
  *v51 = v81;
  v51[1] = v80;
  *(float *)&v49 = *(double *)(a1 + 88);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032)) = LODWORD(v49);
  if (objc_msgSend(*(id *)(a1 + 32), "styleSwitcherShowsRestartButton"))
    v52 = 10;
  else
    v52 = 0;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032) + 1) = v52;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032)) = 1;
  v53 = *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032);
  v54 = *(double *)(a1 + 96);
  *(float32x2_t *)(a5 + 40 * v53 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v53 + 24), v54);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1032) + 32) = objc_msgSend(*(id *)(a1 + 40), "restartButtonVersion", v78);
  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherViewportInset");
  PXEdgeInsetsInsetRect();
  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherPageControlInset");
  PXEdgeInsetsInsetRect();
  y = v98.origin.y;
  v56 = v98.size.width;
  v57 = v98.size.height;
  v99.origin.x = CGRectGetMinX(v98);
  x = v99.origin.x;
  v99.origin.y = y;
  v99.size.width = v56;
  v99.size.height = v57;
  MaxY = CGRectGetMaxY(v99);
  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherPageControlHeight");
  v61 = MaxY - v60;
  v100.origin.x = x;
  v100.origin.y = v61;
  v100.size.width = v56;
  v100.size.height = v57;
  v62 = CGRectGetWidth(v100);
  objc_msgSend(*(id *)(a1 + 32), "styleSwitcherPageControlHeight");
  v64 = v63;
  v65 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1028);
  *(float *)&v63 = *(double *)(a1 + 80);
  v66 = -*(float *)&v63;
  v101.origin.x = x;
  v101.origin.y = v61;
  v101.size.width = v62;
  v101.size.height = v64;
  v67 = CGRectGetMidX(v101);
  v102.origin.x = x;
  v102.origin.y = v61;
  v102.size.width = v62;
  v102.size.height = v64;
  v68 = CGRectGetMidY(v102);
  v103.origin.x = x;
  v103.origin.y = v61;
  v103.size.width = v62;
  v103.size.height = v64;
  *(double *)&v69 = CGRectGetWidth(v103);
  v79 = v69;
  *(CGFloat *)&v69 = x;
  v70 = v61;
  v71 = v62;
  v72 = v64;
  v73 = CGRectGetHeight(*(CGRect *)&v69);
  *(_QWORD *)&v74.f64[0] = v79;
  v74.f64[1] = v73;
  *(CGFloat *)v65 = v67;
  *(CGFloat *)(v65 + 8) = v68;
  *(double *)(v65 + 16) = v66;
  *(float32x2_t *)(v65 + 24) = vcvt_f32_f64(v74);
  v75 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1028));
  v75[6] = v90;
  v75[7] = v88;
  v75[8] = v87;
  v75[9] = v86;
  v75[2] = v85;
  v75[3] = v84;
  v75[4] = v83;
  v75[5] = v82;
  *v75 = v81;
  v75[1] = v80;
  *(float *)&v73 = *(double *)(a1 + 88);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1028)) = LODWORD(v73);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1028)) = 1;
  if (*(_BYTE *)(a1 + 104))
    v76 = 10;
  else
    v76 = 0;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1028) + 1) = v76;
  result = objc_msgSend(*(id *)(a1 + 40), "pageControlVersion", v79);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1028) + 32) = result;
  return result;
}

@end

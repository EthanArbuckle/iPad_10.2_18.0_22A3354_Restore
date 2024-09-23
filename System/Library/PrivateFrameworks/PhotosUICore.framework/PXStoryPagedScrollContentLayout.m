@implementation PXStoryPagedScrollContentLayout

- (PXStoryPagedScrollContentLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPagedScrollContentLayout.m"), 53, CFSTR("%s is not available as initializer"), "-[PXStoryPagedScrollContentLayout init]");

  abort();
}

- (PXStoryPagedScrollContentLayout)initWithModel:(id)a3
{
  id v5;
  PXStoryPagedScrollContentLayout *v6;
  PXStoryPagedScrollContentLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPagedScrollContentLayout;
  v6 = -[PXGLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    -[PXStoryModel registerChangeObserver:context:](v7->_model, "registerChangeObserver:context:", v7, ModelObservationContext_226443);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    v7->_firstPageSpriteIndex = 0;
    -[PXGLayout addSpriteCount:withInitialState:](v7, "addSpriteCount:withInitialState:", 1, 0);
    -[PXStoryPagedScrollContentLayout _invalidateDisplayedTimeline](v7, "_invalidateDisplayedTimeline");
  }

  return v7;
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
      -[PXStoryPagedScrollContentLayout _invalidatePages](self, "_invalidatePages");
    }
  }

}

- (void)setNumberOfPages:(int64_t)a3
{
  if (self->_numberOfPages != a3)
  {
    self->_numberOfPages = a3;
    -[PXStoryPagedScrollContentLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setInterpageSpacing:(double)a3
{
  if (self->_interpageSpacing != a3)
  {
    self->_interpageSpacing = a3;
    -[PXStoryPagedScrollContentLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryPagedScrollContentLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryPagedScrollContentLayout _invalidateContent](self, "_invalidateContent");
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryPagedScrollContentLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXStoryPagedScrollContentLayout _invalidatePresentedScrollPosition](self, "_invalidatePresentedScrollPosition");
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
  v8[2] = __70__PXStoryPagedScrollContentLayout_createAnchorForScrollingToPosition___block_invoke;
  v8[3] = &unk_1E5139090;
  objc_copyWeak(&v9, &location);
  v10 = *a3;
  -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", v5, 8, v8, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

- (CGPoint)_offsetFromFirstPageForScrollingToPosition:(id *)a3 visibleRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double *v10;
  void *v11;
  double var1;
  double v13;
  NSObject *v14;
  double v15;
  $7DA682ECC7253F641496E0B6E9C98204 *p_var2;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint8_t v26[16];
  CGPoint result;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (double *)MEMORY[0x1E0C9D538];
  -[PXStoryPagedScrollContentLayout displayedTimeline](self, "displayedTimeline");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a3->var1;
  v13 = 1.0 - var1;
  if (var1 <= 0.5)
    v13 = a3->var1;
  if (v13 != 0.0)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "currently not supporting reference to scroll position between two segments", v26, 2u);
    }

    var1 = a3->var1;
  }
  v15 = v10[1];
  p_var2 = ($7DA682ECC7253F641496E0B6E9C98204 *)&a3->var2;
  if (var1 <= 0.5)
    p_var2 = a3;
  v17 = objc_msgSend(v11, "indexOfSegmentWithIdentifier:", p_var2->var0);
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = *v10;
  }
  else
  {
    v19 = (double)v17;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v20 = CGRectGetWidth(v28);
    -[PXStoryPagedScrollContentLayout interpageSpacing](self, "interpageSpacing");
    v22 = v20 + v21;
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v18 = v23 + v19 * v22;
  }

  v24 = v18;
  v25 = v15;
  result.y = v25;
  result.x = v24;
  return result;
}

- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;

  x = a4.x;
  -[PXStoryPagedScrollContentLayout presentedPageWidth](self, "presentedPageWidth", a4.x, a4.y);
  v8 = v7;
  -[PXStoryPagedScrollContentLayout interpageSpacing](self, "interpageSpacing");
  v10 = v8 + v9;
  PXFloatRoundInDirection();
  v12 = (uint64_t)v11;
  -[PXGLayout visibleRect](self, "visibleRect");
  PXFloatRoundInDirection();
  v14 = (uint64_t)v13;
  if (v12 <= (uint64_t)v13)
    v15 = (uint64_t)v13;
  else
    v15 = v12;
  if (x >= 0.0)
    v15 = v12;
  if (v12 < v14)
    v14 = v12;
  if (x <= 0.0)
    v14 = v15;
  v16 = v14 & ~(v14 >> 63);
  v17 = -[PXStoryPagedScrollContentLayout numberOfPages](self, "numberOfPages") - 1;
  if (v16 < v17)
    v17 = v16;
  a3->x = v10 * (double)v17;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t *v13;
  id v14;
  uint8_t v16[8];
  uint64_t v17;
  double v18;
  uint64_t v19;

  v7 = a3;
  -[PXStoryPagedScrollContentLayout displayedTimeline](self, "displayedTimeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = -1;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    v17 = 0;
    v18 = 0.0;
    v19 = 0;
    if (v7)
    {
      objc_msgSend(v7, "scrollPosition");
      v10 = v18;
    }
    else
    {
      v10 = 0.0;
    }
    v11 = 1.0 - v10;
    if (v10 <= 0.5)
      v11 = v10;
    if (v11 != 0.0)
    {
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "currently not supporting reference to scroll position between two segments", v16, 2u);
      }

      v10 = v18;
    }
    v13 = &v17;
    if (v10 > 0.5)
      v13 = &v19;
    v9 = objc_msgSend(v8, "indexOfSegmentWithIdentifier:", *v13);
  }
  v14 = objc_retainAutorelease(v7);
  *a5 = v14;

  return v9;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v8;
  void *v9;
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
  objc_super v21;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXStoryPagedScrollContentLayout.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryPagedScrollContentLayout _updateDisplayedTimeline](self, "_updateDisplayedTimeline");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout update]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXStoryPagedScrollContentLayout.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryPagedScrollContentLayout _updatePages](self, "_updatePages");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXStoryPagedScrollContentLayout.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryPagedScrollContentLayout _updateContent](self, "_updateContent");
      v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryPagedScrollContentLayout.m"), 171, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXStoryPagedScrollContentLayout;
  -[PXGLayout update](&v21, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v8 = self->_postUpdateFlags.needsUpdate;
  if (v8)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXStoryPagedScrollContentLayout.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v8 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v8 & 0x400) != 0)
    {
      p_postUpdateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXStoryPagedScrollContentLayout _updatePresentedScrollPosition](self, "_updatePresentedScrollPosition");
      v8 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXStoryPagedScrollContentLayout.m"), 177, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout _invalidateDisplayedTimeline]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryPagedScrollContentLayout.m"), 181, CFSTR("invalidating %lu after it already has been updated"), 1);

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

  -[PXStoryPagedScrollContentLayout model](self, "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPagedScrollContentLayout setDisplayedTimeline:](self, "setDisplayedTimeline:", v3);

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout _invalidatePages]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryPagedScrollContentLayout.m"), 189, CFSTR("invalidating %lu after it already has been updated"), 2);

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
  void *v3;
  void *v4;
  id v5;

  -[PXStoryPagedScrollContentLayout displayedTimeline](self, "displayedTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPagedScrollContentLayout setNumberOfPages:](self, "setNumberOfPages:", objc_msgSend(v3, "numberOfSegments"));

  -[PXStoryPagedScrollContentLayout model](self, "model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interpageSpacing");
  -[PXStoryPagedScrollContentLayout setInterpageSpacing:](self, "setInterpageSpacing:");

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryPagedScrollContentLayout.m"), 198, CFSTR("invalidating %lu after it already has been updated"), 4);

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
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  _QWORD v10[7];

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXStoryPagedScrollContentLayout interpageSpacing](self, "interpageSpacing");
  v8 = v7;
  v9 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PXStoryPagedScrollContentLayout__updateContent__block_invoke;
  v10[3] = &unk_1E51472A8;
  *(double *)&v10[5] = v4;
  *(double *)&v10[6] = v6;
  v10[4] = self;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v9 << 32, v10);
  -[PXStoryPagedScrollContentLayout setPresentedPageWidth:](self, "setPresentedPageWidth:", v4);
  -[PXGLayout setContentSize:](self, "setContentSize:", -(v8 - (double)-[PXStoryPagedScrollContentLayout numberOfPages](self, "numberOfPages") * (v4 + v8)), v6);
}

- (void)_invalidatePresentedScrollPosition
{
  void *v2;
  void *v3;

  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryPagedScrollContentLayout _invalidatePresentedScrollPosition]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXStoryPagedScrollContentLayout.m"), 216, CFSTR("invalidating %lu after it already has been updated"), 1024);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x400uLL;
}

- (void)_updatePresentedScrollPosition
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  CGRect v11;

  -[PXGLayout visibleRect](self, "visibleRect");
  CGRectGetMinX(v11);
  -[PXStoryPagedScrollContentLayout presentedPageWidth](self, "presentedPageWidth");
  -[PXStoryPagedScrollContentLayout interpageSpacing](self, "interpageSpacing");
  -[PXStoryPagedScrollContentLayout displayedTimeline](self, "displayedTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfSegments") > 1)
  {
    PXClamp();
    v8 = (uint64_t)v7 + 1;
    v4 = objc_msgSend(v3, "identifierForSegmentAtIndex:");
    PXFloatNormalize();
    v6 = v9;
    v5 = objc_msgSend(v3, "identifierForSegmentAtIndex:", v8);
  }
  else
  {
    v4 = objc_msgSend(v3, "firstSegmentIdentifier");
    v5 = 0;
    v6 = 0;
  }
  v10[0] = v4;
  v10[1] = v6;
  v10[2] = v5;
  -[PXStoryPagedScrollContentLayout setPresentedScrollPosition:](self, "setPresentedScrollPosition:", v10);

}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  long double __y;

  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (double)modf((double)a3 / 10.0, &__y), 1.0, 1.0, 0.3);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)ModelObservationContext_226443 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPagedScrollContentLayout.m"), 256, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11 = v9;
  if ((v6 & 0x10) != 0)
  {
    -[PXStoryPagedScrollContentLayout _invalidateDisplayedTimeline](self, "_invalidateDisplayedTimeline");
    v9 = v11;
  }
  if ((v6 & 0x2000) != 0)
  {
    -[PXStoryPagedScrollContentLayout _invalidatePages](self, "_invalidatePages");
    v9 = v11;
  }

}

- (PXStoryModel)model
{
  return self->_model;
}

- ($7DA682ECC7253F641496E0B6E9C98204)presentedScrollPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)((char *)self + 944);
  return self;
}

- (void)setPresentedScrollPosition:(id *)a3
{
  int64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_presentedScrollPosition.firstSegmentIdentifier = *(_OWORD *)&a3->var0;
  self->_presentedScrollPosition.secondSegmentIdentifier = var2;
}

- (PXStoryTimeline)displayedTimeline
{
  return self->_displayedTimeline;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (double)interpageSpacing
{
  return self->_interpageSpacing;
}

- (double)presentedPageWidth
{
  return self->_presentedPageWidth;
}

- (void)setPresentedPageWidth:(double)a3
{
  self->_presentedPageWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedTimeline, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

__n128 __49__PXStoryPagedScrollContentLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  v13 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 896));
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
  v18 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 896));
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
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 896)) = 0;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 896) + 1) = 0;
  return result;
}

double __70__PXStoryPagedScrollContentLayout_createAnchorForScrollingToPosition___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
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

@end

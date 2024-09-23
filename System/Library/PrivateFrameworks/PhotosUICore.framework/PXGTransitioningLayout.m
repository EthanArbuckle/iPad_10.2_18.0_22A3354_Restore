@implementation PXGTransitioningLayout

- (PXGTransitioningLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTransitioningLayout.m"), 24, CFSTR("%s is not available as initializer"), "-[PXGTransitioningLayout init]");

  abort();
}

- (PXGTransitioningLayout)initWithContentLayout:(id)a3
{
  id v6;
  PXGTransitioningLayout *v7;
  PXGTransitioningLayout *v8;
  CGSize v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGTransitioningLayout.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentLayout != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PXGTransitioningLayout;
  v7 = -[PXGAbsoluteCompositeLayout init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentLayout, a3);
    v9 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v8->_contentFrameOverride.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v8->_contentFrameOverride.size = v9;
    -[PXGLayout addSublayout:](v8, "addSublayout:", v6);
    -[PXGTransitioningLayout _invalidateSublayoutPositions](v8, "_invalidateSublayoutPositions");
  }

  return v8;
}

- (void)setContentFrameOverride:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentFrameOverride;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentFrameOverride = &self->_contentFrameOverride;
  if (!CGRectEqualToRect(a3, self->_contentFrameOverride))
  {
    p_contentFrameOverride->origin.x = x;
    p_contentFrameOverride->origin.y = y;
    p_contentFrameOverride->size.width = width;
    p_contentFrameOverride->size.height = height;
    -[PXGTransitioningLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions");
  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGTransitioningLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGTransitioningLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions");
}

- (UIEdgeInsets)safeAreaInsets
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  UIEdgeInsets result;

  -[PXGTransitioningLayout contentLayout](self, "contentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scrollableAxis");

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PXGTransitioningLayout;
    -[PXGLayout safeAreaInsets](&v9, sel_safeAreaInsets);
  }
  else
  {
    v5 = *(double *)off_1E50B8020;
    v6 = *((double *)off_1E50B8020 + 1);
    v7 = *((double *)off_1E50B8020 + 2);
    v8 = *((double *)off_1E50B8020 + 3);
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (int64_t)scrollableAxis
{
  return 0;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7;
  void *v8;
  int64_t v9;
  id v10;

  v7 = a3;
  -[PXGTransitioningLayout contentLayout](self, "contentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXGLayout indexOfSublayout:](self, "indexOfSublayout:", v8);

  v10 = objc_retainAutorelease(v7);
  *a5 = v10;
  return v9;
}

- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGTransitioningLayout;
  -[PXGLayout createAnchorForVisibleAreaIgnoringEdges:](&v7, sel_createAnchorForVisibleAreaIgnoringEdges_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGTransitioningLayout contentLayout](self, "contentLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE9C74E8))
    objc_msgSend(v4, "setDelegate:", v5);

  return v4;
}

- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize
{
  return 1;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGTransitioningLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGTransitioningLayout.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGTransitioningLayout _updateSublayoutPositions](self, "_updateSublayoutPositions");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGTransitioningLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGTransitioningLayout.m"), 93, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGTransitioningLayout;
  -[PXGCompositeLayout update](&v9, sel_update);
}

- (void)_invalidateSublayoutPositions
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGTransitioningLayout _invalidateSublayoutPositions]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGTransitioningLayout.m"), 98, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateSublayoutPositions
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  -[PXGTransitioningLayout contentFrameOverride](self, "contentFrameOverride");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  if (CGRectIsNull(v11))
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    PXRectWithOriginAndSize();
    x = v7;
    y = v8;
    width = v9;
    height = v10;
  }
  -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:", 0, x, y, width, height);
}

- (PXGLayout)contentLayout
{
  return self->_contentLayout;
}

- (CGRect)contentFrameOverride
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrameOverride.origin.x;
  y = self->_contentFrameOverride.origin.y;
  width = self->_contentFrameOverride.size.width;
  height = self->_contentFrameOverride.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayout, 0);
}

@end

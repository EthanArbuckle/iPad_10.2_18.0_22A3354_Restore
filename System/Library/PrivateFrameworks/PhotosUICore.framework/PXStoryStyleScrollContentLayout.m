@implementation PXStoryStyleScrollContentLayout

- (PXStoryStyleScrollContentLayout)initWithModel:(id)a3
{
  id v5;
  PXStoryStyleScrollContentLayout *v6;
  PXStoryStyleScrollContentLayout *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryStyleScrollContentLayout;
  v6 = -[PXGLayout init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    -[PXStoryModel styleManager](v7->_model, "styleManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:context:", v7, StyleManagerObservationContext_260322);

    v7->_firstPageSpriteIndex = 0;
    -[PXGLayout addSpriteCount:withInitialState:](v7, "addSpriteCount:withInitialState:", 1, 0);
  }

  return v7;
}

- (PXStoryStyleScrollContentLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleScrollContentLayout.m"), 50, CFSTR("%s is not available as initializer"), "-[PXStoryStyleScrollContentLayout init]");

  abort();
}

- (id)createAnchorForScrollingToStyleFocus:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:", self->_firstPageSpriteIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PXStoryStyleScrollContentLayout_createAnchorForScrollingToStyleFocus___block_invoke;
  v8[3] = &__block_descriptor_40_e64__CGPoint_dd_48__0_CGRect__CGPoint_dd__CGSize_dd__8__PXGLayout_40l;
  *(double *)&v8[4] = a3;
  -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", v5, 9, v8, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleScrollContentLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryStyleScrollContentLayout _invalidateContent](self, "_invalidateContent");
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleScrollContentLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXStoryStyleScrollContentLayout _invalidateFocusedStyle](self, "_invalidateFocusedStyle");
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleScrollContentLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryStyleScrollContentLayout.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryStyleScrollContentLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleScrollContentLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXStoryStyleScrollContentLayout.m"), 78, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXStoryStyleScrollContentLayout;
  -[PXGLayout update](&v15, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v6 = self->_postUpdateFlags.needsUpdate;
  if (v6)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleScrollContentLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXStoryStyleScrollContentLayout.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v6 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1;
    if ((v6 & 1) != 0)
    {
      p_postUpdateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryStyleScrollContentLayout _updateFocusedStyle](self, "_updateFocusedStyle");
      v6 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleScrollContentLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryStyleScrollContentLayout.m"), 84, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleScrollContentLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleScrollContentLayout.m"), 88, CFSTR("invalidating %lu after it already has been updated"), 1);

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
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[7];

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  v7 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__PXStoryStyleScrollContentLayout__updateContent__block_invoke;
  v11[3] = &unk_1E51472A8;
  *(double *)&v11[5] = v4;
  *(double *)&v11[6] = v6;
  v11[4] = self;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v7 << 32, v11);
  -[PXStoryStyleScrollContentLayout model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectionDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout setContentSize:](self, "setContentSize:", v4 * (double)objc_msgSend(v10, "numberOfStyles"), v6);

}

- (void)_invalidateFocusedStyle
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
      p_postUpdateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryStyleScrollContentLayout _invalidateFocusedStyle]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryStyleScrollContentLayout.m"), 104, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateFocusedStyle
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double MidX;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGRect v18;

  -[PXGLayout visibleRect](self, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGLayout referenceSize](self, "referenceSize");
  v12 = v11;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  MidX = CGRectGetMidX(v18);
  -[PXStoryStyleScrollContentLayout model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "styleManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectionDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberOfStyles");

  PXClamp();
  self->_focusedStyleIndex = (uint64_t)v17;
  self->_focusOffset = (MidX - (v17 + 0.5) * v12) / v12;
}

- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  -[PXGLayout referenceSize](self, "referenceSize", a4.x, a4.y);
  v7 = v6;
  PXFloatRoundInDirection();
  -[PXGLayout visibleRect](self, "visibleRect");
  PXFloatRoundInDirection();
  -[PXStoryStyleScrollContentLayout model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectionDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberOfStyles");
  PXClamp();
  v12 = v11;

  a3->x = v7 * (double)(uint64_t)v12;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)StyleManagerObservationContext_260322 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleScrollContentLayout.m"), 146, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x20) != 0)
  {
    v11 = v9;
    -[PXStoryStyleScrollContentLayout _invalidateContent](self, "_invalidateContent");
    v9 = v11;
  }

}

- (PXStoryModel)model
{
  return self->_model;
}

- (int64_t)focusedStyleIndex
{
  return self->_focusedStyleIndex;
}

- (double)focusOffset
{
  return self->_focusOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

__n128 __49__PXStoryStyleScrollContentLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

double __72__PXStoryStyleScrollContentLayout_createAnchorForScrollingToStyleFocus___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "referenceSize");
  return v3 * *(double *)(a1 + 32);
}

@end

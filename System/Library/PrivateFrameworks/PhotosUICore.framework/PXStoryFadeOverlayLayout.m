@implementation PXStoryFadeOverlayLayout

- (PXStoryFadeOverlayLayout)initWithModel:(id)a3
{
  id v5;
  PXStoryFadeOverlayLayout *v6;
  PXStoryFadeOverlayLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryFadeOverlayLayout;
  v6 = -[PXGLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    objc_msgSend(v5, "registerChangeObserver:context:", v7, ModelContext);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    v7->_fadeSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", &__block_literal_global_245234);
  }

  return v7;
}

- (PXStoryFadeOverlayLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryFadeOverlayLayout.m"), 46, CFSTR("%s is not available as initializer"), "-[PXStoryFadeOverlayLayout init]");

  abort();
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryFadeOverlayLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryFadeOverlayLayout _invalidateContent](self, "_invalidateContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryFadeOverlayLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryFadeOverlayLayout _invalidateContent](self, "_invalidateContent");
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryFadeOverlayLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFadeOverlayLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryFadeOverlayLayout.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFadeOverlayLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryFadeOverlayLayout.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryFadeOverlayLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFadeOverlayLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryFadeOverlayLayout.m"), 71, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryFadeOverlayLayout;
  -[PXGLayout update](&v9, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryFadeOverlayLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFadeOverlayLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryFadeOverlayLayout.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFadeOverlayLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryFadeOverlayLayout.m"), 81, CFSTR("invalidating %lu after it already has been updated"), 1);

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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[PXGLayout alpha](self, "alpha");
  v4 = v3;
  -[PXGLayout referenceSize](self, "referenceSize");
  v6 = v5;
  v8 = v7;
  -[PXGLayout setContentSize:](self, "setContentSize:");
  -[PXStoryFadeOverlayLayout model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__PXStoryFadeOverlayLayout__updateContent__block_invoke;
  v12[3] = &unk_1E513D018;
  v14 = v6;
  v15 = v8;
  v16 = v4;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v10, v12);

}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;

  v7 = a4;
  if (self->_fadeSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryFadeOverlayLayout.m"), 105, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "wantsHighContrastColors");

  if (v10)
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  id v11;

  v9 = a3;
  if ((void *)ModelContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryFadeOverlayLayout.m"), 117, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 0x400000000000) != 0)
  {
    v11 = v9;
    -[PXStoryFadeOverlayLayout _invalidateContent](self, "_invalidateContent");
    v9 = v11;
  }

}

- (PXStoryModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

float __42__PXStoryFadeOverlayLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float32x2_t *v11;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v14;
  float64x2_t v15;
  double v16;
  double v17;
  float result;
  CGFloat v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  PXRectWithOriginAndSize();
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v11 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidY = CGRectGetMidY(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v19 = CGRectGetWidth(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v14 = CGRectGetHeight(v23);
  v15.f64[0] = v19;
  v15.f64[1] = v14;
  *(CGFloat *)v11 = MidX;
  *(CGFloat *)&v11[1] = MidY;
  v11[2] = 0;
  v11[3] = vcvt_f32_f64(v15);
  v16 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "outroFractionCompleted");
  result = v16 * v17;
  *(float *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872)) = result;
  return result;
}

double __42__PXStoryFadeOverlayLayout_initWithModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  double result;

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
  v8 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v8;
  v9 = *(_QWORD *)(a3 + 32);
  *(_BYTE *)(v9 + 1) = 5;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v9 + 8) = result;
  return result;
}

@end

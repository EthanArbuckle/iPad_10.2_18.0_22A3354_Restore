@implementation PXFeedTitleLayout

- (PXFeedTitleLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedTitleLayout.m"), 39, CFSTR("%s is not available as initializer"), "-[PXFeedTitleLayout init]");

  abort();
}

- (PXFeedTitleLayout)initWithViewModel:(id)a3
{
  id v5;
  PXFeedTitleLayout *v6;
  PXFeedTitleLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFeedTitleLayout;
  v6 = -[PXGLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[PXFeedViewModel registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_210194);
    v7->_titleSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", &__block_literal_global_210218);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    -[PXFeedTitleLayout _invalidateTitle](v7, "_invalidateTitle");
    -[PXFeedTitleLayout _invalidateAttributes](v7, "_invalidateAttributes");
  }

  return v7;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedTitleLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXFeedTitleLayout _invalidateTitleContentVersion](self, "_invalidateTitleContentVersion");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedTitleLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXFeedTitleLayout _invalidateTitleContentVersion](self, "_invalidateTitleContentVersion");
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedTitleLayout update]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXFeedTitleLayout.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXFeedTitleLayout _updateAttributes](self, "_updateAttributes");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedTitleLayout update]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXFeedTitleLayout.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXFeedTitleLayout _updateTitle](self, "_updateTitle");
      v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedTitleLayout update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXFeedTitleLayout.m"), 81, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PXFeedTitleLayout;
  -[PXGLayout update](&v12, sel_update);
}

- (void)_invalidateAttributes
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedTitleLayout _invalidateAttributes]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedTitleLayout.m"), 86, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *subtitleAttributes;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PXFeedTitleLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(v4, "subtitleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(v4, "subtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  subtitleAttributes = self->_subtitleAttributes;
  self->_subtitleAttributes = v7;

  -[PXFeedTitleLayout _invalidateTitleContentVersion](self, "_invalidateTitleContentVersion");
}

- (void)_invalidateTitleContentVersion
{
  ++self->_titleMediaVersion;
  -[PXFeedTitleLayout _invalidateTitle](self, "_invalidateTitle");
}

- (void)_invalidateTitle
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedTitleLayout _invalidateTitle]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedTitleLayout.m"), 104, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateTitle
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  id v22;
  _QWORD v23[10];
  CGRect v24;

  -[PXFeedTitleLayout viewModel](self, "viewModel");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGLayout displayScale](self, "displayScale");
  v4 = v3;
  objc_msgSend(v22, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitleInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v22, "subtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout referenceSize](self, "referenceSize");
  v16 = v15;
  objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, self->_subtitleAttributes, 0, v15 - (v9 + v13), 1.79769313e308);
  -[PXGLayout displayScale](self, "displayScale");
  PXSizeCeilingToPixel();
  v18 = v17;
  v20 = v19;
  v21 = self->_titleSpriteIndex | 0x100000000;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __33__PXFeedTitleLayout__updateTitle__block_invoke;
  v23[3] = &unk_1E51368B8;
  *(double *)&v23[5] = v9;
  *(CGFloat *)&v23[6] = v7;
  *(double *)&v23[7] = v17;
  *(double *)&v23[8] = v19;
  v23[4] = self;
  v23[9] = v4;
  -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v21, v23);
  v24.origin.x = v9;
  v24.origin.y = v7;
  v24.size.width = v18;
  v24.size.height = v20;
  -[PXGLayout setContentSize:](self, "setContentSize:", v16, v11 + CGRectGetMaxY(v24));

}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  void *v5;

  -[PXFeedTitleLayout viewModel](self, "viewModel", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_subtitleAttributes;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)ViewModelObservationContext_210194 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedTitleLayout.m"), 163, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11 = v9;
  if ((v6 & 8) != 0)
  {
    -[PXFeedTitleLayout _invalidateAttributes](self, "_invalidateAttributes");
    -[PXFeedTitleLayout _invalidateTitleContentVersion](self, "_invalidateTitleContentVersion");
    v9 = v11;
  }
  if ((v6 & 0x10) != 0)
  {
    -[PXFeedTitleLayout _invalidateTitleContentVersion](self, "_invalidateTitleContentVersion");
    v9 = v11;
  }

}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_subtitleAttributes, 0);
}

float32x2_t __33__PXFeedTitleLayout__updateTitle__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float32x2_t *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v13;
  float32x2_t *v14;
  float32x2_t result;
  CGFloat Width;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v5 = *(float32x2_t **)(a3 + 16);
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  v8 = *(double *)(a1 + 56);
  v9 = *(double *)(a1 + 64);
  v17.origin.x = v6;
  v17.origin.y = v7;
  v17.size.width = v8;
  v17.size.height = v9;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = v6;
  v18.origin.y = v7;
  v18.size.width = v8;
  v18.size.height = v9;
  MidY = CGRectGetMidY(v18);
  v19.origin.x = v6;
  v19.origin.y = v7;
  v19.size.width = v8;
  v19.size.height = v9;
  Width = CGRectGetWidth(v19);
  v20.origin.x = v6;
  v20.origin.y = v7;
  v20.size.width = v8;
  v20.size.height = v9;
  Height = CGRectGetHeight(v20);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = 0;
  v5[3] = vcvt_f32_f64(v13);
  v14 = *(float32x2_t **)(a3 + 32);
  v14[4].i16[0] = *(_WORD *)(*(_QWORD *)(a1 + 32) + 876);
  *(float *)v13.f64 = *(double *)(a1 + 72);
  result = vmul_n_f32(*(float32x2_t *)(*(_QWORD *)(a3 + 16) + 24), *(float *)v13.f64);
  v14[1] = result;
  return result;
}

__n128 __39__PXFeedTitleLayout_initWithViewModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;

  v3 = *(_OWORD **)(a3 + 24);
  v4 = *((_OWORD *)off_1E50B83A0 + 5);
  v3[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v3[5] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 3);
  v3[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v3[3] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 9);
  v3[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v3[9] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 7);
  v3[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v3[7] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v8;
  v9 = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(v9 + 32) = *((_QWORD *)off_1E50B8398 + 4);
  result = *(__n128 *)off_1E50B8398;
  v11 = *((_OWORD *)off_1E50B8398 + 1);
  *(_OWORD *)v9 = *(_OWORD *)off_1E50B8398;
  *(_OWORD *)(v9 + 16) = v11;
  *(_BYTE *)(*(_QWORD *)(a3 + 32) + 1) = 3;
  return result;
}

@end

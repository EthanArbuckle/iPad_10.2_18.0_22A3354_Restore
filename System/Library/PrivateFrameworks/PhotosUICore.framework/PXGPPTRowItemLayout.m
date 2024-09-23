@implementation PXGPPTRowItemLayout

- (PXGPPTRowItemLayout)init
{
  void *v3;
  PXGPPTRowItemLayout *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXGPPTRowItemLayout initWithColor:](self, "initWithColor:", v3);

  return v4;
}

- (PXGPPTRowItemLayout)initWithColor:(id)a3
{
  id v5;
  PXGPPTRowItemLayout *v6;
  PXGPPTRowItemLayout *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTRowItemLayout;
  v6 = -[PXGLayout init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_color, a3);
    v7->_colorSpriteIndex = -[PXGLayout addSpriteCount:withInitialState:](v7, "addSpriteCount:withInitialState:", 1, 0);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
  }

  return v7;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGPPTRowItemLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGPPTRowItemLayout _invalidateContent](self, "_invalidateContent");
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTRowItemLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGPPTRowStackLayout.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGPPTRowItemLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTRowItemLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGPPTRowStackLayout.m"), 139, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTRowItemLayout;
  -[PXGLayout update](&v9, sel_update);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTRowItemLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGPPTRowStackLayout.m"), 144, CFSTR("invalidating %lu after it already has been updated"), 1);

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
  uint64_t v5;
  _QWORD v6[7];

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  -[PXGLayout setContentSize:](self, "setContentSize:", v3);
  v5 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PXGPPTRowItemLayout__updateContent__block_invoke;
  v6[3] = &unk_1E51472A8;
  *(double *)&v6[5] = v4;
  *(double *)&v6[6] = v4;
  v6[4] = self;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v5 << 32, v6);
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_color;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

double __37__PXGPPTRowItemLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  __int128 v23;
  double result;
  CGFloat v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  PXRectWithOriginAndSize();
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v13 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
  MidX = CGRectGetMidX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MidY = CGRectGetMidY(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v29 = CGRectGetWidth(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v16 = CGRectGetHeight(v33);
  v17.f64[0] = v29;
  v17.f64[1] = v16;
  *(CGFloat *)v13 = MidX;
  *(CGFloat *)&v13[1] = MidY;
  v13[2] = 0;
  v13[3] = vcvt_f32_f64(v17);
  v18 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872));
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
  v23 = *((_OWORD *)off_1E50B83A0 + 1);
  *v18 = *(_OWORD *)off_1E50B83A0;
  v18[1] = v23;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 1) = 5;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 872) + 8) = result;
  return result;
}

@end

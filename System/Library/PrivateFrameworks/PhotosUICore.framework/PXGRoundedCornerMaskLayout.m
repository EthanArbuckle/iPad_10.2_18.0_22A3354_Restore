@implementation PXGRoundedCornerMaskLayout

- (PXGRoundedCornerMaskLayout)initWithCornerRadius:(double)a3 continuousCorners:(BOOL)a4 maskColor:(id)a5
{
  id v9;
  PXGRoundedCornerMaskLayout *v10;
  PXGRoundedCornerMaskLayout *v11;
  __int128 v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXGRoundedCornerMaskLayout;
  v10 = -[PXGLayout init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_cornerRadius = a3;
    objc_storeStrong((id *)&v10->_maskColor, a5);
    v11->_maskScale = 1.0;
    v11->_continuousCorners = a4;
    v12 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)&v11->_insets.top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&v11->_insets.bottom = v12;
    -[PXGLayout setContentSource:](v11, "setContentSource:", v11);
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](v11, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", 0, 4, 0, 0);
    v11->_sideMaskSpriteIndexRange = -[PXGLayout addSpriteCount:withInitialState:](v11, "addSpriteCount:withInitialState:", 2, &__block_literal_global_194286);
    -[PXGRoundedCornerMaskLayout _invalidatePath](v11, "_invalidatePath");
  }

  return v11;
}

- (void)setMaskScale:(double)a3
{
  if (self->_maskScale != a3)
  {
    self->_maskScale = a3;
    -[PXGRoundedCornerMaskLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_insets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_insets = &self->_insets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_insets->top = top;
    p_insets->left = left;
    p_insets->bottom = bottom;
    p_insets->right = right;
    -[PXGRoundedCornerMaskLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius == a3)
  {
    self->_cornerRadius = a3;
    -[PXGRoundedCornerMaskLayout _invalidatePath](self, "_invalidatePath");
  }
}

- (void)setMaskColor:(id)a3
{
  UIColor *v5;
  char v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = self->_maskColor;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIColor isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maskColor, a3);
      ++self->_mediaVersion;
      -[PXGRoundedCornerMaskLayout _invalidatePath](self, "_invalidatePath");
    }
  }

}

- (void)setLeftMaskWidth:(double)a3
{
  if (self->_leftMaskWidth != a3)
  {
    self->_leftMaskWidth = a3;
    -[PXGRoundedCornerMaskLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setRightMaskWidth:(double)a3
{
  if (self->_rightMaskWidth != a3)
  {
    self->_rightMaskWidth = a3;
    -[PXGRoundedCornerMaskLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setTopLeftPath:(id)a3
{
  PXGPath *v4;
  char v5;
  PXGPath *v6;
  PXGPath *topLeftPath;
  PXGPath *v8;

  v8 = (PXGPath *)a3;
  v4 = self->_topLeftPath;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXGPath isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (PXGPath *)-[PXGPath copy](v8, "copy");
      topLeftPath = self->_topLeftPath;
      self->_topLeftPath = v6;

      -[PXGRoundedCornerMaskLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (void)setContinuousCorners:(BOOL)a3
{
  if (self->_continuousCorners != a3)
  {
    self->_continuousCorners = a3;
    ++self->_mediaVersion;
    -[PXGRoundedCornerMaskLayout _invalidatePath](self, "_invalidatePath");
  }
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGRoundedCornerMaskLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout setContentSize:](self, "setContentSize:");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGRoundedCornerMaskLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXGRoundedCornerMaskLayout _invalidatePath](self, "_invalidatePath");
  -[PXGRoundedCornerMaskLayout _invalidateContent](self, "_invalidateContent");
}

- (void)contentSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGRoundedCornerMaskLayout;
  -[PXGLayout contentSizeDidChange](&v3, sel_contentSizeDidChange);
  -[PXGRoundedCornerMaskLayout _invalidateContent](self, "_invalidateContent");
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGRoundedCornerMaskLayout update]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGRoundedCornerMaskLayout.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGRoundedCornerMaskLayout _updatePath](self, "_updatePath");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGRoundedCornerMaskLayout update]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGRoundedCornerMaskLayout.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXGRoundedCornerMaskLayout _updateContent](self, "_updateContent");
      v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGRoundedCornerMaskLayout update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGRoundedCornerMaskLayout.m"), 170, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PXGRoundedCornerMaskLayout;
  -[PXGLayout update](&v12, sel_update);
}

- (void)_invalidatePath
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGRoundedCornerMaskLayout _invalidatePath]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGRoundedCornerMaskLayout.m"), 175, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updatePath
{
  double v3;
  double v4;
  _BOOL8 v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  +[PXGCornerMaskPathLibrary sharedLibrary](PXGCornerMaskPathLibrary, "sharedLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGRoundedCornerMaskLayout cornerRadius](self, "cornerRadius");
  v4 = v3;
  v5 = -[PXGRoundedCornerMaskLayout continuousCorners](self, "continuousCorners");
  -[PXGLayout displayScale](self, "displayScale");
  v7 = v6;
  -[PXGRoundedCornerMaskLayout maskColor](self, "maskColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathForCornerRadius:continuousCorners:screenScale:maskColor:", v5, v8, v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGRoundedCornerMaskLayout setTopLeftPath:](self, "setTopLeftPath:", v9);

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
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGRoundedCornerMaskLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGRoundedCornerMaskLayout.m"), 183, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateContent
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[11];
  _QWORD v27[14];
  BOOL v28;

  -[PXGLayout contentSize](self, "contentSize");
  PXRectWithOriginAndSize();
  -[PXGRoundedCornerMaskLayout insets](self, "insets");
  PXEdgeInsetsInsetRect();
  v4 = v3;
  v6 = v5;
  v24 = v8;
  v25 = v7;
  -[PXGRoundedCornerMaskLayout maskScale](self, "maskScale");
  v23 = v9;
  -[PXGLayout displayScale](self, "displayScale");
  -[PXGRoundedCornerMaskLayout topLeftPath](self, "topLeftPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  PXSizeScale();
  v16 = v15;
  v18 = v17;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v20 = -v19;
  v21 = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
  v22 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __44__PXGRoundedCornerMaskLayout__updateContent__block_invoke;
  v27[3] = &unk_1E51342A8;
  v28 = v21 == 1;
  v27[5] = v16;
  v27[6] = v18;
  v27[7] = v4;
  v27[8] = v6;
  v27[9] = v25;
  v27[10] = v24;
  *(double *)&v27[11] = v20;
  v27[12] = v12;
  v27[13] = v14;
  v27[4] = self;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", 0x400000000, v27);
  v26[0] = v22;
  v26[1] = 3221225472;
  v26[2] = __44__PXGRoundedCornerMaskLayout__updateContent__block_invoke_2;
  v26[3] = &unk_1E51342D0;
  v26[4] = self;
  v26[5] = v23;
  v26[6] = v4;
  v26[7] = v6;
  v26[8] = v25;
  v26[9] = v24;
  *(double *)&v26[10] = v20;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", *(_QWORD *)&self->_sideMaskSpriteIndexRange, v26);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (double)maskScale
{
  return self->_maskScale;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)leftMaskWidth
{
  return self->_leftMaskWidth;
}

- (double)rightMaskWidth
{
  return self->_rightMaskWidth;
}

- (PXGPath)topLeftPath
{
  return self->_topLeftPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLeftPath, 0);
  objc_storeStrong((id *)&self->_maskColor, 0);
}

void __44__PXGRoundedCornerMaskLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float v16;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v19;
  float64x2_t v20;
  _OWORD *v21;
  float32x2_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGFloat v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = a3 + 16;
  v31 = *((_OWORD *)off_1E50B83A0 + 1);
  v32 = *(_OWORD *)off_1E50B83A0;
  v29 = *((_OWORD *)off_1E50B83A0 + 4);
  v30 = *((_OWORD *)off_1E50B83A0 + 5);
  v27 = *((_OWORD *)off_1E50B83A0 + 2);
  v28 = *((_OWORD *)off_1E50B83A0 + 3);
  v25 = *((_OWORD *)off_1E50B83A0 + 8);
  v26 = *((_OWORD *)off_1E50B83A0 + 9);
  v23 = *((_OWORD *)off_1E50B83A0 + 6);
  v24 = *((_OWORD *)off_1E50B83A0 + 7);
  do
  {
    if (*(_BYTE *)(a1 + 112))
      PXEdgesFlippedHorizontally();
    PXRectWithSizeAlignedToRectEdges();
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    v16 = *(double *)(a1 + 88);
    MidX = CGRectGetMidX(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    MidY = CGRectGetMidY(v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v33 = CGRectGetWidth(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v19 = CGRectGetHeight(v37);
    v20.f64[0] = v33;
    v20.f64[1] = v19;
    *(CGFloat *)(v11 - 16) = MidX;
    *(CGFloat *)(v11 - 8) = MidY;
    *(double *)v11 = v16;
    *(float32x2_t *)(v11 + 8) = vcvt_f32_f64(v20);
    v11 += 32;
    v21 = (_OWORD *)(a4 + v8);
    *v21 = v32;
    v21[1] = v31;
    v21[4] = v29;
    v21[5] = v30;
    v21[2] = v27;
    v21[3] = v28;
    v21[8] = v25;
    v21[9] = v26;
    v21[6] = v23;
    v21[7] = v24;
    *(float *)&v19 = (double)(v10 - 1) * -1.57079633;
    *(_DWORD *)(a4 + 4 * v9 + 56) = LODWORD(v19);
    v22 = (float32x2_t *)(a5 + v9);
    v22->i8[1] = 11;
    v22[1] = vcvt_f32_f64(*(float64x2_t *)(a1 + 96));
    v9 += 40;
    v22[4].i16[0] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 880);
    v8 += 160;
    ++v10;
  }
  while (v9 != 160);
}

float32x2_t __44__PXGRoundedCornerMaskLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  float v14;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat x;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  float64x2_t v27;
  float32x2_t result;
  CGFloat Width;
  CGFloat v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  objc_msgSend(*(id *)(a1 + 32), "leftMaskWidth");
  v9 = v8 * *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "rightMaskWidth");
  v11 = v10 * *(double *)(a1 + 40);
  v12 = *(double *)(a1 + 48) - v9;
  v13 = *(double *)(a1 + 72);
  v14 = *(double *)(a1 + 80);
  v31.origin.y = 0.0;
  v31.origin.x = v12;
  v31.size.width = v9;
  v31.size.height = v13;
  MidX = CGRectGetMidX(v31);
  v32.origin.y = 0.0;
  v32.origin.x = v12;
  v32.size.width = v9;
  v32.size.height = v13;
  MidY = CGRectGetMidY(v32);
  v33.origin.y = 0.0;
  v33.origin.x = v12;
  v33.size.width = v9;
  v33.size.height = v13;
  Width = CGRectGetWidth(v33);
  v34.origin.y = 0.0;
  v34.origin.x = v12;
  v34.size.width = v9;
  v34.size.height = v13;
  Height = CGRectGetHeight(v34);
  v18.f64[0] = Width;
  v18.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)(a3 + 8) = MidY;
  *(double *)(a3 + 16) = v14;
  *(float32x2_t *)(a3 + 24) = vcvt_f32_f64(v18);
  v19 = *(_QWORD *)(a1 + 48);
  v18.f64[0] = *(float64_t *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v35.origin.x = CGRectGetMaxX(*(CGRect *)((char *)&v18 - 8));
  x = v35.origin.x;
  v23 = *(double *)(a1 + 72);
  *(float *)&MidY = *(double *)(a1 + 80);
  v35.origin.y = 0.0;
  v35.size.width = v11;
  v35.size.height = v23;
  v24 = CGRectGetMidX(v35);
  v36.origin.y = 0.0;
  v36.origin.x = x;
  v36.size.width = v11;
  v36.size.height = v23;
  v25 = CGRectGetMidY(v36);
  v37.origin.y = 0.0;
  v37.origin.x = x;
  v37.size.width = v11;
  v37.size.height = v23;
  v30 = CGRectGetWidth(v37);
  v38.origin.y = 0.0;
  v38.origin.x = x;
  v38.size.width = v11;
  v38.size.height = v23;
  v26 = CGRectGetHeight(v38);
  v27.f64[0] = v30;
  v27.f64[1] = v26;
  result = vcvt_f32_f64(v27);
  *(CGFloat *)(a3 + 32) = v24;
  *(CGFloat *)(a3 + 40) = v25;
  *(double *)(a3 + 48) = *(float *)&MidY;
  *(float32x2_t *)(a3 + 56) = result;
  *(_WORD *)(a5 + 32) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 880);
  *(_WORD *)(a5 + 72) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 880);
  return result;
}

void __79__PXGRoundedCornerMaskLayout_initWithCornerRadius_continuousCorners_maskColor___block_invoke(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;

  if (HIDWORD(a2))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = *(_OWORD *)off_1E50B8358;
    v7 = *((_OWORD *)off_1E50B8358 + 1);
    v8 = *((_OWORD *)off_1E50B83A0 + 6);
    v9 = *((_OWORD *)off_1E50B83A0 + 7);
    v10 = *((_OWORD *)off_1E50B83A0 + 8);
    v11 = *((_OWORD *)off_1E50B83A0 + 9);
    v12 = *((_OWORD *)off_1E50B83A0 + 2);
    v13 = *((_OWORD *)off_1E50B83A0 + 3);
    v14 = *((_OWORD *)off_1E50B83A0 + 4);
    v15 = *((_OWORD *)off_1E50B83A0 + 5);
    v16 = *(_OWORD *)off_1E50B83A0;
    v17 = *((_OWORD *)off_1E50B83A0 + 1);
    __asm { FMOV            V20.2S, #1.0 }
    do
    {
      v23 = (_OWORD *)(a3[2] + v5);
      *v23 = v6;
      v23[1] = v7;
      v24 = (_OWORD *)(a3[3] + v3);
      v24[6] = v8;
      v24[7] = v9;
      v24[8] = v10;
      v24[9] = v11;
      v24[2] = v12;
      v24[3] = v13;
      v24[4] = v14;
      v24[5] = v15;
      *v24 = v16;
      v24[1] = v17;
      v25 = a3[4] + v4;
      *(_BYTE *)(v25 + 1) = 5;
      *(_QWORD *)(v25 + 8) = _D20;
      v5 += 32;
      v4 += 40;
      v3 += 160;
    }
    while (((a2 >> 27) & 0x1FFFFFFFE0) != v5);
  }
}

@end

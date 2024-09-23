@implementation PXGPPTAnimationLayout

- (PXGPPTAnimationLayout)init
{
  PXGPPTAnimationLayout *v2;
  void *v3;
  unint64_t i;
  void *v5;
  uint64_t v6;
  NSArray *colors;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGPPTAnimationLayout;
  v2 = -[PXGLayout init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 101);
    for (i = 0; i != 101; ++i)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (double)i / 101.0, 1.0, 1.0, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
    v6 = objc_msgSend(v3, "copy");
    colors = v2->_colors;
    v2->_colors = (NSArray *)v6;

    -[PXGLayout setContentSource:](v2, "setContentSource:", v2);
  }
  return v2;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTAnimationLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGPPTAnimationLayout.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGPPTAnimationLayout _updateContent](self, "_updateContent");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTAnimationLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGPPTAnimationLayout.m"), 49, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTAnimationLayout;
  -[PXGLayout update](&v9, sel_update);
}

- (void)_updateContent
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  __int128 v7;
  double v8;
  uint64_t v9;
  float64x2_t v10;
  float32x2_t v16;
  float v17;
  int64_t v18;
  int32x4_t v19;
  uint64_t v20;
  float32x4_t v22;
  float32x4_t v23;
  _QWORD *v24;
  float v25;
  __int128 v27;
  double v28;
  double v29;
  _QWORD v30[6];
  unsigned int v31;
  float v32;
  float v33;
  int v34;
  _QWORD v35[6];
  unsigned int v36;
  int32x4_t v37;
  float v38;
  int v39;

  v3 = -[PXGPPTAnimationLayout numberOfRows](self, "numberOfRows");
  v4 = -[PXGPPTAnimationLayout numberOfColumns](self, "numberOfColumns");
  v5 = v4 * v3;
  v6 = -[PXGLayout numberOfSprites](self, "numberOfSprites");
  if (v5 >= v6)
  {
    if (v5 > v6)
      -[PXGLayout addSpritesInRange:initialState:](self, "addSpritesInRange:initialState:", v6 | ((unint64_t)(v5 - v6) << 32), &__block_literal_global_121017);
  }
  else
  {
    -[PXGLayout removeSpritesInRange:](self, "removeSpritesInRange:", v5 | ((unint64_t)(v6 - v5) << 32));
  }
  -[PXGLayout referenceSize](self, "referenceSize");
  *(_QWORD *)&v10.f64[0] = v7;
  v10.f64[1] = v8;
  __asm { FMOV            V2.2D, #0.5 }
  v16 = vcvt_f32_f64(vmulq_f64(v10, _Q2));
  v27 = v7;
  if (*(double *)&v7 >= v8)
    *(double *)&v7 = v8;
  v17 = *(double *)&v7 * 0.5;
  v18 = -[PXGPPTAnimationLayout style](self, "style", v27, *(_QWORD *)&v8, v9);
  if (v18 == 1)
  {
    v30[1] = 3221225472;
    v25 = 6.28318531 / (double)v4;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[2] = __39__PXGPPTAnimationLayout__updateContent__block_invoke_3;
    v30[3] = &__block_descriptor_64_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    v20 = v5 << 32;
    v31 = v4;
    v32 = v25;
    v33 = v17 / (float)v3;
    __asm { FMOV            V0.2S, #10.0 }
    v30[4] = v16;
    v30[5] = _D0;
    v34 = 1065353216;
    v24 = v30;
    goto LABEL_11;
  }
  if (!v18)
  {
    v20 = v5 << 32;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __39__PXGPPTAnimationLayout__updateContent__block_invoke_2;
    v35[3] = &__block_descriptor_76_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    v36 = v4;
    *(float32x2_t *)v19.i8 = vcvt_f32_u32((uint32x2_t)vadd_s32((int32x2_t)__PAIR64__(v3, v4), (int32x2_t)-1));
    _Q0 = (float32x4_t)vzip1q_s32(v19, v19);
    v22.i64[0] = 0x3F0000003F000000;
    v22.i64[1] = 0x3F0000003F000000;
    v23.i64[0] = 0x4000000040000000;
    v23.i64[1] = 0x4000000040000000;
    v37 = vtrn2q_s32(vrev64q_s32((int32x4_t)vmulq_f32(_Q0, v22)), (int32x4_t)vdivq_f32(v23, _Q0));
    v38 = v17 * 0.75;
    __asm { FMOV            V0.2S, #1.0 }
    v35[4] = v16;
    v35[5] = _Q0.i64[0];
    v39 = 1056964608;
    v24 = v35;
LABEL_11:
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v20, v24);
  }
  -[PXGLayout setContentSize:](self, "setContentSize:", v28, v29);
}

- (NSString)configurationDescription
{
  unsigned int v3;
  uint64_t v4;
  const __CFString *v5;

  -[PXGLayout updateIfNeeded](self, "updateIfNeeded");
  v3 = -[PXGLayout numberOfSprites](self, "numberOfSprites");
  LODWORD(v4) = v3 / 0x3E8;
  v5 = &stru_1E5149688;
  if (v3 <= 0x3E7)
    v4 = v3;
  else
    v4 = v4;
  if (v3 > 0x3E7)
    v5 = CFSTR("k");
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li%@_Sprites"), v4, v5);
}

- (void)referenceSizeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGPPTAnimationLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
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
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTAnimationLayout referenceSizeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGPPTAnimationLayout.m"), 148, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)setNumberOfRows:(unsigned int)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_numberOfRows != a3)
  {
    self->_numberOfRows = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTAnimationLayout setNumberOfRows:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGPPTAnimationLayout.m"), 156, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setNumberOfColumns:(unsigned int)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_numberOfColumns != a3)
  {
    self->_numberOfColumns = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTAnimationLayout setNumberOfColumns:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGPPTAnimationLayout.m"), 164, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setStyle:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_style != a3)
  {
    self->_style = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGPPTAnimationLayout setStyle:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGPPTAnimationLayout.m"), 172, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return -[NSArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", a3 % -[NSArray count](self->_colors, "count"));
}

- (unsigned)numberOfRows
{
  return self->_numberOfRows;
}

- (unsigned)numberOfColumns
{
  return self->_numberOfColumns;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

float __39__PXGPPTAnimationLayout__updateContent__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, float *a4)
{
  unint64_t v4;
  unsigned int v5;
  float v6;
  float v7;
  float result;

  v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    do
    {
      v5 = *(_DWORD *)(a1 + 48);
      v6 = (float)((float)(a2 / v5) - *(float *)(a1 + 60)) * *(float *)(a1 + 64);
      v7 = *(float *)(a1 + 68);
      *(double *)a3 = (float)(COERCE_FLOAT(*(_QWORD *)(a1 + 32))
                            + (float)((float)((float)((float)(a2 % v5) - *(float *)(a1 + 52))
                                            * *(float *)(a1 + 56))
                                    * v7));
      *(double *)(a3 + 8) = (float)(*(float *)(a1 + 36) + (float)(v6 * v7));
      *(_QWORD *)(a3 + 24) = *(_QWORD *)(a1 + 40);
      result = *(float *)(a1 + 72);
      *a4 = result;
      a4 += 40;
      LODWORD(a2) = a2 + 1;
      a3 += 32;
      LODWORD(v4) = v4 - 1;
    }
    while ((_DWORD)v4);
  }
  return result;
}

void __39__PXGPPTAnimationLayout__updateContent__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, _DWORD *a4)
{
  unint64_t v4;
  unsigned int v7;
  unsigned int v9;
  float v10;
  __float2 v11;

  v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v7 = a2;
    do
    {
      v9 = *(_DWORD *)(a1 + 48);
      v10 = *(float *)(a1 + 56) * (float)(v7 / v9);
      v11 = __sincosf_stret(*(float *)(a1 + 52) * (float)(v7 % v9));
      *(double *)a3 = (float)(COERCE_FLOAT(*(_QWORD *)(a1 + 32)) + (float)(v11.__cosval * v10));
      *(double *)(a3 + 8) = (float)(*(float *)(a1 + 36) + (float)(v11.__sinval * v10));
      *(_QWORD *)(a3 + 24) = *(_QWORD *)(a1 + 40);
      *a4 = *(_DWORD *)(a1 + 60);
      a4 += 40;
      ++v7;
      a3 += 32;
      LODWORD(v4) = v4 - 1;
    }
    while ((_DWORD)v4);
  }
}

void __39__PXGPPTAnimationLayout__updateContent__block_invoke(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  float32x2_t *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v16;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v20;
  __int128 v21;
  __int128 v22;
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
  CGFloat Width;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v3 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v5 = (_OWORD *)a3[3];
    v4 = a3[4];
    v6 = (float32x2_t *)a3[2];
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v32 = *(_OWORD *)off_1E50B83A0;
    v30 = *((_OWORD *)off_1E50B83A0 + 5);
    v31 = *((_OWORD *)off_1E50B83A0 + 1);
    v28 = *((_OWORD *)off_1E50B83A0 + 3);
    v29 = *((_OWORD *)off_1E50B83A0 + 4);
    v26 = *((_OWORD *)off_1E50B83A0 + 9);
    v27 = *((_OWORD *)off_1E50B83A0 + 2);
    v25 = *((_OWORD *)off_1E50B83A0 + 8);
    v23 = *((_OWORD *)off_1E50B83A0 + 6);
    v24 = *((_OWORD *)off_1E50B83A0 + 7);
    v21 = *((_OWORD *)off_1E50B8398 + 1);
    v22 = *(_OWORD *)off_1E50B8398;
    __asm { FMOV            V14.2S, #10.0 }
    v16 = *((_QWORD *)off_1E50B8398 + 4);
    do
    {
      v34.origin.x = v7;
      v34.origin.y = v8;
      v34.size.width = v9;
      v34.size.height = v10;
      MidX = CGRectGetMidX(v34);
      v35.origin.x = v7;
      v35.origin.y = v8;
      v35.size.width = v9;
      v35.size.height = v10;
      MidY = CGRectGetMidY(v35);
      v36.origin.x = v7;
      v36.origin.y = v8;
      v36.size.width = v9;
      v36.size.height = v10;
      Width = CGRectGetWidth(v36);
      v37.origin.x = v7;
      v37.origin.y = v8;
      v37.size.width = v9;
      v37.size.height = v10;
      Height = CGRectGetHeight(v37);
      v20.f64[0] = Width;
      v20.f64[1] = Height;
      *(CGFloat *)v6 = MidX;
      *(CGFloat *)&v6[1] = MidY;
      v6[2] = 0;
      v6[3] = vcvt_f32_f64(v20);
      *v5 = v32;
      v5[1] = v31;
      v5[4] = v29;
      v5[5] = v30;
      v5[2] = v27;
      v5[3] = v28;
      v5[8] = v25;
      v5[9] = v26;
      v5[6] = v23;
      v5[7] = v24;
      *(_QWORD *)(v4 + 32) = v16;
      *(_OWORD *)v4 = v22;
      *(_OWORD *)(v4 + 16) = v21;
      *(_BYTE *)(v4 + 1) = 5;
      *(_QWORD *)(v4 + 8) = _D14;
      v5 += 10;
      v6 += 4;
      v4 += 40;
      LODWORD(v3) = v3 - 1;
    }
    while ((_DWORD)v3);
  }
}

@end

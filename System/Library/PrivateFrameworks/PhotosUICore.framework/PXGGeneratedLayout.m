@implementation PXGGeneratedLayout

- (void)didApplySpriteChangeDetails:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGGeneratedLayout;
  -[PXGLayout didApplySpriteChangeDetails:](&v10, sel_didApplySpriteChangeDetails_, v4);
  if (!self->_isUpdatingSprites
    && !-[PXGLayout isUpdatingSpriteStyling](self, "isUpdatingSpriteStyling")
    && (!v4 || objc_msgSend(v4, "hasAnyChanges")))
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->needsUpdate = needsUpdate | 7;
        goto LABEL_11;
      }
LABEL_9:
      if ((self->_updateFlags.updated & 7) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout didApplySpriteChangeDetails:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGGeneratedLayout.m"), 98, CFSTR("invalidating %lu after it already has been updated"), 7);

        abort();
      }
      goto LABEL_10;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_9;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 7;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_11:

}

uint64_t __36__PXGGeneratedLayout__updateSprites__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRect:inLayout:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (PXLayoutGenerator)generator
{
  PXLayoutGenerator *generator;
  PXLayoutGenerator *v4;
  PXLayoutGenerator *v5;

  generator = self->_generator;
  if (!generator)
  {
    v4 = -[PXGGeneratedLayout newGenerator](self, "newGenerator");
    v5 = self->_generator;
    self->_generator = v4;

    generator = self->_generator;
  }
  return generator;
}

- (void)metricsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 7;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 7) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout metricsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 87, CFSTR("invalidating %lu after it already has been updated"), 7);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 7;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

void __36__PXGGeneratedLayout__updateSprites__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  char v9;
  float64x2_t *v10;
  char v11;
  float64x2_t v12;
  _OWORD *v13;
  _BOOL4 IsNull;
  int8x16_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  float64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  _BOOL4 v30;
  double v31;
  unsigned int v32;
  double v33;
  double v34;
  double v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  double v39;
  _OWORD *v40;
  __int128 v41;
  float32x2_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  float v61;
  __int128 v62;
  unint64_t v63;
  __int128 v64;
  CGFloat v65;
  __int128 v66;
  CGFloat v67;
  __int128 v68;
  CGFloat v69;
  int8x16_t v70;
  CGFloat v71;
  _QWORD aBlock[6];
  int v73;
  float64x2_t v74;
  float64x2_t v75;
  _OWORD v76[21];
  uint64_t v77;
  CGRect v78;
  CGRect v79;

  v53 = a5;
  v8 = 0;
  v77 = *MEMORY[0x1E0C80C00];
  v70 = *(int8x16_t *)off_1E50B81E8;
  v9 = 1;
  v66 = *((_OWORD *)off_1E50B83A0 + 7);
  v68 = *((_OWORD *)off_1E50B83A0 + 6);
  v62 = *((_OWORD *)off_1E50B83A0 + 9);
  v64 = *((_OWORD *)off_1E50B83A0 + 8);
  v59 = *((_OWORD *)off_1E50B83A0 + 3);
  v60 = *((_OWORD *)off_1E50B83A0 + 2);
  v57 = *((_OWORD *)off_1E50B83A0 + 5);
  v58 = *((_OWORD *)off_1E50B83A0 + 4);
  v55 = *((_OWORD *)off_1E50B83A0 + 1);
  v56 = *(_OWORD *)off_1E50B83A0;
  v10 = (float64x2_t *)MEMORY[0x1E0C9D628];
  do
  {
    v11 = v9;
    v12 = v10[1];
    v74 = *v10;
    v75 = v12;
    objc_msgSend(*(id *)(a1 + 32), "getSpriteZPosition:clippingRect:forSpriteKind:", (char *)&v76[20] + 4 * v8 + 8, &v74, v8, v53);
    v13 = &v76[10 * v8];
    v13[6] = v68;
    v13[7] = v66;
    v13[8] = v64;
    v13[9] = v62;
    v13[2] = v60;
    v13[3] = v59;
    v13[4] = v58;
    v13[5] = v57;
    *v13 = v56;
    v13[1] = v55;
    v78.origin = (CGPoint)v74;
    v78.size = (CGSize)v75;
    IsNull = CGRectIsNull(v78);
    v9 = 0;
    v15 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v75);
    if (IsNull)
      v16 = -1;
    else
      v16 = 0;
    *(int8x16_t *)((char *)v13 + 20) = vbslq_s8((int8x16_t)vdupq_n_s32(v16), v70, v15);
    v8 = 1;
  }
  while ((v11 & 1) != 0);
  v17 = HIDWORD(a2);
  *(_QWORD *)&v74.f64[0] = objc_msgSend(*(id *)(a1 + 32), "defaultSpriteTag");
  *(_QWORD *)&v74.f64[1] = objc_msgSend(*(id *)(a1 + 32), "keyItemSpriteTag");
  if (HIDWORD(a2))
  {
    v18 = a4;
    v19 = (float64_t *)(v53 + 24);
    do
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096) + 152 * a2;
      v21 = *(_QWORD *)(v20 + 8);
      v22 = *(_QWORD *)(v20 + 16);
      v23 = *(double *)(v20 + 24);
      v24 = *(double *)(v20 + 32);
      PXSizeGetAspectRatio();
      objc_msgSend(*(id *)(a1 + 40), "generatedLayout:bestCropRectForInputItemAtIndex:withAspectRatio:", *(_QWORD *)(a1 + 32), a2);
      v69 = v26;
      v71 = v25;
      v65 = v28;
      v67 = v27;
      objc_msgSend(*(id *)(a1 + 40), "generatedLayout:inputItemAtIndex:", *(_QWORD *)(a1 + 32), a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 72) == a2;
      objc_msgSend(*(id *)(a1 + 48), "itemsLayout:marginForItem:", *(_QWORD *)(a1 + 32), a2);
      objc_msgSend(*(id *)(a1 + 56), "itemsLayout:insetForItem:", *(_QWORD *)(a1 + 32), a2);
      PXSizeAdd();
      *(float *)&v32 = fmax(v23 - v31, 0.0);
      *(float *)&v31 = fmax(v24 - v33, 0.0);
      v61 = *(float *)&v32;
      v63 = __PAIR64__(LODWORD(v31), v32);
      objc_msgSend(v29, "size");
      PXSizeGetAspectRatioWithDefault();
      v35 = v34;
      v79.origin.y = v69;
      v79.origin.x = v71;
      v79.size.height = v65;
      v79.size.width = v67;
      v36.f64[0] = v61 / CGRectGetWidth(v79);
      v36.f64[1] = v36.f64[0] / v35;
      v37.f64[0] = v67;
      v37.f64[1] = v65;
      v38.f64[0] = v71;
      v38.f64[1] = v69;
      v39 = *((float *)&v76[20] + v30 + 2);
      *(_QWORD *)a3 = v21;
      *(_QWORD *)(a3 + 8) = v22;
      *(double *)(a3 + 16) = v39;
      *(_QWORD *)(a3 + 24) = v63;
      v40 = &v76[10 * v30];
      v41 = v40[1];
      *(_OWORD *)v18 = *v40;
      *(_OWORD *)(v18 + 16) = v41;
      v42 = vcvt_f32_f64(v36);
      v43 = v40[5];
      *(_OWORD *)(v18 + 64) = v40[4];
      *(_OWORD *)(v18 + 80) = v43;
      v44 = v40[3];
      *(_OWORD *)(v18 + 32) = v40[2];
      *(_OWORD *)(v18 + 48) = v44;
      v45 = v40[9];
      *(_OWORD *)(v18 + 128) = v40[8];
      *(_OWORD *)(v18 + 144) = v45;
      v46 = v40[7];
      *(_OWORD *)(v18 + 96) = v40[6];
      *(_OWORD *)(v18 + 112) = v46;
      *(float32x4_t *)(v18 + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v37);
      objc_msgSend(*(id *)(a1 + 64), "itemsLayout:cornerRadiusForItem:", *(_QWORD *)(a1 + 32), a2);
      *(_DWORD *)(v18 + 36) = v47;
      *(_DWORD *)(v18 + 40) = v48;
      *(_DWORD *)(v18 + 44) = v49;
      *(_DWORD *)(v18 + 48) = v50;
      *((_BYTE *)v19 - 23) = *(_BYTE *)(a1 + 104);
      *((float32x2_t *)v19 - 2) = vmul_n_f32(v42, *(float *)(a1 + 80));
      *v19 = v74.f64[v30];
      v19 += 5;

      a2 = (a2 + 1);
      a3 += 32;
      v18 += 160;
      LODWORD(v17) = v17 - 1;
    }
    while ((_DWORD)v17);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "delegateRespondsTo:", 32) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "itemsLayout:updateTagsInSpriteInfos:forItemsInRange:", *(_QWORD *)(a1 + 32), v53, 0, *(unsigned int *)(a1 + 84));

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PXGGeneratedLayout__updateSprites__block_invoke_2;
  aBlock[3] = &unk_1E51260A8;
  v73 = *(_DWORD *)(a1 + 84);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = a4;
  v52 = _Block_copy(aBlock);
  (*((void (**)(void *, _QWORD, _QWORD))v52 + 2))(v52, 0, *(unsigned int *)(a1 + 88));
  (*((void (**)(void *, uint64_t, _QWORD))v52 + 2))(v52, 1, *(unsigned int *)(a1 + 92));
  (*((void (**)(void *, uint64_t, _QWORD))v52 + 2))(v52, 2, *(unsigned int *)(a1 + 96));
  (*((void (**)(void *, uint64_t, _QWORD))v52 + 2))(v52, 3, *(unsigned int *)(a1 + 100));

}

float32x4_t __36__PXGGeneratedLayout__updateSprites__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  float32x4_t result;
  _DWORD v14[4];
  float32x4_t v15;

  if (*(_DWORD *)(a1 + 48) > a3)
  {
    v7 = a1 + 32;
    v6 = *(void **)(a1 + 32);
    v15 = *(float32x4_t *)(*(_QWORD *)(v7 + 8) + 160 * a3 + 36);
    objc_msgSend(v6, "cornerRadius");
    v14[0] = v8;
    v14[1] = v9;
    v14[2] = v10;
    v14[3] = v11;
    v15.i32[a2] = v14[a2];
    v12 = *(_QWORD *)(a1 + 40) + 160 * a3;
    result = vmaxnmq_f32(v15, *(float32x4_t *)(v12 + 36));
    *(float32x4_t *)(v12 + 36) = result;
  }
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (void)setKeyItemSpriteTag:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_keyItemSpriteTag != a3)
  {
    self->_keyItemSpriteTag = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout setKeyItemSpriteTag:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 131, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setKeyItemIndex:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_keyItemIndex != a3)
  {
    self->_keyItemIndex = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 7;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 7) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout setKeyItemIndex:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 107, CFSTR("invalidating %lu after it already has been updated"), 7);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 7;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setDefaultSpriteTag:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_defaultSpriteTag != a3)
  {
    self->_defaultSpriteTag = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout setDefaultSpriteTag:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 123, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (int64_t)keyItemSpriteTag
{
  return self->_keyItemSpriteTag;
}

- (int64_t)defaultSpriteTag
{
  return self->_defaultSpriteTag;
}

- (void)_updateSprites
{
  void *v4;
  int64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  float v17;
  int64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[9];
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  int64_t v42;
  float v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 v47;

  -[PXGGeneratedLayout generator](self, "generator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v6 = -[PXGLayout numberOfSprites](self, "numberOfSprites");
  if (-[PXGItemsLayout numberOfItems](self, "numberOfItems") != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGGeneratedLayout.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.numberOfSprites == self.numberOfItems"));

  }
  objc_msgSend(v4, "setItemCount:", v5);
  -[PXGGeneratedLayout _resizeGeometryBufferForSpriteCount:](self, "_resizeGeometryBufferForSpriteCount:", v5);
  objc_msgSend(v4, "getGeometries:inRange:withKind:", self->_generatorGeometryBuffer, 0, v5, 0);
  v35 = v4;
  v7 = objc_msgSend(v4, "cornerSpriteIndexes");
  v33 = v8;
  v34 = v7;
  self->_isUpdatingSprites = 1;
  v9 = -[PXGGeneratedLayout mediaKind](self, "mediaKind");
  -[PXGItemsLayout delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 1024))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 256))
    v13 = v10;
  else
    v13 = 0;
  v14 = v13;
  -[PXGItemsLayout insetDelegate](self, "insetDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout displayScale](self, "displayScale");
  v17 = v16;
  v18 = -[PXGGeneratedLayout keyItemIndex](self, "keyItemIndex");
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __36__PXGGeneratedLayout__updateSprites__block_invoke;
  v37[3] = &unk_1E51260D0;
  v37[4] = self;
  v19 = v10;
  v38 = v19;
  v42 = v18;
  v20 = v14;
  v39 = v20;
  v21 = v15;
  v40 = v21;
  v22 = v12;
  v41 = v22;
  v47 = v9;
  v43 = v17;
  v44 = v5;
  v45 = v34;
  v46 = v33;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v5 << 32, v37);
  if ((_DWORD)v5)
  {
    PXRectWithCenterAndSize();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D628];
    v26 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
    v28 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
    v30 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  }
  -[PXGGeneratedLayout headerLayoutGuide](self, "headerLayoutGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __36__PXGGeneratedLayout__updateSprites__block_invoke_3;
  v36[3] = &unk_1E51260F8;
  v36[5] = v24;
  v36[6] = v26;
  v36[7] = v28;
  v36[8] = v30;
  v36[4] = self;
  objc_msgSend(v31, "performChanges:", v36);

  self->_isUpdatingSprites = 0;
  -[PXGGeneratedLayout spritesDidUpdate](self, "spritesDidUpdate");

}

- (PXGLayoutGuide)headerLayoutGuide
{
  return self->_headerLayoutGuide;
}

- (int64_t)keyItemIndex
{
  return self->_keyItemIndex;
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (void)_resizeGeometryBufferForSpriteCount:(int64_t)a3
{
  int64_t generatorGeometryBufferCount;

  generatorGeometryBufferCount = self->_generatorGeometryBufferCount;
  if (generatorGeometryBufferCount < a3)
  {
    if (generatorGeometryBufferCount)
    {
      do
        generatorGeometryBufferCount *= 2;
      while (generatorGeometryBufferCount < a3);
    }
    else
    {
      generatorGeometryBufferCount = a3;
    }
    self->_generatorGeometryBufferCount = generatorGeometryBufferCount;
    _PXGArrayResize();
  }
}

- (void)setMediaKind:(unsigned __int8)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_mediaKind != a3)
  {
    self->_mediaKind = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout setMediaKind:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 115, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGeneratedLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 5;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 5) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 82, CFSTR("invalidating %lu after it already has been updated"), 5);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 5;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_cornerRadius.var0.var0.topLeft = v3;
  self->_cornerRadius.var0.var0.topRight = v4;
  self->_cornerRadius.var0.var0.bottomLeft = v5;
  self->_cornerRadius.var0.var0.bottomRight = v6;
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[PXGItemsLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLayout:objectReferenceAtIndex:", self, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGGeneratedLayout.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGGeneratedLayout _updateGenerator](self, "_updateGenerator");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout update]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGGeneratedLayout.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXGGeneratedLayout _updateContentSize](self, "_updateContentSize");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGGeneratedLayout.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXGGeneratedLayout _updateSprites](self, "_updateSprites");
      -[PXGItemsLayout invalidateStylableType:](self, "invalidateStylableType:", 1);
      v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGGeneratedLayout.m"), 181, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXGGeneratedLayout;
  -[PXGItemsLayout update](&v15, sel_update);
}

- (void)_updateGenerator
{
  PXLayoutGenerator *v3;
  PXLayoutGenerator *generator;

  v3 = -[PXGGeneratedLayout newGenerator](self, "newGenerator");
  generator = self->_generator;
  self->_generator = v3;

}

- (void)_updateContentSize
{
  id v3;

  -[PXGGeneratedLayout generator](self, "generator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  -[PXGLayout setContentSize:](self, "setContentSize:");

}

- (PXGGeneratedLayout)init
{
  PXGGeneratedLayout *v2;
  PXGGeneratedLayout *v3;
  __int128 v4;
  PXGLayoutGuide *v5;
  PXGLayoutGuide *headerLayoutGuide;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGeneratedLayout;
  v2 = -[PXGItemsLayout init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_interitemSpacing = 1.0;
    v4 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)&v2->_padding.top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&v2->_padding.bottom = v4;
    v2->_useSaliency = 0;
    v2->_keyItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5 = objc_alloc_init(PXGLayoutGuide);
    headerLayoutGuide = v3->_headerLayoutGuide;
    v3->_headerLayoutGuide = v5;

  }
  return v3;
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
  v8.super_class = (Class)PXGGeneratedLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 7;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 7) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout referenceSizeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 77, CFSTR("invalidating %lu after it already has been updated"), 7);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 7;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)enumerateItemsInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v9)(id, int64_t, _BYTE *, double, double, double, double);
  uint64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void (**)(id, int64_t, _BYTE *, double, double, double, double))a4;
  v20 = 0;
  if (self->_generatorGeometryBufferCount >= 1)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      PXRectWithCenterAndSize();
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v22.origin.x = v13;
      v22.origin.y = v15;
      v22.size.width = v17;
      v22.size.height = v19;
      if (CGRectIntersectsRect(v21, v22))
      {
        v9[2](v9, v11, &v20, v13, v15, v17, v19);
        if (v20)
          break;
      }
      ++v11;
      v10 += 152;
    }
    while (v11 < self->_generatorGeometryBufferCount);
  }

}

- (void)dealloc
{
  objc_super v3;

  free(self->_generatorGeometryBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PXGGeneratedLayout;
  -[PXGItemsLayout dealloc](&v3, sel_dealloc);
}

- (id)newGenerator
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGGeneratedLayout.m"), 47, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGGeneratedLayout newGenerator]", v6);

  abort();
}

- (void)getSpriteZPosition:(float *)a3 clippingRect:(CGRect *)a4 forSpriteKind:(int64_t)a5
{
  CGSize v5;

  *a3 = 0.0;
  v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  a4->origin = (CGPoint)*MEMORY[0x1E0C9D628];
  a4->size = v5;
}

- (void)paddingDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 7;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 7) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout paddingDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 92, CFSTR("invalidating %lu after it already has been updated"), 7);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 7;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_padding;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_padding = &self->_padding;
  if ((PXEdgeInsetsApproximatelyEqualToEdgeInsets() & 1) == 0)
  {
    p_padding->top = top;
    p_padding->left = left;
    p_padding->bottom = bottom;
    p_padding->right = right;
    -[PXGGeneratedLayout paddingDidChange](self, "paddingDidChange");
  }
}

- (void)setInteritemSpacing:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_interitemSpacing != a3)
  {
    self->_interitemSpacing = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 7;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 7) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout setInteritemSpacing:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 147, CFSTR("invalidating %lu after it already has been updated"), 7);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 7;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setUseSaliency:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_useSaliency != a3)
  {
    self->_useSaliency = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 7;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 7) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGeneratedLayout setUseSaliency:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGeneratedLayout.m"), 155, CFSTR("invalidating %lu after it already has been updated"), 7);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 7;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (CGSize)sizeForItem:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  CGSize result;

  -[PXGGeneratedLayout generator](self, "generator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  objc_msgSend(v4, "getGeometries:inRange:withKind:", &v9, a3, 1, 0);
  v5 = *((double *)&v10 + 1);
  v6 = *(double *)&v11;

  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)diagnosticDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;
  UIEdgeInsets v18;

  v17.receiver = self;
  v17.super_class = (Class)PXGGeneratedLayout;
  -[PXGLayout diagnosticDescription](&v17, sel_diagnosticDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout referenceSize](self, "referenceSize");
  v5 = v4;
  -[PXGLayout referenceSize](self, "referenceSize");
  v7 = v6;
  -[PXGGeneratedLayout padding](self, "padding");
  NSStringFromUIEdgeInsets(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  -[PXGGeneratedLayout interitemSpacing](self, "interitemSpacing");
  v11 = v10;
  -[PXGLayout displayScale](self, "displayScale");
  v13 = v12;
  -[PXLayoutGenerator diagnosticDescription](self->_generator, "diagnosticDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", CFSTR("; size: {%.3f, %.3f}; padding: %@; items: %li; interItemSpacing: %.3f; screenScale: %.3f; generator: %@"),
    v5,
    v7,
    v8,
    v9,
    v11,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_generator, 0);
}

@end

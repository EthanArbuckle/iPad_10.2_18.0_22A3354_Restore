@implementation PXGDecoratingLayout

- (BOOL)appliesAlphaToSublayouts
{
  return self->_appliesAlphaToSublayouts;
}

- (PXGLayout)decoratedLayout
{
  return self->_decoratedLayout;
}

- (unsigned)decorationIndexForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  unsigned int v6;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDecoratingLayout.m"), 982, CFSTR("Sprite index %u is not valid for decorating layout with %u sprites"), v3, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"));

  }
  v6 = self->_activeDecorationSpriteIndexes[v3 % self->_activeDecorationsCount];
  if (v6 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDecoratingLayout.m"), 986, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("decorationIndex < PXGDecoratingLayoutMaxNumberOfDecoratingSpritesPerDecoratedSprite"));

  }
  return v6;
}

- (unsigned)numberOfDecoratingSpritesPerDecoratedSprite
{
  return self->_activeDecorationsCount;
}

- (PXGSelectionDecorationSource)selectionDecorationSource
{
  return (PXGSelectionDecorationSource *)objc_loadWeakRetained((id *)&self->_selectionDecorationSource);
}

- (PXGViewDecorationSource)viewDecorationSource
{
  return (PXGViewDecorationSource *)objc_loadWeakRetained((id *)&self->_viewDecorationSource);
}

- (double)textureScale
{
  return 1.0;
}

- (PXGSolidColorOverlayDecorationSource)solidColorOverlayDecorationSource
{
  return (PXGSolidColorOverlayDecorationSource *)objc_loadWeakRetained((id *)&self->_solidColorOverlayDecorationSource);
}

- (PXGHighlightDecorationSource)highlightDecorationSource
{
  return (PXGHighlightDecorationSource *)objc_loadWeakRetained((id *)&self->_highlightDecorationSource);
}

- (PXGDragDecorationSource)dragDecorationSource
{
  return (PXGDragDecorationSource *)objc_loadWeakRetained((id *)&self->_dragDecorationSource);
}

- (int64_t)decorationSizeClass
{
  return self->_decorationSizeClass;
}

- (PXGDebugDecorationSource)debugDecorationSource
{
  return (PXGDebugDecorationSource *)objc_loadWeakRetained((id *)&self->_debugDecorationSource);
}

- (unsigned)debugDecorationIndex
{
  return 2;
}

- (PXGAssetBadgeDecorationSource)assetProgressDecorationSource
{
  return (PXGAssetBadgeDecorationSource *)objc_loadWeakRetained((id *)&self->_assetProgressDecorationSource);
}

- (PXGAssetBadgeDecorationSource)assetBadgeDecorationSource
{
  return (PXGAssetBadgeDecorationSource *)objc_loadWeakRetained((id *)&self->_assetBadgeDecorationSource);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGDecoratingLayout.m"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (int64_t)focusRingType
{
  return self->_focusRingType;
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (int64_t)decoratingTypeForSpriteIndex:(unsigned int)a3
{
  return _DecorationTypeForIndex(-[PXGDecoratingLayout decorationIndexForSpriteIndex:](self, "decorationIndexForSpriteIndex:", *(_QWORD *)&a3));
}

- (void)_invalidateDecorationForSpriteRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4 invalidateSprites:(BOOL)a5
{
  id v8;
  BOOL v9;
  NSMutableIndexSet *invalidatedDecoratedSpriteIndexes;
  void *v11;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  $F40CD077B40800501ED060B808F886F7 *v14;
  unint64_t v15;
  unsigned int v16;
  _BOOL4 willPerformUpdate;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v21)
  {
    v9 = -[PXGDecoratingLayout spritesAreInSyncWithDecoratedLayout](self, "spritesAreInSyncWithDecoratedLayout");

    if (!v9)
      goto LABEL_19;
    if (!a5)
      goto LABEL_12;
    invalidatedDecoratedSpriteIndexes = self->_invalidatedDecoratedSpriteIndexes;
    -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableIndexSet addIndexesInRange:](invalidatedDecoratedSpriteIndexes, "addIndexesInRange:", 0, objc_msgSend(v11, "localNumberOfSprites"));

    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_11:
        p_updateFlags->needsUpdate = needsUpdate | 8;
LABEL_12:
        v14 = &self->_updateFlags;
        v15 = self->_updateFlags.needsUpdate;
        if (v15)
        {
          if (!self->_updateFlags.isPerformingUpdate)
            goto LABEL_17;
        }
        else if (!self->_updateFlags.isPerformingUpdate)
        {
          willPerformUpdate = self->_updateFlags.willPerformUpdate;
          v14->needsUpdate = 2;
          if (!willPerformUpdate)
            -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
          goto LABEL_18;
        }
        if ((self->_updateFlags.updated & 2) == 0)
        {
LABEL_17:
          v14->needsUpdate = v15 | 2;
LABEL_18:
          v16 = -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite");
          -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", (v16 * a3.location) | ((unint64_t)(v16 * a3.length) << 32), &__block_literal_global_207916);
          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout _invalidateDecorationForSpriteRange:inLayout:invalidateSprites:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXGDecoratingLayout.m"), 833, CFSTR("invalidating %lu after it already has been updated"), 2);
LABEL_26:

        abort();
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      v18 = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 8;
      if (!v18)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_12;
    }
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout _invalidateDecorationForSpriteRange:inLayout:invalidateSprites:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXGDecoratingLayout.m"), 830, CFSTR("invalidating %lu after it already has been updated"), 8);
      goto LABEL_26;
    }
    goto LABEL_11;
  }

LABEL_19:
}

- (BOOL)spritesAreInSyncWithDecoratedLayout
{
  _BOOL4 v3;

  v3 = -[PXGDecoratingLayout enabled](self, "enabled");
  if (v3)
    LOBYTE(v3) = (self->_updateFlags.needsUpdate & 4) == 0;
  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)sublayoutNeedsUpdate:(id)a3
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
  v10.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout sublayoutNeedsUpdate:](&v10, sel_sublayoutNeedsUpdate_, v4);
  if (!self->_isUpdatingDecoratedLayout)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout sublayoutNeedsUpdate:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGDecoratingLayout.m"), 734, CFSTR("invalidating %lu after it already has been updated"), 1);

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
LABEL_8:

}

- (void)sublayout:(id)a3 didApplySpriteChangeDetails:(id)a4 fromDescendentSublayout:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:](&v13, sel_sublayout_didApplySpriteChangeDetails_fromDescendentSublayout_, a3, v8, v9);
  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v9)
  {
    v11 = -[PXGDecoratingLayout spritesAreInSyncWithDecoratedLayout](self, "spritesAreInSyncWithDecoratedLayout");

    if (v11)
    {
      if (self->_isChangingDecoratedLayout)
        v12 = 0;
      else
        v12 = v8;
      -[PXGDecoratingLayout _applyDecoratedLayoutChangeDetails:](self, "_applyDecoratedLayoutChangeDetails:", v12);
    }
  }
  else
  {

  }
}

- (CGRect)sublayout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PXGLayout superlayout](self, "superlayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PXGLayout superlayout](self, "superlayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sublayout:visibleRectForRequestedVisibleRect:", v9, x, y, width, height);
    x = v12;
    y = v13;
    width = v14;
    height = v15;

  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

void __86__PXGDecoratingLayout__invalidateDecorationForSpriteRange_inLayout_invalidateSprites___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  _WORD *v6;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v6 = (_WORD *)(a5 + 32);
    do
    {
      if (*((_BYTE *)v6 - 31) != 2)
        ++*v6;
      v6 += 20;
      --v5;
    }
    while (v5);
  }
}

uint64_t __58__PXGDecoratingLayout__applyDecoratedLayoutChangeDetails___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  _WORD *v6;
  unint64_t v7;

  if (*(_BYTE *)(a1 + 44))
    v5 = HIDWORD(a2) == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = (_WORD *)(a5 + 32);
    v7 = HIDWORD(a2);
    do
    {
      if (*((_BYTE *)v6 - 31) != 2)
        ++*v6;
      v6 += 20;
      --v7;
    }
    while (v7);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 880), "addIndexesInRange:");
}

void __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9;
  double v10;
  unsigned int v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  float64x2_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float64_t v23;
  float64_t v24;
  BOOL v25;
  _BOOL4 v26;
  uint64_t v27;
  float32x2_t v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  float v38;
  float v39;
  float32x4_t v40;
  __int32 v41;
  unsigned int v42;
  unsigned int v43;
  float32x4_t v44;
  double v45;
  double v46;
  double v47;
  float32x2_t v48;
  float32x2_t v49;
  float v50;
  float v51;
  float v52;
  float32x2_t v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  void *v88;
  int v89;
  id WeakRetained;
  id v91;
  double v92;
  float v93;
  float v94;
  _OWORD *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  CGFloat v104;
  CGFloat v105;
  float32x4_t v106;
  float v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  float v113;
  float32x4_t v114;
  float32x4_t v115;
  float64x2_t v116;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform v121;

  v101 = a2;
  v9 = HIDWORD(a2);
  objc_msgSend(*(id *)(a1 + 32), "displayScale");
  v102 = v9;
  if (!(_DWORD)v9)
    return;
  v11 = 0;
  v12 = v10;
  v107 = v12;
  v108 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v109 = *MEMORY[0x1E0C9D820];
  v110 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v111 = *MEMORY[0x1E0C9D538];
  v106 = *(float32x4_t *)off_1E50B8248;
  do
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "assetBackgroundStyleForSpriteIndex:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(a1 + 32));
    if (!*(_DWORD *)(a1 + 152))
      goto LABEL_78;
    v14 = v13;
    v15 = 0;
    v103 = v11;
    v16 = v101 + v11;
    do
    {
      v17 = vcvtq_f64_f32(*(float32x2_t *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 24));
      v18 = *(void **)(a1 + 48);
      v26 = !v18
         || ((objc_msgSend(v18, "itemsLayout:insetForItem:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)), v20 = v19, v22 = v21, PXSizeAdd(), v17.f64[0] = v23, v17.f64[1] = v24, v20 == v109)? (v25 = v22 == v108): (v25 = 0), !v25)|| *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) != 0;
      v27 = *(unsigned int *)(*(_QWORD *)(a1 + 136) + 4 * v15);
      v28 = vcvt_f32_f64(vmlaq_f64(vcvtq_f64_f32(PXGDecorationSpriteSizeTransforms[2 * v27]), v17, vcvtq_f64_f32(PXGDecorationSpriteSizeTransforms[2 * v27 + 1])));
      *(float32x2_t *)(a3 + 24) = v28;
      v29 = (double *)((char *)&PXGDecorationSpriteRelativePositions + 24 * v27);
      v30 = *v29;
      v31 = v29[1];
      v32 = v29[2];
      v33 = (double *)((char *)&PXGDecorationSpriteRelativeOffset + 16 * v27);
      v34 = v33[1];
      if (*(_BYTE *)(a1 + 156))
        v35 = -v30;
      else
        v35 = v30;
      if (*(_BYTE *)(a1 + 156))
        v36 = -*v33;
      else
        v36 = *v33;
      v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
      v38 = *(float *)v37;
      v39 = *(float *)(v37 + 60);
      v40 = PXGDecorationSpriteRelativeCornerRadius[v27];
      v116 = v17;
      v113 = v28.f32[0];
      v112 = v36;
      if (v14)
      {
        v114 = PXGDecorationSpriteRelativeCornerRadius[v27];
        objc_msgSend(*(id *)(a1 + 40), "assetBackgroundCornerRadiusForSpriteIndex:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(a1 + 32));
        v44.i32[1] = v41;
        v40 = v114;
        v44.i64[1] = __PAIR64__(v43, v42);
      }
      else
      {
        v44 = *(float32x4_t *)(v37 + 36);
      }
      if (!*(_BYTE *)(a1 + 157))
        *(_BYTE *)(a5 + 1) = 8 * (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) + 1) != 0);
      v45 = v38;
      v46 = v39;
      v115 = vmulq_f32(v40, v44);
      if ((_DWORD)v27 == 2)
      {
        v47 = v32;
        objc_msgSend(*(id *)(a1 + 64), "overlayInsetsForSpriteIndex:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(a1 + 72));
        v50 = v49.f32[0] - v48.f32[0];
        v48.f32[1] = v51;
        v49.f32[1] = v52;
        v53 = vsub_f32(*(float32x2_t *)(a3 + 24), vadd_f32(v48, v49));
        *(float32x2_t *)(a3 + 24) = v53;
        v54 = v111 - (float)(v50 * 0.5);
        v55 = v110 - (float)((float)(v52 - v51) * 0.5);
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 968) == 2)
        {
          *(float32x2_t *)(a3 + 24) = vadd_f32(v53, (float32x2_t)0x4100000041000000);
          v115 = v106;
        }
        goto LABEL_42;
      }
      if ((_DWORD)v27 != 7)
      {
        v47 = v32;
        if ((_DWORD)v27 == 6)
        {
          PXRectWithCenterAndSize();
          v57 = v56;
          v59 = v58;
          v104 = v61;
          v105 = v60;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 920), "shadowForSpriteAtIndex:inLayout:", (v16 + v15));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (v62)
          {
            *(float32x2_t *)&v63 = PXGConfigureShadowSprite((float32x2_t *)a3, a4, a5, v62, *(void **)(a1 + 32), v57, v59, v105, v104);
            v64 = *(void **)(*(_QWORD *)(a1 + 32) + 928);
            if (v64)
              objc_msgSend(v64, "alphaForShadowAtSpriteIndex:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(a1 + 72), v63);
            else
              v65 = 1.0;
            v45 = v65 * v45;
          }
          else
          {
            v70 = *((_OWORD *)off_1E50B83A0 + 5);
            *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
            *(_OWORD *)(a4 + 80) = v70;
            v71 = *((_OWORD *)off_1E50B83A0 + 3);
            *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
            *(_OWORD *)(a4 + 48) = v71;
            v72 = *((_OWORD *)off_1E50B83A0 + 9);
            *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
            *(_OWORD *)(a4 + 144) = v72;
            v73 = *((_OWORD *)off_1E50B83A0 + 7);
            *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
            *(_OWORD *)(a4 + 112) = v73;
            v74 = *((_OWORD *)off_1E50B83A0 + 1);
            *(_OWORD *)a4 = *(_OWORD *)off_1E50B83A0;
            *(_OWORD *)(a4 + 16) = v74;
            *(_QWORD *)(a5 + 32) = *((_QWORD *)off_1E50B8398 + 4);
            v75 = *((_OWORD *)off_1E50B8398 + 1);
            *(_OWORD *)a5 = *(_OWORD *)off_1E50B8398;
            *(_OWORD *)(a5 + 16) = v75;
          }

        }
        else if ((_DWORD)v27 == 3)
        {
          *(_BYTE *)a5 = 1;
        }
        goto LABEL_41;
      }
      *(_BYTE *)a5 = 1;
      v47 = v32;
      if (!objc_msgSend(*(id *)(a1 + 80), "hasTapbacksForSpriteIndex:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(a1 + 72)))
      {
        v45 = 0.0;
LABEL_41:
        v55 = v110;
        v54 = v111;
        goto LABEL_42;
      }
      objc_msgSend(*(id *)(a1 + 80), "tapbackConfigurationForProposedConfiguration:spriteIndex:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(a1 + 72), v45, v39, 0.0, 0.0);
      v46 = v66;
      v54 = v67;
      v55 = v68;
      v45 = v69;
      if (v69 > 0.0)
        *(_BYTE *)(a5 + 1) = 8;
LABEL_42:
      v76 = v112 * v113 + (v116.f64[0] - v113) * v35;
      v77 = v34 * *(float *)(a3 + 28) + (v116.f64[1] - *(float *)(a3 + 28)) * v31;
      if ((_DWORD)v27 == 6)
      {
        v78 = v76 + **(double **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        v79 = v77 + *(double *)(a3 + 8);
      }
      else
      {
        memset(&v121, 0, sizeof(v121));
        CGAffineTransformMakeTranslation(&v120, v76, v77);
        v80 = *(_QWORD *)(a1 + 120);
        CGAffineTransformMakeScale(&t1, *(float *)(*(_QWORD *)(*(_QWORD *)(v80 + 8) + 24) + 60), *(float *)(*(_QWORD *)(*(_QWORD *)(v80 + 8) + 24) + 60));
        CGAffineTransformMakeRotation(&t2, *(float *)(*(_QWORD *)(*(_QWORD *)(v80 + 8) + 24) + 56));
        CGAffineTransformConcat(&v119, &t1, &t2);
        CGAffineTransformConcat(&v121, &v120, &v119);
        *(double *)a3 = **(double **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + v121.tx;
        *(double *)(a3 + 8) = *(double *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 8) + v121.ty;
        v78 = *(double *)a3;
        v79 = *(double *)(a3 + 8);
      }
      v81 = v54 + v78;
      v82 = v55 + v79;
      *(double *)a3 = v81;
      *(double *)(a3 + 8) = v55 + v79;
      v83 = v47 + *(double *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 16);
      *(double *)(a3 + 16) = v83;
      *(_DWORD *)(a4 + 80) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) + 80);
      if ((_DWORD)v27 == 2)
      {
        v84 = *(_QWORD *)(a1 + 32);
        v85 = *(_QWORD *)(v84 + 968);
        if ((unint64_t)(v85 - 1) <= 1)
        {
          if ((*(_BYTE *)(v84 + 976) & 1) != 0)
          {
            v86 = v83 + -0.1;
            goto LABEL_61;
          }
          if (v85 == 1)
          {
            v86 = -0.95;
LABEL_61:
            *(double *)(a3 + 16) = v86;
            v84 = *(_QWORD *)(a1 + 32);
          }
        }
        WeakRetained = objc_loadWeakRetained((id *)(v84 + 1032));
        if (WeakRetained)
        {
          v91 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1032));
          objc_msgSend(v91, "solidColorOverlayAlphaForSpriteIndex:inLayout:", (v16 + v15) / *(_DWORD *)(a1 + 152), *(_QWORD *)(a1 + 72));
          v87 = v92;

        }
        else
        {
          v87 = 1.0;
        }

        goto LABEL_66;
      }
      v87 = 1.0;
      if ((_DWORD)v27 == 5)
      {
        if (v26)
        {
          if (v14)
          {
            *(_BYTE *)(a5 + 1) = 2;
            *(_WORD *)(a5 + 32) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) + 32);
            if (PXFloatApproximatelyEqualToFloat())
            {
              objc_msgSend(*(id *)(a1 + 72), "hiddenSpriteIndexes");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v88, "containsIndex:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));

              if (v89)
                v45 = 1.0;
            }
          }
          else
          {
            *(_BYTE *)(a5 + 1) = 0;
          }
        }
      }
      else if ((_DWORD)v27 == 3 && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 912))
      {
        *(float *)(a3 + 28) = *(float *)(a3 + 28) + 18.0;
        *(double *)(a3 + 8) = v82 + 9.0;
      }
LABEL_66:
      *(_DWORD *)(a4 + 56) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) + 56);
      v93 = v87 * (v45 * *(double *)(a1 + 144));
      *(float *)a4 = v93;
      *(_OWORD *)(a4 + 20) = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) + 20);
      *(float32x4_t *)(a4 + 36) = v115;
      v94 = v46;
      *(float *)(a4 + 60) = v94;
      v95 = *(_OWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
      v96 = v95[6];
      v97 = v95[7];
      v98 = v95[9];
      *(_OWORD *)(a4 + 128) = v95[8];
      *(_OWORD *)(a4 + 144) = v98;
      *(_OWORD *)(a4 + 96) = v96;
      *(_OWORD *)(a4 + 112) = v97;
      if ((_DWORD)v27 != 6)
      {
        if (*(_BYTE *)(a1 + 158)
          || (v100 = *(_QWORD *)(a5 + 8), *(float *)&v100 == 0.0)
          || *((float *)&v100 + 1) == 0.0)
        {
          *(float32x2_t *)(a5 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 24), v107);
        }
      }
      v99 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) + 24);
      *(_QWORD *)(a5 + 24) = v99;
      if (v99)
      {
        if (!(_BYTE)v99)
          *(_BYTE *)(a5 + 24) = v27 + 1;
      }
      a3 += 32;
      a4 += 160;
      a5 += 40;
      ++v15;
    }
    while (v15 < *(unsigned int *)(a1 + 152));
    v11 = v103 + v15;
LABEL_78:
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) += 32;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) += 160;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) += 40;
  }
  while (v11 < v102);
}

- (void)setDecorationSource:(id)a3
{
  id WeakRetained;
  void *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_decorationSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_decorationSource, obj);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 2;
LABEL_8:
        v5 = obj;
        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 2;
      v5 = obj;
      if (willPerformUpdate)
        goto LABEL_9;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout setDecorationSource:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGDecoratingLayout.m"), 241, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)setContentSource:(id)a3
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
  v10.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout setContentSource:](&v10, sel_setContentSource_, v4);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout setContentSource:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGDecoratingLayout.m"), 233, CFSTR("invalidating %lu after it already has been updated"), 2);

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
LABEL_7:

}

- (void)_updateDecoratedLayout
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v15 = v4;
    if (self->_isUpdatingDecoratedLayout)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDecoratingLayout.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isUpdatingDecoratedLayout"));

    }
    self->_isUpdatingDecoratedLayout = 1;
    -[PXGLayout viewEnvironment](self, "viewEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setViewEnvironment:", v5);

    -[PXGLayout referenceSize](self, "referenceSize");
    objc_msgSend(v15, "setReferenceSize:");
    -[PXGLayout referenceDepth](self, "referenceDepth");
    objc_msgSend(v15, "setReferenceDepth:");
    -[PXGLayout visibleRect](self, "visibleRect");
    objc_msgSend(v15, "setVisibleRect:");
    -[PXGLayout displayScale](self, "displayScale");
    objc_msgSend(v15, "setDisplayScale:");
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    objc_msgSend(v15, "setSafeAreaInsets:");
    objc_msgSend(v15, "setUserInterfaceDirection:", -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection"));
    objc_msgSend(v15, "createAnchorFromSuperlayoutWithSublayoutIndex:sublayoutPositionEdges:ignoringScrollingAnimationAnchors:", 0, 15, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "autoInvalidate");

    objc_msgSend(v15, "updateIfNeeded");
    objc_msgSend(v15, "contentSize");
    v9 = v8;
    v11 = v10;
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "geometries");

    *(_OWORD *)(v13 + 48) = *(_OWORD *)off_1E50B8308;
    *(_QWORD *)(v13 + 64) = *((_QWORD *)off_1E50B8308 + 2);
    *(double *)(v13 + 32) = v9;
    *(double *)(v13 + 40) = v11;
    -[PXGLayout setContentSize:](self, "setContentSize:", v9, v11);
    objc_msgSend(v15, "visibleRect");
    -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:");
    v4 = v15;
    self->_isUpdatingDecoratedLayout = 0;
  }

}

- (void)safeAreaInsetsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v8, sel_safeAreaInsetsDidChange);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout safeAreaInsetsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGDecoratingLayout.m"), 719, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)referenceSizeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout referenceSizeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGDecoratingLayout.m"), 701, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGDecoratingLayout.m"), 714, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (double)lastBaseline
{
  void *v2;
  double v3;
  double v4;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastBaseline");
  v4 = v3;

  return v4;
}

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout sublayoutDidChangeLastBaseline:](&v5, sel_sublayoutDidChangeLastBaseline_, a3);
  -[PXGLayout superlayout](self, "superlayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sublayoutDidChangeLastBaseline:", self);

}

- (void)sublayoutDidChangeContentSize:(id)a3
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
  v10.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout sublayoutDidChangeContentSize:](&v10, sel_sublayoutDidChangeContentSize_, v4);
  if (!self->_isUpdatingDecoratedLayout)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout sublayoutDidChangeContentSize:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGDecoratingLayout.m"), 741, CFSTR("invalidating %lu after it already has been updated"), 1);

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
LABEL_8:

}

uint64_t __58__PXGDecoratingLayout__applyDecoratedLayoutChangeDetails___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  if (HIDWORD(a2))
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = (_OWORD *)(*(_QWORD *)(a3 + 24) + v4);
      v6 = *(_OWORD *)(a1 + 48);
      *v5 = *(_OWORD *)(a1 + 32);
      v5[1] = v6;
      v7 = *(_OWORD *)(a1 + 64);
      v8 = *(_OWORD *)(a1 + 80);
      v9 = *(_OWORD *)(a1 + 112);
      v5[4] = *(_OWORD *)(a1 + 96);
      v5[5] = v9;
      v5[2] = v7;
      v5[3] = v8;
      v10 = *(_OWORD *)(a1 + 128);
      v11 = *(_OWORD *)(a1 + 144);
      v12 = *(_OWORD *)(a1 + 176);
      v5[8] = *(_OWORD *)(a1 + 160);
      v5[9] = v12;
      v5[6] = v10;
      v5[7] = v11;
      v13 = *(_QWORD *)(a3 + 32) + v3;
      v14 = *(_OWORD *)(a1 + 200);
      v15 = *(_OWORD *)(a1 + 216);
      *(_QWORD *)(v13 + 32) = *(_QWORD *)(a1 + 232);
      *(_OWORD *)v13 = v14;
      *(_OWORD *)(v13 + 16) = v15;
      v4 += 160;
      v3 += 40;
    }
    while (160 * HIDWORD(a2) != v4);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 192) + 880), "addIndexesInRange:");
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGDecoratingLayout.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGDecoratingLayout.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGDecoratingLayout _updateDecoratedLayout](self, "_updateDecoratedLayout");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout update]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXGDecoratingLayout.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXGDecoratingLayout _updateDecorationSources](self, "_updateDecorationSources");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGDecoratingLayout.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXGDecoratingLayout _updateReloadSprites](self, "_updateReloadSprites");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGDecoratingLayout.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXGDecoratingLayout _updateDecorationSprites](self, "_updateDecorationSprites");
      v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXGDecoratingLayout.m"), 283, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout update](&v18, sel_update);
}

- (void)_updateDecorationSprites
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  id v11;
  char v12;
  char v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSMutableIndexSet *invalidatedDecoratedSpriteIndexes;
  BOOL v20;
  unsigned int *activeDecorationSpriteIndexes;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  PXGDecoratingLayout *v27;
  id v28;
  id v29;
  id v30;
  unsigned int *v31;
  uint64_t v32;
  unsigned int v33;
  BOOL v34;
  char v35;
  char v36;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22
    && -[NSMutableIndexSet count](self->_invalidatedDecoratedSpriteIndexes, "count")
    && -[PXGDecoratingLayout enabled](self, "enabled"))
  {
    v3 = -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite");
    if (v3)
    {
      v4 = v3;
      -[PXGLayout alpha](self, "alpha");
      v6 = v5;
      activeDecorationSpriteIndexes = self->_activeDecorationSpriteIndexes;
      v20 = -[PXGDecoratingLayout scrollableAxis](self, "scrollableAxis") == 2
         && -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection") == 1;
      -[PXGDecoratingLayout itemsLayout](self, "itemsLayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insetDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_assetBackgroundDecorationSource);
      v10 = objc_loadWeakRetained((id *)&self->_selectionDecorationSource);
      v11 = objc_loadWeakRetained((id *)&self->_tapbackDecorationSource);
      v12 = objc_msgSend(v22, "shouldDecorateUndefinedMediaKind");
      v13 = objc_msgSend(v22, "shouldUpdateDecorationMediaTargetSizes");
      invalidatedDecoratedSpriteIndexes = self->_invalidatedDecoratedSpriteIndexes;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke;
      v23[3] = &unk_1E51364B8;
      v24 = v22;
      v25 = v7;
      v26 = WeakRetained;
      v27 = self;
      v33 = v4;
      v34 = v20;
      v35 = v12;
      v28 = v8;
      v29 = v10;
      v30 = v11;
      v31 = activeDecorationSpriteIndexes;
      v32 = v6;
      v36 = v13;
      v14 = v11;
      v15 = v10;
      v16 = v8;
      v17 = WeakRetained;
      v18 = v7;
      -[NSMutableIndexSet enumerateRangesUsingBlock:](invalidatedDecoratedSpriteIndexes, "enumerateRangesUsingBlock:", v23);
      -[NSMutableIndexSet removeAllIndexes](self->_invalidatedDecoratedSpriteIndexes, "removeAllIndexes");

    }
    else
    {
      -[NSMutableIndexSet removeAllIndexes](self->_invalidatedDecoratedSpriteIndexes, "removeAllIndexes");
    }
  }

}

- (int64_t)scrollableAxis
{
  void *v2;
  int64_t v3;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scrollableAxis");

  return v3;
}

- (id)itemsLayout
{
  void *v2;
  void *v3;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemsLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateDecorationSources
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGLayout contentSource](self, "contentSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGDecoratingLayout decorationSource](self, "decorationSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v30, "contentSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  v8 = v7;
  if ((objc_msgSend(v8, "wantsAssetBadgeDecorationsInLayout:", v30) & 1) == 0)
  {

LABEL_10:
    v9 = 0;
    v8 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = v8;
    v8 = v9;
  }
  else
  {
    v9 = 0;
  }
LABEL_11:
  objc_storeWeak((id *)&self->_assetBadgeDecorationSource, v8);
  objc_storeWeak((id *)&self->_assetProgressDecorationSource, v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_storeWeak((id *)&self->_assetBackgroundDecorationSource, v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = v7;
    self->_wantsCaptionDecorations = objc_msgSend(v10, "wantsCaptionDecorationsInLayout:", v30);
  }
  else
  {
    v10 = 0;
  }
  objc_storeWeak((id *)&self->_captionDecorationSource, v10);
  v28 = v9;
  v29 = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = v7;
    v12 = objc_msgSend(v11, "selectionDecorationStyleInLayout:", v30);
    v13 = objc_msgSend(v11, "selectionDecorationAdditionsInLayout:", v30);
    if (v12 | v13)
    {
      v14 = v13;
      goto LABEL_22;
    }

  }
  v11 = 0;
  v12 = 0;
  v14 = 0;
LABEL_22:
  objc_storeWeak((id *)&self->_selectionDecorationSource, v11);
  self->_selectionDecorationStyle = v12;
  self->_selectionDecorationOptions = v14;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    v15 = v3;
  else
    v15 = 0;
  objc_storeStrong((id *)&self->_shadowSource, v15);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = v3;
  else
    v16 = 0;
  objc_storeStrong((id *)&self->_shadowDecorationSource, v16);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = v7;
  else
    v17 = 0;
  objc_storeWeak((id *)&self->_highlightDecorationSource, v17);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = v7;
  else
    v18 = 0;
  objc_storeWeak((id *)&self->_solidColorOverlayDecorationSource, v18);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = objc_msgSend(v7, "focusRingTypeInLayout:", v30);
  else
    v19 = 1;
  self->_focusRingType = v19;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = v7;
  else
    v20 = 0;
  objc_storeWeak((id *)&self->_dragDecorationSource, v20);
  v26 = v15;
  v27 = v10;
  v25 = v16;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = v7;
    if ((objc_msgSend(v21, "wantsDebugDecorationInLayout:", v30, v16, v15, v27, v28, v29) & 1) != 0)
      goto LABEL_46;

  }
  v21 = 0;
LABEL_46:
  objc_storeWeak((id *)&self->_debugDecorationSource, v21);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = v7;
  else
    v22 = 0;
  objc_storeWeak((id *)&self->_viewDecorationSource, v22);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v7, "wantsTapbackDecorationInLayout:", v30))
  {
    v23 = v3;
    v24 = v7;
  }
  else
  {
    v23 = v3;
    v24 = 0;
  }
  objc_storeWeak((id *)&self->_tapbackDecorationSource, v24);

}

- (PXGLayoutContentSource)decorationSource
{
  return (PXGLayoutContentSource *)objc_loadWeakRetained((id *)&self->_decorationSource);
}

void __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  __int16 v33;
  char v34;
  _QWORD v35[3];
  char v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[3];
  uint64_t v41;
  _QWORD v42[3];
  int v43;

  v12 = a7;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = a2;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v41 = objc_msgSend(*(id *)(a1 + 32), "itemForSpriteIndex:", a2);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = a4;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = a5;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = a6;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v36 = objc_msgSend(*(id *)(a1 + 40), "wantsBackgroundForZeroInset");
  v13 = (*(_DWORD *)(a1 + 104) * a2) | ((unint64_t)(*(_DWORD *)(a1 + 104)
                                                                                     * HIDWORD(a2)) << 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke_3;
  v16[3] = &unk_1E5136468;
  v14 = *(void **)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = v14;
  v24 = v42;
  v25 = v39;
  v32 = *(_DWORD *)(a1 + 104);
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 32);
  v26 = v40;
  v27 = v35;
  v15 = *(_QWORD *)(a1 + 88);
  v33 = *(_WORD *)(a1 + 108);
  v28 = v38;
  v29 = v37;
  v30 = v15;
  v21 = *(id *)(a1 + 64);
  v22 = *(id *)(a1 + 72);
  v23 = *(id *)(a1 + 80);
  v31 = *(_QWORD *)(a1 + 96);
  v34 = *(_BYTE *)(a1 + 110);
  objc_msgSend(v17, "modifySpritesInRange:state:", v13, v16);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

}

- (void)_applyDecoratedLayoutChangeDetails:(id)a3
{
  void *v4;
  unsigned int v5;
  char v6;
  char v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  int v20;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  unsigned int v28;
  char v29;
  _QWORD v30[4];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  PXGDecoratingLayout *v41;
  char v42;
  char v43;
  _BYTE v44[14];
  int v45;
  __int128 v46;
  int v47;
  unsigned int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXGDecoratingLayout enabled](self, "enabled");
  if (v26)
    v6 = v5;
  else
    v6 = 0;
  v7 = objc_msgSend(v4, "shouldInvalidateDecorationForModifiedSprites");
  if (v5)
    v5 = -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite");
  v8 = objc_msgSend(v4, "localNumberOfSprites") * v5;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v26, "applyToIndexSet:", self->_invalidatedDecoratedSpriteIndexes);
    objc_msgSend(v26, "changeDetailsShiftedBy:scaledBy:", 0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
    v11 = objc_alloc((Class)off_1E50B1608);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v11, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v12, v13, 0, 0, 0);

    -[NSMutableIndexSet removeAllIndexes](self->_invalidatedDecoratedSpriteIndexes, "removeAllIndexes");
  }
  v14 = *((_OWORD *)off_1E50B83A0 + 7);
  v37 = *((_OWORD *)off_1E50B83A0 + 6);
  v38 = v14;
  v15 = *((_OWORD *)off_1E50B83A0 + 9);
  v39 = *((_OWORD *)off_1E50B83A0 + 8);
  v40 = v15;
  v16 = *((_OWORD *)off_1E50B83A0 + 3);
  v33 = *((_OWORD *)off_1E50B83A0 + 2);
  v34 = v16;
  v17 = *((_OWORD *)off_1E50B83A0 + 5);
  v35 = *((_OWORD *)off_1E50B83A0 + 4);
  v36 = v17;
  v18 = *((_OWORD *)off_1E50B83A0 + 1);
  v31 = *(_OWORD *)off_1E50B83A0;
  v32 = v18;
  v19 = *(_BYTE *)off_1E50B8398;
  *(_QWORD *)v44 = *(_QWORD *)((char *)off_1E50B8398 + 2);
  *(_QWORD *)&v44[6] = *((_QWORD *)off_1E50B8398 + 1);
  v46 = *(_OWORD *)((char *)off_1E50B8398 + 20);
  v20 = *((_DWORD *)off_1E50B8398 + 9);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __58__PXGDecoratingLayout__applyDecoratedLayoutChangeDetails___block_invoke;
  v30[3] = &unk_1E51364E0;
  v42 = v19;
  v43 = 8;
  v47 = v20;
  v45 = 1065353216;
  v41 = self;
  v48 = v5;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __58__PXGDecoratingLayout__applyDecoratedLayoutChangeDetails___block_invoke_2;
  v27[3] = &unk_1E5136508;
  v29 = v7;
  v27[4] = self;
  v28 = v5;
  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v9, v8, v30, v27);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_14:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      goto LABEL_15;
    }
LABEL_13:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout _applyDecoratedLayoutChangeDetails:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PXGDecoratingLayout.m"), 809, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_14;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_13;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_15:

}

void __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __int16 v22;
  char v23;

  v4 = a2 | ((unint64_t)a3 << 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__PXGDecoratingLayout__updateDecorationSprites__block_invoke_2;
  v11[3] = &unk_1E5136490;
  v5 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v13 = v6;
  v14 = v7;
  v21 = *(_DWORD *)(a1 + 104);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 88);
  v15 = v9;
  v19 = v10;
  v22 = *(_WORD *)(a1 + 108);
  v16 = *(id *)(a1 + 72);
  v17 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 80);
  v20 = *(_QWORD *)(a1 + 96);
  v23 = *(_BYTE *)(a1 + 110);
  objc_msgSend(v5, "enumerateSpritesInRange:usingBlock:", v4, v11);

}

- (void)visibleRectDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout visibleRectDidChange](&v8, sel_visibleRectDidChange);
  if (!self->_isUpdatingDecoratedLayout)
  {
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout visibleRectDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGDecoratingLayout.m"), 708, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (PXGDecoratingLayout)initWithDecoratedLayout:(id)a3
{
  id v4;
  PXGDecoratingLayout *v5;

  v4 = a3;
  v5 = -[PXGDecoratingLayout init](self, "init");
  -[PXGDecoratingLayout setDecoratedLayout:](v5, "setDecoratedLayout:", v4);

  return v5;
}

- (void)setDecoratedLayout:(id)a3
{
  PXGLayout *v5;
  PXGLayout *decoratedLayout;
  PXGLayout *v7;
  void *v8;
  PXGLayout *v9;

  v5 = (PXGLayout *)a3;
  decoratedLayout = self->_decoratedLayout;
  if (decoratedLayout != v5)
  {
    v9 = v5;
    v7 = decoratedLayout;
    objc_storeStrong((id *)&self->_decoratedLayout, a3);
    self->_isChangingDecoratedLayout = 1;
    if (v7)
      -[PXGLayout removeSublayoutAtIndex:](self, "removeSublayoutAtIndex:", 0);
    if (v9)
      -[PXGDecoratingLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", v9, 0);
    self->_isChangingDecoratedLayout = 0;
    -[PXGLayout superlayout](self, "superlayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sublayoutDidChangeLastBaseline:", self);

    -[PXGLayout setNeedsUpdateOfScrollableAxis](self, "setNeedsUpdateOfScrollableAxis");
    v5 = v9;
  }

}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v7;
  BOOL isChangingDecoratedLayout;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  objc_super v14;

  v7 = a3;
  isChangingDecoratedLayout = self->_isChangingDecoratedLayout;
  if (!a4)
  {
    self->_isChangingDecoratedLayout = 1;
    objc_storeStrong((id *)&self->_decoratedLayout, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout insertSublayout:atIndex:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGDecoratingLayout.m"), 225, CFSTR("invalidating %lu after it already has been updated"), 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 3;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:
  v14.receiver = self;
  v14.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout insertSublayout:atIndex:](&v14, sel_insertSublayout_atIndex_, v7, a4);
  self->_isChangingDecoratedLayout = isChangingDecoratedLayout;

}

- (PXGDecoratingLayout)init
{
  PXGDecoratingLayout *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *invalidatedDecoratedSpriteIndexes;
  unsigned int *v5;
  unint64_t v6;
  uint64_t i;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGDecoratingLayout;
  v2 = -[PXGLayout init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    invalidatedDecoratedSpriteIndexes = v2->_invalidatedDecoratedSpriteIndexes;
    v2->_invalidatedDecoratedSpriteIndexes = v3;

    v2->_activeDecorationsCount = 5;
    v5 = (unsigned int *)malloc_type_calloc(5uLL, 4uLL, 0x100004052888210uLL);
    v2->_activeDecorationSpriteIndexes = v5;
    if (v2->_activeDecorationsCount)
    {
      v6 = 0;
      do
        v5[v6++] = 0;
      while (v6 < v2->_activeDecorationsCount);
    }
    for (i = 0; i != 5; ++i)
      v2->_activeDecorationSpriteIndexes[i] = i;
    v2->_enabled = 1;
    v2->_focusRingType = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_activeDecorationSpriteIndexes);
  v3.receiver = self;
  v3.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PXGDecoratingLayout;
  -[PXGDecoratingLayout description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_stringByAppendingDescriptionDetailsWithFormat:", CFSTR(", decoratedLayout=<%@: %p>"), v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0xC;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xC) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout setEnabled:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGDecoratingLayout.m"), 208, CFSTR("invalidating %lu after it already has been updated"), 12);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 12;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  BOOL isChangingDecoratedLayout;
  objc_super v5;

  isChangingDecoratedLayout = self->_isChangingDecoratedLayout;
  if (!a3.location)
    self->_isChangingDecoratedLayout = 1;
  v5.receiver = self;
  v5.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout removeSublayoutsInRange:](&v5, sel_removeSublayoutsInRange_);
  self->_isChangingDecoratedLayout = isChangingDecoratedLayout;
}

- (void)_updateReloadSprites
{
  NSMutableIndexSet *pendingActiveDecorationSpriteIndexes;
  uint64_t v5;
  NSMutableIndexSet *v6;
  NSMutableIndexSet *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[3];
  int v11;

  pendingActiveDecorationSpriteIndexes = self->_pendingActiveDecorationSpriteIndexes;
  if (pendingActiveDecorationSpriteIndexes)
  {
    v5 = -[NSMutableIndexSet count](pendingActiveDecorationSpriteIndexes, "count");
    if (v5
      && (unint64_t)-[NSMutableIndexSet lastIndex](self->_pendingActiveDecorationSpriteIndexes, "lastIndex") >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDecoratingLayout.m"), 450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pendingCount == 0 || _pendingActiveDecorationSpriteIndexes.lastIndex < PXGDecoratingLayoutMaxNumberOfDecoratingSpritesPerDecoratedSprite"));

    }
    if (v5 != self->_activeDecorationsCount)
    {
      self->_activeDecorationsCount = v5;
      _PXGArrayResize();
    }
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v6 = self->_pendingActiveDecorationSpriteIndexes;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__PXGDecoratingLayout__updateReloadSprites__block_invoke;
    v9[3] = &unk_1E5136440;
    v9[4] = self;
    v9[5] = v10;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](v6, "enumerateIndexesUsingBlock:", v9);
    v7 = self->_pendingActiveDecorationSpriteIndexes;
    self->_pendingActiveDecorationSpriteIndexes = 0;

    _Block_object_dispose(v10, 8);
  }
  -[PXGDecoratingLayout _applyDecoratedLayoutChangeDetails:](self, "_applyDecoratedLayoutChangeDetails:", 0);
}

- (void)alphaDidChange
{
  NSMutableIndexSet *invalidatedDecoratedSpriteIndexes;
  void *v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout alphaDidChange](&v10, sel_alphaDidChange);
  invalidatedDecoratedSpriteIndexes = self->_invalidatedDecoratedSpriteIndexes;
  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableIndexSet addIndexesInRange:](invalidatedDecoratedSpriteIndexes, "addIndexesInRange:", 0, objc_msgSend(v4, "localNumberOfSprites"));

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
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout alphaDidChange]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGDecoratingLayout.m"), 688, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)viewEnvironmentWillChange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v9;
  _BOOL4 willPerformUpdate;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout viewEnvironmentWillChange:](&v13, sel_viewEnvironmentWillChange_, v4);
  -[PXGLayout viewEnvironment](self, "viewEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEqualAppearanceTo:", v4);

  if ((v6 & 1) == 0)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
LABEL_8:
        -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidateDecoration");

        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout viewEnvironmentWillChange:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGDecoratingLayout.m"), 694, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)userInterfaceDirectionDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGDecoratingLayout;
  -[PXGLayout userInterfaceDirectionDidChange](&v8, sel_userInterfaceDirectionDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 9;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 9) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout userInterfaceDirectionDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGDecoratingLayout.m"), 724, CFSTR("invalidating %lu after it already has been updated"), 9);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 9;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (BOOL)definesContextForPointReferences
{
  return 0;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  objc_super v16;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "decoratedSpriteReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "spriteIndexForSpriteReference:options:", v11, a4);

    v13 = -1;
    if (v10 && v12 != -1)
    {
      v14 = -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite");
      v13 = _DecorationIndexForType(objc_msgSend(v9, "decorationType")) + v14 * v12;
      if (v13 >= -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"))
        v13 = -1;
      else
        *a5 = objc_retainAutorelease(v9);
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PXGDecoratingLayout;
    v13 = -[PXGLayout spriteIndexForObjectReference:options:updatedObjectReference:](&v16, sel_spriteIndexForObjectReference_options_updatedObjectReference_, v8, a4, a5);
  }

  return v13;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  v8 = objc_retainAutorelease(a3);
  *a5 = v8;
  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXGDecoratingLayout;
    v10 = -[PXGLayout sublayoutIndexForObjectReference:options:updatedObjectReference:](&v12, sel_sublayoutIndexForObjectReference_options_updatedObjectReference_, v8, a4, a5);
  }

  return (int64_t)v10;
}

- (id)layoutForItemChanges
{
  void *v2;
  void *v3;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutForItemChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentDataSourceChange
{
  void *v2;
  void *v3;

  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDataSourceChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLastBaseline:(double)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDecoratingLayout.m"), 880, CFSTR("baseline shouldn't be set on %@, did you mean to set it on %@ instead?"), self, v6);

  abort();
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  PXGHitTestResult *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  void *v15;
  PXGHitTestResult *v16;
  void *v17;

  v3 = *(_QWORD *)&a3;
  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if ((_DWORD)v3 != -1 && v5)
  {
    v8 = -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", v3, v5);
    if ((_DWORD)v8 == -1)
    {
      if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") <= v3)
        goto LABEL_11;
      v11 = v3
          % -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite");
      v12 = v3
          / -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite");
      v13 = -[PXGDecoratingLayout allowsViewDecorationHitTesting](self, "allowsViewDecorationHitTesting");
      v14 = self->_activeDecorationSpriteIndexes[v11];
      if (v13 && v14 == 3)
      {
        -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:", v3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [PXGHitTestResult alloc];
        objc_msgSend(v6, "objectReferenceForSpriteIndex:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:](v16, "initWithSpriteReference:layout:identifier:userData:", v15, self, CFSTR("PXGHitTestUserDataIdentifierDecorationView"), v17);

        goto LABEL_12;
      }
      if (v14 == 6)
      {
LABEL_11:
        v7 = 0;
        goto LABEL_12;
      }
      v10 = v6;
      v9 = v12;
    }
    else
    {
      v9 = v8;
      v10 = v6;
    }
    objc_msgSend(v10, "hitTestResultForSpriteIndex:", v9);
    v7 = (PXGHitTestResult *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v7;
}

- (unsigned)spriteIndexForDecorationIndex:(unsigned int)a3 decoratingSpriteIndex:(unsigned int)a4
{
  unsigned int v6;

  v6 = -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite")* a4;
  if (v6 >= -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"))
    return -1;
  else
    return v6 + a3;
}

- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4
{
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v8 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v9 = a3;
  if (v8 > a3)
  {
    v10 = a3
        / -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite");
    -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDecoratingLayout.m"), 933, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("decoratedLayout != nil"));

    }
    v9 = -[PXGLayout convertSpriteIndex:fromDescendantLayout:](self, "convertSpriteIndex:fromDescendantLayout:", v10, v11);

  }
  if (a4)
    *a4 = v9;
  return v8 > a3;
}

- (PXGItemsGeometry)itemsGeometry
{
  void *v2;
  void *v3;

  -[PXGDecoratingLayout itemsLayout](self, "itemsLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemsGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGItemsGeometry *)v3;
}

- (BOOL)canHandleVisibleRectRejection
{
  void *v2;
  char v3;

  -[PXGDecoratingLayout itemsLayout](self, "itemsLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canHandleVisibleRectRejection");

  return v3;
}

- (void)setActiveDecorations:(id)a3
{
  id v4;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *pendingActiveDecorationSpriteIndexes;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
  pendingActiveDecorationSpriteIndexes = self->_pendingActiveDecorationSpriteIndexes;
  self->_pendingActiveDecorationSpriteIndexes = v5;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableIndexSet addIndex:](self->_pendingActiveDecorationSpriteIndexes, "addIndex:", _DecorationIndexForType(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "integerValue")));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_13:
      p_updateFlags->needsUpdate = needsUpdate | 0xC;
      goto LABEL_14;
    }
LABEL_12:
    if ((self->_updateFlags.updated & 0xC) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGDecoratingLayout setActiveDecorations:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXGDecoratingLayout.m"), 967, CFSTR("invalidating %lu after it already has been updated"), 12);

      abort();
    }
    goto LABEL_13;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_12;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 12;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_14:

}

- (void)addActiveDecorations:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "count");
  v5 = v9;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v9, "mutableCopy");
    if (self->_activeDecorationsCount)
    {
      v7 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", _DecorationTypeForIndex(self->_activeDecorationSpriteIndexes[v7]));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

        ++v7;
      }
      while (v7 < self->_activeDecorationsCount);
    }
    -[PXGDecoratingLayout setActiveDecorations:](self, "setActiveDecorations:", v6);

    v5 = v9;
  }

}

- (unsigned)decoratedIndexForDecoratingIndex:(unsigned int)a3
{
  return a3
       / -[PXGDecoratingLayout numberOfDecoratingSpritesPerDecoratedSprite](self, "numberOfDecoratingSpritesPerDecoratedSprite");
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  __int128 *v9;
  __int128 v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;
  _OWORD v22[10];
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
  uint64_t v33;

  v3 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") > v3
    && -[PXGDecoratingLayout decorationIndexForSpriteIndex:](self, "decorationIndexForSpriteIndex:", v3) == 3)
  {
    +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkOutReusableObjectWithReuseIdentifier:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v5);
    v9 = (__int128 *)(objc_msgSend(v8, "geometries") + 32 * v3);
    v10 = v9[1];
    v20 = *v9;
    v21 = v10;
    v11 = (__int128 *)(objc_msgSend(objc_retainAutorelease(v8), "styles") + 160 * v3);
    v12 = v11[7];
    v29 = v11[6];
    v30 = v12;
    v13 = v11[9];
    v31 = v11[8];
    v32 = v13;
    v14 = v11[3];
    v25 = v11[2];
    v26 = v14;
    v15 = v11[5];
    v27 = v11[4];
    v28 = v15;
    v16 = v11[1];
    v23 = *v11;
    v24 = v16;
    objc_msgSend(v7, "setSpriteIndex:", v3);
    v19[0] = v20;
    v19[1] = v21;
    objc_msgSend(v7, "setSpriteGeometry:", v19);
    v22[6] = v29;
    v22[7] = v30;
    v22[8] = v31;
    v22[9] = v32;
    v22[2] = v25;
    v22[3] = v26;
    v22[4] = v27;
    v22[5] = v28;
    v22[0] = v23;
    v22[1] = v24;
    objc_msgSend(v7, "setSpriteStyle:", v22);
    -[PXGLayout axGroup](self, "axGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAxContainingGroup:", v17);

    objc_msgSend(v7, "setContent:ofContentKind:", 0, 5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)preferredFocusLayouts
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXGDecoratingLayout decoratedLayout](self, "decoratedLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXGDecoratingLayout;
    -[PXGLayout preferredFocusLayouts](&v7, sel_preferredFocusLayouts);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)setAppliesAlphaToSublayouts:(BOOL)a3
{
  self->_appliesAlphaToSublayouts = a3;
}

- (BOOL)allowsViewDecorationHitTesting
{
  return self->_allowsViewDecorationHitTesting;
}

- (void)setAllowsViewDecorationHitTesting:(BOOL)a3
{
  self->_allowsViewDecorationHitTesting = a3;
}

- (void)setDecorationSizeClass:(int64_t)a3
{
  self->_decorationSizeClass = a3;
}

- (int64_t)selectionDecorationStyle
{
  return self->_selectionDecorationStyle;
}

- (unint64_t)selectionDecorationOptions
{
  return self->_selectionDecorationOptions;
}

- (PXGAssetBackgroundDecorationSource)assetBackgroundDecorationSource
{
  return (PXGAssetBackgroundDecorationSource *)objc_loadWeakRetained((id *)&self->_assetBackgroundDecorationSource);
}

- (PXGCaptionDecorationSource)captionDecorationSource
{
  return (PXGCaptionDecorationSource *)objc_loadWeakRetained((id *)&self->_captionDecorationSource);
}

- (PXGTapbackDecorationSource)tapbackDecorationSource
{
  return (PXGTapbackDecorationSource *)objc_loadWeakRetained((id *)&self->_tapbackDecorationSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapbackDecorationSource);
  objc_destroyWeak((id *)&self->_viewDecorationSource);
  objc_destroyWeak((id *)&self->_debugDecorationSource);
  objc_destroyWeak((id *)&self->_dragDecorationSource);
  objc_destroyWeak((id *)&self->_solidColorOverlayDecorationSource);
  objc_destroyWeak((id *)&self->_highlightDecorationSource);
  objc_destroyWeak((id *)&self->_selectionDecorationSource);
  objc_destroyWeak((id *)&self->_captionDecorationSource);
  objc_destroyWeak((id *)&self->_assetProgressDecorationSource);
  objc_destroyWeak((id *)&self->_assetBackgroundDecorationSource);
  objc_destroyWeak((id *)&self->_assetBadgeDecorationSource);
  objc_destroyWeak((id *)&self->_decorationSource);
  objc_storeStrong((id *)&self->_decoratedLayout, 0);
  objc_storeStrong((id *)&self->_shadowDecorationSource, 0);
  objc_storeStrong((id *)&self->_shadowSource, 0);
  objc_storeStrong((id *)&self->_pendingActiveDecorationSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_invalidatedDecoratedSpriteIndexes, 0);
}

uint64_t __43__PXGDecoratingLayout__updateReloadSprites__block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 888);
  v3 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v4 = *(unsigned int *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  return result;
}

@end

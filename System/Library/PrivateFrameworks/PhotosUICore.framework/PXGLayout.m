@implementation PXGLayout

- (void)enumerateLayoutsForSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  unint64_t v16;
  _PXGSpriteIndexRange v17;
  _QWORD v18[5];
  char v19;

  v8 = a5;
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v10 = objc_msgSend(v9, "count");
  v11 = PXGSpriteIndexRangeIntersection();
  if (!HIDWORD(v11)
    || ((*((void (**)(id, unint64_t, PXGLayout *, char *))v8 + 2))(v8, v11, self, &v19), !v19))
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2810000000;
    v18[3] = &unk_1A7E74EE7;
    v18[4] = v10;
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__PXGLayout_enumerateLayoutsForSpritesInRange_options_usingBlock___block_invoke;
    v13[3] = &unk_1E5118A78;
    v16 = a4;
    v17 = a3;
    v15 = v18;
    v14 = v8;
    objc_msgSend(v12, "enumerateSublayoutsUsingBlock:", v13);

    _Block_object_dispose(v18, 8);
  }

}

- (PXGSpriteDataStore)spriteDataStore
{
  return self->_spriteDataStore;
}

- (void)enumerateDescendantsLayoutsUsingBlock:(id)a3
{
  void (**v4)(id, PXGLayout *, _BYTE *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  void (**v11)(id, PXGLayout *, _BYTE *);
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16[8];

  v4 = (void (**)(id, PXGLayout *, _BYTE *))a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16[0] = 0;
  v4[2](v4, self, v16);
  if (!*((_BYTE *)v14 + 24))
  {
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      if (v6 >= objc_msgSend(v5, "count"))
        break;
      objc_msgSend(v5, "sublayoutAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __51__PXGLayout_enumerateDescendantsLayoutsUsingBlock___block_invoke;
      v10[3] = &unk_1E5118F58;
      v11 = v4;
      v12 = &v13;
      objc_msgSend(v8, "enumerateDescendantsLayoutsUsingBlock:", v10);
      v9 = *((unsigned __int8 *)v14 + 24);

      ++v6;
    }
    while (!v9);

  }
  _Block_object_dispose(&v13, 8);

}

- (PXGSublayoutDataStore)sublayoutDataStore
{
  return self->_sublayoutDataStore;
}

uint64_t __51__PXGLayout_enumerateDescendantsLayoutsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

void __66__PXGLayout_enumerateLayoutsForSpritesInRange_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v9 = a3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36) = objc_msgSend(v9, "numberOfSprites");
  v6 = PXGSpriteIndexRangeIntersection();
  if (HIDWORD(v6))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = v6 & 0xFFFFFFFF00000000 | (v6 - *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
    if ((v7 & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66__PXGLayout_enumerateLayoutsForSpritesInRange_options_usingBlock___block_invoke_2;
      v10[3] = &unk_1E5118A50;
      v11 = *(id *)(a1 + 32);
      v12 = a4;
      objc_msgSend(v9, "enumerateLayoutsForSpritesInRange:options:usingBlock:", v8, v7, v10);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) += *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 36);

}

- (unsigned)numberOfSprites
{
  return self->_numberOfSprites;
}

- (void)setAppearState:(unint64_t)a3
{
  id v5;
  _QWORD v6[5];

  if (self->_appearState != a3)
  {
    self->_appearState = a3;
    -[PXGLayout appearStateDidChange](self, "appearStateDidChange");
  }
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__PXGLayout_setAppearState___block_invoke;
  v6[3] = &__block_descriptor_40_e26_v32__0q8__PXGLayout_16_B24l;
  v6[4] = a3;
  objc_msgSend(v5, "enumerateSublayoutsUsingBlock:", v6);

}

uint64_t __28__PXGLayout_setAppearState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAppearState:", *(_QWORD *)(a1 + 32));
}

void __165__PXGLayout_copyLayoutForSpritesInRange_applySpriteTransforms_parentTransform_parentAlpha_parentClippingRect_parentSublayoutOrigin_entities_geometries_styles_infos___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL IsInfinite;
  int32x4_t v17;
  int32x4_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float *v21;
  uint64_t v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int8x16_t v35;
  float32x2_t v36;
  int8x16_t v37;
  float32x2_t v38;
  float v39;
  __int32 v40;
  double v41;
  double v42;
  double v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _BOOL4 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  _OWORD v82[3];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  CGRect v89;

  v5 = HIDWORD(a2);
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v7 == v6)
  {
    v11 = a2;
    if ((int)v5 + (int)a2 > objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGLayout copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:]_block_invoke");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromPXGSpriteIndexRange();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("PXGLayout.m"), 2292, CFSTR("subrange %@ out of bounds 0..%li"), v65, objc_msgSend(*(id *)(a1 + 40), "count"));

    }
    v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v12 + v5 > *(_DWORD *)(a1 + 188) + *(_DWORD *)(a1 + 184))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGLayout copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:]_block_invoke");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      NSStringFromPXGSpriteIndexRange();
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, CFSTR("PXGLayout.m"), 2293, CFSTR("location %li+%li out of range %@"), v68, v5, v69);

      v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    memcpy((void *)(*(_QWORD *)(a1 + 64) + 4 * v12), (const void *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "entities") + 4 * v11), 4 * v5);
    memcpy((void *)(*(_QWORD *)(a1 + 72) + 32 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), (const void *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "geometries") + 32 * v11), 32 * v5);
    memcpy((void *)(*(_QWORD *)(a1 + 80) + 160 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), (const void *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "styles") + 160 * v11), 160 * v5);
    memcpy((void *)(*(_QWORD *)(a1 + 88) + 40 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), (const void *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "infos") + 40 * v11), 40 * v5);
    v13 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v14 = *(_QWORD *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 80);
    IsInfinite = CGRectIsInfinite(*(CGRect *)(a1 + 96));
    if ((_DWORD)v5)
    {
      v19 = vcvt_f32_f64(*(float64x2_t *)(a1 + 96));
      v20 = vadd_f32(v19, vcvt_f32_f64(*(float64x2_t *)(a1 + 112)));
      v21 = (float *)(v15 + 160 * v13 + 20);
      v22 = v14 + 32 * v13 + 16;
      v23 = v5;
      do
      {
        v24 = *(double *)(a1 + 128);
        v25 = *(double *)(a1 + 136);
        v26 = *(double *)(a1 + 144);
        v27 = *(double *)(a1 + 152);
        v28 = *(double *)v22;
        v29 = COERCE_FLOAT(HIDWORD(*(_QWORD *)(v22 + 8)));
        *(float *)&v30 = v26 * v29 + v24 * COERCE_FLOAT(*(_QWORD *)(v22 + 8));
        v31 = *(double *)(a1 + 160);
        v32 = *(double *)(a1 + 168);
        *(float *)&v29 = v27 * v29 + v25 * *(float *)&v30;
        HIDWORD(v30) = LODWORD(v29);
        *(_QWORD *)(v22 + 8) = v30;
        v33 = *(double *)(v22 - 8);
        v34 = v31 + v26 * v33 + v24 * *(double *)(v22 - 16);
        *(double *)v17.i64 = v32 + v27 * v33 + v25 * v34;
        *(double *)(v22 - 16) = v34;
        *(_QWORD *)(v22 - 8) = v17.i64[0];
        *(float *)&v34 = *(double *)(a1 + 176);
        *(double *)v22 = v28 + *(float *)&v34;
        *(v21 - 5) = *(float *)(a1 + 192) * *(v21 - 5);
        v35 = *(int8x16_t *)v21;
        if (!IsInfinite)
        {
          v17.i32[0] = 0;
          v36 = vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL));
          *(float32x2_t *)v37.i8 = vmaxnm_f32(*(float32x2_t *)v35.i8, v19);
          v38 = vsub_f32(vminnm_f32(v36, v20), *(float32x2_t *)v37.i8);
          *(int32x2_t *)v18.i8 = vcgez_f32(v38);
          *(uint32x2_t *)v18.i8 = vpmin_u32(*(uint32x2_t *)v18.i8, *(uint32x2_t *)v18.i8);
          v17 = vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v17, v18), 0);
          v37.u64[1] = (unint64_t)v38;
          v35 = vandq_s8(v37, (int8x16_t)v17);
          *(int8x16_t *)v21 = v35;
        }
        v39 = *(double *)(a1 + 196) + *(float *)v35.i32;
        *v21 = v39;
        *(float *)v35.i32 = v39;
        *(float *)&v40 = *(double *)(a1 + 204) + *(float *)&v35.i32[1];
        v35.i32[1] = v40;
        *(int8x16_t *)v21 = v35;
        v21 += 40;
        v22 += 32;
        --v23;
      }
      while (v23);
    }
  }
  else
  {
    v88 = 0;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
    memset(v82, 0, sizeof(v82));
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 48), "geometryForSublayout:", v6);
      v8 = *((double *)&v83 + 1);
      v9 = *(double *)&v83;
      v10 = *(double *)&v84;
      v7 = *(id *)(a1 + 32);
    }
    else
    {
      v10 = 0.0;
      v8 = 0.0;
      v9 = 0.0;
    }
    v41 = *(double *)(a1 + 196) + v9;
    v42 = *(double *)(a1 + 204) + v8;
    v43 = *(double *)(a1 + 212) + v10;
    if (objc_msgSend(v7, "shouldApplySpriteTransformToSublayouts"))
    {
      v44 = *(_OWORD *)(a1 + 144);
      v78 = *(_OWORD *)(a1 + 128);
      v79 = v44;
      v80 = *(_OWORD *)(a1 + 160);
      v45 = *(_QWORD *)(a1 + 176);
    }
    else
    {
      v46 = *((_OWORD *)off_1E50B8368 + 1);
      v78 = *(_OWORD *)off_1E50B8368;
      v79 = v46;
      v80 = *((_OWORD *)off_1E50B8368 + 2);
      v45 = *((_QWORD *)off_1E50B8368 + 6);
    }
    v81 = v45;
    v77 = 0;
    v75 = 0u;
    v76 = 0u;
    v74 = 0u;
    v47 = *(unsigned __int8 *)(a1 + 220);
    v70 = v78;
    v71 = v79;
    v72 = v80;
    v73 = v45;
    _spriteTransformFromSelfAndParent(&v74, (uint64_t)v82, (uint64_t)&v70, v47);
    v48 = *(double *)(a1 + 96);
    v49 = *(double *)(a1 + 104);
    v50 = *(double *)(a1 + 112);
    v51 = *(double *)(a1 + 120);
    v89.origin.x = v48;
    v89.origin.y = v49;
    v89.size.width = v50;
    v89.size.height = v51;
    v52 = CGRectIsInfinite(v89);
    v53 = *(double *)&v83;
    if (v52)
      v53 = 0.0;
    v54 = v48 - v53;
    if (v52)
      v55 = 0.0;
    else
      v55 = *((double *)&v83 + 1);
    v56 = v49 - v55;
    v57 = *(unsigned __int8 *)(a1 + 220);
    LODWORD(v55) = *(_DWORD *)(a1 + 192);
    v58 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v59 = *(_QWORD *)(a1 + 64) + 4 * v58;
    v60 = *(_QWORD *)(a1 + 72) + 32 * v58;
    v61 = *(_QWORD *)(a1 + 80) + 160 * v58;
    v62 = *(_QWORD *)(a1 + 88) + 40 * v58;
    v70 = v74;
    v71 = v75;
    v72 = v76;
    v73 = v77;
    objc_msgSend(v6, "copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:", a2, v57, &v70, v59, v60, v61, v55, v54, v56, v50, v51, v41, v42, v43, v62);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v5;

}

uint64_t __66__PXGLayout_enumerateLayoutsForSpritesInRange_options_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a4)
    **(_BYTE **)(a1 + 40) = 1;
  return result;
}

- (void)setInternalCurrentDataSourceChange:(id)a3
{
  objc_storeStrong((id *)&self->_internalCurrentDataSourceChange, a3);
}

- (BOOL)isAnimating
{
  return 0;
}

- (int64_t)intrinsicScrollRegime
{
  return self->_intrinsicScrollRegime;
}

- (unint64_t)contentChangeTrend
{
  return 0;
}

uint64_t __22__PXGLayout_didRender__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInternalCurrentDataSourceChange:", 0);
}

- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 applySpriteTransforms:(BOOL)a4 parentTransform:(id *)a5 parentAlpha:(float)a6 parentClippingRect:(CGRect)a7 parentSublayoutOrigin:(id)a8 entities:(id *)a9 geometries:(id *)a10 styles:(id *)a11 infos:(id *)a12
{
  _BOOL4 v15;
  double var2;
  double var1;
  double var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  id v38;
  __int128 v39;
  id v40;
  void *v41;
  void *v42;
  $738B17BD11CC339B30296C0EA03CEC2B *v43;
  unsigned int length;
  $738B17BD11CC339B30296C0EA03CEC2B *v47;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v48;
  $225AF24142A77900D29617A74D173C5F *v49;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  _QWORD *v54;
  $738B17BD11CC339B30296C0EA03CEC2B *v55;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v56;
  $225AF24142A77900D29617A74D173C5F *v57;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  double v66;
  _PXGSpriteIndexRange v67;
  float v68;
  double v69;
  double v70;
  double v71;
  BOOL v72;
  _QWORD v73[3];
  int v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v15 = a4;
  var2 = a8.var2;
  var1 = a8.var1;
  var0 = a8.var0;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v26 = objc_claimAutoreleasedReturnValue();
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = a9;
  v42 = (void *)v26;
  if (v15)
  {
    -[PXGLayout modifiedSpriteDataStore](self, "modifiedSpriteDataStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[PXGLayout modifiedSpriteDataStore](self, "modifiedSpriteDataStore");
      v29 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v29;
    }
  }
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");
  v32 = objc_msgSend(v27, "count");

  if (v31 != v32)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 2269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.spriteDataStore.count == spriteDataStore.count"), v26);

  }
  if (-[PXGLayout appliesAlphaToSublayouts](self, "appliesAlphaToSublayouts"))
  {
    -[PXGLayout alpha](self, "alpha");
    a6 = v33 * a6;
  }
  -[PXGLayout clippingRect](self, "clippingRect");
  if (!CGRectIsInfinite(v75))
  {
    -[PXGLayout clippingRect](self, "clippingRect");
    v78.origin.x = v34;
    v78.origin.y = v35;
    v78.size.width = v36;
    v78.size.height = v37;
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    v77 = CGRectIntersection(v76, v78);
    x = v77.origin.x;
    y = v77.origin.y;
    width = v77.size.width;
    height = v77.size.height;
  }
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v74 = 0;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __165__PXGLayout_copyLayoutForSpritesInRange_applySpriteTransforms_parentTransform_parentAlpha_parentClippingRect_parentSublayoutOrigin_entities_geometries_styles_infos___block_invoke;
  v51[3] = &unk_1E5118E18;
  v51[4] = self;
  v38 = v27;
  v52 = v38;
  v67 = a3;
  v54 = v73;
  v55 = v43;
  v56 = a10;
  v57 = a11;
  v58 = a12;
  v59 = x;
  v60 = y;
  v61 = width;
  v62 = height;
  v39 = *(_OWORD *)&a5->var0.c;
  v63 = *(_OWORD *)&a5->var0.a;
  v64 = v39;
  v65 = *(_OWORD *)&a5->var0.tx;
  v66 = a5->var1;
  v68 = a6;
  v69 = var0;
  v70 = var1;
  v71 = var2;
  v40 = v42;
  v53 = v40;
  v72 = v15;
  -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", a3, 0, v51);
  length = a3.length;
  v47 = v43;
  v48 = a10;
  v49 = a11;
  v50 = a12;
  -[PXGLayout adjustCopiedSprites:](self, "adjustCopiedSprites:", &length);

  _Block_object_dispose(v73, 8);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (double)alpha
{
  return self->_alpha;
}

- (PXGLayoutSnapshotDataSource)layoutSnapshotDataSource
{
  return 0;
}

- (BOOL)appliesAlphaToSublayouts
{
  return 1;
}

- (BOOL)shouldApplySpriteTransformToSublayouts
{
  return 1;
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  void *v3;
  id v4;

  -[PXGLayout lastVisibleAreaAnchor](self, "lastVisibleAreaAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PXGLayout setLastVisibleAreaAnchor:](self, "setLastVisibleAreaAnchor:", 0);
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateSublayoutsUsingBlock:", &__block_literal_global_104385);

}

- (PXGAnchor)lastVisibleAreaAnchor
{
  return self->_lastVisibleAreaAnchor;
}

uint64_t __64__PXGLayout_PXGAnchor__clearLastVisibleAreaAnchoringInformation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "clearLastVisibleAreaAnchoringInformation");
}

uint64_t __51__PXGLayout_convertSpriteIndex_toDescendantLayout___block_invoke(uint64_t result, int a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

void __41__PXGLayout_leafSublayoutForSpriteIndex___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void __43__PXGLayout_objectReferenceForSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (*(void **)(a1 + 32) != a3)
  {
    objc_msgSend(a3, "objectReferenceForSpriteIndex:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

uint64_t __32__PXGLayout_setViewEnvironment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setViewEnvironment:", *(_QWORD *)(a1 + 32));
}

uint64_t __30__PXGLayout_setMediaProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setMediaProvider:", *(_QWORD *)(a1 + 32));
}

- (void)removeAllFences
{
  -[NSMutableArray removeAllObjects](self->_fences, "removeAllObjects");
}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyFullState:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  PXGLayout *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  PXGLayout *v62;
  _QWORD v63[4];
  id v64;
  PXGLayout *v65;
  id v66;
  id v67;
  SEL v68;
  _QWORD v69[4];
  id v70;
  id v71;
  PXGLayout *v72;
  id v73;
  _QWORD v74[5];
  id v75;
  id v76;

  v8 = *(_QWORD *)&a4;
  v53 = a3;
  v10 = a5;
  v11 = a6;
  -[PXGLayout _ensureSpriteDataStore](self, "_ensureSpriteDataStore");
  -[PXGLayout spriteModifier](self, "spriteModifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v51 = v11;
  if (v12)
  {
    -[PXGLayout _ensureModifiedSpriteDataStore](self, "_ensureModifiedSpriteDataStore");
  }
  else
  {
    -[PXGLayout modifiedSpriteDataStore](self, "modifiedSpriteDataStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[PXGLayout _destroyModifiedSpriteDataStore](self, "_destroyModifiedSpriteDataStore");
  }
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout modifiedSpriteDataStore](self, "modifiedSpriteDataStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v52 = (void *)v12;
  v49 = v8;
  if (objc_msgSend(v53, "hasIncrementalChanges"))
  {
    v8 = v8;
    v17 = v16;
    v18 = v53;
  }
  else
  {
    v19 = objc_alloc((Class)off_1E50B1608);
    v17 = v16;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v16);
    v20 = v10;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v8;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v21, v22, 0, 0, 0);

    v10 = v20;
    v18 = (void *)v23;
  }
  v54 = v18;
  objc_msgSend(v18, "insertedIndexes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count") + v17;
  objc_msgSend(v54, "removedIndexes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25 - objc_msgSend(v26, "count");

  if (v27 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 1538, CFSTR("countBeforeChanges(%d) + spriteChangeDetails(%@) does not match countAfterChanges(%d)"), v16, v54, v49);

  }
  objc_msgSend(v54, "removedIndexes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke;
  v74[3] = &unk_1E5118B68;
  v74[4] = self;
  v30 = v14;
  v75 = v30;
  v31 = v15;
  v76 = v31;
  objc_msgSend(v28, "enumerateRangesWithOptions:usingBlock:", 2, v74);

  objc_msgSend(v54, "insertedIndexes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v29;
  v69[1] = 3221225472;
  v69[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_2;
  v69[3] = &unk_1E5118D00;
  v33 = v30;
  v70 = v33;
  v34 = v31;
  v71 = v34;
  v72 = self;
  v35 = v10;
  v73 = v35;
  objc_msgSend(v32, "enumerateRangesWithOptions:usingBlock:", 0, v69);

  if (objc_msgSend(v54, "hasMoves"))
  {
    v36 = objc_msgSend(v54, "movesFromIndexes");
    objc_msgSend(v54, "movesToIndexes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "moveSpritesFromIndexes:toIndexes:", v36, v37);

    v38 = objc_msgSend(v54, "movesFromIndexes");
    objc_msgSend(v54, "movesToIndexes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "moveSpritesFromIndexes:toIndexes:", v38, v39);

  }
  if (v51)
  {
    objc_msgSend(v54, "changedIndexes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v29;
    v63[1] = 3221225472;
    v63[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_3;
    v63[3] = &unk_1E5118D28;
    v68 = a2;
    v64 = v33;
    v65 = self;
    v67 = v51;
    v66 = v34;
    objc_msgSend(v40, "enumerateRangesUsingBlock:", v63);

  }
  v41 = v52;
  if (v52)
  {
    objc_msgSend(v54, "insertedIndexes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v29;
    v59[1] = 3221225472;
    v59[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_4;
    v59[3] = &unk_1E5118B68;
    v43 = v52;
    v60 = v43;
    v44 = v34;
    v61 = v44;
    v62 = self;
    objc_msgSend(v42, "enumerateRangesUsingBlock:", v59);

    objc_msgSend(v54, "changedIndexes");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v29;
    v55[1] = 3221225472;
    v55[2] = __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_5;
    v55[3] = &unk_1E5118B68;
    v46 = v43;
    v41 = v52;
    v56 = v46;
    v57 = v44;
    v58 = self;
    objc_msgSend(v45, "enumerateRangesUsingBlock:", v55);

  }
  -[PXGLayout sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:](self, "sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:", self, v54, self);
  -[PXGLayout axGroup](self, "axGroup");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "invalidateLeafs");

}

- (PXGBasicAXGroup)axGroup
{
  return self->_reusableAXGroup;
}

- (void)sublayout:(id)a3 didApplySpriteChangeDetails:(id)a4 fromDescendentSublayout:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PXGLayout *v22;

  v22 = (PXGLayout *)a3;
  v9 = a4;
  v10 = a5;
  if (v22 == self)
    -[PXGLayout didApplySpriteChangeDetails:](v22, "didApplySpriteChangeDetails:", v9);
  if (objc_msgSend(v9, "hasAnyChanges"))
  {
    if (objc_msgSend(v9, "hasAnyInsertionsRemovalsOrMoves"))
      -[PXGLayout invalidateVersion](self, "invalidateVersion");
    if ((objc_msgSend(v9, "hasIncrementalChanges") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 1631, CFSTR("%@ didn't recieve incremental change details:%@"), self, v9);

    }
    if (v22 != self)
    {
      objc_msgSend(v9, "insertedIndexes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      objc_msgSend(v9, "removedIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 - objc_msgSend(v13, "count");

      -[PXGLayout _incrementNumberOfSprites:](self, "_incrementNumberOfSprites:", v14);
    }
    -[PXGLayout convertChangeDetails:fromSublayout:](self, "convertChangeDetails:fromSublayout:", v9, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:](self, "adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:", v15, self);
    -[PXGLayout superlayout](self, "superlayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:", self, v15, v10);
    }
    else
    {
      -[PXGLayout changeDetails](self, "changeDetails");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "canPreserveIncrementalChangesWhenAddingChangeDetails:", v15))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "addChangeDetails:", v15);
        }
        else
        {
          v20 = (void *)objc_msgSend(v19, "mutableCopy");
          objc_msgSend(v18, "removeLastObject");
          objc_msgSend(v18, "addObject:", v20);
          objc_msgSend(v20, "addChangeDetails:", v15);

        }
      }
      else
      {
        objc_msgSend(v18, "addObject:", v15);
      }
      -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);

    }
  }

}

- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4
{
  id v6;
  id v7;
  NSIndexSet *v8;
  NSIndexSet *spriteIndexesWithInvalidatedStyle;
  void *v10;
  void *v11;
  id v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unsigned int v19;
  BOOL isPropagatingAdjustedReferencedHiddenSpriteIndexes;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_spriteIndexesWithInvalidatedStyle)
  {
    objc_msgSend(v6, "indexSetAfterApplyingChangesToIndexSet:");
    v8 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    spriteIndexesWithInvalidatedStyle = self->_spriteIndexesWithInvalidatedStyle;
    self->_spriteIndexesWithInvalidatedStyle = v8;

  }
  if (self->_localHiddenSpriteIndexes)
  {
    objc_msgSend(v6, "indexSetAfterApplyingChangesToIndexSet:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout setLocalHiddenSpriteIndexes:](self, "setLocalHiddenSpriteIndexes:", v10);

    -[PXGLayout _invalidateStyleOfSpritesWithIndexes:](self, "_invalidateStyleOfSpritesWithIndexes:", self->_localHiddenSpriteIndexes);
  }
  -[PXGLayout superlayout](self, "superlayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else if (-[NSMutableArray count](self->_spriteReferencesForHiddenSprites, "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = self->_spriteReferencesForHiddenSprites;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v18, "adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:", v6, v7, (_QWORD)v22);
          v19 = -[PXGLayout spriteIndexForSpriteReference:options:](self, "spriteIndexForSpriteReference:options:", v18, 1024);
          if (v19 != -1)
            objc_msgSend(v12, "addIndex:", v19);
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    isPropagatingAdjustedReferencedHiddenSpriteIndexes = self->_isPropagatingAdjustedReferencedHiddenSpriteIndexes;
    self->_isPropagatingAdjustedReferencedHiddenSpriteIndexes = 1;
    -[PXGLayout _propagateHiddenSpriteIndexes:](self, "_propagateHiddenSpriteIndexes:", v12);
    self->_isPropagatingAdjustedReferencedHiddenSpriteIndexes = isPropagatingAdjustedReferencedHiddenSpriteIndexes;

  }
  -[PXGLayout activeAnchor](self, "activeAnchor", (_QWORD)v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:", v6, v7);

}

- (PXGAnchor)activeAnchor
{
  return self->_activeAnchor;
}

- (PXGLayout)rootLayout
{
  PXGLayout *v2;
  void *v3;
  PXGLayout *v4;
  void *v5;

  v2 = self;
  -[PXGLayout superlayout](v2, "superlayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[PXGLayout superlayout](v2, "superlayout");
      v4 = (PXGLayout *)objc_claimAutoreleasedReturnValue();

      -[PXGLayout superlayout](v4, "superlayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (PXGLayout)superlayout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_superlayout);
}

- (id)convertChangeDetails:(id)a3 fromSublayout:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;

  v7 = a3;
  v8 = v7;
  if (a4 == self)
  {
    v13 = v7;
  }
  else
  {
    v9 = a4;
    if ((objc_msgSend(v8, "hasIncrementalChanges") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 1681, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeDetails.hasIncrementalChanges"));

    }
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v12, "spriteIndexOriginForSublayout:", v9);

    objc_msgSend(v8, "changeDetailsShiftedBy:", v10 + (unint64_t)v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (void)_setNeedsUpdateExternally:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  PXGLayout *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_isPerformingWithLocalUpdate)
  {
    if (self->_isUpdating)
    {
      if (a3 && !self->_isUpdatingAnchoring)
      {
        self->_needsUpdate = 1;
        if (-[PXGLayout allowsDanglingUpdatesAssertions](self, "allowsDanglingUpdatesAssertions"))
        {
          if (!self->_isPropagatingAdjustedReferencedHiddenSpriteIndexes)
          {
            PXAssertGetLog();
            v4 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
            {
              v9 = 138412290;
              v10 = self;
              _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "setNeedsUpdate called while performing update pass on %@", (uint8_t *)&v9, 0xCu);
            }

          }
        }
      }
    }
    else
    {
      self->_needsUpdate = 1;
    }
    -[PXGLayout superlayout](self, "superlayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sublayoutNeedsUpdate:", self);

    -[PXGLayout rootLayout](self, "rootLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutNeedsUpdate:", v6);

    -[PXGLayout activeAnchor](self, "activeAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdate:", 1);

  }
}

- (PXGLayoutUpdateDelegate)updateDelegate
{
  return (PXGLayoutUpdateDelegate *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (unsigned)localNumberOfSprites
{
  void *v2;
  unsigned int v3;

  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)userInterfaceDirection
{
  return self->_userInterfaceDirection;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (PXGDisplayAssetSource)displayAssetSource
{
  return (PXGDisplayAssetSource *)objc_loadWeakRetained((id *)&self->_displayAssetSource);
}

- (void)_incrementNumberOfSprites:(int64_t)a3
{
  self->_numberOfSprites += a3;
}

- (void)_ensureSpriteDataStore
{
  PXGSpriteDataStore *v3;
  PXGSpriteDataStore *spriteDataStore;

  if (!self->_spriteDataStore)
  {
    v3 = (PXGSpriteDataStore *)objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
    spriteDataStore = self->_spriteDataStore;
    self->_spriteDataStore = v3;

  }
}

- (void)didApplySpriteChangeDetails:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGLayout axGroup](self, "axGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateLeafsWithChangeDetails:", v4);

}

- (void)invalidateVersion
{
  signed int v3;
  void *v4;
  id v5;

  do
    v3 = __ldaxr((unsigned int *)&PXGLayoutVersionMakeUnique_lastVersion);
  while (__stlxr(v3 + 1, (unsigned int *)&PXGLayoutVersionMakeUnique_lastVersion));
  self->_version = -(uint64_t)v3;
  -[PXGLayout superlayout](self, "superlayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateVersion");

  -[PXGLayout axGroup](self, "axGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateVersion");

}

- (BOOL)isUpdatingSpriteStyling
{
  return self->_isUpdatingSpriteStyling;
}

- (__n128)cameraConfiguration
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 816);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 800);
  *(_OWORD *)(a2 + 176) = v2;
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 832);
  v3 = *(_OWORD *)(a1 + 752);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 736);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 784);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 768);
  *(_OWORD *)(a2 + 144) = v4;
  v5 = *(_OWORD *)(a1 + 688);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 672);
  *(_OWORD *)(a2 + 48) = v5;
  v6 = *(_OWORD *)(a1 + 720);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 704);
  *(_OWORD *)(a2 + 80) = v6;
  result = *(__n128 *)(a1 + 656);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 640);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

- (PXGSpriteMetadataStore)spriteMetadataStore
{
  return self->_spriteMetadataStore;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSMutableArray)changeDetails
{
  NSMutableArray *changeDetails;
  NSMutableArray *v4;
  NSMutableArray *v5;

  changeDetails = self->_changeDetails;
  if (!changeDetails)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_changeDetails;
    self->_changeDetails = v4;

    changeDetails = self->_changeDetails;
  }
  return changeDetails;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_visibleRect))
  {
    v8 = PXRectApproximatelyEqualToRect();
    self->_visibleRect.origin.x = x;
    self->_visibleRect.origin.y = y;
    self->_visibleRect.size.width = width;
    self->_visibleRect.size.height = height;
    if ((v8 & 1) == 0)
      -[PXGLayout visibleRectDidChange](self, "visibleRectDidChange");
  }
}

- (void)updateIfNeeded
{
  _BOOL4 isUpdating;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    isUpdating = self->_isUpdating;
    self->_isUpdating = 1;
    if (!isUpdating)
      self->_childrenTotalUpdateDuration = 0;
    v4 = mach_continuous_time();
    -[PXGLayout willUpdate](self, "willUpdate");
    -[PXGLayout update](self, "update");
    -[PXGLayout didUpdate](self, "didUpdate");
    if (!isUpdating)
    {
      if (updateIfNeeded_onceToken != -1)
        dispatch_once(&updateIfNeeded_onceToken, &__block_literal_global_52);
      v5 = mach_continuous_time() - v4;
      v6 = v5 - self->_childrenTotalUpdateDuration;
      -[PXGLayout superlayout](self, "superlayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_childDidUpdateWithDuration:", v5);

      if (v6 > updateIfNeeded_slowUpdateThreshold)
      {
        PXGTungstenGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = os_signpost_id_make_with_pointer(v8, self);
        v10 = v8;
        v11 = v10;
        if (v9 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {

          v15 = v11;
        }
        else
        {
          if (os_signpost_enabled(v10))
          {
            v16 = 134217984;
            v17 = v4;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXGLayoutSlowUpdate", "%{signpost.description:begin_time}llu", (uint8_t *)&v16, 0xCu);
          }

          v12 = v11;
          if (os_signpost_enabled(v12))
          {
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = 138543362;
            v17 = (uint64_t)v14;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v9, "PXGLayoutSlowUpdate", "%{public}@", (uint8_t *)&v16, 0xCu);

          }
        }

      }
    }
    self->_isUpdating = isUpdating;
  }
}

- (void)setReferenceSize:(CGSize)a3
{
  if (a3.width != self->_referenceSize.width || a3.height != self->_referenceSize.height)
  {
    self->_referenceSize = a3;
    -[PXGLayout referenceSizeDidChange](self, "referenceSizeDidChange");
  }
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    self->_safeAreaInsets.top = top;
    self->_safeAreaInsets.left = left;
    self->_safeAreaInsets.bottom = bottom;
    self->_safeAreaInsets.right = right;
    -[PXGLayout safeAreaInsetsDidChange](self, "safeAreaInsetsDidChange");
  }
}

- (void)setScrollSpeedRegime:(int64_t)a3
{
  if (self->_scrollSpeedRegime != a3)
  {
    self->_scrollSpeedRegime = a3;
    -[PXGLayout scrollSpeedRegimeDidChange](self, "scrollSpeedRegimeDidChange");
  }
}

- (void)setLastScrollDirection:(CGPoint)a3
{
  if (a3.x != self->_lastScrollDirection.x || a3.y != self->_lastScrollDirection.y)
  {
    self->_lastScrollDirection = a3;
    -[PXGLayout lastScrollDirectionDidChange](self, "lastScrollDirectionDidChange");
  }
}

- (int64_t)version
{
  return self->_version;
}

- (void)didRender
{
  -[PXGLayout enumerateDescendantsLayoutsUsingBlock:](self, "enumerateDescendantsLayoutsUsingBlock:", &__block_literal_global_40);
}

- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 applySpriteTransforms:(BOOL)a4 entities:(id *)a5 geometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  uint64_t v11;

  v8 = *((_OWORD *)off_1E50B8368 + 1);
  v9[0] = *(_OWORD *)off_1E50B8368;
  v9[1] = v8;
  v10 = *((_OWORD *)off_1E50B8368 + 2);
  v11 = *((_QWORD *)off_1E50B8368 + 6);
  -[PXGLayout copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:](self, "copyLayoutForSpritesInRange:applySpriteTransforms:parentTransform:parentAlpha:parentClippingRect:parentSublayoutOrigin:entities:geometries:styles:infos:", a3, a4, v9, a5, a6, a7, COERCE_DOUBLE(__PAIR64__(DWORD1(v10), 1.0)), *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24), *(double *)off_1E50B8308, *((double *)off_1E50B8308 + 1), *((double *)off_1E50B8308 + 2), a8);
}

- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 entities:(id *)a4 geometries:(id *)a5 styles:(id *)a6 infos:(id *)a7
{
  -[PXGLayout copyLayoutForSpritesInRange:applySpriteTransforms:entities:geometries:styles:infos:](self, "copyLayoutForSpritesInRange:applySpriteTransforms:entities:geometries:styles:infos:", a3, 1, a4, a5, a6, a7);
}

- (void)copyLayoutForSpritesInRange:(_PXGSpriteIndexRange)a3 toSpriteDataStore:(id)a4
{
  uint64_t length;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  length = a3.length;
  v7 = a4;
  objc_msgSend(v7, "setCount:", length);
  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "entities");
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "geometries");
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "styles");
  v14 = objc_retainAutorelease(v12);
  v15 = objc_msgSend(v14, "infos");

  -[PXGLayout copyLayoutForSpritesInRange:entities:geometries:styles:infos:](self, "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", a3, v9, v11, v13, v15);
}

- (void)_childDidUpdateWithDuration:(unint64_t)a3
{
  self->_childrenTotalUpdateDuration += a3;
}

- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3 userData:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  PXGLayout *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXGLayout superlayout](self, "superlayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "attempting to create an animation from a sublayout without superlayout: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(v7, "createCuratedLibraryLayoutAnimationIfNeededWithContext:userData:", a3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)createCuratedLibraryLayoutAnimationIfNeededWithContext:(int64_t)a3
{
  return -[PXGLayout createCuratedLibraryLayoutAnimationIfNeededWithContext:userData:](self, "createCuratedLibraryLayoutAnimationIfNeededWithContext:userData:", a3, 0);
}

- (NSArray)animations
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_animations, "copy");
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSMutableSet *sublayoutsExpectedToBeUpdatedInUpdatePass;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  NSMutableSet *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGLayout.m"), 628, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (-[NSMutableSet count](self->_sublayoutsExpectedToBeUpdatedInUpdatePass, "count"))
  {
    if (didUpdate_onceToken != -1)
      dispatch_once(&didUpdate_onceToken, &__block_literal_global_62);
    if ((objc_msgSend((id)didUpdate_reportedClasses, "containsObject:", objc_opt_class()) & 1) == 0)
    {
      PXGTungstenGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        sublayoutsExpectedToBeUpdatedInUpdatePass = self->_sublayoutsExpectedToBeUpdatedInUpdatePass;
        *(_DWORD *)buf = 138412546;
        v14 = v7;
        v15 = 2112;
        v16 = sublayoutsExpectedToBeUpdatedInUpdatePass;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "%@'s sublayouts expected to be updated in update pass: %@", buf, 0x16u);

      }
      if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
      {
        objc_msgSend((id)didUpdate_reportedClasses, "addObject:", objc_opt_class());
        PXGTungstenGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "This error will be reported only once for this class.", buf, 2u);
        }

      }
      PXGTungstenGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_FAULT, "%@'s sublayouts not updated during update pass", buf, 0xCu);

      }
      -[PXGLayout disableDebugAssertionForSublayoutUpdates](self, "disableDebugAssertionForSublayoutUpdates");
    }
  }
  -[NSMutableSet removeAllObjects](self->_sublayoutsExpectedToBeUpdatedInUpdatePass, "removeAllObjects");
  self->_numberOfRepeatedSublayoutUpdatesInUpdatePass = 0;
}

- (NSArray)transitions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_transitions, "copy");
}

- (void)removeAllTransitions
{
  -[NSMutableArray removeAllObjects](self->_transitions, "removeAllObjects");
}

- (NSIndexSet)axSelectedSpriteIndexes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  -[PXGLayout decoratingLayout](self, "decoratingLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionDecorationSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "selectedSpriteIndexesInLayout:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout axSpriteIndexes](self, "axSpriteIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_intersectionWithIndexSet:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
  }

  return (NSIndexSet *)v3;
}

- (NSIndexSet)axVisibleSpriteIndexes
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];

  -[PXGLayout axSpriteIndexes](self, "axSpriteIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "lastIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(v3, "lastIndex");
    if (v5 > objc_msgSend(v4, "count"))
    {
      PXAssertGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Invalid sprite index. Is this a real sprite? If not, please override axVisibleSpriteIndexes.", v9, 2u);
      }

    }
  }
  -[PXGLayout visibleRect](self, "visibleRect");
  objc_msgSend(v4, "spriteAtIndexes:inRect:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v7;
}

- (unsigned)axSpriteIndexClosestToSpriteIndexDefaultImplementation:(unsigned int)a3 inDirection:(unint64_t)a4
{
  void *v7;
  unsigned int v8;
  unsigned int v9;

  if (a3 == -1 || -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") > a3)
  {
    if (a4 - 4 < 2)
    {
      -[PXGLayout axSpriteIndexes](self, "axSpriteIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexGreaterThanIndex:", a3);
      goto LABEL_9;
    }
    if (a4 == 6 || a4 == 3)
    {
      -[PXGLayout axSpriteIndexes](self, "axSpriteIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexLessThanIndex:", a3);
LABEL_9:
      v9 = v8;

      return v9;
    }
  }
  return -1;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 *v15;
  __int128 v16;
  id v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  _DWORD *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _OWORD v34[2];
  __int128 v35;
  __int128 v36;
  _OWORD v37[10];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v3 = *(_QWORD *)&a3;
  v48 = *MEMORY[0x1E0C80C00];
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= v3)
    goto LABEL_11;
  v6 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v6, "infos") + 40 * v3;
  v8 = *(unsigned __int8 *)(v7 + 34);
  v9 = PXGAXInfoKindForMediaKind(*(unsigned __int8 *)(v7 + 1));
  v10 = 6;
  if ((v8 & 4) == 0)
    v10 = 0;
  v11 = v9 ? v9 : v10;
  if (v11)
  {
    +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "checkOutReusableObjectWithReuseIdentifier:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "fillContentForContentKind:inLayout:atIndex:", v11, self, v3))
    {
      v14 = objc_retainAutorelease(v6);
      v15 = (__int128 *)(objc_msgSend(v14, "geometries") + 32 * v3);
      v16 = v15[1];
      v35 = *v15;
      v36 = v16;
      v17 = objc_retainAutorelease(v14);
      v18 = (__int128 *)(objc_msgSend(v17, "styles") + 160 * v3);
      v19 = v18[7];
      v44 = v18[6];
      v45 = v19;
      v20 = v18[9];
      v46 = v18[8];
      v47 = v20;
      v21 = v18[3];
      v40 = v18[2];
      v41 = v21;
      v22 = v18[5];
      v42 = v18[4];
      v43 = v22;
      v23 = v18[1];
      v38 = *v18;
      v39 = v23;
      -[PXGLayout decoratingLayout](self, "decoratingLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        -[PXGLayout decoratingLayout](self, "decoratingLayout");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "focusRingType");

      }
      else
      {
        v26 = 1;
      }

      objc_msgSend(v13, "setSpriteIndex:", v3);
      v34[0] = v35;
      v34[1] = v36;
      objc_msgSend(v13, "setSpriteGeometry:", v34);
      v37[6] = v44;
      v37[7] = v45;
      v37[8] = v46;
      v37[9] = v47;
      v37[2] = v40;
      v37[3] = v41;
      v37[4] = v42;
      v37[5] = v43;
      v37[0] = v38;
      v37[1] = v39;
      objc_msgSend(v13, "setSpriteStyle:", v37);
      v28 = (_DWORD *)(objc_msgSend(objc_retainAutorelease(v17), "styles") + 160 * v3);
      LODWORD(v29) = v28[9];
      LODWORD(v30) = v28[10];
      LODWORD(v31) = v28[11];
      LODWORD(v32) = v28[12];
      objc_msgSend(v13, "setSpriteStyleCornerRadius:", v29, v30, v31, v32);
      objc_msgSend(v13, "setFocusRingType:", v26);
      objc_msgSend(v13, "setAxAccessibleWhenTransparent:", (v8 >> 2) & 1);
      v27 = v13;
    }
    else
    {
      objc_msgSend(v12, "checkInReusableObject:", v13);
      v27 = 0;
    }

  }
  else
  {
LABEL_11:
    v27 = 0;
  }

  return v27;
}

- (PXGDecoratingLayout)decoratingLayout
{
  void *v2;
  void *v3;
  PXGDecoratingLayout *v4;

  -[PXGLayout superlayout](self, "superlayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 usingBlock:(id)a4
{
  -[PXGLayout enumerateSpritesInRange:options:usingBlock:](self, "enumerateSpritesInRange:options:usingBlock:", a3, 0, a4);
}

- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v5;
  id v8;
  __int128 v9;
  _OWORD v10[3];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;

  v5 = a4;
  v8 = a5;
  v16 = 0;
  v9 = *((_OWORD *)off_1E50B8368 + 1);
  v12 = *(_OWORD *)off_1E50B8368;
  v13 = v9;
  v14 = *((_OWORD *)off_1E50B8368 + 2);
  v15 = *((_QWORD *)off_1E50B8368 + 6);
  if ((v5 & 1) != 0)
    -[PXGLayout orientedContentTransform](self, "orientedContentTransform");
  v10[0] = v12;
  v10[1] = v13;
  v10[2] = v14;
  v11 = v15;
  -[PXGLayout _enumerateSpritesInRange:transform:spriteOffset:stop:usingBlock:](self, "_enumerateSpritesInRange:transform:spriteOffset:stop:usingBlock:", a3, v10, 0, &v16, v8);

}

- (void)_enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 transform:(id *)a4 spriteOffset:(unsigned int)a5 stop:(BOOL *)a6 usingBlock:(id)a7
{
  void (**v12)(id, unint64_t, $8F6F21C65DCD0A0F8AC24DFE540A6236 *, uint64_t, uint64_t, uint64_t, PXGLayout *, unint64_t, BOOL *);
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  id v21;
  unsigned int v22;
  id v23;
  _PXGSpriteIndexRange v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  double var1;
  uint64_t v31;
  unint64_t v32;
  $8F6F21C65DCD0A0F8AC24DFE540A6236 *v33;
  _QWORD v34[4];
  void (**v35)(id, unint64_t, $8F6F21C65DCD0A0F8AC24DFE540A6236 *, uint64_t, uint64_t, uint64_t, PXGLayout *, unint64_t, BOOL *);
  _QWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  double v40;
  BOOL *v41;
  _PXGSpriteIndexRange v42;
  unsigned int v43;
  _QWORD v44[6];

  v12 = (void (**)(id, unint64_t, $8F6F21C65DCD0A0F8AC24DFE540A6236 *, uint64_t, uint64_t, uint64_t, PXGLayout *, unint64_t, BOOL *))a7;
  -[PXGLayout modifiedSpriteDataStore](self, "modifiedSpriteDataStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  v17 = objc_msgSend(v16, "count");
  v18 = PXGSpriteIndexRangeIntersection();
  if (HIDWORD(v18))
  {
    v19 = v18;
    v20 = a5;
    v32 = v18 & 0xFFFFFFFF00000000 | (v18 + a5);
    v21 = objc_retainAutorelease(v16);
    v33 = a4;
    v22 = v20;
    v31 = objc_msgSend(v21, "geometries") + 32 * v19;
    v23 = objc_retainAutorelease(v21);
    v24 = a3;
    v25 = objc_msgSend(v23, "styles") + 160 * v19;
    v26 = objc_msgSend(objc_retainAutorelease(v23), "infos") + 40 * v19;
    a5 = v22;
    a4 = v33;
    v27 = v25;
    a3 = v24;
    v12[2](v12, v32, v33, v31, v27, v26, self, v19, a6);
  }
  if (!*a6)
  {
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2810000000;
    v44[3] = &unk_1A7E74EE7;
    v44[4] = v17;
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __77__PXGLayout__enumerateSpritesInRange_transform_spriteOffset_stop_usingBlock___block_invoke;
    v34[3] = &unk_1E5118E40;
    v36 = v44;
    v41 = a6;
    v42 = a3;
    v29 = *(_OWORD *)&a4->var0.c;
    v37 = *(_OWORD *)&a4->var0.a;
    v38 = v29;
    v39 = *(_OWORD *)&a4->var0.tx;
    var1 = a4->var1;
    v43 = a5;
    v40 = var1;
    v35 = v12;
    objc_msgSend(v28, "enumerateSublayoutGeometriesUsingBlock:", v34);

    _Block_object_dispose(v44, 8);
  }

}

- (PXGLayoutContentSource)contentSource
{
  return (PXGLayoutContentSource *)objc_loadWeakRetained((id *)&self->_contentSource);
}

- (NSIndexSet)axSpriteIndexes
{
  return (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (void)_invalidateDecorationForSpriteRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4 invalidateSprites:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  -[PXGLayout superlayout](self, "superlayout");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_invalidateDecorationForSpriteRange:inLayout:invalidateSprites:", a3, v8, v5);

}

- (void)invalidateDecoration
{
  -[PXGLayout invalidateDecorationForSpritesInRange:](self, "invalidateDecorationForSpritesInRange:", -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32);
}

- (void)invalidateDecorationForSpritesInRange:(_PXGSpriteIndexRange)a3
{
  -[PXGLayout _invalidateDecorationForSpriteRange:inLayout:invalidateSprites:](self, "_invalidateDecorationForSpriteRange:inLayout:invalidateSprites:", a3, self, 0);
}

- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;

  v13 = (id *)a3;
  objc_msgSend(v13[4], "removeAllObjects");
  if (objc_msgSend(v13, "needsUpdate"))
    -[PXGLayout sublayoutNeedsUpdate:](self, "sublayoutNeedsUpdate:", v13);
  self->_numberOfDescendantAnchors += objc_msgSend(v13, "numberOfDescendantAnchors");
  -[PXGLayout rootLayout](self, "rootLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "animations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_addAnimations:", v9);

  objc_msgSend(v13, "removeAllAnimations");
  -[PXGLayout rootLayout](self, "rootLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_addFences:", v11);

  objc_msgSend(v13, "removeAllFences");
  -[PXGLayout viewEnvironment](self, "viewEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setViewEnvironment:", v12);

  -[PXGLayout axAddSubgroupForSublayout:atIndex:flags:](self, "axAddSubgroupForSublayout:atIndex:flags:", v13, a4, a5);
}

- (int64_t)numberOfDescendantAnchors
{
  return self->_numberOfDescendantAnchors;
}

- (void)modifySpritesInRange:(_PXGSpriteIndexRange)a3 state:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _PXGSpriteIndexRange v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PXGLayout_modifySpritesInRange_state___block_invoke;
  v8[3] = &unk_1E5118CB0;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", a3, v8);

}

- (void)modifySpritesInRange:(_PXGSpriteIndexRange)a3 fullState:(id)a4
{
  uint64_t length;
  uint64_t location;
  id v7;
  id v8;

  length = a3.length;
  if (a3.length)
  {
    location = a3.location;
    v7 = a4;
    objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexRange:", location, length);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyFullState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyFullState:", v8, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"), 0, v7);

  }
}

- (void)removeAllAnimations
{
  -[NSMutableArray removeAllObjects](self->_animations, "removeAllObjects");
}

- (NSArray)fences
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_fences, "copy");
}

- (void)update
{
  unint64_t needsUpdate;
  NSIndexSet *spriteIndexesWithInvalidatedStyle;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  ++self->_updateCount;
  -[PXGLayout _updateVersion](self, "_updateVersion");
  -[PXGLayout _updateAnchoring](self, "_updateAnchoring");
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGLayout.m"), 616, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      self->_updateFlags.needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGLayout updateStylingForSpritesAtIndexes:](self, "updateStylingForSpritesAtIndexes:", self->_spriteIndexesWithInvalidatedStyle);
      spriteIndexesWithInvalidatedStyle = self->_spriteIndexesWithInvalidatedStyle;
      self->_spriteIndexesWithInvalidatedStyle = 0;

      needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGLayout.m"), 622, CFSTR("still needing to update %lu after update pass"), self->_updateFlags.needsUpdate);

    }
  }
  -[PXGLayout axGroup](self, "axGroup");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateIfNeeded");

}

- (void)_updateVersion
{
  int64_t version;
  void *v4;

  version = self->_version;
  if (version < 0)
  {
    self->_version = -version;
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:](self, "adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:", v4, self);

    -[PXGLayout updateIfNeeded](self, "updateIfNeeded");
  }
}

- (void)_updateAnchoring
{
  BOOL isUpdatingAnchoring;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  _BOOL4 v21;
  double v22;
  double v23;
  NSObject *v25;
  NSObject *v26;
  objc_class *v27;
  PXGLayout *v28;
  int64_t nestedAnchorVisibleRectChanges;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  int v36;
  PXGLayout *v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v48 = *MEMORY[0x1E0C80C00];
  isUpdatingAnchoring = self->_isUpdatingAnchoring;
  self->_isUpdatingAnchoring = 1;
  -[PXGLayout activeAnchor](self, "activeAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "needsUpdate"))
  {
    objc_msgSend(v4, "setNeedsUpdate:", 0);
    -[PXGLayout visibleRect](self, "visibleRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "adjustVisibleRect:");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:");
    if (v21
      && !-[PXGLayout disableDebugAssertionForAnchorUpdatesWithZeroContentSize](self, "disableDebugAssertionForAnchorUpdatesWithZeroContentSize"))
    {
      -[PXGLayout contentSize](self, "contentSize");
      if (v23 == *MEMORY[0x1E0C9D820] && v22 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        PXAssertGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          PXRectDescription();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          PXRectDescription();
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v36 = 138413058;
          v37 = self;
          v38 = 2112;
          v39 = (int64_t)v34;
          v40 = 2112;
          v41 = v35;
          v42 = 2112;
          v43 = v4;
          _os_log_error_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "%@ layout had zero content size, but updated visible rect from %@ to %@, because of active anchor: %@", (uint8_t *)&v36, 0x2Au);

        }
      }
    }
    if (self->_nestedAnchorVisibleRectChanges >= 11)
    {
      PXGTungstenGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (PXGLayout *)objc_claimAutoreleasedReturnValue();
        nestedAnchorVisibleRectChanges = self->_nestedAnchorVisibleRectChanges;
        v30 = CFSTR("NO");
        if (v21)
          v30 = CFSTR("YES");
        v31 = v30;
        v49.origin.x = v6;
        v49.origin.y = v8;
        v49.size.width = v10;
        v49.size.height = v12;
        NSStringFromCGRect(v49);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v50.origin.x = v14;
        v50.origin.y = v16;
        v50.size.width = v18;
        v50.size.height = v20;
        NSStringFromCGRect(v50);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138413570;
        v37 = v28;
        v38 = 2048;
        v39 = nestedAnchorVisibleRectChanges;
        v40 = 2112;
        v41 = v31;
        v42 = 2112;
        v43 = v32;
        v44 = 2112;
        v45 = v33;
        v46 = 2112;
        v47 = v4;
        _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "%@ %ld nested visibleRect changed:%@ %@->%@ by anchor:%@", (uint8_t *)&v36, 0x3Eu);

      }
    }
  }
  else
  {
    v21 = 0;
  }
  if (objc_msgSend(v4, "isAutoInvalidated"))
    objc_msgSend(v4, "invalidate");
  if (self->_isLastVisibleAreaAnchoringInformationInvalidated)
  {
    -[PXGLayout clearLastVisibleAreaAnchoringInformation](self, "clearLastVisibleAreaAnchoringInformation");
    self->_isLastVisibleAreaAnchoringInformationInvalidated = 0;
  }
  if (v21)
  {
    ++self->_nestedAnchorVisibleRectChanges;
    self->_needsUpdate = 1;
    -[PXGLayout updateIfNeeded](self, "updateIfNeeded");
    --self->_nestedAnchorVisibleRectChanges;
  }
  self->_isUpdatingAnchoring = isUpdatingAnchoring;

}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[PXGLayout axNextResponder](self, "axNextResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "axGroup:didChange:userInfo:", v9, a4, v8);

}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->_axNextResponder);
}

- (BOOL)changeVisibleRectToProposedVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL isRequestingVisibleRect;
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
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26;
  void *v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  isRequestingVisibleRect = self->_isRequestingVisibleRect;
  self->_isRequestingVisibleRect = 1;
  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGLayout superlayout](self, "superlayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "sublayout:visibleRectForRequestedVisibleRect:", self, x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    -[PXGLayout visibleRectDelegate](self, "visibleRectDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "layout:visibleRectForRequestedVisibleRect:", self, x, y, width, height);
      v13 = v22;
      v15 = v23;
      v17 = v24;
      v19 = v25;
    }
    else
    {
      v19 = height;
      v17 = width;
      v15 = y;
      v13 = x;
    }
    -[PXGLayout visibleRect](self, "visibleRect");
    v30.origin.x = v13;
    v30.origin.y = v15;
    v30.size.width = v17;
    v30.size.height = v19;
    if (!CGRectEqualToRect(v29, v30))
    {
      -[PXGLayout visibleRect](self, "visibleRect");
      kdebug_trace();
    }

  }
  -[PXGLayout setVisibleRect:](self, "setVisibleRect:", v13, v15, v17, v19);
  if ((PXRectApproximatelyEqualToRect() & 1) == 0
    && !-[PXGLayout canHandleVisibleRectRejection](self, "canHandleVisibleRectRejection"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 1806, CFSTR("the current implementation doesn't handle yet cases of rejected visible rect requests, see <rdar://problem/35795663>"));

  }
  v26 = PXRectApproximatelyEqualToRect() ^ 1;
  self->_isRequestingVisibleRect = isRequestingVisibleRect;

  return v26;
}

- (CGRect)frame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  -[PXGLayout superlayout](self, "superlayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v18 = 0u;
    -[PXGLayout superlayout](self, "superlayout", 0, 0, 0, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sublayoutDataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "geometryForSublayout:", self);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
    }

    v8 = *((double *)&v18 + 1);
    v7 = *(double *)&v18;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  }
  -[PXGLayout contentSize](self, "contentSize", v15, v16, v17);
  v10 = v9;
  v12 = v11;
  v13 = v7;
  v14 = v8;
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)_addFences:(id)a3
{
  NSMutableArray *fences;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    fences = self->_fences;
    if (!fences)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = self->_fences;
      self->_fences = v5;

      fences = self->_fences;
    }
    -[NSMutableArray addObjectsFromArray:](fences, "addObjectsFromArray:", v7);
    -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);
  }

}

- (void)_addAnimations:(id)a3
{
  NSMutableArray *animations;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    animations = self->_animations;
    if (!animations)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = self->_animations;
      self->_animations = v5;

      animations = self->_animations;
    }
    -[NSMutableArray addObjectsFromArray:](animations, "addObjectsFromArray:", v7);
    -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);
  }

}

- (void)assumeWillUpdateSublayoutInUpdatePass:(id)a3
{
  -[NSMutableSet addObject:](self->_sublayoutsExpectedToBeUpdatedInUpdatePass, "addObject:", a3);
}

- (BOOL)hasSublayoutsRemainingToBeUpdated
{
  return -[NSMutableSet count](self->_sublayoutsExpectedToBeUpdatedInUpdatePass, "count") != 0;
}

- (PXGLayoutVisibleRectDelegate)visibleRectDelegate
{
  return (PXGLayoutVisibleRectDelegate *)objc_loadWeakRetained((id *)&self->_visibleRectDelegate);
}

- (void)setNeedsUpdateOfScrollableAxis
{
  void *v3;
  id v4;

  -[PXGLayout superlayout](self, "superlayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateOfScrollableAxis");

  -[PXGLayout scrollDelegate](self, "scrollDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateOfScrollableAxisForLayout:", self);

}

- (PXGLayoutScrollDelegate)scrollDelegate
{
  return (PXGLayoutScrollDelegate *)objc_loadWeakRetained((id *)&self->_scrollDelegate);
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXGLayout _willAddSublayout:](self, "_willAddSublayout:", v8);
  -[PXGLayout _ensureSublayoutDataStore](self, "_ensureSublayoutDataStore");
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSublayout:atIndex:", v8, a4);

  objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", 0, objc_msgSend(v8, "numberOfSprites"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:](self, "sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:", v8, v7, v8);

  -[PXGLayout didAddSublayout:atIndex:flags:](self, "didAddSublayout:atIndex:flags:", v8, a4, 0);
}

- (void)axAddSubgroupForSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  char v5;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  -[PXGLayout axGroup](self, "axGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((v5 & 1) == 0)
    {
      objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", a4, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateSubgroupsWithChangeDetails:", v9);

    }
    objc_msgSend(v11, "axGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadSubgroup:atIndex:", v10, a4);

  }
}

- (void)_ensureSublayoutDataStore
{
  PXGSublayoutDataStore *v3;
  PXGSublayoutDataStore *sublayoutDataStore;

  if (!self->_sublayoutDataStore)
  {
    v3 = objc_alloc_init(PXGSublayoutDataStore);
    sublayoutDataStore = self->_sublayoutDataStore;
    self->_sublayoutDataStore = v3;

  }
}

- (id)createCuratedLibraryLayoutZoomLevelChangeAnimationFromZoomLevel:(int64_t)a3 toZoomLevel:(int64_t)a4 withContext:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("PXCuratedLibraryZoomLevelChangeFromKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("PXCuratedLibraryZoomLevelChangeToKey");
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGLayout createCuratedLibraryLayoutAnimationIfNeededWithContext:userData:](self, "createCuratedLibraryLayoutAnimationIfNeededWithContext:userData:", a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize
{
  return self->_disableDebugAssertionForAnchorUpdatesWithZeroContentSize;
}

- (id)createFenceWithType:(unint64_t)a3
{
  PXGFence *v4;
  void *v5;

  v4 = -[PXGFence initWithLayout:type:]([PXGFence alloc], "initWithLayout:type:", self, a3);
  -[PXGLayout rootLayout](self, "rootLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFence:", v4);

  return v4;
}

- (void)addFence:(id)a3
{
  id v4;
  NSMutableArray *fences;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fences = self->_fences;
  v8 = v4;
  if (!fences)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fences;
    self->_fences = v6;

    v4 = v8;
    fences = self->_fences;
  }
  -[NSMutableArray addObject:](fences, "addObject:", v4);
  -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);

}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_3(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v8;
  _OWORD v9[2];
  uint64_t v10;

  v4 = a2 | ((unint64_t)a3 << 32);
  if (a2 + a3 > objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("PXGLayout.m"), 1583, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXGSpriteIndexRangeMax(range) <= spriteDataStore.count"));

  }
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "spritesInRange:", v4);
  }
  else
  {
    v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  (*(void (**)(uint64_t, unint64_t, _OWORD *))(v5 + 16))(v5, v4, v9);
  return objc_msgSend(*(id *)(a1 + 48), "copySpritesInRange:fromSpriteDataStore:", v4, *(_QWORD *)(a1 + 32));
}

uint64_t __40__PXGLayout_modifySpritesInRange_state___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3[2], a3[3], a3[4]);
}

uint64_t __81__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyState___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a2, a3[2], a3[3], a3[4]);
  return result;
}

- (void)setNeedsUpdate
{
  -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 1);
}

- (id)createAnchorForVisibleArea
{
  return -[PXGLayout createAnchorForVisibleAreaIgnoringEdges:](self, "createAnchorForVisibleAreaIgnoringEdges:", 0);
}

- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  -[PXGLayout lastVisibleAreaAnchor](self, "lastVisibleAreaAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "canBeReused") || a3 && objc_msgSend(v5, "type") == 3)
  {
    if (a3 == 15
      || (v6 = +[PXGLayout scrolledEdgesForVisibleEdges:scrollableAxis:](PXGLayout, "scrolledEdgesForVisibleEdges:scrollableAxis:", -[PXGLayout fullyVisibleEdgesWithDefaultTolerance](self, "fullyVisibleEdgesWithDefaultTolerance") & ~a3, -[PXGLayout scrollableAxis](self, "scrollableAxis"))) == 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__PXGLayout_PXGAnchor__createAnchorForVisibleAreaIgnoringEdges___block_invoke;
      v13[3] = &unk_1E5126A48;
      v13[4] = self;
      -[PXGLayout _createAnchorWithPriority:constraints:](self, "_createAnchorWithPriority:constraints:", 0, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PXGLayout _createAnchorForContentEdges:priority:](self, "_createAnchorForContentEdges:priority:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(v7, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDate:", v11);

      -[PXGLayout setLastVisibleAreaAnchor:](self, "setLastVisibleAreaAnchor:", v8);
    }
  }
  else
  {
    -[PXGLayout _createAnchorWithAnchor:resetPriority:](self, "_createAnchorWithAnchor:resetPriority:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (unint64_t)fullyVisibleEdgesWithDefaultTolerance
{
  PXEdgeInsetsMake();
  return -[PXGLayout fullyVisibleEdgesWithEdgeTolerances:](self, "fullyVisibleEdgesWithEdgeTolerances:");
}

+ (unint64_t)scrolledEdgesForVisibleEdges:(unint64_t)a3 scrollableAxis:(int64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3 & ~(4 * a3) & 8;
  if ((a3 & 0xA) == 2)
    v4 = 2;
  if ((a4 & 2) == 0)
    v4 = 0;
  v5 = v4 | ~(4 * (_BYTE)a3) & 4;
  if ((a3 & 4) == 0)
    v5 = v4;
  if ((a3 & 5) == 1)
    v6 = v4 | 1;
  else
    v6 = v5;
  if ((a4 & 1) != 0)
    return v6;
  else
    return v4;
}

- (void)setLastVisibleAreaAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisibleAreaAnchor, a3);
}

- (void)setViewEnvironment:(id)a3
{
  PXGViewEnvironment *v5;
  PXGViewEnvironment *v6;
  PXGViewEnvironment *v7;
  BOOL v8;
  void *v9;
  PXGViewEnvironment *v10;
  _QWORD v11[4];
  PXGViewEnvironment *v12;

  v10 = (PXGViewEnvironment *)a3;
  v5 = self->_viewEnvironment;
  v6 = v10;
  if (v5 == v10)
    goto LABEL_4;
  v7 = v5;
  v8 = -[PXGViewEnvironment isEqual:](v5, "isEqual:", v10);

  if (!v8)
  {
    -[PXGLayout viewEnvironmentWillChange:](self, "viewEnvironmentWillChange:", v10);
    objc_storeStrong((id *)&self->_viewEnvironment, a3);
    -[PXGLayout viewEnvironmentDidChange](self, "viewEnvironmentDidChange");
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __32__PXGLayout_setViewEnvironment___block_invoke;
    v11[3] = &unk_1E5118AE0;
    v12 = v10;
    objc_msgSend(v9, "enumerateSublayoutsUsingBlock:", v11);

    v6 = v12;
LABEL_4:

  }
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    -[PXGLayout displayScaleDidChange](self, "displayScaleDidChange");
  }
}

- (void)setUserInterfaceDirection:(unint64_t)a3
{
  if (self->_userInterfaceDirection != a3)
  {
    self->_userInterfaceDirection = a3;
    -[PXGLayout userInterfaceDirectionDidChange](self, "userInterfaceDirectionDidChange");
  }
}

- (id)createAnchorFromSuperlayoutWithSublayoutIndex:(int64_t)a3 sublayoutPositionEdges:(unint64_t)a4 ignoringScrollingAnimationAnchors:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v5 = a5;
  -[PXGLayout superlayout](self, "superlayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5 && objc_msgSend(v10, "isScrollingAnimationAnchor"))
  {

    v11 = 0;
  }
  v12 = objc_msgSend(v11, "type");
  if ((unint64_t)(v12 - 3) < 3)
  {
    v13 = objc_msgSend(v11, "edges") & a4;
    if (v13)
    {
      v14 = (void *)objc_msgSend(v11, "copyWithLayout:", self);
      objc_msgSend(v14, "setEdges:", v13);
      -[PXGLayout addAnchor:](self, "addAnchor:", v14);
      goto LABEL_13;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_13;
  }
  if ((unint64_t)(v12 - 1) > 1)
    goto LABEL_10;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __127__PXGLayout_PXGAnchor__createAnchorFromSuperlayoutWithSublayoutIndex_sublayoutPositionEdges_ignoringScrollingAnimationAnchors___block_invoke;
  v16[3] = &unk_1E5126AC0;
  v18 = &v20;
  v19 = a3;
  v17 = v9;
  objc_msgSend(v11, "enumerateAllSpriteReferencesUsingBlock:", v16);
  if (*((_BYTE *)v21 + 24))
  {
    v14 = (void *)objc_msgSend(v11, "copyWithLayout:", self);
    -[PXGLayout addAnchor:](self, "addAnchor:", v14);
  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v20, 8);
LABEL_13:

  return v14;
}

- (void)setReferenceDepth:(double)a3
{
  if (self->_referenceDepth != a3)
  {
    self->_referenceDepth = a3;
    -[PXGLayout referenceDepthDidChange](self, "referenceDepthDidChange");
  }
}

- (void)didUpdateSublayout:(id)a3
{
  -[NSMutableSet removeObject:](self->_sublayoutsExpectedToBeUpdatedInUpdatePass, "removeObject:", a3);
}

- (void)setReferenceOptions:(unsigned __int16)a3
{
  if (self->_referenceOptions != a3)
  {
    self->_referenceOptions = a3;
    -[PXGLayout referenceOptionsDidChange](self, "referenceOptionsDidChange");
  }
}

- (void)addAnchor:(id)a3
{
  uint64_t v5;
  id v6;

  v6 = a3;
  v5 = objc_msgSend(v6, "priority");
  if (v5 >= -[PXGAnchor priority](self->_activeAnchor, "priority"))
  {
    -[PXGAnchor invalidate](self->_activeAnchor, "invalidate");
    objc_storeStrong((id *)&self->_activeAnchor, a3);
    -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);
    -[PXGLayout sublayout:didAddAnchor:](self, "sublayout:didAddAnchor:", self, v6);
  }

}

- (void)sublayout:(id)a3 didAddAnchor:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  ++self->_numberOfDescendantAnchors;
  v5 = a4;
  -[PXGLayout superlayout](self, "superlayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sublayout:didAddAnchor:", self, v5);

  v7 = objc_msgSend(v5, "type");
  if (v7 <= 5 && ((1 << v7) & 0x34) != 0)
    -[PXGLayout clearLastVisibleAreaAnchoringInformation](self, "clearLastVisibleAreaAnchoringInformation");
}

- (void)removeAnchor:(id)a3
{
  PXGAnchor *v4;
  PXGAnchor *v5;

  v4 = (PXGAnchor *)a3;
  if (self->_activeAnchor == v4)
  {
    self->_activeAnchor = 0;
    v5 = v4;

    -[PXGLayout sublayout:didRemoveAnchor:](self, "sublayout:didRemoveAnchor:", self, v5);
    v4 = v5;
  }

}

- (void)sublayout:(id)a3 didRemoveAnchor:(id)a4
{
  id v5;
  id v6;

  --self->_numberOfDescendantAnchors;
  v5 = a4;
  -[PXGLayout superlayout](self, "superlayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sublayout:didRemoveAnchor:", self, v5);

}

- (id)_createAnchorWithPriority:(int64_t)a3 constraints:(id)a4
{
  void (**v7)(id, PXGAnchorConstraintsBuilder *);
  PXGAnchorConstraintsBuilder *v8;
  void *v9;
  PXGAnchor *v10;
  void *v11;
  uint64_t v13;
  SEL v14;

  v7 = (void (**)(id, PXGAnchorConstraintsBuilder *))a4;
  v8 = objc_alloc_init(PXGAnchorConstraintsBuilder);
  v7[2](v7, v8);

  -[PXGAnchorConstraintsBuilder constraints](v8, "constraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXGAnchor initWithLayout:]([PXGAnchor alloc], "initWithLayout:", self);
  -[PXGAnchor setType:](v10, "setType:", 1);
  -[PXGAnchor setPriority:](v10, "setPriority:", a3);
  -[PXGAnchor setConstraints:](v10, "setConstraints:", v9);
  v13 = MEMORY[0x1E0C809B0];
  v14 = a2;
  PXMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGAnchor setSpriteRects:](v10, "setSpriteRects:", v11, v13, 3221225472, __62__PXGLayout_PXGAnchor___createAnchorWithPriority_constraints___block_invoke, &unk_1E5126A70, self, v14);

  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGAnchor setVisibleRect:](v10, "setVisibleRect:");
  -[PXGLayout addAnchor:](self, "addAnchor:", v10);

  return v10;
}

void __64__PXGLayout_PXGAnchor__createAnchorForVisibleAreaIgnoringEdges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PXGLayout_PXGAnchor__createAnchorForVisibleAreaIgnoringEdges___block_invoke_2;
  v6[3] = &unk_1E5126A20;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v6);

}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke;
  v6[3] = &unk_1E5121650;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXGLayout enumerateVisibleAnchoringLayoutsUsingBlock:](self, "enumerateVisibleAnchoringLayoutsUsingBlock:", v6);

}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  SEL v25;
  _QWORD v26[4];
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v5 = a3;
  if (-[PXGLayout numberOfSublayouts](self, "numberOfSublayouts"))
  {
    -[PXGLayout visibleRect](self, "visibleRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    PXRectGetCenter();
    v15 = v14;
    v17 = v16;
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __56__PXGLayout_enumerateVisibleAnchoringLayoutsUsingBlock___block_invoke;
    v26[3] = &unk_1E5118D78;
    v28 = v7;
    v29 = v9;
    v30 = v11;
    v31 = v13;
    v27 = v19;
    v32 = v15;
    v33 = v17;
    v21 = v19;
    objc_msgSend(v18, "enumerateSublayoutsInRect:usingBlock:", v26, v7, v9, v11, v13);
    objc_msgSend(v21, "keysSortedByValueUsingSelector:", sel_compare_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __56__PXGLayout_enumerateVisibleAnchoringLayoutsUsingBlock___block_invoke_2;
    v23[3] = &unk_1E5118DA0;
    v23[4] = self;
    v25 = a2;
    v24 = v5;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v23);

  }
  else
  {
    v34 = 0;
    (*((void (**)(id, PXGLayout *, char *))v5 + 2))(v5, self, &v34);
  }

}

void __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  _QWORD v25[4];

  v3 = a2;
  v4 = v3;
  v5 = *(id *)(a1 + 32);
  if (v5 == v3)
  {
    objc_msgSend(v3, "visibleRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    PXRectGetCenter();
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0x7FEFFFFFFFFFFFFFLL;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = -1;
    v14 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke_2;
    v20[3] = &unk_1E5146A30;
    v20[6] = v15;
    v20[7] = v16;
    v20[4] = v25;
    v20[5] = &v21;
    objc_msgSend(v14, "enumerateSpritesInRect:usingBlock:", v20, v7, v9, v11, v13);
    if (*((_DWORD *)v22 + 6) != -1)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v25, 8);
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke_3;
    v17[3] = &unk_1E5118D50;
    v17[4] = v5;
    v18 = v3;
    v19 = *(id *)(a1 + 40);
    objc_msgSend(v18, "enumerateVisibleAnchoringSpriteIndexesUsingBlock:", v17);

  }
}

- (int64_t)numberOfSublayouts
{
  void *v2;
  int64_t v3;

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  __int128 v4;
  _OWORD v5[3];
  uint64_t v6;

  v4 = *((_OWORD *)off_1E50B8368 + 1);
  v5[0] = *(_OWORD *)off_1E50B8368;
  v5[1] = v4;
  v5[2] = *((_OWORD *)off_1E50B8368 + 2);
  v6 = *((_QWORD *)off_1E50B8368 + 6);
  -[PXGLayout _enumerateSpritesInRect:transform:usingBlock:](self, "_enumerateSpritesInRect:transform:usingBlock:", v5, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_enumerateSpritesInRect:(CGRect)a3 transform:(id *)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  unsigned int v17;
  id v18;
  __int128 v19;
  double var1;
  void *v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  uint64_t *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  CGRect v46;
  CGRect v47;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXGLayout contentSize](self, "contentSize");
  v47.size.width = v14;
  v47.size.height = v15;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v47.origin.x = v12;
  v47.origin.y = v13;
  if (CGRectIntersectsRect(v46, v47))
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    if (v17)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke;
      v35[3] = &unk_1E5118EB8;
      v18 = v11;
      v19 = *(_OWORD *)&a4->var0.c;
      v38 = *(_OWORD *)&a4->var0.a;
      v39 = v19;
      v40 = *(_OWORD *)&a4->var0.tx;
      var1 = a4->var1;
      v35[4] = self;
      v36 = v18;
      v41 = var1;
      v37 = &v42;
      objc_msgSend(v16, "enumerateSpritesInRect:usingBlock:", v35, x, y, width, height);

    }
    if (!*((_BYTE *)v43 + 24))
    {
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2810000000;
      v34[3] = &unk_1A7E74EE7;
      v34[4] = v17;
      -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke_2;
      v23[3] = &unk_1E5118F08;
      v25 = v34;
      v26 = x;
      v27 = y;
      v28 = width;
      v29 = height;
      v22 = *(_OWORD *)&a4->var0.c;
      v30 = *(_OWORD *)&a4->var0.a;
      v31 = v22;
      v32 = *(_OWORD *)&a4->var0.tx;
      v33 = a4->var1;
      v24 = v11;
      objc_msgSend(v21, "enumerateSublayoutGeometriesUsingBlock:", v23);

      _Block_object_dispose(v34, 8);
    }

    _Block_object_dispose(&v42, 8);
  }

}

- (PXGLayout)init
{
  PXGLayout *v2;
  PXGLayout *v3;
  CGSize v4;
  NSArray *interactions;
  PXGBasicAXGroup *v11;
  PXGBasicAXGroup *reusableAXGroup;
  NSMutableSet *v13;
  NSMutableSet *sublayoutsExpectedToBeUpdatedInUpdatePass;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXGLayout;
  v2 = -[PXGLayout init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_displayMaximumHeadroom = 1.0;
    v2->_alpha = 1.0;
    v4 = *(CGSize *)(MEMORY[0x1E0C9D5E0] + 16);
    v2->_clippingRect.origin = (CGPoint)*MEMORY[0x1E0C9D5E0];
    v2->_clippingRect.size = v4;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v2->_referenceDepth = _Q0;
    interactions = v2->_interactions;
    v2->_interactions = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_storeStrong((id *)&v3->_layoutQueue, MEMORY[0x1E0C80D38]);
    if (init_onceToken_16717 != -1)
      dispatch_once(&init_onceToken_16717, &__block_literal_global_16718);
    objc_storeStrong((id *)&v3->_spriteMetadataStore, (id)init_spriteMetadataStore);
    v11 = -[PXGBasicAXGroup initWithLayout:]([PXGBasicAXGroup alloc], "initWithLayout:", v3);
    reusableAXGroup = v3->_reusableAXGroup;
    v3->_reusableAXGroup = v11;

    *(_OWORD *)&v3[1]._modifiedSpriteDataStore = xmmword_1A7C09230;
    *(_OWORD *)&v3[1]._interactions = unk_1A7C09240;
    *(_OWORD *)&v3[1]._entityManager = xmmword_1A7C09250;
    *(_OWORD *)&v3[1]._nestedAnchorVisibleRectChanges = xmmword_1A7C091F0;
    *(_OWORD *)&v3[1]._numberOfRepeatedSublayoutUpdatesInUpdatePass = unk_1A7C09200;
    *(_OWORD *)&v3[1]._needsUpdate = xmmword_1A7C09210;
    *(_OWORD *)&v3[1]._viewHostingSpriteIndex = unk_1A7C09220;
    *(_OWORD *)&v3[1]._changeDetails = xmmword_1A7C091B0;
    *(_OWORD *)&v3[1]._transitions = unk_1A7C091C0;
    *(_OWORD *)&v3[1]._spriteReferencesForHiddenSprites = xmmword_1A7C091D0;
    *(_OWORD *)&v3[1]._isRequestingVisibleRect = unk_1A7C091E0;
    *(_OWORD *)&v3[1].super.isa = PXGCameraConfigurationNull;
    *(_OWORD *)&v3[1]._updateFlags.updated = unk_1A7C091A0;
    if (-[PXGLayout allowsSublayoutUpdateCycleAssertions](v3, "allowsSublayoutUpdateCycleAssertions"))
    {
      v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      sublayoutsExpectedToBeUpdatedInUpdatePass = v3->_sublayoutsExpectedToBeUpdatedInUpdatePass;
      v3->_sublayoutsExpectedToBeUpdatedInUpdatePass = v13;

    }
    v3->_viewHostingSpriteIndex = -1;
  }
  return v3;
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  void *v2;
  char v3;

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableSublayoutUpdateCycleAssertions");

  return v3;
}

- (id)_createAnchorWithAnchor:(id)a3 resetPriority:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;

  v4 = a4;
  v6 = (void *)objc_msgSend(a3, "copyWithLayout:", self);
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustReferencedSpriteIndexesWithChangeDetails:appliedToLayout:", v7, self);

  if (v4)
    objc_msgSend(v6, "setPriority:", 1);
  -[PXGLayout addAnchor:](self, "addAnchor:", v6);
  return v6;
}

- (void)setLastBaseline:(double)a3
{
  id v5;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_lastBaseline = a3;
    -[PXGLayout superlayout](self, "superlayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sublayoutDidChangeLastBaseline:", self);

  }
}

- (unsigned)referenceOptions
{
  return self->_referenceOptions;
}

- (double)referenceDepth
{
  return self->_referenceDepth;
}

- (int64_t)scrollSpeedRegime
{
  return self->_scrollSpeedRegime;
}

- (CGPoint)lastScrollDirection
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastScrollDirection.x;
  y = self->_lastScrollDirection.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  id v5;

  self->_estimatedContentSize = a3;
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize = a3;
    -[PXGLayout contentSizeDidChange](self, "contentSizeDidChange");
    -[PXGLayout superlayout](self, "superlayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sublayoutDidChangeContentSize:", self);

  }
}

- (unint64_t)fullyVisibleEdgesWithEdgeTolerances:(UIEdgeInsets)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MinX;
  double MaxX;
  BOOL v18;
  uint64_t v19;
  uint64_t v21;
  double MinY;
  double MaxY;
  _BOOL8 v24;
  unint64_t v25;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXGLayout contentSize](self, "contentSize");
  v13 = v12;
  v15 = v14;
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  MinX = CGRectGetMinX(v28);
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  MaxX = CGRectGetMaxX(v29);
  v18 = MaxX <= 0.0 || MinX > 0.0;
  v19 = 2;
  if (v18)
    v19 = 0;
  if (v13 > MaxX || v13 <= MinX)
    v21 = v19;
  else
    v21 = v19 | 8;
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  MinY = CGRectGetMinY(v30);
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  MaxY = CGRectGetMaxY(v31);
  v24 = MaxY > 0.0 && MinY <= 0.0;
  v25 = v21 | v24;
  if (v15 > MaxY || v15 <= MinY)
    return v25;
  else
    return v25 | 4;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)contentSizeDidChange
{
  id v2;

  -[PXGLayout axGroup](self, "axGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateVisibility");

}

- (void)visibleRectDidChange
{
  id v3;

  if (!self->_isRequestingVisibleRect)
  {
    -[PXGLayout axGroup](self, "axGroup");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateVisibility");
    objc_msgSend(v3, "invalidateLeafs");
    -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);

  }
}

- (double)lastBaseline
{
  return self->_lastBaseline;
}

- (void)applySectionedChangeDetails:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5 sublayoutProvider:(id)a6 outChangedSections:(id *)a7 outSectionsWithItemChanges:(id *)a8 changeMediaVersionHandler:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PXGDataSourceChange *v18;
  _BOOL4 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  const void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v64;
  id obj;
  uint64_t v66;
  void *v67;
  void *v68;
  PXGLayout *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  PXGLayout *v79;
  id v80;
  SEL v81;
  _QWORD v82[4];
  id v83;
  PXGLayout *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v64 = v14;
  v18 = -[PXGDataSourceChange initWithChangeDetails:dataSourceBeforeChanges:dataSourceAfterChanges:]([PXGDataSourceChange alloc], "initWithChangeDetails:dataSourceBeforeChanges:dataSourceAfterChanges:", v13, v14, v15);
  -[PXGLayout setInternalCurrentDataSourceChange:](self, "setInternalCurrentDataSourceChange:", v18);

  v93 = 0u;
  v94 = 0u;
  v19 = objc_msgSend(v13, "count") == 0;
  v95 = 0u;
  v96 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
  v68 = v16;
  v69 = self;
  if (v21)
  {
    v22 = v21;
    v23 = v20;
    v24 = *(_QWORD *)v94;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v94 != v24)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "sectionChanges");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "hasIncrementalChanges");

        if (!v27)
        {
          v19 = 1;
          goto LABEL_11;
        }
      }
      v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
      if (v22)
        continue;
      break;
    }
LABEL_11:
    v20 = v23;
    self = v69;
  }

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");
  if (v17)
    v30 = v17;
  else
    v30 = &__block_literal_global_116719;
  v31 = _Block_copy(v30);

  v32 = v64;
  if (v19)
  {
    v33 = v68;
    -[PXGLayout applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:](self, "applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:", 0, objc_msgSend(v15, "numberOfSections"), v68);
  }
  else
  {
    v58 = v31;
    v67 = v28;
    v60 = v15;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B3668, "indexPathSet");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v59 = v20;
    obj = v20;
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    if (v70)
    {
      v71 = v29;
      v66 = *(_QWORD *)v90;
      do
      {
        v37 = 0;
        v38 = v34;
        do
        {
          if (*(_QWORD *)v90 != v66)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v37);
          objc_msgSend(v39, "sectionChanges");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "insertedIndexes");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count") + v71;
          objc_msgSend(v40, "removedIndexes");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v42 - objc_msgSend(v43, "count");

          v71 = v44;
          -[PXGLayout applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:](v69, "applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:", v40, v44, v68);
          objc_msgSend(v40, "indexSetAfterApplyingChangesToIndexSet:", v38);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v45, "mutableCopy");

          objc_msgSend(v40, "changedIndexes");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addIndexes:", v46);

          objc_msgSend(v40, "indexSetAfterApplyingChangesToIndexSet:", v35);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v47, "mutableCopy");

          objc_msgSend(v39, "sectionsWithItemChanges");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addIndexes:", v49);

          objc_msgSend(v39, "indexPathSetAfterApplyingChangesToIndexPathSet:hasIncrementalChanges:", v36, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(v50, "mutableCopy");

          objc_msgSend(v39, "sectionsWithItemChanges");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_2;
          v82[3] = &unk_1E5128980;
          v83 = v67;
          v84 = v69;
          v85 = v39;
          v36 = v51;
          v86 = v36;
          v35 = v48;
          v87 = v35;
          v88 = v68;
          objc_msgSend(v52, "enumerateIndexesUsingBlock:", v82);

          ++v37;
          v38 = v34;
        }
        while (v70 != v37);
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
      }
      while (v70);
    }

    if (a7)
      *a7 = (id)objc_msgSend(v34, "copy");
    v32 = v64;
    v33 = v68;
    v20 = v59;
    v28 = v67;
    if (a8)
      *a8 = (id)objc_msgSend(v35, "copy");
    v53 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_4;
    v77[3] = &unk_1E51289A8;
    v54 = obj;
    v78 = v54;
    v79 = v69;
    v80 = v36;
    v81 = a2;
    v55 = v36;
    objc_msgSend(v55, "enumerateDataSourceIdentifiers:", v77);
    v56 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v72[0] = v53;
    v72[1] = 3221225472;
    v72[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_5;
    v72[3] = &unk_1E5128A18;
    v73 = v67;
    v74 = v54;
    v75 = v56;
    v76 = v58;
    v57 = v56;
    objc_msgSend(v55, "enumerateItemIndexSetsUsingBlock:", v72);

    v31 = v58;
    v15 = v60;
  }

}

- (void)applySublayoutChangeDetails:(id)a3 countAfterChanges:(int64_t)a4 sublayoutProvider:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  void *v20;
  uint64_t v21;
  SEL v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  __CFArray *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  void *v38;
  PXGLayout *v39;
  PXGLayout *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void (**v50)(void);
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  SEL v60;
  _QWORD aBlock[5];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (objc_msgSend(v9, "hasIncrementalChanges"))
  {
    objc_msgSend(v9, "insertedIndexes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") + v12;
    objc_msgSend(v9, "removedIndexes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14 - objc_msgSend(v15, "count");

    if (v16 != a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 1186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("countBeforeChange + sublayoutChangeDetails.insertedIndexes.count - sublayoutChangeDetails.removedIndexes.count == countAfterChanges"));

    }
    objc_msgSend(v9, "removedIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout removeSublayoutsAtIndexes:](self, "removeSublayoutsAtIndexes:", v17);

    objc_msgSend(v9, "insertedIndexes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout insertSublayoutProvider:atIndexes:](self, "insertSublayoutProvider:atIndexes:", v10, v18);

    if (objc_msgSend(v9, "hasMoves"))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke;
      aBlock[3] = &unk_1E5148158;
      aBlock[4] = self;
      v19 = (void (**)(void))_Block_copy(aBlock);
      v19[2]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v9, "movesFromIndexes");
      objc_msgSend(v9, "movesToIndexes");
      v22 = a2;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "moveSublayoutsFromIndexes:toIndexes:", v21, v23);

      v50 = v19;
      ((void (*)(void (**)(void)))v19[2])(v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke_3;
      v55[3] = &unk_1E5118C38;
      v55[4] = self;
      v49 = v20;
      v56 = v49;
      v48 = v24;
      v57 = v48;
      v27 = v25;
      v58 = v27;
      v60 = v22;
      v28 = v26;
      v59 = v28;
      objc_msgSend(v9, "enumerateMovedIndexesUsingBlock:", v55);
      v29 = objc_msgSend(v28, "count");
      v47 = v27;
      if (v29 != objc_msgSend(v27, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v22, self, CFSTR("PXGLayout.m"), 1226, CFSTR("Count mismatch"));

      }
      objc_msgSend(v28, "count");
      v30 = (__CFArray *)PXCreateMutableIntegerArrayRef();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v31 = v28;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v52 != v34)
              objc_enumerationMutation(v31);
            CFArrayAppendValue(v30, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "integerValue"));
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        }
        while (v33);
      }

      v36 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, v47, v30, 0);
      CFRelease(v30);
      -[PXGLayout superlayout](self, "superlayout");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      if (v37)
        v39 = (PXGLayout *)v37;
      else
        v39 = self;
      v40 = v39;

      -[PXGLayout sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:](v40, "sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:", self, v36, self);
    }
    v41 = objc_alloc((Class)off_1E50B1608);
    objc_msgSend(v9, "insertedIndexes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "movesToIndexes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v41, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, v42, v43, objc_msgSend(v9, "movesFromIndexes"), 0);

  }
  else
  {
    -[PXGLayout removeSublayoutsInRange:](self, "removeSublayoutsInRange:", 0, v12);
    -[PXGLayout insertSublayoutProvider:inRange:](self, "insertSublayoutProvider:inRange:", v10, 0, a4);
    objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", 0, a4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXGLayout didApplySublayoutChangeDetails:axAdjustedSubgroupChangeDetails:countAfterChanges:](self, "didApplySublayoutChangeDetails:axAdjustedSubgroupChangeDetails:countAfterChanges:", v9, v44, a4);

}

- (void)didApplySublayoutChangeDetails:(id)a3 axAdjustedSubgroupChangeDetails:(id)a4 countAfterChanges:(int64_t)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[PXGLayout axGroup](self, "axGroup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSubgroupsWithChangeDetails:", v6);

}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  _QWORD v7[5];

  length = a3.length;
  location = a3.location;
  -[PXGLayout invalidateVersion](self, "invalidateVersion");
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__PXGLayout_removeSublayoutsInRange___block_invoke;
  v7[3] = &unk_1E5118AE0;
  v7[4] = self;
  objc_msgSend(v6, "enumerateSublayoutsInRange:options:usingBlock:", location, length, 2, v7);
  objc_msgSend(v6, "removeSublayoutsInRange:", location, length);

}

- (void)removeSublayoutsAtIndexes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__PXGLayout_removeSublayoutsAtIndexes___block_invoke;
  v3[3] = &unk_1E5140880;
  v3[4] = self;
  objc_msgSend(a3, "enumerateRangesWithOptions:usingBlock:", 2, v3);
}

- (void)insertSublayoutProvider:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PXGLayout_insertSublayoutProvider_atIndexes___block_invoke;
  v8[3] = &unk_1E5118C60;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a4, "enumerateRangesUsingBlock:", v8);

}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[PXGLayout invalidateVersion](self, "invalidateVersion");
  -[PXGLayout _ensureSublayoutDataStore](self, "_ensureSublayoutDataStore");
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertSublayoutProvider:inRange:", v7, location, length);

}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v3 = a3;
  v6 = a3;
  v7 = a2;
  v8 = a2 | ((unint64_t)a3 << 32);
  objc_msgSend(*(id *)(a1 + 32), "insertSpritesInRange:", v8);
  objc_msgSend(*(id *)(a1 + 40), "insertSpritesInRange:", v8);
  objc_msgSend(*(id *)(a1 + 48), "_incrementNumberOfSprites:", v6);
  if (a2 + v3 > a2)
  {
    v9 = 40 * v7;
    v17 = *((_OWORD *)off_1E50B8398 + 1);
    v18 = *(_OWORD *)off_1E50B8398;
    v10 = *((_QWORD *)off_1E50B8398 + 4);
    do
    {
      v11 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "infos") + v9;
      *(_OWORD *)v11 = v18;
      *(_OWORD *)(v11 + 16) = v17;
      *(_QWORD *)(v11 + 32) = v10;
      v9 += 40;
      --v3;
    }
    while (v3);
  }
  v12 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "entities") + 4 * v7;
  objc_msgSend(*(id *)(a1 + 48), "entityManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createEntitiesWithCount:addingToArray:", v6, v12);

  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
  {
    v15 = *(void **)(a1 + 32);
    if (v15)
    {
      objc_msgSend(v15, "spritesInRange:", v8);
    }
    else
    {
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
    }
    (*(void (**)(uint64_t, unint64_t, __int128 *))(v14 + 16))(v14, v8, &v19);
  }
  return objc_msgSend(*(id *)(a1 + 40), "copySpritesInRange:fromSpriteDataStore:", v8, *(_QWORD *)(a1 + 32), v17, v18, v19, v20, v21);
}

- (void)_willAddSublayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setSuperlayout:", self);
  -[PXGLayout layoutQueue](self, "layoutQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutQueue:", v5);

  objc_msgSend(v4, "setAxNextResponder:", self);
  -[PXGLayout mediaProvider](self, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaProvider:", v6);

  -[PXGLayout entityManager](self, "entityManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntityManager:", v7);

}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (void)setMediaProvider:(id)a3
{
  void *v5;
  PXMediaProvider *v6;
  _QWORD v7[4];
  PXMediaProvider *v8;

  v6 = (PXMediaProvider *)a3;
  if (self->_mediaProvider != v6)
  {
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__PXGLayout_setMediaProvider___block_invoke;
    v7[3] = &unk_1E5118AE0;
    v8 = v6;
    objc_msgSend(v5, "enumerateSublayoutsUsingBlock:", v7);

    -[PXGLayout mediaProviderDidChange](self, "mediaProviderDidChange");
  }

}

- (void)setEntityManager:(id)a3
{
  PXGEntityManager *v5;
  PXGEntityManager *entityManager;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PXGEntityManager *v16;

  v5 = (PXGEntityManager *)a3;
  entityManager = self->_entityManager;
  if (entityManager != v5)
  {
    v16 = v5;
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "entities");
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGEntityManager destroyEntities:count:](entityManager, "destroyEntities:count:", v8, objc_msgSend(v9, "count"));

    objc_storeStrong((id *)&self->_entityManager, a3);
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v11 = objc_msgSend(v10, "count");
      -[PXGLayout spriteDataStore](self, "spriteDataStore");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[PXGEntityManager createEntitiesWithCount:addingToArray:](v16, "createEntitiesWithCount:addingToArray:", v11, objc_msgSend(v12, "entities"));

    }
    else
    {
      objc_msgSend(v10, "clearEntities");
    }

    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") >= 1)
    {
      v14 = 0;
      do
      {
        objc_msgSend(v13, "sublayoutAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEntityManager:", v16);

        ++v14;
      }
      while (v14 < objc_msgSend(v13, "count"));
    }
    -[PXGLayout entityManagerDidChange](self, "entityManagerDidChange");

    v5 = v16;
  }

}

- (void)setLayoutQueue:(id)a3
{
  void *v5;
  OS_dispatch_queue *v6;
  _QWORD v7[4];
  OS_dispatch_queue *v8;

  v6 = (OS_dispatch_queue *)a3;
  if (self->_layoutQueue != v6)
  {
    objc_storeStrong((id *)&self->_layoutQueue, a3);
    -[PXGLayout layoutQueueDidChange](self, "layoutQueueDidChange");
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__PXGLayout_setLayoutQueue___block_invoke;
    v7[3] = &unk_1E5118AE0;
    v8 = v6;
    objc_msgSend(v5, "enumerateSublayoutsUsingBlock:", v7);

  }
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_axNextResponder, a3);
}

- (void)setSuperlayout:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_superlayout);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_superlayout, obj);
    -[PXGLayout superlayoutDidChange](self, "superlayoutDidChange");
    v5 = obj;
  }

}

- (void)superlayoutDidChange
{
  void *v3;

  -[PXGLayout superlayout](self, "superlayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXGLayout setInternalCurrentDataSourceChange:](self, "setInternalCurrentDataSourceChange:", 0);
    -[PXGLayout setAppearState:](self, "setAppearState:", 3);
  }
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

void __56__PXGLayout_enumerateVisibleAnchoringLayoutsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "sublayoutAtIndex:loadIfNeeded:", objc_msgSend(a2, "integerValue"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXGLayout.m"), 1776, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sublayout != nil"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)sublayoutAtIndex:(int64_t)a3 loadIfNeeded:(BOOL)a4
{
  void *v7;
  id v8;
  _QWORD v10[6];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16611;
  v16 = __Block_byref_object_dispose__16612;
  v17 = 0;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__PXGLayout_sublayoutAtIndex_loadIfNeeded___block_invoke;
  v10[3] = &unk_1E5118C88;
  v11 = a4;
  v10[4] = self;
  v10[5] = &v12;
  objc_msgSend(v7, "enumerateSublayoutGeometriesInRange:options:usingBlock:", a3, 1, 0, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)setFloatingOffset:(double)a3
{
  if (self->_floatingOffset != a3)
  {
    self->_floatingOffset = a3;
    -[PXGLayout floatingOffsetDidChange](self, "floatingOffsetDidChange");
  }
}

- (void)setFloating:(BOOL)a3
{
  if (self->_floating != a3)
  {
    self->_floating = a3;
    -[PXGLayout floatingDidChange](self, "floatingDidChange");
  }
}

void __56__PXGLayout_enumerateVisibleAnchoringLayoutsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (CGRectIntersectsRect(*(CGRect *)&a3, *(CGRect *)(a1 + 40)))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    PXRectShortestDistanceToPoint();
    objc_msgSend(v8, "numberWithDouble:");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
}

void __43__PXGLayout_sublayoutAtIndex_loadIfNeeded___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (*a4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *a4);
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = a4[1];
    objc_msgSend(v9, "layout:createSublayoutAtIndex:", v8, a2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v13)
    {
      v14 = v13;
      if (*a4 != v14)
      {

        *a4 = v14;
      }

      v15 = *(double *)(a3 + 32);
      v16 = *(double *)(a3 + 40);
      if (PXSizeIsNull())
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "contentSize");
        v15 = v17;
        v16 = v18;
      }
      objc_msgSend(*(id *)(a1 + 32), "didFaultInSublayout:atIndex:fromEstimatedContentSize:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2, v15, v16);
    }
  }
}

uint64_t __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  if (*a4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;
  double v5;
  uint64_t v6;

  PXRectWithCenterAndSize();
  PXRectGetCenter();
  result = PXDistanceBetweenPoints();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v5 < *(double *)(v6 + 24))
  {
    *(double *)(v6 + 24) = v5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  return result;
}

- (void)willUpdate
{
  void *v2;
  id v3;

  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGLayout willUpdate]");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PXGLayout.m"), 606, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

uint64_t __42__PXGLayout_installLayoutCompletionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __62__PXGLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "convertSpriteIndex:fromDescendantLayout:", a2, *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16611;
  v10 = __Block_byref_object_dispose__16612;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PXGLayout_objectReferenceForSpriteIndex___block_invoke;
  v5[3] = &unk_1E5118E68;
  v5[4] = self;
  v5[5] = &v6;
  -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", a3 | 0x100000000, 0, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- ($F075B4A35807C7876885CD3A0A1A7192)displayAssetSourceRespondsTo
{
  __int16 v2;
  uint64_t v3;
  $F075B4A35807C7876885CD3A0A1A7192 result;

  v2 = *(_WORD *)&self->_displayAssetSourceRespondsTo.useLowMemoryDecodeInLayout;
  v3 = *(_QWORD *)&self->_displayAssetSourceRespondsTo.supportedDisplayAssetPresentationStylesInLayout;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  result.var6 = BYTE6(v3);
  result.var7 = HIBYTE(v3);
  result.var8 = v2;
  result.var9 = HIBYTE(v2);
  return result;
}

- (id)spriteReferenceForSpriteIndex:(unsigned int)a3 objectReference:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[PXGSpriteReference _init]([PXGSpriteReference alloc], "_init");
  objc_msgSend(v7, "setSpriteIndex:", v4);
  if ((_DWORD)v4 != -1)
  {
    objc_msgSend(v7, "setLayoutVersion:", -[PXGLayout version](self, "version"));
    if (!v6)
    {
      if (-[PXGLayout allowsObjectReferenceSpriteIndexLookup](self, "allowsObjectReferenceSpriteIndexLookup"))
      {
        -[PXGLayout objectReferenceForSpriteIndex:](self, "objectReferenceForSpriteIndex:", v4);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
  }
  objc_msgSend(v7, "setObjectReference:", v6);
  objc_msgSend(v7, "setLayout:", self);

  return v7;
}

- (PXGLayout)nextViewHostingLayout
{
  PXGLayout **p_nextViewHostingLayout;
  id WeakRetained;
  void *v5;

  p_nextViewHostingLayout = &self->_nextViewHostingLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_nextViewHostingLayout);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_nextViewHostingLayout);
  }
  else
  {
    -[PXGLayout superlayout](self, "superlayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXGLayout *)v5;
}

- (unsigned)viewHostingSpriteIndex
{
  return self->_viewHostingSpriteIndex;
}

- (id)leafSublayoutForSpriteIndex:(unsigned int)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (a3 == -1)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16611;
  v10 = __Block_byref_object_dispose__16612;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PXGLayout_leafSublayoutForSpriteIndex___block_invoke;
  v5[3] = &unk_1E5131B88;
  v5[4] = &v6;
  -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", a3 | 0x100000000, 1, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4
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
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXGLayout ancestorSharedWithLayout:](self, "ancestorSharedWithLayout:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "convertRect:fromDescendantLayout:", v9, x, y, width, height);
    objc_msgSend(v11, "convertRect:toDescendantLayout:", self);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D628];
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toDescendantLayout:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = *MEMORY[0x1E0C9D628];
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (!CGRectIsNull(v22))
  {
    -[PXGLayout _offsetToDescendantLayout:](self, "_offsetToDescendantLayout:", v9);
    v20 = v15;
    v21 = v14;
    if ((PXPointIsNull() & 1) == 0)
    {
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v24 = CGRectOffset(v23, v21, v20);
      v10 = v24.origin.x;
      v11 = v24.origin.y;
      v12 = v24.size.width;
      v13 = v24.size.height;
    }
  }

  v16 = v10;
  v17 = v11;
  v18 = v12;
  v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromDescendantLayout:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v21 = *MEMORY[0x1E0C9D628];
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (!CGRectIsNull(v22))
  {
    -[PXGLayout _offsetToDescendantLayout:](self, "_offsetToDescendantLayout:", v9);
    v13 = v12;
    v15 = v14;
    if ((PXPointIsNull() & 1) == 0)
    {
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v24 = CGRectOffset(v23, -v13, -v15);
      v20 = v24.origin.y;
      v21 = v24.origin.x;
      v10 = v24.size.width;
      v11 = v24.size.height;
    }
  }

  v17 = v20;
  v16 = v21;
  v18 = v10;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGPoint)_offsetToDescendantLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  PXGLayout *v7;
  PXGLayout *v8;
  PXGLayout *v9;
  PXGLayout *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  CGPoint result;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v7 = (PXGLayout *)v4;
  v8 = v7;
  if (v7 != self)
  {
    while (1)
    {
      -[PXGLayout superlayout](v8, "superlayout", v18[0], v18[1], v19, v20, v21, v22, v23, v24, v25, v26);
      v9 = (PXGLayout *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v10 = v9;
      v25 = 0;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      memset(v18, 0, sizeof(v18));
      -[PXGLayout sublayoutDataStore](v9, "sublayoutDataStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "geometryForSublayout:", v8);
      }
      else
      {
        v25 = 0;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        memset(v18, 0, sizeof(v18));
      }

      if (PXPointIsNull())
      {
        v5 = *(double *)off_1E50B8580;
        v6 = *((double *)off_1E50B8580 + 1);

        goto LABEL_10;
      }
      PXPointSubtract();
      v5 = v13;
      v6 = v14;

      v8 = v10;
      if (v10 == self)
      {
        v8 = self;
        goto LABEL_10;
      }
    }
    PXAssertGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v18[0]) = 138412546;
      *(_QWORD *)((char *)v18 + 4) = v7;
      WORD6(v18[0]) = 2112;
      *(_QWORD *)((char *)v18 + 14) = self;
      _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "%@ isn't a descendant of %@", (uint8_t *)v18, 0x16u);
    }

    v5 = *(double *)off_1E50B8580;
    v6 = *((double *)off_1E50B8580 + 1);
  }
LABEL_10:

  v15 = v5;
  v16 = v6;
  result.y = v16;
  result.x = v15;
  return result;
}

- (unsigned)convertSpriteIndex:(unsigned int)a3 fromLayout:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[PXGLayout ancestorSharedWithLayout:](self, "ancestorSharedWithLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "convertSpriteIndex:toDescendantLayout:", objc_msgSend(v7, "convertSpriteIndex:fromDescendantLayout:", v4, v6), self);
  else
    v9 = -1;

  return v9;
}

- (unsigned)convertSpriteIndex:(unsigned int)a3 toDescendantLayout:(id)a4
{
  uint64_t v4;
  PXGLayout *v6;
  PXGLayout *v7;
  unsigned int v8;
  PXGLayout *v9;
  void *v10;
  uint64_t v11;
  int v12;
  _QWORD v14[4];
  PXGLayout *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v4 = *(_QWORD *)&a3;
  v6 = (PXGLayout *)a4;
  v7 = v6;
  v8 = -1;
  if ((_DWORD)v4 != -1 && v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = -1;
    if (v6 == self)
    {
      v20 = v4;
    }
    else
    {
      -[PXGLayout superlayout](v6, "superlayout");
      v9 = (PXGLayout *)objc_claimAutoreleasedReturnValue();

      if (v9 == self)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __51__PXGLayout_convertSpriteIndex_toDescendantLayout___block_invoke;
        v14[3] = &unk_1E5118E68;
        v15 = v7;
        v16 = &v17;
        -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", v4 | 0x100000000, 0, v14);

      }
      else
      {
        -[PXGLayout superlayout](v7, "superlayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", v4, v10);
          *((_DWORD *)v18 + 6) = v11;
          if ((_DWORD)v11 != -1)
          {
            v12 = objc_msgSend(v10, "convertSpriteIndex:toDescendantLayout:", v11, v7);
            *((_DWORD *)v18 + 6) = v12;
          }
        }

      }
    }
    v8 = *((_DWORD *)v18 + 6);
    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

- (id)ancestorSharedWithLayout:(id)a3
{
  id v4;
  PXGLayout *v5;
  PXGLayout *v6;
  PXGLayout *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = self;
  if (v5)
  {
    while (1)
    {
      v6 = (PXGLayout *)v4;
      if (v4)
        break;
LABEL_6:
      -[PXGLayout superlayout](v5, "superlayout");
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (PXGLayout *)v9;
      if (!v9)
        goto LABEL_9;
    }
    v7 = v6;
    while (v5 != v7)
    {
      -[PXGLayout superlayout](v7, "superlayout");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (PXGLayout *)v8;
      if (!v8)
        goto LABEL_6;
    }

  }
LABEL_9:

  return v5;
}

- (unsigned)convertSpriteIndex:(unsigned int)a3 fromDescendantLayout:(id)a4
{
  return -[PXGLayout convertSpriteIndexRange:fromDescendantLayout:](self, "convertSpriteIndexRange:fromDescendantLayout:", a3 | 0x100000000, a4);
}

- (_PXGSpriteIndexRange)convertSpriteIndexRange:(_PXGSpriteIndexRange)a3 fromDescendantLayout:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  PXGLayout *v9;
  PXGLayout *v10;
  PXGLayout *v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a4;
  v7 = v6;
  if (a3.location == -1 || !v6)
  {
    a3.location = *(_DWORD *)off_1E50B8378;
    v8 = *((unsigned int *)off_1E50B8378 + 1);
  }
  else
  {
    v8 = HIDWORD(*(unint64_t *)&a3);
    v9 = (PXGLayout *)v6;
    if (v9 != self)
    {
      while (1)
      {
        -[PXGLayout superlayout](v9, "superlayout");
        v10 = (PXGLayout *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          break;
        v11 = v10;
        -[PXGLayout spriteDataStore](v10, "spriteDataStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");
        -[PXGLayout sublayoutDataStore](v11, "sublayoutDataStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        a3.location += v13 + objc_msgSend(v14, "spriteIndexOriginForSublayout:", v9);

        v9 = v11;
        if (v11 == self)
        {
          v9 = self;
          goto LABEL_9;
        }
      }
      a3.location = *(_DWORD *)off_1E50B8378;
      v8 = *((unsigned int *)off_1E50B8378 + 1);
    }
LABEL_9:

  }
  return (_PXGSpriteIndexRange)(a3.location | (v8 << 32));
}

- (CGPoint)convertPoint:(CGPoint)a3 fromLayout:(id)a4
{
  double x;
  double y;
  _BOOL4 IsNull;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;

  -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  x = v10.origin.x;
  y = v10.origin.y;
  IsNull = CGRectIsNull(v10);
  v7 = *(double *)off_1E50B8580;
  v8 = *((double *)off_1E50B8580 + 1);
  if (!IsNull)
  {
    v7 = x;
    v8 = y;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)allowsObjectReferenceSpriteIndexLookup
{
  return -[PXGLayout version](self, "version") > 0;
}

- (int64_t)scrollableAxis
{
  return 1;
}

- (BOOL)shouldUpdateDecorationMediaTargetSizes
{
  return 1;
}

- (BOOL)shouldDecorateUndefinedMediaKind
{
  return 1;
}

- (void)viewEnvironmentDidChange
{
  void *v3;
  int v4;
  id v5;

  -[PXGLayout viewEnvironment](self, "viewEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityEnabled");

  if (v4)
  {
    -[PXGLayout axGroup](self, "axGroup");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeafFeatures:", objc_msgSend(v5, "leafFeatures") | 4);

  }
}

- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5
{
  double height;
  double width;
  void *v9;
  id v10;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  objc_msgSend(v10, "setEstimatedContentSize:", width, height);
  -[PXGLayout _willAddSublayout:](self, "_willAddSublayout:", v10);
  objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", 0, objc_msgSend(v10, "numberOfSprites"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:](self, "sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:", v10, v9, v10);

  -[PXGLayout didAddSublayout:atIndex:flags:](self, "didAddSublayout:atIndex:flags:", v10, a4, 1);
}

- (void)setEstimatedContentSize:(CGSize)a3
{
  self->_estimatedContentSize = a3;
}

- (void)setViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewDelegate, a3);
}

- (void)setScrollDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollDelegate, a3);
}

- (void)setFocusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_focusDelegate, a3);
}

- (void)performChangesWithLocalUpdate:(id)a3
{
  _BOOL4 isPerformingWithLocalUpdate;

  isPerformingWithLocalUpdate = self->_isPerformingWithLocalUpdate;
  self->_isPerformingWithLocalUpdate = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isPerformingWithLocalUpdate = isPerformingWithLocalUpdate;
  if (!isPerformingWithLocalUpdate)
  {
    self->_needsUpdate = 1;
    -[PXGLayout updateIfNeeded](self, "updateIfNeeded");
  }
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    -[PXGLayout alphaDidChange](self, "alphaDidChange");
    if (-[PXGLayout appliesAlphaToSublayouts](self, "appliesAlphaToSublayouts"))
      -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);
  }
}

void __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "sublayoutAtIndex:", a2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutForItemChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(*(id *)(a1 + 40), "shouldApplyItemChangeDetailsToSublayout:", v13))
  {
    objc_msgSend(*(id *)(a1 + 48), "itemChangesInSection:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasIncrementalChanges"))
    {
      v6 = objc_msgSend(v4, "numberOfItems");
      objc_msgSend(v5, "insertedIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") + v6;
      objc_msgSend(v5, "removedIndexes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8 - objc_msgSend(v9, "count");

      objc_msgSend(v4, "setNumberOfItems:withChangeDetails:", v10, v5);
      v11 = *(void **)(a1 + 56);
      v12 = objc_msgSend(*(id *)(a1 + 48), "toDataSourceIdentifier");
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_3;
      v14[3] = &unk_1E5128958;
      v15 = v5;
      objc_msgSend(v11, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v12, a2, v14);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "removeIndex:", a2);
      objc_msgSend(*(id *)(a1 + 40), "removeSublayoutsInRange:", a2, 1);
      objc_msgSend(*(id *)(a1 + 40), "insertSublayoutProvider:inRange:", *(_QWORD *)(a1 + 72), a2, 1);
    }

  }
}

- (unint64_t)anchoredContentEdges
{
  void *v2;
  unint64_t v3;

  -[PXGLayout activeAnchor](self, "activeAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "anchoredContentEdges");

  return v3;
}

- (int64_t)anchoredSublayoutIndex
{
  void *v3;
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXGLayout activeAnchor](self, "activeAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PXGLayout superlayout](self, "superlayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__PXGLayout_anchoredSublayoutIndex__block_invoke;
  v7[3] = &unk_1E5121C28;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateAllSpriteReferencesUsingBlock:", v7);
  v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)performSpriteStylingUpdate:(id)a3
{
  BOOL isUpdatingSpriteStyling;

  isUpdatingSpriteStyling = self->_isUpdatingSpriteStyling;
  self->_isUpdatingSpriteStyling = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isUpdatingSpriteStyling = isUpdatingSpriteStyling;
}

- (void)installLayoutCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  -[PXGLayout layoutQueue](self, "layoutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!PXGLayoutCanInstallLayoutCompletionBlock)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "-installLayoutCompletionBlock: not supported in current configuration. If this is hit during a unit test, consider using -updateAsRootIfNeeded.", buf, 2u);
    }

  }
  if (PXGLayoutLayoutCompletionBlock)
  {
    v7 = _Block_copy((const void *)PXGLayoutLayoutCompletionBlock);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__PXGLayout_installLayoutCompletionBlock___block_invoke;
    v12[3] = &unk_1E513F8E8;
    v13 = v7;
    v14 = v4;
    v8 = v7;
    v9 = objc_msgSend(v12, "copy");
    v10 = (void *)PXGLayoutLayoutCompletionBlock;
    PXGLayoutLayoutCompletionBlock = v9;

  }
  else
  {
    v11 = objc_msgSend(v4, "copy");
    v8 = (id)PXGLayoutLayoutCompletionBlock;
    PXGLayoutLayoutCompletionBlock = v11;
  }

}

- (void)setContentSource:(id)a3
{
  PXGLayoutContentSource **p_contentSource;
  void *v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  char v18;
  id v19;

  p_contentSource = &self->_contentSource;
  v19 = a3;
  objc_storeWeak((id *)p_contentSource, v19);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = v19;
  else
    v5 = 0;
  v6 = objc_storeWeak((id *)&self->_displayAssetSource, v5);
  self->_displayAssetSourceRespondsTo.supportedDisplayAssetPresentationStylesInLayout = objc_opt_respondsToSelector() & 1;

  WeakRetained = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.minSpriteSizeForPresentationStyle = objc_opt_respondsToSelector() & 1;

  v8 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.displayAssetRequestObserverForSpritesInRangeInLayout = objc_opt_respondsToSelector() & 1;

  v9 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.videoPresentationControllerForDisplayAssetSpriteIndexInLayout = objc_opt_respondsToSelector() & 1;

  v10 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.adjustmentForDisplayAssetSpriteIndexInLayout = objc_opt_respondsToSelector() & 1;

  v11 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.presentationIntentForSpritesInRangeInLayout = objc_opt_respondsToSelector() & 1;

  v12 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.customMediaProviderForDisplayAssetsInLayout = objc_opt_respondsToSelector() & 1;

  v13 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.customPixelBufferSourcesProviderForDisplayAssetsInLayout = objc_opt_respondsToSelector() & 1;

  v14 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.useLowMemoryDecodeInLayout = objc_opt_respondsToSelector() & 1;

  v15 = objc_loadWeakRetained((id *)&self->_displayAssetSource);
  self->_displayAssetSourceRespondsTo.shouldApplyCleanApertureCropToStillImagesInLayout = objc_opt_respondsToSelector() & 1;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = v19;
  else
    v16 = 0;
  v17 = v16;
  self->_stringSourceRespondsTo.stringDrawingOptionsForSpriteAtIndexInLayout = objc_opt_respondsToSelector() & 1;
  self->_stringSourceRespondsTo.paddingForSpriteAtIndexInLayout = objc_opt_respondsToSelector() & 1;
  self->_stringSourceRespondsTo.drawingContextForSpriteAtIndexInLayout = objc_opt_respondsToSelector() & 1;
  v18 = objc_opt_respondsToSelector();

  self->_stringSourceRespondsTo.attributedStringBoundingSizeForSpriteAtIndexInLayout = v18 & 1;
}

- (unsigned)addResizableCapInsets:(id)a3
{
  float var3;
  float var2;
  float var1;
  float var0;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned __int16 v12;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  -[PXGLayout spriteMetadataStore](self, "spriteMetadataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = var0;
  *(float *)&v9 = var1;
  *(float *)&v10 = var2;
  *(float *)&v11 = var3;
  v12 = objc_msgSend(v7, "addResizableCapInsets:", v8, v9, v10, v11);

  return v12;
}

- (void)setUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updateDelegate, a3);
}

- (BOOL)shouldFaultInContentAtAnchoredContentEdges
{
  void *v2;
  char v3;

  -[PXGLayout activeAnchor](self, "activeAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldFaultInContentAtAnchoredContentEdges");

  return v3;
}

void __64__PXGLayout_PXGAnchor__createAnchorForVisibleAreaIgnoringEdges___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "spriteReferenceForSpriteIndex:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "keepSpriteWithReference:referencingOptions:visuallyStableForAttribute:", v5, 1, a3);

}

- (id)spriteReferenceForSpriteIndex:(unsigned int)a3
{
  return -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:", *(_QWORD *)&a3, 0);
}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyState___block_invoke;
  v12[3] = &unk_1E5118CD8;
  v13 = v10;
  v11 = v10;
  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyFullState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyFullState:", a3, v7, a5, v12);

}

- (NSArray)pendingAnimations
{
  void *v2;
  void *v3;

  -[PXGLayout rootLayout](self, "rootLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)createAnimation
{
  PXGAnimation *v3;
  void *v4;

  v3 = -[PXGAnimation initWithLayout:]([PXGAnimation alloc], "initWithLayout:", self);
  -[PXGLayout rootLayout](self, "rootLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:", v3);

  return v3;
}

- (void)addAnimation:(id)a3
{
  id v4;
  NSMutableArray *animations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  animations = self->_animations;
  v8 = v4;
  if (!animations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_animations;
    self->_animations = v6;

    v4 = v8;
    animations = self->_animations;
  }
  -[NSMutableArray addObject:](animations, "addObject:", v4);
  -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);

}

void __27__PXGLayout_updateIfNeeded__block_invoke()
{
  double v0;
  double v1;
  double v2;
  id v3;

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slowLayoutUpdateThreshold");
  v1 = v0 / 1000.0;
  PXTimebaseConversionFactor();
  updateIfNeeded_slowUpdateThreshold = (uint64_t)(v1 / v2);

}

void __17__PXGLayout_init__block_invoke()
{
  PXGSpriteMetadataStore *v0;
  void *v1;

  v0 = objc_alloc_init(PXGSpriteMetadataStore);
  v1 = (void *)init_spriteMetadataStore;
  init_spriteMetadataStore = (uint64_t)v0;

}

id __62__PXGLayout_PXGAnchor___createAnchorWithPriority_constraints___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "spriteReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXGAnchor.m"), 714, CFSTR("missing sprite reference for %@"), v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "anchoringRectForSpriteAtIndex:", objc_msgSend(*(id *)(a1 + 32), "spriteIndexForSpriteReference:options:", v4, 0));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)spriteIndexForSpriteReference:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "version");
    if (objc_msgSend(v6, "layoutVersion") == v9)
      v10 = objc_msgSend(v6, "spriteIndex");
    else
      v10 = 0xFFFFFFFFLL;
    objc_msgSend(v6, "objectReference");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if ((_DWORD)v10 != -1 || !v12)
      goto LABEL_21;
    if (objc_msgSend(v8, "allowsObjectReferenceSpriteIndexLookup"))
    {
      v21 = 0;
      v10 = objc_msgSend(v8, "spriteIndexForObjectReference:options:updatedObjectReference:", v13, a4, &v21);
      v14 = v21;
      v15 = v8;
      v16 = v13;
      v17 = v16;
      if ((_DWORD)v10 == -1)
      {

      }
      else
      {
        if (objc_msgSend(v15, "numberOfSprites") <= v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PXValidateLayoutSpriteIndexForObjectReference(PXGLayout * _Nonnull __strong, PXGSpriteIndex, id  _Nonnull __strong)");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXGLayout_Internal.h"), 224, CFSTR("%@ returned invalid spriteIndex %li for objectReference %@"), v15, v10, v17);

        }
        objc_msgSend(v6, "setSpriteIndex:", v10);
        objc_msgSend(v6, "setLayoutVersion:", v9);
        if (v14)
          objc_msgSend(v6, "setObjectReference:", v14);
      }
    }
    else
    {
      if ((a4 & 0x400) != 0)
      {
        v10 = 0xFFFFFFFFLL;
LABEL_21:
        v11 = -[PXGLayout convertSpriteIndex:fromLayout:](self, "convertSpriteIndex:fromLayout:", v10, v8);

        goto LABEL_22;
      }
      PXAssertGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v8;
        v24 = 2112;
        v25 = v6;
        _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "layout %@ is in the midst of its update pass, it is thus invalid to query the sprite index for sprite reference %@", buf, 0x16u);
      }
      v10 = 0xFFFFFFFFLL;
    }

    goto LABEL_21;
  }
  v11 = -1;
LABEL_22:

  return v11;
}

- (CGRect)anchoringRectForSpriteAtIndex:(unsigned int)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _OWORD v14[2];
  uint64_t v15;
  _OWORD v16[2];
  int v17;
  _OWORD v18[10];
  uint64_t v19;
  CGRect result;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = *(_DWORD *)off_1E50B8298;
  v3 = *((_OWORD *)off_1E50B8358 + 1);
  v16[0] = *(_OWORD *)off_1E50B8358;
  v16[1] = v3;
  v4 = *((_OWORD *)off_1E50B83A0 + 7);
  v18[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v18[7] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 9);
  v18[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v18[9] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 3);
  v18[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v18[3] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 5);
  v18[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v18[5] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 1);
  v18[0] = *(_OWORD *)off_1E50B83A0;
  v18[1] = v8;
  v9 = *((_OWORD *)off_1E50B8398 + 1);
  v14[0] = *(_OWORD *)off_1E50B8398;
  v14[1] = v9;
  v15 = *((_QWORD *)off_1E50B8398 + 4);
  -[PXGLayout copyLayoutForSpritesInRange:applySpriteTransforms:entities:geometries:styles:infos:](self, "copyLayoutForSpritesInRange:applySpriteTransforms:entities:geometries:styles:infos:", a3 | 0x100000000, 0, &v17, v16, v18, v14);
  PXRectWithCenterAndSize();
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)_createAnchorForContentEdges:(unint64_t)a3 priority:(int64_t)a4
{
  NSObject *v7;
  PXGAnchor *v8;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((a3 & 8) != 0 && (a3 & 0xA) != 8)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "invalid edges %li", (uint8_t *)&v10, 0xCu);
    }

  }
  v8 = -[PXGAnchor initWithLayout:]([PXGAnchor alloc], "initWithLayout:", self);
  -[PXGAnchor setType:](v8, "setType:", 3);
  -[PXGAnchor setEdges:](v8, "setEdges:", a3);
  -[PXGLayout estimatedContentSize](self, "estimatedContentSize");
  -[PXGAnchor setContentSize:](v8, "setContentSize:");
  -[PXGLayout visibleRect](self, "visibleRect");
  -[PXGAnchor setVisibleRect:](v8, "setVisibleRect:");
  -[PXGAnchor setPriority:](v8, "setPriority:", a4);
  -[PXGLayout addAnchor:](self, "addAnchor:", v8);
  return v8;
}

- (CGSize)estimatedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_estimatedContentSize.width;
  height = self->_estimatedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)createAnchorForScrollingToContentEdges:(unint64_t)a3 padding:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  NSObject *v10;
  PXGAnchor *v11;
  int v13;
  unint64_t v14;
  uint64_t v15;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v15 = *MEMORY[0x1E0C80C00];
  if ((a3 & 8) != 0 && (a3 & 0xA) != 8)
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 134217984;
      v14 = a3;
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "invalid edges %li", (uint8_t *)&v13, 0xCu);
    }

  }
  v11 = -[PXGAnchor initWithLayout:]([PXGAnchor alloc], "initWithLayout:", self);
  -[PXGAnchor setType:](v11, "setType:", 4);
  -[PXGAnchor setEdges:](v11, "setEdges:", a3);
  -[PXGAnchor setPadding:](v11, "setPadding:", top, left, bottom, right);
  -[PXGLayout addAnchor:](self, "addAnchor:", v11);
  return v11;
}

- (NSArray)pendingFences
{
  void *v2;
  void *v3;

  -[PXGLayout rootLayout](self, "rootLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PXGSpriteDataStore recycle](self->_spriteDataStore, "recycle");
  -[PXGBasicAXGroup unloadFromParent](self->_reusableAXGroup, "unloadFromParent");
  v3.receiver = self;
  v3.super_class = (Class)PXGLayout;
  -[PXGLayout dealloc](&v3, sel_dealloc);
}

- (void)_destroySpriteDataStore
{
  PXGSpriteDataStore *spriteDataStore;

  -[PXGSpriteDataStore recycle](self->_spriteDataStore, "recycle");
  spriteDataStore = self->_spriteDataStore;
  self->_spriteDataStore = 0;

}

- (void)_ensureModifiedSpriteDataStore
{
  PXGSpriteDataStore *v3;
  PXGSpriteDataStore *modifiedSpriteDataStore;
  void *v5;
  void *v6;
  PXGSpriteDataStore *v7;
  _OWORD v8[2];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if (!self->_modifiedSpriteDataStore)
  {
    v3 = (PXGSpriteDataStore *)objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
    modifiedSpriteDataStore = self->_modifiedSpriteDataStore;
    self->_modifiedSpriteDataStore = v3;

    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "sprites");
      v7 = self->_modifiedSpriteDataStore;
      v8[0] = v10;
      v8[1] = v11;
      v9 = v12;
      -[PXGSpriteDataStore setSprites:](v7, "setSprites:", v8);
    }

  }
}

- (void)_destroyModifiedSpriteDataStore
{
  PXGSpriteDataStore *modifiedSpriteDataStore;

  -[PXGSpriteDataStore recycle](self->_modifiedSpriteDataStore, "recycle");
  modifiedSpriteDataStore = self->_modifiedSpriteDataStore;
  self->_modifiedSpriteDataStore = 0;

}

- (unsigned)childrenNumberOfSprites
{
  unsigned int v3;

  v3 = -[PXGLayout numberOfSprites](self, "numberOfSprites");
  return v3 - -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PXGLayout contentSize](self, "contentSize");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (UIEdgeInsets)flexibleRegionInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)off_1E50B8020;
  v3 = *((double *)off_1E50B8020 + 1);
  v4 = *((double *)off_1E50B8020 + 2);
  v5 = *((double *)off_1E50B8020 + 3);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)convertSpriteIndexes:(id)a3 fromDescendantLayout:(id)a4
{
  id v7;
  PXGLayout *v8;
  PXGLayout *v9;
  PXGLayout *v10;
  PXGLayout *v11;
  PXGLayout *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v7 = a3;
  v8 = (PXGLayout *)a4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    if (v10 != self)
    {
      v11 = v10;
      do
      {
        v12 = v11;
        -[PXGLayout superlayout](v11, "superlayout");
        v11 = (PXGLayout *)objc_claimAutoreleasedReturnValue();
        -[PXGLayout spriteDataStore](v11, "spriteDataStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        -[PXGLayout sublayoutDataStore](v11, "sublayoutDataStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "spriteIndexOriginForSublayout:", v12);

      }
      while (v11 != self && v11);
      v17 = (v16 + v14);
      goto LABEL_7;
    }
LABEL_10:
    v19 = v7;
    v11 = v9;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descendantLayout"));

  if (!self)
    goto LABEL_10;
  v17 = 0;
  v11 = 0;
LABEL_7:
  v18 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__PXGLayout_convertSpriteIndexes_fromDescendantLayout___block_invoke;
  v22[3] = &unk_1E513A210;
  v24 = v17;
  v19 = v18;
  v23 = v19;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v22);

LABEL_11:
  return v19;
}

- (CGPoint)convertPoint:(CGPoint)a3 toDescendantLayout:(id)a4
{
  double x;
  double y;
  _BOOL4 IsNull;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;

  -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  x = v10.origin.x;
  y = v10.origin.y;
  IsNull = CGRectIsNull(v10);
  v7 = *(double *)off_1E50B8580;
  v8 = *((double *)off_1E50B8580 + 1);
  if (!IsNull)
  {
    v8 = y;
    v7 = x;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromDescendantLayout:(id)a4
{
  double x;
  double y;
  _BOOL4 IsNull;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;

  -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  x = v10.origin.x;
  y = v10.origin.y;
  IsNull = CGRectIsNull(v10);
  v7 = *(double *)off_1E50B8580;
  v8 = *((double *)off_1E50B8580 + 1);
  if (!IsNull)
  {
    v8 = y;
    v7 = x;
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)isDescendantOfLayout:(id)a3
{
  id v4;
  PXGLayout *v5;
  id v6;
  BOOL i;
  void *v8;

  v4 = a3;
  v5 = self;
  v6 = v5;
  for (i = v5 != 0; v6 != v4 && v6; i = v6 != 0)
  {
    v8 = v6;
    objc_msgSend(v6, "superlayout");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (UICoordinateSpace)coordinateSpace
{
  void *v3;
  void *v4;

  -[PXGLayout scrollDelegate](self, "scrollDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentCoordinateSpaceForLayout:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICoordinateSpace *)v4;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  void *v2;
  char v3;

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableLayoutDanglingUpdatesAssertions");

  return v3;
}

- (void)updateStylingForSpritesAtIndexes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  -[PXGLayout hiddenSpriteIndexes](self, "hiddenSpriteIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PXGLayout_updateStylingForSpritesAtIndexes___block_invoke;
  v8[3] = &unk_1E51457C8;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PXGLayout performSpriteStylingUpdate:](self, "performSpriteStylingUpdate:", v8);

}

- (void)updateAsRootIfNeeded
{
  PXGLayout *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXGLayout rootLayout](self, "rootLayout");
  v4 = (PXGLayout *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 709, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self == self.rootLayout"));

  }
  if (PXGLayoutCanInstallLayoutCompletionBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 710, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXGLayoutCanInstallLayoutCompletionBlock == NO"));

  }
  PXGLayoutCanInstallLayoutCompletionBlock = 1;
  -[PXGLayout updateIfNeeded](self, "updateIfNeeded");
  PXGLayoutCanInstallLayoutCompletionBlock = 0;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v9 = _Block_copy((const void *)PXGLayoutLayoutCompletionBlock);
    v5 = (void *)PXGLayoutLayoutCompletionBlock;
    PXGLayoutLayoutCompletionBlock = 0;

    v6 = v9;
    if (v9)
    {
      (*((void (**)(id))v9 + 2))(v9);
      v6 = v9;
    }

  }
}

- (id)viewForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[PXGLayout viewDelegate](self, "viewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout:viewForSpriteIndex:", self, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)containingScrollViewDidScroll:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v5;
  _QWORD v6[6];

  y = a3.y;
  x = a3.x;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PXGLayout_containingScrollViewDidScroll___block_invoke;
  v6[3] = &__block_descriptor_48_e26_v32__0q8__PXGLayout_16_B24l;
  *(CGFloat *)&v6[4] = x;
  *(CGFloat *)&v6[5] = y;
  objc_msgSend(v5, "enumerateSublayoutsUsingBlock:", v6);

}

- (void)setClippingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_clippingRect, a3))
  {
    self->_clippingRect.origin.x = x;
    self->_clippingRect.origin.y = y;
    self->_clippingRect.size.width = width;
    self->_clippingRect.size.height = height;
    -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);
  }
}

- (void)setSpriteModifier:(id)a3
{
  PXGLayoutSpriteModifier *v4;
  PXGLayoutSpriteModifier *spriteModifier;

  if (self->_spriteModifier != a3)
  {
    v4 = (PXGLayoutSpriteModifier *)objc_msgSend(a3, "copy");
    spriteModifier = self->_spriteModifier;
    self->_spriteModifier = v4;

    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32, &__block_literal_global_71);
  }
}

- (NSIndexSet)hiddenSpriteIndexes
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  PXGLayout *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v4 = -[PXGLayout numberOfSprites](self, "numberOfSprites") << 32;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __32__PXGLayout_hiddenSpriteIndexes__block_invoke;
  v12 = &unk_1E5118B90;
  v13 = self;
  v14 = v3;
  v5 = v3;
  -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", v4, 1, &v9);
  v6 = objc_alloc(MEMORY[0x1E0CB36B8]);
  v7 = (void *)objc_msgSend(v6, "initWithIndexSet:", v5, v9, v10, v11, v12, v13);

  return (NSIndexSet *)v7;
}

- (void)setHiddenSpriteIndexes:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *spriteReferencesForHiddenSprites;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  PXGLayout *v15;
  NSMutableArray *v16;
  uint8_t buf[16];

  v4 = a3;
  -[PXGLayout superlayout](self, "superlayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Hidden sprite indexes should be set on root layout only", buf, 2u);
    }

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __36__PXGLayout_setHiddenSpriteIndexes___block_invoke;
  v14 = &unk_1E51460E8;
  v15 = self;
  v8 = (NSMutableArray *)v7;
  v16 = v8;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v11);
  spriteReferencesForHiddenSprites = self->_spriteReferencesForHiddenSprites;
  self->_spriteReferencesForHiddenSprites = v8;
  v10 = v8;

  -[PXGLayout _propagateHiddenSpriteIndexes:](self, "_propagateHiddenSpriteIndexes:", v4, v11, v12, v13, v14, v15);
}

- (void)hideSpritesForObjectReferences:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *spriteReferencesForHiddenSprites;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXGLayout superlayout](self, "superlayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Hidden object references should be set on root layout only", buf, 2u);
    }

  }
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        v20 = 0;
        v17 = -[PXGLayout spriteIndexForObjectReference:options:updatedObjectReference:](self, "spriteIndexForObjectReference:options:updatedObjectReference:", v16, 0, &v20);
        v12 = v20;

        if ((_DWORD)v17 != -1)
        {
          -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:", v17, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v7, "addObject:", v18);
          objc_msgSend(v8, "addIndex:", v17);

        }
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  spriteReferencesForHiddenSprites = self->_spriteReferencesForHiddenSprites;
  self->_spriteReferencesForHiddenSprites = v7;

  -[PXGLayout _propagateHiddenSpriteIndexes:](self, "_propagateHiddenSpriteIndexes:", v8);
}

- (void)_propagateHiddenSpriteIndexes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a3;
  -[PXGLayout hiddenSpriteIndexes](self, "hiddenSpriteIndexes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v5, "removeIndexes:", v4);
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke;
  v10[3] = &unk_1E5140880;
  v10[4] = self;
  objc_msgSend(v5, "enumerateRangesUsingBlock:", v10);
  v7 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v7, "removeIndexes:", v8);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke_3;
  v9[3] = &unk_1E5140880;
  v9[4] = self;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v9);

}

- (void)_resetHiddenSpriteIndexes
{
  if (-[NSIndexSet count](self->_localHiddenSpriteIndexes, "count"))
  {
    -[PXGLayout _invalidateStyleOfSpritesWithIndexes:](self, "_invalidateStyleOfSpritesWithIndexes:", self->_localHiddenSpriteIndexes);
    -[PXGLayout localHiddenSpriteIndexesDidChange](self, "localHiddenSpriteIndexesDidChange");
  }
  -[PXGLayout setLocalHiddenSpriteIndexes:](self, "setLocalHiddenSpriteIndexes:", 0);
}

- (void)_recursivelyResetHiddenSpriteIndexes
{
  -[PXGLayout enumerateDescendantsLayoutsUsingBlock:](self, "enumerateDescendantsLayoutsUsingBlock:", &__block_literal_global_76);
}

- (void)_addHiddenSpriteIndexes:(id)a3
{
  NSUInteger v4;
  NSIndexSet *localHiddenSpriteIndexes;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[NSIndexSet count](self->_localHiddenSpriteIndexes, "count");
  localHiddenSpriteIndexes = self->_localHiddenSpriteIndexes;
  if (localHiddenSpriteIndexes)
  {
    v6 = (void *)-[NSIndexSet mutableCopy](localHiddenSpriteIndexes, "mutableCopy");
    objc_msgSend(v6, "addIndexes:", v7);
  }
  else
  {
    v6 = (void *)objc_msgSend(v7, "copy");
  }
  -[PXGLayout setLocalHiddenSpriteIndexes:](self, "setLocalHiddenSpriteIndexes:", v6);

  if (-[NSIndexSet count](self->_localHiddenSpriteIndexes, "count") != v4)
    -[PXGLayout _invalidateStyleOfSpritesWithIndexes:](self, "_invalidateStyleOfSpritesWithIndexes:", v7);

}

- (void)setLocalHiddenSpriteIndexes:(id)a3
{
  NSIndexSet *v4;
  NSIndexSet *v5;
  char v6;
  uint64_t v7;
  NSIndexSet *v8;
  NSIndexSet *localHiddenSpriteIndexes;
  NSIndexSet *v10;

  v10 = (NSIndexSet *)a3;
  v4 = self->_localHiddenSpriteIndexes;
  if (v4 == v10)
  {

  }
  else
  {
    v5 = v4;
    v6 = -[NSIndexSet isEqual:](v4, "isEqual:", v10);

    if ((v6 & 1) == 0)
    {
      v7 = -[NSIndexSet count](self->_localHiddenSpriteIndexes, "count");
      v8 = (NSIndexSet *)-[NSIndexSet copy](v10, "copy");
      localHiddenSpriteIndexes = self->_localHiddenSpriteIndexes;
      self->_localHiddenSpriteIndexes = v8;

      if (v7 > 0 || -[NSIndexSet count](v10, "count"))
        -[PXGLayout localHiddenSpriteIndexesDidChange](self, "localHiddenSpriteIndexesDidChange");
    }
  }

}

- (void)_invalidateStyleOfSpritesWithIndexes:(id)a3
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = objc_msgSend(v15, "count");
  v6 = v15;
  if (v5)
  {
    v7 = objc_msgSend(v15, "lastIndex");
    if (v7 >= -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 1104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexSet.lastIndex < self.localNumberOfSprites"));

    }
    v8 = (void *)objc_msgSend(v15, "mutableCopy");
    v9 = v8;
    if (self->_spriteIndexesWithInvalidatedStyle)
      objc_msgSend(v8, "addIndexes:");
    objc_storeStrong((id *)&self->_spriteIndexesWithInvalidatedStyle, v9);
    if (-[PXGLayout isUpdatingSpriteStyling](self, "isUpdatingSpriteStyling"))
      goto LABEL_13;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_12:
        self->_updateFlags.needsUpdate = needsUpdate | 1;
LABEL_13:

        v6 = v15;
        goto LABEL_14;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      self->_updateFlags.needsUpdate = 1;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_13;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGLayout _invalidateStyleOfSpritesWithIndexes:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGLayout.m"), 1112, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_12;
  }
LABEL_14:

}

- (int64_t)addSublayout:(id)a3
{
  PXGLayout *v5;
  int64_t v6;
  void *v8;

  v5 = (PXGLayout *)a3;
  if (v5 == self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PXGLayout.m"), 1131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sublayout != self"));

  }
  v6 = -[PXGLayout numberOfSublayouts](self, "numberOfSublayouts");
  -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", v5, v6);

  return v6;
}

- (void)removeFromSuperlayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[PXGLayout superlayout](self, "superlayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "sublayoutDataStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfSublayout:", self);

    v3 = v6;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "removeSublayoutsInRange:", v5, 1);
      v3 = v6;
    }
  }

}

- (int64_t)indexOfSublayout:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfSublayout:", v4);

  return v6;
}

- (void)removeSublayoutAtIndex:(int64_t)a3
{
  -[PXGLayout removeSublayoutsInRange:](self, "removeSublayoutsInRange:", a3, 1);
}

- (void)willFaultOutSublayout:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", 0, objc_msgSend(v7, "numberOfSprites"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:](self, "sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:", v7, v6, v7);

  -[PXGLayout willRemoveSublayout:atIndex:flags:](self, "willRemoveSublayout:atIndex:flags:", v7, a4, 1);
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  id v9;
  PXGLayout *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(v9, "superlayout");
  v10 = (PXGLayout *)objc_claimAutoreleasedReturnValue();

  if (v10 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superlayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout.m"), 1296, CFSTR("unexpected superlayout of removed sublayout (sublayout=%@, superlayout=%@, self=%@)"), v9, v18, self);

  }
  objc_msgSend(v9, "_recursivelyResetHiddenSpriteIndexes");
  objc_msgSend(v9, "setSuperlayout:", 0);
  objc_msgSend(v9, "setAxNextResponder:", 0);
  objc_msgSend(v9, "setEntityManager:", 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v9, "interactions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v16, "setScrollViewController:", 0);
        objc_msgSend(v16, "setView:", 0);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  self->_numberOfDescendantAnchors -= objc_msgSend(v9, "numberOfDescendantAnchors");
  -[NSMutableSet removeObject:](self->_sublayoutsExpectedToBeUpdatedInUpdatePass, "removeObject:", v9);
  -[PXGLayout axRemoveSubgroupForSublayout:atIndex:flags:](self, "axRemoveSubgroupForSublayout:atIndex:flags:", v9, a4, a5);

}

- (void)didChangeSublayoutOrigins
{
  id v2;

  -[PXGLayout superlayout](self, "superlayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangeSublayoutOrigins");

}

- (void)performRepeatedSublayoutsUpdate:(id)a3
{
  void (**v3)(_QWORD);

  ++self->_numberOfRepeatedSublayoutUpdatesInUpdatePass;
  v3 = (void (**)(_QWORD))a3;
  kdebug_trace();
  v3[2](v3);

  kdebug_trace();
}

- (unsigned)addSpriteWithInitialState:(id)a3
{
  return -[PXGLayout addSpriteCount:withInitialState:](self, "addSpriteCount:withInitialState:", 1, a3);
}

- (_PXGSpriteIndexRange)addSpriteCount:(unsigned int)a3 withInitialState:(id)a4
{
  uint64_t v4;
  id v6;
  _PXGSpriteIndexRange v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (_PXGSpriteIndexRange)(-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") | (unint64_t)(v4 << 32));
  -[PXGLayout addSpritesInRange:initialState:](self, "addSpritesInRange:initialState:", v7, v6);

  return v7;
}

- (void)addSpritesInRange:(_PXGSpriteIndexRange)a3 initialState:(id)a4
{
  uint64_t length;
  uint64_t location;
  id v7;
  id v8;

  length = a3.length;
  if (a3.length)
  {
    location = a3.location;
    v7 = a4;
    objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", location, length);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v8, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") + length, v7, 0);

  }
}

- (void)addSpritesAtIndexes:(id)a3 initialState:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  int v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, v7, 0, 0, 0);
  v8 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v9 = objc_msgSend(v7, "count");

  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v10, v8 + v9, v6, 0);
}

- (void)removeSpritesInRange:(_PXGSpriteIndexRange)a3
{
  unsigned int length;
  id v5;

  length = a3.length;
  if (a3.length)
  {
    objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", a3.location, a3.length);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v5, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") - length, 0, 0);

  }
}

- (void)removeSpritesAtIndexes:(id)a3
{
  id v4;
  unsigned int v5;
  int v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v4, 0, 0, 0, 0);
  v5 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v6 = objc_msgSend(v4, "count");

  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v7, v5 - v6, 0, 0);
}

- (void)moveSpritesInRange:(_PXGSpriteIndexRange)a3 toRange:(_PXGSpriteIndexRange)a4
{
  id v5;

  if (a3.length)
  {
    objc_msgSend(off_1E50B1608, "changeDetailsWithMovedFromIndexRange:toIndexRange:", a3.location, a3.length, a4.location, a4.length);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v5, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"), 0, 0);

  }
}

- (void)modifySpritesInRect:(CGRect)a3 state:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spriteIndexesInRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v11, -[PXGLayout numberOfSprites](self, "numberOfSprites"), 0, v12);

  }
}

- (void)modifySpritesAtIndexes:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PXGLayout_modifySpritesAtIndexes_state___block_invoke;
  v8[3] = &unk_1E5118CD8;
  v9 = v6;
  v7 = v6;
  -[PXGLayout modifySpritesAtIndexes:fullState:](self, "modifySpritesAtIndexes:fullState:", a3, v8);

}

- (void)modifySpritesAtIndexes:(id)a3 fullState:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v7);

  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyFullState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyFullState:", v8, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"), 0, v6);
}

- (_PXGSpriteIndexRange)convertRange:(_PXGSpriteIndexRange)a3 fromSublayout:(id)a4
{
  unsigned int location;
  id v7;
  void *v8;
  int v9;
  void *v10;

  location = a3.location;
  if (a4 != self)
  {
    v7 = a4;
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "spriteIndexOriginForSublayout:", v7);

    location = a3.location + v9 + (_DWORD)v8;
  }
  return (_PXGSpriteIndexRange)(*(_QWORD *)&a3 & 0xFFFFFFFF00000000 | location);
}

- (BOOL)canHandleVisibleRectRejection
{
  return 0;
}

- (void)markLastVisibleAreaAnchoringInformationForInvalidation
{
  self->_isLastVisibleAreaAnchoringInformationInvalidated = 1;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unsigned)spriteIndexForObjectReference:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return -[PXGLayout spriteIndexForObjectReference:options:updatedObjectReference:](self, "spriteIndexForObjectReference:options:updatedObjectReference:", a3, 0, &v4);
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  int64_t v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v21 = 0;
  v8 = -[PXGLayout sublayoutIndexForObjectReference:options:updatedObjectReference:](self, "sublayoutIndexForObjectReference:options:updatedObjectReference:", a3, a4, &v21);
  v9 = v21;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = -1;
  }
  else
  {
    -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v20 = 0;
      v13 = objc_msgSend(v11, "spriteIndexForObjectReference:options:updatedObjectReference:", v9, a4, &v20);
      v14 = v20;

      v15 = v12;
      v9 = v14;
      if ((_DWORD)v13 != -1 && objc_msgSend(v15, "numberOfSprites") <= v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PXValidateLayoutSpriteIndexForObjectReference(PXGLayout * _Nonnull __strong, PXGSpriteIndex, id  _Nonnull __strong)");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXGLayout_Internal.h"), 224, CFSTR("%@ returned invalid spriteIndex %li for objectReference %@"), v15, v13, v9);

      }
      v10 = -[PXGLayout convertSpriteIndex:fromDescendantLayout:](self, "convertSpriteIndex:fromDescendantLayout:", v13, v15);
    }
    else
    {
      v10 = -1;
    }

  }
  v16 = objc_retainAutorelease(v9);
  *a5 = v16;

  return v10;
}

- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  y = a3.y;
  x = a3.x;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16611;
  v14 = __Block_byref_object_dispose__16612;
  v15 = 0;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PXGLayout_dropTargetObjectReferenceForLocation___block_invoke;
  v9[3] = &unk_1E5118DC8;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateSublayoutsUsingBlock:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)navigationObjectReferenceForLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[8];
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  _QWORD v20[9];
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  y = a3.y;
  x = a3.x;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__16611;
  v27 = __Block_byref_object_dispose__16612;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout scrollableAxis](self, "scrollableAxis");
  PXSizeValueForAxis();
  v22 = v6;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__PXGLayout_navigationObjectReferenceForLocation___block_invoke;
  v20[3] = &unk_1E5118DF0;
  *(CGFloat *)&v20[7] = x;
  *(CGFloat *)&v20[8] = y;
  v20[6] = &v23;
  v20[4] = self;
  v20[5] = v21;
  objc_msgSend(v7, "enumerateSublayoutGeometriesUsingBlock:", v20);

  v9 = (void *)v24[5];
  if (!v9)
  {
    -[PXGLayout visibleRect](self, "visibleRect");
    PXSizeScale();
    PXRectWithCenterAndSize();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = -1;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0x7FEFFFFFFFFFFFFFLL;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __50__PXGLayout_navigationObjectReferenceForLocation___block_invoke_2;
    v14[3] = &unk_1E5146A30;
    *(CGFloat *)&v14[6] = x;
    *(CGFloat *)&v14[7] = y;
    v14[4] = v15;
    v14[5] = &v16;
    -[PXGLayout enumerateSpritesInRect:usingBlock:](self, "enumerateSpritesInRect:usingBlock:", v14);
    if (*((_DWORD *)v17 + 6) != -1)
    {
      -[PXGLayout objectReferenceForSpriteIndex:](self, "objectReferenceForSpriteIndex:");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v24[5];
      v24[5] = v10;

    }
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);
    v9 = (void *)v24[5];
  }
  v12 = v9;
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

- (void)addPointReference:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXGLayout pointReferences](self, "pointReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_pointReferences, v4);
  }
  objc_msgSend(v4, "addObject:", v5);

}

- (void)removePointReference:(id)a3
{
  id v4;
  NSHashTable *pointReferences;
  id v6;

  v4 = a3;
  -[PXGLayout pointReferences](self, "pointReferences");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  if (!objc_msgSend(v6, "count"))
  {
    pointReferences = self->_pointReferences;
    self->_pointReferences = 0;

  }
}

- (BOOL)definesContextForPointReferences
{
  return 1;
}

- (void)setInteractions:(id)a3
{
  NSArray *v4;
  NSArray *interactions;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *v9;

  v9 = (NSArray *)a3;
  v4 = self->_interactions;
  interactions = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSArray isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSArray *)-[NSArray copy](v9, "copy");
    interactions = self->_interactions;
    self->_interactions = v8;
LABEL_4:

  }
}

- (void)removeAnimation:(id)a3
{
  -[NSMutableArray removeObject:](self->_animations, "removeObject:", a3);
  -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);
}

- (void)addTransition:(id)a3
{
  id v4;
  NSMutableArray *transitions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transitions = self->_transitions;
  v8 = v4;
  if (!transitions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_transitions;
    self->_transitions = v6;

    v4 = v8;
    transitions = self->_transitions;
  }
  -[NSMutableArray addObject:](transitions, "addObject:", v4);
  -[PXGLayout _setNeedsUpdateExternally:](self, "_setNeedsUpdateExternally:", 0);

}

- ($738B17BD11CC339B30296C0EA03CEC2B)entityForSpriteAtIndex:(unsigned int)a3
{
  id v4;
  $738B17BD11CC339B30296C0EA03CEC2B v5;

  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5.var0 = *(_DWORD *)(objc_msgSend(v4, "entities") + 4 * a3);

  return v5;
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)geometryForSpriteAtIndex:(unsigned int)a3
{
  _OWORD *v3;
  _OWORD *v5;
  _OWORD *v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  id v11;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 result;

  v5 = v3;
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (_OWORD *)(objc_msgSend(v11, "geometries") + 32 * a3);
  v7 = v6[1];
  *v5 = *v6;
  v5[1] = v7;

  result.var0.var2 = v10;
  result.var0.var1 = v9;
  result.var0.var0 = v8;
  return result;
}

- ($225AF24142A77900D29617A74D173C5F)styleForSpriteAtIndex:(SEL)a3
{
  _OWORD *v6;
  __int128 v7;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v8;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v9;
  __int128 v10;
  $6FCFBD36564ECBB6D9D1614A84D6F83D v11;
  $225AF24142A77900D29617A74D173C5F *result;
  id v13;

  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (_OWORD *)(objc_msgSend(v13, "styles") + 160 * a4);
  v7 = v6[7];
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[2].var1 + 4) = ($6FCFBD36564ECBB6D9D1614A84D6F83D)v6[6];
  *(_OWORD *)&retstr[2].var3 = v7;
  v8 = ($6FCFBD36564ECBB6D9D1614A84D6F83D)v6[9];
  *(_OWORD *)&retstr[2].var8 = v6[8];
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr[3].var1 + 8) = v8;
  v9 = ($6FCFBD36564ECBB6D9D1614A84D6F83D)v6[3];
  *(_OWORD *)&retstr->var5 = v6[2];
  retstr[1].var1 = v9;
  v10 = v6[5];
  *(_OWORD *)&retstr[1].var2 = v6[4];
  *(_OWORD *)&retstr[1].var6 = v10;
  v11 = ($6FCFBD36564ECBB6D9D1614A84D6F83D)v6[1];
  *(_OWORD *)&retstr->var0 = *v6;
  *($6FCFBD36564ECBB6D9D1614A84D6F83D *)((char *)&retstr->var1 + 12) = v11;

  return result;
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)infoForSpriteAtIndex:(SEL)a3
{
  uint64_t v6;
  __int128 v7;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *result;
  id v9;

  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v9, "infos") + 40 * a4;
  v7 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v6;
  *(_OWORD *)&retstr->var4 = v7;
  retstr[1].var3 = *(_QWORD *)(v6 + 32);

  return result;
}

- (void)copySpritesToDataStore:(id)a3
{
  id v4;

  v4 = a3;
  -[PXGLayout copyLayoutForSpritesInRange:toSpriteDataStore:](self, "copyLayoutForSpritesInRange:toSpriteDataStore:", -[PXGLayout numberOfSprites](self, "numberOfSprites") << 32, v4);

}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  PXGHitTestResult *v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (a3 == -1)
    return 0;
  v3 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__16611;
  v15 = __Block_byref_object_dispose__16612;
  v16 = 0;
  if (-[PXGLayout numberOfSublayouts](self, "numberOfSublayouts") < 1)
  {
    -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:]([PXGHitTestResult alloc], "initWithSpriteReference:layout:identifier:userData:", v6, self, 0, 0);
    v8 = (void *)v12[5];
    v12[5] = (uint64_t)v7;

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__PXGLayout_hitTestResultForSpriteIndex___block_invoke;
    v10[3] = &unk_1E5118E68;
    v10[4] = self;
    v10[5] = &v11;
    -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", v3 | 0x100000000, 0, v10);
  }
  v9 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v9;
}

- (int64_t)sublayoutIndexForSpriteIndex:(unsigned int)a3
{
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != -1)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__PXGLayout_sublayoutIndexForSpriteIndex___block_invoke;
    v5[3] = &unk_1E5118E68;
    v5[4] = self;
    v5[5] = &v6;
    -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", a3 | 0x100000000, 0, v5);
    v3 = v7[3];
    _Block_object_dispose(&v6, 8);
  }
  return v3;
}

- (id)sublayoutForSpriteIndex:(unsigned int)a3
{
  int64_t v4;
  void *v5;
  int64_t v6;
  void *v7;

  v4 = -[PXGLayout sublayoutIndexForSpriteIndex:](self, "sublayoutIndexForSpriteIndex:", *(_QWORD *)&a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = v4;
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sublayoutAtIndex:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)enumerateLocalSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  __int128 v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = *((_OWORD *)off_1E50B8368 + 1);
  v15 = *(_OWORD *)off_1E50B8368;
  v16 = v10;
  v17 = *((_OWORD *)off_1E50B8368 + 2);
  v18 = *((_QWORD *)off_1E50B8368 + 6);
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PXGLayout_enumerateLocalSpritesInRect_usingBlock___block_invoke;
  v13[3] = &unk_1E5118E90;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "enumerateSpritesInRect:usingBlock:", v13, x, y, width, height);

}

- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3
{
  return (_PXGSpriteIndexRange)(-[PXGLayout numberOfSprites](self, "numberOfSprites", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height) << 32);
}

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)orientedContentTransform
{
  __int128 v5;
  $8F6F21C65DCD0A0F8AC24DFE540A6236 *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v5 = *((_OWORD *)off_1E50B8368 + 1);
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)off_1E50B8368;
  *(_OWORD *)&retstr->var0.c = v5;
  *(_OWORD *)&retstr->var0.tx = *((_OWORD *)off_1E50B8368 + 2);
  retstr->var1 = *((double *)off_1E50B8368 + 6);
  result = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
  if (result == ($8F6F21C65DCD0A0F8AC24DFE540A6236 *)1)
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    result = ($8F6F21C65DCD0A0F8AC24DFE540A6236 *)PXAffineTransformMakeHorizontalFlip();
    *(_OWORD *)&retstr->var0.a = v7;
    *(_OWORD *)&retstr->var0.c = v8;
    *(_OWORD *)&retstr->var0.tx = v9;
  }
  return result;
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[PXGLayout description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "px_removeSuffix:", CFSTR(">"));
  -[PXGLayout contentSize](self, "contentSize");
  PXSizeDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(", contentSize=%@"), v6);

  -[PXGLayout referenceSize](self, "referenceSize");
  PXSizeDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(", referenceSize=%@"), v7);

  -[PXGLayout visibleRect](self, "visibleRect");
  PXRectDescription();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(", visibleRect=%@"), v8);

  if (-[PXGLayout numberOfSprites](self, "numberOfSprites"))
    objc_msgSend(v5, "appendFormat:", CFSTR(", numberOfSprites=%u"), -[PXGLayout numberOfSprites](self, "numberOfSprites"));
  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"))
    objc_msgSend(v5, "appendFormat:", CFSTR(", localNumberOfSprites=%u"), -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"));
  if (-[PXGLayout numberOfSublayouts](self, "numberOfSublayouts") >= 1)
    objc_msgSend(v5, "appendFormat:", CFSTR(", numberOfSublayouts=%li"), -[PXGLayout numberOfSublayouts](self, "numberOfSublayouts"));
  -[PXGLayout displayScale](self, "displayScale");
  objc_msgSend(v5, "appendFormat:", CFSTR(", displayScale=%.2f"), v9);
  -[PXGLayout alpha](self, "alpha");
  if (v10 != 1.0)
  {
    -[PXGLayout alpha](self, "alpha");
    objc_msgSend(v5, "appendFormat:", CFSTR(", alpha=%.2f"), v11);
  }
  if (-[PXGLayout needsUpdate](self, "needsUpdate"))
    objc_msgSend(v5, "appendString:", CFSTR(", needsUpdate"));
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13 >= 1)
  {
    v14 = v13;
    objc_msgSend(v5, "appendString:", CFSTR("\n\tSublayouts:\n"));
    for (i = 0; i != v14; ++i)
    {
      objc_msgSend(v12, "sublayoutAtIndex:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "px_stringByIndentingNewLines");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\t%li: %@\n"), i, v19);

      }
    }
  }
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "diagnosticDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "px_stringByIndentingNewLines");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\tLocal Sprites: %@\n"), v22);

  }
  -[PXGLayout modifiedSpriteDataStore](self, "modifiedSpriteDataStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    objc_msgSend(v23, "diagnosticDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "px_stringByIndentingNewLines");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n\tModified Sprites: %@\n"), v25);

  }
  objc_msgSend(v5, "appendString:", CFSTR(">"));

  return (NSString *)v5;
}

- (NSString)recursiveDescription
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXGLayout _appendDescription:atLevel:](self, "_appendDescription:atLevel:", v3, 0);
  objc_msgSend(v3, "px_removeSuffix:", CFSTR("\n"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSString)parentDescription
{
  void *v3;
  PXGLayout *v4;
  void *v5;
  unint64_t v6;
  unint64_t i;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      if (objc_msgSend(v3, "length"))
        objc_msgSend(v3, "appendString:", CFSTR("\n"));
      if (v6)
      {
        for (i = 1; i <= v6; ++i)
          objc_msgSend(v3, "appendString:", CFSTR("    "));
      }
      objc_msgSend(v5, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v8);

      objc_msgSend(v5, "superlayout");
      v9 = objc_claimAutoreleasedReturnValue();

      ++v6;
      v5 = (void *)v9;
    }
    while (v9);
  }
  objc_msgSend(v3, "appendString:", CFSTR(" (root)"));
  return (NSString *)v3;
}

- (id)_paddingForLevel:(int64_t)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(v4, "appendString:", CFSTR("   | "));
      --a3;
    }
    while (a3);
  }
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)_appendDescription:(id)a3 atLevel:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  CGSize v20;
  CGRect v21;

  v6 = a3;
  v7 = a4 + 1;
  -[PXGLayout _paddingForLevel:](self, "_paddingForLevel:", a4 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v9);

  if (!a4)
  {
    -[PXGLayout contentSize](self, "contentSize");
    NSStringFromCGSize(v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout visibleRect](self, "visibleRect");
    NSStringFromCGRect(v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(", contentSize=%@, visibleRect=%@"), v10, v11);

  }
  -[PXGLayout briefDiagnosticDescription](self, "briefDiagnosticDescription");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v6, "appendFormat:", CFSTR(", %@"), v15);
  objc_msgSend(v6, "appendString:", CFSTR("\n"));
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__PXGLayout__appendDescription_atLevel___block_invoke;
  v16[3] = &unk_1E513F2F8;
  v16[4] = self;
  v17 = v6;
  v18 = v8;
  v19 = v7;
  v13 = v8;
  v14 = v6;
  objc_msgSend(v12, "enumerateSublayoutsUsingBlock:", v16);

}

- (NSString)briefDiagnosticDescription
{
  return 0;
}

- (UIEdgeInsets)fullPageSnapshotFloatingInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  UIEdgeInsets result;

  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[PXGLayout visibleRect](self, "visibleRect");
  v9 = CGRectGetHeight(v14) * 0.5;
  v10 = 200.0;
  if (v9 <= 200.0)
    v10 = v9;
  if (v10 < v4)
    v10 = v4;
  if (v9 > 100.0)
    v9 = 100.0;
  if (v9 >= v10)
    v11 = v9;
  else
    v11 = v10;
  v12 = v6;
  v13 = v8;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (id)diagnosticsItemProvidersInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(double *, uint64_t, void *);
  void *v16;
  id v17;
  PXGLayout *v18;
  double v19;
  double v20;
  double v21;
  double v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __44__PXGLayout_diagnosticsItemProvidersInRect___block_invoke;
  v16 = &unk_1E5118F30;
  v17 = v8;
  v18 = self;
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  v10 = v8;
  objc_msgSend(v9, "enumerateSublayoutsInRect:usingBlock:", &v13, x, y, width, height);

  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);
  return v11;
}

- (void)enumerateDescendantsLayoutsBreadthFirstReverseUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "addObject:", self);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);
  while (1)
  {

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v7);
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
      break;
    if (v7)
      objc_msgSend(v5, "addObject:", v7);
    objc_msgSend(v7, "sublayoutDataStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(v10, "count"); ++i)
    {
      objc_msgSend(v10, "sublayoutAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v6, "addObject:", v12);

    }
LABEL_7:

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);
    goto LABEL_7;
  }

  objc_msgSend(v5, "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__PXGLayout_enumerateDescendantsLayoutsBreadthFirstReverseUsingBlock___block_invoke;
  v16[3] = &unk_1E5118F80;
  v15 = v4;
  v17 = v15;
  v18 = v19;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

  _Block_object_dispose(v19, 8);
}

- (void)setCameraConfiguration:(float32x4_t *)a3
{
  uint32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  id v14;

  if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3[1], a1[41]), (int8x16_t)vceqq_f32(*a3, a1[40])), vandq_s8((int8x16_t)vceqq_f32(a3[2], a1[42]), (int8x16_t)vceqq_f32(a3[3], a1[43])))) & 0x80000000) == 0|| (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3[6], a1[46]), (int8x16_t)vceqq_f32(a3[7], a1[47])), vandq_s8((int8x16_t)vceqq_f32(a3[5], a1[45]), (int8x16_t)vceqq_f32(a3[4], a1[44])))) & 0x80000000) == 0|| (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3[9], a1[49]), (int8x16_t)vceqq_f32(a3[8], a1[48])), vandq_s8((int8x16_t)vceqq_f32(a3[10], a1[50]), (int8x16_t)vceqq_f32(a3[11], a1[51])))) & 0x80000000) == 0|| (v4 = (uint32x4_t)vceqq_f32(a3[12], a1[52]), v4.i32[3] = v4.i32[2], (vminvq_u32(v4) & 0x80000000) == 0))
  {
    a1[40] = *a3;
    v5 = a3[1];
    v6 = a3[2];
    v7 = a3[4];
    a1[43] = a3[3];
    a1[44] = v7;
    a1[41] = v5;
    a1[42] = v6;
    v8 = a3[5];
    v9 = a3[6];
    v10 = a3[8];
    a1[47] = a3[7];
    a1[48] = v10;
    a1[45] = v8;
    a1[46] = v9;
    v11 = a3[9];
    v12 = a3[10];
    v13 = a3[12];
    a1[51] = a3[11];
    a1[52] = v13;
    a1[49] = v11;
    a1[50] = v12;
    -[float32x4_t updateDelegate](a1, "updateDelegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutNeedsRenderUpdate:", a1);

  }
}

- (NSArray)preferredFocusLayouts
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSIndexSet)preferredFocusSpriteIndexes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
}

- (void)setNeedsFocusUpdate
{
  void *v3;
  id v4;

  -[PXGLayout rootLayout](self, "rootLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsFocusUpdateForLayout:", self);

}

- (PXGSpriteDataStore)modifiedSpriteDataStore
{
  return self->_modifiedSpriteDataStore;
}

- (unint64_t)appearState
{
  return self->_appearState;
}

- (double)displayMaximumHeadroom
{
  return self->_displayMaximumHeadroom;
}

- (void)setDisplayMaximumHeadroom:(double)a3
{
  self->_displayMaximumHeadroom = a3;
}

- (PXGLayoutSpriteModifier)spriteModifier
{
  return self->_spriteModifier;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (double)floatingOffset
{
  return self->_floatingOffset;
}

- (id)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
  objc_storeStrong(&self->_userData, a3);
}

- (void)setVisibleRectDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_visibleRectDelegate, a3);
}

- (PXGLayoutViewDelegate)viewDelegate
{
  return (PXGLayoutViewDelegate *)objc_loadWeakRetained((id *)&self->_viewDelegate);
}

- (PXGLayoutFocusDelegate)focusDelegate
{
  return (PXGLayoutFocusDelegate *)objc_loadWeakRetained((id *)&self->_focusDelegate);
}

- (int64_t)updateCount
{
  return self->_updateCount;
}

- ($294CB042FB18EDF8FD74FDF4F765ED39)stringSourceRespondsTo
{
  return ($294CB042FB18EDF8FD74FDF4F765ED39)self->_stringSourceRespondsTo;
}

- (PXGDataSourceChange)internalCurrentDataSourceChange
{
  return self->_internalCurrentDataSourceChange;
}

- (NSIndexSet)localHiddenSpriteIndexes
{
  return self->_localHiddenSpriteIndexes;
}

- (BOOL)disableDebugAssertionForSublayoutUpdates
{
  return self->_disableDebugAssertionForSublayoutUpdates;
}

- (NSHashTable)pointReferences
{
  return self->_pointReferences;
}

- (void)setNextViewHostingLayout:(id)a3
{
  objc_storeWeak((id *)&self->_nextViewHostingLayout, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextViewHostingLayout);
  objc_destroyWeak((id *)&self->_axNextResponder);
  objc_storeStrong((id *)&self->_pointReferences, 0);
  objc_storeStrong((id *)&self->_localHiddenSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_lastVisibleAreaAnchor, 0);
  objc_storeStrong((id *)&self->_activeAnchor, 0);
  objc_storeStrong((id *)&self->_internalCurrentDataSourceChange, 0);
  objc_destroyWeak((id *)&self->_displayAssetSource);
  objc_destroyWeak((id *)&self->_focusDelegate);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_destroyWeak((id *)&self->_scrollDelegate);
  objc_destroyWeak((id *)&self->_visibleRectDelegate);
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->_spriteMetadataStore, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong(&self->_userData, 0);
  objc_destroyWeak((id *)&self->_contentSource);
  objc_storeStrong((id *)&self->_spriteModifier, 0);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_destroyWeak((id *)&self->_superlayout);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_sublayoutDataStore, 0);
  objc_storeStrong((id *)&self->_modifiedSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_spriteDataStore, 0);
  objc_storeStrong((id *)&self->_sublayoutsExpectedToBeUpdatedInUpdatePass, 0);
  objc_storeStrong((id *)&self->_reusableAXGroup, 0);
  objc_storeStrong((id *)&self->_spriteIndexesWithInvalidatedStyle, 0);
  objc_storeStrong((id *)&self->_spriteReferencesForHiddenSprites, 0);
  objc_storeStrong((id *)&self->_fences, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

uint64_t __70__PXGLayout_enumerateDescendantsLayoutsBreadthFirstReverseUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

void __44__PXGLayout_diagnosticsItemProvidersInRect___block_invoke(double *a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;

  v3 = (void *)*((_QWORD *)a1 + 4);
  v4 = (void *)*((_QWORD *)a1 + 5);
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[8];
  v8 = a1[9];
  v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  objc_msgSend(v9, "diagnosticsItemProvidersInRect:");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v10);
}

void __40__PXGLayout__appendDescription_atLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CGAffineTransform t1;
  double v36;
  CGAffineTransform v37;
  CGAffineTransform t2;
  CGPoint v39;
  CGRect v40;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sublayoutDataStore");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "geometries") + 136 * a2;
  v8 = *(_OWORD *)(v7 + 88);
  *(_OWORD *)&v37.a = *(_OWORD *)(v7 + 72);
  *(_OWORD *)&v37.c = v8;
  *(_OWORD *)&v37.tx = *(_OWORD *)(v7 + 104);
  v9 = *(double *)(v7 + 120);

  v10 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  PXGPositionDescription();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXSizeDescription();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("%@%li: origin=%@, contentSize=%@"), v11, a2, v12, v13);

  t1 = v37;
  v14 = *((_OWORD *)off_1E50B8368 + 1);
  *(_OWORD *)&t2.a = *(_OWORD *)off_1E50B8368;
  *(_OWORD *)&t2.c = v14;
  *(_OWORD *)&t2.tx = *((_OWORD *)off_1E50B8368 + 2);
  if (!CGAffineTransformEqualToTransform(&t1, &t2) || v9 != *((double *)off_1E50B8368 + 6))
  {
    v15 = *(void **)(a1 + 40);
    t1 = v37;
    v36 = v9;
    PXGSpriteGeometryTransformDescription();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendFormat:", CFSTR(", spriteTransform=%@"), v16);

  }
  objc_msgSend(v5, "visibleRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(*(id *)(a1 + 32), "rootLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rootLayout");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "visibleRect");
  objc_msgSend(v25, "convertRect:toDescendantLayout:", v5);

  PXPointSubtract();
  v28 = v27;
  v30 = v29;
  if (!PXFloatApproximatelyEqualToFloat() || (PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    v31 = *(void **)(a1 + 40);
    v39.x = v28;
    v39.y = v30;
    NSStringFromCGPoint(v39);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "appendFormat:", CFSTR(", visibleRectError=%@"), v32);

  }
  v33 = *(void **)(a1 + 40);
  v40.origin.x = v18;
  v40.origin.y = v20;
  v40.size.width = v22;
  v40.size.height = v24;
  NSStringFromCGRect(v40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "appendFormat:", CFSTR(", visibleRect=%@"), v34);

  objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@   "), *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "_appendDescription:atLevel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

void __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, CGFloat *a3, id *a4, uint64_t a5)
{
  id v8;
  __int128 v9;
  double x;
  double y;
  double width;
  double height;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  if (*a4)
  {
    v8 = *a4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36) = objc_msgSend(v8, "numberOfSprites");
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36))
    {
      v29.origin.x = a3[6];
      v29.origin.y = a3[7];
      v29.size.width = a3[4];
      v29.size.height = a3[5];
      if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v29))
      {
        v27 = 0;
        v25 = 0u;
        v26 = 0u;
        v24 = 0u;
        v9 = *(_OWORD *)(a1 + 96);
        v20 = *(_OWORD *)(a1 + 80);
        v21 = v9;
        v22 = *(_OWORD *)(a1 + 112);
        v23 = *(_QWORD *)(a1 + 128);
        _spriteTransformFromSelfAndParent(&v24, (uint64_t)a3, (uint64_t)&v20, 1);
        v28 = CGRectOffset(*(CGRect *)(a1 + 48), -a3[6], -a3[7]);
        x = v28.origin.x;
        y = v28.origin.y;
        width = v28.size.width;
        height = v28.size.height;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke_3;
        v16[3] = &unk_1E5118EE0;
        v14 = *(id *)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 40);
        v17 = v14;
        v18 = v15;
        v19 = a5;
        v20 = v24;
        v21 = v25;
        v22 = v26;
        v23 = v27;
        objc_msgSend(v8, "_enumerateSpritesInRect:transform:usingBlock:", &v20, v16, x, y, width, height);

      }
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) += *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                             + 36);

  }
}

uint64_t __58__PXGLayout__enumerateSpritesInRect_transform_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _BYTE *a9)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  if (*a9)
    **(_BYTE **)(a1 + 48) = 1;
  return result;
}

uint64_t __52__PXGLayout_enumerateLocalSpritesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a1 + 48, a3[1], a3[2], a3[3], *(_QWORD *)(a1 + 32), a2, a4);
}

void __42__PXGLayout_sublayoutIndexForSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "sublayoutDataStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "indexOfSublayout:", v5);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
}

void __41__PXGLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (*(void **)(a1 + 32) != a3)
  {
    objc_msgSend(a3, "hitTestResultForSpriteIndex:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __77__PXGLayout__enumerateSpritesInRange_transform_spriteOffset_stop_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id *a4, _BYTE *a5)
{
  id v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  if (*a4)
  {
    v8 = *a4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36) = objc_msgSend(v8, "numberOfSprites");
    v9 = PXGSpriteIndexRangeIntersection();
    if (HIDWORD(v9))
    {
      v10 = v9;
      v11 = v9 & 0xFFFFFFFF00000000;
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
      v21 = 0u;
      v12 = *(_OWORD *)(a1 + 64);
      v17 = *(_OWORD *)(a1 + 48);
      v18 = v12;
      v19 = *(_OWORD *)(a1 + 80);
      v20 = *(_QWORD *)(a1 + 96);
      _spriteTransformFromSelfAndParent(&v21, a3, (uint64_t)&v17, 1);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      v15 = (*(_DWORD *)(a1 + 120) + v14);
      v16 = *(_QWORD *)(a1 + 104);
      v17 = v21;
      v18 = v22;
      v19 = v23;
      v20 = v24;
      objc_msgSend(v8, "_enumerateSpritesInRange:transform:spriteOffset:stop:usingBlock:", v11 | (v10 - v14), &v17, v15, v16, v13);
      if (**(_BYTE **)(a1 + 104))
        *a5 = 1;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) += *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                             + 36);

  }
}

void __50__PXGLayout_navigationObjectReferenceForLocation___block_invoke(uint64_t a1, uint64_t a2, CGFloat *a3, id *a4, _BYTE *a5)
{
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  CGRect v25;

  v25.origin.x = a3[6];
  v25.origin.y = a3[7];
  v25.size.width = a3[4];
  v25.size.height = a3[5];
  v9 = CGRectContainsPoint(v25, *(CGPoint *)(a1 + 56));
  PXRectShortestDistanceToPoint();
  v11 = v10;
  if (v9 || v10 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    PXPointSubtract();
    v13 = v12;
    v15 = v14;
    v16 = *a4;
    v24 = v16;
    if (v16)
    {
      objc_msgSend(v16, "navigationObjectReferenceForLocation:", v13, v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(id *)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;
    }
    else
    {
      v20 = *(_QWORD *)(a1 + 32);
      v19 = a4[1];
      objc_msgSend(v19, "layout:navigationObjectReferenceForSublayoutAtIndex:", v20, a2);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
    if (v9)
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        *a5 = 1;
    }

  }
}

uint64_t __50__PXGLayout_navigationObjectReferenceForLocation___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;
  double v5;

  result = PXRectShortestDistanceToPoint();
  if (v5 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  }
  return result;
}

void __50__PXGLayout_dropTargetObjectReferenceForLocation___block_invoke(double *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = *((_QWORD *)a1 + 4);
  v7 = a1[6];
  v8 = a1[7];
  v9 = a3;
  objc_msgSend(v9, "convertPoint:fromLayout:", v6, v7, v8);
  objc_msgSend(v9, "dropTargetObjectReferenceForLocation:");
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(*((_QWORD *)a1 + 5) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40))
    *a4 = 1;
}

void __35__PXGLayout_anchoredSublayoutIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "spriteIndexForSpriteReference:options:");
  v8 = *(void **)(a1 + 32);
  if (v7 != -1)
  {
    v9 = objc_msgSend(v8, "sublayoutIndexForSpriteIndex:");
LABEL_4:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
    *a4 = 1;
    goto LABEL_5;
  }
  v9 = objc_msgSend(v8, "sublayoutIndexForSpriteReference:options:", v10, a3);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
LABEL_5:

}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  unint64_t v7;

  objc_msgSend(a1[4], "entityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destroyEntities:count:", objc_msgSend(objc_retainAutorelease(a1[5]), "entities") + 4 * a2, a3);

  v7 = a2 | ((unint64_t)a3 << 32);
  objc_msgSend(a1[5], "removeSpritesInRange:", v7);
  objc_msgSend(a1[6], "removeSpritesInRange:", v7);
  return objc_msgSend(a1[4], "_incrementNumberOfSprites:", -a3);
}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_4(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "modifySpriteDataStore:spriteIndexRange:forLayout:", *(_QWORD *)(a1 + 40), a2 | ((unint64_t)a3 << 32), *(_QWORD *)(a1 + 48));
}

uint64_t __85__PXGLayout_applySpriteChangeDetails_countAfterChanges_initialState_modifyFullState___block_invoke_5(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "modifySpriteDataStore:spriteIndexRange:forLayout:", *(_QWORD *)(a1 + 40), a2 | ((unint64_t)a3 << 32), *(_QWORD *)(a1 + 48));
}

uint64_t __42__PXGLayout_modifySpritesAtIndexes_state___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__PXGLayout_insertSublayoutProvider_atIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSublayoutProvider:inRange:", *(_QWORD *)(a1 + 40), a2, a3);
}

id __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[4];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "sublayoutDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke_2;
  v10 = &unk_1E512B2C0;
  v4 = v2;
  v11 = v4;
  v12 = v13;
  objc_msgSend(v3, "enumerateSublayoutsUsingBlock:", &v7);

  v5 = (void *)objc_msgSend(v4, "copy", v7, v8, v9, v10);
  _Block_object_dispose(v13, 8);
  return v5;
}

void __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "sublayoutAtIndex:loadIfNeeded:", a3, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v18, "numberOfSprites");
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v11 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if (objc_msgSend(*(id *)(a1 + 56), "containsIndexesInRange:", v14, v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("PXGLayout.m"), 1219, CFSTR("Trying to move to the same indexes multiple times"));

  }
  objc_msgSend(*(id *)(a1 + 56), "addIndexesInRange:", v14, v6);
  if (v10 < v10 + v6)
  {
    do
    {
      v15 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      ++v10;
      --v6;
    }
    while (v6);
  }

}

void __77__PXGLayout_applySublayoutChangeDetails_countAfterChanges_sublayoutProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_msgSend(a3, "numberOfSprites");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

uint64_t __39__PXGLayout_removeSublayoutsAtIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSublayoutsInRange:", a2, a3);
}

void __37__PXGLayout_removeSublayoutsInRange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", 0, objc_msgSend(v7, "numberOfSprites"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sublayout:didApplySpriteChangeDetails:fromDescendentSublayout:", v7, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "willRemoveSublayout:atIndex:flags:", v7, a2, 0);
}

uint64_t __49__PXGLayout__recursivelyResetHiddenSpriteIndexes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_resetHiddenSpriteIndexes");
}

uint64_t __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;
  unint64_t v6;
  uint64_t result;

  v3 = a3;
  v4 = a2;
  v6 = a2 + a3;
  result = objc_msgSend(*(id *)(a1 + 32), "numberOfSprites");
  if (v6 <= result)
    return objc_msgSend(*(id *)(a1 + 32), "enumerateLayoutsForSpritesInRange:options:usingBlock:", v4 | ((unint64_t)v3 << 32), 1, &__block_literal_global_74);
  return result;
}

uint64_t __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;
  unint64_t v6;
  uint64_t result;

  v3 = a3;
  v4 = a2;
  v6 = a2 + a3;
  result = objc_msgSend(*(id *)(a1 + 32), "numberOfSprites");
  if (v6 <= result)
    return objc_msgSend(*(id *)(a1 + 32), "enumerateLayoutsForSpritesInRange:options:usingBlock:", v4 | ((unint64_t)v3 << 32), 1, &__block_literal_global_75);
  return result;
}

void __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = HIDWORD(a2);
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB36B8];
  v6 = a3;
  objc_msgSend(v5, "indexSetWithIndexesInRange:", v4, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addHiddenSpriteIndexes:", v7);

}

uint64_t __43__PXGLayout__propagateHiddenSpriteIndexes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_resetHiddenSpriteIndexes");
}

void __36__PXGLayout_setHiddenSpriteIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if ((_DWORD)a2 != -1)
  {
    objc_msgSend(*(id *)(a1 + 32), "spriteReferenceForSpriteIndex:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

void __32__PXGLayout_hiddenSpriteIndexes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v9 = v4;
  if (*(id *)(a1 + 32) == v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndexes:", *((_QWORD *)v4 + 53), v4);
  }
  else
  {
    v5 = (void *)*((_QWORD *)v4 + 53);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __32__PXGLayout_hiddenSpriteIndexes__block_invoke_2;
    v10[3] = &unk_1E5118B68;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = v7;
    v13 = v9;
    v8 = v5;
    objc_msgSend(v8, "enumerateRangesUsingBlock:", v10);

  }
}

uint64_t __32__PXGLayout_hiddenSpriteIndexes__block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3)
{
  void *v3;
  unint64_t v4;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "convertSpriteIndexRange:fromDescendantLayout:", a2 | ((unint64_t)a3 << 32), *(_QWORD *)(a1 + 48));
  return objc_msgSend(v3, "addIndexesInRange:", v4, HIDWORD(v4));
}

uint64_t __43__PXGLayout_containingScrollViewDidScroll___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "containingScrollViewDidScroll:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

uint64_t __28__PXGLayout_setLayoutQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setLayoutQueue:", *(_QWORD *)(a1 + 32));
}

void __46__PXGLayout_updateStylingForSpritesAtIndexes___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PXGLayout_updateStylingForSpritesAtIndexes___block_invoke_2;
  v3[3] = &unk_1E5127210;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "modifySpritesAtIndexes:state:", v2, v3);

}

uint64_t __46__PXGLayout_updateStylingForSpritesAtIndexes___block_invoke_2(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  float v8;

  v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v6 = result;
    v7 = a2;
    do
    {
      *(_DWORD *)(a4 + 52) = 0;
      result = objc_msgSend(*(id *)(v6 + 32), "containsIndex:", v7);
      if ((_DWORD)result)
        v8 = 0.00000001;
      else
        v8 = 1.0;
      *(float *)a4 = v8;
      a4 += 160;
      ++v7;
      --v4;
    }
    while (v4);
  }
  return result;
}

void __22__PXGLayout_didUpdate__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)didUpdate_reportedClasses;
  didUpdate_reportedClasses = v0;

}

uint64_t __55__PXGLayout_convertSpriteIndexes_fromDescendantLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", *(_QWORD *)(a1 + 40) + a2, a3);
}

- (PXGItemsLayout)itemsLayout
{
  return 0;
}

- (id)createPointReferenceAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  _BOOL4 v7;
  PXGPointReference *v8;
  _QWORD v10[8];
  _QWORD v11[4];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  y = a3.y;
  x = a3.x;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXGLayout definesContextForPointReferences](self, "definesContextForPointReferences");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__90454;
  v17 = __Block_byref_object_dispose__90455;
  v18 = 0;
  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PXGLayout_PXGPointReference__createPointReferenceAtPoint___block_invoke;
    v12[3] = &unk_1E5124938;
    v12[4] = &v13;
    objc_msgSend(v6, "enumerateSublayoutsAtPoint:usingBlock:", v12, x, y);
  }
  else
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0x7FEFFFFFFFFFFFFFLL;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PXGLayout_PXGPointReference__createPointReferenceAtPoint___block_invoke_2;
    v10[3] = &unk_1E5124960;
    *(double *)&v10[6] = x;
    *(double *)&v10[7] = y;
    v10[4] = v11;
    v10[5] = &v13;
    -[PXGLayout enumerateSublayoutsForCreatingPointReferenceUsingBlock:](self, "enumerateSublayoutsForCreatingPointReferenceUsingBlock:", v10);
    _Block_object_dispose(v11, 8);
  }
  if (v14[5])
  {
    -[PXGLayout convertPoint:toDescendantLayout:](self, "convertPoint:toDescendantLayout:", x, y);
    objc_msgSend((id)v14[5], "createPointReferenceAtPoint:");
    v8 = (PXGPointReference *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[PXGPointReference initWithPoint:layout:]([PXGPointReference alloc], "initWithPoint:layout:", self, x, y);
    -[PXGLayout addPointReference:](self, "addPointReference:", v8);
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (CGPoint)pointForPointReference:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PXGLayout *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a3;
  objc_msgSend(v4, "point");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "layout");
  v9 = (PXGLayout *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v9 != self)
    {
      -[PXGLayout convertPoint:fromDescendantLayout:](self, "convertPoint:fromDescendantLayout:", v9, v6, v8);
      v6 = v10;
      v8 = v11;
    }
  }
  else
  {
    v6 = *(double *)off_1E50B8580;
    v8 = *((double *)off_1E50B8580 + 1);
  }

  v12 = v6;
  v13 = v8;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)hasPointReferences
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  void *v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXGLayout pointReferences](self, "pointReferences");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        if (*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i))
        {
          *((_BYTE *)v16 + 24) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (*((_BYTE *)v16 + 24))
  {
    v7 = 1;
  }
  else
  {
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__PXGLayout_PXGPointReference__hasPointReferences__block_invoke;
    v10[3] = &unk_1E5124988;
    v10[4] = &v15;
    objc_msgSend(v8, "enumerateSublayoutsUsingBlock:", v10);

    v7 = *((_BYTE *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (void)enumerateSublayoutsForCreatingPointReferenceUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__PXGLayout_PXGPointReference__enumerateSublayoutsForCreatingPointReferenceUsingBlock___block_invoke;
  v7[3] = &unk_1E513B968;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateSublayoutsUsingBlock:", v7);

}

uint64_t __87__PXGLayout_PXGPointReference__enumerateSublayoutsForCreatingPointReferenceUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__PXGLayout_PXGPointReference__hasPointReferences__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "hasPointReferences");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __60__PXGLayout_PXGPointReference__createPointReferenceAtPoint___block_invoke(uint64_t a1, int a2, id obj, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  *a4 = 1;
}

void __60__PXGLayout_PXGPointReference__createPointReferenceAtPoint___block_invoke_2(uint64_t a1, void *a2)
{
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "frame");
  PXRectShortestDistanceToPoint();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 < *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)createAnchorForSpriteAtIndex:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:", *(_QWORD *)&a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout createAnchorForSpriteReferences:](self, "createAnchorForSpriteReferences:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createAnchorForSpriteReferences:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXGLayout_PXGAnchor__createAnchorForSpriteReferences___block_invoke;
  v8[3] = &unk_1E5126A48;
  v9 = v4;
  v5 = v4;
  -[PXGLayout createAnchorWithConstraints:](self, "createAnchorWithConstraints:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createAnchorWithConstraints:(id)a3
{
  return -[PXGLayout _createAnchorWithPriority:constraints:](self, "_createAnchorWithPriority:constraints:", 1, a3);
}

- (id)createAnchorForScrollingSpriteForObjectReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  void *v11;
  void *v12;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  -[PXGLayout spriteReferenceForObjectReference:](self, "spriteReferenceForObjectReference:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:", v11, a4, top, left, bottom, right);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)createAnchorForScrollingSpriteAtIndex:(unsigned int)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5
{
  id v5;
  _QWORD v7[7];
  UIEdgeInsets v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__104192;
  v13 = __Block_byref_object_dispose__104193;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__PXGLayout_PXGAnchor__createAnchorForScrollingSpriteAtIndex_toScrollPosition_padding___block_invoke;
  v7[3] = &unk_1E5126A98;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a4;
  v8 = a5;
  -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", a3 | 0x100000000, 1, v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5
{
  return -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", a3, a4, 0, a5.top, a5.left, a5.bottom, a5.right);
}

- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 toScrollPosition:(unint64_t)a4 padding:(UIEdgeInsets)a5 customOffset:(id)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  id v14;
  NSObject *v15;
  PXGAnchor *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v22 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  if ((a4 & 0x30) != 0 && (a4 & 0x38) != 0x20 && (a4 & 0x38) != 0x10 || (a4 & 7) > 4 || (a4 & 7) == 3)
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v21 = a4;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "invalid scroll position %li", buf, 0xCu);
    }

  }
  v16 = -[PXGAnchor initWithLayout:]([PXGAnchor alloc], "initWithLayout:", self);
  -[PXGAnchor setType:](v16, "setType:", 2);
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGAnchor setSpriteReferences:](v16, "setSpriteReferences:", v17);

  -[PXGAnchor setScrollPosition:](v16, "setScrollPosition:", a4);
  -[PXGAnchor setPadding:](v16, "setPadding:", top, left, bottom, right);
  -[PXGAnchor setCustomOffset:](v16, "setCustomOffset:", v14);
  -[PXGLayout addAnchor:](self, "addAnchor:", v16);

  return v16;
}

- (id)createAnchorForScrollingSpriteForSpriteReference:(id)a3 normalizedAnchorPoint:(CGPoint)a4 toVisibleLocation:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;
  PXGAnchor *v11;
  void *v12;
  _QWORD v14[2];

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v14[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = -[PXGAnchor initWithLayout:]([PXGAnchor alloc], "initWithLayout:", self);
  -[PXGAnchor setType:](v11, "setType:", 2);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGAnchor setSpriteReferences:](v11, "setSpriteReferences:", v12);
  -[PXGAnchor setVisibleLocation:](v11, "setVisibleLocation:", x, y);
  -[PXGAnchor setNormalizedAnchorPoint:](v11, "setNormalizedAnchorPoint:", v8, v7);
  -[PXGLayout addAnchor:](self, "addAnchor:", v11);
  return v11;
}

- (id)createAnchorForContentEdges:(unint64_t)a3
{
  return -[PXGLayout _createAnchorForContentEdges:priority:](self, "_createAnchorForContentEdges:priority:", a3, 1);
}

- (id)createAnchorForScrollingAnimationTowardsContentEdges:(unint64_t)a3
{
  NSObject *v5;
  PXGAnchor *v6;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((a3 & 8) != 0 && (a3 & 0xA) != 8)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 134217984;
      v9 = a3;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "invalid edges %li", (uint8_t *)&v8, 0xCu);
    }

  }
  v6 = -[PXGAnchor initWithLayout:]([PXGAnchor alloc], "initWithLayout:", self);
  -[PXGAnchor setType:](v6, "setType:", 5);
  -[PXGAnchor setEdges:](v6, "setEdges:", a3);
  -[PXGLayout addAnchor:](self, "addAnchor:", v6);
  return v6;
}

- (id)createAnchorWithAnchor:(id)a3
{
  return -[PXGLayout _createAnchorWithAnchor:resetPriority:](self, "_createAnchorWithAnchor:resetPriority:", a3, 1);
}

- (void)invalidateAllSuperlayoutAnchors
{
  PXGLayout *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    do
    {
      objc_msgSend(v3, "activeAnchor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invalidate");

      objc_msgSend(v3, "superlayout");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
    while (v5);
  }
}

uint64_t __127__PXGLayout_PXGAnchor__createAnchorFromSuperlayoutWithSublayoutIndex_sublayoutPositionEdges_ignoringScrollingAnimationAnchors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "sublayoutIndexForSpriteReference:options:", a2, a3);
  if (result == *(_QWORD *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __87__PXGLayout_PXGAnchor__createAnchorForScrollingSpriteAtIndex_toScrollPosition_padding___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "spriteReferenceForSpriteIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:", v7, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __56__PXGLayout_PXGAnchor__createAnchorForSpriteReferences___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "keepSpriteWithReference:referencingOptions:visuallyStableForAttribute:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, 1, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)applySectionedChangeDetailsForSingleSection:(id)a3 dataSourceBeforeChanges:(id)a4 dataSourceAfterChanges:(id)a5 changeMediaVersionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PXGDataSourceChange *v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id obj;
  id v58;
  id v59;
  PXGLayout *v60;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  PXGLayout *v71;
  id v72;
  SEL v73;
  _QWORD v74[5];
  id v75;
  void *v76;
  id v77;
  SEL v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v12, "numberOfSections") != 1 && objc_msgSend(v12, "numberOfSections"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGDataSourceDrivenLayout.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceAfterChanges.numberOfSections == 1 || dataSourceAfterChanges.numberOfSections == 0"));

  }
  v14 = -[PXGDataSourceChange initWithChangeDetails:dataSourceBeforeChanges:dataSourceAfterChanges:]([PXGDataSourceChange alloc], "initWithChangeDetails:dataSourceBeforeChanges:dataSourceAfterChanges:", v10, v11, v12);
  -[PXGLayout setInternalCurrentDataSourceChange:](self, "setInternalCurrentDataSourceChange:", v14);

  v60 = self;
  -[PXGLayout layoutForItemChanges](self, "layoutForItemChanges");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v16 = v13;
  else
    v16 = &__block_literal_global_20_116702;
  v56 = _Block_copy(v16);

  v17 = objc_msgSend(v10, "count");
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v10;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v84;
    v52 = v12;
    v54 = v11;
    v62 = v15;
    v58 = (id)v17;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v84 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v22, "sectionChanges");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "hasIncrementalChanges"))
          goto LABEL_32;
        objc_msgSend(v22, "itemChangesInSection:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v24, "hasIncrementalChanges"))
          goto LABEL_31;
        objc_msgSend(v22, "sectionChanges");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removedIndexes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "count"))
        {

LABEL_31:
LABEL_32:

LABEL_33:
          v12 = v52;
          v11 = v54;
          v15 = v62;
          goto LABEL_34;
        }
        objc_msgSend(v22, "sectionChanges");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "insertedIndexes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (v29)
          goto LABEL_33;
      }
      v12 = v52;
      v11 = v54;
      v15 = v62;
      v17 = (uint64_t)v58;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
      if (v19)
        continue;
      break;
    }
  }

  if (v17 && objc_msgSend(v12, "numberOfSections"))
  {
    v63 = v15;
    v53 = v12;
    v55 = v11;
    objc_msgSend(off_1E50B3668, "indexPathSet");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v59 = obj;
    v31 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v80 != v33)
            objc_enumerationMutation(v59);
          v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
          objc_msgSend(v35, "sectionChanges");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "insertedIndexes");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");
          objc_msgSend(v36, "removedIndexes");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "count");

          if (v38 != v40)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v60, CFSTR("PXGDataSourceDrivenLayout.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionChangeDetails.insertedIndexes.count - sectionChangeDetails.removedIndexes.count == 0"));

          }
          objc_msgSend(v35, "indexPathSetAfterApplyingChangesToIndexPathSet:hasIncrementalChanges:", v30, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v41, "mutableCopy");

          objc_msgSend(v35, "sectionsWithItemChanges");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_2;
          v74[3] = &unk_1E51353A8;
          v78 = a2;
          v74[4] = v60;
          v75 = v63;
          v76 = v35;
          v30 = v42;
          v77 = v30;
          objc_msgSend(v43, "enumerateIndexesUsingBlock:", v74);

        }
        v32 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
      }
      while (v32);
    }

    v45 = MEMORY[0x1E0C809B0];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_4;
    v69[3] = &unk_1E51289A8;
    v46 = v59;
    v70 = v46;
    v71 = v60;
    v72 = v30;
    v73 = a2;
    v47 = v30;
    objc_msgSend(v47, "enumerateDataSourceIdentifiers:", v69);
    v48 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v64[0] = v45;
    v64[1] = 3221225472;
    v64[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_5;
    v64[3] = &unk_1E5128A18;
    v15 = v63;
    v65 = v63;
    v66 = v46;
    v67 = v48;
    v68 = v56;
    v49 = v48;
    objc_msgSend(v47, "enumerateItemIndexSetsUsingBlock:", v64);

    v12 = v53;
    v11 = v55;
  }
  else
  {
LABEL_34:
    if (objc_msgSend(v12, "numberOfSections") == 1)
      v50 = objc_msgSend(v12, "numberOfItemsInSection:", 0);
    else
      v50 = 0;
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberOfItems:withChangeDetails:", v50, v47);
  }

}

- (PXGItemsLayout)layoutForItemChanges
{
  return 0;
}

- (PXGDataSourceChange)currentDataSourceChange
{
  void *v3;
  void *v4;
  void *v5;

  -[PXGLayout internalCurrentDataSourceChange](self, "internalCurrentDataSourceChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PXGLayout superlayout](self, "superlayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      do
      {
        v5 = v4;
        objc_msgSend(v4, "internalCurrentDataSourceChange");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "superlayout");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v4 && !v3);
    }
    else
    {
      v3 = 0;
    }
    -[PXGLayout setInternalCurrentDataSourceChange:](self, "setInternalCurrentDataSourceChange:", v3);

  }
  return (PXGDataSourceChange *)v3;
}

- (BOOL)shouldApplyItemChangeDetailsToSublayout:(id)a3
{
  return 1;
}

void __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PXGDataSourceDrivenLayout.m"), 174, CFSTR("Only supports changes to section 0"));

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "itemChangesInSection:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasIncrementalChanges") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PXGDataSourceDrivenLayout.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemChanges.hasIncrementalChanges"));

    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "numberOfItems");
    objc_msgSend(v4, "insertedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") + v5;
    objc_msgSend(v4, "removedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 - objc_msgSend(v8, "count");

    objc_msgSend(*(id *)(a1 + 40), "setNumberOfItems:withChangeDetails:", v9, v4);
    v10 = *(void **)(a1 + 56);
    v11 = objc_msgSend(*(id *)(a1 + 48), "toDataSourceIdentifier");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_3;
    v15[3] = &unk_1E5128958;
    v16 = v4;
    v14 = v4;
    objc_msgSend(v10, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v11, a2, v15);

  }
}

void __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "toDataSourceIdentifier");

  if (v5 != a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXGDataSourceDrivenLayout.m"), 189, CFSTR("Data source identifier in itemsWithChanges %lu != %lu from the change details. allChangeDetails:%@ itemsWithChanges:%@ "), a2, objc_msgSend(v8, "toDataSourceIdentifier"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

void __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_5(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  if (a1[4])
  {
    v7 = (void *)MEMORY[0x1E0CB3788];
    v8 = a4;
    objc_msgSend(v7, "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "loadedItemsForItems:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_6;
    v15[3] = &unk_1E51289D0;
    v20 = a2;
    v21 = a3;
    v16 = a1[5];
    v17 = a1[6];
    v19 = a1[7];
    v14 = v9;
    v18 = v14;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v15);
    if (objc_msgSend(v14, "count"))
    {
      v11 = a1[4];
      v12 = objc_msgSend(v11, "numberOfItems");
      objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexes:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNumberOfItems:withChangeDetails:changeMediaVersionHandler:", v12, v13, &__block_literal_global_27_116705);

    }
  }
}

uint64_t __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v21 = 0u;
  v22 = 0u;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)&v19 = v4;
  *((_QWORD *)&v19 + 1) = v5;
  *(_QWORD *)&v20 = a2;
  *((_QWORD *)&v20 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(off_1E50B4A18, "indexPathAfterRevertingChanges:fromIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", v6, &v19, 0, 0, v7);
  if ((_QWORD)v21 != *(_QWORD *)off_1E50B7E98)
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)off_1E50B7F40);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
    v19 = v21;
    v20 = v22;
    v18[0] = v4;
    v18[1] = v5;
    v18[2] = a2;
    v18[3] = 0x7FFFFFFFFFFFFFFFLL;
    v16 = v10(v9, &v19, v18, v11, v12, v13, v14, v15);
    if ((v8 & 1) != 0 || v16)
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", a2);
  }
  return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
}

uint64_t __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_7()
{
  return 1;
}

void __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "changedIndexes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndexes:", v4);

}

uint64_t __157__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetailsForSingleSection_dataSourceBeforeChanges_dataSourceAfterChanges_changeMediaVersionHandler___block_invoke()
{
  return 0;
}

void __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "toDataSourceIdentifier");

  if (v5 != a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXGDataSourceDrivenLayout.m"), 100, CFSTR("Data source identifier in itemsWithChanges %lu != %lu from the change details. allChangeDetails:%@ itemsWithChanges:%@ "), a2, objc_msgSend(v8, "toDataSourceIdentifier"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

void __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_5(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v13 = a4;
  objc_msgSend(a1[4], "sublayoutAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutForItemChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_6;
    v14[3] = &unk_1E51289D0;
    v19 = a2;
    v20 = a3;
    v15 = a1[5];
    v16 = a1[6];
    v18 = a1[7];
    v10 = v9;
    v17 = v10;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", v14);
    if (objc_msgSend(v10, "count"))
    {
      v11 = objc_msgSend(v8, "numberOfItems");
      objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexes:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNumberOfItems:withChangeDetails:changeMediaVersionHandler:", v11, v12, &__block_literal_global_14_116720);

    }
  }

}

uint64_t __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v21 = 0u;
  v22 = 0u;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)&v19 = v4;
  *((_QWORD *)&v19 + 1) = v5;
  *(_QWORD *)&v20 = a2;
  *((_QWORD *)&v20 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(off_1E50B4A18, "indexPathAfterRevertingChanges:fromIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", v6, &v19, 0, 0, v7);
  if ((_QWORD)v21 != *(_QWORD *)off_1E50B7E98)
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)off_1E50B7F40);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
    v19 = v21;
    v20 = v22;
    v18[0] = v4;
    v18[1] = v5;
    v18[2] = a2;
    v18[3] = 0x7FFFFFFFFFFFFFFFLL;
    v16 = v10(v9, &v19, v18, v11, v12, v13, v14, v15);
    if ((v8 & 1) != 0 || v16)
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", a2);
  }
  return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
}

uint64_t __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_7()
{
  return 1;
}

void __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "changedIndexes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndexes:", v4);

}

uint64_t __205__PXGLayout_PXGDataSourceDrivenLayout__applySectionedChangeDetails_dataSourceBeforeChanges_dataSourceAfterChanges_sublayoutProvider_outChangedSections_outSectionsWithItemChanges_changeMediaVersionHandler___block_invoke()
{
  return 0;
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PXGLayout_PXGItemPlacement__getDetailedPresentedPlacement_forItemReference___block_invoke;
  v8[3] = &unk_1E512A2F8;
  v9 = v6;
  v7 = v6;
  -[PXGLayout enumerateSublayoutsForDetailedPlacement:ofItemWithReference:usingBlock:](self, "enumerateSublayoutsForDetailedPlacement:ofItemWithReference:usingBlock:", v7, a4, v8);

}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PXGLayout_PXGItemPlacement__setDetailedPlacementOverride_forItemReference___block_invoke;
  v8[3] = &unk_1E512A2F8;
  v9 = v6;
  v7 = v6;
  -[PXGLayout enumerateSublayoutsForDetailedPlacement:ofItemWithReference:usingBlock:](self, "enumerateSublayoutsForDetailedPlacement:ofItemWithReference:usingBlock:", v7, a4, v8);

}

- (void)enumerateSublayoutsForDetailedPlacement:(id)a3 ofItemWithReference:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__PXGLayout_PXGItemPlacement__enumerateSublayoutsForDetailedPlacement_ofItemWithReference_usingBlock___block_invoke;
  v12[3] = &unk_1E512A320;
  v13 = v7;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "enumerateSublayoutsUsingBlock:", v12);

}

uint64_t __102__PXGLayout_PXGItemPlacement__enumerateSublayoutsForDetailedPlacement_ofItemWithReference_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 32));
}

uint64_t __77__PXGLayout_PXGItemPlacement__setDetailedPlacementOverride_forItemReference___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setDetailedPlacementOverride:forItemReference:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __78__PXGLayout_PXGItemPlacement__getDetailedPresentedPlacement_forItemReference___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "getDetailedPresentedPlacement:forItemReference:", *(_QWORD *)(a1 + 32), a3);
}

- (id)createDefaultAnimationForCurrentContext
{
  void *v3;
  void *v4;
  void *v5;

  -[PXGLayout superlayout](self, "superlayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXGLayout superlayout](self, "superlayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDefaultAnimationForCurrentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PXGLayout createAnimation](self, "createAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__131222;
  v16 = __Block_byref_object_dispose__131223;
  v17 = 0;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__PXGLayout_PXGViewControllerTransitionEndPoint__itemPlacementControllerForItemReference___block_invoke;
  v9[3] = &unk_1E512B2C0;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "enumerateSublayoutsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __90__PXGLayout_PXGViewControllerTransitionEndPoint__itemPlacementControllerForItemReference___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "itemPlacementControllerForItemReference:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

- (CGSize)minPlayableSizeForSpriteAtIndex:(unsigned int)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  CGSize result;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x3010000000;
  v13 = &unk_1A7E74EE7;
  v14 = *(_OWORD *)off_1E50B8810;
  if (-[PXGLayout numberOfSprites](self, "numberOfSprites") > a3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__PXGLayout_MinPlayableSize__minPlayableSizeForSpriteAtIndex___block_invoke;
    v9[3] = &unk_1E5131B88;
    v9[4] = &v10;
    -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", a3 | 0x100000000, 1, v9);
  }
  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

void __62__PXGLayout_MinPlayableSize__minPlayableSizeForSpriteAtIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "contentSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minSpriteSizeForPresentationStyle:", 2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;

}

- (id)createCuratedLibraryLayoutSkimmingSlideshowAnimationFromSectionIndexPath:(PXSimpleIndexPath *)a3 toSectionIndexPath:(PXSimpleIndexPath *)a4
{
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  PXSimpleIndexPath v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)&a3->item;
  v16 = *(_OWORD *)&a3->dataSourceIdentifier;
  v17 = v7;
  v15 = *a4;
  if (!PXSimpleIndexPathCompare())
    return 0;
  v18[0] = CFSTR("PXCuratedLibrarySkimmingSlideshowFromSectionKey");
  v8 = *(_OWORD *)&a3->item;
  v16 = *(_OWORD *)&a3->dataSourceIdentifier;
  v17 = v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &v16, *(_OWORD *)&v15.dataSourceIdentifier, *(_OWORD *)&v15.item);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v18[1] = CFSTR("PXCuratedLibrarySkimmingSlideshowToSectionKey");
  v10 = *(_OWORD *)&a4->item;
  v16 = *(_OWORD *)&a4->dataSourceIdentifier;
  v17 = v10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithSimpleIndexPath:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGLayout createCuratedLibraryLayoutAnimationIfNeededWithContext:userData:](self, "createCuratedLibraryLayoutAnimationIfNeededWithContext:userData:", 2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)createCuratedLibraryLayoutTransitionIfNeededWithContext:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  PXGLayout *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PXGLayout superlayout](self, "superlayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "attempting to create an transition from a sublayout without superlayout: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(v5, "createCuratedLibraryLayoutTransitionIfNeededWithContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addInteraction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXGLayout interactions](self, "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v8, "setLayout:", self);
    -[PXGLayout interactions](self, "interactions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout setInteractions:](self, "setInteractions:", v7);

  }
}

- (void)removeInteraction:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXGLayout interactions](self, "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if (v5)
  {
    -[PXGLayout interactions](self, "interactions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObject:", v8);
    -[PXGLayout setInteractions:](self, "setInteractions:", v7);
    objc_msgSend(v8, "setLayout:", 0);

  }
}

- (id)createTransitionWithAnimations:(id)a3
{
  id v4;
  PXGTransition *v5;
  PXGTransition *v6;
  void *v7;
  _QWORD v9[4];
  PXGTransition *v10;

  v4 = a3;
  v5 = -[PXGTransition initWithAnimations:layout:]([PXGTransition alloc], "initWithAnimations:layout:", v4, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__PXGLayout_PXGTransition__createTransitionWithAnimations___block_invoke;
  v9[3] = &unk_1E51349A8;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  -[PXGLayout rootLayout](self, "rootLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTransition:", v6);

  return v6;
}

uint64_t __59__PXGLayout_PXGTransition__createTransitionWithAnimations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTransition:", *(_QWORD *)(a1 + 32));
}

- (void)invalidateDecorationAndSprites
{
  -[PXGLayout _invalidateDecorationForSpriteRange:inLayout:invalidateSprites:](self, "_invalidateDecorationForSpriteRange:inLayout:invalidateSprites:", -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32, self, 1);
}

- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4
{
  char v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PXGLayout_PXGDecoratingLayout__isSpriteIndex_decoratingSpriteWithIndex___block_invoke;
  v7[3] = &unk_1E5136570;
  v7[4] = self;
  v7[5] = &v12;
  v7[6] = &v8;
  -[PXGLayout enumerateLayoutsForSpritesInRange:options:usingBlock:](self, "enumerateLayoutsForSpritesInRange:options:usingBlock:", a3 | 0x100000000, 1, v7);
  if (a4)
    *a4 = *((_DWORD *)v9 + 6);
  v5 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (BOOL)shouldInvalidateDecorationForModifiedSprites
{
  return 1;
}

void __74__PXGLayout_PXGDecoratingLayout__isSpriteIndex_decoratingSpriteWithIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  if (*(void **)(a1 + 32) != a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24;
    v6 = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "isSpriteIndex:decoratingSpriteWithIndex:", a2, v5);
    LODWORD(a2) = objc_msgSend(*(id *)(a1 + 32), "convertSpriteIndex:fromDescendantLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v6);

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }
}

- (PXAssetsSectionLayout)px_assetsSectionLayout
{
  return 0;
}

- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3
{
  _QWORD v3[2];
  _OWORD v4[8];
  uint64_t v5;
  char v6;

  v6 = 0;
  memset(v4, 0, sizeof(v4));
  v5 = 0;
  v3[0] = 0;
  v3[1] = 0;
  (*((void (**)(id, uint64_t, _OWORD *, _QWORD *, char *))a3 + 2))(a3, 0x7FFFFFFFFFFFFFFFLL, v4, v3, &v6);
}

- (void)axRemoveSubgroupForSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  char v5;
  void *v7;
  void *v8;
  id v9;

  v5 = a5;
  -[PXGLayout axGroup](self, "axGroup", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v7, "unloadSubgroupAtIndex:", a4);
    }
    else
    {
      objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", a4, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateSubgroupsWithChangeDetails:", v8);

    }
    v7 = v9;
  }

}

- (NSString)axLocalizedLabel
{
  return 0;
}

- (CGRect)axConvertRect:(CGRect)a3 fromDescendantGroup:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 98, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("descendantGroup"), v27, v29);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 98, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("descendantGroup"), v27);
  }

LABEL_3:
  v11 = *MEMORY[0x1E0C9D628];
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend(v10, "containingLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "containingLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v16, x, y, width, height);
    v11 = v17;
    v12 = v18;
    v13 = v19;
    v14 = v20;

  }
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)axConvertRect:(CGRect)a3 toDescendantGroup:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 107, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("descendantGroup"), v27, v29);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 107, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("descendantGroup"), v27);
  }

LABEL_3:
  v11 = *MEMORY[0x1E0C9D628];
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend(v10, "containingLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "containingLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v16, x, y, width, height);
    v11 = v17;
    v12 = v18;
    v13 = v19;
    v14 = v20;

  }
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)axConvertPoint:(CGPoint)a3 fromDescendantGroup:(id)a4
{
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 116, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("descendantGroup"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 116, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("descendantGroup"), v21);
  }

LABEL_3:
  v9 = *MEMORY[0x1E0C9D628];
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  objc_msgSend(v8, "containingLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v8, "containingLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v14, x, y, v12, v13);
    v9 = v15;
    v10 = v16;

  }
  v17 = v9;
  v18 = v10;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)axConvertPoint:(CGPoint)a3 toDescendantGroup:(id)a4
{
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 126, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("descendantGroup"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayout+AX.m"), 126, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("descendantGroup"), v21);
  }

LABEL_3:
  v9 = *MEMORY[0x1E0C9D628];
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  objc_msgSend(v8, "containingLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v8, "containingLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v14, x, y, v12, v13);
    v9 = v15;
    v10 = v16;

  }
  v17 = v9;
  v18 = v10;
  result.y = v18;
  result.x = v17;
  return result;
}

- (BOOL)axShouldSearchLeafsInSubgroups
{
  return 1;
}

- (BOOL)axShouldBeConsideredAsSubgroup
{
  return 1;
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  return -1;
}

- (id)axSpriteIndexesInRectDefaultImplementation:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXGLayout axSpriteIndexes](self, "axSpriteIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PXGLayout_AX__axSpriteIndexesInRectDefaultImplementation___block_invoke;
  v14[3] = &unk_1E513E1C0;
  v14[4] = self;
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  v10 = v8;
  v15 = v10;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v14);

  v11 = v15;
  v12 = v10;

  return v12;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  void *v4;
  unint64_t v5;

  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else if (PXGAXInfoKindForMediaKind(*(unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(v4), "infos")
                                                         + 40 * a3
                                                         + 1)) == 6)
  {
    v5 = 2;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)axLeafForObjectReference:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = -[PXGLayout spriteIndexForObjectReference:](self, "spriteIndexForObjectReference:", a3);
  -[PXGLayout leafSublayoutForSpriteIndex:](self, "leafSublayoutForSpriteIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "convertSpriteIndex:fromLayout:", v4, self);
    objc_msgSend(v6, "axGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "loadLeafAtSpriteIndexIfNeeded:usingOptions:", v7, 1);

    objc_msgSend(v6, "axGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadedLeafAtSpriteIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXGLayout axNextResponder](self, "axNextResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axContainingScrollViewForAXGroup:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)axContainingViewForAXGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXGLayout axContainingScrollViewForAXGroup:](self, "axContainingScrollViewForAXGroup:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    do
    {
      v5 = v4;
      objc_opt_self();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v5;
      else
        v7 = 0;
      v8 = v7;

      objc_msgSend(v5, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v4 && !v8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[PXGLayout axNextResponder](self, "axNextResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v10, "axGroup:didRequestToPerformAction:userInfo:", v9, a4, v8);

  return a4;
}

uint64_t __60__PXGLayout_AX__axSpriteIndexesInRectDefaultImplementation___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t result;
  CGRect v10;

  v2 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "geometryForSpriteAtIndex:", a2, (unsigned __int128)0, (unsigned __int128)0);
  PXRectWithCenterAndSize();
  v10.origin.x = v5;
  v10.origin.y = v6;
  v10.size.width = v7;
  v10.size.height = v8;
  result = CGRectIntersectsRect(*(CGRect *)(a1 + 48), v10);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", v2);
  return result;
}

- (unsigned)spriteIndexForSpriteReference:(id)a3
{
  return -[PXGLayout spriteIndexForSpriteReference:options:](self, "spriteIndexForSpriteReference:options:", a3, 0);
}

- (id)spriteReferenceForObjectReference:(id)a3
{
  return -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:", 0xFFFFFFFFLL, a3);
}

- (id)dynamicSpriteReferenceForObjectReference:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[PXGSpriteReference _init]([PXGSpriteReference alloc], "_init");
  objc_msgSend(v5, "setObjectReference:", v4);

  objc_msgSend(v5, "setLayout:", self);
  objc_msgSend(v5, "setIsDynamic:", 1);
  return v5;
}

- (id)spriteReferenceForSpriteReference:(id)a3
{
  id v4;
  PXGLayout *v5;
  uint64_t v6;
  int64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "layout");
  v5 = (PXGLayout *)objc_claimAutoreleasedReturnValue();
  if (v5 != self)
  {

LABEL_5:
    v8 = -[PXGSpriteReference _init]([PXGSpriteReference alloc], "_init");
    objc_msgSend(v4, "objectReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObjectReference:", v9);

    objc_msgSend(v8, "setIsDynamic:", objc_msgSend(v4, "isDynamic"));
    objc_msgSend(v8, "setLayout:", self);
    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "layoutVersion");
  v7 = -[PXGLayout version](self, "version");

  if (v6 != v7)
    goto LABEL_5;
  v8 = v4;
LABEL_6:

  return v8;
}

- (int64_t)sublayoutIndexForSpriteReference:(id)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v19;

  v6 = a3;
  if (objc_msgSend(v6, "spriteIndex") != -1)
  {
    v7 = objc_msgSend(v6, "layoutVersion");
    objc_msgSend(v6, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == objc_msgSend(v8, "version"))
    {
      objc_msgSend(v6, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = objc_msgSend(v6, "spriteIndex");
        objc_msgSend(v6, "layout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PXGLayout convertSpriteIndex:fromLayout:](self, "convertSpriteIndex:fromLayout:", v10, v11);

        v13 = -[PXGLayout sublayoutIndexForSpriteIndex:](self, "sublayoutIndexForSpriteIndex:", v12);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = v13;
          v15 = 0;
          goto LABEL_12;
        }
      }
    }
    else
    {

    }
  }
  objc_msgSend(v6, "objectReference");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "objectReference");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v14 = -[PXGLayout sublayoutIndexForObjectReference:options:updatedObjectReference:](self, "sublayoutIndexForObjectReference:options:updatedObjectReference:", v17, a4, &v19);
    v15 = v19;

    if (v14 != 0x7FFFFFFFFFFFFFFFLL && v15)
      objc_msgSend(v6, "setObjectReference:", v15);
  }
  else
  {
    v15 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_12:

  return v14;
}

- (void)hostingControllerProposedReferenceSize:(id)a3
{
  objc_msgSend(a3, "accept");
}

@end

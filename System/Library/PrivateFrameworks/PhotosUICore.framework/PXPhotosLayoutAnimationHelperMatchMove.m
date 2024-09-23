@implementation PXPhotosLayoutAnimationHelperMatchMove

- (double)animationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchMoveAnimationDuration");
  v4 = v3;

  return v4;
}

- (BOOL)wantsFromSnapshot
{
  return 1;
}

- (BOOL)wantsToSnapshot
{
  return 1;
}

- (BOOL)wantsAnimationWithSpriteTransfer
{
  return 1;
}

- (BOOL)wantsPresentationAdjustment
{
  return 1;
}

- (unsigned)highFrameRateReason
{
  return 2228229;
}

- (void)animation:(id)a3 updateSpriteTransferMap:(unsigned int *)a4 forSpritesRemovedFromIndexes:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8 spritesInsertedToIndexes:(id)a9 targetGeometries:(id *)a10 styles:(id *)a11 infos:(id *)a12 rootLayout:(id)a13
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  const $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v31;
  const $786F7D2F4E5B3A0CBB66DF574B7D98CF *v32;
  unsigned int *v33;

  v18 = a9;
  v19 = a5;
  v20 = a3;
  objc_msgSend(v20, "fromSnapshot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "toSnapshot");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v18, "mutableCopy");
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __204__PXPhotosLayoutAnimationHelperMatchMove_animation_updateSpriteTransferMap_forSpritesRemovedFromIndexes_presentedGeometries_styles_infos_spritesInsertedToIndexes_targetGeometries_styles_infos_rootLayout___block_invoke;
  v27[3] = &unk_1E513F208;
  v28 = v21;
  v29 = v22;
  v30 = v23;
  v31 = a6;
  v32 = a8;
  v33 = a4;
  v24 = v23;
  v25 = v22;
  v26 = v21;
  objc_msgSend(v26, "enumerateObjectIdentifiersForSpriteIndexes:infos:usingBlock:", v19, a8, v27);

}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;
  $225AF24142A77900D29617A74D173C5F *v8;

  length = a7.length;
  if (a7.length)
  {
    v8 = a5;
    do
    {
      v8->var0 = 0.0;
      v8 = ($225AF24142A77900D29617A74D173C5F *)((char *)v8 + 160);
      --length;
    }
    while (length);
  }
  -[PXPhotosLayoutAnimationHelperMatchMove _adjustAnimation:geometries:styles:infos:forSpriteIndexRange:appearing:](self, "_adjustAnimation:geometries:styles:infos:forSpriteIndexRange:appearing:", a3, a4, a5, a6);
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length;
  double *p_var2;
  $225AF24142A77900D29617A74D173C5F *v9;

  length = a7.length;
  if (a7.length)
  {
    p_var2 = &a4->var0.var2;
    v9 = a5;
    do
    {
      v9->var0 = 0.0;
      v9 = ($225AF24142A77900D29617A74D173C5F *)((char *)v9 + 160);
      *p_var2 = *p_var2 + 50.0;
      p_var2 += 4;
      --length;
    }
    while (length);
  }
  -[PXPhotosLayoutAnimationHelperMatchMove _adjustAnimation:geometries:styles:infos:forSpriteIndexRange:appearing:](self, "_adjustAnimation:geometries:styles:infos:forSpriteIndexRange:appearing:", a3, a4, a5, a6);
}

- (void)_adjustAnimation:(id)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteIndexRange:(_PXGSpriteIndexRange)a7 appearing:(BOOL)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v22;
  $225AF24142A77900D29617A74D173C5F *v23;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v24;

  v13 = a3;
  v14 = v13;
  if (a8)
  {
    objc_msgSend(v13, "fromSnapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "toSnapshot");
  }
  else
  {
    objc_msgSend(v13, "toSnapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fromSnapshot");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __113__PXPhotosLayoutAnimationHelperMatchMove__adjustAnimation_geometries_styles_infos_forSpriteIndexRange_appearing___block_invoke;
  v19[3] = &unk_1E513F258;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v20 = v16;
  v21 = v15;
  v17 = v15;
  v18 = v16;
  objc_msgSend(v18, "enumerateObjectIdentifiersForInfos:count:usingBlock:", a6, HIDWORD(*(unint64_t *)&a7), v19);

}

- (void)animation:(id)a3 adjustPresentedGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 count:(unsigned int)a7
{
  __int128 v7;
  uint64_t v8;
  float *p_var2;

  if (a7)
  {
    v7 = *(_OWORD *)off_1E50B81E8;
    v8 = a7;
    p_var2 = &a5->var2;
    do
    {
      *(_OWORD *)p_var2 = v7;
      p_var2 += 40;
      --v8;
    }
    while (v8);
  }
}

void __113__PXPhotosLayoutAnimationHelperMatchMove__adjustAnimation_geometries_styles_infos_forSpriteIndexRange_appearing___block_invoke(uint64_t a1, void *a2, char a3, unsigned int a4)
{
  unsigned int v7;
  uint64_t v8;
  float32x2_t v9;
  float32x2_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  CGRect v21;
  CGRect v22;

  v14 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 48) + 32 * a4;
  objc_msgSend(*(id *)(a1 + 32), "visibleRect");
  v9 = *(float32x2_t *)(v8 + 24);
  v10 = vmul_f32(v9, (float32x2_t)0x3F0000003F000000);
  v22.origin.x = *(double *)v8 - v10.f32[0];
  v22.origin.y = *(double *)(v8 + 8) - v10.f32[1];
  v22.size.width = v9.f32[0];
  v22.size.height = v9.f32[1];
  if (CGRectIntersectsRect(v21, v22))
  {
    v11 = *(_QWORD *)(a1 + 56) + 160 * v7;
    v12 = *(_QWORD *)(a1 + 64) + 40 * v7;
    v13 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __113__PXPhotosLayoutAnimationHelperMatchMove__adjustAnimation_geometries_styles_infos_forSpriteIndexRange_appearing___block_invoke_2;
    v15[3] = &unk_1E513F230;
    v17 = v12;
    v20 = a3;
    v16 = v13;
    v18 = v8;
    v19 = v11;
    objc_msgSend(v16, "enumerateSpritesWithObjectIdentifier:usingBlock:", v14, v15);

  }
}

__n128 __113__PXPhotosLayoutAnimationHelperMatchMove__adjustAnimation_geometries_styles_infos_forSpriteIndexRange_appearing___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3, int a4, _BYTE *a5)
{
  uint64_t v8;
  float32x2_t v9;
  float32x2_t v10;
  __n128 result;
  uint64_t v12;
  uint64_t v13;
  CGRect v14;
  CGRect v15;

  if (*(unsigned __int8 *)(a3[3] + 1) == *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1)
    && *(unsigned __int8 *)(a1 + 64) == a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "visibleRect");
    v8 = a3[1];
    v9 = *(float32x2_t *)(v8 + 24);
    v10 = vmul_f32(v9, (float32x2_t)0x3F0000003F000000);
    v15.origin.x = *(double *)v8 - v10.f32[0];
    v15.origin.y = *(double *)(v8 + 8) - v10.f32[1];
    v15.size.width = v9.f32[0];
    v15.size.height = v9.f32[1];
    if (CGRectIntersectsRect(v14, v15))
    {
      v12 = a3[1];
      v13 = *(_QWORD *)(a1 + 48);
      *(_OWORD *)v13 = *(_OWORD *)v12;
      *(_QWORD *)(v13 + 16) = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(v13 + 24) = *(_QWORD *)(v12 + 24);
      *(_OWORD *)(*(_QWORD *)(a1 + 56) + 4) = *(_OWORD *)(a3[2] + 4);
      result = *(__n128 *)(a3[2] + 36);
      *(__n128 *)(*(_QWORD *)(a1 + 56) + 36) = result;
      *a5 = 1;
    }
  }
  return result;
}

void __204__PXPhotosLayoutAnimationHelperMatchMove_animation_updateSpriteTransferMap_forSpritesRemovedFromIndexes_presentedGeometries_styles_infos_spritesInsertedToIndexes_targetGeometries_styles_infos_rootLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4, unsigned int a5)
{
  uint64_t v9;
  uint64_t v10;
  float32x2_t v11;
  float32x2_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  CGRect v24;
  CGRect v25;

  v16 = a3;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 56) + 32 * a5;
  objc_msgSend(*(id *)(a1 + 32), "visibleRect");
  v11 = *(float32x2_t *)(v10 + 24);
  v12 = vmul_f32(v11, (float32x2_t)0x3F0000003F000000);
  v25.origin.x = *(double *)v10 - v12.f32[0];
  v25.origin.y = *(double *)(v10 + 8) - v12.f32[1];
  v25.size.width = v11.f32[0];
  v25.size.height = v11.f32[1];
  if (CGRectIntersectsRect(v24, v25))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __204__PXPhotosLayoutAnimationHelperMatchMove_animation_updateSpriteTransferMap_forSpritesRemovedFromIndexes_presentedGeometries_styles_infos_spritesInsertedToIndexes_targetGeometries_styles_infos_rootLayout___block_invoke_2;
    v17[3] = &unk_1E513F1E0;
    v20 = v9 + 40 * a5;
    v23 = a4;
    v13 = *(void **)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 72);
    v19 = v14;
    v21 = v15;
    v22 = a2;
    objc_msgSend(v13, "enumerateSpritesWithObjectIdentifier:usingBlock:", v16, v17);

  }
}

uint32x2_t __204__PXPhotosLayoutAnimationHelperMatchMove_animation_updateSpriteTransferMap_forSpritesRemovedFromIndexes_presentedGeometries_styles_infos_spritesInsertedToIndexes_targetGeometries_styles_infos_rootLayout___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, int a4, _BYTE *a5)
{
  uint64_t SupportedResize;
  uint32x2_t result;
  float32x2_t *v12;
  float32x2_t *v13;
  uint64_t v14;
  float32x2_t v15;
  float32x2_t v16;
  uint32x2_t v17;
  CGRect v18;
  CGRect v19;

  SupportedResize = PXGMediaKindGetSupportedResize();
  v12 = *(float32x2_t **)(a1 + 48);
  if (SupportedResize)
  {
    v13 = *(float32x2_t **)(a3 + 24);
  }
  else
  {
    v13 = *(float32x2_t **)(a3 + 24);
    v17 = (uint32x2_t)vceq_f32(v12[1], v13[1]);
    result = vpmin_u32(v17, v17);
    if ((result.i32[0] & 0x80000000) == 0)
      return result;
  }
  if (v12->u8[1] == v13->u8[1]
    && *(unsigned __int8 *)(a1 + 72) == a4
    && objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:", a2);
    objc_msgSend(*(id *)(a1 + 40), "visibleRect");
    v14 = *(_QWORD *)(a3 + 8);
    v15 = *(float32x2_t *)(v14 + 24);
    v16 = vmul_f32(v15, (float32x2_t)0x3F0000003F000000);
    v19.origin.x = *(double *)v14 - v16.f32[0];
    v19.origin.y = *(double *)(v14 + 8) - v16.f32[1];
    v19.size.width = v15.f32[0];
    v19.size.height = v15.f32[1];
    if (CGRectIntersectsRect(v18, v19))
      *(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * *(_QWORD *)(a1 + 64)) = a2;
    *a5 = 1;
  }
  return result;
}

@end

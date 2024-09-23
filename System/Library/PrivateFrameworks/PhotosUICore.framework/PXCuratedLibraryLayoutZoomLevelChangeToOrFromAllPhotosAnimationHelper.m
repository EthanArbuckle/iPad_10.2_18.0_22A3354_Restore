@implementation PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper

- (PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper)initWithLayout:(id)a3
{
  id v4;
  PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper *v5;
  _PXCuratedLibraryLayoutAssetsSnapshot *v6;
  _PXCuratedLibraryLayoutAssetsSnapshot *fromSnapshot;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper;
  v5 = -[PXCuratedLibraryLayoutAnimationHelper initWithLayout:](&v9, sel_initWithLayout_, v4);
  if (v5)
  {
    v6 = -[_PXCuratedLibraryLayoutAssetsSnapshot initWithLayout:]([_PXCuratedLibraryLayoutAssetsSnapshot alloc], "initWithLayout:", v4);
    fromSnapshot = v5->_fromSnapshot;
    v5->_fromSnapshot = v6;

  }
  return v5;
}

- (double)animationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionToOrFromAllPhotosAnimationDuration");
  v4 = v3;

  return v4;
}

- (unsigned)highFrameRateReason
{
  return 2228227;
}

- (id)_snapshotForZoomLevel:(int64_t)a3
{
  void (**v4)(void *, _PXCuratedLibraryLayoutAssetsSnapshot *);
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__153383;
  v12 = __Block_byref_object_dispose__153384;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__snapshotForZoomLevel___block_invoke;
  v7[3] = &unk_1E512E960;
  v7[4] = &v8;
  v7[5] = a3;
  v4 = (void (**)(void *, _PXCuratedLibraryLayoutAssetsSnapshot *))_Block_copy(v7);
  v4[2](v4, self->_fromSnapshot);
  v4[2](v4, self->_toSnapshot);
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5
{
  double y;
  double x;
  id v10;
  id v11;
  id v12;
  _PXCuratedLibraryLayoutAssetsSnapshot *v13;
  _PXCuratedLibraryLayoutAssetsSnapshot *toSnapshot;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  objc_class *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD aBlock[4];
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  y = a5.y;
  x = a5.x;
  v10 = a3;
  v11 = a4;
  -[_PXCuratedLibraryLayoutAssetsSnapshot setOffset:](self->_fromSnapshot, "setOffset:", x, y);
  v12 = v11;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m"), 114, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("rootLayout"), v40);
LABEL_13:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m"), 114, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("rootLayout"), v40, v42);

    goto LABEL_13;
  }
LABEL_3:
  v13 = -[_PXCuratedLibraryLayoutAssetsSnapshot initWithLayout:]([_PXCuratedLibraryLayoutAssetsSnapshot alloc], "initWithLayout:", v12);
  toSnapshot = self->_toSnapshot;
  self->_toSnapshot = v13;

  -[PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper _snapshotForZoomLevel:](self, "_snapshotForZoomLevel:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper _snapshotForZoomLevel:](self, "_snapshotForZoomLevel:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 && v16)
  {
    objc_msgSend(v16, "visibleRect");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __119__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper_animation_prepareWithRootLayout_viewportShift___block_invoke;
    aBlock[3] = &unk_1E512E988;
    v60 = v17;
    v61 = v19;
    v62 = v21;
    v63 = v23;
    v64 = v25;
    v27 = _Block_copy(aBlock);
    objc_msgSend(v15, "dominantAssetIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*((uint64_t (**)(void *, void *))v27 + 2))(v27, v28) & 1) == 0)
    {
      objc_msgSend(v15, "visibleRect");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v53 = 0;
      v54 = &v53;
      v55 = 0x3032000000;
      v56 = __Block_byref_object_copy__153383;
      v57 = __Block_byref_object_dispose__153384;
      v58 = 0;
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      v52[3] = 0;
      v43[0] = v26;
      v43[1] = 3221225472;
      v43[2] = __119__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper_animation_prepareWithRootLayout_viewportShift___block_invoke_2;
      v43[3] = &unk_1E512E9B0;
      v45 = v27;
      v37 = v15;
      v48 = v30;
      v49 = v32;
      v50 = v34;
      v51 = v36;
      v44 = v37;
      v46 = v52;
      v47 = &v53;
      objc_msgSend(v37, "enumerateAssetIdentifiersUsingBlock:", v43);
      if (v54[5])
        objc_msgSend(v37, "setDominantAssetIdentifier:");

      _Block_object_dispose(v52, 8);
      _Block_object_dispose(&v53, 8);

    }
  }

}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  -[PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper _adjustGeometries:styles:infos:spriteIndexRange:appearing:](self, "_adjustGeometries:styles:infos:spriteIndexRange:appearing:", a4, a5, a6, a7, 1);
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  -[PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper _adjustGeometries:styles:infos:spriteIndexRange:appearing:](self, "_adjustGeometries:styles:infos:spriteIndexRange:appearing:", a4, a5, a6, a7, 0);
}

- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t length;
  int64_t v13;
  BOOL v14;
  _PXCuratedLibraryLayoutAssetsSnapshot *v15;
  void *v16;
  uint64_t v17;
  _PXCuratedLibraryLayoutAssetsSnapshot *v18;
  _PXCuratedLibraryLayoutAssetsSnapshot *v19;
  id v20;
  _PXCuratedLibraryLayoutAssetsSnapshot *v21;
  _PXCuratedLibraryLayoutAssetsSnapshot *v22;
  _PXCuratedLibraryLayoutAssetsSnapshot *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  _PXCuratedLibraryLayoutAssetsSnapshot *v26;
  _PXCuratedLibraryLayoutAssetsSnapshot *v27;
  id v28;
  id v29;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v30;
  $225AF24142A77900D29617A74D173C5F *v31;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  BOOL v37;
  _QWORD v38[4];
  _PXCuratedLibraryLayoutAssetsSnapshot *v39;
  _PXCuratedLibraryLayoutAssetsSnapshot *v40;
  id v41;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v42;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v43;
  $225AF24142A77900D29617A74D173C5F *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  BOOL v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v7 = a7;
  length = a6.length;
  v13 = -[_PXCuratedLibraryLayoutAssetsSnapshot zoomLevel](self->_toSnapshot, "zoomLevel");
  v14 = v13 == 4;
  if (v13 != 4)
  {
    v21 = self->_fromSnapshot;
    v22 = self->_toSnapshot;
    v15 = v22;
    if (!v7)
      goto LABEL_6;
LABEL_4:
    v53 = 0;
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke((uint64_t)&v50, v15, 1);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, length);
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_4;
    v25[3] = &unk_1E512EA40;
    v30 = a3;
    v31 = a4;
    v18 = v15;
    v26 = v18;
    v19 = v21;
    v33 = v50;
    v37 = v7;
    v32 = a5;
    v28 = v16;
    v29 = &__block_literal_global_15_153369;
    v34 = v51;
    v35 = v52;
    v36 = v53;
    v23 = v19;
    v27 = v19;
    v20 = v16;
    -[_PXCuratedLibraryLayoutAssetsSnapshot enumerateAssetInfoForGeometries:styles:infos:count:options:usingBlock:](v18, "enumerateAssetInfoForGeometries:styles:infos:count:options:usingBlock:", a3, a4, a5, length, 5, v25);
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_5;
    v24[3] = &__block_descriptor_40_e12_v24__0Q8_B16l;
    v24[4] = a4;
    objc_msgSend(v20, "enumerateIndexesUsingBlock:", v24);

    goto LABEL_9;
  }
  v21 = self->_toSnapshot;
  v15 = self->_fromSnapshot;
  if (!v7)
    goto LABEL_4;
LABEL_6:
  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke((uint64_t)&v50, v21, 0);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_3;
  v38[3] = &unk_1E512EA18;
  v42 = a3;
  v43 = a5;
  v18 = v15;
  v39 = v18;
  v40 = v21;
  v41 = &__block_literal_global_15_153369;
  v49 = v14;
  v44 = a4;
  v45 = v50;
  v46 = v51;
  v47 = v52;
  v48 = v53;
  v23 = v40;
  -[_PXCuratedLibraryLayoutAssetsSnapshot enumerateAssetInfoForGeometries:styles:infos:count:options:usingBlock:](v40, "enumerateAssetInfoForGeometries:styles:infos:count:options:usingBlock:", a3, a4, a5, length, 1, v38);
  if ((_DWORD)length)
  {
    do
    {
      a4->var0 = 0.0;
      a4 = ($225AF24142A77900D29617A74D173C5F *)((char *)a4 + 160);
      --length;
    }
    while (length);
  }

LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toSnapshot, 0);
  objc_storeStrong((id *)&self->_fromSnapshot, 0);
}

__n128 __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke(uint64_t a1, void *a2, int a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __n128 result;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v19;
  CGAffineTransform v20;

  objc_msgSend(a2, "visibleRect");
  PXRectGetCenter();
  v6 = v5;
  v8 = v7;
  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeTranslation(&v20, -v5, -v7);
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionToOrFromAllPhotosScale");
  v11 = v10;

  v12 = 1.0 / v11;
  if (a3)
  {
    v13 = 0.0;
  }
  else
  {
    v12 = v11;
    v13 = 9.0;
  }
  CGAffineTransformMakeScale(&t2, v12, v12);
  t1 = v20;
  CGAffineTransformConcat(&v19, &t1, &t2);
  v20 = v19;
  CGAffineTransformMakeTranslation(&v16, v6, v8);
  t1 = v20;
  CGAffineTransformConcat(&v19, &t1, &v16);
  v15 = *(_OWORD *)&v19.c;
  result = *(__n128 *)&v19.tx;
  *(_OWORD *)a1 = *(_OWORD *)&v19.a;
  *(_OWORD *)(a1 + 16) = v15;
  *(__n128 *)(a1 + 32) = result;
  *(double *)(a1 + 48) = v13;
  return result;
}

void __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_3(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  uint64_t v6;
  double *v7;
  int v8;
  void *v9;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = (double *)(v6 + 32 * a3);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + 40 * a3 + 1);
  if (v8 == 8)
  {
    v9 = *(void **)(a1 + 32);
    if (v9)
LABEL_3:
      objc_msgSend(v9, "spriteSnapshotForAssetWithIdentifier:", v5);
  }
  else if (v8 == 2 && *(_BYTE *)(a1 + 136) != 0)
  {
    v9 = *(void **)(a1 + 32);
    if (v9)
      goto LABEL_3;
  }
  v11 = *(double *)(a1 + 80);
  v12 = *(double *)(a1 + 88);
  v13 = *(double *)(a1 + 96);
  v14 = *(double *)(a1 + 104);
  v15 = v6 + 32 * a3;
  v16 = COERCE_FLOAT(HIDWORD(*(_QWORD *)(v15 + 24)));
  *(float *)&v17 = v13 * v16 + v11 * COERCE_FLOAT(*(_QWORD *)(v15 + 24));
  *(float *)&v16 = v14 * v16 + v12 * *(float *)&v17;
  HIDWORD(v17) = LODWORD(v16);
  v18 = *(double *)(a1 + 112);
  v19 = *(double *)(a1 + 120);
  *(_QWORD *)(v15 + 24) = v17;
  v20 = v7[1];
  v21 = v18 + v13 * v20 + v11 * *v7;
  *v7 = v21;
  v7[1] = v19 + v14 * v20 + v12 * v21;
  *(float *)&v21 = *(double *)(a1 + 128);
  v7[2] = v7[2] + *(float *)&v21;

}

void __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_4(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  CGFloat MidX;
  CGFloat MidY;
  __int128 v26;
  CGFloat Height;
  float64x2_t v28;
  __int128 v29;
  __int128 v30;
  float v31;
  CGRect v32;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72) + 160 * a3;
  v9 = v7 + 32 * v6;
  v32.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v32.size = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(v9 + 8);
  v31 = v10;
  v11 = *(_DWORD *)v8;
  v30 = *(_OWORD *)(v8 + 4);
  if (v5)
  {
    v12 = *(void **)(a1 + 32);
    if (v12)
      objc_msgSend(v12, "spriteSnapshotForAssetWithIdentifier:", v5);
  }
  if (CGRectIsNull(v32))
  {
    v13 = *(double *)(a1 + 88);
    v14 = *(double *)(a1 + 96);
    v15 = *(double *)(a1 + 104);
    v16 = *(double *)(a1 + 112);
    v17 = *(double *)(a1 + 120);
    v18 = *(double *)(a1 + 128);
    v19 = v7 + 32 * v6;
    v20 = COERCE_FLOAT(HIDWORD(*(_QWORD *)(v19 + 24)));
    *(float *)&v21 = v15 * v20 + v13 * COERCE_FLOAT(*(_QWORD *)(v19 + 24));
    *(float *)&v20 = v16 * v20 + v14 * *(float *)&v21;
    HIDWORD(v21) = LODWORD(v20);
    *(_QWORD *)(v19 + 24) = v21;
    v22 = *(double *)(v9 + 8);
    v23 = v17 + v15 * v22 + v13 * *(double *)v9;
    *(double *)v9 = v23;
    *(double *)(v9 + 8) = v18 + v16 * v22 + v14 * v23;
    *(float *)&v23 = *(double *)(a1 + 136);
    *(double *)(v9 + 16) = *(double *)(v9 + 16) + *(float *)&v23;
    *(_DWORD *)v8 = 0;
  }
  else
  {
    MidX = CGRectGetMidX(v32);
    MidY = CGRectGetMidY(v32);
    *(double *)&v26 = CGRectGetWidth(v32);
    v29 = v26;
    Height = CGRectGetHeight(v32);
    *(_QWORD *)&v28.f64[0] = v29;
    v28.f64[1] = Height;
    *(CGFloat *)v9 = MidX;
    *(CGFloat *)(v9 + 8) = MidY;
    *(double *)(v9 + 16) = v31;
    *(float32x2_t *)(v9 + 24) = vcvt_f32_f64(v28);
    *(_DWORD *)v8 = v11;
    *(_OWORD *)(v8 + 4) = v30;
    PXGSpriteStyleUnionClippingRect();
  }
  objc_msgSend(*(id *)(a1 + 48), "removeIndex:", v6, v29);

}

uint64_t __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_5(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 160 * a2) = 0;
  return result;
}

float __131__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, float *a6)
{
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat height;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float result;
  CGFloat y;
  CGFloat v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  PXRectWithCenterAndSize();
  width = v25.size.width;
  v12 = *(double *)a3;
  v13 = *(double *)(a3 + 8);
  v15 = *(double *)(a3 + 16);
  v14 = *(double *)(a3 + 24);
  y = v25.origin.y;
  x = v25.origin.x;
  v24 = v25.origin.x;
  height = v25.size.height;
  CGRectGetMinX(v25);
  v26.origin.x = v12;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v14;
  CGRectGetMinX(v26);
  PXFloatEqualToFloatWithTolerance();
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  CGRectGetMaxX(v27);
  v28.origin.x = v12;
  v28.origin.y = v13;
  v28.size.width = v15;
  v28.size.height = v14;
  CGRectGetMaxX(v28);
  PXFloatEqualToFloatWithTolerance();
  v29.origin.x = v24;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGRectGetMinY(v29);
  v30.origin.x = v12;
  v30.origin.y = v13;
  v30.size.width = v15;
  v30.size.height = v14;
  CGRectGetMinY(v30);
  PXFloatEqualToFloatWithTolerance();
  v31.origin.x = v24;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  CGRectGetMaxY(v31);
  v32.origin.x = v12;
  v32.origin.y = v13;
  v32.size.width = v15;
  v32.size.height = v14;
  CGRectGetMaxY(v32);
  PXFloatEqualToFloatWithTolerance();
  PXGResizeRect();
  *a5 = v18;
  a5[1] = v19;
  a5[2] = v20;
  a5[3] = v21;
  result = *(double *)(a2 + 16) + *(float *)(a4 + 32) - *(float *)(a3 + 32);
  *a6 = result;
  return result;
}

BOOL __119__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper_animation_prepareWithRootLayout_viewportShift___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  CGRect v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "spriteSnapshotForAssetWithIdentifier:", v3);
    v6 = 0;
    v5 = 0;
    v8 = 0;
    v7 = 0;
  }
  else
  {
    v8 = 0;
    v7 = 0;
    v6 = 0;
    v5 = 0;
  }
  if (CGRectIsNull(*(CGRect *)&v5))
  {
    v9 = 0;
  }
  else
  {
    v11.origin = 0u;
    v11.size = 0u;
    v9 = CGRectIntersectsRect(v11, *(CGRect *)(a1 + 40));
  }

  return v9;
}

void __119__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper_animation_prepareWithRootLayout_viewportShift___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  CGRect v12;

  v4 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "spriteSnapshotForAssetWithIdentifier:", v4);
      v7 = 0;
      v6 = 0;
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v9 = 0;
      v8 = 0;
      v7 = 0;
      v6 = 0;
    }
    v12 = CGRectIntersection(*(CGRect *)&v6, *(CGRect *)(a1 + 64));
    if (!CGRectIsEmpty(v12))
    {
      PXSizeGetArea();
      v11 = v10;
      if (v10 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
      }
    }
  }

}

void __95__PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper__snapshotForZoomLevel___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a2;
  if (v4)
  {
    v6 = v4;
    v5 = objc_msgSend(v4, "zoomLevel") == *(_QWORD *)(a1 + 40);
    v4 = v6;
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v4 = v6;
    }
  }

}

@end

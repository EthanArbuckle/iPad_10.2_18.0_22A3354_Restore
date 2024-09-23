@implementation PVEffectFrame

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_hitAreaPath);
  CGPathRelease(self->_expandedHitAreaPath);
  v3.receiver = self;
  v3.super_class = (Class)PVEffectFrame;
  -[PVEffectFrame dealloc](&v3, sel_dealloc);
}

+ (id)frameWithEffect:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeTextFrames:(BOOL)a7 minimumHitSize:(double)a8 hitSizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  uint64_t v11;
  double height;
  double width;
  _BOOL8 v16;
  _BOOL8 v17;
  _BOOL8 v18;
  id v21;
  id v22;
  void *v23;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25;

  v11 = *(_QWORD *)&a11;
  height = a10.height;
  width = a10.width;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v21 = a3;
  v22 = objc_alloc((Class)a1);
  v25 = *a4;
  v23 = (void *)objc_msgSend(v22, "initWithEffect:atTime:forcePosterFrame:includeDropShadow:includeTextFrames:minimumHitSize:hitSizeThreshold:viewSize:viewOrigin:", v21, &v25, v18, v17, v16, v11, a8, a9, width, height);

  return v23;
}

- (PVEffectFrame)initWithEffect:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeTextFrames:(BOOL)a7 minimumHitSize:(double)a8 hitSizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  uint64_t v11;
  _BOOL4 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  id v19;
  char *v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  float64x2_t v34;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  float64x2_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  double width;
  double height;
  _QWORD var18[4];
  id vars8;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  objc_super v90;
  float64x2_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;

  v11 = *(_QWORD *)&a11;
  width = a10.width;
  height = a10.height;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v19 = a3;
  v90.receiver = self;
  v90.super_class = (Class)PVEffectFrame;
  v20 = -[PVEffectFrame init](&v90, sel_init);
  v21 = v20;
  if (v20)
  {
    v22 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v20 + 17) = a4->var3;
    *(_OWORD *)(v20 + 120) = v22;
    v20[8] = v16;
    *((_DWORD *)v20 + 3) = objc_msgSend(v19, "origin");
    objc_msgSend(v19, "outputSize");
    *((_QWORD *)v21 + 9) = v23;
    *((_QWORD *)v21 + 10) = v24;
    *((_DWORD *)v21 + 4) = v11;
    v25 = height;
    *((double *)v21 + 11) = width;
    *((double *)v21 + 12) = height;
    if (v19)
    {
      v79 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&v80 = a4->var3;
      objc_msgSend(v19, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v79, v16, v15, v11, 1.0, 1.0);
      v25 = height;
    }
    else
    {
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
    }
    v26 = v94;
    *((_OWORD *)v21 + 13) = v93;
    *((_OWORD *)v21 + 14) = v26;
    v27 = v96;
    *((_OWORD *)v21 + 15) = v95;
    *((_OWORD *)v21 + 16) = v27;
    v87 = 0;
    v88 = 0;
    v89 = 0u;
    v93 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v94 = a4->var3;
    objc_msgSend(v19, "convertPointToView:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", &v87, &v93, v16, 1, 1, v11, width, v25);
    *((_QWORD *)v21 + 13) = v28;
    *((_QWORD *)v21 + 14) = v29;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v93 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v94 = a4->var3;
    objc_msgSend(v19, "transformAtTime:forcePosterFrame:viewSize:viewOrigin:", &v93, v16, v11, width, height);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "SIMDDouble4x4");
    }
    else
    {
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
    }

    +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "wantsToIncludeCoordinateSystemTranslationInEffectViewTransform");
    if ((_DWORD)v11 == 1 && (v33 & 1) == 0)
    {
      v34.f64[0] = width;
      v34.f64[1] = height;
      __asm { FMOV            V1.2D, #0.5 }
      v97 = v83;
      *(_OWORD *)&STACK[0x520] = v84;
      v40 = v86;
      *(_OWORD *)&STACK[0x530] = v85;
      *(_OWORD *)&STACK[0x540] = v40;
      v93 = v79;
      v94 = v80;
      v95 = v81;
      v96 = v82;
      v91 = vmulq_f64(v34, _Q1);
      v92 = 0u;
      pv_simd_matrix_translate(&v93, &v91, &v71);
      v83 = v75;
      v84 = v76;
      v85 = v77;
      v86 = v78;
      v79 = v71;
      v80 = v72;
      v81 = v73;
      v82 = v74;
    }
    v41 = v83;
    v42 = v84;
    *((_OWORD *)v21 + 21) = v83;
    *((_OWORD *)v21 + 22) = v42;
    v43 = v85;
    v44 = v86;
    *((_OWORD *)v21 + 23) = v85;
    *((_OWORD *)v21 + 24) = v44;
    v45 = v79;
    v46 = v80;
    *((_OWORD *)v21 + 17) = v79;
    *((_OWORD *)v21 + 18) = v46;
    v47 = v81;
    v48 = v82;
    *((_OWORD *)v21 + 19) = v81;
    *((_OWORD *)v21 + 20) = v48;
    v49.f64[0] = width;
    v49.f64[1] = height;
    v97 = v41;
    *(_OWORD *)&STACK[0x520] = v42;
    *(_OWORD *)&STACK[0x530] = v43;
    *(_OWORD *)&STACK[0x540] = v44;
    v93 = v45;
    v94 = v46;
    v95 = v47;
    v96 = v48;
    objc_msgSend(v19, "outputROI", pv_transform_info_make((uint64_t)&v93, (float64x2_t *)v21 + 25, v49));
    *((_QWORD *)v21 + 18) = v50;
    *((_QWORD *)v21 + 19) = v51;
    *((_QWORD *)v21 + 20) = v52;
    *((_QWORD *)v21 + 21) = v53;
    v93 = 0u;
    v94 = 0u;
    v71 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v72 = a4->var3;
    if (objc_msgSend(v19, "bounds:atTime:forcePosterFrame:includeDropShadow:includeMasks:", &v93, &v71, v16, v15, 1))
    {
      v54 = v94;
      *((_OWORD *)v21 + 11) = v93;
      *((_OWORD *)v21 + 12) = v54;
    }
    *((double *)v21 + 6) = a8;
    *((double *)v21 + 7) = a9;
    v71 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v72 = a4->var3;
    objc_msgSend(v19, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v71, v16, v15, v11, 1.0, 1.0, width, height);
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)*((_QWORD *)v21 + 3);
    *((_QWORD *)v21 + 3) = v55;

    v71 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v72 = a4->var3;
    *((_QWORD *)v21 + 4) = objc_msgSend(v19, "createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:", &v71, v16, 1, v11, v21 + 40, 1.0, 1.0, a8, a9, width, height);
    if (v14)
    {
      v71 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&v72 = a4->var3;
      objc_msgSend(v19, "textTransformsAtTime:forcePosterFrame:viewSize:viewOrigin:", &v71, v16, v11, width, height);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&v72 = a4->var3;
      objc_msgSend(v19, "textEditingBoundsAtTime:forcePosterFrame:useParagraphBounds:includeDropShadow:includeMasks:", &v71, v16, 1, 0, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v57, "count"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      var18[0] = MEMORY[0x1E0C809B0];
      var18[1] = 3221225472;
      var18[2] = __144__PVEffectFrame_initWithEffect_atTime_forcePosterFrame_includeDropShadow_includeTextFrames_minimumHitSize_hitSizeThreshold_viewSize_viewOrigin___block_invoke;
      var18[3] = &unk_1E64D6128;
      vars8 = v19;
      v69 = v32;
      v70 = v59;
      v60 = v58;
      v61 = v57;
      objc_msgSend(v61, "enumerateObjectsUsingBlock:", var18);
      v62 = (void *)*((_QWORD *)v21 + 8);
      *((_QWORD *)v21 + 8) = v70;
      v63 = v70;

    }
  }

  return (PVEffectFrame *)v21;
}

void __144__PVEffectFrame_initWithEffect_atTime_forcePosterFrame_includeDropShadow_includeTextFrames_minimumHitSize_hitSizeThreshold_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14, __int128 a15, __int128 a16, __int128 a17, __int128 a18, __int128 a19, __int128 a20,__int128 a21,__int128 a22,__int128 a23,__int128 a24,__int128 a25,__int128 a26,__int128 a27,__int128 a28,__int128 a29,__int128 a30,__int128 a31,__int128 a32,__int128 a33,__int128 a34,__int128 a35,__int128 a36,__int128 a37,__int128 a38,__int128 a39,__int128 a40)
{
  PVEffectFrame *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  PVEffectFrame *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  void *v60;
  float64x2_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  float64x2_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  void *v76;
  void *v77;
  PVCGPointQuad var30;

  v42 = [PVEffectFrame alloc];
  v43 = *(_QWORD *)(a1 + 32);
  v44 = *(unsigned __int8 *)(a1 + 132);
  v45 = *(unsigned __int8 *)(a1 + 133);
  v46 = *(double *)(a1 + 72);
  v47 = *(double *)(a1 + 80);
  v48 = *(unsigned int *)(a1 + 128);
  *(_OWORD *)&STACK[0x640] = *(_OWORD *)(a1 + 104);
  STACK[0x650] = *(_QWORD *)(a1 + 120);
  v49 = -[PVEffectFrame initWithEffect:atTime:forcePosterFrame:includeDropShadow:includeTextFrames:minimumHitSize:hitSizeThreshold:viewSize:viewOrigin:](v42, "initWithEffect:atTime:forcePosterFrame:includeDropShadow:includeTextFrames:minimumHitSize:hitSizeThreshold:viewSize:viewOrigin:", v43, &STACK[0x640], v44, v45, 0, v48, v46, v47, *(double *)(a1 + 88), *(double *)(a1 + 96));
  *(_OWORD *)&STACK[0x600] = 0u;
  *(_OWORD *)&STACK[0x610] = 0u;
  *(_OWORD *)&STACK[0x5E0] = 0u;
  *(_OWORD *)&STACK[0x5F0] = 0u;
  v50 = *(void **)(a1 + 32);
  if (v50)
  {
    v51 = *(unsigned __int8 *)(a1 + 133);
    v52 = *(unsigned __int8 *)(a1 + 132);
    v53 = *(unsigned int *)(a1 + 128);
    *(_OWORD *)&STACK[0x640] = *(_OWORD *)(a1 + 104);
    STACK[0x650] = *(_QWORD *)(a1 + 120);
    objc_msgSend(v50, "textCornersAtTime:index:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &STACK[0x640], a3, v52, v51, v53, 1.0, 1.0, *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  if (*(_DWORD *)(a1 + 128) == 1)
  {
    v54 = *(_OWORD *)&STACK[0x600];
    v56 = *(_OWORD *)&STACK[0x5E0];
    v55 = *(_OWORD *)&STACK[0x5F0];
    *(_OWORD *)&STACK[0x5E0] = *(_OWORD *)&STACK[0x610];
    *(_OWORD *)&STACK[0x5F0] = v54;
    *(_OWORD *)&STACK[0x600] = v55;
    *(_OWORD *)&STACK[0x610] = v56;
  }
  v57 = *(_OWORD *)&STACK[0x5F0];
  *(_OWORD *)&STACK[0x5A0] = *(_OWORD *)&STACK[0x5E0];
  *(_OWORD *)&STACK[0x5B0] = v57;
  v58 = *(_OWORD *)&STACK[0x610];
  *(_OWORD *)&STACK[0x5C0] = *(_OWORD *)&STACK[0x600];
  *(_OWORD *)&STACK[0x5D0] = v58;
  -[PVEffectFrame setCornerPoints:](v49, "setCornerPoints:", &STACK[0x5A0]);
  a39 = 0u;
  a40 = 0u;
  a37 = 0u;
  a38 = 0u;
  a35 = 0u;
  a36 = 0u;
  a33 = 0u;
  a34 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v59)
  {
    objc_msgSend(v59, "SIMDDouble4x4");
  }
  else
  {
    a39 = 0u;
    a40 = 0u;
    a37 = 0u;
    a38 = 0u;
    a35 = 0u;
    a36 = 0u;
    a33 = 0u;
    a34 = 0u;
  }

  if ((objc_msgSend(*(id *)(a1 + 48), "wantsToIncludeCoordinateSystemTranslationInEffectViewTransform") & 1) == 0
    && *(_DWORD *)(a1 + 128) == 1)
  {
    __asm { FMOV            V1.2D, #0.5 }
    v66 = vmulq_f64(*(float64x2_t *)(a1 + 88), _Q1);
    v67 = a38;
    *(_OWORD *)&STACK[0x680] = a37;
    *(_OWORD *)&STACK[0x690] = v67;
    v68 = a40;
    *(_OWORD *)&STACK[0x6A0] = a39;
    *(_OWORD *)&STACK[0x6B0] = v68;
    v69 = a34;
    *(_OWORD *)&STACK[0x640] = a33;
    *(_OWORD *)&STACK[0x650] = v69;
    v70 = a36;
    *(_OWORD *)&STACK[0x660] = a35;
    *(_OWORD *)&STACK[0x670] = v70;
    *(float64x2_t *)&STACK[0x620] = v66;
    *(_OWORD *)&STACK[0x630] = 0u;
    pv_simd_matrix_translate((__int128 *)&STACK[0x640], (float64x2_t *)&STACK[0x620], &a25);
    a37 = a29;
    a38 = a30;
    a39 = a31;
    a40 = a32;
    a33 = a25;
    a34 = a26;
    a35 = a27;
    a36 = a28;
  }
  a21 = a37;
  a22 = a38;
  a23 = a39;
  a24 = a40;
  a17 = a33;
  a18 = a34;
  a19 = a35;
  a20 = a36;
  -[PVEffectFrame setTransform:](v49, "setTransform:", &a17);
  *(_OWORD *)&STACK[0x680] = xmmword_1B304F040;
  *(_OWORD *)&STACK[0x690] = xmmword_1B304F050;
  *(_OWORD *)&STACK[0x6A0] = xmmword_1B304F060;
  *(_OWORD *)&STACK[0x6B0] = *(_OWORD *)&qword_1B304F070;
  *(_OWORD *)&STACK[0x640] = pv_transform_info_identity;
  *(_OWORD *)&STACK[0x650] = *(_OWORD *)algn_1B304F010;
  *(_OWORD *)&STACK[0x660] = xmmword_1B304F020;
  *(_OWORD *)&STACK[0x670] = *(_OWORD *)&qword_1B304F030;
  v71 = *(float64x2_t *)(a1 + 88);
  a29 = a37;
  a30 = a38;
  a31 = a39;
  a32 = a40;
  a25 = a33;
  a26 = a34;
  a27 = a35;
  a28 = a36;
  pv_transform_info_make((uint64_t)&a25, (float64x2_t *)&STACK[0x640], v71);
  v72 = *(_OWORD *)&STACK[0x690];
  a13 = *(_OWORD *)&STACK[0x680];
  a14 = v72;
  v73 = *(_OWORD *)&STACK[0x6B0];
  a15 = *(_OWORD *)&STACK[0x6A0];
  a16 = v73;
  v74 = *(_OWORD *)&STACK[0x650];
  a9 = *(_OWORD *)&STACK[0x640];
  a10 = v74;
  v75 = *(_OWORD *)&STACK[0x670];
  a11 = *(_OWORD *)&STACK[0x660];
  a12 = v75;
  -[PVEffectFrame setTransformInfo:](v49, "setTransformInfo:", &a9);
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "CGRectValue");
  -[PVEffectFrame setObjectBounds:](v49, "setObjectBounds:");

  if (v49)
    -[PVEffectFrame cornerPoints](v49, "cornerPoints");
  else
    memset(&var30, 0, sizeof(var30));
  PVCGPointQuad_to_NSArray(&var30);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame setHitAreaPoints:](v49, "setHitAreaPoints:", v77);

  objc_msgSend(*(id *)(a1 + 64), "addObject:", v49);
}

- (CGRect)viewSpaceObjectBounds
{
  _QWORD *v3;
  uint64_t v4;
  CGFloat point_at_index;
  CGPoint v6;
  CGPoint v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PVCGPointQuad v20;
  _QWORD v21[2];
  CGFloat *(*v22)(uint64_t, int, float64x2_t, float64_t);
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
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
  __int128 v48;
  CGPoint v49;
  CGPoint v50;
  CGPoint v51;
  CGPoint v52;
  PVCGPointQuad v53;
  CGRect v54;
  CGRect result;

  v51 = (CGPoint)0;
  v52 = (CGPoint)0;
  v49 = (CGPoint)0;
  v50 = (CGPoint)0;
  -[PVEffectFrame objectBounds](self, "objectBounds");
  PVCGPointQuad_from_CGRect(v54, &v49);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[PVEffectFrame transform](self, "transform");
  v33 = 0;
  v34 = &v33;
  v35 = 0x6010000000;
  v36 = &unk_1B3948866;
  v37 = *(_OWORD *)PVCGPointQuadZero;
  v38 = *(_OWORD *)&PVCGPointQuadZero[16];
  v39 = *(_OWORD *)&PVCGPointQuadZero[32];
  v40 = *(_OWORD *)&PVCGPointQuadZero[48];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __38__PVEffectFrame_viewSpaceObjectBounds__block_invoke;
  v23 = &unk_1E64D6150;
  v26 = v43;
  v27 = v44;
  v24 = v41;
  v25 = v42;
  v30 = v47;
  v31 = v48;
  v28 = v45;
  v29 = v46;
  v32 = &v33;
  v20.a = v49;
  v20.b = v50;
  v20.c = v51;
  v20.d = v52;
  v3 = v21;
  v4 = 0;
  do
  {
    v53 = v20;
    point_at_index = PVCGPointQuad_get_point_at_index(&v53, v4);
    ((void (*)(_QWORD *, uint64_t, double))v22)(v3, v4, point_at_index);
    v4 = (v4 + 1);
  }
  while ((_DWORD)v4 != 4);

  v6 = (CGPoint)*((_OWORD *)v34 + 3);
  v53.a = (CGPoint)*((_OWORD *)v34 + 2);
  v53.b = v6;
  v7 = (CGPoint)*((_OWORD *)v34 + 5);
  v53.c = (CGPoint)*((_OWORD *)v34 + 4);
  v53.d = v7;
  pv_bounding_CGRect(&v53);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  _Block_object_dispose(&v33, 8);
  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

CGFloat *__38__PVEffectFrame_viewSpaceObjectBounds__block_invoke(uint64_t a1, int a2, float64x2_t a3, float64_t a4)
{
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v11[2];
  float64x2_t v12[8];
  float64x2_t v13[2];

  a3.f64[1] = a4;
  v6 = *(float64x2_t *)(a1 + 112);
  v12[4] = *(float64x2_t *)(a1 + 96);
  v12[5] = v6;
  v7 = *(float64x2_t *)(a1 + 144);
  v12[6] = *(float64x2_t *)(a1 + 128);
  v12[7] = v7;
  v8 = *(float64x2_t *)(a1 + 48);
  v12[0] = *(float64x2_t *)(a1 + 32);
  v12[1] = v8;
  v9 = *(float64x2_t *)(a1 + 80);
  v12[2] = *(float64x2_t *)(a1 + 64);
  v12[3] = v9;
  v11[0] = a3;
  v11[1] = 0u;
  pv_simd_matrix_transform_vector(v12, v11, v13);
  return PVCGPointQuad_set_point_at_index((CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 32), (CGPoint)v13[0], a2);
}

- (CGPoint)midpoint
{
  double quad_center;
  double v3;
  PVCGPointQuad v4;
  CGPoint result;

  -[PVEffectFrame cornerPoints](self, "cornerPoints");
  quad_center = pv_CGPoint_get_quad_center(&v4);
  result.y = v3;
  result.x = quad_center;
  return result;
}

- (void)setHitAreaPath:(CGPath *)a3
{
  CGPathRetain(a3);
  CGPathRelease(self->_hitAreaPath);
  self->_hitAreaPath = a3;
}

- (void)setExpandedHitAreaPath:(CGPath *)a3
{
  CGPathRetain(a3);
  CGPathRelease(self->_expandedHitAreaPath);
  self->_expandedHitAreaPath = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  id v25;
  id v26;
  _BYTE v27[128];
  CGPoint v28;
  CMTime time;
  objc_super v30;
  CGSize v31;
  CGPoint v32;
  CGSize v33;
  CGRect v34;

  v25 = (id)MEMORY[0x1E0CB3940];
  v30.receiver = self;
  v30.super_class = (Class)PVEffectFrame;
  -[PVEffectFrame description](&v30, sel_description);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame time](self, "time");
  v23 = (__CFString *)CMTimeCopyDescription(0, &time);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PVEffectFrame forcePosterFrame](self, "forcePosterFrame"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[PVEffectFrame effectOrigin](self, "effectOrigin");
  if (v5 >= 3)
    v6 = 0;
  else
    v6 = v5;
  objc_msgSend(v4, "stringWithUTF8String:", PVCoordinateSystemOriginNames[v6]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame effectSize](self, "effectSize");
  NSStringFromCGSize(v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame center](self, "center");
  NSStringFromCGPoint(v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = -[PVEffectFrame viewOrigin](self, "viewOrigin");
  if (v9 >= 3)
    v10 = 0;
  else
    v10 = v9;
  objc_msgSend(v8, "stringWithUTF8String:", PVCoordinateSystemOriginNames[v10]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame viewSize](self, "viewSize");
  NSStringFromCGSize(v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame cornerPoints](self, "cornerPoints");
  NSStringFromPVCGPointQuad(&v28, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame objectBounds](self, "objectBounds");
  NSStringFromCGRect(v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame hitAreaPoints](self, "hitAreaPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffectFrame transform](self, "transform");
  NSStringFromSIMDDouble4x4((uint64_t)v27, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[PVEffectFrame textFrames](self, "textFrames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@\ntime: %@\nforcePosterFrame: %@\neffectOrigin: %@\neffectSize: %@\n\ncenter: %@\n\nviewOrigin: %@\nviewSize: %@\n\ncornerPoints:\n%@\n\nobjectBounds: %@\n\nhitAreaPoints: %@\n\ntransform:\n%@\n\ntextFrames (count): %@"), v24, v23, v3, v22, v21, v7, v20, v19, v11, v12, v13, v14, v17);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  return v26;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (BOOL)forcePosterFrame
{
  return self->_forcePosterFrame;
}

- (void)setForcePosterFrame:(BOOL)a3
{
  self->_forcePosterFrame = a3;
}

- (int)effectOrigin
{
  return self->_effectOrigin;
}

- (void)setEffectOrigin:(int)a3
{
  self->_effectOrigin = a3;
}

- (CGSize)effectSize
{
  double width;
  double height;
  CGSize result;

  width = self->_effectSize.width;
  height = self->_effectSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEffectSize:(CGSize)a3
{
  self->_effectSize = a3;
}

- (int)viewOrigin
{
  return self->_viewOrigin;
}

- (void)setViewOrigin:(int)a3
{
  self->_viewOrigin = a3;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (PVCGPointQuad)cornerPoints
{
  CGPoint c;
  CGPoint a;

  c = self[3].c;
  retstr->a = self[3].b;
  retstr->b = c;
  a = self[4].a;
  retstr->c = self[3].d;
  retstr->d = a;
  return self;
}

- (void)setCornerPoints:(PVCGPointQuad *)a3
{
  CGPoint a;
  CGPoint b;
  CGPoint d;

  a = a3->a;
  b = a3->b;
  d = a3->d;
  self->_cornerPoints.c = a3->c;
  self->_cornerPoints.d = d;
  self->_cornerPoints.a = a;
  self->_cornerPoints.b = b;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGRect)outputROI
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_outputROI.origin.x;
  y = self->_outputROI.origin.y;
  width = self->_outputROI.size.width;
  height = self->_outputROI.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOutputROI:(CGRect)a3
{
  self->_outputROI = a3;
}

- (CGRect)objectBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_objectBounds.origin.x;
  y = self->_objectBounds.origin.y;
  width = self->_objectBounds.size.width;
  height = self->_objectBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setObjectBounds:(CGRect)a3
{
  self->_objectBounds = a3;
}

- (NSArray)hitAreaPoints
{
  return self->_hitAreaPoints;
}

- (void)setHitAreaPoints:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaPoints, a3);
}

- (CGPath)hitAreaPath
{
  return self->_hitAreaPath;
}

- (CGPath)expandedHitAreaPath
{
  return self->_expandedHitAreaPath;
}

- (double)minimumHitSize
{
  return self->_minimumHitSize;
}

- (void)setMinimumHitSize:(double)a3
{
  self->_minimumHitSize = a3;
}

- (double)hitSizeThreshold
{
  return self->_hitSizeThreshold;
}

- (void)setHitSizeThreshold:(double)a3
{
  self->_hitSizeThreshold = a3;
}

- (__n128)transform
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 352);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 336);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 384);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 368);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 304);
  v6 = *(_OWORD *)(a1 + 320);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransform:(__int128 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[3];
  *(_OWORD *)(a1 + 304) = a3[2];
  *(_OWORD *)(a1 + 320) = v5;
  *(_OWORD *)(a1 + 272) = v3;
  *(_OWORD *)(a1 + 288) = v4;
  result = (__n128)a3[4];
  v7 = a3[5];
  v8 = a3[7];
  *(_OWORD *)(a1 + 368) = a3[6];
  *(_OWORD *)(a1 + 384) = v8;
  *(__n128 *)(a1 + 336) = result;
  *(_OWORD *)(a1 + 352) = v7;
  return result;
}

- (__n128)transformInfo
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 464);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 512);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 416);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 400);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 432);
  v6 = *(_OWORD *)(a1 + 448);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransformInfo:(__int128 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[3];
  *(_OWORD *)(a1 + 432) = a3[2];
  *(_OWORD *)(a1 + 448) = v5;
  *(_OWORD *)(a1 + 400) = v3;
  *(_OWORD *)(a1 + 416) = v4;
  result = (__n128)a3[4];
  v7 = a3[5];
  v8 = a3[7];
  *(_OWORD *)(a1 + 496) = a3[6];
  *(_OWORD *)(a1 + 512) = v8;
  *(__n128 *)(a1 + 464) = result;
  *(_OWORD *)(a1 + 480) = v7;
  return result;
}

- (NSArray)textFrames
{
  return self->_textFrames;
}

- (void)setTextFrames:(id)a3
{
  objc_storeStrong((id *)&self->_textFrames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFrames, 0);
  objc_storeStrong((id *)&self->_hitAreaPoints, 0);
}

@end

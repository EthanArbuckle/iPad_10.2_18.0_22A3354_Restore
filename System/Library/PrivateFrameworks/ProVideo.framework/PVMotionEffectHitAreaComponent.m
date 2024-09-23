@implementation PVMotionEffectHitAreaComponent

- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  uint64_t v8;
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v13;
  _BOOL8 v14;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PVCGPointQuad v30;
  __int128 v31;
  int64_t var3;
  PVCGPointQuad v33;
  _QWORD v34[12];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v35;
  int v36;
  int v37;
  BOOL v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v8 = *(_QWORD *)&a8;
  height = a7.height;
  width = a7.width;
  y = a6.y;
  x = a6.x;
  v13 = a5;
  v14 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "outputSize");
  v19 = v18;
  v21 = v20;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v22, "origin");

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4;
  v43 = __Block_byref_object_dispose__4;
  v44 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke;
  v34[3] = &unk_1E64D6100;
  v38 = v14;
  v35 = *a3;
  *(double *)&v34[6] = x;
  *(double *)&v34[7] = y;
  v34[4] = self;
  v34[5] = &v39;
  v34[8] = v19;
  v34[9] = v21;
  *(double *)&v34[10] = width;
  *(double *)&v34[11] = height;
  v36 = (int)v17;
  v37 = v8;
  objc_msgSend(v23, "runEnsuringDocumentReadyAndLockingDocument:", v34);

  if ((unint64_t)objc_msgSend((id)v40[5], "count") < 3)
  {
    memset(&v33, 0, sizeof(v33));
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transformComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v31 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    if (v26)
      objc_msgSend(v26, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v31, v14, v13, v8, x, y, width, height);
    else
      memset(&v33, 0, sizeof(v33));

    v30 = v33;
    PVCGPointQuad_to_NSArray(&v30);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = (id)v40[5];
  }
  v28 = v24;
  _Block_object_dispose(&v39, 8);

  return v28;
}

void __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  void *v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[7];
  int v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;

  if (!*(_DWORD *)(a2 + 164))
  {
    v4 = *(_DWORD *)(a2 + 160);
    if (*(_BYTE *)(a1 + 128))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "motionEffect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timelineComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isForceRenderAtPosterFrameEnabled");

    }
    v42 = 0uLL;
    v43 = 0;
    objc_msgSend(*(id *)(a1 + 32), "motionEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timelineComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v40 = *(_OWORD *)(a1 + 96);
    v41 = *(_QWORD *)(a1 + 112);
    if (v9)
    {
      objc_msgSend(v9, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v40, v5, a2);
    }
    else
    {
      v42 = 0uLL;
      v43 = 0;
    }

    objc_msgSend(*(id *)(a1 + 32), "motionEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v42;
    v39 = v43;
    objc_msgSend(v11, "publishedParam_NoLock:forKey:atTime:includeHidden:", a2, CFSTR("kPVHitAreaPointsKey"), &v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__4;
    v36 = __Block_byref_object_dispose__4;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PVEffectParam_ValuesArrayKey"));
    v37 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend((id)v33[5], "count") >= 3)
    {
      pv_CGPoint_scale_polygon((void *)v33[5], *(float64_t *)(a1 + 48), *(float64_t *)(a1 + 56));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v33[5];
      v33[5] = v13;

      objc_msgSend(*(id *)(a1 + 32), "motionEffect");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2;
      v26[3] = &unk_1E64D4D88;
      v26[4] = *(_QWORD *)(a1 + 32);
      v26[5] = &v32;
      v27 = v4;
      v28 = v42;
      v29 = v43;
      v30 = *(_OWORD *)(a1 + 96);
      v31 = *(_QWORD *)(a1 + 112);
      v26[6] = a2;
      objc_msgSend(v15, "runWithInspectableProperties:", v26);

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v33[5], "count"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v22[1] = 3221225472;
      v20 = *(_OWORD *)(a1 + 80);
      v23 = *(_OWORD *)(a1 + 64);
      v21 = (void *)v33[5];
      v22[0] = v16;
      v22[2] = __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_3;
      v22[3] = &unk_1E64D60D8;
      v24 = v20;
      v25 = *(_QWORD *)(a1 + 120);
      v22[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v22);
    }
    _Block_object_dispose(&v32, 8);

  }
}

void __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transformComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v8 = *(unsigned int *)(a1 + 56);
  v14 = *(_OWORD *)(a1 + 60);
  v15 = *(_QWORD *)(a1 + 76);
  v12 = *(_OWORD *)(a1 + 84);
  v13 = *(_QWORD *)(a1 + 100);
  objc_msgSend(v5, "transformObjectPointsToImage_NoLock:objectID:timelineTime:componentTime:flatten:documentInfo:properties:", v7, v8, &v14, &v12, 0, v6, v3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __115__PVMotionEffectHitAreaComponent_hitAreaPointsAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;

  v3 = a2;
  objc_msgSend(v3, "CGPointValue");
  v5 = v4;
  v7 = v6;
  v8 = *(double *)(a1 + 40);
  v9 = *(double *)(a1 + 48);
  v11 = *(double *)(a1 + 56);
  v10 = *(double *)(a1 + 64);
  v13 = *(_DWORD *)(a1 + 72);
  v12 = *(_DWORD *)(a1 + 76);
  v14 = *MEMORY[0x1E0C9D538];
  v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v13 == 2)
  {
    v19 = 0.5;
    if (v12 != 1)
    {
      v17 = v8 * 0.5;
      v18 = v9 * 0.5;
      v16 = v12 == 0;
      goto LABEL_8;
    }
    v14 = v8 * 0.5;
    goto LABEL_20;
  }
  if (v13 != 1)
  {
    if (!v13)
    {
      if (v12 != 1)
      {
        v16 = v12 == 2;
        v17 = v8 * -0.5;
        v18 = v9 * -0.5;
LABEL_8:
        if (v16)
          v14 = v17;
        if (v16)
          v15 = v18;
        goto LABEL_14;
      }
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (!v12)
  {
LABEL_18:
    v20 = *(double *)(a1 + 48);
LABEL_21:
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, v11 / v8, v10 / v9);
    v25 = v23;
    CGAffineTransformTranslate(&v26, &v25, v14, v20);
    v23 = v26;
    v24 = v26;
    CGAffineTransformScale(&v26, &v24, 1.0, -1.0);
    goto LABEL_22;
  }
  if (v12 == 2)
  {
    v14 = v8 * -0.5;
    v19 = 0.5;
LABEL_20:
    v20 = v9 * v19;
    goto LABEL_21;
  }
LABEL_14:
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeScale(&v23, v11 / v8, v10 / v9);
  v25 = v23;
  CGAffineTransformTranslate(&v26, &v25, v14, v15);
LABEL_22:
  v23 = v26;
  v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v26.tx + v5 * v26.a + v7 * v26.c, v26.ty + v5 * v26.b + v7 * v26.d, *(_QWORD *)&v26.a, *(_QWORD *)&v26.b, *(_QWORD *)&v26.c, *(_QWORD *)&v26.d, *(_QWORD *)&v26.tx, *(_QWORD *)&v26.ty);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);

}

- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  uint64_t v11;
  double height;
  double width;
  _BOOL8 v16;
  double y;
  double x;
  _BOOL8 v19;
  CGFloat v21;
  CGFloat v22;
  void *v24;
  char v25;
  CGPath *v26;
  BOOL result;
  __int128 v28;
  int64_t var3;
  CGPathRef path;
  CGPoint v31;
  CGPoint v32;

  v11 = *(_QWORD *)&a11;
  height = a10.height;
  width = a10.width;
  v16 = a7;
  y = a6.y;
  x = a6.x;
  v19 = a5;
  v21 = a3.y;
  v22 = a3.x;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isVisible");

  if ((v25 & 1) == 0)
    return 0;
  v28 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  path = 0;
  v26 = -[PVMotionEffectHitAreaComponent createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:](self, "createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:", &v28, v19, v16, v11, &path, x, y, a8, a9, width, height);
  v31.x = v22;
  v31.y = v21;
  if (CGPathContainsPoint(v26, 0, v31, 0))
    return 1;
  result = 0;
  if (v16)
  {
    if (path)
    {
      v32.x = v22;
      v32.y = v21;
      return CGPathContainsPoint(path, 0, v32, 0);
    }
  }
  return result;
}

- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11
{
  _BOOL4 v12;
  void *v15;
  CGPath *closed_CGPath_with_points;
  float64_t v17;
  float64x2_t v18;
  double v19;
  const CGPath *expanded_closed_CGPath_with_CGPath;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22;

  v12 = a6;
  v22 = *a3;
  -[PVMotionEffectHitAreaComponent hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:](self, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v22, a4, 0, *(_QWORD *)&a10, a5.x, a5.y, a9.width, a9.height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  closed_CGPath_with_points = pv_create_closed_CGPath_with_points(v15);
  if (a11)
  {
    if (!v12
      || (pv_bounding_CGRect(v15),
          v18.f64[1] = v17,
          v19 = fmin(fmax(a8 / sqrt(vaddvq_f64(vmulq_f64(v18, v18))), 0.0), 1.0) * a7,
          v19 <= 0.0)
      || (expanded_closed_CGPath_with_CGPath = pv_create_expanded_closed_CGPath_with_CGPath(closed_CGPath_with_points, v19)) == 0)
    {
      expanded_closed_CGPath_with_CGPath = CGPathRetain(closed_CGPath_with_points);
    }
    *a11 = expanded_closed_CGPath_with_CGPath;
  }

  return closed_CGPath_with_points;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertTimeToTimelineTime_noLock:(SEL)a3 forcePosterFrame:(id *)a4 documentInfo:(BOOL)a5
{
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v17;
  int64_t var3;

  if (a5)
  {
    v10 = 1;
  }
  else
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timelineComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isForceRenderAtPosterFrameEnabled");

  }
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timelineComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v17 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  if (v14)
  {
    objc_msgSend(v14, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v17, v10, a6);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[12];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29;
  int v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  height = a10.height;
  width = a10.width;
  y = a3.y;
  x = a3.x;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect", a4, a5, a7, a3.x, a3.y, a6.x, a6.y, a8, a9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "outputSize");
  v21 = v20;
  v23 = v22;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v24, "origin");

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4;
  v37 = __Block_byref_object_dispose__4;
  v38 = 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __145__PVMotionEffectHitAreaComponent_objectHitTest_atTime_forcePosterFrame_scale_adjustForMinimumSize_minimumSize_sizeThreshold_viewSize_viewOrigin___block_invoke;
  v28[3] = &unk_1E64D6100;
  v29 = *a4;
  v32 = a5;
  *(CGFloat *)&v28[6] = x;
  *(CGFloat *)&v28[7] = y;
  *(CGFloat *)&v28[8] = width;
  *(CGFloat *)&v28[9] = height;
  v28[10] = v21;
  v28[11] = v23;
  v30 = a11;
  v31 = (int)v19;
  v28[4] = self;
  v28[5] = &v33;
  objc_msgSend(v25, "runEnsuringDocumentReadyAndLockingDocument:", v28);

  v26 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v26;
}

void __145__PVMotionEffectHitAreaComponent_objectHitTest_atTime_forcePosterFrame_scale_adjustForMinimumSize_minimumSize_sizeThreshold_viewSize_viewOrigin___block_invoke(uint64_t a1, void **a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  int v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint v18;
  CGFloat y;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  __int128 v27;
  uint64_t v28;
  CMTime v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;

  memset(&v29, 0, sizeof(v29));
  v4 = *(void **)(a1 + 32);
  v27 = *(_OWORD *)(a1 + 96);
  v28 = *(_QWORD *)(a1 + 112);
  if (v4)
    objc_msgSend(v4, "convertTimeToTimelineTime_noLock:forcePosterFrame:documentInfo:", &v27, *(unsigned __int8 *)(a1 + 128), a2);
  v5 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v7 = *(double *)(a1 + 88);
  v10 = *(_DWORD *)(a1 + 120);
  v9 = *(_DWORD *)(a1 + 124);
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v25 = *(double *)(a1 + 48);
  v26 = *(double *)(a1 + 56);
  if (v10 == 2)
  {
    v16 = 0.5;
    if (v9 != 1)
    {
      v14 = v5 * 0.5;
      v15 = v6 * 0.5;
      v13 = v9 == 0;
      goto LABEL_10;
    }
    v11 = v5 * 0.5;
    goto LABEL_22;
  }
  if (v10 != 1)
  {
    if (!v10)
    {
      if (v9 != 1)
      {
        v13 = v9 == 2;
        v14 = v5 * -0.5;
        v15 = v6 * -0.5;
LABEL_10:
        if (v13)
          v11 = v14;
        if (v13)
          v12 = v15;
        goto LABEL_16;
      }
      goto LABEL_20;
    }
LABEL_16:
    memset(&v30, 0, sizeof(v30));
    CGAffineTransformMakeScale(&v30, v8 / v5, v7 / v6);
    v32 = v30;
    CGAffineTransformTranslate(&v33, &v32, v11, v12);
    goto LABEL_24;
  }
  if (v9)
  {
    if (v9 != 2)
      goto LABEL_16;
    v11 = v5 * -0.5;
    v16 = 0.5;
LABEL_22:
    v17 = v6 * v16;
    goto LABEL_23;
  }
LABEL_20:
  v17 = *(double *)(a1 + 72);
LABEL_23:
  memset(&v30, 0, sizeof(v30));
  CGAffineTransformMakeScale(&v30, v8 / v5, v7 / v6);
  v32 = v30;
  CGAffineTransformTranslate(&v33, &v32, v11, v17);
  v30 = v33;
  v31 = v33;
  CGAffineTransformScale(&v33, &v31, 1.0, -1.0);
LABEL_24:
  v30 = v33;
  v18 = (CGPoint)vaddq_f64(*(float64x2_t *)&v33.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v33.a, v25), vmulq_n_f64(*(float64x2_t *)&v33.c, v26)));
  LODWORD(v33.a) = 0;
  y = v18.y;
  if (!OZXHitCheck(*a2, v18, &v29, (unsigned int *)&v33))
  {
    objc_msgSend(*(id *)(a1 + 32), "motionEffect");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sceneManagerComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleForOZID:", LODWORD(v33.a));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      NSLog(CFSTR("Warning: effect hit test succeeded, but no object handle found"));
  }
}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PVMotionEffectHitAreaComponent;
  objc_msgSendSuper2(&v7, sel_motionEffectPropertyKeyToPublishedParameterNameMap);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v8 = CFSTR("kPVHitAreaPointsKey");
  v9[0] = CFSTR("HitAreaPoints");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
    v5 = v3;

    v4 = v5;
  }

  return v4;
}

@end

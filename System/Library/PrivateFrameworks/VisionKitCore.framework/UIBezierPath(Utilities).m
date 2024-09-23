@implementation UIBezierPath(Utilities)

- (uint64_t)vk_CGPath
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGPath");
}

- (void)vk_appendRect:()Utilities
{
  void *v2;
  id v3;

  +[VKQuad quadFromCGRect:](VKQuad, "quadFromCGRect:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_appendBezierPath:", v2);

}

- (void)vk_appendBezierPath:()Utilities
{
  id v4;

  v4 = a3;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
    objc_msgSend(a1, "appendPath:", v4);

}

- (double)vk_centroid
{
  void *v1;
  unint64_t v2;
  unint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  objc_msgSend(a1, "vk_allPoints");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  v3 = v2;
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v2 >= 3)
  {
    v6 = 0;
    v7 = v2 - 1;
    v8 = 0.0;
    do
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "vk_pointValue");
      v11 = v10;
      v13 = v12;

      if (v7 == v6)
        v14 = 0;
      else
        v14 = v6 + 1;
      objc_msgSend(v1, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "vk_pointValue");
      v17 = v16;
      v19 = v18;
      ++v6;

      v20 = VKMCrossPoints(v17, v19, v11, v13);
      v4 = v4 + (v11 + v17) * v20;
      v5 = v5 + (v13 + v19) * v20;
      v8 = v8 + v20 * 0.5;
    }
    while (v3 != v6);
    v21 = VKMMultiplyPointScalar(v4, v5, 1.0 / (v8 * 6.0));
    if (v21 >= 0.0)
      v4 = v21;
    else
      v4 = -v21;
  }

  return v4;
}

- (double)vk_lengthIgnoringCurves
{
  const CGPath *v1;
  double v2;
  _QWORD block[7];
  _QWORD v5[6];
  __int128 v6;
  _QWORD v7[6];
  __int128 v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x4012000000;
  v7[3] = __Block_byref_object_copy__14;
  v7[4] = __Block_byref_object_dispose__14;
  v7[5] = &unk_1D2EE27EA;
  v8 = VKMPointInfinity;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4012000000;
  v5[3] = __Block_byref_object_copy__14;
  v5[4] = __Block_byref_object_dispose__14;
  v5[5] = &unk_1D2EE27EA;
  v6 = VKMPointInfinity;
  v1 = (const CGPath *)objc_msgSend(a1, "vk_CGPath");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIBezierPath_Utilities__vk_lengthIgnoringCurves__block_invoke;
  block[3] = &unk_1E9465068;
  block[4] = v5;
  block[5] = v7;
  block[6] = &v9;
  CGPathApplyWithBlock(v1, block);
  v2 = v10[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

- (uint64_t)vk_allPoints
{
  return objc_msgSend((id)objc_opt_class(), "vk_allPointsFromCGPath:", objc_msgSend(a1, "vk_CGPath"));
}

+ (id)vk_allPointsFromCGPath:()Utilities
{
  id v4;
  id v5;
  _QWORD block[4];
  id v8;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIBezierPath_Utilities__vk_allPointsFromCGPath___block_invoke;
  block[3] = &unk_1E9465090;
  v5 = v4;
  v8 = v5;
  CGPathApplyWithBlock(a3, block);

  return v5;
}

- (uint64_t)vk_applyTransform:()Utilities
{
  __int128 v3;
  _OWORD v5[3];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return objc_msgSend(a1, "applyTransform:", v5);
}

- (id)vk_pathFromFlippingInRect:()Utilities
{
  id v10;
  const CGPath *v11;
  id v12;
  _QWORD block[4];
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v10 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  v11 = (const CGPath *)objc_msgSend(a1, "vk_CGPath");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__UIBezierPath_Utilities__vk_pathFromFlippingInRect___block_invoke;
  block[3] = &unk_1E94650B8;
  v12 = v10;
  v15 = v12;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  CGPathApplyWithBlock(v11, block);

  return v12;
}

- (id)debugQuickLookObject
{
  id v1;
  double v2;
  CGFloat v3;
  _BYTE *v4;
  CGAffineTransform *v5;
  CGFloat v6;
  double v7;
  _BYTE v9[48];
  _BYTE v10[48];

  v1 = a1;
  objc_msgSend(v1, "bounds");
  if (v2 < 2.0)
  {
    v3 = 150.0;
    v4 = v10;
    v5 = (CGAffineTransform *)v10;
    v6 = 150.0;
LABEL_5:
    CGAffineTransformMakeScale(v5, v3, v6);
    objc_msgSend(v1, "vk_applyTransform:", v4);
    return v1;
  }
  objc_msgSend(v1, "bounds");
  v3 = 20.0;
  if (v7 < 20.0)
  {
    v4 = v9;
    v5 = (CGAffineTransform *)v9;
    v6 = 20.0;
    goto LABEL_5;
  }
  return v1;
}

- (uint64_t)vk_subpathArray
{
  return objc_msgSend((id)objc_opt_class(), "vk_subpathArrayFromCGPath:", objc_msgSend(a1, "vk_CGPath"));
}

+ (id)vk_subpathArrayFromCGPath:()Utilities
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__8;
  v12[4] = __Block_byref_object_dispose__9;
  v13 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__UIBezierPath_Utilities__vk_subpathArrayFromCGPath___block_invoke;
  v9[3] = &unk_1E94650E0;
  v11 = v12;
  v5 = v4;
  v10 = v5;
  CGPathApplyWithBlock(a3, v9);
  v6 = v10;
  v7 = v5;

  _Block_object_dispose(v12, 8);
  return v7;
}

- (id)vk_pathByFittingToRect:()Utilities
{
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v37;
  CGAffineTransform v38;

  objc_msgSend(a1, "bounds");
  v11 = v10;
  v15 = VKMCenterOfRect(v12, v13, v10, v14);
  v17 = v16;
  v30 = a2;
  v31 = a3;
  v18 = VKMCenterOfRect(a2, a3, a4, a5);
  v20 = v19;
  v21 = VKMSizeRatioFromSizes(a4, a5, v11);
  v23 = v22;
  memset(&v38, 0, sizeof(v38));
  CGAffineTransformMakeTranslation(&v38, -v15, -v17);
  t1 = v38;
  CGAffineTransformMakeScale(&t2, v21, v23);
  CGAffineTransformConcat(&v37, &t1, &t2);
  v38 = v37;
  v34 = v37;
  CGAffineTransformMakeTranslation(&v33, v18, v20);
  CGAffineTransformConcat(&v37, &v34, &v33);
  v38 = v37;
  v24 = (void *)objc_msgSend(a1, "copy");
  v32 = v38;
  objc_msgSend(v24, "vk_applyTransform:", &v32);
  objc_msgSend(v24, "bounds");
  if (!VKMNearlyEqualRects(v30, v31, a4, a5, v25, v26, v27, v28))
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "VKMNearlyEqualRects(endBounds, result.bounds)", "-[UIBezierPath(Utilities) vk_pathByFittingToRect:]", 0, 0, CFSTR("path vk_transformToFitRect did not give a correct result"));
  return v24;
}

- (id)vk_unionAndFlattenWithPath:()Utilities
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
  {
    objc_msgSend(a1, "_vk_flattenWithPath:clipType:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)vk_intersectAndFlattenWithPath:()Utilities
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
  {
    objc_msgSend(a1, "_vk_flattenWithPath:clipType:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_vk_flattenWithPath:()Utilities clipType:
{
  id v6;
  id v7;
  void *v8;
  const CGPath *v9;
  uint64_t *v10;
  const CGPath *v11;
  uint64_t *v12;
  const CGPath *v13;
  const CGPath *v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  void **v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *__p;
  void *v25;
  _QWORD v26[7];
  void (**v27)(ClipperLib::Clipper *__hidden);
  uint64_t v28[3];

  v6 = a3;
  memset(v28, 0, sizeof(v28));
  ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v19, 0);
  v7 = a1;
  if (v6 && (objc_msgSend(v6, "isEmpty") & 1) == 0)
  {
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeScale(&v18, 10000.0, 10000.0);
    if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
    {
      v9 = (const CGPath *)MEMORY[0x1D8249448](objc_msgSend(v7, "vk_CGPath"), &v18);
      v10 = VKMClipperPathsFromCGPath(v9, 1.0);
      ClipperLib::ClipperBase::AddPaths((uint64_t)&v19 + (_QWORD)*(v19 - 3), v10, 0, 1);
      CGPathRelease(v9);
      *(_QWORD *)&v17.a = v10;
      std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
      MEMORY[0x1D82499A0](v10, 0x20C40960023A9);
    }
    v11 = (const CGPath *)MEMORY[0x1D8249448](objc_msgSend(v6, "vk_CGPath"), &v18);
    v12 = VKMClipperPathsFromCGPath(v11, 1.0);
    ClipperLib::ClipperBase::AddPaths((uint64_t)&v19 + (_QWORD)*(v19 - 3), v12, 1, 1);
    CGPathRelease(v11);
    *(_QWORD *)&v17.a = v12;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
    MEMORY[0x1D82499A0](v12, 0x20C40960023A9);
    ClipperLib::Clipper::Execute((uint64_t)&v19, a4, v28, 0);
    v13 = (const CGPath *)objc_msgSend((id)objc_opt_class(), "_cgPathFromClipperPath:", v28);
    v16 = v18;
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformInvert(&v17, &v16);
    v14 = (const CGPath *)MEMORY[0x1D8249448](v13, &v17);
    CGPathRelease(v13);
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_pathFromCGPath:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CGPathRelease(v14);
  }
  else
  {
    v8 = v7;
  }
  v19 = (void **)&off_1E9461B90;
  v27 = &off_1E9461BD8;
  std::__list_imp<long long>::clear(v26);
  if (__p)
  {
    v25 = __p;
    operator delete(__p);
  }
  if (v22)
  {
    v23 = v22;
    operator delete(v22);
  }
  if (v20)
  {
    v21 = v20;
    operator delete(v20);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v27);
  v19 = (void **)v28;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v19);

  return v8;
}

- (id)vk_expandWithOffset:()Utilities
{
  const CGPath *v3;
  void *v4;
  uint64_t *v5;
  uint64_t *v6;
  const CGPath *v7;
  uint64_t v9[33];
  void **v10;

  v3 = (const CGPath *)objc_msgSend(a1, "vk_CGPath");
  if ((objc_msgSend((id)objc_opt_class(), "vk_cgPathcontainsAnyCurveToPoints:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = VKMClipperPathsFromCGPath(v3, 1.0);
    v6 = (uint64_t *)operator new();
    std::vector<std::vector<ClipperLib::IntPoint>>::vector(v6, 4uLL);
    ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)v9, 2.0, 0.25);
    ClipperLib::ClipperOffset::AddPaths((uint64_t)v9, v5, 2, 0);
    ClipperLib::ClipperOffset::Execute(v9, v6, a2);
    v7 = (const CGPath *)objc_msgSend((id)objc_opt_class(), "_cgPathFromClipperPath:", v6);
    v10 = (void **)v6;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x1D82499A0](v6, 0x20C40960023A9);
    v10 = (void **)v5;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x1D82499A0](v5, 0x20C40960023A9);
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_pathFromCGPath:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v7);
    ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v9);
  }
  return v4;
}

+ (id)vk_groupAndRoundPaths:()Utilities radius:offset:
{
  id v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  const CGPath *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  void *v17;
  double v18;
  uint64_t v19[33];
  _QWORD v20[5];
  void **v21;
  void ***v22;
  uint64_t v23;
  __n128 (*v24)(uint64_t, uint64_t);
  void (*v25)(_QWORD *);
  void *v26;
  uint64_t (**v27)(ClipperLib::Clipper *__hidden);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *__p;
  void *v33;
  _QWORD v34[7];
  void (**v35)(ClipperLib::Clipper *__hidden);
  uint64_t v36[3];
  _QWORD v37[5];
  void **v38;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke;
  v37[3] = &__block_descriptor_40_e29_B32__0__UIBezierPath_8Q16_B24l;
  v37[4] = a1;
  if ((objc_msgSend(v8, "vk_containsObjectPassingTest:", v37) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    memset(v36, 0, sizeof(v36));
    v21 = 0;
    v22 = &v21;
    v23 = 0x15012000000;
    v24 = __Block_byref_object_copy__15;
    v25 = __Block_byref_object_dispose__16;
    v26 = &unk_1D2EE27EA;
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke_18;
    v20[3] = &unk_1E9465128;
    v20[4] = &v21;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20, ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v27, 0));
    ClipperLib::Clipper::Execute((uint64_t)(v22 + 6), 1, v36, 0);
    v11 = (uint64_t *)operator new();
    std::vector<std::vector<ClipperLib::IntPoint>>::vector(v11, 4uLL);
    ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)v19, 2.0, 0.25);
    ClipperLib::ClipperOffset::AddPaths((uint64_t)v19, v36, 2, 0);
    ClipperLib::ClipperOffset::Execute(v19, v11, a3);
    v12 = (const CGPath *)objc_msgSend(a1, "_cgPathFromClipperPath:", v11);
    v38 = (void **)v11;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v38);
    MEMORY[0x1D82499A0](v11, 0x20C40960023A9);
    objc_msgSend(a1, "vk_subpathArrayFromCGPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v12);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __63__UIBezierPath_Utilities__vk_groupAndRoundPaths_radius_offset___block_invoke_2;
    v15[3] = &unk_1E9465150;
    v17 = a1;
    v18 = a2;
    v10 = objc_alloc_init(MEMORY[0x1E0CEA390]);
    v16 = v10;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

    ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v19);
    _Block_object_dispose(&v21, 8);
    v27 = &off_1E9461B90;
    v35 = &off_1E9461BD8;
    std::__list_imp<long long>::clear(v34);
    if (__p)
    {
      v33 = __p;
      operator delete(__p);
    }
    if (v30)
    {
      v31 = v30;
      operator delete(v30);
    }
    if (v28)
    {
      v29 = v28;
      operator delete(v28);
    }
    ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v35);
    v21 = (void **)v36;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v21);
  }

  return v10;
}

+ (uint64_t)vk_cgPathcontainsAnyCurveToPoints:()Utilities
{
  uint64_t v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__UIBezierPath_Utilities__vk_cgPathcontainsAnyCurveToPoints___block_invoke;
  block[3] = &unk_1E9465178;
  block[4] = &v6;
  CGPathApplyWithBlock(path, block);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (CGPath)_cgPathFromClipperPath:()Utilities
{
  CGPath *Mutable;
  uint64_t **v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t *v8;
  char v9;

  Mutable = CGPathCreateMutable();
  v6 = *a3;
  v5 = a3[1];
  while (v6 != v5)
  {
    v7 = *v6;
    v8 = v6[1];
    if (*v6 != v8)
    {
      v9 = 1;
      do
      {
        if ((v9 & 1) != 0)
          CGPathMoveToPoint(Mutable, 0, (double)**v6, (double)(*v6)[1]);
        else
          CGPathAddLineToPoint(Mutable, 0, (double)*v7, (double)v7[1]);
        v9 = 0;
        v7 += 3;
      }
      while (v7 != v8);
    }
    CGPathCloseSubpath(Mutable);
    v6 += 3;
  }
  return Mutable;
}

+ (CGPath)vk_newRoundedPathWithRadius:()Utilities points:
{
  id v6;
  void *v7;
  id v8;
  CGPath *Mutable;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v52;
  double v53;
  double v54;
  CGFloat radius;
  CGFloat x;
  double v57;
  double v58;
  double v59;

  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(a1, "_processPointsForRounding:withRadius:", v7, a2);
  objc_msgSend(a1, "_processPointsForNarrowAngles:", v7);
  v8 = v7;

  Mutable = CGPathCreateMutable();
  v10 = 0;
  v52 = a2;
  while (objc_msgSend(v8, "count", *(_QWORD *)&v52) > v10)
  {
    objc_msgSend(v8, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vk_pointValue");
    v13 = v12;
    v15 = v14;

    objc_msgSend(v8, "objectAtIndex:", (v10 + 1) % objc_msgSend(v8, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "vk_pointValue");
    v18 = v17;
    v20 = v19;

    objc_msgSend(v8, "objectAtIndex:", (v10 + 2) % objc_msgSend(v8, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "vk_pointValue");
    v59 = v22;
    v24 = v23;

    objc_msgSend(v8, "objectAtIndex:", (v10 + 3) % objc_msgSend(v8, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "vk_pointValue");
    v57 = v27;
    v58 = v26;

    v28 = v13;
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_clampedRadius:p1:p2:p3:", a2, v13, v15, v18, v20, v59, v24);
    v30 = v29;
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_clampedRadius:p1:p2:p3:", a2, v18, v20, v59, v24, v58, v57);
    v32 = v31;
    radius = fmin(v30, v31);
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_calculateCenterForPoints:p2:p3:radius:", v28, v15, v18, v20, v59, v24);
    v34 = v33;
    v36 = v35;
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_projectPoint:lineStart:lineEnd:");
    x = v37;
    v39 = v38;
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_projectPoint:lineStart:lineEnd:", v34, v36, v18, v20, v59, v24);
    v53 = v41;
    v54 = v40;
    if (!v10)
      CGPathMoveToPoint(Mutable, 0, x, v39);
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_calculateCenterForPoints:p2:p3:radius:", v18, v20, v59, v24, v58, v57, v32);
    objc_msgSend(MEMORY[0x1E0CEA390], "vk_projectPoint:lineStart:lineEnd:");
    v43 = v42;
    v45 = v44;
    v46 = VKMAngleBetweenPoints(v34 + 10.0, v36, v34, v36, x, v39);
    v47 = VKMAngleBetweenPoints(v34 + 10.0, v36, v34, v36, v54, v53);
    VKMNormalizeAngleInRadians(v47 - v46);
    v49 = v48;
    VKMNormalizeAngleInRadians(v46 - v47);
    CGPathAddArc(Mutable, 0, v34, v36, radius, v46, v47, v49 >= v50);
    a2 = v52;
    ++v10;
    CGPathAddLineToPoint(Mutable, 0, v43, v45);
  }
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

+ (void)_processPointsForNarrowAngles:()Utilities
{
  unint64_t i;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v24 = a3;
  for (i = 0; objc_msgSend(v24, "count") > i; ++i)
  {
    v4 = objc_msgSend(v24, "count");
    v5 = objc_msgSend(v24, "count");
    objc_msgSend(v24, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vk_pointValue");
    v8 = v7;
    v10 = v9;
    v11 = (i + 1) % v4;

    objc_msgSend(v24, "objectAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vk_pointValue");
    v14 = v13;
    v16 = v15;

    objc_msgSend(v24, "objectAtIndex:", (i + 2) % v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "vk_pointValue");
    v19 = v18;
    v21 = v20;

    v22 = fabs(VKMAngleBetweenPoints(v8, v10, v14, v16, v19, v21));
    if (v22 < 0.785398163 || v22 > 5.49778714)
    {
      objc_msgSend(MEMORY[0x1E0CEA390], "vk_projectPoint:lineStart:lineEnd:", v8, v10, v14, v16, v19, v21);
      objc_msgSend(MEMORY[0x1E0CB3B18], "vk_valueWithPoint:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:atIndexedSubscript:", v23, v11);

    }
  }

}

+ (void)_processPointsForRounding:()Utilities withRadius:
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  _BOOL4 v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  id v25;

  v5 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__8;
  v24[4] = __Block_byref_object_dispose__9;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__9;
  v23 = 0;
  v6 = (void *)objc_msgSend(v5, "copy");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__UIBezierPath_Utilities___processPointsForRounding_withRadius___block_invoke;
  v17[3] = &unk_1E94651A0;
  v7 = a1 / 3.0;
  *(double *)&v17[6] = v7;
  v17[4] = v24;
  v17[5] = &v18;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);

  if (v19[5])
    objc_msgSend(v5, "removeObjectsAtIndexes:");
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vk_pointValue");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "vk_pointValue");
  v16 = VKMNearlyEqualPointsWithThreshold(v10, v12, v14, v15, v7);

  if (v16)
    objc_msgSend(v5, "removeLastObject");
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(v24, 8);
}

+ (VKLineSegment)vk_shiftLinePerpendicularlyFromPoint:()Utilities to:radius:
{
  VKLineSegment *v10;
  double v11;
  double v12;
  long double v13;

  v10 = objc_alloc_init(VKLineSegment);
  if (a1 == a3)
  {
    v11 = a5;
  }
  else
  {
    v11 = 0.0;
    if (a2 != a4)
    {
      v12 = VKMSlopeOfLine(a1, a2, a3, a4);
      v13 = atan(fabs(v12));
      cos(v13);
    }
  }
  -[VKLineSegment setStartPoint:](v10, "setStartPoint:", VKMAddPoints(a1, a2, v11));
  -[VKLineSegment setEndPoint:](v10, "setEndPoint:", VKMAddPoints(a3, a4, v11));
  return v10;
}

+ (double)vk_clampedRadius:()Utilities p1:p2:p3:
{
  return fmin(fmin(fmin(a1, fmax(vabdd_f64(a2, a4), vabdd_f64(a3, a5)) * 0.5), fmax(vabdd_f64(a2, a6), vabdd_f64(a3, a7)) * 0.5), fmax(vabdd_f64(a4, a6), vabdd_f64(a5, a7)) * 0.5);
}

+ (void)vk_signForRadiusWithVectorStart:()Utilities end:otherPoint:
{
  if (a1 != a3)
    VKMSlopeOfLine(a1, a2, a3, a4);
}

+ (void)vk_calculateCenterForPoints:()Utilities p2:p3:radius:
{
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30[4];
  double v31[5];

  v31[4] = *(double *)MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "vk_signForRadiusWithVectorStart:end:otherPoint:");
  objc_msgSend(MEMORY[0x1E0CEA390], "vk_shiftLinePerpendicularlyFromPoint:to:radius:", a2, a3, a4, a5, v15 * a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "vk_signForRadiusWithVectorStart:end:otherPoint:", a6, a7, a4, a5, a2, a3);
  objc_msgSend(MEMORY[0x1E0CEA390], "vk_shiftLinePerpendicularlyFromPoint:to:radius:", a6, a7, a4, a5, v17 * a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startPoint");
  v31[0] = v19;
  v31[1] = v20;
  objc_msgSend(v16, "endPoint");
  v31[2] = v21;
  v31[3] = v22;
  objc_msgSend(v18, "startPoint");
  v30[0] = v23;
  v30[1] = v24;
  objc_msgSend(v18, "endPoint");
  v30[2] = v25;
  v30[3] = v26;
  v27 = 0;
  v28 = 0;
  VKMIntersectionOfLines(v31, v30, (double *)&v27, (double *)&v28, (double *)&v29, 1, 1);

}

+ (double)vk_projectPoint:()Utilities lineStart:lineEnd:
{
  double v6;
  double v10;
  VKLine *v11;
  VKLine *v12;
  __int128 v14;

  v6 = a3;
  v14 = *MEMORY[0x1E0C9D538];
  if (a3 != a5)
  {
    if (a4 == a6)
    {
      return a1;
    }
    else
    {
      v10 = VKMSlopeOfLine(a3, a4, a5, a6);
      v11 = objc_alloc_init(VKLine);
      -[VKLine setA:](v11, "setA:", v10);
      -[VKLine setB:](v11, "setB:", a4 - v10 * v6);
      v12 = objc_alloc_init(VKLine);
      -[VKLine setA:](v12, "setA:", -1.0 / v10);
      -[VKLine setB:](v12, "setB:", a2 + 1.0 / v10 * a1);
      VKMIntersectsLine(v11, v12, (uint64_t)&v14);

      return *(double *)&v14;
    }
  }
  return v6;
}

+ (id)vk_roundAndGroupNormalizedQuadsForHighlight:()Utilities aspectRatio:expansionScale:radiusToAvgHeightRatio:
{
  id v10;
  id v11;
  _QWORD *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  const CGPath *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  CGAffineTransform v28;
  _QWORD v29[4];
  id v30;
  id v31;
  void *v32;
  double v33;
  void **v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *__p;
  void *v40;
  _QWORD v41[7];
  void (**v42)(ClipperLib::Clipper *__hidden);
  uint64_t v43[3];
  _QWORD v44[8];
  _QWORD v45[4];
  id v46;
  double v47;
  double v48;
  _QWORD v49[3];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  ClipperLib::ClipperOffset *(*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  void *v55;
  _BYTE v56[264];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD v61[6];
  _BYTE v62[264];
  void **v63;

  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x13812000000;
  v61[3] = __Block_byref_object_copy__24;
  v61[4] = __Block_byref_object_dispose__25;
  v61[5] = &unk_1D2EE27EA;
  ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)v62, 2.0, 0.25);
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v12 = (_QWORD *)operator new();
  std::vector<std::vector<ClipperLib::IntPoint>>::vector(v12, 4uLL);
  v60 = v12;
  v50 = 0;
  v51 = &v50;
  v52 = 0x13812000000;
  v53 = __Block_byref_object_copy__24;
  v54 = __Block_byref_object_dispose__25;
  v55 = &unk_1D2EE27EA;
  ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)v56, 2.0, 0.25);
  memset(v49, 0, sizeof(v49));
  v13 = VKMMultiplyPointScalar(a2, 1.0, 10000.0);
  v15 = v14;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke;
  v45[3] = &unk_1E94651C8;
  v18 = v16;
  v46 = v18;
  v47 = v13;
  v48 = v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v45);
  v44[0] = v17;
  v44[1] = 3221225472;
  v44[2] = __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_2;
  v44[3] = &unk_1E94651F0;
  *(double *)&v44[7] = a3;
  v44[4] = v61;
  v44[5] = &v57;
  v44[6] = &v50;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v44);
  v19 = v58[3];
  if (v19)
  {
    v34 = (void **)v58[3];
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v34);
    MEMORY[0x1D82499A0](v19, 0x20C40960023A9);
  }
  memset(v43, 0, sizeof(v43));
  ClipperLib::ClipperOffset::Execute(v51 + 6, v43, 0.0);
  ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v34, 0);
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v34 + (_QWORD)*(v34 - 3), v43, 0, 1);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", VKMRectWithSize());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = VKMClipperPathsFromCGPath((const CGPath *)objc_msgSend(v20, "vk_CGPath"), 1.0);
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v34 + (_QWORD)*(v34 - 3), v21, 1, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v34, 0, v43, 0);
  v22 = (const CGPath *)objc_msgSend(a1, "_cgPathFromClipperPath:", v43);
  v63 = (void **)v21;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v63);
  MEMORY[0x1D82499A0](v21, 0x20C40960023A9);
  objc_msgSend(a1, "vk_subpathArrayFromCGPath:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(v22);
  if (v23)
  {
    objc_msgSend(a1, "mapPaths:toQuads:", v23, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v29[0] = v17;
      v29[1] = 3221225472;
      v29[2] = __121__UIBezierPath_Utilities__vk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_3;
      v29[3] = &unk_1E9465218;
      v32 = a1;
      v30 = v24;
      v33 = a4;
      v31 = v11;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v29);

    }
  }
  CGAffineTransformMakeScale(&v28, 1.0 / v13, 1.0 / v15);
  objc_msgSend(v11, "vk_applyTransform:", &v28);
  v26 = v11;

  v34 = (void **)&off_1E9461B90;
  v42 = &off_1E9461BD8;
  std::__list_imp<long long>::clear(v41);
  if (__p)
  {
    v40 = __p;
    operator delete(__p);
  }
  if (v37)
  {
    v38 = v37;
    operator delete(v37);
  }
  if (v35)
  {
    v36 = v35;
    operator delete(v35);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v42);
  v34 = (void **)v43;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v34);

  v34 = (void **)v49;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v34);
  _Block_object_dispose(&v50, 8);
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v56);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(v61, 8);
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v62);

  return v26;
}

+ (double)radiusForQuads:()Utilities radiusRatio:
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "sideLength", (_QWORD)v14);
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10 / (double)v6 * a1;
}

+ (id)mapPaths:()Utilities toQuads:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__UIBezierPath_Utilities__mapPaths_toQuads___block_invoke;
  v14[3] = &unk_1E9465240;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

@end

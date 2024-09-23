@implementation PFParallaxLayoutUtilities

+ (id)computeLayoutWithHelper:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PFParallaxLayoutUtilities computeLayoutsWithHelper:](PFParallaxLayoutUtilities, "computeLayoutsWithHelper:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestLayout:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)computeLayoutsWithHelper:(id)a3
{
  id v3;
  PFParallaxIntermediateLayout *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id obj;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  void *v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [PFParallaxIntermediateLayout alloc];
  objc_msgSend(v3, "initialRect");
  v5 = -[PFParallaxIntermediateLayout initWithVisibleRect:](v4, "initWithVisibleRect:");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = (void *)v5;
  objc_msgSend(v3, "intermediateWithHeadroomStrategy:intermediate:", 1, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v6, "addObject:", v11);

  if (PFPosterEnableHeadroom()
    && objc_msgSend(v3, "headroomFeasible")
    && objc_msgSend(v3, "layoutType") != 2)
  {
    objc_msgSend(v3, "intermediateWithHeadroomStrategy:intermediate:", 2, v55);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v6, "addObject:", v12);

  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v6;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v72 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v3, "intermediateWithZoomStrategy:intermediate:", 1, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v7, "addObject:", v18);

        objc_msgSend(v3, "intermediateWithZoomStrategy:intermediate:", 2, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v7, "addObject:", v19);

        objc_msgSend(v3, "intermediateWithZoomStrategy:intermediate:", 3, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v7, "addObject:", v20);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
    }
    while (v14);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v21 = v7;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v68 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
        objc_msgSend(v3, "intermediateWithOverlapStrategy:intermediate:", 1, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v8, "addObject:", v27);

        objc_msgSend(v3, "intermediateWithOverlapStrategy:intermediate:", 2, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v8, "addObject:", v28);

        objc_msgSend(v3, "intermediateWithOverlapStrategy:intermediate:", 3, v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v8, "addObject:", v29);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v88, 16);
    }
    while (v23);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v30 = v8;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v87, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v64 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(v3, "intermediateWithParallaxStrategy:intermediate:", 1, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          objc_msgSend(v9, "addObject:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v87, 16);
    }
    while (v32);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v36 = v9;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v86, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v60 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * m);
        objc_msgSend(v3, "intermediateWithInactiveStrategy:intermediate:", 1, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
          objc_msgSend(v10, "addObject:", v42);

        if (objc_msgSend(v3, "layoutType") != 2)
        {
          objc_msgSend(v3, "intermediateWithInactiveStrategy:intermediate:", 2, v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
            objc_msgSend(v10, "addObject:", v43);

        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v86, 16);
    }
    while (v38);
  }

  if (objc_msgSend(v10, "count"))
  {
    v44 = v10;
    v45 = v55;
  }
  else
  {
    v45 = v55;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v50 = objc_msgSend(obj, "count");
      v51 = objc_msgSend(v21, "count");
      v52 = objc_msgSend(v30, "count");
      v53 = objc_msgSend(v36, "count");
      v54 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134219008;
      v77 = v50;
      v78 = 2048;
      v79 = v51;
      v80 = 2048;
      v81 = v52;
      v82 = 2048;
      v83 = v53;
      v84 = 2048;
      v85 = v54;
      _os_log_fault_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "No intermediate layouts available to be scored, falling back to initial layout. Counts: headroom=%tu, zoom=%tu, overlap=%tu, parallax=%tu, inactive=%tu", buf, 0x34u);
    }
    v75 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __54__PFParallaxLayoutUtilities_computeLayoutsWithHelper___block_invoke;
  v57[3] = &unk_1E45A32A8;
  v58 = v3;
  v46 = v3;
  PFMap(v44, v57);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");

  return v48;
}

+ (BOOL)_rectIsValid:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
    return 0;
  v7 = height > 0.0;
  if (width <= 0.0)
    v7 = 0;
  if (y < 0.0)
    v7 = 0;
  return x >= 0.0 && v7;
}

+ (CGFloat)effectiveAcceptableRectForClassification:(double)a3 havePetFaces:(double)a4 sourcePreferredCropRectNormalized:(double)a5 sourceAcceptableCropRectNormalized:(CGFloat)x sourceFaceAreaRectNormalized:(CGFloat)y sourceGazeAreaRectNormalized:(CGFloat)width
{
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  switch(a11)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      break;
    case 1:
      if (objc_msgSend(a1, "_rectIsValid:", a13, a14, a15, a16))
      {
        if (objc_msgSend(a1, "_rectIsValid:", a17, a18, a19, a20))
        {
          height = a16;
          width = a15;
          y = a14;
          x = a13;
          if (+[PFWallpaperCompoundDeviceConfiguration deviceSupportsLandscapeConfiguration](PFWallpaperCompoundDeviceConfiguration, "deviceSupportsLandscapeConfiguration"))
          {
            v30.origin.x = a13;
            v30.origin.y = a14;
            v30.size.width = a15;
            v30.size.height = a16;
            v33.origin.x = a17;
            v33.origin.y = a18;
            v33.size.width = a19;
            v33.size.height = a20;
            v31 = CGRectUnion(v30, v33);
            x = v31.origin.x;
            y = v31.origin.y;
            width = v31.size.width;
            height = v31.size.height;
          }
        }
        else
        {
          height = a16;
          width = a15;
          y = a14;
          x = a13;
        }
      }
      break;
    case 2:
      if (a12 && (objc_msgSend(a1, "_rectIsValid:", a13, a14, a15, a16) & 1) != 0)
      {
        height = a16;
        width = a15;
        y = a14;
        x = a13;
      }
      break;
    default:
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      break;
  }
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (CGRectIsEmpty(v32))
    return *MEMORY[0x1E0D71110];
  return x;
}

+ (double)effectivePreferredRectForClassification:(double)y havePetFaces:(double)width sourcePreferredCropRectNormalized:(double)height sourceAcceptableCropRectNormalized:(double)a6 sourceFaceAreaRectNormalized:(double)a7
{
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v37;
  CGRect v38;

  switch(a11)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      break;
    case 1:
      x = a6;
      y = a7;
      width = a8;
      height = a9;
      if (objc_msgSend(a1, "_rectIsValid:", a13, a14, a15, a16))
      {
        v25 = a13;
        v26 = a14;
        v27 = a15;
        v28 = a16;
        v29 = x;
        v30 = y;
        v31 = width;
        v32 = height;
        goto LABEL_11;
      }
      break;
    case 2:
      if (a12 && objc_msgSend(a1, "_rectIsValid:", a13, a14, a15, a16))
      {
        v25 = a13;
        v26 = a14;
        v27 = a15;
        v28 = a16;
        v29 = a6;
        v30 = a7;
        v31 = a8;
        v32 = a9;
LABEL_11:
        v38 = CGRectUnion(*(CGRect *)&v25, *(CGRect *)&v29);
        x = v38.origin.x;
        y = v38.origin.y;
        width = v38.size.width;
        height = v38.size.height;
      }
      break;
    default:
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      break;
  }
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  if (CGRectIsEmpty(v37))
    return *MEMORY[0x1E0D71110];
  return x;
}

+ (double)effectiveMatteInspectionRectForClassification:(double)a3 havePetFaces:(double)a4 sourceAcceptableCropRectNormalized:(double)a5 sourceFaceAreaRectNormalized:(CGFloat)a6 sourcePreferredRectNormalized:(double)a7 originalMatteRectDenormalized:(CGFloat)a8
{
  double x;
  CGFloat y;
  CGFloat height;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v43;
  double width;
  double v45;
  double v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v58.origin.x = r2;
  v58.size.width = r2_16;
  v55.origin.y = 0.0;
  v55.size.height = 1.0;
  v58.origin.y = 0.0;
  v58.size.height = 1.0;
  v55.origin.x = a6;
  v55.size.width = a8;
  v56 = CGRectUnion(v55, v58);
  x = v56.origin.x;
  y = v56.origin.y;
  height = v56.size.height;
  v36 = a7;
  v37 = a9;
  v54 = a4;
  v39 = a19;
  v38 = a20;
  v41 = a17;
  v40 = a18;
  switch(a11)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      break;
    case 1:
      v52 = height;
      v43 = a6;
      width = v56.size.width;
      v45 = a8;
      v46 = y;
      v47 = objc_msgSend(a1, "_rectIsValid:", v43, v36, v45, v37);
      if (v47)
      {
        v38 = a20 * v52;
        v39 = a19 * width;
      }
      else
      {
        v39 = v54 * a19;
      }
      if (v47)
        v40 = a18 + v46 * a20;
      else
        v40 = a18 + a20 * 0.0;
      if (v47)
        v41 = a17 + x * a19;
      else
        v41 = a17 + a2 * a19;
      break;
    case 2:
      if (a12
        && (v53 = height,
            v48 = a6,
            v49 = v56.size.width,
            v50 = a8,
            v51 = y,
            objc_msgSend(a1, "_rectIsValid:", v48, v36, v50, v37)))
      {
        v41 = a17 + x * a19;
        v40 = a18 + v51 * a20;
        v39 = a19 * v49;
        v38 = a20 * v53;
      }
      else
      {
        v41 = a17 + a2 * a19;
        v40 = a18 + a20 * 0.0;
        v39 = v54 * a19;
      }
      break;
    default:
      v41 = *MEMORY[0x1E0C9D628];
      v40 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v39 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v38 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      break;
  }
  v57.origin.x = v41;
  v57.origin.y = v40;
  v57.size.width = v39;
  v57.size.height = v38;
  if (CGRectIsEmpty(v57))
    return *MEMORY[0x1E0D71110];
  return v41;
}

+ (CGRect)bestFaceRectWithImageSize:(CGSize)a3 deviceSize:(CGSize)a4 faceRegions:(id)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  BOOL v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat x;
  CGFloat y;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[8];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;
  CGRect v83;
  CGRect v84;
  CGRect result;
  CGRect v86;
  CGRect v87;

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  v82 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (v8 == 0.0
    || v7 == 0.0
    || ((v62 = *(double *)(MEMORY[0x1E0D71130] + 8), v63 = *MEMORY[0x1E0D71130], v8 == *MEMORY[0x1E0D71130])
      ? (v10 = v7 == *(double *)(MEMORY[0x1E0D71130] + 8))
      : (v10 = 0),
        v10))
  {
    _PFAssertFailHandler();
  }
  v11 = v9;
  if (width / height < v8 / v7)
    v12 = v7 * (width / height);
  else
    v12 = v8;
  if (width / height < v8 / v7)
    v13 = v7;
  else
    v13 = v8 / (width / height);
  v66 = 0.0;
  v67 = 0.0;
  v65 = 0.0;
  if (v8 != 0.0)
  {
    v65 = 0.0 / v8;
    v66 = v12 / v8;
  }
  v64 = 0.0;
  if (v7 != 0.0)
  {
    v64 = 0.0 / v7;
    v67 = v13 / v7;
  }
  v14 = *MEMORY[0x1E0C9D628];
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v77;
    v21 = 0.0;
    v53 = v17;
    v22 = v17;
    v23 = v16;
    v24 = v15;
    v61 = v14;
    v55 = v15;
    v56 = v14;
    v54 = v16;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v77 != v20)
          objc_enumerationMutation(v11);
        v57 = v21;
        v58 = v24;
        v59 = v23;
        v60 = v22;
        objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * v25), "rectValue");
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = __78__PFParallaxLayoutUtilities_bestFaceRectWithImageSize_deviceSize_faceRegions___block_invoke;
        v75[3] = &__block_descriptor_64_e29_q24__0__NSValue_8__NSValue_16l;
        v75[4] = v26;
        v75[5] = v27;
        v75[6] = v28;
        v75[7] = v29;
        objc_msgSend(v11, "sortedArrayUsingComparator:", v75);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v31 = v30;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v72;
          v70 = 0.0;
          while (2)
          {
            v35 = 0;
            v36 = v14;
            v37 = v15;
            v38 = v16;
            v39 = v17;
            do
            {
              if (*(_QWORD *)v72 != v34)
                objc_enumerationMutation(v31);
              objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v35), "rectValue");
              v86.origin.x = v40;
              v86.origin.y = v41;
              v43 = v42;
              v45 = v44;
              v83.origin.x = v36;
              v83.origin.y = v37;
              v83.size.width = v38;
              v83.size.height = v39;
              v86.size.width = v43;
              v86.size.height = v45;
              v84 = CGRectUnion(v83, v86);
              x = v84.origin.x;
              y = v84.origin.y;
              v87.size.width = v84.size.width;
              v87.size.height = v84.size.height;
              v87.origin.x = 0.0;
              v87.origin.y = 0.0;
              v84.origin.y = v64;
              v84.origin.x = v65;
              v84.size.width = v66;
              v84.size.height = v67;
              v16 = v87.size.width;
              v17 = v87.size.height;
              if (!CGRectContainsRect(v84, v87))
              {
                v14 = v36;
                v15 = v37;
                v16 = v38;
                v17 = v39;
                goto LABEL_41;
              }
              if (v43 == 0.0 || v45 == 0.0 || (v45 == v62 ? (v46 = v43 == v63) : (v46 = 0), v46))
                v47 = 0.0;
              else
                v47 = v43 * v45;
              ++v35;
              v14 = x;
              v15 = y;
              v36 = x;
              v70 = v70 + v47;
              v37 = y;
              v38 = v16;
              v39 = v17;
            }
            while (v33 != v35);
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
            if (v33)
              continue;
            break;
          }
        }
        else
        {
          v70 = 0.0;
        }
LABEL_41:

        v21 = v57;
        v24 = v58;
        if (v70 > v57)
          v21 = v70;
        v23 = v59;
        v22 = v60;
        if (v70 > v57)
        {
          v22 = v17;
          v23 = v16;
          v24 = v15;
        }
        v48 = v61;
        if (v70 > v57)
          v48 = v14;
        v61 = v48;

        ++v25;
        v15 = v55;
        v14 = v56;
        v17 = v53;
        v16 = v54;
      }
      while (v25 != v19);
      v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    }
    while (v19);
  }
  else
  {
    v22 = v17;
    v23 = v16;
    v24 = v15;
    v61 = v14;
  }

  v49 = v61;
  v50 = v24;
  v51 = v23;
  v52 = v22;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

+ (unint64_t)layoutTypeFromLayoutConfiguration:(id)a3
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

  v3 = a3;
  objc_msgSend(v3, "screenSize");
  v5 = v4;
  objc_msgSend(v3, "screenScale");
  v7 = v5 / v6;
  objc_msgSend(v3, "screenSize");
  v9 = v8;
  objc_msgSend(v3, "screenScale");
  v11 = v10;

  return v7 * (v9 / v11) >= 600000.0;
}

+ (double)timeOverlapCheckThresholdForTopRect:(CGRect)a3 isInteractive:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[PFParallaxLayoutTextOverlapParameters systemParameters](PFParallaxLayoutTextOverlapParameters, "systemParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maxTopOverlapForTopRect:isInteractive:", v4, x, y, width, height);
  v11 = v10;

  return v11;
}

+ (double)cropScoreThresholdForClassification:(unint64_t)a3
{
  if (a3 > 5)
    return 0.6;
  else
    return dbl_1A17B71A0[a3];
}

+ (BOOL)facePositionAcceptable:(CGRect)a3 imageAspect:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[PFParallaxLayoutUtilities facePositionLimits](PFParallaxLayoutUtilities, "facePositionLimits");
  if (a4 <= 1.0)
    v9 = width * a4;
  else
    v9 = height * (1.0 / a4);
  if (v9 < 0.0 || v9 > 0.0)
    return 0;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  if (CGRectGetMinX(v12) < 0.0)
    return 0;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (CGRectGetMaxX(v13) > 0.0)
    return 0;
  +[PFParallaxLayoutHelper inflatePersonFaceRect:](PFParallaxLayoutHelper, "inflatePersonFaceRect:", x, y, width, height);
  return CGRectGetMaxY(v14) <= 0.0;
}

+ ($54B668FA3CFF7C50914A1C899F2834C0)facePositionLimits
{
  *retstr = *($54B668FA3CFF7C50914A1C899F2834C0 *)byte_1A17B6D60;
  return result;
}

+ (unint64_t)clockIntersectionFromTopRectMatteCoverage:(double)a3 bottomRectMatteCoverage:(double)a4
{
  if (a4 <= 0.0 && a3 <= 0.0)
    return 2;
  else
    return 1;
}

+ (double)computeInactiveAvoidingRectForVisibleRect:(CGFloat)a3 acceptableFrame:(CGFloat)a4 unsafeRect:(CGFloat)a5 imageSize:(CGFloat)a6 considerHeadroom:(CGFloat)a7 newVisibleRect:(CGFloat)a8
{
  CGFloat v29;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  _BOOL4 v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double MinY;
  double v51;
  BOOL v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat x;
  double v63;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v29 = a1 + a3 * 0.5;
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeTranslation(&v80, -v29, -a2);
  memset(&v79, 0, sizeof(v79));
  CGAffineTransformMakeScale(&v79, 1.03, 1.03);
  memset(&v78, 0, sizeof(v78));
  CGAffineTransformMakeTranslation(&v78, v29, a2);
  memset(&v77, 0, sizeof(v77));
  t1 = v80;
  t2 = v79;
  CGAffineTransformConcat(&v76, &t1, &t2);
  t1 = v78;
  CGAffineTransformConcat(&v77, &v76, &t1);
  t1 = v77;
  v81.origin.x = a1;
  v81.origin.y = a2;
  v81.size.width = a3;
  v81.size.height = a4;
  v82 = CGRectApplyAffineTransform(v81, &t1);
  v61 = a5;
  x = v82.origin.x;
  y = v82.origin.y;
  width = v82.size.width;
  height = v82.size.height;
  v82.origin.x = a5;
  v82.origin.y = a6;
  v82.size.width = a7;
  v82.size.height = a8;
  MaxY = CGRectGetMaxY(v82);
  v83.origin.y = a2 + a14 * a4;
  v83.size.width = a3 * a15;
  v83.size.height = a4 * a16;
  v63 = a1 + a13 * a3;
  v83.origin.x = v63;
  v59 = a3 * a15;
  v60 = v83.origin.y;
  v58 = a4 * a16;
  v34 = MaxY - CGRectGetMinY(v83);
  if (v34 > 0.0)
    v34 = 0.0;
  if (v34 < -0.03)
    v34 = -0.03;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeTranslation(&t1, 0.0, -v34);
  t2 = t1;
  v84.origin.x = x;
  v84.origin.y = y;
  v84.size.width = width;
  v84.size.height = height;
  v85 = CGRectApplyAffineTransform(v84, &t2);
  v35 = v85.origin.x;
  v36 = v85.origin.y;
  v37 = v85.size.width;
  v38 = v85.size.height;
  v85.origin.x = 0.0;
  v85.origin.y = 0.0;
  v85.size.width = a17;
  v85.size.height = a18;
  v67 = a1;
  v68 = a2;
  v90.origin.x = a1;
  v90.origin.y = a2;
  v39 = a3;
  v90.size.width = a3;
  v69 = a4;
  v90.size.height = a4;
  v40 = v36;
  v41 = v37;
  v42 = CGRectContainsRect(v85, v90);
  v43 = 1.35;
  if (a11 ^ 1 | v42)
    v43 = 1.0;
  v86.size.height = a18 * v43;
  v86.origin.x = 0.0;
  v86.origin.y = 0.0;
  v86.size.width = a17;
  v91.origin.x = v35;
  v91.origin.y = v40;
  v91.size.width = v41;
  v91.size.height = v38;
  if (CGRectContainsRect(v86, v91))
  {
    if (a12)
    {
      *a12 = a1;
      a12[1] = v68;
      v67 = v35;
      a12[2] = v39;
      a12[3] = v69;
    }
    else
    {
      return v35;
    }
  }
  else
  {
    memset(&t2, 0, sizeof(t2));
    CGAffineTransformMakeScale(&t2, 0.970873786, 0.970873786);
    memset(&v73, 0, sizeof(v73));
    v71 = v80;
    v70 = t2;
    CGAffineTransformConcat(&v72, &v71, &v70);
    v71 = v78;
    CGAffineTransformConcat(&v73, &v72, &v71);
    v71 = v73;
    v87.origin.x = a1;
    v87.origin.y = v68;
    v44 = v39;
    v87.size.width = v39;
    v87.size.height = v69;
    v88 = CGRectApplyAffineTransform(v87, &v71);
    v45 = v88.origin.x;
    v46 = v88.origin.y;
    v47 = v88.size.width;
    v48 = v88.size.height;
    v88.origin.x = v61;
    v88.origin.y = a6;
    v88.size.width = a7;
    v88.size.height = a8;
    v49 = CGRectGetMaxY(v88);
    v89.origin.x = v63;
    v89.size.width = v59;
    v89.origin.y = v60;
    v89.size.height = v58;
    MinY = CGRectGetMinY(v89);
    if (a12)
    {
      v51 = v49 - MinY;
      if (v51 > 0.0)
        v51 = 0.0;
      v52 = fabs(v51) <= 0.03;
      v54 = v68;
      v53 = v69;
      if (v52)
        v53 = v48;
      if (v52)
        v54 = v46;
      v55 = a1;
      if (v52)
        v55 = v45;
      *a12 = v55;
      a12[1] = v54;
      if (v52)
        v56 = v47;
      else
        v56 = v44;
      a12[2] = v56;
      a12[3] = v53;
    }
  }
  return v67;
}

+ (float)headroomPenaltyForIntermediateLayout:(id)a3 originalFullExtent:(CGRect)a4 layoutConfiguration:(id)a5
{
  double height;
  id v7;
  id v8;
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
  double v20;
  double v21;
  BOOL v22;
  double v23;

  height = a4.size.height;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "visibleRect");
  v10 = v9;
  objc_msgSend(v8, "visibleRect");
  v12 = v11;

  v13 = v10 + v12 - height;
  objc_msgSend(v7, "screenSize");
  v15 = v14;
  objc_msgSend(v7, "screenScale");
  v17 = v15 / v16;
  objc_msgSend(v7, "screenScale");
  v19 = v18;

  v20 = v17 * (v13 / v19);
  v21 = v20 / 489574.4 * 5.0;
  v22 = v20 <= 0.0;
  v23 = 0.0;
  if (!v22)
    return v21;
  return v23;
}

uint64_t __78__PFParallaxLayoutUtilities_bestFaceRectWithImageSize_deviceSize_faceRegions___block_invoke(double *a1, void *a2, void *a3)
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = a3;
  objc_msgSend(a2, "rectValue");
  v10 = hypot(a1[4] + a1[6] * 0.5 - (v6 + v7 * 0.5), a1[5] + a1[7] * 0.5 - (v8 + v9 * 0.5));
  objc_msgSend(v5, "rectValue");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = hypot(a1[4] + a1[6] * 0.5 - (v12 + v16 * 0.5), a1[5] + a1[7] * 0.5 - (v14 + v18 * 0.5));
  if (v10 < v19)
    return -1;
  else
    return v10 > v19;
}

uint64_t __54__PFParallaxLayoutUtilities_computeLayoutsWithHelper___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "scoreIntermediate:", a2);
}

@end

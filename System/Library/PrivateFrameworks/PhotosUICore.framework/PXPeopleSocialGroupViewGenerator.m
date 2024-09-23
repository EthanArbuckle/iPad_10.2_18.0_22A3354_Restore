@implementation PXPeopleSocialGroupViewGenerator

+ (id)generateViewForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5
{
  double height;
  double width;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  height = a4.height;
  width = a4.width;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleSocialGroupViewGenerator.m"), 33, CFSTR("%s must be called on the main thread"), "+[PXPeopleSocialGroupViewGenerator generateViewForSocialGroup:withSize:displayScale:]");

  }
  if (height != width)
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "+[PXPeopleSocialGroupViewGenerator generateViewForSocialGroup:withSize:displayScale:]";
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "%s: The requested social group size isn't a square.", buf, 0xCu);
    }

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, width, height);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  +[PXPeopleSocialGroupViewGenerator _faceCropFetchOptionsForSocialGroup:withSize:displayScale:](PXPeopleSocialGroupViewGenerator, "_faceCropFetchOptionsForSocialGroup:withSize:displayScale:", v10, width, height, a5);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18);
        v20 = objc_alloc_init(MEMORY[0x1E0DC3890]);
        objc_msgSend(v12, "addSubview:", v20);
        objc_msgSend(v20, "setBackgroundColor:", v14);
        objc_msgSend(v20, "setAccessibilityIgnoresInvertColors:", 1);
        +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __85__PXPeopleSocialGroupViewGenerator_generateViewForSocialGroup_withSize_displayScale___block_invoke;
        v28[3] = &unk_1E513F120;
        v29 = v20;
        v30 = v19;
        v22 = v20;
        objc_msgSend(v21, "requestFaceCropForOptions:resultHandler:", v19, v28);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v16);
  }
  objc_msgSend(v12, "subviews");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleSocialGroupViewGenerator _layoutAvatarViews:inFrame:](PXPeopleSocialGroupViewGenerator, "_layoutAvatarViews:inFrame:", v23, 0.0, 0.0, width, height);

  return v12;
}

+ (void)prefetchForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[PXPeopleSocialGroupViewGenerator _faceCropFetchOptionsForSocialGroup:withSize:displayScale:](PXPeopleSocialGroupViewGenerator, "_faceCropFetchOptionsForSocialGroup:withSize:displayScale:", a3, a4.width, a4.height, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __81__PXPeopleSocialGroupViewGenerator_prefetchForSocialGroup_withSize_displayScale___block_invoke;
        v13[3] = &unk_1E513F148;
        v13[4] = v11;
        objc_msgSend(v12, "requestFaceCropForOptions:resultHandler:", v11, v13);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

+ (void)resizeThumbnailSizeForSocialGroupView:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  id v10;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "frame");
  v9 = v8;
  objc_msgSend(v7, "frame");
  objc_msgSend(v7, "setFrame:", v9);
  objc_msgSend(v7, "subviews");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_layoutAvatarViews:inFrame:", v10, 0.0, 0.0, width, height);
}

+ (id)indexesThatNeedPortraitCropsForNumberOfFaces:(unint64_t)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (a3 > 9)
    goto LABEL_9;
  v7 = v6;
  if (((1 << a3) & 0x252) == 0)
  {
    if (((1 << a3) & 0xA4) != 0)
    {
      objc_msgSend(v6, "addIndex:", 0);
      v8 = 1;
LABEL_7:
      objc_msgSend(v7, "addIndex:", v8);
      goto LABEL_8;
    }
    if (((1 << a3) & 0x108) != 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleSocialGroupViewGenerator.m"), 109, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_8:
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

+ (id)_faceCropFetchOptionsForSocialGroup:(id)a3 withSize:(CGSize)a4 displayScale:(double)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  double v16;
  double v17;
  PXPeopleFaceCropFetchOptions *v18;
  void *v19;
  PXPeopleFaceCropFetchOptions *v20;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[PXPeopleSocialGroupViewGenerator _numberOfFacesToShowForSocialGroup:](PXPeopleSocialGroupViewGenerator, "_numberOfFacesToShowForSocialGroup:", v8);
  +[PXPeopleSocialGroupViewGenerator indexesThatNeedPortraitCropsForNumberOfFaces:](PXPeopleSocialGroupViewGenerator, "indexesThatNeedPortraitCropsForNumberOfFaces:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = 0;
    v13 = 72 * v10 - 72;
    v14 = (char *)&yFactors + v13;
    v15 = (char *)&xFactors + v13;
    do
    {
      v16 = width * *(double *)&v15[8 * v12];
      v17 = height * *(double *)&v14[8 * v12];
      v18 = [PXPeopleFaceCropFetchOptions alloc];
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v18, "initWithPerson:targetSize:displayScale:", v19, v16, v17, a5);

      if (objc_msgSend(v11, "containsIndex:", v12))
        -[PXPeopleFaceCropFetchOptions setCropFactor:](v20, "setCropFactor:", 3);
      if (v10 != 1)
        -[PXPeopleFaceCropFetchOptions setCornerStyle:](v20, "setCornerStyle:", 0);
      objc_msgSend(v9, "addObject:", v20);

      ++v12;
    }
    while (v10 != v12);
  }

  return v9;
}

+ (unint64_t)_numberOfFacesToShowForSocialGroup:(id)a3
{
  unint64_t result;

  result = objc_msgSend(a3, "count");
  if (result >= 9)
    return 9;
  return result;
}

+ (void)_layoutAvatarViews:(id)a3 inFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  uint64_t i;
  void *v69;
  id v70;
  CGRect v71;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v70 = a3;
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  v8 = CGRectGetWidth(v71);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  PXFloatFloorToPixel();
  v11 = v10;

  v12 = objc_msgSend(v70, "count") - 1;
  v13 = v70;
  switch(v12)
  {
    case 0:
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = 0.0;
      v17 = 0.0;
      goto LABEL_11;
    case 1:
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", 0.0, 0.0, v11 + -0.5, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v17 = 0.0;
      v16 = v11 + 0.5;
      v19 = v11 + -0.5;
      goto LABEL_12;
    case 2:
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFrame:", 0.0, 0.0, v11 + -0.5, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", v11 + 0.5, 0.0, v11 + -0.5, v11 + -0.5);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v11 + 0.5;
      v17 = v11 + 0.5;
      v19 = v11 + -0.5;
      v22 = v11 + -0.5;
      goto LABEL_13;
    case 3:
      v8 = v11 + -0.5;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", 0.0, 0.0, v11 + -0.5, v11 + -0.5);

      v24 = v11 + 0.5;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFrame:", v24, 0.0, v8, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFrame:", 0.0, v24, v8, v8);

      v27 = v70;
      v28 = 3;
      goto LABEL_8;
    case 4:
      v29 = (v8 + -1.0 + v8 + -1.0) / 3.0;
      v8 = (v8 + -2.0) / 3.0;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFrame:", 0.0, 0.0, v11 + -0.5, v29);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFrame:", v11 + 0.5, 0.0, v11 + -0.5, v29);

      v24 = v29 + 1.0;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFrame:", 0.0, v29 + 1.0, v8, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setFrame:", v8 + 1.0, v29 + 1.0, v8, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v8 + 1.0 + v8 + 1.0;
      goto LABEL_9;
    case 5:
      v34 = (v8 + -1.0 + v8 + -1.0) / 3.0;
      v8 = (v34 + -1.0) * 0.5;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setFrame:", 0.0, 0.0, v34, v34);

      v36 = v34 + 1.0;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFrame:", v36, 0.0, v8, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFrame:", v36, v8 + 1.0, v8, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setFrame:", 0.0, v36, v8, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFrame:", v8 + 1.0, v36, v8, v8);

      v24 = v8 + 1.0 + v8 + 1.0;
      v27 = v70;
      v28 = 5;
LABEL_8:
      objc_msgSend(v27, "objectAtIndexedSubscript:", v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v24;
LABEL_9:
      v17 = v24;
      goto LABEL_11;
    case 6:
      v41 = (v8 + v8) / 3.0 + 0.5;
      v42 = (v8 + -2.0 + v8 + -2.0) / 3.0;
      v8 = (v8 + -2.0) / 3.0;
      v43 = (v42 + -1.0) * 0.5;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFrame:", 0.0, 0.0, v8, v42);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setFrame:", v8 + 1.0, 0.0, v8, v42);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFrame:", v41, 0.0, v8, v43);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setFrame:", v41, v43 + 1.0, v8, v43);

      v48 = v42 + 1.0;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 4);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setFrame:", 0.0, v48, v8, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 5);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setFrame:", v8 + 1.0, v48, v8, v8);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v8 + 1.0 + v8 + 1.0;
      v17 = v48;
LABEL_11:
      v19 = v8;
LABEL_12:
      v22 = v8;
      goto LABEL_13;
    case 7:
      v51 = v8 + -1.0;
      v52 = (v51 + v51) / 3.0;
      v53 = (v8 + -2.0) / 3.0;
      v54 = (v52 + -1.0) * 0.5;
      v55 = v51 / 3.0;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setFrame:", 0.0, 0.0, v53, v52);

      v57 = v53 + 1.0;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFrame:", v53 + 1.0, 0.0, v53, v54);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setFrame:", v57 + v57, 0.0, v53, v54);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 3);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setFrame:", v53 + 1.0, v54 + 1.0, v53, v54);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 4);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setFrame:", v57 + v57, v54 + 1.0, v53, v54);

      v62 = v52 + 1.0;
      objc_msgSend(v70, "objectAtIndexedSubscript:", 5);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setFrame:", 0.0, v62, v53, v55);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 6);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setFrame:", v53 + 1.0, v62, v53, v55);

      objc_msgSend(v70, "objectAtIndexedSubscript:", 7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v57 + v57;
      v17 = v62;
      v19 = v53;
      v22 = v55;
LABEL_13:
      objc_msgSend(v14, "setFrame:", v16, v17, v19, v22);

      v13 = v70;
      break;
    case 8:
      v65 = 0;
      v66 = 0;
      v67 = (v8 + -2.0) / 3.0;
      do
      {
        for (i = 0; i != 3; ++i)
        {
          objc_msgSend(v70, "objectAtIndexedSubscript:", v65 + i);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setFrame:", (v67 + 1.0) * (double)(int)v66, (v67 + 1.0) * (double)(int)i, v67, v67);

          v13 = v70;
        }
        ++v66;
        v65 += 3;
      }
      while (v66 != 3);
      break;
    default:
      break;
  }

}

void __81__PXPeopleSocialGroupViewGenerator_prefetchForSocialGroup_withSize_displayScale___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "person");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "PXPeopleSocialGroupViewGenerator: error prefetching face crop: %@ for person: %@", (uint8_t *)&v7, 0x16u);

    }
  }

}

void __85__PXPeopleSocialGroupViewGenerator_generateViewForSocialGroup_withSize_displayScale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11 = *(id *)(a1 + 32);
  v7 = v5;
  px_dispatch_on_main_queue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "person");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "PXPeopleSocialGroupViewGenerator: error requesting face crop: %@ for person: %@", buf, 0x16u);

    }
  }

}

void __85__PXPeopleSocialGroupViewGenerator_generateViewForSocialGroup_withSize_displayScale___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CGRectValue");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentsRect:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(a1 + 40), "setImage:", *(_QWORD *)(a1 + 48));
}

@end

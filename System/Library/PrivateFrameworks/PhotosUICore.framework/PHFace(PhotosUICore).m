@implementation PHFace(PhotosUICore)

- (uint64_t)px_cropRectForPortraitImage:()PhotosUICore
{
  double v5;
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

  objc_msgSend(a1, "centerX");
  if (v5 == 0.0)
  {
    objc_msgSend(a1, "bodyCenterX");
    v7 = v6;
    objc_msgSend(a1, "bodyCenterY");
    v9 = v8;
    objc_msgSend(a1, "bodyWidth");
    v11 = v10;
    objc_msgSend(a1, "bodyHeight");
    v13 = fmin(v11, v12);
  }
  else
  {
    objc_msgSend(a1, "centerX");
    v7 = v14;
    objc_msgSend(a1, "centerY");
    v9 = v15;
    objc_msgSend(a1, "size");
    v13 = v16;
  }
  return objc_msgSend(MEMORY[0x1E0D751E8], "getCropRectForPortraitImage:size:imgWidth:imgHeight:centerX:centerY:", a3, v13, (double)objc_msgSend(a1, "sourceWidth"), (double)objc_msgSend(a1, "sourceHeight"), v7, v9);
}

- (uint64_t)px_cropRectWithCropFactor:()PhotosUICore
{
  return objc_msgSend(a1, "px_cropRectWithCropFactor:bounded:", 1);
}

- (double)px_cropRectWithCropFactor:()PhotosUICore bounded:
{
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
  CGFloat width;
  double v20;
  CGFloat height;
  double x;
  double y;
  CGFloat v24;
  CGFloat v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  objc_msgSend(a1, "size");
  v8 = v7;
  objc_msgSend(a1, "centerX");
  v10 = v9;
  objc_msgSend(a1, "centerY");
  v12 = v11;
  if (fabs(v8) < 0.00000011920929)
  {
    objc_msgSend(a1, "bodyWidth");
    v14 = v13;
    objc_msgSend(a1, "bodyHeight");
    v8 = fmin(v14, v15);
    objc_msgSend(a1, "bodyCenterX");
    v10 = v16;
    objc_msgSend(a1, "bodyCenterY");
    v12 = v17;
  }
  objc_msgSend(a1, "px_faceTileSizeAdjustingForImageAspectRatio:", v8 * a2, v8 * a2);
  width = v18;
  height = v20;
  x = v10 - v18 * 0.5;
  y = 1.0 - v12 - v20 * 0.5;
  if (a4)
  {
    if (x < 0.0)
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v28 = CGRectOffset(v27, -x, 0.0);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
    }
    if (y < 0.0)
    {
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v30 = CGRectOffset(v29, 0.0, -y);
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
    }
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    if (CGRectGetMaxX(v31) > 1.0)
    {
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v24 = 1.0 - CGRectGetMaxX(v32);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v34 = CGRectOffset(v33, v24, 0.0);
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
    }
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    if (CGRectGetMaxY(v35) > 1.0)
    {
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      v25 = 1.0 - CGRectGetMaxY(v36);
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      *(_QWORD *)&x = (unint64_t)CGRectOffset(v37, 0.0, v25);
    }
  }
  return x;
}

- (uint64_t)px_faceTileSizeAdjustingForImageAspectRatio:()PhotosUICore
{
  return objc_msgSend(MEMORY[0x1E0D751E8], "faceTileSizeAdjustingForImageAspectRatio:imgWidth:imgHeight:", a2, a3, (double)objc_msgSend(a1, "sourceWidth"), (double)objc_msgSend(a1, "sourceHeight"));
}

- (uint64_t)px_normalizedCenterEyeLine
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;

  objc_msgSend(a1, "centerX");
  if (v2 == 0.0)
  {
    objc_msgSend(a1, "bodyWidth");
    v4 = v3;
    objc_msgSend(a1, "bodyHeight");
    v6 = fmin(v4, v5);
    objc_msgSend(a1, "px_faceTileSizeAdjustingForImageAspectRatio:", v6, v6);
    objc_msgSend(a1, "bodyCenterY");
    return objc_msgSend(a1, "bodyCenterX");
  }
  else
  {
    objc_msgSend(a1, "size");
    objc_msgSend(a1, "px_faceTileSizeAdjustingForImageAspectRatio:", v8, v8);
    objc_msgSend(a1, "centerY");
    return objc_msgSend(a1, "centerX");
  }
}

- (uint64_t)normalizedCropRect
{
  return objc_msgSend(a1, "px_cropRectWithCropFactor:", 2.2);
}

- (BOOL)px_isHuman
{
  return +[PXPeopleUtilities isDetectionTypeHuman:](PXPeopleUtilities, "isDetectionTypeHuman:", objc_msgSend(a1, "detectionType"));
}

+ (id)px_fetchKeyFaceForPerson:()PhotosUICore options:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "fetchKeyFaceForPerson:options:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7 && !objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isReadyForAnalysis_FOR_UI_USE_ONLY");

    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v6, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Library is ready for analysis; marking person as needing key face: %{public}@",
          (uint8_t *)&v16,
          0xCu);

      }
      objc_msgSend(v6, "markAsNeedingKeyFace");
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v6, "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v14;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Library isn't ready for analysis; not marking person as needing key face: %{public}@",
          (uint8_t *)&v16,
          0xCu);

      }
    }
  }

  return v8;
}

@end

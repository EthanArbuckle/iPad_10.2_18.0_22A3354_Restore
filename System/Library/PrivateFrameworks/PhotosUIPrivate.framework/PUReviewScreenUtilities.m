@implementation PUReviewScreenUtilities

+ (UIEdgeInsets)_layoutMarginInsetsForSizeSpec:(id *)a3
{
  unint64_t var1;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $015D2AA2D21426A443873F5C96699A92 v10;
  UIEdgeInsets result;

  var1 = a3->var1;
  switch(var1)
  {
    case 5uLL:
      v10 = *a3;
      objc_msgSend(a1, "_cameraBottomBarHeightForSizeSpec:", &v10);
      v5 = 230.0;
      break;
    case 4uLL:
      v10 = *a3;
      objc_msgSend(a1, "_cameraBottomBarHeightForSizeSpec:", &v10);
      v5 = 203.0;
      break;
    case 1uLL:
      v10 = *a3;
      objc_msgSend(a1, "_cameraBottomBarHeightForSizeSpec:", &v10);
      v5 = 154.0;
      break;
    default:
      v7 = *MEMORY[0x1E0DC49E8];
      v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      goto LABEL_9;
  }
  v6 = v5 - v4;
  v7 = 30.0;
  v8 = 0.0;
  v9 = 0.0;
LABEL_9:
  result.right = v8;
  result.bottom = v6;
  result.left = v9;
  result.top = v7;
  return result;
}

+ (unint64_t)doneButtonStyleForReferenceBounds:(CGRect)a3
{
  unint64_t v3;

  v3 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  if (v3 >= 2)
    return v3 != 7;
  else
    return 2;
}

+ (BOOL)useCompactControlBarButtonsForReferenceBounds:(CGRect)a3
{
  double width;
  uint64_t v4;
  void *v6;
  double v7;
  double v8;

  width = a3.size.width;
  v4 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  if (v4 != 6)
    return v4 == 0;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  v8 = v7;

  return width < v8 * 0.5;
}

+ (double)_cameraTopBarHeightForSizeSpec:(id *)a3
{
  unint64_t var1;
  double result;

  var1 = a3->var1;
  if (var1 - 1 < 5)
    return 44.0;
  if (var1 == 6)
  {
    result = a3->var0.width * 0.0727273 + 16.7273;
    if (result > 44.0)
      result = 44.0;
    if (result < 40.0)
      return 40.0;
  }
  else
  {
    result = 0.0;
    if (!var1)
      return 40.0;
  }
  return result;
}

+ (CGRect)cameraTopBarFrameForReferenceBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  CGRect v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v25 = width;
  v26 = height;
  v27 = v8;
  objc_msgSend(a1, "_cameraTopBarHeightForSizeSpec:", &v25);
  v18 = v17;
  v25 = width;
  v26 = height;
  v27 = v8;
  objc_msgSend(a1, "_layoutMarginInsetsForSizeSpec:", &v25);
  v20 = v19;
  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  v21 = v20 + CGRectGetMinY(v28);
  v22 = v10;
  v23 = v14;
  v24 = v18;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

+ (double)_cameraBottomBarHeightForSizeSpec:(id *)a3
{
  double result;
  CGFloat v4;
  $015D2AA2D21426A443873F5C96699A92 *v5;

  switch(a3->var1)
  {
    case 0uLL:
      if (PUPixelWidth_onceToken != -1)
        dispatch_once(&PUPixelWidth_onceToken, &__block_literal_global_1);
      result = *(double *)&PUPixelWidth_pixelWidth + 101.0;
      break;
    case 1uLL:
      if (PUPixelWidth_onceToken != -1)
        dispatch_once(&PUPixelWidth_onceToken, &__block_literal_global_1);
      result = 119.0 - *(double *)&PUPixelWidth_pixelWidth;
      break;
    case 2uLL:
      result = 123.0;
      break;
    case 3uLL:
      result = 140.0;
      break;
    case 4uLL:
      result = 135.0;
      break;
    case 5uLL:
      result = 145.0;
      break;
    case 6uLL:
      if (PUPixelWidth_onceToken != -1)
      {
        v5 = a3;
        dispatch_once(&PUPixelWidth_onceToken, &__block_literal_global_1);
        a3 = v5;
      }
      result = *(double *)&PUPixelWidth_pixelWidth + 101.0;
      v4 = a3->var0.width * 0.409574 + -29.5638;
      if (v4 > 140.0)
        v4 = 140.0;
      if (v4 >= result)
        result = v4;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

+ (double)_cameraBottomBarWidthForSizeSpec:(id *)a3
{
  double result;

  result = 0.0;
  if (a3->var1 == 7)
  {
    result = a3->var0.width * 0.109375 + 18.0;
    if (result > 130.0)
      result = 130.0;
    if (result < 102.0)
      return 102.0;
  }
  return result;
}

+ (CGRect)cameraBottomBarFrameForReferenceBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v27 = width;
  v28 = height;
  v29 = v8;
  objc_msgSend(a1, "_cameraBottomBarWidthForSizeSpec:", &v27);
  v18 = v17;
  v27 = width;
  v28 = height;
  v29 = v8;
  objc_msgSend(a1, "_cameraBottomBarHeightForSizeSpec:", &v27);
  v20 = v19;
  v27 = width;
  v28 = height;
  v29 = v8;
  objc_msgSend(a1, "_layoutMarginInsetsForSizeSpec:", &v27);
  if (v18 == 0.0)
  {
    v22 = v21;
    v30.origin.x = v10;
    v30.origin.y = v12;
    v30.size.width = v14;
    v30.size.height = v16;
    v12 = CGRectGetMaxY(v30) - v22 - v20;
  }
  else if (v20 == 0.0)
  {
    v31.origin.x = v10;
    v31.origin.y = v12;
    v31.size.width = v14;
    v31.size.height = v16;
    v10 = CGRectGetMaxX(v31) - v18;
    v14 = v18;
    v20 = v16;
  }
  else
  {
    v14 = v18;
  }
  v23 = v10;
  v24 = v12;
  v25 = v14;
  v26 = v20;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (CGRect)cameraContentFrameForContentAspectRatio:(double)a3 referenceBounds:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "cameraContentFrameForContentAspectRatio:referenceBounds:shouldShiftPreviewForUtilityBar:", 0, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)cameraContentFrameForContentAspectRatio:(double)a3 referenceBounds:(CGRect)a4 shouldShiftPreviewForUtilityBar:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  unint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  int v23;
  int v24;
  char v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int v28;
  _BOOL4 v29;
  int v30;
  int v31;
  int v32;
  double v33;
  double v34;
  uint64_t v35;
  double MinY;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double MaxY;
  CGFloat v59;
  CGFloat v60;
  double v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect result;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = PUReviewScreenSizeClassForReferenceSize(a4.size.width, a4.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v12, x, y, width, height);
  v61 = PURectWithAspectRatioFittingRect(a3, v13, v14, v15, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = PXFloatEqualToFloatWithTolerance();
  v24 = PXFloatEqualToFloatWithTolerance();
  v25 = PXFloatEqualToFloatWithTolerance();
  if (v12 > 5 || ((1 << v12) & 0x32) == 0)
  {
    v30 = 0;
    v29 = v12 < 6;
    v26 = v12 == 6;
    goto LABEL_6;
  }
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 1;
  v30 = 1;
  v31 = 1;
  if ((v25 & 1) == 0)
  {
LABEL_6:
    v28 = v30 | v24 & v29 ^ 1;
    v27 = v26;
    v31 = v30;
  }
  v32 = v27 | v29 | v31;
  if (!v23)
    v32 = v27;
  if (((v27 | v28) & 1) == 0)
  {
    objc_msgSend(a1, "cameraTopBarFrameForReferenceBounds:", x, y, width, height);
    if (v5)
    {
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      MinY = CGRectGetMinY(v62);
LABEL_16:
      v18 = MinY;
      goto LABEL_17;
    }
LABEL_15:
    MinY = CGRectGetMaxY(*(CGRect *)&v35);
    goto LABEL_16;
  }
  if ((v24 & v31) != 0)
  {
    objc_msgSend(a1, "cameraBottomBarFrameForReferenceBounds:", x, y, width, height);
    v34 = v33;
    objc_msgSend(a1, "cameraTopBarFrameForReferenceBounds:", x, y, width, height);
    if (!v5)
    {
      v18 = v34 - v22;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v32)
  {
    objc_msgSend(a1, "cameraTopBarFrameForReferenceBounds:", x, y, width, height);
    v45 = v44;
    v47 = v46;
    v59 = v49;
    v60 = v48;
    objc_msgSend(a1, "cameraBottomBarFrameForReferenceBounds:", x, y, width, height);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v63.origin.x = v45;
    v63.origin.y = v47;
    v63.size.height = v59;
    v63.size.width = v60;
    MaxY = CGRectGetMaxY(v63);
    v64.origin.x = v51;
    v64.origin.y = v53;
    v64.size.width = v55;
    v64.size.height = v57;
    v18 = (MaxY + CGRectGetMinY(v64)) * 0.5 - v22 * 0.5;
  }
LABEL_17:
  v40 = PURoundRectToPixel(v61, v18, v20, v22);
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraTopBarGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5
{
  CGFloat height;
  CGFloat width;

  height = a5.height;
  width = a5.width;
  objc_msgSend(a2, "cameraTopBarFrameForReferenceBounds:");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForCameraTopBarFrame:inReferenceBounds:forContentSize:orientation:", a6, *(_QWORD *)&width, *(_QWORD *)&height);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraBottomBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4
{
  objc_msgSend(a2, "cameraBottomBarFrameForReferenceBounds:");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", a5);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5
{
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "cameraContentGeometryForReferenceBounds:forContentSize:withOrientation:shouldShiftPreviewForUtilityBar:", a6, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)cameraContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5 shouldShiftPreviewForUtilityBar:(int64_t)a6
{
  _BOOL8 v7;
  double height;
  double width;
  double v10;
  double v11;
  double y;
  double x;
  BOOL v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  __int128 v25;
  CGFloat v26;
  CGFloat v27;
  CGAffineTransform v28;

  v7 = a7;
  height = a5.height;
  width = a5.width;
  v10 = a4.size.height;
  v11 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  memset(&v28, 0, sizeof(v28));
  PUReviewScreenAffineTransformForOrientation(&v28, a6);
  v16 = height == 0.0 || width == 0.0;
  v17 = width / height;
  if (v16)
    v17 = 1.0;
  objc_msgSend(a2, "cameraContentFrameForContentAspectRatio:referenceBounds:shouldShiftPreviewForUtilityBar:", v7, v17, x, y, v11, v10);
  v19 = v18;
  v21 = v20;
  v22 = *MEMORY[0x1E0C9D538];
  v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)UIRectGetCenter();
  v25 = *(_OWORD *)&v28.c;
  *(_OWORD *)&retstr->var2.a = *(_OWORD *)&v28.a;
  *(_OWORD *)&retstr->var2.c = v25;
  *(_OWORD *)&retstr->var2.tx = *(_OWORD *)&v28.tx;
  retstr->var1.x = v26;
  retstr->var1.y = v27;
  retstr->var0.origin.x = v22;
  retstr->var0.origin.y = v23;
  retstr->var0.size.width = v19;
  retstr->var0.size.height = v21;
  return result;
}

+ (double)_reviewScreenTopBarHeightForSizeSpec:(id *)a3
{
  double result;
  unint64_t var1;
  BOOL v6;
  uint64_t v7;
  $015D2AA2D21426A443873F5C96699A92 v9;

  v9 = *a3;
  objc_msgSend(a1, "_cameraTopBarHeightForSizeSpec:", &v9);
  if (result == 0.0)
    result = 98.0;
  var1 = a3->var1;
  v6 = var1 > 5;
  v7 = (1 << var1) & 0x32;
  if (!v6 && v7 != 0)
    return 105.0;
  return result;
}

+ (CGRect)reviewScreenTopBarFrameForReferenceBounds:(CGRect)a3
{
  double height;
  double width;
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
  _QWORD v17[3];
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  *(double *)v17 = width;
  *(double *)&v17[1] = height;
  v17[2] = PUReviewScreenSizeClassForReferenceSize(width, height);
  objc_msgSend(a1, "_reviewScreenTopBarHeightForSizeSpec:", v17);
  v13 = v12;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (double)_reviewScreenControlBarHeightForSizeSpec:(id *)a3
{
  double v5;
  double v6;
  double v7;
  $015D2AA2D21426A443873F5C96699A92 v9;

  if (!a3->var1)
    return 141.0;
  v9 = *a3;
  objc_msgSend(a1, "_cameraBottomBarHeightForSizeSpec:", &v9);
  v6 = v5;
  v9 = *a3;
  objc_msgSend(a1, "_layoutMarginInsetsForSizeSpec:", &v9);
  return v6 + v7;
}

+ (double)_reviewScreenControlBarWidthForSizeSpec:(id *)a3
{
  double result;
  $015D2AA2D21426A443873F5C96699A92 v4;

  v4 = *a3;
  objc_msgSend(a1, "_cameraBottomBarWidthForSizeSpec:", &v4);
  return result;
}

+ (CGRect)reviewScreenControlBarFrameForReferenceBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v25 = width;
  v26 = height;
  v27 = v8;
  objc_msgSend(a1, "_reviewScreenControlBarHeightForSizeSpec:", &v25);
  v18 = v17;
  v25 = width;
  v26 = height;
  v27 = v8;
  objc_msgSend(a1, "_reviewScreenControlBarWidthForSizeSpec:", &v25);
  v20 = v19;
  if (v18 == 0.0)
  {
    v28.origin.x = v10;
    v28.origin.y = v12;
    v28.size.width = v14;
    v28.size.height = v16;
    v10 = CGRectGetMaxX(v28) - v20;
    v14 = v20;
  }
  else if (v19 == 0.0)
  {
    v29.origin.x = v10;
    v29.origin.y = v12;
    v29.size.width = v14;
    v29.size.height = v16;
    v12 = CGRectGetMaxY(v29) - v18;
    v16 = v18;
  }
  v21 = v10;
  v22 = v12;
  v23 = v14;
  v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (double)_reviewScreenScrubberBarHeightForSizeClass:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 7)
  {
    if (PUPixelWidth_onceToken != -1)
      dispatch_once(&PUPixelWidth_onceToken, &__block_literal_global_1);
    return *(double *)&PUPixelWidth_pixelWidth + 47.5;
  }
  return result;
}

+ (CGRect)reviewScreenScrubberBarFrameForReferenceBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a1, "reviewScreenScrubberBarFrameForReferenceBounds:safeAreaInsets:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)reviewScreenScrubberBarFrameForReferenceBounds:(CGRect)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double bottom;
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect result;

  bottom = a4.bottom;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = PUReviewScreenSizeClassForReferenceSize(a3.size.width, a3.size.height);
  objc_msgSend(a1, "_orientedBoundsForReferenceBounds:sizeClass:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "_reviewScreenScrubberBarHeightForSizeClass:", v10);
  v20 = v19;
  v21 = bottom + v19;
  v26.origin.x = v12;
  v26.origin.y = v14;
  v26.size.width = v16;
  v26.size.height = v18;
  v22 = CGRectGetMaxY(v26) - v20;
  v23 = v12;
  v24 = v16;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v22;
  result.origin.x = v23;
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenContentGeometryForReferenceBounds:(SEL)a3 forContentSize:(CGRect)a4 withOrientation:(CGSize)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double y;
  double x;
  unint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  double v30;
  CGFloat v31;
  CGPoint v32;
  CGFloat v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  float64x2_t v38;
  double v39;
  CGAffineTransform v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  CGAffineTransform v44;

  height = a5.height;
  width = a5.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = PUReviewScreenSizeClassForReferenceSize(a4.size.width, a4.size.height);
  v16 = v15 < 6;
  v17 = (unint64_t)(a6 - 3) < 2;
  v18 = v17 && v16;
  if (v17 && v16)
    v19 = width;
  else
    v19 = height;
  if (v17 && v16)
    v20 = height;
  else
    v20 = width;
  v21 = v19 == 0.0 || v20 == 0.0;
  v22 = v20 / v19;
  if (v21)
    v22 = 1.0;
  objc_msgSend(a2, "cameraContentFrameForContentAspectRatio:referenceBounds:shouldShiftPreviewForUtilityBar:", v15 == 0, v22, x, y, v10, v9);
  v24 = v23;
  v26 = v25;
  v27 = *MEMORY[0x1E0C9D538];
  v28 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)UIRectGetCenter();
  v32.x = v30;
  v32.y = v31;
  if (v18)
  {
    memset(&v44, 0, sizeof(v44));
    v38 = (float64x2_t)v32;
    v39 = v30;
    PUReviewScreenAffineTransformForOrientation(&v44, a6);
    v42 = 0u;
    v43 = 0u;
    v40 = v44;
    v41 = 0u;
    result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_transformForRotationAboutCenterOfReferenceBounds:withOrientationTransform:", &v40, x, y, v10, v9);
    v32 = (CGPoint)vaddq_f64(v43, vmlaq_n_f64(vmulq_laneq_f64(v42, v38, 1), v41, v39));
    v33 = v26;
  }
  else
  {
    v33 = v24;
    v24 = v26;
  }
  retstr->var0.origin.x = v27;
  retstr->var0.origin.y = v28;
  retstr->var0.size.width = v33;
  retstr->var0.size.height = v24;
  v34 = MEMORY[0x1E0C9BAA8];
  v35 = *MEMORY[0x1E0C9BAA8];
  v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  retstr->var1 = v32;
  *(_OWORD *)&retstr->var2.a = v35;
  v37 = *(_OWORD *)(v34 + 32);
  *(_OWORD *)&retstr->var2.c = v36;
  *(_OWORD *)&retstr->var2.tx = v37;
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenTopBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4
{
  objc_msgSend(a2, "reviewScreenTopBarFrameForReferenceBounds:");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", a5);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenControlBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4
{
  objc_msgSend(a2, "reviewScreenControlBarFrameForReferenceBounds:");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", a5);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenScrubberBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4
{
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)reviewScreenScrubberBarGeometryForReferenceBounds:(SEL)a3 withOrientation:(CGRect)a4 safeAreaInsets:(int64_t)a5
{
  objc_msgSend(a2, "reviewScreenScrubberBarFrameForReferenceBounds:safeAreaInsets:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6.top, a6.left, a6.bottom, a6.right);
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", a5);
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBarFrame:(SEL)a3 inReferenceBounds:(CGRect)a4 orientation:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  __int128 v19;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  CGPoint v21;
  __int128 v22;
  __int128 v23;
  CGFloat v24;
  float64x2_t v25;
  double v26;
  CGAffineTransform v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  CGAffineTransform v31;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v15 = *MEMORY[0x1E0C9D538];
  v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  UIRectGetCenter();
  v24 = v18;
  v26 = v17;
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v31.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v31.c = v19;
  *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)PUReviewScreenSizeClassForReferenceSize(width, height);
  v21.x = v26;
  v21.y = v24;
  if ((~(_BYTE)result & 6) != 0)
  {
    v25 = (float64x2_t)v21;
    PUReviewScreenAffineTransformForOrientation(&v31, a6);
    v29 = 0u;
    v30 = 0u;
    v27 = v31;
    v28 = 0u;
    result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_transformForRotationAboutCenterOfReferenceBounds:withOrientationTransform:", &v27, x, y, width, height);
    v21 = (CGPoint)vaddq_f64(v30, vmlaq_n_f64(vmulq_laneq_f64(v29, v25, 1), v28, v26));
  }
  v22 = *(_OWORD *)&v31.a;
  v23 = *(_OWORD *)&v31.tx;
  *(_OWORD *)&retstr->var2.c = *(_OWORD *)&v31.c;
  *(_OWORD *)&retstr->var2.tx = v23;
  retstr->var1 = v21;
  *(_OWORD *)&retstr->var2.a = v22;
  retstr->var0.origin.x = v15;
  retstr->var0.origin.y = v16;
  retstr->var0.size.width = v12;
  retstr->var0.size.height = v11;
  return result;
}

+ ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForCameraTopBarFrame:(SEL)a3 inReferenceBounds:(CGRect)a4 forContentSize:(CGRect)a5 orientation:(CGSize)a6
{
  CGFloat width;
  double height;
  double v9;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  $3B1716E7537CC2F16D6737AAC3CCCADB *result;
  CGPoint v19;
  CGSize v20;
  BOOL v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  __int128 v28;
  __int128 v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat MidY;
  CGRect v35;
  CGPoint v36;
  CGSize v37;
  CGPoint v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  double v42;
  double v43;

  width = a6.width;
  height = a5.size.height;
  v9 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4.size.height;
  v13 = a4.size.width;
  v14 = a4.origin.y;
  v15 = a4.origin.x;
  result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)PUReviewScreenSizeClassForReferenceSize(a5.size.width, a5.size.height);
  if (result == ($3B1716E7537CC2F16D6737AAC3CCCADB *)7)
  {
    retstr->var1 = (CGPoint)xmmword_1AB0F00B0;
    *(_OWORD *)&retstr->var2.a = unk_1AB0F00C0;
    *(_OWORD *)&retstr->var2.c = xmmword_1AB0F00D0;
    *(_OWORD *)&retstr->var2.tx = unk_1AB0F00E0;
    v19 = (CGPoint)PUReviewScreenGeometryZero;
    v20 = (CGSize)unk_1AB0F00A0;
LABEL_11:
    retstr->var0.origin = v19;
    retstr->var0.size = v20;
    return result;
  }
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  retstr->var0.origin = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var2.a = 1.0;
  retstr->var2.d = 1.0;
  v21 = v43 == 0.0 || v42 == 0.0;
  v22 = v42 / v43;
  if (v21)
    v22 = 1.0;
  objc_msgSend(a2, "cameraContentFrameForContentAspectRatio:referenceBounds:", v22, x, y, v9, height);
  v35.origin.x = v23;
  v35.origin.y = v24;
  v35.size.width = v25;
  v35.size.height = v26;
  v36.x = v9;
  v36.y = height;
  *(_QWORD *)&v37.width = PUReviewScreenSizeClassForReferenceSize(v9, height);
  result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_cameraTopBarHeightForSizeSpec:", &v36);
  if (*(_QWORD *)&width < 3uLL)
  {
    result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)objc_msgSend(a2, "_geometryForBarFrame:inReferenceBounds:orientation:", 1, v15, v14, v13, v12, x, y, v9, height);
    v28 = v39;
    retstr->var1 = v38;
    *(_OWORD *)&retstr->var2.a = v28;
    v29 = v41;
    *(_OWORD *)&retstr->var2.c = v40;
    *(_OWORD *)&retstr->var2.tx = v29;
    v19 = v36;
    v20 = v37;
    goto LABEL_11;
  }
  if (*(_QWORD *)&width == 3)
  {
    retstr->var0.origin.x = 0.0;
    retstr->var0.origin.y = 0.0;
    retstr->var0.size.width = v13;
    retstr->var0.size.height = v12;
    v33 = CGRectGetMaxX(v35) + -8.0 + v27 * -0.5;
    MidY = CGRectGetMidY(v35);
    retstr->var1.x = v33;
    retstr->var1.y = MidY;
    v32 = 1.57079633;
    return ($3B1716E7537CC2F16D6737AAC3CCCADB *)CGAffineTransformMakeRotation(&retstr->var2, v32);
  }
  if (*(_QWORD *)&width == 4)
  {
    retstr->var0.origin.x = 0.0;
    retstr->var0.origin.y = 0.0;
    retstr->var0.size.width = v13;
    retstr->var0.size.height = v12;
    v30 = v27 * 0.5 + CGRectGetMinX(v35) + 8.0;
    v31 = CGRectGetMidY(v35);
    retstr->var1.x = v30;
    retstr->var1.y = v31;
    v32 = -1.57079633;
    return ($3B1716E7537CC2F16D6737AAC3CCCADB *)CGAffineTransformMakeRotation(&retstr->var2, v32);
  }
  return result;
}

+ (CGRect)_portraitBoundsForReferenceBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = fmin(a3.size.width, a3.size.height);
  v6 = fmax(a3.size.width, a3.size.height);
  v7 = v5;
  result.size.height = v6;
  result.size.width = v7;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGAffineTransform)_transformForRotationAboutCenterOfReferenceBounds:(SEL)a3 withOrientationTransform:(CGRect)a4
{
  double y;
  uint64_t v8;
  __int128 v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGFloat v16;
  CGFloat v17;
  __int128 v18;
  CGAffineTransform *result;
  __int128 v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v25;

  y = a4.origin.y;
  v8 = MEMORY[0x1E0C9BAA8];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  objc_msgSend(a2, "_portraitBoundsForReferenceBounds:", a4.origin.x, y);
  UIRectGetCenter();
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeTranslation(&v25, -v10, -v11);
  v12 = *(_OWORD *)&v25.a;
  v13 = *(_OWORD *)&v25.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v25.a;
  *(_OWORD *)&retstr->c = v13;
  v14 = *(_OWORD *)&v25.tx;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v25.tx;
  *(_OWORD *)&t1.a = v12;
  *(_OWORD *)&t1.c = v13;
  *(_OWORD *)&t1.tx = v14;
  v15 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t2.c = v15;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(retstr, &t1, &t2);
  UIRectGetCenter();
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeTranslation(&t1, v16, v17);
  v18 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v18;
  *(_OWORD *)&v22.tx = *(_OWORD *)&retstr->tx;
  v21 = t1;
  result = CGAffineTransformConcat(&t2, &v22, &v21);
  v20 = *(_OWORD *)&t2.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
  return result;
}

+ (CGRect)_orientedBoundsForReferenceBounds:(CGRect)result sizeClass:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 <= 6)
    objc_msgSend(a1, "_portraitBoundsForReferenceBounds:", result.origin.x, result.origin.y, result.size.width, result.size.height, v4, v5);
  return result;
}

@end

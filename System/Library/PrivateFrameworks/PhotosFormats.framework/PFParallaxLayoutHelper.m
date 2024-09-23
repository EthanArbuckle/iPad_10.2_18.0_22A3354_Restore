@implementation PFParallaxLayoutHelper

- (double)initWithPosterClassification:(double)a3 initialRect:(double)a4 imageSize:(double)a5 effectiveAcceptableRect:(double)a6 effectivePreferredRect:(double)a7 validBoundsNormalized:(uint64_t)a8 headroomFeasible:(uint64_t)a9 hasTopEdgeContact:(char)a10 layoutType:(char)a11 layoutConfiguration:(uint64_t)a12
{
  id v35;
  double *v36;
  double v37;
  double v38;
  void *v39;
  objc_super v43;

  v35 = a13;
  v43.receiver = a1;
  v43.super_class = (Class)PFParallaxLayoutHelper;
  v36 = (double *)objc_msgSendSuper2(&v43, sel_init);
  *((_QWORD *)v36 + 2) = a9;
  v36[7] = a2;
  v36[8] = a3;
  v36[9] = a4;
  v36[10] = a5;
  v36[5] = a6;
  v36[6] = a7;
  v37 = *MEMORY[0x1E0C9D538];
  v38 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v36[11] = *MEMORY[0x1E0C9D538] + a24 * a6;
  v36[12] = v38 + a25 * a7;
  v36[13] = a6 * a26;
  v36[14] = a7 * a27;
  v36[15] = v37 + a16 * a6;
  v36[16] = v38 + a17 * a7;
  v36[17] = a6 * a18;
  v36[18] = a7 * a19;
  v36[19] = v37 + a20 * a6;
  v36[20] = v38 + a21 * a7;
  v36[21] = a6 * a22;
  v36[22] = a7 * a23;
  v39 = (void *)*((_QWORD *)v36 + 4);
  *((_QWORD *)v36 + 4) = v35;

  *((_QWORD *)v36 + 3) = a12;
  *((_BYTE *)v36 + 8) = a10;
  *((_BYTE *)v36 + 9) = a11;
  return v36;
}

- (CGSize)extendedImageSize
{
  double width;
  double v3;
  CGSize result;

  width = self->_originalImageSize.width;
  v3 = self->_originalImageSize.height * 1.35;
  result.height = v3;
  result.width = width;
  return result;
}

- (CGSize)imageSizeWithHeadroomStrategy:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3)
  {
    if (a3 == 2)
    {
      -[PFParallaxLayoutHelper extendedImageSize](self, "extendedImageSize");
    }
    else if (a3 == 1)
    {
      -[PFParallaxLayoutHelper originalImageSize](self, "originalImageSize");
    }
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)unsafeAreaInImageSpaceWithVisibleFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unsafeRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = x + v9 * width;
  v17 = y + v11 * height;
  v18 = width * v13;
  v19 = height * v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (double)computeCropScoreForIntermediate:(id)a3
{
  id v4;
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
  unint64_t v17;
  unint64_t v18;
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
  uint64_t v30;
  double result;

  v4 = a3;
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", objc_msgSend(v4, "headroomStrategy"));
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "visibleRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = (unint64_t)v6;
  v18 = (unint64_t)v8;
  -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[PFParallaxLayoutHelper pixelEffectivePreferred](self, "pixelEffectivePreferred");
  +[PFCropUtilities scoreForCropRect:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:](PFCropUtilities, "scoreForCropRect:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:", v17, v18, v10, v12, v14, v16, v20, v22, v24, v26, v27, v28, v29, v30);
  return result;
}

- (BOOL)canInflate
{
  unint64_t v3;

  v3 = -[PFParallaxLayoutHelper classification](self, "classification");
  if (v3 != 1)
    LOBYTE(v3) = -[PFParallaxLayoutHelper classification](self, "classification") == 2;
  return v3;
}

- (id)intermediateWithZoomStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PFParallaxIntermediateLayout *v11;
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
  PFParallaxIntermediateLayout *v24;
  double v25;
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
  double MaxY;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  BOOL v47;
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
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v78;
  double v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v6 = a4;
  objc_msgSend(v6, "visibleRect");
  v11 = 0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_53;
    case 1uLL:
      objc_msgSend(v6, "visibleRect");
      goto LABEL_13;
    case 2uLL:
      objc_msgSend(v6, "visibleRect");
      if (v12 >= 1.0)
      {
        -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
        if (v13 >= 1.0)
        {
          -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
          v30 = v29;
          objc_msgSend(v6, "visibleRect");
          v32 = v30 / v31;
          +[PFParallaxLayoutHelper targetZoomPercentWithLayoutType:](PFParallaxLayoutHelper, "targetZoomPercentWithLayoutType:", self->_layoutType);
          v18 = v33 / v32;
          -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
          v19 = v34 + v35 * 0.5;
          goto LABEL_23;
        }
      }
      objc_msgSend(v6, "visibleRect");
      if (v14 >= 1.0)
        goto LABEL_52;
      goto LABEL_10;
    case 3uLL:
      objc_msgSend(v6, "visibleRect");
      if (v15 < 1.0
        || (-[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable"), v16 < 1.0))
      {
        objc_msgSend(v6, "visibleRect");
        if (v17 < 1.0)
LABEL_10:
          _PFAssertContinueHandler();
        goto LABEL_52;
      }
      -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
      MaxY = CGRectGetMaxY(v80);
      if (-[PFParallaxLayoutHelper canInflate](self, "canInflate"))
      {
        v37 = (void *)objc_opt_class();
        -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
        objc_msgSend(v37, "inflatePersonFaceRect:");
        MaxY = CGRectGetMaxY(v81);
      }
      -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", objc_msgSend(v6, "headroomStrategy"));
      v39 = v38;
      v40 = (v38 - MaxY) / v38;
      -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeOverlapCheckBottom");
      v44 = 1.0 - (v42 + v43 * 0.5);

      v45 = v44 / v40;
      v46 = (1.0 - v44) / (1.0 - v40);
      v47 = v44 / v40 <= v46;
      if (v44 / v40 < v46)
        v45 = (1.0 - v44) / (1.0 - v40);
      v18 = v45 * 1.03;
      if (v47)
        v19 = 0.0;
      else
        v19 = v39;
LABEL_23:
      if (v18 < 1.0)
        goto LABEL_52;
      goto LABEL_24;
    default:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
LABEL_13:
        v20 = v7;
        v21 = v8;
        v22 = v9;
        v23 = v10;
LABEL_14:
        v24 = [PFParallaxIntermediateLayout alloc];
        objc_msgSend(v6, "inactiveRect");
        v11 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v24, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", a3, objc_msgSend(v6, "overlapStrategy"), objc_msgSend(v6, "parallaxStrategy"), objc_msgSend(v6, "inactiveStrategy"), objc_msgSend(v6, "headroomStrategy"), v20, v21, v22, v23, v25, v26, v27, v28);
        goto LABEL_53;
      }
      v18 = 1.0;
      v19 = 0.0;
LABEL_24:
      +[PFParallaxLayoutHelper targetZoomFactorLimitWithLayoutType:](PFParallaxLayoutHelper, "targetZoomFactorLimitWithLayoutType:", self->_layoutType);
      if (v18 >= v48)
        v18 = v48;
      objc_msgSend(v6, "visibleRect");
      v49 = 1.0 / v18;
      v22 = v50 * (1.0 / v18);
      v23 = v51 * v49;
      -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
      v54 = v52 + v53 * 0.5;
      objc_msgSend(v6, "visibleRect");
      v57 = v55 + v56 * 0.5 - v19;
      objc_msgSend(v6, "visibleRect");
      v78 = v19 + v57 / v58 * v23 + v23 * -0.5;
      v79 = v54 + v22 * -0.5;
      -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", objc_msgSend(v6, "headroomStrategy"));
      v60 = v59;
      v62 = v61;
      -[PFParallaxLayoutHelper pixelValidBounds](self, "pixelValidBounds");
      v64 = v63;
      v66 = v65;
      v68 = v67;
      v70 = v69;
      if (objc_msgSend(v6, "headroomStrategy") == 2
        || (v82.origin.x = v64, v82.origin.y = v66, v82.size.width = v68, v82.size.height = v70, CGRectIsNull(v82)))
      {
        v64 = 0.0;
        v66 = 0.0;
      }
      else
      {
        v60 = v68;
        v62 = v70;
      }
      v71 = v23 + v78;
      if (v22 + v79 >= v64 + v60)
        v72 = v64 + v60;
      else
        v72 = v22 + v79;
      if (v64 >= v72)
        v72 = v64;
      if (v71 >= v66 + v62)
        v73 = v66 + v62;
      else
        v73 = v23 + v78;
      if (v66 >= v73)
        v73 = v66;
      v74 = v79 + v72 - (v22 + v79);
      v75 = v78 + v73 - v71;
      if (v74 >= v64 + v60)
        v74 = v64 + v60;
      if (v64 >= v74)
        v20 = v64;
      else
        v20 = v74;
      if (v75 >= v66 + v62)
        v76 = v66 + v62;
      else
        v76 = v75;
      if (v66 >= v76)
        v21 = v66;
      else
        v21 = v76;
      v83.origin.x = v64;
      v83.origin.y = v66;
      v83.size.width = v60;
      v83.size.height = v62;
      v84.origin.x = v20;
      v84.origin.y = v21;
      v84.size.width = v22;
      v84.size.height = v23;
      if (CGRectContainsRect(v83, v84))
        goto LABEL_14;
LABEL_52:
      v11 = 0;
LABEL_53:

      return v11;
  }
}

- (id)bestLayout:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL4 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  double v40;
  id v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  void *v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    _PFAssertFailHandler();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cropScore");
  v7 = v6;
  v8 = v5;
  -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clockOverlapAcceptabilityForLayoutConfiguration:inflated:", v9, 1);
  v11 = v10;

  -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clockOverlapAcceptabilityForLayoutConfiguration:inflated:", v12, 0);
  v48 = v13;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  v46 = v8;
  v16 = v8;
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v50;
    v19 = 0.5;
    v47 = v7;
    v16 = v8;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v20);
        if (v7 >= v19 || objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v20), "zoomStrategy") == 1)
        {
          objc_msgSend(v21, "cropScore");
          if (v22 >= 0.45 || v7 <= 0.45)
          {
            -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "clockOverlapAcceptabilityForLayoutConfiguration:inflated:", v23, 1);
            v25 = v24;

            -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "clockOverlapAcceptabilityForLayoutConfiguration:inflated:", v26, 0);
            v28 = v27;

            v29 = vabdd_f64(v25, v11);
            v30 = v48;
            v31 = vabdd_f64(v28, v48) <= 0.00000999999975 && v29 <= 0.00000999999975;
            objc_msgSend(v21, "layoutScore");
            v33 = v32;
            objc_msgSend(v16, "layoutScore");
            v35 = v34;
            v36 = v33 > v34;
            v37 = v25 >= v19;
            v38 = v11 >= v19;
            v22 = 0.5;
            v39 = v28 >= v19;
            if (v25 >= v28)
              v40 = v25;
            else
              v40 = v28;
            if (v11 >= v48)
              v30 = v11;
            if (((v38 ^ v37) & 1) != 0)
            {
LABEL_20:
              if (v37)
                goto LABEL_21;
LABEL_22:
              v7 = v47;
              v19 = 0.5;
              goto LABEL_23;
            }
            if (v25 < 0.5 || (v22 = 0.00000999999975, v29 <= 0.00000999999975))
            {
              v22 = 0.5;
              if (v11 >= 0.5)
              {
                v37 = v36;
                goto LABEL_20;
              }
              v37 = v36;
              if (v25 >= 0.5)
                goto LABEL_20;
              v42 = objc_msgSend(v21, "headroomStrategy");
              if (v42 == objc_msgSend(v16, "headroomStrategy"))
              {
                v22 = v48;
                v37 = v39;
                if (v48 < 0.5 == v28 >= 0.5)
                  goto LABEL_20;
                v43 = v33 > v35;
                if (!v31)
                  v43 = v40 > v30;
                if (!v43)
                  goto LABEL_22;
              }
              else if (objc_msgSend(v21, "headroomStrategy") != 1)
              {
                goto LABEL_22;
              }
            }
            else if (v25 <= v11)
            {
              goto LABEL_22;
            }
LABEL_21:
            v41 = v21;

            v48 = v28;
            v11 = v25;
            v16 = v41;
            goto LABEL_22;
          }
        }
LABEL_23:
        ++v20;
      }
      while (v17 != v20);
      v44 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v53, 16, v22);
      v17 = v44;
    }
    while (v44);
  }

  return v16;
}

- (id)intermediateWithOverlapStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6;
  void *v7;
  PFParallaxIntermediateLayout *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MaxY;
  void *v18;
  double MinY;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double y;
  double x;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
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
  double v51;
  double v52;
  double v53;
  PFParallaxIntermediateLayout *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v60;
  double height;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_40;
    case 1uLL:
      objc_msgSend(v6, "visibleRect");
      goto LABEL_11;
    case 2uLL:
      objc_msgSend(v6, "visibleRect");
      v10 = v20;
      v12 = v21;
      v14 = v22;
      v16 = v23;
      -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
      MaxY = CGRectGetMaxY(v65);
      if (-[PFParallaxLayoutHelper canInflate](self, "canInflate"))
      {
        v24 = (void *)objc_opt_class();
        -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
        objc_msgSend(v24, "inflatePersonFaceRect:");
        MaxY = CGRectGetMaxY(v66);
      }
      -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeOverlapCheckBottom");
      v27 = v12 + v26 * v16;
      v29 = v16 * v28;

      MinY = v27 + v29 * 0.5;
      goto LABEL_8;
    case 3uLL:
    case 4uLL:
      objc_msgSend(v6, "visibleRect");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
      MaxY = CGRectGetMaxY(v62);
      if (-[PFParallaxLayoutHelper canInflate](self, "canInflate"))
      {
        v18 = (void *)objc_opt_class();
        -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
        objc_msgSend(v18, "inflatePersonFaceRect:");
        MaxY = CGRectGetMaxY(v63);
      }
      -[PFParallaxLayoutHelper unsafeAreaInImageSpaceWithVisibleFrame:](self, "unsafeAreaInImageSpaceWithVisibleFrame:", v10, v12, v14, v16);
      MinY = CGRectGetMinY(v64);
LABEL_8:
      v30 = MaxY - MinY;
      v67.origin.x = v10;
      v67.origin.y = v12;
      v67.size.width = v14;
      v67.size.height = v16;
      v68 = CGRectOffset(v67, 0.0, v30);
LABEL_11:
      x = v68.origin.x;
      y = v68.origin.y;
      height = v68.size.height;
      v33 = objc_msgSend(v7, "headroomStrategy", *(_QWORD *)&v68.size.width);
      break;
    default:
      height = 0.0;
      y = 0.0;
      x = 0.0;
      v33 = objc_msgSend(v6, "headroomStrategy", 0);
      break;
  }
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", v33);
  v35 = v34;
  v37 = v36;
  -[PFParallaxLayoutHelper pixelValidBounds](self, "pixelValidBounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  if (objc_msgSend(v7, "headroomStrategy") == 2
    || (v69.origin.x = v39, v69.origin.y = v41, v69.size.width = v43, v69.size.height = v45, CGRectIsNull(v69)))
  {
    v39 = 0.0;
    v41 = 0.0;
  }
  else
  {
    v35 = v43;
    v37 = v45;
  }
  v46 = height + y;
  if (v60 + x >= v39 + v35)
    v47 = v39 + v35;
  else
    v47 = v60 + x;
  if (v39 >= v47)
    v47 = v39;
  if (v46 >= v41 + v37)
    v48 = v41 + v37;
  else
    v48 = height + y;
  if (v41 >= v48)
    v48 = v41;
  v49 = x + v47 - (v60 + x);
  v50 = y + v48 - v46;
  if (v49 >= v39 + v35)
    v49 = v39 + v35;
  if (v39 >= v49)
    v51 = v39;
  else
    v51 = v49;
  if (v50 >= v41 + v37)
    v52 = v41 + v37;
  else
    v52 = v50;
  if (v41 >= v52)
    v53 = v41;
  else
    v53 = v52;
  v70.origin.x = v39;
  v70.origin.y = v41;
  v70.size.width = v35;
  v70.size.height = v37;
  v71.origin.x = v51;
  v71.origin.y = v53;
  v71.size.width = v60;
  v71.size.height = height;
  if (CGRectContainsRect(v70, v71))
  {
    v54 = [PFParallaxIntermediateLayout alloc];
    objc_msgSend(v7, "inactiveRect");
    v8 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v54, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", objc_msgSend(v7, "zoomStrategy"), a3, objc_msgSend(v7, "parallaxStrategy"), objc_msgSend(v7, "inactiveStrategy"), objc_msgSend(v7, "headroomStrategy"), v51, v53, v60, height, v55, v56, v57, v58);
  }
  else
  {
    v8 = 0;
  }
LABEL_40:

  return v8;
}

- (id)intermediateWithParallaxStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6;
  void *v7;
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
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  double v34;
  double MaxX;
  double MaxY;
  double v37;
  double v38;
  double v39;
  PFParallaxIntermediateLayout *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  PFParallaxLayoutHelper *v46;
  SEL v47;
  unint64_t v48;
  id v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v6 = a4;
  v7 = v6;
  if (!a3)
    goto LABEL_24;
  if (a3 == 2)
  {
    -[PFParallaxLayoutHelper initialRect](self, "initialRect");
    if (v16 < 1.0)
    {
      -[PFParallaxLayoutHelper initialRect](self, "initialRect");
      if (v17 < 1.0)
        _PFAssertContinueHandler();
      a3 = 0;
      goto LABEL_24;
    }
    -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parallaxPaddingPct");
    v50 = v20;
    v51 = v19;

    -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", objc_msgSend(v7, "headroomStrategy"));
    v52 = v22;
    v53 = v21;
    v23 = *MEMORY[0x1E0C9D538];
    v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v7, "visibleRect");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = 0;
    v34 = 0.0;
    while (2)
    {
      switch(v33)
      {
        case 0:
          v54.origin.x = v26;
          v54.origin.y = v28;
          v54.size.width = v30;
          v54.size.height = v32;
          MaxX = -CGRectGetMinX(v54);
          v55.origin.x = v23;
          v55.origin.y = v24;
          v55.size.height = v52;
          v55.size.width = v53;
          MaxY = -CGRectGetMinX(v55);
          goto LABEL_13;
        case 1:
          v60.origin.x = v26;
          v60.origin.y = v28;
          v60.size.width = v30;
          v60.size.height = v32;
          MaxX = -CGRectGetMinY(v60);
          v61.origin.x = v23;
          v61.origin.y = v24;
          v61.size.height = v52;
          v61.size.width = v53;
          MaxY = -CGRectGetMinY(v61);
          goto LABEL_16;
        case 2:
          v56.origin.x = v26;
          v56.origin.y = v28;
          v56.size.width = v30;
          v56.size.height = v32;
          MaxX = CGRectGetMaxX(v56);
          v57.origin.x = v23;
          v57.origin.y = v24;
          v57.size.height = v52;
          v57.size.width = v53;
          MaxY = CGRectGetMaxX(v57);
LABEL_13:
          v37 = v30;
          v38 = v51;
          goto LABEL_17;
        case 3:
          v58.origin.x = v26;
          v58.origin.y = v28;
          v58.size.width = v30;
          v58.size.height = v32;
          MaxX = CGRectGetMaxY(v58);
          v59.origin.x = v23;
          v59.origin.y = v24;
          v59.size.height = v52;
          v59.size.width = v53;
          MaxY = CGRectGetMaxY(v59);
LABEL_16:
          v37 = v32;
          v38 = v50;
LABEL_17:
          if (MaxX + v37 * v38 > MaxY)
          {
            v39 = (MaxX - (MaxY + v38 * (MaxX - v37)) / (v38 + 1.0)) / v37;
            if (v39 > v34)
              v34 = v39;
          }
          if (++v33 != 4)
            continue;
          v62.origin.x = v26;
          v62.origin.y = v28;
          v62.size.width = v30;
          v62.size.height = v32;
          *(CGRect *)&v12 = CGRectInset(v62, v30 * v34, v32 * v34);
          break;
        default:
          v46 = (PFParallaxLayoutHelper *)_PFAssertFailHandler();
          return -[PFParallaxLayoutHelper intermediateWithInactiveStrategy:intermediate:](v46, v47, v48, v49);
      }
      goto LABEL_22;
    }
  }
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  if (a3 == 1)
  {
    objc_msgSend(v6, "visibleRect");
LABEL_22:
    v11 = v12;
    v10 = v13;
    v9 = v14;
    v8 = v15;
  }
  v40 = [PFParallaxIntermediateLayout alloc];
  objc_msgSend(v7, "inactiveRect");
  a3 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v40, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", objc_msgSend(v7, "zoomStrategy"), objc_msgSend(v7, "overlapStrategy"), a3, objc_msgSend(v7, "inactiveStrategy"), objc_msgSend(v7, "headroomStrategy"), v11, v10, v9, v8, v41, v42, v43, v44);
LABEL_24:

  return (id)a3;
}

- (id)intermediateWithInactiveStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  PFParallaxIntermediateLayout *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  __int128 v46;
  __int128 v47;

  v6 = a4;
  objc_msgSend(v6, "visibleRect");
  v11 = v10;
  v46 = 0u;
  v47 = 0u;
  if (a3)
  {
    v12 = v7;
    v13 = v8;
    v14 = v9;
    if (a3 == 2)
    {
      -[PFParallaxLayoutHelper originalImageSize](self, "originalImageSize");
      v40 = v20;
      v41 = v19;
      -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
      v44 = v22;
      v45 = v21;
      v42 = v24;
      v43 = v23;
      -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "unsafeRect");
      +[PFParallaxLayoutUtilities computeInactiveAvoidingRectForVisibleRect:acceptableFrame:unsafeRect:imageSize:considerHeadroom:newVisibleRect:](PFParallaxLayoutUtilities, "computeInactiveAvoidingRectForVisibleRect:acceptableFrame:unsafeRect:imageSize:considerHeadroom:newVisibleRect:", objc_msgSend(v6, "headroomStrategy") == 2, &v46, v11, v12, v13, v14, v45, v44, v43, v42, v26, v27, v28, v29, v41, v40);
      *(_QWORD *)&v46 = v30;
      *((_QWORD *)&v46 + 1) = v31;
      *(_QWORD *)&v47 = v32;
      *((_QWORD *)&v47 + 1) = v33;

    }
    else if (a3 == 1)
    {
      objc_msgSend(v6, "visibleRect");
      *(_QWORD *)&v46 = v15;
      *((_QWORD *)&v46 + 1) = v16;
      *(_QWORD *)&v47 = v17;
      *((_QWORD *)&v47 + 1) = v18;
    }
    v34 = [PFParallaxIntermediateLayout alloc];
    v35 = objc_msgSend(v6, "zoomStrategy");
    v36 = objc_msgSend(v6, "overlapStrategy");
    v37 = objc_msgSend(v6, "parallaxStrategy");
    v38 = objc_msgSend(v6, "headroomStrategy");
    a3 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v34, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", v35, v36, v37, a3, v38, v11, v12, v13, v14, v46, v47);
  }

  return (id)a3;
}

- (id)intermediateWithHeadroomStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6;
  void *v7;
  PFParallaxIntermediateLayout *v8;
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
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  PFParallaxIntermediateLayout *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  PFParallaxIntermediateLayout *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  BOOL v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  PFParallaxIntermediateLayout *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v81;
  double v82;
  __int16 v83;
  double v84;
  __int16 v85;
  uint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 == 2)
  {
    objc_msgSend(v6, "visibleRect");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48 * 1.35;
    -[PFParallaxLayoutHelper originalImageSize](self, "originalImageSize");
    if (v49 >= v50)
    {
      objc_msgSend(v7, "visibleRect");
      v59 = v57;
      v60 = v58;
      if (v57 == 0.0
        || v58 == 0.0
        || (v57 == *MEMORY[0x1E0D71130] ? (v61 = v58 == *(double *)(MEMORY[0x1E0D71130] + 8)) : (v61 = 0), v61))
      {
        v62 = 1.0;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          v81 = 134218496;
          v82 = v59;
          v83 = 2048;
          v84 = v60;
          v85 = 2048;
          v86 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", (uint8_t *)&v81, 0x20u);
        }
      }
      else
      {
        v62 = fabs(v57 / v58);
      }
      -[PFParallaxLayoutHelper originalImageSize](self, "originalImageSize");
      v51 = v63 / v62;
      -[PFParallaxLayoutHelper originalImageSize](self, "originalImageSize");
      v49 = v64;
      objc_msgSend(v7, "visibleRect");
      v55 = v51 - v65;
      v53 = 0.0;
    }
    else
    {
      v51 = v47 * 1.35;
      objc_msgSend(v7, "visibleRect");
      v53 = v43 + v52 * 0.35 * -0.5;
      objc_msgSend(v7, "visibleRect");
      v55 = v54 * 0.35;
      if (v53 < 0.0)
        v53 = 0.0;
    }
    v66 = v45 + v55 * -0.5;
    if (v66 >= 0.0)
      v67 = v66;
    else
      v67 = 0.0;
    v68 = [PFParallaxIntermediateLayout alloc];
    objc_msgSend(v7, "inactiveRect");
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v77 = objc_msgSend(v7, "zoomStrategy");
    v78 = objc_msgSend(v7, "overlapStrategy");
    v79 = objc_msgSend(v7, "parallaxStrategy");
    v28 = objc_msgSend(v7, "inactiveStrategy");
    v29 = v68;
    v30 = v53;
    v31 = v67;
    v32 = v49;
    v33 = v51;
    v34 = v70;
    v35 = v72;
    v36 = v74;
    v37 = v76;
    v38 = v77;
    v39 = v78;
    v40 = v79;
    v41 = 2;
    goto LABEL_23;
  }
  if (a3 == 1)
  {
    v8 = [PFParallaxIntermediateLayout alloc];
    objc_msgSend(v7, "visibleRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "inactiveRect");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = objc_msgSend(v7, "zoomStrategy");
    v26 = objc_msgSend(v7, "overlapStrategy");
    v27 = objc_msgSend(v7, "parallaxStrategy");
    v28 = objc_msgSend(v7, "inactiveStrategy");
    v29 = v8;
    v30 = v10;
    v31 = v12;
    v32 = v14;
    v33 = v16;
    v34 = v18;
    v35 = v20;
    v36 = v22;
    v37 = v24;
    v38 = v25;
    v39 = v26;
    v40 = v27;
    v41 = 1;
LABEL_23:
    v56 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](v29, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", v38, v39, v40, v28, v41, v30, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_24;
  }
  v56 = 0;
LABEL_24:

  return v56;
}

- (id)scoreIntermediate:(id)a3
{
  id v4;
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
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double *v41;
  BOOL v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _BOOL4 v48;
  double v49;
  BOOL v50;
  double v51;
  double v52;
  double v53;
  BOOL v54;
  double v55;
  double v56;
  _BOOL4 v57;
  double v58;
  BOOL v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  BOOL v64;
  double v65;
  _BOOL4 v66;
  double v67;
  BOOL v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  BOOL v74;
  double v75;
  BOOL v76;
  double v77;
  BOOL v78;
  BOOL v79;
  BOOL v80;
  double v81;
  double v82;
  double v83;
  double v84;
  PFParallaxIntermediateLayout *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  PFParallaxIntermediateLayout *v94;
  double r1;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;

  v4 = a3;
  -[PFParallaxLayoutHelper computeCropScoreForIntermediate:](self, "computeCropScoreForIntermediate:", v4);
  v106 = v5;
  objc_msgSend(v4, "visibleRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PFParallaxLayoutHelper unsafeAreaInImageSpaceWithVisibleFrame:](self, "unsafeAreaInImageSpaceWithVisibleFrame:");
  v107 = v15;
  v109 = v14;
  v111 = v16;
  v117 = v17;
  -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeOverlapCheckBottom");
  v104 = v7 + v19 * v11;
  r1 = v9 + v20 * v13;
  v113 = v13 * v22;
  v115 = v11 * v21;

  -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeOverlapCheckTop");
  v100 = v25;
  v102 = v24;
  v97 = v27;
  v98 = v26;

  -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  if (-[PFParallaxLayoutHelper canInflate](self, "canInflate"))
  {
    v36 = (void *)objc_opt_class();
    -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
    objc_msgSend(v36, "inflatePersonFaceRect:");
    v29 = v37;
    v31 = v38;
    v33 = v39;
    v35 = v40;
  }
  v119.origin.x = v104;
  v119.origin.y = r1;
  v119.size.height = v113;
  v119.size.width = v115;
  v125.origin.x = v29;
  v125.origin.y = v31;
  v125.size.width = v33;
  v125.size.height = v35;
  v120 = CGRectIntersection(v119, v125);
  v41 = (double *)MEMORY[0x1E0D71130];
  if (v120.size.width == 0.0
    || v120.size.height == 0.0
    || (v120.size.height == *(double *)(MEMORY[0x1E0D71130] + 8)
      ? (v42 = v120.size.width == *MEMORY[0x1E0D71130])
      : (v42 = 0),
        v42))
  {
    v43 = 0.0;
  }
  else
  {
    v43 = v120.size.width * v120.size.height;
  }
  v105 = v43;
  v44 = v7 + v102 * v11;
  v45 = v9 + v100 * v13;
  v46 = v11 * v98;
  v47 = v13 * v97;
  v48 = v113 == 0.0 || v115 == 0.0;
  v49 = v115 * v113;
  if (v48
    || (v113 == *(double *)(MEMORY[0x1E0D71130] + 8) ? (v50 = v115 == *MEMORY[0x1E0D71130]) : (v50 = 0),
        v51 = v115 * v113,
        v50))
  {
    v51 = 0.0;
  }
  v103 = v51;
  v52 = v46;
  v53 = v13 * v97;
  v126.origin.x = v29;
  v126.origin.y = v31;
  v126.size.width = v33;
  v126.size.height = v35;
  v121 = CGRectIntersection(*(CGRect *)&v44, v126);
  if (v121.size.width == 0.0
    || v121.size.height == 0.0
    || (v121.size.height == v41[1] ? (v54 = v121.size.width == *v41) : (v54 = 0), v54))
  {
    v55 = 0.0;
  }
  else
  {
    v55 = v121.size.width * v121.size.height;
  }
  v101 = v55;
  v56 = v117;
  v57 = v47 == 0.0 || v46 == 0.0;
  if (v57)
  {
    v58 = v46 * v47;
LABEL_39:
    v60 = 0.0;
    goto LABEL_40;
  }
  v59 = v47 == v41[1] && v46 == *v41;
  v58 = v46 * v47;
  v60 = v46 * v47;
  if (v59)
    goto LABEL_39;
LABEL_40:
  v99 = v60;
  v62 = v107;
  v61 = v109;
  v63 = v111;
  v127.origin.x = v29;
  v127.origin.y = v31;
  v127.size.width = v33;
  v127.size.height = v35;
  v122 = CGRectIntersection(*(CGRect *)(&v56 - 3), v127);
  if (v122.size.width == 0.0
    || v122.size.height == 0.0
    || (v122.size.height == v41[1] ? (v64 = v122.size.width == *v41) : (v64 = 0), v64))
  {
    v65 = 0.0;
  }
  else
  {
    v65 = v122.size.width * v122.size.height;
  }
  v66 = v117 == 0.0 || v111 == 0.0;
  if (v66)
  {
    v67 = v111 * v117;
LABEL_58:
    v69 = 0.0;
    goto LABEL_59;
  }
  v68 = v117 == v41[1] && v111 == *v41;
  v67 = v111 * v117;
  v69 = v111 * v117;
  if (v68)
    goto LABEL_58;
LABEL_59:
  -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
  v128.origin.x = v70;
  v128.origin.y = v71;
  v128.size.width = v72;
  v128.size.height = v73;
  v123.origin.y = v107;
  v123.origin.x = v109;
  v123.size.width = v111;
  v123.size.height = v117;
  v124 = CGRectIntersection(v123, v128);
  if (v124.size.width == 0.0
    || v124.size.height == 0.0
    || (v124.size.height == v41[1] ? (v74 = v124.size.width == *v41) : (v74 = 0), v74))
  {
    v75 = 0.0;
  }
  else
  {
    v75 = v124.size.width * v124.size.height;
  }
  if (v66 || (v117 == v41[1] ? (v76 = v111 == *v41) : (v76 = 0), v77 = v67, v76))
    v77 = 0.0;
  if (v48 || (v113 == v41[1] ? (v78 = v115 == *v41) : (v78 = 0), v78))
    v49 = 0.0;
  if (v57 || (v47 == v41[1] ? (v79 = v46 == *v41) : (v79 = 0), v79))
    v58 = 0.0;
  if (v66 || (v117 == v41[1] ? (v80 = v111 == *v41) : (v80 = 0), v80))
    v67 = 0.0;
  if (v58 >= 1.0)
    v81 = v101 / v99;
  else
    v81 = 1.0;
  if (v49 >= 1.0)
    v82 = v105 / v103;
  else
    v82 = 1.0;
  if (v67 >= 1.0)
    v83 = v65 / v69;
  else
    v83 = 1.0;
  v118 = v75 / v77;
  -[PFParallaxLayoutHelper scoreAdjustmentWithUnscoredIntermediate:unsafeAreaOverlap:timeBottomOverlap:timeTopOverlap:](self, "scoreAdjustmentWithUnscoredIntermediate:unsafeAreaOverlap:timeBottomOverlap:timeTopOverlap:", v4, v83, v82, v81);
  v116 = (v106 + v84) * 0.5;
  v85 = [PFParallaxIntermediateLayout alloc];
  objc_msgSend(v4, "visibleRect");
  v112 = v87;
  v114 = v86;
  v108 = v89;
  v110 = v88;
  objc_msgSend(v4, "inactiveRect");
  v94 = -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:](v85, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:", objc_msgSend(v4, "zoomStrategy"), objc_msgSend(v4, "overlapStrategy"), objc_msgSend(v4, "parallaxStrategy"), objc_msgSend(v4, "inactiveStrategy"), objc_msgSend(v4, "headroomStrategy"), -[PFParallaxLayoutHelper hasTopEdgeContact](self, "hasTopEdgeContact"), v114, v112, v110, v108, v90, v91, v92, v93, *(_QWORD *)&v106, *(_QWORD *)&v116,
          *(_QWORD *)&v82,
          *(_QWORD *)&v81,
          *(_QWORD *)&v83,
          *(_QWORD *)&v118);

  return v94;
}

- (double)scoreAdjustmentWithUnscoredIntermediate:(id)a3 unsafeAreaOverlap:(double)a4 timeBottomOverlap:(double)a5 timeTopOverlap:(double)a6
{
  id v9;
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
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  float v37;
  double v38;
  double v39;
  double v40;
  double v42;

  v9 = a3;
  +[PFParallaxLayoutHelper scoreBonusZoomTargetWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusZoomTargetWithLayoutType:", self->_layoutType);
  v11 = v10;
  +[PFParallaxLayoutHelper scoreBonusZoomHeadroomWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusZoomHeadroomWithLayoutType:", self->_layoutType);
  v13 = v12;
  +[PFParallaxLayoutHelper scoreBonusZoomNoneWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusZoomNoneWithLayoutType:", self->_layoutType);
  v15 = v14;
  +[PFParallaxLayoutHelper scoreBonusOverlapAvoid](PFParallaxLayoutHelper, "scoreBonusOverlapAvoid");
  v17 = v16;
  +[PFParallaxLayoutHelper scoreBonusOverlapTargetWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusOverlapTargetWithLayoutType:", self->_layoutType);
  v19 = v18;
  +[PFParallaxLayoutHelper scoreBonusInactiveWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusInactiveWithLayoutType:", self->_layoutType);
  v42 = v20;
  v21 = 0.0;
  if (objc_msgSend(v9, "zoomStrategy") == 2)
  {
    +[PFParallaxLayoutHelper scoreBonusZoomTargetWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusZoomTargetWithLayoutType:", self->_layoutType);
    v21 = v22 + 0.0;
  }
  if (objc_msgSend(v9, "zoomStrategy") == 3)
  {
    +[PFParallaxLayoutHelper scoreBonusZoomHeadroomWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusZoomHeadroomWithLayoutType:", self->_layoutType);
    v21 = v21 + v23;
  }
  if (objc_msgSend(v9, "zoomStrategy") == 1)
  {
    +[PFParallaxLayoutHelper scoreBonusZoomNoneWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusZoomNoneWithLayoutType:", self->_layoutType);
    v21 = v21 + v24;
  }
  if (objc_msgSend(v9, "overlapStrategy") == 3)
  {
    +[PFParallaxLayoutHelper scoreBonusOverlapAvoid](PFParallaxLayoutHelper, "scoreBonusOverlapAvoid");
    v21 = v21 + v25 * (1.0 - a4);
  }
  v26 = objc_msgSend(v9, "overlapStrategy");
  if (a5 > 0.0 && v26 == 2)
  {
    +[PFParallaxLayoutTextOverlapParameters systemParameters](PFParallaxLayoutTextOverlapParameters, "systemParameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "maxBottomOverlap");
    v29 = v28;

    if (v29 > a5)
    {
      +[PFParallaxLayoutHelper scoreBonusOverlapTargetWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusOverlapTargetWithLayoutType:", self->_layoutType);
      v21 = v21 + v30;
    }
  }
  if (objc_msgSend(v9, "inactiveStrategy") == 2)
  {
    +[PFParallaxLayoutHelper scoreBonusInactiveWithLayoutType:](PFParallaxLayoutHelper, "scoreBonusInactiveWithLayoutType:", self->_layoutType);
    v21 = v21 + v31;
  }
  if (objc_msgSend(v9, "headroomStrategy") == 2 && self->_layoutType == 1)
  {
    -[PFParallaxLayoutHelper originalImageSize](self, "originalImageSize");
    v33 = v32;
    -[PFParallaxLayoutHelper originalImageSize](self, "originalImageSize");
    v35 = v34;
    -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFParallaxLayoutUtilities headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:](PFParallaxLayoutUtilities, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v9, v36, 0.0, 0.0, v33, v35);
    v21 = v21 - v37;

  }
  if (v11 >= v13)
    v38 = v11;
  else
    v38 = v13;
  if (v38 < v15)
    v38 = v15;
  if (v17 >= v19)
    v39 = v17;
  else
    v39 = v19;
  v40 = v21 / (v38 + v39 + v42);

  return v40;
}

- (unint64_t)classification
{
  return self->_classification;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (CGRect)initialRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialRect.origin.x;
  y = self->_initialRect.origin.y;
  width = self->_initialRect.size.width;
  height = self->_initialRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)originalImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_originalImageSize.width;
  height = self->_originalImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)headroomFeasible
{
  return self->_headroomFeasible;
}

- (BOOL)hasTopEdgeContact
{
  return self->_hasTopEdgeContact;
}

- (CGRect)pixelValidBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pixelValidBounds.origin.x;
  y = self->_pixelValidBounds.origin.y;
  width = self->_pixelValidBounds.size.width;
  height = self->_pixelValidBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)pixelEffectiveAcceptable
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pixelEffectiveAcceptable.origin.x;
  y = self->_pixelEffectiveAcceptable.origin.y;
  width = self->_pixelEffectiveAcceptable.size.width;
  height = self->_pixelEffectiveAcceptable.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)pixelEffectivePreferred
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pixelEffectivePreferred.origin.x;
  y = self->_pixelEffectivePreferred.origin.y;
  width = self->_pixelEffectivePreferred.size.width;
  height = self->_pixelEffectivePreferred.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PFParallaxLayoutConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
}

+ (double)targetZoomPercentWithLayoutType:(unint64_t)a3
{
  double result;

  result = *(double *)&_targetZoomPercent;
  if (a3)
    return 0.1;
  return result;
}

+ (double)targetZoomFactorLimitWithLayoutType:(unint64_t)a3
{
  if (a3 == 2)
    return 1.0;
  if (a3)
    return 1.2;
  return *(double *)&_targetZoomFactorLimit;
}

+ (double)scoreBonusZoomHeadroomWithLayoutType:(unint64_t)a3
{
  double result;

  result = *(double *)&_scoreBonusZoomHeadroom;
  if (a3)
    return 0.0;
  return result;
}

+ (double)scoreBonusZoomTargetWithLayoutType:(unint64_t)a3
{
  double result;

  result = *(double *)&_scoreBonusZoomTarget;
  if (a3)
    return 0.1;
  return result;
}

+ (double)scoreBonusZoomNoneWithLayoutType:(unint64_t)a3
{
  double result;

  result = 0.2;
  if (a3 - 1 >= 2)
    return 0.0;
  return result;
}

+ (double)scoreBonusOverlapTargetWithLayoutType:(unint64_t)a3
{
  double result;

  result = *(double *)&_scoreBonusOverlapTarget;
  if (a3)
    return 0.25;
  return result;
}

+ (double)scoreBonusInactiveWithLayoutType:(unint64_t)a3
{
  double result;

  result = *(double *)&_scoreBonusInactive;
  if (a3)
    return 0.0;
  return result;
}

+ (double)scoreBonusOverlapAvoid
{
  return *(double *)&_scoreBonusOverlapAvoid;
}

+ (void)setTargetZoomPercent:(double)a3
{
  _targetZoomPercent = *(_QWORD *)&a3;
}

+ (void)setTargetZoomFactorLimit:(double)a3
{
  _targetZoomFactorLimit = *(_QWORD *)&a3;
}

+ (void)setScoreBonusZoomTarget:(double)a3
{
  _scoreBonusZoomTarget = *(_QWORD *)&a3;
}

+ (void)setScoreBonusZoomHeadroom:(double)a3
{
  _scoreBonusZoomHeadroom = *(_QWORD *)&a3;
}

+ (void)setScoreBonusOverlapTarget:(double)a3
{
  _scoreBonusOverlapTarget = *(_QWORD *)&a3;
}

+ (void)setScoreBonusOverlapAvoid:(double)a3
{
  _scoreBonusOverlapAvoid = *(_QWORD *)&a3;
}

+ (void)setScoreBonusInactive:(double)a3
{
  _scoreBonusInactive = *(_QWORD *)&a3;
}

+ (CGRect)inflatePersonFaceRect:(CGRect)result
{
  double v3;

  v3 = result.size.height * 1.5;
  result.size.height = v3;
  return result;
}

@end

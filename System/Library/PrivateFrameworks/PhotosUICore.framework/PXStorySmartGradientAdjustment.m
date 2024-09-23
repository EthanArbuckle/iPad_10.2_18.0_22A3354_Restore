@implementation PXStorySmartGradientAdjustment

- (id)applyToImage:(id)a3 targetSize:(CGSize)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
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
  double v26;
  double v27;
  void *v28;
  void *v29;
  CGFloat v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  void *v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CGFloat v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double sy;
  double sx;
  double v95;
  double v96;
  double v97;
  double v98;
  CGAffineTransform v99;
  CGAffineTransform v100;
  CGRect remainder;
  CGRect slice;
  CGAffineTransform v103;
  CGAffineTransform v104;
  CGAffineTransform v105;
  CGAffineTransform v106;
  _QWORD v107[3];
  _QWORD v108[3];
  uint64_t v109;
  _QWORD v110[2];
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;

  v110[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStorySmartGradientAdjustment.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image != nil"));

  }
  objc_msgSend(v6, "extent");
  if (CGRectIsEmpty(v111))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStorySmartGradientAdjustment.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGRectIsEmpty(image.extent)"));

  }
  v7 = v6;
  if (!-[PXStorySmartGradientAdjustment useSimpleBlur](self, "useSimpleBlur"))
  {
    v107[0] = CFSTR("inputWidth");
    v45 = (void *)MEMORY[0x1E0CB37E8];
    -[PXStorySmartGradientAdjustment targetSize](self, "targetSize");
    objc_msgSend(v45, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = v29;
    v107[1] = CFSTR("inputHeight");
    v46 = (void *)MEMORY[0x1E0CB37E8];
    -[PXStorySmartGradientAdjustment targetSize](self, "targetSize");
    objc_msgSend(v46, "numberWithDouble:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v108[1] = v48;
    v107[2] = CFSTR("inputReturnSmartColor");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PXStorySmartGradientAdjustment useSmartColor](self, "useSmartColor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v108[2] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageByApplyingFilter:withInputParameters:", CFSTR("CISmartGradient"), v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    goto LABEL_16;
  }
  objc_msgSend(v7, "extent");
  x = v8;
  y = v10;
  width = v12;
  height = v14;
  -[PXStorySmartGradientAdjustment normalizedSourceRect](self, "normalizedSourceRect");
  if (!CGRectIsEmpty(v112))
  {
    -[PXStorySmartGradientAdjustment normalizedSourceRect](self, "normalizedSourceRect");
    PXRectDenormalize();
    v114 = CGRectIntegral(v113);
    x = v114.origin.x;
    y = v114.origin.y;
    width = v114.size.width;
    height = v114.size.height;
  }
  v89 = x;
  v90 = y;
  v115.origin.x = x;
  v115.origin.y = y;
  v91 = width;
  v92 = height;
  v115.size.width = width;
  v115.size.height = height;
  v116 = CGRectInset(v115, 0.5, 0.5);
  v95 = v116.origin.x;
  v96 = v116.size.width;
  v97 = v116.size.height;
  v98 = v116.origin.y;
  v17 = *MEMORY[0x1E0C9D538];
  v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXStorySmartGradientAdjustment targetSize](self, "targetSize");
  v19 = v18;
  v21 = v20;
  v117.origin.x = v17;
  v117.origin.y = v16;
  v117.size.width = v19;
  v117.size.height = v21;
  v118 = CGRectInset(v117, 0.5, 0.5);
  v22 = v118.origin.x;
  v23 = v118.origin.y;
  sy = v118.size.width;
  sx = v118.size.height;
  -[PXStorySmartGradientAdjustment simpleBlurExposure](self, "simpleBlurExposure");
  v25 = v24;
  -[PXStorySmartGradientAdjustment simpleBlurRadius](self, "simpleBlurRadius");
  v27 = sqrt(v19 * v21) * (v26 * 0.01);
  v109 = *MEMORY[0x1E0C9E1E8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PXStorySmartGradientAdjustment simpleBlurRepeatEdges](self, "simpleBlurRepeatEdges"))
  {
    v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v106.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v106.c = v52;
    *(_OWORD *)&v106.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v105.a = *(_OWORD *)&v106.a;
    *(_OWORD *)&v105.c = v52;
    *(_OWORD *)&v105.tx = *(_OWORD *)&v106.tx;
    CGAffineTransformTranslate(&v106, &v105, v22, v23);
    v104 = v106;
    CGAffineTransformScale(&v105, &v104, sy / v96, sx / v97);
    v106 = v105;
    v104 = v105;
    CGAffineTransformTranslate(&v105, &v104, -v95, -v98);
    v106 = v105;
    objc_msgSend(v7, "imageByApplyingTransform:", &v105);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "imageByApplyingFilter:withInputParameters:", CFSTR("CIExposureAdjust"), v29);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "imageByApplyingGaussianBlurWithSigma:", v27);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "imageByCroppingToRect:", v17, v16, v19, v21);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v88 = v23;
  v84 = v27;
  v30 = v16;
  -[PXStorySmartGradientAdjustment simpleBlurEdgeStretch](self, "simpleBlurEdgeStretch");
  v32 = v31;
  v33 = *MEMORY[0x1E0C9BAA8];
  v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v106.a = v33;
  *(_OWORD *)&v106.c = v34;
  v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v106.tx = v35;
  *(_OWORD *)&v105.a = v33;
  *(_OWORD *)&v105.c = v34;
  *(_OWORD *)&v105.tx = v35;
  *(_OWORD *)&v104.a = v33;
  *(_OWORD *)&v104.c = v34;
  *(_OWORD *)&v104.tx = v35;
  *(_OWORD *)&v103.a = v33;
  *(_OWORD *)&v103.c = v34;
  *(_OWORD *)&v103.tx = v35;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v36 = v31 * 0.5;
  v82 = v21;
  v83 = v30;
  v81 = v19;
  if (v96 * sx >= v97 * sy)
  {
    v120.origin.x = v17;
    v120.origin.y = v30;
    v120.size.width = v19;
    v120.size.height = v21;
    CGRectDivide(v120, &slice, &remainder, v21 * 0.5, CGRectMinYEdge);
    v54 = sx - sy / v96 * v97;
    v55 = fmax(sy / v96, v54 * v36 / v97);
    v56 = sy / v96 * 0.5 * v32;
    v57 = v23 + v54 * 0.5;
    v100 = v106;
    CGAffineTransformTranslate(&v106, &v100, v22, v57);
    v99 = v106;
    CGAffineTransformScale(&v100, &v99, sy / v96, -v55);
    v106 = v100;
    v99 = v100;
    CGAffineTransformTranslate(&v100, &v99, -v95, -v98);
    v106 = v100;
    v100 = v105;
    CGAffineTransformTranslate(&v105, &v100, v22, v57);
    v99 = v105;
    CGAffineTransformScale(&v100, &v99, sy / v96, v56);
    v105 = v100;
    v99 = v100;
    CGAffineTransformTranslate(&v100, &v99, -v95, -v98);
    v105 = v100;
    v58 = v23 + (sx + sy / v96 * v97) * 0.5;
    v100 = v104;
    CGAffineTransformTranslate(&v104, &v100, v22, v58);
    v99 = v104;
    CGAffineTransformScale(&v100, &v99, sy / v96, -v55);
    v104 = v100;
    v99 = v100;
    CGAffineTransformTranslate(&v100, &v99, -v95, -(v98 + v97));
    v104 = v100;
    v100 = v103;
    CGAffineTransformTranslate(&v103, &v100, v22, v58);
    v99 = v103;
    v41 = v95;
    CGAffineTransformScale(&v100, &v99, sy / v96, v56);
    v103 = v100;
    v99 = v100;
    v43 = -v95;
    v44 = -(v98 + v97);
  }
  else
  {
    v86 = v33;
    v87 = v35;
    v119.origin.x = v17;
    v119.origin.y = v30;
    v119.size.width = v19;
    v85 = v34;
    v119.size.height = v21;
    CGRectDivide(v119, &slice, &remainder, v19 * 0.5, CGRectMinXEdge);
    v37 = sy - sx / v97 * v96;
    v38 = fmax(sx / v97, v37 * v36 / v96);
    v39 = sx / v97 * 0.5 * v32;
    v40 = v22 + v37 * 0.5;
    *(_OWORD *)&v100.a = v86;
    *(_OWORD *)&v100.c = v85;
    *(_OWORD *)&v100.tx = v87;
    CGAffineTransformTranslate(&v106, &v100, v40, v23);
    v99 = v106;
    CGAffineTransformScale(&v100, &v99, -v38, sx / v97);
    v106 = v100;
    v41 = v95;
    v99 = v100;
    CGAffineTransformTranslate(&v100, &v99, -v95, -v98);
    v106 = v100;
    *(_OWORD *)&v100.a = v86;
    *(_OWORD *)&v100.c = v85;
    *(_OWORD *)&v100.tx = v87;
    CGAffineTransformTranslate(&v105, &v100, v40, v88);
    v99 = v105;
    CGAffineTransformScale(&v100, &v99, v39, sx / v97);
    v105 = v100;
    v99 = v100;
    CGAffineTransformTranslate(&v100, &v99, -v95, -v98);
    v105 = v100;
    v42 = v22 + (sy + sx / v97 * v96) * 0.5;
    *(_OWORD *)&v100.a = v86;
    *(_OWORD *)&v100.c = v85;
    *(_OWORD *)&v100.tx = v87;
    CGAffineTransformTranslate(&v104, &v100, v42, v88);
    v99 = v104;
    CGAffineTransformScale(&v100, &v99, -v38, sx / v97);
    v104 = v100;
    v99 = v100;
    CGAffineTransformTranslate(&v100, &v99, -(v95 + v96), -v98);
    v104 = v100;
    *(_OWORD *)&v100.a = v86;
    *(_OWORD *)&v100.c = v85;
    *(_OWORD *)&v100.tx = v87;
    CGAffineTransformTranslate(&v103, &v100, v42, v88);
    v99 = v103;
    CGAffineTransformScale(&v100, &v99, v39, sx / v97);
    v103 = v100;
    v99 = v100;
    v43 = -(v95 + v96);
    v44 = -v98;
  }
  CGAffineTransformTranslate(&v100, &v99, v43, v44);
  v103 = v100;
  objc_msgSend(v7, "imageByClampingToRect:", v89, v90, v91, v92);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v106;
  objc_msgSend(v59, "imageByApplyingTransform:", &v100);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageByCroppingToRect:", v41, v98, v96, v97);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v105;
  objc_msgSend(v61, "imageByApplyingTransform:", &v100);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "imageByCompositingOverImage:", v60);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "imageByClampingToRect:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "imageByApplyingFilter:withInputParameters:", CFSTR("CIExposureAdjust"), v29);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v65, "imageByApplyingGaussianBlurWithSigma:", v84);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "imageByCroppingToRect:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageByClampingToRect:", v89, v90, v91, v92);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v104;
  objc_msgSend(v68, "imageByApplyingTransform:", &v100);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageByCroppingToRect:", v41, v98, v96, v97);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v103;
  objc_msgSend(v70, "imageByApplyingTransform:", &v100);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "imageByCompositingOverImage:", v69);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v72, "imageByClampingToRect:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "imageByApplyingFilter:withInputParameters:", CFSTR("CIExposureAdjust"), v29);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "imageByApplyingGaussianBlurWithSigma:", v84);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "imageByCroppingToRect:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v76, "imageByCompositingOverImage:", v67);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "imageByCroppingToRect:", v17, v83, v81, v82);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v51;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqualToDisplayAssetAdjustment:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "useSmartColor");
    if (v6 != -[PXStorySmartGradientAdjustment useSmartColor](self, "useSmartColor"))
      goto LABEL_13;
    v7 = objc_msgSend(v5, "useSimpleBlur");
    if (v7 != -[PXStorySmartGradientAdjustment useSimpleBlur](self, "useSimpleBlur"))
      goto LABEL_13;
    objc_msgSend(v5, "simpleBlurRadius");
    v9 = v8;
    -[PXStorySmartGradientAdjustment simpleBlurRadius](self, "simpleBlurRadius");
    if (v9 != v10)
      goto LABEL_13;
    objc_msgSend(v5, "simpleBlurExposure");
    v12 = v11;
    -[PXStorySmartGradientAdjustment simpleBlurExposure](self, "simpleBlurExposure");
    if (v12 != v13)
      goto LABEL_13;
    v14 = objc_msgSend(v5, "simpleBlurRepeatEdges");
    if (v14 != -[PXStorySmartGradientAdjustment simpleBlurRepeatEdges](self, "simpleBlurRepeatEdges"))
      goto LABEL_13;
    objc_msgSend(v5, "simpleBlurEdgeStretch");
    v16 = v15;
    -[PXStorySmartGradientAdjustment simpleBlurEdgeStretch](self, "simpleBlurEdgeStretch");
    if (v16 != v17)
      goto LABEL_13;
    objc_msgSend(v5, "normalizedSourceRect");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[PXStorySmartGradientAdjustment normalizedSourceRect](self, "normalizedSourceRect");
    v39.origin.x = v26;
    v39.origin.y = v27;
    v39.size.width = v28;
    v39.size.height = v29;
    v38.origin.x = v19;
    v38.origin.y = v21;
    v38.size.width = v23;
    v38.size.height = v25;
    if (CGRectEqualToRect(v38, v39))
    {
      objc_msgSend(v5, "targetSize");
      v31 = v30;
      v33 = v32;
      -[PXStorySmartGradientAdjustment targetSize](self, "targetSize");
      v36 = v33 == v35 && v31 == v34;
    }
    else
    {
LABEL_13:
      v36 = 0;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (BOOL)allowsUnadjustedOpportunisticDelivery
{
  return 0;
}

- (BOOL)wantsSingleHighQualityDelivery
{
  return 0;
}

- (CGSize)requestSizeForProposedTargetSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 30.0;
  v4 = 30.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)contentModeForProposedContentMode:(int64_t)a3
{
  return 0;
}

- (BOOL)useSmartColor
{
  return self->_useSmartColor;
}

- (void)setUseSmartColor:(BOOL)a3
{
  self->_useSmartColor = a3;
}

- (BOOL)useSimpleBlur
{
  return self->_useSimpleBlur;
}

- (void)setUseSimpleBlur:(BOOL)a3
{
  self->_useSimpleBlur = a3;
}

- (double)simpleBlurRadius
{
  return self->_simpleBlurRadius;
}

- (void)setSimpleBlurRadius:(double)a3
{
  self->_simpleBlurRadius = a3;
}

- (double)simpleBlurExposure
{
  return self->_simpleBlurExposure;
}

- (void)setSimpleBlurExposure:(double)a3
{
  self->_simpleBlurExposure = a3;
}

- (BOOL)simpleBlurRepeatEdges
{
  return self->_simpleBlurRepeatEdges;
}

- (void)setSimpleBlurRepeatEdges:(BOOL)a3
{
  self->_simpleBlurRepeatEdges = a3;
}

- (double)simpleBlurEdgeStretch
{
  return self->_simpleBlurEdgeStretch;
}

- (void)setSimpleBlurEdgeStretch:(double)a3
{
  self->_simpleBlurEdgeStretch = a3;
}

- (CGRect)normalizedSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedSourceRect.origin.x;
  y = self->_normalizedSourceRect.origin.y;
  width = self->_normalizedSourceRect.size.width;
  height = self->_normalizedSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedSourceRect:(CGRect)a3
{
  self->_normalizedSourceRect = a3;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

@end

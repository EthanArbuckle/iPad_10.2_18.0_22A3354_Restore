@implementation PIPosterLayoutHelper

- (_QWORD)initWithCIContext:(double)a3 matte:(double)a4 posterClassification:(double)a5 initialRect:(double)a6 imageSize:(double)a7 effectiveAcceptableRect:(uint64_t)a8 effectivePreferredRect:(void *)a9 validBoundsNormalized:(void *)a10 headroomFeasible:(uint64_t)a11 hasTopEdgeContact:(uint64_t)a12 layoutType:(uint64_t)a13 layoutConfiguration:(uint64_t)a14
{
  id v32;
  id v33;
  _QWORD *v34;
  void *v35;
  id v36;
  void *v37;
  objc_super v43;

  v32 = a9;
  v33 = a10;
  v43.receiver = a1;
  v43.super_class = (Class)PIPosterLayoutHelper;
  v34 = objc_msgSendSuper2(&v43, sel_initWithPosterClassification_initialRect_imageSize_effectiveAcceptableRect_effectivePreferredRect_validBoundsNormalized_headroomFeasible_hasTopEdgeContact_layoutType_layoutConfiguration_, a11, a12, a13, a14, a24, a2, a3, a4, a5, a6, a7, a15, a16, a17, a18, a19, a20,
          a21,
          a22,
          a23);
  v35 = (void *)v34[23];
  v34[23] = v32;
  v36 = v32;

  v37 = (void *)v34[24];
  v34[24] = v33;

  return v34;
}

- (void)initWithPosterClassification:(uint64_t)a3 initialRect:(uint64_t)a4 imageSize:(uint64_t)a5 effectiveAcceptableRect:(uint64_t)a6 effectivePreferredRect:(void *)a7 validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:
{
  id v8;
  uint64_t *v9;
  os_log_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  os_log_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  os_log_t v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a7;
  v9 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v10 = (os_log_t *)MEMORY[0x1E0D52380];
    v11 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = v11;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v18 = *v9;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v18 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21213);
LABEL_7:
        v19 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)MEMORY[0x1E0CB3978];
          v21 = v19;
          objc_msgSend(v20, "callStackSymbols");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v32 = v23;
          _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v18 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21213);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v26 = (void *)MEMORY[0x1E0CB3978];
      v27 = specific;
      v21 = v24;
      objc_msgSend(v26, "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = specific;
      v33 = 2114;
      v34 = v29;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21213);
  }
}

- (id)intermediateWithZoomStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t *v13;
  os_log_t *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
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
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  os_log_t v41;
  void *specific;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CIImage *matte;
  void *v56;
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
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  os_log_t v78;
  double v80;
  double v81;
  double v82;
  id v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  objc_super v93;
  objc_super v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 - 1 < 2)
  {
    v94.receiver = self;
    v94.super_class = (Class)PIPosterLayoutHelper;
    -[PFParallaxLayoutHelper intermediateWithZoomStrategy:intermediate:](&v94, sel_intermediateWithZoomStrategy_intermediate_, a3, v6);
    goto LABEL_3;
  }
  if (a3 != 3)
    goto LABEL_53;
  objc_msgSend(v6, "visibleRect");
  if (v10 < 1.0 || (-[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable"), v11 < 1.0))
  {
    objc_msgSend(v7, "visibleRect");
    if (v12 < 1.0)
    {
      v13 = (uint64_t *)MEMORY[0x1E0D52390];
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21213);
      v14 = (os_log_t *)MEMORY[0x1E0D52380];
      v15 = (void *)*MEMORY[0x1E0D52380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = v15;
        objc_msgSend(v16, "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "intermediate.visibleRect.size.width >= 1");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v96 = v18;
        _os_log_impl(&dword_1A6382000, v17, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        v19 = *v13;
        if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
        {
          if (v19 != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21213);
LABEL_19:
          v41 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
          {
            specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
            v43 = (void *)MEMORY[0x1E0CB3978];
            v44 = specific;
            v45 = v41;
            objc_msgSend(v43, "callStackSymbols");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v96 = specific;
            v97 = 2114;
            v98 = v47;
            _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_75:
            goto LABEL_52;
          }
          goto LABEL_52;
        }
        if (v19 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21213);
      }
      else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        goto LABEL_19;
      }
      v78 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        v88 = (void *)MEMORY[0x1E0CB3978];
        v45 = v78;
        objc_msgSend(v88, "callStackSymbols");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "componentsJoinedByString:", CFSTR("\n"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v96 = v90;
        _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        goto LABEL_75;
      }
LABEL_52:
      _NUAssertContinueHandler();
    }
LABEL_53:
    v9 = 0;
    goto LABEL_54;
  }
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", objc_msgSend(v7, "headroomStrategy"));
  v21 = v20;
  v91 = v22;
  v23 = *MEMORY[0x1E0C9D538];
  v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
  v27 = v25 + v26 * 0.5;
  v30 = v28 + v29 * 0.5;
  objc_msgSend(v7, "visibleRect");
  v32 = v31;
  v34 = v33;
  v35 = v27 + v31 * -0.5;
  v36 = v30 + v33 * -0.5;
  v37 = v31 + v35;
  v38 = v33 + v36;
  v39 = v23 + v21;
  if (v37 >= v23 + v21)
  {
    if (v23 <= v39)
      v40 = v23 + v21;
    else
      v40 = v23;
  }
  else
  {
    v40 = v23;
    if (v23 <= v37)
      v40 = v37;
  }
  v48 = v91 + v24;
  if (v38 >= v91 + v24)
  {
    v49 = v24;
    if (v24 <= v48)
      v49 = v91 + v24;
  }
  else
  {
    v49 = v24;
    if (v24 <= v38)
      v49 = v38;
  }
  v50 = v49 - v38;
  v51 = v35 + v40 - v37;
  v52 = v36 + v50;
  if (v51 >= v39)
  {
    if (v23 <= v39)
      v53 = v23 + v21;
    else
      v53 = v23;
  }
  else
  {
    v53 = v23;
    if (v23 <= v51)
      v53 = v51;
  }
  if (v52 >= v48)
  {
    v54 = v24;
    if (v24 <= v48)
      v54 = v91 + v24;
  }
  else
  {
    v54 = v24;
    if (v24 <= v52)
      v54 = v36 + v50;
  }
  buf[0] = 1;
  matte = self->_matte;
  -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISegmentationHelper computeHeadroomZoomFactorWithVisibleFrame:zoomTowardsTop:matte:layoutConfiguration:context:](PISegmentationHelper, "computeHeadroomZoomFactorWithVisibleFrame:zoomTowardsTop:matte:layoutConfiguration:context:", buf, matte, v56, self->_context, v53, v54, v32, v34);
  v58 = v57;

  if (v58 >= 1.0)
  {
    v59 = 0.0;
    if (buf[0])
      v59 = v91;
    v92 = v59;
    objc_msgSend(MEMORY[0x1E0D751B0], "targetZoomFactorLimitWithLayoutType:", -[PFParallaxLayoutHelper layoutType](self, "layoutType"));
    if (v58 >= v60)
    {
      objc_msgSend(MEMORY[0x1E0D751B0], "targetZoomFactorLimitWithLayoutType:", -[PFParallaxLayoutHelper layoutType](self, "layoutType"));
      v58 = v61;
    }
    objc_msgSend(v7, "visibleRect");
    v63 = 1.0 / v58 * v62;
    v65 = 1.0 / v58 * v64;
    -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
    v68 = v66 + v67 * 0.5;
    objc_msgSend(v7, "visibleRect");
    v71 = v69 + v70 * 0.5 - v92;
    objc_msgSend(v7, "visibleRect");
    v73 = v68 + v63 * -0.5;
    v74 = v92 + v71 / v72 * v65 + v65 * -0.5;
    v75 = v63 + v73;
    v76 = v65 + v74;
    if (v63 + v73 >= v39)
    {
      v77 = v23;
      if (v23 <= v39)
        v77 = v39;
    }
    else
    {
      v77 = v23;
      if (v23 <= v75)
        v77 = v63 + v73;
    }
    if (v76 >= v48)
    {
      v80 = v24;
      if (v24 <= v48)
        v80 = v48;
    }
    else
    {
      v80 = v24;
      if (v24 <= v76)
        v80 = v65 + v74;
    }
    v81 = v73 + v77 - v75;
    v82 = v74 + v80 - v76;
    if (v81 >= v39)
    {
      if (v23 <= v39)
        v23 = v39;
    }
    else if (v23 <= v81)
    {
      v23 = v81;
    }
    if (v82 >= v48)
    {
      if (v24 <= v48)
        v24 = v48;
    }
    else if (v24 <= v82)
    {
      v24 = v74 + v80 - v76;
    }
    v83 = objc_alloc(MEMORY[0x1E0D75180]);
    objc_msgSend(v7, "inactiveRect");
    v8 = objc_msgSend(v83, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", 3, objc_msgSend(v7, "overlapStrategy"), objc_msgSend(v7, "parallaxStrategy"), objc_msgSend(v7, "inactiveStrategy"), objc_msgSend(v7, "headroomStrategy"), v23, v24, v63, v65, v84, v85, v86, v87);
    goto LABEL_4;
  }
  v93.receiver = self;
  v93.super_class = (Class)PIPosterLayoutHelper;
  -[PFParallaxLayoutHelper intermediateWithZoomStrategy:intermediate:](&v93, sel_intermediateWithZoomStrategy_intermediate_, 3, v7);
LABEL_3:
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v9 = (void *)v8;
LABEL_54:

  return v9;
}

- (id)pixelBasedIntermediateWithOverlapStrategy:(unint64_t)a3 intermediate:(id)a4 translationY:(double)a5
{
  id v8;
  double v9;
  CGFloat v10;
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
  double x;
  double y;
  double width;
  double height;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v53;
  double v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v8 = a4;
  objc_msgSend(v8, "visibleRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", objc_msgSend(v8, "headroomStrategy"));
  v18 = v17;
  v20 = v19;
  v55.origin.x = v10;
  v55.origin.y = v12;
  v55.size.width = v14;
  v55.size.height = v16;
  v21 = v20 - CGRectGetMaxY(v55);
  if (v21 > a5)
    v21 = a5;
  if (v21 >= -v12)
    v22 = v21;
  else
    v22 = -v12;
  v56.origin.x = v10;
  v56.origin.y = v12;
  v56.size.width = v14;
  v56.size.height = v16;
  v57 = CGRectOffset(v56, 0.0, v22);
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;
  if (-[PFParallaxLayoutHelper layoutType](self, "layoutType") != 2)
    goto LABEL_32;
  v53 = height;
  v54 = width;
  v27 = v18;
  -[PFParallaxLayoutHelper pixelValidBounds](self, "pixelValidBounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  if (objc_msgSend(v8, "headroomStrategy") == 2
    || (v58.origin.x = v29, v58.origin.y = v31, v58.size.width = v33, v58.size.height = v35, CGRectIsNull(v58)))
  {
    v29 = 0.0;
    v31 = 0.0;
    v33 = v27;
  }
  else
  {
    v20 = v35;
  }
  height = v53;
  v36 = x + v54;
  v37 = y + v53;
  v38 = v29 + v33;
  if (x + v54 >= v29 + v33)
  {
    v39 = v29;
    if (v29 <= v38)
      v39 = v29 + v33;
  }
  else
  {
    v39 = v29;
    if (v29 <= v36)
      v39 = x + v54;
  }
  v40 = v31 + v20;
  if (v37 >= v31 + v20)
  {
    v41 = v31;
    if (v31 <= v40)
      v41 = v31 + v20;
  }
  else
  {
    v41 = v31;
    if (v31 <= v37)
      v41 = y + v53;
  }
  v42 = v39 - v36;
  v43 = v41 - v37;
  v44 = x + v42;
  v45 = y + v43;
  if (v44 >= v38)
  {
    x = v29;
    if (v29 <= v38)
      x = v29 + v33;
  }
  else
  {
    x = v29;
    if (v29 <= v44)
      x = v44;
  }
  if (v45 >= v40)
  {
    y = v31;
    if (v31 <= v40)
      y = v31 + v20;
  }
  else
  {
    y = v31;
    if (v31 <= v45)
      y = v45;
  }
  v59.origin.x = v29;
  v59.origin.y = v31;
  v59.size.width = v33;
  v59.size.height = v20;
  v60.origin.x = x;
  v60.origin.y = y;
  width = v54;
  v60.size.width = v54;
  v60.size.height = v53;
  if (!CGRectContainsRect(v59, v60))
  {
    v51 = 0;
  }
  else
  {
LABEL_32:
    v46 = objc_alloc(MEMORY[0x1E0D75180]);
    objc_msgSend(v8, "inactiveRect");
    v51 = (void *)objc_msgSend(v46, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", objc_msgSend(v8, "zoomStrategy"), a3, objc_msgSend(v8, "parallaxStrategy"), objc_msgSend(v8, "inactiveStrategy"), objc_msgSend(v8, "headroomStrategy"), x, y, width, height, v47, v48, v49, v50);
  }

  return v51;
}

- (id)intermediateWithOverlapStrategy:(unint64_t)a3 intermediate:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PIPosterLayoutHelper *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CIImage *matte;
  void *v21;
  double v22;
  double v23;
  PIPosterLayoutHelper *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CIImage *v34;
  void *v35;
  double v36;
  NSObject *v38;
  void *v39;
  const void **v40;
  void *specific;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  PIPosterLayoutHelper *v51;
  SEL v52;
  unint64_t v53;
  id v54;
  objc_super v55;
  objc_super v56;
  _BYTE buf[12];
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", objc_msgSend(v6, "headroomStrategy"));
  v8 = v7;
  v10 = v9;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      v56.receiver = self;
      v56.super_class = (Class)PIPosterLayoutHelper;
      -[PFParallaxLayoutHelper intermediateWithOverlapStrategy:intermediate:](&v56, sel_intermediateWithOverlapStrategy_intermediate_, a3, v6);
      goto LABEL_3;
    case 2uLL:
      objc_msgSend(v6, "visibleRect");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      matte = self->_matte;
      -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PISegmentationHelper computeTargetOverlapYOffsetWithVisibleFrame:imageSize:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "computeTargetOverlapYOffsetWithVisibleFrame:imageSize:segmentationMatte:layoutConfiguration:context:", matte, v21, self->_context, v13, v15, v17, v19, v8, v10);
      v23 = v22;

      v24 = self;
      v25 = 2;
      goto LABEL_10;
    case 3uLL:
      *(_QWORD *)buf = 0;
      objc_msgSend(v6, "visibleRect");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v34 = self->_matte;
      -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[PISegmentationHelper computeAvoidOverlapYOffsetWithVisibleFrame:imageSize:segmentationMatte:layoutConfiguration:outputUnsafeOverlap:context:](PISegmentationHelper, "computeAvoidOverlapYOffsetWithVisibleFrame:imageSize:segmentationMatte:layoutConfiguration:outputUnsafeOverlap:context:", v34, v35, buf, self->_context, v27, v29, v31, v33, v8, v10);
      v23 = v36;

      if (*(double *)buf > *MEMORY[0x1E0D75698]
        && (-[PFParallaxLayoutHelper classification](self, "classification", *(double *)buf) == 1
         || -[PFParallaxLayoutHelper classification](self, "classification") == 2))
      {
        v55.receiver = self;
        v55.super_class = (Class)PIPosterLayoutHelper;
        -[PFParallaxLayoutHelper intermediateWithOverlapStrategy:intermediate:](&v55, sel_intermediateWithOverlapStrategy_intermediate_, 4, v6);
LABEL_3:
        v11 = (PIPosterLayoutHelper *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = self;
        v25 = 3;
LABEL_10:
        -[PIPosterLayoutHelper pixelBasedIntermediateWithOverlapStrategy:intermediate:translationY:](v24, "pixelBasedIntermediateWithOverlapStrategy:intermediate:translationY:", v25, v6, v23);
        v11 = (PIPosterLayoutHelper *)objc_claimAutoreleasedReturnValue();
      }
      self = v11;
LABEL_12:

      return self;
    case 4uLL:
      NUAssertLogger_21201();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "overlapStrategy != PFParallaxUtilityOverlapForceMetadataAvoid");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v39;
        _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v40 = (const void **)MEMORY[0x1E0D51D48];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_21201();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v43)
        {
          v46 = dispatch_get_specific(*v40);
          v47 = (void *)MEMORY[0x1E0CB3978];
          v48 = v46;
          objc_msgSend(v47, "callStackSymbols");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v46;
          v58 = 2114;
          v59 = v50;
          _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v43)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v45;
        _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      v51 = (PIPosterLayoutHelper *)_NUAssertFailHandler();
      return -[PIPosterLayoutHelper intermediateWithInactiveStrategy:intermediate:](v51, v52, v53, v54);
    default:
      goto LABEL_12;
  }
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _BOOL8 v35;
  CIImage *matte;
  void *v37;
  CGRect v39;
  CGRect v40;

  v6 = a4;
  objc_msgSend(v6, "visibleRect");
  if (a3)
  {
    if (a3 != 2)
    {
      v11 = v7;
      v12 = v8;
      v13 = v9;
      v14 = v10;
      v15 = 0.0;
      if (a3 == 1)
      {
        objc_msgSend(v6, "visibleRect");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v15 = v22;
      }
      else
      {
        v21 = 0.0;
        v19 = 0.0;
        v17 = 0.0;
      }
      goto LABEL_10;
    }
    -[PFParallaxLayoutHelper originalImageSize](self, "originalImageSize");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v6, "visibleRect");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v35 = objc_msgSend(v6, "headroomStrategy") == 2;
    matte = self->_matte;
    -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[PISegmentationHelper computeInactiveFrameWithVisibleFrame:imageSize:canUpdateVisibleRect:considerHeadroom:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "computeInactiveFrameWithVisibleFrame:imageSize:canUpdateVisibleRect:considerHeadroom:segmentationMatte:layoutConfiguration:context:", 1, v35, matte, v37, self->_context, v28, v30, v32, v34, v24, v26);

    v39.origin = 0u;
    v39.size = 0u;
    if (!CGRectIsNull(v39))
    {
      v40.origin = 0u;
      v40.size = 0u;
      if (!CGRectIsNull(v40))
      {
        v19 = 0.0;
        v17 = 0.0;
        v15 = 0.0;
        v21 = 0.0;
        v12 = 0.0;
        v11 = 0.0;
        v14 = 0.0;
        v13 = 0.0;
LABEL_10:
        a3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75180]), "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", objc_msgSend(v6, "zoomStrategy"), objc_msgSend(v6, "overlapStrategy"), objc_msgSend(v6, "parallaxStrategy"), a3, objc_msgSend(v6, "headroomStrategy"), v11, v12, v13, v14, v17, v19, v21, v15);
        goto LABEL_11;
      }
    }
    a3 = 0;
  }
LABEL_11:

  return (id)a3;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CIImage *matte;
  void *v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
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
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  BOOL v61;
  double v62;
  _BOOL4 v63;
  double v64;
  BOOL v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  BOOL v71;
  double v72;
  double v74;
  double v75;
  id v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v88;
  double v89;
  double v90;
  double v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v4 = a3;
  -[PFParallaxLayoutHelper computeCropScoreForIntermediate:](self, "computeCropScoreForIntermediate:", v4);
  v91 = v5;
  -[PFParallaxLayoutHelper imageSizeWithHeadroomStrategy:](self, "imageSizeWithHeadroomStrategy:", objc_msgSend(v4, "headroomStrategy"));
  v7 = v6;
  v9 = v8;
  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "visibleRect");
  v16 = v15 - v10;
  v17 = 0.0;
  v18 = 0.0;
  if (v7 != 0.0)
  {
    v16 = v16 / v7;
    v18 = v13 / v7;
  }
  v19 = v12 - v11;
  if (v9 != 0.0)
  {
    v19 = v19 / v9;
    v17 = v14 / v9;
  }
  -[CIImage extent](self->_matte, "extent");
  v22 = v20 + v16 * v21;
  v25 = v23 + v19 * v24;
  v26 = v18 * v21;
  v27 = v17 * v24;
  -[PFParallaxLayoutHelper unsafeAreaInImageSpaceWithVisibleFrame:](self, "unsafeAreaInImageSpaceWithVisibleFrame:", v22, v25, v18 * v21, v27);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  matte = self->_matte;
  -[PFParallaxLayoutHelper layoutConfiguration](self, "layoutConfiguration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", matte, v37, self->_context, 0, v22, v25, v26, v27);

  +[PISegmentationHelper computeMatteCoverageWithRect:segmentationMatte:context:](PISegmentationHelper, "computeMatteCoverageWithRect:segmentationMatte:context:", self->_matte, self->_context, v29, v31, v33, v35);
  v39 = v38;
  objc_msgSend(v4, "visibleRect");
  -[PFParallaxLayoutHelper unsafeAreaInImageSpaceWithVisibleFrame:](self, "unsafeAreaInImageSpaceWithVisibleFrame:");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = v39;
  if (objc_msgSend(v4, "overlapStrategy") == 4)
  {
    -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    if (-[PFParallaxLayoutHelper canInflate](self, "canInflate"))
    {
      objc_msgSend((id)objc_opt_class(), "inflatePersonFaceRect:", v50, v52, v54, v56);
      v50 = v57;
      v52 = v58;
      v54 = v59;
      v56 = v60;
    }
    v92.origin.x = v41;
    v92.origin.y = v43;
    v92.size.width = v45;
    v92.size.height = v47;
    v96.origin.x = v50;
    v96.origin.y = v52;
    v96.size.width = v54;
    v96.size.height = v56;
    v93 = CGRectIntersection(v92, v96);
    if (v93.size.width == 0.0
      || v93.size.height == 0.0
      || (v93.size.height == *(double *)(MEMORY[0x1E0D71130] + 8)
        ? (v61 = v93.size.width == *MEMORY[0x1E0D71130])
        : (v61 = 0),
          v61))
    {
      v62 = 0.0;
    }
    else
    {
      v62 = v93.size.width * v93.size.height;
    }
    v63 = v47 == 0.0 || v45 == 0.0;
    if (v63)
    {
      v64 = v45 * v47;
    }
    else
    {
      v65 = v47 == *(double *)(MEMORY[0x1E0D71130] + 8) && v45 == *MEMORY[0x1E0D71130];
      v64 = v45 * v47;
      v66 = v45 * v47;
      if (!v65)
      {
LABEL_27:
        -[PFParallaxLayoutHelper pixelEffectiveAcceptable](self, "pixelEffectiveAcceptable");
        v97.origin.x = v67;
        v97.origin.y = v68;
        v97.size.width = v69;
        v97.size.height = v70;
        v94.origin.x = v41;
        v94.origin.y = v43;
        v94.size.width = v45;
        v94.size.height = v47;
        v95 = CGRectIntersection(v94, v97);
        if (v95.size.width == 0.0
          || v95.size.height == 0.0
          || (v95.size.height == *(double *)(MEMORY[0x1E0D71130] + 8)
            ? (v71 = v95.size.width == *MEMORY[0x1E0D71130])
            : (v71 = 0),
              v71))
        {
          v72 = 0.0;
          if (!v63)
            goto LABEL_37;
        }
        else
        {
          v72 = v95.size.width * v95.size.height;
          if (!v63)
          {
LABEL_37:
            if (v47 != *(double *)(MEMORY[0x1E0D71130] + 8) || v45 != *MEMORY[0x1E0D71130])
              goto LABEL_43;
          }
        }
        v64 = 0.0;
LABEL_43:
        v48 = v62 / v66;
        v39 = v72 / v64;
        goto LABEL_44;
      }
    }
    v66 = 0.0;
    goto LABEL_27;
  }
LABEL_44:
  -[PFParallaxLayoutHelper scoreAdjustmentWithUnscoredIntermediate:unsafeAreaOverlap:timeBottomOverlap:timeTopOverlap:](self, "scoreAdjustmentWithUnscoredIntermediate:unsafeAreaOverlap:timeBottomOverlap:timeTopOverlap:", v4, v48, 0.0, 0.0);
  v75 = v74;
  v76 = objc_alloc(MEMORY[0x1E0D75180]);
  objc_msgSend(v4, "visibleRect");
  v89 = v78;
  v90 = v77;
  v88 = v79;
  v81 = v80;
  objc_msgSend(v4, "inactiveRect");
  v86 = (void *)objc_msgSend(v76, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:", objc_msgSend(v4, "zoomStrategy"), objc_msgSend(v4, "overlapStrategy"), objc_msgSend(v4, "parallaxStrategy"), objc_msgSend(v4, "inactiveStrategy"), objc_msgSend(v4, "headroomStrategy"), -[PFParallaxLayoutHelper hasTopEdgeContact](self, "hasTopEdgeContact"), v90, v89, v88, v81, v82, v83, v84, v85, *(_QWORD *)&v91,
                  (v91 + v75) * 0.5,
                  0,
                  0,
                  *(_QWORD *)&v48,
                  *(_QWORD *)&v39);

  return v86;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matte, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end

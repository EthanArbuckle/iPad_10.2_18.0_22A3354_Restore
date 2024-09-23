@implementation PILongExposureRegistrationJob

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsRenderScaleClampedToNativeScale
{
  return 1;
}

- (id)scalePolicy
{
  return (id)objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PILongExposureRegistrationJob;
  v4 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v8, sel_newRenderPipelineStateForEvaluationMode_);
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("/AutoLoop/LongExposure"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPipelineFilters:", v6);

  }
  return v4;
}

- (BOOL)prepare:(id *)a3
{
  void *v3;
  id *v4;
  const void **p_isa;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id specific;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double CropRect;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  const char *v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  _OWORD v67[2];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  _BYTE buf[32];
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  _QWORD v78[4];
  NSRect v79;
  NSRect v80;

  v78[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11681();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v57;
      _os_log_error_impl(&dword_1A6382000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    p_isa = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11681();
    v8 = objc_claimAutoreleasedReturnValue();
    v58 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v58)
      {
        v59 = dispatch_get_specific(*p_isa);
        v60 = (void *)MEMORY[0x1E0CB3978];
        specific = v59;
        objc_msgSend(v60, "callStackSymbols");
        p_isa = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa, "componentsJoinedByString:", CFSTR("\n"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v3;
        _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v58)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      p_isa = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = p_isa;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v62 = "error != nil";
    _NUAssertFailHandler();
    __break(1u);
    goto LABEL_39;
  }
  v4 = a3;
  p_isa = (const void **)&self->super.super.isa;
  v72.receiver = self;
  v72.super_class = (Class)PILongExposureRegistrationJob;
  if (!-[NURenderJob prepare:](&v72, sel_prepare_))
    return 0;
  if ((objc_msgSend(p_isa, "_shouldWaitForDependentJobs") & 1) == 0)
  {
    v7 = (void *)objc_msgSend(p_isa, "newRenderPipelineStateForEvaluationMode:", 0);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D52260]), "initWithBlock:", &__block_literal_global_208);
    v78[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPipelineFilters:", v9);

    objc_msgSend(p_isa, "prepareNodeWithPipelineState:error:", v7, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    specific = (id)objc_msgSend(p_isa, "newRenderPipelineStateForEvaluationMode:", 1);

    objc_msgSend(specific, "setScale:", *MEMORY[0x1E0D51F70], *(_QWORD *)(MEMORY[0x1E0D51F70] + 8));
    objc_msgSend(v10, "nodeByReplayingAgainstCache:error:", specific, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v6 = 0;
LABEL_43:

      return v6;
    }
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_8:
      v12 = (void *)*MEMORY[0x1E0D523A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_DEBUG))
      {
        v45 = v12;
        objc_msgSend(v3, "debugDescription");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v46;
        _os_log_debug_impl(&dword_1A6382000, v45, OS_LOG_TYPE_DEBUG, "Still image node:\n%@", buf, 0xCu);

      }
      objc_msgSend(v3, "outputImageGeometry:", v4, v62);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_23;
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_257);
      v14 = (void *)*MEMORY[0x1E0D523A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_DEBUG))
      {
        v47 = v14;
        objc_msgSend(v13, "debugDescription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v48;
        _os_log_debug_impl(&dword_1A6382000, v47, OS_LOG_TYPE_DEBUG, "Still image geometry:\n%@", buf, 0xCu);

      }
      objc_msgSend(v3, "outputImage:", v4);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "setStillImage:", v15);

      objc_msgSend(p_isa, "stillImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = v16 == 0;

      if ((v15 & 1) != 0)
      {
LABEL_23:
        v6 = 0;
      }
      else
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_257);
        v17 = (void *)*MEMORY[0x1E0D523A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_DEBUG))
        {
          v49 = v17;
          objc_msgSend(p_isa, "stillImage");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "debugDescription");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v51;
          _os_log_debug_impl(&dword_1A6382000, v49, OS_LOG_TYPE_DEBUG, "Still image:\n%@", buf, 0xCu);

        }
        objc_msgSend(p_isa, "prepareNode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "videoProperties:", v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(p_isa, "registrationRequest");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            objc_msgSend(v20, "cleanAperture");
          }
          else
          {
            v70 = 0u;
            v71 = 0u;
          }
          NUPixelRectToCGRect();
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29 = v28;

          objc_msgSend(p_isa, "outputGeometry");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "renderScale");

          objc_msgSend(p_isa, "outputGeometry");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "size");
          v65 = v33;
          v66 = v32;

          objc_msgSend(p_isa, "registrationRequest");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "recipe");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          PIAutoLoopRecipeForFlavor(v35, 3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          CropRect = PIAutoLoopRecipeGetCropRect(v36);
          v39 = v38;
          v41 = v40;
          v43 = v42;

          NUScaleInvert();
          NUScaleToDouble();
          NUScaleRect();
          v68 = 0u;
          NUPixelRectFromCGRect();
          *(_QWORD *)&v69 = v66;
          *((_QWORD *)&v69 + 1) = v65;
          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_257);
          v44 = (void *)*MEMORY[0x1E0D523A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_DEBUG))
          {
            v63 = v44;
            v79.origin.x = v23;
            v79.origin.y = v25;
            v79.size.width = v27;
            v79.size.height = v29;
            NSStringFromRect(v79);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v80.origin.x = CropRect;
            v80.origin.y = v39;
            v80.size.width = v41;
            v80.size.height = v43;
            NSStringFromRect(v80);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromNUPixelSize();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            NUScaleToString();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_OWORD *)buf = v68;
            *(_OWORD *)&buf[16] = v69;
            NSStringFromNUPixelRect();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = v64;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v53;
            v74 = 2112;
            v75 = v54;
            v76 = 2112;
            v77 = v55;
            _os_log_debug_impl(&dword_1A6382000, v63, OS_LOG_TYPE_DEBUG, "clap=%@, crop=%@, fullSize=%@, videoScale=%@ => guide rect: %@", buf, 0x34u);

          }
          v67[0] = v68;
          v67[1] = v69;
          objc_msgSend(p_isa, "setGuideExtent:", v67);
          v6 = 1;
        }
        else
        {
          v6 = 0;
        }

      }
      goto LABEL_43;
    }
LABEL_39:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_257);
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat v38;
  uint64_t v39;
  uint64_t v40;
  void *specific;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  BOOL v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v74;
  void *v75;
  const void **v76;
  NSObject *v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id *v98;
  void *v99;
  void *v100;
  PILongExposureRegistrationJob *v101;
  id v102;
  id v103;
  _QWORD v104[2];
  __int128 v105;
  _QWORD v106[2];
  __int128 v107;
  CGAffineTransform v108;
  CGAffineTransform v109;
  void *v110;
  void *v111;
  void *v112;
  __int128 buf;
  __int128 v114;
  CGAffineTransform v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11681();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v115.a) = 138543362;
      *(_QWORD *)((char *)&v115.a + 4) = v75;
      _os_log_error_impl(&dword_1A6382000, v74, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v115, 0xCu);

    }
    v76 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11681();
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v78)
      {
        specific = dispatch_get_specific(*v76);
        v80 = (void *)MEMORY[0x1E0CB3978];
        v81 = specific;
        objc_msgSend(v80, "callStackSymbols");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "componentsJoinedByString:", CFSTR("\n"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v115.a) = 138543618;
        *(_QWORD *)((char *)&v115.a + 4) = specific;
        WORD2(v115.b) = 2114;
        *(_QWORD *)((char *)&v115.b + 6) = v83;
        _os_log_error_impl(&dword_1A6382000, v77, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v115, 0x16u);

      }
    }
    else if (v78)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v115.a) = 138543362;
      *(_QWORD *)((char *)&v115.a + 4) = v79;
      _os_log_error_impl(&dword_1A6382000, v77, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v115, 0xCu);

    }
    _NUAssertFailHandler();
    goto LABEL_30;
  }
  -[NURenderJob renderer:](self, "renderer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v98 = a3;
    v102 = v5;
    -[PILongExposureRegistrationJob stillImage](self, "stillImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob outputImage](self, "outputImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob outputGeometry](self, "outputGeometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderScale");

    NUScaleInvert();
    NUScaleToDouble();
    memset(&v115, 0, sizeof(v115));
    CGAffineTransformMakeScale(&v115, v9, v9);
    v97 = v7;
    objc_msgSend(v7, "imageByClampingToExtent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v115;
    objc_msgSend(v10, "imageByApplyingTransform:", &v109);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v109, 0, 32);
    v101 = self;
    -[PILongExposureRegistrationJob guideExtent](self, "guideExtent");
    v12 = *(_OWORD *)&v109.c;
    +[PIAutoLoopKernels rgbToLumaKernel](PIAutoLoopKernels, "rgbToLumaKernel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    buf = *(_OWORD *)&v109.a;
    v114 = *(_OWORD *)&v109.c;
    NUPixelRectToCGRect();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v94 = v6;
    objc_msgSend(v6, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v14, "CGColorSpace"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applyWithExtent:arguments:", v24, v16, v18, v20, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    buf = 0uLL;
    v114 = v12;
    NUPixelRectToCGRect();
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v95 = v14;
    v96 = v11;
    objc_msgSend(v11, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v14, "CGColorSpace"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applyWithExtent:arguments:", v35, v27, v29, v31, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    buf = *(_OWORD *)&v109.a;
    v114 = *(_OWORD *)&v109.c;
    NUPixelRectToCGRect();
    objc_msgSend(v25, "imageByCroppingToRect:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    buf = *(_OWORD *)&v109.a;
    v114 = *(_OWORD *)&v109.c;
    v38 = (double)-NUMinX();
    buf = *(_OWORD *)&v109.a;
    v114 = *(_OWORD *)&v109.c;
    v39 = NUMinY();
    CGAffineTransformMakeTranslation(&v108, v38, (double)-v39);
    objc_msgSend(v37, "imageByApplyingTransform:", &v108);
    v40 = objc_claimAutoreleasedReturnValue();

    specific = (void *)objc_msgSend(MEMORY[0x1E0D52348], "newPixelBufferOfSize:format:", *(_QWORD *)&v109.c, *(_QWORD *)&v109.d, 1278226488);
    v42 = objc_msgSend(MEMORY[0x1E0D52348], "newPixelBufferOfSize:format:", v12, 1278226488);
    v99 = (void *)v40;
    v100 = (void *)v42;
    if (!specific || (v43 = (void *)v42) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to allocate intermediate pixel buffer"), v101);
      v67 = 0;
      v69 = v97;
      *v98 = (id)objc_claimAutoreleasedReturnValue();
      v71 = v95;
      v70 = v96;
LABEL_20:

      v5 = v102;
      goto LABEL_21;
    }
    v87 = v13;
    v89 = specific;
    v44 = v36;
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", objc_msgSend(specific, "CVPixelBuffer"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PILongExposureRegistrationJob-render-j%lld"), -[NURenderJob jobNumber](v101, "jobNumber"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setLabel:", v46);

    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", objc_msgSend(v43, "CVPixelBuffer"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PILongExposureRegistrationJob-reference-j%lld"), -[NURenderJob jobNumber](v101, "jobNumber"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setLabel:", v48);

    v106[0] = 0;
    v106[1] = 0;
    v107 = *(_OWORD *)&v109.c;
    v49 = *MEMORY[0x1E0D51E30];
    v50 = *(_QWORD *)(MEMORY[0x1E0D51E30] + 8);
    v91 = v45;
    objc_msgSend(v102, "renderImage:rect:toDestination:atPoint:error:", v40, v106, v45, *MEMORY[0x1E0D51E30], v50, v98);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = 0;
    v104[1] = 0;
    v105 = v12;
    v88 = v44;
    objc_msgSend(v102, "renderImage:rect:toDestination:atPoint:error:", v44, v104, v47, v49, v50, v98);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v51;
    objc_msgSend(v51, "nu_waitUntilCompletedAndReturnError:", v98);
    v53 = objc_claimAutoreleasedReturnValue();
    v90 = (void *)v47;
    v92 = v52;
    if (!v53
      || (v54 = (void *)v53,
          objc_msgSend(v52, "nu_waitUntilCompletedAndReturnError:", v98),
          v55 = (void *)objc_claimAutoreleasedReturnValue(),
          v55,
          v54,
          !v55))
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to render luma"), v101, *v98);
      v67 = 0;
      *v98 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v94;
      v71 = v95;
      v70 = v96;
      v69 = v97;
      v13 = v87;
      v36 = v88;
      specific = v89;
LABEL_19:

      goto LABEL_20;
    }
    v56 = objc_alloc(MEMORY[0x1E0CEDF40]);
    specific = v89;
    v57 = objc_msgSend(v89, "CVPixelBuffer");
    v58 = (void *)objc_msgSend(v56, "initWithTargetedCVPixelBuffer:options:", v57, MEMORY[0x1E0C9AA70]);
    v59 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v60 = objc_msgSend(v100, "CVPixelBuffer");
    objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "visionSession");
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v59, "initWithCVPixelBuffer:options:session:", v60, MEMORY[0x1E0C9AA70], v62);

    v110 = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0;
    LOBYTE(v62) = objc_msgSend(v63, "performRequests:error:", v64, &v103);
    v86 = v103;

    v84 = v63;
    v85 = v58;
    if ((v62 & 1) != 0)
    {
      objc_msgSend(v58, "results");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "count");
      v67 = v66 == 1;
      if (v66 == 1)
      {
        objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[PILongExposureRegistrationJob setObservation:](v101, "setObservation:", v68);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 1, CFSTR("Image registration failure (expected 1 observation)"), v101);
        *v98 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v94;
      v13 = v87;

      v70 = v96;
      v69 = v97;
      v71 = v95;
      v36 = v88;
LABEL_18:

      goto LABEL_19;
    }
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_15:
      v6 = v94;
      v71 = v95;
      v70 = v96;
      v69 = v97;
      v13 = v87;
      v36 = v88;
      v72 = *MEMORY[0x1E0D523A0];
      v67 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v86;
        _os_log_impl(&dword_1A6382000, v72, OS_LOG_TYPE_INFO, "High-resolution image registration failure : %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_18;
    }
LABEL_30:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_257);
    goto LABEL_15;
  }
  v67 = 0;
LABEL_21:

  return v67;
}

- (id)result
{
  _PILongExposureRegistrationResult *v3;
  void *v4;
  _OWORD v6[4];

  v3 = objc_alloc_init(_PILongExposureRegistrationResult);
  -[PILongExposureRegistrationJob observation](self, "observation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PILongExposureRegistrationResult setObservation:](v3, "setObservation:", v4);

  -[PILongExposureRegistrationJob guideExtent](self, "guideExtent");
  v6[0] = v6[2];
  v6[1] = v6[3];
  -[_PILongExposureRegistrationResult setExtent:](v3, "setExtent:", v6);
  return v3;
}

- ($B5E4F2499D3E0A90C7E8AF059312C337)guideExtent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[8].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[7].var1.var1;
  retstr->var1 = v3;
  return self;
}

- (void)setGuideExtent:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a3->var1;
  self->_guideExtent.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_guideExtent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- (CIImage)stillImage
{
  return self->_stillImage;
}

- (void)setStillImage:(id)a3
{
  objc_storeStrong((id *)&self->_stillImage, a3);
}

- (VNImageHomographicAlignmentObservation)observation
{
  return self->_observation;
}

- (void)setObservation:(id)a3
{
  objc_storeStrong((id *)&self->_observation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_stillImage, 0);
}

id __41__PILongExposureRegistrationJob_prepare___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderNodeFromSource:settings:error:", v8, &unk_1E5059228, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

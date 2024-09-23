@implementation PIFaceBalanceAutoCalculator

- (PIFaceBalanceAutoCalculator)initWithRequest:(id)a3 isRAW:(BOOL)a4
{
  _BOOL4 v4;
  PIFaceBalanceAutoCalculator *result;
  int64_t v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)PIFaceBalanceAutoCalculator;
  result = -[NURenderRequest initWithRequest:](&v7, sel_initWithRequest_, a3);
  v6 = 1;
  if (v4)
    v6 = 2;
  result->_rawState = v6;
  return result;
}

- (void)submit:(id)a3
{
  id v4;
  int64_t rawState;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  rawState = self->_rawState;
  if (rawState)
  {
    if (rawState == 2)
    {
      +[PIFaceBalanceAutoCalculator calculateRAWWithRequest:completion:](PIFaceBalanceAutoCalculator, "calculateRAWWithRequest:completion:", self, v4);
    }
    else if (rawState == 1)
    {
      +[PIFaceBalanceAutoCalculator calculateWithRequest:completion:](PIFaceBalanceAutoCalculator, "calculateWithRequest:completion:", self, v4);
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithRequest:", self);
    objc_msgSend(v6, "setName:", CFSTR("PIFaceBalanceAutoCalculator-imageProperties"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__PIFaceBalanceAutoCalculator_submit___block_invoke;
    v7[3] = &unk_1E5019E90;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v6, "submit:", v7);

  }
}

- (int64_t)rawState
{
  return self->_rawState;
}

void __38__PIFaceBalanceAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    objc_msgSend(v3, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rawProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    if (v6)
      +[PIFaceBalanceAutoCalculator calculateRAWWithRequest:completion:](PIFaceBalanceAutoCalculator, "calculateRAWWithRequest:completion:", v7, v8);
    else
      +[PIFaceBalanceAutoCalculator calculateWithRequest:completion:](PIFaceBalanceAutoCalculator, "calculateWithRequest:completion:", v7, v8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
}

+ (void)calculateWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    NUAssertLogger_5324();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5324();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        v31 = 2114;
        v32 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52140]), "initWithRequest:dataExtractor:options:", v5, CFSTR("CIFaceBalance"), 0);
  objc_msgSend(v8, "setName:", CFSTR("PIFaceBalanceAutoCalculator-calculate"));
  +[PIPipelineFilters stopAtTagIncludeOrientationFilter:](PIPipelineFilters, "stopAtTagIncludeOrientationFilter:", CFSTR("/Master/Source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPipelineFilters:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x400000);
  objc_msgSend(v8, "setScalePolicy:", v11);

  objc_msgSend(v8, "setSampleMode:", 1);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__PIFaceBalanceAutoCalculator_calculateWithRequest_completion___block_invoke;
  v26[3] = &unk_1E5019A68;
  v27 = v7;
  v12 = v7;
  objc_msgSend(v8, "submit:", v26);

}

+ (void)calculateRAWWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    NUAssertLogger_5324();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5324();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520A8]), "initWithRequest:", v5);
  +[PIPipelineFilters rawFaceBalanceFilter](PIPipelineFilters, "rawFaceBalanceFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPipelineFilters:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x400000);
  objc_msgSend(v8, "setScalePolicy:", v11);

  objc_msgSend(v8, "setSampleMode:", 1);
  objc_msgSend(v8, "setName:", CFSTR("PIFaceBalanceAutoCalculator-RAW-face-request"));
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__PIFaceBalanceAutoCalculator_calculateRAWWithRequest_completion___block_invoke;
  v27[3] = &unk_1E5019E90;
  v28 = v5;
  v29 = v7;
  v12 = v7;
  v13 = v5;
  objc_msgSend(v8, "submit:", v27);

}

+ (id)faceBalanceResultFromFaceObservations:(id)a3 request:(id)a4 error:(id *)a5
{
  id v5;
  void *v6;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  dispatch_queue_t v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  _UNKNOWN **v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  BOOL v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v75;
  void *v76;
  const void **v77;
  void *specific;
  _BOOL4 v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  const char *v85;
  void *v86;
  NSObject *group;
  id v88;
  _QWORD v89[4];
  id v90;
  NSObject *v91;
  __int128 *v92;
  uint8_t *v93;
  __int128 v94;
  __int128 v95;
  void (*v96)(uint64_t);
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[7];
  _QWORD v105[7];
  void *v106;
  uint8_t v107[32];
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _BYTE buf[24];
  uint64_t v112;
  _BYTE v113[128];
  uint64_t v114;
  CGRect v115;
  CGRect v116;

  v9 = v107;
  v114 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v88 = a4;
  if (!a5)
  {
    NUAssertLogger_5324();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v107 = 138543362;
      *(_QWORD *)&v107[4] = v76;
      _os_log_error_impl(&dword_1A6382000, v75, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v107, 0xCu);

    }
    v77 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5324();
    v10 = objc_claimAutoreleasedReturnValue();
    v79 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v79)
      {
        v5 = dispatch_get_specific(*v77);
        v82 = (void *)MEMORY[0x1E0CB3978];
        v83 = v5;
        objc_msgSend(v82, "callStackSymbols");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "componentsJoinedByString:", CFSTR("\n"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v107 = 138543618;
        *(_QWORD *)&v107[4] = v5;
        *(_WORD *)&v107[12] = 2114;
        *(_QWORD *)&v107[14] = v9;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v107, 0x16u);

      }
    }
    else if (v79)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v107 = 138543362;
      *(_QWORD *)&v107[4] = v81;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v107, 0xCu);

    }
    v85 = "error != nil";
    _NUAssertFailHandler();
    __break(1u);
    goto LABEL_47;
  }
  group = dispatch_group_create();
  -[NSObject faces](v10, "faces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v11 = -[NSObject imageSize](v10, "imageSize");
    v13 = v12;
    v5 = objc_alloc_init(MEMORY[0x1E0D521E8]);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v101 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * i), "boundingBox");
          v116.origin.x = 0.0;
          v116.origin.y = 0.0;
          v116.size.width = 1.0;
          v116.size.height = 1.0;
          CGRectIntersection(v115, v116);
          memset(v107, 0, sizeof(v107));
          v94 = 0uLL;
          *(_QWORD *)&v95 = v11;
          *((_QWORD *)&v95 + 1) = v13;
          NUPixelRectDenormalize();
          v94 = *(_OWORD *)v107;
          v95 = *(_OWORD *)&v107[16];
          objc_msgSend(v5, "addRect:", &v94);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
      }
      while (v15);
    }

    v98 = 0u;
    v99 = 0u;
    if (v5)
      objc_msgSend(v5, "bounds");
    v94 = v98;
    v95 = v99;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)&buf[16] = v11;
    v112 = v13;
    NUPixelRectFlipYOrigin();
    v98 = *(_OWORD *)v107;
    v99 = *(_OWORD *)&v107[16];
    *(_QWORD *)v107 = 0;
    *(_QWORD *)&v107[8] = v107;
    *(_QWORD *)&v107[16] = 0x3810000000;
    *(_QWORD *)&v107[24] = "";
    v108 = 0;
    v109 = 0;
    v110 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52020]), "initWithRequest:", v88);
    objc_msgSend(v6, "setName:", CFSTR("PIWhiteBalanceAutoCalculator-face-balance"));
    +[PIPipelineFilters rawFaceBalanceFilter](PIPipelineFilters, "rawFaceBalanceFilter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPipelineFilters:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 0x400000);
    objc_msgSend(v6, "setScalePolicy:", v20);

    objc_msgSend(v6, "setSampleMode:", 1);
    v21 = objc_alloc(MEMORY[0x1E0D520D8]);
    v94 = v98;
    v95 = v99;
    v22 = (void *)objc_msgSend(v21, "initWithRect:", &v94);
    objc_msgSend(v6, "setRegionPolicy:", v22);

    v23 = dispatch_queue_create("PIRAWFaceBalanceAutoCalculator.responseQueue", 0);
    objc_msgSend(v6, "setResponseQueue:", v23);

    dispatch_group_enter(group);
    *(_QWORD *)&v94 = 0;
    *((_QWORD *)&v94 + 1) = &v94;
    *(_QWORD *)&v95 = 0x3032000000;
    *((_QWORD *)&v95 + 1) = __Block_byref_object_copy__5351;
    v96 = __Block_byref_object_dispose__5352;
    v97 = 0;
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __83__PIFaceBalanceAutoCalculator_faceBalanceResultFromFaceObservations_request_error___block_invoke;
    v89[3] = &unk_1E50162A0;
    v92 = &v94;
    v90 = v14;
    v93 = v107;
    v24 = group;
    v91 = v24;
    objc_msgSend(v6, "submit:", v89);
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    if (*(_QWORD *)(*((_QWORD *)&v94 + 1) + 40))
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failure in rendering image"), v5);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

      _Block_object_dispose(&v94, 8);
      _Block_object_dispose(v107, 8);

      goto LABEL_38;
    }
    v26 = *(double *)(*(_QWORD *)&v107[8] + 32);
    v27 = *(double *)(*(_QWORD *)&v107[8] + 40);
    v28 = *(double *)(*(_QWORD *)&v107[8] + 48);
    v29 = v26 + v27 * 0.956295729 + v28 * 0.62102443;
    v30 = v26 + v27 * -0.272122115 + v28 * -0.64738059;
    *(float64x2_t *)(*(_QWORD *)&v107[8] + 40) = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1A64DDE20, v30 * 0.843295753+ v29 * 0.0951450467+ (v26 + v27 * -1.10698903 + v28 * 1.704615) * 0.0615592338), (float64x2_t)xmmword_1A64DDE30, v30 * 0.404303581+ v29 * 0.592828095+ (v26 + v27 * -1.10698903 + v28 * 1.704615) * 0.00286814501), (float64x2_t)xmmword_1A64DDE40, v30 * 0.0696689114+ v29 * 0.0117029343+ (v26 + v27 * -1.10698903 + v28 * 1.704615) * 0.918628156);
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_16:
      v31 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        v32 = *(_QWORD *)(*(_QWORD *)&v107[8] + 32);
        v33 = *(_QWORD *)(*(_QWORD *)&v107[8] + 40);
        v34 = *(_QWORD *)(*(_QWORD *)&v107[8] + 48);
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2048;
        v112 = v34;
        _os_log_impl(&dword_1A6382000, v31, OS_LOG_TYPE_INFO, "facerect yiq = %.5f, %.5f, %.5f\n", buf, 0x20u);
      }
      v36 = *(double *)(*(_QWORD *)&v107[8] + 40);
      v35 = *(double *)(*(_QWORD *)&v107[8] + 48);
      v37 = &off_1E5012000;
      +[PICompositionController settingForAdjustmentKey:settingKey:](PICompositionController, "settingForAdjustmentKey:settingKey:", CFSTR("whiteBalance"), CFSTR("warmTemp"), v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      +[PICompositionController settingForAdjustmentKey:settingKey:](PICompositionController, "settingForAdjustmentKey:settingKey:", CFSTR("whiteBalance"), CFSTR("warmTint"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "minimumValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      v41 = v40;
      objc_msgSend(v86, "maximumValue");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      v44 = v43;
      v45 = 0.055 - v36;
      v46 = 0.0 - v35;
      v47 = (v45 + (0.0 - v35) * -0.2) * 4.0;
      v48 = v47 < v43;
      v49 = v47;
      if (!v48)
      {
        objc_msgSend(v86, "maximumValue", v47);
        v37 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
      }
      if (v41 > v49)
      {
        objc_msgSend(v86, "minimumValue");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "doubleValue");
        v52 = v53;
      }
      else
      {
        objc_msgSend(v86, "maximumValue");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "doubleValue");
        if (v47 >= v51)
        {
          objc_msgSend(v86, "maximumValue");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "doubleValue");
          v52 = v55;

        }
        else
        {
          v52 = v47;
        }
      }

      if (v47 >= v44)
      objc_msgSend(v38, "minimumValue");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "doubleValue");
      v58 = v57;
      objc_msgSend(v38, "maximumValue");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "doubleValue");
      v61 = v60;
      v62 = (v45 + v46 * 5.0) * 4.0;
      v48 = v62 < v60;
      v63 = v62;
      if (!v48)
      {
        objc_msgSend(v38, "maximumValue", v62);
        v37 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
      }
      if (v58 > v63)
      {
        objc_msgSend(v38, "minimumValue");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "doubleValue");
        v66 = v67;
      }
      else
      {
        objc_msgSend(v38, "maximumValue");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "doubleValue");
        if (v62 >= v65)
        {
          objc_msgSend(v38, "maximumValue");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "doubleValue");
          v66 = v69;

        }
        else
        {
          v66 = v62;
        }
      }

      if (v62 >= v61)
      v104[0] = CFSTR("OrigI");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)&v107[8] + 40));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = v70;
      v104[1] = CFSTR("OrigQ");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)&v107[8] + 48));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v105[1] = v71;
      v105[2] = &unk_1E5051BE8;
      v104[2] = CFSTR("Warmth");
      v104[3] = CFSTR("Strength");
      v105[3] = &unk_1E5051BF8;
      v104[4] = CFSTR("WarmTemp");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v105[4] = v72;
      v104[5] = CFSTR("WarmTint");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v66);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v104[6] = CFSTR("WarmFace");
      v105[5] = v73;
      v105[6] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_37;
    }
LABEL_47:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
    goto LABEL_16;
  }
  v25 = (void *)MEMORY[0x1E0C9AA70];
LABEL_38:

  return v25;
}

+ ($B5E4F2499D3E0A90C7E8AF059312C337)faceRectFromNormalizedFaceRet:(SEL)a3 forImageExtent:(CGRect)a4 scaleX:(id *)a5 scaleY:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  $B5E4F2499D3E0A90C7E8AF059312C337 *result;
  $B5E4F2499D3E0A90C7E8AF059312C337 v13;
  CGAffineTransform v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGAffineTransformMakeScale(&v14, a6, a7);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGRectApplyAffineTransform(v15, &v14);
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  NUPixelRectFromCGRect();
  NUPixelRectMaxCenteredInRect();
  *retstr = v13;
  NUPixelRectInset();
  *retstr = v13;
  result = ($B5E4F2499D3E0A90C7E8AF059312C337 *)NUPixelRectFlipYOrigin();
  *retstr = v13;
  return result;
}

+ ($1AB5FA073B851C12C2339EC22442E995)faceBalanceFromFaceImage:(id)a3 forFaceRect:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  int v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  const void **v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[6];
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE buf[24];
  int v52;
  uint64_t v53;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x3810000000;
  v47 = "";
  v48 = 0;
  v49 = 0;
  v50 = 0;
  objc_msgSend(v5, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52220], "ARGB8");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToPixelFormat:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0x200000001;
    v10 = 3;
  }
  else
  {
    objc_msgSend(v5, "format");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D52220], "RGBA8");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToPixelFormat:", v12);

    if ((v13 & 1) != 0)
    {
      v9 = 0x100000000;
      v10 = 2;
    }
    else
    {
      objc_msgSend(v5, "format");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToPixelFormat:", v15);

      if ((v16 & 1) == 0)
      {
        NUAssertLogger_5324();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported format - incorrect white balance"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v29;
          _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v30 = (const void **)MEMORY[0x1E0D51D48];
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
        NUAssertLogger_5324();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v33)
          {
            v36 = dispatch_get_specific(*v30);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v38;
            _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v33)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v35;
          _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler();
        __break(1u);
      }
      v10 = 0;
      v9 = 0x100000002;
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v52 = 0;
  objc_msgSend(v5, "validRegion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __68__PIFaceBalanceAutoCalculator_faceBalanceFromFaceImage_forFaceRect___block_invoke;
  v39[3] = &unk_1E50162C8;
  var1 = a4->var1;
  var0 = a4->var0;
  v41 = var1;
  v42 = v9;
  v43 = v10;
  v39[4] = &v44;
  v39[5] = buf;
  objc_msgSend(v5, "readBufferRegion:withBlock:", v17, v39);

  v19 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);
  v20 = v45;
  v21 = v45[4];
  if (v19 <= 0)
  {
    v23 = v45[5];
    v24 = v45[6];
  }
  else
  {
    v21 = v21 / (double)v19;
    v22 = v45[6];
    v23 = v45[5] / (double)v19;
    v45[4] = v21;
    v20[5] = v23;
    v24 = v22 / (double)v19;
    v20[6] = v24;
  }
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v44, 8);

  v25 = v21;
  v26 = v23;
  v27 = v24;
  result.var2 = v27;
  result.var1 = v26;
  result.var0 = v25;
  return result;
}

void __68__PIFaceBalanceAutoCalculator_faceBalanceFromFaceImage_forFaceRect___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v2, "frameRect");
  objc_msgSend(v3, "size");
  NUPixelRectIntersection();

}

void __83__PIFaceBalanceAutoCalculator_faceBalanceResultFromFaceObservations_request_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id obj;
  uint8_t buf[32];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "result:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    objc_msgSend(v5, "size");
    v6 = objc_msgSend(v5, "size");
    objc_msgSend(v5, "size");
    v8 = v7;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "boundingBox");
          memset(buf, 0, sizeof(buf));
          v28 = 0uLL;
          *(_QWORD *)&v29 = v6;
          *((_QWORD *)&v29 + 1) = v8;
          +[PIFaceBalanceAutoCalculator faceRectFromNormalizedFaceRet:forImageExtent:scaleX:scaleY:](PIFaceBalanceAutoCalculator, "faceRectFromNormalizedFaceRet:forImageExtent:scaleX:scaleY:", &v28);
          v28 = *(_OWORD *)buf;
          v29 = *(_OWORD *)&buf[16];
          +[PIFaceBalanceAutoCalculator faceBalanceFromFaceImage:forFaceRect:](PIFaceBalanceAutoCalculator, "faceBalanceFromFaceImage:forFaceRect:", v5, &v28);
          v18 = v17;
          v19 = v15;
          v20 = v16;
          v21 = ((v16 + -0.00999999978) * -0.0199999996 + (v15 + -0.0399999991) * 0.0649999976) / 0.00462499967;
          if (v21 < 0.0)
            v21 = 0.0;
          if (v21 > 1.0)
            v21 = 1.0;
          v22 = fmin(1.0/ fmax(pow(sqrt((v15 - ((v21 * 0.5 + 0.25) * 0.0649999976 + 0.0399999991))* (v15 - ((v21 * 0.5 + 0.25) * 0.0649999976 + 0.0399999991))+ (v16 - ((v21 * 0.5 + 0.25) * -0.0199999996 + 0.00999999978))* (v16 - ((v21 * 0.5 + 0.25) * -0.0199999996 + 0.00999999978)))/ 0.0680073501, 3.0), 0.0001), 1.0)* (double)(uint64_t)(*(_QWORD *)&buf[24] * *(_QWORD *)&buf[16]);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 32)
                                                                      + v22 * v18;
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 40)
                                                                      + v22 * v19;
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 48)
                                                                      + v22 * v20;
          v13 = v13 + v22;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v11);

      if (v13 > 0.0)
      {
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                + 32)
                                                                    / v13;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                + 40)
                                                                    / v13;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                + 48)
                                                                    / v13;
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
        v23 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
        {
          v24 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
          v25 = v24[4];
          v26 = v24[5];
          v27 = v24[6];
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = v27;
          _os_log_impl(&dword_1A6382000, v23, OS_LOG_TYPE_INFO, "facerect yiq = %.5f, %.5f, %.5f\n", buf, 0x20u);
        }
      }
    }
    else
    {

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __66__PIFaceBalanceAutoCalculator_calculateRAWWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v11 = 0;
    +[PIFaceBalanceAutoCalculator faceBalanceResultFromFaceObservations:request:error:](PIFaceBalanceAutoCalculator, "faceBalanceResultFromFaceObservations:request:error:", v3, v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = objc_alloc(MEMORY[0x1E0D522A0]);
    if (v6)
      v9 = objc_msgSend(v8, "initWithResult:", v6);
    else
      v9 = objc_msgSend(v8, "initWithError:", v7);
    v10 = (void *)v9;

  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__PIFaceBalanceAutoCalculator_calculateWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = [v3 alloc];
  v67 = 0;
  objc_msgSend(v4, "result:", &v67);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v67;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithDictionary:", v8);

  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTemp"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTint"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v59 = a1;
        +[PICompositionController settingForAdjustmentKey:settingKey:](PICompositionController, "settingForAdjustmentKey:settingKey:", CFSTR("whiteBalance"), CFSTR("warmTemp"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PICompositionController settingForAdjustmentKey:settingKey:](PICompositionController, "settingForAdjustmentKey:settingKey:", CFSTR("whiteBalance"), CFSTR("warmTint"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v13, "minimumValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTemp"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        objc_msgSend(v13, "maximumValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        if (v21 < v23)
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTemp"));
        else
          objc_msgSend(v13, "maximumValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;
        v65 = v13;
        v66 = (void *)v14;
        v61 = v19;
        v63 = v16;
        if (v18 > v26)
        {
          objc_msgSend(v13, "minimumValue");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0;
          v34 = 0;
          v28 = v33;
          v31 = v15;
          a1 = v59;
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTemp"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          v30 = v29;
          objc_msgSend(v13, "maximumValue");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "doubleValue");
          v31 = v15;
          a1 = v59;
          if (v30 >= v32)
          {
            objc_msgSend(v13, "maximumValue");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0;
            v34 = 1;
          }
          else
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTemp"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0;
            v35 = 1;
          }
        }
        objc_msgSend(v33, "doubleValue");
        objc_msgSend(v31, "numberWithDouble:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, CFSTR("WarmTemp"));

        if (v34)
        if (v35)

        if (v18 <= v27)
        v37 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v66, "minimumValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v40 = v39;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTint"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "doubleValue");
        v43 = v42;
        objc_msgSend(v66, "maximumValue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        if (v43 < v45)
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTint"));
        else
          objc_msgSend(v66, "maximumValue");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "doubleValue");
        v48 = v47;
        v62 = v41;
        v64 = v38;
        v60 = v44;
        if (v40 > v47)
        {
          objc_msgSend(v66, "minimumValue");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0;
          v54 = 0;
          v49 = v53;
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTint"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "doubleValue");
          v51 = v50;
          objc_msgSend(v66, "maximumValue");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "doubleValue");
          if (v51 >= v52)
          {
            objc_msgSend(v66, "maximumValue");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = 0;
            v54 = 1;
          }
          else
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WarmTint"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = 0;
            v55 = 1;
          }
        }
        objc_msgSend(v53, "doubleValue");
        objc_msgSend(v37, "numberWithDouble:");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v56, CFSTR("WarmTint"));

        if (v54)
        if (v55)

        if (v40 <= v48)
      }
    }
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v9);
  }
  else
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v7);
  }
  v57 = (void *)v24;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end

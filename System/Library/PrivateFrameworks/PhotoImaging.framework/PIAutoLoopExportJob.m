@implementation PIAutoLoopExportJob

- (PIAutoLoopExportJob)initWithAutoLoopExportRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PIAutoLoopExportJob;
  return -[NUVideoExportJob initWithVideoExportRequest:](&v4, sel_initWithVideoExportRequest_, a3);
}

- (PIAutoLoopExportJob)initWithVideoExportRequest:(id)a3
{
  id v4;
  uint64_t *v5;
  os_log_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  void *specific;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  objc_class *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E0D52380];
    v7 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = v7;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v14 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v14 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_45);
LABEL_7:
        v15 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)MEMORY[0x1E0CB3978];
          v17 = v15;
          objc_msgSend(v16, "callStackSymbols");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v19;
          _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_45);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v20 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v22 = (void *)MEMORY[0x1E0CB3978];
      v23 = specific;
      v17 = v20;
      objc_msgSend(v22, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = specific;
      v29 = 2114;
      v30 = v25;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_45);
  }
}

- (id)renderer:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  +[PIAutoLoopExportJob metalRenderer](PIAutoLoopExportJob, "metalRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PIAutoLoopExportJob;
    -[NUVideoExportJob renderer:](&v10, sel_renderer_, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)writeVideoFrom:(id)a3 toWriter:(id)a4 stillImageTime:(id *)a5 createCustomMetadata:(BOOL)a6 geometryTransform:(id)a7 inputSize:(CGSize)a8 outputSize:(CGSize)a9 error:(id *)a10
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  BOOL v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  dispatch_queue_t v39;
  id v40;
  id v41;
  void *v42;
  unint64_t v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  NSObject *v68;
  void *v69;
  const void **v70;
  void *specific;
  NSObject *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  const void **v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  NSObject *group;
  PILongExposureAccumulator *v94;
  id v95;
  void *v96;
  _QWORD v97[4];
  NSObject *v98;
  _QWORD v99[4];
  id v100;
  PIAutoLoopExportJob *v101;
  PILongExposureAccumulator *v102;
  id v103;
  NSObject *v104;
  _BYTE *v105;
  id *v106;
  _BYTE buf[24];
  double v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v95 = a7;
  if (!a10)
  {
    NUAssertLogger_13987();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v69;
      _os_log_error_impl(&dword_1A6382000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v70 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_13987();
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v73)
      {
        v74 = dispatch_get_specific(*v70);
        v75 = (void *)MEMORY[0x1E0CB3978];
        v76 = v74;
        objc_msgSend(v75, "callStackSymbols");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "componentsJoinedByString:", CFSTR("\n"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v78;
        _os_log_error_impl(&dword_1A6382000, v72, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v73)
    {
LABEL_53:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "componentsJoinedByString:", CFSTR("\n"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v85;
      _os_log_error_impl(&dword_1A6382000, v72, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_56:

    _NUAssertFailHandler();
    __break(1u);
  }
  -[PIAutoLoopExportJob renderer:](self, "renderer:", a10);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    if (-[NURenderJob isCanceled](self, "isCanceled"))
    {
      v16 = (void *)MEMORY[0x1E0D520A0];
      -[NURenderJob request](self, "request");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v16, "canceledError:object:", CFSTR("AL export was canceled"), v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
      *a10 = v19;

LABEL_20:
      goto LABEL_21;
    }
    if ((objc_msgSend(v14, "startReading") & 1) == 0)
    {
      v50 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(v14, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not start reading AVAsset"), v14, v17);
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if ((objc_msgSend(v15, "startWriting") & 1) == 0)
    {
      v52 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "outputURL");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringWithFormat:", CFSTR("Could not start writing AVAsset %@"), v53);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(v15, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "errorWithCode:reason:object:underlyingError:", 1, v17, v15, v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v15, "startSessionAtSourceTime:", buf);
    objc_msgSend(v14, "outputs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    objc_msgSend(v15, "inputs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v21 == objc_msgSend(v22, "count");

    if (v23)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_46);
      v24 = *MEMORY[0x1E0D523A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v96;
        _os_log_impl(&dword_1A6382000, v24, OS_LOG_TYPE_DEFAULT, "AL Export video using renderer: %{public}@", buf, 0xCu);
      }
      -[NURenderJob outputGeometry](self, "outputGeometry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "scaledSize");
      v28 = v27;

      v94 = -[PILongExposureAccumulator initWithSize:renderer:jobNumber:]([PILongExposureAccumulator alloc], "initWithSize:renderer:jobNumber:", v26, v28, v96, -[NURenderJob jobNumber](self, "jobNumber"));
      if (!-[PILongExposureAccumulator start:](v94, "start:", a10))
      {
        v49 = 0;
LABEL_39:

        goto LABEL_22;
      }
      NUAbsoluteTime();
      v30 = v29;
      group = dispatch_group_create();
      objc_msgSend(v14, "outputs");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count") == 0;

      v92 = v15;
      if (!v32)
      {
        v33 = 0;
        do
        {
          objc_msgSend(v15, "inputs");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "outputs");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("export_track_queue_%lu"), v33);
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v39 = dispatch_queue_create((const char *)objc_msgSend(v38, "UTF8String"), 0);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LOBYTE(v108) = 0;
          dispatch_group_enter(group);
          v99[0] = MEMORY[0x1E0C809B0];
          v99[1] = 3221225472;
          v99[2] = __128__PIAutoLoopExportJob_writeVideoFrom_toWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_error___block_invoke;
          v99[3] = &unk_1E5018488;
          v105 = buf;
          v40 = v35;
          v100 = v40;
          v101 = self;
          v102 = v94;
          v41 = v37;
          v103 = v41;
          v106 = a10;
          v104 = group;
          objc_msgSend(v40, "requestMediaDataWhenReadyOnQueue:usingBlock:", v39, v99);

          v15 = v92;
          _Block_object_dispose(buf, 8);

          objc_msgSend(v14, "outputs");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "count");

          ++v33;
        }
        while (v33 < v43);
      }
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      NUAbsoluteTime();
      v45 = v44;
      if (-[NURenderJob isCanceled](self, "isCanceled"))
      {
        v46 = (void *)MEMORY[0x1E0D520A0];
        -[NURenderJob request](self, "request");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(v47, "copy");
        objc_msgSend(v46, "canceledError:object:", CFSTR("AL export was canceled"), v48);
        *a10 = (id)objc_claimAutoreleasedReturnValue();

        v49 = 0;
LABEL_38:

        goto LABEL_39;
      }
      dispatch_group_enter(group);
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = __128__PIAutoLoopExportJob_writeVideoFrom_toWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_error___block_invoke_30;
      v97[3] = &unk_1E50195F0;
      v15 = v92;
      v55 = group;
      v98 = v55;
      objc_msgSend(v92, "finishWritingWithCompletionHandler:", v97);
      -[PIAutoLoopExportJob autoLoopExportRequest](self, "autoLoopExportRequest");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "destinationLongExposureURL");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "destinationUTI");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "outputColorSpace");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PILongExposureAccumulator writeLongExposureImage:UTI:colorSpace:error:](v94, "writeLongExposureImage:UTI:colorSpace:error:", v57, v58, v59, a10))
      {
        objc_msgSend(v56, "destinationMaskURL");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "destinationUTI");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = -[PILongExposureAccumulator writeMaskImage:UTI:error:](v94, "writeMaskImage:UTI:error:", v60, v61, a10);

        if (!v91)
        {
LABEL_36:
          v49 = 0;
LABEL_37:

          v47 = v98;
          goto LABEL_38;
        }
        dispatch_group_wait(v55, 0xFFFFFFFFFFFFFFFFLL);
        NUAbsoluteTime();
        v63 = v62;
        NURenderLogger();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          *(double *)&buf[4] = v45 - v30;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v63 - v45;
          *(_WORD *)&buf[22] = 2048;
          v108 = v63 - v30;
          _os_log_impl(&dword_1A6382000, v64, OS_LOG_TYPE_DEFAULT, "AL Export timings: loop = %g s, finish = %g s, total = %g s", buf, 0x20u);
        }

        if (objc_msgSend(v14, "status") == 3)
        {
          v65 = (void *)MEMORY[0x1E0D520A0];
          objc_msgSend(v14, "error");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read from AVAsset"), v14, v57);
          v66 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v92, "status") != 3)
          {
            v49 = 1;
            goto LABEL_37;
          }
          v67 = (void *)MEMORY[0x1E0D520A0];
          objc_msgSend(v92, "error");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to write to AVAsset"), v92, v57);
          v66 = (id)objc_claimAutoreleasedReturnValue();
        }
        *a10 = v66;
      }
      else
      {

      }
      goto LABEL_36;
    }
    NUAssertLogger_13987();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reader outputs should match writer inputs"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v80;
      _os_log_error_impl(&dword_1A6382000, v79, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v81 = (const void **)MEMORY[0x1E0D51D48];
    v82 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_13987();
    v72 = objc_claimAutoreleasedReturnValue();
    v83 = os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);
    if (!v82)
    {
      if (!v83)
        goto LABEL_56;
      goto LABEL_53;
    }
    if (v83)
    {
      v86 = dispatch_get_specific(*v81);
      v87 = (void *)MEMORY[0x1E0CB3978];
      v88 = v86;
      objc_msgSend(v87, "callStackSymbols");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "componentsJoinedByString:", CFSTR("\n"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v86;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v90;
      _os_log_error_impl(&dword_1A6382000, v72, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_56;
  }
LABEL_21:
  v49 = 0;
LABEL_22:

  return v49;
}

void __128__PIAutoLoopExportJob_writeVideoFrom_toWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  opaqueCMSampleBuffer *v4;
  int v5;
  CVImageBufferRef ImageBuffer;
  void *v7;
  uint8_t v8[16];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_46);
    v2 = *MEMORY[0x1E0D523A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D523A0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6382000, v2, OS_LOG_TYPE_INFO, "media data ready after finished", v8, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
  }
  else
  {
    while (objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isCanceled"))
      {
        objc_msgSend(*(id *)(a1 + 48), "cancel");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        break;
      }
      v3 = objc_msgSend(*(id *)(a1 + 56), "copyNextSampleBuffer");
      if (v3)
      {
        v4 = (opaqueCMSampleBuffer *)v3;
        v5 = objc_msgSend(*(id *)(a1 + 32), "appendSampleBuffer:", v3);
        ImageBuffer = CMSampleBufferGetImageBuffer(v4);
        if (ImageBuffer)
        {
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52040]), "initWithCVPixelBuffer:", ImageBuffer);
          v5 &= objc_msgSend(*(id *)(a1 + 48), "accumulate:error:", v7, *(_QWORD *)(a1 + 80));

        }
        CFRelease(v4);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v5 ^ 1;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        break;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "markAsFinished");
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    }
  }
}

void __128__PIAutoLoopExportJob_writeVideoFrom_toWriter_stillImageTime_createCustomMetadata_geometryTransform_inputSize_outputSize_error___block_invoke_30(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (BOOL)shouldUseMetalRenderer
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D52108], "globalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLSettingForKey:defaultValue:", CFSTR("PI_AUTOLOOP_EXPORT_USE_METAL"), &__block_literal_global_14040);

  return v3;
}

+ (id)metalRenderer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PIAutoLoopExportJob_metalRenderer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (metalRenderer_onceToken != -1)
    dispatch_once(&metalRenderer_onceToken, block);
  return (id)metalRenderer_metalRenderer;
}

void __36__PIAutoLoopExportJob_metalRenderer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldUseMetalRenderer"))
  {
    v3 = MTLCreateSystemDefaultDevice();
    if (v3)
    {
      v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D521B8]), "initWithMetalDevice:options:", v3, 0);
      v2 = (void *)metalRenderer_metalRenderer;
      metalRenderer_metalRenderer = v1;

    }
  }
}

uint64_t __45__PIAutoLoopExportJob_shouldUseMetalRenderer__block_invoke()
{
  return 0;
}

@end

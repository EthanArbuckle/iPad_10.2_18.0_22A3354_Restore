@implementation NURenderPipelineHelper(PI)

- (id)remapPortraitV2Strength:()PI portraitEffectKind:
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.5;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StudioV2")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("StageWhite")))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = pow(v8, 0.75);
    v11 = v9;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ContourV2")) & 1) != 0
         || (objc_msgSend(v6, "isEqualToString:", CFSTR("StageV2")) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", CFSTR("StageMonoV2")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8 * 1.8 + v8 * v8 * -0.8;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8;
  }
  objc_msgSend(v11, "numberWithDouble:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (PIVideoReframeNode)videoReframe:()PI reframes:error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  PIVideoReframeNode *v19;
  void *v20;
  const __CFString *v21;
  NSObject *v23;
  void *v24;
  const void **v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BYTE buf[24];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a5)
  {
    NUAssertLogger_21345();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21345();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific(*v25);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v9 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keyframes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v10)
  {
    v20 = (void *)MEMORY[0x1E0D520A0];
    v21 = CFSTR("Invalid data type for keyframes");
LABEL_7:
    objc_msgSend(v20, "invalidError:object:", v21, v9);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v11)
  {
    v20 = (void *)MEMORY[0x1E0D520A0];
    v21 = CFSTR("Invalid data type for stabCropRect");
    goto LABEL_7;
  }
  +[PIReframeKeyframe keyframesFromDictionaryRepresentations:](PIReframeKeyframe, "keyframesFromDictionaryRepresentations:", v10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("X"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (int)objc_msgSend(v13, "intValue");
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Y"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (int)objc_msgSend(v14, "intValue");
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Width"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (int)objc_msgSend(v15, "intValue");
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Height"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (int)objc_msgSend(v17, "intValue");

  *(_QWORD *)buf = v37;
  *(_QWORD *)&buf[8] = v36;
  *(_QWORD *)&buf[16] = v16;
  v40 = v18;
  v19 = -[PIVideoReframeNode initWithKeyframes:stabCropRect:input:]([PIVideoReframeNode alloc], "initWithKeyframes:stabCropRect:input:", v38, buf, v7);

LABEL_8:
  return v19;
}

- (PIVideoCrossfadeLoopNode)videoCrossfadeLoop:()PI crossfadeAdjustment:error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PIVideoCrossfadeLoopNode *v19;
  PIVideoCrossfadeLoopNode *v20;
  void *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  const void **v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CMTime v40;
  CMTime v41;
  CMTimeRange v42;
  CMTime duration;
  CMTime start;
  CMTime v45;
  CMTime v46;
  CMTimeRange v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a5)
  {
    NUAssertLogger_21345();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v47.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v47.start.value + 4) = (CMTimeValue)v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v47, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21345();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v32 = dispatch_get_specific(*v26);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v47.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v47.start.value + 4) = (CMTimeValue)v32;
        LOWORD(v47.start.flags) = 2114;
        *(_QWORD *)((char *)&v47.start.flags + 2) = v36;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v47, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v47.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v47.start.value + 4) = (CMTimeValue)v31;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v47, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v9 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("crossfadeDurationValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("crossfadeDurationTimescale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("startTimeValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("startTimeTimescale"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeRangeStartValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeRangeStartTimescale"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeRangeDurationValue"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeRangeDurationTimescale"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  v39 = v11;
  if (!v10 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Missing duration for crossfade"), v9);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v18 = v37;
    v17 = v38;
    goto LABEL_9;
  }
  if (!v7)
  {
    v21 = (void *)MEMORY[0x1E0D520A0];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "missingError:object:", CFSTR("input to VideoCrossfadeLoop cannot be nil"), v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    goto LABEL_8;
  }
  memset(&v46, 0, sizeof(v46));
  CMTimeMake(&v46, objc_msgSend(v10, "longLongValue"), objc_msgSend(v11, "intValue"));
  memset(&v45, 0, sizeof(v45));
  CMTimeMake(&v45, objc_msgSend(v12, "longLongValue"), objc_msgSend(v13, "intValue"));
  memset(&v47, 0, sizeof(v47));
  CMTimeMake(&start, objc_msgSend(v14, "longLongValue"), objc_msgSend(v15, "intValue"));
  v17 = v38;
  v18 = v37;
  CMTimeMake(&duration, objc_msgSend(v38, "longLongValue"), objc_msgSend(v37, "intValue"));
  CMTimeRangeMake(&v47, &start, &duration);
  v19 = [PIVideoCrossfadeLoopNode alloc];
  v42 = v47;
  v41 = v46;
  v40 = v45;
  v20 = -[PIVideoCrossfadeLoopNode initWithInput:timeRange:crossfadeDuration:startTime:](v19, "initWithInput:timeRange:crossfadeDuration:startTime:", v7, &v42, &v41, &v40);
LABEL_9:

  return v20;
}

- (PIPortraitVideoRenderNode)portraitVideo:()PI disparityInput:disparityKeyframes:apertureKeyframes:debugMode:error:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PIPortraitVideoRenderNode *v20;
  NSObject *v22;
  void *v23;
  const void **v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!a8)
  {
    NUAssertLogger_21345();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21345();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific(*v24);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v30;
        v37 = 2114;
        v38 = v34;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v29;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v17 = v16;
  __112__NURenderPipelineHelper_PI__portraitVideo_disparityInput_disparityKeyframes_apertureKeyframes_debugMode_error___block_invoke(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __112__NURenderPipelineHelper_PI__portraitVideo_disparityInput_disparityKeyframes_apertureKeyframes_debugMode_error___block_invoke(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PIPortraitVideoRenderNode initWithInput:disparityInput:disparityKeyframes:apertureKeyframes:debugMode:]([PIPortraitVideoRenderNode alloc], "initWithInput:disparityInput:disparityKeyframes:apertureKeyframes:debugMode:", v13, v14, v18, v19, a7);

  return v20;
}

- (PIPortraitVideoDebugDetectionsRenderNode)portraitVideoDebugDetectedObjects:()PI source:cinematographyState:monochrome:error:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  PIPortraitVideoDebugDetectionsRenderNode *v18;
  void *v19;
  PIPortraitVideoDebugDetectionsRenderNode *v20;
  NSObject *v22;
  void *v23;
  const void **v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a7)
  {
    NUAssertLogger_21345();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21345();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific(*v24);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v30;
        v37 = 2114;
        v38 = v34;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v29;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v14 = v13;
  objc_msgSend(v12, "definition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "sourceDefinitions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v15;
    else
      v17 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [PIPortraitVideoDebugDetectionsRenderNode alloc];
    objc_msgSend(v17, "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PIPortraitVideoDebugDetectionsRenderNode initWithInput:assetURL:cinematographyState:monochrome:](v18, "initWithInput:assetURL:cinematographyState:monochrome:", v11, v19, v14, a6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Unexpected source type"), v12);
    v20 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (uint64_t)versionForPortraitEffect:()PI
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_1E5058F68, "containsObject:", v3))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (id)performLongExposureFusionForComposition:()PI longExposureImage:useHDRFilter:error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  _QWORD v41[9];
  _QWORD v42[11];

  v42[9] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("highResFusion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("alignment"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("extent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("transform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getTagWithPath:error:", CFSTR("AutoLoop/LongExposureMotion"), a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v38 = v9;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("source"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "renderNodeFromSource:settings:error:", v16, &unk_1E505CE28, a6);
    v17 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v17;
    if (v17)
    {
      objc_msgSend(v10, "outputImageGeometry:", a6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v35 = v14;
        v41[0] = CFSTR("__dominantInputSettingsKey");
        v41[1] = CFSTR("__gainMapMode");
        v42[0] = CFSTR("inputStillImage");
        v42[1] = &unk_1E5051940;
        v41[2] = CFSTR("inputVideoScale");
        v20 = (void *)MEMORY[0x1E0CB37E8];
        v21 = (double)objc_msgSend(v18, "renderScale");
        objc_msgSend(v19, "renderScale");
        objc_msgSend(v20, "numberWithDouble:", v21 / (double)v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v42[2] = v23;
        v41[3] = CFSTR("inputRenderScale");
        objc_msgSend(MEMORY[0x1E0D52268], "scaleMultiplyOfScalar:", 1.0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v42[3] = v32;
        v41[4] = CFSTR("inputAlignmentExtent");
        objc_msgSend(a1, "vectorWithFloats:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v42[4] = v24;
        v41[5] = CFSTR("inputAlignmentTransform");
        objc_msgSend(a1, "vectorWithFloats:", v14);
        v34 = v19;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v42[5] = v25;
        v42[6] = v10;
        v41[6] = CFSTR("inputImage");
        v41[7] = CFSTR("inputStillImage");
        v41[8] = CFSTR("inputMaskImage");
        v42[7] = v39;
        v42[8] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PILongExposureFusion"), a5, v26);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v27, "integerValue");
        objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "integerValue");

        v19 = v34;
        v40[0] = 0;
        v40[1] = 0;
        v40[2] = v33;
        v40[3] = v29;
        v14 = v35;
        objc_msgSend(a1, "cropNode:cropRect:cropSettings:", v37, v40, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v30 = 0;
      }
      v9 = v38;

    }
    else
    {
      v30 = 0;
      v9 = v38;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)performApertureRedeyeOnImage:()PI useHDRFilter:redEyeAdjustment:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("inputImage");
  v15[1] = CFSTR("inputSpots");
  v16[0] = a3;
  v8 = (void *)MEMORY[0x1E0D52268];
  v9 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("inputCorrectionInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "redEyeSpotsWithCorrectionInfo:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PIApertureRedEyeFilter"), a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)performRedeyeOnImage:()PI useHDRFilter:redEyeAdjustment:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("inputCorrectionInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iPhone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = &stru_1E501A310;
    if (v11)
      v12 = CFSTR("iPhone");
    v13 = v12;

    v19[0] = CFSTR("inputImage");
    v14 = objc_alloc(MEMORY[0x1E0D52298]);
    v15 = (void *)objc_msgSend(v14, "initWithInput:scale:", v8, *MEMORY[0x1E0D51F70], *(_QWORD *)(MEMORY[0x1E0D51F70] + 8));
    v20[0] = v15;
    v20[1] = v8;
    v19[1] = CFSTR("inputDestinationImage");
    v19[2] = CFSTR("inputCorrectionInfo");
    v20[2] = v10;
    v20[3] = v13;
    v19[3] = CFSTR("inputCameraModel");
    v19[4] = CFSTR("__dominantInputSettingsKey");
    v20[4] = CFSTR("inputDestinationImage");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PIRedEye"), a4, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v17;
  }

  return v8;
}

- (id)nodeByApplyingFilterWithName:()PI useHDRFilter:settingsAndInputs:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v10)
    goto LABEL_14;
  v11 = v10;
  v12 = *(_QWORD *)v27;
  v25 = (void *)*MEMORY[0x1E0C9E288];
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v9, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v8;
      }
      else
      {
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("filterVersion")))
        {
          v16 = v7;
          v17 = v15;
          v18 = v25;
          goto LABEL_12;
        }
        v16 = v7;
      }
      v17 = v15;
      v18 = v14;
LABEL_12:
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v18);

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v11);
LABEL_14:

  if (a4)
  {
    +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", v24);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v19;
  }
  else
  {
    v20 = v24;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520C8]), "initWithFilterName:settings:inputs:", v20, v7, v8);

  return v21;
}

- (id)debugNodeByApplyingFilterWithName:()PI useHDRFilter:settingsAndInputs:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v10)
    goto LABEL_14;
  v11 = v10;
  v12 = *(_QWORD *)v27;
  v25 = (void *)*MEMORY[0x1E0C9E288];
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v9, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v8;
      }
      else
      {
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("filterVersion")))
        {
          v16 = v7;
          v17 = v15;
          v18 = v25;
          goto LABEL_12;
        }
        v16 = v7;
      }
      v17 = v15;
      v18 = v14;
LABEL_12:
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v18);

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v11);
LABEL_14:

  if (a4)
  {
    +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", v24);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v19;
  }
  else
  {
    v20 = v24;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52088]), "initWithFilterName:settings:inputs:", v20, v7, v8);

  return v21;
}

@end

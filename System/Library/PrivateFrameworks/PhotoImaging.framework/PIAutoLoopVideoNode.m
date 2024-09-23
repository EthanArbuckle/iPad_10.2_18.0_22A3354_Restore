@implementation PIAutoLoopVideoNode

- (PIAutoLoopVideoNode)initWithSettings:(id)a3 inputs:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  os_log_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  void *specific;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  objc_class *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v9 = (os_log_t *)MEMORY[0x1E0D52380];
    v10 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v17 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21473);
LABEL_7:
        v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)MEMORY[0x1E0CB3978];
          v20 = v18;
          objc_msgSend(v19, "callStackSymbols");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v22;
          _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21473);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v25 = (void *)MEMORY[0x1E0CB3978];
      v26 = specific;
      v20 = v23;
      objc_msgSend(v25, "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = specific;
      v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21473);
  }
}

- (PIAutoLoopVideoNode)initWithInput:(id)a3 frameDuration:(id *)a4 trimRange:(id *)a5 settings:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  id v16;
  CFDictionaryRef v17;
  void *v18;
  char *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v25;
  void *v26;
  const void **v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  objc_super v56;
  __int128 v57;
  int64_t var3;
  uint64_t v59;
  id v60;
  _BYTE time[32];
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (!v10)
  {
    NUAssertLogger_21458();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138543362;
      *(_QWORD *)&time[4] = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", time, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v43 = dispatch_get_specific(*v27);
        v44 = (void *)MEMORY[0x1E0CB3978];
        v45 = v43;
        objc_msgSend(v44, "callStackSymbols");
        v27 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)time = 138543618;
        *(_QWORD *)&time[4] = v43;
        *(_WORD *)&time[12] = 2114;
        *(_QWORD *)&time[14] = v46;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", time, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138543362;
      *(_QWORD *)&time[4] = v27;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", time, 0xCu);

    }
    v35 = _NUAssertFailHandler();
    goto LABEL_28;
  }
  if ((a4->var2 & 1) == 0)
  {
    NUAssertLogger_21458();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIME_IS_VALID(frameDuration)");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138543362;
      *(_QWORD *)&time[4] = v33;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", time, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    v34 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v29 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)time = 138543362;
        *(_QWORD *)&time[4] = v27;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", time, 0xCu);

      }
LABEL_30:

      v40 = _NUAssertFailHandler();
      goto LABEL_31;
    }
LABEL_28:
    if (v35)
    {
      v47 = dispatch_get_specific(*v27);
      v48 = (void *)MEMORY[0x1E0CB3978];
      v49 = v47;
      objc_msgSend(v48, "callStackSymbols");
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138543618;
      *(_QWORD *)&time[4] = v47;
      *(_WORD *)&time[12] = 2114;
      *(_QWORD *)&time[14] = v50;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", time, 0x16u);

    }
    goto LABEL_30;
  }
  v12 = v11;
  if (!v11)
  {
    NUAssertLogger_21458();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "loopParams != nil");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138543362;
      *(_QWORD *)&time[4] = v38;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", time, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    v39 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v29 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)time = 138543362;
        *(_QWORD *)&time[4] = v42;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", time, 0xCu);

      }
      goto LABEL_33;
    }
LABEL_31:
    if (v40)
    {
      v51 = dispatch_get_specific(*v27);
      v52 = (void *)MEMORY[0x1E0CB3978];
      v53 = v51;
      objc_msgSend(v52, "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)time = 138543618;
      *(_QWORD *)&time[4] = v51;
      *(_WORD *)&time[12] = 2114;
      *(_QWORD *)&time[14] = v55;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", time, 0x16u);

    }
LABEL_33:

    _NUAssertFailHandler();
  }
  if ((a5->var0.var2 & 1) != 0
    && (a5->var1.var2 & 1) != 0
    && !a5->var1.var3
    && (a5->var1.var0 & 0x8000000000000000) == 0)
  {
    v13 = (void *)objc_opt_class();
    v14 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)time = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time[16] = v14;
    v62 = *(_OWORD *)&a5->var1.var1;
    v57 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v13, "loopParamsForTrimRange:frameDuration:", time, &v57);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("loopParams"));
  *(_OWORD *)time = *(_OWORD *)&a4->var0;
  *(_QWORD *)&time[16] = a4->var3;
  v17 = CMTimeCopyAsDictionary((CMTime *)time, 0);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("frameDuration"));

  v59 = *MEMORY[0x1E0C9E1F8];
  v60 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56.receiver = self;
  v56.super_class = (Class)PIAutoLoopVideoNode;
  v19 = -[NURenderNode initWithSettings:inputs:](&v56, sel_initWithSettings_inputs_, v16, v18);

  v20 = a4->var3;
  *(_OWORD *)(v19 + 180) = *(_OWORD *)&a4->var0;
  *(_QWORD *)(v19 + 196) = v20;
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D004F0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v19 + 42) = objc_msgSend(v21, "intValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D004E8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v19 + 43) = objc_msgSend(v22, "intValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D004E0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v19 + 44) = objc_msgSend(v23, "intValue");

  return (PIAutoLoopVideoNode *)v19;
}

- (NURenderNode)input
{
  void *v2;
  void *v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NURenderNode *)v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopDuration
{
  CMTime time;

  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiply((CMTime *)retstr, &time, -[PIAutoLoopVideoNode loopPeriod](self, "loopPeriod"));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  CMTime time;

  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiply((CMTime *)retstr, &time, -[PIAutoLoopVideoNode fadeLength](self, "fadeLength")+ -[PIAutoLoopVideoNode loopStart](self, "loopStart"));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeDuration
{
  CMTime time;

  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiply((CMTime *)retstr, &time, -[PIAutoLoopVideoNode fadeLength](self, "fadeLength"));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeStartTime
{
  CMTime time;

  -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiply((CMTime *)retstr, &time, -[PIAutoLoopVideoNode loopStart](self, "loopStart"));
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  void *v3;
  void *v4;
  NSObject *v6;
  void *v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_21458();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v14;
        v24 = 2114;
        v25 = v18;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v21.receiver = self;
  v21.super_class = (Class)PIAutoLoopVideoNode;
  -[NURenderNode _evaluateVideoProperties:](&v21, sel__evaluateVideoProperties_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52368]), "initWithProperties:", v3);
    v19 = *MEMORY[0x1E0CA2E18];
    v20 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v4, "setLivePhotoKeyFrameTime:", &v19);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  __int128 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PIAutoLoopVideoNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v10, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)(&self->_fadeLength + 1);
  *(_QWORD *)(v7 + 196) = *(_QWORD *)&self->_frameDuration.flags;
  *(_OWORD *)(v7 + 180) = v8;
  *(_DWORD *)(v7 + 168) = self->_loopStart;
  *(_DWORD *)(v7 + 172) = self->_loopPeriod;
  *(_DWORD *)(v7 + 176) = self->_fadeLength;
  return (id)v7;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v39;
  void *v40;
  const void **v41;
  void *specific;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  CMTime v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CMTime v66;
  CMTime rhs;
  CMTime lhs;
  CMTime v69;
  objc_super v70;
  _QWORD v71[2];
  _QWORD v72[2];
  uint64_t v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  uint8_t buf[24];
  const __CFString *v78;
  _QWORD v79[4];

  v79[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_21458();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v40;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v41 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v44)
      {
        v47 = dispatch_get_specific(*v41);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v51;
        _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v46;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "evaluationMode");
  if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v12 = v11;
    v13 = (void *)objc_msgSend(v10, "copy");
    if (v12 == 3)
    {
      objc_msgSend(v10, "videoFrames");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("primary"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing primary video frame"), v10);
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
      v78 = CFSTR("video");
      v79[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setVideoFrames:", v16);

    }
    -[PIAutoLoopVideoNode startTime](self, "startTime");
    if (v10)
      objc_msgSend(v10, "time");
    else
      memset(&rhs, 0, sizeof(rhs));
    CMTimeAdd(&v69, &lhs, &rhs);
    v66 = v69;
    objc_msgSend(v13, "setTime:", &v66);
    -[PIAutoLoopVideoNode input](self, "input");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v13, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v17 = 0;
LABEL_29:

      goto LABEL_30;
    }
    memset(buf, 0, sizeof(buf));
    if (v10)
    {
      objc_msgSend(v10, "time");
      v63 = 0;
      v64 = 0;
      v65 = 0;
      -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
      objc_msgSend(v10, "time");
      v20 = v60;
      v21 = *(int *)&buf[8];
    }
    else
    {
      v63 = 0;
      v64 = 0;
      v65 = 0;
      -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
      v21 = 0;
      v20 = 0;
      v60 = 0;
      v61 = 0;
      v62 = 0;
    }
    v22 = (int)(v20 * (int)v64 / (v63 * v21)) % -[PIAutoLoopVideoNode loopPeriod](self, "loopPeriod");
    v23 = -[PIAutoLoopVideoNode fadeLength](self, "fadeLength") + v22;
    if (v23 < -[PIAutoLoopVideoNode loopPeriod](self, "loopPeriod"))
    {
      v17 = v19;
      goto LABEL_29;
    }
    v24 = -[PIAutoLoopVideoNode loopPeriod](self, "loopPeriod");
    v53 = -[PIAutoLoopVideoNode fadeLength](self, "fadeLength");
    v25 = (void *)objc_msgSend(v10, "copy");
    if (v12 == 3)
    {
      v52 = v24;
      objc_msgSend(v10, "videoFrames");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("secondary"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing secondary video frame"), v10);
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

        goto LABEL_29;
      }
      v75 = CFSTR("video");
      v76 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setVideoFrames:", v28);

      v24 = v52;
    }
    -[PIAutoLoopVideoNode startTime](self, "startTime");
    -[PIAutoLoopVideoNode loopDuration](self, "loopDuration");
    if (v10)
      objc_msgSend(v10, "time");
    else
      memset(&v55, 0, sizeof(v55));
    CMTimeSubtract(&v57, &v56, &v55);
    CMTimeSubtract(&v59, &v58, &v57);
    v54 = v59;
    objc_msgSend(v25, "setTime:", &v54);
    -[PIAutoLoopVideoNode input](self, "input");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v25, a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = objc_alloc(MEMORY[0x1E0D520C8]);
      v73 = *MEMORY[0x1E0C9E278];
      *(float *)&v32 = 1.0 - (float)((float)(v24 - v22) / (float)v53);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *MEMORY[0x1E0C9E270];
      v71[0] = *MEMORY[0x1E0C9E1F8];
      v71[1] = v35;
      v72[0] = v19;
      v72[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v31, "initWithFilterName:settings:inputs:", CFSTR("CIDissolveTransition"), v34, v36);

      objc_msgSend(MEMORY[0x1E0D52258], "nodeFromCache:cache:", v37, v8);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));

    }
    else
    {
      v17 = 0;
    }

    goto LABEL_28;
  }
  v70.receiver = self;
  v70.super_class = (Class)PIAutoLoopVideoNode;
  -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v70, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v17;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CMTimeEpoch v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v30;
  void *v31;
  const void **v32;
  void *specific;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  _BYTE v50[48];
  id v51;
  CMTime rhs;
  CMTime v53;
  _BYTE v54[48];
  CMTime v55;
  CMTime v56;
  CMTimeRange time2;
  id v58;
  _BYTE v59[48];
  CMTime v60;
  CMTimeRange v61;
  CMTime lhs;
  CMTime v63;
  CMTime v64;
  id v65;
  CMTimeRange time1;
  _BYTE v67[48];
  id v68;
  CMTimeRange v69;
  _BYTE v70[96];
  CMTime duration;
  CMTime start;
  CMTimeRange v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_21458();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v73.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v73.start.value + 4) = (CMTimeValue)v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v73, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v38 = dispatch_get_specific(*v32);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v73.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v73.start.value + 4) = (CMTimeValue)v38;
        LOWORD(v73.start.flags) = 2114;
        *(_QWORD *)((char *)&v73.start.flags + 2) = v42;
        _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v73, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v73.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v73.start.value + 4) = (CMTimeValue)v37;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v73, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[PIAutoLoopVideoNode input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVideo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C8B268]);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 1, CFSTR("[[AVMutableComposition alloc] init] failed."), self);
      v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0D52348], "firstEnabledVideoTrackInAsset:error:", v6, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v20 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v47 = *MEMORY[0x1E0C8A7A0];
    objc_msgSend(v6, "tracksWithMediaType:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x1E0C8A808];
    objc_msgSend(v7, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A808], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v73, 0, sizeof(v73));
    -[PIAutoLoopVideoNode startTime](self, "startTime");
    -[PIAutoLoopVideoNode loopDuration](self, "loopDuration");
    CMTimeRangeMake(&v73, &start, &duration);
    memset(&v70[48], 0, 48);
    v13 = (void *)MEMORY[0x1E0D52348];
    objc_msgSend(v8, "timeRange");
    v69 = v73;
    objc_msgSend(v13, "conformRange:inRange:", &v69, v70);
    v68 = 0;
    v69 = *(CMTimeRange *)&v70[48];
    v44 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&time1.start.value = *MEMORY[0x1E0CA2E68];
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    time1.start.epoch = v14;
    v48 = v12;
    LOBYTE(v13) = objc_msgSend(v12, "insertTimeRange:ofTrack:atTime:error:", &v69, v8, &time1, &v68);
    v15 = v68;
    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update video track #1"), self, v15);
      v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
      v28 = v48;
      goto LABEL_32;
    }
    if (!v10)
      goto LABEL_18;
    v43 = v11;
    objc_msgSend(v7, "addMutableTrackWithMediaType:preferredTrackID:", v47, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v69, 0, sizeof(v69));
    v17 = (void *)MEMORY[0x1E0D52348];
    objc_msgSend(v10, "timeRange");
    time1 = v73;
    objc_msgSend(v17, "conformRange:inRange:", &time1, v67);
    v65 = v15;
    time1 = v69;
    *(_OWORD *)&time2.start.value = v44;
    time2.start.epoch = v14;
    v45 = v16;
    LOBYTE(v17) = objc_msgSend(v16, "insertTimeRange:ofTrack:atTime:error:", &time1, v10, &time2, &v65);
    v18 = v65;

    if ((v17 & 1) != 0)
    {
      time1.start = v69.duration;
      time2.start = *(CMTime *)&v70[72];
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0)
      {
        v15 = v18;
        v11 = v43;
        v19 = v45;
LABEL_17:

LABEL_18:
        if (-[PIAutoLoopVideoNode fadeLength](self, "fadeLength") < 1)
        {
          v28 = v48;
LABEL_27:
          v20 = v7;
LABEL_32:

          goto LABEL_33;
        }
        objc_msgSend(v7, "addMutableTrackWithMediaType:preferredTrackID:", v11, 1);
        v22 = objc_claimAutoreleasedReturnValue();
        -[PIAutoLoopVideoNode fadeStartTime](self, "fadeStartTime");
        -[PIAutoLoopVideoNode fadeDuration](self, "fadeDuration");
        CMTimeRangeMake(&v69, &v56, &v55);
        v73 = v69;
        v23 = (void *)MEMORY[0x1E0D52348];
        objc_msgSend(v8, "timeRange");
        time1 = v73;
        objc_msgSend(v23, "conformRange:inRange:", &time1, v54);
        *(CMTimeRange *)&v70[48] = v69;
        memset(&time2, 0, 24);
        -[PIAutoLoopVideoNode loopDuration](self, "loopDuration");
        -[PIAutoLoopVideoNode fadeDuration](self, "fadeDuration");
        CMTimeSubtract(&time2.start, &v53, &rhs);
        v51 = v15;
        v69 = *(CMTimeRange *)&v70[48];
        *(_OWORD *)&time1.start.value = *(_OWORD *)&time2.start.value;
        time1.start.epoch = time2.start.epoch;
        v46 = (void *)v22;
        LOBYTE(v22) = objc_msgSend((id)v22, "insertTimeRange:ofTrack:atTime:error:", &v69, v8, &time1, &v51);
        v24 = v51;

        if ((v22 & 1) != 0)
        {
          if (!v10)
          {
            v15 = v24;
            goto LABEL_26;
          }
          objc_msgSend(v7, "addMutableTrackWithMediaType:preferredTrackID:", v47, 3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&v69, 0, sizeof(v69));
          v26 = (void *)MEMORY[0x1E0D52348];
          objc_msgSend(v10, "timeRange");
          time1 = v73;
          objc_msgSend(v26, "conformRange:inRange:", &time1, v50);
          v49 = v24;
          time1 = v69;
          v64 = time2.start;
          v27 = objc_msgSend(v25, "insertTimeRange:ofTrack:atTime:error:", &time1, v10, &v64, &v49);
          v15 = v49;

          if ((v27 & 1) != 0)
          {

LABEL_26:
            v28 = v48;

            goto LABEL_27;
          }
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update audio track #2"), self, v15);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update video track #2"), self, v24);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          v15 = v24;
        }

        goto LABEL_30;
      }
      memset(&v64, 0, sizeof(v64));
      time1.start = *(CMTime *)&v70[72];
      time2.start = v69.duration;
      CMTimeSubtract(&v64, &time1.start, &time2.start);
      memset(&v63, 0, sizeof(v63));
      -[PIAutoLoopVideoNode startTime](self, "startTime");
      time1.start = v64;
      CMTimeSubtract(&v63, &lhs, &time1.start);
      memset(&time1, 0, sizeof(time1));
      v21 = (void *)MEMORY[0x1E0D52348];
      time2.start = v63;
      v60 = v64;
      CMTimeRangeMake(&v61, &time2.start, &v60);
      objc_msgSend(v10, "timeRange");
      objc_msgSend(v21, "conformRange:inRange:", &v61, v59);
      v58 = v18;
      time2 = time1;
      v60 = v69.duration;
      v19 = v45;
      LOBYTE(v21) = objc_msgSend(v45, "insertTimeRange:ofTrack:atTime:error:", &time2, v10, &v60, &v58);
      v15 = v58;

      v11 = v43;
      if ((v21 & 1) != 0)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update audio track #1"), self, v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to update audio track #1"), self, v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v18;
      v19 = v45;
    }

LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
  v20 = 0;
LABEL_35:

  return v20;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  const void **v31;
  void *specific;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  CMTimeRange v49;
  CMTime v50;
  CMTimeRange v51;
  CMTimeRange v52;
  CMTime duration;
  CMTime start;
  CMTimeRange v55;
  CMTime rhs;
  CMTime lhs;
  _QWORD v58[2];
  void *v59;
  CMTime v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_21458();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v60.value) = 138543362;
      *(CMTimeValue *)((char *)&v60.value + 4) = (CMTimeValue)v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v60, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v37 = dispatch_get_specific(*v31);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v60.value) = 138543618;
        *(CMTimeValue *)((char *)&v60.value + 4) = (CMTimeValue)v37;
        LOWORD(v60.flags) = 2114;
        *(_QWORD *)((char *)&v60.flags + 2) = v41;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v60, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v60.value) = 138543362;
      *(CMTimeValue *)((char *)&v60.value + 4) = (CMTimeValue)v36;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v60, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode outputVideo:](self, "outputVideo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderNode inputs](self, "inputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "outputVideoComposition:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "instructions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 == 1)
      {
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc_init(MEMORY[0x1E0D52310]);
        memset(&v60, 0, sizeof(v60));
        -[PIAutoLoopVideoNode loopDuration](self, "loopDuration");
        -[PIAutoLoopVideoNode fadeDuration](self, "fadeDuration");
        CMTimeSubtract(&v60, &lhs, &rhs);
        start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        duration = v60;
        CMTimeRangeMake(&v55, &start, &duration);
        v52 = v55;
        objc_msgSend(v15, "setTimeRange:", &v52);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "trackID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setRequiredSourceTrackIDs:", v17);

        v43 = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "trackID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSourceIdentifier:forTrackID:", CFSTR("primary"), v18);

        objc_msgSend(v44, "addObject:", v15);
        if (objc_msgSend(v7, "count") == 2)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_alloc_init(MEMORY[0x1E0D52310]);
          -[PIAutoLoopVideoNode fadeDuration](self, "fadeDuration");
          start = v60;
          CMTimeRangeMake(&v51, &start, &v50);
          v49 = v51;
          objc_msgSend(v19, "setTimeRange:", &v49);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "trackID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = v20;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v42, "trackID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v58[1] = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setRequiredSourceTrackIDs:", v22);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v43, "trackID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSourceIdentifier:forTrackID:", CFSTR("primary"), v23);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v42, "trackID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setSourceIdentifier:forTrackID:", CFSTR("secondary"), v24);

          objc_msgSend(v44, "addObject:", v19);
        }
        v25 = objc_alloc_init(MEMORY[0x1E0C8B288]);
        -[PIAutoLoopVideoNode frameDuration](self, "frameDuration");
        v45 = v47;
        v46 = v48;
        objc_msgSend(v25, "setFrameDuration:", &v45);
        objc_msgSend(v25, "setInstructions:", v44);

        goto LABEL_11;
      }
      v26 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(v11, "instructions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "unsupportedError:object:", CFSTR("Unsupported video configuration"), v27);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v25 = 0;
LABEL_12:

  return v25;
}

- (BOOL)requiresAudioMix
{
  return 1;
}

- (id)_evaluateAudioMix:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  CMTimeEpoch epoch;
  double v16;
  __double2 v17;
  float cosval;
  __double2 v19;
  float v20;
  float v21;
  float sinval;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  NSObject *v29;
  void *v30;
  const void **v31;
  void *specific;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  __int128 v42;
  CMTimeRange v43;
  CMTime duration;
  CMTime start;
  CMTimeRange v46;
  CMTime time;
  CMTime v48;
  CMTime v49;
  CMTime rhs;
  CMTime lhs;
  _QWORD v52[2];
  CMTime v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_21458();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53.value) = 138543362;
      *(CMTimeValue *)((char *)&v53.value + 4) = (CMTimeValue)v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v53, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21458();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v37 = dispatch_get_specific(*v31);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v53.value) = 138543618;
        *(CMTimeValue *)((char *)&v53.value + 4) = (CMTimeValue)v37;
        LOWORD(v53.flags) = 2114;
        *(_QWORD *)((char *)&v53.flags + 2) = v41;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v53, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53.value) = 138543362;
      *(CMTimeValue *)((char *)&v53.value + 4) = (CMTimeValue)v36;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v53, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode outputVideo:](self, "outputVideo:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") > 1)
    {
      v8 = (void *)MEMORY[0x1E0C8B260];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioMixInputParametersWithTrack:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0C8B260];
      v12 = 1;
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "audioMixInputParametersWithTrack:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      v42 = *(_OWORD *)&v53.value;
      epoch = v53.epoch;
      objc_msgSend(v10, "setVolume:atTime:", &v53, COERCE_DOUBLE(__PAIR64__(HIDWORD(v53.value), 1.0)));
      HIDWORD(v16) = DWORD1(v42);
      *(_OWORD *)&v53.value = v42;
      v53.epoch = epoch;
      LODWORD(v16) = 0;
      objc_msgSend(v14, "setVolume:atTime:", &v53, v16);
      memset(&v53, 0, sizeof(v53));
      -[PIAutoLoopVideoNode loopDuration](self, "loopDuration");
      -[PIAutoLoopVideoNode fadeDuration](self, "fadeDuration");
      CMTimeSubtract(&v53, &lhs, &rhs);
      v49 = v53;
      memset(&v48, 0, sizeof(v48));
      -[PIAutoLoopVideoNode fadeDuration](self, "fadeDuration");
      CMTimeMultiplyByRatio(&v48, &time, 1, 20);
      do
      {
        v17 = __sincos_stret((float)((float)(v12 - 1) / 20.0) * 1.57079633);
        cosval = v17.__cosval;
        v19 = __sincos_stret((float)((float)v12 / 20.0) * 1.57079633);
        v20 = v19.__cosval;
        sinval = v19.__sinval;
        start = v49;
        duration = v48;
        CMTimeRangeMake(&v46, &start, &duration);
        *(float *)&v23 = cosval;
        *(float *)&v24 = v20;
        objc_msgSend(v10, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v46, v23, v24);
        start = v49;
        duration = v48;
        CMTimeRangeMake(&v43, &start, &duration);
        v21 = v17.__sinval;
        *(float *)&v25 = v21;
        *(float *)&v26 = sinval;
        objc_msgSend(v14, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v43, v25, v26);
        start = v49;
        duration = v48;
        CMTimeAdd(&v49, &start, &duration);
        ++v12;
      }
      while (v12 != 21);
      objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v10;
      v52[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInputParameters:", v27);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)loopStart
{
  return self->_loopStart;
}

- (int)loopPeriod
{
  return self->_loopPeriod;
}

- (int)fadeLength
{
  return self->_fadeLength;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var2;
  retstr->var3 = *(int64_t *)((char *)&self[8].var0 + 4);
  return self;
}

+ (id)loopParamsForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_class();
  v7 = *(_OWORD *)&a3->var0.var3;
  v21 = *(_OWORD *)&a3->var0.var0;
  v22 = v7;
  v23 = *(_OWORD *)&a3->var1.var1;
  v20 = *a4;
  v8 = objc_msgSend(v6, "loopStartForTrimRange:frameDuration:", &v21, &v20);
  v9 = (void *)objc_opt_class();
  v10 = *(_OWORD *)&a3->var0.var3;
  v21 = *(_OWORD *)&a3->var0.var0;
  v22 = v10;
  v23 = *(_OWORD *)&a3->var1.var1;
  v20 = *a4;
  v11 = objc_msgSend(v9, "loopPeriodForTrimRange:frameDuration:", &v21, &v20);
  v12 = (void *)objc_opt_class();
  v13 = *(_OWORD *)&a3->var0.var3;
  v21 = *(_OWORD *)&a3->var0.var0;
  v22 = v13;
  v23 = *(_OWORD *)&a3->var1.var1;
  v20 = *a4;
  v14 = objc_msgSend(v12, "fadeLengthForTrimRange:frameDuration:", &v21, &v20);
  v24[0] = *MEMORY[0x1E0D004F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v24[1] = *MEMORY[0x1E0D004E8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v16;
  v24[2] = *MEMORY[0x1E0D004E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (int)loopStartForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  double Seconds;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;

  var0 = a3->var0;
  Seconds = CMTimeGetSeconds((CMTime *)&var0);
  var0 = *a4;
  return vcvtmd_s64_f64(Seconds / CMTimeGetSeconds((CMTime *)&var0));
}

+ (int)loopPeriodForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  double Seconds;
  unsigned int v8;
  __int128 v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  _BYTE time[32];
  __int128 v13;

  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)time = a3->var1;
  Seconds = CMTimeGetSeconds((CMTime *)time);
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)time = *a4;
  v8 = vcvtpd_s64_f64(Seconds / CMTimeGetSeconds((CMTime *)time));
  v9 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)time = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&time[16] = v9;
  v13 = *(_OWORD *)&a3->var1.var1;
  v11 = *a4;
  return v8 - objc_msgSend(a1, "fadeLengthForTrimRange:frameDuration:", time, &v11);
}

+ (int)fadeLengthForTrimRange:(id *)a3 frameDuration:(id *)a4
{
  double v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;

  var1 = a3->var1;
  v5 = fmin(CMTimeGetSeconds((CMTime *)&var1) * 0.5, 1.0);
  var1 = *a4;
  return vcvtmd_s64_f64(v5 / CMTimeGetSeconds((CMTime *)&var1));
}

@end

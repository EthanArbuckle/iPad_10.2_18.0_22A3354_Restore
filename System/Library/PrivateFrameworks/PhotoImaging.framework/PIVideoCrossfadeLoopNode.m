@implementation PIVideoCrossfadeLoopNode

- (PIVideoCrossfadeLoopNode)initWithSettings:(id)a3 inputs:(id)a4
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2253);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2253);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2253);
  }
}

- (PIVideoCrossfadeLoopNode)initWithInput:(id)a3 timeRange:(id *)a4 crossfadeDuration:(id *)a5 startTime:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  __int128 v15;
  CFDictionaryRef v16;
  void *v17;
  char *v18;
  int64_t var3;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int64_t v23;
  NSObject *v25;
  void *v26;
  const void **v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *specific;
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
  CMTime rhs;
  CMTime v57;
  CMTime lhs;
  CMTime v59;
  CMTime v60;
  objc_super v61;
  uint64_t v62;
  void *v63;
  CMTimeRange time;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    NUAssertLogger_2237();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v33;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2237();
    v29 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (const void **)objc_claimAutoreleasedReturnValue();
        LODWORD(time.start.value) = 138543362;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v27;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

      }
      goto LABEL_32;
    }
LABEL_30:
    if (v35)
    {
      v47 = dispatch_get_specific(*v27);
      v48 = (void *)MEMORY[0x1E0CB3978];
      v49 = v47;
      objc_msgSend(v48, "callStackSymbols");
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543618;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v47;
      LOWORD(time.start.flags) = 2114;
      *(_QWORD *)((char *)&time.start.flags + 2) = v50;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

    }
LABEL_32:

    v40 = _NUAssertFailHandler();
    goto LABEL_33;
  }
  if ((a5->var2 & 1) == 0)
  {
    NUAssertLogger_2237();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIME_IS_VALID(crossfadeDuration)");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v38;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    v39 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2237();
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
        LODWORD(time.start.value) = 138543362;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v42;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

      }
LABEL_35:

      _NUAssertFailHandler();
    }
LABEL_33:
    if (v40)
    {
      v51 = dispatch_get_specific(*v27);
      v52 = (void *)MEMORY[0x1E0CB3978];
      v53 = v51;
      objc_msgSend(v52, "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543618;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v51;
      LOWORD(time.start.flags) = 2114;
      *(_QWORD *)((char *)&time.start.flags + 2) = v55;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

    }
    goto LABEL_35;
  }
  if ((a4->var0.var2 & 1) == 0 || (a4->var1.var2 & 1) == 0 || a4->var1.var3 || a4->var1.var0 < 0)
  {
    NUAssertLogger_2237();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIMERANGE_IS_VALID(loopTimeRange)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    v28 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2237();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
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
        LODWORD(time.start.value) = 138543618;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v43;
        LOWORD(time.start.flags) = 2114;
        *(_QWORD *)((char *)&time.start.flags + 2) = v46;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v27;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

    }
    v35 = _NUAssertFailHandler();
    goto LABEL_30;
  }
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
  time.start.epoch = a5->var3;
  v13 = CMTimeCopyAsDictionary(&time.start, 0);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("crossfadeDuration"));

  *(_OWORD *)&time.start.value = *(_OWORD *)&a6->var0;
  time.start.epoch = a6->var3;
  v14 = CMTimeCopyAsDictionary(&time.start, 0);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("startTime"));

  v15 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&time.start.epoch = v15;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)&a4->var1.var1;
  v16 = CMTimeRangeCopyAsDictionary(&time, 0);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("loopTimeRange"));

  v62 = *MEMORY[0x1E0C9E1F8];
  v63 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v61.receiver = self;
  v61.super_class = (Class)PIVideoCrossfadeLoopNode;
  v18 = -[NURenderNode initWithSettings:inputs:](&v61, sel_initWithSettings_inputs_, v12, v17);

  if (v18)
  {
    var3 = a5->var3;
    *((_OWORD *)v18 + 12) = *(_OWORD *)&a5->var0;
    *((_QWORD *)v18 + 26) = var3;
    v20 = *(_OWORD *)&a4->var1.var1;
    v21 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)(v18 + 232) = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)(v18 + 248) = v20;
    *(_OWORD *)(v18 + 216) = v21;
    memset(&v60, 0, sizeof(v60));
    CMTimeMake(&v60, 1, 600);
    memset(&v59, 0, sizeof(v59));
    v22 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&time.start.epoch = v22;
    *(_OWORD *)&time.duration.timescale = *(_OWORD *)&a4->var1.var1;
    CMTimeRangeGetEnd(&lhs, &time);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a5->var0;
    time.start.epoch = a5->var3;
    rhs = v60;
    CMTimeAdd(&v57, &time.start, &rhs);
    CMTimeSubtract(&v59, &lhs, &v57);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a6->var0;
    time.start.epoch = a6->var3;
    rhs = v59;
    if ((CMTimeCompare(&time.start, &rhs) & 0x80000000) == 0)
      *(CMTime *)a6 = v59;
    v23 = a6->var3;
    *(_OWORD *)(v18 + 168) = *(_OWORD *)&a6->var0;
    *((_QWORD *)v18 + 23) = v23;
  }

  return (PIVideoCrossfadeLoopNode *)v18;
}

- (id)input
{
  void *v2;
  void *v3;

  -[NURenderNode inputs](self, "inputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PIVideoCrossfadeLoopNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v13, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&self->_crossfadeDuration.value;
  *(_QWORD *)(v7 + 208) = self->_crossfadeDuration.epoch;
  *(_OWORD *)(v7 + 192) = v8;
  v9 = *(_OWORD *)&self->_startTime.value;
  *(_QWORD *)(v7 + 184) = self->_startTime.epoch;
  *(_OWORD *)(v7 + 168) = v9;
  v11 = *(_OWORD *)&self->_loopTimeRange.start.epoch;
  v10 = *(_OWORD *)&self->_loopTimeRange.duration.timescale;
  *(_OWORD *)(v7 + 216) = *(_OWORD *)&self->_loopTimeRange.start.value;
  *(_OWORD *)(v7 + 232) = v11;
  *(_OWORD *)(v7 + 248) = v10;
  return (id)v7;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
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
  void *v17;
  void *v18;
  id v19;
  CMTime *v20;
  void *v21;
  void *v22;
  double Seconds;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  float v33;
  id v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v42;
  void *v43;
  const void **v44;
  void *specific;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  CMTime start;
  CMTime v61;
  CMTime v62;
  CMTime v63;
  CMTime v64;
  CMTime v65;
  CMTime v66;
  CMTime v67;
  CMTime v68;
  CMTime v69;
  CMTime v70;
  CMTimeRange rhs;
  CMTime time2;
  CMTime duration;
  CMTime v74;
  CMTimeRange range;
  CMTime lhs;
  CMTime v77;
  CMTime v78[2];
  __int128 v79;
  CMTimeEpoch v80;
  objc_super v81;
  _QWORD v82[2];
  _QWORD v83[2];
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  CMTimeRange buf;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_2237();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v43;
      _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v44 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2237();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v50 = dispatch_get_specific(*v44);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v50;
        LOWORD(buf.start.flags) = 2114;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v54;
        _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v49;
      _os_log_error_impl(&dword_1A6382000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "evaluationMode");
  if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v12 = v11;
    v79 = 0uLL;
    v80 = 0;
    -[PIVideoCrossfadeLoopNode startTime](self, "startTime");
    -[PIVideoCrossfadeLoopNode crossfadeDuration](self, "crossfadeDuration");
    memset(&buf, 0, sizeof(buf));
    -[PIVideoCrossfadeLoopNode loopTimeRange](self, "loopTimeRange");
    memset(v78, 0, sizeof(v78));
    if (v10)
      objc_msgSend(v10, "time");
    -[PIVideoCrossfadeLoopNode input](self, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outputVideo:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v19 = 0;
LABEL_35:

      goto LABEL_36;
    }
    memset(&v77, 0, sizeof(v77));
    range = buf;
    CMTimeRangeGetEnd(&lhs, &range);
    *(_OWORD *)&range.start.value = v79;
    range.start.epoch = v80;
    rhs.start = v78[1];
    CMTimeAdd(&v74, &range.start, &rhs.start);
    CMTimeSubtract(&v77, &lhs, &v74);
    memset(&range, 0, sizeof(range));
    rhs.start = v77;
    duration = v78[1];
    CMTimeRangeMake(&range, &rhs.start, &duration);
    v15 = (void *)objc_msgSend(v10, "copy");
    if (v12 == 3)
    {
      objc_msgSend(v10, "videoFrames");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("primary"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing primary video frame"), v10);
        v19 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

        goto LABEL_35;
      }
      v88 = CFSTR("video");
      v89 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVideoFrames:", v18);

      rhs = range;
      CMTimeRangeGetEnd(&time2, &rhs);
      rhs.start = v78[0];
      if (CMTimeCompare(&rhs.start, &time2) < 0)
      {
        if (v10)
          objc_msgSend(v10, "time");
        else
          memset(&v69, 0, sizeof(v69));
        *(_OWORD *)&rhs.start.value = v79;
        rhs.start.epoch = v80;
        CMTimeAdd(&v70, &v69, &rhs.start);
        v68 = v70;
        v20 = &v68;
      }
      else
      {
        memset(&duration, 0, sizeof(duration));
        -[PIVideoCrossfadeLoopNode loopTimeRange](self, "loopTimeRange");
        v67 = v66;
        rhs.start = v78[1];
        CMTimeAdd(&duration, &v67, &rhs.start);
        if (v10)
          objc_msgSend(v10, "time");
        else
          memset(&v63, 0, sizeof(v63));
        rhs = range;
        CMTimeRangeGetEnd(&v62, &rhs);
        CMTimeSubtract(&v64, &v63, &v62);
        rhs.start = duration;
        CMTimeAdd(&v65, &rhs.start, &v64);
        v61 = v65;
        v20 = &v61;
      }
      objc_msgSend(v15, "setRawTime:", v20);

    }
    -[PIVideoCrossfadeLoopNode input](self, "input");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v15, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      rhs = range;
      duration = v78[0];
      if (CMTimeRangeContainsTime(&rhs, &duration))
      {
        memset(&rhs, 0, 24);
        duration = v78[0];
        start = v77;
        CMTimeSubtract(&rhs.start, &duration, &start);
        duration = rhs.start;
        Seconds = CMTimeGetSeconds(&duration);
        duration = v78[1];
        v24 = CMTimeGetSeconds(&duration);
        v25 = (void *)objc_msgSend(v10, "copy");
        if (v12 == 3)
        {
          objc_msgSend(v10, "videoFrames");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("secondary"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing secondary video frame"), v10);
            v19 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

            goto LABEL_33;
          }
          duration = buf.start;
          start = rhs.start;
          CMTimeAdd(&v59, &duration, &start);
          v58 = v59;
          objc_msgSend(v25, "setTime:", &v58);
          v86 = CFSTR("video");
          v87 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setVideoFrames:", v28);

          duration = rhs.start;
          start = buf.start;
          CMTimeAdd(&v57, &duration, &start);
          v56 = v57;
          objc_msgSend(v15, "setRawTime:", &v56);

        }
        -[PIVideoCrossfadeLoopNode input](self, "input");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v25, a5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = Seconds;
          v32 = v24;
          v33 = v31 / v32;
          v34 = objc_alloc(MEMORY[0x1E0D520C8]);
          v84 = *MEMORY[0x1E0C9E278];
          *(float *)&v35 = v33;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v36;
          v55 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *MEMORY[0x1E0C9E270];
          v82[0] = *MEMORY[0x1E0C9E1F8];
          v82[1] = v38;
          v83[0] = v22;
          v83[1] = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v34, "initWithFilterName:settings:inputs:", CFSTR("CIDissolveTransition"), v37, v39);

          v25 = v55;
          objc_msgSend(MEMORY[0x1E0D52258], "nodeFromCache:cache:", v40, v8);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));

        }
        else
        {
          v19 = 0;
        }

        goto LABEL_32;
      }
      v19 = v22;
    }
    else
    {
      v19 = 0;
    }
LABEL_33:

    goto LABEL_34;
  }
  v81.receiver = self;
  v81.super_class = (Class)PIVideoCrossfadeLoopNode;
  -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v81, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
  v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v19;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  CMTimeEpoch v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  id v33;
  void *v34;
  CMTimeEpoch v35;
  void *v36;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  uint64_t v65;
  void *v66;
  NSObject *v68;
  void *v69;
  const void **v70;
  void *specific;
  NSObject *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  void *v96;
  id v97;
  _OWORD v98[3];
  id v99;
  CMTime v100;
  id v101;
  char v102[48];
  id v103;
  CMTimeRange v104;
  CMTime v105;
  CMTime v106;
  id v107;
  CMTimeRange duration;
  _BYTE v109[48];
  CMTimeRange rhs;
  id v111;
  CMTimeRange lhs;
  CMTime start;
  CMTimeRange range;
  CMTime end;
  CMTimeRange v116;
  __int128 v117;
  CMTimeEpoch v118;
  __int128 v119;
  CMTimeEpoch v120;
  CMTimeRange buf;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2237();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v69;
      _os_log_error_impl(&dword_1A6382000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v70 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2237();
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v73)
      {
        v76 = dispatch_get_specific(*v70);
        v77 = (void *)MEMORY[0x1E0CB3978];
        v78 = v76;
        objc_msgSend(v77, "callStackSymbols");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "componentsJoinedByString:", CFSTR("\n"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v76;
        LOWORD(buf.start.flags) = 2114;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v80;
        _os_log_error_impl(&dword_1A6382000, v72, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v73)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "componentsJoinedByString:", CFSTR("\n"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v75;
      _os_log_error_impl(&dword_1A6382000, v72, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[PIVideoCrossfadeLoopNode input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVideo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C8B268]);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 1, CFSTR("[[AVMutableComposition alloc] init] failed."), self);
      v14 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:

      goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x1E0D52348], "firstEnabledVideoTrackInAsset:error:", v6, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("No input video track found"), self, *a3);
      v14 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

      goto LABEL_52;
    }
    v88 = v6;
    v9 = v6;
    v10 = *MEMORY[0x1E0C8A7A0];
    objc_msgSend(v9, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x1E0C8A808];
    objc_msgSend(v7, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A808], 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (void *)v12;
    if (v12)
    {
      objc_msgSend(v7, "addMutableTrackWithMediaType:preferredTrackID:", v10, 2);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v91 = 0;
    }
    v89 = v7;
    v119 = 0uLL;
    v120 = 0;
    -[PIVideoCrossfadeLoopNode startTime](self, "startTime");
    v117 = 0uLL;
    v118 = 0;
    -[PIVideoCrossfadeLoopNode crossfadeDuration](self, "crossfadeDuration");
    memset(&buf, 0, sizeof(buf));
    -[PIVideoCrossfadeLoopNode loopTimeRange](self, "loopTimeRange");
    memset(&v116, 0, sizeof(v116));
    range = buf;
    CMTimeRangeGetEnd(&end, &range);
    *(_OWORD *)&range.start.value = v119;
    range.start.epoch = v120;
    CMTimeRangeFromTimeToTime(&v116, &range.start, &end);
    memset(&range, 0, sizeof(range));
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&buf.start.value;
    lhs.start.epoch = buf.start.epoch;
    *(_OWORD *)&rhs.start.value = v117;
    rhs.start.epoch = v118;
    CMTimeAdd(&start, &lhs.start, &rhs.start);
    *(_OWORD *)&lhs.start.value = v119;
    lhs.start.epoch = v120;
    CMTimeRangeFromTimeToTime(&range, &start, &lhs.start);
    memset(&lhs, 0, sizeof(lhs));
    *(_OWORD *)&rhs.start.value = *(_OWORD *)&buf.start.value;
    rhs.start.epoch = buf.start.epoch;
    *(_OWORD *)&duration.start.value = v117;
    duration.start.epoch = v118;
    CMTimeRangeMake(&lhs, &rhs.start, &duration.start);
    rhs.start = v116.duration;
    v94 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&duration.start.value = *MEMORY[0x1E0CA2E68];
    v15 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    duration.start.epoch = v15;
    v16 = v92;
    if (CMTimeCompare(&rhs.start, &duration.start) < 1)
    {
      v21 = 0;
    }
    else
    {
      v82 = v10;
      v111 = 0;
      rhs = v116;
      *(_OWORD *)&duration.start.value = v94;
      duration.start.epoch = v15;
      v17 = objc_msgSend(v92, "insertTimeRange:ofTrack:atTime:error:", &rhs, v8, &duration, &v111);
      v18 = v111;
      v19 = v18;
      if ((v17 & 1) == 0)
      {
        v83 = (void *)MEMORY[0x1E0CB3940];
        rhs = v116;
        NUStringFromTimeRange();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)&rhs.start.value = v94;
        rhs.start.epoch = v15;
        NUStringFromTime();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v92);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "stringWithFormat:", CFSTR("Failed to update video track when inserting the pre-crossfade content with source range %@ from track %@ to time %@ in track %@."), v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = v92;
        objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, v26, self, v19);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v14 = 0;
        v7 = v89;
        goto LABEL_50;
      }
      if (v91)
      {
        memset(&rhs, 0, sizeof(rhs));
        v20 = (void *)MEMORY[0x1E0D52348];
        v87 = v8;
        if (v90)
          objc_msgSend(v90, "timeRange");
        else
          memset(v109, 0, sizeof(v109));
        duration = v116;
        objc_msgSend(v20, "conformRange:inRange:", &duration, v109);
        v106.epoch = v15;
        v107 = v19;
        duration = rhs;
        *(_OWORD *)&v106.value = v94;
        v28 = objc_msgSend(v91, "insertTimeRange:ofTrack:atTime:error:", &duration, v90, &v106, &v107);
        v21 = v107;

        if ((v28 & 1) == 0)
        {
          v85 = (void *)MEMORY[0x1E0CB3940];
          duration = rhs;
          NUStringFromTimeRange();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v90);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_OWORD *)&duration.start.value = v94;
          duration.start.epoch = v15;
          NUStringFromTime();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v91);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "stringWithFormat:", CFSTR("Failed to update audio track when inserting the pre-crossfade content with source range %@ from track %@ to time %@ in track %@."), v55, v56, v57, v58);
LABEL_47:
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, v66, self, v21);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          v14 = 0;
          v19 = v21;
          goto LABEL_48;
        }
        v16 = v92;
      }
      else
      {
        v21 = v18;
      }
      v10 = v82;
    }
    rhs.start = lhs.duration;
    *(_OWORD *)&duration.start.value = v94;
    duration.start.epoch = v15;
    if (CMTimeCompare(&rhs.start, &duration.start) < 1)
    {
LABEL_32:
      rhs.start = range.duration;
      *(_OWORD *)&duration.start.value = v94;
      duration.start.epoch = v15;
      if (CMTimeCompare(&rhs.start, &duration.start) < 1)
        goto LABEL_45;
      v99 = v21;
      rhs = range;
      v95 = *MEMORY[0x1E0CA2E18];
      *(_OWORD *)&duration.start.value = *MEMORY[0x1E0CA2E18];
      v35 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      duration.start.epoch = v35;
      v36 = v16;
      v37 = objc_msgSend(v16, "insertTimeRange:ofTrack:atTime:error:", &rhs, v8, &duration, &v99);
      v38 = v99;

      if ((v37 & 1) != 0)
      {
        v87 = v8;
        if (v91)
        {
          memset(&rhs, 0, sizeof(rhs));
          v39 = (void *)MEMORY[0x1E0D52348];
          if (v90)
            objc_msgSend(v90, "timeRange");
          else
            memset(v98, 0, sizeof(v98));
          duration = range;
          objc_msgSend(v39, "conformRange:inRange:", &duration, v98);
          v97 = v38;
          duration = rhs;
          *(_OWORD *)&v106.value = v95;
          v106.epoch = v35;
          v64 = objc_msgSend(v91, "insertTimeRange:ofTrack:atTime:error:", &duration, v90, &v106, &v97);
          v21 = v97;

          if ((v64 & 1) != 0)
            goto LABEL_45;
          v86 = (void *)MEMORY[0x1E0CB3940];
          duration = rhs;
          NUStringFromTimeRange();
          v65 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v90);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_OWORD *)&duration.start.value = v95;
          duration.start.epoch = v35;
          NUStringFromTime();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v91);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)v65;
          objc_msgSend(v86, "stringWithFormat:", CFSTR("Failed to update audio track when inserting the post-crossfade content with source range %@ from track %@ to time %@ in track %@."), v65, v56, v57, v58);
          goto LABEL_47;
        }
        v21 = v38;
LABEL_45:
        v14 = v89;
        v19 = v21;
        v7 = v89;
LABEL_49:
        v27 = v92;
        goto LABEL_50;
      }
      v93 = (void *)MEMORY[0x1E0CB3940];
      rhs = range;
      NUStringFromTimeRange();
      v47 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v8);
      v48 = v36;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)&rhs.start.value = v95;
      rhs.start.epoch = v35;
      NUStringFromTime();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v48;
      objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v48);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)v47;
      objc_msgSend(v93, "stringWithFormat:", CFSTR("Failed to update video track when inserting the post-crossfade content with source range %@ from track %@ to time %@ in track %@."), v47, v49, v50, v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, v54, self, v38);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v7 = v89;
      v27 = v51;
      v19 = v38;
LABEL_50:

      v6 = v88;
      goto LABEL_51;
    }
    objc_msgSend(v89, "addMutableTrackWithMediaType:preferredTrackID:", v13, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v106, 0, sizeof(v106));
    if (v16)
      objc_msgSend(v16, "timeRange");
    else
      memset(&v104, 0, sizeof(v104));
    CMTimeRangeGetEnd(&v105, &v104);
    *(_OWORD *)&rhs.start.value = v117;
    rhs.start.epoch = v118;
    CMTimeSubtract(&v106, &v105, &rhs.start);
    v103 = v21;
    rhs = lhs;
    duration.start = v106;
    v30 = objc_msgSend(v29, "insertTimeRange:ofTrack:atTime:error:", &rhs, v8, &duration, &v103);
    v84 = v29;
    v31 = v8;
    v32 = v30;
    v33 = v103;

    v87 = v31;
    if ((v32 & 1) != 0)
    {
      v21 = v33;
      if (!v90)
      {
LABEL_31:
        v16 = v92;

        v8 = v31;
        goto LABEL_32;
      }
      objc_msgSend(v89, "addMutableTrackWithMediaType:preferredTrackID:", v10, 3);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&rhs, 0, sizeof(rhs));
      v34 = (void *)MEMORY[0x1E0D52348];
      objc_msgSend(v90, "timeRange");
      duration = lhs;
      objc_msgSend(v34, "conformRange:inRange:", &duration, v102);
      v101 = v33;
      duration = rhs;
      v100 = v106;
      LOBYTE(v34) = objc_msgSend(v81, "insertTimeRange:ofTrack:atTime:error:", &duration, v90, &v100, &v101);
      v21 = v101;

      if ((v34 & 1) != 0)
      {

        goto LABEL_31;
      }
      v96 = (void *)MEMORY[0x1E0CB3940];
      duration = rhs;
      NUStringFromTimeRange();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v90);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      duration.start = v106;
      NUStringFromTime();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v81);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "stringWithFormat:", CFSTR("Failed to update audio track when inserting the crossfade content with source range %@ from track %@ to time %@ in track %@."), v59, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = v81;
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, v63, self, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v19 = v21;
      v44 = v84;
    }
    else
    {
      v40 = (void *)MEMORY[0x1E0CB3940];
      rhs = lhs;
      NUStringFromTimeRange();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v31);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      rhs.start = v106;
      NUStringFromTime();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v84;
      objc_msgSend(MEMORY[0x1E0D52348], "debugDescriptionOfAssetTrack:", v84);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("Failed to update video track when inserting the crossfade content with source range %@ from track %@ to time %@ in track %@."), v41, v42, v43, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, v46, self, v33);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v33;
    }

    v14 = 0;
LABEL_48:
    v8 = v87;
    v7 = v89;
    goto LABEL_49;
  }
  v14 = 0;
LABEL_53:

  return v14;
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
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v36;
  void *v37;
  const void **v38;
  void *specific;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  CMTimeRange v57;
  CMTimeRange v58;
  CMTimeRange v59;
  CMTime v60;
  CMTime v61;
  CMTimeRange duration;
  CMTime start;
  CMTimeRange end;
  CMTime v65;
  CMTimeRange rhs;
  CMTime v67;
  CMTimeRange range;
  CMTime lhs;
  CMTime v70;
  __int128 v71;
  CMTimeEpoch v72;
  __int128 v73;
  CMTimeEpoch v74;
  void *v75;
  _QWORD v76[2];
  void *v77;
  CMTimeRange buf;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2237();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v37;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v38 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2237();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v44 = dispatch_get_specific(*v38);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v44;
        LOWORD(buf.start.flags) = 2114;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v48;
        _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v43;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[PIVideoCrossfadeLoopNode input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVideo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D52348], "firstEnabledVideoTrackInAsset:error:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NURenderNode outputVideo:](self, "outputVideo:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NURenderNode inputs](self, "inputs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "outputVideoComposition:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v52 = v12;
          objc_msgSend(v13, "instructions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16 == 1)
          {
            v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
            v73 = 0uLL;
            v74 = 0;
            -[PIVideoCrossfadeLoopNode startTime](self, "startTime");
            v71 = 0uLL;
            v72 = 0;
            -[PIVideoCrossfadeLoopNode crossfadeDuration](self, "crossfadeDuration");
            memset(&buf, 0, sizeof(buf));
            -[PIVideoCrossfadeLoopNode loopTimeRange](self, "loopTimeRange");
            memset(&v70, 0, sizeof(v70));
            range = buf;
            CMTimeRangeGetEnd(&lhs, &range);
            *(_OWORD *)&range.start.value = v73;
            range.start.epoch = v74;
            *(_OWORD *)&rhs.start.value = v71;
            rhs.start.epoch = v72;
            CMTimeAdd(&v67, &range.start, &rhs.start);
            CMTimeSubtract(&v70, &lhs, &v67);
            memset(&range, 0, sizeof(range));
            *(_OWORD *)&rhs.start.value = *MEMORY[0x1E0CA2E68];
            rhs.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            end.start = v70;
            CMTimeRangeFromTimeToTime(&range, &rhs.start, &end.start);
            memset(&rhs, 0, sizeof(rhs));
            end.start = v70;
            *(_OWORD *)&duration.start.value = v71;
            duration.start.epoch = v72;
            CMTimeRangeMake(&rhs, &end.start, &duration.start);
            memset(&v65, 0, sizeof(v65));
            end.start = buf.duration;
            *(_OWORD *)&duration.start.value = v71;
            duration.start.epoch = v72;
            CMTimeSubtract(&v65, &end.start, &duration.start);
            memset(&end, 0, sizeof(end));
            duration = rhs;
            CMTimeRangeGetEnd(&start, &duration);
            duration = rhs;
            CMTimeRangeGetEnd(&v60, &duration);
            duration.start = v65;
            CMTimeSubtract(&v61, &duration.start, &v60);
            CMTimeRangeMake(&end, &start, &v61);
            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_alloc_init(MEMORY[0x1E0D52310]);
            v59 = range;
            objc_msgSend(v18, "setTimeRange:", &v59);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "trackID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = v19;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setRequiredSourceTrackIDs:", v20);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "trackID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setSourceIdentifier:forTrackID:", CFSTR("primary"), v21);

            objc_msgSend(v51, "addObject:", v18);
            v50 = v10;
            if (objc_msgSend(v10, "count") == 2)
            {
              objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_alloc_init(MEMORY[0x1E0D52310]);
              v58 = rhs;
              objc_msgSend(v22, "setTimeRange:", &v58);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "trackID"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v76[0] = v23;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v49, "trackID"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v76[1] = v24;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setRequiredSourceTrackIDs:", v25);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "trackID"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setSourceIdentifier:forTrackID:", CFSTR("primary"), v26);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v49, "trackID"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setSourceIdentifier:forTrackID:", CFSTR("secondary"), v27);

              objc_msgSend(v51, "addObject:", v22);
            }
            v28 = objc_alloc_init(MEMORY[0x1E0D52310]);
            v57 = end;
            objc_msgSend(v28, "setTimeRange:", &v57);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "trackID"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v29;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setRequiredSourceTrackIDs:", v30);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "trackID"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setSourceIdentifier:forTrackID:", CFSTR("primary"), v31);

            objc_msgSend(v51, "addObject:", v28);
            v32 = objc_alloc_init(MEMORY[0x1E0C8B288]);
            objc_msgSend(v14, "frameDuration");
            v53 = v55;
            v54 = v56;
            objc_msgSend(v32, "setFrameDuration:", &v53);
            objc_msgSend(v14, "renderSize");
            objc_msgSend(v32, "setRenderSize:");
            objc_msgSend(v32, "setInstructions:", v51);
            objc_msgSend(v32, "setSourceTrackIDForFrameTiming:", objc_msgSend(v17, "trackID"));

            v10 = v50;
          }
          else
          {
            v33 = (void *)MEMORY[0x1E0D520A0];
            objc_msgSend(v14, "instructions");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "unsupportedError:object:", CFSTR("Unsupported video configuration"), v34);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

            v32 = 0;
          }
          v12 = v52;
        }
        else
        {
          v32 = 0;
        }

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)requiresAudioMix
{
  return 1;
}

- (id)_evaluateAudioMix:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  CMTimeEpoch epoch;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  NSObject *v27;
  void *v28;
  const void **v29;
  void *specific;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v40;
  CMTime v41;
  CMTimeRange v42;
  CMTime duration;
  CMTimeRange v44;
  CMTime lhs;
  CMTime time;
  CMTime rhs;
  CMTime v48;
  CMTime v49;
  _QWORD v50[2];
  CMTime buf;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2237();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v29 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2237();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v35 = dispatch_get_specific(*v29);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v35;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v39;
        _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v34;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[PIVideoCrossfadeLoopNode input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVideo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D52348], "firstEnabledVideoTrackInAsset:error:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "timeRange");
      buf = v49;
      -[NURenderNode outputVideo:](self, "outputVideo:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v11, "count") > 1)
        {
          v13 = (void *)MEMORY[0x1E0C8B260];
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "audioMixInputParametersWithTrack:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (void *)MEMORY[0x1E0C8B260];
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "audioMixInputParametersWithTrack:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          v40 = *(_OWORD *)&v48.value;
          epoch = v48.epoch;
          objc_msgSend(v15, "setVolume:atTime:", &v48, COERCE_DOUBLE(__PAIR64__(HIDWORD(v48.value), 1.0)));
          HIDWORD(v20) = DWORD1(v40);
          *(_OWORD *)&v48.value = v40;
          v48.epoch = epoch;
          LODWORD(v20) = 0;
          objc_msgSend(v18, "setVolume:atTime:", &v48, v20);
          memset(&v48, 0, sizeof(v48));
          -[PIVideoCrossfadeLoopNode crossfadeDuration](self, "crossfadeDuration");
          CMTimeMultiply(&rhs, &time, 2);
          lhs = buf;
          CMTimeSubtract(&v48, &lhs, &rhs);
          -[PIVideoCrossfadeLoopNode crossfadeDuration](self, "crossfadeDuration");
          lhs = v48;
          CMTimeRangeMake(&v44, &lhs, &duration);
          LODWORD(v21) = 1.0;
          LODWORD(v22) = 0;
          objc_msgSend(v15, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v44, v21, v22);
          -[PIVideoCrossfadeLoopNode crossfadeDuration](self, "crossfadeDuration");
          lhs = v48;
          CMTimeRangeMake(&v42, &lhs, &v41);
          LODWORD(v23) = 0;
          LODWORD(v24) = 1.0;
          objc_msgSend(v18, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v42, v23, v24);
          objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = v15;
          v50[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setInputParameters:", v25);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[7];
  return self;
}

- ($105C7F46451D331BD7843CF46B2B4F94)loopTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[5].var0.var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[8];
  return self;
}

@end

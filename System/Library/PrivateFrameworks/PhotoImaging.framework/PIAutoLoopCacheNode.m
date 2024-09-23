@implementation PIAutoLoopCacheNode

- (PIAutoLoopCacheNode)initWithInput:(id)a3 frameDuration:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  CFDictionaryRef v9;
  void *v10;
  PIAutoLoopCacheNode *v11;
  NSObject *v13;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
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
  objc_super v35;
  uint64_t v36;
  void *v37;
  CMTime time;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_6392();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6392();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v26 = dispatch_get_specific(*v15);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v15 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v26;
        LOWORD(time.flags) = 2114;
        *(_QWORD *)((char *)&time.flags + 2) = v29;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (const void **)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v15;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

    }
    v23 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  if ((a4->var2 & 1) == 0)
  {
    NUAssertLogger_6392();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIME_IS_VALID(frameDuration)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6392();
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.value) = 138543362;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

      }
      goto LABEL_19;
    }
LABEL_17:
    if (v23)
    {
      v30 = dispatch_get_specific(*v15);
      v31 = (void *)MEMORY[0x1E0CB3978];
      v32 = v30;
      objc_msgSend(v31, "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v30;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = v34;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  time = (CMTime)*a4;
  v9 = CMTimeCopyAsDictionary(&time, 0);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("frameDuration"));

  v36 = *MEMORY[0x1E0D51D40];
  v37 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)PIAutoLoopCacheNode;
  v11 = -[NUCacheNode initWithInputs:settings:subsampleFactor:](&v35, sel_initWithInputs_settings_subsampleFactor_, v10, v8, 0);

  return v11;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  const __CFDictionary *dictionaryRepresentation;

  -[NURenderNode settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameDuration"));
  dictionaryRepresentation = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CMTimeMakeFromDictionary((CMTime *)retstr, dictionaryRepresentation);
  return result;
}

- (id)descriptionSubClassHook
{
  return CFSTR("AutoLoop");
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PIAutoLoopCacheNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)persistentURL
{
  void *v2;
  void *v3;
  void *v4;

  -[NUCacheNode persistentURLPrefix](self, "persistentURLPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("stab"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)persistentLongExposureURL
{
  void *v2;
  void *v3;
  void *v4;

  -[NUCacheNode persistentURLPrefix](self, "persistentURLPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("lexp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("jpg"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)persistentMaskURL
{
  void *v2;
  void *v3;
  void *v4;

  -[NUCacheNode persistentURLPrefix](self, "persistentURLPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("mask"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("jpg"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PIAutoLoopExportRequest *v15;
  void *v16;
  void *v17;
  PIAutoLoopExportRequest *v18;
  void *v19;
  dispatch_queue_t v20;
  void *v21;
  void *v22;
  PIAutoLoopExportRequest *v23;
  NSObject *v25;
  void *v26;
  const void **v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_6392();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "originalRequest != nil");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6392();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v33 = dispatch_get_specific(*v27);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v33;
        v43 = 2114;
        v44 = v37;
        _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v32;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  -[NUCacheNode temporaryURLPrefix](self, "temporaryURLPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("stab"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathExtension:", CFSTR("mov"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("lexp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathExtension:", CFSTR("jpg"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("mask"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("jpg"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [PIAutoLoopExportRequest alloc];
  objc_msgSend(v7, "composition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PIAutoLoopExportRequest initWithComposition:stabilizedVideoURL:longExposureDestinationURL:maskDestinationURL:destinationUTI:](v15, "initWithComposition:stabilizedVideoURL:longExposureDestinationURL:maskDestinationURL:destinationUTI:", v16, v10, v12, v14, v17);

  -[PIAutoLoopCacheNode outputSettings:](self, "outputSettings:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[NUVideoExportRequest setOutputSettings:](v18, "setOutputSettings:", v19);
    v20 = dispatch_queue_create("PIAutoLoopCacheNode", 0);
    -[NURenderRequest setResponseQueue:](v18, "setResponseQueue:", v20);

    objc_msgSend(v7, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      objc_msgSend(v7, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderRequest setName:](v18, "setName:", v22);

    }
    else
    {
      -[NURenderRequest setName:](v18, "setName:", CFSTR("PIAutoLoopCacheNode-autoLoopExportRequest"));
    }

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __65__PIAutoLoopCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
    v38[3] = &unk_1E50167A8;
    v38[4] = self;
    v39 = v12;
    v40 = v14;
    -[NURenderRequest setCompletionBlock:](v18, "setCompletionBlock:", v38);
    v23 = v18;

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)outputSettings:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  CMTime v26;
  objc_super v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)PIAutoLoopCacheNode;
  -[NUVideoCacheNode outputSettings:](&v27, sel_outputSettings_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NUCacheNode inputNode](self, "inputNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputImageGeometry:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NUCacheNode inputNode](self, "inputNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoProperties:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "colorProperties");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        v12 = *MEMORY[0x1E0C8AF40];
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AF40]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CA8ED8]);

        if (v14)
          objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C8AF50], v12);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C8AEA8]);
        v15 = objc_msgSend(v7, "scaledSize");
        v17 = (double)(v15 * v16) * 1.5;
        -[PIAutoLoopCacheNode frameDuration](self, "frameDuration");
        v18 = 1.0 / CMTimeGetSeconds(&v26);
        v28[0] = *MEMORY[0x1E0C8AE20];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18 * (v17 * 8.0) * 0.05);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x1E0C8AEF8];
        v29[0] = v19;
        v29[1] = &unk_1E50512C8;
        v21 = *MEMORY[0x1E0C8AEC8];
        v28[1] = v20;
        v28[2] = v21;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28[3] = *MEMORY[0x1E0C8AE08];
        v29[2] = v22;
        v29[3] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0C8AEB8]);
        v24 = v5;

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __65__PIAutoLoopCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v16 = 0;
  objc_msgSend(v3, "result:", &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  v6 = *(void **)(a1 + 32);
  if (!v4)
  {
    v13 = *(void **)(a1 + 32);
LABEL_6:
    objc_msgSend(v13, "resolveWithSourceNode:error:", 0, v5);
    goto LABEL_8;
  }
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "persistentLongExposureURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  LOBYTE(v7) = objc_msgSend(v6, "installTemporaryURL:intoPersistentURL:error:", v7, v8, &v15);
  v9 = v15;

  v10 = *(void **)(a1 + 32);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolveWithSourceNode:error:", 0, v9);
    v5 = v9;
    goto LABEL_8;
  }
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "persistentMaskURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  LOBYTE(v11) = objc_msgSend(v10, "installTemporaryURL:intoPersistentURL:error:", v11, v12, &v14);
  v5 = v14;

  v13 = *(void **)(a1 + 32);
  if ((v11 & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v13, "resolveSourceWithResponse:", v3);
LABEL_8:

}

+ (id)nodeWithInput:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v37;
  void *v38;
  const void **v39;
  void *specific;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  CMTime v53;
  CMTime rhs;
  CMTime lhs;
  CMTime duration;
  CMTime v57;
  CMTime v58;
  CMTimeRange v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_6392();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v59.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v59.start.value + 4) = (CMTimeValue)v38;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v59, 0xCu);

    }
    v39 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6392();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v45 = dispatch_get_specific(*v39);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v59.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v59.start.value + 4) = (CMTimeValue)v45;
        LOWORD(v59.start.flags) = 2114;
        *(_QWORD *)((char *)&v59.start.flags + 2) = v49;
        _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v59, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v59.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v59.start.value + 4) = (CMTimeValue)v44;
      _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v59, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v13 = v12;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("recipe"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1A85C03C0]())
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("invalid autoloop recipe"), v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "beginGroupWithName:error:", CFSTR("AutoLoop"), a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v10, "videoProperties:", a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "orientation");
        objc_msgSend(v10, "outputImageGeometry:", a6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v51 = v18;
          v52 = v17;
          objc_msgSend(v18, "orientation");
          NUOrientationInverse();
          v19 = NUOrientationConcat();
          v20 = NUOrientationInverse();
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52200]), "initWithOrientation:input:", v19, v10);
          +[PIAutoLoopStabVideoNode nodeWithInput:recipe:error:](PIAutoLoopStabVideoNode, "nodeWithInput:recipe:error:", v21, v14, a6);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            memset(&v58, 0, sizeof(v58));
            PIAutoLoopRecipeGetFrameDuration(v14, &v58);
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52200]), "initWithOrientation:input:", v20, v22);

            v24 = objc_alloc((Class)a1);
            v59.start = v58;
            v25 = (void *)objc_msgSend(v24, "initWithInput:frameDuration:", v23, &v59);
            v26 = (id)objc_msgSend(v15, "addTag:forNode:", CFSTR("StabilizedVideo"), v25);
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("flavor"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = PIAutoLoopFlavorFromString(v27);
            PIAutoLoopRecipeGetFlavorParameters(v14, v28);
            if (objc_claimAutoreleasedReturnValue())
            {
              v29 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
              *(_OWORD *)&v59.start.value = *MEMORY[0x1E0CA2E40];
              *(_OWORD *)&v59.start.epoch = v29;
              *(_OWORD *)&v59.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("trim"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v31 = v30;
                v50 = v28;
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("start"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("end"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("startScale"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("endScale"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        memset(&v53, 0, sizeof(v53));
                        CMTimeMake(&v53, objc_msgSend(v32, "integerValue"), objc_msgSend(v34, "intValue"));
                        memset(&v57, 0, sizeof(v57));
                        CMTimeMake(&v57, objc_msgSend(v33, "integerValue"), objc_msgSend(v35, "intValue"));
                        lhs = v57;
                        rhs = v53;
                        CMTimeSubtract(&duration, &lhs, &rhs);
                        lhs = v53;
                        CMTimeRangeMake(&v59, &lhs, &duration);
                      }
                    }
                  }
                }

                v28 = v50;
              }
              __asm { BR              X9 }
            }
            objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Malformed AutoLoop recipe : missing flavor parameters"), v27);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
          v18 = v51;
          v17 = v52;
        }

      }
    }

  }
  return 0;
}

@end

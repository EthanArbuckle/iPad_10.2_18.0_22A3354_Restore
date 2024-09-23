@implementation PICinematicAudioRenderNode

- (PICinematicAudioRenderNode)initWithInput:(id)a3 dialogMixBias:(double)a4 renderingStyle:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PICinematicAudioRenderNode *v11;
  PICinematicAudioRenderNode *v12;
  id v13;
  uint64_t v14;
  NSObject *v16;
  objc_super v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v18 = *MEMORY[0x1E0C9E1F8];
  v19 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PICinematicAudioRenderNode;
  v11 = -[NURenderNode initWithSettings:inputs:](&v17, sel_initWithSettings_inputs_, MEMORY[0x1E0C9AA70], v10);
  v12 = v11;
  if (v11)
  {
    -[PICinematicAudioRenderNode setDialogMixBias:](v11, "setDialogMixBias:", a4);
    v13 = v9;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("original")) & 1) == 0)
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("voice")) & 1) != 0)
      {
        v14 = 0;
        goto LABEL_10;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("studioVoice")) & 1) != 0)
      {
        v14 = 1;
        goto LABEL_10;
      }
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("onCameraVoice")) & 1) != 0)
      {
        v14 = 2;
        goto LABEL_10;
      }
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_59);
      v16 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v13;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Unexpected rendering style string %@ - defaulting to standard", buf, 0xCu);
      }
    }
    v14 = 7;
LABEL_10:

    -[PICinematicAudioRenderNode setRenderingStyle:](v12, "setRenderingStyle:", v14);
  }

  return v12;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return objc_msgSend(a3, "evaluationMode") == 2;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v12;
  objc_super v13;
  objc_super v14;

  v8 = a4;
  v9 = a3;
  if (objc_msgSend(v8, "evaluationMode") == 2)
  {
    v14.receiver = self;
    v14.super_class = (Class)PICinematicAudioRenderNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v14, sel_nodeByReplayingAgainstCache_pipelineState_error_, v9, v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PICinematicAudioRenderNode dialogMixBias](self, "dialogMixBias");
    objc_msgSend(v10, "setDialogMixBias:");
    objc_msgSend(v10, "setRenderingStyle:", -[PICinematicAudioRenderNode renderingStyle](self, "renderingStyle"));
    return v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PICinematicAudioRenderNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v13, sel_nodeByReplayingAgainstCache_pipelineState_error_, v9, v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PICinematicAudioRenderNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateVideo:(id *)a3
{
  void *v4;
  void *v5;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVideo:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v4;
  void *v5;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVideoComposition:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)requiresAudioMix
{
  return 1;
}

- (BOOL)shouldInvalidateCachedAudioMix
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  int64_t v8;

  -[PICinematicAudioRenderNode dialogMixBias](self, "dialogMixBias");
  v4 = v3;
  -[PICinematicAudioRenderNode cachedDialogMixBias](self, "cachedDialogMixBias");
  v6 = vabdd_f64(v4, v5);
  v7 = -[PICinematicAudioRenderNode renderingStyle](self, "renderingStyle");
  v8 = -[PICinematicAudioRenderNode cachedRenderingStyle](self, "cachedRenderingStyle");
  return v6 > 0.01 || v7 != v8;
}

- (id)_evaluateAudioMix:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
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
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  const void **v43;
  void *v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  PICinematicAudioRenderNode *v57;
  id v58;
  void *v59;
  _BYTE buf[24];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_15532();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15532();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v40;
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
    goto LABEL_30;
  }
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVideo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "videoProperties:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v15 = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v7, "cinematicAudioMixInputParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing cinematic audio mix input parameters"), v8);
      v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_20;
    }
    -[PICinematicAudioRenderNode dialogMixBias](self, "dialogMixBias");
    *(float *)&v11 = v11;
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
    v54 = *(_OWORD *)buf;
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v12 = *(_QWORD *)&buf[16];
    objc_msgSend(v10, "setDialogMixBias:atTime:", buf, v11);
    *(float *)&v13 = (float)-[PICinematicAudioRenderNode renderingStyle](self, "renderingStyle");
    *(_OWORD *)buf = v54;
    *(_QWORD *)&buf[16] = v12;
    objc_msgSend(v10, "setRenderingStyle:atTime:", buf, v13);
    objc_msgSend(v5, "outputAudioMix:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");
    if (!v14)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_59);
      v16 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        v17 = *a3;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1A6382000, v16, OS_LOG_TYPE_INFO, "Input has no audio mix (%@), creating a new one..", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    objc_msgSend(v15, "inputParameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (!v20)
    {
      v59 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setInputParameters:", v26);
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0D52348], "cinematicAudioTrackInAsset:", v6);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inputParameters");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __48__PICinematicAudioRenderNode__evaluateAudioMix___block_invoke;
      v55[3] = &unk_1E50187A8;
      v56 = v22;
      v57 = self;
      v58 = v23;
      v25 = v23;
      v26 = v22;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v55);

      objc_msgSend(v15, "setInputParameters:", v25);
LABEL_18:

      -[PICinematicAudioRenderNode dialogMixBias](self, "dialogMixBias");
      -[PICinematicAudioRenderNode setCachedDialogMixBias:](self, "setCachedDialogMixBias:");
      -[PICinematicAudioRenderNode setCachedRenderingStyle:](self, "setCachedRenderingStyle:", -[PICinematicAudioRenderNode renderingStyle](self, "renderingStyle"));

      goto LABEL_19;
    }
LABEL_30:
    NUAssertLogger_15532();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing ambisonic track"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v42;
      _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v43 = (const void **)MEMORY[0x1E0D51D48];
    v44 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15532();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v46)
      {
        v49 = dispatch_get_specific(*v43);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v49;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v53;
        _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v48;
      _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v15 = 0;
LABEL_21:

  return v15;
}

- (double)dialogMixBias
{
  return self->_dialogMixBias;
}

- (void)setDialogMixBias:(double)a3
{
  self->_dialogMixBias = a3;
}

- (int64_t)renderingStyle
{
  return self->_renderingStyle;
}

- (void)setRenderingStyle:(int64_t)a3
{
  self->_renderingStyle = a3;
}

- (double)cachedDialogMixBias
{
  return self->_cachedDialogMixBias;
}

- (void)setCachedDialogMixBias:(double)a3
{
  self->_cachedDialogMixBias = a3;
}

- (int64_t)cachedRenderingStyle
{
  return self->_cachedRenderingStyle;
}

- (void)setCachedRenderingStyle:(int64_t)a3
{
  self->_cachedRenderingStyle = a3;
}

void __48__PICinematicAudioRenderNode__evaluateAudioMix___block_invoke(id *a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  double v6;
  uint64_t v7;
  double v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "trackID");
  if (v4 == objc_msgSend(a1[4], "trackID"))
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(a1[5], "dialogMixBias");
    *(float *)&v6 = v6;
    v10 = *MEMORY[0x1E0CA2E68];
    v9 = v10;
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v7 = v11;
    objc_msgSend(v5, "setDialogMixBias:atTime:", &v10, v6);
    *(float *)&v8 = (float)objc_msgSend(a1[5], "renderingStyle");
    v10 = v9;
    v11 = v7;
    objc_msgSend(v5, "setRenderingStyle:atTime:", &v10, v8);
    objc_msgSend(a1[6], "addObject:", v5);
    v3 = v5;
  }
  else
  {
    objc_msgSend(a1[6], "addObject:", v3);
  }

}

@end

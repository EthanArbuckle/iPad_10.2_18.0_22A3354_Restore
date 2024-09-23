@implementation PIPortraitVideoRenderer

- (PIPortraitVideoRenderer)initWithDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7
{
  int64_t var1;
  int64_t var0;
  int64_t v10;
  int64_t v11;
  MTLDevice *v13;
  MTLDevice *v14;
  PIPortraitVideoRenderer *v15;
  MTLDevice *device;
  NSObject *v18;
  const void **v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  const void **v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  const void **v31;
  void *v32;
  int v33;
  void *v34;
  NSObject *v35;
  const void **v36;
  void *v37;
  int v38;
  void *v39;
  const void **v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  objc_super v58;
  uint8_t buf[4];
  const void **v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  var1 = a5.var1;
  var0 = a5.var0;
  v10 = a4.var1;
  v11 = a4.var0;
  v63 = *MEMORY[0x1E0C80C00];
  v13 = (MTLDevice *)a3;
  if (!v13)
  {
    NUAssertLogger_8627();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "device != nil");
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8627();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v41 = dispatch_get_specific(*v20);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v20 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = (const void **)v41;
        v61 = 2114;
        v62 = v44;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v20;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v28 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  v14 = v13;
  if (NUPixelSizeIsEmpty())
  {
    NUAssertLogger_8627();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelSizeIsEmpty(colorSize)");
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    v27 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8627();
    v22 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v27)
    {
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v20;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_31:

      v33 = _NUAssertFailHandler();
      goto LABEL_32;
    }
LABEL_29:
    if (v28)
    {
      v45 = dispatch_get_specific(*v20);
      v46 = (void *)MEMORY[0x1E0CB3978];
      v47 = v45;
      objc_msgSend(v46, "callStackSymbols");
      v20 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v45;
      v61 = 2114;
      v62 = v48;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_31;
  }
  if (NUPixelSizeIsEmpty())
  {
    NUAssertLogger_8627();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "!NUPixelSizeIsEmpty(disparitySize)");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    v32 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8627();
    v22 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v32)
    {
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v20;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_34:

      v38 = _NUAssertFailHandler();
      goto LABEL_35;
    }
LABEL_32:
    if (v33)
    {
      v49 = dispatch_get_specific(*v20);
      v50 = (void *)MEMORY[0x1E0CB3978];
      v51 = v49;
      objc_msgSend(v50, "callStackSymbols");
      v20 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v49;
      v61 = 2114;
      v62 = v52;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_34;
  }
  if (a6 >= 0x65)
  {
    NUAssertLogger_8627();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "quality >= PTQualityPreviewLow && quality <= PTQualityExportProfessional");
      v36 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v36;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    v37 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8627();
    v22 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v37)
    {
      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v40;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_37;
    }
LABEL_35:
    if (v38)
    {
      v53 = dispatch_get_specific(*v20);
      v54 = (void *)MEMORY[0x1E0CB3978];
      v55 = v53;
      objc_msgSend(v54, "callStackSymbols");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = (const void **)v53;
      v61 = 2114;
      v62 = v57;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_37:

    _NUAssertFailHandler();
  }
  v58.receiver = self;
  v58.super_class = (Class)PIPortraitVideoRenderer;
  v15 = -[PIPortraitVideoRenderer init](&v58, sel_init);
  device = v15->_device;
  v15->_device = v14;

  v15->_colorSize.width = v11;
  v15->_colorSize.height = v10;
  v15->_disparitySize.width = var0;
  v15->_disparitySize.height = var1;
  v15->_quality = a6;
  v15->_debugMode = a7;
  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTLDevice name](self->_device, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p device:%@ color=%ldx%ld disparity=%ldx%ld quality=%d debug=%ld>"), v4, self, v5, self->_colorSize.width, self->_colorSize.height, self->_disparitySize.width, self->_disparitySize.height, self->_quality, self->_debugMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)prepareToRenderWithMetadata:(id)a3
{
  NSObject *v4;
  PTRenderState *renderState;
  PTRenderPipeline *renderPipeline;
  NSObject *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  PTRenderPipeline *v17;
  PTRenderPipeline *v18;
  NSObject *v19;
  PTRenderState *v20;
  NSObject *v21;
  PTRenderState *v22;
  PTRenderState *v23;
  NSObject *v24;
  PIPortraitVideoRenderer *v25;
  const void **v26;
  _BOOL4 v27;
  PIPortraitVideoRenderer *v28;
  void *v29;
  PIPortraitVideoRenderer *v30;
  void *v31;
  void *v32;
  int v33;
  PIPortraitVideoRenderer *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  renderPipeline = self->_renderPipeline;
  renderState = self->_renderState;
  if ((renderPipeline == 0) != (renderState == 0))
  {
    NUAssertLogger_8627();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected _renderPipeline and _renderState to be allocated at the same time"));
      v25 = (PIPortraitVideoRenderer *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v33, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    self = (PIPortraitVideoRenderer *)dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8627();
    v7 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (self)
    {
      if (v27)
      {
        self = (PIPortraitVideoRenderer *)dispatch_get_specific(*v26);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = self;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = self;
        v35 = 2114;
        v36 = v32;
        _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v33, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      self = (PIPortraitVideoRenderer *)objc_claimAutoreleasedReturnValue();
      -[PIPortraitVideoRenderer componentsJoinedByString:](self, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (PIPortraitVideoRenderer *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v28;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v33, 0xCu);

    }
    _NUAssertFailHandler();
    goto LABEL_27;
  }
  v7 = v4;
  if (!renderPipeline)
  {
    v8 = objc_alloc(MEMORY[0x1E0D7F590]);
    -[PIPortraitVideoRenderer device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPortraitVideoRenderer colorSize](self, "colorSize");
    NUPixelSizeToCGSize();
    v11 = v10;
    v13 = v12;
    -[PIPortraitVideoRenderer disparitySize](self, "disparitySize");
    NUPixelSizeToCGSize();
    v16 = (void *)objc_msgSend(v8, "initWithDevice:version:colorSize:disparitySize:", v9, 1, v11, v13, v14, v15);

    objc_msgSend(v16, "setDebugRendering:", -[PIPortraitVideoRenderer debugMode](self, "debugMode"));
    objc_msgSend(v16, "setUseRGBA:", 1);
    v17 = (PTRenderPipeline *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F580]), "initWithDescriptor:", v16);
    v18 = self->_renderPipeline;
    self->_renderPipeline = v17;

    renderState = self->_renderState;
  }
  if (v7 && renderState)
  {
    if ((-[NSObject matchesRenderState:](v7, "matchesRenderState:") & 1) == 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_83);
      v19 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_1A6382000, v19, OS_LOG_TYPE_INFO, "CINE: need new render state due to global metadata mismatch", (uint8_t *)&v33, 2u);
      }
      v20 = self->_renderState;
      self->_renderState = 0;

    }
    renderState = self->_renderState;
  }
  if (!renderState)
  {
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_15:
      v21 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
      {
        v33 = 134217984;
        v34 = (PIPortraitVideoRenderer *)v7;
        _os_log_impl(&dword_1A6382000, v21, OS_LOG_TYPE_INFO, "CINE: allocating new renderState with metadata: %p", (uint8_t *)&v33, 0xCu);
      }
      -[PTRenderPipeline createRenderStateWithQuality:](self->_renderPipeline, "createRenderStateWithQuality:", -[PIPortraitVideoRenderer quality](self, "quality"));
      v22 = (PTRenderState *)objc_claimAutoreleasedReturnValue();
      v23 = self->_renderState;
      self->_renderState = v22;

      -[NSObject applyToRenderState:](v7, "applyToRenderState:", self->_renderState);
      goto LABEL_18;
    }
LABEL_27:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_83);
    goto LABEL_15;
  }
LABEL_18:

}

- (MTLDevice)device
{
  return self->_device;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)colorSize
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_colorSize.height;
  width = self->_colorSize.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)disparitySize
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_disparitySize.height;
  width = self->_disparitySize.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (int)quality
{
  return self->_quality;
}

- (int64_t)debugMode
{
  return self->_debugMode;
}

- (BOOL)isInUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (NSDate)lastUseTime
{
  return self->_lastUseTime;
}

- (void)setLastUseTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUseTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUseTime, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
}

+ (void)renderOnDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7 globalRenderingMetadata:(id)a8 usingBlock:(id)a9
{
  int64_t var0;
  int64_t v10;
  int64_t v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  dispatch_time_t v23;
  NSObject *v24;
  id v25;
  int64_t var1;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  _QWORD block[4];
  id v38;
  uint64_t *v39;
  int64_t v40;
  int64_t v41;
  int64_t v42;
  int64_t v43;
  int64_t v44;
  int v45;
  BOOL v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  var1 = a5.var1;
  var0 = a5.var0;
  v10 = a4.var1;
  v11 = a4.var0;
  v12 = a3;
  v13 = a8;
  v14 = a9;
  if (renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__onceToken != -1)
    dispatch_once(&renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__onceToken, &__block_literal_global_13);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__8674;
  v51 = __Block_byref_object_dispose__8675;
  v52 = 0;
  v15 = renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_16;
  block[3] = &unk_1E5016F08;
  v16 = v12;
  v40 = v11;
  v41 = v10;
  v42 = var0;
  v43 = var1;
  v45 = a6;
  v44 = a7;
  v46 = v14 == &__block_literal_global_8672;
  v38 = v16;
  v39 = &v47;
  dispatch_sync(v15, block);
  v17 = v13;
  if (v48[5])
  {
    v18 = renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
    v19 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_19;
    v34[3] = &unk_1E5017DE0;
    v36 = &v47;
    v35 = v17;
    dispatch_sync(v18, v34);
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, *(_QWORD *)(v48[5] + 8), *(_QWORD *)(v48[5] + 16));
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_2_21;
    v31[3] = &unk_1E5017DE0;
    v33 = &v47;
    v22 = v20;
    v32 = v22;
    dispatch_sync(v21, v31);
    v23 = dispatch_time(0, 3000000000);
    v24 = renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_3;
    v28[3] = &unk_1E5017DE0;
    v29 = v22;
    v30 = &v47;
    v25 = v22;
    dispatch_after(v23, v24, v28);

  }
  _Block_object_dispose(&v47, 8);

}

+ (void)prewarmRendererForDevice:(id)a3 colorSize:(id)a4 disparitySize:(id)a5 quality:(int)a6 debugMode:(int64_t)a7 globalRenderingMetadata:(id)a8
{
  objc_msgSend(a1, "renderOnDevice:colorSize:disparitySize:quality:debugMode:globalRenderingMetadata:usingBlock:", a3, a4.var0, a4.var1, a5.var0, a5.var1, *(_QWORD *)&a6, a7, a8, &__block_literal_global_8672);
}

void __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_16(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  PIPortraitVideoRenderer *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  int v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_2;
  v17 = &unk_1E5016EE0;
  v18 = *(id *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v19 = *(_OWORD *)(a1 + 48);
  v20 = v3;
  v22 = *(_DWORD *)(a1 + 88);
  v21 = *(_QWORD *)(a1 + 80);
  v23 = *(_BYTE *)(a1 + 92);
  v4 = objc_msgSend(v2, "indexOfObjectPassingTest:", &v14);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [PIPortraitVideoRenderer alloc];
    v6 = -[PIPortraitVideoRenderer initWithDevice:colorSize:disparitySize:quality:debugMode:](v5, "initWithDevice:colorSize:disparitySize:quality:debugMode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 80), v14, v15, v16, v17);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_83);
    v9 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1A6382000, v9, OS_LOG_TYPE_INFO, "CINE: allocating new PT renderer: %@", buf, 0xCu);
    }
    objc_msgSend((id)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  else if (!*(_BYTE *)(a1 + 92))
  {
    objc_msgSend((id)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool, "objectAtIndex:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setInUse:", 1);

}

uint64_t __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "prepareToRenderWithMetadata:", *(_QWORD *)(a1 + 32));
}

uint64_t __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_2_21(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setInUse:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLastUseTime:", *(_QWORD *)(a1 + 32));
}

void __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "lastUseTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToDate:", *(_QWORD *)(a1 + 32));

  if (v3)
  {
    objc_msgSend((id)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool, "removeObjectIdenticalTo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_83);
    v4 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v6 = (void *)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool;
      v7 = v4;
      v8 = 138412546;
      v9 = v5;
      v10 = 2048;
      v11 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1A6382000, v7, OS_LOG_TYPE_INFO, "CINE: recycling unused PT renderer: %@ (%lu remaining)", (uint8_t *)&v8, 0x16u);

    }
  }
}

BOOL __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  v6 = 0;
  if (v4 == v5)
  {
    objc_msgSend(v3, "colorSize");
    if (NUPixelSizeEqualToSize())
    {
      objc_msgSend(v3, "disparitySize");
      if (NUPixelSizeEqualToSize())
      {
        if (objc_msgSend(v3, "quality") == *(_DWORD *)(a1 + 80)
          && objc_msgSend(v3, "debugMode") == *(_QWORD *)(a1 + 72)
          && (!objc_msgSend(v3, "isInUse") || *(_BYTE *)(a1 + 84)))
        {
          v6 = 1;
        }
      }
    }
  }

  return v6;
}

void __119__PIPortraitVideoRenderer_renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  id v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("PIPortraitVideoRenderer.pool", v0);
  v2 = (void *)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue;
  renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_poolQueue = (uint64_t)v1;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool;
  renderOnDevice_colorSize_disparitySize_quality_debugMode_globalRenderingMetadata_usingBlock__s_rendererPool = (uint64_t)v3;

}

@end

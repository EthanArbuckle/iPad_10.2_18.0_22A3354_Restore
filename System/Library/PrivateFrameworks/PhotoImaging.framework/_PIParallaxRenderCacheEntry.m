@implementation _PIParallaxRenderCacheEntry

- (_PIParallaxRenderCacheEntry)initWithImage:(id)a3 format:(id)a4 colorSpace:(id)a5
{
  NSObject *v9;
  id specific;
  const void **v11;
  const void **v12;
  void *v13;
  uint64_t v14;
  NUCVPixelBuffer *v15;
  NUCVPixelBuffer *pixelBuffer;
  void *v17;
  CIImage *v18;
  CIImage *cachedImage;
  _PIParallaxRenderCacheEntry *v20;
  void *v21;
  __int128 v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint8_t v55[40];
  uint64_t v56;
  CGRect v57;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  specific = a4;
  v11 = (const void **)a5;
  if (!v9)
  {
    NUAssertLogger_15027();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543362;
      *(_QWORD *)&v55[4] = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v55, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v9 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        specific = dispatch_get_specific(*v12);
        v38 = (void *)MEMORY[0x1E0CB3978];
        self = (_PIParallaxRenderCacheEntry *)specific;
        objc_msgSend(v38, "callStackSymbols");
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v55 = 138543618;
        *(_QWORD *)&v55[4] = specific;
        *(_WORD *)&v55[12] = 2114;
        *(_QWORD *)&v55[14] = v39;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v55, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543362;
      *(_QWORD *)&v55[4] = v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v55, 0xCu);

    }
    v31 = _NUAssertFailHandler();
    goto LABEL_35;
  }
  if (!specific)
  {
    NUAssertLogger_15027();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "format != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543362;
      *(_QWORD *)&v55[4] = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v55, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v9 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v55 = 138543362;
        *(_QWORD *)&v55[4] = v12;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v55, 0xCu);

      }
LABEL_37:

      v34 = _NUAssertFailHandler();
      goto LABEL_38;
    }
LABEL_35:
    if (v31)
    {
      specific = dispatch_get_specific(*v12);
      v40 = (void *)MEMORY[0x1E0CB3978];
      self = (_PIParallaxRenderCacheEntry *)specific;
      objc_msgSend(v40, "callStackSymbols");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543618;
      *(_QWORD *)&v55[4] = specific;
      *(_WORD *)&v55[12] = 2114;
      *(_QWORD *)&v55[14] = v41;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v55, 0x16u);

    }
    goto LABEL_37;
  }
  v12 = v11;
  if (!v11)
  {
    NUAssertLogger_15027();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "space != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543362;
      *(_QWORD *)&v55[4] = v33;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v55, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v9 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v55 = 138543362;
        *(_QWORD *)&v55[4] = v12;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v55, 0xCu);

      }
LABEL_40:

      v37 = _NUAssertFailHandler();
      goto LABEL_41;
    }
LABEL_38:
    if (v34)
    {
      specific = dispatch_get_specific(*v12);
      v42 = (void *)MEMORY[0x1E0CB3978];
      self = (_PIParallaxRenderCacheEntry *)specific;
      objc_msgSend(v42, "callStackSymbols");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543618;
      *(_QWORD *)&v55[4] = specific;
      *(_WORD *)&v55[12] = 2114;
      *(_QWORD *)&v55[14] = v43;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v55, 0x16u);

    }
    goto LABEL_40;
  }
  -[NSObject extent](v9, "extent");
  if (CGRectIsInfinite(v57))
  {
    NUAssertLogger_15027();
    v35 = objc_claimAutoreleasedReturnValue();
    self = (_PIParallaxRenderCacheEntry *)&unk_1A64D6000;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid image extent"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543362;
      *(_QWORD *)&v55[4] = v36;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v55, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v9 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v37)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v55 = 138543362;
        *(_QWORD *)&v55[4] = v12;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v55, 0xCu);

      }
LABEL_43:

      _NUAssertFailHandler();
LABEL_44:
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14991);
      goto LABEL_8;
    }
LABEL_41:
    if (v37)
    {
      specific = dispatch_get_specific(*v12);
      v44 = (void *)MEMORY[0x1E0CB3978];
      self = (_PIParallaxRenderCacheEntry *)specific;
      objc_msgSend(v44, "callStackSymbols");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543618;
      *(_QWORD *)&v55[4] = specific;
      *(_WORD *)&v55[12] = 2114;
      *(_QWORD *)&v55[14] = v45;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v55, 0x16u);

    }
    goto LABEL_43;
  }
  memset(v55, 0, 32);
  NUPixelRectFromCGRect();
  v46.receiver = self;
  v46.super_class = (Class)_PIParallaxRenderCacheEntry;
  self = -[_PIParallaxRenderCacheEntry init](&v46, sel_init);
  objc_storeStrong((id *)&self->_pixelFormat, a4);
  objc_storeStrong((id *)&self->_colorSpace, a5);
  objc_storeStrong((id *)&self->_image, a3);
  v13 = (void *)MEMORY[0x1E0D52348];
  v14 = objc_msgSend(specific, "CVPixelFormat");
  v15 = (NUCVPixelBuffer *)objc_msgSend(v13, "newPixelBufferOfSize:format:", *(_OWORD *)&v55[16], v14);
  pixelBuffer = self->_pixelBuffer;
  self->_pixelBuffer = v15;

  if (self->_pixelBuffer)
  {
    v47 = *MEMORY[0x1E0C9E110];
    v48 = objc_msgSend(v12, "CGColorSpace");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer"), v17);
    v18 = (CIImage *)objc_claimAutoreleasedReturnValue();
    cachedImage = self->_cachedImage;
    self->_cachedImage = v18;

    v20 = self;
    goto LABEL_11;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_44;
LABEL_8:
  v21 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    v23 = *(_OWORD *)&v55[16];
    v24 = v21;
    objc_msgSend(specific, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v50 = v23;
    v51 = 2048;
    v52 = *((_QWORD *)&v23 + 1);
    v53 = 2114;
    v54 = v25;
    _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Failed to allocate pixel buffer for render cache entry (size=%ldx%ld, format=%{public}@)", buf, 0x20u);

  }
  v20 = 0;
LABEL_11:

  return v20;
}

- (unint64_t)sizeInBytes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NUCVPixelBuffer size](self->_pixelBuffer, "size");
  v5 = v4;
  -[NUCVPixelBuffer format](self->_pixelBuffer, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3 * v5 * objc_msgSend(v6, "bytesPerPixel");

  return v7;
}

- (BOOL)render:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CIRenderTask *renderTask;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CIRenderTask *v13;
  CIRenderTask *v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _OWORD v39[2];
  uint8_t buf[40];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_15027();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "renderer != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v30 = dispatch_get_specific(*v19);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v19 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v27 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  if (!a4)
  {
    NUAssertLogger_15027();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    v26 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_15027();
    v21 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_21;
    }
LABEL_19:
    if (v27)
    {
      v34 = dispatch_get_specific(*v19);
      v35 = (void *)MEMORY[0x1E0CB3978];
      v36 = v34;
      objc_msgSend(v35, "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v38;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_21:

    _NUAssertFailHandler();
  }
  v7 = v6;
  renderTask = self->_renderTask;
  if (!renderTask)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer"));
    -[_PIParallaxRenderCacheEntry colorSpace](self, "colorSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColorSpace:", objc_msgSend(v10, "CGColorSpace"));

    memset(buf, 0, 32);
    -[_PIParallaxRenderCacheEntry image](self, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extent");
    NUPixelRectFromCGRect();

    -[_PIParallaxRenderCacheEntry image](self, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v39, 0, sizeof(v39));
    objc_msgSend(v7, "renderImage:rect:toDestination:atPoint:error:", v12, v39, v9, *MEMORY[0x1E0D51E30], *(_QWORD *)(MEMORY[0x1E0D51E30] + 8), a4);
    v13 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
    v14 = self->_renderTask;
    self->_renderTask = v13;

    renderTask = self->_renderTask;
  }
  v15 = renderTask != 0;

  return v15;
}

- (BOOL)waitForRender:(id *)a3
{
  CIRenderInfo *renderInfo;
  CIRenderInfo *v5;
  CIRenderInfo *v6;

  renderInfo = self->_renderInfo;
  if (!renderInfo)
  {
    -[CIRenderTask waitUntilCompletedAndReturnError:](self->_renderTask, "waitUntilCompletedAndReturnError:", a3);
    v5 = (CIRenderInfo *)objc_claimAutoreleasedReturnValue();
    v6 = self->_renderInfo;
    self->_renderInfo = v5;

    renderInfo = self->_renderInfo;
  }
  return renderInfo != 0;
}

- (CIImage)image
{
  return self->_image;
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (CIRenderTask)renderTask
{
  return self->_renderTask;
}

- (CIRenderInfo)renderInfo
{
  return self->_renderInfo;
}

- (CIImage)cachedImage
{
  return self->_cachedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_renderInfo, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_pixelBuffer, 0);
}

@end

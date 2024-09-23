@implementation PIParallaxInfillJob

- (PIParallaxInfillJob)initWithRequest:(id)a3
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
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_81);
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
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_81);
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
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_81);
  }
}

- (PIParallaxInfillJob)initWithParallaxInfillRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PIParallaxInfillJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[PIParallaxInfillJob infillRequest](self, "infillRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)prepare:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v11;
  BOOL v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  CGAffineTransform v26;
  CGAffineTransform v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PIParallaxInfillJob;
  if (-[NURenderJob prepare:](&v28, sel_prepare_))
  {
    -[PIParallaxInfillJob infillRequest](self, "infillRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "segmentationMatte");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithNUImageBuffer:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "extent");
      if (v8 >= 1.0 && v9 >= 1.0)
      {
        v14 = v8;
        v15 = v9;
        -[PIParallaxInfillJob infillRequest](self, "infillRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "shouldInfillForeground");

        if (v17)
        {
          +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", v7);
          v18 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v18;
        }
        v19 = v7;
        +[PISegmentationHelper infillMaskForSegmentationMatte:](PISegmentationHelper, "infillMaskForSegmentationMatte:", v7);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        -[NURenderJob outputImage](self, "outputImage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "extent");
        if (v21 == v14 && v22 == v15)
        {
          -[PIParallaxInfillJob setMatteImage:](self, "setMatteImage:", v7);
        }
        else
        {
          memset(&v27, 0, sizeof(v27));
          CGAffineTransformMakeScale(&v27, v21 / v14, v22 / v15);
          v26 = v27;
          objc_msgSend(v7, "imageByApplyingTransform:", &v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PIParallaxInfillJob setMatteImage:](self, "setMatteImage:", v23);

        }
        -[PIParallaxInfillJob matteImage](self, "matteImage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v24 != 0;

        if (!v24)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid matte image"), v7);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid matte image size"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0D520A0];
      -[PIParallaxInfillJob infillRequest](self, "infillRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "missingError:object:", CFSTR("Missing matte image"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = 0;
    *a3 = v11;
LABEL_21:

    return v12;
  }
  return 0;
}

- (BOOL)render:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PISegmentationInfillFilter *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NUStorageImageBuffer *v23;
  NUStorageImageBuffer *infilledImageBuffer;
  NUStorageImageBuffer *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  CIRenderTask *v29;
  CIRenderTask *renderTask;
  BOOL v31;
  NSObject *v33;
  void *v34;
  const void **v35;
  void *specific;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id *v55;
  _BYTE buf[24];
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[NURenderJob outputImage](self, "outputImage");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    NUAssertLogger();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output image must not be nil"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v38)
      {
        v46 = dispatch_get_specific(*v35);
        v47 = (void *)MEMORY[0x1E0CB3978];
        v48 = v46;
        objc_msgSend(v47, "callStackSymbols");
        v35 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v49;
        _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v35;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v43 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v6 = (void *)v5;
  -[PIParallaxInfillJob matteImage](self, "matteImage");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    NUAssertLogger();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Matte image must not be nil"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v41;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = (const void **)MEMORY[0x1E0D51D48];
    v42 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v37 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (!v42)
    {
      if (v43)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v45;
        _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_25;
    }
LABEL_23:
    if (v43)
    {
      v50 = dispatch_get_specific(*v35);
      v51 = (void *)MEMORY[0x1E0CB3978];
      v52 = v50;
      objc_msgSend(v51, "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v54;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_25:

    _NUAssertFailHandler();
  }
  v8 = (void *)v7;
  v9 = objc_alloc_init(PISegmentationInfillFilter);
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISegmentationInfillFilter setInfillAlgorithm:](v9, "setInfillAlgorithm:", objc_msgSend(v10, "segmentationInfillAlgorithm"));

  -[PISegmentationInfillFilter setInputImage:](v9, "setInputImage:", v6);
  -[PISegmentationInfillFilter setInputMatteImage:](v9, "setInputMatteImage:", v8);
  -[PISegmentationInfillFilter outputImage](v9, "outputImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v55 = a3;
    -[PIParallaxInfillJob infillRequest](self, "infillRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pixelFormat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PIParallaxInfillJob infillRequest](self, "infillRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)&buf[16] = -[NURenderJob imageSize](self, "imageSize");
    v57 = v16;
    objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", buf);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "surfaceStoragePool");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0D522F0];
    v21 = -[NURenderJob imageSize](self, "imageSize");
    objc_msgSend(v20, "imageBufferWithSize:format:fromPool:", v21, v22, v13, v19);
    v23 = (NUStorageImageBuffer *)objc_claimAutoreleasedReturnValue();
    infilledImageBuffer = self->_infilledImageBuffer;
    self->_infilledImageBuffer = v23;

    v25 = self->_infilledImageBuffer;
    if (v25)
    {
      -[NUStorageImageBuffer storage](v25, "storage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NURenderJob imageSize](self, "imageSize");
      -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v11, v26, v15, v17, v27, v28, v55);
      v29 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
      renderTask = self->_renderTask;
      self->_renderTask = v29;

      v31 = self->_renderTask != 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to allocate buffer from pool"), v19);
      v31 = 0;
      *v55 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("Failed to generate background infill image"), 0);
    v31 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v31;
}

- (BOOL)complete:(id *)a3
{
  CIRenderTask *renderTask;
  void *v6;
  id v7;
  CIRenderTask *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v14;

  renderTask = self->_renderTask;
  v14 = 0;
  -[CIRenderTask nu_waitUntilCompletedAndReturnError:](renderTask, "nu_waitUntilCompletedAndReturnError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    v8 = self->_renderTask;
    self->_renderTask = 0;
    v9 = v7;

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D520A0];
    v11 = v14;
    -[NURenderJob request](self, "request");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to render"), v9, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    *a3 = v12;
  }

  return v6 != 0;
}

- (id)result
{
  _PIParallaxInfillResult *v3;

  v3 = objc_alloc_init(_PIParallaxInfillResult);
  -[_PIParallaxInfillResult setInfilledImage:](v3, "setInfilledImage:", self->_infilledImageBuffer);
  return v3;
}

- (void)cleanUp
{
  NUStorageImageBuffer *infilledImageBuffer;

  infilledImageBuffer = self->_infilledImageBuffer;
  self->_infilledImageBuffer = 0;

}

- (CIImage)matteImage
{
  return self->_matteImage;
}

- (void)setMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_matteImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matteImage, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_infilledImageBuffer, 0);
}

@end

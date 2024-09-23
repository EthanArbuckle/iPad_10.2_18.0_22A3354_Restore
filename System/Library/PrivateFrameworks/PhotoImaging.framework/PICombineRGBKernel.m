@implementation PICombineRGBKernel

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  id v4;
  void *v5;
  id v6;
  NSObject *v9;
  id specific;
  uint64_t v11;
  const void **v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const void **v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  _WORD v56[2];
  id v57;
  uint8_t buf[24];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  specific = a4;
  -[PICombineRGBKernel redTexture](self, "redTexture");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    NUAssertLogger_4407();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing red input texture"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v35;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v9 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_57;
    }
LABEL_55:
    if (v36)
    {
      specific = dispatch_get_specific(*v12);
      v46 = (void *)MEMORY[0x1E0CB3978];
      v4 = specific;
      objc_msgSend(v46, "callStackSymbols");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_57:

    v39 = _NUAssertFailHandler();
    goto LABEL_58;
  }
  v12 = (const void **)v11;
  -[PICombineRGBKernel greenTexture](self, "greenTexture");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    NUAssertLogger_4407();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing green input texture"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v9 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_60;
    }
LABEL_58:
    if (v39)
    {
      specific = dispatch_get_specific(*v12);
      v47 = (void *)MEMORY[0x1E0CB3978];
      v4 = specific;
      objc_msgSend(v47, "callStackSymbols");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_60:

    v42 = _NUAssertFailHandler();
    goto LABEL_61;
  }
  v4 = (id)v13;
  -[PICombineRGBKernel blueTexture](self, "blueTexture");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    NUAssertLogger_4407();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing blue input texture"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v41;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v9 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_63;
    }
LABEL_61:
    if (v42)
    {
      specific = dispatch_get_specific(*v12);
      v48 = (void *)MEMORY[0x1E0CB3978];
      v4 = specific;
      objc_msgSend(v48, "callStackSymbols");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_63:

    _NUAssertFailHandler();
LABEL_64:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223);
    goto LABEL_13;
  }
  v5 = (void *)v14;
  v6 = (id)objc_msgSend(v12, "width");
  if (v6 != (id)objc_msgSend(specific, "width")
    || (v6 = (id)objc_msgSend(v12, "width"), v6 != (id)objc_msgSend(specific, "width")))
  {
    NUAssertLogger_4407();
    v25 = objc_claimAutoreleasedReturnValue();
    v4 = &unk_1A64D6000;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input size mismatch"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v9 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        specific = dispatch_get_specific(*v12);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v4 = specific;
        objc_msgSend(v43, "callStackSymbols");
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = specific;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v30 = _NUAssertFailHandler();
    goto LABEL_49;
  }
  v6 = (id)objc_msgSend(v4, "width");
  if (v6 != (id)objc_msgSend(specific, "width")
    || (v6 = (id)objc_msgSend(v4, "width"), v6 != (id)objc_msgSend(specific, "width")))
  {
    NUAssertLogger_4407();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input size mismatch"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v9 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_51:

      v33 = _NUAssertFailHandler();
      goto LABEL_52;
    }
LABEL_49:
    if (v30)
    {
      specific = dispatch_get_specific(*v12);
      v44 = (void *)MEMORY[0x1E0CB3978];
      v4 = specific;
      objc_msgSend(v44, "callStackSymbols");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_51;
  }
  v6 = (id)objc_msgSend(v5, "width");
  if (v6 != (id)objc_msgSend(specific, "width")
    || (v6 = (id)objc_msgSend(v5, "width"), v6 != (id)objc_msgSend(specific, "width")))
  {
    NUAssertLogger_4407();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input size mismatch"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v9 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        specific = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v12;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_54:

      v36 = _NUAssertFailHandler();
      goto LABEL_55;
    }
LABEL_52:
    if (v33)
    {
      specific = dispatch_get_specific(*v12);
      v45 = (void *)MEMORY[0x1E0CB3978];
      v4 = specific;
      objc_msgSend(v45, "callStackSymbols");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = specific;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_54;
  }
  v15 = (void *)objc_opt_class();
  -[NUComputeKernel device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  objc_msgSend(v15, "pipelineStateForFunctionWithName:device:error:", CFSTR("pi::combineRGB"), v16, &v57);
  self = (PICombineRGBKernel *)objc_claimAutoreleasedReturnValue();
  v6 = v57;

  if (self)
  {
    -[NSObject computeCommandEncoder](v9, "computeCommandEncoder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pushDebugGroup:", CFSTR("pi::combineRGB"));
    objc_msgSend(v17, "setComputePipelineState:", self);
    objc_msgSend(v17, "setTexture:atIndex:", v12, 0);
    objc_msgSend(v17, "setTexture:atIndex:", v4, 1);
    objc_msgSend(v17, "setTexture:atIndex:", v5, 2);
    objc_msgSend(v17, "setTexture:atIndex:", specific, 3);
    v56[0] = objc_msgSend(specific, "width");
    v56[1] = objc_msgSend(specific, "height");
    objc_msgSend(v17, "setBytes:length:atIndex:", v56, 4, 0);
    v18 = objc_msgSend(specific, "width");
    v19 = objc_msgSend(specific, "height");
    v49 = v5;
    v20 = v4;
    v21 = v12;
    v22 = v9;
    v23 = objc_msgSend(specific, "depth");
    memset(buf, 0, sizeof(buf));
    *(_QWORD *)&v54 = v18;
    *((_QWORD *)&v54 + 1) = v19;
    v55 = v23;
    objc_msgSend(MEMORY[0x1E0D52078], "groupSizeForImageSize:pipelineState:", &v54, self);
    v54 = 0uLL;
    v55 = 0;
    v52 = *(_OWORD *)buf;
    v53 = *(_QWORD *)&buf[16];
    *(_QWORD *)&v50 = v18;
    *((_QWORD *)&v50 + 1) = v19;
    v51 = v23;
    v9 = v22;
    v12 = v21;
    v4 = v20;
    v5 = v49;
    objc_msgSend(MEMORY[0x1E0D52078], "gridSizeForThreadGroupSize:imageSize:", &v52, &v50);
    v52 = v54;
    v53 = v55;
    v50 = *(_OWORD *)buf;
    v51 = *(_QWORD *)&buf[16];
    objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", &v52, &v50);
    objc_msgSend(v17, "popDebugGroup");
    objc_msgSend(v17, "endEncoding");

    goto LABEL_15;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_64;
LABEL_13:
  v24 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Failed to load compute pipeline: %@", buf, 0xCu);
  }
LABEL_15:

}

- (MTLTexture)redTexture
{
  return self->_redTexture;
}

- (void)setRedTexture:(id)a3
{
  objc_storeStrong((id *)&self->_redTexture, a3);
}

- (MTLTexture)greenTexture
{
  return self->_greenTexture;
}

- (void)setGreenTexture:(id)a3
{
  objc_storeStrong((id *)&self->_greenTexture, a3);
}

- (MTLTexture)blueTexture
{
  return self->_blueTexture;
}

- (void)setBlueTexture:(id)a3
{
  objc_storeStrong((id *)&self->_blueTexture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueTexture, 0);
  objc_storeStrong((id *)&self->_greenTexture, 0);
  objc_storeStrong((id *)&self->_redTexture, 0);
}

+ (void)combineRGBTextures:(id)a3 intoDestinationTexture:(id)a4 withCommandBuffer:(id)a5
{
  id v7;
  id v8;
  PICombineRGBKernel *v9;
  void *v10;
  PICombineRGBKernel *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const void **v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  const void **v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  const void **v28;
  void *v29;
  int v30;
  void *v31;
  const void **v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  const void **v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v46, "count") != 3)
  {
    NUAssertLogger_4407();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "srcTextures.count == 3");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v33 = dispatch_get_specific(*v17);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = (const void **)v33;
        v49 = 2114;
        v50 = v36;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v17;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v25 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  if (!v7)
  {
    NUAssertLogger_4407();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "outputTexture != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v24 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v17;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_25:

      v30 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v25)
    {
      v37 = dispatch_get_specific(*v17);
      v38 = (void *)MEMORY[0x1E0CB3978];
      v39 = v37;
      objc_msgSend(v38, "callStackSymbols");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v37;
      v49 = 2114;
      v50 = v40;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if (!v8)
  {
    NUAssertLogger_4407();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "commandBuffer != nil");
      v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v28;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    v29 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4407();
    v19 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v32;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_28;
    }
LABEL_26:
    if (v30)
    {
      v41 = dispatch_get_specific(*v17);
      v42 = (void *)MEMORY[0x1E0CB3978];
      v43 = v41;
      objc_msgSend(v42, "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v41;
      v49 = 2114;
      v50 = v45;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  v9 = [PICombineRGBKernel alloc];
  objc_msgSend(v8, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NUComputeKernel initWithDevice:](v9, "initWithDevice:", v10);

  objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICombineRGBKernel setRedTexture:](v11, "setRedTexture:", v12);

  objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICombineRGBKernel setGreenTexture:](v11, "setGreenTexture:", v13);

  objc_msgSend(v46, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PICombineRGBKernel setBlueTexture:](v11, "setBlueTexture:", v14);

  -[PICombineRGBKernel encodeToCommandBuffer:destinationTexture:](v11, "encodeToCommandBuffer:destinationTexture:", v8, v7);
}

@end

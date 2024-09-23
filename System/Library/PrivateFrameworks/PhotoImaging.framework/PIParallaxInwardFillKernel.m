@implementation PIParallaxInwardFillKernel

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  const void **v47;
  void *specific;
  _BOOL4 v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  void *v70;
  id v71;
  void *v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  id v79;
  id v80;
  uint8_t buf[32];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[PIParallaxInwardFillKernel sourceTexture](self, "sourceTexture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    NUAssertLogger_857();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing input texture"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v46;
      _os_log_error_impl(&dword_1A6382000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v47 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_857();
    v21 = objc_claimAutoreleasedReturnValue();
    v49 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v49)
      {
        v57 = dispatch_get_specific(*v47);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v47 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v4;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
      v47 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v47;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v54 = _NUAssertFailHandler();
    goto LABEL_32;
  }
  v5 = v12;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v12, "pixelFormat"), (unint64_t)objc_msgSend(v5, "width") >> 1, (unint64_t)objc_msgSend(v5, "height") >> 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsage:", 3);
  objc_msgSend(v4, "setStorageMode:", 2);
  objc_msgSend(v10, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v13, "newTextureWithDescriptor:", v4);

  if (!v7)
  {
    NUAssertLogger_857();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to allocate intermediate texture"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v52;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v47 = (const void **)MEMORY[0x1E0D51D48];
    v53 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_857();
    v21 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v53)
    {
      if (v54)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v56;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_34:

      _NUAssertFailHandler();
LABEL_35:
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_92);
      goto LABEL_16;
    }
LABEL_32:
    if (v54)
    {
      v60 = dispatch_get_specific(*v47);
      v61 = (void *)MEMORY[0x1E0CB3978];
      v62 = v60;
      objc_msgSend(v61, "callStackSymbols");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v60;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_34;
  }
  v68 = v11;
  v14 = objc_msgSend(v7, "mipmapLevelCount");
  v15 = (void *)objc_opt_class();
  -[NUComputeKernel device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v15, "pipelineStateForFunctionWithName:device:error:", CFSTR("pi::inward_fill_down"), v16, &v80);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v80;

  v19 = (void *)objc_opt_class();
  -[NUComputeKernel device](self, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  objc_msgSend(v19, "pipelineStateForFunctionWithName:device:error:", CFSTR("pi::inward_fill_up"), v20, &v79);
  v21 = objc_claimAutoreleasedReturnValue();
  v6 = v79;

  v70 = (void *)v17;
  if (v17 && v21)
  {
    v69 = v21;
    v64 = v6;
    v65 = v4;
    v67 = v7;
    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:");
    v66 = v5;
    objc_msgSend(v72, "addObject:", v5);
    v71 = v10;
    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        v23 = (void *)objc_msgSend(v7, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v7, "pixelFormat"), objc_msgSend(v7, "textureType"), i, 1, 0, 1);
        objc_msgSend(v72, "addObject:", v23);

      }
      v24 = 0;
      do
      {
        objc_msgSend(v10, "computeCommandEncoder");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pushDebugGroup:", CFSTR("pi::inward_fill_down"));
        objc_msgSend(v25, "setComputePipelineState:", v70);
        objc_msgSend(v72, "objectAtIndexedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTexture:atIndex:", v26, 0);
        objc_msgSend(v72, "objectAtIndexedSubscript:", ++v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTexture:atIndex:", v27, 1);
        v28 = objc_msgSend(v27, "width");
        v29 = objc_msgSend(v27, "height");
        v30 = objc_msgSend(v27, "depth");
        memset(buf, 0, 24);
        *(_QWORD *)&v77 = v28;
        *((_QWORD *)&v77 + 1) = v29;
        v78 = v30;
        objc_msgSend(MEMORY[0x1E0D52078], "groupSizeForImageSize:pipelineState:", &v77, v70);
        v77 = 0uLL;
        v78 = 0;
        v75 = *(_OWORD *)buf;
        v76 = *(_QWORD *)&buf[16];
        *(_QWORD *)&v73 = v28;
        *((_QWORD *)&v73 + 1) = v29;
        v74 = v30;
        objc_msgSend(MEMORY[0x1E0D52078], "gridSizeForThreadGroupSize:imageSize:", &v75, &v73);
        v75 = v77;
        v76 = v78;
        v73 = *(_OWORD *)buf;
        v74 = *(_QWORD *)&buf[16];
        objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", &v75, &v73);
        objc_msgSend(v25, "popDebugGroup");
        objc_msgSend(v25, "endEncoding");

        v10 = v71;
      }
      while (v14 != v24);
    }
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14 + 1);
    objc_msgSend(v31, "addObject:", v68);
    if (v14)
    {
      v32 = 0;
      do
      {
        objc_msgSend(v72, "objectAtIndexedSubscript:", ++v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v33);

      }
      while (v14 != v32);
      do
      {
        objc_msgSend(v10, "computeCommandEncoder");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "pushDebugGroup:", CFSTR("pi::inward_fill_up"));
        objc_msgSend(v34, "setComputePipelineState:", v69);
        v35 = v14 - 1;
        objc_msgSend(v72, "objectAtIndexedSubscript:", v14 - 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTexture:atIndex:", v36, 0);
        objc_msgSend(v72, "objectAtIndexedSubscript:", v14);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTexture:atIndex:", v37, 1);
        objc_msgSend(v31, "objectAtIndexedSubscript:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTexture:atIndex:", v38, 2);
        v39 = objc_msgSend(v38, "width");
        v40 = objc_msgSend(v38, "height");
        v41 = objc_msgSend(v38, "depth");
        memset(buf, 0, 24);
        *(_QWORD *)&v77 = v39;
        *((_QWORD *)&v77 + 1) = v40;
        v78 = v41;
        objc_msgSend(MEMORY[0x1E0D52078], "groupSizeForImageSize:pipelineState:", &v77, v70);
        v77 = 0uLL;
        v78 = 0;
        v75 = *(_OWORD *)buf;
        v76 = *(_QWORD *)&buf[16];
        *(_QWORD *)&v73 = v39;
        *((_QWORD *)&v73 + 1) = v40;
        v74 = v41;
        objc_msgSend(MEMORY[0x1E0D52078], "gridSizeForThreadGroupSize:imageSize:", &v75, &v73);
        v75 = v77;
        v76 = v78;
        v73 = *(_OWORD *)buf;
        v74 = *(_QWORD *)&buf[16];
        objc_msgSend(v34, "dispatchThreadgroups:threadsPerThreadgroup:", &v75, &v73);
        objc_msgSend(v34, "popDebugGroup");
        objc_msgSend(v34, "endEncoding");

        v10 = v71;
        v14 = v35;
      }
      while (v35);
    }

    v7 = v67;
    v42 = v68;
    v4 = v65;
    v5 = v66;
    v21 = v69;
    v43 = v70;
    v6 = v64;
    goto LABEL_18;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_35;
LABEL_16:
  v43 = v70;
  v44 = *MEMORY[0x1E0D52398];
  v42 = v68;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "Failed to load compute pipeline: %@", buf, 0xCu);
  }
LABEL_18:

}

- (MTLTexture)sourceTexture
{
  return self->_sourceTexture;
}

- (void)setSourceTexture:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTexture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTexture, 0);
}

+ (void)fillSourceTexture:(id)a3 intoDestinationTexture:(id)a4 withCommandBuffer:(id)a5
{
  id v7;
  id v8;
  PIParallaxInwardFillKernel *v9;
  void *v10;
  PIParallaxInwardFillKernel *v11;
  NSObject *v12;
  const void **v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  const void **v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  const void **v25;
  void *v26;
  int v27;
  void *v28;
  const void **v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  const void **v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v7 = a4;
  v8 = a5;
  if (!v43)
  {
    NUAssertLogger_857();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputTexture != nil");
      v13 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_857();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v30 = dispatch_get_specific(*v14);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v14 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = (const void **)v30;
        v46 = 2114;
        v47 = v33;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v14;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v22 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  if (!v7)
  {
    NUAssertLogger_857();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "outputTexture != nil");
      v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    v21 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_857();
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v14 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v14;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_25:

      v27 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v22)
    {
      v34 = dispatch_get_specific(*v14);
      v35 = (void *)MEMORY[0x1E0CB3978];
      v36 = v34;
      objc_msgSend(v35, "callStackSymbols");
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = (const void **)v34;
      v46 = 2114;
      v47 = v37;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if (!v8)
  {
    NUAssertLogger_857();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "commandBuffer != nil");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    v26 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_857();
    v16 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v29;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_28;
    }
LABEL_26:
    if (v27)
    {
      v38 = dispatch_get_specific(*v14);
      v39 = (void *)MEMORY[0x1E0CB3978];
      v40 = v38;
      objc_msgSend(v39, "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = (const void **)v38;
      v46 = 2114;
      v47 = v42;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  v9 = [PIParallaxInwardFillKernel alloc];
  objc_msgSend(v8, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NUComputeKernel initWithDevice:](v9, "initWithDevice:", v10);

  -[PIParallaxInwardFillKernel setSourceTexture:](v11, "setSourceTexture:", v43);
  -[PIParallaxInwardFillKernel encodeToCommandBuffer:destinationTexture:](v11, "encodeToCommandBuffer:destinationTexture:", v8, v7);

}

@end

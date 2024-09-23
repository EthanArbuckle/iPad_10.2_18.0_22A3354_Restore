@implementation PIRetouchSourceNode

- (PIRetouchSourceNode)initWithImage:(id)a3 identifier:(id)a4 orientation:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t *v9;
  os_log_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  os_log_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  os_log_t v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v10 = (os_log_t *)MEMORY[0x1E0D52380];
    v11 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = v11;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v18 = *v9;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v18 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
LABEL_7:
        v19 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)MEMORY[0x1E0CB3978];
          v21 = v19;
          objc_msgSend(v20, "callStackSymbols");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v32 = v23;
          _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v18 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v26 = (void *)MEMORY[0x1E0CB3978];
      v27 = specific;
      v21 = v24;
      objc_msgSend(v26, "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = specific;
      v33 = 2114;
      v34 = v29;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
  }
}

- (PIRetouchSourceNode)initWithImage:(id)a3 settings:(id)a4 orientation:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t *v9;
  os_log_t *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  os_log_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  os_log_t v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v10 = (os_log_t *)MEMORY[0x1E0D52380];
    v11 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = v11;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v18 = *v9;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v18 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
LABEL_7:
        v19 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)MEMORY[0x1E0CB3978];
          v21 = v19;
          objc_msgSend(v20, "callStackSymbols");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v32 = v23;
          _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v18 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v24 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v26 = (void *)MEMORY[0x1E0CB3978];
      v27 = specific;
      v21 = v24;
      objc_msgSend(v26, "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = specific;
      v33 = 2114;
      v34 = v29;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
  }
}

- (PIRetouchSourceNode)initWithInputImage:(id)a3 retouchStrokes:(id)a4 detectedFaces:(id)a5 cacheKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  PIRetouchSourceNode *v28;
  uint64_t v29;
  NUMutableBufferImage *retouchImage;
  NUBufferImage *renderedImage;
  uint64_t v32;
  NSArray *strokes;
  uint64_t v34;
  NSString *cacheKey;
  NSObject *v37;
  void *v38;
  const void **v39;
  void *specific;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  void *v44;
  const void **v45;
  void *v46;
  _BOOL4 v47;
  NSObject *v48;
  void *v49;
  const void **v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[3];
  _QWORD v79[3];
  uint64_t v80;
  void *v81;
  _BYTE location[12];
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v9)
  {
    NUAssertLogger_4602();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "inputImage != nil");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v38;
      _os_log_error_impl(&dword_1A6382000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", location, 0xCu);

    }
    v39 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v55 = dispatch_get_specific(*v39);
        v56 = (void *)MEMORY[0x1E0CB3978];
        v57 = v55;
        objc_msgSend(v56, "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v55;
        v83 = 2114;
        v84 = v59;
        _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", location, 0x16u);

      }
      goto LABEL_31;
    }
    if (!v42)
      goto LABEL_31;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138543362;
    *(_QWORD *)&location[4] = v54;
    _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", location, 0xCu);

    goto LABEL_31;
  }
  if (!v10)
  {
    NUAssertLogger_4602();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "strokes != nil");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v44;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", location, 0xCu);

    }
    v45 = (const void **)MEMORY[0x1E0D51D48];
    v46 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v41 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v47)
      {
        v60 = dispatch_get_specific(*v45);
        v61 = (void *)MEMORY[0x1E0CB3978];
        v62 = v60;
        objc_msgSend(v61, "callStackSymbols");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v60;
        v83 = 2114;
        v84 = v64;
        _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", location, 0x16u);

      }
      goto LABEL_31;
    }
    if (!v47)
      goto LABEL_31;
    goto LABEL_22;
  }
  v13 = v12;
  if (!v12)
  {
    NUAssertLogger_4602();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "cacheKey != nil");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v49;
      _os_log_error_impl(&dword_1A6382000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", location, 0xCu);

    }
    v50 = (const void **)MEMORY[0x1E0D51D48];
    v51 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4602();
    v41 = objc_claimAutoreleasedReturnValue();
    v52 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (!v51)
    {
      if (!v52)
        goto LABEL_31;
      goto LABEL_22;
    }
    if (v52)
    {
      v65 = dispatch_get_specific(*v50);
      v66 = (void *)MEMORY[0x1E0CB3978];
      v67 = v65;
      objc_msgSend(v66, "callStackSymbols");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v65;
      v83 = 2114;
      v84 = v69;
      _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", location, 0x16u);

    }
LABEL_31:

    _NUAssertFailHandler();
    __break(1u);
  }
  v70 = v11;
  v14 = objc_msgSend(v9, "size");
  v16 = v15;
  v80 = *MEMORY[0x1E0C9E160];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)location, self);
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __80__PIRetouchSourceNode_initWithInputImage_retouchStrokes_detectedFaces_cacheKey___block_invoke;
  v74[3] = &unk_1E5016090;
  objc_copyWeak(&v75, (id *)location);
  v18 = (void *)MEMORY[0x1A85C0174](v74);
  v19 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  objc_msgSend(v9, "format");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "CIFormat");
  objc_msgSend(v9, "colorSpace");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithImageProvider:width:height:format:colorSpace:options:", v18, v14, v16, v21, objc_msgSend(v22, "CGColorSpace"), v71);

  if (v70)
  {
    v78[0] = CFSTR("identifier");
    v78[1] = CFSTR("strokes");
    v79[0] = v13;
    v79[1] = v10;
    v78[2] = CFSTR("detectedFaces");
    v79[2] = v70;
    v24 = v78;
    v25 = v79;
    v26 = 3;
  }
  else
  {
    v76[0] = CFSTR("identifier");
    v76[1] = CFSTR("strokes");
    v77[0] = v13;
    v77[1] = v10;
    v24 = v76;
    v25 = v77;
    v26 = 2;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v73.receiver = self;
  v73.super_class = (Class)PIRetouchSourceNode;
  v28 = -[NUCISourceNode initWithImage:settings:orientation:](&v73, sel_initWithImage_settings_orientation_, v23, v27, 1);
  objc_msgSend(v9, "mutableImageCopy");
  v29 = objc_claimAutoreleasedReturnValue();
  retouchImage = v28->_retouchImage;
  v28->_retouchImage = (NUMutableBufferImage *)v29;

  renderedImage = v28->_renderedImage;
  v28->_renderedImage = 0;

  v32 = objc_msgSend(v10, "copy");
  strokes = v28->_strokes;
  v28->_strokes = (NSArray *)v32;

  v34 = objc_msgSend(v13, "copy");
  cacheKey = v28->_cacheKey;
  v28->_cacheKey = (NSString *)v34;

  objc_destroyWeak(&v75);
  objc_destroyWeak((id *)location);

  return v28;
}

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  void *v16;
  NUBufferImage *renderedImage;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  unint64_t v29;
  id v30;
  _QWORD v31[4];
  id v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint8_t *v37;
  uint8_t buf[8];
  unint64_t v39;
  _BYTE v40[20];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = a9;
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_224);
  v16 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    v26 = (void *)MEMORY[0x1E0CB3978];
    v27 = v16;
    objc_msgSend(v26, "currentThread");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)&buf[4] = a5;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = a6;
    HIWORD(v39) = 1024;
    *(_DWORD *)v40 = a7;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = a8;
    *(_WORD *)&v40[10] = 2048;
    *(_QWORD *)&v40[12] = v28;
    _os_log_debug_impl(&dword_1A6382000, v27, OS_LOG_TYPE_DEBUG, "provideImageData (%d,%d,%d,%d) tid=%p", buf, 0x24u);

  }
  -[PIRetouchSourceNode _performRetouchIfNeeded](self, "_performRetouchIfNeeded");
  renderedImage = self->_renderedImage;
  *(_QWORD *)buf = a5;
  v39 = a6;
  *(_QWORD *)v40 = a7;
  *(_QWORD *)&v40[8] = a8;
  objc_msgSend(MEMORY[0x1E0D52188], "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", renderedImage, buf, a3, a4);
  *(_QWORD *)buf = a5;
  v39 = a6;
  *(_QWORD *)v40 = a7;
  *(_QWORD *)&v40[8] = a8;
  objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", buf);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUBufferImage validRegion](self->_renderedImage, "validRegion");
  v29 = a5;
  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "regionByRemovingRegion:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc(MEMORY[0x1E0D521D0]);
  -[NUBufferImage format](self->_renderedImage, "format");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithSize:format:rowBytes:mutableBytes:", a7, a8, v23, a4, v19);

  *(_QWORD *)buf = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __75__PIRetouchSourceNode_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke;
  v31[3] = &unk_1E50160B8;
  v34 = a6;
  v35 = a7;
  v32 = v24;
  v33 = v29;
  v36 = a8;
  v37 = buf;
  v25 = v24;
  objc_msgSend(v21, "enumerateRects:", v31);

}

- (void)_performRetouchIfNeeded
{
  void *v3;
  void *v4;
  NUBufferImage *v5;
  NUBufferImage *renderedImage;
  NUMutableBufferImage *retouchImage;
  NSString *obj;

  if (!self->_renderedImage)
  {
    obj = self->_cacheKey;
    objc_sync_enter(obj);
    if (!self->_renderedImage)
    {
      -[PIRetouchSourceNode applyRetouchStrokes:toImage:](self, "applyRetouchStrokes:toImage:", self->_strokes, self->_retouchImage);
      objc_opt_class();
      +[PIRetouchSourceNode intermediateCacheForSubsample:](PIRetouchSourceNode, "intermediateCacheForSubsample:", objc_opt_isKindOfClass() & 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUMutableBufferImage purgeableImageCopy](self->_retouchImage, "purgeableImageCopy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v4, self->_cacheKey);

      -[NUMutableBufferImage immutableImageCopy](self->_retouchImage, "immutableImageCopy");
      v5 = (NUBufferImage *)objc_claimAutoreleasedReturnValue();
      renderedImage = self->_renderedImage;
      self->_renderedImage = v5;

      retouchImage = self->_retouchImage;
      self->_retouchImage = 0;

    }
    objc_sync_exit(obj);

  }
}

- (void)applyRetouchStrokes:(id)a3 toImage:(id)a4
{
  id v5;
  __objc2_class **v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  PIRetouchSourceNode *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *context;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v26 = self;
  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v30)
  {
    v31 = 0;
    v28 = *(_QWORD *)v35;
    v6 = off_1E5013000;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v9 = kdebug_trace();
        context = (void *)MEMORY[0x1A85BFFB8](v9);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("repairEdges"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sourceOffset"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("x"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("y"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v15 = v14;
        objc_msgSend(v13, "doubleValue");
        v17 = v16;
        -[__objc2_class brushStrokeFromRetouchStrokeDictionary:](v6[50], "brushStrokeFromRetouchStrokeDictionary:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mode"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = PIRetouchModeFromString(v19);

        if (v20 == 2)
        {
          if (!v31)
          {
            objc_msgSend(MEMORY[0x1E0C9DD90], "context");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[NURenderNode settings](v26, "settings", v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("detectedFaces"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
          +[PIRepairUtilities applyRepairMLStrokeToMutableBuffer:brushStroke:detectedFaces:context:error:](PIRepairUtilities, "applyRepairMLStrokeToMutableBuffer:brushStroke:detectedFaces:context:error:", v29, v18, v22, v31, &v33);

        }
        else
        {
          -[__objc2_class applyRepairStrokeToMutableBuffer:brushStroke:sourceOffset:repairEdges:](v6[50], "applyRepairStrokeToMutableBuffer:brushStroke:sourceOffset:repairEdges:", v29, v18, objc_msgSend(v10, "BOOLValue"), v15, v17);
        }

        objc_autoreleasePoolPop(context);
        kdebug_trace();
        v6 = off_1E5013000;
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v30);
  }
  else
  {
    v31 = 0;
  }

  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_224);
  v23 = (void *)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    v25 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 134217984;
    v39 = v25;
    _os_log_impl(&dword_1A6382000, v24, OS_LOG_TYPE_DEFAULT, "Recomputed retouch for %ld strokes", buf, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
  objc_storeStrong((id *)&self->_renderedImage, 0);
  objc_storeStrong((id *)&self->_retouchImage, 0);
}

uint64_t __75__PIRetouchSourceNode_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v3 = a2[1];
  v7 = *a2;
  v8 = v3;
  NUPixelRectOffset();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 72);
  v7 = 0u;
  v8 = 0u;
  return objc_msgSend(MEMORY[0x1E0D52188], "fillPixelsInBuffer:rect:srcPixel:", v4, &v7, v5);
}

void __80__PIRetouchSourceNode_initWithInputImage_retouchStrokes_detectedFaces_cacheKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "provideImageData:bytesPerRow:origin::size::userInfo:", a2, a3, a4, a5, a6, a7, 0);

}

+ (id)intermediateCacheForSubsample:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = a3;
  if (intermediateCacheForSubsample__onceToken != -1)
    dispatch_once(&intermediateCacheForSubsample__onceToken, &__block_literal_global_4679);
  v4 = &intermediateCacheForSubsample__s_retouchCache;
  if (v3)
    v4 = &intermediateCacheForSubsample__s_retouchCacheForSubsample;
  return (id)*v4;
}

uint64_t __53__PIRetouchSourceNode_intermediateCacheForSubsample___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)intermediateCacheForSubsample__s_retouchCache;
  intermediateCacheForSubsample__s_retouchCache = (uint64_t)v0;

  objc_msgSend((id)intermediateCacheForSubsample__s_retouchCache, "setCountLimit:", 5);
  v2 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v3 = (void *)intermediateCacheForSubsample__s_retouchCacheForSubsample;
  intermediateCacheForSubsample__s_retouchCacheForSubsample = (uint64_t)v2;

  return objc_msgSend((id)intermediateCacheForSubsample__s_retouchCacheForSubsample, "setCountLimit:", 5);
}

@end

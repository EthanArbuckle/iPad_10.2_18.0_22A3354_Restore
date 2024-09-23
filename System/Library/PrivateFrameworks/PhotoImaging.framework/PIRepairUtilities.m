@implementation PIRepairUtilities

+ (void)calcExtentsForStrokeRadius:(double)a3 offset:(id)a4 inputImageExtent:(id *)a5 maskExtent:(id *)a6 repairExtent:(id *)a7 textureExtent:(id *)a8 sourceExtent:(id *)a9
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12;
  $0AC6E346AE4835514AAA8AC86D8F4844 v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 v14;
  $0AC6E346AE4835514AAA8AC86D8F4844 *v15;
  $0AC6E346AE4835514AAA8AC86D8F4844 v16;
  $0AC6E346AE4835514AAA8AC86D8F4844 v17;
  $0AC6E346AE4835514AAA8AC86D8F4844 v18;
  $0AC6E346AE4835514AAA8AC86D8F4844 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  const void **v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  const void **v32;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  const void **v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  $0AC6E346AE4835514AAA8AC86D8F4844 v51;
  $0AC6E346AE4835514AAA8AC86D8F4844 v52;
  uint8_t buf[40];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a7)
  {
    NUAssertLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "repairExtent != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v42 = dispatch_get_specific(*v26);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v44;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
      goto LABEL_32;
    }
    if (!v29)
      goto LABEL_32;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v41;
    _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_32;
  }
  if (!a8)
  {
    NUAssertLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "textureExtent != nil");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v31;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = (const void **)MEMORY[0x1E0D51D48];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v34)
      {
        v45 = dispatch_get_specific(*v32);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v47;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
      goto LABEL_32;
    }
    if (!v34)
      goto LABEL_32;
    goto LABEL_23;
  }
  if (!a9)
  {
    NUAssertLogger();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sourceExtent != nil");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v36;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = (const void **)MEMORY[0x1E0D51D48];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (!v39)
        goto LABEL_32;
      goto LABEL_23;
    }
    if (v39)
    {
      v48 = dispatch_get_specific(*v37);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v50;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_32:

    _NUAssertFailHandler();
    __break(1u);
  }
  var1 = a6->var1;
  a7->var0 = a6->var0;
  a7->var1 = var1;
  NUPixelRectIntersection();
  v12 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16];
  a7->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf;
  a7->var1 = v12;
  NUPixelRectSetOrigin();
  v13 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16];
  a8->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf;
  a8->var1 = v13;
  NUPixelRectConstrainToRect();
  v14 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16];
  a8->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf;
  a8->var1 = v14;
  if ((NUPixelRectIsEmpty() & 1) != 0 || (NUPixelRectIsEmpty() & 1) != 0)
  {
    v15 = ($0AC6E346AE4835514AAA8AC86D8F4844 *)MEMORY[0x1E0D51ED0];
    v16 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)(MEMORY[0x1E0D51ED0] + 16);
    a8->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)*MEMORY[0x1E0D51ED0];
    a8->var1 = v16;
    v17 = v15[1];
    a7->var0 = *v15;
    a7->var1 = v17;
    v18 = *v15;
    v19 = v15[1];
  }
  else
  {
    v20 = NUMinX();
    v21 = NUMinX();
    v22 = NUMinY();
    v23 = NUMinY();
    memset(buf, 0, 32);
    NUPixelRectInset();
    NUPixelRectIntersection();
    NUMinX();
    NUMinY();
    NUWidth();
    NUHeight();
    NUPixelRectIntersection();
    v51.var0 = NUMinX() + v20 - v21;
    v51.var1 = NUMinY() + v22 - v23;
    v52.var0 = NUWidth();
    v52.var1 = NUHeight();
    a8->var0 = v51;
    a8->var1 = v52;
    v18 = ($0AC6E346AE4835514AAA8AC86D8F4844)0;
    v19 = ($0AC6E346AE4835514AAA8AC86D8F4844)0;
  }
  a9->var0 = v18;
  a9->var1 = v19;
}

+ (id)brushStrokeFromRetouchStrokeDictionary:(id)a3
{
  void *v3;
  id v4;
  int v5;
  int v6;
  int v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  _DWORD *v22;
  id v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[4];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("radius"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("softness"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("clipRect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NUPixelRectFromArray();

  v4 = objc_alloc(MEMORY[0x1E0D521C8]);
  objc_msgSend(v28, "floatValue");
  v6 = v5;
  objc_msgSend(v29, "floatValue");
  LODWORD(v8) = v7;
  memset(v38, 0, sizeof(v38));
  v30 = (void *)objc_msgSend(v4, "initWithRadius:softness:opacity:clipRect:pressureMode:", v38, 0, COERCE_DOUBLE((unint64_t)v6), v8, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("points"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v27, "count");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 12 * v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("points"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      v32 = v11;
      v14 = 12 * v11;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("x"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("y"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "floatValue");
        v21 = v20;

        v22 = (_DWORD *)(objc_msgSend(objc_retainAutorelease(v9), "mutableBytes") + v14);
        *v22 = v18;
        v22[1] = v21;
        v22[2] = 1065353216;
        ++v13;
        v14 += 12;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      v11 = v32 + v13;
    }
    while (v10);
  }

  v23 = objc_retainAutorelease(v9);
  objc_msgSend(v30, "appendPoints:pointCount:", objc_msgSend(v23, "mutableBytes"), v26);
  v24 = (void *)objc_msgSend(v30, "copy");

  return v24;
}

+ (id)extractRGBAfPixelsFromImage:(id)a3 fromROI:(id *)a4
{
  _QWORD *v4;
  id v6;
  id v7;
  int64_t var0;
  int64_t var1;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  $0AC6E346AE4835514AAA8AC86D8F4844 v17;
  void *v18;
  void *v19;
  $0AC6E346AE4835514AAA8AC86D8F4844 v20;
  $0AC6E346AE4835514AAA8AC86D8F4844 v21;
  id *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const void **v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  void *v46;
  vImage_Buffer dest;
  $0AC6E346AE4835514AAA8AC86D8F4844 v48;
  $0AC6E346AE4835514AAA8AC86D8F4844 v49;
  $0AC6E346AE4835514AAA8AC86D8F4844 v50;
  $0AC6E346AE4835514AAA8AC86D8F4844 v51;
  _OWORD v52[2];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  vImage_Buffer src;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0D521E0]);
  var0 = a4->var1.var0;
  var1 = a4->var1.var1;
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAf");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithSize:format:", var0, var1, v10);

  v12 = objc_alloc(MEMORY[0x1E0D521E0]);
  v13 = a4->var1.var0;
  v14 = a4->var1.var1;
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithSize:format:", v13, v14, v15);

  v17 = a4->var1;
  v52[0] = a4->var0;
  v52[1] = v17;
  objc_msgSend(MEMORY[0x1E0D52188], "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", v6, v52, objc_msgSend(v16, "mutableBytes"), objc_msgSend(v16, "rowBytes"));
  objc_msgSend(v6, "format");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v18, "isEqualToPixelFormat:", v19);

  if (!(_DWORD)v14)
  {
    v4 = (_QWORD *)MEMORY[0x1E0D52390];
    if (*MEMORY[0x1E0D52390] == -1)
      goto LABEL_5;
    goto LABEL_26;
  }
  src.data = (void *)objc_msgSend(v16, "mutableBytes");
  v20 = a4->var1;
  v50 = a4->var0;
  v51 = v20;
  src.height = NUHeight();
  v21 = a4->var1;
  v48 = a4->var0;
  v49 = v21;
  src.width = 4 * NUWidth();
  src.rowBytes = objc_msgSend(v16, "rowBytes");
  dest.height = src.height;
  dest.width = src.width;
  dest.data = (void *)objc_msgSend(v11, "mutableBytes");
  dest.rowBytes = objc_msgSend(v11, "rowBytes");
  if (vImageConvert_Planar16FtoPlanarF(&src, &dest, 0))
  {
    NUAssertLogger();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad half float to float conversion"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v37;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v38 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v44 = dispatch_get_specific(*v38);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v44;
        v55 = 2114;
        v56 = v46;
        _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v43;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    while (1)
    {
      __break(1u);
LABEL_26:
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21110);
LABEL_5:
      v23 = (id *)MEMORY[0x1E0D52380];
      v24 = (id)*MEMORY[0x1E0D52380];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "format");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("PIRepair expects the incoming image to be RGBAh, not %@"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(src.data) = 138543362;
        *(void **)((char *)&src.data + 4) = v28;
        _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

      }
      v29 = (const void **)MEMORY[0x1E0D51D48];
      if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (*v4 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21110);
        v30 = *v23;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v33 = dispatch_get_specific(*v29);
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(src.data) = 138543618;
          *(void **)((char *)&src.data + 4) = v33;
          WORD2(src.height) = 2114;
          *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v35;
          _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

        }
      }
      else
      {
        if (*v4 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21110);
        v30 = *v23;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(src.data) = 138543362;
          *(void **)((char *)&src.data + 4) = v32;
          _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

        }
      }

      objc_msgSend(v6, "format");
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
      objc_claimAutoreleasedReturnValue();
      _NUAssertFailHandler();
    }
  }

  return v11;
}

+ (id)prepareForCIFilterWithFaces:(id)a3 cropRect:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  void *v17;
  void *v18;
  id v19;
  __int128 *v21;
  __int128 *v22;
  void *v23;
  _OWORD v24[5];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;

  v5 = a3;
  v6 = v5;
  if (v5 && (v7 = objc_msgSend(v5, "count")) != 0)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v8 = 0;
    v21 = v24;
    v22 = &v30;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8, v21, v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("x"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("y"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v12, "intValue");

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("w"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v13, "intValue");

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("h"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");

      v29 = 0u;
      v30 = 0u;
      v25 = v11;
      v26 = (int)v10;
      v27 = (int)v12;
      v28 = v15;
      var1 = a4->var1;
      v24[3] = a4->var0;
      v24[4] = var1;
      NUPixelRectIntersection();
      v24[1] = v29;
      v24[2] = v30;
      if ((NUPixelRectIsEmpty() & 1) == 0)
      {
        *v21 = *v22;
        NUPixelRectToCGRect();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v17);

      }
      ++v8;
    }
    while (v7 != v8);
    if (objc_msgSend(v23, "count"))
    {
      v18 = v23;
      v19 = v23;
    }
    else
    {
      v19 = 0;
      v18 = v23;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)applyRepairMLStrokeToMutableBuffer:(id)a3 brushStroke:(id)a4 detectedFaces:(id)a5 context:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGFloat a;
  CGFloat b;
  CGFloat c;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  CGFloat d;
  _OWORD v82[2];
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  CGAffineTransform v114;
  CGAffineTransform v115;
  CGAffineTransform v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v73 = a6;
  v74 = v11;
  v67 = v13;
  v68 = v12;
  objc_msgSend(v11, "format");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(MEMORY[0x1E0D52168], "newCIImageFromBufferImage:", v11);
  v79 = v14;
  objc_msgSend(v12, "ciImageTiled:closed:pressureMode:alwaysUseCG:", 0, 1, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = 0u;
  v152 = 0u;
  v77 = v15;
  if (v12)
    objc_msgSend(v12, "clipRect");
  v149 = 0u;
  v150 = 0u;
  objc_msgSend(v14, "extent");
  NUPixelRectFromCGRect();
  v147 = 0u;
  v148 = 0u;
  objc_msgSend(v15, "extent");
  NUPixelRectFromCGRect();
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  NUPixelRectIntersection();
  v16 = vcvtd_n_s64_f64((double)NUPixelSizeLargestDimension(), 2uLL);
  v17 = 768;
  if ((unint64_t)v16 > 0x300)
    v17 = v16;
  if ((unint64_t)v16 <= 0x200)
    v17 = 512;
  if (v16 <= 256)
    v18 = 256;
  else
    v18 = v17;
  if (v18 >= 0)
    v19 = v18;
  else
    v19 = v18 + 1;
  if (v18 >= 0)
    v20 = v18;
  else
    v20 = v18 + 1;
  v139 = v151;
  v140 = v152;
  v21 = -(v19 >> 1);
  v22 = -(v20 >> 1);
  if (NUPixelRectIsEmpty())
  {
    v151 = v149;
    v152 = v150;
  }
  v135 = v21;
  v136 = -(v20 >> 1);
  v137 = v18;
  v138 = v18;
  v23 = NUWidth();
  v133 = v151;
  v134 = v152;
  if (v23 <= NUWidth())
    v24 = v18;
  else
    v24 = v152;
  v129 = v21;
  v130 = v22;
  v131 = v24;
  v132 = v18;
  v25 = NUHeight();
  v127 = v151;
  v128 = v152;
  v26 = NUHeight();
  v27 = *((_QWORD *)&v152 + 1);
  if (v25 <= v26)
    v27 = v18;
  v123 = v21;
  v124 = v22;
  v125 = v24;
  v126 = v27;
  v121 = v151;
  v122 = v152;
  NUPixelRectConstrainToRect();
  a = v116.a;
  b = v116.b;
  c = v116.c;
  v117 = v116.a;
  v118 = v116.b;
  v119 = v116.c;
  d = v116.d;
  v120 = v116.d;
  NUPixelRectToCGRect();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend(v79, "imageByCroppingToRect:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v77, "imageByCroppingToRect:", v32, v34, v36, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "extent");
  v42 = v41;
  objc_msgSend(v39, "extent");
  memset(&v116, 0, sizeof(v116));
  CGAffineTransformMakeTranslation(&v116, -v42, -v43);
  v115 = v116;
  objc_msgSend(v39, "imageByApplyingTransform:", &v115);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = v116;
  objc_msgSend(v40, "imageByApplyingTransform:", &v114);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = v145;
  v111 = v146;
  v78 = v45;
  v80 = v44;
  NUPixelRectOffset();
  v145 = v112;
  v146 = v113;
  v46 = (void *)MEMORY[0x1E0C9DDC8];
  objc_msgSend(MEMORY[0x1E0C9DD80], "whiteColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "imageWithColor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "extent");
  objc_msgSend(v48, "imageByCroppingToRect:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "imageByApplyingFilter:", CFSTR("CIColorInvert"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "imageByCompositingOverImage:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  *(CGFloat *)v109 = a;
  *(CGFloat *)&v109[1] = b;
  *(CGFloat *)&v109[2] = c;
  *(CGFloat *)&v109[3] = d;
  objc_msgSend(a1, "prepareForCIFilterWithFaces:cropRect:", v13, v109);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIInpaintingFilter"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setValue:forKey:", v44, CFSTR("inputImage"));
  objc_msgSend(v50, "setValue:forKey:", v71, CFSTR("inputMaskImage"));
  v51 = (void *)MEMORY[0x1E0C9DDF8];
  v107 = v145;
  v108 = v146;
  NUPixelRectToCGRect();
  objc_msgSend(v51, "vectorWithCGRect:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setValue:forKey:", v52, CFSTR("inputMaskBoundingBox"));

  if (v75)
    objc_msgSend(v50, "setValue:forKey:", v75, CFSTR("inputFaceBoundingBoxes"));
  objc_msgSend(v50, "outputImage");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = a;
  v104 = b;
  v105 = c;
  v106 = d;
  v53 = objc_msgSend(v76, "alignedRowBytesForWidth:", NUWidth());
  v99 = a;
  v100 = b;
  v101 = c;
  v102 = d;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", NUHeight() * v53);
  v66 = (id)objc_claimAutoreleasedReturnValue();
  v54 = objc_alloc(MEMORY[0x1E0C9DDE8]);
  v55 = objc_retainAutorelease(v66);
  v56 = objc_msgSend(v55, "mutableBytes");
  v95 = a;
  v96 = b;
  v97 = c;
  v98 = d;
  v57 = NUWidth();
  v91 = a;
  v92 = b;
  v93 = c;
  v94 = d;
  v58 = (void *)objc_msgSend(v54, "initWithBitmapData:width:height:bytesPerRow:format:", v56, v57, NUHeight(), v53, objc_msgSend(v76, "CIFormat"));
  objc_msgSend(v74, "colorSpace");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setColorSpace:", objc_msgSend(v59, "CGColorSpace"));

  objc_msgSend(v58, "setLabel:", CFSTR("PIRepair-applyRepairMLStrokeToMutableBuffer"));
  objc_msgSend(v73, "startTaskToRender:toDestination:error:", v69, v58, a7);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (id)objc_msgSend(v60, "nu_waitUntilCompletedAndReturnError:", a7);

  v112 = 0u;
  v113 = 0u;
  v87 = a;
  v88 = b;
  v89 = c;
  v90 = d;
  v83 = 0;
  v84 = 0;
  v85 = objc_msgSend(v74, "size");
  v86 = v62;
  NUPixelRectFlipYOrigin();
  v63 = (void *)MEMORY[0x1E0D52188];
  v82[0] = v112;
  v82[1] = v113;
  v64 = objc_retainAutorelease(v55);
  objc_msgSend(v63, "copyPixelsToImage:rect:srcPtr:srcPtrRowBytes:", v74, v82, objc_msgSend(v64, "mutableBytes"), v53);

  return 1;
}

+ (void)applyRepairStrokeToMutableBuffer:(id)a3 brushStroke:(id)a4 sourceOffset:(CGPoint)a5 repairEdges:(BOOL)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  __int128 v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD *v55;
  uint64_t v56;
  uint64_t v57;
  _DWORD *v58;
  uint64_t i;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  vImagePixelCount width;
  size_t rowBytes;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  int *v68;
  vImagePixelCount v69;
  uint64_t j;
  int v71;
  unint64_t v72;
  uint64_t v73;
  unsigned int v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  float v82;
  float32x4_t v83;
  BOOL v84;
  id v85;
  __int128 v86;
  void *v87;
  void *v88;
  unint64_t v89;
  uint64_t v90;
  unsigned int v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  float v99;
  float32x4_t v100;
  unint64_t v101;
  uint64_t v102;
  unsigned int v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  float v110;
  float v111;
  float32x4_t v112;
  NSObject *v113;
  void *v114;
  const void **v115;
  void *v116;
  NSObject *v117;
  _BOOL4 v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  const void **v123;
  void *specific;
  NSObject *v125;
  _BOOL4 v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  uint64_t v136;
  int v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _QWORD v142[2];
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  char v154[32];
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  __int128 v159;
  __int128 v160;
  char v161[32];
  _OWORD v162[2];
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _OWORD v177[2];
  _QWORD v178[4];
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  void (**v211)(CMemEnv *__hidden);
  int v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _QWORD v217[2];
  uint64_t v218;
  uint64_t v219;
  __int128 v220;
  unint64_t v221;
  unint64_t v222;
  uint64_t v223;
  __int16 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  _QWORD v229[2];
  uint64_t v230;
  uint64_t v231;
  __int128 v232;
  unint64_t v233;
  unint64_t v234;
  uint64_t v235;
  __int16 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  _QWORD v241[2];
  uint64_t v242;
  uint64_t v243;
  __int128 v244;
  unint64_t v245;
  unint64_t v246;
  uint64_t v247;
  __int16 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  _QWORD v253[2];
  uint64_t v254;
  uint64_t v255;
  __int128 v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  __int16 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  _QWORD v267[7];
  uint64_t v268;
  char v269;
  _QWORD v270[7];
  uint64_t v271;
  char v272;
  void (***v273)(CMemEnv *__hidden);
  float v274;
  int v275;
  int v276;
  __int16 v277;
  int v278;
  __int16 v279;
  vImage_Buffer dest;
  uint64_t v281;
  unint64_t v282;
  unint64_t v283;
  char v284;
  vImage_Buffer src;
  uint64_t v286;
  char v287;
  __int16 v288;
  char v289;
  uint64_t v290;
  _BYTE buf[12];
  __int16 v292;
  _BYTE v293[10];
  uint64_t v294;
  char v295;
  uint64_t v296;

  v296 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "size");
  v13 = v12;
  v193 = 0u;
  v194 = 0u;
  if (v10)
  {
    objc_msgSend(v10, "extent");
  }
  else
  {
    v191 = 0uLL;
    v192 = 0uLL;
  }
  v188 = 0;
  v187 = 0;
  v189 = v11;
  v190 = v13;
  NUPixelRectIntersection();
  v185 = v193;
  v186 = v194;
  if ((NUPixelRectIsEmpty() & 1) == 0)
  {
    objc_msgSend(v10, "radius");
    v15 = v14;
    v16 = NUPixelPointFromCGPoint();
    v178[1] = 0;
    v178[0] = 0;
    v178[2] = v11;
    v178[3] = v13;
    v177[0] = v193;
    v177[1] = v194;
    +[PIRepairUtilities calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:](PIRepairUtilities, "calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:", v16, v17, v178, v177, &v183, &v181, v15, &v179);
    v175 = v183;
    v176 = v184;
    if ((NUPixelRectIsEmpty() & 1) == 0)
    {
      v173 = v181;
      v174 = v182;
      if ((NUPixelRectIsEmpty() & 1) == 0)
      {
        v171 = v179;
        v172 = v180;
        if ((NUPixelRectIsEmpty() & 1) == 0)
        {
          v169 = 0u;
          v170 = 0u;
          v167 = v183;
          v168 = v184;
          v163 = 0;
          v164 = 0;
          v165 = v11;
          v166 = v13;
          NUPixelRectFlipYOrigin();
          memset(v162, 0, sizeof(v162));
          objc_msgSend(a1, "extractRGBAfPixelsFromImage:fromROI:", v9, v162);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = v179;
          v160 = v180;
          v155 = 0;
          v156 = 0;
          v157 = v11;
          v158 = v13;
          NUPixelRectFlipYOrigin();
          objc_msgSend(a1, "extractRGBAfPixelsFromImage:fromROI:", v9, v161);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = v181;
          v153 = v182;
          v148 = 0;
          v149 = 0;
          v150 = v11;
          v151 = v13;
          NUPixelRectFlipYOrigin();
          objc_msgSend(a1, "extractRGBAfPixelsFromImage:fromROI:", v9, v154);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_alloc(MEMORY[0x1E0D521E0]);
          v19 = v194;
          objc_msgSend(MEMORY[0x1E0D52220], "R8");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = (void *)objc_msgSend(v18, "initWithSize:format:", v19, v20);

          objc_msgSend(MEMORY[0x1E0D52000], "rasterizeBrushStroke:atPoint:toBuffer:", v10, v193, v140);
          v21 = objc_msgSend(v138, "bytes");
          v22 = objc_msgSend(v138, "rowBytes");
          v23 = objc_msgSend(v139, "bytes");
          v24 = objc_msgSend(v139, "rowBytes");
          v136 = objc_msgSend(v140, "bytes");
          v135 = objc_msgSend(v140, "rowBytes");
          v25 = objc_msgSend(v141, "mutableBytes");
          v26 = objc_msgSend(v141, "rowBytes");
          v266 = v184;
          v265 = v183;
          v264 = v180;
          v263 = v179;
          v262 = v184;
          v261 = v183;
          NUPixelRectIntersection();
          if ((NUPixelRectEqualToRect() & 1) != 0)
          {
            v251 = v179;
            v252 = v180;
            v27 = NUWidth();
            v249 = v179;
            v250 = v180;
            v28 = NUHeight();
            v254 = v21;
            v255 = v22;
            v256 = xmmword_1A64DDF20;
            v257 = v27;
            v258 = v28;
            v259 = 1;
            v260 = 1;
            v253[1] = 0;
            v253[0] = off_1E5014798;
            v239 = v181;
            v240 = v182;
            v29 = NUWidth();
            v237 = v181;
            v238 = v182;
            v30 = NUHeight();
            v242 = v23;
            v243 = v24;
            v244 = xmmword_1A64DDF20;
            v245 = v29;
            v246 = v30;
            v247 = 1;
            v248 = 1;
            v241[1] = 0;
            v241[0] = off_1E5014798;
            v227 = v183;
            v228 = v184;
            v31 = NUWidth();
            v225 = v183;
            v226 = v184;
            v32 = NUHeight();
            v230 = v25;
            v231 = v26;
            v232 = xmmword_1A64DDF20;
            v233 = v31;
            v234 = v32;
            v235 = 1;
            v236 = 1;
            v229[1] = 0;
            v229[0] = off_1E5014798;
            v215 = v193;
            v216 = v194;
            v33 = NUWidth();
            v213 = v193;
            v214 = v194;
            v34 = NUHeight();
            v218 = v136;
            v219 = v135;
            v220 = xmmword_1A64DDF30;
            v221 = v33;
            v222 = v34;
            v223 = 1;
            v224 = 1;
            v217[1] = 0;
            v217[0] = off_1E50147D8;
            v211 = off_1E5014960;
            v212 = 0;
            v209 = v183;
            v210 = v184;
            v35 = NUMinX();
            v207 = v179;
            v208 = v180;
            v36 = NUMinX();
            v205 = v179;
            v206 = v180;
            v137 = NUMaxY();
            v203 = v183;
            v204 = v184;
            v37 = NUMaxY();
            v201 = v179;
            v202 = v180;
            v38 = NUMaxX();
            v199 = v183;
            v200 = v184;
            v39 = NUMaxX();
            v197 = v183;
            v198 = v184;
            v40 = NUMinY();
            v195 = v179;
            v196 = v180;
            v41 = NUMinY();
            v42 = v35 - v36;
            v43 = v38 - v39;
            if (v42 <= v43)
              v44 = v43;
            else
              v44 = v42;
            CGrNavigator::CGrNavigator((CGrNavigator *)&dest, (CMemEnv *)&v211, v221, v222, 16);
            dest.data = off_1E5014798;
            if (v284)
            {
              CGrNavigator::CGrNavigator((CGrNavigator *)buf, (CMemEnv *)&v211, v221, v222, 16);
              *(_QWORD *)buf = off_1E5014798;
              if (v295)
              {
                LODWORD(v45) = v42;
                v46 = v137 - v37;
                DWORD1(v45) = v137 - v37;
                DWORD2(v45) = v43;
                HIDWORD(v45) = v40 - v41;
                *(_OWORD *)&src.height = v45;
                src.data = &v211;
                src.rowBytes = 0x3CA3D70A00000000;
                v286 = 0x3F00000000000001;
                v287 = 0;
                v289 = 0;
                v288 = 0;
                bzero(&v290, 0x304uLL);
                if (v44 != 1 && (v47 = 2 * v44, v245 == v221 + v47) && v246 == v222 + v47)
                {
                  v275 = 1056964608;
                  v276 = 1065353216;
                  v277 = -1;
                  v278 = 0;
                  v279 = 0;
                  v273 = &v211;
                  v274 = (float)v44;
                  CGrNavigator::CGrNavigator((CGrNavigator *)v270, (CMemEnv *)&v211, v245, v246, 4);
                  v270[0] = off_1E50147B8;
                  if (v272)
                  {
                    CGrNavigator::CGrNavigator((CGrNavigator *)v267, (CMemEnv *)&v211, v282, v283, 4);
                    v267[0] = off_1E50147B8;
                    if (v269)
                    {
                      v48 = 0;
                      while (1)
                      {
                        v49 = v271;
                        if (v271)
                        {
                          v50 = 0;
                          v51 = v270[6];
                          v52 = v242;
                          v53 = v243;
                          v54 = v244;
                          v55 = (_DWORD *)v270[2];
                          v56 = v270[3];
                          do
                          {
                            v57 = v52;
                            v58 = v55;
                            for (i = v51; i; --i)
                            {
                              *v58++ = *(_DWORD *)(v57 + 4 * v48);
                              v57 += v54;
                            }
                            ++v50;
                            v55 = (_DWORD *)((char *)v55 + v56);
                            v52 += v53;
                          }
                          while (v50 != v49);
                        }
                        if (CMedian::Median((uint64_t)&v273))
                          break;
                        v60 = v268;
                        if (v268)
                        {
                          v61 = 0;
                          v62 = v267[6];
                          width = dest.width;
                          rowBytes = dest.rowBytes;
                          v65 = v281;
                          v66 = (int *)v267[2];
                          v67 = v267[3];
                          do
                          {
                            v68 = v66;
                            v69 = width;
                            for (j = v62; j; --j)
                            {
                              v71 = *v68++;
                              *(_DWORD *)(v69 + 4 * v48) = v71;
                              v69 += v65;
                            }
                            ++v61;
                            width += rowBytes;
                            v66 = (int *)((char *)v66 + v67);
                          }
                          while (v61 != v60);
                        }
                        if (++v48 == 4)
                        {
                          CGrNavigator::~CGrNavigator((CGrNavigator *)v267);
                          CGrNavigator::~CGrNavigator((CGrNavigator *)v270);
                          goto LABEL_34;
                        }
                      }
                    }
                    CGrNavigator::~CGrNavigator((CGrNavigator *)v267);
                  }
                  CGrNavigator::~CGrNavigator((CGrNavigator *)v270);
                }
                else if (!CInwardBlur::InwardBlur((uint64_t)&src))
                {
LABEL_34:
                  HIBYTE(v288) = a6;
                  if (!CInwardBlur::InwardBlur((uint64_t)&src))
                  {
                    switch((_QWORD)v220)
                    {
                      case 4:
                        v101 = v234;
                        if (v234)
                        {
                          v102 = 0;
                          v103 = 0;
                          v104 = v233;
                          do
                          {
                            if (v104)
                            {
                              v105 = 0;
                              v106 = v103 + v46;
                              v107 = 1;
                              do
                              {
                                v108 = v255 * v106;
                                v109 = v254 + 16 * (v42 + v107 - 1);
                                v110 = *(float *)(v218 + 4 * v105 + v219 * v102);
                                if (v110 <= 0.02)
                                {
                                  v112 = *(float32x4_t *)(v108 + v109);
                                }
                                else
                                {
                                  v111 = (float)(v110 * 2.0388) + -0.040776;
                                  if (v110 >= 0.51049)
                                    v111 = 1.0;
                                  v112 = vmlaq_n_f32(*(float32x4_t *)(v109 + v108), vaddq_f32(vsubq_f32(*(float32x4_t *)(16 * (v42 + v107 - 1) + v242 + v243 * v106), vaddq_f32(*(float32x4_t *)(v109 + v108), *(float32x4_t *)(16 * v105 + dest.width + dest.rowBytes * v102))), *(float32x4_t *)(16 * v105 + *(_QWORD *)&v293[2] + v294 * v102)), v111);
                                }
                                *(float32x4_t *)(v231 * v102 + v230 + 16 * v105) = v112;
                                v105 = v107;
                                v104 = v233;
                                v84 = v233 > v107++;
                              }
                              while (v84);
                              v101 = v234;
                            }
                            v102 = ++v103;
                          }
                          while (v101 > v103);
                        }
                        break;
                      case 2:
                        v89 = v234;
                        if (v234)
                        {
                          v90 = 0;
                          v91 = 0;
                          v92 = v233;
                          do
                          {
                            if (v92)
                            {
                              v93 = 0;
                              v94 = v91 + v46;
                              v95 = 1;
                              do
                              {
                                v96 = v255 * v94;
                                v97 = v254 + 16 * (v42 + v95 - 1);
                                v98 = *(unsigned __int16 *)(v218 + 2 * v93 + v219 * v90);
                                if (v98 <= 0x51E)
                                {
                                  v100 = *(float32x4_t *)(v96 + v97);
                                }
                                else
                                {
                                  if (v98 >= 0x82AE)
                                    v99 = 1.0;
                                  else
                                    v99 = (float)((133613 * v98 - 175033030) >> 16) * 0.000015259;
                                  v100 = vmlaq_n_f32(*(float32x4_t *)(v97 + v96), vaddq_f32(vsubq_f32(*(float32x4_t *)(16 * (v42 + v95 - 1) + v242 + v243 * v94), vaddq_f32(*(float32x4_t *)(v97 + v96), *(float32x4_t *)(16 * v93 + dest.width + dest.rowBytes * v90))), *(float32x4_t *)(16 * v93 + *(_QWORD *)&v293[2] + v294 * v90)), v99);
                                }
                                *(float32x4_t *)(v231 * v90 + v230 + 16 * v93) = v100;
                                v93 = v95;
                                v92 = v233;
                                v84 = v233 > v95++;
                              }
                              while (v84);
                              v89 = v234;
                            }
                            v90 = ++v91;
                          }
                          while (v89 > v91);
                        }
                        break;
                      case 1:
                        v72 = v234;
                        if (v234)
                        {
                          v73 = 0;
                          v74 = 0;
                          v75 = v233;
                          do
                          {
                            if (v75)
                            {
                              v76 = 0;
                              v77 = v74 + v46;
                              v78 = 1;
                              do
                              {
                                v79 = v255 * v77;
                                v80 = v254 + 16 * (v42 + v78 - 1);
                                v81 = *(unsigned __int8 *)(v76 + v218 + v219 * v73);
                                if (v81 <= 5)
                                {
                                  v83 = *(float32x4_t *)(v79 + v80);
                                }
                                else
                                {
                                  if (v81 >= 0x82)
                                    v82 = 1.0;
                                  else
                                    v82 = (float)(523 * v81 - 2615) * 0.000015259;
                                  v83 = vmlaq_n_f32(*(float32x4_t *)(v80 + v79), vaddq_f32(vsubq_f32(*(float32x4_t *)(16 * (v42 + v78 - 1) + v242 + v243 * v77), vaddq_f32(*(float32x4_t *)(v80 + v79), *(float32x4_t *)(16 * v76 + dest.width + dest.rowBytes * v73))), *(float32x4_t *)(16 * v76 + *(_QWORD *)&v293[2] + v294 * v73)), v82);
                                }
                                *(float32x4_t *)(v231 * v73 + v230 + 16 * v76) = v83;
                                v76 = v78;
                                v75 = v233;
                                v84 = v233 > v78++;
                              }
                              while (v84);
                              v72 = v234;
                            }
                            v73 = ++v74;
                          }
                          while (v72 > v74);
                        }
                        break;
                    }
                  }
                }
              }
              CGrNavigator::~CGrNavigator((CGrNavigator *)buf);
            }
            CGrNavigator::~CGrNavigator((CGrNavigator *)&dest);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v217);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v229);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v241);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v253);

            v85 = objc_alloc(MEMORY[0x1E0D521E0]);
            v86 = v184;
            objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = (void *)objc_msgSend(v85, "initWithSize:format:", v86, v87);

            src.data = (void *)objc_msgSend(v141, "mutableBytes");
            v146 = v183;
            v147 = v184;
            src.height = NUHeight();
            v144 = v183;
            v145 = v184;
            src.width = 4 * NUWidth();
            src.rowBytes = objc_msgSend(v141, "rowBytes");
            dest = src;
            dest.data = (void *)objc_msgSend(v88, "mutableBytes");
            dest.rowBytes = objc_msgSend(v88, "rowBytes");
            if (!vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0))
            {
              v142[0] = 0;
              v142[1] = 0;
              v143 = v170;
              objc_msgSend(MEMORY[0x1E0D52188], "copyPixelsToImage:atPoint:fromBuffer:inRect:", v9, v169, v88, v142);

              goto LABEL_57;
            }
            NUAssertLogger();
            v121 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad fixed float to half float conversion"));
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v122;
              _os_log_error_impl(&dword_1A6382000, v121, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

            }
            v123 = (const void **)MEMORY[0x1E0D51D48];
            specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
            NUAssertLogger();
            v125 = objc_claimAutoreleasedReturnValue();
            v126 = os_log_type_enabled(v125, OS_LOG_TYPE_ERROR);
            if (specific)
            {
              if (v126)
              {
                v132 = dispatch_get_specific(*v123);
                objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "componentsJoinedByString:", CFSTR("\n"));
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v132;
                v292 = 2114;
                *(_QWORD *)v293 = v134;
                _os_log_error_impl(&dword_1A6382000, v125, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

              }
            }
            else if (v126)
            {
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "componentsJoinedByString:", CFSTR("\n"));
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v128;
              _os_log_error_impl(&dword_1A6382000, v125, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

            }
            _NUAssertFailHandler();
          }
          else
          {
            NUAssertLogger();
            v113 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("repairBounds not fully contained in srcBounds in repairWithReef"));
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(src.data) = 138543362;
              *(void **)((char *)&src.data + 4) = v114;
              _os_log_error_impl(&dword_1A6382000, v113, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);

            }
            v115 = (const void **)MEMORY[0x1E0D51D48];
            v116 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
            NUAssertLogger();
            v117 = objc_claimAutoreleasedReturnValue();
            v118 = os_log_type_enabled(v117, OS_LOG_TYPE_ERROR);
            if (v116)
            {
              if (v118)
              {
                v129 = dispatch_get_specific(*v115);
                objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v130, "componentsJoinedByString:", CFSTR("\n"));
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(src.data) = 138543618;
                *(void **)((char *)&src.data + 4) = v129;
                WORD2(src.height) = 2114;
                *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v131;
                _os_log_error_impl(&dword_1A6382000, v117, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);

              }
            }
            else if (v118)
            {
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "componentsJoinedByString:", CFSTR("\n"));
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(src.data) = 138543362;
              *(void **)((char *)&src.data + 4) = v120;
              _os_log_error_impl(&dword_1A6382000, v117, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);

            }
            _NUAssertFailHandler();
          }
          __break(1u);
        }
      }
    }
  }
LABEL_57:

}

+ (CGImage)newWatchInfillFromImage:(CGImage *)a3 mask:(CGImage *)a4
{
  float32x2_t v4;
  CGImage *v5;
  unint64_t Width;
  size_t Height;
  size_t v10;
  void *v11;
  CGColorSpace *v12;
  uint64_t v13;
  CGContext *v14;
  unsigned __int8 *v15;
  CGColorSpace *v16;
  CGContext *v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void **v26;
  int v27;
  uint64_t v28;
  _QWORD *v29;
  void **v30;
  _QWORD *v31;
  char *v32;
  float64x2_t v33;
  __double2 v34;
  int32x2_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _WORD *v41;
  char *v42;
  char *v43;
  _WORD *v44;
  int v45;
  int i;
  float64x2_t v47;
  __double2 v48;
  int32x2_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _WORD *v55;
  char *v56;
  char *v57;
  _WORD *v58;
  int v59;
  float *v60;
  _BYTE *v61;
  _BYTE *v62;
  char *v63;
  float *v64;
  float *v65;
  int v66;
  int j;
  int v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  float *v78;
  float *v79;
  int v80;
  int v81;
  int v82;
  unint64_t v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  size_t v87;
  unint64_t v88;
  size_t v89;
  void *v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  char v95;
  char *v96;
  char *v97;
  _DWORD *v98;
  unsigned __int8 *v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  char *v103;
  char *v104;
  _BYTE *v105;
  int v106;
  unsigned __int8 *v107;
  __int128 v108;
  int32x2_t v109;
  int k;
  int m;
  _WORD *v112;
  _WORD *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  _WORD *v119;
  char *v120;
  char *v121;
  _WORD *v122;
  int v123;
  int32x2_t v124;
  int32x2_t v125;
  int32x2_t v126;
  int32x2_t v127;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v128;
  uint64_t v129;
  __int16 *v130;
  int32x2_t v131;
  uint64_t v132;
  __int16 v133;
  _QWORD *v134;
  int32x2_t v135;
  int32x2_t v136;
  int32x2_t v137;
  __int128 v138;
  __int16 *v139;
  __int16 *v140;
  int32x2_t v141;
  int32x2_t v142;
  int32x2_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int32x2_t v147;
  __int16 v148;
  float v149;
  _BOOL4 v150;
  _BOOL4 v151;
  unsigned int v153;
  unsigned __int16 v154;
  int32x2_t v155;
  int v156;
  int v157;
  unsigned int v158;
  unint64_t v159;
  unint64_t v160;
  float v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  float32x4_t v166;
  float32x4_t v167;
  int v168;
  __int32 v169;
  uint64_t v170;
  int32x2_t v171;
  int32x2_t v172;
  __int16 v173;
  int32x2_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  float *v179;
  uint64_t v180;
  uint64_t v181;
  float32x4_t v182;
  float32x4_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  int32x2_t v187;
  int32x2_t v188;
  int8x8_t v189;
  int8x8_t v190;
  int32x2_t v191;
  int8x8_t v192;
  int8x8_t v193;
  int32x2_t v194;
  uint64_t v195;
  int8x8_t v196;
  int8x8_t v197;
  int8x8_t v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  _WORD *v205;
  _WORD *v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  _WORD *v212;
  char *v213;
  char *v214;
  _WORD *v215;
  int v216;
  uint64_t n;
  int v218;
  BOOL v219;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v221;
  __int32 v222;
  __int32 v223;
  uint64_t v224;
  uint64_t v225;
  char *v226;
  uint64_t v227;
  float32x4_t v228;
  float32x4_t v229;
  int8x8_t v230;
  int8x8_t v231;
  int8x8_t v232;
  int8x8_t v233;
  int8x8_t v234;
  uint64_t v235;
  int8x8_t v236;
  int8x8_t v237;
  int v238;
  int v239;
  int v240;
  int v241;
  int v242;
  int v243;
  _WORD *v244;
  _WORD *v245;
  uint64_t v246;
  unint64_t v247;
  uint64_t v248;
  unint64_t v249;
  uint64_t v250;
  _WORD *v251;
  char *v252;
  char *v253;
  _WORD *v254;
  int v255;
  int v256;
  size_t v257;
  int v258;
  void *v259;
  uint64_t v260;
  id v261;
  __int32 *v262;
  int v263;
  float32x4_t v264;
  float32x4_t *v265;
  float32x4_t v266;
  int v267;
  float32x4_t v268;
  float32x4_t v269;
  int8x16_t v270;
  int v271;
  CGDataProvider *v272;
  CGColorSpace *v273;
  uint64_t ii;
  void *v275;
  void *v277;
  void *v278;
  const __CFString *name;
  int8x8_t v280;
  __int128 v281;
  int32x2_t v282;
  int32x2_t v283;
  uint64_t v284;
  __int32 v285;
  float64x2_t v286;
  __int32 v287;
  int32x2_t v288;
  int32x2_t v289;
  int v290;
  int v291;
  int v292;
  int v293;
  int v294;
  int v295;
  _DWORD *v296;
  unsigned __int8 *v297;
  int v298;
  int v299;
  int32x2_t v300;
  _DWORD v301[624];
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  void *v307[8];
  __int128 v308;
  _OWORD v309[3];
  CGRect v310;
  CGRect v311;

  v5 = 0;
  if (a3)
  {
    if (a4)
    {
      Width = CGImageGetWidth(a3);
      Height = CGImageGetHeight(a3);
      v5 = 0;
      if (Width - 8193 >= 0xFFFFFFFFFFFFE036)
      {
        v10 = Height;
        if (Height >= 0x37 && Height <= 0x2000)
        {
          if (Width == CGImageGetWidth(a4) && v10 == CGImageGetHeight(a4))
          {
            v11 = malloc_type_malloc(4 * v10 * Width, 0x100004052888210uLL);
            name = (const __CFString *)*MEMORY[0x1E0C9DA10];
            v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
            v13 = 1;
            v14 = CGBitmapContextCreate(v11, Width, v10, 8uLL, 4 * Width, v12, 1u);
            CGColorSpaceRelease(v12);
            CGContextSetInterpolationQuality(v14, kCGInterpolationHigh);
            v310.origin.x = 0.0;
            v310.origin.y = 0.0;
            v310.size.width = (double)Width;
            v310.size.height = (double)v10;
            CGContextDrawImage(v14, v310, a3);
            CGContextRelease(v14);
            v15 = (unsigned __int8 *)malloc_type_malloc(v10 * Width, 0xCF57351FuLL);
            v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D970]);
            v17 = CGBitmapContextCreate(v15, Width, v10, 8uLL, Width, v16, 0);
            CGColorSpaceRelease(v16);
            CGContextSetInterpolationQuality(v17, kCGInterpolationHigh);
            v311.origin.x = 0.0;
            v311.origin.y = 0.0;
            v311.size.width = (double)Width;
            v311.size.height = (double)v10;
            CGContextDrawImage(v17, v311, a4);
            CGContextRelease(v17);
            v277 = v15;
            v278 = v11;
            v296 = v11;
            v297 = v15;
            v298 = Width;
            v299 = v10;
            v300.i32[0] = Width + 22;
            v300.i32[1] = v10 + 22;
            v18 = 4;
            v19 = 9;
            v301[0] = 4;
            do
            {
              v20 = 1812433253 * (v18 ^ (v18 >> 30));
              v18 = v20 + v13;
              *((_DWORD *)&v296 + v19) = v19 + v20 - 8;
              ++v13;
              ++v19;
            }
            while (v19 != 632);
            v21 = 0;
            memset(v309, 0, 44);
            v308 = 0u;
            memset(v307, 0, sizeof(v307));
            v306 = 0u;
            v305 = 0u;
            v304 = 0u;
            v303 = 0u;
            v302 = 0u;
            __asm { FMOV            V0.2D, #21.0 }
            v286 = _Q0;
            do
            {
              v26 = &v307[3 * v21 + 3];
              _ZNSt3__16vectorIDv2_sNS_9allocatorIS1_EEE7reserveEm(v26, 0x22uLL);
              v27 = 0;
              v28 = v21 + 1;
              v29 = &(&v296)[3 * v21];
              v30 = (void **)(v29 + 330);
              v31 = v29 + 331;
              v32 = (char *)v29[330];
              do
              {
                v34 = __sincos_stret((double)v27 * 6.28318531 / 17.0);
                v33.f64[0] = v34.__cosval;
                v33.f64[1] = v34.__sinval;
                v35 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(vmulq_f64(v33, v286), (double)((int)v21 + 1))));
                if ((unint64_t)v32 >= *v31)
                {
                  v282 = v35;
                  v36 = (v32 - (_BYTE *)*v26) >> 2;
                  if ((unint64_t)(v36 + 1) >> 62)
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  v37 = *v31 - (_QWORD)*v26;
                  v38 = v37 >> 1;
                  if (v37 >> 1 <= (unint64_t)(v36 + 1))
                    v38 = v36 + 1;
                  if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
                    v39 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v39 = v38;
                  if (v39)
                    v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v39);
                  else
                    v40 = 0;
                  v41 = (_WORD *)(v39 + 4 * v36);
                  v41[1] = v282.i16[2];
                  *v41 = v282.i16[0];
                  v42 = (char *)*v30;
                  v43 = (char *)*v26;
                  v44 = v41;
                  if (*v30 != *v26)
                  {
                    do
                    {
                      v45 = *((_DWORD *)v42 - 1);
                      v42 -= 4;
                      *((_DWORD *)v44 - 1) = v45;
                      v44 -= 2;
                    }
                    while (v42 != v43);
                    v42 = (char *)*v26;
                  }
                  v32 = (char *)(v41 + 2);
                  *v26 = v44;
                  *v31 = v39 + 4 * v40;
                  if (v42)
                    operator delete(v42);
                }
                else
                {
                  *((_WORD *)v32 + 1) = v35.i16[2];
                  *(_WORD *)v32 = v35.i16[0];
                  v32 += 4;
                }
                *v30 = v32;
                ++v27;
              }
              while (v27 != 17);
              for (i = 0; i != 17; ++i)
              {
                v48 = __sincos_stret((double)i * 6.28318531 / 17.0);
                v47.f64[0] = v48.__cosval;
                v47.f64[1] = v48.__sinval;
                v49 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(vmulq_f64(v47, v286), (double)(2 * (int)v21 + 5))));
                if ((unint64_t)v32 >= *v31)
                {
                  v283 = v49;
                  v50 = (v32 - (_BYTE *)*v26) >> 2;
                  if ((unint64_t)(v50 + 1) >> 62)
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  v51 = *v31 - (_QWORD)*v26;
                  v52 = v51 >> 1;
                  if (v51 >> 1 <= (unint64_t)(v50 + 1))
                    v52 = v50 + 1;
                  if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL)
                    v53 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v53 = v52;
                  if (v53)
                    v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v53);
                  else
                    v54 = 0;
                  v55 = (_WORD *)(v53 + 4 * v50);
                  v55[1] = v283.i16[2];
                  *v55 = v283.i16[0];
                  v56 = (char *)*v30;
                  v57 = (char *)*v26;
                  v58 = v55;
                  if (*v30 != *v26)
                  {
                    do
                    {
                      v59 = *((_DWORD *)v56 - 1);
                      v56 -= 4;
                      *((_DWORD *)v58 - 1) = v59;
                      v58 -= 2;
                    }
                    while (v56 != v57);
                    v56 = (char *)*v26;
                  }
                  v32 = (char *)(v55 + 2);
                  *v26 = v58;
                  *v31 = v53 + 4 * v54;
                  if (v56)
                    operator delete(v56);
                }
                else
                {
                  *((_WORD *)v32 + 1) = v49.i16[2];
                  *(_WORD *)v32 = v49.i16[0];
                  v32 += 4;
                }
                *v30 = v32;
              }
              ++v21;
            }
            while (v28 != 3);
            v60 = *(float **)&v309[2];
            v61 = (_BYTE *)*((_QWORD *)&v309[1] + 1);
            v62 = *(_BYTE **)&v309[1];
            if (*(_QWORD *)&v309[2] - *(_QWORD *)&v309[1] > 0x1E3uLL)
            {
              v64 = (float *)*((_QWORD *)&v309[1] + 1);
            }
            else
            {
              v63 = (char *)operator new(0x1E4uLL);
              v60 = (float *)(v63 + 484);
              v64 = (float *)&v63[(v61 - v62) & 0xFFFFFFFFFFFFFFFCLL];
              v65 = v64;
              if (v61 != v62)
              {
                v65 = (float *)&v63[(v61 - v62) & 0xFFFFFFFFFFFFFFFCLL];
                do
                {
                  v66 = *((_DWORD *)v61 - 1);
                  v61 -= 4;
                  *((_DWORD *)v65-- - 1) = v66;
                }
                while (v61 != v62);
              }
              *(_QWORD *)&v309[1] = v65;
              *((_QWORD *)&v309[1] + 1) = v64;
              *(_QWORD *)&v309[2] = v63 + 484;
              if (v62)
                operator delete(v62);
            }
            for (j = 0; j != 11; ++j)
            {
              v68 = 0;
              v69 = fabsf((float)(j - 5));
              v70 = (float)(v69 * 0.17273) * (float)(v69 * 0.17273);
              do
              {
                v71 = fabsf((float)(v68 - 5));
                v72 = sqrtf(v70 + (float)((float)(v71 * 0.17273) * (float)(v71 * 0.17273)));
                if (v72 <= 1.0)
                  v73 = 1.0 - v72;
                else
                  v73 = 0.0;
                if (v64 >= v60)
                {
                  v74 = *(float **)&v309[1];
                  v75 = ((uint64_t)v64 - *(_QWORD *)&v309[1]) >> 2;
                  v76 = v75 + 1;
                  if ((unint64_t)(v75 + 1) >> 62)
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  if (((uint64_t)v60 - *(_QWORD *)&v309[1]) >> 1 > v76)
                    v76 = ((uint64_t)v60 - *(_QWORD *)&v309[1]) >> 1;
                  if ((unint64_t)v60 - *(_QWORD *)&v309[1] >= 0x7FFFFFFFFFFFFFFCLL)
                    v76 = 0x3FFFFFFFFFFFFFFFLL;
                  if (v76)
                  {
                    v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v76);
                    v64 = (float *)*((_QWORD *)&v309[1] + 1);
                    v74 = *(float **)&v309[1];
                  }
                  else
                  {
                    v77 = 0;
                  }
                  v78 = (float *)(v76 + 4 * v75);
                  *v78 = v73;
                  v79 = v78 + 1;
                  while (v64 != v74)
                  {
                    v80 = *((_DWORD *)v64-- - 1);
                    *((_DWORD *)v78-- - 1) = v80;
                  }
                  v60 = (float *)(v76 + 4 * v77);
                  *(_QWORD *)&v309[1] = v78;
                  *(_QWORD *)&v309[2] = v60;
                  if (v74)
                    operator delete(v74);
                  v64 = v79;
                }
                else
                {
                  *v64++ = v73;
                }
                *((_QWORD *)&v309[1] + 1) = v64;
                ++v68;
              }
              while (v68 != 11);
            }
            v82 = v298;
            v81 = v299;
            v83 = v300.i32[1] * (uint64_t)v300.i32[0];
            v84 = (char *)*((_QWORD *)&v304 + 1);
            v85 = v304;
            v86 = *((_QWORD *)&v304 + 1) - v304;
            v87 = v83 - (*((_QWORD *)&v304 + 1) - v304);
            v287 = v300.i32[0];
            if (v83 <= *((_QWORD *)&v304 + 1) - (_QWORD)v304)
            {
              if (v83 < *((_QWORD *)&v304 + 1) - (_QWORD)v304)
                *((_QWORD *)&v304 + 1) = v304 + v83;
            }
            else if ((_QWORD)v305 - *((_QWORD *)&v304 + 1) >= v87)
            {
              bzero(*((void **)&v304 + 1), v83 - (*((_QWORD *)&v304 + 1) - v304));
              *((_QWORD *)&v304 + 1) = &v84[v87];
            }
            else
            {
              if ((v83 & 0x80000000) != 0)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v88 = 2 * (v305 - v304);
              if (v88 <= v83)
                v88 = v300.i32[1] * (uint64_t)v300.i32[0];
              if ((_QWORD)v305 - (_QWORD)v304 >= 0x3FFFFFFFFFFFFFFFuLL)
                v89 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v89 = v88;
              v90 = operator new(v89);
              v91 = (char *)v90 + v86;
              v92 = (char *)v90 + v89;
              v93 = (char *)v90 + v83;
              bzero(v91, v87);
              if (v84 == (char *)v85)
              {
                v90 = v91;
              }
              else
              {
                v94 = &v84[~v85];
                do
                {
                  v95 = *--v84;
                  (v94--)[(_QWORD)v90] = v95;
                }
                while (v84 != (char *)v85);
                v84 = (char *)v304;
              }
              *(_QWORD *)&v304 = v90;
              *((_QWORD *)&v304 + 1) = v93;
              *(_QWORD *)&v305 = v92;
              if (v84)
                operator delete(v84);
            }
            _ZNSt3__16vectorIDv4_fNS_9allocatorIS1_EEE6resizeEm((char **)&v305 + 1, v83);
            _ZNSt3__16vectorIDv4_fNS_9allocatorIS1_EEE6resizeEm((char **)v307, v83);
            v96 = (char *)*((_QWORD *)&v305 + 1);
            v97 = (char *)v307[0];
            v98 = v296;
            v99 = v297;
            v100 = v304;
            bzero((void *)v304, v83);
            bzero(v97, 16 * (int)v83);
            bzero(v96, 16 * (int)v83);
            if (v81 <= 0)
            {
              _ZNSt3__16vectorIDv2_sNS_9allocatorIS1_EEE7reserveEm((void **)&v302 + 1, v83);
            }
            else
            {
              v101 = 0;
              v102 = 11 * v287 + 11;
              v103 = &v97[16 * v102];
              v104 = &v96[16 * v102];
              v105 = (_BYTE *)(v100 + v102);
              do
              {
                if (v82 >= 1)
                {
                  v106 = v82;
                  v107 = v99;
                  do
                  {
                    if (*v107 <= 5u)
                    {
                      *v105 = 1;
                      *((float *)&v108 + 3) = (float)HIBYTE(*v98) / 255.0;
                      *(_OWORD *)v104 = v108;
                      *(_OWORD *)v103 = v108;
                    }
                    ++v107;
                    ++v105;
                    ++v98;
                    v104 += 16;
                    v103 += 16;
                    --v106;
                  }
                  while (v106);
                  v99 += (v82 - 1) + 1;
                }
                v105 += 22;
                v104 += 352;
                v103 += 352;
                ++v101;
              }
              while (v101 != v81);
              _ZNSt3__16vectorIDv2_sNS_9allocatorIS1_EEE7reserveEm((void **)&v302 + 1, v83);
              for (k = 0; k != v81; ++k)
              {
                if (v82 >= 1)
                {
                  for (m = 0; m != v82; ++m)
                  {
                    HIWORD(v295) = k + 11;
                    LOWORD(v295) = m + 11;
                    {
                      v109.i32[0] = m + 11;
                      v109.i32[1] = k + 11;
                      v112 = (_WORD *)v303;
                      if ((unint64_t)v303 >= *((_QWORD *)&v303 + 1))
                      {
                        v288 = v109;
                        v114 = (uint64_t)(v303 - *((_QWORD *)&v302 + 1)) >> 2;
                        v115 = v114 + 1;
                        if ((unint64_t)(v114 + 1) >> 62)
LABEL_261:
                          std::vector<float>::__throw_length_error[abi:ne180100]();
                        v116 = *((_QWORD *)&v303 + 1) - *((_QWORD *)&v302 + 1);
                        if ((uint64_t)(*((_QWORD *)&v303 + 1) - *((_QWORD *)&v302 + 1)) >> 1 > v115)
                          v115 = v116 >> 1;
                        if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL)
                          v117 = 0x3FFFFFFFFFFFFFFFLL;
                        else
                          v117 = v115;
                        if (v117)
                          v117 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v117);
                        else
                          v118 = 0;
                        v119 = (_WORD *)(v117 + 4 * v114);
                        v109.i32[1] = v288.i32[1];
                        v119[1] = v288.i16[2];
                        *v119 = v288.i16[0];
                        v120 = (char *)v303;
                        v121 = (char *)*((_QWORD *)&v302 + 1);
                        v122 = v119;
                        if ((_QWORD)v303 != *((_QWORD *)&v302 + 1))
                        {
                          do
                          {
                            v123 = *((_DWORD *)v120 - 1);
                            v120 -= 4;
                            *((_DWORD *)v122 - 1) = v123;
                            v122 -= 2;
                          }
                          while (v120 != v121);
                          v120 = (char *)*((_QWORD *)&v302 + 1);
                        }
                        v113 = v119 + 2;
                        *((_QWORD *)&v302 + 1) = v122;
                        *((_QWORD *)&v303 + 1) = v117 + 4 * v118;
                        if (v120)
                          operator delete(v120);
                      }
                      else
                      {
                        *(_WORD *)(v303 + 2) = k + 11;
                        *v112 = m + 11;
                        v113 = v112 + 2;
                      }
                      *(_QWORD *)&v303 = v113;
                    }
                  }
                }
              }
            }
            v285 = v300.i32[0];
            if ((_QWORD)v303 != *((_QWORD *)&v302 + 1))
            {
              v284 = v304;
              v109.i32[0] = 11;
              v124 = vshl_n_s32(v109, 0x10uLL);
              v125 = vshr_n_s32(v124, 0x10uLL);
              v126 = vdup_n_s32(0xFFFBu);
              v124.i32[0] = 11;
              v127 = vshr_n_s32(vshl_n_s32(v124, 0x10uLL), 0x10uLL);
              while (1)
              {
                v128 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)v301);
                v129 = ((_QWORD)v303 - *((_QWORD *)&v302 + 1)) >> 2;
                v130 = (__int16 *)(*((_QWORD *)&v302 + 1) + 4 * (int)(v128 % v129));
                v131.i16[0] = *v130;
                v131.i16[2] = v130[1];
                v132 = v303 - (_QWORD)(v130 + 2);
                v289 = v131;
                if ((__int16 *)v303 != v130 + 2)
                {
                  memmove((void *)(*((_QWORD *)&v302 + 1) + 4 * (int)(v128 % v129)), v130 + 2, v303 - (_QWORD)(v130 + 2));
                  v131 = v289;
                }
                *(_QWORD *)&v303 = (char *)v130 + v132;
                v133 = v131.i16[2];
                if (*(_BYTE *)(v284 + v285 * v131.i16[2] + v131.i16[0]) == 1)
                  goto LABEL_238;
                HIWORD(v294) = v131.i16[2];
                LOWORD(v294) = v131.i16[0];
                v134 = &(&v296)[3
                              * (std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)v301)
                               % 3)];
                v139 = (__int16 *)v134[329];
                v140 = (__int16 *)v134[330];
                if (v139 == v140)
                {
                  *(_QWORD *)&v138 = 0xFFFF0000FFFFLL;
                  v4.i32[0] = 1900671690;
                  v142 = v289;
                }
                else
                {
                  v141 = v300;
                  v135 = vadd_s32(v300, (int32x2_t)0x1500000015);
                  v142 = v289;
                  v143 = vadd_s32(v289, v126);
                  v144 = *((_QWORD *)&v305 + 1) + 16 * v143.i16[2] * (uint64_t)v300.i32[0] + 16 * v143.i16[0];
                  v145 = v304 + v143.i16[2] * (uint64_t)v300.i32[0] + v143.i16[0];
                  v146 = 16 * (v300.i32[0] - 11) + 176;
                  *(_QWORD *)&v138 = 0xFFFF0000FFFFLL;
                  v4.i32[0] = 1900671690;
                  do
                  {
                    v141.i16[0] = *v139;
                    v141.i16[2] = v139[1];
                    v141 = vadd_s32(v141, v289);
                    v147 = vadd_s32(v141, v126);
                    v148 = v147.i16[0];
                    v149 = -1.0;
                    if (v147.i16[0] >= 22)
                    {
                      v154 = v147.u16[2];
                      if (v147.i16[2] >= 22)
                      {
                        v155 = vcgt_s32(v135, vshr_n_s32(vshl_n_s32(vadd_s32(v141, (int32x2_t)0x600000006), 0x10uLL), 0x10uLL));
                        if ((v155.i8[0] & 1) != 0 && (v155.i8[4] & 1) != 0)
                        {
                          v156 = 0;
                          v157 = 0;
                          v158 = v148;
                          v159 = *((_QWORD *)&v305 + 1)
                               + 16 * v300.i32[0] * (unint64_t)v154
                               + 16 * v148;
                          v160 = v304 + v300.i32[0] * (unint64_t)v154 + v158;
                          v161 = 0.0;
                          v162 = v144;
                          v163 = *(_QWORD *)&v309[1];
                          v164 = v145;
                          do
                          {
                            v165 = 0;
                            do
                            {
                              if (*(float *)(v163 + 4 * v165) > 0.0)
                              {
                                if (!*(_BYTE *)(v160 + v165))
                                  goto LABEL_139;
                                if (*(_BYTE *)(v164 + v165))
                                {
                                  v166 = vsubq_f32(*(float32x4_t *)(v159 + 16 * v165), *(float32x4_t *)(v162 + 16 * v165));
                                  v167 = vmulq_f32(v166, v166);
                                  ++v157;
                                  v137 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v167, 2), vaddq_f32(v167, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v167.f32, 1))).u64[0];
                                  v161 = v161 + *(float *)v137.i32;
                                }
                              }
                              ++v165;
                            }
                            while ((_DWORD)v165 != 11);
                            v160 += v300.i32[0];
                            v164 += v300.i32[0];
                            ++v156;
                            v162 += v146;
                            v159 += v146;
                            v163 += 44;
                          }
                          while (v156 != 11);
                          v149 = v161 / (float)v157;
                        }
                      }
                    }
LABEL_139:
                    v150 = v149 >= 0.0;
                    v151 = v149 < v4.f32[0];
                    _ZF = !v150 || !v151;
                    if (v150 && v151)
                      v153 = -1;
                    else
                      v153 = 0;
                    v136 = vdup_n_s32(v153);
                    *(int8x8_t *)&v138 = vbsl_s8((int8x8_t)v136, (int8x8_t)v141, *(int8x8_t *)&v138);
                    if (!_ZF)
                      v4.f32[0] = v149;
                    v139 += 2;
                  }
                  while (v139 != v140);
                }
                if ((v138 & 0x8000) != 0)
                {
                  for (n = 0; n != 32; n += 4)
                  {
                    v135.i16[0] = *(_WORD *)((char *)&_ZZN12_GLOBAL__N_119_NTKUltraCubeFiller10tryResolveEDv2_sE4adjs + n);
                    v135.i16[2] = *(_WORD *)((char *)&_ZZN12_GLOBAL__N_119_NTKUltraCubeFiller10tryResolveEDv2_sE4adjs
                                           + n
                                           + 2);
                    v135 = vadd_s32(v135, v142);
                    HIWORD(v292) = v135.i16[2];
                    LOWORD(v292) = v135.i16[0];
                    if (v292 << 16 >= 720896)
                    {
                      v218 = v292 >> 16;
                      v219 = v292 >= 720896 && v135.i16[0] < v300.i32[0] - 11;
                      if (v219 && v218 < v300.i32[1] - 11)
                      {
                        if (*(_BYTE *)(v304 + v218 * v300.i32[0] + v135.i16[0]))
                        {
                          if (!*(_BYTE *)(v304 + v300.i32[0] * (v294 >> 16) + (__int16)v294))
                          {
                            v280 = (int8x8_t)v135;
                            v281 = v138;
                            v221 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)v301);
                            *((_QWORD *)&v138 + 1) = *((_QWORD *)&v281 + 1);
                            v142 = v289;
                            *(float *)v135.i32 = (float)(v221 % 0x3E8);
                            *(int8x8_t *)&v138 = vbsl_s8((int8x8_t)*(_OWORD *)&vmovl_s16((int16x4_t)vcgt_f32(v4, (float32x2_t)v135)), v280, *(int8x8_t *)&v281);
                            if (v4.f32[0] > *(float *)v135.i32)
                              v4.f32[0] = (float)(v221 % 0x3E8);
                          }
                        }
                      }
                    }
                  }
                  if ((v138 & 0x8000) != 0)
                    goto LABEL_238;
                  HIWORD(v291) = WORD2(v138);
                  LOWORD(v291) = v138;
                  v223 = v300.i32[0];
                  v222 = v300.i32[1];
                  v224 = v300.i32[0] * (uint64_t)v133;
                  v225 = *((_QWORD *)&v305 + 1) + 16 * v224;
                  v226 = (char *)v307[0] + 16 * v224;
                  v227 = v304 + v224;
                  v228 = vaddq_f32(*(float32x4_t *)(*((_QWORD *)&v305 + 1)+ 16 * v300.i32[0] * (v291 >> 16)+ 16 * (__int16)v138), *(float32x4_t *)&v226[16 * (__int16)v294]);
                  v229 = vmulq_n_f32(v228, 1.0 / v228.f32[3]);
                  v229.i32[3] = 1.0;
                  *(float32x4_t *)&v226[16 * (__int16)v294] = v228;
                  *(float32x4_t *)(v225 + 16 * (__int16)v294) = v229;
                  *(_BYTE *)(v227 + (__int16)v294) = 1;
                  *(int32x2_t *)v228.f32 = vadd_s32(v142, (int32x2_t)0xFFFF0000FFFFLL);
                  v230.i32[1] = v228.i32[1];
                  v230.i32[0] = 11;
                  *(int8x8_t *)v228.f32 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v125, vshr_n_s32(vshl_n_s32(*(int32x2_t *)v228.f32, 0x10uLL), 0x10uLL)), 0), v230, *(int8x8_t *)v228.f32);
                  *(int32x2_t *)v229.f32 = vdup_lane_s32(vcgt_s32(v125, vshr_n_s32(vshl_n_s32(vdup_lane_s32(*(int32x2_t *)v228.f32, 1), 0x10uLL), 0x10uLL)), 0);
                  v231 = (int8x8_t)vadd_s32(v142, (int32x2_t)0x100000001);
                  v136.i32[0] = v223 - 11;
                  v137.i32[0] = v231.i16[0];
                  v232 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32(v136, v137)).u64[0];
                  v233.i32[1] = v231.i32[1];
                  v233.i32[0] = v223 - 12;
                  v234 = vbsl_s8(v232, v231, v233);
                  v235 = v228.u32[0] | 0xB00000000;
                  v236 = vbsl_s8(*(int8x8_t *)v229.f32, (int8x8_t)v235, *(int8x8_t *)v228.f32);
                  v229.i32[0] = v234.i16[2];
                  LODWORD(v235) = v222 - 11;
                  v229.i64[0] = vmovl_s16((int16x4_t)vcgt_s32((int32x2_t)v235, *(int32x2_t *)v229.f32)).u64[0];
                  LODWORD(v235) = v234.i32[0];
                  HIDWORD(v235) = v222 - 12;
                  v237 = vbsl_s8(*(int8x8_t *)v229.f32, v234, (int8x8_t)v235);
                  v238 = v236.i16[2];
                  if (v236.i16[2] <= v237.i16[2])
                  {
                    v239 = v237.i16[2];
                    v240 = v236.i16[0];
                    v241 = v237.i16[0];
                    if (v236.i16[0] <= v237.i16[0])
                      v242 = v237.i16[0];
                    else
                      v242 = v236.i16[0];
                    do
                    {
                      v243 = v240;
                      if (v240 <= v241)
                      {
                        do
                        {
                          HIWORD(v290) = v238;
                          LOWORD(v290) = v243;
                          {
                            v244 = (_WORD *)v303;
                            if ((unint64_t)v303 >= *((_QWORD *)&v303 + 1))
                            {
                              v246 = (uint64_t)(v303 - *((_QWORD *)&v302 + 1)) >> 2;
                              v247 = v246 + 1;
                              if ((unint64_t)(v246 + 1) >> 62)
                                goto LABEL_261;
                              v248 = *((_QWORD *)&v303 + 1) - *((_QWORD *)&v302 + 1);
                              if ((uint64_t)(*((_QWORD *)&v303 + 1) - *((_QWORD *)&v302 + 1)) >> 1 > v247)
                                v247 = v248 >> 1;
                              if ((unint64_t)v248 >= 0x7FFFFFFFFFFFFFFCLL)
                                v249 = 0x3FFFFFFFFFFFFFFFLL;
                              else
                                v249 = v247;
                              if (v249)
                                v249 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v249);
                              else
                                v250 = 0;
                              v251 = (_WORD *)(v249 + 4 * v246);
                              v251[1] = v238;
                              *v251 = v243;
                              v252 = (char *)v303;
                              v253 = (char *)*((_QWORD *)&v302 + 1);
                              v254 = v251;
                              if ((_QWORD)v303 != *((_QWORD *)&v302 + 1))
                              {
                                do
                                {
                                  v255 = *((_DWORD *)v252 - 1);
                                  v252 -= 4;
                                  *((_DWORD *)v254 - 1) = v255;
                                  v254 -= 2;
                                }
                                while (v252 != v253);
                                v252 = (char *)*((_QWORD *)&v302 + 1);
                              }
                              v245 = v251 + 2;
                              *((_QWORD *)&v302 + 1) = v254;
                              *((_QWORD *)&v303 + 1) = v249 + 4 * v250;
                              if (v252)
                                operator delete(v252);
                            }
                            else
                            {
                              *(_WORD *)(v303 + 2) = v238;
                              *v244 = v243;
                              v245 = v244 + 2;
                            }
                            *(_QWORD *)&v303 = v245;
                          }
                          _ZF = v243++ == v242;
                        }
                        while (!_ZF);
                      }
                      _ZF = v238++ == v239;
                    }
                    while (!_ZF);
                  }
                }
                else
                {
                  v168 = 0;
                  v169 = v300.i32[1];
                  v170 = v300.i32[0];
                  v171 = vadd_s32(*(int32x2_t *)&v138, v126);
                  v172 = vadd_s32(v142, v126);
                  v173 = v171.i16[0];
                  v174 = vmul_s32(vdup_n_s32(v300.u32[0]), vshr_n_s32(vshl_n_s32(vzip2_s32(v171, v172), 0x10uLL), 0x10uLL));
                  v175 = *((_QWORD *)&v305 + 1) + 16 * v174.i32[0] + 16 * v173;
                  v176 = v304;
                  v177 = *((_QWORD *)&v305 + 1) + 16 * v174.i32[1] + 16 * v172.i16[0];
                  v178 = (char *)v307[0] + 16 * v174.i32[1] + 16 * v172.i16[0];
                  v179 = *(float **)&v309[1];
                  v180 = v300.i32[0] - 11;
                  do
                  {
                    v181 = 0;
                    do
                    {
                      if (*v179 > 0.0)
                      {
                        v182 = vmlaq_n_f32(*(float32x4_t *)&v178[v181], *(float32x4_t *)(v175 + v181), *v179);
                        v183 = vmulq_n_f32(v182, 1.0 / v182.f32[3]);
                        v183.i32[3] = 1.0;
                        *(float32x4_t *)&v178[v181] = v182;
                        *(float32x4_t *)(v177 + v181) = v183;
                      }
                      ++v179;
                      v181 += 16;
                    }
                    while ((_DWORD)v181 != 176);
                    v175 += v181 + 16 * v180;
                    v177 += v181 + 16 * v180;
                    ++v168;
                    v178 += 16 * v180 + v181;
                  }
                  while (v168 != 11);
                  v184 = v176 + (int)v170 * (uint64_t)(v133 - 1) + (__int16)v294;
                  *(_BYTE *)(v184 + 1) = 1;
                  *(_WORD *)(v184 - 1) = 257;
                  v185 = v184 + v170 - 3;
                  *(_WORD *)(v185 + 2) = 257;
                  v185 += 2;
                  *(_BYTE *)(v185 + 2) = 1;
                  v186 = v185 + v170 - 3;
                  v187 = vadd_s32(v142, vdup_n_s32(0xFFFEu));
                  v188 = vdup_lane_s32(vcgt_s32(v127, vshr_n_s32(vshl_n_s32(v187, 0x10uLL), 0x10uLL)), 0);
                  v189 = (int8x8_t)vadd_s32(v142, (int32x2_t)0x200000002);
                  v190.i32[1] = v187.i32[1];
                  v190.i32[0] = 11;
                  v191 = (int32x2_t)vbsl_s8((int8x8_t)v188, v190, (int8x8_t)v187);
                  v188.i32[0] = v180;
                  v190.i32[0] = v189.i16[0];
                  v192 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32(v188, (int32x2_t)v190)).u64[0];
                  v190.i32[1] = v189.i32[1];
                  v190.i32[0] = v170 - 12;
                  v193 = vbsl_s8(v192, v189, v190);
                  *(_BYTE *)(v186 + 5) = 1;
                  v194 = vdup_lane_s32(vcgt_s32(v127, vshr_n_s32(vshl_n_s32(vdup_lane_s32(v191, 1), 0x10uLL), 0x10uLL)), 0);
                  *(_WORD *)(v186 + 3) = 257;
                  v195 = v191.u32[0] | 0xB00000000;
                  v196 = vbsl_s8((int8x8_t)v194, (int8x8_t)v195, (int8x8_t)v191);
                  v194.i32[0] = v193.i16[2];
                  LODWORD(v195) = v169 - 11;
                  v197 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32((int32x2_t)v195, v194)).u64[0];
                  LODWORD(v195) = v193.i32[0];
                  HIDWORD(v195) = v169 - 12;
                  v198 = vbsl_s8(v197, v193, (int8x8_t)v195);
                  v199 = v196.i16[2];
                  if (v196.i16[2] <= v198.i16[2])
                  {
                    v200 = v198.i16[2];
                    v201 = v196.i16[0];
                    v202 = v198.i16[0];
                    if (v196.i16[0] <= v198.i16[0])
                      v203 = v198.i16[0];
                    else
                      v203 = v196.i16[0];
                    do
                    {
                      v204 = v201;
                      if (v201 <= v202)
                      {
                        do
                        {
                          HIWORD(v293) = v199;
                          LOWORD(v293) = v204;
                          {
                            v205 = (_WORD *)v303;
                            if ((unint64_t)v303 >= *((_QWORD *)&v303 + 1))
                            {
                              v207 = (uint64_t)(v303 - *((_QWORD *)&v302 + 1)) >> 2;
                              v208 = v207 + 1;
                              if ((unint64_t)(v207 + 1) >> 62)
                                goto LABEL_261;
                              v209 = *((_QWORD *)&v303 + 1) - *((_QWORD *)&v302 + 1);
                              if ((uint64_t)(*((_QWORD *)&v303 + 1) - *((_QWORD *)&v302 + 1)) >> 1 > v208)
                                v208 = v209 >> 1;
                              if ((unint64_t)v209 >= 0x7FFFFFFFFFFFFFFCLL)
                                v210 = 0x3FFFFFFFFFFFFFFFLL;
                              else
                                v210 = v208;
                              if (v210)
                                v210 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v210);
                              else
                                v211 = 0;
                              v212 = (_WORD *)(v210 + 4 * v207);
                              v212[1] = v199;
                              *v212 = v204;
                              v213 = (char *)v303;
                              v214 = (char *)*((_QWORD *)&v302 + 1);
                              v215 = v212;
                              if ((_QWORD)v303 != *((_QWORD *)&v302 + 1))
                              {
                                do
                                {
                                  v216 = *((_DWORD *)v213 - 1);
                                  v213 -= 4;
                                  *((_DWORD *)v215 - 1) = v216;
                                  v215 -= 2;
                                }
                                while (v213 != v214);
                                v213 = (char *)*((_QWORD *)&v302 + 1);
                              }
                              v206 = v212 + 2;
                              *((_QWORD *)&v302 + 1) = v215;
                              *((_QWORD *)&v303 + 1) = v210 + 4 * v211;
                              if (v213)
                                operator delete(v213);
                            }
                            else
                            {
                              *(_WORD *)(v303 + 2) = v199;
                              *v205 = v204;
                              v206 = v205 + 2;
                            }
                            *(_QWORD *)&v303 = v206;
                          }
                          _ZF = v204++ == v203;
                        }
                        while (!_ZF);
                      }
                      _ZF = v199++ == v200;
                    }
                    while (!_ZF);
                  }
                }
                ++DWORD2(v309[2]);
LABEL_238:
                if ((_QWORD)v303 == *((_QWORD *)&v302 + 1))
                {
                  v285 = v300.i32[0];
                  break;
                }
              }
            }
            v256 = v298;
            v257 = v299;
            v258 = 4 * v298;
            v259 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * v298 * v299);
            v260 = *((_QWORD *)&v305 + 1);
            v261 = objc_retainAutorelease(v259);
            v262 = (__int32 *)objc_msgSend(v261, "mutableBytes");
            if ((int)v257 >= 1)
            {
              v263 = 0;
              v264 = (float32x4_t)vdupq_n_s32(0x45CDF000u);
              v265 = (float32x4_t *)(v260 + 16 * (11 * v285 + 11));
              v266 = (float32x4_t)vdupq_n_s32(0x437F0000u);
              do
              {
                v267 = v256;
                if (v256 >= 1)
                {
                  do
                  {
                    v268 = *v265++;
                    v269 = vmulq_f32(v268, v264);
                    v269.i32[3] = v268.i32[3];
                    v270 = (int8x16_t)vmulq_f32(v269, v266);
                    v271 = (int)*(float *)v270.i32;
                    v270.i32[0] = vextq_s8(v270, v270, 8uLL).i32[1];
                    *(uint32x2_t *)v270.i8 = vshl_u32((uint32x2_t)vcvt_s32_f32(*(float32x2_t *)v270.i8), (uint32x2_t)0x800000018);
                    *v262++ = v270.i32[0] | ((int)*(float *)&v270.i32[2] << 16) | v271 | v270.i32[1];
                    --v267;
                  }
                  while (v267);
                }
                v265 += 22;
                ++v263;
              }
              while (v263 != (_DWORD)v257);
            }
            v272 = CGDataProviderCreateWithCFData((CFDataRef)v261);
            v273 = CGColorSpaceCreateWithName(name);
            v5 = CGImageCreate(v256, v257, 8uLL, 0x20uLL, v258, v273, 0, v272, 0, 0, kCGRenderingIntentDefault);
            CGDataProviderRelease(v272);
            CGColorSpaceRelease(v273);

            if (*(_QWORD *)&v309[1])
            {
              *((_QWORD *)&v309[1] + 1) = *(_QWORD *)&v309[1];
              operator delete(*(void **)&v309[1]);
            }
            for (ii = 0; ii != -72; ii -= 24)
            {
              v275 = *(void **)((char *)&v308 + ii + 8);
              if (v275)
              {
                *(_QWORD *)((char *)v309 + ii) = v275;
                operator delete(v275);
              }
            }
            if (v307[0])
            {
              v307[1] = v307[0];
              operator delete(v307[0]);
            }
            if (*((_QWORD *)&v305 + 1))
            {
              *(_QWORD *)&v306 = *((_QWORD *)&v305 + 1);
              operator delete(*((void **)&v305 + 1));
            }
            if ((_QWORD)v304)
            {
              *((_QWORD *)&v304 + 1) = v304;
              operator delete((void *)v304);
            }
            if (*((_QWORD *)&v302 + 1))
            {
              *(_QWORD *)&v303 = *((_QWORD *)&v302 + 1);
              operator delete(*((void **)&v302 + 1));
            }
            free(v278);
            free(v277);
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return v5;
}

@end

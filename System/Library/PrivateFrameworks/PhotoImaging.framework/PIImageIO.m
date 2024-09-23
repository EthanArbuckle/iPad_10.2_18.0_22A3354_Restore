@implementation PIImageIO

+ (BOOL)writeImage:(id)a3 fileURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CGImage *v11;
  BOOL v12;
  NSObject *v14;
  void *v15;
  const void **v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    NUAssertLogger_20263();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20263();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        v29 = 2114;
        v30 = v26;
        _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(v5, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  optionsForFormat(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x1E0D52168], "newCGImageFromBufferImage:", v5);
  if (v10)
  {
    v11 = (CGImage *)v10;
    v12 = +[PIImageIO writeCGImage:fileURL:options:](PIImageIO, "writeCGImage:fileURL:options:", v10, v7, v9);
    CGImageRelease(v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)writeCGImage:(CGImage *)a3 fileURL:(id)a4
{
  id v5;
  void *v6;
  size_t BitsPerComponent;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v13;
  const void **v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  const void **v21;
  void *v22;
  int v23;
  void *v24;
  const void **v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const void **v36;
  const void **v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  const void **v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  SEL v49;
  CGImage *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  const void **v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!a3)
  {
    NUAssertLogger_20263();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "cgImage != NULL");
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20263();
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
        *(_DWORD *)buf = 138543618;
        v54 = (const void **)v26;
        v55 = 2114;
        v56 = v29;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v15;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v23 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v6 = v5;
  if (!v5)
  {
    NUAssertLogger_20263();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20263();
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_25;
    }
LABEL_23:
    if (v23)
    {
      v30 = dispatch_get_specific(*v15);
      v31 = (void *)MEMORY[0x1E0CB3978];
      v32 = v30;
      objc_msgSend(v31, "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = (const void **)v30;
      v55 = 2114;
      v56 = v34;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_25:

    _NUAssertFailHandler();
  }
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  switch(BitsPerComponent)
  {
    case 0x20uLL:
      objc_msgSend(MEMORY[0x1E0D52220], "RGBAf");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 0x10uLL:
      objc_msgSend(MEMORY[0x1E0D52220], "RGBA16");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8uLL:
      objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = v8;
      optionsForFormat(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[PIImageIO writeCGImage:fileURL:options:](PIImageIO, "writeCGImage:fileURL:options:", a3, v6, v10);

      return v11;
  }
  NUAssertLogger_20263();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled bit depth: %ld"), CGImageGetBitsPerComponent(a3));
    v36 = (const void **)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v36;
    _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v37 = (const void **)MEMORY[0x1E0D51D48];
  v38 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_20263();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
  if (v38)
  {
    if (v40)
    {
      v43 = dispatch_get_specific(*v37);
      v44 = (void *)MEMORY[0x1E0CB3978];
      v45 = v43;
      objc_msgSend(v44, "callStackSymbols");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = (const void **)v43;
      v55 = 2114;
      v56 = v47;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v40)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
    v42 = (const void **)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v42;
    _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  CGImageGetBitsPerComponent(a3);
  v48 = (void *)_NUAssertFailHandler();
  return +[PIImageIO writeCGImage:fileURL:options:](v48, v49, v50, v51, v52);
}

+ (BOOL)writeCGImage:(CGImage *)a3 fileURL:(id)a4 options:(id)a5
{
  id v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  void *v10;
  const __CFString *v11;
  CGImageDestination *v12;
  _BOOL4 v13;
  void *v14;
  BOOL v15;
  NSObject *v17;
  const void **v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
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
  uint8_t buf[4];
  const void **v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (const __CFDictionary *)a5;
  if (!a3)
  {
    NUAssertLogger_20263();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "cgImage != NULL");
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20263();
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
        v40 = (const void **)v30;
        v41 = 2114;
        v42 = v33;
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
      v40 = v19;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v27 = _NUAssertFailHandler();
    goto LABEL_21;
  }
  if (!v7)
  {
    NUAssertLogger_20263();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileURL != nil");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    v26 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20263();
    v21 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_23;
    }
LABEL_21:
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
      v40 = (const void **)v34;
      v41 = 2114;
      v42 = v38;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_23:

    _NUAssertFailHandler();
  }
  v9 = v8;
  objc_msgSend(v7, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const __CFString *)NUFileTypeFromExtension();
  v12 = CGImageDestinationCreateWithURL((CFURLRef)v7, v11, 1uLL, 0);

  if (v12 && (CGImageDestinationAddImage(v12, a3, v9), v13 = CGImageDestinationFinalize(v12), CFRelease(v12), v13))
  {
    objc_msgSend(v7, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Successfully wrote image to file %@"), v14);
    v15 = 1;
  }
  else
  {
    objc_msgSend(v7, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to write image to file %@"), v14);
    v15 = 0;
  }

  return v15;
}

+ (id)writeImage:(id)a3 toTemporaryDirectoryWithBasename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeImage:toDirectoryAtPath:withBasename:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)writeImage:(id)a3 toDirectoryAtPath:(id)a4 withBasename:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = getpid();
  v12 = writeImage_toDirectoryAtPath_withBasename__count++;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%d-%ld.tiff"), v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = +[PIImageIO writeImage:fileURL:](PIImageIO, "writeImage:fileURL:", v10, v15);

  if ((_DWORD)v13)
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

@end

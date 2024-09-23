@implementation PICoreImageUtilities

+ (id)metalLibraryData
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PICoreImageUtilities_metalLibraryData__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (metalLibraryData_onceToken != -1)
    dispatch_once(&metalLibraryData_onceToken, block);
  return (id)metalLibraryData_metalLibraryData;
}

+ (id)metalKernelWithFunctionName:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C9DDD0];
  v7 = a3;
  objc_msgSend(a1, "metalLibraryData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kernelWithFunctionName:fromMetalLibraryData:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)framedRectImageWithCGRect:(CGRect)a3 color:(id)a4 borderWidth:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)MEMORY[0x1E0C9DDB8];
  v11 = a4;
  objc_msgSend(v10, "roundedRectangleGeneratorFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExtent:", x, y, width, height);
  objc_msgSend(v12, "setColor:", v11);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "roundedRectangleGeneratorFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v21 = CGRectInset(v20, a5, a5);
  objc_msgSend(v13, "setExtent:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v14);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "sourceOutCompositingFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "outputImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInputImage:", v16);

  objc_msgSend(v13, "outputImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundImage:", v17);

  objc_msgSend(v15, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)loadFilterWithName:(id)a3
{
  id v3;
  void *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v6 = 138412290;
        v7 = v3;
        _os_log_error_impl(&dword_1A6382000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load filter named '%@'", (uint8_t *)&v6, 0xCu);
      }
      v4 = 0;
    }
  }

  return v4;
}

void __40__PICoreImageUtilities_metalLibraryData__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v2, 1, &v19);
  v4 = v19;
  v5 = (void *)metalLibraryData_metalLibraryData;
  metalLibraryData_metalLibraryData = v3;

  if (!metalLibraryData_metalLibraryData)
  {
    NUAssertLogger_10273();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load metal lib data: %@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_10273();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        v22 = 2114;
        v23 = v18;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }

}

@end

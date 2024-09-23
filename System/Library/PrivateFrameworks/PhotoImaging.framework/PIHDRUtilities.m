@implementation PIHDRUtilities

+ (__CVBuffer)newHLGPixelBufferFromSDRImage:(CGImage *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  __CVBuffer *v8;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_21653();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21653();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2114;
        v26 = v22;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageByApplyingFilter:", CFSTR("PIHDRInverseHLGFilter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extent");
  v8 = (__CVBuffer *)objc_msgSend(a1, "_newHLGPixelBufferOfSize:", v6, v7);
  if ((objc_msgSend(a1, "_renderImage:toPixelBuffer:", v5, v8) & 1) == 0)
  {
    objc_msgSend(a1, "recycleHLGPixelBuffer:", v8);
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_renderImage:(id)a3 toPixelBuffer:(__CVBuffer *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  BOOL v13;
  id v15;
  id v16;

  v5 = a3;
  if (a4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", a4);
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v7, "startTaskToRender:toDestination:error:", v5, v6, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    v15 = 0;
    objc_msgSend(v8, "nu_waitUntilCompletedAndReturnError:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;

    if (v8)
      v12 = v10 == 0;
    else
      v12 = 1;
    v13 = !v12;
    if (v12)
      NSLog(CFSTR("Failed to start rendering %@ to: %@, error: %@"), v5, v6, v11);
    else
      NSLog(CFSTR("Succesfully rendered HLG buffer: %@"), v10);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (__CVBuffer)_newHLGPixelBufferOfSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  void *v11;
  __CVBuffer *v12;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[2];
  _QWORD v19[3];

  height = a3.height;
  width = a3.width;
  v19[2] = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  v5 = *MEMORY[0x1E0CA8FF0];
  v18[0] = *MEMORY[0x1E0CA9010];
  v18[1] = v5;
  v19[0] = MEMORY[0x1E0C9AAB0];
  v19[1] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CA8D80];
  v8 = *MEMORY[0x1E0CA8E98];
  v16[0] = *MEMORY[0x1E0CA8D68];
  v16[1] = v8;
  v9 = *MEMORY[0x1E0CA8EA8];
  v17[0] = v7;
  v17[1] = v9;
  v16[2] = *MEMORY[0x1E0CA8EE8];
  v17[2] = *MEMORY[0x1E0CA8F00];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (CVPixelBufferCreate(0, (unint64_t)width, (unint64_t)height, 0x78343230u, v6, &pixelBufferOut))
    NSLog(CFSTR("Failed to allocate pixel buffer"));
  CVBufferSetAttachments(pixelBufferOut, v10, kCVAttachmentMode_ShouldPropagate);
  v15 = 0x4240133DA0E92F00;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v15, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA2150], v11, kCVAttachmentMode_ShouldPropagate);

  v12 = pixelBufferOut;
  return v12;
}

+ (void)recycleHLGPixelBuffer:(__CVBuffer *)a3
{
  CFRelease(a3);
}

@end

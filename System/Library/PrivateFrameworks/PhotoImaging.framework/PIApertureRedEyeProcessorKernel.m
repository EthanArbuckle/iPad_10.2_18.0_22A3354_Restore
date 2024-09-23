@implementation PIApertureRedEyeProcessorKernel

+ ($B5E4F2499D3E0A90C7E8AF059312C337)ROIForCenterPoint:(SEL)a3 radius:(CGPoint)a4
{
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  return ($B5E4F2499D3E0A90C7E8AF059312C337 *)NUPixelRectFromCGRect();
}

+ (void)convertFloat:(const float *)a3 toFixed16:(unsigned __int16 *)a4 count:(unint64_t)a5
{
  NSObject *v5;
  void *v6;
  const void **v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  vImage_Buffer dest;
  vImage_Buffer src;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  src.data = (void *)a3;
  src.height = 1;
  src.width = a5;
  src.rowBytes = 4 * a5;
  dest.data = a4;
  dest.height = 1;
  dest.width = a5;
  dest.rowBytes = 2 * a5;
  if (vImageConvert_FTo16U(&src, &dest, 0.0, 0.000015259, 0))
  {
    NUAssertLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad float to fixed 16 conversion"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v7 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        v20 = 2114;
        v21 = v15;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
}

+ (void)convertFixed16:(const unsigned __int16 *)a3 toFloat:(float *)a4 count:(unint64_t)a5
{
  NSObject *v5;
  void *v6;
  const void **v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  vImage_Buffer dest;
  vImage_Buffer src;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  src.data = (void *)a3;
  src.height = 1;
  src.width = a5;
  src.rowBytes = 2 * a5;
  dest.data = a4;
  dest.height = 1;
  dest.width = a5;
  dest.rowBytes = 4 * a5;
  if (vImageConvert_16UToF(&src, &dest, 0.0, 0.000015259, 0))
  {
    NUAssertLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad fixed 16 to float conversion"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v7 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        v20 = 2114;
        v21 = v15;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  size_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v66;
  _OWORD v67[26];
  _QWORD v68[2];
  __int128 v69;
  _QWORD v70[2];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "format");
  if (v11 != *MEMORY[0x1E0C9E078])
    __assert_rtn("+[PIApertureRedEyeProcessorKernel processWithInputs:arguments:output:error:]", "PIApertureRedEyeFilter.mm", 88, "output.format == kCIFormatRGBAf");
  v12 = objc_retainAutorelease(v10);
  v13 = (void *)objc_msgSend(v12, "baseAddress");
  v14 = objc_msgSend(v12, "bytesPerRow");
  objc_msgSend(v12, "region");
  v16 = v15;
  objc_msgSend(v12, "region");
  bzero(v13, (unint64_t)(v17 * 16.0 + (double)v14 * (v16 + -1.0)));
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAf");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v9;
  v64 = v8;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Sensitivity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  v90 = 0u;
  v91 = 0u;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ROI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "CGRectValue");
  NUPixelRectFromCGRect();

  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "bytesPerRow", v22);
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v22, "region");
  NUPixelRectFromCGRect();
  v24 = objc_retainAutorelease(v22);
  v25 = objc_msgSend(v24, "baseAddress");
  v26 = NUMaxY();
  v96 = 0u;
  v97 = 0u;
  v59 = NUMaxY();
  v94 = 0u;
  v95 = 0u;
  v58 = NUMinX();
  v92 = 0u;
  v93 = 0u;
  v57 = NUMinX();
  v98 = 0u;
  v99 = 0u;
  objc_msgSend(v12, "region");
  NUPixelRectFromCGRect();
  v27 = v25;
  v60 = v24;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v28 = 16 * NUWidth();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", NUHeight() * v28);
  v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = objc_msgSend(v62, "mutableBytes");
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v30 = 8 * NUWidth();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", NUHeight() * v30);
  v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v61, "mutableBytes");
  v78 = 0u;
  v79 = 0u;
  v32 = NUWidth();
  v76 = 0u;
  v77 = 0u;
  v33 = NUHeight();
  if (v32)
  {
    v34 = v33;
    if (v33)
    {
      v35 = (char *)(v27 + (v26 - v59) * v23 + 16 * (v58 - v57));
      v36 = 16 * v32;
      v37 = (char *)v29;
      do
      {
        memcpy(v37, v35, v36);
        v35 += v23;
        v37 += v28;
        --v34;
      }
      while (v34);
    }
  }
  v74 = v90;
  v75 = v91;
  v38 = NUWidth();
  v72 = v90;
  v73 = v91;
  v39 = 4 * v38 * NUHeight();
  objc_msgSend(a1, "convertFloat:toFixed16:count:", v29, v31, v39);
  v40 = objc_alloc(MEMORY[0x1E0D521D0]);
  objc_msgSend(MEMORY[0x1E0D52220], "RGBA16");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithSize:format:rowBytes:mutableBytes:", v91, v41, v30, v31);

  fixRedeye(v42, fmax(fmin(v20, 1.0), 0.01));
  objc_msgSend(a1, "convertFixed16:toFloat:count:", v31, v29, v39);
  objc_msgSend(MEMORY[0x1E0D52068], "genericRGBLinearColorSpace");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_alloc(MEMORY[0x1E0D52010]);
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52008]), "initWithSize:format:rowBytes:bytes:", v91, v66, v28, v29);
  v70[1] = 0;
  v70[0] = 0;
  v71 = v91;
  objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", v70);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v44, "initWithBuffer:colorSpace:validRegion:", v45, v43, v46);

  v48 = objc_alloc(MEMORY[0x1E0D521D8]);
  v49 = objc_alloc(MEMORY[0x1E0D521D0]);
  v50 = v99;
  v51 = objc_msgSend(v12, "bytesPerRow");
  v52 = objc_retainAutorelease(v12);
  v53 = (void *)objc_msgSend(v49, "initWithSize:format:rowBytes:mutableBytes:", v50, v66, v51, objc_msgSend(v52, "baseAddress"));
  v68[1] = 0;
  v68[0] = 0;
  v69 = v99;
  objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", v68);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v48, "initWithMutableBuffer:colorSpace:validRegion:", v53, v43, v54);

  v96 = 0u;
  v97 = 0u;
  v67[24] = v98;
  v67[25] = v99;
  v67[22] = v90;
  v67[23] = v91;
  NUPixelRectIntersection();
  v94 = 0u;
  v95 = 0u;
  v67[20] = v96;
  v67[21] = v97;
  v67[18] = v96;
  v67[19] = v97;
  NUMinX();
  v67[16] = v90;
  v67[17] = v91;
  NUMinX();
  v67[14] = v90;
  v67[15] = v91;
  NUMaxY();
  v67[12] = v96;
  v67[13] = v97;
  NUMaxY();
  NUPixelRectSetOrigin();
  v67[10] = v96;
  v67[11] = v97;
  v67[8] = v96;
  v67[9] = v97;
  NUMinX();
  v67[6] = v98;
  v67[7] = v99;
  NUMinX();
  v67[4] = v98;
  v67[5] = v99;
  NUMaxY();
  v67[2] = v96;
  v67[3] = v97;
  NUMaxY();
  NUPixelRectSetOrigin();
  v67[0] = v94;
  v67[1] = v95;
  objc_msgSend(MEMORY[0x1E0D52188], "copyPixelsFromImage:srcRect:destImage:destOrigin:", v47, v67, v55, v92);

  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("ROI"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E0C9E078];
}

+ (int)outputFormat
{
  return *MEMORY[0x1E0C9E078];
}

@end

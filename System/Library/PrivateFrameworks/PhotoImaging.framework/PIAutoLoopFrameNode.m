@implementation PIAutoLoopFrameNode

- ($0AC6E346AE4835514AAA8AC86D8F4844)videoScale
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("videoScale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NUScaleFromValue();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)_evaluateImageProperties:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NURenderNode inputs](self, "inputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageProperties:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _OWORD v31[2];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_9228();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9228();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v26;
        v35 = 2114;
        v36 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("primary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  objc_msgSend(v6, "outputImageGeometry:", &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  if (v7)
  {
    v9 = objc_msgSend(v7, "orientation");
    v10 = objc_msgSend(v7, "renderScale");
    v12 = v11;
    -[PIAutoLoopFrameNode videoScale](self, "videoScale");
    -[NURenderNode settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PIAutoLoopRecipeComputeOutputGeometry(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0D52170]);
    if (v14)
      objc_msgSend(v14, "extent");
    else
      memset(v31, 0, sizeof(v31));
    v16 = (void *)objc_msgSend(v15, "initWithExtent:renderScale:orientation:", v31, v10, v12, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get input geometry"), self, v8);
    v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
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
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  int v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v72;
  void *v73;
  const void **v74;
  void *specific;
  NSObject *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[3];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_9228();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v93 = v73;
      _os_log_error_impl(&dword_1A6382000, v72, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v74 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_9228();
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v77)
      {
        v80 = dispatch_get_specific(*v74);
        v81 = (void *)MEMORY[0x1E0CB3978];
        v82 = v80;
        objc_msgSend(v81, "callStackSymbols");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "componentsJoinedByString:", CFSTR("\n"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v80;
        v94 = 2114;
        v95 = v84;
        _os_log_error_impl(&dword_1A6382000, v76, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v77)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "componentsJoinedByString:", CFSTR("\n"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v93 = v79;
      _os_log_error_impl(&dword_1A6382000, v76, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NURenderNode settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cleanAperture"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("x"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("y"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("w"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("h"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("loopRecipe_stabCropRect"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("origin_x"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("origin_y"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v25 = v24;

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("width"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v28 = v27;

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("height"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  v31 = v30;

  -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = v9;
    v34 = v12;
    v35 = v15;
    v36 = v18;
    v37 = v22;
    v38 = v25;
    v39 = v28;
    v40 = v31;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("loopFrameData_frameTransforms"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "count") == 1)
    {
      -[NURenderNode inputs](self, "inputs");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("primary"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "outputImage:", a3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[PIAutoLoopFrameNode _processImage:cleanRect:cropRect:transform:geometry:](self, "_processImage:cleanRect:cropRect:transform:geometry:", v44, v45, v32, v33, v34, v35, v36, v37, v38, v39, v40);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v46)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 7, CFSTR("Could not produce the output image from input"), v44);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v46 = 0;
      }

    }
    else
    {
      if (objc_msgSend(v41, "count") != 2)
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid frame instruction"), v5);
        v46 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

        goto LABEL_28;
      }
      -[NURenderNode inputs](self, "inputs");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("primary"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend(v43, "outputImage:", a3);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if (v90)
        {
          -[NURenderNode inputs](self, "inputs");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("secondary"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v49;
          if (v49)
          {
            objc_msgSend(v49, "outputImage:", a3);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              v87 = v50;
              objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[PIAutoLoopFrameNode _processImage:cleanRect:cropRect:transform:geometry:](self, "_processImage:cleanRect:cropRect:transform:geometry:", v90, v52, v32, v33, v34, v35, v36, v37, v38, v39, v40);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v51;
              -[PIAutoLoopFrameNode _processImage:cleanRect:cropRect:transform:geometry:](self, "_processImage:cleanRect:cropRect:transform:geometry:", v51, v53, v32, v33, v34, v35, v36, v37, v38, v39, v40);
              v54 = objc_claimAutoreleasedReturnValue();

              +[PIAutoLoopKernels alphaCompositingKernel](PIAutoLoopKernels, "alphaCompositingKernel");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("frameTransform_blend_alpha"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "floatValue");
              v58 = v57;

              objc_msgSend(v89, "extent");
              v60 = v59;
              v62 = v61;
              v64 = v63;
              v66 = v65;
              v91[0] = v89;
              v91[1] = v54;
              v85 = (void *)v54;
              LODWORD(v59) = v58;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v91[2] = v67;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "applyWithExtent:arguments:", v68, v60, v62, v64, v66);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v46)
              {
                objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 7, CFSTR("Could not produce the output image from input"), v90);
                *a3 = (id)objc_claimAutoreleasedReturnValue();
              }

              v51 = v86;
              v50 = v87;
            }
            else
            {
              v46 = 0;
            }

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:", 3, CFSTR("missing secondary input"), v5);
            v46 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v46 = 0;
        }

      }
      else
      {
        v69 = (void *)MEMORY[0x1E0D520A0];
        -[NURenderNode description](self, "description");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "errorWithCode:reason:object:", 3, CFSTR("missing primary input"), v70);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v46 = 0;
      }
    }

    goto LABEL_27;
  }
  v46 = 0;
LABEL_28:

  return v46;
}

- (id)_processImage:(id)a3 cleanRect:(CGRect)a4 cropRect:(CGRect)a5 transform:(id)a6 geometry:(id)a7
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int32 v30;
  void *v31;
  __int32 v32;
  void *v33;
  __int32 v34;
  void *v35;
  __int32 v36;
  void *v37;
  __int32 v38;
  void *v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  __int32 v43;
  float v44;
  float v45;
  float32x4_t v46;
  int32x4_t v47;
  float v48;
  float32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  __int32 v69;
  __int32 v70;
  __int32 v71;
  __int32 v72;
  float64x2_t v73;
  __int32 v74;
  float64x2_t v75;
  void *v76;
  id v77;
  double v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float64x2_t v85;
  CGAffineTransform v86;
  CGAffineTransform v87;
  _QWORD v88[4];
  _QWORD v89[6];

  v89[4] = *MEMORY[0x1E0C80C00];
  v77 = a7;
  v10 = a6;
  v11 = a3;
  -[PIAutoLoopFrameNode videoScale](self, "videoScale");
  objc_msgSend(v77, "renderScale");
  NUScaleDivide();
  NUScaleToDouble();
  v78 = v12;
  NUScaleRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v11, "imageByCroppingToRect:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeTranslation(&v87, -v14, -v16);
  objc_msgSend(v21, "imageByApplyingTransform:", &v87);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("frameTransform_homography"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v83.i64[0] = v24;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v81.i64[0] = v26;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v79.i64[0] = v28;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  v74 = v30;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v72 = v32;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v71 = v34;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  v70 = v36;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "floatValue");
  v69 = v38;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");
  v40 = v83;
  v40.i32[1] = v74;
  v40.i32[2] = v70;
  v84 = v40;
  v41 = v81;
  v41.i32[1] = v72;
  v41.i32[2] = v69;
  v82 = v41;
  v42 = v79;
  v42.i32[1] = v71;
  v42.i32[2] = v43;
  v80 = v42;

  v44 = 0.0 / v78;
  v45 = v20 / v78;
  v46 = vmulq_n_f32(v84, v44);
  v47 = (int32x4_t)vaddq_f32(vmlaq_n_f32(v46, v82, v45), v80);
  v48 = v18 / v78;
  v49 = vmulq_n_f32(v84, v48);
  v50 = (int32x4_t)vaddq_f32(vmlaq_n_f32(v49, v82, v45), v80);
  v51 = (int32x4_t)vaddq_f32(vmlaq_n_f32(v46, v82, v44), v80);
  v73 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v50.i8, (float32x2_t)vdup_laneq_s32(v50, 2))), v78);
  v75 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v51.i8, (float32x2_t)vdup_laneq_s32(v51, 2))), v78);
  v52 = (int32x4_t)vaddq_f32(vmlaq_n_f32(v49, v82, v44), v80);
  v85 = vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v52.i8, (float32x2_t)vdup_laneq_s32(v52, 2))), v78);
  v88[0] = CFSTR("inputTopLeft");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", vmulq_n_f64(vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v47.i8, (float32x2_t)vdup_laneq_s32(v47, 2))), v78));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v53;
  v88[1] = CFSTR("inputTopRight");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", *(_OWORD *)&v73);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v54;
  v88[2] = CFSTR("inputBottomLeft");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", *(_OWORD *)&v75);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v55;
  v88[3] = CFSTR("inputBottomRight");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", *(_OWORD *)&v85);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v56;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPerspectiveTransform"), v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  NUScaleRect();
  v60 = v59;
  v62 = v61;
  v63 = objc_msgSend(v77, "scaledSize");
  v65 = v64;

  objc_msgSend(v58, "imageByCroppingToRect:", v60, v62, (double)v63, (double)v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeTranslation(&v86, -v60, -v62);
  objc_msgSend(v66, "imageByApplyingTransform:", &v86);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

@end

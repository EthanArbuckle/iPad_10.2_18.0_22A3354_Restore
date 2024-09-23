@implementation PISemanticStyleProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  id v41;
  void *v42;
  unsigned int v43;
  CGFloat x;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  char v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  unsigned int v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  char v85;
  _QWORD v86[4];
  id v87;
  id v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("useStyleEngine"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("useLightMap"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v56 = v13;
  if (v13)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 8);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v14;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("extents"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "CGRectValue");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  objc_msgSend(v10, "region");
  v95.origin.x = v19;
  v95.origin.y = v21;
  v95.size.width = v23;
  v95.size.height = v25;
  v94 = CGRectIntersection(v93, v95);
  x = v94.origin.x;
  y = v94.origin.y;
  width = v94.size.width;
  height = v94.size.height;
  v29 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __69__PISemanticStyleProcessor_processWithInputs_arguments_output_error___block_invoke;
  v86[3] = &unk_1E50189E0;
  v87 = v8;
  v88 = v16;
  v89 = v19;
  v90 = v21;
  v91 = v23;
  v92 = v25;
  v61 = v16;
  v60 = v8;
  v30 = (void *)MEMORY[0x1A85C0174](v86);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("stats"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
    v32 = 2;
  else
    v32 = 3;
  v43 = v32;
  objc_msgSend(v10, "metalCommandBuffer", v10);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commandQueue");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v29;
  v64[1] = 3221225472;
  v64[2] = __69__PISemanticStyleProcessor_processWithInputs_arguments_output_error___block_invoke_2;
  v64[3] = &unk_1E5018A08;
  v77 = v19;
  v78 = v21;
  v79 = v23;
  v80 = v25;
  v81 = x;
  v82 = y;
  v83 = width;
  v84 = height;
  v65 = v10;
  v66 = v62;
  v67 = v59;
  v68 = v58;
  v69 = v54;
  v70 = v53;
  v71 = v51;
  v72 = v9;
  v85 = v56;
  v73 = v15;
  v74 = v46;
  v75 = v48;
  v76 = v30;
  v49 = v48;
  v47 = v46;
  v57 = v15;
  v45 = v9;
  v52 = v51;
  v33 = v53;
  v55 = v54;
  v34 = v58;
  v35 = v59;
  v36 = v30;
  v37 = v62;
  v38 = v41;
  v39 = +[PISemanticStyleRenderer usingSharedSemanticStyleRendererWithMetalCommandQueue:processingType:useStyleEngine:perform:](PISemanticStyleRenderer, "usingSharedSemanticStyleRendererWithMetalCommandQueue:processingType:useStyleEngine:perform:", v42, v43, v63, v64);

  return v39;
}

+ (int)formatForInputAtIndex:(int)a3
{
  NSObject *v4;
  void *v5;
  const void **v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  SEL v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 < 9)
    return **((_DWORD **)&unk_1E5018A70 + a3);
  v19 = *(_QWORD *)&a3;
  NUAssertLogger_16179();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid index %d"), v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v6 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_16179();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v9)
    {
      v12 = dispatch_get_specific(*v6);
      v13 = (void *)MEMORY[0x1E0CB3978];
      v14 = v12;
      objc_msgSend(v13, "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2114;
      v23 = v16;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v11;
    _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v17 = (void *)_NUAssertFailHandler();
  return +[PISemanticStyleProcessor outputFormat](v17, v18);
}

+ (int)outputFormat
{
  return *MEMORY[0x1E0C9E080];
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

+ (BOOL)allowCompressedInputsAndOutputs
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat x;
  double v13;
  CGFloat y;
  double v15;
  CGFloat width;
  double v17;
  CGFloat height;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  if (a3)
  {
    v6 = a3;
    v7 = a4;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("useLightMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    x = v11;
    y = v13;
    width = v15;
    height = v17;

    if ((a3 - 6) >= 3)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGRectValue");

      NUCGRectConvertFromRectToRect();
      x = v20;
      y = v21;
      width = v22;
      height = v23;
    }

  }
  else
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "roiForInput:arguments:outputRect:", *(_QWORD *)&a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

double __69__PISemanticStyleProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "region");

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;

  if (a2 != 4)
  {
    NUPixelRectFromCGRect();
    NUPixelRectScale();
    NUPixelRectToCGRect();
    NURectFlipYOrigin();
    return v8;
  }
  return v7;
}

BOOL __69__PISemanticStyleProcessor_processWithInputs_arguments_output_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  id v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  _DWORD v41[2];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setLogicalImageSize:", *(double *)(a1 + 144), *(double *)(a1 + 152));
  NURectFlipYOrigin();
  objc_msgSend(v3, "setRenderRegionRect:");
  objc_msgSend(*(id *)(a1 + 32), "metalTexture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOutputImageTexture:", v4);

  objc_msgSend(*(id *)(a1 + 32), "region");
  NURectFlipYOrigin();
  objc_msgSend(v3, "setOutputImageTextureMappedRegion:");
  objc_msgSend(*(id *)(a1 + 40), "metalTexture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputImageTexture:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputImageTextureMappedRegion:");
  objc_msgSend(*(id *)(a1 + 48), "metalTexture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputLinearImageTexture:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputLinearImageTextureMappedRegion:");
  objc_msgSend(*(id *)(a1 + 56), "metalTexture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputGainMapTexture:", v7);

  objc_msgSend(*(id *)(a1 + 64), "metalTexture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputPersonMaskTexture:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputPersonMaskTextureMappedRegion:");
  objc_msgSend(*(id *)(a1 + 72), "metalTexture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputSkinMaskTexture:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputSkinMaskTextureMappedRegion:");
  objc_msgSend(*(id *)(a1 + 80), "metalTexture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputSkyMaskTexture:", v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
  objc_msgSend(v3, "setInputSkyMaskTextureMappedRegion:");
  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("sceneType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSemanticStyleSceneType:", objc_msgSend(v11, "intValue"));

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("srlCurveParameter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v3, "setInputSRLCurveParameter:");

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("brightnessValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBrightnessValue:", v13);

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("tuningType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTuningParameterVariant:", v14);

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("baseGain"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  objc_msgSend(v3, "setInputLinearBaseGain:");

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("faceBasedGlobalExposureBoostRatio"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  objc_msgSend(v3, "setFaceBasedGlobalExposureBoostRatio:");

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("cast"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PISemanticStyleCastToMakerNoteString(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("intensity"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("tone"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23;

  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("color"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v27 = v26;

  v28 = objc_alloc(MEMORY[0x1E0D08AD8]);
  LODWORD(v29) = v21;
  LODWORD(v30) = v24;
  LODWORD(v31) = v27;
  v32 = (void *)objc_msgSend(v28, "initWithCastType:castIntensity:toneBias:colorBias:", v18, v29, v30, v31);
  objc_msgSend(v3, "setInputStyle:", v32);
  if (*(_BYTE *)(a1 + 192))
  {
    objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("stats"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInputStatisticsByStatsType:", v33);

    objc_msgSend(*(id *)(a1 + 96), "metalTexture");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInputSmallLightMapTexture:", v34);

    objc_msgSend(*(id *)(a1 + 104), "metalTexture");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInputSmallLinearLightMapTexture:", v35);

  }
  objc_msgSend(*(id *)(a1 + 88), "objectForKeyedSubscript:", CFSTR("baselineExposure"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  objc_msgSend(v3, "setBaselineExposure:");

  objc_msgSend(*(id *)(a1 + 112), "metalTexture");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputGlobalToneCurveTexture:", v37);

  v38 = objc_msgSend(v3, "process");
  if (v38)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_338);
    v39 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v41[0] = 67109120;
      v41[1] = v38;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "PISemanticStyleProcessor: process failed with error %d", (uint8_t *)v41, 8u);
    }
  }

  return v38 == 0;
}

@end

@implementation PIPortraitAutoCalculator

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const void **v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_20449();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        v31 = 2114;
        v32 = v25;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0D52180]);
  -[NURenderRequest composition](self, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithComposition:", v7);

  -[NURenderRequest responseQueue](self, "responseQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResponseQueue:", v9);

  objc_msgSend(v8, "setName:", CFSTR("PIPortraitAutoCalculator-getValuesAtCapture-imageProperties"));
  objc_msgSend(MEMORY[0x1E0D52260], "stopAtTagFilter:", CFSTR("pre-Adjustments"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPipelineFilters:", v11);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __35__PIPortraitAutoCalculator_submit___block_invoke;
  v26[3] = &unk_1E5019E90;
  v26[4] = self;
  v27 = v5;
  v12 = v5;
  objc_msgSend(v8, "submit:", v26);

}

- (void)_calculateWithImageProperties:(id)a3 valuesAtCapture:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NURenderRequest composition](self, "composition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("orientation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");
  if (v14 <= 1)
    v15 = 1;
  else
    v15 = v14;
  v16 = v15;

  +[PIFaceObservationCache faceRequestWithRequest:](PIFaceObservationCache, "faceRequestWithRequest:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest responseQueue](self, "responseQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setResponseQueue:", v18);

  objc_msgSend(v17, "setName:", CFSTR("PIPortraitAutoCalculator-faceDetect"));
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __85__PIPortraitAutoCalculator__calculateWithImageProperties_valuesAtCapture_completion___block_invoke;
  v28 = &unk_1E5019A20;
  v29 = v8;
  v30 = v9;
  v31 = v10;
  v32 = v16;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  v22 = (void *)MEMORY[0x1A85C0174](&v25);
  -[PIPortraitAutoCalculator faceObservationCache](self, "faceObservationCache", v25, v26, v27, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PIPortraitAutoCalculator faceObservationCache](self, "faceObservationCache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "submit:response:", v17, v22);

  }
  else
  {
    objc_msgSend(v17, "submit:", v22);
  }

}

- (PIFaceObservationCache)faceObservationCache
{
  return self->_faceObservationCache;
}

- (void)setFaceObservationCache:(id)a3
{
  objc_storeStrong((id *)&self->_faceObservationCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceObservationCache, 0);
}

void __85__PIPortraitAutoCalculator__calculateWithImageProperties_valuesAtCapture_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = 0;
  objc_msgSend(a2, "result:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v3)
  {
    objc_msgSend(v3, "faces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIPortraitAutoCalculator portraitInfoDictionaryFromFaceObservations:metadata:orientation:valuesAtCapture:](PIPortraitAutoCalculator, "portraitInfoDictionaryFromFaceObservations:metadata:orientation:valuesAtCapture:", v5, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    v4 = (id)v8;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
  }

}

void __35__PIPortraitAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[10];
  _QWORD v45[12];

  v45[10] = *MEMORY[0x1E0C80C00];
  v43 = 0;
  objc_msgSend(a2, "result:", &v43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v43;
  if (v3)
  {
    objc_msgSend(v3, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    +[PIValuesAtCapture valuesAtCaptureFromImageProperties:error:](PIValuesAtCapture, "valuesAtCaptureFromImageProperties:error:", v5, &v42);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v42;

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "composition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("depthEffect"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "composition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("portraitEffect"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("depthInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("portraitInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        && (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("focusRect")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v14,
            v14)
        && v13)
      {
        v41 = v13;
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("capturedAperture"));
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v40 = (void *)v15;
        }
        else
        {
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "aperture");
          objc_msgSend(v19, "numberWithFloat:");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v12, "mutableCopy");
          v40 = (void *)v20;
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("capturedAperture"));

          v12 = v21;
        }
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("capturedPortraitStrength"));
        v22 = objc_claimAutoreleasedReturnValue();
        v37 = v11;
        if (v22)
        {
          v39 = (void *)v22;
        }
        else
        {
          v23 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "portraitStrength");
          objc_msgSend(v23, "numberWithFloat:");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v41, "mutableCopy");
          v39 = (void *)v24;
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("capturedPortraitStrength"));

          v41 = v25;
        }
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("focusRect"));
        v26 = objc_claimAutoreleasedReturnValue();
        v35 = +[PIPortraitAutoCalculator isStillImageDisparity:](PIPortraitAutoCalculator, "isStillImageDisparity:", v6);
        v38 = v7;
        v27 = (unint64_t)objc_msgSend(v6, "portraitMajorVersion") >= 2
           && objc_msgSend(v6, "portraitMinorVersion") != 0;
        v44[0] = CFSTR("depthInfo");
        v44[1] = CFSTR("aperture");
        v45[0] = v12;
        v45[1] = v40;
        v44[2] = CFSTR("focusRect");
        v44[3] = CFSTR("portraitInfo");
        v36 = (void *)v26;
        v45[2] = v26;
        v45[3] = v41;
        v45[4] = v39;
        v44[4] = CFSTR("portraitStrength");
        v44[5] = CFSTR("spillMatteAllowed");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v45[5] = v34;
        v44[6] = CFSTR("glassesMatteAllowed");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v45[6] = v33;
        v44[7] = CFSTR("capturedPortraitMajorVersion");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "portraitMajorVersion"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v45[7] = v28;
        v44[8] = CFSTR("capturedPortraitMinorVersion");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "portraitMinorVersion"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v45[8] = v29;
        v44[9] = CFSTR("portraitDisableStage");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v45[9] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 10);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v41;
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v31);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        v11 = v37;
        v7 = v38;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_calculateWithImageProperties:valuesAtCapture:completion:", v5, v6, *(_QWORD *)(a1 + 40));
      }

    }
    else
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = objc_alloc(MEMORY[0x1E0D522A0]);
      v9 = (void *)objc_msgSend(v18, "initWithResult:", MEMORY[0x1E0C9AA70]);
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v9);
    }

    v4 = v7;
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 40);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v5);
  }

}

+ (id)focusRectDictionaryFromMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  BOOL v36;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
    v10 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v4;
      _os_log_impl(&dword_1A6382000, v10, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - Metadata dictionary missing fullSizeWith or fullSizeHeight:\n%@", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCA28]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Regions"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAC8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v53 = a1;
          v54 = v13;
          v55 = v16;
          v56 = v15;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v18 = v16;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v58;
            v22 = *MEMORY[0x1E0CBCAD0];
            v23 = *MEMORY[0x1E0CBCAB8];
LABEL_16:
            v24 = 0;
            while (1)
            {
              if (*(_QWORD *)v58 != v21)
                objc_enumerationMutation(v18);
              v25 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v24);
              objc_msgSend(v25, "objectForKeyedSubscript:", v22, v53);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "isEqualToString:", v23);

              if ((v27 & 1) != 0)
                break;
              if (v20 == ++v24)
              {
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
                if (v20)
                  goto LABEL_16;
                goto LABEL_22;
              }
            }
            v30 = v25;

            if (!v30)
              goto LABEL_50;
            objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAE0]);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAE8]);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAD8]);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAC0]);
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = (void *)v34;
            if (v31)
              v36 = v32 == 0;
            else
              v36 = 1;
            if (v36 || v33 == 0 || v34 == 0)
            {
              if (*MEMORY[0x1E0D52390] != -1)
                dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
              v13 = v54;
              v39 = *MEMORY[0x1E0D52398];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v63 = v30;
                _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Cant get focusRect - Malformed focus rect dictionary:\n%@", buf, 0xCu);
              }
              v11 = 0;
            }
            else
            {
              objc_msgSend(v31, "floatValue");
              v43 = v42;
              objc_msgSend(v32, "floatValue");
              v45 = v44;
              objc_msgSend(v33, "floatValue");
              v47 = v46;
              objc_msgSend(v35, "floatValue");
              v49 = v48;
              v50 = v43 - (float)(v47 * 0.5);
              v51 = v45 - (float)(v48 * 0.5);
              if (v50 < 0.0 && NUIsRoughlyEqual())
                v50 = 0.0;
              v13 = v54;
              if (v51 < 0.0 && NUIsRoughlyEqual())
                v51 = 0.0;
              objc_msgSend(v53, "focusRectDictionaryFromRect:", v50, v51, v47, v49);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v15 = v56;
          }
          else
          {
LABEL_22:

LABEL_50:
            if (*MEMORY[0x1E0D52390] != -1)
              dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
            v13 = v54;
            v15 = v56;
            v40 = *MEMORY[0x1E0D52398];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v18;
              _os_log_impl(&dword_1A6382000, v40, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - Region list does not contain a focus rect:\n%@", buf, 0xCu);
            }
            v11 = 0;
          }
          v17 = v55;
        }
        else
        {
          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
          v41 = *MEMORY[0x1E0D52398];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v15;
            _os_log_impl(&dword_1A6382000, v41, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - MWG region dictionary missing region list:\n%@", buf, 0xCu);
          }
          v11 = 0;
        }

      }
      else
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
        v29 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v13;
          _os_log_impl(&dword_1A6382000, v29, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - Exif aux dictionary missing MWG region dictionary:\n%@", buf, 0xCu);
        }
        v11 = 0;
      }

    }
    else
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
      v28 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v4;
        _os_log_impl(&dword_1A6382000, v28, OS_LOG_TYPE_DEFAULT, "Cant get focusRect - Metadata dictionary missing exif aux dictionary:\n%@", buf, 0xCu);
      }
      v11 = 0;
    }

  }
  return v11;
}

+ (id)focusRectDictionaryFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  _QWORD v24[4];
  _QWORD v25[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25[4] = *MEMORY[0x1E0C80C00];
  v7 = a3.origin.x < 0.0 || a3.origin.x > 1.0;
  if (v7
    || (a3.origin.y >= 0.0 ? (v8 = a3.origin.y > 1.0) : (v8 = 1),
        v8
     || a3.size.width <= 0.0
     || !NUIsRoughlyLessThan()
     || height <= 0.0
     || !NUIsRoughlyLessThan()))
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
    v14 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v16 = 134218752;
      v17 = x;
      v18 = 2048;
      v19 = y;
      v20 = 2048;
      v21 = width;
      v22 = 2048;
      v23 = height;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Invalid focus rect: {%g,%g,%g,%g}", (uint8_t *)&v16, 0x2Au);
    }
    v13 = 0;
  }
  else
  {
    v24[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    v24[1] = CFSTR("y");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(1.0 - y - height, 0.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    v24[2] = CFSTR("w");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v11;
    v24[3] = CFSTR("h");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (BOOL)isStillImageDisparity:(id)a3
{
  return (((unint64_t)objc_msgSend(a3, "depthVersionInfo") >> 32) - 30000) >> 4 < 0x271;
}

+ (BOOL)canApplyPortraitEffectsWithMetadata:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5 & 1;
}

+ (id)portraitInfoDictionaryFromFaceObservations:(id)a3 metadata:(id)a4 orientation:(int64_t)a5 valuesAtCapture:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _BOOL8 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v31;
  const void **v32;
  const void **v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  NSObject *v38;
  const void **v39;
  void *v40;
  int v41;
  void *v42;
  NSObject *v43;
  const void **v44;
  void *v45;
  int v46;
  void *v47;
  const void **v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint8_t buf[4];
  const void **v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v10)
  {
    NUAssertLogger_20449();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "faceObservations != nil");
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v49 = dispatch_get_specific(*v33);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v33 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = (const void **)v49;
        v64 = 2114;
        v65 = v52;
        _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v33;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v41 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  if (!v11)
  {
    NUAssertLogger_20449();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "metadata != nil");
      v39 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v39;
      _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = (const void **)MEMORY[0x1E0D51D48];
    v40 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
    v35 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (!v40)
    {
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v33;
        _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_31:

      v46 = _NUAssertFailHandler();
      goto LABEL_32;
    }
LABEL_29:
    if (v41)
    {
      v53 = dispatch_get_specific(*v33);
      v54 = (void *)MEMORY[0x1E0CB3978];
      v55 = v53;
      objc_msgSend(v54, "callStackSymbols");
      v33 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = (const void **)v53;
      v64 = 2114;
      v65 = v56;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_31;
  }
  v13 = v12;
  if ((NUOrientationIsValid() & 1) == 0)
  {
    NUAssertLogger_20449();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUOrientationIsValid(orientation)");
      v44 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v44;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = (const void **)MEMORY[0x1E0D51D48];
    v45 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
    v35 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (!v45)
    {
      if (v46)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v48;
        _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_34;
    }
LABEL_32:
    if (v46)
    {
      v57 = dispatch_get_specific(*v33);
      v58 = (void *)MEMORY[0x1E0CB3978];
      v59 = v57;
      objc_msgSend(v58, "callStackSymbols");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = (const void **)v57;
      v64 = 2114;
      v65 = v61;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_34:

    _NUAssertFailHandler();
  }
  if (objc_msgSend(a1, "canApplyPortraitEffectsWithMetadata:", v11))
  {
    objc_msgSend(a1, "portraitEffectInfoDictionaryFromFaceObservations:orientation:valuesAtCapture:", v10, a5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA70];
  }
  v15 = +[PIPortraitAutoCalculator isStillImageDisparity:](PIPortraitAutoCalculator, "isStillImageDisparity:", v13);
  v16 = (unint64_t)objc_msgSend(v13, "portraitMajorVersion") >= 2
     && objc_msgSend(v13, "portraitMinorVersion") != 0;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "depthEffectInfoDictionaryFromFaceObservations:metadata:orientation:valuesAtCapture:", v10, v11, a5, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("depthInfo"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "aperture");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("aperture"));

  objc_msgSend(v13, "focusRect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("focusRect"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("portraitInfo"));
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "portraitStrength");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("portraitStrength"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("spillMatteAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("glassesMatteAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("portraitDisableStage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "portraitMajorVersion"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, CFSTR("capturedPortraitMajorVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "portraitMinorVersion"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, CFSTR("capturedPortraitMinorVersion"));

  return v17;
}

+ (id)depthEffectInfoDictionaryFromFaceObservations:(id)a3 metadata:(id)a4 orientation:(int64_t)a5 valuesAtCapture:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C89C98]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (v13)
    objc_msgSend(v13, "floatValue");
  else
    LODWORD(v14) = 1008981770;
  objc_msgSend(a1, "depthEffectInfoDictionaryFromFaceObservations:valuesAtCapture:lumaNoiseScale:orientation:", v10, v11, a5, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)depthEffectInfoDictionaryFromFaceObservations:(id)a3 valuesAtCapture:(id)a4 lumaNoiseScale:(float)a5 orientation:(int64_t)a6
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *specific;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  id v77;
  NSObject *log;
  id v79;
  id obj;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v77 = a4;
  v9 = NUOrientationInverse();
  v10 = v8;
  v11 = v10;
  if ((unint64_t)objc_msgSend(v10, "count") >= 5)
  {
    objc_msgSend(v10, "subarrayWithRange:", 0, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count", v10));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v11;
  v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  if (v83)
  {
    v81 = *(_QWORD *)v85;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v85 != v81)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "landmarks");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "boundingBox");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        objc_msgSend(v15, "leftEye");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        +[PIAutoCalculatorUtils averagePoints:pointCount:](PIAutoCalculatorUtils, "averagePoints:pointCount:", objc_msgSend(v24, "normalizedPoints"), objc_msgSend(v24, "pointCount"));
        +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v9);
        v26 = v25;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("leftEyeX"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v28, CFSTR("leftEyeY"));

        objc_msgSend(v15, "rightEye");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_retainAutorelease(v29);
        +[PIAutoCalculatorUtils averagePoints:pointCount:](PIAutoCalculatorUtils, "averagePoints:pointCount:", objc_msgSend(v30, "normalizedPoints"), objc_msgSend(v30, "pointCount"));
        +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v9);
        v32 = v31;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, CFSTR("rightEyeX"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("rightEyeY"));

        objc_msgSend(v15, "nose");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = objc_retainAutorelease(v35);
        +[PIAutoCalculatorUtils averagePoints:pointCount:](PIAutoCalculatorUtils, "averagePoints:pointCount:", objc_msgSend(v36, "normalizedPoints"), objc_msgSend(v36, "pointCount"));
        +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v9);
        v38 = v37;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v39, CFSTR("noseX"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v40, CFSTR("noseY"));

        objc_msgSend(v15, "allPoints");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v41, "pointCount") > 0x2E)
        {
          v42 = objc_msgSend(objc_retainAutorelease(v41), "normalizedPoints");
          +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v9, *(double *)(v42 + 736), *(double *)(v42 + 744), v17, v19, v21, v23);
          v44 = v43;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v45, CFSTR("chinX"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v46, CFSTR("chinY"));

          goto LABEL_24;
        }
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_303);
        v47 = (void *)*MEMORY[0x1E0D52380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
        {
          v48 = (void *)MEMORY[0x1E0CB3940];
          v49 = v47;
          objc_msgSend(v48, "stringWithFormat:", CFSTR("Insufficient number of landmark points"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v89 = v50;
          _os_log_impl(&dword_1A6382000, v49, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v51 = *MEMORY[0x1E0D52390];
        }
        else
        {
          v51 = -1;
        }
        if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
        {
          if (v51 != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_303);
          v52 = (void *)*MEMORY[0x1E0D52380];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
          v54 = (void *)MEMORY[0x1E0CB3978];
          v79 = specific;
          log = v52;
          objc_msgSend(v54, "callStackSymbols");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = specific;
          v90 = 2114;
          v91 = v56;
          v57 = log;
          _os_log_error_impl(&dword_1A6382000, log, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
        else
        {
          if (v51 != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_303);
          v58 = (void *)*MEMORY[0x1E0D52380];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          v59 = (void *)MEMORY[0x1E0CB3978];
          v57 = v58;
          objc_msgSend(v59, "callStackSymbols");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v89 = v61;
          _os_log_error_impl(&dword_1A6382000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
LABEL_23:
        _NUAssertContinueHandler();
LABEL_24:
        objc_msgSend(v82, "addObject:", v14);

        ++v12;
      }
      while (v83 != v12);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
      v83 = v62;
    }
    while (v62);
  }

  v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v77, "minimumAperture");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v64, CFSTR("minimumAperture"));

  objc_msgSend(v77, "maximumAperture");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v65, CFSTR("maximumAperture"));

  v66 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v77, "aperture");
  objc_msgSend(v66, "numberWithFloat:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v67, CFSTR("capturedAperture"));

  *(float *)&v68 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v69, CFSTR("lumaNoiseScale"));

  objc_msgSend(v77, "focusRect");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend(v77, "focusRect");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)objc_msgSend(v71, "copy");
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v72, CFSTR("focusRect"));

  }
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v82, CFSTR("faces"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v77, "SDOFRenderingVersion"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v73, CFSTR("SDOFRenderingVersion"));

  v74 = (void *)objc_msgSend(v63, "copy");
  return v74;
}

+ (id)portraitEffectInfoDictionaryFromFaceObservations:(id)a3 orientation:(int64_t)a4 valuesAtCapture:(id)a5
{
  id v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  double *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v47;
  void *v48;
  const void **v49;
  void *specific;
  NSObject *v51;
  _BOOL4 v52;
  NSObject *v53;
  void *v54;
  const void **v55;
  void *v56;
  _BOOL4 v57;
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
  id v70;
  id obj;
  uint64_t v72;
  int64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t i;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _BYTE v94[128];
  _QWORD v95[4];
  _QWORD v96[4];
  uint8_t v97[128];
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  void *v101;
  uint64_t v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v102 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v70 = a5;
  if (!v7)
  {
    NUAssertLogger_20449();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "faceObservations != nil");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v48;
      _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v49 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        v60 = dispatch_get_specific(*v49);
        v61 = (void *)MEMORY[0x1E0CB3978];
        v62 = v60;
        objc_msgSend(v61, "callStackSymbols");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v99 = v60;
        v100 = 2114;
        v101 = v64;
        _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v52)
    {
LABEL_35:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v59;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_41:

    _NUAssertFailHandler();
    __break(1u);
  }
  if ((NUOrientationIsValid() & 1) == 0)
  {
    NUAssertLogger_20449();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUOrientationIsValid(orientation)");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v99 = v54;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v55 = (const void **)MEMORY[0x1E0D51D48];
    v56 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
    v51 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (!v56)
    {
      if (!v57)
        goto LABEL_41;
      goto LABEL_35;
    }
    if (v57)
    {
      v65 = dispatch_get_specific(*v55);
      v66 = (void *)MEMORY[0x1E0CB3978];
      v67 = v65;
      objc_msgSend(v66, "callStackSymbols");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v99 = v65;
      v100 = 2114;
      v101 = v69;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_41;
  }
  v73 = a4;
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v7;
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
  if (v75)
  {
    v72 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v87 != v72)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v86 + 1) + 8 * i);
        objc_sync_enter(v8);
        v77 = v8;
        objc_msgSend(v8, "boundingBox");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 15);
        v95[0] = CFSTR("x");
        v103.origin.x = v10;
        v103.origin.y = v12;
        v103.size.width = v14;
        v103.size.height = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMinX(v103));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = v17;
        v95[1] = CFSTR("y");
        v104.origin.x = v10;
        v104.origin.y = v12;
        v104.size.width = v14;
        v104.size.height = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMinY(v104));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v96[1] = v18;
        v95[2] = CFSTR("w");
        v105.origin.x = v10;
        v105.origin.y = v12;
        v105.size.width = v14;
        v105.size.height = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetWidth(v105));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v96[2] = v19;
        v95[3] = CFSTR("h");
        v106.origin.x = v10;
        v106.origin.y = v12;
        v106.size.width = v14;
        v106.size.height = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetHeight(v106));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v96[3] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v21, CFSTR("faceBoundingBox"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v73);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v22, CFSTR("orientation"));

        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v77, "faceJunkinessIndex");
        objc_msgSend(v23, "numberWithFloat:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v24, CFSTR("faceJunkinessIndex"));

        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v77, "faceOrientationIndex");
        objc_msgSend(v25, "numberWithFloat:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v26, CFSTR("faceOrientationIndex"));

        objc_msgSend(v77, "roll");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v27, CFSTR("roll"));

        objc_msgSend(v77, "yaw");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v28, CFSTR("yaw"));

        objc_msgSend(v77, "landmarks");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v29 = objc_msgSend(&unk_1E5058F50, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
        if (v29)
        {
          v79 = *(_QWORD *)v83;
          do
          {
            v81 = v29;
            for (j = 0; j != v81; ++j)
            {
              if (*(_QWORD *)v83 != v79)
                objc_enumerationMutation(&unk_1E5058F50);
              v31 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
              objc_msgSend(v80, "valueForKey:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v32)
              {
                v34 = objc_msgSend(v32, "pointCount");
                v35 = objc_msgSend(objc_retainAutorelease(v33), "normalizedPoints");
                v36 = v35;
                if (v34)
                  v37 = v35 == 0;
                else
                  v37 = 1;
                if (!v37)
                {
                  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v34);
                  v39 = (double *)(v36 + 8);
                  do
                  {
                    v92[0] = CFSTR("x");
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(v39 - 1));
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v92[1] = CFSTR("y");
                    v93[0] = v40;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v39);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v93[1] = v41;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "addObject:", v42);

                    v39 += 2;
                    --v34;
                  }
                  while (v34);
                  objc_msgSend(v78, "setObject:forKeyedSubscript:", v38, v31);

                }
              }

            }
            v29 = objc_msgSend(&unk_1E5058F50, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
          }
          while (v29);
        }
        objc_msgSend(v74, "addObject:", v78);

        objc_sync_exit(v77);
      }
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
    }
    while (v75);
  }

  v90[0] = CFSTR("faceLandmarks");
  v90[1] = CFSTR("capturedPortraitStrength");
  v91[0] = v74;
  v43 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v70, "portraitStrength");
  objc_msgSend(v43, "numberWithFloat:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

+ (id)portraitInfoDictionaryFromCameraMetadata:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  float v15;
  int v16;
  int v17;
  float v18;
  int v19;
  int v20;
  unsigned int v21;
  PIValuesAtCapture *v22;
  int v23;
  int v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v43;
  NSObject *v44;
  const void **v45;
  void *specific;
  _BOOL4 v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  const char *v55;
  id v56;
  void *v57;
  void *v59;
  id v60;
  uint8_t buf[4];
  NSObject *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_20449();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "metadata != nil");
      v44 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v44;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v45 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
    v4 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v50 = dispatch_get_specific(*v45);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v50;
        v63 = 2114;
        v64 = v54;
        _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v49;
      _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v55 = "metadata != nil";
    _NUAssertFailHandler();
    __break(1u);
    goto LABEL_38;
  }
  v4 = v3;
  if (portraitInfoDictionaryFromCameraMetadata__onceToken != -1)
    dispatch_once(&portraitInfoDictionaryFromCameraMetadata__onceToken, &__block_literal_global_20597);
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = portraitInfoDictionaryFromCameraMetadata__s_expectedClasses;
  -[NSObject faceObservationsData](v4, "faceObservationsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v7, &v60);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v60;

  if (!v8)
  {
    if (*MEMORY[0x1E0D52390] == -1)
    {
LABEL_6:
      v9 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v4;
        v63 = 2112;
        v64 = v56;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Couldn't deserialize face observations from metadata: %@, assuming empty, error: %@.", buf, 0x16u);
      }
      v8 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_9;
    }
LABEL_38:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
    goto LABEL_6;
  }
LABEL_9:
  v10 = v8;
  -[NSObject indexesOfShallowDepthOfFieldObservations](v4, "indexesOfShallowDepthOfFieldObservations");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v59)
  {
    objc_msgSend(v10, "objectsAtIndexes:", v59);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (int)-[NSObject faceOrientation](v4, "faceOrientation", v55);
  if ((NUOrientationIsValid() & 1) != 0)
    goto LABEL_19;
  if (!objc_msgSend(v10, "count"))
  {
    v12 = 1;
LABEL_19:
    -[NSObject focusRectangle](v4, "focusRectangle");
    objc_msgSend(a1, "focusRectDictionaryFromRect:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject minimumApertureFocalRatio](v4, "minimumApertureFocalRatio");
    if (v15 <= 0.0)
    {
      v17 = 2143289344;
    }
    else
    {
      -[NSObject minimumApertureFocalRatio](v4, "minimumApertureFocalRatio");
      v17 = v16;
    }
    -[NSObject maximumApertureFocalRatio](v4, "maximumApertureFocalRatio");
    if (v18 <= 0.0)
    {
      v20 = 2143289344;
    }
    else
    {
      -[NSObject maximumApertureFocalRatio](v4, "maximumApertureFocalRatio");
      v20 = v19;
    }
    v21 = -[NSObject SDOFRenderingVersion](v4, "SDOFRenderingVersion");
    v22 = [PIValuesAtCapture alloc];
    -[NSObject apertureFocalRatio](v4, "apertureFocalRatio");
    v24 = v23;
    -[NSObject portraitLightingEffectStrength](v4, "portraitLightingEffectStrength");
    LODWORD(v26) = v25;
    LODWORD(v27) = v17;
    LODWORD(v28) = v20;
    LODWORD(v29) = v24;
    v30 = -[PIValuesAtCapture initFromMinAperture:maxAperture:aperture:focusRect:portraitStrength:SDOFRenderingVersion:depthVersionInfo:](v22, "initFromMinAperture:maxAperture:aperture:focusRect:portraitStrength:SDOFRenderingVersion:depthVersionInfo:", v57, v21 - (unint64_t)(v21 > 3), 0, v27, v28, v29, v26);
    v31 = (unint64_t)objc_msgSend(v30, "portraitMajorVersion") >= 2
       && objc_msgSend(v30, "portraitMinorVersion") != 0;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSObject luminanceNoiseAmplitude](v4, "luminanceNoiseAmplitude");
    objc_msgSend(a1, "depthEffectInfoDictionaryFromFaceObservations:valuesAtCapture:lumaNoiseScale:orientation:", v11, v30, v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, CFSTR("depthInfo"));

    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[NSObject apertureFocalRatio](v4, "apertureFocalRatio");
    objc_msgSend(v33, "numberWithFloat:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("aperture"));

    objc_msgSend(v30, "focusRect");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v36, CFSTR("focusRect"));

    objc_msgSend(a1, "portraitEffectInfoDictionaryFromFaceObservations:orientation:valuesAtCapture:", v10, v12, v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v37, CFSTR("portraitInfo"));

    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v30, "portraitStrength");
    objc_msgSend(v38, "numberWithFloat:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v39, CFSTR("portraitStrength"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v40, CFSTR("spillMatteAllowed"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v41, CFSTR("glassesMatteAllowed"));

    goto LABEL_29;
  }
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
  v13 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v4;
    _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Couldn't deserialize face observations from metadata: %@", buf, 0xCu);
  }
  v14 = (id)MEMORY[0x1E0C9AA70];
LABEL_29:

  return v14;
}

void __69__PIPortraitAutoCalculator_portraitInfoDictionaryFromCameraMetadata___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)portraitInfoDictionaryFromCameraMetadata__s_expectedClasses;
  portraitInfoDictionaryFromCameraMetadata__s_expectedClasses = v2;

}

@end

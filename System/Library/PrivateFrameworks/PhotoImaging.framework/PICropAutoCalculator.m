@implementation PICropAutoCalculator

- (PICropAutoCalculator)initWithComposition:(id)a3
{
  PICropAutoCalculator *v3;
  PICropAutoCalculator *v4;
  NSNumber *autoStraightenVerticalAngleThreshold;
  NSNumber *autoStraightenDominantAngleDiffThreshold;
  NSString *debugFilesPrefix;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PICropAutoCalculator;
  v3 = -[NURenderRequest initWithComposition:](&v9, sel_initWithComposition_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_maxAutoStraighten = 10.0;
    v3->_shouldPerformAutoCrop = 1;
    v3->_shouldPerformAutoStraighten = 1;
    v3->_shouldUseAutoStraightenVerticalDetector = 0;
    autoStraightenVerticalAngleThreshold = v3->_autoStraightenVerticalAngleThreshold;
    v3->_autoStraightenVerticalAngleThreshold = 0;

    autoStraightenDominantAngleDiffThreshold = v4->_autoStraightenDominantAngleDiffThreshold;
    v4->_autoStraightenDominantAngleDiffThreshold = 0;

    v4->_minAutoStraighten = 1.0;
    debugFilesPrefix = v4->_debugFilesPrefix;
    v4->_debugFilesPrefix = (NSString *)&stru_1E501A310;

  }
  return v4;
}

- (id)imageProperties:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc(MEMORY[0x1E0D52180]);
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithComposition:", v6);

  objc_msgSend(v7, "setName:", CFSTR("PICropAutoCalculator-imageProperties"));
  objc_msgSend(v7, "submitSynchronous:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)undoExifOrientation:(id *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _BYTE buf[32];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NUAssertLogger_18993();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18993();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[PICropAutoCalculator imageProperties:](self, "imageProperties:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  if (!objc_msgSend(v7, "size") || (objc_msgSend(v8, "size"), !v9))
  {
    v12 = (void *)MEMORY[0x1E0D520A0];
    -[NURenderRequest composition](self, "composition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithCode:reason:object:", 2, CFSTR("Source geometry has 0 size"), v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v8, "orientation");
  NUOrientationInverse();
  objc_msgSend(v8, "size");
  NUOrientationTransformImageSize();
  NUOrientationTransformImageRect();
  v10 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16];
  a3->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf;
  a3->var1 = v10;
  v11 = 1;
LABEL_8:

  return v11;
}

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  const void **v45;
  void *specific;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id obj;
  _QWORD v61[4];
  id v62;
  PICropAutoCalculator *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  uint8_t buf[40];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_18993();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v44;
      _os_log_error_impl(&dword_1A6382000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v45 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18993();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (!v48)
        goto LABEL_28;
      v51 = dispatch_get_specific(*v45);
      v52 = (void *)MEMORY[0x1E0CB3978];
      v50 = v51;
      objc_msgSend(v52, "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v54;
      _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    else
    {
      if (!v48)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v50;
      _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  v5 = v4;
  if (-[PICropAutoCalculator debugFilesEnabled](self, "debugFilesEnabled"))
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  else
    v6 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PICropAutoCalculator shouldPerformAutoStraighten](self, "shouldPerformAutoStraighten"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9E0D0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PICropAutoCalculator shouldPerformAutoCrop](self, "shouldPerformAutoCrop"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9E0B8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PICropAutoCalculator shouldUseAutoStraightenVerticalDetector](self, "shouldUseAutoStraightenVerticalDetector"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9E0E0]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_autoStraightenVerticalAngleThreshold, *MEMORY[0x1E0C9E0E8]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_autoStraightenDominantAngleDiffThreshold, *MEMORY[0x1E0C9E0D8]);
  -[PICropAutoCalculator faceObservationCache](self, "faceObservationCache");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[PICropAutoCalculator shouldPerformAutoCrop](self, "shouldPerformAutoCrop");

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0D52280]);
      -[NURenderRequest composition](self, "composition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithComposition:", v15);

      +[PIFaceObservationCache faceRequestWithRequest:](PIFaceObservationCache, "faceRequestWithRequest:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setName:", CFSTR("PICropAutoCalculator-faceDetection"));
      -[PICropAutoCalculator faceObservationCache](self, "faceObservationCache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      objc_msgSend(v18, "submitSynchronous:error:", v17, &v69);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v69;

      objc_msgSend(v19, "faces");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v55 = v20;
        v57 = v17;
        v58 = v16;
        v59 = v6;
        v22 = (void *)objc_opt_new();
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v56 = v19;
        objc_msgSend(v19, "faces");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v66 != v25)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              memset(buf, 0, 32);
              objc_msgSend(v27, "boundingBox");
              *(_QWORD *)buf = v28;
              *(_QWORD *)&buf[8] = v29;
              *(_QWORD *)&buf[16] = v30;
              *(_QWORD *)&buf[24] = v31;
              v71 = CFSTR("bounds");
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", buf, "{CGRect={CGPoint=dd}{CGSize=dd}}");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v32;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "addObject:", v33);
            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
          }
          while (v24);
        }

        objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0C9E0C8]);
        v16 = v58;
        v6 = v59;
        v19 = v56;
        v17 = v57;
        v20 = v55;
      }

    }
  }
  if (v6)
  {
    v34 = (void *)MEMORY[0x1E0CB37E8];
    -[PICropAutoCalculator maxAutoStraighten](self, "maxAutoStraighten");
    objc_msgSend(v34, "numberWithDouble:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("maxAutoStraighten"));

    v36 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("filterOptions"));

  }
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52140]), "initWithRequest:dataExtractor:options:", self, CFSTR("CIAutoStraighten"), v7);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520D0]), "initWithTargetPixelSize:", 2048, 2048);
  objc_msgSend(v37, "setScalePolicy:", v38);

  objc_msgSend(v37, "setSampleMode:", 2);
  +[PIPipelineFilters autoCropFilter](PIPipelineFilters, "autoCropFilter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPipelineFilters:", v40);

  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __31__PICropAutoCalculator_submit___block_invoke;
  v61[3] = &unk_1E5019368;
  v62 = v6;
  v63 = self;
  v64 = v5;
  v41 = v5;
  v42 = v6;
  objc_msgSend(v37, "submit:", v61);

}

- (PIFaceObservationCache)faceObservationCache
{
  return self->_faceObservationCache;
}

- (void)setFaceObservationCache:(id)a3
{
  objc_storeStrong((id *)&self->_faceObservationCache, a3);
}

- (BOOL)shouldPerformAutoCrop
{
  return self->_shouldPerformAutoCrop;
}

- (void)setShouldPerformAutoCrop:(BOOL)a3
{
  self->_shouldPerformAutoCrop = a3;
}

- (BOOL)shouldPerformAutoStraighten
{
  return self->_shouldPerformAutoStraighten;
}

- (void)setShouldPerformAutoStraighten:(BOOL)a3
{
  self->_shouldPerformAutoStraighten = a3;
}

- (BOOL)shouldUseAutoStraightenVerticalDetector
{
  return self->_shouldUseAutoStraightenVerticalDetector;
}

- (void)setShouldUseAutoStraightenVerticalDetector:(BOOL)a3
{
  self->_shouldUseAutoStraightenVerticalDetector = a3;
}

- (NSNumber)autoStraightenVerticalAngleThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAutoStraightenVerticalAngleThreshold:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSNumber)autoStraightenDominantAngleDiffThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAutoStraightenDominantAngleDiffThreshold:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (double)maxAutoStraighten
{
  return self->_maxAutoStraighten;
}

- (void)setMaxAutoStraighten:(double)a3
{
  self->_maxAutoStraighten = a3;
}

- (double)minAutoStraighten
{
  return self->_minAutoStraighten;
}

- (void)setMinAutoStraighten:(double)a3
{
  self->_minAutoStraighten = a3;
}

- (BOOL)debugFilesEnabled
{
  return self->_debugFilesEnabled;
}

- (void)setDebugFilesEnabled:(BOOL)a3
{
  self->_debugFilesEnabled = a3;
}

- (NSString)debugFilesPrefix
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDebugFilesPrefix:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugFilesPrefix, 0);
  objc_storeStrong((id *)&self->_autoStraightenDominantAngleDiffThreshold, 0);
  objc_storeStrong((id *)&self->_autoStraightenVerticalAngleThreshold, 0);
  objc_storeStrong((id *)&self->_faceObservationCache, 0);
}

void __31__PICropAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51[2];

  v51[0] = 0;
  objc_msgSend(a2, "result:", v51);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v51[0];
  if (!v3)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    goto LABEL_21;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("data"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("straightenAngleInDegreesCCW"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = fabs(v10);
  objc_msgSend(*(id *)(a1 + 40), "maxAutoStraighten");
  if (v11 <= v12)
  {
    v14 = v5;
    v13 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("limitExceeded"));
    v13 = &unk_1E50518C8;
    v14 = v5;
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("angle"));
  objc_msgSend(v9, "doubleValue");
  v17 = fabs(v16);
  objc_msgSend(*(id *)(a1 + 40), "minAutoStraighten");
  if (v17 <= v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("belowMinimum"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E50518C8, CFSTR("angle"));
  }
  objc_msgSend(v3, "geometry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("autoCrop"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 && v19)
  {
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v20, "CGRectValue");
    NUPixelRectFromCGRect();
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v19, "renderScale");
    NUScaleInvert();
    v45 = 0u;
    v46 = 0u;
    NUPixelRectScaleRational();
    v22 = *(void **)(a1 + 40);
    v44 = 0;
    objc_msgSend(v22, "undoExifOrientation:error:", &v47, &v44);
    v23 = v44;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v47);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("xOrigin"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v47 + 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("yOrigin"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (_QWORD)v48);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("width"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v48 + 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("height"));

    v4 = v23;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    if (v4)
      goto LABEL_17;
LABEL_19:
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v5);
    goto LABEL_20;
  }
  v28 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v28, CFSTR("result"));

  if (!v4)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("angle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v31, CFSTR("angle"));

    goto LABEL_19;
  }
  objc_msgSend(v4, "description");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v29, CFSTR("error"));

LABEL_17:
  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
LABEL_20:
  v15 = (void *)v30;

LABEL_21:
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "composition");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PICaptureDebugUtilities captureDebugDirectoryForComposition:](PICaptureDebugUtilities, "captureDebugDirectoryForComposition:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 40), "debugFilesPrefix");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%@AutoCropEvaluation-txt.DBG"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "URLByAppendingPathComponent:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(0, 0);
      v38 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__PICropAutoCalculator_submit___block_invoke_66;
      block[3] = &unk_1E5019340;
      v41 = v33;
      v42 = *(id *)(a1 + 32);
      v43 = v37;
      v39 = v37;
      dispatch_async(v38, block);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __31__PICropAutoCalculator_submit___block_invoke_66(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v9[0] = 0;
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, v9);
  v4 = v9[0];

  v5 = a1[5];
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 3, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  objc_msgSend(v6, "writeToURL:atomically:", a1[6], 1);
}

+ (id)updateCropAdjustment:(id)a3 after:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  PICompositionController *v10;
  PICompositionController *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v54;
  void *v55;
  const void **v56;
  void *specific;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  _QWORD v67[8];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  void *v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a5)
  {
    NUAssertLogger_18993();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v55;
      _os_log_error_impl(&dword_1A6382000, v54, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v56 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_18993();
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v59)
      {
        v62 = dispatch_get_specific(*v56);
        v63 = (void *)MEMORY[0x1E0CB3978];
        v64 = v62;
        objc_msgSend(v63, "callStackSymbols");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v62;
        v79 = 2114;
        v80 = v66;
        _os_log_error_impl(&dword_1A6382000, v58, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v59)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v61;
      _os_log_error_impl(&dword_1A6382000, v58, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v9 = v8;
  v10 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v7);
  v11 = -[PICompositionController initWithComposition:]([PICompositionController alloc], "initWithComposition:", v9);
  -[PICompositionController cropAdjustmentController](v10, "cropAdjustmentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "enabled") & 1) == 0)
  {

    goto LABEL_9;
  }
  -[PICompositionController cropAdjustmentController](v11, "cropAdjustmentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "enabled");

  if ((v14 & 1) == 0)
  {
LABEL_9:
    v22 = v9;
    goto LABEL_27;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52100]), "initWithComposition:", v7);
  +[PIPipelineFilters inputToCropFilter](PIPipelineFilters, "inputToCropFilter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPipelineFilters:", v17);

  objc_msgSend(v15, "setName:", CFSTR("PICropAutoCalculator-getBeforeGeometry"));
  objc_msgSend(v15, "submitSynchronous:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v15, "setComposition:", v9);
    objc_msgSend(v15, "setName:", CFSTR("PICropAutoCalculator-getAfterGeometry"));
    objc_msgSend(v15, "submitSynchronous:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v18, "geometry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "extent");
      }
      else
      {
        v74 = 0u;
        v75 = 0u;
      }
      objc_msgSend(v19, "geometry");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "extent");
      }
      else
      {
        v72 = 0u;
        v73 = 0u;
      }
      v25 = NUPixelRectEqualToRect();

      if (v25)
      {
        v22 = v9;
      }
      else
      {
        objc_msgSend(v18, "geometry");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "extent");
        }
        else
        {
          v70 = 0u;
          v71 = 0u;
        }
        NUPixelRectToCGRect();

        objc_msgSend(v19, "geometry");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          objc_msgSend(v28, "extent");
        }
        else
        {
          v68 = 0u;
          v69 = 0u;
        }
        NUPixelRectToCGRect();
        v31 = v30;
        v33 = v32;
        v35 = v34;
        v37 = v36;

        -[PICompositionController cropAdjustmentController](v10, "cropAdjustmentController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "cropRect");

        NUCGRectConvertFromRectToRect();
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52080]), "initWithMasterImageSize:", v35, v37, v31, v33, *(_QWORD *)&v35, *(_QWORD *)&v37);
        -[PICompositionController cropAdjustmentController](v11, "cropAdjustmentController");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "yawRadians");
        objc_msgSend(v47, "setYawRadians:");
        objc_msgSend(v48, "pitchRadians");
        objc_msgSend(v47, "setPitchRadians:");
        objc_msgSend(v48, "angleRadians");
        objc_msgSend(v47, "setRollRadians:");
        objc_msgSend(v47, "setCropRect:", v40, v42, v44, v46);
        objc_msgSend(v47, "cropRect");
        objc_msgSend(v47, "integralCropRect:");
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __68__PICropAutoCalculator_Utilities__updateCropAdjustment_after_error___block_invoke;
        v67[3] = &__block_descriptor_64_e36_v16__0__PICropAdjustmentController_8l;
        v67[4] = v49;
        v67[5] = v50;
        v67[6] = v51;
        v67[7] = v52;
        -[PICompositionController modifyAdjustmentWithKey:modificationBlock:](v11, "modifyAdjustmentWithKey:modificationBlock:", CFSTR("cropStraighten"), v67);
        -[PICompositionController composition](v11, "composition");
        v22 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

LABEL_27:
  return v22;
}

uint64_t __68__PICropAutoCalculator_Utilities__updateCropAdjustment_after_error___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setCropRect:", a1[4], a1[5], a1[6], a1[7]);
}

@end

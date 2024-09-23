@implementation PIPerspectiveAutoCalculator

- (PIPerspectiveAutoCalculator)initWithComposition:(id)a3
{
  id v4;
  void *v5;
  PIPerspectiveAutoCalculator *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *debugDiagnostics;
  CIImage *debugLineDetectionImage;
  NSString *debugFilesPrefix;
  NSObject *v12;
  void *v13;
  const void **v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_8802();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v14 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v20;
        v28 = 2114;
        v29 = v24;
        _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)PIPerspectiveAutoCalculator;
  v6 = -[NURenderRequest initWithComposition:](&v25, sel_initWithComposition_, v4);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    debugDiagnostics = v6->_debugDiagnostics;
    v6->_debugDiagnostics = v7;

    debugLineDetectionImage = v6->_debugLineDetectionImage;
    v6->_debugLineDetectionImage = 0;

    v6->_minimumConfidence = 0.6;
    v6->_maxFaceSize = 0.0;
    v6->_disableOnPanos = 1;
    v6->_disableOnFrontFacingCameraImages = 1;
    v6->_angleSeedDegreesCCW = 0.0;
    v6->_debugFilesEnabled = 0;
    debugFilesPrefix = v6->_debugFilesPrefix;
    v6->_debugFilesPrefix = (NSString *)&stru_1E501A310;

    v6->_minimumYawCorrection = 0.4;
    v6->_minimumPitchCorrection = 0.4;
    v6->_minimumAngleCorrection = 0.4;
    v6->_shouldRunBuildingCheck = 0;
    v6->_minimumPitchCorrectionArea = 0.25;
    v6->_minimumYawCorrectionArea = 0.25;
  }

  return v6;
}

- (id)perspectiveErrorFromCoreImage:(id)a3
{
  unint64_t v3;
  __CFString **v4;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 > 3)
    v4 = &PIPerspectiveErrorUnexpectedRuntimeError;
  else
    v4 = off_1E5017010[v3];
  return *v4;
}

- (void)addMethodDiagnostics:(id)a3 details:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)addMethodResultToDiagnostics:(id)a3 error:(id)a4 setYawPitchError:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v5 = a5;
  v34 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8 == 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v34);

  if (v8)
  {
    objc_msgSend(v8, "nonLocalizedFailureReason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 7, PIPerspectiveErrorUnexpectedRuntimeError, 0, v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v12;
    }
    objc_msgSend(v8, "nonLocalizedFailureReason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.error"), v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

    objc_msgSend(v8, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.underlyingError"), v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

    if (v5)
    {
      objc_msgSend(v8, "nonLocalizedFailureReason");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("pitchError"));

      objc_msgSend(v8, "nonLocalizedFailureReason");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("yawError"));

      objc_msgSend(v8, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("pitchError.underlyingError"));

      objc_msgSend(v8, "userInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "description");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("yawError.underlyingError"));

    }
  }

}

- (id)wrapAsUnexpectedError:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 7, PIPerspectiveErrorUnexpectedRuntimeError, 0, a3);
}

- (void)writeDebugDiagnosticsToDisk
{
  void *v3;
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
  int64_t v14;
  dispatch_time_t v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  PIPerspectiveAutoCalculator *v21;
  id v22;
  id v23;

  if (-[PIPerspectiveAutoCalculator debugFilesEnabled](self, "debugFilesEnabled"))
  {
    -[NURenderRequest composition](self, "composition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PICaptureDebugUtilities captureDebugDirectoryForComposition:](PICaptureDebugUtilities, "captureDebugDirectoryForComposition:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      -[PIPerspectiveAutoCalculator debugFilesPrefix](self, "debugFilesPrefix");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@PerspectiveEvaluation-txt.DBG"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLByAppendingPathComponent:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0CB3940];
      -[PIPerspectiveAutoCalculator debugFilesPrefix](self, "debugFilesPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@PerspectiveLineDetection-png.DBG"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLByAppendingPathComponent:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[PIPerspectiveAutoCalculator debugFilesPrefix](self, "debugFilesPrefix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v13, "isEqualToString:", CFSTR("Edit"));

      if ((_DWORD)v11)
        v14 = 6000000000;
      else
        v14 = 0;
      v15 = dispatch_time(0, v14);
      dispatch_get_global_queue(-32768, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__PIPerspectiveAutoCalculator_writeDebugDiagnosticsToDisk__block_invoke;
      block[3] = &unk_1E5018F68;
      v20 = v4;
      v21 = self;
      v22 = v12;
      v23 = v8;
      v17 = v8;
      v18 = v12;
      dispatch_after(v15, v16, block);

    }
  }
}

- (float)getSizeOfAllFaces:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  float v12;
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
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_8802();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "faces != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v15;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
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
        v33 = v22;
        v34 = 2114;
        v35 = v26;
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
      v33 = v21;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "boundingBox");
        v8 = v8 + v10 * v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
    v12 = v8;
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (BOOL)passesFaceCheck:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_8802();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v29;
        v38 = 2114;
        v39 = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  if (self->_maxFaceSize < 100.0)
  {
    +[PIFaceObservationCache faceRequestWithRequest:](PIFaceObservationCache, "faceRequestWithRequest:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest responseQueue](self, "responseQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResponseQueue:", v6);

    objc_msgSend(v5, "setName:", CFSTR("PIPerspectiveAutoCalculator-faceCheck"));
    -[PIPerspectiveAutoCalculator faceObservationCache](self, "faceObservationCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PIPerspectiveAutoCalculator faceObservationCache](self, "faceObservationCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "submitSynchronous:error:", v5, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
LABEL_5:
        objc_msgSend(v9, "faces");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PIPerspectiveAutoCalculator getSizeOfAllFaces:](self, "getSizeOfAllFaces:", v10);
        v12 = v11;

        -[PIPerspectiveAutoCalculator maxFaceSize](self, "maxFaceSize");
        v34[0] = CFSTR("faceSize");
        v14 = v13 / 100.0;
        *(float *)&v13 = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = CFSTR("maxFaceSize");
        v35[0] = v15;
        v16 = (void *)MEMORY[0x1E0CB37E8];
        -[PIPerspectiveAutoCalculator maxFaceSize](self, "maxFaceSize");
        objc_msgSend(v16, "numberWithDouble:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[PIPerspectiveAutoCalculator addMethodDiagnostics:details:](self, "addMethodDiagnostics:details:", CFSTR("passesFaceCheck"), v18);
        v19 = v14 >= v12;
        if (v14 < v12)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 4, PIPerspectiveErrorFacesTooLarge, v18, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v5, "submitGenericSynchronous:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_5;
    }
    -[PIPerspectiveAutoCalculator wrapAsUnexpectedError:](self, "wrapAsUnexpectedError:", *a3);
    v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    return v19;
  }
  return 1;
}

- (BOOL)hasFrontFacingCameraDimentions:(id)a3
{
  if (a3.var0 == 640 && a3.var1 == 480 || a3.var0 == 480 && a3.var1 == 640 || a3.var0 == 1280 && a3.var1 == 960)
    return 1;
  return a3.var0 == 960 && a3.var1 == 1280;
}

- (BOOL)isFrontFacingCameraImage:(id)a3 pixelSize:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CBCBD8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CBCBE0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Apple"))
      && objc_msgSend(v11, "containsString:", CFSTR("front"))
      && (objc_msgSend(v11, "containsString:", CFSTR("camera")) & 1) != 0)
    {
      goto LABEL_13;
    }
LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CBD090]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CBD0B0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqualToString:", CFSTR("Apple"))
    || !-[PIPerspectiveAutoCalculator hasFrontFacingCameraDimentions:](self, "hasFrontFacingCameraDimentions:", var0, var1))
  {

    goto LABEL_15;
  }

LABEL_13:
  v16 = 1;
LABEL_17:

  return v16;
}

- (BOOL)passesImagePropertiesCheck:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  uint64_t v13;
  float v14;
  _BOOL4 v15;
  BOOL v16;
  char v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char v27;
  NSObject *v28;
  void *v29;
  const void **v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_8802();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v36;
        v45 = 2114;
        v46 = v40;
        _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v35;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  if (!*(_WORD *)&self->_disableOnPanos)
    return 1;
  v5 = objc_alloc(MEMORY[0x1E0D52180]);
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithComposition:", v6);

  -[NURenderRequest responseQueue](self, "responseQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResponseQueue:", v8);

  objc_msgSend(v7, "setName:", CFSTR("PIPerspectiveAutoCalculator-selfieAndAspectRatioCheck"));
  objc_msgSend(v7, "submitGenericSynchronous:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (float)objc_msgSend(v11, "size");
    objc_msgSend(v11, "size");
    v14 = v12 / (float)v13;
    v15 = -[PIPerspectiveAutoCalculator disableOnPanos](self, "disableOnPanos");
    v16 = v14 <= 2.0;
    if (v14 < 0.5)
      v16 = 0;
    v17 = !v15 || v16;
    if (-[PIPerspectiveAutoCalculator disableOnFrontFacingCameraImages](self, "disableOnFrontFacingCameraImages"))
    {
      objc_msgSend(v11, "metadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v11, "size");
      v22 = !-[PIPerspectiveAutoCalculator isFrontFacingCameraImage:pixelSize:](self, "isFrontFacingCameraImage:pixelSize:", v19, v20, v21);

    }
    else
    {
      v22 = 1;
    }
    v27 = v17 & v22;
    v41[0] = CFSTR("aspectRatio");
    *(float *)&v18 = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = CFSTR("isSelfieCam");
    v42[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22 ^ 1u);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[PIPerspectiveAutoCalculator addMethodDiagnostics:details:](self, "addMethodDiagnostics:details:", CFSTR("passesImagePropertiesCheck"), v25);
    if ((v27 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 4, PIPerspectiveErrorPanoAndFFCNotSupported, v25, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[PIPerspectiveAutoCalculator wrapAsUnexpectedError:](self, "wrapAsUnexpectedError:", *a3);
    v27 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (BOOL)passesBuildingCheck:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_8802();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v29;
        v39 = 2114;
        v40 = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52058]), "initWithRequest:", self);
  +[PIPipelineFilters sourceFilterNoOrientation](PIPipelineFilters, "sourceFilterNoOrientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPipelineFilters applyOrientationFilter](PIPipelineFilters, "applyOrientationFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  v36[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPipelineFilters:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 89401);
  objc_msgSend(v5, "setScalePolicy:", v9);

  objc_msgSend(v5, "setSampleMode:", 3);
  -[NURenderRequest responseQueue](self, "responseQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseQueue:", v10);

  objc_msgSend(v5, "setName:", CFSTR("PIPerspectiveAutoCalculator-classify"));
  objc_msgSend(v5, "submitGenericSynchronous:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "confidence");
    v14 = v13;
    v34[0] = CFSTR("confidence");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "confidence");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("minConfidence");
    v35[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PIPerspectiveAutoCalculator addMethodDiagnostics:details:](self, "addMethodDiagnostics:details:", CFSTR("passesBuildingCheck"), v18);
    v19 = v14 > 0.4;
    if (v14 <= 0.4)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 4, PIPerspectiveErrorNoBuildingDetected, v18, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[PIPerspectiveAutoCalculator wrapAsUnexpectedError:](self, "wrapAsUnexpectedError:", *a3);
    v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (void)submit:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  _BOOL4 v6;
  id v7;
  _BOOL4 v8;
  id v9;
  _BOOL4 v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_8802();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v29;
        v39 = 2114;
        v40 = v33;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v28;
      _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  v36 = 0;
  v6 = -[PIPerspectiveAutoCalculator passesImagePropertiesCheck:](self, "passesImagePropertiesCheck:", &v36);
  v7 = v36;
  -[PIPerspectiveAutoCalculator addMethodResultToDiagnostics:error:setYawPitchError:](self, "addMethodResultToDiagnostics:error:setYawPitchError:", CFSTR("passesImagePropertiesCheck"), v7, 1);
  if (v6)
  {
    v35 = 0;
    v8 = -[PIPerspectiveAutoCalculator passesFaceCheck:](self, "passesFaceCheck:", &v35);
    v9 = v35;

    -[PIPerspectiveAutoCalculator addMethodResultToDiagnostics:error:setYawPitchError:](self, "addMethodResultToDiagnostics:error:setYawPitchError:", CFSTR("passesFaceCheck"), v9, 1);
    if (v8)
    {
      if (!-[PIPerspectiveAutoCalculator shouldRunBuildingCheck](self, "shouldRunBuildingCheck"))
      {
        v7 = v9;
LABEL_14:
        -[PIPerspectiveAutoCalculator submitVerified:](self, "submitVerified:", v5);
        goto LABEL_12;
      }
      v34 = 0;
      v10 = -[PIPerspectiveAutoCalculator passesBuildingCheck:](self, "passesBuildingCheck:", &v34);
      v7 = v34;

      -[PIPerspectiveAutoCalculator addMethodResultToDiagnostics:error:setYawPitchError:](self, "addMethodResultToDiagnostics:error:setYawPitchError:", CFSTR("passesBuildingCheck"), v7, 1);
      if (v10)
        goto LABEL_14;
    }
    else
    {
      v7 = v9;
    }
  }
  objc_msgSend(v7, "nonLocalizedFailureReason");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = PIPerspectiveErrorUnexpectedRuntimeError;

  if (v11 == v12)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v7);
  }
  else
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E5051D38, CFSTR("pitch"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E5051D38, CFSTR("yaw"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E5051D38, CFSTR("angle"));
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pitch"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("pitch"));

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("yaw"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("yaw"));

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("angle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("angle"));

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v13);
  }
  -[PIPerspectiveAutoCalculator writeDebugDiagnosticsToDisk](self, "writeDebugDiagnosticsToDisk");
  ((void (**)(_QWORD, void *))v5)[2](v5, v20);

LABEL_12:
}

- (id)primaryImageProperties:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_8802();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
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
        v28 = v21;
        v29 = 2114;
        v30 = v25;
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
      v28 = v20;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = objc_alloc(MEMORY[0x1E0D52180]);
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithComposition:", v6);

  objc_msgSend(v7, "setName:", CFSTR("PIPerspectiveAutoCalculator-primaryImageProperties"));
  +[PIPipelineFilters sourceFilter](PIPipelineFilters, "sourceFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPipelineFilters:", v9);

  objc_msgSend(v7, "submitSynchronous:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)canGenerateNewCropRect:(id *)a3
{
  PICompositionController *v5;
  void *v6;
  PICompositionController *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v26;
  void *v27;
  const void **v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[9];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_8802();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific(*v28);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v34;
        v42 = 2114;
        v43 = v38;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v33;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = [PICompositionController alloc];
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PICompositionController initWithComposition:](v5, "initWithComposition:", v6);

  -[PICompositionController removeAdjustmentWithKey:](v7, "removeAdjustmentWithKey:", CFSTR("cropStraighten"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_angleSeedDegreesCCW);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("preseedRoll"));

  if (self->_angleSeedDegreesCCW == 0.0)
  {
    -[PICompositionController composition](v7, "composition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setComposition:](self, "setComposition:", v10);

    -[PIPerspectiveAutoCalculator addMethodDiagnostics:details:](self, "addMethodDiagnostics:details:", CFSTR("canGenerateNewCropRect"), &unk_1E5059020);
    v11 = 1;
  }
  else
  {
    -[PIPerspectiveAutoCalculator primaryImageProperties:](self, "primaryImageProperties:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v11 = v12 != 0;
    if (v12)
    {
      objc_msgSend(v12, "size");
      NUPixelSizeToCGSize();
      v15 = v14;
      v17 = v16;
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52080]), "initWithMasterImageSize:", v14, v16);
      objc_msgSend(v18, "setCropRect:", 0.0, 0.0, v15, v17);
      -[PIPerspectiveAutoCalculator angleSeedDegreesCCW](self, "angleSeedDegreesCCW");
      objc_msgSend(v18, "setRollAngle:constrainCropRectWithTargetArea:", v19 * 3.14159265 / 180.0, v15 * v17);
      objc_msgSend(v18, "cropRect");
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __54__PIPerspectiveAutoCalculator_canGenerateNewCropRect___block_invoke;
      v39[3] = &unk_1E5016F90;
      v39[5] = v20;
      v39[6] = v21;
      v39[7] = v22;
      v39[8] = v23;
      v39[4] = self;
      -[PICompositionController modifyAdjustmentWithKey:modificationBlock:](v7, "modifyAdjustmentWithKey:modificationBlock:", CFSTR("cropStraighten"), v39);
      -[PICompositionController composition](v7, "composition");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderRequest setComposition:](self, "setComposition:", v24);

    }
  }

  return v11;
}

- (BOOL)passesConfidenceCheck:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v22;
  void *v23;
  const void **v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_8802();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific(*v24);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v30;
        v39 = 2114;
        v40 = v34;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v29;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    -[PIPerspectiveAutoCalculator addMethodDiagnostics:details:](self, "addMethodDiagnostics:details:", CFSTR("passesConfidenceCheck"), &unk_1E5059048);
LABEL_6:
    v20 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("confidence"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  -[PIPerspectiveAutoCalculator minimumConfidence](self, "minimumConfidence");
  v15 = v14;
  v35[0] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = CFSTR("minConfidence");
  v36[0] = v16;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PIPerspectiveAutoCalculator minimumConfidence](self, "minimumConfidence");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPerspectiveAutoCalculator addMethodDiagnostics:details:](self, "addMethodDiagnostics:details:", CFSTR("passesConfidenceCheck"), v19);

  if (v13 >= v15)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 4, PIPerspectiveErrorConfidenceTooLow, 0, 0);
  v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v20;
}

- (BOOL)passesMinimumCorrectionCheck:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v26;
  void *v27;
  const void **v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_8802();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v27;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific(*v28);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v34;
        v43 = 2114;
        v44 = v38;
        _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v33;
      _os_log_error_impl(&dword_1A6382000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchExpandTopDegrees"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("yawExpandLeftDegrees"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rollAngleInDegreesCW"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = fabs(v10) >= self->_minimumPitchCorrection
     || fabs(v13) >= self->_minimumYawCorrection
     || fabs(v16) >= self->_minimumAngleCorrection;
  v39[0] = CFSTR("minimumPitchCorrection");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[PIPerspectiveAutoCalculator minimumPitchCorrection](self, "minimumPitchCorrection");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v19;
  v39[1] = CFSTR("minimumYawCorrection");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[PIPerspectiveAutoCalculator minimumYawCorrection](self, "minimumYawCorrection");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v21;
  v39[2] = CFSTR("minimumAngleCorrection");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[PIPerspectiveAutoCalculator minimumAngleCorrection](self, "minimumAngleCorrection");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPerspectiveAutoCalculator addMethodDiagnostics:details:](self, "addMethodDiagnostics:details:", CFSTR("passesMinimumCorrectionCheck"), v24);

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 4, PIPerspectiveErrorLessThanMinimumCorrection, 0, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)submitVerified:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  const void **v49;
  void *specific;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  _QWORD v60[5];
  id v61;
  void (**v62)(_QWORD, _QWORD);
  id v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_8802();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v48;
      _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v49 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        v55 = dispatch_get_specific(*v49);
        v56 = (void *)MEMORY[0x1E0CB3978];
        v57 = v55;
        objc_msgSend(v56, "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v55;
        v67 = 2114;
        v68 = v59;
        _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v52)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v54;
      _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  v63 = 0;
  v6 = -[PIPerspectiveAutoCalculator canGenerateNewCropRect:](self, "canGenerateNewCropRect:", &v63);
  v7 = v63;
  -[PIPerspectiveAutoCalculator addMethodResultToDiagnostics:error:setYawPitchError:](self, "addMethodResultToDiagnostics:error:setYawPitchError:", CFSTR("canGenerateNewCropRect"), v7, 1);
  if (!v6 || v7)
  {
    -[PIPerspectiveAutoCalculator writeDebugDiagnosticsToDisk](self, "writeDebugDiagnosticsToDisk");
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v7);
    ((void (**)(_QWORD, id))v5)[2](v5, v8);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D52080], "defaultFocalLength");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("focalLength"));

    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("v2"), CFSTR("version"));
    -[PIPerspectiveAutoCalculator maxAutoPitch](self, "maxAutoPitch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[PIPerspectiveAutoCalculator maxAutoPitch](self, "maxAutoPitch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      objc_msgSend(v12, "numberWithDouble:", v14 * 3.14159265 / 180.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("pitchLimit"));

    }
    -[PIPerspectiveAutoCalculator maxAutoYaw](self, "maxAutoYaw");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      -[PIPerspectiveAutoCalculator maxAutoYaw](self, "maxAutoYaw");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      objc_msgSend(v17, "numberWithDouble:", v19 * 3.14159265 / 180.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("yawLimit"));

    }
    -[PIPerspectiveAutoCalculator maxAutoAngle](self, "maxAutoAngle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      -[PIPerspectiveAutoCalculator maxAutoAngle](self, "maxAutoAngle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      objc_msgSend(v22, "numberWithDouble:", v24 * 3.14159265 / 180.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("rollLimit"));

    }
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[PIPerspectiveAutoCalculator minimumPitchCorrectionArea](self, "minimumPitchCorrectionArea");
    objc_msgSend(v26, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("minimumPitchCorrectionArea"));

    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[PIPerspectiveAutoCalculator minimumYawCorrectionArea](self, "minimumYawCorrectionArea");
    objc_msgSend(v28, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("minimumYawCorrectionArea"));

    v30 = (void *)MEMORY[0x1E0CB3940];
    -[PIPerspectiveAutoCalculator maxAutoPitch](self, "maxAutoPitch");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("pitchLimit"));

    v34 = (void *)MEMORY[0x1E0CB3940];
    -[PIPerspectiveAutoCalculator maxAutoYaw](self, "maxAutoYaw");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("%@"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, CFSTR("yawLimit"));

    v38 = (void *)MEMORY[0x1E0CB3940];
    -[PIPerspectiveAutoCalculator maxAutoAngle](self, "maxAutoAngle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("%@"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPerspectiveAutoCalculator debugDiagnostics](self, "debugDiagnostics");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("rollLimit"));

    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52140]), "initWithRequest:dataExtractor:options:", self, CFSTR("CIAutoPerspective"), v8);
    +[PIPipelineFilters exifOrientationAndCropStraightenOnly](PIPipelineFilters, "exifOrientationAndCropStraightenOnly");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setPipelineFilters:", v44);

    objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setScalePolicy:", v45);

    objc_msgSend(v42, "setSampleMode:", 3);
    -[NURenderRequest responseQueue](self, "responseQueue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setResponseQueue:", v46);

    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __46__PIPerspectiveAutoCalculator_submitVerified___block_invoke;
    v60[3] = &unk_1E5019368;
    v60[4] = self;
    v61 = 0;
    v62 = v5;
    objc_msgSend(v42, "submit:", v60);

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

- (NSNumber)maxAutoYaw
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMaxAutoYaw:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSNumber)maxAutoPitch
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMaxAutoPitch:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSNumber)maxAutoAngle
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMaxAutoAngle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (double)minimumPitchCorrection
{
  return self->_minimumPitchCorrection;
}

- (void)setMinimumPitchCorrection:(double)a3
{
  self->_minimumPitchCorrection = a3;
}

- (double)minimumYawCorrection
{
  return self->_minimumYawCorrection;
}

- (void)setMinimumYawCorrection:(double)a3
{
  self->_minimumYawCorrection = a3;
}

- (double)minimumAngleCorrection
{
  return self->_minimumAngleCorrection;
}

- (void)setMinimumAngleCorrection:(double)a3
{
  self->_minimumAngleCorrection = a3;
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(double)a3
{
  self->_minimumConfidence = a3;
}

- (double)maxFaceSize
{
  return self->_maxFaceSize;
}

- (void)setMaxFaceSize:(double)a3
{
  self->_maxFaceSize = a3;
}

- (double)minimumPitchCorrectionArea
{
  return self->_minimumPitchCorrectionArea;
}

- (void)setMinimumPitchCorrectionArea:(double)a3
{
  self->_minimumPitchCorrectionArea = a3;
}

- (double)minimumYawCorrectionArea
{
  return self->_minimumYawCorrectionArea;
}

- (void)setMinimumYawCorrectionArea:(double)a3
{
  self->_minimumYawCorrectionArea = a3;
}

- (BOOL)disableOnPanos
{
  return self->_disableOnPanos;
}

- (void)setDisableOnPanos:(BOOL)a3
{
  self->_disableOnPanos = a3;
}

- (BOOL)disableOnFrontFacingCameraImages
{
  return self->_disableOnFrontFacingCameraImages;
}

- (void)setDisableOnFrontFacingCameraImages:(BOOL)a3
{
  self->_disableOnFrontFacingCameraImages = a3;
}

- (BOOL)shouldRunBuildingCheck
{
  return self->_shouldRunBuildingCheck;
}

- (void)setShouldRunBuildingCheck:(BOOL)a3
{
  self->_shouldRunBuildingCheck = a3;
}

- (double)angleSeedDegreesCCW
{
  return self->_angleSeedDegreesCCW;
}

- (void)setAngleSeedDegreesCCW:(double)a3
{
  self->_angleSeedDegreesCCW = a3;
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
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDebugFilesPrefix:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (NSMutableDictionary)debugDiagnostics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (CIImage)debugLineDetectionImage
{
  return self->_debugLineDetectionImage;
}

- (void)setDebugLineDetectionImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugLineDetectionImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLineDetectionImage, 0);
  objc_storeStrong((id *)&self->_debugDiagnostics, 0);
  objc_storeStrong((id *)&self->_debugFilesPrefix, 0);
  objc_storeStrong((id *)&self->_maxAutoAngle, 0);
  objc_storeStrong((id *)&self->_maxAutoPitch, 0);
  objc_storeStrong((id *)&self->_maxAutoYaw, 0);
  objc_storeStrong((id *)&self->_faceObservationCache, 0);
}

void __46__PIPerspectiveAutoCalculator_submitVerified___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
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
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  double v67;
  double v68;
  double v69;
  id v70;

  v70 = 0;
  objc_msgSend(a2, "result:", &v70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v70;
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0.0;
    v69 = 0.0;
    v66 = 0;
    v67 = 0.0;
    v7 = objc_msgSend(*(id *)(a1 + 32), "passesConfidenceCheck:error:", v6, &v66);
    v8 = v66;

    objc_msgSend(*(id *)(a1 + 32), "addMethodResultToDiagnostics:error:setYawPitchError:", CFSTR("passesConfidenceCheck"), v8, 1);
    v9 = *(void **)(a1 + 32);
    v65 = 0;
    v10 = objc_msgSend(v9, "passesMinimumCorrectionCheck:error:", v6, &v65);
    v11 = v65;

    objc_msgSend(*(id *)(a1 + 32), "addMethodResultToDiagnostics:error:setYawPitchError:", CFSTR("passesMinimumCorrectionCheck"), v11, 1);
    if (v7 && v10)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchExpandTopDegrees"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v68 = v13;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("yawExpandLeftDegrees"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v69 = v15;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rollAngleInDegreesCW"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v67 = v17;

    }
    if (objc_msgSend(*(id *)(a1 + 32), "debugFilesEnabled"))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("debugImage"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("debugImage"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setDebugLineDetectionImage:", v21);

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchCorrectionAreaCoverage"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if ((v24 & 1) == 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pitchCorrectionAreaCoverage"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "debugDiagnostics");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("pitchCorrectionAreaCoverage"));

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("yawCorrectionAreaCoverage"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqual:", v28);

      if ((v29 & 1) == 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("yawCorrectionAreaCoverage"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "debugDiagnostics");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("yawCorrectionAreaCoverage"));

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ciPitchError"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqual:", &unk_1E50513E8);

      if ((v33 & 1) == 0)
      {
        v34 = *(void **)(a1 + 32);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ciPitchError"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "perspectiveErrorFromCoreImage:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "description");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "debugDiagnostics");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("pitchError"));

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ciYawError"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqual:", &unk_1E50513E8);

      if ((v40 & 1) == 0)
      {
        v41 = *(void **)(a1 + 32);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ciYawError"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "perspectiveErrorFromCoreImage:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "description");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "debugDiagnostics");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, CFSTR("yawError"));

      }
    }
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52180]), "initWithRequest:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v46, "setName:", CFSTR("PIPerspectiveAutoCalculator-getPrimaryOrientation"));
    v64 = 0;
    objc_msgSend(v46, "submitSynchronous:", &v64);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v64;

    if (v47)
    {
      objc_msgSend(v47, "properties");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[PIPerspectiveAutoCalculator undoOrientation:forPitch:yaw:angle:](PIPerspectiveAutoCalculator, "undoOrientation:forPitch:yaw:angle:", objc_msgSend(v48, "orientation"), &v68, &v69, &v67);

      v63 = v47;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v68);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("pitch"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v69);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("yaw"));

      v51 = (void *)MEMORY[0x1E0CB37E8];
      v52 = v67;
      objc_msgSend(*(id *)(a1 + 32), "angleSeedDegreesCCW");
      objc_msgSend(v51, "numberWithDouble:", v53 - v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("angle"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pitch"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "debugDiagnostics");
      v56 = v3;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v55, CFSTR("pitch"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("yaw"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "debugDiagnostics");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, CFSTR("yaw"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("angle"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "debugDiagnostics");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, CFSTR("angle"));

      v3 = v56;
      v47 = v63;
      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v5);
    }
    else
    {
      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
      objc_msgSend(*(id *)(a1 + 32), "addMethodResultToDiagnostics:error:setYawPitchError:", CFSTR("submitVerified"), v4, 1);
    }
    objc_msgSend(*(id *)(a1 + 32), "writeDebugDiagnosticsToDisk");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    objc_msgSend(*(id *)(a1 + 32), "addMethodResultToDiagnostics:error:setYawPitchError:", CFSTR("submitVerified"), *(_QWORD *)(a1 + 40), 1);
    objc_msgSend(*(id *)(a1 + 32), "writeDebugDiagnosticsToDisk");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __54__PIPerspectiveAutoCalculator_canGenerateNewCropRect___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "angleSeedDegreesCCW");
  objc_msgSend(v7, "setAngle:");
  objc_msgSend(v7, "setEnabled:", 1);

  v8 = *(void **)(a1 + 32);
  v32 = CFSTR("angle");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "angleSeedDegreesCCW");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addMethodDiagnostics:details:", CFSTR("canGenerateNewCropRect"), v11);

  v12 = *(void **)(a1 + 32);
  v30 = CFSTR("xOrigin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addMethodDiagnostics:details:", CFSTR("canGenerateNewCropRect"), v14);

  v15 = *(void **)(a1 + 32);
  v28 = CFSTR("yOrigin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addMethodDiagnostics:details:", CFSTR("canGenerateNewCropRect"), v17);

  v18 = *(void **)(a1 + 32);
  v26 = CFSTR("width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addMethodDiagnostics:details:", CFSTR("canGenerateNewCropRect"), v20);

  v21 = *(void **)(a1 + 32);
  v24 = CFSTR("height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addMethodDiagnostics:details:", CFSTR("canGenerateNewCropRect"), v23);

}

void __58__PIPerspectiveAutoCalculator_writeDebugDiagnosticsToDisk__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v20 = 0;
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v20);
  v4 = v20;

  objc_msgSend(*(id *)(a1 + 40), "debugLineDetectionImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C9DD90];
    v7 = *MEMORY[0x1E0C9DF88];
    v21[0] = *MEMORY[0x1E0C9DF58];
    v21[1] = v7;
    v22[0] = MEMORY[0x1E0C9AAA0];
    v22[1] = CFSTR("PIPerspectiveAutoCalculator-debug");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextWithOptions:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "debugLineDetectionImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C9E000];
    objc_msgSend(MEMORY[0x1E0D52068], "displayP3ColorSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "CGColorSpace");
    objc_msgSend(v9, "PNGRepresentationOfImage:format:colorSpace:options:", v10, v11, v13, MEMORY[0x1E0C9AA70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "writeToURL:atomically:", *(_QWORD *)(a1 + 48), 1);
  }
  v15 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(*(id *)(a1 + 40), "debugDiagnostics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  objc_msgSend(v15, "dataWithJSONObject:options:error:", v16, 3, &v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v19;

  objc_msgSend(v17, "writeToURL:atomically:", *(_QWORD *)(a1 + 56), 1);
}

+ (void)undoOrientation:(int64_t)a3 forPitch:(double *)a4 yaw:(double *)a5 angle:(double *)a6
{
  double v6;
  double v7;
  NSObject *v8;
  const void **v9;
  const void **v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  const void **v16;
  void *v17;
  int v18;
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
  if (!a4)
  {
    NUAssertLogger_8802();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pitch != nil");
      v9 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v9;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v26 = dispatch_get_specific(*v10);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v10 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = (const void **)v26;
        v41 = 2114;
        v42 = v29;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v10;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v18 = _NUAssertFailHandler();
    goto LABEL_34;
  }
  if (!a5)
  {
    NUAssertLogger_8802();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "yaw != nil");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x1E0D51D48];
    v17 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v12 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v17)
    {
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v10 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v10;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_36:

      v23 = _NUAssertFailHandler();
      goto LABEL_37;
    }
LABEL_34:
    if (v18)
    {
      v30 = dispatch_get_specific(*v10);
      v31 = (void *)MEMORY[0x1E0CB3978];
      v32 = v30;
      objc_msgSend(v31, "callStackSymbols");
      v10 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = (const void **)v30;
      v41 = 2114;
      v42 = v33;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_36;
  }
  if (!a6)
  {
    NUAssertLogger_8802();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "angle != nil");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v21;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x1E0D51D48];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_8802();
    v12 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v25;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_39;
    }
LABEL_37:
    if (v23)
    {
      v34 = dispatch_get_specific(*v10);
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
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_39:

    _NUAssertFailHandler();
  }
  v6 = *a4;
  v7 = *a5;
  switch(a3)
  {
    case 2:
      v6 = -v7;
      goto LABEL_11;
    case 3:
      *a4 = -v6;
      v6 = -v7;
      goto LABEL_14;
    case 4:
      *a4 = -v6;
      goto LABEL_12;
    case 5:
      *a4 = -v7;
      v6 = -v6;
      goto LABEL_11;
    case 6:
      *a4 = -v7;
      goto LABEL_14;
    case 7:
      *a4 = v7;
LABEL_11:
      *a5 = v6;
LABEL_12:
      *a6 = -*a6;
      break;
    case 8:
      *a4 = v7;
      v6 = -v6;
LABEL_14:
      *a5 = v6;
      break;
    default:
      return;
  }
}

+ (void)requestVisionCleanUp
{
  NSObject *v2;

  dispatch_get_global_queue(-32768, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_8999);

}

void __51__PIPerspectiveAutoCalculator_requestVisionCleanUp__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint8_t v3[16];

  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_410);
  v0 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A6382000, v0, OS_LOG_TYPE_DEFAULT, "Requesting forced cleanup of Vision caches", v3, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visionSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseCachedResources");

}

@end

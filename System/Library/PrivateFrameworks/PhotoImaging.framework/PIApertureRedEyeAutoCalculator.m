@implementation PIApertureRedEyeAutoCalculator

- (void)cancel
{
  id v2;

  -[NUFaceDetectionRequest renderContext](self->_faceRequest, "renderContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllRequests");

}

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  NUFaceDetectionRequest *v6;
  NUFaceDetectionRequest *faceRequest;
  void *v8;
  void *v9;
  void *v10;
  NUFaceDetectionRequest *v11;
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
    NUAssertLogger_14078();
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
    NUAssertLogger_14078();
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
  v6 = (NUFaceDetectionRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520A8]), "initWithRequest:", self);
  faceRequest = self->_faceRequest;
  self->_faceRequest = v6;

  -[NUFaceDetectionRequest setName:](self->_faceRequest, "setName:", CFSTR("PIApertureRedEyeAutoCalculator-faceDetection"));
  +[PIPipelineFilters stopAtTagIncludeOrientationFilter:](PIPipelineFilters, "stopAtTagIncludeOrientationFilter:", CFSTR("pre-Adjustments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUFaceDetectionRequest setPipelineFilters:](self->_faceRequest, "setPipelineFilters:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 1741824);
  -[NUFaceDetectionRequest setScalePolicy:](self->_faceRequest, "setScalePolicy:", v10);

  -[NUFaceDetectionRequest setSampleMode:](self->_faceRequest, "setSampleMode:", 3);
  v11 = self->_faceRequest;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __41__PIApertureRedEyeAutoCalculator_submit___block_invoke;
  v26[3] = &unk_1E5019E90;
  v26[4] = self;
  v27 = v5;
  v12 = v5;
  -[NUFaceDetectionRequest submit:](v11, "submit:", v26);

}

- (id)apertureRedEyeResultFromFaceObservations:(id)a3 imageSize:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  id obj;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  const __CFString *v73;
  id v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[3];
  _QWORD v82[3];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("orientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intValue");

  v64 = NUOrientationInverse();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v70;
    v63 = *(_QWORD *)v70;
    do
    {
      v12 = 0;
      v66 = v10;
      do
      {
        if (*(_QWORD *)v70 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v12);
        objc_msgSend(v13, "boundingBox");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v13, "landmarks");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "leftEye");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "landmarks");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "rightEye");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "pointCount") && objc_msgSend(v25, "pointCount"))
        {
          v26 = objc_retainAutorelease(v23);
          +[PIAutoCalculatorUtils averageCGPoints:pointCount:](PIAutoCalculatorUtils, "averageCGPoints:pointCount:", objc_msgSend(v26, "normalizedPoints"), objc_msgSend(v26, "pointCount"));
          v28 = v27;
          v30 = v29;
          v31 = objc_retainAutorelease(v25);
          +[PIAutoCalculatorUtils averageCGPoints:pointCount:](PIAutoCalculatorUtils, "averageCGPoints:pointCount:", objc_msgSend(v31, "normalizedPoints"), objc_msgSend(v31, "pointCount"));
          v33 = v32;
          v35 = v34;
          +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v64, v28, v30, v15, v17, v19, v21);
          v37 = v36;
          v39 = v38;
          +[PIAutoCalculatorUtils convertFacePoint:toImagePointWithFaceRect:orientation:](PIAutoCalculatorUtils, "convertFacePoint:toImagePointWithFaceRect:orientation:", v64, v33, v35, v15, v17, v19, v21);
          v41 = v40;
          v43 = v42;
          v44 = sqrt((v37 - v40) * (v37 - v40) + (v39 - v42) * (v39 - v42)) * 0.11;
          v68 = NUOrientationTransformImageSize();
          v46 = v39 * (double)v45;
          v47 = v41 * (double)v68;
          v48 = v43 * (double)v45;
          v49 = v44 * (double)v68;
          v81[0] = CFSTR("center");
          v79[0] = CFSTR("x");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37 * (double)v68);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v79[1] = CFSTR("y");
          v80[0] = v50;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v80[1] = v51;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v82[0] = v52;
          v81[1] = CFSTR("radius");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v81[2] = CFSTR("sensitivity");
          v82[1] = v53;
          v82[2] = &unk_1E5051E78;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v54);

          v77[0] = CFSTR("center");
          v75[0] = CFSTR("x");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v75[1] = CFSTR("y");
          v76[0] = v55;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v76[1] = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = v57;
          v77[1] = CFSTR("radius");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v77[2] = CFSTR("sensitivity");
          v78[1] = v58;
          v78[2] = &unk_1E5051E78;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v59);

          v11 = v63;
          v10 = v66;

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    }
    while (v10);
  }

  v73 = CFSTR("redEyeSpots");
  v74 = v65;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceRequest, 0);
}

void __41__PIApertureRedEyeAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "faces");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "imageSize");
    objc_msgSend(v5, "apertureRedEyeResultFromFaceObservations:imageSize:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v4 = (id)v10;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
  }

}

@end

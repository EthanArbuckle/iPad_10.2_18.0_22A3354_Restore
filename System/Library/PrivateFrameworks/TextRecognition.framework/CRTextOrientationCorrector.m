@implementation CRTextOrientationCorrector

- (CRTextOrientationCorrector)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  CRTextOrientationCorrector *v7;
  CRTextOrientationRecognizerConfiguration *v8;
  id v9;
  CRTextOrientationRecognizerConfiguration *configuration;
  CRTextOrientationModelV1 *v11;
  CRTextOrientationRecognizerConfiguration *v12;
  uint64_t v13;
  id v14;
  CRTextOrientationModelV1 *model;
  CRCTCCVNLPOrientationDecoder *v16;
  CRTextOrientationRecognizerConfiguration *v17;
  CRTextOrientationModelV1 *v18;
  uint64_t v19;
  CRCTCCVNLPOrientationDecoder *decoder;
  NSObject *v21;
  const char *v22;
  CRTextOrientationCorrector *v23;
  id v25;
  id v26;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CRTextOrientationCorrector;
  v7 = -[CRTextOrientationCorrector init](&v28, sel_init);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_17;
  }
  v27 = 0;
  v8 = -[CRTextOrientationRecognizerConfiguration initWithImageReaderOptions:error:]([CRTextOrientationRecognizerConfiguration alloc], "initWithImageReaderOptions:error:", v6, &v27);
  v9 = v27;
  configuration = v7->_configuration;
  v7->_configuration = v8;

  if (!v7->_configuration)
  {
    CROSLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v9;
      v22 = "Could not initialize orientation corrector configuration. %@";
      goto LABEL_10;
    }
LABEL_14:

    goto LABEL_15;
  }
  v11 = [CRTextOrientationModelV1 alloc];
  v12 = v7->_configuration;
  v26 = v9;
  v13 = -[CRTextSequenceRecognizerModelEspresso initWithConfiguration:error:](v11, "initWithConfiguration:error:", v12, &v26);
  v14 = v26;

  model = v7->_model;
  v7->_model = (CRTextOrientationModelV1 *)v13;

  if (!v7->_model)
  {
    CROSLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1D4FB8000, v21, OS_LOG_TYPE_FAULT, "Could not initialize orientation corrector model. %@", buf, 0xCu);
    }
    v9 = v14;
    goto LABEL_14;
  }
  v16 = [CRCTCCVNLPOrientationDecoder alloc];
  v17 = v7->_configuration;
  v18 = v7->_model;
  v25 = v14;
  v19 = -[CRCTCCVNLPOrientationDecoder initWithConfiguration:model:error:](v16, "initWithConfiguration:model:error:", v17, v18, &v25);
  v9 = v25;

  decoder = v7->_decoder;
  v7->_decoder = (CRCTCCVNLPOrientationDecoder *)v19;

  if (!v7->_decoder)
  {
    CROSLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v9;
      v22 = "Could not initialize orientation corrector decoder. %@";
LABEL_10:
      _os_log_impl(&dword_1D4FB8000, v21, OS_LOG_TYPE_FAULT, v22, buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
LABEL_15:
  if (!v7->_model || !v7->_decoder)
  {
    v23 = 0;
    goto LABEL_21;
  }
LABEL_17:
  if (a4)
    *a4 = objc_retainAutorelease(v9);
  v23 = v7;
LABEL_21:

  return v23;
}

- (BOOL)decodeOutputForInput:(id)a3 shouldDecodeScriptResult:(BOOL)a4 shouldDecodeOrientationResult:(BOOL)a5 shouldDecodeLayoutDirectionResult:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  CRTextOrientationModelV1 *model;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  CRCTCCVNLPOrientationDecoder *decoder;
  void *v20;
  BOOL v21;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  _QWORD v27[2];

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  model = self->_model;
  v27[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  -[CRTextSequenceRecognizerModelEspresso predictFromInputs:error:](model, "predictFromInputs:error:", v14, &v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;

  if (v16)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v16);
    CROSLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    v18 = "Orientation correction model inference error. %@";
    goto LABEL_11;
  }
  decoder = self->_decoder;
  objc_msgSend(v15, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  -[CRCTCCVNLPOrientationDecoder decodeOutput:imageSize:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:error:](decoder, "decodeOutput:imageSize:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:error:", v20, v10, v9, v8, &v23, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v16 = v23;

  if (!v16)
  {
    v21 = 1;
    goto LABEL_13;
  }
  if (a7)
    *a7 = objc_retainAutorelease(v16);
  CROSLogForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    v18 = "Orientation correction decoding error. %@";
LABEL_11:
    _os_log_impl(&dword_1D4FB8000, v17, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
  }
LABEL_12:

  v21 = 0;
LABEL_13:

  return v21;
}

- (int64_t)calculateAngleDirectionForInput:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  NSObject *v20;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4 && *a4)
  {
LABEL_25:
    v19 = 0;
    goto LABEL_26;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "textFeatureInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (!v8)
  {

    v10 = 0;
    v11 = 0;
LABEL_22:
    CROSLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v29 = v10;
      v30 = 2048;
      v31 = v11;
      _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEBUG, "Could not determine orientation for width %ld positive and %ld negative", buf, 0x16u);
    }

    goto LABEL_25;
  }
  v9 = v8;
  v22 = v6;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v7);
      v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
      if (v14 && *(double *)(v14 + 32) > 0.1)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "lineRegion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "boundingQuad");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "baselineAngle");
        v17 = -[CRTextOrientationCorrector _angleDirectionOfBaselineAngle:](self, "_angleDirectionOfBaselineAngle:");

        v18 = 1;
        if (*(_QWORD *)(v14 + 24) == 2)
          v18 = 2;
        if (v17 == v18)
          ++v10;
        else
          ++v11;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  }
  while (v9);

  if (v10 <= v11)
  {
    v6 = v22;
    if (v11 > v10)
    {
      v19 = 2;
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  v19 = 1;
  v6 = v22;
LABEL_26:

  return v19;
}

- (unint64_t)calculateLayoutDirectionForInput:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4 && *a4)
  {
    v7 = 0;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "textFeatureInfo", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v8);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (v15)
            v15 = *(_QWORD *)(v15 + 72);
          if (v15 == 5)
            ++v12;
          else
            ++v11;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    if (v12 <= v11)
      v7 = 1;
    else
      v7 = 5;
  }

  return v7;
}

- (int64_t)calculateAngleDirectionForTextFeatureInfo:(id)a3 error:(id *)a4
{
  double *v6;
  double *v7;
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = (double *)a3;
  v7 = v6;
  if (a4 && *a4)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "lineRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "boundingQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "baselineAngle");
    v8 = -[CRTextOrientationCorrector _angleDirectionOfBaselineAngle:](self, "_angleDirectionOfBaselineAngle:");

    if (v7 && v7[4] > 0.1)
    {
      v11 = 1;
      if (v8 != 2)
        v11 = 2;
      if (*((_QWORD *)v7 + 3) == 2)
        v8 = v11;
    }
  }

  return v8;
}

- (id)regionsByCorrectingOrientationOnSortedRegions:(id)a3 correctAllRegions:(BOOL)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7
{
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  CROrderedIndexSet *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  uint8_t *v38;
  BOOL v39;
  _QWORD v40[5];
  id v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v29 = a5;
  v30 = a6;
  -[CRTextOrientationCorrector model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_4:
    v12 = objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v13 = v31;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v49 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v18, "boundingQuad");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "baselineAngle");
          objc_msgSend(v19, "numberWithInteger:", -[CRTextOrientationCorrector _orientationForBaselineAngle:layoutDirection:](self, "_orientationForBaselineAngle:layoutDirection:", objc_msgSend(v18, "layoutDirection"), v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (a4 || objc_msgSend(v18, "shouldRunSequenceOrientation"))
          {
            -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23 == 0;

            if (v24)
            {
              v25 = -[CROrderedIndexSet initWithArray:]([CROrderedIndexSet alloc], "initWithArray:", v13);
              -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v25, v22);

            }
            -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addIndex:", v15 + i);

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        v15 += i;
      }
      while (v14);
    }

    *(_QWORD *)buf = 0;
    v43 = buf;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__11;
    v46 = __Block_byref_object_dispose__11;
    v47 = (id)objc_msgSend(v13, "mutableCopy");
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__11;
    v40[4] = __Block_byref_object_dispose__11;
    v41 = 0;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __116__CRTextOrientationCorrector_regionsByCorrectingOrientationOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke;
    v33[3] = &unk_1E98DADE0;
    v33[4] = self;
    v34 = v13;
    v39 = a4;
    v35 = v29;
    v36 = v30;
    v37 = v40;
    v38 = buf;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v33);
    v27 = (void *)objc_msgSend(*((id *)v43 + 5), "copy");

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_17;
  }
  if (-[CRTextOrientationCorrector _loadResourcesWithError:](self, "_loadResourcesWithError:", a7))
    goto LABEL_4;
  CROSLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_FAULT, "Orientation corrector unable to load resources", buf, 2u);
  }
  v27 = 0;
LABEL_17:

  return v27;
}

void __116__CRTextOrientationCorrector_regionsByCorrectingOrientationOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  unint64_t i;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  unint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  int v65;
  id v66;
  void *v67;
  id v68;
  int v69;
  id v70;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  id obj;
  void *v77;
  uint64_t v78;
  uint8_t buf[16];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  id v85;
  id v86;
  id v87;
  _QWORD v88[6];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v66 = a2;
  v78 = a1;
  v68 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_localeSortedRegions:indexSet:", *(_QWORD *)(a1 + 40));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1;
  v69 = *(unsigned __int8 *)(a1 + 80);
  if (*(_BYTE *)(a1 + 80))
  {
    v7 = v67;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "batchSize");

    v10 = objc_msgSend(v67, "count");
    if (v9 >= v10)
      v11 = v10;
    else
      v11 = v9;
    objc_msgSend(v67, "subIndexSetWithRange:", 0, v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v78;
  }
  v73 = v7;
  if (objc_msgSend(v7, "count"))
  {
    LODWORD(v72) = 0;
    while (1)
    {
      objc_msgSend(*(id *)(v6 + 32), "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "batchSize");

      objc_msgSend(v73, "count");
      objc_msgSend(v73, "subIndexSetWithRange:");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = 0;
      v93[1] = v93;
      v93[2] = 0x2020000000;
      v93[3] = -1;
      v89 = 0;
      v90 = &v89;
      v91 = 0x2020000000;
      v92 = 0;
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __116__CRTextOrientationCorrector_regionsByCorrectingOrientationOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke_2;
      v88[3] = &unk_1E98DADB8;
      v88[4] = v93;
      v88[5] = &v89;
      objc_msgSend(v77, "enumerateObjectsUsingBlock:", v88);
      objc_msgSend(v77, "objects");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v78 + 32), "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "inputWidths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v78 + 32), "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectAtIndexedSubscript:", v90[3]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "aspectRatio");
      objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v15, "bestFitWidthIndexForAspectRatio:"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      objc_msgSend(*(id *)(v78 + 32), "model");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(v78 + 48);
      objc_msgSend(*(id *)(v78 + 32), "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "inputBatchFromLineRegions:image:regionWidth:configuration:rectifier:", v74, v21, v22, *(_QWORD *)(v78 + 56), v19);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v78;
      v24 = *(void **)(v78 + 32);
      v87 = 0;
      v25 = objc_msgSend(v24, "decodeOutputForInput:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:error:", v75, 0, 1, 1, &v87);
      v26 = v87;
      v27 = v87;
      if (v27)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v78 + 64) + 8) + 40), v26);
        *a4 = 1;
        v23 = v78;
      }
      if (!v25)
        goto LABEL_48;
      v28 = v77;
      if (v69)
      {
        for (i = 0; objc_msgSend(v28, "count") > i; ++i)
        {
          objc_msgSend(v75, "textFeatureInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", i);
          v31 = (_QWORD *)objc_claimAutoreleasedReturnValue();

          v32 = *(void **)(v78 + 32);
          v33 = v27;
          v86 = v27;
          v34 = objc_msgSend(v32, "calculateAngleDirectionForTextFeatureInfo:error:", v31, &v86);
          v27 = v86;

          objc_msgSend(v77, "indices");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectAtIndexedSubscript:", i);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v78 + 40), "objectAtIndexedSubscript:", objc_msgSend(v36, "integerValue"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v78 + 32), "_lineRegion:applyingAngleDirection:", v37, v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v38, "mutableCopy");

          if (v31)
          {
            if (v31[9])
              objc_msgSend(v39, "setLayoutDirection:");
          }
          objc_msgSend(v37, "uuid");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setUuid:", v40);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v78 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v39, objc_msgSend(v36, "integerValue"));
          v28 = v77;
        }
        goto LABEL_48;
      }
      v41 = *(void **)(v23 + 32);
      v85 = v27;
      v42 = objc_msgSend(v41, "calculateAngleDirectionForInput:error:", v75, &v85);
      v43 = v85;

      v44 = *(void **)(v78 + 32);
      v84 = v43;
      v45 = objc_msgSend(v44, "calculateLayoutDirectionForInput:error:", v75, &v84);
      v46 = v84;
      v70 = v84;

      if (v70)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v78 + 64) + 8) + 40), v46);
        *a4 = 1;
      }
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(v68, "indices");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
      if (v48)
        break;
LABEL_47:

      v27 = v70;
LABEL_48:

      _Block_object_dispose(&v89, 8);
      _Block_object_dispose(v93, 8);

      objc_msgSend(*(id *)(v78 + 32), "configuration");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "batchSize");

      v72 = v65 + (int)v72;
      v6 = v78;
      if (v72 >= objc_msgSend(v73, "count"))
        goto LABEL_49;
    }
    v49 = *(_QWORD *)v81;
    obj = v47;
LABEL_23:
    v50 = 0;
    while (1)
    {
      if (*(_QWORD *)v81 != v49)
        objc_enumerationMutation(obj);
      v51 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v50);
      objc_msgSend(*(id *)(v78 + 40), "objectAtIndexedSubscript:", objc_msgSend(v51, "integerValue"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend(*(id *)(v78 + 32), "_lineRegion:applyingAngleDirection:", v52, v42);
        v53 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "mutableCopy");
      }
      else
      {
        objc_msgSend(v77, "indices");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "indexOfObject:", v51);

        CROSLogForCategory(0);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG);
        if (v58 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v60)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4FB8000, v59, OS_LOG_TYPE_DEBUG, "Orientation correction fallback using detector orientation results", buf, 2u);
          }

          if (!objc_msgSend(v52, "shouldRotate180DetectorOrientationFallback"))
          {
            v55 = (void *)objc_msgSend(v52, "mutableCopy");
            goto LABEL_30;
          }
          objc_msgSend(v52, "rotated180");
          v53 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "mutableCopy");
        }
        else
        {
          if (v60)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4FB8000, v59, OS_LOG_TYPE_DEBUG, "Orientation correction fallback using sequence orientation results", buf, 2u);
          }

          objc_msgSend(v75, "textFeatureInfo");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", v58);
          v53 = (_QWORD *)objc_claimAutoreleasedReturnValue();

          if (v53 && v53[3] == 2)
          {
            objc_msgSend(v52, "rotated180");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (void *)objc_msgSend(v62, "mutableCopy");

            goto LABEL_29;
          }
          v54 = objc_msgSend(v52, "mutableCopy");
        }
      }
      v55 = (void *)v54;
LABEL_29:

LABEL_30:
      if (v45 >= 2)
        objc_msgSend(v55, "setLayoutDirection:", v45);
      objc_msgSend(v52, "uuid");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setUuid:", v56);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v78 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v55, objc_msgSend(v51, "integerValue"));
      if (v48 == ++v50)
      {
        v47 = obj;
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
        v48 = v63;
        if (!v63)
          goto LABEL_47;
        goto LABEL_23;
      }
    }
  }
LABEL_49:

}

uint64_t __116__CRTextOrientationCorrector_regionsByCorrectingOrientationOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke_2(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v4 + 24) > a3)
  {
    *(_QWORD *)(v4 + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a4;
  }
  return result;
}

- (id)regionsByCorrectingSequenceScriptOnSortedRegions:(id)a3 correctAllRegions:(BOOL)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id *v24;
  void *v25;
  NSObject *v27;
  id obj;
  _QWORD v29[4];
  id v30;
  CRTextOrientationCorrector *v31;
  id v32;
  id v33;
  id v34;
  uint8_t *v35;
  _QWORD v36[4];
  id v37;
  BOOL v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  -[CRTextOrientationCorrector model](self, "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

LABEL_4:
    *(_QWORD *)buf = 0;
    v40 = buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__11;
    v43 = __Block_byref_object_dispose__11;
    v44 = 0;
    v16 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v17 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __119__CRTextOrientationCorrector_regionsByCorrectingSequenceScriptOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke;
    v36[3] = &unk_1E98DAE08;
    v38 = a4;
    v18 = v16;
    v37 = v18;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v36);
    v19 = (void *)objc_msgSend(v12, "mutableCopy");
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = __119__CRTextOrientationCorrector_regionsByCorrectingSequenceScriptOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke_2;
    v29[3] = &unk_1E98DAE30;
    v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v30 = v20;
    v31 = self;
    v21 = v19;
    v32 = v21;
    v22 = v13;
    v33 = v22;
    v23 = v14;
    v34 = v23;
    v35 = buf;
    objc_msgSend(v18, "enumerateIndexesUsingBlock:", v29);
    if (objc_msgSend(v20, "count"))
    {
      v24 = (id *)(v40 + 40);
      obj = (id)*((_QWORD *)v40 + 5);
      -[CRTextOrientationCorrector _correctScriptOnRegions:indexes:image:rectifier:error:](self, "_correctScriptOnRegions:indexes:image:rectifier:error:", v21, v20, v22, v23, &obj);
      objc_storeStrong(v24, obj);
    }
    -[CRTextOrientationCorrector _scriptCorrectionBasedOnLayoutDirectionOnLineRegions:](self, "_scriptCorrectionBasedOnLayoutDirectionOnLineRegions:", v21);
    v25 = (void *)objc_msgSend(v21, "copy");

    _Block_object_dispose(buf, 8);
    goto LABEL_7;
  }
  if (-[CRTextOrientationCorrector _loadResourcesWithError:](self, "_loadResourcesWithError:", a7))
    goto LABEL_4;
  CROSLogForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4FB8000, v27, OS_LOG_TYPE_FAULT, "Orientation corrector unable to load resources", buf, 2u);
  }

  v25 = 0;
LABEL_7:

  return v25;
}

void __119__CRTextOrientationCorrector_regionsByCorrectingSequenceScriptOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (*(_BYTE *)(a1 + 40) || objc_msgSend(v5, "shouldRunSequenceScript"))
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);

}

void __119__CRTextOrientationCorrector_regionsByCorrectingSequenceScriptOnSortedRegions_correctAllRegions_image_rectifier_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "batchSize");

  if (v3 == v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v15 = 0;
    objc_msgSend(v6, "_correctScriptOnRegions:indexes:image:rectifier:error:", v8, v7, v9, v10, &v15);
    v11 = v15;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
    v14 = v11;

    objc_msgSend(*(id *)(a1 + 32), "removeAllIndexes");
  }
}

- (void)_correctScriptOnRegions:(id)a3 indexes:(id)a4 image:(id)a5 rectifier:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  id v32;

  v11 = a3;
  v12 = a4;
  v26 = a5;
  v13 = a6;
  objc_msgSend(v11, "objectsAtIndexes:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextOrientationCorrector configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inputWidths");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextOrientationCorrector configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "aspectRatio");
  objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v17, "bestFitWidthIndexForAspectRatio:"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  -[CRTextOrientationCorrector model](self, "model");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextOrientationCorrector configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "inputBatchFromLineRegions:image:regionWidth:configuration:rectifier:", v14, v26, v23, v13, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  LODWORD(v22) = -[CRTextOrientationCorrector decodeOutputForInput:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:error:](self, "decodeOutputForInput:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:error:", v24, 1, 0, 0, &v32);
  v25 = v32;
  if ((_DWORD)v22)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __84__CRTextOrientationCorrector__correctScriptOnRegions_indexes_image_rectifier_error___block_invoke;
    v27[3] = &unk_1E98DAE58;
    v28 = v11;
    v30 = v31;
    v29 = v24;
    objc_msgSend(v12, "enumerateIndexesUsingBlock:", v27);

    _Block_object_dispose(v31, 8);
  }

}

void __84__CRTextOrientationCorrector__correctScriptOnRegions_indexes_image_rectifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  SEL v19;
  id v20;
  void *v21;
  SEL v22;
  id v23;
  SEL v24;
  id v25;
  const char *v26;
  id v27;
  id Property;
  id v29;
  const char *v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "textFeatureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "textFeatureInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v8 = objc_claimAutoreleasedReturnValue();

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    -[NSObject lineRegion](v8, "lineRegion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v12)
    {
      CROSLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
LABEL_8:

        goto LABEL_21;
      }
      objc_msgSend(v4, "boundingQuad");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "denormalizedQuad");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412290;
      v35 = v14;
      _os_log_impl(&dword_1D4FB8000, v9, OS_LOG_TYPE_DEBUG, "Skiping script on region with quads %@", (uint8_t *)&v34, 0xCu);

LABEL_7:
      goto LABEL_8;
    }
    if (v8)
    {
      v15 = objc_getProperty(v8, v13, 48, 1);
      if (v15)
      {
        v17 = v15;
        objc_msgSend(v4, "topScriptCategory");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_getProperty(v8, v19, 48, 1);

        if (v18 != v20)
        {
          v21 = (void *)objc_msgSend(v4, "mutableCopy");
          v23 = objc_getProperty(v8, v22, 48, 1);
          objc_msgSend(v21, "setTopScriptCategory:", v23);

          v25 = objc_getProperty(v8, v24, 56, 1);
          if (!v25)
          {
LABEL_20:
            objc_msgSend(v4, "uuid");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setUuid:", v33);

            objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v21, a2);
            goto LABEL_21;
          }
          v27 = objc_getProperty(v8, v26, 56, 1);
LABEL_19:
          v32 = v27;
          objc_msgSend(v21, "setSequenceScriptOutputResult:", v27);

          goto LABEL_20;
        }
      }
      Property = objc_getProperty(v8, v16, 56, 1);
    }
    else
    {
      Property = 0;
    }
    v29 = Property;

    if (!v29)
      goto LABEL_21;
    v21 = (void *)objc_msgSend(v4, "mutableCopy");
    if (v8)
      v31 = objc_getProperty(v8, v30, 56, 1);
    else
      v31 = 0;
    v27 = v31;
    goto LABEL_19;
  }
  CROSLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "boundingQuad");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject denormalizedQuad](v9, "denormalizedQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138412290;
    v35 = v10;
    _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_DEBUG, "Skiping script on region with quads %@", (uint8_t *)&v34, 0xCu);
    goto LABEL_7;
  }
LABEL_21:

}

- (BOOL)_loadResourcesWithError:(id *)a3
{
  CRTextOrientationModelV1 *v5;
  CRTextOrientationRecognizerConfiguration *configuration;
  CRTextOrientationModelV1 *v7;
  id v8;
  CRTextOrientationModelV1 *model;
  CRCTCCVNLPOrientationDecoder *v10;
  CRTextOrientationRecognizerConfiguration *v11;
  CRTextOrientationModelV1 *v12;
  CRCTCCVNLPOrientationDecoder *v13;
  id v14;
  CRCTCCVNLPOrientationDecoder *decoder;
  NSObject *v16;
  BOOL v17;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = [CRTextOrientationModelV1 alloc];
  configuration = self->_configuration;
  v20 = 0;
  v7 = -[CRTextSequenceRecognizerModelEspresso initWithConfiguration:error:](v5, "initWithConfiguration:error:", configuration, &v20);
  v8 = v20;
  model = self->_model;
  self->_model = v7;

  if (a3)
    *a3 = objc_retainAutorelease(v8);
  if (!self->_model)
  {
    CROSLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_FAULT, "Could not initialize orientation corrector model. %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v10 = [CRCTCCVNLPOrientationDecoder alloc];
  v11 = self->_configuration;
  v12 = self->_model;
  v19 = v8;
  v13 = -[CRCTCCVNLPOrientationDecoder initWithConfiguration:model:error:](v10, "initWithConfiguration:model:error:", v11, v12, &v19);
  v14 = v19;

  decoder = self->_decoder;
  self->_decoder = v13;

  if (a3)
    *a3 = objc_retainAutorelease(v14);
  if (!self->_decoder)
  {
    CROSLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_FAULT, "Could not initialize orientation corrector decoder. %@", buf, 0xCu);
    }
    v8 = v14;
LABEL_12:

    v14 = v8;
  }
  if (self->_model)
    v17 = self->_decoder != 0;
  else
    v17 = 0;

  return v17;
}

- (id)_lineRegion:(id)a3 applyingAngleDirection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  id v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "boundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baselineAngle");
  v8 = -[CRTextOrientationCorrector _angleDirectionOfBaselineAngle:](self, "_angleDirectionOfBaselineAngle:");

  if (v8 == a4)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(v6, "rotated180");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (int64_t)_orientationForBaselineAngle:(double)a3
{
  double v3;
  double v4;

  if (a3 <= 3.14159265)
  {
    if (a3 > -3.14159265)
      goto LABEL_6;
    v3 = 6.28318531;
  }
  else
  {
    v3 = -6.28318531;
  }
  a3 = a3 + v3;
LABEL_6:
  v4 = fabs(a3);
  return v4 >= 1.22 && v4 <= 1.92;
}

- (int64_t)_orientationForBaselineAngle:(double)a3 layoutDirection:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 5)
    return 2;
  else
    return -[CRTextOrientationCorrector _orientationForBaselineAngle:](self, "_orientationForBaselineAngle:", a3, v4, v5) == 1;
}

- (int64_t)_angleDirectionOfBaselineAngle:(double)a3
{
  double v3;
  double v4;
  int64_t v5;
  _BOOL4 v7;

  v3 = a3;
  if (a3 <= 3.14159265)
  {
    if (a3 > -3.14159265)
      goto LABEL_6;
    v4 = 6.28318531;
  }
  else
  {
    v4 = -6.28318531;
  }
  v3 = v3 + v4;
LABEL_6:
  v5 = -[CRTextOrientationCorrector _orientationForBaselineAngle:](self, "_orientationForBaselineAngle:", v3);
  v7 = fabs(v3) > 1.92 && v5 == 0;
  if (v3 < 0.0 && v5 == 1)
    v7 = 1;
  if (v7)
    return 2;
  else
    return 1;
}

- (id)_localeSortedRegions:(id)a3 indexSet:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  CROrderedIndexSet *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
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
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  -[CRTextOrientationCorrector configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "batchSize");

  if (v8 < v10)
  {
    v11 = (CROrderedIndexSet *)v7;
    goto LABEL_19;
  }
  v12 = (void *)objc_opt_new();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __60__CRTextOrientationCorrector__localeSortedRegions_indexSet___block_invoke;
  v40[3] = &unk_1E98DAE80;
  v13 = v12;
  v41 = v13;
  v35 = v6;
  v14 = v6;
  v42 = v14;
  v34 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v40);
  objc_msgSend(v13, "keysSortedByValueUsingComparator:", &__block_literal_global_18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CROrderedIndexSet initWithArray:]([CROrderedIndexSet alloc], "initWithArray:", v14);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (!v17)
    goto LABEL_14;
  v18 = v17;
  v19 = *(_QWORD *)v37;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v37 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v20);
      +[CRScriptCategoryV1 common]();
      v22 = objc_claimAutoreleasedReturnValue();
      if (v21 != (void *)v22)
      {
        v23 = (void *)v22;
        +[CRScriptCategoryV1 unknown]();
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 == v24)
          goto LABEL_12;
        objc_msgSend(v13, "objectForKeyedSubscript:", v21);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CROrderedIndexSet addIndexSet:](v11, "addIndexSet:", v21);
      }

LABEL_12:
      ++v20;
    }
    while (v18 != v20);
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  }
  while (v18);
LABEL_14:

  +[CRScriptCategoryV1 common]();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    +[CRScriptCategoryV1 common]();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROrderedIndexSet addIndexSet:](v11, "addIndexSet:", v28);

  }
  +[CRScriptCategoryV1 unknown]();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    +[CRScriptCategoryV1 unknown]();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROrderedIndexSet addIndexSet:](v11, "addIndexSet:", v32);

  }
  v7 = v34;
  v6 = v35;
LABEL_19:

  return v11;
}

void __60__CRTextOrientationCorrector__localeSortedRegions_indexSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CROrderedIndexSet *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "topScriptCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[CRScriptCategoryV1 unknown]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[CRScriptCategoryV1 latinCyrillic]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v5, "scriptCategoryResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("probability"), 0);
    v22[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingDescriptors:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "scriptCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRScriptCategoryV1 common]();
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      objc_msgSend(v12, "scriptCategory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRScriptCategoryV1 unknown]();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 != v17)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    objc_msgSend(v12, "scriptCategory");
    v18 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v18;
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = -[CROrderedIndexSet initWithArray:]([CROrderedIndexSet alloc], "initWithArray:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addIndex:", a3);

}

uint64_t __60__CRTextOrientationCorrector__localeSortedRegions_indexSet___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    if (v8 <= objc_msgSend(v5, "count"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_scriptCorrectionBasedOnLayoutDirectionOnLineRegions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __83__CRTextOrientationCorrector__scriptCorrectionBasedOnLayoutDirectionOnLineRegions___block_invoke;
  v27[3] = &unk_1E98DAEC8;
  v6 = v5;
  v28 = v6;
  v7 = v4;
  v29 = v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v27);
  if (objc_msgSend(v6, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    +[CRScriptCategoryV1 verticalLayoutSupportedCategories](CRScriptCategoryV1, "verticalLayoutSupportedCategories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v9)
    {
      v10 = v9;
      v19 = v3;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v16 = objc_msgSend(v7, "countForObject:", v15);
          if (v16 > v12)
          {
            v17 = v16;
            v18 = v15;

            v11 = v18;
            v12 = v17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v10);

      if (!v12 || !v11)
      {
        v3 = v19;
        goto LABEL_17;
      }
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __83__CRTextOrientationCorrector__scriptCorrectionBasedOnLayoutDirectionOnLineRegions___block_invoke_2;
      v20[3] = &unk_1E98DAEF0;
      v3 = v19;
      v21 = v19;
      v11 = v11;
      v22 = v11;
      objc_msgSend(v6, "enumerateIndexesUsingBlock:", v20);

      v8 = v21;
    }
    else
    {
      v11 = 0;
    }

LABEL_17:
  }

}

void __83__CRTextOrientationCorrector__scriptCorrectionBasedOnLayoutDirectionOnLineRegions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "layoutDirection") == 5)
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  objc_msgSend(v8, "topScriptCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v8, "topScriptCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __83__CRTextOrientationCorrector__scriptCorrectionBasedOnLayoutDirectionOnLineRegions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[CRScriptCategoryV1 verticalLayoutSupportedCategories](CRScriptCategoryV1, "verticalLayoutSupportedCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topScriptCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
    objc_msgSend(v6, "setTopScriptCategory:", *(_QWORD *)(a1 + 40));

}

- (id)_indexSetFromIndices:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "integerValue", (_QWORD)v11));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (CRTextOrientationModelV1)model
{
  return (CRTextOrientationModelV1 *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CRCTCCVNLPOrientationDecoder)decoder
{
  return (CRCTCCVNLPOrientationDecoder *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDecoder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CRTextOrientationRecognizerConfiguration)configuration
{
  return (CRTextOrientationRecognizerConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end

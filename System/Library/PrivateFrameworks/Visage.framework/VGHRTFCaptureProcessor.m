@implementation VGHRTFCaptureProcessor

- (VGHRTFCaptureProcessor)initWithConfig:(id)a3 error:(id *)a4
{
  id v7;
  VGHRTFCaptureProcessor *v8;
  VGHRTFCaptureProcessor *v9;
  id *p_config;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *modelsRootPath;
  VGHRTFCaptureProcessor *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  NSObject *v22;
  NSString *v23;
  VGHRTFFaceCaptureProcessor *v24;
  void *v25;
  uint64_t v26;
  VGHRTFFaceCaptureProcessor *faceCapture;
  VGHRTFFaceCaptureUpdateData *faceResults;
  int v29;
  NSObject *v30;
  VGHRTFEarPCACaptureProcessor *v31;
  void *v32;
  uint64_t v33;
  VGHRTFEarPCACaptureProcessor *earPCACapture;
  __CFString *v35;
  NSObject *v36;
  VGHRTFEarCaptureProcessor *v37;
  void *v38;
  uint64_t v39;
  VGHRTFEarCaptureProcessor *earCapture;
  VGHRTFCaptureUpdateData *v41;
  VGHRTFCaptureUpdateData *updateData;
  NSObject *v43;
  objc_super v45;
  uint8_t buf[4];
  NSString *v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v45.receiver = self;
  v45.super_class = (Class)VGHRTFCaptureProcessor;
  v8 = -[VGHRTFCaptureProcessor init](&v45, sel_init);
  v9 = v8;
  if (v8)
  {
    p_config = (id *)&v8->_config;
    objc_storeStrong((id *)&v8->_config, a3);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.visage"));
    if (objc_msgSend(v11, "BOOLForKey:", CFSTR("useLocalHRTFModels")))
    {
      __VGLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v12, OS_LOG_TYPE_INFO, " Using hrtf models from the Visage framework ", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "vg_bundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resourcePath");
      v14 = objc_claimAutoreleasedReturnValue();
      modelsRootPath = v9->_modelsRootPath;
      v9->_modelsRootPath = (NSString *)v14;
    }
    else
    {
      objc_msgSend(*p_config, "modelsRootPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

      if (v18)
      {
        __VGLogSharedInstance();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v43, OS_LOG_TYPE_ERROR, " No ear detection models root path received! ", buf, 2u);
        }

        v35 = CFSTR("Failed to initialize VGHRTFCaptureProcessor with nil models path");
        goto LABEL_26;
      }
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*p_config, "modelsRootPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v13;
      v48[1] = CFSTR("EarDetectionModels");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
      modelsRootPath = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pathWithComponents:", modelsRootPath);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v9->_modelsRootPath;
      v9->_modelsRootPath = (NSString *)v20;

    }
    __VGLogSharedInstance();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = v9->_modelsRootPath;
      *(_DWORD *)buf = 138412290;
      v47 = v23;
      _os_log_impl(&dword_249CAD000, v22, OS_LOG_TYPE_INFO, " Using EarDetectionModels at path: %@ ", buf, 0xCu);
    }

    v24 = [VGHRTFFaceCaptureProcessor alloc];
    objc_msgSend(*p_config, "debugDataRootPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[VGHRTFFaceCaptureProcessor initWithDebugDataPath:](v24, "initWithDebugDataPath:", v25);
    faceCapture = v9->_faceCapture;
    v9->_faceCapture = (VGHRTFFaceCaptureProcessor *)v26;

    if (v9->_faceCapture)
    {
      faceResults = v9->_faceResults;
      v9->_faceResults = 0;

      v29 = _os_feature_enabled_impl();
      v9->_singleStepEnrollment = v29;
      if (v29)
      {
        __VGLogSharedInstance();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v30, OS_LOG_TYPE_DEFAULT, " HRTF enrollment with single step protocol ", buf, 2u);
        }

        v31 = [VGHRTFEarPCACaptureProcessor alloc];
        objc_msgSend(*p_config, "debugDataRootPath");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[VGHRTFEarPCACaptureProcessor initWithDebugDataPath:withModelsRootPath:](v31, "initWithDebugDataPath:withModelsRootPath:", v32, v9->_modelsRootPath);
        earPCACapture = v9->_earPCACapture;
        v9->_earPCACapture = (VGHRTFEarPCACaptureProcessor *)v33;

        if (!v9->_earPCACapture)
        {
          v35 = CFSTR("Failed to initialize VGHRTFEarPCACaptureProcessor");
LABEL_26:
          vg::hrtf::setError(a4, v35);
          v16 = 0;
          goto LABEL_27;
        }
      }
      else
      {
        __VGLogSharedInstance();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v36, OS_LOG_TYPE_DEFAULT, " HRTF enrollment with three step protocol ", buf, 2u);
        }

        v37 = [VGHRTFEarCaptureProcessor alloc];
        objc_msgSend(*p_config, "debugDataRootPath");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[VGHRTFEarCaptureProcessor initWithDebugDataPath:withModelsRootPath:](v37, "initWithDebugDataPath:withModelsRootPath:", v38, v9->_modelsRootPath);
        earCapture = v9->_earCapture;
        v9->_earCapture = (VGHRTFEarCaptureProcessor *)v39;

        if (!v9->_earCapture)
        {
          v35 = CFSTR("Failed to initialize VGHRTFEarCaptureProcessor");
          goto LABEL_26;
        }
      }
      atomic_store(0, (unsigned __int8 *)&v9->_faceCaptureFinished);
      v41 = -[VGHRTFCaptureUpdateData initEmpty]([VGHRTFCaptureUpdateData alloc], "initEmpty");
      updateData = v9->_updateData;
      v9->_updateData = v41;

      -[VGHRTFCaptureUpdateData setFaceCaptureUpdateData:](v9->_updateData, "setFaceCaptureUpdateData:", 0);
      -[VGHRTFCaptureUpdateData setEarCaptureUpdateData:](v9->_updateData, "setEarCaptureUpdateData:", 0);
      v16 = v9;
LABEL_27:

      goto LABEL_28;
    }
    v35 = CFSTR("Failed to initialize VGHRTFFaceCaptureProcessor");
    goto LABEL_26;
  }
  vg::hrtf::setError(a4, CFSTR("Failed to initialize VGHRTFCaptureProcessor."));
  v16 = 0;
LABEL_28:

  return v16;
}

- (id)processCaptureData:(id)a3 faceData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  VGHRTFFaceCaptureProcessor *faceCapture;
  VGHRTFFaceCaptureUpdateData *v17;
  VGHRTFFaceCaptureUpdateData *faceResults;
  void *v19;
  void *v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  if (self->_singleStepEnrollment)
  {
    -[VGHRTFCaptureProcessor processSingleStepCaptureData:faceData:error:](self, "processSingleStepCaptureData:faceData:error:", v8, v9, a5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = -[VGHRTFCaptureUpdateData initEmpty]([VGHRTFCaptureUpdateData alloc], "initEmpty");
    objc_msgSend(v10, "setCaptureData:", v8);
    objc_msgSend(v10, "setFaceData:", v9);
    objc_msgSend(v10, "setFaceCaptureUpdateData:", 0);
    objc_msgSend(v10, "setEarCaptureUpdateData:", 0);
    v12 = atomic_load((unsigned __int8 *)&self->_faceCaptureFinished);
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v10, "setState:", 1);
      objc_msgSend(v10, "setFaceCaptureUpdateData:", self->_faceResults);
      -[VGHRTFEarCaptureProcessor processCaptureData:faceData:](self->_earCapture, "processCaptureData:faceData:", v8, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEarCaptureUpdateData:", v19);

      objc_msgSend(v10, "earCaptureUpdateData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "progressType");

      if (v21 == 3)
        objc_msgSend(v10, "setState:", 2);
    }
    else
    {
      objc_msgSend(v10, "setState:", 0);
      -[VGHRTFFaceCaptureProcessor processCaptureData:faceData:](self->_faceCapture, "processCaptureData:faceData:", v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFaceCaptureUpdateData:", v13);

      objc_msgSend(v10, "faceCaptureUpdateData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "progressType");

      if (v15 == 4)
      {
        faceCapture = self->_faceCapture;
        self->_faceCapture = 0;

        objc_msgSend(v10, "faceCaptureUpdateData");
        v17 = (VGHRTFFaceCaptureUpdateData *)objc_claimAutoreleasedReturnValue();
        faceResults = self->_faceResults;
        self->_faceResults = v17;

        atomic_store(1u, (unsigned __int8 *)&self->_faceCaptureFinished);
      }
    }
  }

  return v10;
}

- (id)processSingleStepCaptureData:(id)a3 faceData:(id)a4 error:(id *)a5
{
  unsigned __int8 v7;
  VGHRTFCaptureUpdateData *updateData;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  VGHRTFCaptureProcessor *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  id v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  VGHRTFFaceCaptureProcessor *faceCapture;
  VGHRTFEarPCACaptureProcessor *earPCACapture;
  VGHRTFCaptureUpdateData *v82;
  id v84;
  id v85;
  id obj;
  id obja;
  void *v88;
  VGHRTFCaptureProcessor *v89;
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
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v84 = a3;
  v85 = a4;
  -[VGHRTFCaptureUpdateData setCaptureData:](self->_updateData, "setCaptureData:", v84);
  -[VGHRTFCaptureUpdateData setFaceData:](self->_updateData, "setFaceData:", v85);
  v7 = atomic_load((unsigned __int8 *)&self->_faceCaptureFinished);
  v89 = self;
  updateData = self->_updateData;
  if ((v7 & 1) != 0)
  {
    -[VGHRTFCaptureUpdateData setState:](updateData, "setState:", 2);
    v33 = self;
  }
  else
  {
    -[VGHRTFCaptureUpdateData setState:](updateData, "setState:", 0);
    -[VGHRTFFaceCaptureProcessor processCaptureData:faceData:](self->_faceCapture, "processCaptureData:faceData:", v84, v85);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGHRTFCaptureUpdateData setFaceCaptureUpdateData:](self->_updateData, "setFaceCaptureUpdateData:", v9);

    -[VGHRTFCaptureUpdateData faceCaptureUpdateData](self->_updateData, "faceCaptureUpdateData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "yawAngle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setYawAngle:", v12);

    -[VGHRTFEarPCACaptureProcessor processCaptureData:faceData:](v89->_earPCACapture, "processCaptureData:faceData:", v84, v85);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGHRTFCaptureUpdateData setEarCaptureUpdateData:](v89->_updateData, "setEarCaptureUpdateData:", v13);

    v88 = (void *)objc_opt_new();
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    -[VGHRTFCaptureUpdateData earCaptureUpdateData](v89->_updateData, "earCaptureUpdateData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rightEarStatusList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingSelector:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v17;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
    v19 = 0;
    v20 = v18;
    if (v18)
    {
      v21 = *(_QWORD *)v99;
      v22 = 0.0;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v99 != v21)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v23);
          -[VGHRTFCaptureUpdateData earCaptureUpdateData](v89->_updateData, "earCaptureUpdateData");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "rightEarStatusList");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "BOOLValue");

          -[VGHRTFCaptureUpdateData earCaptureUpdateData](v89->_updateData, "earCaptureUpdateData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "rightEarStatusList");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "setObject:forKeyedSubscript:", v31, v32);

          v22 = v22 + 1.0;
          v19 += v28;
          ++v23;
        }
        while (v20 != v23);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
      }
      while (v20);
    }
    else
    {
      v22 = 0.0;
    }

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    -[VGHRTFCaptureUpdateData faceCaptureUpdateData](v89->_updateData, "faceCaptureUpdateData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "poseStatusList");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "allKeys");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sortedArrayUsingSelector:", sel_compare_);
    obja = (id)objc_claimAutoreleasedReturnValue();

    v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v95 != v39)
            objc_enumerationMutation(obja);
          v41 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
          -[VGHRTFCaptureUpdateData faceCaptureUpdateData](v89->_updateData, "faceCaptureUpdateData");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "poseStatusList");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", v41);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "BOOLValue");

          -[VGHRTFCaptureUpdateData faceCaptureUpdateData](v89->_updateData, "faceCaptureUpdateData");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "poseStatusList");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", v41);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "setObject:forKeyedSubscript:", v50, v51);

          v22 = v22 + 1.0;
          v19 += v46;
        }
        v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      }
      while (v38);
    }

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    -[VGHRTFCaptureUpdateData earCaptureUpdateData](v89->_updateData, "earCaptureUpdateData");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leftEarStatusList");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "allKeys");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "sortedArrayUsingSelector:", sel_compare_);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v91 != v57)
            objc_enumerationMutation(v55);
          v59 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j);
          -[VGHRTFCaptureUpdateData earCaptureUpdateData](v89->_updateData, "earCaptureUpdateData");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "leftEarStatusList");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", v59);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "BOOLValue");

          -[VGHRTFCaptureUpdateData earCaptureUpdateData](v89->_updateData, "earCaptureUpdateData");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "leftEarStatusList");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "objectForKeyedSubscript:", v59);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "setObject:forKeyedSubscript:", v66, v67);

          v22 = v22 + 1.0;
          v19 += v63;
        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      }
      while (v56);
    }

    v68 = objc_msgSend(v88, "count");
    v69 = -[VGHRTFFaceCaptureUpdateData initEmpty]([VGHRTFFaceCaptureUpdateData alloc], "initEmpty");
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v88, 0);
    objc_msgSend(v69, "setPoseStatusList:", v70);

    -[VGHRTFCaptureUpdateData faceCaptureUpdateData](v89->_updateData, "faceCaptureUpdateData");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setProgressType:", objc_msgSend(v71, "progressType"));

    *(float *)&v72 = (float)v19 / (float)v68;
    objc_msgSend(v69, "setProgress:", v72);
    -[VGHRTFCaptureUpdateData faceCaptureUpdateData](v89->_updateData, "faceCaptureUpdateData");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "trackedData");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setTrackedData:", v74);

    -[VGHRTFCaptureUpdateData faceCaptureUpdateData](v89->_updateData, "faceCaptureUpdateData");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "result");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setResult:", v76);

    -[VGHRTFCaptureUpdateData setFaceCaptureUpdateData:](v89->_updateData, "setFaceCaptureUpdateData:", v69);
    v77 = objc_msgSend(v69, "progressType");
    -[VGHRTFCaptureUpdateData earCaptureUpdateData](v89->_updateData, "earCaptureUpdateData");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "progressType");

    if (v77 == 4 && v79 == 3)
    {
      faceCapture = v89->_faceCapture;
      v89->_faceCapture = 0;

      earPCACapture = v89->_earPCACapture;
      v89->_earPCACapture = 0;

      objc_storeStrong((id *)&v89->_faceResults, v69);
      atomic_store(1u, (unsigned __int8 *)&v89->_faceCaptureFinished);
    }

    v33 = v89;
  }
  v82 = v33->_updateData;

  return v82;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelsRootPath, 0);
  objc_storeStrong((id *)&self->_updateData, 0);
  objc_storeStrong((id *)&self->_earPCACapture, 0);
  objc_storeStrong((id *)&self->_earCapture, 0);
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_faceCapture, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 65) = 0;
  return self;
}

@end

@implementation APOdmlFeatureHandler

- (APOdmlFeatureHandler)initWithResponses:(id)a3 assetManager:(id)a4 model:(id)a5
{
  id v8;
  id v9;
  id v10;
  APOdmlFeatureHandler *v11;
  APOdmlFeatureHandler *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  APOdmlFeatureHandler *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  id v59;
  id v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  APOdmlFeatureValidator *v64;
  const char *v65;
  void *v66;
  id v67;
  const char *v68;
  uint64_t v69;
  MLArrayBatchProvider *batchInput;
  id v72;
  APOdmlFeatureHandler *v73;
  id v74;
  id v75;
  NSObject *v76;
  _QWORD v77[4];
  id v78;
  id v79;
  APOdmlFeatureHandler *v80;
  id v81;
  unint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD block[4];
  APOdmlFeatureHandler *v88;
  objc_super v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v89.receiver = self;
  v89.super_class = (Class)APOdmlFeatureHandler;
  v11 = -[APOdmlFeatureHandler init](&v89, sel_init);
  v12 = v11;
  if (v11)
  {
    v74 = v9;
    objc_storeStrong((id *)&v11->_assetManager, a4);
    v72 = v10;
    v12->_isTwoDimensional = objc_msgSend_isTwoDimensional_(v12, v13, (uint64_t)v10);
    objc_msgSend_fetchOnDeviceFeatures(v12, v14, v15);
    objc_msgSend_valueForKey_(v8, v16, (uint64_t)CFSTR("odmlResponse"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_computeUserQueryVectorWithResponses_(v12, v18, (uint64_t)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserQueryVector_(v12, v20, (uint64_t)v19);

    dispatch_get_global_queue(17, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B69F0120;
    block[3] = &unk_1E6A29570;
    v73 = v12;
    v22 = v12;
    v88 = v22;
    dispatch_async(v21, block);

    objc_msgSend_valueForKey_(v8, v23, (uint64_t)CFSTR("adamID"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v75 = v8;
    v28 = v8;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v83, v90, 16);
    if (v30)
    {
      v32 = v30;
      v33 = *(_QWORD *)v84;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v84 != v33)
            objc_enumerationMutation(v28);
          objc_msgSend_adSpecificFeatures_(v22, v31, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v34));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v27, v36, (uint64_t)v35);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v83, v90, 16);
      }
      while (v32);
    }

    v37 = (void *)MEMORY[0x1E0C99DE8];
    v40 = objc_msgSend_count(v17, v38, v39);
    objc_msgSend_arrayWithCapacity_(v37, v41, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_count(v17, v43, v44);
    v47 = (void *)v24;
    v48 = MEMORY[0x1E0C809B0];
    if (v45)
    {
      v49 = 0;
      v76 = v21;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v17, v46, v49);
        v50 = v42;
        v51 = v17;
        v52 = v47;
        v53 = v48;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v27, v55, v49);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_featuresForResponse_adSpecificFeatures_(v22, v57, (uint64_t)v54, v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = v53;
        v47 = v52;
        v17 = v51;
        v42 = v50;
        v77[0] = v48;
        v77[1] = 3221225472;
        v77[2] = sub_1B69F0128;
        v77[3] = &unk_1E6A29720;
        v78 = v58;
        v79 = v47;
        v82 = v49;
        v80 = v22;
        v59 = v17;
        v81 = v59;
        v60 = v58;
        dispatch_async(v76, v77);

        objc_msgSend_addObject_(v50, v61, (uint64_t)v60);
        ++v49;
      }
      while (v49 < objc_msgSend_count(v59, v62, v63));
    }
    v64 = objc_alloc_init(APOdmlFeatureValidator);
    v10 = v72;
    objc_msgSend_validateFeatures_predictionModel_(v64, v65, (uint64_t)v42, v72);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_alloc(MEMORY[0x1E0C9E8E0]);
    v69 = objc_msgSend_initWithFeatureProviderArray_(v67, v68, (uint64_t)v66);
    batchInput = v22->_batchInput;
    v22->_batchInput = (MLArrayBatchProvider *)v69;

    v9 = v74;
    v8 = v75;
    v12 = v73;
  }

  return v12;
}

- (id)adSpecificFeatures:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const __CFString *v24;
  const char *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  const __CFString *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  int v41;
  void *v42;
  __int16 v43;
  const __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v6 = (const void *)objc_msgSend_UTF8String(CFSTR("DupeFirstOrganic"), v4, v5);
  objc_getAssociatedObject(v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const void *)objc_msgSend_UTF8String(CFSTR("Installed"), v8, v9);
  objc_getAssociatedObject(v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    OdmlLogForCategory(5uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_adamID(v3, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_BOOLValue(v7, v21, v22);
      v24 = CFSTR(" not ");
      if (v23)
        v24 = CFSTR(" ");
      v41 = 138412546;
      v42 = v20;
      v43 = 2112;
      v44 = v24;
      _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_ERROR, "Ad %@ is%@dupe.", (uint8_t *)&v41, 0x16u);

    }
    objc_msgSend_featureValueOfTypeDouble_(MEMORY[0x1E0C9E918], v25, (uint64_t)v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v16, v27, (uint64_t)v26, CFSTR("DupeFirstOrganic"));

  }
  if (v11)
  {
    OdmlLogForCategory(5uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_adamID(v3, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend_BOOLValue(v11, v32, v33);
      v35 = CFSTR(" not ");
      if (v34)
        v35 = CFSTR(" ");
      v41 = 138412546;
      v42 = v31;
      v43 = 2112;
      v44 = v35;
      _os_log_impl(&dword_1B69D6000, v28, OS_LOG_TYPE_ERROR, "Ad %@ is%@installed.", (uint8_t *)&v41, 0x16u);

    }
    objc_msgSend_featureValueOfTypeDouble_(MEMORY[0x1E0C9E918], v36, (uint64_t)v11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v16, v38, (uint64_t)v37, CFSTR("Installed"));

  }
  v39 = (void *)objc_msgSend_copy(v16, v14, v15);

  return v39;
}

- (id)featuresForResponse:(id)a3 adSpecificFeatures:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  int isTwoDimensional;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  isTwoDimensional = objc_msgSend_isTwoDimensional(self, v8, v9);
  objc_msgSend_featureValues(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (isTwoDimensional)
  {
    objc_msgSend__translateFeaturesToTwoDimensional_(self, v14, (uint64_t)v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend_mutableCopy(v16, v17, v18);

  }
  else
  {
    v19 = (void *)objc_msgSend_mutableCopy(v13, v14, v15);
  }

  objc_msgSend_addOnDeviceFeaturesToDictionary_(self, v20, (uint64_t)v19);
  if (objc_msgSend_isTwoDimensional(self, v21, v22))
  {
    objc_msgSend__translateFeaturesToTwoDimensional_(self, v23, (uint64_t)v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend_mutableCopy(v24, v25, v26);

    objc_msgSend_addEntriesFromDictionary_(v19, v28, (uint64_t)v27);
  }
  else
  {
    objc_msgSend_addEntriesFromDictionary_(v19, v23, (uint64_t)v6);
  }
  v29 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  v32 = (void *)objc_msgSend_copy(v19, v30, v31);
  v40 = 0;
  v34 = (void *)objc_msgSend_initWithDictionary_error_(v29, v33, (uint64_t)v32, &v40);
  v35 = v40;

  if (!v34 || v35)
  {
    OdmlLogForCategory(5uLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v42 = v37;
      v43 = 2112;
      v44 = v35;
      v38 = v37;
      _os_log_impl(&dword_1B69D6000, v36, OS_LOG_TYPE_ERROR, "[%@] Error constructing FeatureProvider from ODMLResponseV2: %@", buf, 0x16u);

    }
  }

  return v34;
}

- (id)computeUserQueryVectorWithResponses:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  void *v15;
  APOdmlVector *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  float v62;
  double v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  char isTwoDimensional;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  const char *v82;
  id obj;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v3;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v87, v91, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v88 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend_featureValues(*(void **)(*((_QWORD *)&v87 + 1) + 8 * i), v8, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v13, v14, (uint64_t)CFSTR("queryVector"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = [APOdmlVector alloc];
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_assetManager(self, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend_odmlVersion(v20, v21, v22);
        objc_msgSend_stringWithFormat_(v17, v24, (uint64_t)CFSTR("%d"), v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multiArrayValue(v15, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_arrayFromMultiarray(v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend_initWithVersion_andArray_(v16, v32, (uint64_t)v25, v31);

        objc_msgSend_addObject_(v86, v34, (uint64_t)v33);
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v87, v91, 16);
    }
    while (v10);
  }

  v35 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_assetManager(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featuresForName_(v38, v39, (uint64_t)CFSTR("queryVector"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v35, v41, (uint64_t)v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42 || !objc_msgSend_count(v42, v43, v44))
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v43, (uint64_t)CFSTR("APOdmlPredictionErrorDomain"), 4008, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v46, (uint64_t)v45, 0);

  }
  objc_msgSend_arrayByAddingObjectsFromArray_(v42, v43, (uint64_t)v86);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v47, v48, v49))
  {
    objc_msgSend_objectAtIndexedSubscript_(v47, v50, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend_count(v47, v52, v53) < 2
      || (unint64_t)objc_msgSend_count(v47, v54, v55) < 2)
    {
      v59 = v51;
    }
    else
    {
      v56 = 1;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v47, v54, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectorAdd_(v51, v58, (uint64_t)v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        ++v56;
        v51 = v59;
      }
      while (v56 < objc_msgSend_count(v47, v60, v61));
    }
    objc_msgSend_magnitude(v59, v54, v55);
    *(float *)&v63 = 1.0 / v62;
    objc_msgSend_scalarMultiply_(v59, v64, v65, v63);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    isTwoDimensional = objc_msgSend_isTwoDimensional(self, v67, v68);
    v70 = (void *)MEMORY[0x1E0C9E970];
    objc_msgSend_arrayOfNumbers(v66, v71, v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isTwoDimensional & 1) != 0)
      objc_msgSend_twoDimensionalMultiarrayFromArray_(v70, v73, (uint64_t)v74);
    else
      objc_msgSend_multiarrayFromArray_(v70, v73, (uint64_t)v74);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v77, v78, v79) < 1)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v80, (uint64_t)CFSTR("APOdmlPredictionErrorDomain"), 4009, 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v82, (uint64_t)v81, 0);

      v76 = 0;
    }
    else
    {
      objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v80, (uint64_t)v77);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v50, (uint64_t)CFSTR("APOdmlPredictionErrorDomain"), 4009, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v75, (uint64_t)v59, 0);
    v76 = 0;
  }

  return v76;
}

- (void)fetchOnDeviceFeatures
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char isTwoDimensional;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  char v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  char v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  void *v54;
  const char *v55;
  id v56;

  objc_msgSend_assetManager(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureForName_(v4, v5, (uint64_t)CFSTR("appUsageVector"));
  v56 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_assetManager(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureForName_(v8, v9, (uint64_t)CFSTR("appDownloadVector"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_assetManager(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureForName_(v13, v14, (uint64_t)CFSTR("installedAppVector"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  isTwoDimensional = objc_msgSend_isTwoDimensional(self, v16, v17);
  v19 = (void *)MEMORY[0x1E0C9E970];
  objc_msgSend_arrayOfNumbers(v56, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isTwoDimensional & 1) != 0)
    objc_msgSend_twoDimensionalMultiarrayFromArray_(v19, v22, (uint64_t)v23);
  else
    objc_msgSend_multiarrayFromArray_(v19, v22, (uint64_t)v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend_isTwoDimensional(self, v25, v26);
  v28 = (void *)MEMORY[0x1E0C9E970];
  objc_msgSend_arrayOfNumbers(v10, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v27 & 1) != 0)
    objc_msgSend_twoDimensionalMultiarrayFromArray_(v28, v31, (uint64_t)v32);
  else
    objc_msgSend_multiarrayFromArray_(v28, v31, (uint64_t)v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend_isTwoDimensional(self, v34, v35);
  v37 = (void *)MEMORY[0x1E0C9E970];
  objc_msgSend_arrayOfNumbers(v15, v38, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v36 & 1) != 0)
    objc_msgSend_twoDimensionalMultiarrayFromArray_(v37, v40, (uint64_t)v41);
  else
    objc_msgSend_multiarrayFromArray_(v37, v40, (uint64_t)v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v24, v43, v44))
  {
    objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v45, (uint64_t)v24);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppUsageVector_(self, v48, (uint64_t)v47);

  }
  if (objc_msgSend_count(v33, v45, v46))
  {
    objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v49, (uint64_t)v33);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppDownloadVector_(self, v52, (uint64_t)v51);

  }
  if (objc_msgSend_count(v42, v49, v50))
  {
    objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v53, (uint64_t)v42);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInstalledAppVector_(self, v55, (uint64_t)v54);

  }
}

- (void)addOnDeviceFeaturesToDictionary:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  id v48;

  v48 = a3;
  if (objc_msgSend_isTwoDimensional(self, v4, v5))
  {
    v8 = (void *)objc_msgSend_copy(v48, v6, v7);
    objc_msgSend__translateFeaturesToTwoDimensional_(self, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend_mutableCopy(v10, v11, v12);
    objc_msgSend_addEntriesFromDictionary_(v48, v14, (uint64_t)v13);

  }
  objc_msgSend_appUsageVector(self, v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_appUsageVector(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v48, v19, (uint64_t)v18, CFSTR("appUsageVector"));

    objc_msgSend_appUsageVector(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v48, v23, (uint64_t)v22, CFSTR("AppUsageVector"));

  }
  objc_msgSend_appDownloadVector(self, v16, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_appDownloadVector(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v48, v28, (uint64_t)v27, CFSTR("appDownloadVector"));

    objc_msgSend_appDownloadVector(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v48, v32, (uint64_t)v31, CFSTR("AppDownloadVector"));

  }
  objc_msgSend_installedAppVector(self, v25, v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_installedAppVector(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v48, v37, (uint64_t)v36, CFSTR("installedAppVector"));

    objc_msgSend_installedAppVector(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v48, v41, (uint64_t)v40, CFSTR("AppInstalledVector"));

  }
  objc_msgSend_userQueryVector(self, v34, v35);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v48;
  if (v42)
  {
    objc_msgSend_userQueryVector(self, v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v48, v47, (uint64_t)v46, CFSTR("userQueryVector"));

    v45 = v48;
  }

}

- (BOOL)isTwoDimensional:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_modelDescription(a3, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputDescriptionsByName(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v9;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v25, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_multiArrayConstraint(*(void **)(*((_QWORD *)&v25 + 1) + 8 * i), v12, v13, (_QWORD)v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shape(v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend_count(v20, v21, v22);

        if (v23 > 1)
        {
          LOBYTE(v14) = 1;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v25, v29, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  return v14;
}

- (id)_translateFeaturesToTwoDimensional:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v35, v39, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v6, v9, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_type(v14, v15, v16) == 5)
        {
          v19 = (void *)MEMORY[0x1E0C9E918];
          v20 = (void *)MEMORY[0x1E0C9E970];
          objc_msgSend_multiArrayValue(v14, v17, v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_arrayFromMultiarray(v21, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_twoDimensionalMultiarrayFromArray_(v20, v25, (uint64_t)v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_featureValueWithMultiArray_(v19, v27, (uint64_t)v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, v13);
        }

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v35, v39, 16);
    }
    while (v10);
  }

  v32 = (void *)objc_msgSend_copy(v6, v30, v31);
  return v32;
}

- (void)saveFeaturesFromResponse:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  APOdmlVector *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  id v38;
  id obj;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v41 = a3;
  objc_msgSend_featureValues(v41, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v42, v46, 16);
  if (v7)
  {
    v10 = v7;
    v40 = *(_QWORD *)v43;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v11);
        objc_msgSend_featureValues(v41, v8, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_valueForKey_(v13, v14, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = [APOdmlVector alloc];
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_assetManager(self, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend_odmlVersion(v20, v21, v22);
        objc_msgSend_stringWithFormat_(v17, v24, (uint64_t)CFSTR("%d"), v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multiArrayValue(v15, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_arrayFromMultiarray(v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend_initWithVersion_andArray_(v16, v32, (uint64_t)v25, v31);

        objc_msgSend_assetManager(self, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (id)objc_msgSend_saveFeatureFromObject_withName_(v36, v37, (uint64_t)v33, v12);

        ++v11;
      }
      while (v10 != v11);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v42, v46, 16);
    }
    while (v10);
  }

}

- (void)saveUserQueryVector
{
  uint64_t v2;
  void *v4;
  APOdmlVector *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  id v30;

  objc_msgSend_userQueryVector(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [APOdmlVector alloc];
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_assetManager(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_odmlVersion(v9, v10, v11);
    objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("%d"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userQueryVector(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multiArrayValue(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayFromMultiarray(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend_initWithVersion_andArray_(v5, v24, (uint64_t)v14, v23);

    objc_msgSend_assetManager(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend_saveFeatureFromObject_withName_(v27, v28, (uint64_t)v30, CFSTR("userQueryVector"));

  }
}

- (MLArrayBatchProvider)batchInput
{
  return self->_batchInput;
}

- (APOdmlAssetManager)assetManager
{
  return self->_assetManager;
}

- (BOOL)isTwoDimensional
{
  return self->_isTwoDimensional;
}

- (MLFeatureValue)appUsageVector
{
  return self->_appUsageVector;
}

- (void)setAppUsageVector:(id)a3
{
  objc_storeStrong((id *)&self->_appUsageVector, a3);
}

- (MLFeatureValue)appDownloadVector
{
  return self->_appDownloadVector;
}

- (void)setAppDownloadVector:(id)a3
{
  objc_storeStrong((id *)&self->_appDownloadVector, a3);
}

- (MLFeatureValue)installedAppVector
{
  return self->_installedAppVector;
}

- (void)setInstalledAppVector:(id)a3
{
  objc_storeStrong((id *)&self->_installedAppVector, a3);
}

- (MLFeatureValue)userQueryVector
{
  return self->_userQueryVector;
}

- (void)setUserQueryVector:(id)a3
{
  objc_storeStrong((id *)&self->_userQueryVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQueryVector, 0);
  objc_storeStrong((id *)&self->_installedAppVector, 0);
  objc_storeStrong((id *)&self->_appDownloadVector, 0);
  objc_storeStrong((id *)&self->_appUsageVector, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_batchInput, 0);
}

@end

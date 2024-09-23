uint64_t sub_1B69D766C(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B69DA35C;
  v5[3] = &unk_1E6A29548;
  v5[4] = v2;
  return objc_msgSend_loadPersistentStoresWithCompletionHandler_(v3, a2, (uint64_t)v5);
}

void sub_1B69D775C()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_1ED532F40;
  qword_1ED532F40 = (uint64_t)v0;

}

void sub_1B69D7CD0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  char isDaemonProcess;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];

  objc_msgSend_sharedInstance(APOdmlDatabaseConfiguration, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isDaemonProcess = objc_msgSend_isDaemonProcess(v4, v5, v6);

  if ((isDaemonProcess & 1) == 0)
  {
    objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetManagerForPlacementType_assetManagerType_(v10, v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentMLModel(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      OdmlLogForCategory(5uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1B69D6000, v16, OS_LOG_TYPE_ERROR, "Unable to prewarm ML model", v17, 2u);
      }

    }
  }
}

id sub_1B69D8018(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  const char *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  OdmlLogForCategory(5uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  OdmlLogForCategory(5uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B69D6000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ML Model Loading", (const char *)&unk_1B6A07EB5, buf, 2u);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0C9E958]);
  if (a4)
  {
    OdmlLogForCategory(5uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      v15 = v14;
      _os_log_impl(&dword_1B69D6000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Current model is explicitly asked to perform prediction on CPU only.", buf, 0xCu);

    }
    objc_msgSend_setComputeUnits_(v12, v16, 0);
  }
  v28 = 0;
  objc_msgSend_modelWithContentsOfURL_configuration_error_(MEMORY[0x1E0C9E940], v11, (uint64_t)v5, v12, &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (v18)
  {
    OdmlLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v30 = v20;
      v31 = 2112;
      v32 = v18;
      v21 = v20;
      _os_log_impl(&dword_1B69D6000, v19, OS_LOG_TYPE_ERROR, "[%@] Error reading compiled MLModel from URL %@", buf, 0x16u);

    }
    OdmlLogForCategory(5uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v23, OS_SIGNPOST_INTERVAL_END, v7, "ML Model Loading", (const char *)&unk_1B6A07EB5, buf, 2u);
    }

    v24 = 0;
  }
  else
  {
    OdmlLogForCategory(5uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v26, OS_SIGNPOST_INTERVAL_END, v7, "ML Model Loading", (const char *)&unk_1B6A07EB5, buf, 2u);
    }

    v24 = v17;
  }

  return v24;
}

void sub_1B69D8848()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  uint8_t v26[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_1B69D6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Initializing log categories.", v26, 2u);
  }
  v0 = os_log_create("com.apple.adplatforms", "AssetManager");
  v1 = (void *)qword_1ED532EC8[0];
  qword_1ED532EC8[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.adplatforms", "Request");
  v3 = (void *)qword_1ED532ED0;
  qword_1ED532ED0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.adplatforms", "Vectors");
  v5 = (void *)qword_1ED532ED8;
  qword_1ED532ED8 = (uint64_t)v4;

  v6 = os_log_create("com.apple.adplatforms", "FeatureCalculation");
  v7 = (void *)qword_1ED532EE0;
  qword_1ED532EE0 = (uint64_t)v6;

  v8 = os_log_create("com.apple.adplatforms", "FeatureStorage");
  v9 = (void *)qword_1ED532EE8;
  qword_1ED532EE8 = (uint64_t)v8;

  v10 = os_log_create("com.apple.adplatforms", "Response");
  v11 = (void *)qword_1ED532EF0;
  qword_1ED532EF0 = (uint64_t)v10;

  v12 = os_log_create("com.apple.adplatforms", "Extensions");
  v13 = (void *)qword_1ED532EF8;
  qword_1ED532EF8 = (uint64_t)v12;

  v14 = os_log_create("com.apple.adplatforms", "AllowList");
  v15 = (void *)qword_1ED532F00;
  qword_1ED532F00 = (uint64_t)v14;

  v16 = os_log_create("com.apple.adplatforms", "Analytics");
  v17 = (void *)qword_1ED532F08;
  qword_1ED532F08 = (uint64_t)v16;

  v18 = os_log_create("com.apple.adplatforms", "DODMLLogging");
  v19 = (void *)qword_1ED532F10;
  qword_1ED532F10 = (uint64_t)v18;

  v20 = os_log_create("com.apple.adplatforms", "FatalError");
  v21 = (void *)qword_1ED532F18;
  qword_1ED532F18 = (uint64_t)v20;

  v22 = os_log_create("com.apple.adplatforms", "APOdmlSearchResultsExtension");
  v23 = (void *)qword_1ED532F20;
  qword_1ED532F20 = (uint64_t)v22;

  v24 = os_log_create("com.apple.adplatforms", "BiomeStorage");
  v25 = (void *)qword_1ED532F28;
  qword_1ED532F28 = (uint64_t)v24;

}

void sub_1B69D94E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B69DA35C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  const char *v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  int v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  OdmlLogForCategory(4uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend_options(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138478083;
    v48 = v8;
    v49 = 2113;
    v50 = v12;
    _os_log_impl(&dword_1B69D6000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@] NSPersistentStoreDescription: %{private}@", (uint8_t *)&v47, 0x16u);

  }
  OdmlLogForCategory(4uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v47 = 138478083;
      v48 = v15;
      v49 = 2112;
      v50 = v6;
      v16 = v15;
      _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to load Core Data stack with error: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v17, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5002, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v23 = objc_msgSend_numLaunchesAttempted(*(void **)(a1 + 32), v21, v22);
    objc_msgSend_numberWithInt_(v20, v24, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObject_forKey_(v19, v26, (uint64_t)v25, CFSTR("numberAttempts"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v28, (uint64_t)v18, v27);
    v29 = *(_QWORD *)(a1 + 32);
    v30 = v6;
    v31 = *(id *)(v29 + 24);
    *(_QWORD *)(v29 + 24) = v30;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_opt_class();
      v47 = 138477827;
      v48 = v32;
      v33 = v32;
      _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_DEFAULT, "[%{private}@] Successfully loaded Core Data stack", (uint8_t *)&v47, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v34, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5003, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1E0C99D80];
    v36 = (void *)MEMORY[0x1E0CB37E8];
    v38 = *(void **)(a1 + 32);
    v37 = (id *)(a1 + 32);
    v41 = objc_msgSend_numLaunchesAttempted(v38, v39, v40);
    objc_msgSend_numberWithInt_(v36, v42, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObject_forKey_(v35, v44, (uint64_t)v43, CFSTR("numberAttempts"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v45, (uint64_t)v18, v27);
    v31 = *v37;
    objc_sync_enter(v31);
    objc_msgSend_setCoreDataIsInitialized_(*v37, v46, 1);
    objc_sync_exit(v31);
  }

}

void sub_1B69DA6B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id OdmlLogForCategory(unint64_t a1)
{
  if (a1 >= 0xD)
    sub_1B6A01118();
  if (qword_1ED532EB8 != -1)
    dispatch_once(&qword_1ED532EB8, &unk_1E6A29CF8);
  return (id)qword_1ED532EC8[a1];
}

void sub_1B69DAA18()
{
  APOdmlAssetManagerCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(APOdmlAssetManagerCoordinator);
  v1 = (void *)qword_1ED532EC0;
  qword_1ED532EC0 = (uint64_t)v0;

}

void sub_1B69DAA40()
{
  APOdmlAllowList *v0;
  void *v1;

  v0 = objc_alloc_init(APOdmlAllowList);
  v1 = (void *)qword_1ED532F68;
  qword_1ED532F68 = (uint64_t)v0;

}

void sub_1B69DAECC()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_1ED532F38;
  qword_1ED532F38 = (uint64_t)v0;

}

uint64_t sub_1B69DB648(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;

  objc_msgSend_evaluationMetrics(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7 < 1)
  {
    v11 = 0.0;
  }
  else
  {
    v10 = 0;
    v11 = 0.0;
    do
    {
      objc_msgSend_evaluationMetrics(a1, v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_featuresAtIndex_(v12, v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_featureValueForName_(v14, v15, (uint64_t)CFSTR("Identity_1"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multiArrayValue(v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_doubleValue(v21, v22, v23);
      v11 = v11 + v24;

      ++v10;
    }
    while (v7 != v10);
  }
  return objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v8, v9, v11 / (double)v7);
}

id sub_1B69DB748(void *a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  int v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  BOOL v50;
  int v51;
  void *v52;
  uint64_t v54;
  id v55;
  int v56;

  v55 = a3;
  objc_msgSend_evaluationMetrics(a1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9 < 1)
  {
    v56 = 0;
  }
  else
  {
    v56 = 0;
    v12 = 0;
    v54 = v9;
    do
    {
      objc_msgSend_evaluationMetrics(a1, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_featuresAtIndex_(v13, v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_featureValueForName_(v15, v16, (uint64_t)CFSTR("Identity_0"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17;
      if (v17)
      {
        objc_msgSend_multiArrayValue(v17, v18, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v21, v22, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v23, v24, v25);
        v27 = v26;
        v30 = objc_msgSend_count(v21, v28, v29);

        v33 = objc_msgSend_count(v21, v31, v32);
        objc_msgSend_featuresAtIndex_(v55, v34, v12);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_featureValueForName_(v35, v36, (uint64_t)CFSTR("label_input_0"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v37;
        if (v37)
        {
          v41 = v27 + (double)(v30 * v12);
          v42 = v41 + (double)v33;
          if (v41 >= v42)
            v42 = v27 + (double)(v30 * v12);
          v43 = a1;
          v44 = (int)(v42 - v41);
          objc_msgSend_multiArrayValue(v37, v38, v39);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v45, v46, 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = objc_msgSend_intValue(v47, v48, v49) == v44;
          a1 = v43;
          v9 = v54;
          if (v50)
            v51 = v56 + 1;
          else
            v51 = v56;
          v56 = v51;

        }
      }

      ++v12;
    }
    while (v9 != v12);
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, v56 / v9);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

BOOL sub_1B69DBF0C(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  _BOOL8 v13;

  v2 = a2;
  if (objc_msgSend_isAppStoreVendable(v2, v3, v4))
  {
    objc_msgSend_bundleIdentifier(v2, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend_bundleIdentifier(v2, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend_length(v10, v11, v12) != 0;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_1B69DBFC8(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;

  if (objc_msgSend_respondToRefreshNotification(*(void **)(a1 + 32), a2, a3))
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v4, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v6, v7, (uint64_t)v10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_refreshTrialClientForPlacementTypes_(v5, v9, (uint64_t)v8);

  }
}

void sub_1B69DC118(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_trialClient(WeakRetained, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_refresh(v3, v4, v5);

}

void sub_1B69DC4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B69DC9F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B69DCB78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69DCDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B69DCF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B69DD30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;
  void *v13;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B69DD528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1B69DD728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)APOdmlEspressoIOBufferController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B69DD794(uint64_t a1, const char *a2, void *a3)
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void *)objc_msgSend_bufferPointer(a3, a2, (uint64_t)a3);
  if (v3)
  {
    free(v3);
  }
  else
  {
    OdmlLogForCategory(0xBuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B69D6000, v4, OS_LOG_TYPE_ERROR, "Input buffer is released too early.", v5, 2u);
    }

  }
}

void sub_1B69DD818(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *sub_1B69DD928(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1B69DD99C(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1B69DD980(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1B69DD99C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_1B69DD9DC();
  result = (char *)sub_1B69DD9F0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_1B69DD9DC()
{
  sub_1B69DDA24("vector");
}

void *sub_1B69DD9F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_1B69DDA98();
  return operator new(8 * a2);
}

void sub_1B69DDA24(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1B69DDA74(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6A28D88, MEMORY[0x1E0DE42D0]);
}

void sub_1B69DDA60(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1B69DDA74(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void sub_1B69DDA98()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

uint64_t sub_1B69DDC94()
{
  return 1;
}

id sub_1B69DE148(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v32[0] = v5;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v32, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C9E970]);
  v27 = 0;
  v10 = (void *)objc_msgSend_initWithShape_dataType_error_(v8, v9, (uint64_t)v7, 65600, &v27);
  v13 = v27;
  if (v13)
  {
    OdmlLogForCategory(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v15;
      v30 = 2112;
      v31 = v13;
      v16 = v15;
      _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);

    }
    v17 = 0;
  }
  else
  {
    if (objc_msgSend_unsignedLongValue(v5, v11, v12))
    {
      v21 = 0;
      do
      {
        LODWORD(v20) = *(_DWORD *)(a3 + 4 * v21);
        objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v18, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v10, v23, (uint64_t)v22, v21);

        ++v21;
      }
      while (v21 < objc_msgSend_unsignedLongValue(v5, v24, v25));
    }
    v17 = v10;
  }

  return v17;
}

id sub_1B69DE2FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v32[0] = &unk_1E6A33BE8;
  v32[1] = v5;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v32, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C9E970]);
  v27 = 0;
  v10 = (void *)objc_msgSend_initWithShape_dataType_error_(v8, v9, (uint64_t)v7, 65600, &v27);
  v13 = v27;
  if (v13)
  {
    OdmlLogForCategory(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v15;
      v30 = 2112;
      v31 = v13;
      v16 = v15;
      _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);

    }
    v17 = 0;
  }
  else
  {
    if (objc_msgSend_unsignedLongValue(v5, v11, v12))
    {
      v21 = 0;
      do
      {
        LODWORD(v20) = *(_DWORD *)(a3 + 4 * v21);
        objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v18, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v10, v23, (uint64_t)v22, v21);

        ++v21;
      }
      while (v21 < objc_msgSend_unsignedLongValue(v5, v24, v25));
    }
    v17 = v10;
  }

  return v17;
}

id sub_1B69DE4B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  unint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend_count(v3, v5, v6);
  objc_msgSend_numberWithUnsignedInteger_(v4, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v34, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C9E970]);
  v29 = 0;
  v14 = (void *)objc_msgSend_initWithShape_dataType_error_(v12, v13, (uint64_t)v11, 65600, &v29);
  v17 = v29;
  if (v17)
  {
    OdmlLogForCategory(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v31 = v19;
      v32 = 2112;
      v33 = v17;
      v20 = v19;
      _os_log_impl(&dword_1B69D6000, v18, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);

    }
    v21 = 0;
  }
  else
  {
    if (objc_msgSend_count(v3, v15, v16))
    {
      v23 = 0;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v3, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v14, v25, (uint64_t)v24, v23);

        ++v23;
      }
      while (v23 < objc_msgSend_count(v3, v26, v27));
    }
    v21 = v14;
  }

  return v21;
}

id sub_1B69DE688(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  unint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend_count(v3, v5, v6);
  objc_msgSend_numberWithUnsignedInteger_(v4, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = &unk_1E6A33BE8;
  v34[1] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v34, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C9E970]);
  v29 = 0;
  v14 = (void *)objc_msgSend_initWithShape_dataType_error_(v12, v13, (uint64_t)v11, 65600, &v29);
  v17 = v29;
  if (v17)
  {
    OdmlLogForCategory(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v31 = v19;
      v32 = 2112;
      v33 = v17;
      v20 = v19;
      _os_log_impl(&dword_1B69D6000, v18, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);

    }
    v21 = 0;
  }
  else
  {
    if (objc_msgSend_count(v3, v15, v16))
    {
      v23 = 0;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v3, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v14, v25, (uint64_t)v24, v23);

        ++v23;
      }
      while (v23 < objc_msgSend_count(v3, v26, v27));
    }
    v21 = v14;
  }

  return v21;
}

id sub_1B69DE860(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v7 = objc_msgSend_doubleValuesCount(v3, v5, v6);
  v9 = (void *)objc_msgSend_initWithUnsignedLong_(v4, v8, v7);
  v37[0] = &unk_1E6A33BE8;
  v37[1] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v37, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C9E970]);
  v32 = 0;
  v14 = (void *)objc_msgSend_initWithShape_dataType_error_(v12, v13, (uint64_t)v11, 65600, &v32);
  v17 = v32;
  if (v17)
  {
    OdmlLogForCategory(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v34 = v19;
      v35 = 2112;
      v36 = v17;
      v20 = v19;
      _os_log_impl(&dword_1B69D6000, v18, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);

    }
    v21 = 0;
  }
  else
  {
    if (objc_msgSend_doubleValuesCount(v3, v15, v16))
    {
      v22 = 0;
      do
      {
        v23 = objc_alloc(MEMORY[0x1E0CB37E8]);
        objc_msgSend_doubleValueAtIndex_(v3, v24, v22);
        v27 = (void *)objc_msgSend_initWithDouble_(v23, v25, v26);
        objc_msgSend_setObject_atIndexedSubscript_(v14, v28, (uint64_t)v27, v22);

        ++v22;
      }
      while (v22 < objc_msgSend_doubleValuesCount(v3, v29, v30));
    }
    v21 = v14;
  }

  return v21;
}

id sub_1B69DEA50(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v7 = objc_msgSend_doubleValuesCount(v3, v5, v6);
  v9 = (void *)objc_msgSend_initWithUnsignedLong_(v4, v8, v7);
  v37[0] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v37, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C9E970]);
  v32 = 0;
  v14 = (void *)objc_msgSend_initWithShape_dataType_error_(v12, v13, (uint64_t)v11, 65600, &v32);
  v17 = v32;
  if (v17)
  {
    OdmlLogForCategory(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v34 = v19;
      v35 = 2112;
      v36 = v17;
      v20 = v19;
      _os_log_impl(&dword_1B69D6000, v18, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);

    }
    v21 = 0;
  }
  else
  {
    if (objc_msgSend_doubleValuesCount(v3, v15, v16))
    {
      v22 = 0;
      do
      {
        v23 = objc_alloc(MEMORY[0x1E0CB37E8]);
        objc_msgSend_doubleValueAtIndex_(v3, v24, v22);
        v27 = (void *)objc_msgSend_initWithDouble_(v23, v25, v26);
        objc_msgSend_setObject_atIndexedSubscript_(v14, v28, (uint64_t)v27, v22);

        ++v22;
      }
      while (v22 < objc_msgSend_doubleValuesCount(v3, v29, v30));
    }
    v21 = v14;
  }

  return v21;
}

id sub_1B69DEC38(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(a1, v5, v6) >= 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(a1, v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v11, (uint64_t)v10);

      ++v9;
    }
    while (v9 < objc_msgSend_count(a1, v12, v13));
  }
  v14 = (void *)objc_msgSend_copy(v4, v7, v8);

  return v14;
}

uint64_t sub_1B69DED54(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_length(a1, a2, a3);
  return objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("Binary data, %ld bytes, ..."), v3);
}

void sub_1B69DEF18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(a2, (const char *)a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

uint64_t sub_1B69DF028(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(a2, (const char *)a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return v5;
}

void sub_1B69DF070(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(a2, (const char *)a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

uint64_t sub_1B69DF1E0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend_eventBody(a2, (const char *)a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return v5;
}

uint64_t sub_1B69DF234()
{
  return 1;
}

uint64_t sub_1B69DF2B4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_dictionary(a2, (const char *)a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

uint64_t sub_1B69DF39C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_eventBody(a2, (const char *)a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

void sub_1B69DF530(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B69DF548(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend_state(v3, v4, v5))
  {
    OdmlLogForCategory(0xCuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend_streamName(v8, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v3, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_code(v15, v16, v17);
      objc_msgSend_error(v3, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedDescription(v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138478595;
      v26 = v7;
      v27 = 2114;
      v28 = v12;
      v29 = 2048;
      v30 = v18;
      v31 = 2114;
      v32 = v24;
      _os_log_impl(&dword_1B69D6000, v6, OS_LOG_TYPE_ERROR, "[%{private}@] Stream %{public}@ failed with error %ld: %{public}@", (uint8_t *)&v25, 0x2Au);

    }
  }

}

BOOL sub_1B69DF6B0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend_eventBody(a2, (const char *)a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;
}

unint64_t sub_1B69DFFB4(void *a1, const char *a2, uint64_t a3)
{
  unint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint32_t v7;
  const char *v8;

  result = objc_msgSend_count(a1, a2, a3);
  if (result >= 2)
  {
    v5 = result;
    v6 = 0;
    do
    {
      v7 = arc4random_uniform(v5);
      result = objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(a1, v8, v6, v6 + v7);
      ++v6;
      --v5;
    }
    while (v5 != 1);
  }
  return result;
}

void sub_1B69E02BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B69E02F8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B69E0308(uint64_t a1)
{

}

void sub_1B69E0310(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_value(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_1B69E0670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  void *v27;

  objc_sync_exit(v27);
  _Unwind_Resume(a1);
}

void sub_1B69E06A8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_value(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_1B69E0D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B69E0DC8(_QWORD *a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend_executeFetchRequest_error_(v3, a2, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_1B69E1178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B69E11B8(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  id obj;

  objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x1E0C97B20], a2, (uint64_t)CFSTR("Feature"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCreatedAt_(v3, v7, (uint64_t)v6);

  v10 = objc_msgSend_deploymentID(*(void **)(a1 + 40), v8, v9);
  objc_msgSend_setDeploymentID_(v3, v11, v10);
  objc_msgSend_experimentID(*(void **)(a1 + 40), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExperimentID_(v3, v15, (uint64_t)v14);

  objc_msgSend_treatmentID(*(void **)(a1 + 40), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTreatmentID_(v3, v19, (uint64_t)v18);

  objc_msgSend_setFeatureType_(v3, v20, *(_QWORD *)(a1 + 48));
  objc_msgSend_setValue_(v3, v21, *(_QWORD *)(a1 + 56));
  v22 = *(void **)(a1 + 32);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v23 + 40);
  objc_msgSend_save_(v22, v24, (uint64_t)&obj);
  objc_storeStrong((id *)(v23 + 40), obj);

}

void sub_1B69E16E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B69E172C(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_deleteObject_, *(_QWORD *)(a1 + 40));
}

void sub_1B69E1738(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend_save_(v2, a2, (uint64_t)&obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

uint64_t sub_1B69E1860(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69E18D4;
  block[3] = &unk_1E6A29570;
  block[4] = a1;
  if (qword_1ED532F70 != -1)
    dispatch_once(&qword_1ED532F70, block);
  return byte_1ED532F78;
}

void sub_1B69E18D4(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  void *v4;
  id v5;

  objc_msgSend_environment(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v3, (uint64_t)CFSTR("XCTestConfigurationFilePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ED532F78 = v4 != 0;

}

uint64_t sub_1B69E1924()
{
  return MGGetBoolAnswer();
}

uint64_t sub_1B69E1930(uint64_t a1, const char *a2)
{
  return objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("AppDownloadVector"), CFSTR("AppInstalledVector"), CFSTR("AppUsageVector"), CFSTR("appUsageVector"), 0);
}

uint64_t sub_1B69E198C(uint64_t a1, const char *a2)
{
  return objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("DupeFirstOrganic"), CFSTR("Installed"), CFSTR("Tapped"), CFSTR("Tap"), CFSTR("Impressed"), 0);
}

uint64_t sub_1B69E19F8(uint64_t a1, const char *a2)
{
  return objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("DupeFirstOrganic"), CFSTR("Installed"), CFSTR("Tapped"), 0);
}

void sub_1B69E35C8(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_opt_class();
  objc_msgSend_translateFeatureKeyToDESKey_(v3, v4, (uint64_t)v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsObject_(*(void **)(a1 + 32), v6, (uint64_t)v5))
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 40), v7, (uint64_t)v5, v8);

}

void sub_1B69E3CB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B69E3F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69E4CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

void sub_1B69E5044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B69E5214(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1B69E6CC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B69E6F78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69E705C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69E7384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30)
{
  void *v30;
  uint64_t v31;
  void *v33;

  if (__p)
    operator delete(__p);
  if (a20)
    operator delete(a20);
  if (a23)
    operator delete(a23);
  if (a26)
    operator delete(a26);
  if (a29)
    operator delete(a29);
  v33 = *(void **)(v31 - 136);
  if (v33)
  {
    *(_QWORD *)(v31 - 128) = v33;
    operator delete(v33);
  }

  _Unwind_Resume(a1);
}

void sub_1B69E7548(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69E7700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69E7938(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69E7D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B69E8024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B69E8160(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69E8274(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B69E868C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B69E89EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B69E8CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1B69E91B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B69E92C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69E9378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B69E9494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)APOdmlEspressoFacade;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

_QWORD *sub_1B69E954C(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1B69E95FC();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_1B69E95FC()
{
  sub_1B69DDA24("basic_string");
}

_QWORD *sub_1B69E9610(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1B69E9684(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1B69E9668(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1B69E9684(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    sub_1B69DD9DC();
  result = (char *)sub_1B69E96C4((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_1B69E96C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_1B69DDA98();
  return operator new(4 * a2);
}

_QWORD *sub_1B69E96F8(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_1B69DD99C(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B69E9754(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1B69E9770(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1B69E9684(a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1B69E97D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B69EA918(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend_adamIDtoBundleID(v4, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v9, (uint64_t)v6, v5);

}

const __CFString *sub_1B69EAD88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Counterfactual");
  if (a3)
    return v3;
  else
    return CFSTR("Runtime");
}

const __CFString *sub_1B69EADB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("SLP");
  if (a3)
    return v3;
  else
    return CFSTR("SRP");
}

const __CFString *sub_1B69EADE0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E6A296A8[a3];
}

void APOdmlSimulateCrash(uint64_t a1, void *a2, int a3)
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int isRunningTests;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  OdmlLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1B69D6000, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningTests = objc_msgSend_isRunningTests(v8, v9, v10);

  if (isRunningTests)
  {
    OdmlLogForCategory(0xAuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1B69D6000, v12, OS_LOG_TYPE_ERROR, "SimCrash called; we should exit at this point. If you see this log outside of the Unit Tests, Please file a radar...",
        (uint8_t *)&v13,
        2u);
    }

  }
  else
  {
    getpid();
    SimulateCrash();
    if (a3)
      exit(1);
  }

}

uint64_t ADOdmlResponseV2ReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  ADFeature *v23;
  const char *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = objc_alloc_init(ADFeature);
        objc_msgSend_addFeatures_(a1, v24, (uint64_t)v23);
        if (!PBReaderPlaceMark() || (ADFeatureReadFrom((char *)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        a1[20] |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_35:
        a1[16] = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id sub_1B69ECAF0(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appUsageVector(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  objc_msgSend_keyForType_(v8, v9, (uint64_t)CFSTR("appUsageVector"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v4, v11, (uint64_t)v7, v10);

  objc_msgSend_appDownloadVector(a1, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_class();
  objc_msgSend_keyForType_(v15, v16, (uint64_t)CFSTR("appDownloadVector"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v4, v18, (uint64_t)v14, v17);

  objc_msgSend_installedAppVector(a1, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_class();
  objc_msgSend_keyForType_(v22, v23, (uint64_t)CFSTR("installedAppVector"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v4, v25, (uint64_t)v21, v24);

  objc_msgSend_userQueryVector(a1, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v4, v29, (uint64_t)v28, CFSTR("userQueryVector"));

  v32 = (void *)objc_msgSend_copy(v4, v30, v31);
  return v32;
}

id sub_1B69ECC40(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend_dictionaryRepresentation(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v3, v5, (uint64_t)v4, 1, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7)
  {
    OdmlLogForCategory(0xCuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1B69D6000, v8, OS_LOG_TYPE_ERROR, "Failed to archive training row data %@", buf, 0xCu);
    }

    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

id sub_1B69ECD4C(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  double v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  id v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  id v90;
  _QWORD v91[5];

  v91[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_onDeviceFeatures(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v4, v8, (uint64_t)v7, CFSTR("OnDeviceFeatures"));

  v9 = (void *)MEMORY[0x1E0CB3710];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v91[0] = objc_opt_class();
  v91[1] = objc_opt_class();
  v91[2] = objc_opt_class();
  v91[3] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v91, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverResponse(a1, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0;
  objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v9, v18, (uint64_t)v14, v17, &v86);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v86;

  if (v20)
  {
    OdmlLogForCategory(0xCuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v88 = v24;
      v89 = 2112;
      v90 = v20;
      v25 = v24;
      _os_log_impl(&dword_1B69D6000, v23, OS_LOG_TYPE_ERROR, "[%@] Failed to unarchive server response: %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_featureValues(v19, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v23, v29, (uint64_t)v28, CFSTR("ServerResponse"));

    objc_msgSend_adamID(a1, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend_adamID(a1, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(v23, v36, (uint64_t)v35, CFSTR("AdamID"));

    }
    v37 = (void *)MEMORY[0x1E0CB37E8];
    v38 = objc_msgSend_impressed(a1, v33, v34);
    objc_msgSend_numberWithBool_(v37, v39, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v23, v41, (uint64_t)v40, CFSTR("Impressed"));

    v42 = (void *)MEMORY[0x1E0CB37E8];
    v45 = objc_msgSend_tapped(a1, v43, v44);
    objc_msgSend_numberWithBool_(v42, v46, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v23, v48, (uint64_t)v47, CFSTR("Tapped"));

    v49 = (void *)MEMORY[0x1E0CB37E8];
    v52 = objc_msgSend_dupe(a1, v50, v51);
    objc_msgSend_numberWithBool_(v49, v53, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v23, v55, (uint64_t)v54, CFSTR("Dupe"));

    v56 = (void *)MEMORY[0x1E0CB37E8];
    v59 = objc_msgSend_installed(a1, v57, v58);
    objc_msgSend_numberWithBool_(v56, v60, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v23, v62, (uint64_t)v61, CFSTR("AppInstalled"));

    v63 = (void *)MEMORY[0x1E0CB37E8];
    if (objc_msgSend_hasErrorCode(a1, v64, v65))
      objc_msgSend_errorCode(a1, v66, v67);
    else
      v68 = (double)0;
    objc_msgSend_numberWithDouble_(v63, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v23, v70, (uint64_t)v69, CFSTR("rerankingErrorCode"));

    objc_msgSend_recordID(a1, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v23, v74, (uint64_t)v73, CFSTR("InstanceID"));

    v75 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend_adamID(a1, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithObjectsAndKeys_(v75, v79, (uint64_t)v23, v78, 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setValue_forKey_(v4, v81, (uint64_t)v80, CFSTR("AdRecords"));
  }

  v84 = (void *)objc_msgSend_copy(v4, v82, v83);
  return v84;
}

uint64_t sub_1B69ED198(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, a2, a3, 0, 0);
}

id sub_1B69EE264(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  id v4;

  objc_msgSend_objectForKey_(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

uint64_t sub_1B69EE2B0(void *a1, const char *a2)
{
  return objc_msgSend_mlJSONStringWithPrettyPrint_(a1, a2, 1);
}

__CFString *sub_1B69EE2B8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  __CFString *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend_mlDictionaryForJSON(a1, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(v5, v7, (uint64_t)v6, v4, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;

  if (v9)
  {
    OdmlLogForCategory(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mlDictionaryForJSON(a1, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_1B69D6000, v10, OS_LOG_TYPE_ERROR, "There was an error serializing the following dictionary into JSON (%@):\n%@", buf, 0x16u);

    }
  }
  if (v8)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    v19 = (__CFString *)objc_msgSend_initWithData_encoding_(v17, v18, (uint64_t)v8, 4);
  }
  else
  {
    v19 = CFSTR("{}");
  }

  return v19;
}

id sub_1B69EE424(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  id v77;
  const char *v78;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  void *v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v5 = a1;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v86, v94, 16);
  if (!v7)
    goto LABEL_53;
  v9 = v7;
  v10 = *(_QWORD *)v87;
  while (2)
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v87 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v11);
      objc_msgSend_objectForKey_(v5, v8, (uint64_t)v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_stringValue(v12, v14, v15);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        v17 = CFSTR("UNKNOWN_KEY");
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_11;
        v16 = v12;
      }
      v17 = v16;
LABEL_11:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_mlDictionaryForJSON(v13, v18, v19);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v28 = (id)v20;
        objc_msgSend_setObject_forKey_(v4, v21, v20, v17);
LABEL_20:

        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_APOdml_arrayForJSON(v13, v22, v23);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_APOdml_dataStringForJSON(v13, v24, v25);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_absoluteString(v13, v26, v27);
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_26;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_doubleValue(v13, v30, v31);
        if (fabs(v32) == INFINITY)
        {
          OdmlLogForCategory(6uLL);
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            v76 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v91 = v13;
            v92 = 2112;
            v93 = v76;
            v77 = v76;
            _os_log_impl(&dword_1B69D6000, v75, OS_LOG_TYPE_ERROR, "JSON array validation failed infinity check with the following value: %@ (%@).", buf, 0x16u);

          }
          objc_msgSend_setObject_forKey_(v4, v78, (uint64_t)CFSTR("∞"), v17);

          goto LABEL_53;
        }
LABEL_26:
        objc_msgSend_setObject_forKey_(v4, v29, (uint64_t)v13, v17);
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v13;
        if (objc_msgSend_isUndefined(v28, v33, v34))
        {
          objc_msgSend_setObject_forKey_(v4, v35, (uint64_t)CFSTR("UNDEFINED"), v17);
          goto LABEL_20;
        }
        v84 = v28;
        if (objc_msgSend_type(v28, v35, v36) == 2)
        {
          v81 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_doubleValue(v28, v43, v44);
          objc_msgSend_numberWithDouble_(v81, v45, v46);
          v47 = objc_claimAutoreleasedReturnValue();
LABEL_34:
          v49 = (void *)v47;
          objc_msgSend_setObject_forKey_(v4, v48, v47, v17);

          v28 = v84;
          goto LABEL_20;
        }
        if (objc_msgSend_type(v28, v43, v44) == 5)
        {
          objc_msgSend_multiArrayValue(v28, v53, v54);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_arrayFromMultiarray(v82, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        }
        if (objc_msgSend_type(v28, v53, v54) == 7)
        {
          objc_msgSend_sequenceValue(v28, v60, v61);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringValues(v82, v62, v63);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:
          objc_msgSend_APOdml_arrayForJSON(v57, v58, v59, v57);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v4, v65, (uint64_t)v64, v17);

          v28 = v84;
        }
        else
        {
          if (objc_msgSend_type(v28, v60, v61) != 6)
          {
            if (objc_msgSend_type(v28, v66, v67) != 3)
              goto LABEL_20;
            objc_msgSend_stringValue(v28, v72, v73);
            v47 = objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
          }
          objc_msgSend_dictionaryValue(v28, v66, v67);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mlDictionaryForJSON(v82, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v4, v71, (uint64_t)v70, v17);

          v28 = v84;
        }

        goto LABEL_20;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_dictionaryRepresentation(v13, v37, v38);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mlDictionaryForJSON(v83, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v41, v17);

      }
      else
      {
        OdmlLogForCategory(6uLL);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v91 = v13;
          v92 = 2112;
          v93 = v51;
          v85 = v51;
          _os_log_impl(&dword_1B69D6000, v50, OS_LOG_TYPE_ERROR, "WARNING: Unable to serialize the following object into JSON.\n%@ (%@)", buf, 0x16u);

        }
        objc_msgSend_setObject_forKey_(v4, v52, (uint64_t)CFSTR("INVALID"), v17);
      }
LABEL_21:

      ++v11;
    }
    while (v9 != v11);
    v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v86, v94, 16);
    v9 = v74;
    if (v74)
      continue;
    break;
  }
LABEL_53:

  return v4;
}

void sub_1B69EEADC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B69EEB7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B69EEC68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1B69EECA8(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  const char *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = a1;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v41, v49, 16);
  if (!v7)
    goto LABEL_29;
  v9 = v7;
  v10 = *(_QWORD *)v42;
  v11 = 0x1E0C99000uLL;
  *(_QWORD *)&v8 = 138412546;
  v40 = v8;
  while (2)
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v42 != v10)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_APOdml_arrayForJSON(v13, v14, v15);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v24 = (void *)v16;
        objc_msgSend_addObject_(v4, v17, v16, (_QWORD)v40);

        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_mlDictionaryForJSON(v13, v18, v19);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_APOdml_dataStringForJSON(v13, v20, v21);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_absoluteString(v13, v22, v23);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_20;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_doubleValue(v13, v27, v28);
        if (fabs(v29) == INFINITY)
        {
          OdmlLogForCategory(6uLL);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = (void *)objc_opt_class();
            *(_DWORD *)buf = v40;
            v46 = v13;
            v47 = 2112;
            v48 = v36;
            v37 = v36;
            _os_log_impl(&dword_1B69D6000, v35, OS_LOG_TYPE_ERROR, "JSON array validation failed infinity check with the following value: %@ (%@).", buf, 0x16u);

          }
          objc_msgSend_addObject_(v4, v38, (uint64_t)CFSTR("∞"));
          goto LABEL_29;
        }
LABEL_20:
        objc_msgSend_addObject_(v4, v26, (uint64_t)v13, v40, (_QWORD)v41);
        goto LABEL_15;
      }
      v30 = v11;
      OdmlLogForCategory(6uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (void *)objc_opt_class();
        *(_DWORD *)buf = v40;
        v46 = v13;
        v47 = 2112;
        v48 = v32;
        v33 = v32;
        _os_log_impl(&dword_1B69D6000, v31, OS_LOG_TYPE_ERROR, "WARNING: Unable to serialize the following object into JSON.\n%@ (%@)", buf, 0x16u);

      }
      v11 = v30;
LABEL_15:
      ++v12;
    }
    while (v9 != v12);
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v25, (uint64_t)&v41, v49, 16);
    v9 = v34;
    if (v34)
      continue;
    break;
  }
LABEL_29:

  return v4;
}

__CFString *sub_1B69EF070(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  __CFString *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend_APOdml_arrayForJSON(a1, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(v5, v7, (uint64_t)v6, v4, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;

  if (v9)
  {
    OdmlLogForCategory(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_APOdml_arrayForJSON(a1, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_1B69D6000, v10, OS_LOG_TYPE_ERROR, "There was an error serializing the following array into JSON (%@):\n%@", buf, 0x16u);

    }
  }
  if (v8)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    v19 = (__CFString *)objc_msgSend_initWithData_encoding_(v17, v18, (uint64_t)v8, 4);
  }
  else
  {
    v19 = CFSTR("[]");
  }

  return v19;
}

uint64_t sub_1B69EF1DC(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](a1, sel_APOdml_jsonStringWithPrettyPrint_, 1);
}

uint64_t sub_1B69F0120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_saveUserQueryVector, a3);
}

void sub_1B69F0128(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  id v11;

  objc_msgSend_dictionary(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 40), v5, *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logModelInputWithAdamID_adamID_(APOdmlLogUtility, v7, (uint64_t)v4, v6);

  v8 = *(void **)(a1 + 48);
  objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 56), v9, *(_QWORD *)(a1 + 64));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_saveFeaturesFromResponse_(v8, v10, (uint64_t)v11);

}

BOOL sub_1B69F19EC(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _BOOL8 v10;

  objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3780], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addCharactersInString_(v4, v5, (uint64_t)CFSTR("."));
  objc_msgSend_invertedSet(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_rangeOfCharacterFromSet_(a1, v9, (uint64_t)v8) == 0x7FFFFFFFFFFFFFFFLL;

  return v10;
}

uint64_t sub_1B69F30BC()
{
  id v0;
  void *v1;
  const char *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)qword_1EF142B30;
  qword_1EF142B30 = (uint64_t)v0;

  objc_msgSend_setNumberStyle_((void *)qword_1EF142B30, v2, 1);
  return MEMORY[0x1E0DE7D20](qword_1EF142B30, sel_setDecimalSeparator_, CFSTR("."));
}

uint64_t sub_1B69F3358(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  return result;
}

uint64_t ADFeatureReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
          {
            v10 = 0;
            v16 = *v5;
            v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(_BYTE *)(a2 + v16))
          v10 = 0;
LABEL_14:
        v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              PBReaderReadString();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = 48;
              goto LABEL_35;
            case 2u:
              if (v18 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (1)
                {
                  v22 = (unint64_t *)(a2 + *v3);
                  v23 = *v22;
                  v24 = *(_QWORD *)(a2 + *v4);
                  if (*v22 >= v24)
                    break;
                  v25 = *v5;
                  if (*(_BYTE *)(a2 + v25))
                    break;
                  if (v23 > 0xFFFFFFFFFFFFFFF7 || v23 + 8 > v24)
                    *(_BYTE *)(a2 + v25) = 1;
                  else
                    *v22 = v23 + 8;
                  PBRepeatedDoubleAdd();
                }
                PBReaderRecallMark();
              }
              else
              {
                v29 = *v3;
                v30 = *(_QWORD *)(a2 + v29);
                if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
                  *(_QWORD *)(a2 + v29) = v30 + 8;
                else
                  *(_BYTE *)(a2 + v16) = 1;
                PBRepeatedDoubleAdd();
              }
LABEL_42:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            case 3u:
              PBReaderReadString();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
                objc_msgSend_addStringValue_(a1, v26, (uint64_t)v27);

              goto LABEL_42;
            case 4u:
              PBReaderReadString();
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = 32;
LABEL_35:
              v28 = *(void **)&a1[v21];
              *(_QWORD *)&a1[v21] = v20;

              goto LABEL_42;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_42;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1B69F5A6C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1B69F5E10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1B69F5E24(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;

  v7 = a2;
  objc_msgSend_taskDeferred(*(void **)(a1 + 32), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
    *a4 = 1;
  }
  else
  {
    objc_msgSend_operationQueue(*(void **)(a1 + 32), v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B69F5F1C;
    v16[3] = &unk_1E6A297F8;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v7;
    v19 = a3;
    v18 = *(id *)(a1 + 40);
    objc_msgSend_addOperationWithBlock_(v14, v15, (uint64_t)v16);

  }
}

void sub_1B69F5F1C(uint64_t a1, const char *a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  _QWORD v14[5];
  id v15;

  objc_msgSend_runFeatureCalculator_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend_validFeatureCalculators(*(void **)(a1 + 32), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8) - 1;

  if (v3 == v9)
  {
    objc_msgSend_operationQueue(*(void **)(a1 + 32), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B69F5FE4;
    v14[3] = &unk_1E6A297D0;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    objc_msgSend_addOperationWithBlock_(v12, v13, (uint64_t)v14);

  }
}

uint64_t sub_1B69F5FE4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t result;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_calculatorErrors(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  OdmlLogForCategory(3uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      objc_msgSend_calculatorErrors(v11, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138478083;
      v19 = v10;
      v20 = 2113;
      v21 = v15;
      _os_log_impl(&dword_1B69D6000, v9, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: Failed to calculate features with the following errors: %{private}@", (uint8_t *)&v18, 0x16u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138477827;
    v19 = (id)objc_opt_class();
    v16 = v19;
    _os_log_impl(&dword_1B69D6000, v9, OS_LOG_TYPE_DEFAULT, "[%{private}@] Successfully calculated all features.", (uint8_t *)&v18, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1B69F6524(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  id v15;

  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_placementType(*(void **)(a1 + 32), v5, v6);
  v10 = objc_msgSend_assetManagerType(*(void **)(a1 + 32), v8, v9);
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_doubleValueForFactor_(v15, v12, (uint64_t)CFSTR("LookbackWindow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteExpiredFeaturesForName_lookbackWindow_(v15, v14, (uint64_t)CFSTR("appUsageVector"), v13);

}

void sub_1B69F8288(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B69F82E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B69F8354(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B69F83B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B69F8410(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B69F84E8(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  const char *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend_workQueue(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B69F8584;
  v7[3] = &unk_1E6A29CD8;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend_addOperationWithBlock_(v4, v6, (uint64_t)v7);

}

void sub_1B69F8584(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int shouldDefer;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 8) && (objc_msgSend_isEqualToDate_(*(void **)(a1 + 40), v2, *(_QWORD *)(v3 + 32)) & 1) != 0)
  {
    objc_sync_exit(obj);

    shouldDefer = objc_msgSend_shouldDefer(*(void **)(a1 + 32), v4, v5);
    v9 = *(void **)(a1 + 32);
    if (shouldDefer)
    {
      objc_msgSend_endBackgroundDeferralCheck(v9, v6, v7);
      objc_msgSend_deferTask(*(void **)(a1 + 32), v10, v11);
      v12 = *(_QWORD *)(a1 + 48);
      if (v12)
        (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
    }
    else
    {
      objc_msgSend__backgroundDeferralCheck_completion_(v9, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
    objc_sync_exit(obj);

  }
}

void sub_1B69F8668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B69F877C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B69F9838(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B69F9868(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B69F9878(uint64_t a1)
{

}

void sub_1B69F9880(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend_state(v2, v3, v4) == 1)
  {
    OdmlLogForCategory(0xCuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_error(v2, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B69D6000, v5, OS_LOG_TYPE_ERROR, "Failed to query TrainingRow data: %@", (uint8_t *)&v9, 0xCu);

    }
  }

}

void sub_1B69F9954(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend_eventBody(v3, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_combineRecords_andSaveTo_(v4, v7, (uint64_t)v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_1B69F99C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  id v8;

  v5 = a3;
  v8 = a2;
  v6 = (void *)objc_opt_class();
  objc_msgSend_trainingRowsFromBiomeEvent_recordID_requiredFeatures_andSaveTo_(v6, v7, (uint64_t)v5, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void sub_1B69F9EFC(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  id v11;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("_%ld"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v4, v9, (uint64_t)v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setRowID_(v6, v10, (uint64_t)v11);
}

uint64_t sub_1B69FA048(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend_isValidRow_(a2, (const char *)a2, *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 40), sel_addIndex_, a3);
  return result;
}

uint64_t sub_1B69FA438(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t isEqualToString;

  objc_msgSend_lastPathComponent(a2, (const char *)a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *(_QWORD *)(a1 + 32));

  return isEqualToString;
}

id sub_1B69FA498(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  uint64_t v12;

  v3 = (objc_class *)MEMORY[0x1E0C9E970];
  v4 = a3;
  v5 = [v3 alloc];
  v12 = 0;
  v7 = (void *)objc_msgSend_initWithShape_dataType_error_(v5, v6, (uint64_t)&unk_1E6A33CD8, 65600, &v12);
  objc_msgSend_setObject_atIndexedSubscript_(v7, v8, (uint64_t)v4, 0);

  objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v9, (uint64_t)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_1B69FA594()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_1ED532F48;
  qword_1ED532F48 = (uint64_t)v0;

}

void sub_1B69FA978(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  NSObject *v27;
  id v28;
  const char *v29;
  NSObject *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  _QWORD v37[5];
  _QWORD v38[5];
  uint8_t buf[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend_listeningLock(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v4, v5, v6);

  if ((objc_msgSend_isListening(*(void **)(a1 + 32), v7, v8) & 1) != 0)
  {
    if (objc_msgSend_isListening(*(void **)(a1 + 32), v9, v10)
      && (objc_msgSend_listeningError(*(void **)(a1 + 32), v11, v12),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      OdmlLogForCategory(4uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        *(_QWORD *)&buf[4] = objc_opt_class();
        v31 = *(id *)&buf[4];
        _os_log_impl(&dword_1B69D6000, v30, OS_LOG_TYPE_DEFAULT, "[%{private}@] StoreServer startListening call while server is listening, and did not have an error on previous attempt.", buf, 0xCu);

      }
      objc_msgSend_listeningLock(*(void **)(a1 + 32), v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unlock(v34, v35, v36);

    }
    else if (objc_msgSend_isListening(*(void **)(a1 + 32), v11, v12))
    {
      objc_msgSend_listeningError(*(void **)(a1 + 32), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        OdmlLogForCategory(4uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(_QWORD *)&buf[4] = objc_opt_class();
          v18 = *(id *)&buf[4];
          _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_DEFAULT, "[%{private}@] StoreServer startListening call while server is listening, but had an error on previous attempt.", buf, 0xCu);

        }
        v19 = *(void **)(a1 + 32);
        objc_msgSend_modelURL(v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_storeServerForModelURL_(v19, v23, (uint64_t)v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setStoreServer_(*(void **)(a1 + 32), v25, (uint64_t)v24);

        objc_msgSend__startListening_(*(void **)(a1 + 32), v26, (uint64_t)v37, MEMORY[0x1E0C809B0], 3221225472, sub_1B69FAC74, &unk_1E6A29570, *(_QWORD *)(a1 + 32), v38[0], v38[1], v38[2], v38[3], v38[4], *(_OWORD *)buf);
      }
    }
  }
  else
  {
    OdmlLogForCategory(4uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = objc_opt_class();
      v28 = *(id *)&buf[4];
      _os_log_impl(&dword_1B69D6000, v27, OS_LOG_TYPE_DEFAULT, "[%{private}@] StoreServer startListening call while server is not listening; first attempt to launch the server.",
        buf,
        0xCu);

    }
    objc_msgSend__startListening_(*(void **)(a1 + 32), v29, (uint64_t)v38, v37[0], v37[1], v37[2], v37[3], v37[4], MEMORY[0x1E0C809B0], 3221225472, sub_1B69FAC44, &unk_1E6A29570, *(_QWORD *)(a1 + 32), *(_OWORD *)buf);
  }
}

void sub_1B69FAC44(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_listeningLock(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v5, v3, v4);

}

void sub_1B69FAC74(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_listeningLock(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v5, v3, v4);

}

void sub_1B69FAE94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  const char *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  OdmlLogForCategory(4uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend_options(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138478083;
    v28 = v8;
    v29 = 2113;
    v30 = v12;
    _os_log_impl(&dword_1B69D6000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@] NSPersistentStoreDescription: %{private}@", (uint8_t *)&v27, 0x16u);

  }
  objc_msgSend_startListening(*(void **)(*(_QWORD *)(a1 + 32) + 16), v13, v14);
  OdmlLogForCategory(4uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    v27 = 138477827;
    v28 = v16;
    v17 = v16;
    _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_DEFAULT, "[%{private}@] StoreServer began listening.", (uint8_t *)&v27, 0xCu);

  }
  objc_msgSend_setIsListening_(*(void **)(a1 + 32), v18, 1);
  objc_msgSend_setListeningError_(*(void **)(a1 + 32), v19, (uint64_t)v6);
  if (v6)
  {
    OdmlLogForCategory(4uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_opt_class();
      v27 = 138478083;
      v28 = v21;
      v29 = 2112;
      v30 = v6;
      v22 = v21;
      _os_log_impl(&dword_1B69D6000, v20, OS_LOG_TYPE_ERROR, "[%{private}@] StoreServer failed to initialize DB with error: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v23, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5011, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v25, (uint64_t)v24, 0);

  }
  v26 = *(_QWORD *)(a1 + 40);
  if (v26)
    (*(void (**)(void))(v26 + 16))();

}

void sub_1B69FB550(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  os_signpost_id_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t isPersonalizedAdsEnabled;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  id v46;
  const char *v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  id v51;
  const char *v52;
  void *v53;
  const char *v54;
  int v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  OdmlLogForCategory(5uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_ident(*(void **)(a1 + 32), v3, v4);
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v2))
    {
      LOWORD(v55) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v2, OS_SIGNPOST_INTERVAL_END, v6, "GCD Overhead", (const char *)&unk_1B6A07EB5, (uint8_t *)&v55, 2u);
    }
  }

  if (objc_msgSend_count(*(void **)(a1 + 40), v7, v8))
  {
    objc_msgSend_setOriginalAds_(*(void **)(a1 + 32), v9, *(_QWORD *)(a1 + 40));
    objc_msgSend_date(MEMORY[0x1E0C99D68], v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRerankingStartDate_(*(void **)(a1 + 32), v13, (uint64_t)v12);

    v14 = *(_QWORD *)(a1 + 40);
    isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(*(void **)(a1 + 32), v15, v16);
    objc_msgSend_assetManager(*(void **)(a1 + 32), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_BOOLeanValueForFactor_(v20, v21, (uint64_t)CFSTR("KillSwitch"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_BOOLValue(v22, v23, v24);
    v27 = objc_msgSend_permissionCheck_personalizedAdsEnabled_trialKillswitch_(APOdmlValidator, v26, v14, isPersonalizedAdsEnabled, v25);

    if (!v27)
    {
      objc_msgSend_predictAndExplore_(*(void **)(a1 + 32), v28, *(_QWORD *)(a1 + 40));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRerankedAds_(*(void **)(a1 + 32), v30, (uint64_t)v29);

      v31 = *(void **)(a1 + 32);
      objc_msgSend_rerankedAds(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = objc_msgSend_sendRerankResponseIfAvailable_error_(v31, v35, (uint64_t)v34, 0);

      if ((_DWORD)v31)
      {
        objc_msgSend_rerankingStartDate(*(void **)(a1 + 32), v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_date(MEMORY[0x1E0C99D68], v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v42, 0, 0, 0, v38, v41);

      }
      return;
    }
    OdmlLogForCategory(5uLL);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (v27 == 2003)
    {
      if (v49)
      {
        v50 = (void *)objc_opt_class();
        v55 = 138412290;
        v56 = v50;
        v51 = v50;
        v52 = "[%@] Reranking Error: Reranking not permitted.";
LABEL_16:
        _os_log_impl(&dword_1B69D6000, v48, OS_LOG_TYPE_ERROR, v52, (uint8_t *)&v55, 0xCu);

      }
    }
    else if (v49)
    {
      v53 = (void *)objc_opt_class();
      v55 = 138412290;
      v56 = v53;
      v51 = v53;
      v52 = "[%@] Reranking Error: Reranking not enabled.";
      goto LABEL_16;
    }

    objc_msgSend__handleError_(*(void **)(a1 + 32), v54, v27);
    return;
  }
  OdmlLogForCategory(5uLL);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    v44 = (void *)objc_opt_class();
    v45 = *(_QWORD *)(a1 + 40);
    v55 = 138412546;
    v56 = v44;
    v57 = 2112;
    v58 = v45;
    v46 = v44;
    _os_log_impl(&dword_1B69D6000, v43, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: Rankable objects list %@ is empty or nil.", (uint8_t *)&v55, 0x16u);

  }
  objc_msgSend__handleError_(*(void **)(a1 + 32), v47, 2004);
}

void sub_1B69FBA4C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend_rerankedAds(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend_rerankedAds(*(void **)(a1 + 32), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_sendRerankResponseIfAvailable_error_(v7, v9, (uint64_t)v8, 0);

    if (v10)
    {
      objc_msgSend_rerankingStartDate(*(void **)(a1 + 32), v11, v12);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_date(MEMORY[0x1E0C99D68], v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v16, 0, 0, 0, v45, v15);

    }
  }
  else
  {
    objc_msgSend_rerankerError(*(void **)(a1 + 32), v5, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v20 = *(void **)(a1 + 32);
      objc_msgSend_originalAds(v20, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rerankerError(*(void **)(a1 + 32), v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend_sendRerankResponseIfAvailable_error_(v20, v25, (uint64_t)v21, v24);

      if ((_DWORD)v20)
      {
        OdmlLogForCategory(5uLL);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)objc_opt_class();
          v28 = *(void **)(a1 + 32);
          v29 = v27;
          objc_msgSend_rerankerError(v28, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v47 = v27;
          v48 = 2048;
          v49 = objc_msgSend_code(v32, v33, v34);
          _os_log_impl(&dword_1B69D6000, v26, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: %ld.", buf, 0x16u);

        }
        objc_msgSend_rerankerError(*(void **)(a1 + 32), v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rerankingStartDate(*(void **)(a1 + 32), v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_date(MEMORY[0x1E0C99D68], v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v44, (uint64_t)v37, 0, 0, v40, v43);

      }
    }
  }
}

void sub_1B69FBCC8(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend_rerankDispatchGroup(*(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  v6 = dispatch_group_wait(v4, v5);

  OdmlLogForCategory(5uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v13 = 138412290;
      v14 = (id)objc_opt_class();
      v9 = v14;
      _os_log_impl(&dword_1B69D6000, v7, OS_LOG_TYPE_INFO, "[%@] Reranker failed to complete before SLA was reached", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend_rerankResponseTimeout(*(void **)(a1 + 32), v10, v11);
  }
  else
  {
    if (v8)
    {
      v13 = 138412290;
      v14 = (id)objc_opt_class();
      v12 = v14;
      _os_log_impl(&dword_1B69D6000, v7, OS_LOG_TYPE_INFO, "[%@] Reranker completed before SLA was reached", (uint8_t *)&v13, 0xCu);

    }
  }
}

void sub_1B69FC95C()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.ap.reranking", attr);
  v2 = (void *)qword_1ED532E90;
  qword_1ED532E90 = (uint64_t)v1;

}

void sub_1B69FCA0C()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.ap.rerankingTimeout", attr);
  v2 = (void *)qword_1ED532E88;
  qword_1ED532E88 = (uint64_t)v1;

}

_QWORD *get_espresso_buffer_shape@<X0>(_QWORD *a1@<X8>)
{
  espresso_buffer_unpack_tensor_shape();
  return sub_1B69DD928(a1, 0);
}

float accuracy_in_batch(uint64_t *a1, _QWORD *a2)
{
  float v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  float *v10;
  float *v11;
  float *v12;
  float v13;
  uint64_t v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  unint64_t *v20;
  char *v21;

  get_espresso_buffer_shape(&v20);
  v4 = 0.0;
  if ((unint64_t)(v21 - (char *)v20) >= 0x10)
  {
    v5 = *v20;
    if (*v20)
    {
      v6 = 0;
      v7 = 0;
      v8 = v20[1];
      v9 = *a1;
      do
      {
        v10 = (float *)(v9 + 4 * v6 * v8);
        if (v8 >= 2)
        {
          v12 = v10 + 1;
          v13 = *v10;
          v14 = 4 * v8 - 4;
          v11 = (float *)(v9 + 4 * v6 * v8);
          v15 = v10 + 1;
          do
          {
            v16 = *v15++;
            v17 = v16;
            if (v13 < v16)
            {
              v13 = v17;
              v11 = v12;
            }
            v12 = v15;
            v14 -= 4;
          }
          while (v14);
        }
        else
        {
          v11 = (float *)(v9 + 4 * v6 * v8);
        }
        if (((unint64_t)((char *)v11 - (char *)v10) >> 2) == llroundf(*(float *)(*a2 + 4 * v6)))
          ++v7;
        ++v6;
      }
      while (v6 != v5);
      v18 = (float)v7;
    }
    else
    {
      v18 = 0.0;
    }
    v4 = v18 / (float)v5;
  }
  if (v20)
  {
    v21 = (char *)v20;
    operator delete(v20);
  }
  return v4;
}

void print_espresso_buffer(char *a1@<X0>, float **a2@<X1>, std::string *a3@<X8>)
{
  unint64_t *v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  float *v10;
  char *v11;
  std::string *v12;
  void **v13;
  std::string::size_type v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  char *v19;
  std::string *v20;
  void **v21;
  std::string::size_type v22;
  std::string *v23;
  void *v24[2];
  char v25;
  void *v26[2];
  char v27;
  std::string v28;
  void *__p[2];
  unsigned __int8 v30;
  std::string v31;
  void *v32[2];
  unsigned __int8 v33;
  std::string v34;
  std::string v35;
  std::string v36;
  unint64_t *v37;
  unint64_t *v38;

  get_espresso_buffer_shape(&v37);
  v6 = v37;
  v7 = 1;
  while (v6 != v38)
  {
    v8 = *(_DWORD *)v6++;
    v7 *= v8;
  }
  if (v7 >= 5)
    v9 = 5;
  else
    v9 = v7;
  v10 = *a2;
  if (a1[23] >= 0)
    v11 = a1;
  else
    v11 = *(char **)a1;
  sub_1B69E954C(&v34, v11);
  sub_1B69FD080(&v37, &v31);
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v12 = &v31;
  else
    v12 = (std::string *)v31.__r_.__value_.__r.__words[0];
  sub_1B69E954C(v32, (char *)v12);
  if ((v33 & 0x80u) == 0)
    v13 = v32;
  else
    v13 = (void **)v32[0];
  if ((v33 & 0x80u) == 0)
    v14 = v33;
  else
    v14 = (std::string::size_type)v32[1];
  v15 = std::string::append(&v34, (const std::string::value_type *)v13, v14);
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v35.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  v17 = std::string::append(&v35, ": ");
  v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v36.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  sub_1B69E954C(v26, "[");
  if (v7 <= 5)
    v19 = "]";
  else
    v19 = "...]";
  sub_1B69E954C(v24, v19);
  sub_1B69FD13C(v10, &v10[v9], (uint64_t)v26, (uint64_t)v24, &v28);
  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v28;
  else
    v20 = (std::string *)v28.__r_.__value_.__r.__words[0];
  sub_1B69E954C(__p, (char *)v20);
  if ((v30 & 0x80u) == 0)
    v21 = __p;
  else
    v21 = (void **)__p[0];
  if ((v30 & 0x80u) == 0)
    v22 = v30;
  else
    v22 = (std::string::size_type)__p[1];
  v23 = std::string::append(&v36, (const std::string::value_type *)v21, v22);
  *a3 = *v23;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  if ((char)v30 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);
  if (v25 < 0)
    operator delete(v24[0]);
  if (v27 < 0)
    operator delete(v26[0]);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36.__r_.__value_.__l.__data_);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);
  if ((char)v33 < 0)
    operator delete(v32[0]);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
  if (v37)
  {
    v38 = v37;
    operator delete(v37);
  }
}

void sub_1B69FCF8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51)
{
  uint64_t v51;
  void *v53;

  if (a33 < 0)
    operator delete(__p);
  if (a27 < 0)
    operator delete(a22);
  if (a15 < 0)
    operator delete(a10);
  if (a21 < 0)
    operator delete(a16);
  if (*(char *)(v51 - 73) < 0)
    operator delete(*(void **)(v51 - 96));
  if (*(char *)(v51 - 105) < 0)
    operator delete(*(void **)(v51 - 128));
  if (a45 < 0)
    operator delete(a40);
  if (a39 < 0)
    operator delete(a34);
  if (a51 < 0)
    operator delete(a46);
  v53 = *(void **)(v51 - 72);
  if (v53)
  {
    *(_QWORD *)(v51 - 64) = v53;
    operator delete(v53);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B69FD078()
{
  JUMPOUT(0x1B69FD060);
}

void sub_1B69FD080(unint64_t **a1@<X0>, std::string *a2@<X8>)
{
  unint64_t *v3;
  unint64_t *v4;
  void *__p[2];
  char v6;
  void *v7[2];
  char v8;

  v3 = *a1;
  v4 = a1[1];
  sub_1B69E954C(v7, "(");
  sub_1B69E954C(__p, ")");
  sub_1B69FD45C(v3, v4, (uint64_t)v7, (uint64_t)__p, a2);
  if (v6 < 0)
    operator delete(__p[0]);
  if (v8 < 0)
    operator delete(v7[0]);
}

void sub_1B69FD108(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void sub_1B69FD13C(float *a1@<X0>, float *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  std::string *v13;
  __int128 v14;
  float *i;
  void **v16;
  std::string::size_type v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  std::string::size_type size;
  int v22;
  const std::string::value_type *v23;
  std::string::size_type v24;
  std::string v25;
  std::string v26;
  void *__p[2];
  unsigned __int8 v28;

  sub_1B69E954C(__p, ", ");
  std::to_string(&v26, *a1);
  v10 = *(char *)(a3 + 23);
  if (v10 >= 0)
    v11 = (const std::string::value_type *)a3;
  else
    v11 = *(const std::string::value_type **)a3;
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(a3 + 23);
  else
    v12 = *(_QWORD *)(a3 + 8);
  v13 = std::string::insert(&v26, 0, v11, v12);
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  a5->__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  for (i = a1 + 1; i != a2; ++i)
  {
    std::to_string(&v25, *i);
    if ((v28 & 0x80u) == 0)
      v16 = __p;
    else
      v16 = (void **)__p[0];
    if ((v28 & 0x80u) == 0)
      v17 = v28;
    else
      v17 = (std::string::size_type)__p[1];
    v18 = std::string::insert(&v25, 0, (const std::string::value_type *)v16, v17);
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = &v26;
    else
      v20 = (std::string *)v26.__r_.__value_.__r.__words[0];
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
    else
      size = v26.__r_.__value_.__l.__size_;
    std::string::append(a5, (const std::string::value_type *)v20, size);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v26.__r_.__value_.__l.__data_);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
  }
  v22 = *(char *)(a4 + 23);
  if (v22 >= 0)
    v23 = (const std::string::value_type *)a4;
  else
    v23 = *(const std::string::value_type **)a4;
  if (v22 >= 0)
    v24 = *(unsigned __int8 *)(a4 + 23);
  else
    v24 = *(_QWORD *)(a4 + 8);
  std::string::append(a5, v23, v24);
  if ((char)v28 < 0)
    operator delete(__p[0]);
}

void sub_1B69FD2C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v27;

  if (*(char *)(v27 + 23) < 0)
    operator delete(*(void **)v27);
  if (a27 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *get_espresso_blob_shape@<X0>(_QWORD *a1@<X8>)
{
  espresso_network_query_blob_shape();
  return sub_1B69DD928(a1, 0);
}

uint64_t *nd_shape_to_5d_shape@<X0>(uint64_t *result@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v2 = *result;
  v3 = result[1] - *result;
  if (!v3)
  {
    *a2 = 1;
    goto LABEL_8;
  }
  v4 = (uint64_t)v3 >> 3;
  v5 = v2 + 8 * ((uint64_t)v3 >> 3);
  *a2 = *(_QWORD *)(v5 - 8);
  if (v3 <= 8)
  {
LABEL_8:
    a2[1] = 1;
    goto LABEL_9;
  }
  a2[1] = *(_QWORD *)(v5 - 16);
  if (v3 <= 0x10)
  {
LABEL_9:
    a2[2] = 1;
    goto LABEL_10;
  }
  v6 = v2 + 8 * v4;
  a2[2] = *(_QWORD *)(v6 - 24);
  if (v3 <= 0x18)
  {
LABEL_10:
    v7 = 1;
    a2[3] = 1;
    goto LABEL_11;
  }
  a2[3] = *(_QWORD *)(v6 - 32);
  if (v3 < 0x21)
    v7 = 1;
  else
    v7 = *(_DWORD *)(v2 + 8 * v4 - 40);
LABEL_11:
  a2[4] = v7;
  a2[5] = v3 >> 3;
  return result;
}

void sub_1B69FD45C(unint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  std::string *v13;
  __int128 v14;
  unint64_t *i;
  void **v16;
  std::string::size_type v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  std::string::size_type size;
  int v22;
  const std::string::value_type *v23;
  std::string::size_type v24;
  std::string v25;
  std::string v26;
  void *__p[2];
  unsigned __int8 v28;

  sub_1B69E954C(__p, ", ");
  std::to_string(&v26, *a1);
  v10 = *(char *)(a3 + 23);
  if (v10 >= 0)
    v11 = (const std::string::value_type *)a3;
  else
    v11 = *(const std::string::value_type **)a3;
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(a3 + 23);
  else
    v12 = *(_QWORD *)(a3 + 8);
  v13 = std::string::insert(&v26, 0, v11, v12);
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  a5->__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  for (i = a1 + 1; i != a2; ++i)
  {
    std::to_string(&v25, *i);
    if ((v28 & 0x80u) == 0)
      v16 = __p;
    else
      v16 = (void **)__p[0];
    if ((v28 & 0x80u) == 0)
      v17 = v28;
    else
      v17 = (std::string::size_type)__p[1];
    v18 = std::string::insert(&v25, 0, (const std::string::value_type *)v16, v17);
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = &v26;
    else
      v20 = (std::string *)v26.__r_.__value_.__r.__words[0];
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
    else
      size = v26.__r_.__value_.__l.__size_;
    std::string::append(a5, (const std::string::value_type *)v20, size);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v26.__r_.__value_.__l.__data_);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
  }
  v22 = *(char *)(a4 + 23);
  if (v22 >= 0)
    v23 = (const std::string::value_type *)a4;
  else
    v23 = *(const std::string::value_type **)a4;
  if (v22 >= 0)
    v24 = *(unsigned __int8 *)(a4 + 23);
  else
    v24 = *(_QWORD *)(a4 + 8);
  std::string::append(a5, v23, v24);
  if ((char)v28 < 0)
    operator delete(__p[0]);
}

void sub_1B69FD5E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v27;

  if (*(char *)(v27 + 23) < 0)
    operator delete(*(void **)v27);
  if (a27 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

id sub_1B69FEBEC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v11 = CFSTR("errorSource");
  v12[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v3, v8, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8034, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_1B69FECC8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v11 = CFSTR("errorSource");
  v12[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v3, v8, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8035, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_1B69FEDA4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v11 = CFSTR("errorSource");
  v12[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v3, v8, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8036, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_1B69FEE80(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  const char *v5;
  void *v6;
  uint64_t *v7;
  void *v8;
  int isEqualToString;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("AppDownloadVector")))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = &kAPODMLDESPluginBindADVInputFail;
LABEL_8:
    objc_msgSend_errorWithDomain_code_userInfo_(v6, v5, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), *v7, 0);
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("AppInstalledVector")))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = &kAPODMLDESPluginBindIAVInputFail;
    goto LABEL_8;
  }
  if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("AppUsageVector")) & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("appUsageVector")))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = &kAPODMLDESPluginBindAUVInputFail;
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("DupeFirstOrganic")))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = &kAPODMLDESPluginBindDupeFirstOrganicInputFail;
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("Installed")))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = &kAPODMLDESPluginBindInstalledInputFail;
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("pTTRLogit")))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = &kAPODMLDESPluginBindPTTRInputFail;
    goto LABEL_8;
  }
  if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("Tapped")) & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("Tap")))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = &kAPODMLDESPluginBindLabelInputFail;
    goto LABEL_8;
  }
  isEqualToString = objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("AppVector"));
  v12 = (void *)MEMORY[0x1E0CB35C8];
  if (!isEqualToString)
  {
    v15 = CFSTR("errorSource");
    v16[0] = v3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v14, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8018, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8018, 0);
LABEL_9:
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

void sub_1B6A01118()
{
  __assert_rtn("OdmlLogForCategory", "APOdmlLog.m", 16, "category < OdmlLogCategoryCount");
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1E0CFA250]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1E0D82D68]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1E0D82D70]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1E0D82D78]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1E0D82D80]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1E0D82D88]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1E0D82D90]();
}

uint64_t PBRepeatedDoubleSet()
{
  return MEMORY[0x1E0D82D98]();
}

uint64_t SimulateCrash()
{
  return MEMORY[0x1E0D64FB0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x1E0DE4D50](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E6A28DA0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E6A28DA8(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

double drand48(void)
{
  double result;

  MEMORY[0x1E0C83070]();
  return result;
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x1E0D1FF00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_get_input_blob_name()
{
  return MEMORY[0x1E0D1FF90]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_bind_buffer_to_global()
{
  return MEMORY[0x1E0D1FFC8]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x1E0D20028]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1E0D20040]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x1E0D20070]();
}

uint64_t espresso_network_set_function_name()
{
  return MEMORY[0x1E0D20090]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t get_main_function_name()
{
  return MEMORY[0x1E0D20188]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

void srand48(uint64_t a1)
{
  MEMORY[0x1E0C85480](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C328](__A, __IA, __C, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C940](__B, __IB, __A, __IA, __C, __IC, __N);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}


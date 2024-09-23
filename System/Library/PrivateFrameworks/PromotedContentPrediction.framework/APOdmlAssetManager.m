@implementation APOdmlAssetManager

- (id)BOOLeanValueForFactor:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_trialClient(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_trialClient(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialNamespace(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_levelForFactor_withNamespaceName_(v10, v14, (uint64_t)v4, v13);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = objc_msgSend_BOOLeanValue(v15, v16, v17);
      objc_msgSend_numberWithBool_(v18, v20, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      OdmlLogForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        v24 = v23;
        objc_msgSend_trialNamespace(self, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138413058;
        v36 = v23;
        v37 = 2112;
        v38 = v4;
        v39 = 2112;
        v40 = v27;
        v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_1B69D6000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Boolean value for factor %@ in namespace %@: %@", (uint8_t *)&v35, 0x2Au);

      }
    }
    else
    {
      OdmlLogForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_opt_class();
        v30 = v29;
        objc_msgSend_trialNamespace(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412802;
        v36 = v29;
        v37 = 2112;
        v38 = v4;
        v39 = 2112;
        v40 = v33;
        _os_log_impl(&dword_1B69D6000, v22, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v35, 0x20u);

      }
      v21 = 0;
    }

  }
  else
  {
    OdmlLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v35 = 138412546;
      v36 = (id)objc_opt_class();
      v37 = 2112;
      v38 = v4;
      v28 = v36;
      _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v35, 0x16u);

    }
    v21 = 0;
  }

  return v21;
}

- (id)currentMLModel
{
  uint64_t v2;
  unint64_t v4;
  void *v5;
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
  NSObject *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  __CFString *v48;
  void *v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  NSObject *v71;
  id v72;
  const char *v73;
  const char *v74;
  _QWORD v75[3];
  _QWORD v76[3];
  uint8_t buf[4];
  id v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = 0x1E0C99000uLL;
  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialClient(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_pathForFactor_isDirectory_(self, v9, (uint64_t)CFSTR("PTTRMLModel"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modelCache(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v13, v14, (uint64_t)v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      OdmlLogForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_opt_class();
        v19 = v18;
        objc_msgSend_description(v10, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v78 = v18;
        v79 = 2112;
        v80 = v22;
        _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_DEFAULT, "[%@] Returning cached model for %@.", buf, 0x16u);

        v4 = 0x1E0C99000;
      }
    }
    else
    {
      objc_msgSend_BOOLeanValueForFactor_(self, v16, (uint64_t)CFSTR("PredictionUsesCPUOnly"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_BOOLValue(v27, v28, v29);

      objc_msgSend_modelFromCompiledURL_isCPUOnly_(MEMORY[0x1E0C9E940], v31, (uint64_t)v10, v30);
      v32 = objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        OdmlLogForCategory(0);
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v78 = (id)objc_opt_class();
          v72 = v78;
          _os_log_impl(&dword_1B69D6000, v71, OS_LOG_TYPE_ERROR, "[%@] Could not open model.", buf, 0xCu);

        }
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v73, (uint64_t)CFSTR("APOdmlRerankingErrorDomain"), 2010, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsReranking, v74, (uint64_t)v41, 0);
        v15 = 0;
        v48 = CFSTR("ERROR: Could not find valid model description.");
        goto LABEL_15;
      }
      v15 = (void *)v32;
      objc_msgSend_modelCache(self, v33, v34);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v17, v35, (uint64_t)v15, v10);
    }

    objc_msgSend_modelDescription(v15, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metadata(v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(v41, v42, (uint64_t)CFSTR("MLModelDescriptionKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v43;
    if (v43 && (objc_msgSend_isEqualToString_(v43, v44, (uint64_t)&stru_1E6A29F10) & 1) == 0)
    {
      v49 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_trialNamespace(self, v46, v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v49, v51, (uint64_t)CFSTR("MLModel for namespace %@: %@"), v50, v45);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v48 = CFSTR("ERROR: Could not find valid model description.");
    }

LABEL_15:
    v76[0] = CFSTR("MLModel");
    v75[0] = CFSTR("loggerKey");
    v75[1] = CFSTR("uniqueIdentifier");
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = CFSTR("message");
    v76[1] = v57;
    v76[2] = v48;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v58, (uint64_t)v76, v75, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    OdmlLogForCategory(5uLL);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v59, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v78 = v63;
      _os_log_impl(&dword_1B69D6000, v60, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v64, (uint64_t)CFSTR("APOdmlRerankingErrorDomain"), 2101, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(*(void **)(v4 + 3432), v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v69, (uint64_t)v65, 1, 0, v5, v68);

    goto LABEL_18;
  }
  OdmlLogForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v78 = (id)objc_opt_class();
    v24 = v78;
    _os_log_impl(&dword_1B69D6000, v23, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for MLModel.", buf, 0xCu);

  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v25, (uint64_t)CFSTR("APOdmlRerankingErrorDomain"), 2009, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsReranking, v26, (uint64_t)v10, 0);
  v15 = 0;
LABEL_18:

  return v15;
}

- (NSCache)modelCache
{
  uint64_t v2;
  NSCache *modelCache;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSCache *v10;
  NSCache *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  modelCache = self->_modelCache;
  if (!modelCache)
  {
    objc_msgSend_modelCacheLock(self, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v5, v6, v7);

    if (!self->_modelCache)
    {
      v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
      v11 = self->_modelCache;
      self->_modelCache = v10;

      objc_msgSend_setCountLimit_(self->_modelCache, v12, 3);
    }
    objc_msgSend_modelCacheLock(self, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v13, v14, v15);

    modelCache = self->_modelCache;
  }
  return modelCache;
}

- (APOdmlUnfairLock)modelCacheLock
{
  return self->_modelCacheLock;
}

- (APOdmlAssetManager)initWithNamespace:(id)a3 andClient:(id)a4
{
  id v7;
  id v8;
  APOdmlAssetManager *v9;
  APOdmlAssetManager *v10;
  const char *v11;
  uint64_t v12;
  TRIExperimentIdentifiers *trialIdentifiers;
  APOdmlFeatureStorage *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  APOdmlFeatureStorage *featureStorage;
  APOdmlUnfairLock *v27;
  const char *v28;
  uint64_t v29;
  APOdmlUnfairLock *modelCacheLock;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)APOdmlAssetManager;
  v9 = -[APOdmlAssetManager init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_trialNamespace, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_trialClient, a4);
      objc_msgSend_experimentIdentifiersWithNamespaceName_(v8, v11, (uint64_t)v7);
      v12 = objc_claimAutoreleasedReturnValue();
      trialIdentifiers = v10->_trialIdentifiers;
      v10->_trialIdentifiers = (TRIExperimentIdentifiers *)v12;

      v14 = [APOdmlFeatureStorage alloc];
      objc_msgSend_experimentId(v10->_trialIdentifiers, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_treatmentId(v10->_trialIdentifiers, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_deploymentId(v10->_trialIdentifiers, v21, v22);
      v25 = objc_msgSend_initWithExperimentID_treatmentID_deploymentID_trialNamespace_(v14, v24, (uint64_t)v17, v20, v23, v7);
      featureStorage = v10->_featureStorage;
      v10->_featureStorage = (APOdmlFeatureStorage *)v25;

      v27 = [APOdmlUnfairLock alloc];
      v29 = objc_msgSend_initWithOptions_(v27, v28, 1);
      modelCacheLock = v10->_modelCacheLock;
      v10->_modelCacheLock = (APOdmlUnfairLock *)v29;

    }
  }

  return v10;
}

- (id)pathForFactor:(id)a3 isDirectory:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  int v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v4 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_trialClient(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_trialClient(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialNamespace(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_levelForFactor_withNamespaceName_(v12, v16, (uint64_t)v6, v15);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (v4)
        objc_msgSend_directoryValue(v17, v18, v19);
      else
        objc_msgSend_fileValue(v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = v20;
      if (v20)
      {
        if (!objc_msgSend_hasPath(v20, v21, v22)
          || (v33 = (void *)MEMORY[0x1E0C99E98],
              objc_msgSend_path(v25, v31, v32),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend_fileURLWithPath_(v33, v35, (uint64_t)v34),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              v34,
              !v24))
        {
          OdmlLogForCategory(0);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v50 = 138412290;
            v51 = (id)objc_opt_class();
            v37 = v51;
            _os_log_impl(&dword_1B69D6000, v36, OS_LOG_TYPE_ERROR, "[%@] Asset URL not found.", (uint8_t *)&v50, 0xCu);

          }
          v24 = 0;
        }
        OdmlLogForCategory(0);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = (void *)objc_opt_class();
          v40 = v39;
          objc_msgSend_trialNamespace(self, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 138413058;
          v51 = v39;
          v52 = 2112;
          v53 = v6;
          v54 = 2112;
          v55 = v43;
          v56 = 2112;
          v57 = v24;
          _os_log_impl(&dword_1B69D6000, v38, OS_LOG_TYPE_DEFAULT, "[%@] Path for factor %@ in namespace %@: %@", (uint8_t *)&v50, 0x2Au);

        }
      }
      else
      {
        OdmlLogForCategory(0);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v44 = (void *)objc_opt_class();
          v45 = v44;
          objc_msgSend_trialNamespace(self, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 138412802;
          v51 = v44;
          v52 = 2112;
          v53 = v6;
          v54 = 2112;
          v55 = v48;
          _os_log_impl(&dword_1B69D6000, v38, OS_LOG_TYPE_ERROR, "[%@] File not found for level %@ in namespace %@", (uint8_t *)&v50, 0x20u);

        }
        v24 = 0;
      }

    }
    else
    {
      OdmlLogForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_opt_class();
        v27 = v26;
        objc_msgSend_trialNamespace(self, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 138412802;
        v51 = v26;
        v52 = 2112;
        v53 = v6;
        v54 = 2112;
        v55 = v30;
        _os_log_impl(&dword_1B69D6000, v25, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v50, 0x20u);

      }
      v24 = 0;
    }

  }
  else
  {
    OdmlLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v50 = 138412546;
      v51 = (id)objc_opt_class();
      v52 = 2112;
      v53 = v6;
      v23 = v51;
      _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v50, 0x16u);

    }
    v24 = 0;
  }

  return v24;
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (int)deploymentID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_trialIdentifiers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_trialIdentifiers(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_deploymentId(v7, v8, v9);

    return v10;
  }
  else
  {
    OdmlLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = (id)objc_opt_class();
      v13 = v15;
      _os_log_impl(&dword_1B69D6000, v12, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial identifiers, cannot find deploymentID.", (uint8_t *)&v14, 0xCu);

    }
    return -1;
  }
}

- (NSString)experimentID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_trialIdentifiers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_trialIdentifiers(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentId(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v10;
  }
  else
  {
    OdmlLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = (id)objc_opt_class();
      v13 = v15;
      _os_log_impl(&dword_1B69D6000, v12, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial identifiers, cannot find experimentID.", (uint8_t *)&v14, 0xCu);

    }
    return (NSString *)0;
  }
}

- (NSString)treatmentID
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_trialIdentifiers(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_trialIdentifiers(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_treatmentId(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v10;
  }
  else
  {
    OdmlLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = (id)objc_opt_class();
      v13 = v15;
      _os_log_impl(&dword_1B69D6000, v12, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial identifiers, cannot find treatmentID.", (uint8_t *)&v14, 0xCu);

    }
    return (NSString *)0;
  }
}

- (NSString)odmlNamespace
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_trialNamespace(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_trialNamespace(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithString_(v7, v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v10;
  }
  else
  {
    OdmlLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = (id)objc_opt_class();
      v13 = v15;
      _os_log_impl(&dword_1B69D6000, v12, OS_LOG_TYPE_ERROR, "[%@] No namespace initialized with AssetManager; namespace not found.",
        (uint8_t *)&v14,
        0xCu);

    }
    return (NSString *)0;
  }
}

- (int)odmlVersion
{
  return 4;
}

- (id)doubleValueForFactor:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_trialClient(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_trialClient(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialNamespace(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_levelForFactor_withNamespaceName_(v10, v14, (uint64_t)v4, v13);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_doubleValue(v15, v16, v17);
      objc_msgSend_numberWithDouble_(v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      OdmlLogForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        v24 = v23;
        objc_msgSend_trialNamespace(self, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138413058;
        v36 = v23;
        v37 = 2112;
        v38 = v4;
        v39 = 2112;
        v40 = v27;
        v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_1B69D6000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Double value for factor %@ in namespace %@: %@", (uint8_t *)&v35, 0x2Au);

      }
    }
    else
    {
      OdmlLogForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_opt_class();
        v30 = v29;
        objc_msgSend_trialNamespace(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412802;
        v36 = v29;
        v37 = 2112;
        v38 = v4;
        v39 = 2112;
        v40 = v33;
        _os_log_impl(&dword_1B69D6000, v22, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v35, 0x20u);

      }
      v21 = 0;
    }

  }
  else
  {
    OdmlLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v35 = 138412546;
      v36 = (id)objc_opt_class();
      v37 = 2112;
      v38 = v4;
      v28 = v36;
      _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v35, 0x16u);

    }
    v21 = 0;
  }

  return v21;
}

- (id)longValueForFactor:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_trialClient(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_trialClient(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialNamespace(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_levelForFactor_withNamespaceName_(v10, v14, (uint64_t)v4, v13);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = objc_msgSend_longValue(v15, v16, v17);
      objc_msgSend_numberWithLong_(v18, v20, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      OdmlLogForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        v24 = v23;
        objc_msgSend_trialNamespace(self, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138413058;
        v36 = v23;
        v37 = 2112;
        v38 = v4;
        v39 = 2112;
        v40 = v27;
        v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_1B69D6000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Long value for factor %@ in namespace %@: %@", (uint8_t *)&v35, 0x2Au);

      }
    }
    else
    {
      OdmlLogForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_opt_class();
        v30 = v29;
        objc_msgSend_trialNamespace(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412802;
        v36 = v29;
        v37 = 2112;
        v38 = v4;
        v39 = 2112;
        v40 = v33;
        _os_log_impl(&dword_1B69D6000, v22, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v35, 0x20u);

      }
      v21 = 0;
    }

  }
  else
  {
    OdmlLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v35 = 138412546;
      v36 = (id)objc_opt_class();
      v37 = 2112;
      v38 = v4;
      v28 = v36;
      _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v35, 0x16u);

    }
    v21 = 0;
  }

  return v21;
}

- (id)stringValueForFactor:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_trialClient(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    OdmlLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v28 = 0;
      goto LABEL_12;
    }
    v35 = 138412546;
    v36 = (id)objc_opt_class();
    v37 = 2112;
    v38 = v4;
    v17 = v36;
    _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for Trial client, cannot complete request for %@", (uint8_t *)&v35, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend_trialClient(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialNamespace(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_levelForFactor_withNamespaceName_(v10, v14, (uint64_t)v4, v13);
  v15 = objc_claimAutoreleasedReturnValue();

  OdmlLogForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_opt_class();
      v30 = v29;
      objc_msgSend_trialNamespace(self, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412802;
      v36 = v29;
      v37 = 2112;
      v38 = v4;
      v39 = 2112;
      v40 = v33;
      _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_ERROR, "[%@] Level not found for factor %@ in namespace %@", (uint8_t *)&v35, 0x20u);

    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_opt_class();
    v19 = v18;
    objc_msgSend_trialNamespace(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringValue(v15, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138413058;
    v36 = v18;
    v37 = 2112;
    v38 = v4;
    v39 = 2112;
    v40 = v22;
    v41 = 2112;
    v42 = v25;
    _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_DEFAULT, "[%@] String value for factor %@ in namespace %@: %@", (uint8_t *)&v35, 0x2Au);

  }
  objc_msgSend_stringValue(v15, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v28;
}

- (id)saveFeatureFromObject:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  id v17;
  const char *v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_featureStorage(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_featureStorage(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_saveFeatureFromObject_withName_(v13, v14, (uint64_t)v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    OdmlLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412546;
      v21 = (id)objc_opt_class();
      v22 = 2112;
      v23 = v7;
      v17 = v21;
      _os_log_impl(&dword_1B69D6000, v16, OS_LOG_TYPE_ERROR, "[%@] Nil value for FeatureStorage, cannot save feature %@", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5016, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)featureForName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_featureStorage(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_featureStorage(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_featureForName_(v10, v11, (uint64_t)v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    OdmlLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = (id)objc_opt_class();
      v18 = 2112;
      v19 = v4;
      v14 = v17;
      _os_log_impl(&dword_1B69D6000, v13, OS_LOG_TYPE_ERROR, "[%@] Nil value for FeatureStorage, cannot retrieve feature %@", (uint8_t *)&v16, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

- (id)featuresForName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_featureStorage(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_featureStorage(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValueForFactor_(self, v11, (uint64_t)CFSTR("LookbackWindow"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorsForName_lookbackWindow_(v10, v13, (uint64_t)v4, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    OdmlLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412546;
      v19 = (id)objc_opt_class();
      v20 = 2112;
      v21 = v4;
      v16 = v19;
      _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "[%@] Nil value for FeatureStorage, cannot retrieve feature %@", (uint8_t *)&v18, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

- (void)deleteExpiredFeaturesForName:(id)a3 lookbackWindow:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend_featureStorage(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_featureStorage(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deleteExpiredFeaturesForName_lookbackWindow_(v12, v13, (uint64_t)v14, v6);

  }
}

- (TRIExperimentIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
}

- (APOdmlFeatureStorage)featureStorage
{
  return self->_featureStorage;
}

- (void)setFeatureStorage:(id)a3
{
  objc_storeStrong((id *)&self->_featureStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelCacheLock, 0);
  objc_storeStrong((id *)&self->_featureStorage, 0);
  objc_storeStrong((id *)&self->_trialNamespace, 0);
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
}

@end

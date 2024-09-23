@implementation APOdmlFeatureCalculatorManager

- (APOdmlFeatureCalculatorManager)initWithActivity:(id)a3
{
  id v5;
  APOdmlFeatureCalculatorManager *v6;
  APOdmlFeatureCalculatorManager *v7;
  APOdmlXpcLifecycleHandler *v8;
  const char *v9;
  uint64_t v10;
  APOdmlXpcLifecycleHandler *lifeCycleHandler;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSArray *placementTypes;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSArray *assetManagerTypes;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableArray *calculatorErrors;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *validFeatureCalculators;
  NSOperationQueue *v34;
  NSOperationQueue *operationQueue;
  const char *v36;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)APOdmlFeatureCalculatorManager;
  v6 = -[APOdmlFeatureCalculatorManager init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpc_activity, a3);
    v8 = [APOdmlXpcLifecycleHandler alloc];
    v10 = objc_msgSend_initWithActivity_(v8, v9, (uint64_t)v5);
    lifeCycleHandler = v7->_lifeCycleHandler;
    v7->_lifeCycleHandler = (APOdmlXpcLifecycleHandler *)v10;

    v12 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v12, v15, (uint64_t)v14, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    placementTypes = v7->_placementTypes;
    v7->_placementTypes = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObjects_(v18, v23, (uint64_t)v20, v22, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    assetManagerTypes = v7->_assetManagerTypes;
    v7->_assetManagerTypes = (NSArray *)v24;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    calculatorErrors = v7->_calculatorErrors;
    v7->_calculatorErrors = (NSMutableArray *)v28;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    validFeatureCalculators = v7->_validFeatureCalculators;
    v7->_validFeatureCalculators = (NSMutableArray *)v32;

    v34 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v34;

    objc_msgSend_setMaxConcurrentOperationCount_(v7->_operationQueue, v36, 1);
  }

  return v7;
}

- (void)calculateAllFeatures:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  APOdmlFeatureCalculator *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  APOdmlFeatureCalculatorManager *v42;
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend_placementTypes(self, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v54, v59, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v55;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v55 != v45)
          objc_enumerationMutation(obj);
        v47 = v9;
        v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v9);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend_assetManagerTypes(self, v7, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v50, v58, 16);
        if (v13)
        {
          v16 = v13;
          v17 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v51 != v17)
                objc_enumerationMutation(v11);
              v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              v20 = objc_msgSend_unsignedIntegerValue(v10, v14, v15);
              v23 = objc_msgSend_unsignedIntegerValue(v19, v21, v22);
              v24 = [APOdmlFeatureCalculator alloc];
              objc_msgSend_xpc_activity(self, v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (void *)objc_msgSend_initWithActivity_placementType_assetManagerType_(v24, v28, (uint64_t)v27, v20, v23);

              objc_msgSend_validFeatureCalculators(self, v30, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v32, v33, (uint64_t)v29);

            }
            v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v50, v58, 16);
          }
          while (v16);
        }

        v9 = v47 + 1;
      }
      while (v47 + 1 != v46);
      v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v54, v59, 16);
    }
    while (v46);
  }

  objc_msgSend_taskDeferred(self, v34, v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend_operationQueue(self, v36, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = sub_1B69F5A6C;
    v48[3] = &unk_1E6A297A8;
    v40 = v43;
    v49 = v43;
    objc_msgSend_addOperationWithBlock_(v39, v41, (uint64_t)v48);

  }
  else
  {
    v42 = self;
    v40 = v43;
    objc_msgSend_iterateThroughCalculators_(v42, v36, (uint64_t)v43);
  }

}

- (id)taskDeferred
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  int IsDeferred;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int shouldDefer;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  void *v27;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lifeCycleHandler(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsDeferred = objc_msgSend_taskIsDeferred(v4, v5, v6);

  if (IsDeferred)
  {
    OdmlLogForCategory(3uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138477827;
      v30 = (id)objc_opt_class();
      v11 = v30;
      v12 = "[%{private}@] Device Knowledge task previously deferred. Bailing out...";
LABEL_8:
      v24 = v10;
      v25 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl(&dword_1B69D6000, v24, v25, v12, (uint8_t *)&v29, 0xCu);

    }
  }
  else
  {
    objc_msgSend_lifeCycleHandler(self, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    shouldDefer = objc_msgSend_shouldDefer(v13, v14, v15);

    if (!shouldDefer)
    {
      v27 = 0;
      return v27;
    }
    objc_msgSend_lifeCycleHandler(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_deferTask(v19, v20, v21);

    OdmlLogForCategory(3uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    v10 = v23;
    if (!v22)
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v29 = 138477827;
      v30 = (id)objc_opt_class();
      v11 = v30;
      v12 = "[%{private}@] ERROR: failed to defer task while iterating through calculators.";
      v24 = v10;
      v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138477827;
      v30 = (id)objc_opt_class();
      v11 = v30;
      v12 = "[%{private}@] Device Knowledge task has been deferred. Bailing out...";
      goto LABEL_8;
    }
  }
LABEL_10:

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v26, (uint64_t)CFSTR("APOdmlFeatureCalculatorErrorDomain"), 1003, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  return v27;
}

- (void)iterateThroughCalculators:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_validFeatureCalculators(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);

  v13 = MEMORY[0x1E0C809B0];
  if (!v10)
  {
    OdmlLogForCategory(3uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v28 = (id)objc_opt_class();
      v15 = v28;
      _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_ERROR, "[%{private}@] No valid feature calculators found.", buf, 0xCu);

    }
    objc_msgSend_operationQueue(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_1B69F5E10;
    v25[3] = &unk_1E6A297A8;
    v26 = v4;
    objc_msgSend_addOperationWithBlock_(v18, v19, (uint64_t)v25);

  }
  objc_msgSend_validFeatureCalculators(self, v11, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = sub_1B69F5E24;
  v23[3] = &unk_1E6A29820;
  v23[4] = self;
  v24 = v4;
  v21 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(v20, v22, (uint64_t)v23);

}

- (void)runFeatureCalculator:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  const char *v64;
  void *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  __int128 v77;
  id v78;
  _QWORD v79[4];
  id v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 0;
  *(_QWORD *)&v8 = 138478595;
  v77 = v8;
  v9 = 0x1E0CB3000uLL;
  do
  {
    objc_msgSend_taskDeferred(self, v4, v5, v77);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    if (v10)
    {
      objc_msgSend_userInfo(v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend_mutableCopy(v14, v15, v16);
      objc_msgSend_parseErrorInfo_calculator_(self, v18, (uint64_t)v17, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_calculatorErrors(self, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(v9 + 1480);
      objc_msgSend_domain(v13, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_code(v13, v27, v28);
      objc_msgSend_errorWithDomain_code_userInfo_(v23, v30, (uint64_t)v26, v29, v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v22, v32, (uint64_t)v31);

    }
    else
    {
      objc_msgSend_createAndSaveVector_(v6, v11, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      OdmlLogForCategory(3uLL);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v19)
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)objc_opt_class();
          v78 = v35;
          v38 = objc_msgSend_placementType(v6, v36, v37);
          v41 = objc_msgSend_assetManagerType(v6, v39, v40);
          objc_msgSend_debugDescription(v19, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478851;
          v82 = v35;
          v83 = 2048;
          v84 = v38;
          v9 = 0x1E0CB3000uLL;
          v85 = 2048;
          v86 = v41;
          v87 = 2048;
          v88 = v7;
          v89 = 2112;
          v90 = v44;
          _os_log_impl(&dword_1B69D6000, v34, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: failed to calculate features for placement type: %lu, asset manager type: %lu and vector type: %lu due to %@", buf, 0x34u);

        }
        objc_msgSend_userInfo(v19, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend_mutableCopy(v47, v48, v49);
        objc_msgSend_parseErrorInfo_calculator_(self, v51, (uint64_t)v50, v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_calculatorErrors(self, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = *(void **)(v9 + 1480);
        objc_msgSend_domain(v19, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend_code(v19, v59, v60);
        objc_msgSend_errorWithDomain_code_userInfo_(v55, v62, (uint64_t)v58, v61, v22);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v54, v64, (uint64_t)v63);

        v9 = 0x1E0CB3000;
      }
      else
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v65 = (void *)objc_opt_class();
          v66 = v65;
          v69 = objc_msgSend_placementType(v6, v67, v68);
          v72 = objc_msgSend_assetManagerType(v6, v70, v71);
          *(_DWORD *)buf = v77;
          v82 = v65;
          v83 = 2048;
          v84 = v69;
          v9 = 0x1E0CB3000;
          v85 = 2048;
          v86 = v72;
          v87 = 2048;
          v88 = v7;
          _os_log_impl(&dword_1B69D6000, v34, OS_LOG_TYPE_DEFAULT, "[%{private}@] Successfully calculated features for placement type: %lu, asset manager type: %lu and vector type: %lu", buf, 0x2Au);

        }
        objc_msgSend_operationQueue(self, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = sub_1B69F6524;
        v79[3] = &unk_1E6A29570;
        v80 = v6;
        objc_msgSend_addOperationWithBlock_(v75, v76, (uint64_t)v79);

        v22 = v80;
      }
    }

    ++v7;
  }
  while (v7 != 3);

}

- (id)parseErrorInfo:(id)a3 calculator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  objc_class *v22;
  id v23;
  id v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a4;
    v11 = objc_msgSend_placementType(v8, v9, v10);
    objc_msgSend_numberWithUnsignedLong_(v7, v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("placementType"));

    v15 = (void *)MEMORY[0x1E0CB37E8];
    v18 = objc_msgSend_assetManagerType(v8, v16, v17);

    objc_msgSend_numberWithUnsignedLong_(v15, v19, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, CFSTR("assetManagerType"));
  }
  else
  {
    v22 = (objc_class *)MEMORY[0x1E0C99E08];
    v23 = a4;
    v24 = [v22 alloc];
    v40[0] = CFSTR("placementType");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    v28 = objc_msgSend_placementType(v23, v26, v27);
    objc_msgSend_numberWithUnsignedLong_(v25, v29, v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v20;
    v40[1] = CFSTR("assetManagerType");
    v30 = (void *)MEMORY[0x1E0CB37E8];
    v33 = objc_msgSend_assetManagerType(v23, v31, v32);

    objc_msgSend_numberWithUnsignedLong_(v30, v34, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v35;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v36, (uint64_t)v41, v40, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend_initWithDictionary_(v24, v38, (uint64_t)v37);

  }
  return v6;
}

- (OS_xpc_object)xpc_activity
{
  return self->_xpc_activity;
}

- (void)setXpc_activity:(id)a3
{
  objc_storeStrong((id *)&self->_xpc_activity, a3);
}

- (APOdmlXpcLifecycleHandler)lifeCycleHandler
{
  return self->_lifeCycleHandler;
}

- (void)setLifeCycleHandler:(id)a3
{
  objc_storeStrong((id *)&self->_lifeCycleHandler, a3);
}

- (NSArray)placementTypes
{
  return self->_placementTypes;
}

- (void)setPlacementTypes:(id)a3
{
  objc_storeStrong((id *)&self->_placementTypes, a3);
}

- (NSArray)assetManagerTypes
{
  return self->_assetManagerTypes;
}

- (void)setAssetManagerTypes:(id)a3
{
  objc_storeStrong((id *)&self->_assetManagerTypes, a3);
}

- (NSMutableArray)calculatorErrors
{
  return self->_calculatorErrors;
}

- (void)setCalculatorErrors:(id)a3
{
  objc_storeStrong((id *)&self->_calculatorErrors, a3);
}

- (NSMutableArray)validFeatureCalculators
{
  return self->_validFeatureCalculators;
}

- (void)setValidFeatureCalculators:(id)a3
{
  objc_storeStrong((id *)&self->_validFeatureCalculators, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_validFeatureCalculators, 0);
  objc_storeStrong((id *)&self->_calculatorErrors, 0);
  objc_storeStrong((id *)&self->_assetManagerTypes, 0);
  objc_storeStrong((id *)&self->_placementTypes, 0);
  objc_storeStrong((id *)&self->_lifeCycleHandler, 0);
  objc_storeStrong((id *)&self->_xpc_activity, 0);
}

@end

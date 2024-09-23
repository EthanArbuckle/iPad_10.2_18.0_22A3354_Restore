@implementation APOdmlPredictor

- (APOdmlPredictor)initWithResponses:(id)a3 assetManager:(id)a4 model:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  APOdmlPredictor *v12;
  uint64_t v13;
  NSArray *adamIDs;
  const char *v15;
  uint64_t v16;
  void *v17;
  APOdmlFeatureHandler *v18;
  const char *v19;
  uint64_t v20;
  APOdmlFeatureHandler *featureHandler;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  APOdmlFeatureHandler *v28;
  APOdmlPredictor *v29;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)APOdmlPredictor;
  v12 = -[APOdmlPredictor init](&v31, sel_init);
  if (!v12)
    goto LABEL_3;
  objc_msgSend_valueForKey_(v8, v11, (uint64_t)CFSTR("adamID"));
  v13 = objc_claimAutoreleasedReturnValue();
  adamIDs = v12->_adamIDs;
  v12->_adamIDs = (NSArray *)v13;

  objc_storeStrong((id *)&v12->_assetManager, a4);
  objc_storeStrong((id *)&v12->_predictionModel, a5);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [APOdmlFeatureHandler alloc];
  v20 = objc_msgSend_initWithResponses_assetManager_model_(v18, v19, (uint64_t)v8, v9, v10);
  featureHandler = v12->_featureHandler;
  v12->_featureHandler = (APOdmlFeatureHandler *)v20;

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, (uint64_t)CFSTR("APOdmlRerankingErrorDomain"), 2102, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v27, (uint64_t)v23, 1, 0, v17, v26);

  v28 = v12->_featureHandler;
  if (!v28)
    v29 = 0;
  else
LABEL_3:
    v29 = v12;

  return v29;
}

- (id)predictTapThroughRate
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
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
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  NSObject *v76;
  id v77;
  const char *v78;
  const char *v79;
  NSObject *v80;
  void *v81;
  id v82;
  const char *v83;
  const char *v84;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint8_t buf[4];
  id v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  objc_msgSend_featureHandler(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_batchInput(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_predictionModel(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    OdmlLogForCategory(5uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    OdmlLogForCategory(5uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Batch PTTR Prediction", (const char *)&unk_1B6A07EB5, buf, 2u);
    }

    objc_msgSend_date(MEMORY[0x1E0C99D68], v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_featureHandler(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_batchInput(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    objc_msgSend_predictionsFromBatch_error_(v10, v24, (uint64_t)v23, &v89);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v89;

    OdmlLogForCategory(5uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v28, OS_SIGNPOST_INTERVAL_END, v12, "Batch PTTR Prediction", (const char *)&unk_1B6A07EB5, buf, 2u);
    }

    if (v26 || !v25)
    {
      OdmlLogForCategory(5uLL);
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v81 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v91 = v81;
        v92 = 2112;
        v93 = v26;
        v82 = v81;
        _os_log_impl(&dword_1B69D6000, v80, OS_LOG_TYPE_ERROR, "[%@] Error predicting tap through rate: %@", buf, 0x16u);

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v83, (uint64_t)CFSTR("APOdmlPredictionErrorDomain"), 4002, 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v84, (uint64_t)v75, 0);
      v74 = 0;
    }
    else
    {
      v88 = v10;
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v29, (uint64_t)CFSTR("APOdmlRerankingErrorDomain"), 2103, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_date(MEMORY[0x1E0C99D68], v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = (void *)v30;
      v87 = v17;
      objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v34, v30, 1, 0, v17, v33);

      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v35, 0, 0);
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v25, v39, v40) >= 1)
      {
        v43 = 0;
        do
        {
          objc_msgSend_featuresAtIndex_(v25, v41, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_featureNames(v44, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anyObject(v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_featureValueForName_(v44, v51, (uint64_t)v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v52;
          if (v52)
          {
            objc_msgSend_multiArrayValue(v52, v53, v54);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend_count(v56, v57, v58);

            if (v59 >= 1)
            {
              objc_msgSend_multiArrayValue(v55, v60, v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v62, v63, 0);
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_adamIDs(self, v65, v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v67, v68, v43);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_validateOutput_adamID_(self, v70, (uint64_t)v64, v69);

              objc_msgSend_addObject_(v38, v71, (uint64_t)v64);
            }
          }

          ++v43;
        }
        while (v43 < objc_msgSend_count(v25, v72, v73));
      }
      v74 = (void *)objc_msgSend_copy(v38, v41, v42);

      v75 = 0;
      v17 = v87;
      v10 = v88;
      v26 = 0;
    }

  }
  else
  {
    OdmlLogForCategory(5uLL);
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v91 = (id)objc_opt_class();
      v77 = v91;
      _os_log_impl(&dword_1B69D6000, v76, OS_LOG_TYPE_ERROR, "[%@] Cannot predict because input is nil.", buf, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v78, (uint64_t)CFSTR("APOdmlPredictionErrorDomain"), 4001, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v79, (uint64_t)v75, 0);
    v74 = 0;
  }

  return v74;
}

- (void)validateOutput:(id)a3 adamID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
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
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  float v34;
  float v35;
  const char *v36;
  uint64_t v37;
  float v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  float v47;
  float v48;
  const char *v49;
  uint64_t v50;
  float v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  const char *v68;
  char isEqual;
  float v70;
  float v71;
  const char *v72;
  uint64_t v73;
  float v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v10, v11, (uint64_t)CFSTR("modelOutput"), CFSTR("featureName"));
  if (v6)
  {
    objc_msgSend_stringValue(v6, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v10, v15, (uint64_t)v14, CFSTR("featureValue"));

    v18 = (void *)objc_msgSend_copy(v10, v16, v17);
    objc_msgSend_localOutputLog_adamID_(self, v19, (uint64_t)v18, v7);

    objc_msgSend_assetManager(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringValueForFactor_(v22, v23, (uint64_t)CFSTR("ModelOutputConfig"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_dataUsingEncoding_(v24, v25, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = 0;
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v27, (uint64_t)v26, 0, &v99);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v99;
      if (!v30)
      {
        v92 = v26;
        objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)CFSTR("min"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend_floatValue(v6, v31, v32);
          v35 = v34;
          objc_msgSend_floatValue(v33, v36, v37);
          if (v35 < v38)
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v31, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 4006, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend_copy(v10, v40, v41);
            objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v43, (uint64_t)v39, v42);

          }
        }
        v90 = v33;
        v93 = v24;
        v94 = v7;
        objc_msgSend_objectForKeyedSubscript_(v28, v31, (uint64_t)CFSTR("max"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend_floatValue(v6, v44, v45);
          v48 = v47;
          objc_msgSend_floatValue(v46, v49, v50);
          if (v48 > v51)
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v44, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 4005, 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = (void *)objc_msgSend_copy(v10, v53, v54);
            objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v56, (uint64_t)v52, v55);

          }
        }
        v89 = v46;
        v57 = v6;
        v91 = v28;
        objc_msgSend_objectForKeyedSubscript_(v28, v44, (uint64_t)CFSTR("sentinelValueSet"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v95, v100, 16);
        if (v60)
        {
          v63 = v60;
          v64 = *(_QWORD *)v96;
          do
          {
            for (i = 0; i != v63; ++i)
            {
              if (*(_QWORD *)v96 != v64)
                objc_enumerationMutation(v58);
              v66 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
              if (v66)
              {
                objc_msgSend_null(MEMORY[0x1E0C99E38], v61, v62);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                isEqual = objc_msgSend_isEqual_(v66, v68, (uint64_t)v67);

                if ((isEqual & 1) == 0)
                {
                  objc_msgSend_floatValue(v57, v61, v62);
                  v71 = v70;
                  objc_msgSend_floatValue(v66, v72, v73);
                  if (v71 == v74)
                  {
                    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v61, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 4007, 0);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v78 = (void *)objc_msgSend_copy(v10, v76, v77);
                    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v79, (uint64_t)v75, v78);

                  }
                }
              }
            }
            v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v95, v100, 16);
          }
          while (v63);
        }

        v6 = v57;
        v24 = v93;
        v7 = v94;
        v28 = v91;
        v26 = v92;
        v30 = 0;
      }

    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 4007, 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)objc_msgSend_copy(v10, v81, v82);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v84, (uint64_t)v80, v83);

    v87 = (void *)objc_msgSend_copy(v10, v85, v86);
    objc_msgSend_localOutputLog_adamID_(self, v88, (uint64_t)v87, v7);

  }
}

- (void)localOutputLog:(id)a3 adamID:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  const char *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  objc_msgSend_dictionaryWithDictionary_(v5, v7, (uint64_t)a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v10, v8, (uint64_t)v6, CFSTR("adamID"));

  objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v9, (uint64_t)CFSTR("InferenceModelOutput"), v10, 5);
}

- (MLModel)predictionModel
{
  return self->_predictionModel;
}

- (APOdmlAssetManager)assetManager
{
  return self->_assetManager;
}

- (APOdmlFeatureHandler)featureHandler
{
  return self->_featureHandler;
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamIDs, 0);
  objc_storeStrong((id *)&self->_featureHandler, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_predictionModel, 0);
}

@end

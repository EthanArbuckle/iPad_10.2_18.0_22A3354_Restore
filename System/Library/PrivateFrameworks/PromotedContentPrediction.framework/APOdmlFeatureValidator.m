@implementation APOdmlFeatureValidator

- (id)validateFeatures:(id)a3 predictionModel:(id)a4
{
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
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;

  v6 = a3;
  objc_msgSend_modelDescription(a4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputDescriptionsByName(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v6, v16, v17))
  {
    v20 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v6, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_validateFeatureProvider_inputDescriptions_(self, v22, (uint64_t)v21, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_atIndexedSubscript_(v6, v24, (uint64_t)v23, v20);

      ++v20;
    }
    while (v20 < objc_msgSend_count(v6, v25, v26));
  }
  v27 = (void *)objc_msgSend_copy(v6, v18, v19);

  return v27;
}

- (id)validateFeatureProvider:(id)a3 inputDescriptions:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;

  v6 = a3;
  objc_msgSend_missingFeatures_inputDescriptions_(self, v7, (uint64_t)v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reportMissingFeatureError_(self, v9, (uint64_t)v8);
  objc_msgSend_imputeMissingFeatures_(self, v10, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(v6, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addEntriesFromDictionary_(v14, v18, (uint64_t)v17);
  objc_msgSend_addEntriesFromDictionary_(v14, v19, (uint64_t)v11);
  v20 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  v23 = (void *)objc_msgSend_copy(v14, v21, v22);
  v25 = (void *)objc_msgSend_initWithDictionary_error_(v20, v24, (uint64_t)v23, 0);

  return v25;
}

- (id)missingFeatures:(id)a3 inputDescriptions:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v6;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v30, v34, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
        objc_msgSend_dictionary(v5, v13, v14, (_QWORD)v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v18, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v19, v23, (uint64_t)v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
          objc_msgSend_addObject_(v9, v25, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v30, v34, 16);
    }
    while (v15);
  }

  v28 = (void *)objc_msgSend_copy(v9, v26, v27);
  return v28;
}

- (id)imputeMissingFeatures:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, v26, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend_imputeFeature_(self, v11, (uint64_t)v15, (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v15, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(v7, v20, (uint64_t)v16, v19);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v22, v26, 16);
    }
    while (v12);
  }

  return v7;
}

- (id)imputeFeature:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  int v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  int v63;
  void *v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_multiArrayConstraint(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shape(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_count(v9, v10, v11);

  if (v12 < 3)
  {
    objc_msgSend_multiArrayConstraint(v3, v13, v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shape(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_count(v30, v31, v32) - 1;

    objc_msgSend_multiArrayConstraint(v3, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shape(v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v39, v40, v33);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend_intValue(v41, v45, v46) >= 1)
    {
      v49 = 0;
      do
      {
        objc_msgSend_notANumber(MEMORY[0x1E0CB3598], v47, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v44, v51, (uint64_t)v50);

        ++v49;
      }
      while (v49 < (int)objc_msgSend_intValue(v41, v52, v53));
    }
    objc_msgSend_multiArrayConstraint(v3, v47, v48);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shape(v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_count(v57, v58, v59);

    if (v60 == 1)
      objc_msgSend_multiarrayFromArray_(MEMORY[0x1E0C9E970], v61, (uint64_t)v44);
    else
      objc_msgSend_twoDimensionalMultiarrayFromArray_(MEMORY[0x1E0C9E970], v61, (uint64_t)v44);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    OdmlLogForCategory(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      objc_msgSend_multiArrayConstraint(v3, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shape(v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 138412546;
      v64 = v16;
      v65 = 2048;
      v66 = objc_msgSend_count(v23, v24, v25);
      _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "[%@] Unexpected shape length: %lu", (uint8_t *)&v63, 0x16u);

    }
    v26 = 0;
  }

  return v26;
}

- (void)reportMissingFeatureError:(id)a3
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v23, v27, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("APOdmlPredictionErrorDomain"), 4004, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v9, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(v13, v17, (uint64_t)v16, CFSTR("featureName"));

        v20 = (void *)objc_msgSend_copy(v13, v18, v19);
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsPrediction, v21, (uint64_t)v10, v20);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v23, v27, 16);
    }
    while (v6);
  }

}

@end

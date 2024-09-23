@implementation APOdmlTrainingRow

- (APOdmlTrainingRow)initWithFeatures:(id)a3
{
  id v5;
  APOdmlTrainingRow *v6;
  APOdmlTrainingRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APOdmlTrainingRow;
  v6 = -[APOdmlTrainingRow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_features, a3);

  return v7;
}

- (BOOL)isValidRow:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  BOOL v24;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend_features(self, v5, v6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v28, v32, 16);
  if (v8)
  {
    v10 = v8;
    v27 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v27)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend_rangeBoundaryForFeature_upperBound_(v4, v9, v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rangeBoundaryForFeature_upperBound_(v4, v14, v12, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sentinelValuesForFeature_(v4, v16, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_features(self, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v20, v21, v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend_isValidFeature_featureName_min_max_sentinelValues_(self, v23, (uint64_t)v22, v12, v13, v15, v17);

        if (!(_DWORD)v12)
        {
          v24 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v28, v32, 16);
      if (v10)
        continue;
      break;
    }
  }
  v24 = 1;
LABEL_11:

  return v24;
}

- (BOOL)isValidFeature:(id)a3 featureName:(id)a4 min:(id)a5 max:(id)a6 sentinelValues:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  float v26;
  float v27;
  const char *v28;
  uint64_t v29;
  float v30;
  float v31;
  float v32;
  const char *v33;
  uint64_t v34;
  float v35;
  id v36;
  id v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  float v47;
  float v48;
  const char *v49;
  uint64_t v50;
  float v51;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  APOdmlTrainingRow *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v17 = v12;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v63, v68, 16);
  if (!v19)
  {
    LOBYTE(v25) = 1;
    goto LABEL_24;
  }
  v22 = v19;
  v56 = self;
  v57 = v13;
  v23 = *(_QWORD *)v64;
  v58 = v15;
  v54 = *(_QWORD *)v64;
  while (2)
  {
    v24 = 0;
    v55 = v22;
    do
    {
      if (*(_QWORD *)v64 != v23)
        objc_enumerationMutation(v17);
      v25 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v24);
      if (!v25)
      {
        v13 = v57;
        objc_msgSend_reportError_name_value_(v56, v20, 8044, v57, 0);
        goto LABEL_24;
      }
      if (v14)
      {
        objc_msgSend_floatValue(*(void **)(*((_QWORD *)&v63 + 1) + 8 * v24), v20, v21);
        v27 = v26;
        objc_msgSend_floatValue(v14, v28, v29);
        if (v27 < v30)
        {
          v53 = &kAPODMLDESPluginFeatureMinExceeded;
LABEL_28:
          v13 = v57;
          objc_msgSend_reportError_name_value_(v56, v20, *v53, v57, v25);
          LOBYTE(v25) = 0;
          goto LABEL_24;
        }
      }
      if (v15)
      {
        objc_msgSend_floatValue(v25, v20, v21);
        v32 = v31;
        objc_msgSend_floatValue(v15, v33, v34);
        if (v32 > v35)
        {
          v53 = &kAPODMLDESPluginFeatureMaxExceeded;
          goto LABEL_28;
        }
      }
      v36 = v14;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v37 = v16;
      v38 = v16;
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v59, v67, 16);
      if (v40)
      {
        v43 = v40;
        v44 = *(_QWORD *)v60;
        while (2)
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v60 != v44)
              objc_enumerationMutation(v38);
            v46 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_msgSend_floatValue(v25, v41, v42);
            v48 = v47;
            objc_msgSend_floatValue(v46, v49, v50);
            if (v48 == v51)
            {
              v13 = v57;
              objc_msgSend_reportError_name_value_(v56, v41, 8044, v57, v25);

              LOBYTE(v25) = 0;
              v14 = v36;
              v15 = v58;
              v16 = v37;
              goto LABEL_24;
            }
          }
          v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v59, v67, 16);
          if (v43)
            continue;
          break;
        }
      }

      ++v24;
      v23 = v54;
      v14 = v36;
      v15 = v58;
      v16 = v37;
    }
    while (v24 != v55);
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v63, v68, 16);
    LOBYTE(v25) = 1;
    v13 = v57;
    if (v22)
      continue;
    break;
  }
LABEL_24:

  return (char)v25;
}

- (void)reportError:(int64_t)a3 name:(id)a4 value:(id)a5
{
  void *v7;
  id v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = a5;
  v9 = a4;
  objc_msgSend_errorWithDomain_code_userInfo_(v7, v10, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), a3, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v13, v14, (uint64_t)v9, CFSTR("featureName"));

  objc_msgSend_setValue_forKey_(v13, v15, (uint64_t)v8, CFSTR("featureValue"));
  v18 = (void *)objc_msgSend_copy(v13, v16, v17);
  objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsModelTraining, v19, (uint64_t)v20, v18);

}

- (NSSet)featureNames
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_features(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v9;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_features(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_twoDimensionalMultiarrayFromArray_(MEMORY[0x1E0C9E970], v10, (uint64_t)v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E0C9E918], v11, (uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    OdmlLogForCategory(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_ERROR, "Failed to initialize feature value for %@", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (NSDictionary)features
{
  return self->_features;
}

- (NSString)rowID
{
  return self->_rowID;
}

- (void)setRowID:(id)a3
{
  objc_storeStrong((id *)&self->_rowID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowID, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end

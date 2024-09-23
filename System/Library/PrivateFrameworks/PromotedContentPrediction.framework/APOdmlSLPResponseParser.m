@implementation APOdmlSLPResponseParser

+ (BOOL)isValidResponse:(id)a3
{
  void *v3;

  objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("odmlEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

+ (id)parseResponseForFeatureValues:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;

  objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("features"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend_count(v4, v5, v6))
  {
    objc_msgSend_parseFeatureDictionaryForFeatureValues_(a1, v7, (uint64_t)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v8, v9, v10))
      v11 = v8;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)parseFeatureDictionaryForFeatureValues:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  char isKindOfClass;
  const char *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  const __CFString *v26;
  id v27;
  id v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  id v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = v4;
  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v45, v55, 16);
  if (v44)
  {
    v10 = *(_QWORD *)v46;
    v11 = CFSTR("value");
    v42 = v7;
    v43 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1BCC9B1A4]();
        objc_msgSend_objectForKey_(v8, v15, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend_objectForKey_(v8, v18, v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_parseFeature_withTopLevelKey_forKey_(a1, v20, (uint64_t)v19, v13, v11);
          v21 = objc_claimAutoreleasedReturnValue();

          objc_msgSend_addEntriesFromDictionary_(v7, v22, (uint64_t)v21);
        }
        else
        {
          OdmlLogForCategory(5uLL);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v23 = (void *)objc_opt_class();
            v24 = v23;
            objc_msgSend_objectForKey_(v8, v25, v13);
            v26 = v11;
            v27 = v8;
            v28 = a1;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v50 = v23;
            v51 = 2112;
            v52 = v29;
            v53 = 2112;
            v54 = v13;
            _os_log_impl(&dword_1B69D6000, v21, OS_LOG_TYPE_ERROR, "[%@] Failed to parse feature %@ with key %@", buf, 0x20u);

            a1 = v28;
            v8 = v27;
            v11 = v26;

            v7 = v42;
            v10 = v43;
          }
        }

        objc_autoreleasePoolPop(v14);
      }
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v30, (uint64_t)&v45, v55, 16);
    }
    while (v44);
  }

  OdmlLogForCategory(5uLL);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = (void *)objc_opt_class();
    v33 = v32;
    objc_msgSend_mlJSONString(v7, v34, v35);
    v36 = v8;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v50 = v32;
    v51 = 2112;
    v52 = v37;
    _os_log_impl(&dword_1B69D6000, v31, OS_LOG_TYPE_DEFAULT, "[%@] Successfully parsed feature dictionary: %@", buf, 0x16u);

    v8 = v36;
  }

  v40 = (void *)objc_msgSend_copy(v7, v38, v39);
  return v40;
}

+ (id)parseFeature:(id)a3 withTopLevelKey:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  id v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_objectForKey_(v8, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v10;
    v39 = v8;
    objc_msgSend_stringByAppendingString_(v9, v13, (uint64_t)CFSTR("_"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v37 = v12;
    v18 = v12;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v40, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v41;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v23);
          v25 = (void *)MEMORY[0x1BCC9B1A4]();
          objc_msgSend_stringByAppendingString_(v14, v26, v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_parseFeature_withTopLevelKey_forKey_(a1, v28, (uint64_t)v18, v27, v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addEntriesFromDictionary_(v17, v30, (uint64_t)v29);

          objc_autoreleasePoolPop(v25);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v31, (uint64_t)&v40, v44, 16);
      }
      while (v21);
    }

    v34 = (void *)objc_msgSend_copy(v17, v32, v33);
    v10 = v38;
    v8 = v39;
    v12 = v37;
  }
  else
  {
    v45 = v9;
    objc_msgSend_convertToFeatureValue_(a1, v13, (uint64_t)v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v17;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v35, (uint64_t)v46, &v45, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
  }

  return v34;
}

+ (id)convertToFeatureValue:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  const char *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_convertStringToFeatureValue_(a1, v5, (uint64_t)v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_convertArrayToFeatureValue_(a1, v7, (uint64_t)v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)MEMORY[0x1E0C9E918];
        objc_msgSend_doubleValue(v4, v8, v9);
        objc_msgSend_featureValueWithDouble_(v10, v11, v12);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        OdmlLogForCategory(5uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412546;
          v19 = (id)objc_opt_class();
          v20 = 2112;
          v21 = v4;
          v14 = v19;
          _os_log_impl(&dword_1B69D6000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Failed to convert the following to an MLFeatureValue: %@", (uint8_t *)&v18, 0x16u);

        }
        objc_msgSend_undefinedFeatureValueWithType_(MEMORY[0x1E0C9E918], v15, 2);
        v6 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v16 = (void *)v6;

  return v16;
}

+ (id)convertStringToFeatureValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  v6 = objc_msgSend_containsOnlyDecimalCharacters(v3, v4, v5);
  v9 = (void *)MEMORY[0x1E0C9E918];
  if (v6)
  {
    objc_msgSend_doubleValue(v3, v7, v8);
    v11 = v10;

    objc_msgSend_featureValueWithDouble_(v9, v12, v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_featureValueWithString_(MEMORY[0x1E0C9E918], v7, (uint64_t)v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

+ (id)convertArrayToFeatureValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  char v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;

  v3 = a3;
  if (!objc_msgSend_count(v3, v4, v5))
  {
    v21 = (void *)MEMORY[0x1E0C9E918];
    v22 = (void *)MEMORY[0x1E0C9E970];
    objc_msgSend_array(MEMORY[0x1E0C99D20], v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multiarrayFromArray_(v22, v23, (uint64_t)v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_featureValueWithMultiArray_(v21, v25, (uint64_t)v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  objc_msgSend_firstObject(v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_firstObject(v3, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_containsOnlyDecimalCharacters(v11, v12, v13);

    if ((v14 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0C9E918];
      objc_msgSend_sequenceWithStringArray_(MEMORY[0x1E0C9E9C0], v15, (uint64_t)v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_featureValueWithSequence_(v17, v19, (uint64_t)v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v3, v26, v27))
  {
    v30 = 0;
    do
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_objectAtIndexedSubscript_(v3, v28, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v32, v33, v34);
      objc_msgSend_numberWithDouble_(v31, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v18, v38, (uint64_t)v37);

      ++v30;
    }
    while (v30 < objc_msgSend_count(v3, v39, v40));
  }
  v41 = (void *)MEMORY[0x1E0C9E918];
  v42 = (void *)MEMORY[0x1E0C9E970];
  v43 = (void *)objc_msgSend_copy(v18, v28, v29);
  objc_msgSend_multiarrayFromArray_(v42, v44, (uint64_t)v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureValueWithMultiArray_(v41, v46, (uint64_t)v45);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v20;
}

@end

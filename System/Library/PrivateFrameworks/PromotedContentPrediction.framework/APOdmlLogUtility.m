@implementation APOdmlLogUtility

+ (void)logWithLoggerKey:(id)a3 message:(id)a4 category:(unint64_t)a5
{
  void *v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v25[0] = a3;
  v24[0] = CFSTR("loggerKey");
  v24[1] = CFSTR("uniqueIdentifier");
  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  v9 = a3;
  objc_msgSend_UUID(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = CFSTR("message");
  v25[1] = v15;
  v25[2] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v25, v24, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  OdmlLogForCategory(a5);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_mlJSONString(v17, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138477827;
    v23 = v21;
    _os_log_impl(&dword_1B69D6000, v18, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v22, 0xCu);

  }
}

+ (void)logModelInputWithAdamID:(id)a3 adamID:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend_mlDictionaryForJSON(a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_mutableCopy(v8, v9, v10);

  if (v11)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, (uint64_t)v5, CFSTR("adamID"));
    v28[0] = CFSTR("adFeatures");
    v27[0] = CFSTR("loggerKey");
    v27[1] = CFSTR("uniqueIdentifier");
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = CFSTR("message");
    v28[1] = v18;
    v28[2] = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v28, v27, 3);
    v20 = objc_claimAutoreleasedReturnValue();

    OdmlLogForCategory(5uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v20, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138477827;
      v26 = v24;
      _os_log_impl(&dword_1B69D6000, v21, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v25, 0xCu);

    }
  }
  else
  {
    OdmlLogForCategory(5uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1B69D6000, v20, OS_LOG_TYPE_ERROR, "Model inputs: Cannot Parse the Inputs.", (uint8_t *)&v25, 2u);
    }
  }

}

+ (void)logTrainingRowFeatures:(id)a3
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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend_features(v3, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v27, v31, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rowID(v3, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(v14, v18, (uint64_t)v17, CFSTR("trainingRowID"));

        objc_msgSend_features(v3, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v21, v22, v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(v14, v24, (uint64_t)v23, v13);

        objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v25, (uint64_t)CFSTR("TrainingRowFeatures"), v14, 11);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v27, v31, 16);
    }
    while (v10);
  }

}

+ (void)printDESRecordRowOrder:(id)a3 iterationNumber:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  unint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  id v23;

  v23 = a3;
  v5 = a4;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v23, v9, v10))
  {
    v12 = 0;
    do
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("index_%lu"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v23, v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rowID(v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(v8, v19, (uint64_t)v18, v13);

      ++v12;
    }
    while (v12 < objc_msgSend_count(v23, v20, v21));
  }
  objc_msgSend_setValue_forKey_(v8, v11, (uint64_t)v5, CFSTR("IterationNumber"));
  objc_msgSend_logWithLoggerKey_message_category_(APOdmlLogUtility, v22, (uint64_t)CFSTR("RowOrder"), v8, 11);

}

+ (void)printDESRecordInSegments:(id)a3 isPlugin:(BOOL)a4 rowID:(id)a5
{
  _BOOL4 v6;
  id v7;
  const char *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  const char *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v6 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v32 = a5;
  if (!v32)
  {
    OdmlLogForCategory(9uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v35 = (id)objc_opt_class();
      v10 = v35;
      _os_log_impl(&dword_1B69D6000, v9, OS_LOG_TYPE_DEFAULT, "%{private}@]: Generating random DES record ID for logging presave.", buf, 0xCu);

    }
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v13, v14, v15);
    v32 = (id)objc_claimAutoreleasedReturnValue();

  }
  v31 = v7;
  objc_msgSend_mlJSONStringWithPrettyPrint_(v7, v8, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_length(v33, v16, v17);
  v21 = 0;
  if (v6)
    v22 = 11;
  else
    v22 = 9;
  v23 = v18 / 5;
  do
  {
    v24 = v21 * v23;
    v25 = v23;
    if (v21 == 4)
      v25 = objc_msgSend_length(v33, v19, v20) - v24;
    OdmlLogForCategory(v22);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_opt_class();
      ++v21;
      v28 = v27;
      objc_msgSend_substringWithRange_(v33, v29, v24, v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478851;
      v35 = v27;
      v36 = 2113;
      v37 = v32;
      v38 = 2049;
      v39 = v21;
      v40 = 2049;
      v41 = 5;
      v42 = 2113;
      v43 = v30;
      _os_log_impl(&dword_1B69D6000, v26, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Unarchived DES Record Dictionary %{private}@ (%{private}lu of %{private}lu): %{private}@", buf, 0x34u);

    }
    else
    {
      ++v21;
    }

  }
  while (v21 != 5);

}

+ (id)printModelDeltasInSegments:(id)a3 isPlugin:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  const char *v7;
  void *v8;

  v4 = a4;
  objc_msgSend_mlJSONString(a3, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_printInSegments_log_isPlugin_(a1, v7, (uint64_t)CFSTR("Model deltas"), v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)printInSegments:(id)a3 log:(id)a4 isPlugin:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  float v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  id v39;
  const char *v40;
  void *v41;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v5 = a5;
  v58 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend_length(v7, v9, v10);
  objc_msgSend_numberWithUnsignedInteger_(v8, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v13, v14, v15);
  objc_msgSend_numberWithDouble_(v8, v17, v18, ceilf(v16 / 30000.0));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_floatValue(v19, v20, v21);
  if (v24 < 1.0)
  {

    v19 = &unk_1E6A33C48;
  }
  v43 = v19;
  v25 = objc_msgSend_unsignedIntegerValue(v19, v22, v23);
  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v28, v29, v30);
  v44 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v33 = 0;
    if (v5)
      v34 = 11;
    else
      v34 = 9;
    do
    {
      v35 = 30000 * v33;
      v36 = 30000;
      if (v33 == v25 - 1)
        v36 = objc_msgSend_length(v7, v31, v32) - v35;
      OdmlLogForCategory(v34);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_opt_class();
        ++v33;
        v39 = v38;
        objc_msgSend_substringWithRange_(v7, v40, v35, v36);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138479107;
        v47 = v38;
        v48 = 2112;
        v49 = v45;
        v50 = 2113;
        v51 = v44;
        v52 = 2049;
        v53 = v33;
        v54 = 2049;
        v55 = v25;
        v56 = 2113;
        v57 = v41;
        _os_log_impl(&dword_1B69D6000, v37, OS_LOG_TYPE_DEFAULT, "[%{private}@]: %@ %{private}@ (%{private}lu of %{private}lu): %{private}@", buf, 0x3Eu);

      }
      else
      {
        ++v33;
      }

    }
    while (v33 != v25);
  }

  return v44;
}

@end

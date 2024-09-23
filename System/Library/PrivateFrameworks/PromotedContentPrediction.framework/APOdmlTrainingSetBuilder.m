@implementation APOdmlTrainingSetBuilder

- (APOdmlTrainingSetBuilder)initWithLocalRecords:(id)a3 recipe:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  APOdmlTrainingSetBuilder *v11;
  uint64_t v12;
  NSSet *requiredFeatures;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *augmentedRecords;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)APOdmlTrainingSetBuilder;
  v11 = -[APOdmlTrainingSetBuilder init](&v19, sel_init);
  if (v11)
  {
    objc_msgSend_set(MEMORY[0x1E0C99E60], v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    requiredFeatures = v11->_requiredFeatures;
    v11->_requiredFeatures = (NSSet *)v12;

    objc_storeStrong((id *)&v11->_recipe, a4);
    objc_storeStrong((id *)&v11->_localRecords, a3);
    objc_msgSend_augmentedDESRecords(v8, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    augmentedRecords = v11->_augmentedRecords;
    v11->_augmentedRecords = (NSArray *)v16;

  }
  return v11;
}

+ (id)classesForDataDict
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  return (id)objc_msgSend_setWithObjects_(v2, v9, v3, v4, v5, v6, v7, v8, 0);
}

- (id)generateTrainingSet:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  NSObject *v53;
  const char *v54;
  int v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend_requiredFeatures(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7);

  if (v8)
  {
    objc_msgSend_recipe(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_augmentedDESRecordsRatio(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    OdmlLogForCategory(0xBuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v56) = 0;
      _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_DEFAULT, "Generating Training Set", (uint8_t *)&v56, 2u);
    }

    OdmlLogForCategory(0xBuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_localRecords(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 138412290;
      v57 = v19;
      _os_log_impl(&dword_1B69D6000, v16, OS_LOG_TYPE_DEFAULT, "Local records: %@", (uint8_t *)&v56, 0xCu);

    }
    OdmlLogForCategory(0xBuLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_augmentedRecords(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 138412290;
      v57 = v23;
      _os_log_impl(&dword_1B69D6000, v20, OS_LOG_TYPE_DEFAULT, "Augmented records: %@", (uint8_t *)&v56, 0xCu);

    }
    OdmlLogForCategory(0xBuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v56 = 138412290;
      v57 = v14;
      _os_log_impl(&dword_1B69D6000, v24, OS_LOG_TYPE_DEFAULT, "Sampling ratio: %@", (uint8_t *)&v56, 0xCu);
    }

    objc_msgSend_localRecords(self, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27 && (v30 = (void *)v27, v31 = objc_msgSend_intValue(v14, v28, v29), v30, v31 == 1))
    {
      objc_msgSend_localRecords(self, v28, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v28, v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_augmentedRecords(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__preprocessAugmentedDESRecords_andAddMetadataTo_addRecordIDsTo_(self, v40, (uint64_t)v36, v33, v39);
      objc_msgSend_localRecords(self, v41, v42);
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43 && (v46 = (void *)v43, v47 = objc_msgSend_intValue(v14, v44, v45), v46, v47))
      {
        objc_msgSend_parseRowsFromRecords_recordIDs_(self, v44, (uint64_t)v36, v39);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localRecords(self, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__combineRows_augmentedRows_(self, v52, (uint64_t)v51, v48);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend_parseRowsFromRecords_recordIDs_(self, v44, (uint64_t)v36, v39);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    return v32;
  }
  else
  {
    OdmlLogForCategory(0xBuLL);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v56) = 0;
      _os_log_impl(&dword_1B69D6000, v53, OS_LOG_TYPE_DEFAULT, "No features are required by the model.", (uint8_t *)&v56, 2u);
    }

    objc_msgSend_setError_errorCode_(self, v54, (uint64_t)a3, 8000);
    return 0;
  }
}

- (id)parseRowsFromRecords:(id)a3 recordIDs:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  unint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  unint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  int isValidRow;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint8_t buf[4];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v56 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v9, v10))
  {
    v12 = 0;
    v55 = v6;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v6, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v56, v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_printDESRecordInSegments_isPlugin_rowID_(APOdmlLogUtility, v19, v13, 1, v18);
      v20 = (void *)objc_opt_class();
      objc_msgSend_requiredFeatures(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)v13;
      objc_msgSend_trainingRowsFromDESRecord_featuresRequired_(v20, v24, v13, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_count(v25, v26, v27) && objc_msgSend_count(v25, v28, v29))
      {
        v31 = 0;
        do
        {
          objc_msgSend_objectAtIndexedSubscript_(v25, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v33, (uint64_t)CFSTR("_%ld"), v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v18, v35, (uint64_t)v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setRowID_(v32, v37, (uint64_t)v36);
          objc_msgSend_recipe(self, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          isValidRow = objc_msgSend_isValidRow_(v32, v41, (uint64_t)v40);

          if (isValidRow)
            objc_msgSend_addObject_(v58, v43, (uint64_t)v32);

          ++v31;
        }
        while (v31 < objc_msgSend_count(v25, v44, v45));
      }

      ++v12;
      v6 = v55;
    }
    while (v12 < objc_msgSend_count(v55, v46, v47));
  }
  OdmlLogForCategory(0xBuLL);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v60 = objc_msgSend_count(v58, v49, v50);
    _os_log_impl(&dword_1B69D6000, v48, OS_LOG_TYPE_DEFAULT, "Extracted %lu valid training rows from DES record.", buf, 0xCu);
  }

  v53 = (void *)objc_msgSend_copy(v58, v51, v52);
  return v53;
}

+ (id)trainingRowsFromDESRecord:(id)a3 featuresRequired:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  APOdmlTrainingRow *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  objc_msgSend_objectForKey_(v5, v14, (uint64_t)CFSTR("OnDeviceFeatures"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v12;
  LODWORD(v13) = objc_msgSend__extractFeaturesFromDataBlob_featuresRequired_andSaveTo_(v13, v16, (uint64_t)v15, v6, v12);

  if ((_DWORD)v13)
  {
    v42 = v9;
    v41 = v5;
    objc_msgSend_objectForKey_(v5, v17, (uint64_t)CFSTR("AdRecords"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v44, v48, 16);
    if (v20)
    {
      v23 = v20;
      v24 = *(_QWORD *)v45;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v45 != v24)
            objc_enumerationMutation(v18);
          objc_msgSend_objectForKey_(v18, v21, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v25));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_opt_class();
          objc_msgSend__gatherFeaturesFromAdRecord_requiredFeatures_(v27, v28, (uint64_t)v26, v6);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v29, v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addEntriesFromDictionary_(v32, v33, (uint64_t)v31);
            objc_msgSend_addEntriesFromDictionary_(v32, v34, (uint64_t)v43);
            v35 = [APOdmlTrainingRow alloc];
            v37 = (void *)objc_msgSend_initWithFeatures_(v35, v36, (uint64_t)v32);
            objc_msgSend_addObject_(v42, v38, (uint64_t)v37);

          }
          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v44, v48, 16);
      }
      while (v23);
    }
    v9 = v42;
    v39 = (void *)objc_msgSend_copy(v42, v21, v22);

    v5 = v41;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (id)_combineRows:(id)a3 augmentedRows:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  float v62;
  float v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  unint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  unint64_t v83;
  const char *v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  float v89;
  float v90;
  float v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v116 = a4;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v122, v127, 16);
  v11 = 0.0;
  v12 = 0.0;
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v123;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v123 != v14)
          objc_enumerationMutation(v6);
        objc_msgSend_features(*(void **)(*((_QWORD *)&v122 + 1) + 8 * i), v9, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recipe(self, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_augmentedDESRecordsTargetKey(v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v16, v23, (uint64_t)v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_BOOLValue(v27, v28, v29))
          v12 = v12 + 1.0;

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v122, v127, 16);
    }
    while (v13);
  }
  v114 = v6;
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v30 = v116;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v118, v126, 16);
  if (v32)
  {
    v35 = v32;
    v36 = *(_QWORD *)v119;
    v11 = 0.0;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v119 != v36)
          objc_enumerationMutation(v30);
        objc_msgSend_features(*(void **)(*((_QWORD *)&v118 + 1) + 8 * j), v33, v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recipe(self, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_augmentedDESRecordsTargetKey(v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v38, v45, (uint64_t)v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_BOOLValue(v49, v50, v51))
          v11 = v11 + 1.0;

      }
      v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v118, v126, 16);
    }
    while (v35);
  }

  objc_msgSend_arrayByAddingObjectsFromArray_(v114, v52, (uint64_t)v30);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recipe(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_augmentedDESRecordsTruePercentage(v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v59, v60, v61);
  v63 = v62;

  v66 = objc_msgSend_count(v114, v64, v65);
  v69 = objc_msgSend_count(v30, v67, v68);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v70, v71);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v53;
  v74 = objc_msgSend_count(v53, v72, v73);
  objc_msgSend_recipe(self, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_augmentedDESRecordsLimit(v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend_unsignedLongValue(v80, v81, v82);

  if (v74 >= v83)
    v86 = v83;
  else
    v86 = v74;
  if (v86)
  {
    v87 = v86;
    v88 = 0;
    v89 = (float)(v12 + v11) / v63;
    v90 = (float)(unint64_t)(v69 + v66) - (float)(v12 + v11);
    if (v89 >= (float)(v90 / (float)(1.0 - v63)))
      v89 = v90 / (float)(1.0 - v63);
    v91 = (float)(v63 * v89) / (float)(v12 + v11);
    v92 = (float)((float)((float)(1.0 - v63) * v89) / v90);
    v93 = v91;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v117, v84, v88);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = drand48();
      objc_msgSend_features(v94, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recipe(self, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_augmentedDESRecordsTargetKey(v101, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v98, v105, (uint64_t)v104);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v106, v107, v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v109)
        goto LABEL_31;
      if (objc_msgSend_BOOLValue(v109, v110, v111))
        break;
      if (v95 <= v92)
        goto LABEL_31;
LABEL_32:

      if (v87 == ++v88)
        goto LABEL_33;
    }
    if (v95 > v93)
      goto LABEL_32;
LABEL_31:
    objc_msgSend_addObject_(v115, v110, (uint64_t)v94);
    goto LABEL_32;
  }
LABEL_33:
  v112 = (void *)objc_msgSend_copy(v115, v84, v85);

  return v112;
}

- (void)_preprocessAugmentedDESRecords:(id)a3 andAddMetadataTo:(id)a4 addRecordIDsTo:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v22, v26, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v23;
    while (1)
    {
      if (*(_QWORD *)v23 != v15)
        objc_enumerationMutation(v7);
      objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v9, v17, (uint64_t)v16);
      objc_msgSend_dictionary(MEMORY[0x1E0C99D80], v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v8, v21, (uint64_t)v20);

      if (!--v14)
      {
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v12, (uint64_t)&v22, v26, 16);
        if (!v14)
          break;
      }
    }
  }

}

- (void)addRequiredFeatures:(id)a3
{
  const char *v4;
  id v5;

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], a2, (uint64_t)a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequiredFeatures_(self, v4, (uint64_t)v5);

}

+ (id)_gatherFeaturesFromAdRecord:(id)a3 requiredFeatures:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend_objectForKey_(v5, v7, (uint64_t)CFSTR("Tapped"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v9, (uint64_t)CFSTR("Impressed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_BOOLValue(v8, v11, v12) & 1) != 0 || objc_msgSend_BOOLValue(v10, v13, v14))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_class();
    if (objc_msgSend__extractFeaturesFromDataBlob_featuresRequired_andSaveTo_(v16, v17, (uint64_t)v5, v6, v15)&& (v18 = (void *)objc_opt_class(), objc_msgSend_objectForKey_(v5, v19, (uint64_t)CFSTR("ServerResponse")), v20 = (void *)objc_claimAutoreleasedReturnValue(), LODWORD(v18) = objc_msgSend__extractFeaturesFromDataBlob_featuresRequired_andSaveTo_(v18, v21, (uint64_t)v20, v6, v15), v20, (_DWORD)v18))
    {
      v24 = (void *)objc_msgSend_copy(v15, v22, v23);
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (BOOL)_extractFeaturesFromDataBlob:(id)a3 featuresRequired:(id)a4 andSaveTo:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  BOOL v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_allKeys(v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = sub_1B69E35C8;
  v70[3] = &unk_1E6A29660;
  v73 = a1;
  v17 = v13;
  v71 = v17;
  v18 = v16;
  v72 = v18;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v19, (uint64_t)v70);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend_allKeys(v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v66, v79, 16);
  if (!v65)
  {
    v51 = 1;
    goto LABEL_27;
  }
  v60 = a1;
  v61 = v17;
  v62 = v9;
  v63 = v18;
  v25 = *(_QWORD *)v67;
  v64 = v22;
LABEL_3:
  v26 = 0;
  while (1)
  {
    if (*(_QWORD *)v67 != v25)
      objc_enumerationMutation(v22);
    v27 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v26);
    objc_msgSend_objectForKeyedSubscript_(v18, v24, v27, v60);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v8, v29, (uint64_t)v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend_arrayOfNumbers(v30, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v36 = (id)v33;
    objc_msgSend_setObject_forKeyedSubscript_(v10, v34, v33, v27);
LABEL_11:

LABEL_12:
    if (v65 == ++v26)
    {
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v66, v79, 16);
      v65 = v50;
      if (!v50)
      {
        v51 = 1;
        goto LABEL_25;
      }
      goto LABEL_3;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v78 = v30;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)&v78, 1);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_setObject_forKeyedSubscript_(v10, v49, (uint64_t)v30, v27);
    else
      objc_msgSend_setValue_forKey_(v10, v49, 0, v27);
    goto LABEL_12;
  }
  v36 = v30;
  if (objc_msgSend_type(v36, v37, v38) == 5)
  {
    objc_msgSend_multiArrayValue(v36, v39, v40);
    v41 = v8;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayFromMultiarray(v42, v43, v44);
    v45 = v25;
    v46 = v10;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v46, v48, (uint64_t)v47, v27);

    v10 = v46;
    v25 = v45;

    v8 = v41;
    v18 = v63;
    v22 = v64;
    goto LABEL_11;
  }
  OdmlLogForCategory(0xBuLL);
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v53 = v22;
    v54 = (void *)objc_opt_class();
    v55 = v54;
    v58 = objc_msgSend_type(v36, v56, v57);
    *(_DWORD *)buf = 138412546;
    v75 = v54;
    v22 = v53;
    v76 = 2048;
    v77 = v58;
    _os_log_impl(&dword_1B69D6000, v52, OS_LOG_TYPE_ERROR, "[%@]: MLFeatureValue type %ld is not supported.", buf, 0x16u);

  }
  v51 = 0;
LABEL_25:
  v17 = v61;
  v9 = v62;
LABEL_27:

  return v51;
}

+ (id)translateFeatureKeyToDESKey:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  __CFString *v8;
  __CFString *v9;
  const char *v11;
  __CFString **v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;

  v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("AppDownloadVector")))
  {
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v5, (uint64_t)CFSTR("appDownloadVector"), 0, 0);
LABEL_8:
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("AppInstalledVector")))
  {
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v6, (uint64_t)CFSTR("installedAppVector"), 0, 0);
    goto LABEL_8;
  }
  if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("AppUsageVector")) & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("appUsageVector")))
  {
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v7, (uint64_t)CFSTR("appUsageVector"), 0, 0);
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("DupeFirstOrganic")))
  {
    v12 = kAPOdmlIsDupeKey;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("Installed")))
  {
    v12 = kAPOdmlAppInstalledKey;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("Impressed")))
  {
    v12 = kAPOdmlImpressedKey;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("Tapped")) & 1) == 0
      && (objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("Tap")) & 1) == 0
      && !objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("label_input_0")))
    {
      v8 = (__CFString *)v3;
      goto LABEL_9;
    }
    v12 = kAPOdmlTappedKey;
  }
  v8 = *v12;
LABEL_9:
  v9 = v8;

  return v9;
}

- (id)metricsForTrainingRow:(id)a3 withClientPttr:(id)a4
{
  void *v5;
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
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend_dictionary(v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_features(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("Tap"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v18, (uint64_t)v17, CFSTR("tap"));

  objc_msgSend_setObject_forKeyedSubscript_(v10, v19, MEMORY[0x1E0C9AAB0], CFSTR("impression"));
  objc_msgSend_setObject_forKeyedSubscript_(v10, v20, (uint64_t)v6, CFSTR("on-device_pTTR"));

  v23 = (void *)objc_msgSend_copy(v10, v21, v22);
  return v23;
}

- (BOOL)setError:(id *)a3 errorCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (BOOL)setErrorPtr:(id *)a3 toError:(id)a4
{
  if (a3)
    *a3 = objc_retainAutorelease(a4);
  return a3 != 0;
}

- (unint64_t)trainingSetCount
{
  return self->_trainingSetCount;
}

- (NSSet)requiredFeatures
{
  return self->_requiredFeatures;
}

- (void)setRequiredFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (APOdmlRecipe)recipe
{
  return self->_recipe;
}

- (NSArray)localRecords
{
  return self->_localRecords;
}

- (NSArray)augmentedRecords
{
  return self->_augmentedRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_augmentedRecords, 0);
  objc_storeStrong((id *)&self->_localRecords, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_requiredFeatures, 0);
}

@end

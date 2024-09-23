@implementation APOdmlFeatureStorage

- (APOdmlFeatureStorage)initWithExperimentID:(id)a3 treatmentID:(id)a4 deploymentID:(int)a5 trialNamespace:(id)a6
{
  id v11;
  id v12;
  id v13;
  APOdmlFeatureStorage *v14;
  APOdmlFeatureStorage *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)APOdmlFeatureStorage;
  v14 = -[APOdmlCoreDataStorage init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_experimentID, a3);
    objc_storeStrong((id *)&v15->_treatmentID, a4);
    v15->_deploymentID = a5;
    objc_storeStrong((id *)&v15->_trialNamespace, a6);
  }

  return v15;
}

- (id)featureForName:(id)a3 backgroundContext:(id)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend_featuresForName_fetchLimit_backgroundContext_(self, a2, (uint64_t)a3, 1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_firstObject(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)featureForName:(id)a3
{
  id v4;
  APOdmlFeatureStorage *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  APOdmlFeatureStorage *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  _QWORD v26[4];
  id v27;
  _BYTE *v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_storePrecheck(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    OdmlLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      v10 = *(id *)&buf[4];
      _os_log_impl(&dword_1B69D6000, v9, OS_LOG_TYPE_ERROR, "[%@] Get feature failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5004, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v13, (uint64_t)v12, 0);

    objc_sync_exit(v5);
    v14 = 0;
  }
  else
  {
    objc_sync_exit(v5);

    objc_msgSend_persistentContainer(v5, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (APOdmlFeatureStorage *)objc_msgSend_newBackgroundContext(v17, v18, v19);

    objc_msgSend_featureForName_backgroundContext_(v5, v21, (uint64_t)v4, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v30 = sub_1B69E02F8;
      v31 = sub_1B69E0308;
      v32 = 0;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1B69E0310;
      v26[3] = &unk_1E6A29598;
      v28 = buf;
      v27 = v22;
      objc_msgSend_performBlockAndWait_(v20, v24, (uint64_t)v26);
      v14 = *(id *)(*(_QWORD *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v14 = 0;
    }

    v5 = v20;
  }

  return v14;
}

- (id)vectorsForName:(id)a3 lookbackWindow:(id)a4
{
  id v6;
  APOdmlFeatureStorage *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  APOdmlFeatureStorage *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  id v46;
  void *v47;
  _QWORD v48[6];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_storePrecheck(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    OdmlLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      v12 = *(id *)&buf[4];
      _os_log_impl(&dword_1B69D6000, v11, OS_LOG_TYPE_ERROR, "[%@] Vector retrieval failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);

    }
    objc_sync_exit(v7);
    v13 = 0;
  }
  else
  {
    objc_sync_exit(v7);

    objc_msgSend_persistentContainer(v7, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (APOdmlFeatureStorage *)objc_msgSend_newBackgroundContext(v16, v17, v18);

    objc_msgSend_featuresForName_fetchLimit_backgroundContext_(v7, v20, (uint64_t)v46, 0, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v24 = v21;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v49, v57, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v50 != v29)
            objc_enumerationMutation(v24);
          v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (v31)
          {
            objc_msgSend_date(MEMORY[0x1E0C99D68], v26, v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_createdAt(v31, v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSinceDate_(v32, v36, (uint64_t)v35);
            v38 = v37;

            objc_msgSend_doubleValue(v6, v39, v40);
            if (v38 <= v41)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v54 = sub_1B69E02F8;
              v55 = sub_1B69E0308;
              v56 = 0;
              v48[0] = MEMORY[0x1E0C809B0];
              v48[1] = 3221225472;
              v48[2] = sub_1B69E06A8;
              v48[3] = &unk_1E6A29598;
              v48[4] = v31;
              v48[5] = buf;
              objc_msgSend_performBlockAndWait_(v19, v26, (uint64_t)v48);
              objc_msgSend_addObject_(v47, v42, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
              _Block_object_dispose(buf, 8);

            }
          }
        }
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v49, v57, 16);
      }
      while (v28);
    }

    v13 = (void *)objc_msgSend_copy(v47, v43, v44);
    v7 = v19;
  }

  return v13;
}

- (id)featuresForName:(id)a3 fetchLimit:(unint64_t)a4 backgroundContext:(id)a5
{
  id v8;
  APOdmlFeatureStorage *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  id v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  const char *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  NSObject *v58;
  void *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  NSObject *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint64_t *v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint8_t v82[4];
  id v83;
  __int16 v84;
  uint64_t v85;
  _BYTE buf[24];
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  _QWORD v90[4];

  v90[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v70 = a5;
  v9 = self;
  objc_sync_enter(v9);
  objc_msgSend_storePrecheck(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    OdmlLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      v15 = v14;
      _os_log_impl(&dword_1B69D6000, v13, OS_LOG_TYPE_ERROR, "[%@] Get feature failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5004, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v18, (uint64_t)v17, 0);
  }
  else
  {
    v17 = 0;
  }

  objc_sync_exit(v9);
  if (v12)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x1E0C97B48], v19, (uint64_t)CFSTR("Feature"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3880];
    v25 = objc_msgSend_deploymentID(v9, v23, v24);
    objc_msgSend_experimentID(v9, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_treatmentID(v9, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(v22, v32, (uint64_t)CFSTR("(deploymentID == %d) AND (experimentID == %@) AND (treatmentID == %@) AND (featureType == %@)"), v25, v28, v31, v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setPredicate_(v21, v34, (uint64_t)v33);
    objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v35, (uint64_t)CFSTR("createdAt"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v36;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v90, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSortDescriptors_(v21, v39, (uint64_t)v38);

    if (a4)
    {
      objc_msgSend_setFetchLimit_(v21, v40, a4);
      OdmlLogForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        v43 = v42;
        _os_log_impl(&dword_1B69D6000, v41, OS_LOG_TYPE_DEFAULT, "[%@] Fetching Features from CoreData with a fetch limit of %lu", buf, 0x16u);

      }
    }
    else
    {
      OdmlLogForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v44;
        v45 = v44;
        _os_log_impl(&dword_1B69D6000, v41, OS_LOG_TYPE_DEFAULT, "[%@] Fetching Features from CoreData with no fetch limit.", buf, 0xCu);

      }
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v87 = sub_1B69E02F8;
    v88 = sub_1B69E0308;
    v89 = 0;
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = sub_1B69E02F8;
    v80 = sub_1B69E0308;
    v81 = 0;
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = sub_1B69E0DC8;
    v71[3] = &unk_1E6A295C0;
    v74 = &v76;
    v72 = v70;
    v46 = v21;
    v73 = v46;
    v75 = buf;
    objc_msgSend_performBlockAndWait_(v72, v47, (uint64_t)v71);
    v50 = (void *)v77[5];
    if (v50 && objc_msgSend_count(v50, v48, v49))
    {
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        OdmlLogForCategory(4uLL);
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = (void *)objc_opt_class();
          v53 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v82 = 138412546;
          v83 = v52;
          v84 = 2112;
          v85 = v53;
          v54 = v52;
          _os_log_impl(&dword_1B69D6000, v51, OS_LOG_TYPE_ERROR, "[%@] NSFetchRequest failed with error: %@", v82, 0x16u);

        }
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v55, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5006, 0);
        v56 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v57, v56, 0);
        v20 = 0;
        v17 = (void *)v56;
      }
      else
      {
        OdmlLogForCategory(0);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v66 = (id)objc_opt_class();
          v69 = objc_msgSend_count((void *)v77[5], v67, v68);
          *(_DWORD *)v82 = 138412546;
          v83 = v66;
          v84 = 2048;
          v85 = v69;
          _os_log_impl(&dword_1B69D6000, v65, OS_LOG_TYPE_DEFAULT, "[%@] Fetched %lu Features from CoreData", v82, 0x16u);

        }
        v20 = (id)v77[5];
      }
    }
    else
    {
      OdmlLogForCategory(4uLL);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = (void *)objc_opt_class();
        *(_DWORD *)v82 = 138412546;
        v83 = v59;
        v84 = 2112;
        v85 = (uint64_t)v8;
        v60 = v59;
        _os_log_impl(&dword_1B69D6000, v58, OS_LOG_TYPE_ERROR, "[%@] Failed to retrieve feature %@", v82, 0x16u);

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v61, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5005, 0);
      v62 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v63, v62, 0);
      v20 = 0;
      v17 = (void *)v62;
    }

    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(buf, 8);

  }
  return v20;
}

- (id)saveFeatureFromObject:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  APOdmlFeatureStorage *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  _QWORD v35[4];
  id v36;
  APOdmlFeatureStorage *v37;
  id v38;
  id v39;
  _BYTE *v40;
  uint8_t v41[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend_storePrecheck(v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    OdmlLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      v13 = *(id *)&buf[4];
      _os_log_impl(&dword_1B69D6000, v12, OS_LOG_TYPE_ERROR, "[%@] Save feature failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5007, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v16, (uint64_t)v15, 0);
    v17 = v11;
  }
  else
  {
    v15 = 0;
  }

  objc_sync_exit(v8);
  if (!v11)
  {
    objc_msgSend_persistentContainer(v8, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend_newBackgroundContext(v20, v21, v22);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v46 = sub_1B69E02F8;
    v47 = sub_1B69E0308;
    v48 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_1B69E11B8;
    v35[3] = &unk_1E6A295E8;
    v24 = v23;
    v36 = v24;
    v37 = v8;
    v38 = v7;
    v39 = v6;
    v40 = buf;
    objc_msgSend_performBlockAndWait_(v24, v25, (uint64_t)v35);
    v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v26)
    {
      OdmlLogForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (void *)objc_opt_class();
        v29 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v41 = 138412546;
        v42 = v28;
        v43 = 2112;
        v44 = v29;
        v30 = v28;
        _os_log_impl(&dword_1B69D6000, v27, OS_LOG_TYPE_ERROR, "[%@] Failed to save object with error: %@", v41, 0x16u);

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v31, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5008, 0);
      v32 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v33, v32, 0);
      v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v15 = (void *)v32;
    }
    v11 = v26;

    _Block_object_dispose(buf, 8);
  }

  return v11;
}

- (void)deleteExpiredFeaturesForName:(id)a3 lookbackWindow:(id)a4
{
  id v6;
  APOdmlFeatureStorage *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  id v45;
  const char *v46;
  void *v47;
  const char *v48;
  id v49;
  APOdmlFeatureStorage *obj;
  APOdmlFeatureStorage *v51;
  _QWORD v52[4];
  APOdmlFeatureStorage *v53;
  _BYTE *v54;
  _QWORD v55[4];
  APOdmlFeatureStorage *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[4];
  void *v63;
  __int16 v64;
  uint64_t v65;
  _BYTE buf[24];
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  obj = v7;
  objc_msgSend_storePrecheck(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    OdmlLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      v12 = *(id *)&buf[4];
      _os_log_impl(&dword_1B69D6000, v11, OS_LOG_TYPE_ERROR, "[%@] Delete feature failed; CoreData failed to load with the following error: %@.",
        buf,
        0x16u);

    }
    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    objc_msgSend_persistentContainer(v7, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_newBackgroundContext(v15, v16, v17);

    v51 = (APOdmlFeatureStorage *)v18;
    objc_msgSend_featuresForName_fetchLimit_backgroundContext_(obj, v19, (uint64_t)v49, 0, v18);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v58, v70, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v59 != v25)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          if (v27)
          {
            objc_msgSend_date(MEMORY[0x1E0C99D68], v22, v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_createdAt(v27, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSinceDate_(v28, v32, (uint64_t)v31);
            v34 = v33;

            objc_msgSend_doubleValue(v6, v35, v36);
            if (v34 >= v37)
            {
              v55[0] = MEMORY[0x1E0C809B0];
              v55[1] = 3221225472;
              v55[2] = sub_1B69E172C;
              v55[3] = &unk_1E6A29610;
              v56 = v51;
              v57 = v27;
              objc_msgSend_performBlockAndWait_(v56, v38, (uint64_t)v55);

            }
          }
        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v58, v70, 16);
      }
      while (v24);
    }

    if (objc_msgSend_hasChanges(v51, v39, v40))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v67 = sub_1B69E02F8;
      v68 = sub_1B69E0308;
      v69 = 0;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = sub_1B69E1738;
      v52[3] = &unk_1E6A29638;
      v53 = v51;
      v54 = buf;
      objc_msgSend_performBlockAndWait_(v53, v41, (uint64_t)v52);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        OdmlLogForCategory(0);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = (void *)objc_opt_class();
          v44 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v62 = 138412546;
          v63 = v43;
          v64 = 2112;
          v65 = v44;
          v45 = v43;
          _os_log_impl(&dword_1B69D6000, v42, OS_LOG_TYPE_ERROR, "[%@] Failed to delete expired objects with error: %@", v62, 0x16u);

        }
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v46, (uint64_t)CFSTR("APOdmlFeatureStorageErrorDomain"), 5009, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v48, (uint64_t)v47, 0);

      }
      _Block_object_dispose(buf, 8);

    }
    v7 = v51;
  }

}

- (int)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(int)a3
{
  self->_deploymentID = a3;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_experimentID, a3);
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (void)setTreatmentID:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentID, a3);
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (void)setTrialNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_trialNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialNamespace, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
}

@end

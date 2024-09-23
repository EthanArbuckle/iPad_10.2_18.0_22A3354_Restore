@implementation SEMFTSMatcher

- (SEMFTSMatcher)initWithFTSAccessProvider:(id)a3
{
  id v5;
  SEMFTSMatcher *v6;
  SEMFTSMatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SEMFTSMatcher;
  v6 = -[SEMFTSMatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ftsAccessProvider, a3);

  return v7;
}

- (id)searchFTSWithCriteria:(id)a3 userId:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  id v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  NSObject *v60;
  NSObject *v61;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend_ftsDatabaseReadAccessWithUserId_(self->_ftsAccessProvider, v9, (uint64_t)a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  objc_msgSend__matchFTSRecordsWithSearchCriteria_database_error_(self, v11, (uint64_t)v8, v10, &v76);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v76;
  if (v12)
    v16 = v13 == 0;
  else
    v16 = 0;
  if (!v16)
  {
    v17 = v13;
    v18 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[SEMFTSMatcher searchFTSWithCriteria:userId:error:]";
      v81 = 2112;
      v82 = v17;
      _os_log_error_impl(&dword_2462C4000, v18, OS_LOG_TYPE_ERROR, "%s FTS search failed due to error: %@", buf, 0x16u);
      if (a5)
      {
LABEL_7:
        if (v17)
          *a5 = objc_retainAutorelease(v17);
      }
    }
    else if (a5)
    {
      goto LABEL_7;
    }

LABEL_10:
    v19 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_40;
  }
  if (!objc_msgSend_count(v12, v14, v15))
  {
    v60 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v80 = "-[SEMFTSMatcher searchFTSWithCriteria:userId:error:]";
      _os_log_impl(&dword_2462C4000, v60, OS_LOG_TYPE_INFO, "%s No records returned from FTS query", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v66 = v10;
  v20 = objc_alloc(MEMORY[0x24BDBCEF0]);
  v23 = objc_msgSend_count(v12, v21, v22);
  v25 = (void *)objc_msgSend_initWithCapacity_(v20, v24, v23);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v65 = v12;
  v26 = v12;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v72, v78, 16);
  if (v28)
  {
    v31 = v28;
    v32 = *(_QWORD *)v73;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v73 != v32)
          objc_enumerationMutation(v26);
        objc_msgSend_externalId(*(void **)(*((_QWORD *)&v72 + 1) + 8 * v33), v29, v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v25, v35, (uint64_t)v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v72, v78, 16);
    }
    while (v31);
  }

  objc_msgSend_allObjects(v25, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v10 = v66;
  objc_msgSend__allFTSRecordsWithExternalIds_database_error_(self, v39, (uint64_t)v38, v66, &v71);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v71;

  if (!v40 || v41)
  {
    v61 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[SEMFTSMatcher searchFTSWithCriteria:userId:error:]";
      v81 = 2112;
      v82 = v41;
      _os_log_error_impl(&dword_2462C4000, v61, OS_LOG_TYPE_ERROR, "%s externalId search failed due to error: %@", buf, 0x16u);
    }
    v19 = (void *)MEMORY[0x24BDBD1A8];
    if (a5)
    {
      v12 = v65;
      if (v41)
        *a5 = objc_retainAutorelease(v41);
    }
    else
    {
      v12 = v65;
    }
  }
  else
  {
    v63 = 0;
    v64 = v8;
    v42 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v45 = objc_msgSend_count(v40, v43, v44);
    v19 = (void *)objc_msgSend_initWithCapacity_(v42, v46, v45);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend_allKeys(v40, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v67, v77, 16);
    if (v51)
    {
      v53 = v51;
      v54 = *(_QWORD *)v68;
      do
      {
        v55 = 0;
        do
        {
          if (*(_QWORD *)v68 != v54)
            objc_enumerationMutation(v49);
          objc_msgSend_objectForKey_(v40, v52, *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v55), v63, v64);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_resultFromFTSRecords_(SEMAppCustomVocabularySearchResult, v57, (uint64_t)v56);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v58)
            objc_msgSend_addObject_(v19, v59, (uint64_t)v58);

          ++v55;
        }
        while (v53 != v55);
        v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v67, v77, 16);
      }
      while (v53);
    }

    v8 = v64;
    v12 = v65;
    v10 = v66;
    v41 = v63;
  }

LABEL_40:
  return v19;
}

- (id)_matchFTSRecordsWithSearchCriteria:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  const char *v31;
  int v32;
  id v33;
  _QWORD v35[4];
  id v36;

  v7 = a3;
  v8 = a4;
  objc_msgSend_commandCriteriaFromSearchTerms(v7, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_commandCriteriaFromFilters(v7, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(v14, v15, (uint64_t)v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_criterionWithANDSubCriteria_(SEMSQLCommandCriterion, v17, (uint64_t)v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_tableName(SEMFTSRecord, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_builderWithTableName_(SEMDatabaseSelect, v22, (uint64_t)v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setCommandCriterion_(v23, v24, (uint64_t)v18);
    objc_msgSend_build(v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29 = objc_opt_class();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_2462E91F4;
    v35[3] = &unk_25175F310;
    v30 = v28;
    v36 = v30;
    v32 = objc_msgSend_enumerateRecordResultsOfSelect_recordClass_error_usingBlock_(v8, v31, (uint64_t)v27, v29, a5, v35);

    if (v32)
      v33 = v30;
    else
      v33 = 0;

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)_allFTSRecordsWithExternalIds:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  const char *v38;
  int v39;
  id v40;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v12 = objc_msgSend_count(v7, v10, v11);
  v14 = (void *)objc_msgSend_initWithCapacity_(v9, v13, v12);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v15 = v7;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v44, v48, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v45;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v15);
        objc_msgSend_encodedExternalIdString_(SEMFTSRecord, v18, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v14, v23, (uint64_t)v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v44, v48, 16);
    }
    while (v19);
  }

  objc_msgSend_criterionWithColumnName_INColumnValues_(SEMSQLCommandCriterion, v24, 0x251783890, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableName(SEMFTSRecord, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_builderWithTableName_(SEMDatabaseSelect, v29, (uint64_t)v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setCommandCriterion_(v30, v31, (uint64_t)v25);
  objc_msgSend_build(v30, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v36 = objc_opt_class();
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = sub_2462E9480;
  v42[3] = &unk_25175F310;
  v37 = v35;
  v43 = v37;
  v39 = objc_msgSend_enumerateRecordResultsOfSelect_recordClass_error_usingBlock_(v8, v38, (uint64_t)v34, v36, a5, v42);

  if (v39)
    v40 = v37;
  else
    v40 = 0;

  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ftsAccessProvider, 0);
}

@end

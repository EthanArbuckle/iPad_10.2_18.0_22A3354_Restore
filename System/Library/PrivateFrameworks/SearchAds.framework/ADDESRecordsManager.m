@implementation ADDESRecordsManager

- (ADDESRecordsManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ADDESRecordsManager *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *recordID;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ADDESRecordsManager;
  v6 = -[ADDESRecordsManager init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x24BDD1880], v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v7, v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    recordID = v6->_recordID;
    v6->_recordID = (NSString *)v12;

  }
  return v6;
}

- (void)createRecords:(id)a3 firstOrganicId:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int isPersonalizedAdsEnabled;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t isAppInstalled;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t isEqualToString;
  const char *v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B8], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(v15, v16, v17, v18, v19);

  if (isPersonalizedAdsEnabled)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = v8;
    obj = v8;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v48, (uint64_t)v52, 16);
    if (v22)
    {
      v27 = v22;
      v28 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v49 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend_adamID(v30, v23, v24, v25, v26, v46);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          isAppInstalled = objc_msgSend_isAppInstalled_(self, v32, (uint64_t)v31, v33, v34);

          objc_msgSend_adamID(v30, v36, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v9, v41, (uint64_t)v40, v42, v43);

          objc_msgSend__createRecordForAdData_installed_isDupe_rerankingError_(self, v45, (uint64_t)v30, isAppInstalled, isEqualToString, v10);
        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v48, (uint64_t)v52, 16);
      }
      while (v27);
    }

    v8 = v46;
  }

}

- (void)updateDESRecord:(id)a3 forEvent:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int isPersonalizedAdsEnabled;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B8], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(v11, v12, v13, v14, v15);

  if (isPersonalizedAdsEnabled)
  {
    APLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_eventTypeToString_(self, v18, a4, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v6;
      v31 = 2112;
      v32 = v21;
      _os_log_impl(&dword_228279000, v17, OS_LOG_TYPE_DEBUG, "[AdamID %@] Updating DES record with event %@", (uint8_t *)&v29, 0x16u);

    }
    v22 = (void *)MEMORY[0x24BE7A778];
    objc_msgSend_recordID(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateWithRecordID_adamID_event_(v22, v28, (uint64_t)v27, (uint64_t)v6, a4);

  }
}

- (void)_createRecordForAdData:(id)a3 installed:(BOOL)a4 isDupe:(BOOL)a5 rerankingError:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v7 = a5;
  v8 = a4;
  v63 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  objc_msgSend_adData(v10, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    APLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_instanceID(v10, v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v16, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 138412546;
      v60 = v31;
      v61 = 2112;
      v62 = v36;
      _os_log_impl(&dword_228279000, v26, OS_LOG_TYPE_ERROR, "[Ad %@] Error detected within the Ad Data object when writing to DES: %@", (uint8_t *)&v59, 0x16u);

LABEL_4:
    }
  }
  else
  {
    objc_msgSend_odmlResponse(v16, v22, v23, v24, v25);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v42 = (void *)MEMORY[0x24BE7A778];
      objc_msgSend_recordID(self, v38, v39, v40, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_adamID(v10, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_odmlResponse(v16, v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_eventWithRecordID_adamID_odmlResponse_appInstalled_isDupe_rerankingError_(v42, v54, (uint64_t)v43, (uint64_t)v48, (uint64_t)v53, v8, v7, v11);

      goto LABEL_8;
    }
    APLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_instanceID(v10, v55, v56, v57, v58);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 138412290;
      v60 = v31;
      _os_log_impl(&dword_228279000, v26, OS_LOG_TYPE_ERROR, "[Ad %@] ODML response not found for ad. Aborting DES write.", (uint8_t *)&v59, 0xCu);
      goto LABEL_4;
    }
  }

LABEL_8:
}

- (BOOL)isAppInstalled:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend_integerValue(a3, a2, (uint64_t)a3, v3, v4);
  v6 = objc_alloc(MEMORY[0x24BDC1540]);
  v9 = (void *)objc_msgSend_initWithStoreItemIdentifier_error_(v6, v7, v5, 0, v8);
  LOBYTE(v5) = v9 != 0;

  return v5;
}

- (id)eventTypeToString:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 == 1)
    return CFSTR("Impression Event");
  if (a3 == 2)
    return CFSTR("Interaction Event");
  APLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_228279000, v5, OS_LOG_TYPE_ERROR, "Error: Unidentifiable event type: %ld.", (uint8_t *)&v6, 0xCu);
  }

  return CFSTR("Unknown");
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end

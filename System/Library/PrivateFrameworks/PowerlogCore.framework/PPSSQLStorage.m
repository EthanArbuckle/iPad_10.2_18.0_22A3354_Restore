@implementation PPSSQLStorage

- (id)connectionForKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = +[PPSEntryKey storageForEntryKey:](PPSEntryKey, "storageForEntryKey:", a3);
  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)connectionByStorage
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (PPSSQLStorage)init
{
  PPSSQLStorage *v2;
  PPSSQLStorage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPSSQLStorage;
  v2 = -[PPSStorage init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PPSSQLStorage setStorageStarted:](v2, "setStorageStarted:", 0);
    -[PPSSQLStorage setupFolders](v3, "setupFolders");
    -[PPSSQLStorage setupDBConnections](v3, "setupDBConnections");
    if (init_onceToken_0 != -1)
      dispatch_once(&init_onceToken_0, &__block_literal_global_23);
  }
  return v3;
}

void __21__PPSSQLStorage_init__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6ABADA8;
  v2[1] = &unk_1E6ABADC0;
  v3[0] = CFSTR("BLOB");
  v3[1] = CFSTR("INTEGER");
  v2[2] = &unk_1E6ABADD8;
  v2[3] = &unk_1E6ABADF0;
  v3[2] = CFSTR("INTEGER");
  v3[3] = CFSTR("TEXT");
  v2[4] = &unk_1E6ABAE08;
  v2[5] = &unk_1E6ABAE20;
  v3[4] = CFSTR("REAL");
  v3[5] = CFSTR("INTEGER");
  v2[6] = &unk_1E6ABAE38;
  v2[7] = &unk_1E6ABAE50;
  v3[6] = CFSTR("INTEGER");
  v3[7] = CFSTR("INTEGER");
  v2[8] = &unk_1E6ABAE68;
  v2[9] = &unk_1E6ABAE80;
  v3[8] = CFSTR("REAL");
  v3[9] = CFSTR("BLOB");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PLVTypeToPLSQLiteType_0;
  PLVTypeToPLSQLiteType_0 = v0;

}

- (void)startStorage
{
  if (startStorage_onceToken != -1)
    dispatch_once(&startStorage_onceToken, &__block_literal_global_46_0);
}

void __29__PPSSQLStorage_startStorage__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint8_t v3[16];

  sqlLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_DEFAULT, "[PPSSQLStorage] Starting Storage", v3, 2u);
  }

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startStorage");

}

- (void)setupMetadataStorage
{
  _QWORD block[5];

  if (!+[PLUtilities shouldLogPreUnlockTelemetry](PLUtilities, "shouldLogPreUnlockTelemetry"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PPSSQLStorage_setupMetadataStorage__block_invoke;
    block[3] = &unk_1E6A52050;
    block[4] = self;
    if (setupMetadataStorage_onceToken != -1)
      dispatch_once(&setupMetadataStorage_onceToken, block);
  }
}

uint64_t __37__PPSSQLStorage_setupMetadataStorage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sqlLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6AB6000, v2, OS_LOG_TYPE_DEFAULT, "[PPSSQLStorage] Setup Metadata Storage", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "handleMetadataVersionChange");
  objc_msgSend(*(id *)(a1 + 32), "createMetadataTable");
  objc_msgSend(*(id *)(a1 + 32), "persistMetadata");
  return objc_msgSend(*(id *)(a1 + 32), "deleteOldMetadataStore");
}

- (void)createMetadataTable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[3];
  _QWORD v29[2];
  _BYTE v30[128];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[6];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[5];

  v47[3] = *MEMORY[0x1E0C80C00];
  v45[0] = CFSTR("column-name");
  v45[1] = CFSTR("type");
  v46[0] = CFSTR("subsystem");
  v46[1] = CFSTR("TEXT");
  v47[0] = &unk_1E6AF7200;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v2;
  v43[0] = CFSTR("column-name");
  v43[1] = CFSTR("type");
  v44[0] = CFSTR("category");
  v44[1] = CFSTR("TEXT");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = &unk_1E6AF7228;
  v42[1] = &unk_1E6AF7250;
  v40[0] = CFSTR("column-name");
  v40[1] = CFSTR("type");
  v41[0] = CFSTR("build");
  v41[1] = CFSTR("TEXT");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v4;
  v38[0] = CFSTR("column-name");
  v38[1] = CFSTR("type");
  v39[0] = CFSTR("name");
  v39[1] = CFSTR("TEXT");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v5;
  v36[0] = CFSTR("column-name");
  v36[1] = CFSTR("type");
  v37[0] = CFSTR("version");
  v37[1] = CFSTR("REAL");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v6;
  v34[0] = CFSTR("column-name");
  v34[1] = CFSTR("type");
  v35[0] = CFSTR("metadata");
  v35[1] = CFSTR("BLOB");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v32[1] = CFSTR("REAL");
  v33[0] = &unk_1E6AF7278;
  v31[0] = CFSTR("column-name");
  v31[1] = CFSTR("type");
  v32[0] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v16, "tableExistsForTableName:", CFSTR("PLCoreStorage_Metadata")) & 1) == 0)
        {
          objc_msgSend(v16, "createTableName:withColumns:", CFSTR("PLCoreStorage_Metadata"), v23);
          v29[0] = CFSTR("subsystem");
          v29[1] = CFSTR("category");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "createCompositeIndexOnTable:forColumns:", CFSTR("PLCoreStorage_Metadata"), v17);

        }
        if ((objc_msgSend(v16, "tableExistsForTableName:", CFSTR("PLCoreStorage_Metadata_Dynamic")) & 1) == 0)
        {
          objc_msgSend(v16, "createTableName:withColumns:", CFSTR("PLCoreStorage_Metadata_Dynamic"), v22);
          v28[0] = CFSTR("FK_ID");
          v28[1] = CFSTR("name");
          v28[2] = CFSTR("version");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "createCompositeIndexOnTable:forColumns:", CFSTR("PLCoreStorage_Metadata_Dynamic"), v18);

        }
        if ((objc_msgSend(v16, "tableExistsForTableName:", CFSTR("PLCoreStorage_MetadataVersion")) & 1) == 0)
        {
          objc_msgSend(v16, "createTableName:withColumns:", CFSTR("PLCoreStorage_MetadataVersion"), v9);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (%f)"), CFSTR("PLCoreStorage_MetadataVersion"), CFSTR("version"), 0x3FF0000000000000);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (id)objc_msgSend(v16, "performQuery:", v19);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v13);
  }

}

- (void)handleMetadataVersionChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), CFSTR("version"), CFSTR("PLCoreStorage_MetadataVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = CFSTR("PLCoreStorage_MetadataVersion");
    v9 = *(_QWORD *)v25;
    v10 = CFSTR("PLCoreStorage_Metadata");
    do
    {
      v11 = 0;
      v23 = v7;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (!objc_msgSend(v12, "tableExistsForTableName:", v8))
          goto LABEL_11;
        objc_msgSend(v12, "performQuery:", v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count") != 1)
        {

LABEL_11:
          objc_msgSend(v12, "dropTable:", v10);
          objc_msgSend(v12, "dropTable:", CFSTR("PLCoreStorage_Metadata_Dynamic"));
          objc_msgSend(v12, "dropTable:", v8);
          goto LABEL_12;
        }
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("version"));
        v15 = v9;
        v16 = v8;
        v17 = v10;
        v18 = v5;
        v19 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v22 = v21;

        v3 = v19;
        v5 = v18;
        v10 = v17;
        v8 = v16;
        v9 = v15;
        v7 = v23;

        if (v22 != 1.0)
          goto LABEL_11;
LABEL_12:
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

}

- (void)persistMetadata
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLStorage setEntryKeysToSetup:](self, "setEntryKeysToSetup:", v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = (void *)objc_opt_new();
        -[PPSSQLStorage metricsToUpdateForStorage:processedMetrics:](self, "metricsToUpdateForStorage:processedMetrics:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSSQLStorage metricsToAddForStorage:processedMetrics:](self, "metricsToAddForStorage:processedMetrics:", v10, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
          -[PPSSQLStorage updateMetadata:updateMetrics:addMetrics:](self, "updateMetadata:updateMetrics:addMetrics:", v10, v12, v13);
        objc_msgSend(v10, "freeMetadataState");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)updateMetadata:(id)a3 updateMetrics:(id)a4 addMetrics:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  id obja;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v54 = a5;
  v63 = v7;
  objc_msgSend(v7, "beginTransaction");
  +[PLUtilities buildVersion](PLUtilities, "buildVersion");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v9 = v8;
  obj = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (obj)
  {
    v56 = *(_QWORD *)v81;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v81 != v56)
        {
          v11 = v10;
          objc_enumerationMutation(v9);
          v10 = v11;
        }
        v60 = v10;
        v12 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v10);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend(v9, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v77 != v15)
                objc_enumerationMutation(v13);
              v17 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
              objc_msgSend(v9, "objectForKeyedSubscript:", v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v19 == v20;

              if (v21)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE FK_ID='%@' AND name='%@'"), CFSTR("PLCoreStorage_Metadata_Dynamic"), v12, v17);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = (id)objc_msgSend(v63, "performQuery:returnValue:returnResult:", v23, 0, 0);
              }
              else
              {
                objc_msgSend(v9, "objectForKeyedSubscript:", v12);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", v17);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v23, "data");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "version");
                objc_msgSend(v63, "writeMetadata:forFKID:build:name:version:", v24, v12, v62, v17);

              }
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
          }
          while (v14);
        }

        v10 = v60 + 1;
      }
      while ((id)(v60 + 1) != obj);
      obj = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (obj);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obja = v54;
  v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v73 != v47)
          objc_enumerationMutation(obja);
        v26 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v27 = v26;
        objc_msgSend(obja, "objectForKeyedSubscript:");
        v50 = (id)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
        if (v52)
        {
          v51 = *(_QWORD *)v69;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v69 != v51)
              {
                v29 = v28;
                objc_enumerationMutation(v50);
                v28 = v29;
              }
              v53 = v28;
              v30 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v28);
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              v67 = 0u;
              objc_msgSend(obja, "objectForKeyedSubscript:", v27);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKeyedSubscript:", v30);
              v55 = (id)objc_claimAutoreleasedReturnValue();

              v61 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
              if (v61)
              {
                v57 = *(_QWORD *)v65;
                do
                {
                  v32 = 0;
                  do
                  {
                    if (*(_QWORD *)v65 != v57)
                      objc_enumerationMutation(v55);
                    v33 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v32);
                    objc_msgSend(obja, "objectForKeyedSubscript:", v27);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "objectForKeyedSubscript:", v30);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "objectForKeyedSubscript:", v33);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ID FROM %@ WHERE subsystem='%@' AND category='%@'"), CFSTR("PLCoreStorage_Metadata"), v27, v30);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "performQuery:", v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((unint64_t)objc_msgSend(v38, "count") < 2)
                    {
                      if (objc_msgSend(v38, "count"))
                      {
                        v40 = v38;
                        goto LABEL_42;
                      }
                      sqlLog();
                      v41 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v85 = v27;
                        v86 = 2112;
                        v87 = v30;
                        _os_log_impl(&dword_1B6AB6000, v41, OS_LOG_TYPE_DEFAULT, "New subsystem category added: %@ %@", buf, 0x16u);
                      }

                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ (subsystem, category) VALUES ('%@', '%@')"), CFSTR("PLCoreStorage_Metadata"), v27, v30);
                      v39 = objc_claimAutoreleasedReturnValue();
                      v42 = (id)objc_msgSend(v63, "performQuery:returnValue:returnResult:", v39, 0, 0);
                      objc_msgSend(v63, "performQuery:", v37);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v40, "count") == 1)
                      {

LABEL_42:
                        objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("ID"));
                        v39 = objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v36, "data");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v36, "version");
                        objc_msgSend(v63, "writeMetadata:forFKID:build:name:version:", v44, v39, v62, v33);

                      }
                      else
                      {
                        sqlLog();
                        v45 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v85 = v27;
                          v86 = 2112;
                          v87 = v30;
                          _os_log_error_impl(&dword_1B6AB6000, v45, OS_LOG_TYPE_ERROR, "Failed to insert subsystem-category: %@ %@", buf, 0x16u);
                        }

                      }
                      v38 = v40;
                      goto LABEL_44;
                    }
                    sqlLog();
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v85 = v27;
                      v86 = 2112;
                      v87 = v30;
                      _os_log_error_impl(&dword_1B6AB6000, v39, OS_LOG_TYPE_ERROR, "Duplicate subsystem-category entries found: %@ %@", buf, 0x16u);
                    }
LABEL_44:

                    ++v32;
                  }
                  while (v61 != v32);
                  v46 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
                  v61 = v46;
                }
                while (v46);
              }

              v28 = v53 + 1;
            }
            while (v53 + 1 != v52);
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
          }
          while (v52);
        }

      }
      v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
    }
    while (v48);
  }

  objc_msgSend(v63, "endTransaction");
}

- (id)metricsToUpdateForStorage:(id)a3 processedMetrics:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id obj;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *context;
  uint64_t v69;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * from %@"), CFSTR("PLCoreStorage_Metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v5;
  objc_msgSend(v5, "performQuery:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v10 = v9;
  v11 = (void *)v7;
  obj = v10;
  v66 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
  if (v66)
  {
    v64 = *(_QWORD *)v81;
    v12 = 0x1E0CB3000uLL;
    v75 = (void *)v7;
    v72 = v6;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v81 != v64)
          objc_enumerationMutation(obj);
        v69 = v13;
        v14 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v13);
        context = (void *)MEMORY[0x1BCC9E9B4]();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("subsystem"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("category"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT FK_ID, name, max(version) as version FROM %@ WHERE FK_ID=%lu GROUP BY FK_ID,name"), CFSTR("PLCoreStorage_Metadata_Dynamic"), v18);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "performQuery:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v71 = v19;
        v11 = v75;
        v74 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
        if (v74)
        {
          v73 = *(_QWORD *)v77;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v77 != v73)
                objc_enumerationMutation(v71);
              v21 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v20);
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("name"));
              v22 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("version"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "doubleValue");
              v25 = v24;

              v26 = (void *)v22;
              objc_msgSend(MEMORY[0x1E0D70A08], "getMetadataForSubsystem:category:name:", v15, v16, v22);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (!v27 || (objc_msgSend(v27, "version"), v29 < v25))
              {
                objc_msgSend(*(id *)(v12 + 2024), "numberWithInteger:", v18);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "objectForKeyedSubscript:", v30);
                v31 = v12;
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v32)
                {
                  v33 = (void *)objc_opt_new();
                  objc_msgSend(*(id *)(v31 + 2024), "numberWithInteger:", v18);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, v34);

                }
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v31 + 2024), "numberWithInteger:", v18);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "objectForKeyedSubscript:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v35, v26);

                v6 = v72;
LABEL_16:

                v12 = 0x1E0CB3000;
                goto LABEL_17;
              }
              objc_msgSend(v28, "version");
              v6 = v72;
              if (v46 <= v25)
                goto LABEL_18;
              objc_msgSend(*(id *)(v12 + 2024), "numberWithInteger:", v18);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "objectForKeyedSubscript:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v48)
              {
                v49 = (void *)objc_opt_new();
                objc_msgSend(*(id *)(v12 + 2024), "numberWithInteger:", v18);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setObject:forKeyedSubscript:", v49, v50);

              }
              objc_msgSend(v28, "version");
              if ((int)v51 == (int)v25)
              {
                objc_msgSend(*(id *)(v12 + 2024), "numberWithInteger:", v18);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "objectForKeyedSubscript:", v52);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "setObject:forKeyedSubscript:", v28, v26);

                +[PPSEntryKey entryKeyForMetric:](PPSEntryKey, "entryKeyForMetric:", v28);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  -[PPSSQLStorage entryKeysToSetup](self, "entryKeysToSetup");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "addObject:", v35);
                  goto LABEL_16;
                }
LABEL_17:

LABEL_18:
                objc_msgSend(v6, "objectForKeyedSubscript:", v15);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v38)
                {
                  v39 = (void *)objc_opt_new();
                  objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, v15);

                }
                objc_msgSend(v6, "objectForKeyedSubscript:", v15);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "objectForKeyedSubscript:", v16);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v41)
                {
                  v42 = (void *)objc_opt_new();
                  objc_msgSend(v6, "objectForKeyedSubscript:", v15);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, v16);

                }
                objc_msgSend(v6, "objectForKeyedSubscript:", v15);
                v44 = objc_claimAutoreleasedReturnValue();
                -[NSObject objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v16);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v26);

                goto LABEL_23;
              }
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v12 + 2024), "numberWithInteger:", v18);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "objectForKeyedSubscript:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v54, v26);

              objc_msgSend(v72, "objectForKeyedSubscript:", v15);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectForKeyedSubscript:", v16);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v26);

              sqlLog();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v28, "subsystem");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "category");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v85 = v59;
                v86 = 2112;
                v87 = v60;
                v88 = 2112;
                v89 = v26;
                _os_log_debug_impl(&dword_1B6AB6000, v44, OS_LOG_TYPE_DEBUG, "Metric[%@:%@:%@] underwent a major version change. Dropping old metadata", buf, 0x20u);

              }
              v12 = 0x1E0CB3000;
LABEL_23:

              ++v20;
              v11 = v75;
            }
            while (v74 != v20);
            v61 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
            v74 = v61;
          }
          while (v61);
        }

        objc_autoreleasePoolPop(context);
        v13 = v69 + 1;
      }
      while (v69 + 1 != v66);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
    }
    while (v66);
  }

  return v11;
}

- (id)metricsToAddForStorage:(id)a3 processedMetrics:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  PPSSQLStorage *v45;
  id v46;
  id v47;
  id v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = a4;
  v46 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D70A08], "getAllSubsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self;
  v37 = v6;
  v49 = -[PPSSQLStorage storageForConnection:](self, "storageForConnection:", v6);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v7;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v61;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v61 != v39)
          objc_enumerationMutation(obj);
        v41 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0D70A08], "getMetadataByCategoryForSubsystem:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        if (v43)
        {
          v42 = *(_QWORD *)v57;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v57 != v42)
                objc_enumerationMutation(v10);
              v44 = v11;
              v12 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v11);
              v52 = 0u;
              v53 = 0u;
              v54 = 0u;
              v55 = 0u;
              objc_msgSend(v10, "objectForKeyedSubscript:", v12);
              v48 = (id)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
              if (v51)
              {
                v50 = *(_QWORD *)v53;
                do
                {
                  for (i = 0; i != v51; ++i)
                  {
                    if (*(_QWORD *)v53 != v50)
                      objc_enumerationMutation(v48);
                    v14 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
                    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "objectForKeyedSubscript:", v14);
                    v16 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v16, "storage") == v49)
                    {
                      objc_msgSend(v47, "objectForKeyedSubscript:", v9);
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "objectForKeyedSubscript:", v12);
                      v18 = v9;
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "objectForKeyedSubscript:", v14);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 = objc_msgSend(v20, "BOOLValue");

                      v9 = v18;
                      if ((v21 & 1) == 0)
                      {
                        objc_msgSend(v46, "objectForKeyedSubscript:", v18);
                        v22 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v22)
                        {
                          v23 = (void *)objc_opt_new();
                          objc_msgSend(v46, "setObject:forKeyedSubscript:", v23, v18);

                        }
                        objc_msgSend(v46, "objectForKeyedSubscript:", v18);
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v24, "objectForKeyedSubscript:", v12);
                        v25 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v25)
                        {
                          v26 = (void *)objc_opt_new();
                          objc_msgSend(v46, "objectForKeyedSubscript:", v18);
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v12);

                        }
                        objc_msgSend(v10, "objectForKeyedSubscript:", v12);
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v28, "objectForKeyedSubscript:", v14);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v46, "objectForKeyedSubscript:", v18);
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v30, "objectForKeyedSubscript:", v12);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, v14);

                        objc_msgSend(v10, "objectForKeyedSubscript:", v12);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v32, "objectForKeyedSubscript:", v14);
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        +[PPSEntryKey entryKeyForMetric:](PPSEntryKey, "entryKeyForMetric:", v33);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v34)
                        {
                          -[PPSSQLStorage entryKeysToSetup](v45, "entryKeysToSetup");
                          v35 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v35, "addObject:", v34);

                        }
                        v9 = v18;
                      }
                    }

                  }
                  v51 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                }
                while (v51);
              }

              v11 = v44 + 1;
            }
            while (v44 + 1 != v43);
            v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          }
          while (v43);
        }

        v8 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v40);
  }

  return v46;
}

- (void)deleteOldMetadataStore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "deleteOldMetadataStore: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setupStorageForEntryKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PPSSQLStorage connectionForKey:](self, "connectionForKey:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "tableExistsForTableName:", v9) & 1) == 0)
    -[PPSSQLStorage setupTableForEntryKey:](self, "setupTableForEntryKey:", v9);
  if (+[PPSEntryKey hasDynamicKeys:](PPSEntryKey, "hasDynamicKeys:", v9))
  {
    +[PPSEntryKey dynamicTableNameForEntryKey:](PPSEntryKey, "dynamicTableNameForEntryKey:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSSQLStorage setupDynamicTableForEntryKey:withName:withConnection:](self, "setupDynamicTableForEntryKey:withName:withConnection:", v9, v5, v4);

  }
  if (+[PPSEntryKey hasArrayKeys:](PPSEntryKey, "hasArrayKeys:", v9))
    -[PPSSQLStorage setupArrayTableForEntryKey:withName:withConnection:](self, "setupArrayTableForEntryKey:withName:withConnection:", v9, v9, v4);
  -[PPSSQLStorage entryKeysToSetup](self, "entryKeysToSetup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v9);

  if (v7)
  {
    -[PPSSQLStorage handleSchemaMismatchForTable:](self, "handleSchemaMismatchForTable:", v9);
    -[PPSSQLStorage entryKeysToSetup](self, "entryKeysToSetup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v9);

  }
}

- (void)handleSchemaMismatchForTable:(id)a3
{
  id v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  id obj;
  PPSSQLStorage *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  NSObject *v69;
  void *v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  id v97;
  __int16 v98;
  id v99;
  __int16 v100;
  id v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61 = self;
  -[PPSSQLStorage connectionForKey:](self, "connectionForKey:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &off_1E6A51000;
  if (+[PPSEntryKey hasDynamicKeys:](PPSEntryKey, "hasDynamicKeys:", v4))
  {
    +[PPSEntryKey dynamicTableNameForEntryKey:](PPSEntryKey, "dynamicTableNameForEntryKey:", v4);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:");
  }
  else
  {
    v57 = 0;
  }
  v65 = v4;
  v59 = +[PPSEntryKey hasArrayKeys:](PPSEntryKey, "hasArrayKeys:", v4);
  if (v59)
  {
    +[PPSEntryKey arrayMetricsForEntryKey:](PPSEntryKey, "arrayMetricsForEntryKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
    if (v8)
    {
      v9 = v8;
      v58 = 0;
      v10 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v91 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "fixedArraySize");

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Array_%@"), v4, v12);
            v15 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "addObject:", v15);
            v58 = (void *)v15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
      }
      while (v9);
    }
    else
    {
      v58 = 0;
    }

    v6 = &off_1E6A51000;
  }
  else
  {
    v58 = 0;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v5;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
  if (v63)
  {
    v16 = 0x1E0C99000uLL;
    v62 = *(_QWORD *)v87;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v87 != v62)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v17);
        objc_msgSend(*(id *)(v16 + 3592), "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "tableInfo:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v18;
        v67 = v20;
        if (objc_msgSend(v18, "isEqualToString:", v4))
        {
          objc_msgSend(v6[82], "baseMetricsForEntryKey:", v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addEntriesFromDictionary:", v21);

          if (v59)
          {
            objc_msgSend(v6[82], "arrayMetricsForEntryKey:", v4);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = 0u;
            v83 = 0u;
            v84 = 0u;
            v85 = 0u;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v83;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v83 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
                  objc_msgSend(v22, "objectForKeyedSubscript:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = v28;
                  if (v28 && objc_msgSend(v28, "fixedArraySize"))
                    objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, v27);

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
              }
              while (v24);
              v20 = v67;
            }
            goto LABEL_41;
          }
        }
        else
        {
          if (objc_msgSend(v18, "containsString:", CFSTR("_Dynamic")))
          {
            objc_msgSend(v6[82], "dynamicMetricsForEntryKey:", v4);
            v30 = objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
          if (objc_msgSend(v4, "containsString:", CFSTR("_Array")))
          {
            objc_msgSend(v6[82], "arrayMetricsForEntryKey:", v4);
            v30 = objc_claimAutoreleasedReturnValue();
LABEL_40:
            v22 = (void *)v30;
            objc_msgSend(v19, "addEntriesFromDictionary:", v30);
LABEL_41:

          }
        }
        objc_msgSend(*(id *)(v16 + 3592), "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = MEMORY[0x1E0C809B0];
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke;
        v76[3] = &unk_1E6A53EE8;
        v36 = v19;
        v77 = v36;
        v37 = v31;
        v78 = v37;
        v38 = v33;
        v79 = v38;
        v39 = v32;
        v80 = v39;
        v40 = v34;
        v81 = v40;
        objc_msgSend(v20, "enumerateObjectsUsingBlock:", v76);
        v41 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(v36, "allKeys");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setWithArray:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v37, "allKeys");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setWithArray:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "minusSet:", v46);

        objc_msgSend(v43, "minusSet:", v40);
        v72[0] = v35;
        v72[1] = 3221225472;
        v72[2] = __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke_2;
        v72[3] = &unk_1E6A53F10;
        v47 = v36;
        v73 = v47;
        v48 = v43;
        v74 = v48;
        v49 = v39;
        v75 = v49;
        objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v72);
        if (objc_msgSend(v49, "count") || objc_msgSend(v38, "count"))
        {
          sqlLog();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            v95 = v66;
            v96 = 2112;
            v97 = v49;
            v98 = 2112;
            v99 = v38;
            v100 = 2112;
            v101 = v48;
            _os_log_debug_impl(&dword_1B6AB6000, v50, OS_LOG_TYPE_DEBUG, "SchemaMismatch: table: %@ deleted: %@ typechange: %@ new: %@", buf, 0x2Au);
          }

          v51 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v47, "allKeys");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setWithArray:", v52);
          v53 = objc_claimAutoreleasedReturnValue();

          -[NSObject minusSet:](v53, "minusSet:", v49);
          -[NSObject minusSet:](v53, "minusSet:", v38);
          -[NSObject minusSet:](v53, "minusSet:", v48);
          -[PPSSQLStorage updateTable:transferDataForKeys:](v61, "updateTable:transferDataForKeys:", v66, v53);
          v4 = v65;
        }
        else
        {
          v54 = objc_msgSend(v48, "count");
          sqlLog();
          v53 = objc_claimAutoreleasedReturnValue();
          v55 = os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
          if (v54)
          {
            v4 = v65;
            if (v55)
            {
              *(_DWORD *)buf = 138412546;
              v95 = v66;
              v96 = 2112;
              v97 = v48;
              _os_log_debug_impl(&dword_1B6AB6000, v53, OS_LOG_TYPE_DEBUG, "SchemaMismatch: table: %@ newMetrics: %@", buf, 0x16u);
            }

            v68[0] = MEMORY[0x1E0C809B0];
            v68[1] = 3221225472;
            v68[2] = __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke_116;
            v68[3] = &unk_1E6A53F38;
            v69 = v47;
            v70 = v66;
            v71 = v64;
            objc_msgSend(v48, "enumerateObjectsUsingBlock:", v68);

            v53 = v69;
          }
          else
          {
            v4 = v65;
            if (v55)
            {
              *(_DWORD *)buf = 138412290;
              v95 = v66;
              _os_log_debug_impl(&dword_1B6AB6000, v53, OS_LOG_TYPE_DEBUG, "SchemaMismatch: table: %@ metrics modified", buf, 0xCu);
            }
          }
        }

        ++v17;
        v6 = &off_1E6A51000;
        v16 = 0x1E0C99000;
      }
      while (v17 != v63);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
      v63 = v56;
    }
    while (v56);
  }

}

void __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  if (v5
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("ID")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("timestamp")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("FK_ID")) & 1) == 0)
  {
    objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("_[0-9.]+$"), 1024);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v7, v8, &stru_1E6A56538);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(a1[4], "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10
            && objc_msgSend(v10, "auxiliaryType") == 3
            && objc_msgSend(v11, "fixedArraySize"))
          {
            objc_msgSend(a1[4], "setObject:forKey:", v11, v5);
            objc_msgSend(a1[5], "objectForKeyedSubscript:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v13, v9);

            }
            objc_msgSend(a1[5], "objectForKeyedSubscript:", v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v5);

          }
        }

      }
    }
    objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("type"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)PLVTypeToPLSQLiteType_0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "datatype"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v19, "isEqualToString:", v16) & 1) == 0)
        objc_msgSend(a1[6], "addObject:", v5);

    }
    else
    {
      objc_msgSend(a1[7], "addObject:", v5);
    }
    objc_msgSend(a1[8], "addObject:", v5);

  }
}

void __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "auxiliaryType") == 3)
  {
    v7 = objc_msgSend(v6, "fixedArraySize");
    v8 = objc_msgSend(v5, "count");
    v9 = objc_msgSend(v6, "fixedArraySize");
    if (v8 >= v7)
    {
      if (objc_msgSend(v5, "count") > (unint64_t)v9)
      {
        v12 = objc_msgSend(v6, "fixedArraySize");
        if (objc_msgSend(v5, "count") > (unint64_t)v12)
        {
          v13 = v12;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), v15, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "addObject:", v14);

            ++v13;
          }
          while (objc_msgSend(v5, "count") > v13);
        }
      }
    }
    else if (v9)
    {
      v10 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), v15, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(a1[4], "setObject:forKey:", v6, v11);
          objc_msgSend(a1[5], "addObject:", v11);
        }

        v10 = (v10 + 1);
      }
      while (v10 < objc_msgSend(v6, "fixedArraySize"));
    }
  }

}

void __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke_116(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)PLVTypeToPLSQLiteType_0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "datatype"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("ALTER TABLE '%@' ADD COLUMN '%@' %@;"), v6, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(*(id *)(a1 + 48), "performQuery:", v10);
}

- (void)setupTableForEntryKey:(id)a3
{
  -[PPSSQLStorage setupTableForEntryKey:withName:](self, "setupTableForEntryKey:withName:", a3, a3);
}

- (void)setupTableForEntryKey:(id)a3 withName:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  unint64_t v15;
  const __CFString *v16;
  void **p_cache;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void **v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id obj;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = a4;
  -[PPSSQLStorage connectionForKey:](self, "connectionForKey:", v6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSEntryKey baseMetricsForEntryKey:](PPSEntryKey, "baseMetricsForEntryKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v47 = v6;
  +[PPSEntryKey arrayMetricsForEntryKey:](PPSEntryKey, "arrayMetricsForEntryKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v7;
  objc_msgSend(v9, "addEntriesFromDictionary:", v7);
  v44 = (void *)v8;
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);
  v50 = v9;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingSelector:", sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "addObject:", &unk_1E6AF72A0);
  v55 = v12;
  objc_msgSend(v12, "addObject:", &unk_1E6AF72C8);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v11;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v51)
  {
    v13 = CFSTR("column-name");
    v49 = *(_QWORD *)v58;
    v14 = CFSTR("%@_%d");
    v15 = 0x1E0CB3000uLL;
    v16 = CFSTR("type");
    p_cache = &OBJC_METACLASS___PLDarkWakeState.cache;
    v18 = 0x1E0CB3000uLL;
    v19 = 0x1E0C99000uLL;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v58 != v49)
          objc_enumerationMutation(obj);
        v53 = v20;
        v21 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v20);
        objc_msgSend(v50, "objectForKeyedSubscript:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "auxiliaryType") == 3 && objc_msgSend(v22, "fixedArraySize"))
        {
          if (objc_msgSend(v22, "fixedArraySize"))
          {
            v23 = v21;
            v24 = 0;
            v56 = v22;
            v54 = v23;
            do
            {
              v63[0] = v13;
              objc_msgSend(*(id *)(v15 + 2368), "stringWithFormat:", v14, v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v63[1] = v16;
              v64[0] = v25;
              v26 = p_cache[411];
              v27 = v14;
              objc_msgSend(*(id *)(v18 + 2024), "numberWithInt:", objc_msgSend(v56, "datatype"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v64[1] = v29;
              objc_msgSend(*(id *)(v19 + 3456), "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
              v30 = v18;
              v31 = p_cache;
              v32 = v16;
              v33 = v13;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "addObject:", v34);

              v13 = v33;
              v16 = v32;
              p_cache = v31;
              v18 = v30;
              v19 = 0x1E0C99000;

              v14 = v27;
              v15 = 0x1E0CB3000;

              v22 = v56;
              v24 = (v24 + 1);
              v35 = objc_msgSend(v56, "fixedArraySize");
              v23 = v54;
            }
            while (v24 < v35);
          }
        }
        else if (v52)
        {
          objc_msgSend(v52, "objectForKeyedSubscript:", v21);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            v61[1] = v16;
            v62[0] = v21;
            v61[0] = v13;
            v37 = p_cache[411];
            objc_msgSend(*(id *)(v18 + 2024), "numberWithInt:", objc_msgSend(v22, "datatype"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v62[1] = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
            v40 = v22;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "addObject:", v41);

            v22 = v40;
            v19 = 0x1E0C99000;
          }
        }

        v20 = v53 + 1;
      }
      while (v53 + 1 != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v51);
  }

  sqlLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    -[PPSSQLStorage setupTableForEntryKey:withName:].cold.2();

  sqlLog();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    -[PPSSQLStorage setupTableForEntryKey:withName:].cold.1();

  objc_msgSend(v45, "createTableName:withColumns:", v46, v55);
}

- (void)setupDynamicTableForEntryKey:(id)a3 withName:(id)a4 withConnection:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v23 = a4;
  v22 = a5;
  +[PPSEntryKey dynamicMetricsForEntryKey:](PPSEntryKey, "dynamicMetricsForEntryKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "addObject:", &unk_1E6AF72F0);
  objc_msgSend(v9, "addObject:", &unk_1E6AF7318);
  v24 = v7;
  +[PPSEntryKey allDynamicKeysForEntryKey:](PPSEntryKey, "allDynamicKeysForEntryKey:", v7);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = CFSTR("column-name");
        v30[1] = CFSTR("type");
        v31[0] = v14;
        v16 = (void *)PLVTypeToPLSQLiteType_0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "datatype"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v19);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v11);
  }
  sqlLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[PPSSQLStorage setupTableForEntryKey:withName:].cold.2();

  sqlLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[PPSSQLStorage setupTableForEntryKey:withName:].cold.1();

  objc_msgSend(v22, "createTableName:withColumns:", v23, v9);
  objc_msgSend(v22, "createCompositeIndexOnTable:forColumns:", v23, &unk_1E6AF5F18);

}

- (void)setupArrayTableForEntryKey:(id)a3 withName:(id)a4 withConnection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[PPSEntryKey arrayMetricsForEntryKey:](PPSEntryKey, "arrayMetricsForEntryKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v7;
  +[PPSEntryKey allArrayKeysForEntryKey:](PPSEntryKey, "allArrayKeysForEntryKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0x1E0CB3000uLL;
    v33 = *(_QWORD *)v35;
    v30 = v10;
    v31 = v8;
    do
    {
      v15 = 0;
      v32 = v13;
      do
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v15);
        objc_msgSend(v10, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "fixedArraySize"))
        {
          v18 = (void *)objc_opt_new();
          objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR("%@_Array_%@"), v8, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "tableExistsForTableName:", v19) & 1) == 0)
          {
            objc_msgSend(v18, "addObject:", &unk_1E6AF7340);
            objc_msgSend(v18, "addObject:", &unk_1E6AF7368);
            v39[0] = CFSTR("column-name");
            objc_msgSend(v17, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v39[1] = CFSTR("type");
            v40[0] = v20;
            v21 = v11;
            v22 = v9;
            v23 = (void *)PLVTypeToPLSQLiteType_0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "datatype"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v40[1] = v25;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v26);

            v9 = v22;
            v11 = v21;

            v14 = 0x1E0CB3000;
            objc_msgSend(v9, "createTableName:withColumns:", v19, v18);
            v38[0] = CFSTR("FK_ID");
            objc_msgSend(v17, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v38[1] = v27;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "createCompositeIndexOnTable:forColumns:", v19, v28);

            v10 = v30;
            v8 = v31;
          }

          v13 = v32;
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v13);
  }

}

- (BOOL)updateTable:(id)a3 transferDataForKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(CFSTR("PPSTmp_"), "stringByAppendingString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsString:", CFSTR("_Dynamic")))
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    v10 = objc_msgSend(v9, "length") - 8;
LABEL_5:
    objc_msgSend(v9, "substringToIndex:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (objc_msgSend(v6, "containsString:", CFSTR("_Array")))
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("_Array_"));
    goto LABEL_5;
  }
  v11 = v6;
LABEL_7:
  -[PPSSQLStorage connectionForKey:](self, "connectionForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginTransaction");
  objc_msgSend(v7, "addObject:", CFSTR("ID"));
  if (objc_msgSend(v6, "containsString:", CFSTR("_Dynamic")))
  {
    objc_msgSend(v7, "addObject:", CFSTR("FK_ID"));
    -[PPSSQLStorage setupDynamicTableForEntryKey:withName:withConnection:](self, "setupDynamicTableForEntryKey:withName:withConnection:", v11, v8, v12);
  }
  else if (objc_msgSend(v6, "containsString:", CFSTR("_Array")))
  {
    objc_msgSend(v7, "addObject:", CFSTR("FK_ID"));
    objc_msgSend(CFSTR("PPSTmp_"), "stringByAppendingString:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSSQLStorage setupArrayTableForEntryKey:withName:withConnection:](self, "setupArrayTableForEntryKey:withName:withConnection:", v11, v13, v12);

  }
  else
  {
    objc_msgSend(v7, "addObject:", CFSTR("timestamp"));
    -[PPSSQLStorage setupTableForEntryKey:withName:](self, "setupTableForEntryKey:withName:", v11, v8);
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __49__PPSSQLStorage_updateTable_transferDataForKeys___block_invoke;
  v24[3] = &unk_1E6A53F60;
  v15 = v14;
  v25 = v15;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);
  objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO %@ (%@) SELECT %@ FROM %@"), v8, v16, v16, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sqlLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[PPSSQLStorage updateTable:transferDataForKeys:].cold.1();

  v19 = (id)objc_msgSend(v12, "performQuery:", v17);
  objc_msgSend(v12, "dropTable:", v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE %@ RENAME TO %@"), v8, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sqlLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v20;
    _os_log_impl(&dword_1B6AB6000, v21, OS_LOG_TYPE_DEFAULT, "UpdateTable alter query %@", buf, 0xCu);
  }

  v22 = (id)objc_msgSend(v12, "performQuery:", v20);
  objc_msgSend(v12, "endTransaction");

  return 1;
}

uint64_t __49__PPSSQLStorage_updateTable_transferDataForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
}

- (id)PLSQLConnection
{
  void *v2;
  void *v3;

  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E6ABADD8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)EPSQLConnection
{
  void *v2;
  void *v3;

  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E6ABADC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)PreUnlockEPSQLConnection
{
  void *v2;
  void *v3;

  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E6ABADC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)CESQLConnection
{
  void *v2;
  void *v3;

  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E6ABADF0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)XCSQLConnection
{
  void *v2;
  void *v3;

  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E6ABAE08);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)BGSQLConnection
{
  void *v2;
  void *v3;

  -[PPSSQLStorage connectionByStorage](self, "connectionByStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E6ABAE20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)storageForConnection:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;

  v4 = a3;
  -[PPSSQLStorage PLSQLConnection](self, "PLSQLConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v11 = 2;
  }
  else
  {
    -[PPSSQLStorage EPSQLConnection](self, "EPSQLConnection");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4
      || (-[PPSSQLStorage PreUnlockEPSQLConnection](self, "PreUnlockEPSQLConnection"),
          v7 = (id)objc_claimAutoreleasedReturnValue(),
          v7,
          v7 == v4))
    {
      v11 = 1;
    }
    else
    {
      -[PPSSQLStorage CESQLConnection](self, "CESQLConnection");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
      {
        v11 = 3;
      }
      else
      {
        -[PPSSQLStorage XCSQLConnection](self, "XCSQLConnection");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == v4)
        {
          v11 = 4;
        }
        else
        {
          -[PPSSQLStorage BGSQLConnection](self, "BGSQLConnection");
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v10 == v4)
            v11 = 5;
          else
            v11 = 0;
        }
      }
    }
  }

  return v11;
}

- (void)closeAllConnections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PPSSQLStorage PLSQLConnection](self, "PLSQLConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "closeConnection");

  -[PPSSQLStorage EPSQLConnection](self, "EPSQLConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeConnection");

  -[PPSSQLStorage CESQLConnection](self, "CESQLConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closeConnection");

  -[PPSSQLStorage XCSQLConnection](self, "XCSQLConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "closeConnection");

  -[PPSSQLStorage BGSQLConnection](self, "BGSQLConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "closeConnection");

}

- (void)setupFolders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v4;
  objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("ExtendedPersistence/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PLUtilities shouldLogPreUnlockTelemetry](PLUtilities, "shouldLogPreUnlockTelemetry"))
  {
    objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("PreUnlock/"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", CFSTR("CleanEnergy/"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v15);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", CFSTR("BackgroundProcessing/"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        +[PLUtilities createAndChownDirectory:](PLUtilities, "createAndChownDirectory:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23++), (_QWORD)v28);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0CB2AD8];
  v33 = *MEMORY[0x1E0CB2AE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAttributes:ofItemAtPath:error:", v25, v27, 0);

}

- (void)setupDBConnections
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Invalid connection to Clean Energy DB", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (id)setupDBConnectionAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  PLSQLiteConnection *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D70A10], "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("PreUnlock/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("PreUnlockLog.EPSQL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqualToString:", v7);

  v9 = [PLSQLiteConnection alloc];
  if (v8)
    v10 = -[PLSQLiteConnection initWithFilePath:withFlags:](v9, "initWithFilePath:withFlags:", v3, &unk_1E6AF5F30);
  else
    v10 = -[PLSQLiteConnection initWithFilePath:](v9, "initWithFilePath:", v3);
  v11 = (void *)v10;
  if (!v10)
  {
    sqlLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PPSSQLStorage setupDBConnectionAtPath:].cold.1();

    +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 101);
  }

  return v11;
}

+ (id)trimConditionsForPLSQLWithTrimDate:(id)a3
{
  return (id)objc_msgSend(a1, "trimConditionsForStorage:trimDate:", 2, a3);
}

+ (id)trimConditionsForEPSQLWithTrimDate:(id)a3
{
  return (id)objc_msgSend(a1, "trimConditionsForStorage:trimDate:", 1, a3);
}

+ (id)trimConditionsForCESQLWithTrimDate:(id)a3
{
  return (id)objc_msgSend(a1, "trimConditionsForStorage:trimDate:", 3, a3);
}

+ (id)trimConditionsForXCSQLWithTrimDate:(id)a3
{
  return (id)objc_msgSend(a1, "trimConditionsForStorage:trimDate:", 4, a3);
}

+ (id)trimConditionsForBGSQLWithTrimDate:(id)a3
{
  return (id)objc_msgSend(a1, "trimConditionsForStorage:trimDate:", 5, a3);
}

+ (id)trimConditionsForStorage:(int)a3 trimDate:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(v5, "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  objc_msgSend(v6, "timeIntervalSince1970");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSEntryKey allEntryKeysForStorage:](PPSEntryKey, "allEntryKeysForStorage:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__PPSSQLStorage_trimConditionsForStorage_trimDate___block_invoke;
  v17[3] = &unk_1E6A53F88;
  v19 = v11;
  v20 = v9;
  v14 = v12;
  v18 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
  sqlLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    +[PPSSQLStorage trimConditionsForStorage:trimDate:].cold.1((uint64_t)v14, v4, v15);

  return v14;
}

void __51__PPSSQLStorage_trimConditionsForStorage_trimDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  +[PPSSQLStorage trimConditionsForEntryKey:trimDate:currDate:](PPSSQLStorage, "trimConditionsForEntryKey:trimDate:currDate:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

}

+ (id)trimConditionsForEntryKey:(id)a3 trimDate:(double)a4 currDate:(double)a5
{
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = a3;
  v8 = +[PPSEntryKey timeToLiveForEntryKey:](PPSEntryKey, "timeToLiveForEntryKey:", v7);
  if (+[PPSEntryKey directionalityForEntryKey:](PPSEntryKey, "directionalityForEntryKey:", v7) == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is NULL OR %@<(SELECT max(%@) FROM '%@' WHERE %@<%f)"), CFSTR("timestamp"), CFSTR("timestamp"), CFSTR("timestamp"), v7, CFSTR("timestamp"), *(_QWORD *)&a4);
  }
  else
  {
    v9 = a5 + (double)v8 * -86400.0;
    if (v9 > a4)
      v9 = a4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ is NULL OR %@<%f)"), CFSTR("timestamp"), CFSTR("timestamp"), *(_QWORD *)&v9, v12, v13, v14);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)storageStarted
{
  return self->_storageStarted;
}

- (void)setStorageStarted:(BOOL)a3
{
  self->_storageStarted = a3;
}

- (void)setConnectionByStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableSet)entryKeysToSetup
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEntryKeysToSetup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryKeysToSetup, 0);
  objc_storeStrong((id *)&self->_connectionByStorage, 0);
}

- (void)updateMetadata:(void *)a1 updateMetrics:addMetrics:.cold.1(void *a1)
{
  _DWORD *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_7_0(a1);
  sqlLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_9(v5))
  {
    *v1 = 138412290;
    *v2 = v4;
    OUTLINED_FUNCTION_4_5(&dword_1B6AB6000, v6, v7, "Exception occurred while adding metadata, %@");
  }

  objc_end_catch();
  OUTLINED_FUNCTION_10_0();
}

- (void)updateMetadata:(void *)a1 updateMetrics:addMetrics:.cold.2(void *a1)
{
  _DWORD *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_7_0(a1);
  sqlLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_9(v5))
  {
    *v1 = 138412290;
    *v2 = v4;
    OUTLINED_FUNCTION_4_5(&dword_1B6AB6000, v6, v7, "Exception occurred while updating metadata, %@");
  }

  objc_end_catch();
  OUTLINED_FUNCTION_10_0();
}

- (void)setupTableForEntryKey:withName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "tableSchemaColumns: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setupTableForEntryKey:withName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "tableName: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateTable:transferDataForKeys:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "UpdateTable insert query %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setupDBConnectionAtPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "no connection to DB: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)trimConditionsForStorage:(os_log_t)log trimDate:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_DEBUG, "Storage: %d, trimFilters: %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

@end

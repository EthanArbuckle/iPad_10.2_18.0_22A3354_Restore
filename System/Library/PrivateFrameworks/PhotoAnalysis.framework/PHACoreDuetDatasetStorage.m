@implementation PHACoreDuetDatasetStorage

- (PHACoreDuetDatasetStorage)init
{
  PHACoreDuetDatasetStorage *v2;
  uint64_t v3;
  _DKKnowledgeSaving *knowledgeStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHACoreDuetDatasetStorage;
  v2 = -[PHACoreDuetDatasetStorage init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v3 = objc_claimAutoreleasedReturnValue();
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeSaving *)v3;

  }
  return v2;
}

- (void)addSample:(id)a3 toDataset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PHACoreDuetDatasetStorage _getEventStreamForDatasetName:](self, "_getEventStreamForDatasetName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D15A38];
  objc_msgSend(MEMORY[0x1E0D159D8], "typeForName:", CFSTR("PFLDatasetSampleSchemaVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifierWithString:type:", CFSTR("PFLDatasetSample-v1.0"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = CFSTR("_DKPhotosMetadataKey.identifier");
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = CFSTR("_DKPhotosMetadataKey.subset");
  v32[0] = v12;
  objc_msgSend(v7, "subset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D159F8];
  objc_msgSend(v7, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "eventWithStream:startDate:endDate:value:metadata:", v8, v16, v17, v11, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHACoreDuetDatasetStorage knowledgeStore](self, "knowledgeStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  LOBYTE(v17) = objc_msgSend(v19, "saveObjects:error:", v20, &v23);
  v21 = v23;

  if ((v17 & 1) == 0)
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_1204);
    v22 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v25 = v6;
      v26 = 1024;
      v27 = 0;
      v28 = 2112;
      v29 = v21;
      _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "Failed to save sample to dataset %@. OK Value: %d, error: %@.", buf, 0x1Cu);
    }
  }

}

- (id)samplesForDataset:(id)a3 subset:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PHACoreDuetDatasetSample *v28;
  void *v29;
  PHACoreDuetDatasetSample *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint32_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  void *v56;
  _QWORD v57[4];

  v57[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D15A08]);
  v44 = v6;
  -[PHACoreDuetDatasetStorage _getEventStreamForDatasetName:](self, "_getEventStreamForDatasetName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventStreams:", v10);

  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v12);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForObjectsWithMetadataKey:andStringValue:", CFSTR("_DKPhotosMetadataKey.subset"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v13);

  }
  objc_msgSend(v8, "setLimit:", 250);
  -[PHACoreDuetDatasetStorage knowledgeStore](self, "knowledgeStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v14, "executeQuery:error:", v8, &v50);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v50;
  v17 = v16;
  if (v15)
  {
    v40 = v16;
    v41 = v14;
    v42 = v8;
    v43 = v7;
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v39 = v15;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (!v19)
      goto LABEL_24;
    v20 = v19;
    v21 = *(_QWORD *)v47;
    while (1)
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v47 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v22);
        objc_msgSend(v23, "metadata");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", CFSTR("_DKPhotosMetadataKey.identifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "metadata");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", CFSTR("_DKPhotosMetadataKey.subset"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = [PHACoreDuetDatasetSample alloc];
            objc_msgSend(v23, "startDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[PHACoreDuetDatasetSample initWithIdentifier:andDate:forSubset:](v28, "initWithIdentifier:andDate:forSubset:", v25, v29, v27);

            objc_msgSend(v45, "addObject:", v30);
            goto LABEL_19;
          }
          if (__PXLog_genericOnceToken != -1)
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_21);
          v35 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v53 = v44;
            v54 = 2112;
            v55 = v25;
            v32 = v35;
            v33 = "Failed to retrieve item from dataset %@. Sample identifier is not a string: %@.";
            v34 = 22;
            goto LABEL_22;
          }
        }
        else
        {
          if (__PXLog_genericOnceToken != -1)
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_18);
          v31 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v44;
            v32 = v31;
            v33 = "Failed to retrieve item from dataset %@. Sample identifier is nil.";
            v34 = 12;
LABEL_22:
            _os_log_error_impl(&dword_1CAC16000, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
          }
        }
LABEL_19:

        ++v22;
      }
      while (v20 != v22);
      v36 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      v20 = v36;
      if (!v36)
      {
LABEL_24:

        v8 = v42;
        v7 = v43;
        v17 = v40;
        v14 = v41;
        v15 = v39;
        goto LABEL_30;
      }
    }
  }
  if (__PXLog_genericOnceToken != -1)
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_15);
  v37 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v53 = v44;
    v54 = 2112;
    v55 = v17;
    _os_log_error_impl(&dword_1CAC16000, v37, OS_LOG_TYPE_ERROR, "Failed to query items from dataset %@. Error: %@.", buf, 0x16u);
  }
  v45 = (id)MEMORY[0x1E0C9AA60];
LABEL_30:

  return v45;
}

- (PHACoreDuetDatasetStorage)initWithKnowledgeStore:(id)a3
{
  id v5;
  PHACoreDuetDatasetStorage *v6;
  PHACoreDuetDatasetStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHACoreDuetDatasetStorage;
  v6 = -[PHACoreDuetDatasetStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);

  return v7;
}

- (id)_getEventStreamForDatasetName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D159D8];
  v4 = a3;
  objc_msgSend(v3, "typeForName:", CFSTR("PFLDatasetSampleSchemaVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A18], "eventStreamWithName:valueType:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

void __54__PHACoreDuetDatasetStorage_samplesForDataset_subset___block_invoke_20()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __54__PHACoreDuetDatasetStorage_samplesForDataset_subset___block_invoke_17()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __54__PHACoreDuetDatasetStorage_samplesForDataset_subset___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __49__PHACoreDuetDatasetStorage_addSample_toDataset___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

@end

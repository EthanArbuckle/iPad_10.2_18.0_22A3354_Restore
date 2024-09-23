@implementation HVDataSourceContentState

- (HVDataSourceContentState)initWithDataSource:(unsigned int)a3 basePath:(id)a4
{
  uint64_t v4;
  id v6;
  HVDataSourceContentState *v7;
  HVDataSourceContentState *v8;
  uint64_t v9;
  NSString *path;
  void *v11;
  char v12;
  id v13;
  NSString *v14;
  void *v15;
  id v16;
  HVPBDataSourceContentState *v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  HVContentState *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HVContentState *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  HVContentState *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HVContentState *v47;
  void *v48;
  NSObject *v49;
  NSString *v50;
  NSObject *v51;
  NSString *v52;
  NSObject *v53;
  NSString *v54;
  NSMutableDictionary *deferredContentStates;
  uint64_t v56;
  NSData *fileContentsHash;
  NSString *v59;
  HVPBDataSourceContentState *v60;
  id v61;
  void *v62;
  HVDataSourceContentState *v63;
  id v64;
  id obj;
  id obja;
  uint64_t v67;
  uint64_t v68;
  objc_super v69;
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
  id v82;
  uint8_t v83[4];
  NSString *v84;
  uint8_t v85[128];
  uint8_t buf[4];
  NSString *v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v4 = *(_QWORD *)&a3;
  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v69.receiver = self;
  v69.super_class = (Class)HVDataSourceContentState;
  v7 = -[HVDataSourceContentState init](&v69, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_dataSource = v4;
    +[HVDataSourceContentState _pathForDataSource:basePath:]((uint64_t)HVDataSourceContentState, v4, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    path = v8->_path;
    v8->_path = (NSString *)v9;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v8->_path);

    if ((v12 & 1) != 0)
    {
      v13 = objc_alloc(MEMORY[0x24BDBCE50]);
      v14 = v8->_path;
      v82 = 0;
      v15 = (void *)objc_msgSend(v13, "initWithContentsOfFile:options:error:", v14, 1, &v82);
      v16 = v82;
      if (v15)
      {
        v17 = -[HVPBDataSourceContentState initWithData:]([HVPBDataSourceContentState alloc], "initWithData:", v15);
        if (v17)
        {
          v18 = (NSMutableDictionary *)objc_opt_new();
          v63 = v8;
          v64 = v6;
          v61 = v16;
          v62 = v15;
          v60 = v17;
          if (-[HVPBDataSourceContentState deferredContentStatesCount](v17, "deferredContentStatesCount"))
          {
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            -[HVPBDataSourceContentState deferredContentStates](v17, "deferredContentStates");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, buf, 16);
            if (v19)
            {
              v20 = v19;
              v67 = *(_QWORD *)v79;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v79 != v67)
                    objc_enumerationMutation(obj);
                  v22 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
                  v23 = [HVContentState alloc];
                  v24 = objc_alloc(MEMORY[0x24BDBCF20]);
                  objc_msgSend(v22, "state");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "consumers");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = (void *)objc_msgSend(v24, "initWithArray:", v26);
                  objc_msgSend(v22, "state");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = -[HVContentState initWithConsumers:levelOfService:](v23, "initWithConsumers:levelOfService:", v27, objc_msgSend(v28, "levelOfService"));

                  v76 = 0u;
                  v77 = 0u;
                  v74 = 0u;
                  v75 = 0u;
                  objc_msgSend(v22, "uniqueIds");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
                  if (v31)
                  {
                    v32 = v31;
                    v33 = *(_QWORD *)v75;
                    do
                    {
                      for (j = 0; j != v32; ++j)
                      {
                        if (*(_QWORD *)v75 != v33)
                          objc_enumerationMutation(v30);
                        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v29, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j));
                      }
                      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
                    }
                    while (v32);
                  }

                }
                v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, buf, 16);
              }
              while (v20);
            }

            v8 = v63;
            v6 = v64;
            v16 = v61;
            v15 = v62;
            v17 = v60;
          }
          if (-[HVPBDataSourceContentState deprecatedDeferredContentStatesCount](v17, "deprecatedDeferredContentStatesCount"))
          {
            if (-[HVPBDataSourceContentState deferredContentStatesCount](v17, "deferredContentStatesCount"))
            {
              hv_default_log_handle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
              {
                v59 = v8->_path;
                *(_DWORD *)v83 = 138412290;
                v84 = v59;
                _os_log_fault_impl(&dword_21AA1D000, v35, OS_LOG_TYPE_FAULT, "HVDataSourceContentState: protobuf at %@ mixes deprecated and new content state formats!", v83, 0xCu);
              }

            }
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            -[HVPBDataSourceContentState deprecatedDeferredContentStates](v17, "deprecatedDeferredContentStates");
            obja = (id)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
            if (v36)
            {
              v37 = v36;
              v68 = *(_QWORD *)v71;
              do
              {
                for (k = 0; k != v37; ++k)
                {
                  if (*(_QWORD *)v71 != v68)
                    objc_enumerationMutation(obja);
                  v39 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
                  v40 = (void *)MEMORY[0x22074FDF0]();
                  v41 = [HVContentState alloc];
                  v42 = objc_alloc(MEMORY[0x24BDBCF20]);
                  objc_msgSend(v39, "state");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "consumers");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = (void *)objc_msgSend(v42, "initWithArray:", v44);
                  objc_msgSend(v39, "state");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = -[HVContentState initWithConsumers:levelOfService:](v41, "initWithConsumers:levelOfService:", v45, objc_msgSend(v46, "levelOfService"));

                  objc_msgSend(v39, "uniqueId");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v47, v48);

                  objc_autoreleasePoolPop(v40);
                }
                v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
              }
              while (v37);
            }

            v8 = v63;
            v6 = v64;
            v16 = v61;
            v15 = v62;
            v17 = v60;
          }
        }
        else
        {
          hv_default_log_handle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = v8->_path;
            *(_DWORD *)buf = 138412290;
            v87 = v54;
            _os_log_impl(&dword_21AA1D000, v53, OS_LOG_TYPE_DEFAULT, "HVDataSourceContentState: malformed protobuf at: %@", buf, 0xCu);
          }

          +[HVDataSourceContentState _deleteStateAtPath:error:]((uint64_t)HVDataSourceContentState, v8->_path, 0);
          v18 = (NSMutableDictionary *)objc_opt_new();
        }

      }
      else
      {
        hv_default_log_handle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = v8->_path;
          *(_DWORD *)buf = 138412546;
          v87 = v52;
          v88 = 2112;
          v89 = v16;
          _os_log_impl(&dword_21AA1D000, v51, OS_LOG_TYPE_DEFAULT, "HVDataSourceContentState: failed to read %@: error: %@", buf, 0x16u);
        }

        v18 = (NSMutableDictionary *)objc_opt_new();
      }

    }
    else
    {
      hv_default_log_handle();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = v8->_path;
        *(_DWORD *)buf = 138412290;
        v87 = v50;
        _os_log_impl(&dword_21AA1D000, v49, OS_LOG_TYPE_INFO, "HVDataSourceContentState: no existing deferred id list at %@", buf, 0xCu);
      }

      v18 = (NSMutableDictionary *)objc_opt_new();
    }
    deferredContentStates = v8->_deferredContentStates;
    v8->_deferredContentStates = v18;

    -[HVDataSourceContentState sha256]((uint64_t)v8);
    v56 = objc_claimAutoreleasedReturnValue();
    fileContentsHash = v8->_fileContentsHash;
    v8->_fileContentsHash = (NSData *)v56;

  }
  return v8;
}

- (id)sha256
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id obj;
  void *v25;
  char data;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CC_SHA256_CTX c;
  _BYTE v36[128];
  _BYTE v37[128];
  _QWORD v38[4];

  v38[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v1 = a1;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("self"), 1);
  v38[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(*(id *)(v1 + 32), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v3;
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x22074FDF0]();
        HVSHA256String(v11, &c);
        v13 = v1;
        objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "consumers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sortedArrayUsingDescriptors:", v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v28;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v28 != v20)
                objc_enumerationMutation(v17);
              HVSHA256String(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v21++), &c);
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v19);
        }

        data = 0;
        data = objc_msgSend(v14, "levelOfService");
        CC_SHA256_Update(&c, &data, 1u);

        objc_autoreleasePoolPop(v12);
        ++v10;
        v1 = v13;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  v22 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 32));
  CC_SHA256_Final((unsigned __int8 *)objc_msgSend(v22, "mutableBytes"), &c);

  return v22;
}

+ (id)_pathForDataSource:(void *)a3 basePath:
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("deferred_%d.pb"), a2);
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)deferredContentStates
{
  return self->_deferredContentStates;
}

- (unsigned)dataSource
{
  return self->_dataSource;
}

- (BOOL)saveStateWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  char v7;
  unsigned int dataSource;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *deferredContentStates;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *path;
  NSObject *v21;
  unsigned int v22;
  NSObject *v23;
  unsigned int v25;
  NSString *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  unsigned int v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HVDataSourceContentState sha256]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSData isEqualToData:](self->_fileContentsHash, "isEqualToData:", v5))
  {
    hv_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dataSource = self->_dataSource;
      *(_DWORD *)buf = 67109120;
      v33 = dataSource;
      _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_INFO, "HVDataSourceContentState: source %u content unchanged, not writing to disk.", buf, 8u);
    }
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v10 = (void *)MEMORY[0x22074FDF0]();
    v11 = (void *)objc_opt_new();
    deferredContentStates = self->_deferredContentStates;
    v13 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __47__HVDataSourceContentState_saveStateWithError___block_invoke;
    v30[3] = &unk_24DD7F488;
    v14 = v11;
    v31 = v14;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deferredContentStates, "enumerateKeysAndObjectsUsingBlock:", v30);
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __47__HVDataSourceContentState_saveStateWithError___block_invoke_2;
    v28[3] = &unk_24DD7F4B0;
    v29 = v14;
    v16 = v14;
    objc_msgSend(v15, "_pas_mappedArrayWithTransform:", v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v9, "setDeferredContentStates:", v18);

    objc_autoreleasePoolPop(v10);
    objc_msgSend(v9, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    path = self->_path;
    v27 = 0;
    v7 = objc_msgSend(v19, "writeToFile:options:error:", path, 1073741825, &v27);
    v6 = v27;
    if ((v7 & 1) != 0)
    {
      objc_storeStrong((id *)&self->_fileContentsHash, v5);
      hv_default_log_handle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = self->_dataSource;
        *(_DWORD *)buf = 67109120;
        v33 = v22;
        _os_log_impl(&dword_21AA1D000, v21, OS_LOG_TYPE_INFO, "HVDataSourceContentState: source %u content saved to disk.", buf, 8u);
      }

    }
    else
    {
      hv_default_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v25 = self->_dataSource;
        v26 = self->_path;
        *(_DWORD *)buf = 67109634;
        v33 = v25;
        v34 = 2112;
        v35 = v26;
        v36 = 2112;
        v37 = v6;
        _os_log_error_impl(&dword_21AA1D000, v23, OS_LOG_TYPE_ERROR, "HVDataSourceContentState: source %u failed to write protobuf at: %@ error: %@", buf, 0x1Cu);
      }

      if (a3)
        *a3 = objc_retainAutorelease(v6);
    }

  }
  return v7;
}

- (unint64_t)hash
{
  NSMutableDictionary *deferredContentStates;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  deferredContentStates = self->_deferredContentStates;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__HVDataSourceContentState_hash__block_invoke;
  v7[3] = &unk_24DD7F4D8;
  v7[4] = &v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deferredContentStates, "enumerateKeysAndObjectsUsingBlock:", v7);
  v4 = v9[3];
  v5 = -[NSMutableDictionary count](self->_deferredContentStates, "count") - v4 + 32 * v4;
  v9[3] = v5;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HVDataSourceContentState *v4;
  HVDataSourceContentState *v5;
  unsigned int dataSource;
  NSMutableDictionary *deferredContentStates;
  void *v8;
  char v9;

  v4 = (HVDataSourceContentState *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      dataSource = self->_dataSource;
      if (dataSource == -[HVDataSourceContentState dataSource](v5, "dataSource"))
      {
        deferredContentStates = self->_deferredContentStates;
        -[HVDataSourceContentState deferredContentStates](v5, "deferredContentStates");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSMutableDictionary isEqualToDictionary:](deferredContentStates, "isEqualToDictionary:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredContentStates, 0);
  objc_storeStrong((id *)&self->_fileContentsHash, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __32__HVDataSourceContentState_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "hash") + v5;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v8 = objc_msgSend(v6, "hash");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8 + v7;
}

void __47__HVDataSourceContentState_saveStateWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(v6, "addObject:", v7);

}

id __47__HVDataSourceContentState_saveStateWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "consumers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v4, "setConsumers:", v7);

  objc_msgSend(v4, "setLevelOfService:", objc_msgSend(v3, "levelOfService"));
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setState:", v4);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v8, "setUniqueIds:", v10);

  return v8;
}

+ (uint64_t)_deleteStateAtPath:(NSObject *)a3 error:
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = objc_msgSend(v7, "removeItemAtPath:error:", v4, &v13);
    v9 = v13;

    if ((v8 & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      hv_default_log_handle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v4;
        v16 = 2112;
        v17 = v9;
        _os_log_error_impl(&dword_21AA1D000, v11, OS_LOG_TYPE_ERROR, "HVDataSourceContentState: failed to delete protobuf at: %@ error: %@", buf, 0x16u);
      }

      if (a3)
      {
        v9 = objc_retainAutorelease(v9);
        v10 = 0;
        *a3 = v9;
      }
      else
      {
        v10 = 0;
      }
    }
  }
  else
  {
    hv_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_INFO, "HVDataSourceContentState: went to delete protobuf but there was no file at: %@ ", buf, 0xCu);
    }
  }

  return v10;
}

+ (BOOL)deleteStateForDataSource:(unsigned int)a3 basePath:(id)a4 error:(id *)a5
{
  void *v7;

  +[HVDataSourceContentState _pathForDataSource:basePath:]((uint64_t)a1, *(uint64_t *)&a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[HVDataSourceContentState _deleteStateAtPath:error:]((uint64_t)a1, v7, (NSObject **)a5);

  return (char)a5;
}

@end

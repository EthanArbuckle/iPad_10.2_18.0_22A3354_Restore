@implementation SREMusicRetrievalModel

+ (id)sharedInstance
{
  id v2;
  void *v3;
  SREMusicRetrievalModel *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint8_t v16[8];
  id v17;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sharedInstance_sharedInstance;
  if (!sharedInstance_sharedInstance)
  {
    v17 = 0;
    v4 = -[SREMusicRetrievalModel initWithError:]([SREMusicRetrievalModel alloc], "initWithError:", &v17);
    v5 = v17;
    v6 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v4;

    if (sharedInstance_sharedInstance)
    {
      logForCSLogCategoryRecs();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_247974000, v7, OS_LOG_TYPE_DEFAULT, "Created shared SREMusicRetrievalModel instance.", v16, 2u);
      }
    }
    else
    {
      logForCSLogCategoryRecs();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[SREMusicRetrievalModel sharedInstance].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }

    v3 = (void *)sharedInstance_sharedInstance;
  }
  v14 = v3;
  objc_sync_exit(v2);

  return v14;
}

- (SREMusicRetrievalModel)initWithError:(id *)a3
{
  SREMusicRetrievalModel *v3;
  SREMusicRetrievalModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SREMusicRetrievalModel;
  v3 = -[SREMusicRetrievalModel init](&v10, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    -[SREMusicRetrievalModel setModelMMap:](v3, "setModelMMap:", 0);
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadAllParametersForClient:locale:", CFSTR("Spotlight"), v6);

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourcesForClient:locale:options:", CFSTR("Spotlight"), v7, &unk_251907D98);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SREMusicRetrievalModel setResources:](v4, "setResources:", v8);

  }
  return v4;
}

- (id)inferenceWithSequence:(id)a3 query:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[4];
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint8_t buf[24];
  int v49;
  uint64_t v50[100];
  _BYTE v51[128];
  uint64_t v52[103];

  v52[100] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!-[SREMusicRetrievalModel _loadModelWithError:](self, "_loadModelWithError:", a5))
  {
    v17 = 0;
    goto LABEL_31;
  }
  bzero(v52, 0x320uLL);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v39;
    while (2)
    {
      v15 = 0;
      if (v13 <= 0x64)
        v16 = 100 - v13;
      else
        v16 = 0;
      do
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v10);
        if (v16 == v15)
        {
          v13 += v15;
          goto LABEL_15;
        }
        v52[v13 + v15] = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v15), "adamID");
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      v13 += v15;
      if (v12)
        continue;
      break;
    }
LABEL_15:

    if (v13 > 0x63)
      goto LABEL_19;
  }
  else
  {

    v13 = 0;
  }
  bzero(&v52[v13], 800 - 8 * v13);
LABEL_19:
  bzero(v50, 0x320uLL);
  v34 = 0u;
  v35 = 0;
  DWORD1(v34) = 15;
  v33 = 0x2000000019;
  objc_msgSend(v9, "genreID");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend(v18, "UTF8String");
  v36 = v19;

  objc_msgSend(v9, "genreID");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37 = strlen((const char *)objc_msgSend(v20, "UTF8String"));

  logForCSLogCategoryRecs();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl(&dword_247974000, v21, OS_LOG_TYPE_DEFAULT, "Calling music retrieval model. input_len=%zu preferred_genre_name=%s", buf, 0x16u);
  }

  memset(buf, 0, sizeof(buf));
  v49 = 0;
  -[SREMusicRetrievalModel modelMMap](self, "modelMMap");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = retrieval_flatbuffer(v52, v13, 100, v50, (unsigned int *)objc_msgSend(v22, "buffer"), (uint64_t)&v33, (uint64_t)buf);

  if (v23)
  {
    logForCSLogCategoryRecs();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SREMusicRetrievalModel inferenceWithSequence:query:error:].cold.1(v23, v24);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SREMusicRetrievalModel"), v23, 0);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 100; ++i)
    {
      if (i >= *(int *)&buf[4] + (uint64_t)*(int *)buf)
        break;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v50[i]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v27);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v50[i]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v29);

    }
    objc_msgSend(v25, "componentsJoinedByString:", CFSTR(","));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryRecs();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v42 = 67109634;
      v43 = *(_DWORD *)buf;
      v44 = 1024;
      v45 = *(_DWORD *)&buf[4];
      v46 = 2112;
      v47 = v30;
      _os_log_impl(&dword_247974000, v31, OS_LOG_TYPE_DEFAULT, "Music retrieval output (genre:%d, ann:%d):%@", v42, 0x18u);
    }

  }
LABEL_31:

  return v17;
}

- (BOOL)_loadModelWithError:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[SREMusicRetrievalModel resources](self, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasUpdates"))
  {

  }
  else
  {
    -[SREMusicRetrievalModel modelMMap](self, "modelMMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return 1;
  }
  -[SREMusicRetrievalModel resources](self, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filePathArrayForKey:didFailWithError:", CFSTR("MusicRetrieval"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryRecs();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = (uint64_t)v10;
      _os_log_impl(&dword_247974000, v11, OS_LOG_TYPE_DEFAULT, "Loading music retrieval model file:%@", (uint8_t *)&v25, 0xCu);
    }

    +[MMapStruct mMapStructWithFilepath:](MMapStruct, "mMapStructWithFilepath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SREMusicRetrievalModel setModelMMap:](self, "setModelMMap:", v12);

    -[SREMusicRetrievalModel modelMMap](self, "modelMMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    logForCSLogCategoryRecs();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[SREMusicRetrievalModel modelMMap](self, "modelMMap");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "size");
        v25 = 134217984;
        v26 = v17;
        _os_log_impl(&dword_247974000, v15, OS_LOG_TYPE_DEFAULT, "Music Retrieval LSH model mmap done. mmap size: %ld", (uint8_t *)&v25, 0xCu);

      }
      v7 = 1;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SREMusicRetrievalModel _loadModelWithError:].cold.2(v15);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SREMusicRetrievalModel"), -3001, 0);
      v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    logForCSLogCategoryRecs();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SREMusicRetrievalModel _loadModelWithError:].cold.1((uint64_t)a3, v10, v18, v19, v20, v21, v22, v23);
    v7 = 0;
  }

  return v7;
}

- (MMapStruct)modelMMap
{
  return self->_modelMMap;
}

- (void)setModelMMap:(id)a3
{
  objc_storeStrong((id *)&self->_modelMMap, a3);
}

- (SRResources)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_modelMMap, 0);
}

+ (void)sharedInstance
{
  OUTLINED_FUNCTION_3(&dword_247974000, a2, a3, "Creating shared SREMusicRetrievalModel instance failed. Error=%@", a5, a6, a7, a8, 2u);
}

- (void)inferenceWithSequence:(int)a1 query:(NSObject *)a2 error:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_247974000, a2, OS_LOG_TYPE_ERROR, "Music retrieval model inference failed. Error=%d", (uint8_t *)v2, 8u);
}

- (void)_loadModelWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_247974000, a2, a3, "Music Retrieval LSH model path not found. error=%@", a5, a6, a7, a8, 2u);
}

- (void)_loadModelWithError:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_247974000, log, OS_LOG_TYPE_ERROR, "Music Retrieval LSH model mmap failed.", v1, 2u);
}

@end

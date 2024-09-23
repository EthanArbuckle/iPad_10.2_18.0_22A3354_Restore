@implementation ATXScoreNormalizationDriver

- (ATXScoreNormalizationDriver)init
{
  ATXScoreNormalizationDriver *v2;
  ATXScoreNormalizationDriver *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXScoreNormalizationDriver;
  v2 = -[ATXScoreNormalizationDriver init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ATXScoreNormalizationDriver getOrMakeScoreNormalizationModelsDictionary](v2, "getOrMakeScoreNormalizationModelsDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "mutableCopy");
    else
      v6 = objc_opt_new();
    v7 = (void *)v6;
    -[ATXScoreNormalizationDriver setScoreNormalizationModelsDict:](v3, "setScoreNormalizationModelsDict:", v6);

    -[ATXScoreNormalizationDriver setScoreHarvestingStreamBookmark:](v3, "setScoreHarvestingStreamBookmark:", 0);
  }
  return v3;
}

- (BOOL)registerModelWithClientModelId:(id)a3 clientModelVersion:(id)a4 normalizationParameters:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXScoreNormalizationModel *v14;

  v8 = a5;
  -[ATXScoreNormalizationDriver getUniqueModelKeyForClientModelId:clientModelVersion:](self, "getUniqueModelKeyForClientModelId:clientModelVersion:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v14 = (ATXScoreNormalizationModel *)objc_claimAutoreleasedReturnValue();
    -[ATXScoreNormalizationModel setParameters:](v14, "setParameters:", v8);

  }
  else
  {
    v14 = -[ATXScoreNormalizationModel initWithParameters:circularBuffer:bufferHead:isBufferSorted:]([ATXScoreNormalizationModel alloc], "initWithParameters:circularBuffer:bufferHead:isBufferSorted:", v8, 0, 0, 1);

    objc_msgSend(v13, "setValue:forKey:", v14, v9);
  }

  return 1;
}

- (BOOL)addScoreForModelWithClientModelId:(id)a3 clientModelVersion:(id)a4 score:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ATXScoreNormalizationDriver getUniqueModelKeyForClientModelId:clientModelVersion:](self, "getUniqueModelKeyForClientModelId:clientModelVersion:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addScore:", v10);
  }
  else
  {
    __atxlog_handle_blending();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ATXScoreNormalizationDriver addScoreForModelWithClientModelId:clientModelVersion:score:].cold.1((uint64_t)v8, (uint64_t)v9, v16);

  }
  return v13 != 0;
}

- (id)normalizeScore:(id)a3 clientModelId:(id)a4 clientModelVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ATXScoreNormalizationDriver getUniqueModelKeyForClientModelId:clientModelVersion:](self, "getUniqueModelKeyForClientModelId:clientModelVersion:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXScoreNormalizationDriver _normalizeScoreHelper:modelKey:](self, "_normalizeScoreHelper:modelKey:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138413058;
    v16 = v8;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1AA841000, v13, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: score normalized(score : %@, normalized: %@) with model %@ with version %@", (uint8_t *)&v15, 0x2Au);
  }

  return v12;
}

- (id)_normalizeScoreHelper:(id)a3 modelKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "normalizeScore:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &unk_1E57EC3E0;
  }

  return v12;
}

- (id)getNormalizationModelWithClientModelId:(id)a3 clientModelVersion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[ATXScoreNormalizationDriver getUniqueModelKeyForClientModelId:clientModelVersion:](self, "getUniqueModelKeyForClientModelId:clientModelVersion:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getUniqueModelKeyForClientModelId:(id)a3 clientModelVersion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a3, a4);
}

+ (id)defaultArchivePath
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "scoreNormalizationModelFileWithFilename:", CFSTR("ATXScoreNormalizationArtifacts.archive"));
}

- (id)getPayloadFromArchiveAtPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 2, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1AF421DC4](v5);
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v13);
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v13;
    objc_autoreleasePoolPop(v9);
    if (!v7)
    {
      -[NSObject scoreNormalizationModelsDict](v8, "scoreNormalizationModelsDict");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Error with unarchiving ATXScoreNormalizationArtifacts file.", buf, 2u);
    }

  }
  else
  {
    v7 = v5;
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Error with reading from archived ATXScoreNormalizationArtifacts file with possible error %@", buf, 0xCu);
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (id)getOrMakeScoreNormalizationModelsDictionary
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  +[ATXScoreNormalizationDriver defaultArchivePath](ATXScoreNormalizationDriver, "defaultArchivePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    -[ATXScoreNormalizationDriver getPayloadFromArchiveAtPath:](self, "getPayloadFromArchiveAtPath:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    -[ATXScoreNormalizationDriver writeArchiveFromDict:](self, "writeArchiveFromDict:", v6);
  }

  return v6;
}

- (void)writeArchiveFromDict:(id)a3
{
  id v4;
  void *v5;
  ATXScoreNormalizationArtifactsArchive *v6;

  v4 = a3;
  v6 = -[ATXScoreNormalizationArtifactsArchive initWithScoreNormalizationModelsDictionary:]([ATXScoreNormalizationArtifactsArchive alloc], "initWithScoreNormalizationModelsDictionary:", v4);

  +[ATXScoreNormalizationDriver defaultArchivePath](ATXScoreNormalizationDriver, "defaultArchivePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXScoreNormalizationDriver writeArchive:toFilePath:](self, "writeArchive:toFilePath:", v6, v5);

}

- (void)writeArchive:(id)a3 toFilePath:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  _BOOL4 v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = (void *)MEMORY[0x1AF421DC4]();
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;
    objc_autoreleasePoolPop(v8);
    if (v10)
    {
LABEL_17:

      goto LABEL_18;
    }
    -[NSObject stringByDeletingLastPathComponent](v7, "stringByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v17);
    v10 = v17;

    if (v10)
    {
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        v14 = "ATXScoreNormalizationDriver: Archiving fails with error %@";
LABEL_12:
        _os_log_impl(&dword_1AA841000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
      }
    }
    else
    {
      v16 = 0;
      objc_msgSend(v9, "writeToFile:options:error:", v7, 1, &v16);
      v10 = v16;
      __atxlog_handle_blending();
      v13 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!v10)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138412290;
          v20 = v7;
          _os_log_impl(&dword_1AA841000, v13, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Successfully persisted dictionary: %@", buf, 0xCu);
        }
        v10 = 0;
        goto LABEL_16;
      }
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        v14 = "ATXScoreNormalizationDriver: Persisting dictionary fails with error %@";
        goto LABEL_12;
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Empty archive or filePath when trying to persist ATXScoreNormalizationArtifactsArchive.", buf, 2u);
  }
LABEL_18:

}

+ (void)deleteArchiveFile
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXScoreNormalizationDriver defaultArchivePath](ATXScoreNormalizationDriver, "defaultArchivePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v3))
  {
    v10 = 0;
    objc_msgSend(v2, "removeItemAtPath:error:", v3, &v10);
    v4 = v10;
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412546;
        v12 = v3;
        v13 = 2112;
        v14 = v4;
        v7 = "ATXScoreNormalizationDriver: Error in deleting file %@: %@";
        v8 = v5;
        v9 = 22;
LABEL_7:
        _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      v7 = "ATXScoreNormalizationDriver: File deleted: %@";
      v8 = v5;
      v9 = 12;
      goto LABEL_7;
    }

  }
}

- (void)initStreamBookmark
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CF94D8], "scoreNormalizationModelFileWithFilename:", CFSTR("clientModelStreamBookmark"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v7);
  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v3, 1000000, &unk_1E57EC3F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXScoreNormalizationDriver setScoreHarvestingStreamBookmark:](self, "setScoreHarvestingStreamBookmark:", v4);

  -[ATXScoreNormalizationDriver scoreHarvestingStreamBookmark](self, "scoreHarvestingStreamBookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF94A0]), "initWithURLPath:versionNumber:bookmark:metadata:", v3, &unk_1E57EC3F8, 0, 0);
    -[ATXScoreNormalizationDriver setScoreHarvestingStreamBookmark:](self, "setScoreHarvestingStreamBookmark:", v6);

  }
}

- (void)modelScoreHarvesting
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXScoreNormalizationParameters *v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  ATXScoreNormalizationParameters *v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  ATXScoreNormalizationParameters *v36;
  __int128 *v37;
  _QWORD v38[4];
  NSObject *v39;
  __int128 *p_buf;
  id v41;
  id location;
  uint8_t v43[128];
  uint8_t v44[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int128 buf;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[ATXScoreNormalizationDriver initStreamBookmark](self, "initStreamBookmark");
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AA841000, v3, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: Model score harvesting, starting...", (uint8_t *)&buf, 2u);
  }

  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXScoreNormalizationDriver scoreHarvestingStreamBookmark](self, "scoreHarvestingStreamBookmark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AA841000, v4, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: scoreHarvestingStreamBookmark %@", (uint8_t *)&buf, 0xCu);

  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "publisherFromStartTime:", 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ATXScoreNormalizationParameters initWithBufferSize:]([ATXScoreNormalizationParameters alloc], "initWithBufferSize:", &unk_1E57EC410);
  v9 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v49 = 0x2020000000;
  v50 = 0;
  objc_initWeak(&location, self);
  -[ATXScoreNormalizationDriver scoreHarvestingStreamBookmark](self, "scoreHarvestingStreamBookmark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bookmark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke;
  v38[3] = &unk_1E57CF910;
  objc_copyWeak(&v41, &location);
  p_buf = &buf;
  v13 = v9;
  v39 = v13;
  v35[0] = v12;
  v35[1] = 3221225472;
  v35[2] = __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke_54;
  v35[3] = &unk_1E57CF938;
  v35[4] = self;
  v14 = v8;
  v36 = v14;
  v37 = &buf;
  v15 = (id)objc_msgSend(v30, "sinkWithBookmark:completion:receiveInput:", v11, v38, v35);

  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v13, 2.0) == 1)
  {
    __atxlog_handle_blending();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v44 = 138412290;
      v45 = v18;
      _os_log_impl(&dword_1AA841000, v16, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: %@ - event processing timeout", v44, 0xCu);

    }
  }
  else
  {
    __atxlog_handle_blending();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v44 = 138412546;
      v45 = v21;
      v46 = 2048;
      v47 = v22;
      _os_log_impl(&dword_1AA841000, v19, OS_LOG_TYPE_DEFAULT, "ATXScoreNormalizationDriver: %@ - processed %ld events", v44, 0x16u);

    }
    if (*(uint64_t *)(*((_QWORD *)&buf + 1) + 24) >= 1)
      -[ATXScoreNormalizationDriver persistBookmark](self, "persistBookmark");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v32;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v23);
          v27 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v26);
          -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "getStateReadyForNormalization");
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v24);
    }

    -[ATXScoreNormalizationDriver scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
    v16 = objc_claimAutoreleasedReturnValue();
    -[ATXScoreNormalizationDriver writeArchiveFromDict:](self, "writeArchiveFromDict:", v16);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 1)
    {
      __atxlog_handle_metrics();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v10;
        _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "%@ - obtained new bookmark", (uint8_t *)&v19, 0xCu);

      }
      v11 = objc_alloc(MEMORY[0x1E0CF94A0]);
      objc_msgSend(WeakRetained[2], "urlPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "initWithURLPath:versionNumber:bookmark:metadata:", v12, &unk_1E57EC3F8, v6, 0);
      v14 = WeakRetained[2];
      WeakRetained[2] = (id)v13;

    }
    v15 = v5;
    v16 = objc_msgSend(v15, "state");
    __atxlog_handle_blending();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke_cold_1(v15, v18);
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1AA841000, v18, OS_LOG_TYPE_INFO, "ATXScoreNormalizationDriver: Model score harvesting, stream sink complete.", (uint8_t *)&v19, 2u);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke_54(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v23 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v9 = (void *)a1[4];
        objc_msgSend(v8, "clientModelSpecification");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clientModelId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "clientModelSpecification");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clientModelVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "registerModelWithClientModelId:clientModelVersion:normalizationParameters:", v11, v13, a1[5]);

        v14 = (void *)a1[4];
        objc_msgSend(v8, "clientModelSpecification");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "clientModelId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "clientModelSpecification");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "clientModelVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "scoreSpecification");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "rawScore");
        objc_msgSend(v19, "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addScoreForModelWithClientModelId:clientModelVersion:score:", v16, v18, v21);

        ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

}

- (void)persistBookmark
{
  void *v3;
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[ATXScoreNormalizationDriver scoreHarvestingStreamBookmark](self, "scoreHarvestingStreamBookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "saveBookmarkWithError:", &v10);
  v4 = v10;

  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXScoreNormalizationDriver scoreHarvestingStreamBookmark](self, "scoreHarvestingStreamBookmark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "urlPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1AA841000, v5, OS_LOG_TYPE_DEFAULT, "%@ - persisted score normalization bookmark to path %@ with error: %@", buf, 0x20u);

  }
}

- (NSMutableDictionary)scoreNormalizationModelsDict
{
  return self->_scoreNormalizationModelsDict;
}

- (void)setScoreNormalizationModelsDict:(id)a3
{
  objc_storeStrong((id *)&self->_scoreNormalizationModelsDict, a3);
}

- (ATXBMBookmark)scoreHarvestingStreamBookmark
{
  return self->_scoreHarvestingStreamBookmark;
}

- (void)setScoreHarvestingStreamBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_scoreHarvestingStreamBookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreHarvestingStreamBookmark, 0);
  objc_storeStrong((id *)&self->_scoreNormalizationModelsDict, 0);
}

- (void)addScoreForModelWithClientModelId:(uint64_t)a1 clientModelVersion:(uint64_t)a2 score:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1AA841000, log, OS_LOG_TYPE_FAULT, "ATXScoreNormalizationDriver: addScoreForModelWithClientModelId called with model ID %@ and version %@ that does not map to a registered model key", (uint8_t *)&v3, 0x16u);
}

void __51__ATXScoreNormalizationDriver_modelScoreHarvesting__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = 136315138;
  v6 = objc_msgSend(v4, "UTF8String");
  _os_log_error_impl(&dword_1AA841000, a2, OS_LOG_TYPE_ERROR, "ATXScoreNormalizationDriver: Model score harvesting, Error: %s", (uint8_t *)&v5, 0xCu);

}

@end

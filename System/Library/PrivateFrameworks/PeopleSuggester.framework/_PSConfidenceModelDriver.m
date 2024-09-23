@implementation _PSConfidenceModelDriver

- (_PSConfidenceModelDriver)init
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  _PSConfidenceModelDriver *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)_PSConfidenceModelDriver;
  v23 = -[_PSConfidenceModelDriver init](&v32, sel_init);
  if (v23)
  {
    -[_PSConfidenceModelDriver getOrMakeConfidenceModelDictionary](v23, "getOrMakeConfidenceModelDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[_PSConfidenceModelDriver setConfidenceModelDictionary:](v23, "setConfidenceModelDictionary:", v3);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = v2;
    v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v20)
    {
      v19 = *(_QWORD *)v29;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v4);
          v21 = v5;
          v6 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v5);
          v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          -[_PSConfidenceModelDriver confidenceModelDictionary](v23, "confidenceModelDictionary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v4, "objectForKeyedSubscript:", v6);
          obj = (id)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v25;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v25 != v11)
                  objc_enumerationMutation(obj);
                v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
                objc_msgSend(v4, "objectForKeyedSubscript:", v6);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "objectForKeyedSubscript:", v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[_PSConfidenceModelDriver confidenceModelDictionary](v23, "confidenceModelDictionary");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v6);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v13);

                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
            }
            while (v10);
          }

          v5 = v21 + 1;
        }
        while (v21 + 1 != v20);
        v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v20);
    }

  }
  return v23;
}

- (BOOL)registerModelKey:(id)a3 forUseCaseKey:(id)a4 confidenceWindowSize:(int)a5 minimumInstanceCount:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  _PSConfidenceModel *v22;
  void *v23;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v13)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v15, "setValue:forKey:", v19, v11);

    goto LABEL_5;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_5:
    -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[_PSConfidenceModel initWithBufferSize:minimumInstanceCount:]([_PSConfidenceModel alloc], "initWithBufferSize:minimumInstanceCount:", v7, v6);
    objc_msgSend(v21, "setValue:forKey:", v22, v10);

    -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSConfidenceModelDriver writeArchiveFromDict:](self, "writeArchiveFromDict:", v23);

    v18 = 1;
    goto LABEL_6;
  }
  v18 = 0;
LABEL_6:

  return v18;
}

- (BOOL)addEventForModel:(id)a3 forUseCaseKey:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;
  if (v12)
  {
    v14 = (void *)v12;
    -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v13 = 0;
      goto LABEL_6;
    }
    -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addEvent:", v10);

    -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSConfidenceModelDriver writeArchiveFromDict:](self, "writeArchiveFromDict:", v11);
  }

LABEL_6:
  return v13;
}

- (double)getConfidenceForModel:(id)a3 forUseCaseKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  v6 = a3;
  v7 = a4;
  -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v17 = -1.0;
      goto LABEL_7;
    }
    -[_PSConfidenceModelDriver confidenceModelDictionary](self, "confidenceModelDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getConfidence");
    v17 = v16;

  }
  else
  {
    v17 = -1.0;
  }

LABEL_7:
  return v17;
}

+ (id)defaultArchivePath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D15900], "peopleDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PSConfidenceModel/confidenceModels.archive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getDictionaryFromArchiveAtPath:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v24;
  id v25;

  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a3, 2, &v25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v25;
  if (v4)
  {
    v5 = v4;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_PSConfidenceModelDriver getDictionaryFromArchiveAtPath:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v24);
    v6 = objc_claimAutoreleasedReturnValue();
    v5 = v24;
    if (!v5)
    {
      -[NSObject confidenceModelDictionary](v6, "confidenceModelDictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_PSConfidenceModelDriver getDictionaryFromArchiveAtPath:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  v22 = 0;
LABEL_9:

  return v22;
}

- (id)getOrMakeConfidenceModelDictionary
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  +[_PSConfidenceModelDriver defaultArchivePath](_PSConfidenceModelDriver, "defaultArchivePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    -[_PSConfidenceModelDriver getDictionaryFromArchiveAtPath:](self, "getDictionaryFromArchiveAtPath:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    -[_PSConfidenceModelDriver writeArchiveFromDict:](self, "writeArchiveFromDict:", v6);
  }

  return v6;
}

- (void)writeArchiveFromDict:(id)a3
{
  id v4;
  void *v5;
  _PSConfidenceModelArchive *v6;

  v4 = a3;
  v6 = -[_PSConfidenceModelArchive initWithConfidenceModelDictionary:]([_PSConfidenceModelArchive alloc], "initWithConfidenceModelDictionary:", v4);

  +[_PSConfidenceModelDriver defaultArchivePath](_PSConfidenceModelDriver, "defaultArchivePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSConfidenceModelDriver writeArchive:toFilePath:](self, "writeArchive:toFilePath:", v6, v5);

}

- (void)writeArchive:(id)a3 toFilePath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;
    if (v8)
    {
      v9 = v8;
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_PSConfidenceModelDriver writeArchive:toFilePath:].cold.3(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      objc_msgSend(v6, "stringByDeletingLastPathComponent");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v22);
      v9 = v22;

      if (v9)
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[_PSInteractionPredictor writeArchive:toFilePath:].cold.2();
      }
      else
      {
        v21 = 0;
        objc_msgSend(v7, "writeToFile:options:error:", v6, 1, &v21);
        v9 = v21;
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v20 = objc_claimAutoreleasedReturnValue();
        v19 = v20;
        if (v9)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[_PSConfidenceModelDriver writeArchive:toFilePath:].cold.1((uint64_t)v9, v19);
        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v6;
            _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "Successfully persisted dictionary: %@", buf, 0xCu);
          }
          v9 = 0;
        }
      }

    }
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Empty archive or filePath when trying to persist _PSConfidenceModelArchive", buf, 2u);
    }
  }

}

+ (void)deleteArchiveFile
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "file deleted: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (NSMutableDictionary)confidenceModelDictionary
{
  return self->_confidenceModelDictionary;
}

- (void)setConfidenceModelDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceModelDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceModelDictionary, 0);
}

- (void)getDictionaryFromArchiveAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, a1, a3, "Error with unarchiving confidenceModel data.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)getDictionaryFromArchiveAtPath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, a1, a3, "Error with reading from Archive for confidenceModel.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)writeArchive:(uint64_t)a1 toFilePath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Error when trying to persist dictionary: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)writeArchive:(uint64_t)a3 toFilePath:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, a1, a3, "error in archiving.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

@end

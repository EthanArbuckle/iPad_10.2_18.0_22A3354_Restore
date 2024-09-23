@implementation TRIClientFactorPackStreamingParser

- (TRIClientSelectedNamespace)selectedNamespace
{
  TRIClientSelectedNamespace *selectedNamespace;

  selectedNamespace = self->_selectedNamespace;
  if (selectedNamespace)
    return (TRIClientSelectedNamespace *)(id)-[TRIClientSelectedNamespace copy](selectedNamespace, "copy");
  else
    return (TRIClientSelectedNamespace *)(id)objc_opt_new();
}

- (TRIClientFactorPackStreamingParser)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  TRIClientFactorPackStreamingParser *v8;
  TRIClientFactorPackStreamingParser *v9;
  TRIClientFactorPackStreamingParser *v10;
  objc_super v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC6B8C]();
  v12.receiver = self;
  v12.super_class = (Class)TRIClientFactorPackStreamingParser;
  v8 = -[TRIClientFactorPackStreamingParser init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a3);
    -[TRIClientFactorPackStreamingParser _parseWithHandleFactorLevel:](v9, "_parseWithHandleFactorLevel:", 0);
  }
  v10 = v9;
  objc_autoreleasePoolPop(v7);

  return v10;
}

- (BOOL)hasSelectedNamespace
{
  return self->_selectedNamespace != 0;
}

- (BOOL)hasFactorPackId
{
  return self->_factorPackId != 0;
}

- (NSString)factorPackId
{
  if (self->_factorPackId)
    return self->_factorPackId;
  else
    return (NSString *)&stru_1E3C00710;
}

- (void)_parseWithHandleFactorLevel:(id)a3
{
  void (**v4)(id, void *, uint8_t *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSString *v19;
  NSString *factorPackId;
  NSObject *v21;
  void *v22;
  TRIClientSelectedNamespace *v23;
  TRIClientSelectedNamespace *selectedNamespace;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint8_t *))a3;
  v5 = (void *)MEMORY[0x1A1AC6B8C]();
  v6 = -[TRIClientFactorPackStreamingParser _fieldTagForFieldName:](self, "_fieldTagForFieldName:", CFSTR("factorPackId"));
  v7 = -[TRIClientFactorPackStreamingParser _fieldTagForFieldName:](self, "_fieldTagForFieldName:", CFSTR("selectedNamespace"));
  v8 = -[TRIClientFactorPackStreamingParser _fieldTagForFieldName:](self, "_fieldTagForFieldName:", CFSTR("factorLevelArray"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F20]), "initWithData:", self->_data);
  v10 = objc_msgSend(v9, "readTag");
  if ((_DWORD)v10)
  {
    v12 = v10;
    *(_QWORD *)&v11 = 67109120;
    v25 = v11;
    do
    {
      if ((_DWORD)v12 == (_DWORD)v6)
      {
        if (self->_factorPackId)
        {
          v13 = v9;
          v14 = v6;
LABEL_21:
          objc_msgSend(v13, "skipField:", v14, v25);
          goto LABEL_22;
        }
        v18 = (void *)MEMORY[0x1A1AC6B8C]();
        objc_msgSend(v9, "readString");
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v18);
        factorPackId = self->_factorPackId;
        self->_factorPackId = v19;

      }
      else
      {
        if ((_DWORD)v12 != (_DWORD)v7)
        {
          if ((_DWORD)v12 == (_DWORD)v8)
          {
            if (v4)
            {
              v15 = (void *)MEMORY[0x1A1AC6B8C]();
              v16 = (void *)objc_opt_new();
              objc_msgSend(v9, "readMessage:extensionRegistry:", v16, 0);
              buf[0] = 0;
              v4[2](v4, v16, buf);
              v17 = buf[0];

              objc_autoreleasePoolPop(v15);
              if (v17)
                break;
              goto LABEL_22;
            }
            v13 = v9;
            v14 = v8;
          }
          else
          {
            if (!self->_emittedUnrecognizedFieldWarning)
            {
              TRILogCategory_ClientFramework();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v25;
                v27 = v12;
                _os_log_impl(&dword_19B89C000, v21, OS_LOG_TYPE_INFO, "TRIClientFactorPackStreamingParser: skipping unrecognized tag: %u", buf, 8u);
              }

              self->_emittedUnrecognizedFieldWarning = 1;
            }
            v13 = v9;
            v14 = v12;
          }
          goto LABEL_21;
        }
        if (self->_selectedNamespace)
        {
          v13 = v9;
          v14 = v7;
          goto LABEL_21;
        }
        v22 = (void *)MEMORY[0x1A1AC6B8C]();
        v23 = (TRIClientSelectedNamespace *)objc_opt_new();
        selectedNamespace = self->_selectedNamespace;
        self->_selectedNamespace = v23;

        objc_msgSend(v9, "readMessage:extensionRegistry:", self->_selectedNamespace, 0);
        objc_autoreleasePoolPop(v22);
      }
LABEL_22:
      v12 = objc_msgSend(v9, "readTag", v25);
    }
    while ((_DWORD)v12);
  }

  objc_autoreleasePoolPop(v5);
}

- (unsigned)_fieldTagForFieldName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  unsigned int v14;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0DC0E90], "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v3, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = TRIPBFieldTag();

    if (v14 == -1)
      goto LABEL_10;
  }
  else
  {
LABEL_9:

LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientFactorPackStreaming.m"), 91, CFSTR("Failed to determine field tag for \"%@\"), v3);

    v14 = -1;
  }

  objc_autoreleasePoolPop(v4);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_selectedNamespace, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
}

- (id)downloadedFactorsWithPaths:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  objc_msgSend(a3, "treatmentsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClientFactorPackStreamingParser selectedNamespace](self, "selectedNamespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIClientFactorPackStreamingParser factorPackId](self, "factorPackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __65__TRIClientFactorPackStreamingParser_downloadedFactorsWithPaths___block_invoke;
  v18 = &unk_1E3BFEB18;
  v19 = v8;
  v20 = v4;
  v21 = v6;
  v22 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v4;
  v12 = v8;
  -[TRIClientFactorPackStreamingParser enumerateFactorLevelsWithBlock:](self, "enumerateFactorLevelsWithBlock:", &v15);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __65__TRIClientFactorPackStreamingParser_downloadedFactorsWithPaths___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a2;
  if (objc_msgSend(v27, "hasFactor"))
  {
    objc_msgSend(v27, "factor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasName");

    if (v4)
    {
      objc_msgSend(v27, "factor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "level");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileOrDirectoryLevelWithIsDir:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "hasPath")
        && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "path"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "fileExistsAtPath:", v10),
            v10,
            v9,
            v11))
      {
        v12 = (void *)a1[4];
        objc_msgSend(v27, "factor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v14);
      }
      else
      {
        objc_msgSend(v27, "level");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "levelOneOfCase");

        if (v16 != 104)
        {
LABEL_11:

          goto LABEL_12;
        }
        v17 = (void *)MEMORY[0x1A1AC6B8C]();
        v18 = (void *)a1[5];
        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        v20 = a1[6];
        v21 = a1[7];
        objc_msgSend(v6, "triFilenameForFactorName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@/factorPacks/%@/maRefs/%@"), v20, v21, v22);
        objc_msgSend(v18, "stringByAppendingPathComponent:", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v17);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = objc_msgSend(v24, "fileExistsAtPath:", v13);

        if (!(_DWORD)v23)
        {
LABEL_10:

          goto LABEL_11;
        }
        v25 = (void *)a1[4];
        objc_msgSend(v27, "factor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

      }
      goto LABEL_10;
    }
  }
LABEL_12:

}

- (NSData)data
{
  return self->_data;
}

@end

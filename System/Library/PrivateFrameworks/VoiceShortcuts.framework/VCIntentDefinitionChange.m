@implementation VCIntentDefinitionChange

- (VCIntentDefinitionChange)initWithApplicationRecord:(id)a3 changeType:(int64_t)a4
{
  id v7;
  void *v8;
  VCIntentDefinitionChange *v9;
  void *v10;
  void *v11;
  VCIntentDefinitionChange *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *files;
  NSArray *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *v28;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCIntentDefinitionChange.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationRecord"));

  }
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VCIntentDefinitionChange initWithObjectIdentifier:changeType:](self, "initWithObjectIdentifier:changeType:", v8, a4);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithApplicationRecord:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "supportedActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (VCIntentDefinitionChange *)objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = v7;
      v14 = (void *)objc_opt_new();
      objc_msgSend(v13, "if_allIntentDefinitionURLs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObjectsFromArray:", v16);

      INIntentDefinitionLocalizableFileURLsForBundleRecord();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "addObjectsFromArray:", v17);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("path"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortUsingDescriptors:", v19);

      objc_msgSend(v14, "if_compactMap:", &__block_literal_global_6261);
      v20 = objc_claimAutoreleasedReturnValue();
      files = v9->_files;
      v9->_files = (NSArray *)v20;

      v22 = v9->_files;
      v23 = (void *)MEMORY[0x1E0D13F78];
      objc_msgSend(v10, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fileWithData:ofType:proposedFilename:", v24, v25, CFSTR("AppInfo.appinfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray arrayByAddingObject:](v22, "arrayByAddingObject:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v9->_files;
      v9->_files = (NSArray *)v27;

      v12 = v9;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (VCIntentDefinitionChange)initWithObjectIdentifier:(id)a3 changeType:(int64_t)a4
{
  id v6;
  VCIntentDefinitionChange *v7;
  uint64_t v8;
  NSString *objectIdentifier;
  VCIntentDefinitionChange *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCIntentDefinitionChange;
  v7 = -[VCIntentDefinitionChange init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    objectIdentifier = v7->_objectIdentifier;
    v7->_objectIdentifier = (NSString *)v8;

    v7->_changeType = a4;
    v10 = v7;
  }

  return v7;
}

- (NSString)sequencer
{
  return 0;
}

- (NSString)checksum
{
  NSString *checksum;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t j;
  NSString *v22;
  id v23;
  NSString *v24;
  id obj;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  CC_SHA1_CTX v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE data[8192];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  checksum = self->_checksum;
  if (checksum)
    return checksum;
  v32 = 0;
  v33 = &v32;
  v34 = 0x8010000000;
  v35 = &unk_1C15870F5;
  memset(&v36, 0, sizeof(v36));
  CC_SHA1_Init(&v36);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[VCIntentDefinitionChange files](self, "files");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v29;
    obj = v4;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1C3BAFA00]();
        objc_msgSend(v8, "filename");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataUsingEncoding:", 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v33;
        v13 = objc_retainAutorelease(v11);
        CC_SHA1_Update((CC_SHA1_CTX *)(v12 + 4), (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
        if (objc_msgSend(v8, "representationType"))
        {
          objc_msgSend(v8, "inputStream");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "open");
          while (objc_msgSend(v14, "hasBytesAvailable"))
          {
            v15 = (void *)MEMORY[0x1C3BAFA00]();
            v16 = objc_msgSend(v14, "read:maxLength:", data, 0x2000);
            if (v16 < 0)
            {
              getWFWatchSyncLogObject();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v14, "streamError");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v38 = "-[VCIntentDefinitionChange checksum]";
                v39 = 2114;
                v40 = v19;
                _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_ERROR, "%s Error calculating intent definition file checksum: %{public}@", buf, 0x16u);

              }
              v17 = 1;
            }
            else if (v16)
            {
              CC_SHA1_Update((CC_SHA1_CTX *)(v33 + 4), data, v16);
              v17 = 0;
            }
            else
            {
              v17 = 5;
            }
            objc_autoreleasePoolPop(v15);
            if (v17)
            {
              if (v17 != 5)
                goto LABEL_22;
              break;
            }
          }
          objc_msgSend(v14, "close");
          v17 = 0;
        }
        else
        {
          objc_msgSend(v8, "data");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __36__VCIntentDefinitionChange_checksum__block_invoke;
          v27[3] = &unk_1E7AA7D80;
          v27[4] = &v32;
          objc_msgSend(v14, "enumerateByteRangesUsingBlock:", v27);
          v17 = 3;
        }
LABEL_22:

        objc_autoreleasePoolPop(v9);
        if (v17 != 3 && v17)
        {

          v24 = 0;
          goto LABEL_30;
        }
      }
      v4 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      if (v5)
        continue;
      break;
    }
  }

  CC_SHA1_Final(buf, (CC_SHA1_CTX *)(v33 + 4));
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 40);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j != 20; ++j)
    objc_msgSend(v20, "appendFormat:", CFSTR("%02x"), buf[j]);
  v22 = self->_checksum;
  self->_checksum = (NSString *)v20;
  v23 = v20;

  v24 = self->_checksum;
LABEL_30:
  _Block_object_dispose(&v32, 8);
  return v24;
}

- (BOOL)writeTo:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  unsigned int v16;
  uint64_t v17;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v7 = 1;
  if (-[VCIntentDefinitionChange changeType](self, "changeType") != 3)
  {
    v8 = (void *)objc_opt_new();
    -[VCIntentDefinitionChange objectIdentifier](self, "objectIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssociatedBundleID:", v9);

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__6240;
    v24 = __Block_byref_object_dispose__6241;
    v25 = 0;
    -[VCIntentDefinitionChange files](self, "files");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__VCIntentDefinitionChange_writeTo_error___block_invoke;
    v19[3] = &unk_1E7AA7DA8;
    v19[4] = self;
    v19[5] = &v20;
    v19[6] = &v26;
    objc_msgSend(v10, "if_compactMap:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v8, "setFiles:", v12);

    v7 = *((_BYTE *)v27 + 24) != 0;
    if (*((_BYTE *)v27 + 24))
    {
      v13 = (void *)objc_opt_new();
      -[VCIntentDefinitionChange objectIdentifier](self, "objectIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAssociatedBundleID:", v14);

      v15 = -[VCIntentDefinitionChange changeType](self, "changeType");
      if (v15 == 2)
        v16 = 2;
      else
        v16 = 1;
      if (v15 == 3)
        v17 = 3;
      else
        v17 = v16;
      objc_msgSend(v13, "setChangeType:", v17);
      objc_msgSend(v13, "setIntentDefinition:", v8);
      objc_msgSend(v13, "writeTo:", v6);

    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease((id)v21[5]);
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v7;
}

- (BOOL)readFrom:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v7, "readFrom:error:", v6, a4);

  if (v8)
  {
    objc_msgSend(v7, "intentDefinition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "files");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__VCIntentDefinitionChange_readFrom_error___block_invoke;
    v13[3] = &unk_1E7AA7DD0;
    v13[4] = self;
    objc_msgSend(v10, "if_compactMap:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCIntentDefinitionChange setFiles:](self, "setFiles:", v11);

  }
  return v8;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_checksum, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

id __43__VCIntentDefinitionChange_readFrom_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "data");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "name"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(v3, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileWithData:ofType:proposedFilename:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilename:", v12);

  }
  else
  {
    getWFWatchSyncLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315650;
      v18 = "-[VCIntentDefinitionChange readFrom:error:]_block_invoke";
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_ERROR, "%s Received file \"%{public}@\" with empty filename or data for %{public}@, dropping", (uint8_t *)&v17, 0x20u);

    }
    v11 = 0;
  }

  return v11;
}

id __42__VCIntentDefinitionChange_writeTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  v16 = 0;
  objc_msgSend(v3, "mappedDataWithError:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v16;
  v8 = v16;
  objc_msgSend(v4, "setData:", v6);

  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
  objc_msgSend(v4, "name");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v4, "data"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    getWFWatchSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v18 = "-[VCIntentDefinitionChange writeTo:error:]_block_invoke";
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Unable to read \"%{public}@\" when syncing intent definitions for %{public}@: %{public}@", buf, 0x2Au);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

  return v4;
}

uint64_t __36__VCIntentDefinitionChange_checksum__block_invoke(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), a2, len);
}

id __65__VCIntentDefinitionChange_initWithApplicationRecord_changeType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0D13F78];
  v3 = (void *)MEMORY[0x1E0DC7B30];
  v4 = *MEMORY[0x1E0CEC4A0];
  v5 = a2;
  objc_msgSend(v3, "typeWithUTType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileWithURL:options:ofType:", v5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFilename:", v8);
  return v7;
}

+ (int)messageType
{
  return 1;
}

@end

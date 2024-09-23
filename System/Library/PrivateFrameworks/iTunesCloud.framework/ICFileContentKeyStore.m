@implementation ICFileContentKeyStore

- (ICFileContentKeyStore)initWithPath:(id)a3
{
  id v4;
  ICFileContentKeyStore *v5;
  uint64_t v6;
  NSString *filePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICFileContentKeyStore;
  v5 = -[ICFileContentKeyStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v6;

  }
  return v5;
}

- (BOOL)containsKeyForIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v10;

  v10 = 0;
  -[ICFileContentKeyStore _keyEntryForIdentifier:error:](self, "_keyEntryForIdentifier:error:", a3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (!v5)
  {
    v8 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v5, "keyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v6);
LABEL_4:

  return v8;
}

- (id)loadKeyForIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  -[ICFileContentKeyStore _keyEntryForIdentifier:error:](self, "_keyEntryForIdentifier:error:", a3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v5;
}

- (id)saveKey:(id)a3 forIdentifier:(id)a4 adamID:(id)a5 withRenewalDate:(id)a6 accountDSID:(id)a7 keyServerProtocolType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ICContentKeyStoreEntry *v19;
  void *v20;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[ICContentKeyStoreEntry initWithIdentifier:]([ICContentKeyStoreEntry alloc], "initWithIdentifier:", v17);

  -[ICContentKeyStoreEntry setKeyData:](v19, "setKeyData:", v18);
  -[ICContentKeyStoreEntry setRenewalDate:](v19, "setRenewalDate:", v15);

  -[ICContentKeyStoreEntry setAccountDSID:](v19, "setAccountDSID:", v14);
  -[ICContentKeyStoreEntry setAdamID:](v19, "setAdamID:", v16);

  -[ICContentKeyStoreEntry setKeyServerProtocolType:](v19, "setKeyServerProtocolType:", a8);
  -[ICFileContentKeyStore saveKeyEntry:](self, "saveKeyEntry:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)saveKeyEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFileContentKeyStore _filePathForKeyIdentifier:](self, "_filePathForKeyIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v6, 0);

  objc_msgSend(v4, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v8, "writeToURL:error:", v9, &v12);
  v10 = v12;

  return v10;
}

- (id)removeKeyForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v7;

  -[ICFileContentKeyStore _filePathForKeyIdentifier:](self, "_filePathForKeyIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "removeItemAtPath:error:", v3, &v7);
  v5 = v7;

  return v5;
}

- (id)removeAllKeys
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  ICFileContentKeyStore *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enumeratorAtPath:", self->_filePath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("ic-key"))
          && objc_msgSend(v9, "hasSuffix:", CFSTR("dat")))
        {
          -[NSString stringByAppendingPathComponent:](v13->_filePath, "stringByAppendingPathComponent:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v6;
          objc_msgSend(v14, "removeItemAtPath:error:", v10, &v15);
          v11 = v15;

          v6 = v11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)enumerateKeyEntriesUsingBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t i;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  ICContentKeyStoreEntry *v16;
  int v17;
  void *v18;
  void (**v19)(id, ICContentKeyStoreEntry *, _BYTE *);
  void *v20;
  ICFileContentKeyStore *v21;
  unsigned __int8 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = (void (**)(id, ICContentKeyStoreEntry *, _BYTE *))a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enumeratorAtPath:", self->_filePath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v8 = CFSTR("dat");
    v20 = v4;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("ic-key"))
          && objc_msgSend(v10, "hasSuffix:", v8))
        {
          v11 = v8;
          -[NSString stringByAppendingPathComponent:](v21->_filePath, "stringByAppendingPathComponent:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc(MEMORY[0x1E0C99D80]);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithContentsOfURL:error:", v14, 0);

          if (v15)
          {
            v22 = 0;
            v16 = -[ICContentKeyStoreEntry initWithDictionaryRepresentation:]([ICContentKeyStoreEntry alloc], "initWithDictionaryRepresentation:", v15);
            v19[2](v19, v16, &v22);
            v17 = v22;

            if (v17)
            {

              v4 = v20;
              goto LABEL_15;
            }
          }

          v8 = v11;
          v4 = v20;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

}

- (id)incrementFailureCountForKeyWithIdentifier:(id)a3
{
  id v4;
  ICContentKeyStoreEntry *v5;
  id v6;
  void *v7;
  id v9;

  v4 = a3;
  v9 = 0;
  -[ICFileContentKeyStore _keyEntryForIdentifier:error:](self, "_keyEntryForIdentifier:error:", v4, &v9);
  v5 = (ICContentKeyStoreEntry *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v6)
  {
    if (!v5)
      v5 = -[ICContentKeyStoreEntry initWithIdentifier:]([ICContentKeyStoreEntry alloc], "initWithIdentifier:", v4);
    -[ICContentKeyStoreEntry setFailureCount:](v5, "setFailureCount:", -[ICContentKeyStoreEntry failureCount](v5, "failureCount") + 1);
    -[ICFileContentKeyStore saveKeyEntry:](self, "saveKeyEntry:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_keyEntryForIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  ICContentKeyStoreEntry *v12;
  id v13;
  ICContentKeyStoreEntry *v14;
  id v16;

  -[ICFileContentKeyStore _filePathForKeyIdentifier:](self, "_filePathForKeyIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v10 = (void *)objc_msgSend(v8, "initWithContentsOfURL:error:", v9, &v16);
    v11 = v16;

    if (v10)
      v12 = -[ICContentKeyStoreEntry initWithDictionaryRepresentation:]([ICContentKeyStoreEntry alloc], "initWithDictionaryRepresentation:", v10);
    else
      v12 = 0;

  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  v13 = objc_retainAutorelease(v11);
  *a4 = v13;
  v14 = v12;

  return v14;
}

- (id)_filePathForKeyIdentifier:(id)a3
{
  NSString *filePath;
  void *v4;
  void *v5;

  filePath = self->_filePath;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lud.%@"), CFSTR("ic-key"), objc_msgSend(a3, "hash"), CFSTR("dat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](filePath, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end

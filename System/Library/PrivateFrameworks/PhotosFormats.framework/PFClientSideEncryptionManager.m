@implementation PFClientSideEncryptionManager

- (PFClientSideEncryptionManager)initWithProfile:(id)a3
{
  id v4;
  PFClientSideEncryptionManager *v5;
  PFClientSideEncryptionManager *v6;
  void *v7;
  uint64_t v8;
  NSString *keychainAccessGroup;
  uint64_t v10;
  NSString *keychainApplicationLabel;
  uint64_t v12;
  NSString *keychainViewHint;
  os_log_t v14;
  OS_os_log *logHandle;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PFClientSideEncryptionManager;
  v5 = -[PFClientSideEncryptionManager init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PFClientSideEncryptionManager configurationForProfile:](v5, "configurationForProfile:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keychainAccessGroup"));
    v8 = objc_claimAutoreleasedReturnValue();
    keychainAccessGroup = v6->_keychainAccessGroup;
    v6->_keychainAccessGroup = (NSString *)v8;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("applicationLabel"));
    v10 = objc_claimAutoreleasedReturnValue();
    keychainApplicationLabel = v6->_keychainApplicationLabel;
    v6->_keychainApplicationLabel = (NSString *)v10;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keychainViewHint"));
    v12 = objc_claimAutoreleasedReturnValue();
    keychainViewHint = v6->_keychainViewHint;
    v6->_keychainViewHint = (NSString *)v12;

    v6->_state = 0;
    v6->_lock._os_unfair_lock_opaque = 0;
    v14 = os_log_create("com.apple.photos.backend", "ClientSideEncryptionManager");
    logHandle = v6->_logHandle;
    v6->_logHandle = (OS_os_log *)v14;

  }
  return v6;
}

- (id)configurationForProfile:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("Photos");
  v19[0] = CFSTR("keychainAccessGroup");
  v19[1] = CFSTR("keychainViewHint");
  v3 = *MEMORY[0x1E0CD6C08];
  v20[0] = CFSTR("com.apple.photos.client-side-encryption-manager");
  v20[1] = v3;
  v19[2] = CFSTR("applicationLabel");
  v20[2] = CFSTR("com.apple.photos.client-side-encryption-manager");
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  v21[1] = CFSTR("PhotosUnitTest");
  v17[0] = CFSTR("keychainAccessGroup");
  v17[1] = CFSTR("keychainViewHint");
  v18[0] = CFSTR("com.apple.photos.client-side-encryption-manager.unit-test");
  v18[1] = v3;
  v17[2] = CFSTR("applicationLabel");
  v18[2] = CFSTR("com.apple.photos.client-side-encryption-manager.unit-test");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  v21[2] = CFSTR("PhotosCloudPhotoD");
  v15[0] = CFSTR("keychainAccessGroup");
  v15[1] = CFSTR("keychainViewHint");
  v16[0] = CFSTR("com.apple.photos.client-side-encryption-manager");
  v16[1] = v3;
  v15[2] = CFSTR("applicationLabel");
  v16[2] = CFSTR("com.apple.photos.client-side-encryption-manager.cloudphotod");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  v21[3] = CFSTR("MediaAnalysis");
  v13[0] = CFSTR("keychainAccessGroup");
  v13[1] = CFSTR("keychainViewHint");
  v14[0] = CFSTR("com.apple.mediaanalysisd.client-side-encryption-manager");
  v14[1] = v3;
  v13[2] = CFSTR("applicationLabel");
  v14[2] = CFSTR("com.apple.mediaanalysisd.client-side-encryption-manager");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)start
{
  os_unfair_lock_s *p_lock;
  BOOL v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  unint64_t v11;
  NSObject *logHandle;
  uint8_t v13[16];
  id v14;
  id v15;
  id v16;
  id v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v16 = 0;
  v17 = 0;
  v4 = -[PFClientSideEncryptionManager findExistingKeychainEntryReturningKeyData:keyInfo:](self, "findExistingKeychainEntryReturningKeyData:keyInfo:", &v17, &v16);
  v5 = v17;
  v6 = v16;
  v7 = v6;
  if (v4)
  {
    v8 = v6;
    v9 = v5;
LABEL_5:
    objc_storeStrong((id *)&self->_keyData, v5);
    objc_storeStrong((id *)&self->_keyMetadata, v7);
    v11 = 4;
    goto LABEL_9;
  }
  v14 = v6;
  v15 = v5;
  v10 = -[PFClientSideEncryptionManager createKeychainEntryReturningKeyData:keyInfo:](self, "createKeychainEntryReturningKeyData:keyInfo:", &v15, &v14);
  v9 = v15;

  v8 = v14;
  if (v10)
  {
    v7 = v8;
    v5 = v9;
    goto LABEL_5;
  }
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl(&dword_1A16EE000, logHandle, OS_LOG_TYPE_ERROR, "Unable to find or create client side encryption manager key", v13, 2u);
  }
  v11 = 1;
LABEL_9:
  self->_state = v11;
  os_unfair_lock_unlock(p_lock);

}

- (id)_getKeyData
{
  return self->_keyData;
}

- (BOOL)findExistingKeychainEntryReturningKeyData:(id *)a3 keyInfo:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  NSString *keychainApplicationLabel;
  NSString *keychainAccessGroup;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  OSStatus v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *logHandle;
  NSObject *v22;
  CFTypeRef result;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  _QWORD v28[2];
  _QWORD v29[7];
  _QWORD v30[8];

  v30[7] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CD6CC0];
  v8 = *MEMORY[0x1E0CD6900];
  v29[0] = *MEMORY[0x1E0CD6C98];
  v29[1] = v8;
  keychainAccessGroup = self->_keychainAccessGroup;
  keychainApplicationLabel = self->_keychainApplicationLabel;
  v30[0] = v7;
  v30[1] = keychainApplicationLabel;
  v11 = *MEMORY[0x1E0CD6B80];
  v29[2] = *MEMORY[0x1E0CD6898];
  v29[3] = v11;
  v30[2] = keychainAccessGroup;
  v30[3] = MEMORY[0x1E0C9AAB0];
  v12 = *MEMORY[0x1E0CD7010];
  v29[4] = *MEMORY[0x1E0CD7018];
  v29[5] = v12;
  v30[4] = MEMORY[0x1E0C9AAB0];
  v30[5] = MEMORY[0x1E0C9AAB0];
  v29[6] = *MEMORY[0x1E0CD6B78];
  v30[6] = self->_keychainViewHint;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v14 = SecItemCopyMatching(v13, &result);
  v15 = (void *)result;
  if (v14 || !result)
  {
    logHandle = self->_logHandle;
    if (v14 == -25300)
    {
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, logHandle, OS_LOG_TYPE_INFO, "No existing client side encryption manager keychain item exists", buf, 2u);
      }
    }
    else if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      LODWORD(v28[0]) = v14;
      WORD2(v28[0]) = 2048;
      *(_QWORD *)((char *)v28 + 6) = v15;
      _os_log_error_impl(&dword_1A16EE000, logHandle, OS_LOG_TYPE_ERROR, "Error querying for existing client side encryption manager keychain item: %d, %p", buf, 0x12u);
    }
    v20 = 0;
  }
  else
  {
    objc_msgSend((id)result, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6990]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_logHandle;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v28[0] = v16;
      _os_log_impl(&dword_1A16EE000, v17, OS_LOG_TYPE_INFO, "Found existing client side encryption manager keychain item with creation date %{public}@", buf, 0xCu);
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v18 != 0;
    if (v18)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v18);
      if (a4)
      {
        v25 = CFSTR("key-creation-date");
        v26 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v22 = self->_logHandle;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28[0] = v16;
        _os_log_error_impl(&dword_1A16EE000, v22, OS_LOG_TYPE_ERROR, "Unexpected missing key data in existing keychain item with creation date %{public}@", buf, 0xCu);
      }
    }

  }
  return v20;
}

- (BOOL)createKeychainEntryReturningKeyData:(id *)a3 keyInfo:(id *)a4
{
  int v7;
  int v8;
  NSObject *logHandle;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *keychainApplicationLabel;
  NSString *keychainAccessGroup;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *keychainViewHint;
  const __CFDictionary *v25;
  OSStatus v26;
  OSStatus v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  CFTypeRef result;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  _QWORD v38[10];
  _QWORD v39[10];
  _BYTE bytes[32];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = SecRandomCopyBytes(0, 0x20uLL, bytes);
  if (v7)
  {
    v8 = v7;
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v37) = v8;
      _os_log_error_impl(&dword_1A16EE000, logHandle, OS_LOG_TYPE_ERROR, "Unable to generate random bytes for client side encryption manager key: %d", buf, 8u);
    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CD6CC0];
    v13 = *MEMORY[0x1E0CD6900];
    v38[0] = *MEMORY[0x1E0CD6C98];
    v38[1] = v13;
    keychainAccessGroup = self->_keychainAccessGroup;
    keychainApplicationLabel = self->_keychainApplicationLabel;
    v39[0] = v12;
    v39[1] = keychainApplicationLabel;
    v16 = *MEMORY[0x1E0CD68A0];
    v38[2] = *MEMORY[0x1E0CD6898];
    v38[3] = v16;
    v17 = *MEMORY[0x1E0CD68A8];
    v39[2] = keychainAccessGroup;
    v39[3] = v17;
    v18 = MEMORY[0x1E0C9AAB0];
    v19 = *MEMORY[0x1E0CD69F8];
    v38[4] = *MEMORY[0x1E0CD6B80];
    v38[5] = v19;
    v20 = *MEMORY[0x1E0CD6A18];
    v39[4] = MEMORY[0x1E0C9AAB0];
    v39[5] = v20;
    v38[6] = *MEMORY[0x1E0CD6A20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 256);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CD7010];
    v39[6] = v21;
    v39[7] = v18;
    v23 = *MEMORY[0x1E0CD70D8];
    v38[7] = v22;
    v38[8] = v23;
    v38[9] = *MEMORY[0x1E0CD6B78];
    keychainViewHint = self->_keychainViewHint;
    v39[8] = v11;
    v39[9] = keychainViewHint;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 10);
    v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    result = 0;
    v26 = SecItemAdd(v25, &result);
    v10 = v26 == 0;
    if (v26)
    {
      v27 = v26;
      v28 = self->_logHandle;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v37) = v27;
        _os_log_error_impl(&dword_1A16EE000, v28, OS_LOG_TYPE_ERROR, "Unable to add keychain item: %d", buf, 8u);
      }
      v29 = 0;
    }
    else
    {
      v30 = (void *)result;
      objc_msgSend((id)result, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6990]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = self->_logHandle;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v29;
        _os_log_impl(&dword_1A16EE000, v31, OS_LOG_TYPE_DEFAULT, "Created client side encryption manager key with creation date %{public}@", buf, 0xCu);
      }

      if (a3)
        *a3 = objc_retainAutorelease(v11);
      if (a4)
      {
        v34 = CFSTR("key-creation-date");
        v35 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  return v10;
}

- (void)shutdownWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  self->_state = 5;
  os_unfair_lock_unlock(&self->_lock);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)archiveDirectoryAtURL:(id)a3 toOutputURL:(id)a4 dataType:(int64_t)a5 options:(id)a6 entryPredicate:(id)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t, id);
  unint64_t state;
  PFAppleArchive *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _BOOL4 v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *logHandle;
  const char *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void (**)(id, uint64_t, id))a8;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 4)
  {
    v17 = -[PFAppleArchiveStream initWithArchiveURL:]([PFAppleArchive alloc], "initWithArchiveURL:", v13);
    -[PFAppleArchiveStream setEncryptionKey:](v17, "setEncryptionKey:", self->_keyData);
    v38[0] = CFSTR("com.apple.photos.backend.client-side-encryption.key-creation-date");
    -[NSDictionary objectForKeyedSubscript:](self->_keyMetadata, "objectForKeyedSubscript:", CFSTR("key-creation-date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = CFSTR("com.apple.photos.backend.client-side-encryption.version");
    v39[0] = v19;
    objc_msgSend(&unk_1E45CA6D0, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFAppleArchiveStream setEncryptedArchiveMetadata:](v17, "setEncryptedArchiveMetadata:", v21);

    v35 = 0;
    LODWORD(v19) = -[PFAppleArchive openForWriting:](v17, "openForWriting:", &v35);
    v22 = v35;
    v23 = v22;
    if ((_DWORD)v19)
    {
      v34 = v22;
      v24 = -[PFAppleArchive encodeContentOfDirectoryAtURL:entryPredicate:error:](v17, "encodeContentOfDirectoryAtURL:entryPredicate:error:", v12, v14, &v34);
      v25 = v34;

      if (v24)
      {
        v33 = v25;
        v26 = -[PFAppleArchive close:](v17, "close:", &v33);
        v23 = v33;

        if (v26)
        {
          v27 = 1;
LABEL_12:
          v15[2](v15, v27, v23);

          goto LABEL_13;
        }
      }
      else
      {
        v23 = v25;
      }
      logHandle = self->_logHandle;
      if (!os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        v27 = 0;
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      v37 = v23;
      v32 = "Error archiving the directory content. Error: %@";
    }
    else
    {
      logHandle = self->_logHandle;
      if (!os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138412290;
      v37 = v23;
      v32 = "Error opening archive for directory writing: %@";
    }
    _os_log_error_impl(&dword_1A16EE000, logHandle, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
    goto LABEL_11;
  }
  v28 = (void *)MEMORY[0x1E0CB35C8];
  v40 = *MEMORY[0x1E0CB2938];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state %tu"), self->_state);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500101, v30);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  v15[2](v15, 0, v23);
LABEL_13:

}

- (BOOL)unarchiveDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t state;
  PFAppleArchive *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  NSObject *logHandle;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  BOOL v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 4)
  {
    v8 = -[PFAppleArchiveStream initWithArchiveURL:]([PFAppleArchive alloc], "initWithArchiveURL:", v6);
    -[PFAppleArchiveStream setEncryptionKey:](v8, "setEncryptionKey:", self->_keyData);
    v31 = 0;
    v9 = -[PFAppleArchive openForReading:](v8, "openForReading:", &v31);
    v10 = v31;
    -[NSDictionary objectForKeyedSubscript:](self->_keyMetadata, "objectForKeyedSubscript:", CFSTR("key-creation-date"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFAppleArchiveStream encryptedArchiveMetadata](v8, "encryptedArchiveMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("com.apple.photos.backend.client-side-encryption.key-creation-date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("com.apple.photos.backend.client-side-encryption.version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v30 = v10;
      v27 = -[PFAppleArchive decodeContentOfDirectoryWithError:](v8, "decodeContentOfDirectoryWithError:", &v30);
      v14 = v30;

      v29 = 0;
      v15 = -[PFAppleArchive close:](v8, "close:", &v29);
      v16 = v29;
      v17 = v16;
      if (v15)
      {
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          v33 = v13;
          v34 = 2114;
          v35 = v28;
          v36 = 2114;
          v37 = v12;
          _os_log_impl(&dword_1A16EE000, logHandle, OS_LOG_TYPE_INFO, "Successfully unarchived directory encrypted archive, version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@", buf, 0x20u);
        }

        if (v27)
        {
          v19 = 1;
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        if (v14)
          v23 = v14;
        else
          v23 = v16;
        v24 = v23;

        v14 = v24;
      }
    }
    else
    {
      v14 = v10;
    }
    v25 = self->_logHandle;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v33 = v13;
      v34 = 2114;
      v35 = v28;
      v36 = 2114;
      v37 = v12;
      v38 = 2112;
      v39 = v14;
      _os_log_error_impl(&dword_1A16EE000, v25, OS_LOG_TYPE_ERROR, "Failed to unarchive the directory encrypted archive, version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@, error: %@", buf, 0x2Au);
      if (a4)
        goto LABEL_18;
    }
    else if (a4)
    {
LABEL_18:
      v14 = objc_retainAutorelease(v14);
      v19 = 0;
      *a4 = v14;
      goto LABEL_21;
    }
    v19 = 0;
    goto LABEL_21;
  }
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v40 = *MEMORY[0x1E0CB2938];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state %tu"), self->_state);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500101, v22);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v14 = objc_retainAutorelease(v14);
    v19 = 0;
    *a4 = v14;
  }
  else
  {
    v19 = 0;
  }
LABEL_22:

  return v19;
}

- (BOOL)archiveFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t state;
  PFAppleArchive *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *logHandle;
  id v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  NSObject *v27;
  id v29;
  id v30;
  uint8_t buf[4];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 4)
  {
    v11 = -[PFAppleArchiveStream initWithArchiveURL:]([PFAppleArchive alloc], "initWithArchiveURL:", v9);
    -[PFAppleArchiveStream setEncryptionKey:](v11, "setEncryptionKey:", self->_keyData);
    v33[0] = CFSTR("com.apple.photos.backend.client-side-encryption.key-creation-date");
    -[NSDictionary objectForKeyedSubscript:](self->_keyMetadata, "objectForKeyedSubscript:", CFSTR("key-creation-date"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = CFSTR("com.apple.photos.backend.client-side-encryption.version");
    v34[0] = v13;
    objc_msgSend(&unk_1E45CA6D0, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFAppleArchiveStream setEncryptedArchiveMetadata:](v11, "setEncryptedArchiveMetadata:", v15);

    if (-[PFAppleArchive openForWriting:](v11, "openForWriting:", a5))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 1, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v8, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[PFAppleArchive encodeData:filename:error:](v11, "encodeData:filename:error:", v16, v17, a5);

        if (v18 && -[PFAppleArchive close:](v11, "close:", a5))
        {
          LOBYTE(a5) = 1;
LABEL_16:

          goto LABEL_17;
        }
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
        {
          v23 = *a5;
          *(_DWORD *)buf = 67109378;
          LODWORD(v32[0]) = v18;
          WORD2(v32[0]) = 2112;
          *(_QWORD *)((char *)v32 + 6) = v23;
          v24 = "Error archiving single file content (didEncode=%d). Error: %@";
          v25 = logHandle;
          v26 = 18;
LABEL_20:
          _os_log_error_impl(&dword_1A16EE000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
        }
      }
      else
      {
        v27 = self->_logHandle;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v30 = *a5;
          *(_DWORD *)buf = 138412290;
          v32[0] = v30;
          v24 = "Unable to read single-file encrypted archive input data: %@";
          v25 = v27;
          v26 = 12;
          goto LABEL_20;
        }
      }
      LOBYTE(a5) = 0;
      goto LABEL_16;
    }
    v21 = self->_logHandle;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v29 = *a5;
      *(_DWORD *)buf = 138412290;
      v32[0] = v29;
      _os_log_error_impl(&dword_1A16EE000, v21, OS_LOG_TYPE_ERROR, "Error opening archive for single file writing: %@", buf, 0xCu);
    }
LABEL_11:
    LOBYTE(a5) = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (a5)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state %tu"), self->_state);
    v11 = (PFAppleArchive *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500101, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_18:

  return (char)a5;
}

- (BOOL)unarchiveFileAtURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t state;
  PFAppleArchive *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  _BOOL4 v20;
  id v21;
  int v22;
  NSObject *v23;
  BOOL v24;
  void *v25;
  void *v26;
  NSObject *logHandle;
  NSObject *v28;
  id v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  _BYTE v45[10];
  _BYTE v46[10];
  _BYTE v47[10];
  _BYTE v48[10];
  __int16 v49;
  id v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(&self->_lock);
  if (state == 4)
  {
    v11 = -[PFAppleArchiveStream initWithArchiveURL:]([PFAppleArchive alloc], "initWithArchiveURL:", v8);
    -[PFAppleArchiveStream setEncryptionKey:](v11, "setEncryptionKey:", self->_keyData);
    v12 = -[PFAppleArchive openForReading:](v11, "openForReading:", a5);
    -[NSDictionary objectForKeyedSubscript:](self->_keyMetadata, "objectForKeyedSubscript:", CFSTR("key-creation-date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFAppleArchiveStream encryptedArchiveMetadata](v11, "encryptedArchiveMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.photos.backend.client-side-encryption.key-creation-date"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.photos.backend.client-side-encryption.version"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (!v12)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        v30 = *a5;
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)v45 = v17;
        *(_WORD *)&v45[8] = 2114;
        *(_QWORD *)v46 = v13;
        *(_WORD *)&v46[8] = 2114;
        *(_QWORD *)v47 = v15;
        *(_WORD *)&v47[8] = 2112;
        *(_QWORD *)v48 = v30;
        _os_log_error_impl(&dword_1A16EE000, logHandle, OS_LOG_TYPE_ERROR, "Failed to open single file encrypted archive, version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@, error: %@", buf, 0x2Au);
      }
      v24 = 0;
      goto LABEL_23;
    }
    v33 = v15;
    v34 = v9;
    v32 = (void *)v16;
    v35 = MEMORY[0x1A1B0CDDC]();
    v42 = 0;
    v43 = 0;
    v41 = 0;
    v18 = -[PFAppleArchive decodeData:filename:error:](v11, "decodeData:filename:error:", &v43, &v42, &v41);
    v38 = v43;
    v36 = v42;
    v19 = v41;
    v40 = v19;
    v20 = -[PFAppleArchive close:](v11, "close:", &v40);
    v21 = v40;

    v31 = v18;
    if (v18 && v20)
    {
      v39 = v21;
      v9 = v34;
      v22 = objc_msgSend(v38, "writeToURL:options:error:", v34, 1, &v39);
      v37 = v39;

      if (v22)
      {
        v23 = self->_logHandle;
        v17 = v32;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)v45 = v36;
          *(_WORD *)&v45[8] = 2114;
          *(_QWORD *)v46 = v32;
          *(_WORD *)&v46[8] = 2114;
          *(_QWORD *)v47 = v13;
          *(_WORD *)&v47[8] = 2114;
          v15 = v33;
          *(_QWORD *)v48 = v33;
          _os_log_debug_impl(&dword_1A16EE000, v23, OS_LOG_TYPE_DEBUG, "Successfully unarchived single file encrypted archive, filename=%@, version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@", buf, 0x2Au);
          v24 = 1;
        }
        else
        {
          v24 = 1;
          v15 = v33;
        }
        v25 = (void *)v35;
LABEL_19:

        objc_autoreleasePoolPop(v25);
        if (a5 && !v24)
          *a5 = objc_retainAutorelease(v37);

LABEL_23:
        goto LABEL_24;
      }
      v17 = v32;
    }
    else
    {
      v37 = v21;
      v17 = v32;
      v9 = v34;
    }
    v28 = self->_logHandle;
    v25 = (void *)v35;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v45 = v31;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v20;
      *(_WORD *)v46 = 2114;
      *(_QWORD *)&v46[2] = v17;
      *(_WORD *)v47 = 2114;
      *(_QWORD *)&v47[2] = v13;
      *(_WORD *)v48 = 2114;
      v15 = v33;
      *(_QWORD *)&v48[2] = v33;
      v49 = 2112;
      v50 = v37;
      _os_log_error_impl(&dword_1A16EE000, v28, OS_LOG_TYPE_ERROR, "Failed to unarchive single file encrypted archive (didDecode=%d, didClose=%d), version=%{public}@, keychain item creation date=%{public}@, archive key creation date=%{public}@, error: %@", buf, 0x36u);
      v24 = 0;
    }
    else
    {
      v24 = 0;
      v15 = v33;
    }
    goto LABEL_19;
  }
  if (a5)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state %tu"), self->_state);
    v11 = (PFAppleArchive *)objc_claimAutoreleasedReturnValue();
    v52[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500101, v13);
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  v24 = 0;
LABEL_25:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_keyMetadata, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_keychainViewHint, 0);
  objc_storeStrong((id *)&self->_keychainApplicationLabel, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
}

@end

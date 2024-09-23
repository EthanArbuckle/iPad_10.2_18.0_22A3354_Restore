@implementation PPKPayloadEncryption

+ (id)sharedInstance
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PPKPayloadEncryption_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)_sharedInstance;
}

void __38__PPKPayloadEncryption_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_sharedInstance;
  _sharedInstance = (uint64_t)v1;

}

- (PPKPayloadEncryption)init
{
  PPKPayloadEncryption *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPKPayloadEncryption;
  result = -[PPKPayloadEncryption init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_keyInitialized = 0;
  return result;
}

- (id)encryptData:(_BYTE *)a1
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  size_t v10;
  void *v11;
  const void *v12;
  id v13;
  const void *v14;
  id v15;
  CCCryptorStatus v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  const char *v20;
  uint64_t v21;
  size_t v23;
  uint8_t v24[4];
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_18;
  if (!v3)
  {
    +[PPKImageWriter log]();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "PPKPayloadEncryption: Received nil data. Returning nil.";
LABEL_16:
      _os_log_impl(&dword_1DDB0F000, v6, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_17:

LABEL_18:
    v19 = 0;
    goto LABEL_23;
  }
  if (!a1[8])
    objc_msgSend(a1, "initializeKey");
  v5 = a1[9];
  +[PPKImageWriter log]();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      v20 = "PPKPayloadEncryption: failed to load key from keychain so we can't encrypt data. Returning nil.";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v7)
  {
    *(_DWORD *)buf = 134217984;
    v27 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1DDB0F000, v6, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: %lu bytes to encrypt", buf, 0xCu);
  }

  generateRandomKey(buf);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "length");
  v10 = objc_msgSend(v8, "length") + v9;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", (v10 + 31) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v8);
  objc_msgSend(v11, "appendData:", v4);
  objc_msgSend(v11, "setLength:", (v10 + 31) & 0xFFFFFFFFFFFFFFF0);
  v23 = 0;
  v12 = a1 + 10;
  v13 = objc_retainAutorelease(v11);
  v14 = (const void *)objc_msgSend(v13, "mutableBytes");
  v15 = objc_retainAutorelease(v13);
  v16 = CCCrypt(0, 0, 1u, v12, 0x10uLL, 0, v14, v10, (void *)objc_msgSend(v15, "mutableBytes"), (v10 + 31) & 0xFFFFFFFFFFFFFFF0, &v23);
  +[PPKImageWriter log]();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)v24 = 134217984;
      v25 = v16;
      _os_log_impl(&dword_1DDB0F000, v17, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: Failed to encrypt with error code: %ld", v24, 0xCu);
    }

    v19 = 0;
  }
  else
  {
    if (v18)
    {
      v21 = objc_msgSend(v15, "length");
      *(_DWORD *)v24 = 134217984;
      v25 = v21;
      _os_log_impl(&dword_1DDB0F000, v17, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: %lu bytes encrypted", v24, 0xCu);
    }

    v19 = v15;
  }

LABEL_23:
  return v19;
}

- (id)decryptData:(_BYTE *)a1
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  char *dataOut;
  id v9;
  CCCryptorStatus v10;
  CCCryptorStatus v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  size_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_17;
  if (!v3 || !objc_msgSend(v3, "length"))
  {
    +[PPKImageWriter log]();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

LABEL_17:
      v13 = 0;
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v14 = "PPKPayloadEncryption: Received nil data. Returning nil.";
LABEL_15:
    _os_log_impl(&dword_1DDB0F000, v6, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    goto LABEL_16;
  }
  if (!a1[8])
    objc_msgSend(a1, "initializeKey");
  v5 = a1[9];
  +[PPKImageWriter log]();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (!v7)
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v14 = "PPKPayloadEncryption: failed to load key from keychain so we can't decrypt data. Returning nil.";
    goto LABEL_15;
  }
  if (v7)
  {
    *(_DWORD *)buf = 134217984;
    v19 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1DDB0F000, v6, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: %lu bytes to decrypt", buf, 0xCu);
  }

  v17 = 0;
  dataOut = (char *)malloc_type_malloc(objc_msgSend(v4, "length"), 0xDC078F40uLL);
  v9 = objc_retainAutorelease(v4);
  v10 = CCCrypt(1u, 0, 1u, a1 + 10, 0x10uLL, 0, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length") - 16, dataOut, objc_msgSend(v9, "length") - 16, &v17);
  if (v10)
  {
    v11 = v10;
    +[PPKImageWriter log]();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v11;
      _os_log_impl(&dword_1DDB0F000, v12, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: Failed to decrypt with error code: %ld", buf, 0xCu);
    }
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", dataOut + 16, v17 - 16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPKImageWriter log]();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "length");
      *(_DWORD *)buf = 134217984;
      v19 = v15;
      _os_log_impl(&dword_1DDB0F000, v12, OS_LOG_TYPE_DEFAULT, "PPKPayloadEncryption: %lu bytes decrypted", buf, 0xCu);
    }
  }

  free(dataOut);
LABEL_23:

  return v13;
}

- (void)initializeKey
{
  PPKPayloadEncryption *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  OSStatus v13;
  OSStatus v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFDictionary *v24;
  OSStatus v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFDictionary *query;
  CFTypeRef cf;
  CFTypeRef result;
  _BYTE v34[12];
  __int16 v35;
  const __CFString *v36;
  _QWORD v37[8];
  _QWORD v38[8];
  _QWORD v39[7];
  _QWORD v40[9];

  v40[7] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_keyInitialized)
  {
    v2->_haveKey = 0;
    result = 0;
    v3 = *MEMORY[0x1E0CD6C98];
    v4 = *MEMORY[0x1E0CD6CA8];
    v5 = *MEMORY[0x1E0CD7010];
    v39[0] = *MEMORY[0x1E0CD6C98];
    v39[1] = v5;
    v6 = *MEMORY[0x1E0C9AE50];
    v29 = v4;
    v40[0] = v4;
    v40[1] = v6;
    v7 = *MEMORY[0x1E0CD6898];
    v8 = *MEMORY[0x1E0CD6B80];
    v39[2] = *MEMORY[0x1E0CD6898];
    v39[3] = v8;
    v40[2] = CFSTR("com.apple.Markup");
    v40[3] = v6;
    v9 = *MEMORY[0x1E0CD6B58];
    v10 = *MEMORY[0x1E0CD68F8];
    v39[4] = *MEMORY[0x1E0CD6B58];
    v39[5] = v10;
    v30 = v10;
    v40[4] = CFSTR("Sketch Service Privacy");
    v40[5] = CFSTR("Sketch Service");
    v11 = *MEMORY[0x1E0CD6F30];
    v39[6] = *MEMORY[0x1E0CD6F30];
    v12 = *MEMORY[0x1E0CD6F40];
    v40[6] = *MEMORY[0x1E0CD6F40];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 7);
    query = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = SecItemCopyMatching(query, &result);
    v14 = v13;
    if (v13 == -25300)
    {
      generateRandomKey(v2->_key);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2->_key, 16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "base64EncodedDataWithOptions:", 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v37[0] = v3;
      v37[1] = v9;
      v38[0] = v29;
      v38[1] = CFSTR("Sketch Service Privacy");
      v37[2] = *MEMORY[0x1E0CD6A90];
      v37[3] = v7;
      v38[2] = CFSTR("Sketch Service Privacy");
      v38[3] = CFSTR("com.apple.Markup");
      v38[4] = v6;
      v20 = *MEMORY[0x1E0CD6988];
      v37[4] = v8;
      v37[5] = v20;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Used for the encryption of image edit state metadata for the Markup service. Deletion will make it impossible for Markup to modify annotations that were previously placed on an image using Markup."), &stru_1EA857F40, CFSTR("PPKPayloadEncryption"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[5] = v22;
      v38[6] = CFSTR("Sketch Service");
      v23 = *MEMORY[0x1E0CD70D8];
      v37[6] = v30;
      v37[7] = v23;
      v38[7] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 8);
      v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      cf = 0;
      v25 = SecItemAdd(v24, &cf);
      if (v25)
      {
        +[PPKImageWriter log]();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v34 = 134217984;
          *(_QWORD *)&v34[4] = v25;
          _os_log_impl(&dword_1DDB0F000, v26, OS_LOG_TYPE_DEFAULT, "Couldn't add key to keychain! [osErr:%ld]", v34, 0xCu);
        }

      }
      else
      {
        v2->_haveKey = 1;
      }
      if (cf)
        CFRelease(cf);

      v15 = v19;
    }
    else if (v13)
    {
      +[PPKImageWriter log]();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v34 = 134218242;
        *(_QWORD *)&v34[4] = v14;
        v35 = 2112;
        v36 = &stru_1EA857F40;
        _os_log_impl(&dword_1DDB0F000, v15, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching() returned error %ld: %@", v34, 0x16u);
      }
    }
    else
    {
      v15 = objc_msgSend((id)result, "mutableCopy");
      -[NSObject objectForKey:](v15, "objectForKey:", v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", query);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectForKey:", v5);
      objc_msgSend(v17, "setObject:forKey:", v6, *MEMORY[0x1E0CD7018]);
      objc_msgSend(v17, "setObject:forKey:", v12, v11);
      objc_msgSend(v17, "setObject:forKey:", v29, v3);
      objc_msgSend(v17, "setValue:forKey:", v16, v30);
      *(_QWORD *)v34 = 0;
      if (!SecItemCopyMatching((CFDictionaryRef)v17, (CFTypeRef *)v34))
      {
        v27 = *(void **)v34;
        if (*(_QWORD *)v34)
        {
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", *(_QWORD *)v34, 0);

          if (v28)
          {
            objc_msgSend(v28, "getBytes:length:", v2->_key, 16);
            v2->_haveKey = 1;

          }
        }
      }

    }
    v2->_keyInitialized = 1;

  }
  objc_sync_exit(v2);

}

@end

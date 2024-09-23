@implementation WBSHistoryCrypto

- (WBSHistoryCrypto)init
{
  return -[WBSHistoryCrypto initWithCryptographicKey:salt:](self, "initWithCryptographicKey:salt:", 0, 0);
}

- (WBSHistoryCrypto)initWithCryptographicKey:(id)a3 salt:(id)a4
{
  id v7;
  id v8;
  WBSHistoryCrypto *v9;
  WBSHistoryCrypto *v10;
  uint64_t v11;
  NSData *salt;
  WBSHistoryCrypto *v13;
  objc_super v15;
  _BYTE __buf[64];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryCrypto;
  v9 = -[WBSHistoryCrypto init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedCryptographicKey, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_salt, a4);
    }
    else
    {
      arc4random_buf(__buf, 0x40uLL);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __buf, 64);
      v11 = objc_claimAutoreleasedReturnValue();
      salt = v10->_salt;
      v10->_salt = (NSData *)v11;

    }
    v13 = v10;
  }

  return v10;
}

- (id)_createCryptographicKey
{
  _BYTE __buf[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  arc4random_buf(__buf, 0x20uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __buf, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createOrLoadCryptographicKey
{
  int v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;

  v3 = WBSGetKeychainData();
  v4 = 0;
  v5 = v4;
  if (v3)
  {
    v6 = WBSGetKeychainData();
    v7 = 0;
    if (v6)
    {
      -[WBSHistoryCrypto _createCryptographicKey](self, "_createCryptographicKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = WBSSetKeychainData();

      v11 = 0;
      v5 = v8;
      if (!v10)
        goto LABEL_8;
    }
    else
    {
      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      WBSSetKeychainData();

      v8 = v7;
    }
    v11 = v8;
    v8 = v5;
LABEL_8:

    goto LABEL_9;
  }
  v11 = v4;
  v8 = v11;
LABEL_9:

  return v11;
}

- (NSData)cryptographicKey
{
  NSData *cachedCryptographicKey;
  NSData *v4;
  NSData *v5;

  cachedCryptographicKey = self->_cachedCryptographicKey;
  if (!cachedCryptographicKey)
  {
    -[WBSHistoryCrypto _createOrLoadCryptographicKey](self, "_createOrLoadCryptographicKey");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedCryptographicKey;
    self->_cachedCryptographicKey = v4;

    cachedCryptographicKey = self->_cachedCryptographicKey;
  }
  return cachedCryptographicKey;
}

- (id)encryptDictionary:(id)a3
{
  void *v4;
  id v5;
  size_t dataOutAvailable;
  void *dataOut;
  id v8;
  const void *v9;
  void *v10;
  size_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  size_t v24;
  id v25;

  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
  if (v4)
  {
    v24 = 0;
    dataOutAvailable = objc_msgSend(v4, "length") + 32;
    dataOut = malloc_type_malloc(dataOutAvailable, 0x53E1B1DuLL);
    -[WBSHistoryCrypto cryptographicKey](self, "cryptographicKey");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const void *)objc_msgSend(v8, "bytes");
    -[WBSHistoryCrypto cryptographicKey](self, "cryptographicKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    v12 = objc_retainAutorelease(v4);
    v13 = CCCrypt(0, 0, 1u, v9, v11, 0, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), dataOut, dataOutAvailable, &v24);

    if (!(_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", dataOut, v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v14 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[WBSHistoryCrypto encryptDictionary:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    free(dataOut);
  }
  else
  {
    v21 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[WBSHistoryCrypto encryptDictionary:].cold.1(v21, v5);
  }
  v22 = 0;
LABEL_10:

  return v22;
}

- (id)decryptDictionary:(id)a3
{
  id v4;
  size_t dataOutAvailable;
  void *dataOut;
  id v7;
  const void *v8;
  void *v9;
  size_t v10;
  id v11;
  const void *v12;
  size_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  size_t v29;

  v29 = 0;
  v4 = a3;
  dataOutAvailable = objc_msgSend(v4, "length") + 16;
  dataOut = malloc_type_malloc(dataOutAvailable, 0xD89475C9uLL);
  -[WBSHistoryCrypto cryptographicKey](self, "cryptographicKey");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const void *)objc_msgSend(v7, "bytes");
  -[WBSHistoryCrypto cryptographicKey](self, "cryptographicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v11 = objc_retainAutorelease(v4);
  v12 = (const void *)objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");

  v14 = CCCrypt(1u, 0, 1u, v8, v10, 0, v12, v13, dataOut, dataOutAvailable, &v29);
  if (!(_DWORD)v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", dataOut, v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v23, 0, 0, &v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v28;
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v24;
LABEL_11:

        return v26;
      }
    }
    else
    {
      v27 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[WBSHistoryCrypto decryptDictionary:].cold.1(v27, v25);
    }
    v26 = 0;
    goto LABEL_11;
  }
  v15 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[WBSHistoryCrypto decryptDictionary:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
  free(dataOut);
  return 0;
}

- (NSData)salt
{
  return self->_salt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_cachedCryptographicKey, 0);
}

- (void)encryptDictionary:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to serialize dictionary: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)encryptDictionary:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, a2, a3, "Failed to encrypt data: %i", a5, a6, a7, a8, 0);
}

- (void)decryptDictionary:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to deserialize property list: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)decryptDictionary:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, a2, a3, "Failed to decrypt data: %i", a5, a6, a7, a8, 0);
}

@end

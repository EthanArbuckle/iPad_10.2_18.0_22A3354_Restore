@implementation SPCrypto

+ (void)generateTokensWithPublicKey:(id)a3 sharedSecretKey:(id)a4 initialRatchetsToSkip:(unint64_t)a5 ratchetStep:(id)a6
{
  id v9;
  void (**v10)(id, id, void *, _BYTE *);
  id v11;
  void *v12;
  void *v13;
  id v14;
  char v15;

  v9 = a3;
  v10 = (void (**)(id, id, void *, _BYTE *))a6;
  v15 = 0;
  +[SPCrypto ratchetSharedSecretKey:ratchetCount:](SPCrypto, "ratchetSharedSecretKey:ratchetCount:", a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  do
  {
    v12 = v11;
    v14 = v11;
    +[SPCrypto deriveWithPublicKey:sharedSecretKey:](SPCrypto, "deriveWithPublicKey:sharedSecretKey:", v9, &v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    v10[2](v10, v11, v13, &v15);
  }
  while (!v15);

}

+ (id)compactKey:(id)a3
{
  id v3;
  _CCECCryptor *v4;
  _CCECCryptor *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 57
    && (v4 = +[SPCrypto importKey:fromFormat:](SPCrypto, "importKey:fromFormat:", v3, 0)) != 0)
  {
    v5 = v4;
    +[SPCrypto exportKey:toFormat:](SPCrypto, "exportKey:toFormat:", v4, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1AF455B44](v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (_CCECCryptor)importKey:(id)a3 fromFormat:(unsigned int)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");

  v5 = CCECCryptorImportKey();
  if (!(_DWORD)v5)
    return 0;
  v6 = v5;
  LogCategory_Crypto();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[SPCrypto importKey:fromFormat:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  return 0;
}

+ (id)exportKey:(_CCECCryptor *)a3 toFormat:(unsigned int)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 57));
  objc_msgSend(v4, "mutableBytes");
  v5 = CCECCryptorExportKey();
  if ((_DWORD)v5)
  {
    v6 = v5;
    LogCategory_Crypto();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SPCrypto exportKey:toFormat:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "subdataWithRange:", 0, 57);
    v7 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject copy](v7, "copy");
  }

  return v14;
}

+ (_CCECCryptor)diversifyKey:(id)a3 entropyData:(id)a4
{
  id v5;
  _CCECCryptor *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a4;
  v6 = +[SPCrypto importKey:fromFormat:](SPCrypto, "importKey:fromFormat:", a3, 0);
  if (v6)
  {
    v7 = objc_retainAutorelease((id)objc_msgSend(v5, "mutableCopy"));
    objc_msgSend(v7, "mutableBytes");
    objc_msgSend(v7, "length");
    v8 = CCECCryptorTwinDiversifyKey();
    if ((_DWORD)v8)
    {
      v9 = v8;
      LogCategory_Crypto();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[SPCrypto diversifyKey:entropyData:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

      v6 = 0;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

+ (id)antiTrackingKeyFromSharedSecretKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(CFSTR("diversify"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPCrypto deriveKeyWithKeyData:sharedData:keyLength:](SPCrypto, "deriveKeyWithKeyData:sharedData:keyLength:", v3, v4, 72);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)deriveKeyWithKeyData:(id)a3 sharedData:(id)a4 keyLength:(unint64_t)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0C99DF0];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithLength:", a5);
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");

  v12 = 0;
  if (!CCKDFParametersCreateAnsiX963())
  {
    v13 = objc_retainAutorelease(v7);
    objc_msgSend(v13, "bytes");
    objc_msgSend(v13, "length");
    v14 = objc_retainAutorelease(v10);
    objc_msgSend(v14, "mutableBytes");
    objc_msgSend(v14, "length");
    if (CCDeriveKey())
      v12 = 0;
    else
      v12 = v14;
  }

  return v12;
}

+ (id)ratchetSharedSecretKey:(id)a3 ratchetCount:(unint64_t)a4
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13;
  char v14[15];

  v5 = a3;
  objc_msgSend(CFSTR("update"), "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (a4)
  {
    v7 = v5;
    do
    {
      v8 = (void *)MEMORY[0x1AF455E74]();
      +[SPCrypto deriveKeyWithKeyData:sharedData:keyLength:](SPCrypto, "deriveKeyWithKeyData:sharedData:keyLength:", v7, v6, 32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v7;
        v7 = v9;
      }
      else
      {
        LogCategory_Crypto();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          +[SPCrypto ratchetSharedSecretKey:ratchetCount:].cold.1(&v13, v14, v11);
      }

      objc_autoreleasePoolPop(v8);
      --a4;
    }
    while (a4);
  }

  return v7;
}

+ (id)deriveWithPublicKey:(id)a3 sharedSecretKey:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  _CCECCryptor *v8;
  _CCECCryptor *v9;
  void *v10;

  v5 = a3;
  +[SPCrypto ratchetSharedSecretKey:ratchetCount:](SPCrypto, "ratchetSharedSecretKey:ratchetCount:", *a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPCrypto antiTrackingKeyFromSharedSecretKey:](SPCrypto, "antiTrackingKeyFromSharedSecretKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = +[SPCrypto diversifyKey:entropyData:](SPCrypto, "diversifyKey:entropyData:", v5, v7)) != 0)
  {
    v9 = v8;
    +[SPCrypto exportKey:toFormat:](SPCrypto, "exportKey:toFormat:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1AF455B44](v9);
    *a4 = objc_retainAutorelease(v6);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)importKey:(uint64_t)a3 fromFormat:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AEA79000, a2, a3, "Error running CCECCryptorImportKey. Code: %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)exportKey:(uint64_t)a3 toFormat:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AEA79000, a2, a3, "Error running CCECCryptorExportKey. Code: %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)diversifyKey:(uint64_t)a3 entropyData:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AEA79000, a2, a3, "Error running CCECCryptorTwinDiversifyKey. Code: %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)ratchetSharedSecretKey:(os_log_t)log ratchetCount:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1AEA79000, log, OS_LOG_TYPE_ERROR, "deriveKeyWithKeyData returned nil!", buf, 2u);
}

@end

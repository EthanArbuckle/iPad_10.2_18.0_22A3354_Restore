@implementation SKAPresenceEncryptionKey

- (SKAPresenceEncryptionKey)initWithNewKeyMaterial
{
  SKAPresenceEncryptionKey *v2;
  SKAPresenceEncryptionKey *v3;
  SKAPresenceEncryptionKey *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKAPresenceEncryptionKey;
  v2 = -[SKAPresenceEncryptionKey init](&v6, sel_init);
  v3 = v2;
  if (v2 && !-[SKAPresenceEncryptionKey _initializeNewKeyMaterial](v2, "_initializeNewKeyMaterial"))
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (SKAPresenceEncryptionKey)initWithKeyMaterial:(id)a3
{
  id v5;
  SKAPresenceEncryptionKey *v6;
  SKAPresenceEncryptionKey *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKAPresenceEncryptionKey;
  v6 = -[SKAPresenceEncryptionKey init](&v17, sel_init);
  if (!v6)
    goto LABEL_5;
  if (objc_msgSend(v5, "length") && objc_msgSend(v5, "length") == 32)
  {
    objc_storeStrong((id *)&v6->_keyData, a3);
LABEL_5:
    v7 = v6;
    goto LABEL_9;
  }
  +[SKAPresenceEncryptionKey logger](SKAPresenceEncryptionKey, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SKAPresenceEncryptionKey initWithKeyMaterial:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  v7 = 0;
LABEL_9:

  return v7;
}

- (id)encryptPayload:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    +[SKAPresenceEncryptionKey logger](SKAPresenceEncryptionKey, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SKAPresenceEncryptionKey encryptPayload:].cold.1(v6, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_9;
  }
  v38 = 0;
  -[SKAPresenceEncryptionKey _randomBytesWithLength:error:](self, "_randomBytesWithLength:error:", 12, &v38);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v38)
  {
LABEL_9:
    v26 = 0;
    goto LABEL_12;
  }
  -[NSObject length](v5, "length");
  v7 = v6;
  -[SKAPresenceEncryptionKey keyData](self, "keyData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "length");

  -[SKAPresenceEncryptionKey keyData](self, "keyData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "length");
  v11 = v4;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_retainAutorelease(v9);
  objc_msgSend(v37, "bytes");
  v6 = objc_retainAutorelease(v7);
  -[NSObject bytes](v6, "bytes");
  v36 = objc_retainAutorelease(v11);
  objc_msgSend(v36, "bytes");
  v14 = objc_retainAutorelease(v12);
  v15 = objc_msgSend(v14, "mutableBytes");
  v16 = objc_retainAutorelease(v13);
  v35 = objc_msgSend(v16, "mutableBytes");
  v17 = CCCryptorGCMOneshotEncrypt();
  if ((_DWORD)v17)
  {
    v18 = v17;
    +[SKAPresenceEncryptionKey logger](SKAPresenceEncryptionKey, "logger", v10, v15, v35, 16);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SKAPresenceEncryptionKey encryptPayload:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

    v26 = 0;
  }
  else
  {
    v26 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(v26, "appendData:", v6, v10, v15, v35, 16);
    objc_msgSend(v26, "appendData:", v14);
    objc_msgSend(v26, "appendData:", v16);
  }

LABEL_12:
  return v26;
}

- (id)decryptPayload:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") > 0x1C)
  {
    objc_msgSend(v4, "subdataWithRange:", 0, 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "length");
    v16 = v15 - 16;
    objc_msgSend(v4, "subdataWithRange:", 12, v15 - 28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subdataWithRange:", v16, 16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "length");
    -[SKAPresenceEncryptionKey keyData](self, "keyData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "length");

    -[SKAPresenceEncryptionKey keyData](self, "keyData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "length");
    v22 = v17;
    v39 = objc_msgSend(v18, "length");
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_retainAutorelease(v20);
    objc_msgSend(v40, "bytes");
    v5 = objc_retainAutorelease(v14);
    -[NSObject bytes](v5, "bytes");
    v24 = objc_retainAutorelease(v22);
    objc_msgSend(v24, "bytes");
    v25 = objc_retainAutorelease(v23);
    v26 = objc_msgSend(v25, "mutableBytes");
    v27 = objc_retainAutorelease(v18);
    v38 = objc_msgSend(v27, "bytes");
    v28 = CCCryptorGCMOneshotDecrypt();
    if ((_DWORD)v28)
    {
      v29 = v28;
      +[SKAPresenceEncryptionKey logger](SKAPresenceEncryptionKey, "logger", v21, v26, v38, v39);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[SKAPresenceEncryptionKey decryptPayload:].cold.2(v29, v30, v31, v32, v33, v34, v35, v36);

      v13 = 0;
    }
    else
    {
      v13 = v25;
    }

  }
  else
  {
    +[SKAPresenceEncryptionKey logger](SKAPresenceEncryptionKey, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SKAPresenceEncryptionKey decryptPayload:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = 0;
  }

  return v13;
}

- (NSData)keyMaterial
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[SKAPresenceEncryptionKey keyData](self, "keyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[SKAPresenceEncryptionKey keyData](self, "keyData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5 != 32)
    {
      v6 = 0;
      return (NSData *)v6;
    }
    -[SKAPresenceEncryptionKey keyData](self, "keyData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v6 = 0;
  }

  return (NSData *)v6;
}

- (BOOL)_initializeNewKeyMaterial
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSData *v7;
  NSData *keyData;
  id v10;

  v10 = 0;
  -[SKAPresenceEncryptionKey _randomBytesWithLength:error:](self, "_randomBytesWithLength:error:", 32, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = (void *)MEMORY[0x24BDBCE50];
  v6 = objc_retainAutorelease(v3);
  v7 = (NSData *)objc_msgSend(v5, "_newZeroingDataWithBytes:length:", objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  keyData = self->_keyData;
  self->_keyData = v7;

  return v4 == 0;
}

- (id)_randomBytesWithLength:(unint64_t)a3 error:(id *)a4
{
  id v6;
  uint64_t Bytes;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Bytes = CCRandomGenerateBytes((void *)objc_msgSend(v6, "mutableBytes"), a3);
  if ((_DWORD)Bytes)
  {
    v8 = Bytes;
    +[SKAPresenceEncryptionKey logger](SKAPresenceEncryptionKey, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SKAPresenceEncryptionKey _randomBytesWithLength:error:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0, -1000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a4)
      *a4 = objc_retainAutorelease(v16);

    v18 = 0;
  }
  else
  {
    v18 = v6;
  }

  return v18;
}

+ (id)logger
{
  if (logger_onceToken_15 != -1)
    dispatch_once(&logger_onceToken_15, &__block_literal_global_15);
  return (id)logger__logger_15;
}

void __34__SKAPresenceEncryptionKey_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAPresenceEncryptionKey");
  v1 = (void *)logger__logger_15;
  logger__logger_15 = (uint64_t)v0;

}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_keyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
}

- (void)initWithKeyMaterial:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2188DF000, a1, a3, "keyMaterial nil or incorrect length", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)encryptPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2188DF000, a1, a3, "Can not encrypt empty/nil data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)encryptPayload:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2188DF000, a2, a3, "Could not encrypt. Status: %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)decryptPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2188DF000, a1, a3, "Encrypted data is too small to decrypt (invalid size)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)decryptPayload:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2188DF000, a2, a3, "Could not decrypt. Status: %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_randomBytesWithLength:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2188DF000, a2, a3, "Could not generate random bytes. %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end

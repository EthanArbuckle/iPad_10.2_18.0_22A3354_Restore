@implementation SKAPresenceMembershipKey

- (SKAPresenceMembershipKey)initWithNewKeyMaterial
{
  SKAPresenceMembershipKey *v2;
  SKAPresenceMembershipKey *v3;
  SKAPresenceMembershipKey *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKAPresenceMembershipKey;
  v2 = -[SKAPresenceMembershipKey init](&v6, sel_init);
  v3 = v2;
  if (v2 && !-[SKAPresenceMembershipKey _generateKey](v2, "_generateKey"))
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (SKAPresenceMembershipKey)initWithPrivateKeyMaterial:(id)a3
{
  id v4;
  SKAPresenceMembershipKey *v5;
  SKAPresenceMembershipKey *v6;
  NSObject *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKAPresenceMembershipKey;
  v5 = -[SKAPresenceMembershipKey init](&v9, sel_init);
  if (!v5)
    goto LABEL_5;
  if (!objc_msgSend(v4, "length") || objc_msgSend(v4, "length") != 97)
  {
    +[SKAPresenceMembershipKey logger](SKAPresenceMembershipKey, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKAPresenceMembershipKey initWithPrivateKeyMaterial:].cold.1(v7);

    goto LABEL_9;
  }
  if (!-[SKAPresenceMembershipKey _generateKeyFromKeyData:](v5, "_generateKeyFromKeyData:", v4))
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
LABEL_5:
  v6 = v5;
LABEL_10:

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SKAPresenceMembershipKey privateKey](self, "privateKey"))
    CFRelease(-[SKAPresenceMembershipKey privateKey](self, "privateKey"));
  v3.receiver = self;
  v3.super_class = (Class)SKAPresenceMembershipKey;
  -[SKAPresenceMembershipKey dealloc](&v3, sel_dealloc);
}

- (id)signPayload:(id)a3
{
  const __CFData *v4;
  __SecKey *v5;
  CFDataRef v6;
  void *v7;
  NSObject *v8;
  __int16 v10;
  CFErrorRef error;

  v4 = (const __CFData *)a3;
  if (-[SKAPresenceMembershipKey privateKey](self, "privateKey"))
  {
    error = 0;
    v5 = -[SKAPresenceMembershipKey privateKey](self, "privateKey");
    v6 = SecKeyCreateSignature(v5, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], v4, &error);
    if (v6)
    {
      v10 = 769;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &v10, 2);
      objc_msgSend(v7, "appendData:", v6);
    }
    else
    {
      +[SKAPresenceMembershipKey logger](SKAPresenceMembershipKey, "logger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SKAPresenceMembershipKey signPayload:].cold.1();

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSData)publicKeyMaterial
{
  __SecKey *v3;
  CFDataRef v4;
  const __CFData *v5;
  NSObject *v7;
  CFErrorRef error;

  if (!-[SKAPresenceMembershipKey privateKey](self, "privateKey"))
    return (NSData *)0;
  v3 = SecKeyCopyPublicKey(-[SKAPresenceMembershipKey privateKey](self, "privateKey"));
  error = 0;
  v4 = SecKeyCopyExternalRepresentation(v3, &error);
  if (v3)
    CFRelease(v3);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    +[SKAPresenceMembershipKey logger](SKAPresenceMembershipKey, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKAPresenceMembershipKey publicKeyMaterial].cold.1();

  }
  return (NSData *)v4;
}

- (NSData)privateKeyMaterial
{
  CFDataRef v3;
  CFDataRef v4;
  const __CFData *v5;
  NSObject *v7;
  CFErrorRef error;

  if (!-[SKAPresenceMembershipKey privateKey](self, "privateKey"))
    return (NSData *)0;
  error = 0;
  v3 = SecKeyCopyExternalRepresentation(-[SKAPresenceMembershipKey privateKey](self, "privateKey"), &error);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SKAPresenceMembershipKey logger](SKAPresenceMembershipKey, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKAPresenceMembershipKey privateKeyMaterial].cold.1();

  }
  return (NSData *)v4;
}

- (BOOL)_generateKey
{
  uint64_t v3;
  const __CFDictionary *v4;
  SecKeyRef v5;
  NSObject *v6;
  CFErrorRef v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE9048];
  v9[0] = *MEMORY[0x24BDE9050];
  v9[1] = v3;
  v10[0] = *MEMORY[0x24BDE9060];
  v10[1] = &unk_24D98DDE0;
  v9[2] = *MEMORY[0x24BDE9528];
  v10[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = SecKeyCreateRandomKey(v4, &v8);
  if (v5)
  {
    if (-[SKAPresenceMembershipKey privateKey](self, "privateKey"))
      CFRelease(-[SKAPresenceMembershipKey privateKey](self, "privateKey"));
    -[SKAPresenceMembershipKey setPrivateKey:](self, "setPrivateKey:", v5);
  }
  else
  {
    +[SKAPresenceMembershipKey logger](SKAPresenceMembershipKey, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SKAPresenceMembershipKey _generateKey].cold.1();

  }
  return v5 != 0;
}

- (BOOL)_generateKeyFromKeyData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFData *v9;
  const __CFDictionary *v10;
  SecKeyRef v11;
  NSObject *v12;
  CFErrorRef v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDE9060];
  v5 = *MEMORY[0x24BDE9048];
  v15[0] = *MEMORY[0x24BDE9050];
  v15[1] = v5;
  v16[0] = v4;
  v16[1] = &unk_24D98DDE0;
  v6 = *MEMORY[0x24BDE9030];
  v7 = *MEMORY[0x24BDE9018];
  v15[2] = *MEMORY[0x24BDE9028];
  v15[3] = v7;
  v16[2] = v6;
  v16[3] = MEMORY[0x24BDBD1C8];
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = (const __CFData *)a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = SecKeyCreateWithData(v9, v10, &v14);

  if (v11)
  {
    if (-[SKAPresenceMembershipKey privateKey](self, "privateKey"))
      CFRelease(-[SKAPresenceMembershipKey privateKey](self, "privateKey"));
    -[SKAPresenceMembershipKey setPrivateKey:](self, "setPrivateKey:", v11);
  }
  else
  {
    +[SKAPresenceMembershipKey logger](SKAPresenceMembershipKey, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SKAPresenceMembershipKey _generateKeyFromKeyData:].cold.1();

  }
  return v11 != 0;
}

+ (id)logger
{
  if (logger_onceToken_7 != -1)
    dispatch_once(&logger_onceToken_7, &__block_literal_global_7);
  return (id)logger__logger_7;
}

void __34__SKAPresenceMembershipKey_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAPresenceMembershipKey");
  v1 = (void *)logger__logger_7;
  logger__logger_7 = (uint64_t)v0;

}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (void)initWithPrivateKeyMaterial:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2188DF000, log, OS_LOG_TYPE_ERROR, "Private key material nil or incorrect length", v1, 2u);
}

- (void)signPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Signing completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)publicKeyMaterial
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Public key externalization completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)privateKeyMaterial
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Private key externalization completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_generateKey
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Membership key generation completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_generateKeyFromKeyData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Membership key generation from data completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

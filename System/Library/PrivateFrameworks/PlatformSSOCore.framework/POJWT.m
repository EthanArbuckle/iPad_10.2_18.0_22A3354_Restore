@implementation POJWT

- (POJWT)initWithString:(id)a3
{
  id v4;
  POJWT *v5;
  void *v6;
  uint64_t v7;
  NSString *rawHeader;
  id v9;
  void *v10;
  POJWTHeader *v11;
  POJWTHeader *decodedHeader;
  uint64_t v13;
  uint64_t v14;
  NSString *rawBody;
  uint64_t v16;
  char v17;
  NSString *rawAuthenticationTag;
  id v19;
  uint64_t v20;
  NSString *rawEncryptedKey;
  uint64_t v22;
  NSString *rawIV;
  uint64_t v24;
  NSString *rawCipherText;
  uint64_t v26;
  POJWT *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)POJWT;
  v5 = -[POJWT init](&v33, sel_init);
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    v19 = __24__POJWT_initWithString___block_invoke();

LABEL_13:
    v27 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  rawHeader = v5->_rawHeader;
  v5->_rawHeader = (NSString *)v7;

  v9 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(v9, "psso_initWithBase64URLEncodedString:", v5->_rawHeader);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[POJWTHeader initWithJWTData:]([POJWTHeader alloc], "initWithJWTData:", v10);
    decodedHeader = v5->_decodedHeader;
    v5->_decodedHeader = v11;

  }
  v13 = objc_msgSend(v6, "count");
  if (v13 == 5)
  {
    v17 = 1;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v20 = objc_claimAutoreleasedReturnValue();
    rawEncryptedKey = v5->_rawEncryptedKey;
    v5->_rawEncryptedKey = (NSString *)v20;

    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v22 = objc_claimAutoreleasedReturnValue();
    rawIV = v5->_rawIV;
    v5->_rawIV = (NSString *)v22;

    objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
    v24 = objc_claimAutoreleasedReturnValue();
    rawCipherText = v5->_rawCipherText;
    v5->_rawCipherText = (NSString *)v24;

    objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
    v26 = objc_claimAutoreleasedReturnValue();
    rawAuthenticationTag = v5->_rawAuthenticationTag;
    v5->_rawAuthenticationTag = (NSString *)v26;
    goto LABEL_10;
  }
  if (v13 != 3)
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __24__POJWT_initWithString___block_invoke_6;
    v31[3] = &unk_2514FF9D0;
    v32 = v6;
    v28 = v6;
    v29 = __24__POJWT_initWithString___block_invoke_6((uint64_t)v31);

    goto LABEL_13;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v14 = objc_claimAutoreleasedReturnValue();
  rawBody = v5->_rawBody;
  v5->_rawBody = (NSString *)v14;

  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = 0;
  rawAuthenticationTag = v5->_rawSignature;
  v5->_rawSignature = (NSString *)v16;
LABEL_10:

  v5->_jwe = v17;
LABEL_11:
  v27 = v5;
LABEL_14:

  return v27;
}

id __24__POJWT_initWithString___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Missing JWT parts."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWT();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __24__POJWT_initWithString___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Incorrect number of JWT parts."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_6_cold_1((uint64_t)v2, a1, v3);

  return v2;
}

- (id)mutableCopy
{
  return 0;
}

- (id)stringRepresentation
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[POJWT isJWE](self, "isJWE");
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[POJWT rawHeader](self, "rawHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[POJWT rawEncryptedKey](self, "rawEncryptedKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[POJWT rawIV](self, "rawIV");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[POJWT rawCipherText](self, "rawCipherText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[POJWT rawAuthenticationTag](self, "rawAuthenticationTag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@.%@.%@.%@"), v5, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[POJWT rawBody](self, "rawBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[POJWT rawSignature](self, "rawSignature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@.%@"), v5, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (__SecKey)decodeEphemeralPublicKey
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  __SecKey *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[5];
  int v24;
  CFErrorRef error;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  error = 0;
  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  -[POJWT decodedHeader](self, "decodedHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "epk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("x"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "psso_initWithBase64URLEncodedString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BDBCE50]);
  -[POJWT decodedHeader](self, "decodedHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "epk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("y"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "psso_initWithBase64URLEncodedString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || objc_msgSend(v7, "length") != 32)
  {
    v20 = __33__POJWT_decodeEphemeralPublicKey__block_invoke();
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  if (!v12 || objc_msgSend(v12, "length") != 32)
  {
    v21 = __33__POJWT_decodeEphemeralPublicKey__block_invoke_22();
    goto LABEL_10;
  }
  v13 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v24 = 4;
  objc_msgSend(v13, "appendBytes:length:", &v24, 1);
  objc_msgSend(v13, "appendData:", v7);
  objc_msgSend(v13, "appendData:", v12);
  v14 = *MEMORY[0x24BDE9060];
  v15 = *MEMORY[0x24BDE9028];
  v26[0] = *MEMORY[0x24BDE9050];
  v26[1] = v15;
  v16 = *MEMORY[0x24BDE9038];
  v27[0] = v14;
  v27[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v18 = SecKeyCreateWithData((CFDataRef)v13, v17, &error);
  if (error)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __33__POJWT_decodeEphemeralPublicKey__block_invoke_28;
    v23[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v23[4] = error;
    v19 = __33__POJWT_decodeEphemeralPublicKey__block_invoke_28((uint64_t)v23);
  }

LABEL_11:
  return v18;
}

id __33__POJWT_decodeEphemeralPublicKey__block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("epk X value is missing or invalid when decrypting JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWT();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __33__POJWT_decodeEphemeralPublicKey__block_invoke_22()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("epk Y value is missing or invalid when decrypting JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWT();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __33__POJWT_decodeEphemeralPublicKey__block_invoke_28(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Error importing epk when decrypting JWT"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POJWT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

- (BOOL)isJWE
{
  return self->_jwe;
}

- (NSString)rawHeader
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRawHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (POJWTHeader)decodedHeader
{
  return (POJWTHeader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDecodedHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)rawEncryptedKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRawEncryptedKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)rawIV
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRawIV:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)rawBody
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRawBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)rawCipherText
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRawCipherText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)rawSignature
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRawSignature:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)rawAuthenticationTag
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRawAuthenticationTag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAuthenticationTag, 0);
  objc_storeStrong((id *)&self->_rawSignature, 0);
  objc_storeStrong((id *)&self->_rawCipherText, 0);
  objc_storeStrong((id *)&self->_rawBody, 0);
  objc_storeStrong((id *)&self->_rawIV, 0);
  objc_storeStrong((id *)&self->_rawEncryptedKey, 0);
  objc_storeStrong((id *)&self->_decodedHeader, 0);
  objc_storeStrong((id *)&self->_rawHeader, 0);
}

void __24__POJWT_initWithString___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24440D000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __24__POJWT_initWithString___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a2 + 32), "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_24440D000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);

}

@end

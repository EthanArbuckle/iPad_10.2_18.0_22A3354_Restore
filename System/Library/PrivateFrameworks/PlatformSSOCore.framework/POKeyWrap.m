@implementation POKeyWrap

- (POKeyWrap)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POKeyWrap;
  return -[POKeyWrap init](&v3, sel_init);
}

- (id)wrapBlob:(id)a3
{
  id v3;
  uint64_t v4;
  const __SecRandom *v5;
  id v6;
  size_t v7;
  id v8;
  id v9;
  _DWORD *v10;
  _DWORD *v11;
  int v12;
  id v13;
  unsigned int v15;
  _BYTE __src[72];
  __int128 v17;
  _BYTE bytes[32];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 0x20uLL, bytes) || SecRandomCopyBytes(v5, 0x10uLL, &v17))
    goto LABEL_9;
  v15 = 72;
  if (aks_wrap_key(bytes, 32, 13, -1, __src, (int *)&v15, 0))
  {
    memset_s(bytes, 0, 32, 0x20uLL);
    v6 = __22__POKeyWrap_wrapBlob___block_invoke();
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v7 = v15;
  if (v15 >= 0x49)
  {
    memset_s(bytes, 0, 32, 0x20uLL);
    v8 = __22__POKeyWrap_wrapBlob___block_invoke_3();
    goto LABEL_9;
  }
  v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v4 + v15 + 36));
  v10 = (_DWORD *)objc_msgSend(v9, "mutableBytes");
  *v10 = v7;
  v11 = v10 + 1;
  memcpy(v10 + 1, __src, v7);
  *(_OWORD *)((char *)v11 + v7) = v17;
  objc_msgSend(objc_retainAutorelease(v3), "bytes");
  v12 = CCCryptorGCMOneshotEncrypt();
  memset_s(bytes, 0, 32, 0x20uLL);
  if (v12)
  {
    v13 = __22__POKeyWrap_wrapBlob___block_invoke_7();

    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

id __22__POKeyWrap_wrapBlob___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with wrap key size"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __22__POKeyWrap_wrapBlob___block_invoke_cold_1();

  return v0;
}

id __22__POKeyWrap_wrapBlob___block_invoke_3()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with wrap key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __22__POKeyWrap_wrapBlob___block_invoke_7()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Crypto error wrapping key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __22__POKeyWrap_wrapBlob___block_invoke_cold_1();

  return v0;
}

- (id)unwrapBlob:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  unsigned int *v6;
  id v7;
  id v8;
  int v9;
  const void *v10;
  unsigned int v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v19;
  id v20;
  int v21;
  _BYTE __s[32];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned int *)objc_msgSend(v5, "bytes");

  if (v4 <= 0xF)
  {
    v7 = __24__POKeyWrap_unwrapBlob___block_invoke();
LABEL_13:
    v17 = 0;
    return v17;
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFCLL) == 0x10)
  {
    v8 = __24__POKeyWrap_unwrapBlob___block_invoke_13();
    goto LABEL_13;
  }
  v11 = *v6;
  v10 = v6 + 1;
  v9 = v11;
  v12 = v4 - 20 - v11;
  if (v4 - 20 < v11)
  {
    v13 = __24__POKeyWrap_unwrapBlob___block_invoke_17();
    goto LABEL_13;
  }
  v21 = 32;
  if (aks_unwrap_key(v10, v9, 13, -1, __s, &v21))
  {
    memset_s(__s, 0, 32, 0x20uLL);
    v14 = __24__POKeyWrap_unwrapBlob___block_invoke_21();
    goto LABEL_13;
  }
  if (v21 != 32)
  {
    memset_s(__s, 0, 32, 0x20uLL);
    v16 = __24__POKeyWrap_unwrapBlob___block_invoke_24();
    goto LABEL_13;
  }
  if (v12 <= 0xF)
  {
    memset_s(__s, 0, 32, 0x20uLL);
    v15 = __24__POKeyWrap_unwrapBlob___block_invoke_28();
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v12 - 16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "mutableBytes");
  v19 = CCCryptorGCMOneshotDecrypt();
  memset_s(__s, 0, 32, 0x20uLL);
  if (v19)
    v20 = __24__POKeyWrap_unwrapBlob___block_invoke_32();
  return v17;
}

id __24__POKeyWrap_unwrapBlob___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with unwrap key tag size"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_13()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with unwrap key size data"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_17()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with wrap key data"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_21()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with unwrapping key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __22__POKeyWrap_wrapBlob___block_invoke_cold_1();

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_24()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with unwrap key size"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_28()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error with unwrap data size"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_32()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Crypto error unwrapping key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeyWrap();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __22__POKeyWrap_wrapBlob___block_invoke_cold_1();

  return v0;
}

void __22__POKeyWrap_wrapBlob___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v0 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_24440D000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

@end

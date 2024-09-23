@implementation POCredentialUtil

+ (id)passwordDataFromContext:(id)a3 error:(id *)a4
{
  id v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a3;
  if (v5)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    v6 = dispatch_semaphore_create(0);
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __50__POCredentialUtil_passwordDataFromContext_error___block_invoke;
    v15[3] = &unk_251500220;
    v17 = &v19;
    v18 = &v25;
    v8 = v6;
    v16 = v8;
    objc_msgSend(v5, "credentialOfType:reply:", -9, v15);
    v9 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v8, v9);
    v10 = (void *)v20[5];
    if (a4)
    {
      *a4 = objc_retainAutorelease(v10);
    }
    else if (v10)
    {
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __50__POCredentialUtil_passwordDataFromContext_error___block_invoke_2;
      v14[3] = &unk_251500248;
      v14[4] = &v19;
      v12 = __50__POCredentialUtil_passwordDataFromContext_error___block_invoke_2((uint64_t)v14);
    }
    v11 = (id)v26[5];

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __50__POCredentialUtil_passwordDataFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const __CFAllocator *v6;
  CFMutableDataRef MutableCopy;
  uint64_t v8;
  void *v9;
  const __CFData *theData;

  theData = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (theData)
  {
    v6 = (const __CFAllocator *)SecCFAllocatorZeroize();
    MutableCopy = CFDataCreateMutableCopy(v6, 0, theData);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = MutableCopy;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id __50__POCredentialUtil_passwordDataFromContext_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("Failure to get credential."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POCredentialUtil();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

+ (id)passwordStringFromData:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  return (id)objc_msgSend(v5, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v8, 4, 0);
}

+ (id)maskName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("@"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("@%@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_251503878;
  }
  if ((unint64_t)objc_msgSend(v4, "length") > 3)
  {
    v9 = objc_msgSend(v4, "length");
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_msgSend(v4, "length");
    if (v9 < 7)
      v12 = v11 - 1;
    else
      v12 = v11 - 2;
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 1, v12, CFSTR("***"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v13, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("***%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (BOOL)encryptPendingSSOTokens:(id)a3 usingPublicKey:(__SecKey *)a4 sharedData:(id)a5 encryptedTokens:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *EncryptedDataWithParameters;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  PO_LOG_POCredentialUtil();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[POCredentialUtil encryptPendingSSOTokens:usingPublicKey:sharedData:encryptedTokens:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = 0;
  if (v9 && a4)
  {
    if (SecKeyIsAlgorithmSupported(a4, kSecKeyOperationTypeEncrypt, (SecKeyAlgorithm)*MEMORY[0x24BDE92E8]))
    {
      v28 = *MEMORY[0x24BDE9390];
      v29[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      EncryptedDataWithParameters = (void *)SecKeyCreateEncryptedDataWithParameters();
      v22 = EncryptedDataWithParameters;
      v19 = EncryptedDataWithParameters != 0;
      if (EncryptedDataWithParameters)
      {
        *a6 = objc_retainAutorelease(EncryptedDataWithParameters);
      }
      else
      {
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke_19;
        v26[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v26[4] = v27;
        v24 = __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke_19((uint64_t)v26);
      }

    }
    else
    {
      v23 = __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke();
      v19 = 0;
    }
  }

  return v19;
}

id __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Encryption algorithm not supported when encrypting pending sso tokens."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POCredentialUtil();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __86__POCredentialUtil_encryptPendingSSOTokens_usingPublicKey_sharedData_encryptedTokens___block_invoke_19(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Failed to encrypt tokens when encrypting pending sso tokens."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POCredentialUtil();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (id)decryptPendingSSOTokens:(id)a3 UsingPrivateKey:(__SecKey *)a4 sharedData:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *DecryptedDataWithParameters;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  PO_LOG_POCredentialUtil();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[POCredentialUtil decryptPendingSSOTokens:UsingPrivateKey:sharedData:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  v17 = 0;
  if (v7 && a4 && v8)
  {
    if (SecKeyIsAlgorithmSupported(a4, kSecKeyOperationTypeDecrypt, (SecKeyAlgorithm)*MEMORY[0x24BDE92E8]))
    {
      v26 = *MEMORY[0x24BDE9390];
      v27[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      DecryptedDataWithParameters = (void *)SecKeyCreateDecryptedDataWithParameters();
      v20 = DecryptedDataWithParameters;
      if (DecryptedDataWithParameters)
      {
        v17 = DecryptedDataWithParameters;
      }
      else
      {
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke_25;
        v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v24[4] = v25;
        v22 = __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke_25((uint64_t)v24);
        v17 = 0;
      }

    }
    else
    {
      v21 = __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke();
      v17 = 0;
    }
  }

  return v17;
}

id __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Encryption algorithm not supported when decrypting pending sso tokens."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POCredentialUtil();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __71__POCredentialUtil_decryptPendingSSOTokens_UsingPrivateKey_sharedData___block_invoke_25(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("failed to decrypt tokens when decrypting pending sso tokens."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POCredentialUtil();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

+ (void)encryptPendingSSOTokens:(uint64_t)a3 usingPublicKey:(uint64_t)a4 sharedData:(uint64_t)a5 encryptedTokens:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_24440D000, a1, a3, "encryptPendingSSOTokens", a5, a6, a7, a8, 0);
}

+ (void)decryptPendingSSOTokens:(uint64_t)a3 UsingPrivateKey:(uint64_t)a4 sharedData:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_24440D000, a1, a3, "decryptPendingSSOTokensUsingPrivateKey", a5, a6, a7, a8, 0);
}

@end

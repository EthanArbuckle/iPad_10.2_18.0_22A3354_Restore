@implementation POUserUnlockKey

+ (BOOL)createUnlockKeyWithPublicKey:(__SecKey *)a3 userName:(id)a4 returningCertificate:(__SecCertificate *)a5 hash:(id *)a6 encryptedData:(id *)a7
{
  id v12;
  __SecKey *v13;
  __SecKey *v14;
  const __CFData *v15;
  CFDataRef v16;
  CFDataRef v17;
  void *v18;
  __SecCertificate *v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[5];
  CFErrorRef error;

  v12 = a4;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  v13 = +[POSecKeyHelper createSEPEncryptionKeyForAlgorithm:shared:preboot:](POSecKeyHelper, "createSEPEncryptionKeyForAlgorithm:shared:preboot:", 0x251520F48, 1, 0);
  if (v13)
  {
    v14 = v13;
    +[POSecKeyHelper dataForKey:](POSecKeyHelper, "dataForKey:", v13);
    v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      error = 0;
      v16 = SecKeyCreateEncryptedData(a3, (SecKeyAlgorithm)*MEMORY[0x24BDE92F8], v15, &error);
      v17 = v16;
      if (error || !v16)
      {
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_7;
        v26[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v26[4] = error;
        v23 = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_7((uint64_t)v26);
        v20 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Platform SSO - %@"), v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (__SecCertificate *)objc_msgSend(a1, "selfSignedCertWithPrivateKey:subjectName:", v14, v18);
        CFRelease(v14);
        v20 = v19 != 0;
        if (v19)
        {
          *a6 = (id)SecCertificateCopyPublicKeySHA1Digest();
          *a5 = v19;
          -[__CFData base64EncodedStringWithOptions:](v17, "base64EncodedStringWithOptions:", 0);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_13();
        }

      }
    }
    else
    {
      v22 = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_3();
      v20 = 0;
    }

  }
  else
  {
    v21 = __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke();
    v20 = 0;
  }

  return v20;
}

id __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("failed to create unlock key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserUnlockKey();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_3()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("failed to create unlock key data"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserUnlockKey();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_7(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Failed to encrypt unlock key."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POUserUnlockKey();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __97__POUserUnlockKey_createUnlockKeyWithPublicKey_userName_returningCertificate_hash_encryptedData___block_invoke_13()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("error creating certificate."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserUnlockKey();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

+ (BOOL)unlockKey:(id)a3 privateKey:(__SecKey *)a4 returningKey:(__SecKey *)a5
{
  objc_class *v7;
  id v8;
  const __CFData *v9;
  CFDataRef v10;
  CFDataRef v11;
  __SecKey *v12;
  BOOL v13;
  id v14;
  id v15;
  _QWORD v17[5];
  CFErrorRef error;

  *a5 = 0;
  v7 = (objc_class *)MEMORY[0x24BDBCE50];
  v8 = a3;
  v9 = (const __CFData *)objc_msgSend([v7 alloc], "initWithBase64EncodedString:options:", v8, 0);

  error = 0;
  v10 = SecKeyCreateDecryptedData(a4, (SecKeyAlgorithm)*MEMORY[0x24BDE92F8], v9, &error);
  v11 = v10;
  if (error || !v10)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke;
    v17[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v17[4] = error;
    v14 = __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke((uint64_t)v17);
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v12 = +[POSecKeyHelper systemKeyForData:](POSecKeyHelper, "systemKeyForData:", v10);
  if (!v12)
  {
    v15 = __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke_20();
    goto LABEL_7;
  }
  *a5 = v12;
  v13 = 1;
LABEL_8:

  return v13;
}

id __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("failed to decrypt unlock key data"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POUserUnlockKey();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v2;
}

id __53__POUserUnlockKey_unlockKey_privateKey_returningKey___block_invoke_20()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("error loading unlockKey key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserUnlockKey();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

+ (__SecCertificate)selfSignedCertWithPrivateKey:(__SecKey *)a3 subjectName:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __SecCertificate *SelfSignedCertificate;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  void *v20;
  _QWORD v21[2];
  void *v22;
  _QWORD v23[2];
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v23[0] = *MEMORY[0x24BDE93D0];
  v23[1] = a4;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a4;
  objc_msgSend(v4, "arrayWithObjects:count:", v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v21[0] = *MEMORY[0x24BDE93D8];
  v21[1] = CFSTR("US");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  v19[0] = *MEMORY[0x24BDE93E0];
  v19[1] = CFSTR("Apple Inc");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x24BDE9218];
  v17[0] = *MEMORY[0x24BDE91F8];
  v17[1] = v13;
  v18[0] = &unk_251521020;
  v18[1] = &unk_251521038;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  SelfSignedCertificate = (__SecCertificate *)SecGenerateSelfSignedCertificate();
  return SelfSignedCertificate;
}

@end

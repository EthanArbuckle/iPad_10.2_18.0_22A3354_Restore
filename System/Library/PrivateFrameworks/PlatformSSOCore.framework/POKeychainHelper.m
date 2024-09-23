@implementation POKeychainHelper

- (int)addTokens:(id)a3 metaData:(id)a4 toKeychainForService:(id)a5 username:(id)a6
{
  return -[POKeychainHelper addTokens:metaData:toKeychainForService:username:system:](self, "addTokens:metaData:toKeychainForService:username:system:", a3, a4, a5, a6, 0);
}

- (int)addTokens:(id)a3 metaData:(id)a4 toKeychainForService:(id)a5 username:(id)a6 system:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  SecAccessControlRef v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  OSStatus v30;
  id v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  id v36;
  _QWORD v37[6];
  _QWORD v38[6];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  POKeychainHelper *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  PO_LOG_POKeychainHelper();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[POKeychainHelper addTokens:metaData:toKeychainForService:username:system:]";
    v41 = 2114;
    v42 = v14;
    v43 = 2112;
    v44 = self;
    _os_log_impl(&dword_24440D000, v16, OS_LOG_TYPE_DEFAULT, "%s service %{public}@ on %@", buf, 0x20u);
  }

  v17 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F70], 0, 0);
  if (v14 && v12 && v15)
  {
    v18 = *MEMORY[0x24BDE9550];
    v38[0] = v12;
    v19 = *MEMORY[0x24BDE8FA8];
    v37[0] = v18;
    v37[1] = v19;
    objc_msgSend(v15, "lowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BDE9128];
    v38[1] = v20;
    v38[2] = v14;
    v22 = *MEMORY[0x24BDE8F50];
    v37[2] = v21;
    v37[3] = v22;
    v23 = *MEMORY[0x24BDE9220];
    v24 = *MEMORY[0x24BDE9230];
    v38[3] = kPlatformSSOAccessGroup;
    v38[4] = v24;
    v25 = *MEMORY[0x24BDE9528];
    v37[4] = v23;
    v37[5] = v25;
    v38[5] = *MEMORY[0x24BDBD270];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    if (!a7)
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDE8F48]);
    if (v13)
    {
      v36 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v36);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v36;
      if (v28)
      {
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BDE9000]);
      }
      else
      {
        PO_LOG_POKeychainHelper();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[POKeychainHelper addTokens:metaData:toKeychainForService:username:system:].cold.2();

      }
    }
    v33 = -[POKeychainHelper removeTokensFromKeychainWithService:username:](self, "removeTokensFromKeychainWithService:username:", v14, v15);
    PO_LOG_POKeychainHelper();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[POKeychainHelper addTokens:metaData:toKeychainForService:username:system:].cold.1(v33, v34);

    v30 = SecItemAdd((CFDictionaryRef)v27, 0);
    if (v17)
      CFRelease(v17);

  }
  else
  {
    v30 = -67693;
    v31 = __76__POKeychainHelper_addTokens_metaData_toKeychainForService_username_system___block_invoke();
    if (v17)
      CFRelease(v17);
  }

  return v30;
}

id __76__POKeychainHelper_addTokens_metaData_toKeychainForService_username_system___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1006, CFSTR("Missing required values to add tokens to keychain."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeychainHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (int)retrieveTokensFromKeychainForService:(id)a3 username:(id)a4 returningTokens:(id *)a5 metaData:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFDictionary *v20;
  OSStatus v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  OSStatus v47;
  CFTypeRef result;
  _QWORD v49[3];
  uint64_t v50;
  _QWORD v51[7];
  _QWORD v52[7];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  POKeychainHelper *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  result = 0;
  PO_LOG_POKeychainHelper();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[POKeychainHelper retrieveTokensFromKeychainForService:username:returningTokens:metaData:].cold.2();

  if (v10 && v11)
  {
    if (a5)
      *a5 = 0;
    if (a6)
      *a6 = 0;
    v13 = *MEMORY[0x24BDBD270];
    v14 = *MEMORY[0x24BDE94C8];
    v51[0] = *MEMORY[0x24BDE94C0];
    v51[1] = v14;
    v52[0] = v13;
    v52[1] = v13;
    v15 = *MEMORY[0x24BDE9128];
    v52[2] = v10;
    v16 = *MEMORY[0x24BDE8FA8];
    v51[2] = v15;
    v51[3] = v16;
    objc_msgSend(v11, "lowercaseString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDE8F50];
    v52[3] = v17;
    v52[4] = kPlatformSSOAccessGroup;
    v19 = *MEMORY[0x24BDE9220];
    v51[4] = v18;
    v51[5] = v19;
    v51[6] = *MEMORY[0x24BDE9528];
    v52[5] = *MEMORY[0x24BDE9230];
    v52[6] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 7);
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v21 = SecItemCopyMatching(v20, &result);
    v22 = v21;
    if (v21)
    {
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke;
      v46[3] = &__block_descriptor_36_e14___NSError_8__0l;
      v47 = v21;
      v23 = __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke((uint64_t)v46);
    }
    else
    {
      v24 = (id)result;
      objc_msgSend(v24, "objectForKey:", *MEMORY[0x24BDE9550]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a5)
        *a5 = objc_retainAutorelease(v25);
      if (a6)
      {
        objc_msgSend(v24, "objectForKey:", *MEMORY[0x24BDE9000]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v40 = v24;
          v42 = (void *)MEMORY[0x24BDD1620];
          v44 = v26;
          v28 = (void *)MEMORY[0x24BDBCF20];
          v29 = v27;
          v50 = objc_opt_class();
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setWithArray:", v41);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x24BDBCF20];
          v49[0] = objc_opt_class();
          v49[1] = objc_opt_class();
          v49[2] = objc_opt_class();
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 3);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setWithArray:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          v34 = v42;
          v35 = (void *)v30;
          v43 = v29;
          objc_msgSend(v34, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v30, v33, v29, &v45);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v45;
          *a6 = v36;

          if (v37)
          {
            PO_LOG_POKeychainHelper();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              -[POKeychainHelper retrieveTokensFromKeychainForService:username:returningTokens:metaData:].cold.1();

          }
          v27 = v43;
          v26 = v44;
          v24 = v40;
        }

      }
      if (result)
      {
        CFRelease(result);
        result = 0;
      }

    }
  }
  else
  {
    v22 = -67693;
    PO_LOG_POKeychainHelper();
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[POKeychainHelper retrieveTokensFromKeychainForService:username:returningTokens:metaData:]";
      v55 = 2112;
      v56 = self;
      _os_log_impl(&dword_24440D000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "%s Could not find credentials in keychain. Invalid parameters on %@", buf, 0x16u);
    }
  }

  return v22;
}

id __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("Keychain entry not found"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeychainHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);

  return v2;
}

- (int)removeTokensFromKeychainWithService:(id)a3 username:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  OSStatus v16;
  int v17;
  id v18;
  id v19;
  _QWORD v21[4];
  OSStatus v22;
  _QWORD v23[7];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  PO_LOG_POKeychainHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POKeychainHelper removeTokensFromKeychainWithService:username:].cold.1();

  if (v5 && v6)
  {
    v8 = *MEMORY[0x24BDBD270];
    v9 = *MEMORY[0x24BDE94C8];
    v23[0] = *MEMORY[0x24BDE94C0];
    v23[1] = v9;
    v24[0] = v8;
    v24[1] = v8;
    v10 = *MEMORY[0x24BDE9128];
    v24[2] = v5;
    v11 = *MEMORY[0x24BDE8FA8];
    v23[2] = v10;
    v23[3] = v11;
    objc_msgSend(v6, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BDE8F50];
    v24[3] = v12;
    v24[4] = kPlatformSSOAccessGroup;
    v14 = *MEMORY[0x24BDE9220];
    v23[4] = v13;
    v23[5] = v14;
    v23[6] = *MEMORY[0x24BDE9528];
    v24[5] = *MEMORY[0x24BDE9230];
    v24[6] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v16 = SecItemDelete(v15);
    v17 = v16;
    if (v16 != -25300 && v16)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke_17;
      v21[3] = &__block_descriptor_36_e14___NSError_8__0l;
      v22 = v16;
      v18 = __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke_17((uint64_t)v21);
    }

  }
  else
  {
    v19 = __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke();
    v17 = -67693;
  }

  return v17;
}

id __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1006, CFSTR("Values missing to delete credentials from keychain"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeychainHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __65__POKeychainHelper_removeTokensFromKeychainWithService_username___block_invoke_17(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Deleting keychain entry failed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKeychainHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1((uint64_t)v2, a1);

  return v2;
}

- (BOOL)retrieveIdentityForTokenId:(id)a3 context:(id)a4 forSigning:(BOOL)a5 hash:(id)a6 identity:(__SecIdentity *)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  __SecIdentity **v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFDictionary *v31;
  NSObject *v32;
  CFTypeRef result;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[6];
  _QWORD v38[8];

  v9 = a5;
  v38[6] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    result = 0;
    v14 = *MEMORY[0x24BDE9220];
    v15 = *MEMORY[0x24BDE9238];
    v16 = *MEMORY[0x24BDE8F50];
    v37[0] = *MEMORY[0x24BDE9220];
    v37[1] = v16;
    v17 = *MEMORY[0x24BDE8F58];
    v38[0] = v15;
    v38[1] = v17;
    v18 = *MEMORY[0x24BDE94C0];
    v37[2] = *MEMORY[0x24BDE94D0];
    v37[3] = v18;
    v38[2] = MEMORY[0x24BDBD1C8];
    v38[3] = MEMORY[0x24BDBD1C8];
    v19 = *MEMORY[0x24BDE9500];
    v20 = *MEMORY[0x24BDE9158];
    v37[4] = *MEMORY[0x24BDE9500];
    v37[5] = v20;
    v38[4] = v12;
    v38[5] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    if (v9)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE8FD0]);
    if (v13)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDE8FB0]);
    if (SecItemCopyMatching((CFDictionaryRef)v22, &result))
    {
      PO_LOG_POKeychainHelper();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[POKeychainHelper retrieveIdentityForTokenId:context:forSigning:hash:identity:].cold.3();
      v24 = 0;
    }
    else
    {
      v23 = result;
      v26 = a7;
      v27 = *MEMORY[0x24BDE9558];
      objc_msgSend((id)result, "objectForKeyedSubscript:", *MEMORY[0x24BDE9558]);
      v28 = objc_claimAutoreleasedReturnValue();
      v35[0] = v14;
      v35[1] = v27;
      v36[0] = v15;
      v36[1] = v28;
      v29 = (void *)v28;
      v30 = *MEMORY[0x24BDE93C0];
      v35[2] = *MEMORY[0x24BDE93B0];
      v35[3] = v19;
      v36[2] = v30;
      v36[3] = v12;
      v35[4] = *MEMORY[0x24BDE94D8];
      v36[4] = *MEMORY[0x24BDBD270];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
      v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (SecItemCopyMatching(v31, (CFTypeRef *)v26) || !*v26)
      {
        PO_LOG_POKeychainHelper();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[POKeychainHelper retrieveIdentityForTokenId:context:forSigning:hash:identity:].cold.2();

        v24 = 0;
      }
      else
      {
        v24 = 1;
      }

    }
  }
  else
  {
    PO_LOG_POKeychainHelper();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[POKeychainHelper retrieveIdentityForTokenId:context:forSigning:hash:identity:].cold.1();

    v24 = 0;
  }

  return v24;
}

- (BOOL)retrieveCertAndKeyForTokenId:(id)a3 context:(id)a4 forSigning:(BOOL)a5 hash:(id)a6 certificate:(__SecCertificate *)a7 privateKey:(__SecKey *)a8
{
  NSObject *v10;
  BOOL result;
  NSObject *v12;
  SecIdentityRef identityRef;

  identityRef = 0;
  if (!-[POKeychainHelper retrieveIdentityForTokenId:context:forSigning:hash:identity:](self, "retrieveIdentityForTokenId:context:forSigning:hash:identity:", a3, a4, a5, a6, &identityRef))
  {
    PO_LOG_POKeychainHelper();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[POKeychainHelper retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:].cold.3();

    return 0;
  }
  if (SecIdentityCopyCertificate(identityRef, a7))
  {
    PO_LOG_POKeychainHelper();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[POKeychainHelper retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:].cold.2();
LABEL_5:

    result = (char)identityRef;
    if (!identityRef)
      return result;
    CFRelease(identityRef);
    return 0;
  }
  SecIdentityCopyPrivateKey(identityRef, a8);
  if (!*a8)
  {
    PO_LOG_POKeychainHelper();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[POKeychainHelper retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:].cold.1();
    goto LABEL_5;
  }
  if (identityRef)
    CFRelease(identityRef);
  return 1;
}

- (void)addTokens:(int)a1 metaData:(NSObject *)a2 toKeychainForService:username:system:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_24440D000, a2, OS_LOG_TYPE_DEBUG, "Removing keychain entry returned %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_2();
}

- (void)addTokens:metaData:toKeychainForService:username:system:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24440D000, v0, v1, "Error archiving meta data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)retrieveTokensFromKeychainForService:username:returningTokens:metaData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24440D000, v0, v1, "Error unarchiving meta data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)retrieveTokensFromKeychainForService:username:returningTokens:metaData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "Finding keychain entry for service %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __91__POKeychainHelper_retrieveTokensFromKeychainForService_username_returningTokens_metaData___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a2 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_24440D000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)removeTokensFromKeychainWithService:username:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "Deleting keychain entry for service %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)retrieveIdentityForTokenId:context:forSigning:hash:identity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "missing token id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)retrieveIdentityForTokenId:context:forSigning:hash:identity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "Failed to get smartcard key.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)retrieveIdentityForTokenId:context:forSigning:hash:identity:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "Token not found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "Failed to get private key.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "failed to get certificate.\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "failed to get identity.\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end

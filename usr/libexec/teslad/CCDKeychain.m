@implementation CCDKeychain

+ (id)dataFromString:(id)a3
{
  return objc_msgSend(a3, "dataUsingEncoding:", 4);
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  __CFDictionary *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _BYTE buf[24];

  v21 = 0;
  v9 = +[CCDKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:](CCDKeychain, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, a7, a8, &v21);
  v10 = v21;
  if (v10)
  {
    v13 = v10;
    if (v9)
      CFRelease(v9);
    goto LABEL_4;
  }
  CFDictionaryAddValue(v9, kSecReturnData, kCFBooleanTrue);
  *(_QWORD *)buf = 0;
  v16 = SecItemCopyMatching(v9, (CFTypeRef *)buf);
  CFRelease(v9);
  if ((_DWORD)v16)
    v17 = (_DWORD)v16 == -25300;
  else
    v17 = 1;
  if (!v17)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v16));
    v18 = DEPErrorArray(CFSTR("KEYCHAIN_ERROR_CODE_P_CODE_%@"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DEPErrorWithDomain:code:descriptionArray:errorType:](NSError, "DEPErrorWithDomain:code:descriptionArray:errorType:", CFSTR("CCDKeychainErrorDomain"), 6000, v19, DEPErrorTypeFatal));

    if (!v13)
      return 0;
LABEL_4:
    if (a9)
    {
      v10 = objc_retainAutorelease(v13);
      *a9 = v10;
    }
    v14 = *(NSObject **)(DEPLogObjects(v10, v11, v12) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Cannot retrieve item from keychain. Error: %{public}@", buf, 0xCu);
    }

    return 0;
  }
  return *(id *)buf;
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFDictionary *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFDictionary *v36;
  uint64_t v37;
  void *v38;
  void *v40;
  id v41;
  void *value;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v43 = v19;
  if (objc_msgSend(v17, "length"))
  {
    value = v17;
    v44 = 0;
    v23 = +[CCDKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:](CCDKeychain, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:", v18, v19, v20, v21, v22, a10, &v44);
    v24 = v44;
    if (v24)
    {
      v27 = v24;
      if (v23)
        CFRelease(v23);
      v17 = value;
      goto LABEL_7;
    }
    v41 = v18;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CCDKeychain dataFromService:account:label:description:group:useSystemKeychain:outError:](CCDKeychain, "dataFromService:account:label:description:group:useSystemKeychain:outError:", v18, v19, v20, v21, v22, a10, 0));
    v34 = v33;
    if (v33)
    {
      if (objc_msgSend(v33, "isEqualToData:", value))
      {
        CFRelease(v23);
        v27 = 0;
        v17 = value;
        goto LABEL_21;
      }
      v47[0] = kSecValueData;
      v47[1] = kSecAttrAccessible;
      v48[0] = value;
      v48[1] = a8;
      v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
      v35 = SecItemUpdate(v23, v36);

    }
    else
    {
      CFDictionaryAddValue(v23, kSecValueData, value);
      CFDictionaryAddValue(v23, kSecAttrAccessible, a8);
      CFDictionaryAddValue(v23, kSecAttrSysBound, &__kCFBooleanTrue);
      v35 = SecItemAdd(v23, 0);
    }
    CFRelease(v23);
    if ((_DWORD)v35)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v35));
      v37 = DEPErrorArray(CFSTR("KEYCHAIN_ERROR_CODE_P_CODE_%@"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DEPErrorWithDomain:code:descriptionArray:errorType:](NSError, "DEPErrorWithDomain:code:descriptionArray:errorType:", CFSTR("CCDKeychainErrorDomain"), 6000, v38, DEPErrorTypeFatal, v40, 0));
    }
    else
    {
      v27 = 0;
    }
    v17 = value;
LABEL_21:

    v18 = v41;
    if (!v27)
      goto LABEL_22;
    goto LABEL_7;
  }
  v28 = DEPErrorArray(CFSTR("KEYCHAIN_ERROR_EMPTY_DATA"));
  v29 = v18;
  v30 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError DEPErrorWithDomain:code:descriptionArray:errorType:](NSError, "DEPErrorWithDomain:code:descriptionArray:errorType:", CFSTR("CCDKeychainErrorDomain"), 6001, v30, DEPErrorTypeFatal, 0));

  v18 = v29;
  if (!v27)
  {
LABEL_22:
    v32 = 1;
    goto LABEL_23;
  }
LABEL_7:
  if (a12)
  {
    v24 = objc_retainAutorelease(v27);
    *a12 = v24;
  }
  v31 = *(NSObject **)(DEPLogObjects(v24, v25, v26) + 8);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v27;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to set data in keychain. Error: %{public}@", buf, 0xCu);
  }

  v32 = 0;
LABEL_23:

  return v32;
}

+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __CFDictionary *Mutable;
  uint64_t v20;
  void *v21;

  v9 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(v14, "length"))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrService, v14);
    if (objc_msgSend(v15, "length"))
      CFDictionaryAddValue(Mutable, kSecAttrAccount, v15);
    if (objc_msgSend(v16, "length"))
      CFDictionaryAddValue(Mutable, kSecAttrLabel, v16);
    if (objc_msgSend(v17, "length"))
      CFDictionaryAddValue(Mutable, kSecAttrDescription, v17);
    if (objc_msgSend(v18, "length"))
      CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, v18);
    if (v9)
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, &__kCFBooleanTrue);
  }
  else
  {
    if (a9)
    {
      v20 = DEPErrorArray(CFSTR("KEYCHAIN_ERROR_CANNOT_CREATE_QUERY"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *a9 = (id)objc_claimAutoreleasedReturnValue(+[NSError DEPErrorWithDomain:code:descriptionArray:errorType:](NSError, "DEPErrorWithDomain:code:descriptionArray:errorType:", CFSTR("CCDKeychainErrorDomain"), 6002, v21, DEPErrorTypeFatal, 0));

    }
    Mutable = 0;
  }

  return Mutable;
}

@end

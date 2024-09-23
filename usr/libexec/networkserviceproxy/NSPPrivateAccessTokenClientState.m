@implementation NSPPrivateAccessTokenClientState

- (NSPPrivateAccessTokenClientState)init
{
  uint64_t v2;
  uint64_t v3;
  NSPPrivateAccessTokenClientState *v4;
  __SecKey *v5;
  uint64_t v6;
  uint64_t v7;
  __SecKey *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFDictionary *v11;
  SecKeyRef RandomKey;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  SEL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  _QWORD *v35;
  size_t v36;
  void *v37;
  uint64_t key;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  SEL v43;
  SEL v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSPPrivateAccessTokenClientState *v49;
  uint64_t v51;
  objc_super v52;
  uint8_t buf[16];
  uint8_t v54[8];
  CFStringRef v55;
  uint8_t v56[8];
  _UNKNOWN **v57;

  v52.receiver = self;
  v52.super_class = (Class)NSPPrivateAccessTokenClientState;
  v4 = -[NSPPrivateAccessTokenClientState init](&v52, "init");
  if (v4)
  {
    v5 = (__SecKey *)+[NPUtilities copyKeyFromKeychainWithIdentifier:](NPUtilities, "copyKeyFromKeychainWithIdentifier:", CFSTR("com.apple.NetworkServiceProxy.PrivateAccessTokens.ClientKey"));
    if (v5)
    {
      v8 = v5;
      v9 = nplog_obj(v5, v6, v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v56 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Found client key in keychain", v56, 2u);
      }

      v4->_clientKey = v8;
    }
    else if (!v4->_clientKey)
    {
      *(_QWORD *)v54 = kSecAttrKeyType;
      v55 = kSecAttrKeySizeInBits;
      *(_QWORD *)v56 = kSecAttrKeyTypeECSECPrimeRandom;
      v57 = &off_1000FF818;
      v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v54, 2));
      RandomKey = SecKeyCreateRandomKey(v11, 0);
      if (RandomKey)
      {
        v4->_clientKey = RandomKey;
        v15 = +[NPUtilities saveKeyToKeychain:withIdentifier:](NPUtilities, "saveKeyToKeychain:withIdentifier:", RandomKey, CFSTR("com.apple.NetworkServiceProxy.PrivateAccessTokens.ClientKey"));
        v18 = nplog_obj(v15, v16, v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Generated new client key", buf, 2u);
        }
      }
      else
      {
        v20 = nplog_obj(0, v13, v14);
        v19 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "SecKeyCreateRandomKey failed to generate client key", buf, 2u);
        }
      }

    }
    v21 = +[NPUtilities copyDataFromKeychainWithIdentifier:accountName:](NPUtilities, "copyDataFromKeychainWithIdentifier:accountName:", CFSTR("com.apple.NetworkServiceProxy.PrivateAccessTokens.Secret"), CFSTR("client-tokens"));
    v24 = v21;
    if (v21)
    {
      v25 = nplog_obj(v21, v22, v23);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v56 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Found client secret in keychain", v56, 2u);
      }

      objc_setProperty_atomic(v4, v27, v24, 16);
      goto LABEL_28;
    }
    if (objc_getProperty(v4, v22, 16, 1))
    {
LABEL_28:
      v49 = v4;
      goto LABEL_29;
    }
    *(_DWORD *)v56 = 0;
    v28 = ccrng(v56);
    if (*(_DWORD *)v56)
    {
      v31 = nplog_obj(v28, v29, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        v33 = "Failed to generate random";
LABEL_24:
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, v54, 2u);
      }
    }
    else
    {
      v34 = v28;
      v35 = (_QWORD *)ccec_cp_384();
      v36 = (32 * *v35) | 0x10;
      v37 = malloc_type_calloc(1uLL, v36, 0x5C22F50FuLL);
      key = ccec_generate_key(v35, v34, v37);
      if (!(_DWORD)key)
      {
        v42 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v37, v36);
        objc_setProperty_atomic(v4, v43, v42, 16);

        free(v37);
        v45 = +[NPUtilities saveDataToKeychain:withIdentifier:accountName:](NPUtilities, "saveDataToKeychain:withIdentifier:accountName:", objc_getProperty(v4, v44, 16, 1), CFSTR("com.apple.NetworkServiceProxy.PrivateAccessTokens.Secret"), CFSTR("client-tokens"));
        v48 = nplog_obj(v45, v46, v47);
        v32 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v54 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Generated new client secret", v54, 2u);
        }
        goto LABEL_27;
      }
      v41 = nplog_obj(key, v39, v40);
      v32 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        v33 = "Failed to generate key";
        goto LABEL_24;
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  v51 = nplog_obj(0, v2, v3);
  v24 = objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v56 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "[super init] failed", v56, 2u);
  }
LABEL_29:

  return v4;
}

- (void)dealloc
{
  __SecKey *clientKey;
  objc_super v4;

  if (self)
  {
    clientKey = self->_clientKey;
    if (clientKey)
    {
      CFRelease(clientKey);
      self->_clientKey = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPPrivateAccessTokenClientState;
  -[NSPPrivateAccessTokenClientState dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSecret, 0);
}

@end

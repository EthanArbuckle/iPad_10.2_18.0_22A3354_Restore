@implementation MCNewGlobalHTTPProxyPayloadHandler

- (id)userInputFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "proxyUsername"));
  if (!objc_msgSend(v5, "length"))
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "proxyPassword"));
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    v8 = MCLocalizedFormat(CFSTR("PASSWORD_PROMPT_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v9 = MCLocalizedFormat(CFSTR("GLOBAL_PROXY_PASSWORD_PROMPT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("password"), v5, v10, 0, 0, 0, 0, 0, 0x100000003));
    objc_msgSend(v3, "addObject:", v11);

LABEL_4:
  }

  return v3;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  __int128 v28;
  MCNewGlobalHTTPProxyPayloadHandler *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];

  v5 = a3;
  v29 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v32;
    v12 = kMCIDUUIDKey;
    v13 = kMCIDResponseKey;
    *(_QWORD *)&v9 = 138543618;
    v28 = v9;
    do
    {
      v14 = 0;
      v30 = v10;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v12, v28));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v13));
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("password")))
        {
          objc_msgSend(v6, "setProxyPassword:", v17);
        }
        else
        {
          v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            v19 = v18;
            v20 = (void *)objc_opt_class(v29);
            *(_DWORD *)buf = v28;
            v36 = v20;
            v37 = 2114;
            v38 = v16;
            v21 = v13;
            v22 = v12;
            v23 = v11;
            v24 = v7;
            v25 = v6;
            v26 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

            v6 = v25;
            v7 = v24;
            v11 = v23;
            v12 = v22;
            v13 = v21;
            v10 = v30;

          }
        }

        v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v10);
  }

  return 1;
}

- (BOOL)_install
{
  MCNewGlobalHTTPProxyPayloadHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const CFStringRef *v15;
  const CFStringRef *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _UNKNOWN **v22;
  void *v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  NSObject *v26;
  MCNewGlobalHTTPProxyPayloadHandler *v28;
  uint8_t buf[8];
  const __CFString *v30;
  void *v31;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v3, "proxyType") == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServer"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServer"));
      objc_msgSend(v4, "setObject:forKey:", v6, kSCPropNetProxiesHTTPProxy);

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServer"));
      objc_msgSend(v4, "setObject:forKey:", v7, kSCPropNetProxiesHTTPSProxy);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServerPort"));
    if (v8)
    {
      objc_msgSend(v4, "setObject:forKey:", v8, kSCPropNetProxiesHTTPPort);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 80));
      objc_msgSend(v4, "setObject:forKey:", v17, kSCPropNetProxiesHTTPPort);

    }
    v28 = v2;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServerPort"));
    if (v12)
    {
      objc_msgSend(v4, "setObject:forKey:", v12, kSCPropNetProxiesHTTPSPort);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 80));
      objc_msgSend(v4, "setObject:forKey:", v18, kSCPropNetProxiesHTTPSPort);

    }
    v15 = &kSCPropNetProxiesHTTPSEnable;
    v16 = &kSCPropNetProxiesHTTPEnable;
    v13 = 1;
    v14 = 1;
  }
  else
  {
    if (objc_msgSend(v3, "proxyType"))
      goto LABEL_19;
    v28 = v2;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyPACURLString"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyPACURLString"));
      objc_msgSend(v4, "setObject:forKey:", v10, kSCPropNetProxiesProxyAutoConfigURLString);

    }
    if (objc_msgSend(v3, "proxyPACFallbackAllowed"))
      v11 = &off_1000ED238;
    else
      v11 = &off_1000ED250;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, kSCPropNetProxiesFallBackAllowed);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v4, "setObject:forKey:", v12, kSCPropNetProxiesHTTPEnable);
    v13 = 0;
    v14 = 2;
    v15 = &kSCPropNetProxiesProxyAutoConfigEnable;
    v16 = &kSCPropNetProxiesHTTPSEnable;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
  objc_msgSend(v4, "setObject:forKey:", v19, *v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  objc_msgSend(v4, "setObject:forKey:", v20, *v15);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("HTTPProxyType"));

  v2 = v28;
LABEL_19:
  if (objc_msgSend(v3, "proxyCaptiveLoginAllowed"))
    v22 = &off_1000ED238;
  else
    v22 = &off_1000ED250;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, kSCPropNetProxiesBypassAllowed);
  v30 = CFSTR("Proxies");
  v31 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  v24 = +[MCManagedPreferencesManager setManagedPreferences:forDomain:](MCManagedPreferencesManager, "setManagedPreferences:forDomain:", v23, CFSTR("com.apple.SystemConfiguration"));

  if ((v24 & 1) != 0)
  {
    v25 = -[MCNewGlobalHTTPProxyPayloadHandler _sendSystemConfigurationProxyChangeNotification](v2, "_sendSystemConfigurationProxyChangeNotification");
  }
  else
  {
    v26 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "MCNewGlobalHTTPProxyPayloadHandler cannot install proxy settings.", buf, 2u);
    }
    v25 = 0;
  }

  return v25;
}

- (BOOL)_remove
{
  NSObject *v4;
  uint8_t v5[16];

  if ((+[MCManagedPreferencesManager setManagedPreferences:forDomain:](MCManagedPreferencesManager, "setManagedPreferences:forDomain:", &__NSDictionary0__struct, CFSTR("com.apple.SystemConfiguration")) & 1) != 0)return -[MCNewGlobalHTTPProxyPayloadHandler _sendSystemConfigurationProxyChangeNotification](self, "_sendSystemConfigurationProxyChangeNotification");
  v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "MCNewGlobalHTTPProxyPayloadHandler cannot remove proxy settings.", v5, 2u);
  }
  return 0;
}

- (void)_applyProxyCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profile"));
  objc_msgSend(v5, "set_useSystemKeychain:", objc_msgSend(v7, "isInstalledForSystem"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "proxyServerPort"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "proxyServerPort"));
    v10 = (uint64_t)objc_msgSend(v9, "integerValue");

  }
  else
  {
    v10 = 80;
  }

  v11 = objc_alloc((Class)NSURLProtectionSpace);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "proxyServer"));
  v13 = objc_msgSend(v11, "initWithProxyHost:port:type:realm:authenticationMethod:", v12, v10, NSURLProtectionSpaceHTTP, 0, NSURLAuthenticationMethodDefault);

  v14 = objc_alloc((Class)NSURLProtectionSpace);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "proxyServer"));
  v16 = objc_msgSend(v14, "initWithProxyHost:port:type:realm:authenticationMethod:", v15, v10, NSURLProtectionSpaceHTTPS, 0, NSURLAuthenticationMethodDefault);

  objc_msgSend(v5, "setDefaultCredential:forProtectionSpace:", v4, v13);
  objc_msgSend(v5, "setDefaultCredential:forProtectionSpace:", v4, v16);

}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  const void *Archive;
  const void *v16;
  CFDataRef Data;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[16];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  if (objc_msgSend(v8, "proxyType") == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "proxyUsername"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "proxyPassword"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithUser:password:persistence:](NSURLCredential, "credentialWithUser:password:persistence:", v9, v10, 2));

    -[MCNewGlobalHTTPProxyPayloadHandler _applyProxyCredential:](self, "_applyProxyCredential:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "proxyUsername"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "proxyPassword"));
    v14 = (const void *)CFURLCredentialCreate(0, v12, v13, 0, 3);

    if (v14)
    {
      Archive = (const void *)_CFURLCredentialCreateArchive(0, v14);
      if (Archive)
      {
        v16 = Archive;
        Data = CFPropertyListCreateData(0, Archive, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](NSString, "MCMakeUUID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "profile"));
          +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:useSystemKeychain:outError:", Data, CFSTR("MCGlobalProxy"), v18, 0, 0, objc_msgSend(v20, "isInstalledForSystem"), 0);

          objc_msgSend(v8, "setCredentialUUID:", v18);
        }
        CFRelease(v16);

        CFRelease(v14);
LABEL_10:

        goto LABEL_11;
      }
      CFRelease(v14);
    }
    v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot serialize credential. Ignoring.", buf, 2u);
    }
    goto LABEL_10;
  }
LABEL_11:
  if (-[MCNewGlobalHTTPProxyPayloadHandler _install](self, "_install"))
  {

    v22 = 0;
    v23 = 1;
  }
  else
  {
    v24 = MCGlobalHTTPProxyErrorDomain;
    v25 = MCErrorArray(CFSTR("GLOBAL_HTTP_PROXY_ERROR_CANNOT_APPLY"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v24, 31001, v26, MCErrorTypeFatal, 0));

    v23 = v22 == 0;
    if (a6 && v22)
    {
      v22 = objc_retainAutorelease(v22);
      v23 = 0;
      *a6 = v22;
    }
  }

  return v23;
}

- (void)_removeProxyCredential
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  NSString *v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if (objc_msgSend(v3, "proxyType") == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServerPort"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServerPort"));
      v6 = (int)objc_msgSend(v5, "intValue");

    }
    else
    {
      v6 = 80;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "profile"));
    objc_msgSend(v7, "set_useSystemKeychain:", objc_msgSend(v9, "isInstalledForSystem"));

    v10 = objc_alloc((Class)NSURLProtectionSpace);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServer"));
    v12 = objc_msgSend(v10, "initWithProxyHost:port:type:realm:authenticationMethod:", v11, v6, NSURLProtectionSpaceHTTP, 0, NSURLAuthenticationMethodDefault);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultCredentialForProtectionSpace:", v12));
    if (v13)
    {
      v22 = NSURLCredentialStorageRemoveSynchronizableCredentials;
      v23 = &__kCFBooleanTrue;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      objc_msgSend(v7, "removeCredential:forProtectionSpace:options:", v13, v12, v14);

    }
    v15 = objc_alloc((Class)NSURLProtectionSpace);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServer"));
    v17 = objc_msgSend(v15, "initWithProxyHost:port:type:realm:authenticationMethod:", v16, v6, NSURLProtectionSpaceHTTPS, 0, NSURLAuthenticationMethodDefault);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultCredentialForProtectionSpace:", v17));
    if (v18)
    {
      v20 = NSURLCredentialStorageRemoveSynchronizableCredentials;
      v21 = &__kCFBooleanTrue;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      objc_msgSend(v7, "removeCredential:forProtectionSpace:options:", v18, v17, v19);

    }
  }

}

- (void)_recoverProxyCredential
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFData *v8;
  CFPropertyListRef v9;
  const void *v10;
  uint64_t v11;
  const void *v12;
  uint64_t Username;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = objc_msgSend(v17, "proxyType") == 1;
  v4 = v17;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "credentialUUID"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profile"));
      v8 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:useSystemKeychain:outError:", CFSTR("MCGlobalProxy"), v5, 0, 0, objc_msgSend(v7, "isInstalledForSystem"), 0));

      if (v8)
      {
        v9 = CFPropertyListCreateWithData(0, v8, 0, 0, 0);
        if (v9)
        {
          v10 = v9;
          v11 = _CFURLCredentialCreateFromArchive(0, v9);
          if (v11)
          {
            v12 = (const void *)v11;
            Username = CFURLCredentialGetUsername();
            v14 = (void *)objc_claimAutoreleasedReturnValue(Username);
            v15 = (void *)CFURLCredentialCopyPassword(v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithUser:password:persistence:](NSURLCredential, "credentialWithUser:password:persistence:", v14, v15, 2));
            -[MCNewGlobalHTTPProxyPayloadHandler _applyProxyCredential:](self, "_applyProxyCredential:", v16);
            CFRelease(v12);

          }
          CFRelease(v10);
        }
      }

    }
    v4 = v17;
  }

}

- (void)setAside
{
  -[MCNewGlobalHTTPProxyPayloadHandler _removeProxyCredential](self, "_removeProxyCredential");
  -[MCNewGlobalHTTPProxyPayloadHandler _remove](self, "_remove");
}

- (void)unsetAside
{
  -[MCNewGlobalHTTPProxyPayloadHandler _recoverProxyCredential](self, "_recoverProxyCredential");
  -[MCNewGlobalHTTPProxyPayloadHandler _install](self, "_install");
}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
  {
    -[MCNewGlobalHTTPProxyPayloadHandler _remove](self, "_remove");
    -[MCNewGlobalHTTPProxyPayloadHandler _removeProxyCredential](self, "_removeProxyCredential");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "credentialUUID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profile"));
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", CFSTR("MCGlobalProxy"), v5, 0, 0, objc_msgSend(v7, "isInstalledForSystem"), 0);

  }
}

- (BOOL)_sendSystemConfigurationProxyChangeNotification
{
  SCDynamicStoreRef v2;
  const __SCDynamicStore *v3;
  CFStringRef Proxies;
  BOOL v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];
  const __CFString *v12;

  v2 = SCDynamicStoreCreate(0, CFSTR("ManagedConfiguration"), 0, 0);
  if (v2)
  {
    v3 = v2;
    Proxies = SCDynamicStoreKeyCreateProxies(0);
    v5 = Proxies != 0;
    v6 = _MCLogObjects[0];
    if (Proxies)
    {
      v7 = Proxies;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending proxy change notification.", v11, 2u);
      }
      v12 = CFSTR("com.apple.SystemConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:](MCManagedPreferencesManager, "sendManagedPreferencesChangedNotificationForDomains:", v8);

      SCDynamicStoreNotifyValue(v3, v7);
      CFRelease(v7);
    }
    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Cannot create System Configuration proxy key.", v11, 2u);
    }
    CFRelease(v3);
  }
  else
  {
    v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Cannot create System Configuration dynamic store reference.", v11, 2u);
    }
    return 0;
  }
  return v5;
}

@end

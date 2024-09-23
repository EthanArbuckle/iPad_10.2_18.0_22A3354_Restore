@implementation SoftwareUpdateSSO

- (id)buildSSOError:(int)a3 underlying:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  v10 = v9;
  if (v9)
  {
    if (v8)
      objc_msgSend(v9, "setObject:forKey:", v8, *MEMORY[0x24BDD0FC8]);
    if (v7)
      objc_msgSend(v10, "setObject:forKey:", v7, *MEMORY[0x24BDD1398]);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SoftwareUpdateSSOError"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SoftwareUpdateSSO)initWithOptions:(id)a3
{
  id v4;
  SoftwareUpdateSSO *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *SoftwareUpdateSSOCompletionSemaphore;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SoftwareUpdateSSO;
  v5 = -[SoftwareUpdateSSO init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[SoftwareUpdateSSO setAuthenticator:](v5, "setAuthenticator:", v6);

    -[SoftwareUpdateSSO authenticator](v5, "authenticator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v5);

    -[SoftwareUpdateSSO setDawToken:](v5, "setDawToken:", 0);
    v8 = dispatch_semaphore_create(0);
    SoftwareUpdateSSOCompletionSemaphore = v5->SoftwareUpdateSSOCompletionSemaphore;
    v5->SoftwareUpdateSSOCompletionSemaphore = (OS_dispatch_semaphore *)v8;

    if (ssoControllerQueueOnce == -1)
    {
      if (!v4)
        goto LABEL_14;
    }
    else
    {
      dispatch_once(&ssoControllerQueueOnce, &__block_literal_global_0);
      if (!v4)
        goto LABEL_14;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoftwareUpdateSSO setAppIdentifier:](v5, "setAppIdentifier:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("environmentIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoftwareUpdateSSO setEnvIdentifier:](v5, "setEnvIdentifier:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("username"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoftwareUpdateSSO setUserName:](v5, "setUserName:", v12);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactivity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactivity"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("0")) & 1) != 0
        || (objc_msgSend(v14, "isEqualToString:", CFSTR("1")) & 1) != 0
        || objc_msgSend(v14, "isEqualToString:", CFSTR("2")))
      {
        -[SoftwareUpdateSSO setInteractivityLevel:](v5, "setInteractivityLevel:", v14);
      }
      else
      {
        SoftwareUpdateSSOlogError();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_21AC5E000, v18, OS_LOG_TYPE_DEFAULT, "Invalid interactivity level was passed in: %@\n", buf, 0xCu);
        }

      }
    }
    -[SoftwareUpdateSSO interactivityLevel](v5, "interactivityLevel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      SoftwareUpdateSSOlogInfo();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AC5E000, v16, OS_LOG_TYPE_DEFAULT, "Using default interactivity level(0)\n", buf, 2u);
      }

      -[SoftwareUpdateSSO setInteractivityLevel:](v5, "setInteractivityLevel:", CFSTR("0"));
    }
  }
LABEL_14:

  return v5;
}

void __37__SoftwareUpdateSSO_initWithOptions___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MobileSoftwareUpdate.SoftwareUpdateSSO", v2);
  v1 = (void *)ssoControllerQueue;
  ssoControllerQueue = (uint64_t)v0;

}

- (void)setupAuthenticator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SoftwareUpdateSSO authenticator](self, "authenticator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SoftwareUpdateSSO appIdentifier](self, "appIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAppIdentifier:", v3);

  -[SoftwareUpdateSSO envIdentifier](self, "envIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnvIdentifier:", v4);

  -[SoftwareUpdateSSO userName](self, "userName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsername:", v5);

  -[SoftwareUpdateSSO interactivityLevel](self, "interactivityLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteractivity:", v6);

  objc_msgSend(v7, "setOtherParameters:", 0);
}

- (void)copyTokenFromAuthenticatorResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  const __CFString *v20;
  NSString *v21;
  NSObject *v22;
  void *v23;
  NSString *v24;
  NSString *dawToken;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  const __CFString *v35;
  _QWORD v36[4];
  NSObject *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    v7 = (void *)objc_msgSend(a3, "mutableCopy");
    SoftwareUpdateSSOlogInfo();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AC5E000, v8, OS_LOG_TYPE_DEFAULT, "Successfully retrieved response from authenticator\n", buf, 2u);
    }

    v9 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("otherInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setQuery:", v10);

    objc_msgSend(v9, "queryItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __62__SoftwareUpdateSSO_copyTokenFromAuthenticatorResponse_error___block_invoke;
    v36[3] = &unk_24DDD7A18;
    v12 = v7;
    v37 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v36);

    -[SoftwareUpdateSSO authenticator](self, "authenticator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "otherParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DAWRequest"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBD1C8], "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    SoftwareUpdateSSOlogInfo();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AC5E000, v18, OS_LOG_TYPE_DEFAULT, "Attempt to extract DAW token from response\n", buf, 2u);
      }
      v20 = CFSTR("dawToken");
    }
    else
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AC5E000, v18, OS_LOG_TYPE_DEFAULT, "Attempting to extract ACMToken from response\n", buf, 2u);
      }
      v20 = CFSTR("token");
    }

    -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v20);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    dawToken = self->_dawToken;
    self->_dawToken = v24;

    -[SoftwareUpdateSSO userName](self, "userName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("username"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SoftwareUpdateSSO setUserName:](self, "setUserName:", v27);

    }
    -[SoftwareUpdateSSO personID](self, "personID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("personId"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SoftwareUpdateSSO setPersonID:](self, "setPersonID:", v29);

    }
    SoftwareUpdateSSOlogError();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[SoftwareUpdateSSO userName](self, "userName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SoftwareUpdateSSO personID](self, "personID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        -[SoftwareUpdateSSO personID](self, "personID");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = CFSTR("Unknown");
      }
      -[SoftwareUpdateSSO dawToken](self, "dawToken");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("Valid");
      *(_DWORD *)buf = 138412802;
      v39 = v31;
      v40 = 2112;
      if (!v34)
        v35 = CFSTR("Not present");
      v41 = v33;
      v42 = 2112;
      v43 = v35;
      _os_log_impl(&dword_21AC5E000, v30, OS_LOG_TYPE_DEFAULT, "Username :%@ personID: %@ token:%@", buf, 0x20u);

      if (v32)
    }

    v22 = v37;
LABEL_28:

    goto LABEL_29;
  }
  v21 = self->_dawToken;
  self->_dawToken = 0;

  if (v6)
  {
    SoftwareUpdateSSOlogError();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v23;
      _os_log_impl(&dword_21AC5E000, v22, OS_LOG_TYPE_DEFAULT, "Failed to retrieve SSO token: %@\n", buf, 0xCu);

    }
    goto LABEL_28;
  }
LABEL_29:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->SoftwareUpdateSSOCompletionSemaphore);

}

void __62__SoftwareUpdateSSO_copyTokenFromAuthenticatorResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

- (BOOL)callerHasRequiredEntitlements
{
  __SecTask *v2;
  __SecTask *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];

  dispatch_assert_queue_V2((dispatch_queue_t)ssoControllerQueue);
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (v2)
  {
    v3 = v2;
    v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.softwareupdatesso.tokenaccessallowed"), 0);
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
      CFRelease(v5);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    SoftwareUpdateSSOlogError();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21AC5E000, v8, OS_LOG_TYPE_DEFAULT, "Unable to create taskref for permission check\n", v10, 2u);
    }

    return 0;
  }
  return v7;
}

- (id)copyUserInfo
{
  id v3;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)ssoControllerQueue);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SoftwareUpdateSSO_copyUserInfo__block_invoke;
  block[3] = &unk_24DDD7A40;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)ssoControllerQueue, block);
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_userName, CFSTR("username"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_personID, CFSTR("personId"));
  return v3;
}

void __33__SoftwareUpdateSSO_copyUserInfo__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  uint8_t buf[2];

  if (objc_msgSend(*(id *)(a1 + 32), "callerHasRequiredEntitlements"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setupAuthenticator");
    if ((objc_msgSend(*(id *)(a1 + 32), "ssoIsSupported") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "authenticator");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "authenticate");

      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      v4 = dispatch_time(0, 180000000000);
      dispatch_semaphore_wait(v3, v4);
      return;
    }
    SoftwareUpdateSSOlogError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "copyUserInfo called in unsupported environment\n";
      v7 = buf;
      goto LABEL_8;
    }
  }
  else
  {
    SoftwareUpdateSSOlogError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v6 = "Process does not have permissions to read the AC user info\n";
      v7 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_21AC5E000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }

}

- (id)getDawToken
{
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)ssoControllerQueue);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SoftwareUpdateSSO_getDawToken__block_invoke;
  block[3] = &unk_24DDD7A40;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)ssoControllerQueue, block);
  return self->_dawToken;
}

void __32__SoftwareUpdateSSO_getDawToken__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t v11[8];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "callerHasRequiredEntitlements");
  objc_msgSend(*(id *)(a1 + 32), "setDawToken:", 0);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setupAuthenticator");
    if ((objc_msgSend(*(id *)(a1 + 32), "ssoIsSupported") & 1) != 0)
    {
      v12 = CFSTR("DAWRequest");
      objc_msgSend(MEMORY[0x24BDBD1C8], "stringValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "authenticator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOtherParameters:", v4);

      objc_msgSend(*(id *)(a1 + 32), "authenticator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "authenticate");

      v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      v8 = dispatch_time(0, 180000000000);
      dispatch_semaphore_wait(v7, v8);
      return;
    }
    SoftwareUpdateSSOlogError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      v10 = "GenerateDawToken called in unsupported environment\n";
      goto LABEL_8;
    }
  }
  else
  {
    SoftwareUpdateSSOlogError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      v10 = "Process does not have permissions to read the sso token\n";
LABEL_8:
      _os_log_impl(&dword_21AC5E000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
  }

}

- (BOOL)ssoIsSupported
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v7;
  uint8_t v8[16];

  -[SoftwareUpdateSSO authenticator](self, "authenticator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SoftwareUpdateSSO authenticator](self, "authenticator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "authenticationSupported");

    return v5;
  }
  else
  {
    SoftwareUpdateSSOlogError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21AC5E000, v7, OS_LOG_TYPE_DEFAULT, "No authenticator object found. Assuming sso not supported\n", v8, 2u);
    }

    return 0;
  }
}

- (void)authenticator:(id)a3 didCompleteWithResult:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  SoftwareUpdateSSOlogInfo();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21AC5E000, v6, OS_LOG_TYPE_DEFAULT, "INFO: ExtensibleSSOAuthentication callback returned success\n", v7, 2u);
  }

  -[SoftwareUpdateSSO copyTokenFromAuthenticatorResponse:error:](self, "copyTokenFromAuthenticatorResponse:error:", v5, 0);
}

- (void)authenticator:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  SoftwareUpdateSSOlogError();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_21AC5E000, v6, OS_LOG_TYPE_DEFAULT, "ExtensibleSSOAuthentication callback returned error: %@\n", (uint8_t *)&v9, 0xCu);

  }
  -[SoftwareUpdateSSO buildSSOError:underlying:description:](self, "buildSSOError:underlying:description:", 1, v5, CFSTR("Call to SSOAuthenticator Authenticate failed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SoftwareUpdateSSO copyTokenFromAuthenticatorResponse:error:](self, "copyTokenFromAuthenticatorResponse:error:", 0, v8);

}

- (SoftwareUpdateExtensibleSSOAuthenticator)authenticator
{
  return (SoftwareUpdateExtensibleSSOAuthenticator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthenticator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)defaultAuthParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultAuthParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)appIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)personID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)envIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEnvIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)dawToken
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDawToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)interactivityLevel
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInteractivityLevel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (id)resultCallBack
{
  return self->_resultCallBack;
}

- (void)setResultCallBack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultCallBack, 0);
  objc_storeStrong((id *)&self->_interactivityLevel, 0);
  objc_storeStrong((id *)&self->_dawToken, 0);
  objc_storeStrong((id *)&self->_envIdentifier, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultAuthParameters, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->SoftwareUpdateSSOCompletionSemaphore, 0);
}

@end

@implementation TPSURLSessionACAuthHandler

- (TPSURLSessionACAuthHandler)initWithAuthenticationContext:(id)a3
{
  id v5;
  TPSURLSessionACAuthHandler *v6;
  TPSURLSessionACAuthHandler *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *syncQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSURLSessionACAuthHandler;
  v6 = -[TPSURLSessionACAuthHandler init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authContext, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.tips.ACAuthHandler.syncQueue", v8);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_ssoAuthenticator, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

+ (BOOL)canAuthenticateWithURLResponse:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[TPSContentURLController defaultHost](TPSContentURLController, "defaultHost");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "host");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v9 & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        if (canAuthenticateWithURLResponse__onceToken != -1)
          dispatch_once(&canAuthenticateWithURLResponse__onceToken, &__block_literal_global_19);
        v11 = objc_msgSend(v4, "statusCode");
        v12 = (void *)canAuthenticateWithURLResponse__supportedStatusCodes;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v12, "containsObject:", v13);

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __61__TPSURLSessionACAuthHandler_canAuthenticateWithURLResponse___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3978698);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)canAuthenticateWithURLResponse__supportedStatusCodes;
  canAuthenticateWithURLResponse__supportedStatusCodes = v0;

}

- (void)authenticateForURLResponse:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
    goto LABEL_5;
  v14 = 0;
  -[TPSURLSessionACAuthHandler _authenticationTokenForHost:error:](self, "_authenticationTokenForHost:error:", v8, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  v11 = v10;
  if (!v9)
  {

LABEL_5:
    -[TPSURLSessionACAuthHandler _authenticateWithAppleConnect:](self, "_authenticateWithAppleConnect:", v6);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bearer %@"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("Authorization");
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *, _QWORD))v6 + 2))(v6, 0, 0, v13, 0);

LABEL_6:
}

- (id)customHeaderFields
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[TPSURLSessionACAuthHandler authContext](self, "authContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v6 = CFSTR("X-Client-Id");
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_authenticateWithAppleConnect:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];

  v4 = a3;
  -[TPSURLSessionACAuthHandler syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TPSURLSessionACAuthHandler__authenticateWithAppleConnect___block_invoke;
  block[3] = &unk_1E395B100;
  block[4] = self;
  dispatch_sync(v5, block);

  -[TPSURLSessionACAuthHandler ssoAuthenticator](self, "ssoAuthenticator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPSURLSessionACAuthHandler ssoAuthenticator](self, "ssoAuthenticator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __60__TPSURLSessionACAuthHandler__authenticateWithAppleConnect___block_invoke_2;
    v10[3] = &unk_1E395D370;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v8, "authenticateWithCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 13, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, 0, v9);

  }
}

void __60__TPSURLSessionACAuthHandler__authenticateWithAppleConnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ssoAuthenticator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else
  {
    if (!PingPongClientLibraryCore_frameworkLibrary)
    {
      v21 = xmmword_1E395D390;
      v22 = 0;
      PingPongClientLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (PingPongClientLibraryCore_frameworkLibrary)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v3 = (void *)getPPCExtensibleSSOAuthenticatorClass_softClass;
      v20 = getPPCExtensibleSSOAuthenticatorClass_softClass;
      if (!getPPCExtensibleSSOAuthenticatorClass_softClass)
      {
        *(_QWORD *)&v21 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v21 + 1) = 3221225472;
        v22 = __getPPCExtensibleSSOAuthenticatorClass_block_invoke;
        v23 = &unk_1E395D3B0;
        v24 = &v17;
        __getPPCExtensibleSSOAuthenticatorClass_block_invoke((uint64_t)&v21);
        v3 = (void *)v18[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v17, 8);
      v5 = objc_alloc_init(v4);
      objc_msgSend(*(id *)(a1 + 32), "setSsoAuthenticator:", v5, v17);

    }
  }
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  objc_msgSend(v7, "authContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v6, "ssoAuthenticator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAppIdentifier:", v9);

  objc_msgSend(*v6, "authContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enviromentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v6, "ssoAuthenticator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnvIdentifier:", v12);

  objc_msgSend(*v6, "authContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "interactivityMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v6, "ssoAuthenticator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInteractivity:", v15);

}

void __60__TPSURLSessionACAuthHandler__authenticateWithAppleConnect___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v7 = (id *)getkExtensibleSSOUsernameKeySymbolLoc_ptr;
  v21 = getkExtensibleSSOUsernameKeySymbolLoc_ptr;
  if (!getkExtensibleSSOUsernameKeySymbolLoc_ptr)
  {
    v8 = (void *)PingPongClientLibrary();
    v7 = (id *)dlsym(v8, "kExtensibleSSOUsernameKey");
    v19[3] = (uint64_t)v7;
    getkExtensibleSSOUsernameKeySymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v18, 8);
  if (!v7)
    goto LABEL_15;
  v9 = *v7;
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v11 = (id *)getkExtensibleSSOTokenKeySymbolLoc_ptr;
  v21 = getkExtensibleSSOTokenKeySymbolLoc_ptr;
  if (!getkExtensibleSSOTokenKeySymbolLoc_ptr)
  {
    v12 = (void *)PingPongClientLibrary();
    v11 = (id *)dlsym(v12, "kExtensibleSSOTokenKey");
    v19[3] = (uint64_t)v11;
    getkExtensibleSSOTokenKeySymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v18, 8);
  if (!v11)
  {
LABEL_15:
    +[TPSUserTypeChecker _previousBuildVersion].cold.1();
    __break(1u);
  }
  v13 = *v11;
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "authContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length") && objc_msgSend(v14, "length"))
  {
    if (objc_msgSend(v16, "length"))
    {
      v24[0] = CFSTR("X-AppleConnect-User");
      v24[1] = CFSTR("X-AppleConnect-Token");
      v25[0] = v10;
      v25[1] = v14;
      v24[2] = CFSTR("X-Client-Id");
      v25[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    }
    else
    {
      v22[0] = CFSTR("X-AppleConnect-User");
      v22[1] = CFSTR("X-AppleConnect-Token");
      v23[0] = v10;
      v23[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_authenticationTokenForHost:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  OSStatus v10;
  void *v11;
  id v12;
  NSObject *v13;
  CFTypeRef cf;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0CD6CA8];
  v7 = *MEMORY[0x1E0CD6B58];
  v16[0] = *MEMORY[0x1E0CD6C98];
  v16[1] = v7;
  v17[0] = v6;
  v17[1] = CFSTR("ipcdn");
  v8 = *MEMORY[0x1E0CD7018];
  v16[2] = *MEMORY[0x1E0CD68F8];
  v16[3] = v8;
  v17[2] = v5;
  v17[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  cf = 0;
  v10 = SecItemCopyMatching(v9, &cf);
  if (!v10)
  {
    if (cf)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3940]);
      v11 = (void *)objc_msgSend(v12, "initWithData:encoding:", cf, 4);
      CFRelease(cf);
      goto LABEL_10;
    }
    +[TPSLogger default](TPSLogger, "default");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[TPSURLSessionACAuthHandler _authenticationTokenForHost:error:].cold.1(v13);

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (TPSURLSessionACAuthContext)authenticationContext
{
  return self->_authenticationContext;
}

- (TPSURLSessionACAuthContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PPCExtensibleSSOAuthenticator)ssoAuthenticator
{
  return self->_ssoAuthenticator;
}

- (void)setSsoAuthenticator:(id)a3
{
  objc_storeStrong((id *)&self->_ssoAuthenticator, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (void)_authenticationTokenForHost:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19A906000, log, OS_LOG_TYPE_DEBUG, "Keychain item was found but had no data!", v1, 2u);
}

@end

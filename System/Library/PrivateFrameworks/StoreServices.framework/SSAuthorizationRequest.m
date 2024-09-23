@implementation SSAuthorizationRequest

- (SSAuthorizationRequest)init
{
  return -[SSAuthorizationRequest initWithAuthorizationToken:accountIdentifier:](self, "initWithAuthorizationToken:accountIdentifier:", 0, 0);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSAuthorizationRequest;
  return -[SSRequest init](&v3, sel_init);
}

- (SSAuthorizationRequest)initWithAuthorizationToken:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SSAuthorizationRequest *v9;
  uint64_t v10;
  NSNumber *accountIdentifier;
  id v12;
  id token;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must provide token"));
  if (!v8)
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must provide accountIdentifier"));
LABEL_4:
  v15.receiver = self;
  v15.super_class = (Class)SSAuthorizationRequest;
  v9 = -[SSRequest init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    accountIdentifier = v9->_accountIdentifier;
    v9->_accountIdentifier = (NSNumber *)v10;

    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE6724F0))
      v12 = (id)objc_msgSend(v6, "copy");
    else
      v12 = v6;
    token = v9->_token;
    v9->_token = v12;

  }
  return v9;
}

- (id)authorizationToken
{
  return self->_token;
}

- (void)startWithAuthorizationResponseBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSAuthorizationRequest startWithAuthorizationResponseBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__SSAuthorizationRequest_startWithAuthorizationResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 57, v19);

}

void __62__SSAuthorizationRequest_startWithAuthorizationResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  SSURLConnectionResponse *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "2");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "initWithXPCEncoding:", v6);

      v8 = [SSURLConnectionResponse alloc];
      xpc_dictionary_get_value(v4, "1");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSURLConnectionResponse initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);

    }
    if (!(v10 | v7))
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SSAuthorizationRequest_startWithAuthorizationResponseBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v12 = *(id *)(a1 + 40);
    v17 = (id)v7;
    v18 = v12;
    v16 = (id)v10;
    v13 = (id)v7;
    v14 = (id)v10;
    dispatch_async(v11, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

uint64_t __62__SSAuthorizationRequest_startWithAuthorizationResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__SSAuthorizationRequest_start__block_invoke;
  v3[3] = &unk_1E47BB9F8;
  v3[4] = self;
  -[SSAuthorizationRequest startWithAuthorizationResponseBlock:](self, "startWithAuthorizationResponseBlock:", v3);
  return 1;
}

void __31__SSAuthorizationRequest_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SSAuthorizationRequest_start__block_invoke_2;
  block[3] = &unk_1E47B87B8;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __31__SSAuthorizationRequest_start__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "authorizationRequest:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "requestDidFinish:", *(_QWORD *)(a1 + 32));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SSAuthorizationRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BAAC8;
  v7 = v4;
  v5 = v4;
  -[SSAuthorizationRequest startWithAuthorizationResponseBlock:](self, "startWithAuthorizationResponseBlock:", v6);

}

uint64_t __51__SSAuthorizationRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSAuthorizationRequest *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SSAuthorizationRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

uint64_t __41__SSAuthorizationRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "50", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "59", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 104));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "52", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "53", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "54", *(__CFString **)(*(_QWORD *)(a1 + 40) + 120));
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "55", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "56", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 136));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "57", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 137));
  return SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "58", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160));
}

- (SSAuthorizationRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSAuthorizationRequest *v6;
  CFArrayRef v8;
  NSNumber *accountIdentifier;
  uint64_t v10;
  uint64_t v11;
  NSString *clientIdentifierHeader;
  uint64_t v13;
  uint64_t v14;
  NSNumber *familyAccountIdentifier;
  uint64_t v16;
  uint64_t v17;
  NSString *keybagPath;
  CFArrayRef v19;
  id token;
  uint64_t v21;
  uint64_t v22;
  NSString *reason;
  uint64_t v24;
  uint64_t v25;
  NSString *userAgent;
  objc_super v27;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v27.receiver = self;
    v27.super_class = (Class)SSAuthorizationRequest;
    v6 = -[SSRequest init](&v27, sel_init);
    if (v6)
    {
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "50");
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v8;

      v6->_allowSilentAuthentication = xpc_dictionary_get_BOOL(v5, "59");
      v10 = objc_opt_class();
      v11 = SSXPCDictionaryCopyObjectWithClass(v5, "53", v10);
      clientIdentifierHeader = v6->_clientIdentifierHeader;
      v6->_clientIdentifierHeader = (NSString *)v11;

      v13 = objc_opt_class();
      v14 = SSXPCDictionaryCopyObjectWithClass(v5, "52", v13);
      familyAccountIdentifier = v6->_familyAccountIdentifier;
      v6->_familyAccountIdentifier = (NSNumber *)v14;

      v16 = objc_opt_class();
      v17 = SSXPCDictionaryCopyObjectWithClass(v5, "53", v16);
      keybagPath = v6->_keybagPath;
      v6->_keybagPath = (NSString *)v17;

      v19 = SSXPCDictionaryCopyCFObject(v5, "54");
      token = v6->_token;
      v6->_token = v19;

      v21 = objc_opt_class();
      v22 = SSXPCDictionaryCopyObjectWithClass(v5, "55", v21);
      reason = v6->_reason;
      v6->_reason = (NSString *)v22;

      v6->_shouldAddKeysToKeyBag = xpc_dictionary_get_BOOL(v5, "56");
      v6->_shouldPromptForCredentials = xpc_dictionary_get_BOOL(v5, "57");
      v24 = objc_opt_class();
      v25 = SSXPCDictionaryCopyObjectWithClass(v5, "58", v24);
      userAgent = v6->_userAgent;
      v6->_userAgent = (NSString *)v25;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (BOOL)allowSilentAuthentication
{
  return self->_allowSilentAuthentication;
}

- (void)setAllowSilentAuthentication:(BOOL)a3
{
  self->_allowSilentAuthentication = a3;
}

- (NSString)clientIdentifierHeader
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setClientIdentifierHeader:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSNumber)familyAccountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFamilyAccountIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSString)keybagPath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setKeybagPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (BOOL)shouldAddKeysToKeyBag
{
  return self->_shouldAddKeysToKeyBag;
}

- (void)setShouldAddKeysToKeyBag:(BOOL)a3
{
  self->_shouldAddKeysToKeyBag = a3;
}

- (BOOL)shouldPromptForCredentials
{
  return self->_shouldPromptForCredentials;
}

- (void)setShouldPromptForCredentials:(BOOL)a3
{
  self->_shouldPromptForCredentials = a3;
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_familyAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifierHeader, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_keybagPath, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end

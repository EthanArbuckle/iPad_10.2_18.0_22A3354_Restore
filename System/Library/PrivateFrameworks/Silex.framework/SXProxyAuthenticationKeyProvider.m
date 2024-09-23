@implementation SXProxyAuthenticationKeyProvider

- (SXProxyAuthenticationKeyProvider)initWithIdentifier:(id)a3 secret:(id)a4
{
  id v6;
  id v7;
  SXProxyAuthenticationKeyProvider *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *secret;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXProxyAuthenticationKeyProvider;
  v8 = -[SXProxyAuthenticationKeyProvider init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    secret = v8->_secret;
    v8->_secret = (NSString *)v11;

  }
  return v8;
}

- (void)requestAuthenticationKeyWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__SXProxyAuthenticationKeyProvider_requestAuthenticationKeyWithCompletion___block_invoke;
  v6[3] = &unk_24D68AFA0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __75__SXProxyAuthenticationKeyProvider_requestAuthenticationKeyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)secret
{
  return self->_secret;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

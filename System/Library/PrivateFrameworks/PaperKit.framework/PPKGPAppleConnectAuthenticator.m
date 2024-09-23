@implementation PPKGPAppleConnectAuthenticator

- (PPKGPAppleConnectAuthenticator)initWithTokenProvider:(id)a3
{
  id v4;
  PPKGPAppleConnectAuthenticator *v5;
  PPKGPAppleConnectAuthenticator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPKGPAppleConnectAuthenticator;
  v5 = -[PPKGPAppleConnectAuthenticator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PPKGPAppleConnectAuthenticator setTokenProvider:](v5, "setTokenProvider:", v4);

  return v6;
}

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PPKGPAppleConnectAuthenticator tokenProvider](self, "tokenProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PPKGPAppleConnectAuthenticator_authenticateIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_1EA839488;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "authenticateWithCompletion:", v7);

}

uint64_t __69__PPKGPAppleConnectAuthenticator_authenticateIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PPKMagicGenerativePlaygroundTokenProvider)tokenProvider
{
  return (PPKMagicGenerativePlaygroundTokenProvider *)objc_loadWeakRetained((id *)&self->_tokenProvider);
}

- (void)setTokenProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tokenProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tokenProvider);
}

@end

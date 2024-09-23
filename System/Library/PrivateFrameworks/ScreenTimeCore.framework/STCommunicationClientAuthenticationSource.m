@implementation STCommunicationClientAuthenticationSource

- (STCommunicationClientAuthenticationSource)initWithAuthenticationSession:(id)a3
{
  STAuthenticationSession *v4;
  STCommunicationClientAuthenticationSource *v5;
  STAuthenticationSession *authenticationSession;
  objc_super v8;

  v4 = (STAuthenticationSession *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STCommunicationClientAuthenticationSource;
  v5 = -[STCommunicationClientAuthenticationSource init](&v8, sel_init);
  authenticationSession = v5->_authenticationSession;
  v5->_authenticationSession = v4;

  return v5;
}

- (void)authenticateWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  int v11;
  _QWORD v12[4];
  void (**v13)(id, uint64_t);
  id v14;
  id location;

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  v9 = (void *)objc_opt_new();
  -[STCommunicationClientAuthenticationSource authenticationSession](self, "authenticationSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasAlreadyEnteredPINForSession");

  if (v11)
  {
    v8[2](v8, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__STCommunicationClientAuthenticationSource_authenticateWithIdentifier_forced_completionHandler___block_invoke;
    v12[3] = &unk_1E9371170;
    objc_copyWeak(&v14, &location);
    v13 = v8;
    objc_msgSend(v9, "authenticateForCommunicationConfigurationOverrideWithCompletionHandler:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

uint64_t __97__STCommunicationClientAuthenticationSource_authenticateWithIdentifier_forced_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t (*v6)(void);

  if (a2)
  {
    v3 = objc_msgSend(a2, "authenticated");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "authenticationSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasAlreadyEnteredPINForSession:", v3);

    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  return v6();
}

- (STAuthenticationSession)authenticationSession
{
  return self->_authenticationSession;
}

- (void)setAuthenticationSession:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationSession, 0);
}

@end

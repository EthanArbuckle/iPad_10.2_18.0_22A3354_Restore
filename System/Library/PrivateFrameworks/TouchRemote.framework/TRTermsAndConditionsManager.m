@implementation TRTermsAndConditionsManager

- (TRTermsAndConditionsManager)initWithAuthResultsBlock:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  TRTermsAndConditionsManager *v9;
  TRTermsAndConditionsManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRTermsAndConditionsManager;
  v9 = -[TRTermsAndConditionsManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authResult, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (void)loadProxiedTerms:(id)a3 anisetteDataProvider:(id)a4 appProvidedContext:(id)a5 acceptAction:(id)a6 declineAction:(id)a7
{
  AKDevice *v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  AAUIProxiedTermsRemoteUI *v23;
  AAUIProxiedTermsRemoteUI *proxiedTermsRemoteUI;
  AKDevice *proxiedDevice;
  AKDevice *v26;
  void *v27;
  id acceptAction;
  void *v29;
  id declineAction;
  uint8_t v31[8];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v12 = (AKDevice *)a3;
  v13 = (objc_class *)MEMORY[0x24BDBCF20];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = [v13 alloc];
  v32[0] = *MEMORY[0x24BE048D8];
  v32[1] = CFSTR("HomePodSLA");
  v19 = *MEMORY[0x24BE048C8];
  v32[2] = *MEMORY[0x24BE048D0];
  v32[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithArray:", v20);

  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_20A2BF000, v22, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager loadProxiedTerms", v31, 2u);
    }

  }
  v23 = (AAUIProxiedTermsRemoteUI *)objc_msgSend(objc_alloc(getAAUIProxiedTermsRemoteUIClass()), "initWithAuthResults:proxiedDevice:anisetteDataProvider:appProvidedContext:termsEntries:", self->_authResult, v12, v17, v16, v21);

  proxiedTermsRemoteUI = self->_proxiedTermsRemoteUI;
  self->_proxiedTermsRemoteUI = v23;

  -[AAUIProxiedTermsRemoteUI setDelegate:](self->_proxiedTermsRemoteUI, "setDelegate:", self);
  proxiedDevice = self->_proxiedDevice;
  self->_proxiedDevice = v12;
  v26 = v12;

  v27 = (void *)MEMORY[0x20BD22DF8](v15);
  acceptAction = self->_acceptAction;
  self->_acceptAction = v27;

  v29 = (void *)MEMORY[0x20BD22DF8](v14);
  declineAction = self->_declineAction;
  self->_declineAction = v29;

  -[TRTermsAndConditionsManager presentProxiedTermsRemoteUI](self, "presentProxiedTermsRemoteUI");
}

- (void)setAcceptedTermsInfo:(id)a3
{
  NSDictionary *v4;
  NSObject *v5;
  NSDictionary *acceptedTermsInfo;
  int v7;
  NSDictionary *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (NSDictionary *)a3;
  if (-[NSDictionary count](v4, "count") && _TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager Terms Info not empty %@", (uint8_t *)&v7, 0xCu);
    }

  }
  acceptedTermsInfo = self->_acceptedTermsInfo;
  self->_acceptedTermsInfo = v4;

  if (self->_didAccept)
    -[TRTermsAndConditionsManager handleAccept](self, "handleAccept");
}

- (void)handleAccept
{
  NSObject *v3;
  NSObject *v4;
  void (**acceptAction)(id, NSDictionary *);
  NSObject *v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t buf[16];

  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager handleAccept", buf, 2u);
    }

    if (self->_didAccept && _TRLogEnabled == 1)
    {
      TRLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_20A2BF000, v4, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager handleAccept entered multiple times", v8, 2u);
      }

    }
  }
  self->_didAccept = 1;
  acceptAction = (void (**)(id, NSDictionary *))self->_acceptAction;
  if (acceptAction)
  {
    acceptAction[2](acceptAction, self->_acceptedTermsInfo);
  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager acceptedTerms undefined", v7, 2u);
    }

  }
}

- (void)presentProxiedTermsRemoteUI
{
  UIViewController *presentingViewController;
  AAUIProxiedTermsRemoteUI *proxiedTermsRemoteUI;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  presentingViewController = self->_presentingViewController;
  if (presentingViewController && (proxiedTermsRemoteUI = self->_proxiedTermsRemoteUI) != 0)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager Presenting Terms", buf, 2u);
      }

      presentingViewController = self->_presentingViewController;
      proxiedTermsRemoteUI = self->_proxiedTermsRemoteUI;
    }
    -[AAUIProxiedTermsRemoteUI presentFromViewController:modal:](proxiedTermsRemoteUI, "presentFromViewController:modal:", presentingViewController, 1);
  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager Could not present", v12, 2u);
    }

    v7 = _TRLogEnabled;
    if (!self->_presentingViewController && _TRLogEnabled == 1)
    {
      TRLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "Reason: Presenting VC Nil", v11, 2u);
      }

      v7 = _TRLogEnabled;
    }
    if (!self->_proxiedTermsRemoteUI && v7 == 1)
    {
      TRLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, "Reason: Proxy Terms Nil", v10, 2u);
      }

    }
  }
}

- (void)handleDecline
{
  NSObject *v3;
  void (**declineAction)(void);
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager handleDecline", buf, 2u);
    }

  }
  declineAction = (void (**)(void))self->_declineAction;
  if (declineAction)
  {
    declineAction[2]();
  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager decline action undefined", v6, 2u);
    }

  }
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "no";
      if (v4)
        v8 = "yes";
      v9 = 136315138;
      v10 = v8;
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager didFinishWithSuccess %s", (uint8_t *)&v9, 0xCu);
    }

  }
  if (v4)
    -[TRTermsAndConditionsManager handleAccept](self, "handleAccept");
  else
    -[TRTermsAndConditionsManager handleDecline](self, "handleDecline");

}

- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager acceptedTermsInfo %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[TRTermsAndConditionsManager setAcceptedTermsInfo:](self, "setAcceptedTermsInfo:", v5);

}

- (AAUIProxiedTermsRemoteUI)proxiedTermsRemoteUI
{
  return self->_proxiedTermsRemoteUI;
}

- (void)setProxiedTermsRemoteUI:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedTermsRemoteUI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxiedTermsRemoteUI, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_acceptedTermsInfo, 0);
  objc_storeStrong(&self->_declineAction, 0);
  objc_storeStrong(&self->_acceptAction, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_storeStrong((id *)&self->_authResult, 0);
}

@end

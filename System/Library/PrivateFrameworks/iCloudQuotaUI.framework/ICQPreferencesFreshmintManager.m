@implementation ICQPreferencesFreshmintManager

- (void)beginFlowWithDelegate:(id)a3 offer:(id)a4 url:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  ICQUpgradeFlowManager *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "Presenting Freshmint offer.", v19, 2u);
  }

  objc_storeWeak((id *)&self->_delegate, v13);
  v15 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", v12);

  -[ICQPreferencesFreshmintManager setFreshmintFlowManager:](self, "setFreshmintFlowManager:", v15);
  -[ICQPreferencesFreshmintManager freshmintFlowManager](self, "freshmintFlowManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  v17 = (void *)objc_msgSend(v10, "copy");
  -[ICQPreferencesFreshmintManager setFreshmintFlowCompletion:](self, "setFreshmintFlowCompletion:", v17);

  -[ICQPreferencesFreshmintManager freshmintFlowManager](self, "freshmintFlowManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_beginRemoteFlowWithURL:", v11);

}

- (void)beginFlowWithICQLink:(id)a3 completion:(id)a4
{
  -[ICQPreferencesFreshmintManager beginFlowWithICQLink:presenter:completion:](self, "beginFlowWithICQLink:presenter:completion:", a3, 0, a4);
}

- (void)beginFlowWithICQLink:(id)a3 presenter:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  ICQUpgradeFlowManager *v10;
  ICQUpgradeFlowManager *freshmintFlowManager;
  void *v12;
  id freshmintFlowCompletion;
  id v14;

  v8 = a5;
  v9 = a4;
  v14 = a3;
  v10 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", self->_offer);
  freshmintFlowManager = self->_freshmintFlowManager;
  self->_freshmintFlowManager = v10;

  -[ICQUpgradeFlowManager setDelegate:](self->_freshmintFlowManager, "setDelegate:", self);
  v12 = (void *)objc_msgSend(v8, "copy");

  freshmintFlowCompletion = self->_freshmintFlowCompletion;
  self->_freshmintFlowCompletion = v12;

  -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:](self->_freshmintFlowManager, "beginRemoteUpgradeFlowWithICQLink:presenter:", v14, v9);
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICQPreferencesFreshmintManager runFreshmintCompletionDidComplete:](self, "runFreshmintCompletionDidComplete:", 0);
  -[ICQPreferencesFreshmintManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upgradeFlowManagerDidCancel:", v4);

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICQPreferencesFreshmintManager runFreshmintCompletionDidComplete:](self, "runFreshmintCompletionDidComplete:", 1);
  -[ICQPreferencesFreshmintManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upgradeFlowManagerDidComplete:", v4);

}

- (void)runFreshmintCompletionDidComplete:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  -[ICQPreferencesFreshmintManager setShouldShowFreshmint:](self, "setShouldShowFreshmint:", 0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__ICQPreferencesFreshmintManager_runFreshmintCompletionDidComplete___block_invoke;
  v5[3] = &unk_24E3F37A0;
  v5[4] = self;
  v6 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
}

void __68__ICQPreferencesFreshmintManager_runFreshmintCompletionDidComplete___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "freshmintFlowCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "freshmintFlowCompletion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(unsigned __int8 *)(a1 + 40), 0);

    objc_msgSend(*(id *)(a1 + 32), "setFreshmintFlowCompletion:", 0);
  }
}

- (BOOL)shouldShowFreshmint
{
  return self->_shouldShowFreshmint;
}

- (void)setShouldShowFreshmint:(BOOL)a3
{
  self->_shouldShowFreshmint = a3;
}

- (ICQUpgradeFlowManagerDelegate)delegate
{
  return (ICQUpgradeFlowManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  objc_storeStrong((id *)&self->_offer, a3);
}

- (ICQUpgradeFlowManager)freshmintFlowManager
{
  return self->_freshmintFlowManager;
}

- (void)setFreshmintFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_freshmintFlowManager, a3);
}

- (id)freshmintFlowCompletion
{
  return self->_freshmintFlowCompletion;
}

- (void)setFreshmintFlowCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_freshmintFlowCompletion, 0);
  objc_storeStrong((id *)&self->_freshmintFlowManager, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

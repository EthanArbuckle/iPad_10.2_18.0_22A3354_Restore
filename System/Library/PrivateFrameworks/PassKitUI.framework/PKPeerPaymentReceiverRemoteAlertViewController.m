@implementation PKPeerPaymentReceiverRemoteAlertViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)nearbyContext
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__PKPeerPaymentReceiverRemoteAlertViewController_configureWithContext_completion___block_invoke;
  v11[3] = &unk_1E3E61B90;
  objc_copyWeak(&v14, &location);
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentReceiverRemoteAlertViewController;
  -[PKNearbyPeerPaymentRemoteAlertViewController configureWithContext:completion:](&v10, sel_configureWithContext_completion_, v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __82__PKPeerPaymentReceiverRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)WeakRetained[127];
  WeakRetained[127] = v3;

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)_cleanup
{
  void *v3;
  void *replyAction;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentReceiverRemoteAlertViewController;
  -[PKNearbyPeerPaymentRemoteAlertViewController _cleanup](&v6, sel__cleanup);
  -[PKNearbyPeerPaymentRemoteAlertViewController userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uiHost"));
  replyAction = (void *)objc_claimAutoreleasedReturnValue();
  if (!replyAction)
  {
    v5 = -[BSAction canSendResponse](self->_replyAction, "canSendResponse");

    if (!v5)
      return;
    objc_msgSend(MEMORY[0x1E0D016A8], "responseWithInfo:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSAction sendResponse:](self->_replyAction, "sendResponse:", v3);
    replyAction = self->_replyAction;
    self->_replyAction = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyAction, 0);
}

@end

@implementation TPSCallWaitingController

- (TPSCallWaitingController)init
{
  -[TPSCallWaitingController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCallWaitingController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSCallWaitingController *v6;
  TPSCallWaitingController *v7;
  TPSCallWaitingRequestController *v8;
  TPSCallWaitingRequestController *requestController;
  TPSCallWaitingRequest *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSCallWaitingController;
  v6 = -[TPSCallWaitingController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v7->_state = 0;
    v8 = objc_alloc_init(TPSCallWaitingRequestController);
    requestController = v7->_requestController;
    v7->_requestController = v8;

    -[TPSRequestController addDelegate:queue:](v7->_requestController, "addDelegate:queue:", v7, MEMORY[0x1E0C80D38]);
    v10 = -[TPSCallWaitingRequest initWithSubscriptionContext:]([TPSCallWaitingRequest alloc], "initWithSubscriptionContext:", v5);
    -[TPSRequestController addRequest:](v7->_requestController, "addRequest:", v10);

  }
  return v7;
}

- (void)requestStateChange:(int64_t)a3
{
  TPSSetCallWaitingRequest *v5;
  void *v6;
  TPSSetCallWaitingRequest *v7;
  NSObject *v8;
  void *v9;
  int v10;
  TPSSetCallWaitingRequest *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[TPSCallWaitingController state](self, "state") != a3)
  {
    -[TPSCallWaitingController setState:](self, "setState:", 0);
    v5 = [TPSSetCallWaitingRequest alloc];
    -[TPSCallWaitingController subscriptionContext](self, "subscriptionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TPSSetCallWaitingRequest initWithSubscriptionContext:enabled:](v5, "initWithSubscriptionContext:enabled:", v6, a3 == 2);

    TPSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Sending call waiting request %@.", (uint8_t *)&v10, 0xCu);
    }

    -[TPSCallWaitingController requestController](self, "requestController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addRequest:", v7);

  }
}

- (void)requestController:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  TPSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v13 = 138412546;
    *(_QWORD *)&v13[4] = objc_opt_class();
    *(_WORD *)&v13[12] = 2112;
    *(_QWORD *)&v13[14] = v5;
    v7 = *(id *)&v13[4];
    _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "%@ received response %@.", v13, 0x16u);

  }
  if (objc_msgSend(v5, "enabled"))
    v8 = 2;
  else
    v8 = 1;
  -[TPSCallWaitingController setState:](self, "setState:", v8, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  -[TPSCallWaitingController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[TPSCallWaitingController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callWaitingController:didChangeState:error:", self, v8, v12);

  }
}

- (TPSCallWaitingControllerDelegate)delegate
{
  return (TPSCallWaitingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TPSCallWaitingRequestController)requestController
{
  return self->_requestController;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

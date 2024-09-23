@implementation TPSCallingLineIdRestrictionController

- (TPSCallingLineIdRestrictionController)init
{
  -[TPSCallingLineIdRestrictionController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCallingLineIdRestrictionController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSCallingLineIdRestrictionController *v6;
  TPSCallingLineIdRestrictionController *v7;
  TPSCallingLineIdRestrictionRequestController *v8;
  TPSCallingLineIdRestrictionRequestController *requestController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSCallingLineIdRestrictionController;
  v6 = -[TPSCallingLineIdRestrictionController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v7->_state = 0;
    v8 = objc_alloc_init(TPSCallingLineIdRestrictionRequestController);
    requestController = v7->_requestController;
    v7->_requestController = v8;

    -[TPSRequestController addDelegate:queue:](v7->_requestController, "addDelegate:queue:", v7, MEMORY[0x1E0C80D38]);
    -[TPSCallingLineIdRestrictionController requestStateForSubscriptionContext:](v7, "requestStateForSubscriptionContext:", v5);
  }

  return v7;
}

- (void)requestStateForSubscriptionContext:(id)a3
{
  id v4;
  TPSCallingLineIdRestrictionRequest *v5;
  NSObject *v6;
  int v7;
  TPSCallingLineIdRestrictionRequest *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TPSCallingLineIdRestrictionRequest initWithSubscriptionContext:]([TPSCallingLineIdRestrictionRequest alloc], "initWithSubscriptionContext:", v4);

  TPSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "Sending caller line ID restriction request %@.", (uint8_t *)&v7, 0xCu);
  }

  -[TPSRequestController addRequest:](self->_requestController, "addRequest:", v5);
}

- (void)requestStateChange:(int64_t)a3
{
  TPSCallingLineIdRestrictionSetRequest *v5;
  void *v6;
  TPSCallingLineIdRestrictionSetRequest *v7;
  NSObject *v8;
  void *v9;
  int v10;
  TPSCallingLineIdRestrictionSetRequest *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[TPSCallingLineIdRestrictionController state](self, "state") != a3)
  {
    -[TPSCallingLineIdRestrictionController setState:](self, "setState:", 0);
    v5 = [TPSCallingLineIdRestrictionSetRequest alloc];
    -[TPSCallingLineIdRestrictionController subscriptionContext](self, "subscriptionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TPSCallingLineIdRestrictionSetRequest initWithSubscriptionContext:state:](v5, "initWithSubscriptionContext:state:", v6, a3);

    TPSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Sending caller line ID restriction set request %@.", (uint8_t *)&v10, 0xCu);
    }

    -[TPSCallingLineIdRestrictionController requestController](self, "requestController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addRequest:", v7);

  }
}

- (void)requestController:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  TPSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = (id)objc_opt_class();
    v15 = 2112;
    v16 = v5;
    v7 = v14;
    _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "%@ received response %@.", (uint8_t *)&v13, 0x16u);

  }
  -[TPSCallingLineIdRestrictionController setEditable:](self, "setEditable:", objc_msgSend(v5, "isEditable"));
  -[TPSCallingLineIdRestrictionController setState:](self, "setState:", objc_msgSend(v5, "state"));
  -[TPSCallingLineIdRestrictionController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TPSCallingLineIdRestrictionController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "state");
    objc_msgSend(v5, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callingLineIdController:didChangeState:error:", self, v11, v12);

  }
}

- (TPSCallingLineIdRestrictionControllerDelegate)delegate
{
  return (TPSCallingLineIdRestrictionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TPSCallingLineIdRestrictionRequestController)requestController
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

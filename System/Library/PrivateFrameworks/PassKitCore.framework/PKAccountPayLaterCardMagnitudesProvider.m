@implementation PKAccountPayLaterCardMagnitudesProvider

- (PKAccountPayLaterCardMagnitudesProvider)initWithAccountIdentifier:(id)a3 accountService:(id)a4
{
  id v6;
  id v7;
  PKAccountPayLaterCardMagnitudesProvider *v8;
  uint64_t v9;
  NSString *accountIdentifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountPayLaterCardMagnitudesProvider;
  v8 = -[PKAccountPayLaterCardMagnitudesProvider init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_accountService, a4);
    -[PKAccountService registerObserver:](v8->_accountService, "registerObserver:", v8);
    -[PKAccountPayLaterCardMagnitudesProvider refreshMagnitudes](v8, "refreshMagnitudes");
  }

  return v8;
}

- (void)dealloc
{
  id updateHandler;
  PKAccountService *accountService;
  objc_super v5;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

  accountService = self->_accountService;
  self->_accountService = 0;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountPayLaterCardMagnitudesProvider;
  -[PKAccountPayLaterCardMagnitudesProvider dealloc](&v5, sel_dealloc);
}

- (void)setUpdateHandler:(id)a3
{
  void *v4;
  id updateHandler;
  void (**v6)(id, PKPayLaterCardMagnitudes *);

  v4 = _Block_copy(a3);
  updateHandler = self->_updateHandler;
  self->_updateHandler = v4;

  v6 = (void (**)(id, PKPayLaterCardMagnitudes *))self->_updateHandler;
  if (v6)
    v6[2](v6, self->_magnitudes);
}

- (void)payLaterCardMagnitudesChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PKAccountPayLaterCardMagnitudesProvider_payLaterCardMagnitudesChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __94__PKAccountPayLaterCardMagnitudesProvider_payLaterCardMagnitudesChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  BOOL v4;
  int v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = v2;
  if (v6 == v3)
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_handleMagnitudesUpdate:", *(_QWORD *)(a1 + 48));
    return;
  }
  if (v6)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {

    return;
  }
  v5 = objc_msgSend(v6, "isEqualToString:", v3);

  if (v5)
    goto LABEL_10;
}

- (void)refreshMagnitudes
{
  NSString *accountIdentifier;
  PKAccountService *accountService;
  _QWORD v4[5];

  accountIdentifier = self->_accountIdentifier;
  accountService = self->_accountService;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PKAccountPayLaterCardMagnitudesProvider_refreshMagnitudes__block_invoke;
  v4[3] = &unk_1E2AD40A8;
  v4[4] = self;
  -[PKAccountService payLaterCardMagnitudesForAccountIdentifier:completion:](accountService, "payLaterCardMagnitudesForAccountIdentifier:completion:", accountIdentifier, v4);
}

void __60__PKAccountPayLaterCardMagnitudesProvider_refreshMagnitudes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PKAccountPayLaterCardMagnitudesProvider_refreshMagnitudes__block_invoke_2;
  v5[3] = &unk_1E2ABE0D0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __60__PKAccountPayLaterCardMagnitudesProvider_refreshMagnitudes__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMagnitudesUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)_handleMagnitudesUpdate:(id)a3
{
  PKPayLaterCardMagnitudes *v4;
  PKPayLaterCardMagnitudes *magnitudes;
  char v6;
  PKPayLaterCardMagnitudes *v7;
  PKPayLaterCardMagnitudes *v8;
  void (**updateHandler)(id, PKPayLaterCardMagnitudes *);
  PKPayLaterCardMagnitudes *v10;

  v4 = (PKPayLaterCardMagnitudes *)a3;
  magnitudes = self->_magnitudes;
  v10 = v4;
  if (v4 && magnitudes)
  {
    v6 = -[PKPayLaterCardMagnitudes isEqual:](magnitudes, "isEqual:", v4);
    v4 = v10;
    if ((v6 & 1) != 0)
      goto LABEL_8;
  }
  else if (magnitudes == v4)
  {
    goto LABEL_8;
  }
  v7 = (PKPayLaterCardMagnitudes *)-[PKPayLaterCardMagnitudes copy](v4, "copy");
  v8 = self->_magnitudes;
  self->_magnitudes = v7;

  v4 = v10;
  updateHandler = (void (**)(id, PKPayLaterCardMagnitudes *))self->_updateHandler;
  if (updateHandler)
  {
    updateHandler[2](updateHandler, self->_magnitudes);
    v4 = v10;
  }
LABEL_8:

}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_magnitudes, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end

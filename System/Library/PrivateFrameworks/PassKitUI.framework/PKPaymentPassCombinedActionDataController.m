@implementation PKPaymentPassCombinedActionDataController

- (PKPaymentPassCombinedActionDataController)initWithPass:(id)a3 actionGroups:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6 balanceModel:(id)a7 mode:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PKPaymentPassCombinedActionDataController *v18;
  PKPaymentPassCombinedActionDataController *v19;
  void *v20;
  uint64_t v21;
  NSArray *actions;
  id v25;
  objc_super v26;

  v25 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentPassCombinedActionDataController;
  v18 = -[PKPaymentPassCombinedActionDataController init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a3);
    objc_storeStrong((id *)&v19->_actionGroups, a4);
    objc_storeStrong((id *)&v19->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v19->_webService, a6);
    objc_storeStrong((id *)&v19->_transitBalanceModel, a7);
    v19->_mode = a8;
    objc_msgSend(v17, "displayableCommutePlanActions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pk_objectsPassingTest:", &__block_literal_global_101);
    v21 = objc_claimAutoreleasedReturnValue();
    actions = v19->_actions;
    v19->_actions = (NSArray *)v21;

  }
  return v19;
}

uint64_t __120__PKPaymentPassCombinedActionDataController_initWithPass_actionGroups_paymentDataProvider_webService_balanceModel_mode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 2)
    v3 = objc_msgSend(v2, "isActionAvailable");
  else
    v3 = 0;

  return v3;
}

- (void)fetchViewController:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  unint64_t mode;
  void *v7;
  PKRemoteActionGroupViewController *v8;
  PKRemoteActionGroupViewController *agController;
  PKRemoteActionGroupViewController *v10;
  PKPaymentPassActionDataController *v11;
  PKPaymentPassActionDataController *actionController;
  PKPaymentPassActionDataController *v13;
  void (*v14)(void);
  PKCombinedActionViewController *v15;
  PKCombinedActionViewController *combinedController;
  _QWORD *v17;
  _QWORD v18[4];
  _QWORD *v19;

  v17 = a3;
  v4 = -[NSArray count](self->_actionGroups, "count");
  v5 = -[NSArray count](self->_actions, "count");
  mode = self->_mode;
  if (mode == 1)
  {
    if (v5)
    {
      v11 = -[PKPaymentPassActionDataController initWithPass:actions:paymentDataProvider:webService:actionType:balanceModel:]([PKPaymentPassActionDataController alloc], "initWithPass:actions:paymentDataProvider:webService:actionType:balanceModel:", self->_pass, self->_actions, self->_paymentDataProvider, self->_webService, 2, self->_transitBalanceModel);
      actionController = self->_actionController;
      self->_actionController = v11;

      v13 = self->_actionController;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __65__PKPaymentPassCombinedActionDataController_fetchViewController___block_invoke;
      v18[3] = &unk_1E3E6C290;
      v19 = v17;
      -[PKPaymentPassActionDataController fetchViewController:](v13, "fetchViewController:", v18);

      goto LABEL_14;
    }
LABEL_9:
    v14 = (void (*)(void))v17[2];
LABEL_11:
    v14();
    goto LABEL_14;
  }
  if (mode)
    goto LABEL_14;
  if (!v4)
    goto LABEL_9;
  if (v4 != 1)
  {
    v15 = -[PKCombinedActionViewController initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:]([PKCombinedActionViewController alloc], "initWithPass:actionGroups:paymentDataProvider:webService:balanceModel:mode:", self->_pass, self->_actionGroups, self->_paymentDataProvider, self->_webService, self->_transitBalanceModel, self->_mode);
    combinedController = self->_combinedController;
    self->_combinedController = v15;

    -[PKCombinedActionViewController setDelegate:](self->_combinedController, "setDelegate:", self);
    v14 = (void (*)(void))v17[2];
    goto LABEL_11;
  }
  -[NSArray firstObject](self->_actionGroups, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[PKRemoteActionGroupViewController initWithPass:actionGroup:paymentDataProvider:webService:]([PKRemoteActionGroupViewController alloc], "initWithPass:actionGroup:paymentDataProvider:webService:", self->_pass, v7, self->_paymentDataProvider, self->_webService);
    agController = self->_agController;
    self->_agController = v8;

    -[PKRemoteActionGroupViewController setDelegate:](self->_agController, "setDelegate:", self);
    v10 = self->_agController;
  }
  else
  {
    v10 = 0;
  }
  ((void (*)(_QWORD *, PKRemoteActionGroupViewController *, _QWORD))v17[2])(v17, v10, 0);

LABEL_14:
}

void __65__PKPaymentPassCombinedActionDataController_fetchViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_5:
    v6();
    goto LABEL_6;
  }
  if (v7)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)combinedActionViewControllerDidCancel:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)combinedActionViewControllerDidFinish:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)remoteGroupActionsViewControllerDidCancel:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)remoteGroupActionsViewControllerDidPerformFetchActionGroup:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)remoteGroupActionsViewControllerDidPerformPayment:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_combinedController, 0);
  objc_storeStrong((id *)&self->_agController, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end

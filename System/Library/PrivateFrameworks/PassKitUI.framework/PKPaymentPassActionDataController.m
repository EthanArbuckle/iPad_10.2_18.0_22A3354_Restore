@implementation PKPaymentPassActionDataController

- (PKPaymentPassActionDataController)initWithPass:(id)a3 actions:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6 actionType:(unint64_t)a7 balanceModel:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PKPaymentPassActionDataController *v18;
  PKPaymentPassActionDataController *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentPassActionDataController;
  v18 = -[PKPaymentPassActionDataController init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a3);
    objc_storeStrong((id *)&v19->_actions, a4);
    objc_storeStrong((id *)&v19->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v19->_webService, a6);
    v19->_actionType = a7;
    objc_storeStrong((id *)&v19->_balanceModel, a8);
  }

  return v19;
}

- (void)fetchViewController:(id)a3
{
  void (**v4)(id, PKPerformActionViewController *, void *);
  NSArray *actions;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  PKPerformActionViewController *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];

  v4 = (void (**)(id, PKPerformActionViewController *, void *))a3;
  actions = self->_actions;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__PKPaymentPassActionDataController_fetchViewController___block_invoke;
  v18[3] = &unk_1E3E75708;
  v18[4] = self;
  -[NSArray pk_objectsPassingTest:](actions, "pk_objectsPassingTest:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v12 = 0;
    v13 = 0;
LABEL_12:
    v4[2](v4, v13, v12);

    goto LABEL_13;
  }
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    if (v8 == 1)
    {
      objc_msgSend(v7, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = 0;
      v10 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](self->_pass, "canPerformAction:unableReason:displayableError:", v9, &v17, &v16);
      v11 = v16;
      if ((v10 & 1) != 0 || v17 == 2)
      {
        v13 = -[PKPerformActionViewController initWithPass:action:paymentDataProvider:]([PKPerformActionViewController alloc], "initWithPass:action:paymentDataProvider:", self->_pass, v9, self->_paymentDataProvider);
        -[PKPerformActionViewController setDelegate:](v13, "setDelegate:", self);
        -[PKPerformActionViewController setWebService:](v13, "setWebService:", self->_webService);
        v12 = 0;
      }
      else
      {
        +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v17, v9, v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
      }

    }
    else
    {
      -[PKTransitBalanceModel filteredActionsForDisplayableEntities](self->_balanceModel, "filteredActionsForDisplayableEntities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransitBalanceModel balancesAndCountPlansByID](self->_balanceModel, "balancesAndCountPlansByID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PKSelectActionViewController initWithPass:actions:actionType:paymentDataProvider:webService:balanceDictionary:]([PKSelectActionViewController alloc], "initWithPass:actions:actionType:paymentDataProvider:webService:balanceDictionary:", self->_pass, v14, self->_actionType, self->_paymentDataProvider, self->_webService, v15);
      -[PKPerformActionViewController setDelegate:](v13, "setDelegate:", self);

      v12 = 0;
    }
    goto LABEL_12;
  }
  v4[2](v4, 0, 0);
LABEL_13:

}

uint64_t __57__PKPaymentPassActionDataController_fetchViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "type");
  if (v4 == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    if ((unint64_t)(v4 - 1) > 1)
      v5 = 1;
    else
      v5 = objc_msgSend(v3, "isActionAvailable");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)selectActionViewControllerDidCancel:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
}

- (void)selectActionViewControllerDidPerformAction:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balanceModel, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end

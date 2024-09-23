@implementation PKPaymentPassActionGroupDataController

- (PKPaymentPassActionGroupDataController)initWithPass:(id)a3 actionGroups:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPaymentPassActionGroupDataController *v15;
  PKPaymentPassActionGroupDataController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentPassActionGroupDataController;
  v15 = -[PKPaymentPassActionGroupDataController init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pass, a3);
    objc_storeStrong((id *)&v16->_actionGroups, a4);
    objc_storeStrong((id *)&v16->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v16->_webService, a6);
  }

  return v16;
}

- (UIViewController)viewController
{
  NSUInteger v3;
  void *v4;
  PKRemoteActionGroupViewController *v5;

  v3 = -[NSArray count](self->_actionGroups, "count");
  if (v3)
  {
    if (v3 == 1)
    {
      -[NSArray firstObject](self->_actionGroups, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PKRemoteActionGroupViewController initWithPass:actionGroup:paymentDataProvider:webService:]([PKRemoteActionGroupViewController alloc], "initWithPass:actionGroup:paymentDataProvider:webService:", self->_pass, v4, self->_paymentDataProvider, self->_webService);
      -[PKRemoteActionGroupViewController setDelegate:](v5, "setDelegate:", self);

    }
    else
    {
      v5 = -[PKSelectActionGroupViewController initWithPass:actionGroups:paymentDataProvider:webService:]([PKSelectActionGroupViewController alloc], "initWithPass:actionGroups:paymentDataProvider:webService:", self->_pass, self->_actionGroups, self->_paymentDataProvider, self->_webService);
      -[PKRemoteActionGroupViewController setDelegate:](v5, "setDelegate:", self);
    }
  }
  else
  {
    v5 = 0;
  }
  return (UIViewController *)v5;
}

- (void)remoteGroupActionsViewControllerDidCancel:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 0);
}

- (void)remoteGroupActionsViewControllerDidPerformFetchActionGroup:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 0);
}

- (void)remoteGroupActionsViewControllerDidPerformPayment:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 0);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)selectActionGroupViewControllerDidCancel:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 0);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void)selectActionGroupViewControllerDidPerformFetchActionGroup:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 0);

  objc_msgSend(v5, "setDelegate:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end

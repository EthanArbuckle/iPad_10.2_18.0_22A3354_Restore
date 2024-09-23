@implementation SUPaymentSetupViewController

- (SUPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3
{
  id v5;
  SUPaymentSetupViewController *v6;
  SUPaymentSetupViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUPaymentSetupViewController;
  v6 = -[SUPaymentSetupViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentSetupRequest, a3);
    -[SUPaymentSetupViewController _setup](v7, "_setup");
  }

  return v7;
}

- (void)_setup
{
  id v3;
  PKPaymentSetupViewController *v4;
  PKPaymentSetupViewController *childViewController;
  id v6;

  -[SUPaymentSetupViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 5);
  v3 = objc_alloc((Class)ISWeakLinkedClassForString());
  -[SUPaymentSetupViewController paymentSetupRequest](self, "paymentSetupRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (PKPaymentSetupViewController *)objc_msgSend(v3, "initWithPaymentSetupRequest:", v6);
  childViewController = self->_childViewController;
  self->_childViewController = v4;

}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  -[SUPaymentSetupViewController setView:](self, "setView:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUPaymentSetupViewController;
  -[SUPaymentSetupViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[SUPaymentSetupViewController childViewController](self, "childViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUPaymentSetupViewController childViewController](self, "childViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUPaymentSetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  -[SUPaymentSetupViewController setChildViewController:](self, "setChildViewController:", 0);
  v9[1] = 3221225472;
  v9[2] = __73__SUPaymentSetupViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_24DE7B280;
  v9[4] = self;
  v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)SUPaymentSetupViewController;
  v9[0] = MEMORY[0x24BDAC760];
  v7 = v6;
  -[SUPaymentSetupViewController dismissViewControllerAnimated:completion:](&v8, sel_dismissViewControllerAnimated_completion_, v4, v9);

}

uint64_t __73__SUPaymentSetupViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentSetupViewControllerDidDismiss");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (SUPaymentSetupViewControllerDelegate)delegate
{
  return (SUPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentSetupRequest)paymentSetupRequest
{
  return self->_paymentSetupRequest;
}

- (PKPaymentSetupViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_paymentSetupRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

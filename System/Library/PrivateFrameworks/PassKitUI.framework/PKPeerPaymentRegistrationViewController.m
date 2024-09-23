@implementation PKPeerPaymentRegistrationViewController

- (PKPeerPaymentRegistrationViewController)initWithUserInfo:(id)a3
{
  id v5;
  PKPeerPaymentRegistrationViewController *v6;
  PKPeerPaymentRegistrationViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRegistrationViewController;
  v6 = -[PKPeerPaymentRegistrationViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userInfo, a3);

  return v7;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPeerPaymentRegistrationViewController;
  -[PKPeerPaymentRegistrationViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRegistrationViewController;
  -[PKPeerPaymentRegistrationViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPeerPaymentRegistrationViewController _dismiss](self, "_dismiss");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)startRegistrationFlowWithCompletion:(id)a3
{
  id v4;
  PKPeerPaymentRegistrationFlowController *v5;
  PKPeerPaymentRegistrationFlowController *flowController;
  PKPeerPaymentRegistrationFlowController *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = -[PKPeerPaymentRegistrationFlowController initWithUserInfo:setupDelegate:]([PKPeerPaymentRegistrationFlowController alloc], "initWithUserInfo:setupDelegate:", self->_userInfo, self);
  flowController = self->_flowController;
  self->_flowController = v5;

  objc_initWeak(&location, self);
  v7 = self->_flowController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke;
  v9[3] = &unk_1E3E6AC78;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  -[PKPeerPaymentRegistrationFlowController preflightWithCompletion:](v7, "preflightWithCompletion:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (v3 = *(_QWORD *)(a1 + 32)) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke_3;
    v5[3] = &unk_1E3E61590;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, v5);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

uint64_t __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  id dismissHandler;

  if (!self->_dismissed)
  {
    v4 = _Block_copy(a3);
    dismissHandler = self->_dismissHandler;
    self->_dismissHandler = v4;

  }
}

- (void)_dismiss
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_dismissed)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __51__PKPeerPaymentRegistrationViewController__dismiss__block_invoke;
    v3[3] = &unk_1E3E61310;
    objc_copyWeak(&v4, &location);
    -[PKPeerPaymentRegistrationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
    self->_dismissed = 1;
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __51__PKPeerPaymentRegistrationViewController__dismiss__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[123];
    if (v3)
    {
      v5 = v2;
      (*(void (**)(void))(v3 + 16))();
      v4 = (void *)v5[123];
      v5[123] = 0;

      v2 = v5;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
}

@end

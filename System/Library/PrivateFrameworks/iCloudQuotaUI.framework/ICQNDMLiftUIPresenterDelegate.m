@implementation ICQNDMLiftUIPresenterDelegate

- (ICQNDMLiftUIPresenterDelegate)initWithPresentingViewController:(id)a3
{
  id v4;
  ICQNDMLiftUIPresenterDelegate *v5;

  v4 = a3;
  v5 = -[ICQNDMLiftUIPresenterDelegate init](self, "init");
  -[ICQNDMLiftUIPresenterDelegate setPresentingViewController:](v5, "setPresentingViewController:", v4);

  return v5;
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  id v3;

  -[ICQNDMLiftUIPresenterDelegate presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)liftUIPresenterDidComplete:(id)a3
{
  id v3;

  -[ICQNDMLiftUIPresenterDelegate presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v5 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICQNDMLiftUIPresenterDelegate liftUIPresenter:didLoadWithSuccess:error:].cold.1((uint64_t)v7, v9);

    -[ICQNDMLiftUIPresenterDelegate presentingViewController](self, "presentingViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject dismissViewControllerAnimated:completion:](v9, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v5)
      v10 = CFSTR("YES");
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Loaded NDM LiftUI with success %@", (uint8_t *)&v11, 0xCu);
  }

}

- (void)liftUIPresenter:(id)a3 performAction:(int64_t)a4 parameters:(id)a5 completion:(id)a6
{
  void *v9;
  void (**v10)(id, uint64_t, _QWORD);

  v10 = (void (**)(id, uint64_t, _QWORD))a6;
  if (a4 == 101)
  {
    -[ICQNDMLiftUIPresenterDelegate presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else
  {
    v10[2](v10, objc_msgSend(MEMORY[0x24BEC72E0], "performAction:parameters:options:", a4, a5, 0), 0);
  }

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

- (void)liftUIPresenter:(uint64_t)a1 didLoadWithSuccess:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Could not load NDM LiftUI with error %@", (uint8_t *)&v2, 0xCu);
}

@end

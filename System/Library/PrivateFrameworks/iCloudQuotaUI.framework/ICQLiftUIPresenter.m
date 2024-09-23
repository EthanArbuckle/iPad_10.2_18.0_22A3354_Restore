@implementation ICQLiftUIPresenter

- (ICQLiftUIPresenter)initWithURL:(id)a3 content:(id)a4 account:(id)a5 data:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICQLiftUIPresenter *v15;
  ICQLiftUIPresenter *v16;
  void *v17;
  ICQLiftUIController *v18;
  ICQLiftUIController *controller;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ICQLiftUIPresenter;
  v15 = -[ICQLiftUIPresenter init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_liftUIPageURL, a3);
    objc_storeStrong((id *)&v16->_content, a4);
    objc_storeStrong((id *)&v16->_data, a6);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "aa_primaryAppleAccount");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)&v16->_account, v13);
    v18 = objc_alloc_init(ICQLiftUIController);
    controller = v16->_controller;
    v16->_controller = v18;

  }
  return v16;
}

- (ICQLiftUIPresenter)initWithContent:(id)a3 account:(id)a4 data:(id)a5
{
  return -[ICQLiftUIPresenter initWithURL:content:account:data:](self, "initWithURL:content:account:data:", 0, a3, a4, a5);
}

- (ICQLiftUIPresenter)initWithURL:(id)a3 account:(id)a4 data:(id)a5
{
  return -[ICQLiftUIPresenter initWithURL:content:account:data:](self, "initWithURL:content:account:data:", a3, 0, a4, a5);
}

- (BOOL)presentInViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_4:
    -[ICQLiftUIPresenter content](self, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v23 = 138412290;
        v24 = v6;
        _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Presenting LiftUI page with preloaded data in viewcontroller %@", (uint8_t *)&v23, 0xCu);
      }

      v12 = (void *)MEMORY[0x24BEBDB08];
      -[ICQLiftUIPresenter controller](self, "controller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter content](self, "content");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter account](self, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter data](self, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "makeLiftUIViewControllerForController:withContent:account:presenter:data:", v13, v14, v15, self, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
      {
        -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v18;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Presenting LiftUI page at URL %@ in viewcontroller %@", (uint8_t *)&v23, 0x16u);

      }
      v19 = (void *)MEMORY[0x24BEBDB08];
      -[ICQLiftUIPresenter controller](self, "controller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter account](self, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter data](self, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "makeLiftUIViewControllerForController:withURL:account:presenter:data:", v13, v14, v15, self, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v20 = v17;

    objc_msgSend(MEMORY[0x24BEBDB08], "ICQUIUpsellPrefferredPresentationSize");
    -[NSObject setPreferredContentSize:](v20, "setPreferredContentSize:");
    objc_msgSend(v6, "presentPreferredSizeWithViewController:animated:completion:", v20, v4, 0);
    v21 = 1;
    goto LABEL_12;
  }
  -[ICQLiftUIPresenter content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  _ICQGetLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[ICQLiftUIPresenter presentInViewController:animated:].cold.1();
  v21 = 0;
LABEL_12:

  return v21;
}

- (BOOL)embedInViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    -[ICQLiftUIPresenter content](self, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v21 = 138412290;
        v22 = v4;
        _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Embedding LiftUI page with preloaded data in viewcontroller %@", (uint8_t *)&v21, 0xCu);
      }

      v10 = (void *)MEMORY[0x24BEBDB08];
      -[ICQLiftUIPresenter controller](self, "controller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter content](self, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter account](self, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter data](self, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "makeLiftUIViewControllerForController:withContent:account:presenter:data:", v11, v12, v13, self, v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9)
      {
        -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v16;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Embedding LiftUI page at URL %@ in viewcontroller %@", (uint8_t *)&v21, 0x16u);

      }
      v17 = (void *)MEMORY[0x24BEBDB08];
      -[ICQLiftUIPresenter controller](self, "controller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter account](self, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter data](self, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "makeLiftUIViewControllerForController:withURL:account:presenter:data:", v11, v12, v13, self, v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v18 = v15;

    objc_msgSend(v4, "addChildAndPinToEdgesWithChildViewController:", v18);
    v19 = 1;
    goto LABEL_12;
  }
  -[ICQLiftUIPresenter content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  _ICQGetLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[ICQLiftUIPresenter presentInViewController:animated:].cold.1();
  v19 = 0;
LABEL_12:

  return v19;
}

- (BOOL)pushInNavigationController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_4:
    -[ICQLiftUIPresenter content](self, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v23 = 138412290;
        v24 = v6;
        _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Presenting LiftUI page with preloaded data in navigationController %@", (uint8_t *)&v23, 0xCu);
      }

      v12 = (void *)MEMORY[0x24BEBDB08];
      -[ICQLiftUIPresenter controller](self, "controller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter content](self, "content");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter account](self, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter data](self, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "makeLiftUIViewControllerForController:withContent:account:presenter:data:", v13, v14, v15, self, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
      {
        -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v18;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Presenting LiftUI page at URL %@ in navigationController %@", (uint8_t *)&v23, 0x16u);

      }
      v19 = (void *)MEMORY[0x24BEBDB08];
      -[ICQLiftUIPresenter controller](self, "controller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter liftUIPageURL](self, "liftUIPageURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter account](self, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLiftUIPresenter data](self, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "makeLiftUIViewControllerForController:withURL:account:presenter:data:", v13, v14, v15, self, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v20 = v17;

    objc_msgSend(v6, "pushViewController:animated:", v20, v4);
    v21 = 1;
    goto LABEL_12;
  }
  -[ICQLiftUIPresenter content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  _ICQGetLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[ICQLiftUIPresenter presentInViewController:animated:].cold.1();
  v21 = 0;
LABEL_12:

  return v21;
}

- (void)updateStoreDataForKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICQLiftUIPresenter controller](self, "controller");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateStoreDataForKey:value:", v7, v6);

}

- (void)reloadWithHeaders:(id)a3
{
  NSObject *v3;

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[ICQLiftUIPresenter reloadWithHeaders:].cold.1();

}

- (void)didLoadWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD block[5];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "LiftUI load completed success: %@ error: %@", buf, 0x16u);

  }
  -[ICQLiftUIPresenter delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__ICQLiftUIPresenter_didLoadWithSuccess_error___block_invoke;
    block[3] = &unk_24E3F35C0;
    block[4] = self;
    v14 = v4;
    v13 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __47__ICQLiftUIPresenter_didLoadWithSuccess_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liftUIPresenter:didLoadWithSuccess:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)didFinish
{
  -[ICQLiftUIPresenter didFinishWithUserInfo:](self, "didFinishWithUserInfo:", 0);
}

- (void)didCancel
{
  -[ICQLiftUIPresenter didCancelWithUserInfo:](self, "didCancelWithUserInfo:", 0);
}

- (void)didFinishWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "LiftUI flow completed with parameters %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__ICQLiftUIPresenter_didFinishWithUserInfo___block_invoke;
  v7[3] = &unk_24E3F34D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __44__ICQLiftUIPresenter_didFinishWithUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "liftUIPresenterDidComplete:userInfo:", v5, *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v4, "liftUIPresenterDidComplete:", v5);

}

- (void)didCancelWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "LiftUI flow has been dismissed with parameters %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__ICQLiftUIPresenter_didCancelWithUserInfo___block_invoke;
  v7[3] = &unk_24E3F34D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __44__ICQLiftUIPresenter_didCancelWithUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v4;
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "liftUIPresenterDidCancel:userInfo:", v5, *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v4, "liftUIPresenterDidCancel:", v5);

}

- (void)performICQActionWithName:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v7 = a4;
  v8 = a5;
  v9 = _ICQActionForServerActionString();
  -[ICQLiftUIPresenter delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__ICQLiftUIPresenter_performICQActionWithName_parameters_completion___block_invoke;
    v12[3] = &unk_24E3F4710;
    v12[4] = self;
    v15 = v9;
    v13 = v7;
    v14 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC72E0], "performAction:parameters:options:", v9, v7, 0);
    if (v8)
      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
  }

}

void __69__ICQLiftUIPresenter_performICQActionWithName_parameters_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liftUIPresenter:performAction:parameters:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NSURL)liftUIPageURL
{
  return self->_liftUIPageURL;
}

- (void)setLiftUIPageURL:(id)a3
{
  objc_storeStrong((id *)&self->_liftUIPageURL, a3);
}

- (ICQLiftUIPresenterDelegate)delegate
{
  return (ICQLiftUIPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ICQLiftUIController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_liftUIPageURL, 0);
}

- (void)presentInViewController:animated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Unable to create LiftUI VIewController -- URL and content are both nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reloadWithHeaders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "LiftUI reload is not yet supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

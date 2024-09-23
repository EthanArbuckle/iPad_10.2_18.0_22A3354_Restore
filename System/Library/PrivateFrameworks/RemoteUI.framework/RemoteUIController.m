@implementation RemoteUIController

- (RemoteUIController)init
{
  RemoteUIController *v2;
  NSMutableArray *v3;
  NSMutableArray *objectModels;
  NSMutableArray *v5;
  NSMutableArray *modalObjectModels;
  uint64_t v7;
  NSUUID *UUID;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)RemoteUIController;
  v2 = -[RemoteUIController init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objectModels = v2->_objectModels;
    v2->_objectModels = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    modalObjectModels = v2->_modalObjectModels;
    v2->_modalObjectModels = v5;

    objc_msgSend(MEMORY[0x24BEBD788], "_setUseCustomBackButtonAction:", 1);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v7;

    if (_isInternalInstall())
    {
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[RemoteUIController UUID](v2, "UUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v15 = v10;
          v16 = 2112;
          v17 = v11;
          _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "RemoteUIController init %@\n%@", buf, 0x16u);

        }
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (_isInternalInstall() && _isInternalInstall())
  {
    _RUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[RemoteUIController UUID](self, "UUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_209E87000, v3, OS_LOG_TYPE_DEFAULT, "RemoteUIController dealloc %@\n%@", buf, 0x16u);

    }
  }
  -[RemoteUIController _stopListeningForSMSAutoFill](self, "_stopListeningForSMSAutoFill");
  -[RUILoader cancel](self->_loader, "cancel");
  -[RUIHTTPRequest setDelegate:](self->_loader, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)RemoteUIController;
  -[RemoteUIController dealloc](&v6, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  RemoteUIControllerDelegate **p_delegate;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[RemoteUIController UUID](self, "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_loadWeakRetained((id *)p_delegate);
        v11 = 138412546;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_209E87000, v7, OS_LOG_TYPE_DEFAULT, "RUIController %@ got delegate %@", (uint8_t *)&v11, 0x16u);

      }
    }
  }

}

- (UIViewController)currentPresentationContext
{
  RUINavigationController *modalNavigationController;
  RUINavigationController *v4;

  modalNavigationController = self->_modalNavigationController;
  if (modalNavigationController && !-[RUINavigationController isDismissing](modalNavigationController, "isDismissing"))
  {
    v4 = self->_modalNavigationController;
  }
  else
  {
    -[RemoteUIController hostViewController](self, "hostViewController");
    v4 = (RUINavigationController *)objc_claimAutoreleasedReturnValue();
  }
  return (UIViewController *)v4;
}

- (void)_enableTestMode
{
  self->_testMode = 1;
}

- (BOOL)_shouldAnimate
{
  return !self->_testMode;
}

- (void)setStyle:(id)a3
{
  RUIStyle *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (RUIStyle *)a3;
  if (self->_style != v5)
  {
    objc_storeStrong((id *)&self->_style, a3);
    -[RUILoader setStyle:](self->_loader, "setStyle:", v5);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_objectModels;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setStyle:", v5);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_modalObjectModels;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "setStyle:", v5, (_QWORD)v16);
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
}

- (void)modalNavigationWasDismissed
{
  UIActivityIndicatorView *spinner;

  spinner = self->_spinner;
  if (spinner)
    -[UIActivityIndicatorView stopAnimating](spinner, "stopAnimating");
  -[RemoteUIController _modalNavigationWasDismissed](self, "_modalNavigationWasDismissed");
}

- (void)handleCancel:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[RemoteUIController hostViewController](self, "hostViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__RemoteUIController_handleCancel___block_invoke;
  v5[3] = &unk_24C2973F0;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

uint64_t __35__RemoteUIController_handleCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modalNavigationWasDismissed");
}

- (void)presentLoadingSheet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIActivityIndicatorView *v38;
  UIActivityIndicatorView *spinner;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;

  v71 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_handleCancel_);
  objc_msgSend(v4, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = objc_alloc(MEMORY[0x24BEBDB00]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v71, "navBarImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v9);
    objc_msgSend(v8, "addSubview:", v10);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    objc_msgSend(v10, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    objc_msgSend(v10, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    objc_msgSend(v10, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 20.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    objc_msgSend(v10, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 20.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    v24 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v71, "navBarImageLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v25);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 18.0, *MEMORY[0x24BEBB610]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v26);

    objc_msgSend(v8, "addSubview:", v24);
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v24, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    objc_msgSend(v24, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    objc_msgSend(v24, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 10.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v8);
    objc_msgSend(v4, "navigationItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setLeftBarButtonItem:", v36);

  }
  v38 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v38;

  objc_msgSend(v4, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addSubview:", self->_spinner);

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "centerXAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  objc_msgSend(v71, "spinnerLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    v50 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v71, "spinnerLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setText:", v51);

    objc_msgSend(v50, "setTextAlignment:", 1);
    -[RemoteUIController style](self, "style");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "spinnerLabelFont");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFont:", v53);

    -[RemoteUIController style](self, "style");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "spinnerLabelColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTextColor:", v55);

    objc_msgSend(v4, "view");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v50);

    objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v50, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setActive:", 1);

    objc_msgSend(v50, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

    objc_msgSend(v50, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView bottomAnchor](self->_spinner, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, 10.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setActive:", 1);

  }
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  objc_msgSend(v4, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemoteUIController style](self, "style");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "backgroundColor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setBackgroundColor:", v70);

  -[RemoteUIController _showPartialScreenModal:](self, "_showPartialScreenModal:", v4);
}

- (void)_showPartialScreenModal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  RUINavigationController *obj;

  v4 = a3;
  obj = -[RUINavigationController initWithRootViewController:]([RUINavigationController alloc], "initWithRootViewController:", v4);

  -[RemoteUIController hostViewController](self, "hostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUINavigationController setHostViewController:](obj, "setHostViewController:", v5);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "userInterfaceIdiom") != 1;

  -[RUINavigationController setRuiModalPresentationStyle:](obj, "setRuiModalPresentationStyle:", 2 * v4);
  -[RUINavigationController setModalPresentationStyle:](obj, "setModalPresentationStyle:", 4);
  -[RUINavigationController setTransitioningDelegate:](obj, "setTransitioningDelegate:", self);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (!v8)
    -[RUINavigationController setSupportedInterfaceOrientations:](obj, "setSupportedInterfaceOrientations:", 2);
  objc_storeStrong((id *)&self->_modalNavigationController, obj);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == 1)
    -[RUINavigationController setModalInPresentation:](self->_modalNavigationController, "setModalInPresentation:", 1);
  -[RemoteUIController hostViewController](self, "hostViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", obj, 1, 0);

}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[RemoteUIController setLoadCompletion:](self, "setLoadCompletion:", a4);
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  -[RemoteUIController loadRequest:](self, "loadRequest:", v7);
}

- (void)_loadURL:(id)a3 postBody:(id)a4 fromObjectModel:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[RemoteUIController setLoadCompletion:](self, "setLoadCompletion:", a6);
  -[RemoteUIController _loadURL:fromObjectModel:postBody:](self, "_loadURL:fromObjectModel:postBody:", v12, v10, v11);

}

- (void)loadURL:(id)a3 postBody:(id)a4 completion:(id)a5
{
  -[RemoteUIController _loadURL:postBody:fromObjectModel:completion:](self, "_loadURL:postBody:fromObjectModel:completion:", a3, a4, 0, a5);
}

- (void)loadRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", self->_userAgentString, CFSTR("User-Agent"));
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_hostViewController);
    objc_msgSend(v8, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");

    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_209E87000, v11, OS_LOG_TYPE_DEFAULT, "Setting interface style based on _hostViewController %@", (uint8_t *)&v15, 0xCu);

      }
    }
    -[RemoteUIController loader](self, "loader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserInterfaceStyle:", v10);

  }
  -[RemoteUIController loader](self, "loader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loadXMLUIWithRequest:", v4);

}

- (void)_loadURL:(id)a3 fromObjectModel:(id)a4 postBody:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    goto LABEL_7;
  -[RemoteUIController loader](self, "loader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v8;
        _os_log_impl(&dword_209E87000, v16, OS_LOG_TYPE_DEFAULT, "Already loading %@", (uint8_t *)&v20, 0xCu);
      }

    }
  }
  else
  {
LABEL_7:
    -[RemoteUIController loader](self, "loader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancel");

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:cachePolicy:timeoutInterval:", v8, 1, 30.0);
    v19 = v18;
    if (v10)
    {
      objc_msgSend(v18, "setHTTPBody:", v10);
      objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
    }
    objc_msgSend(v9, "_populateRequest:", v19);
    -[RemoteUIController loadRequest:](self, "loadRequest:", v19);

  }
}

- (void)loadURL:(id)a3 postBody:(id)a4
{
  -[RemoteUIController _loadURL:fromObjectModel:postBody:](self, "_loadURL:fromObjectModel:postBody:", a3, 0, a4);
}

- (void)loadData:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_6;
  -[RemoteUIController loader](self, "loader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (!v12)
  {
LABEL_6:
    -[RemoteUIController loader](self, "loader");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancel");

    -[RemoteUIController loader](self, "loader");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject loadXMLUIWithData:baseURL:](v13, "loadXMLUIWithData:baseURL:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_209E87000, v13, OS_LOG_TYPE_DEFAULT, "Already loading %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_willPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (self->_SMSAutoFillToken)
    -[RemoteUIController _objectModel:receivedToken:](self, "_objectModel:receivedToken:", v9);
  -[RemoteUIController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[RemoteUIController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteUIController:willPresentObjectModel:modally:", self, v9, v4);

  }
}

- (void)_didPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[RemoteUIController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[RemoteUIController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteUIController:didPresentObjectModel:modally:", self, v9, v4);

  }
}

- (void)_didRemoveObjectModel:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[RemoteUIController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[RemoteUIController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteUIController:didRemoveObjectModel:", self, v7);

  }
}

- (id)_objectModels
{
  return self->_objectModels;
}

- (id)_modalObjectModels
{
  return self->_modalObjectModels;
}

- (void)_removePreviousObjectModelsBackToIdentifier:(id)a3
{
  uint64_t v5;
  id v6;
  RUINavigationController *modalNavigationController;
  RUINavigationController *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  NSObject *p_super;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v5 = 24;
  if (!self->_modalNavigationController)
    v5 = 16;
  v6 = *(id *)((char *)&self->super.isa + v5);
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    modalNavigationController = self->_modalNavigationController;
    if (modalNavigationController)
    {
      v8 = modalNavigationController;
    }
    else
    {
      -[RemoteUIController navigationController](self, "navigationController");
      v8 = (RUINavigationController *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RemoteUIController.m"), 341, CFSTR("%s: no navigation controller to remove from"), "-[RemoteUIController _removePreviousObjectModelsBackToIdentifier:]");

        v8 = 0;
      }
    }
    p_super = &v8->super.super.super.super;
    v10 = (void *)objc_opt_new();
    v11 = objc_msgSend(v6, "count");
    if (v11 - 2 < 0)
    {
      v12 = 0;
    }
    else
    {
      v12 = 0;
      v13 = v11 - 1;
      while (1)
      {
        v14 = v12;
        objc_msgSend(v6, "objectAtIndexedSubscript:", --v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __66__RemoteUIController__removePreviousObjectModelsBackToIdentifier___block_invoke;
        v33[3] = &unk_24C297EA0;
        v34 = v15;
        v16 = v15;
        objc_msgSend(v12, "aaf_filter:", v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v10;
        objc_msgSend(v10, "addObject:", v16);
        objc_msgSend(v16, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v28);

        if (v19)
          break;
        v10 = v17;
        if (v13 < 1)
          goto LABEL_26;
      }
      v10 = v17;
      if (objc_msgSend(v17, "count"))
      {
        v9 = p_super;
        -[NSObject setViewControllers:animated:](p_super, "setViewControllers:animated:", v12, 0);
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v20 = v10;
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v30 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v25, "setDelegate:", 0);
              objc_msgSend(v6, "removeObject:", v25);
              -[RemoteUIController _didRemoveObjectModel:](self, "_didRemoveObjectModel:", v25);
            }
            v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v22);
        }
        goto LABEL_30;
      }
    }
LABEL_26:
    if (!_isInternalInstall())
    {
      v9 = p_super;
      goto LABEL_32;
    }
    _RUILoggingFacility();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v20, OS_LOG_TYPE_DEFAULT, "No object models removed by idOfOldestObjectModelToRemoveAfterPush", buf, 2u);
    }
    v9 = p_super;
LABEL_30:

LABEL_32:
LABEL_33:

    goto LABEL_34;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Not enough object models on the stack to use idOfOldestObjectModelToRemoveAfterPush! Need >=2, have %lu", buf, 0xCu);
    }
    goto LABEL_33;
  }
LABEL_34:

}

uint64_t __66__RemoteUIController__removePreviousObjectModelsBackToIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "displayedPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsDescendantFromArray:", v4);

  return v5 ^ 1u;
}

- (void)pushObjectModel:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  id v9;
  RUINavigationController *modalNavigationController;
  RUINavigationController *v11;
  void *v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  char *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD aBlock[5];
  id v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v4 = a4;
  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = 24;
  if (!self->_modalNavigationController)
    v8 = 16;
  v9 = *(id *)((char *)&self->super.isa + v8);
  modalNavigationController = self->_modalNavigationController;
  if (modalNavigationController)
  {
    v11 = modalNavigationController;
  }
  else
  {
    -[RemoteUIController hostingController](self, "hostingController");
    v11 = (RUINavigationController *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RemoteUIController.m"), 379, CFSTR("%s: no navigation controller to push onto"), "-[RemoteUIController pushObjectModel:animated:]");

      v11 = 0;
    }
  }
  objc_msgSend(v7, "setDelegate:", self);
  -[RemoteUIController _willPresentObjectModel:modally:](self, "_willPresentObjectModel:modally:", v7, self->_modalNavigationController != 0);
  objc_msgSend(v7, "identifierMarkingStackRemovalAfterPush");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v14 = " Object Model is nil, cannot insert object";
  if (v12)
  {
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __47__RemoteUIController_pushObjectModel_animated___block_invoke;
    v48[3] = &unk_24C297EC8;
    v15 = v7;
    v49 = v15;
    v16 = objc_msgSend(v9, "indexOfObjectPassingTest:", v48);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "identifierMarkingStackRemovalAfterPush");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v51 = v18;
          _os_log_impl(&dword_209E87000, v17, OS_LOG_TYPE_DEFAULT, "idOfOldestObjectModelToRemoveAfterPush '%@' not found", buf, 0xCu);

        }
      }
      v12 = 0;
      goto LABEL_24;
    }
    v19 = v16;
    if (v16 >= 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v16 - 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "displayedPages");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "backButtonTitle");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;

        v14 = "New Object Model is nil, cannot insert object" + 3;
        goto LABEL_21;
      }
      objc_msgSend(v22, "navTitle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = " Object Model is nil, cannot insert object";
      if (v24)
        goto LABEL_21;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "displayedPages");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[RUINavigationController viewControllers](v11, "viewControllers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "indexOfObject:", v24);

    if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_22;
    v29 = v28 - 1;
    if (!v29)
      goto LABEL_22;
    -[RUINavigationController viewControllers](v11, "viewControllers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "navigationItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "title");
    v32 = objc_claimAutoreleasedReturnValue();

    v14 = " Object Model is nil, cannot insert object";
    v24 = (void *)v32;
    if (!v32)
    {
LABEL_23:
      v13 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __47__RemoteUIController_pushObjectModel_animated___block_invoke_2;
      aBlock[3] = &unk_24C2979C0;
      aBlock[4] = self;
      v47 = v15;
      v12 = _Block_copy(aBlock);

LABEL_24:
      goto LABEL_25;
    }
LABEL_21:
    v42 = v15;
    objc_msgSend(v9, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "displayedPages");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastObject");
    v35 = v4;
    v36 = v14;
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "setBackButtonTitle:", v24);
    v14 = v36;
    v4 = v35;
    v15 = v42;
LABEL_22:

    goto LABEL_23;
  }
LABEL_25:
  objc_msgSend(v9, "addObject:", v7);
  v43[0] = v13;
  v43[1] = *((_QWORD *)v14 + 460);
  v43[2] = __47__RemoteUIController_pushObjectModel_animated___block_invoke_53;
  v43[3] = &unk_24C297AD8;
  v43[4] = self;
  v44 = v7;
  v45 = v12;
  v38 = v12;
  v39 = v7;
  objc_msgSend(v39, "presentInParentViewController:animated:completion:", v11, v4, v43);

}

uint64_t __47__RemoteUIController_pushObjectModel_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifierMarkingStackRemovalAfterPush");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __47__RemoteUIController_pushObjectModel_animated___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifierMarkingStackRemovalAfterPush");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_removePreviousObjectModelsBackToIdentifier:", v2);

}

uint64_t __47__RemoteUIController_pushObjectModel_animated___block_invoke_53(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_didPresentObjectModel:modally:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) != 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_objectModelStack
{
  uint64_t v2;

  v2 = 24;
  if (!self->_modalNavigationController)
    v2 = 16;
  return *(id *)((char *)&self->super.isa + v2);
}

- (id)popObjectModelAnimated:(BOOL)a3 stopListeningForHSATokens:(BOOL)a4
{
  _BOOL8 v4;
  RUINavigationController *modalNavigationController;
  RUINavigationController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v22;

  v4 = a3;
  if (a4)
    -[RemoteUIController _stopListeningForSMSAutoFill](self, "_stopListeningForSMSAutoFill");
  modalNavigationController = self->_modalNavigationController;
  if (modalNavigationController)
  {
    v8 = modalNavigationController;
  }
  else
  {
    -[RemoteUIController navigationController](self, "navigationController");
    v8 = (RUINavigationController *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RemoteUIController.m"), 442, CFSTR("%s: no navigation controller to pop from"), "-[RemoteUIController popObjectModelAnimated:stopListeningForHSATokens:]");

      v8 = 0;
    }
  }
  -[RemoteUIController _objectModelStack](self, "_objectModelStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[RemoteUIController _objectModelStack](self, "_objectModelStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "displayedPages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    -[RUINavigationController viewControllers](v8, "viewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v14 - 1 >= 0)
    {
      do
      {
        objc_msgSend(v13, "objectAtIndex:", --v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsDescendant:", v17);

        if (v19)
          objc_msgSend(v16, "removeLastObject");

      }
      while (v14 > 0);
    }
    -[RUINavigationController setViewControllers:animated:](v8, "setViewControllers:animated:", v16, v4);
    objc_msgSend(v12, "setDelegate:", 0);
    -[RemoteUIController _objectModelStack](self, "_objectModelStack");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeLastObject");

    -[RemoteUIController _didRemoveObjectModel:](self, "_didRemoveObjectModel:", v12);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)popObjectModelAnimated:(BOOL)a3
{
  return -[RemoteUIController popObjectModelAnimated:stopListeningForHSATokens:](self, "popObjectModelAnimated:stopListeningForHSATokens:", a3, 1);
}

- (void)_replaceObjectModelWithObjectModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  NSMutableArray *objectModels;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *modalObjectModels;
  id v22;
  _QWORD v23[5];
  id v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "defaultPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RemoteUIController _objectModelPageWantsHSATokens:](self, "_objectModelPageWantsHSATokens:", v6);

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 24;
  if (!self->_modalNavigationController)
    v8 = 16;
  v9 = *(id *)((char *)&self->super.isa + v8);
  objc_msgSend(v4, "idOfObjectModelToReplace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length") == 0;

  v12 = MEMORY[0x24BDAC760];
  if (v11)
  {
    if (!objc_msgSend(v9, "count"))
      goto LABEL_8;
    v15 = objc_msgSend(v9, "count");
    v31[3] = v15 - 1;
    v16 = v35;
    v17 = v9;
    v14 = (void *)v16[5];
    v16[5] = (uint64_t)v17;
  }
  else
  {
    objectModels = self->_objectModels;
    v40[0] = self->_modalObjectModels;
    v40[1] = objectModels;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke;
    v26[3] = &unk_24C297F18;
    v27 = v4;
    v28 = &v34;
    v29 = &v30;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v26);

  }
LABEL_8:
  v18 = v31[3];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "addObject:", v4);
    v19 = 0;
  }
  else
  {
    if (!v7)
    {
      -[RemoteUIController stopListeningForHSATokenAutoFill](self, "stopListeningForHSATokenAutoFill");
      v18 = v31[3];
    }
    objc_msgSend((id)v35[5], "objectAtIndexedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v35[5], "replaceObjectAtIndex:withObject:", v31[3], v4);
  }
  objc_msgSend(v4, "setDelegate:", self);
  -[RemoteUIController _replacePagesOfObjectModel:byObjectModel:sourceArray:](self, "_replacePagesOfObjectModel:byObjectModel:sourceArray:", v19, v4, v35[5]);
  if (v19)
  {
    -[RemoteUIController _didRemoveObjectModel:](self, "_didRemoveObjectModel:", v19);
    objc_msgSend(v19, "setDelegate:", 0);
  }
  v20 = (NSMutableArray *)v35[5];
  modalObjectModels = self->_modalObjectModels;
  -[RemoteUIController _willPresentObjectModel:modally:](self, "_willPresentObjectModel:modally:", v4, v20 == modalObjectModels);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke_3;
  v23[3] = &unk_24C297F40;
  v23[4] = self;
  v22 = v4;
  v24 = v22;
  v25 = v20 == modalObjectModels;
  objc_msgSend(v22, "presentWithBlock:", v23);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

}

void __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;

  v6 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke_2;
  v8[3] = &unk_24C297EF0;
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v12 = a4;
  v7 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  _BYTE *v10;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "idOfObjectModelToReplace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    v10 = *(_BYTE **)(a1 + 64);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    *v10 = 1;
    *a4 = 1;
  }
}

uint64_t __57__RemoteUIController__replaceObjectModelWithObjectModel___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPresentObjectModel:modally:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_replacePagesOfObjectModel:(id)a3 byObjectModel:(id)a4 sourceArray:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  RUINavigationController *v11;
  RUINavigationController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = (NSMutableArray *)a5;
  if (self->_modalObjectModels == v10)
  {
    v11 = self->_modalNavigationController;
  }
  else
  {
    -[RemoteUIController navigationController](self, "navigationController");
    v11 = (RUINavigationController *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  -[RUINavigationController viewControllers](v11, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v13, "mutableCopy");

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8)
  {
    objc_msgSend(v8, "allPages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke;
    v21[3] = &unk_24C297F90;
    v21[4] = &v22;
    v21[5] = &v26;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);

  }
  else if (objc_msgSend((id)v27[5], "count"))
  {
    v15 = objc_msgSend((id)v27[5], "count");
    v23[3] = v15 - 1;
    objc_msgSend((id)v27[5], "removeLastObject");
  }
  objc_msgSend(v9, "defaultPages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v23[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      _RUILoggingFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[RemoteUIController _replacePagesOfObjectModel:byObjectModel:sourceArray:].cold.2();
    }
    else
    {
      v19 = (void *)v27[5];
      objc_msgSend(v9, "defaultPages");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject firstObject](v18, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertObject:atIndex:", v20, v23[3]);

    }
  }
  else
  {
    _RUILoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[RemoteUIController _replacePagesOfObjectModel:byObjectModel:sourceArray:].cold.1();
  }

  -[RUINavigationController setViewControllers:animated:](v12, "setViewControllers:animated:", v27[5], 0);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

}

void __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v3 = a2;
  v4 = v3;
  v5 = MEMORY[0x24BDAC760];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke_2;
    v18[3] = &unk_24C297F68;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v19 = v7;
    v20 = v8;
    v9 = (id)objc_msgSend(v6, "aaf_firstObjectPassingTest:", v18);

  }
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke_3;
  v16[3] = &unk_24C2977E8;
  v17 = v4;
  v11 = v4;
  objc_msgSend(v10, "aaf_filter:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mutableCopy");
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

uint64_t __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsDescendant:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  return result;
}

uint64_t __75__RemoteUIController__replacePagesOfObjectModel_byObjectModel_sourceArray___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsDescendant:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (id)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (self->_modalNavigationController && -[NSMutableArray count](self->_modalObjectModels, "count"))
  {
    v7 = (void *)-[NSMutableArray copy](self->_modalObjectModels, "copy");
    -[RUINavigationController dismissViewControllerAnimated:completion:](self->_modalNavigationController, "dismissViewControllerAnimated:completion:", v4, v6);
    -[RemoteUIController _invalidateModalObjectModels](self, "_invalidateModalObjectModels");
  }
  else
  {
    if (v6)
      v6[2](v6);
    v7 = 0;
  }

  return v7;
}

- (void)_invalidateModalObjectModels
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  RUINavigationController *modalNavigationController;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_modalNavigationController && -[NSMutableArray count](self->_modalObjectModels, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_modalObjectModels;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setDelegate:", 0, (_QWORD)v9);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    modalNavigationController = self->_modalNavigationController;
    self->_modalNavigationController = 0;

    -[NSMutableArray removeAllObjects](self->_modalObjectModels, "removeAllObjects");
  }
}

- (void)_modalNavigationWasDismissed
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  RUINavigationController *modalNavigationController;
  NSObject *v12;
  id WeakRetained;
  char v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[RemoteUIController loader](self, "loader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  if (self->_modalNavigationController)
  {
    v4 = (void *)-[NSMutableArray copy](self->_modalObjectModels, "copy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_modalObjectModels, "reverseObjectEnumerator", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "setDelegate:", 0);
          -[RemoteUIController _didRemoveObjectModel:](self, "_didRemoveObjectModel:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_modalObjectModels, "removeAllObjects");
    modalNavigationController = self->_modalNavigationController;
    self->_modalNavigationController = 0;

    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_impl(&dword_209E87000, v12, OS_LOG_TYPE_DEFAULT, "Modal navigation was dismissed with objectModels still present: %@", buf, 0xCu);
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "remoteUIController:didDismissModalNavigationWithObjectModels:", self, v4);

    }
  }
}

- (void)_modalViewControllerWasPopped:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RemoteUIController loader](self, "loader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray lastObject](self->_modalObjectModels, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_209E87000, v6, OS_LOG_TYPE_DEFAULT, "A page from modal object model was popped: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  -[NSMutableArray lastObject](self->_modalObjectModels, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didNavigateBackFromViewController:", v4);

}

- (NSArray)displayedPages
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_objectModels;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8), "displayedPages");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_modalObjectModels;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "displayedPages", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  return (NSArray *)v3;
}

- (void)_setHandlerWithKey:(id)a3 forElementsMatching:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *elementChangeHandlers;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RemoteUIController.m"), 636, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  if (!self->_elementChangeHandlers)
  {
    v12 = (NSMutableDictionary *)objc_opt_new();
    elementChangeHandlers = self->_elementChangeHandlers;
    self->_elementChangeHandlers = v12;

  }
  v18[0] = CFSTR("ButtonHandler");
  v14 = (void *)objc_msgSend(v11, "copy");
  v18[1] = CFSTR("ButtonComparison");
  v19[0] = v14;
  v15 = (void *)objc_msgSend(v10, "copy");
  v19[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elementChangeHandlers, "setObject:forKeyedSubscript:", v16, v9);

}

- (void)setHandlerForElementName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__RemoteUIController_setHandlerForElementName_handler___block_invoke;
  v8[3] = &unk_24C2974B0;
  v9 = v6;
  v7 = v6;
  -[RemoteUIController _setHandlerWithKey:forElementsMatching:handler:](self, "_setHandlerWithKey:forElementsMatching:handler:", v7, v8, a4);

}

uint64_t __55__RemoteUIController_setHandlerForElementName_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)setHandlerForElementsMatching:(id)a3 handler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[RemoteUIController _setHandlerWithKey:forElementsMatching:handler:](self, "_setHandlerWithKey:forElementsMatching:handler:", v10, v8, v7);
  return v10;
}

- (void)removeHandlerForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_elementChangeHandlers, "removeObjectForKey:", a3);
}

- (void)setHandlerForButtonsMatching:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v11 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__RemoteUIController_setHandlerForButtonsMatching_handler___block_invoke;
  v12[3] = &unk_24C297FB8;
  v13 = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__RemoteUIController_setHandlerForButtonsMatching_handler___block_invoke_2;
  v10[3] = &unk_24C297FE0;
  v7 = v11;
  v8 = v6;
  v9 = -[RemoteUIController setHandlerForElementsMatching:handler:](self, "setHandlerForElementsMatching:handler:", v12, v10);

}

uint64_t __59__RemoteUIController_setHandlerForButtonsMatching_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

void __59__RemoteUIController_setHandlerForButtonsMatching_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  objc_msgSend(a3, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v8, v9, v7);

}

- (void)setHandlerForButtonName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__RemoteUIController_setHandlerForButtonName_handler___block_invoke;
  v8[3] = &unk_24C297FE0;
  v9 = v6;
  v7 = v6;
  -[RemoteUIController setHandlerForElementName:handler:](self, "setHandlerForElementName:handler:", a3, v8);

}

void __54__RemoteUIController_setHandlerForButtonName_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  objc_msgSend(a3, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v8, v9, v7);

}

- (RUILoader)loader
{
  RUILoader *loader;
  RUILoader *v4;
  RUILoader *v5;

  loader = self->_loader;
  if (!loader)
  {
    v4 = objc_alloc_init(RUILoader);
    v5 = self->_loader;
    self->_loader = v4;

    -[RUIHTTPRequest setDelegate:](self->_loader, "setDelegate:", self);
    -[RUILoader setParserDelegate:](self->_loader, "setParserDelegate:", self);
    -[RUILoader setStyle:](self->_loader, "setStyle:", self->_style);
    loader = self->_loader;
  }
  return loader;
}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id WeakRetained;
  char v21;
  id v22;
  id v23;
  char v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  id loadCompletion;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    _RUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RemoteUIController loader:didFinishLoadWithError:forRequest:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

  }
  -[RemoteUIController _objectModelStack](self, "_objectModelStack");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stopActivityIndicator");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = objc_opt_respondsToSelector();

  v22 = objc_loadWeakRetained((id *)&self->_delegate);
  v23 = v22;
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v22, "remoteUIController:didFinishLoadWithError:forRequest:", self, v9, v10);
  }
  else
  {
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) == 0)
      goto LABEL_10;
    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v23, "remoteUIController:didFinishLoadWithError:", self, v9);
  }

LABEL_10:
  -[RemoteUIController loadCompletion](self, "loadCompletion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[RemoteUIController loadCompletion](self, "loadCompletion");
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL, id))v26)[2](v26, v9 == 0, v9);

  }
  loadCompletion = self->_loadCompletion;
  self->_loadCompletion = 0;

}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;
  char v12;
  id v13;

  v13 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v10, "remoteUIController:didReceiveHTTPResponse:forRequest:", self, v13, v7);
LABEL_5:

    goto LABEL_6;
  }
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "remoteUIController:didReceiveHTTPResponse:", self, v13);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "remoteUIController:didReceiveChallenge:completionHandler:", self, v11, v7);

  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }

}

- (void)loader:(id)a3 loadResourcesForObjectModel:(id)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;

  v9 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  -[RemoteUIController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "remoteUIController:loadResourcesForObjectModel:completion:", self, v9, v7);
  else
    v7[2](v7, 1, 0);

}

- (id)_handleDismissAndReplaceWithActionSignal:(id)a3 objectModel:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  objc_msgSend(v6, "defaultPages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = -[NSMutableArray count](self->_objectModels, "count");
    -[RemoteUIController hostingController](self, "hostingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RemoteUIController.m"), 744, CFSTR("%s: dismiss+replace requires a hosting controller"), "-[RemoteUIController _handleDismissAndReplaceWithActionSignal:objectModel:]");

    }
    if (v9)
    {
      v18 = MEMORY[0x24BDAC760];
      v12 = __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke;
      v13 = &v18;
    }
    else
    {
      v17 = MEMORY[0x24BDAC760];
      v12 = __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke_2;
      v13 = &v17;
    }
    v13[1] = 3221225472;
    v13[2] = (uint64_t)v12;
    v13[3] = (uint64_t)&unk_24C2979C0;
    v13[4] = (uint64_t)self;
    v13[5] = (uint64_t)v6;
    v14 = _Block_copy(v13);

  }
  else
  {
    v14 = &__block_literal_global_3;
  }
  v15 = _Block_copy(v14);

  return v15;
}

uint64_t __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replaceObjectModelWithObjectModel:", *(_QWORD *)(a1 + 40));
}

void __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_willPresentObjectModel:modally:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 40), "setDelegate:", *(_QWORD *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hostingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_shouldAnimate");
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke_3;
  v9 = &unk_24C2979C0;
  v5 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  objc_msgSend(v2, "presentInParentViewController:animated:completion:", v3, v4, &v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40), v6, v7, v8, v9, v10);
}

uint64_t __75__RemoteUIController__handleDismissAndReplaceWithActionSignal_objectModel___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPresentObjectModel:modally:", *(_QWORD *)(a1 + 40), 0);
}

- (id)_handleDismissWithActionSignal:(id)a3 objectModel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "subActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[RUIActionSignal signalWithString:](RUIActionSignal, "signalWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSubActions:", v11);

  if (v10)
  {
    objc_msgSend(v10, "subActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", 0);

    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v10;
        _os_log_impl(&dword_209E87000, v13, OS_LOG_TYPE_DEFAULT, "dismiss sub-action: %@", buf, 0xCu);
      }

    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__RemoteUIController__handleDismissWithActionSignal_objectModel___block_invoke;
    aBlock[3] = &unk_24C298008;
    aBlock[4] = self;
    v18 = v7;
    v19 = v10;
    v14 = _Block_copy(aBlock);
    v15 = _Block_copy(v14);

  }
  else
  {
    -[RemoteUIController _handleDismissAndReplaceWithActionSignal:objectModel:](self, "_handleDismissAndReplaceWithActionSignal:objectModel:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

uint64_t __65__RemoteUIController__handleDismissWithActionSignal_objectModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loader:receivedObjectModel:topActionSignal:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  RUIPage *pageOriginatingLoad;
  void *v13;
  RUIPage *v14;
  RUIPage *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  char v22;
  NSObject *v23;
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  RUINavigationController *modalNavigationController;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  RUINavigationController *v41;
  char v42;
  _BOOL8 v43;
  RUINavigationController *v44;
  void *v45;
  _BOOL4 v46;
  uint64_t v47;
  id v48;
  RUINavigationController *v49;
  NSObject *v50;
  void *v51;
  RUINavigationController *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  id v57;
  void (**v58)(_QWORD);
  RUINavigationController *v59;
  _BOOL8 v60;
  void (**v61)(_QWORD);
  id v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  RUINavigationController *v79;
  id v80;
  void *v81;
  RUINavigationController *v82;
  RUINavigationController *v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id v88;
  RUINavigationController *v89;
  BOOL v90;
  void *v91;
  _BOOL4 v92;
  uint64_t v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  RUINavigationController *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  RUINavigationController *v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[5];
  id v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[5];
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD aBlock[5];
  id v127;
  _QWORD v128[5];
  id v129;
  _BYTE v130[128];
  uint8_t v131[128];
  uint8_t v132[4];
  int v133;
  _BYTE buf[12];
  __int16 v135;
  void *v136;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  if (!WeakRetained)
  {
    if (!_isInternalInstall())
      goto LABEL_70;
    _RUILoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_209E87000, v16, OS_LOG_TYPE_DEFAULT, "Warning: Received action signal %@ with no host controller", buf, 0xCu);
    }
    goto LABEL_7;
  }
  pageOriginatingLoad = self->_pageOriginatingLoad;
  if (!pageOriginatingLoad)
  {
LABEL_13:
    self->_pageOriginatingLoad = 0;

    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[RemoteUIController UUID](self, "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        v135 = 2112;
        v136 = v19;
        _os_log_impl(&dword_209E87000, v17, OS_LOG_TYPE_DEFAULT, "Incoming action signal: %@ on RemoteUIController %@", buf, 0x16u);

      }
    }
    if (self->_modalNavigationController)
    {
      objc_msgSend(v10, "topSignal");
    }
    else
    {
      v20 = objc_loadWeakRetained((id *)&self->_hostViewController);
      v21 = objc_msgSend(v20, "conformsToProtocol:", &unk_2545F2C48);

      if (objc_msgSend(v10, "topSignal") == 2)
        v22 = v21;
      else
        v22 = 1;
      if ((v22 & 1) == 0)
      {
        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_209E87000, v23, OS_LOG_TYPE_INFO, "Coercing 'push' into 'showModal' for non-nav host controller", buf, 2u);
          }

        }
        objc_msgSend(v10, "setTopSignal:", 5);
      }
    }
    v24 = objc_loadWeakRetained((id *)&self->_delegate);
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)buf = objc_msgSend(v10, "topSignal");
      v26 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v26, "remoteUIController:didReceiveObjectModel:actionSignal:", self, v9, buf);

      if (*(_QWORD *)buf)
      {
        v27 = objc_msgSend(v10, "topSignal");
        if (v27 != *(_QWORD *)buf)
        {
          if (_isInternalInstall())
          {
            _RUILoggingFacility();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v132 = 67109120;
              v133 = *(_DWORD *)buf;
              _os_log_impl(&dword_209E87000, v28, OS_LOG_TYPE_DEFAULT, "Signal override provided: (%d)", v132, 8u);
            }

          }
          objc_msgSend(v10, "setTopSignal:", *(_QWORD *)buf);
        }
      }
    }
    if (objc_msgSend(v10, "topSignal") == 2 || objc_msgSend(v10, "topSignal") == 5)
    {
      objc_msgSend(v9, "defaultPages");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count") == 0;

      if (v30)
      {
        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_209E87000, v31, OS_LOG_TYPE_DEFAULT, "Warning: received an object model with actionSignal push or showModal but no pages.", buf, 2u);
          }

        }
        objc_msgSend(v9, "primaryAlert");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32 == 0;

        if (v33)
          goto LABEL_70;
        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_209E87000, v34, OS_LOG_TYPE_DEFAULT, "Changing action signal back to Alert (was it overridden mistakenly?)", buf, 2u);
          }

        }
        objc_msgSend(v10, "setTopSignal:", 7);
      }
    }
    if (objc_msgSend(v10, "topSignal") == 2)
    {
      modalNavigationController = self->_modalNavigationController;
      if (modalNavigationController)
      {
        v36 = modalNavigationController;
      }
      else
      {
        -[RemoteUIController hostingController](self, "hostingController");
        v36 = objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          _RUILoggingFacility();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[RemoteUIController loader:receivedObjectModel:topActionSignal:].cold.1();
          goto LABEL_68;
        }
      }
      -[RemoteUIController pushObjectModel:animated:](self, "pushObjectModel:animated:", v9, -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"));
LABEL_68:

      goto LABEL_69;
    }
    if (objc_msgSend(v10, "topSignal") == 1)
    {
      -[RemoteUIController loader](self, "loader");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "cancel");

      -[RUINavigationController setIsDismissing:](self->_modalNavigationController, "setIsDismissing:", 1);
      objc_msgSend(v10, "subActions");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("refresh"));

      v41 = self->_modalNavigationController;
      if (v41)
        v42 = 1;
      else
        v42 = v40;
      if ((v42 & 1) == 0)
      {
        -[RemoteUIController delegate](self, "delegate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_opt_respondsToSelector();

        if ((v54 & 1) != 0)
        {
          -[RemoteUIController delegate](self, "delegate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "remoteUIControllerDidDismiss:", self);

        }
        goto LABEL_69;
      }
      if (!v40)
      {
        -[RemoteUIController _handleDismissWithActionSignal:objectModel:](self, "_handleDismissWithActionSignal:objectModel:", v10, v9);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_2;
        aBlock[3] = &unk_24C298030;
        aBlock[4] = self;
        v57 = v56;
        v127 = v57;
        v58 = (void (**)(_QWORD))_Block_copy(aBlock);
        v59 = self->_modalNavigationController;
        v60 = -[RemoteUIController _shouldAnimate](self, "_shouldAnimate");
        if (-[RemoteUIController _shouldAnimate](self, "_shouldAnimate"))
          v61 = v58;
        else
          v61 = 0;
        -[RUINavigationController dismissViewControllerAnimated:completion:](v59, "dismissViewControllerAnimated:completion:", v60, v61);
        if (!-[RemoteUIController _shouldAnimate](self, "_shouldAnimate"))
          v58[2](v58);

        goto LABEL_69;
      }
      if (v41)
      {
        v43 = -[RemoteUIController _shouldAnimate](self, "_shouldAnimate");
        v128[0] = MEMORY[0x24BDAC760];
        v128[1] = 3221225472;
        v128[2] = __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke;
        v128[3] = &unk_24C2979C0;
        v128[4] = self;
        v129 = v9;
        -[RUINavigationController dismissViewControllerAnimated:completion:](v41, "dismissViewControllerAnimated:completion:", v43, v128);
        v44 = self->_modalNavigationController;
        self->_modalNavigationController = 0;

LABEL_69:
        objc_initWeak((id *)buf, self);
        v110[0] = MEMORY[0x24BDAC760];
        v110[1] = 3221225472;
        v110[2] = __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_126;
        v110[3] = &unk_24C298080;
        objc_copyWeak(&v111, (id *)buf);
        -[RUINavigationController setViewDidDisappearHandler:](self->_modalNavigationController, "setViewDidDisappearHandler:", v110);
        -[RemoteUIController loader](self, "loader");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "cancel");

        objc_destroyWeak(&v111);
        objc_destroyWeak((id *)buf);
        goto LABEL_70;
      }
      goto LABEL_79;
    }
    if (objc_msgSend(v10, "topSignal") != 4)
    {
      if (objc_msgSend(v10, "topSignal") == 3)
      {
        v52 = self->_modalNavigationController;
        if (v52)
        {
          v36 = v52;
        }
        else
        {
          -[RemoteUIController hostingController](self, "hostingController");
          v36 = objc_claimAutoreleasedReturnValue();
          if (!v36)
          {
            _RUILoggingFacility();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              -[RemoteUIController loader:receivedObjectModel:topActionSignal:].cold.4();
            goto LABEL_68;
          }
        }
        -[RemoteUIController _replaceObjectModelWithObjectModel:](self, "_replaceObjectModelWithObjectModel:", v9);
        goto LABEL_68;
      }
      if (objc_msgSend(v10, "topSignal") != 8)
      {
        if (objc_msgSend(v10, "topSignal") == 5
          || objc_msgSend(v10, "topSignal") == 6
          || objc_msgSend(v10, "topSignal") == 9)
        {
          -[RemoteUIController _willPresentObjectModel:modally:](self, "_willPresentObjectModel:modally:", v9, 1);
          v63 = objc_msgSend(v10, "topSignal");
          if (v63 == 9)
          {
            v64 = 0;
            v65 = 2;
          }
          else
          {
            v64 = objc_msgSend(v10, "topSignal") == 6;
            v65 = v64;
          }
          v109 = self->_modalNavigationController;
          v79 = self->_modalNavigationController;
          if (v79 && -[RUINavigationController ruiModalPresentationStyle](v79, "ruiModalPresentationStyle") != v65)
          {
            -[RUINavigationController setViewDidDisappearHandler:](self->_modalNavigationController, "setViewDidDisappearHandler:", 0);
            -[RemoteUIController _invalidateModalObjectModels](self, "_invalidateModalObjectModels");
            v107 = 1;
          }
          else
          {
            v107 = 0;
          }
          -[NSMutableArray addObject:](self->_modalObjectModels, "addObject:", v9);
          if (self->_modalNavigationController)
          {
            v116[0] = MEMORY[0x24BDAC760];
            v116[1] = 3221225472;
            v116[2] = __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_118;
            v116[3] = &unk_24C2979C0;
            v116[4] = self;
            v80 = v9;
            v117 = v80;
            v81 = _Block_copy(v116);
            objc_msgSend(v80, "presentInParentViewController:animated:completion:", self->_modalNavigationController, -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"), v81);

          }
          else
          {
            v82 = (RUINavigationController *)objc_msgSend(v9, "newNavigationControllerForPresentation");
            v83 = self->_modalNavigationController;
            self->_modalNavigationController = v82;

            -[RUINavigationController setRuiModalPresentationStyle:](self->_modalNavigationController, "setRuiModalPresentationStyle:", v65);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v84 = objc_loadWeakRetained((id *)&self->_hostViewController);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(v84, "navigationController");
                v85 = objc_claimAutoreleasedReturnValue();
                v86 = (void *)v85;
                if (v85)
                  v87 = (void *)v85;
                else
                  v87 = v84;
                v88 = v87;

                v84 = v88;
              }
              -[RUINavigationController setSupportedInterfaceOrientations:](self->_modalNavigationController, "setSupportedInterfaceOrientations:", objc_msgSend(v84, "supportedInterfaceOrientations"));

            }
            objc_initWeak((id *)buf, self);
            v89 = self->_modalNavigationController;
            v114[0] = MEMORY[0x24BDAC760];
            v114[1] = 3221225472;
            v114[2] = __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_2_122;
            v114[3] = &unk_24C298058;
            objc_copyWeak(&v115, (id *)buf);
            -[RUINavigationController setMenuDismissalHandler:](v89, "setMenuDismissalHandler:", v114);
            v90 = !v64;
            if (v63 == 9)
              v90 = 0;
            if (v90)
            {
              objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = objc_msgSend(v91, "userInterfaceIdiom") == 1;

              if (v92)
                v93 = 2;
              else
                v93 = -2;
              -[RUINavigationController setModalPresentationStyle:](self->_modalNavigationController, "setModalPresentationStyle:", v93);
              -[RUINavigationController setModalInPresentation:](self->_modalNavigationController, "setModalInPresentation:", 1);
            }
            else
            {
              -[RUINavigationController setModalPresentationStyle:](self->_modalNavigationController, "setModalPresentationStyle:", 4);
              -[RUINavigationController setTransitioningDelegate:](self->_modalNavigationController, "setTransitioningDelegate:", self);
            }
            -[RemoteUIController delegate](self, "delegate");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_opt_respondsToSelector();

            if ((v95 & 1) != 0)
            {
              -[RemoteUIController delegate](self, "delegate");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "remoteUIController:willPresentModalNavigationController:", self, self->_modalNavigationController);

            }
            v112[0] = MEMORY[0x24BDAC760];
            v112[1] = 3221225472;
            v112[2] = __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_3;
            v112[3] = &unk_24C2979C0;
            v112[4] = self;
            v113 = v9;
            v97 = _Block_copy(v112);
            v98 = self->_modalNavigationController;
            if (v107)
              -[RemoteUIController _replaceModalRUIController:byController:completion:](self, "_replaceModalRUIController:byController:completion:", v109, v98, v97);
            else
              -[RemoteUIController _presentModalRUIController:completion:](self, "_presentModalRUIController:completion:", v98, v97);

            objc_destroyWeak(&v115);
            objc_destroyWeak((id *)buf);
          }

          goto LABEL_69;
        }
        if (objc_msgSend(v10, "topSignal") == 7)
        {
          objc_msgSend(v9, "setDelegate:", self);
          goto LABEL_69;
        }
        _RUILoggingFacility();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[RemoteUIController loader:receivedObjectModel:topActionSignal:].cold.5((uint64_t)v10, v36, v99, v100, v101, v102, v103, v104);
        goto LABEL_68;
      }
LABEL_79:
      -[RemoteUIController refreshTopModelWithModel:](self, "refreshTopModelWithModel:", v9);
      goto LABEL_69;
    }
    objc_msgSend(v9, "defaultPages");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count") == 0;

    if (v46)
    {
      v62 = -[RemoteUIController popObjectModelAnimated:](self, "popObjectModelAnimated:", -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"));
      goto LABEL_69;
    }
    v47 = 24;
    if (!self->_modalNavigationController)
      v47 = 16;
    v48 = *(id *)((char *)&self->super.isa + v47);
    v49 = self->_modalNavigationController;
    if (v49)
    {
      v50 = v49;
    }
    else
    {
      -[RemoteUIController navigationController](self, "navigationController");
      v50 = objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        _RUILoggingFacility();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[RemoteUIController loader:receivedObjectModel:topActionSignal:].cold.2();
        goto LABEL_110;
      }
    }
    if ((unint64_t)objc_msgSend(v48, "count") > 1)
    {
      -[NSObject topViewController](v50, "topViewController");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "lastObject");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setDelegate:", 0);
      objc_msgSend(v48, "removeLastObject");
      -[RemoteUIController _didRemoveObjectModel:](self, "_didRemoveObjectModel:", v108);
      objc_msgSend(v48, "lastObject");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setDelegate:", 0);
      objc_msgSend(v48, "removeLastObject");
      -[RemoteUIController _didRemoveObjectModel:](self, "_didRemoveObjectModel:", v106);
      -[NSObject viewControllers](v50, "viewControllers");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (void *)objc_msgSend(v67, "mutableCopy");

      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      objc_msgSend(v108, "displayedPages");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "reverseObjectEnumerator");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
      if (v71)
      {
        v72 = *(_QWORD *)v123;
        while (1)
        {
          if (*(_QWORD *)v123 != v72)
            objc_enumerationMutation(v70);
          objc_msgSend(v68, "removeLastObject");
          if (!--v71)
          {
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
            if (!v71)
              break;
          }
        }
      }

      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      objc_msgSend(v106, "displayedPages");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "reverseObjectEnumerator");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
      if (v75)
      {
        v76 = *(_QWORD *)v119;
        while (1)
        {
          if (*(_QWORD *)v119 != v76)
            objc_enumerationMutation(v74);
          objc_msgSend(v68, "removeLastObject");
          if (!--v75)
          {
            v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
            if (!v75)
              break;
          }
        }
      }

      -[RemoteUIController _willPresentObjectModel:modally:](self, "_willPresentObjectModel:modally:", v9, 0);
      objc_msgSend(v9, "_firstPageForPresentation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addObject:", v77);

      objc_msgSend(v68, "addObject:", v105);
      -[NSObject setViewControllers:animated:](v50, "setViewControllers:animated:", v68, 0);
      objc_msgSend(v48, "addObject:", v9);
      objc_msgSend(v9, "setDelegate:", self);
      v78 = (id)-[NSObject popViewControllerAnimated:](v50, "popViewControllerAnimated:", -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"));
      -[RemoteUIController _didPresentObjectModel:modally:](self, "_didPresentObjectModel:modally:", v9, 0);

    }
    else
    {
      _RUILoggingFacility();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        -[RemoteUIController loader:receivedObjectModel:topActionSignal:].cold.3();

    }
LABEL_110:

    goto LABEL_69;
  }
  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visiblePage");
  v14 = (RUIPage *)objc_claimAutoreleasedReturnValue();
  v15 = self->_pageOriginatingLoad;

  if (v14 == v15)
  {
    pageOriginatingLoad = self->_pageOriginatingLoad;
    goto LABEL_13;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v16, OS_LOG_TYPE_DEFAULT, "Finished loading object model for page no longer being displayed. Ignoring.", buf, 2u);
    }
LABEL_7:

  }
LABEL_70:

}

uint64_t __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshTopModelWithModel:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_modalNavigationWasDismissed");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPresentObjectModel:modally:", *(_QWORD *)(a1 + 40), 1);
}

void __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_2_122(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v4 && WeakRetained[3])
    objc_msgSend(WeakRetained, "_modalViewControllerWasPopped:", v4);

}

uint64_t __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPresentObjectModel:modally:", *(_QWORD *)(a1 + 40), 1);
}

void __65__RemoteUIController_loader_receivedObjectModel_topActionSignal___block_invoke_126(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || (objc_msgSend(v6, "navigationController"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v6, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(WeakRetained, "_modalNavigationWasDismissed");
  }

}

- (void)_replaceModalRUIController:(id)a3 byController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  int v12;
  id v13;
  id v14;

  v14 = a4;
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(v14, "setHostViewController:", WeakRetained);

  v11 = objc_loadWeakRetained((id *)&self->_hostViewController);
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_2545FEF40);

  if (v12)
  {
    v13 = objc_loadWeakRetained((id *)&self->_hostViewController);
    objc_msgSend(v13, "replaceModalRUIController:byController:completion:", v9, v14, v8);

    v8 = v13;
  }
  else
  {
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"), 0);

    -[RemoteUIController _presentModalRUIController:completion:](self, "_presentModalRUIController:completion:", self->_modalNavigationController, v8);
  }

}

- (void)_presentModalRUIController:(id)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  int v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(v12, "setHostViewController:", WeakRetained);

  v8 = objc_loadWeakRetained((id *)&self->_hostViewController);
  v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_2545FEF40);

  v10 = objc_loadWeakRetained((id *)&self->_hostViewController);
  v11 = v10;
  if (v9)
    objc_msgSend(v10, "presentModalRUIController:completion:", v12, v6);
  else
    objc_msgSend(v10, "presentViewController:animated:completion:", v12, -[RemoteUIController _shouldAnimate](self, "_shouldAnimate"), v6);

}

- (void)refreshTopModelWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id WeakRetained;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RemoteUIController _objectModelStack](self, "_objectModelStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v6, "refreshWithObjectModel:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "remoteUIController:didRefreshObjectModel:", self, v6);

    }
  }
  else if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_209E87000, v13, OS_LOG_TYPE_DEFAULT, "Refresh action detected, but identifiers did not match; New: <%@> Old: <%@>",
        (uint8_t *)&v16,
        0x16u);

    }
  }

}

- (id)sessionConfigurationForLoader:(id)a3
{
  return self->_sessionConfiguration;
}

- (void)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  char v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  int v24;
  char v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[RemoteUIController _objectModelStack](self, "_objectModelStack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "startActivityIndicator");
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RemoteUIController.m"), 1103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v16;
      _os_log_impl(&dword_209E87000, v15, OS_LOG_TYPE_DEFAULT, "RUIController sending delegate redirect call for URL %@", buf, 0xCu);

    }
  }
  v17 = (void *)objc_msgSend(v10, "mutableCopy");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = objc_opt_respondsToSelector();

  v20 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v19 & 1) == 0)
  {
    v21 = objc_opt_respondsToSelector();

    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = v22;
    if ((v21 & 1) != 0)
    {
      v24 = objc_msgSend(v22, "remoteUIController:shouldLoadRequest:redirectResponse:", self, v17, v11);

      if (!v24)
      {
        objc_msgSend(v14, "stopActivityIndicator");
        (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
        goto LABEL_15;
      }
    }
    else
    {
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        v26 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v26, "remoteUIController:willLoadRequest:", self, v17);

      }
    }
    (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v17, 0);
    goto LABEL_15;
  }
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __80__RemoteUIController_loader_willLoadRequest_redirectResponse_completionHandler___block_invoke;
  v28[3] = &unk_24C297A38;
  v31 = v12;
  v29 = v17;
  v30 = v14;
  objc_msgSend(v20, "remoteUIController:shouldLoadRequest:redirectResponse:withCompletionHandler:", self, v29, v11, v28);

LABEL_15:
}

void __80__RemoteUIController_loader_willLoadRequest_redirectResponse_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (!a2)
    objc_msgSend(*(id *)(a1 + 40), "stopActivityIndicator");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)parser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "remoteUIController:createPageWithName:attributes:", self, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  id v4;
  RUINavigationController *v5;
  RUINavigationController *v6;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_objectModels, "containsObject:", v4))
  {
    -[RemoteUIController navigationController](self, "navigationController");
    v5 = (RUINavigationController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[NSMutableArray containsObject:](self->_modalObjectModels, "containsObject:", v4))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = self->_modalNavigationController;
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (id)viewControllerForAlertPresentation
{
  RUINavigationController *modalNavigationController;

  modalNavigationController = self->_modalNavigationController;
  if (modalNavigationController)
    return modalNavigationController;
  else
    return objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (id)visibleElementWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_objectModels;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "visiblePage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subElementWithID:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v5 = self->_modalObjectModels;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
LABEL_12:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "visiblePage", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "subElementWithID:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            break;
          if (v13 == ++v15)
          {
            v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              goto LABEL_12;
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:
        v11 = 0;
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)objectModel:(id)a3 didNavigateBackFromController:(id)a4 withGesture:(BOOL)a5
{
  void *v5;
  void *v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v8;
      _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Object model navigated back from %@", (uint8_t *)&v20, 0xCu);
    }

  }
  v10 = 24;
  if (!self->_modalNavigationController)
    v10 = 16;
  v11 = *(id *)((char *)&self->super.isa + v10);
  -[RemoteUIController loader](self, "loader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancel");

  objc_msgSend(v11, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayedPages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  if (v15 == 1)
  {
    objc_msgSend(v13, "displayedPages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if ((id)v16 == v8)
    {

LABEL_15:
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138412290;
          v21 = v13;
          _os_log_impl(&dword_209E87000, v19, OS_LOG_TYPE_DEFAULT, "Object model has no more pages, popping: %@", (uint8_t *)&v20, 0xCu);
        }

      }
      objc_msgSend(v11, "removeLastObject");
      -[RemoteUIController _didRemoveObjectModel:](self, "_didRemoveObjectModel:", v13);
      goto LABEL_20;
    }
    v6 = (void *)v16;
  }
  objc_msgSend(v13, "displayedPages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v15 == 1)
  {

  }
  if (!v18)
    goto LABEL_15;
LABEL_20:

}

- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4
{
  return 30;
}

- (void)objectModel:(id)a3 elementDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSMutableDictionary *elementChangeHandlers;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[RemoteUIController loader](self, "loader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = self->_objectModels;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v14, "populatePostbackDictionary:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = self->_modalObjectModels;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v20);
        v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v21, "populatePostbackDictionary:", v22);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v18);
  }

  elementChangeHandlers = self->_elementChangeHandlers;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __51__RemoteUIController_objectModel_elementDidChange___block_invoke;
  v26[3] = &unk_24C2980A8;
  v27 = v7;
  v28 = v6;
  v24 = v6;
  v25 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](elementChangeHandlers, "enumerateKeysAndObjectsUsingBlock:", v26);

}

void __51__RemoteUIController_objectModel_elementDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("ButtonComparison"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && (*(unsigned int (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ButtonHandler"));
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v9;
          _os_log_impl(&dword_209E87000, v8, OS_LOG_TYPE_DEFAULT, "Calling handler for element named '%@'", (uint8_t *)&v14, 0xCu);

        }
      }
      v12 = a1 + 32;
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(v12 + 8);
      objc_msgSend(v10, "attributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *, void *))v7)[2](v7, v11, v10, v13);

    }
  }

}

- (void)objectModel:(id)a3 willLoadLinkURL:(id)a4 attributes:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("startSMSAutoFill"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
      -[RemoteUIController _beginListeningForSMSAutoFill](self, "_beginListeningForSMSAutoFill");
  }

}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  RUIPage *v16;
  RUIPage *pageOriginatingLoad;
  id v18;
  _QWORD v19[5];
  id v20;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  objc_msgSend(a5, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v13, "isEqualToString:", CFSTR("post"));

  if ((_DWORD)a4)
  {
    objc_msgSend(v10, "postbackData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[NSMutableArray lastObject](self->_objectModels, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "visiblePage");
  v16 = (RUIPage *)objc_claimAutoreleasedReturnValue();
  pageOriginatingLoad = self->_pageOriginatingLoad;
  self->_pageOriginatingLoad = v16;

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __68__RemoteUIController_objectModel_pressedLink_httpMethod_completion___block_invoke;
  v19[3] = &unk_24C2973C8;
  v19[4] = self;
  v20 = v11;
  v18 = v11;
  -[RemoteUIController _loadURL:postBody:fromObjectModel:completion:](self, "_loadURL:postBody:fromObjectModel:completion:", v12, v14, v10, v19);

}

void __68__RemoteUIController_objectModel_pressedLink_httpMethod_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_stopListeningForSMSAutoFill", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

- (BOOL)objectModel:(id)a3 shouldDisplayNamedElement:(id)a4 page:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RemoteUIController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[RemoteUIController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "remoteUIController:objectModel:shouldDisplayNamedElement:page:", self, v8, v9, v10);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)_objectModelPageWantsHSATokens:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenReceivedFunction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = 1;
  }
  else if (objc_msgSend(v3, "hasPasscodeView"))
  {
    objc_msgSend(v3, "passcodeViewOM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SMSAutoFill"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_objectModel:(id)a3 receivedToken:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v7;
      _os_log_impl(&dword_209E87000, v8, OS_LOG_TYPE_DEFAULT, "Got an autofill token: %@", buf, 0xCu);
    }

  }
  -[RemoteUIController parentViewControllerForObjectModel:](self, "parentViewControllerForObjectModel:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E87000, v11, OS_LOG_TYPE_DEFAULT, "Skipping autofill as an alert or other modal is currently presented", buf, 2u);
      }

    }
    goto LABEL_30;
  }
  objc_msgSend(v6, "visiblePage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("tokenReceivedFunction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E87000, v16, OS_LOG_TYPE_DEFAULT, "Calling token received function", buf, 2u);
      }

    }
    objc_msgSend(v6, "visiblePage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("tokenReceivedFunction"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v6, "invokeScriptFunction:withArguments:", v19, v20);

LABEL_16:
    -[RemoteUIController _stopListeningForSMSAutoFill](self, "_stopListeningForSMSAutoFill");
    goto LABEL_30;
  }
  objc_msgSend(v6, "visiblePage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "hasPasscodeView") & 1) != 0)
  {
    objc_msgSend(v6, "visiblePage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "passcodeViewOM");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "attributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("SMSAutoFill"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "BOOLValue");

    if (v29)
    {
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209E87000, v27, OS_LOG_TYPE_DEFAULT, "Autofilling passcodeview", buf, 2u);
        }

      }
      objc_msgSend(v6, "visiblePage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "passcodeViewOM");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "autofillWithToken:", v7);
      goto LABEL_16;
    }
  }
  else
  {

  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v28, OS_LOG_TYPE_DEFAULT, "Saving autofill token for later", buf, 2u);
    }

  }
  objc_storeStrong((id *)&self->_SMSAutoFillToken, a4);
LABEL_30:

}

- (void)_beginListeningForSMSAutoFill
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void RUIHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier(__strong HSAAuthenticationClientIncomingAuthenticationTokenBlock, CFStringRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RemoteUIController.m"), 43, CFSTR("%s"), dlerror());

  __break(1u);
}

uint64_t __51__RemoteUIController__beginListeningForSMSAutoFill__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _beginListeningForSMSAutoFill_hasTelephony = result;
  return result;
}

void __51__RemoteUIController__beginListeningForSMSAutoFill__block_invoke_210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__RemoteUIController__beginListeningForSMSAutoFill__block_invoke_2;
  v8[3] = &unk_24C2979C0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __51__RemoteUIController__beginListeningForSMSAutoFill__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 24;
  if (!*(_QWORD *)(v2 + 8))
    v3 = 16;
  objc_msgSend(*(id *)(v2 + v3), "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_objectModel:receivedToken:", v4, *(_QWORD *)(a1 + 40));

}

- (void)_stopListeningForSMSAutoFill
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void RUIHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier(CFStringRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("RemoteUIController.m"), 44, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)startListeningForHSATokenAutoFill
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_listeningForSMSIdentifier)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_209E87000, v3, OS_LOG_TYPE_DEFAULT, "Manually starting to listen for HSA tokens...", v4, 2u);
      }

    }
    -[RemoteUIController _beginListeningForSMSAutoFill](self, "_beginListeningForSMSAutoFill");
  }
}

- (void)stopListeningForHSATokenAutoFill
{
  NSObject *v2;
  uint8_t v3[16];

  if (self->_listeningForSMSIdentifier)
  {
    -[RemoteUIController _stopListeningForSMSAutoFill](self, "_stopListeningForSMSAutoFill");
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_209E87000, v2, OS_LOG_TYPE_DEFAULT, "Manually stopped listening for HSA tokens", v3, 2u);
      }

    }
  }
}

- (BOOL)isListeningForHSATokenAutoFill
{
  return self->_listeningForSMSIdentifier != 0;
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (UINavigationController)navigationController
{
  UIViewController **p_hostViewController;
  id WeakRetained;
  char isKindOfClass;
  id v5;

  p_hostViewController = &self->_hostViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = objc_loadWeakRetained((id *)p_hostViewController);
  else
    v5 = 0;
  return (UINavigationController *)v5;
}

- (id)hostingController
{
  UIViewController **p_hostViewController;
  id WeakRetained;
  int v4;
  id v5;

  p_hostViewController = &self->_hostViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  v4 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_2545F2C48);

  if (v4)
    v5 = objc_loadWeakRetained((id *)p_hostViewController);
  else
    v5 = 0;
  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  RUIModalPresentationController *v10;
  void *v11;
  RUIModalPresentationController *v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = objc_msgSend(v7, "ruiModalPresentationStyle");
  else
    v9 = 1;
  v10 = [RUIModalPresentationController alloc];
  -[RemoteUIController style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[RUIModalPresentationController initWithPresentedViewController:presentingViewController:modalPresentationStyle:style:](v10, "initWithPresentedViewController:presentingViewController:modalPresentationStyle:style:", v7, v8, v9, v11);

  -[RUIModalPresentationController setDelegate:](v12, "setDelegate:", self);
  return v12;
}

- (UIViewController)hostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (void)setLoader:(id)a3
{
  objc_storeStrong((id *)&self->_loader, a3);
}

- (NSString)userAgentString
{
  return self->_userAgentString;
}

- (void)setUserAgentString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (RemoteUIControllerDelegate)delegate
{
  return (RemoteUIControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)loadCompletion
{
  return self->_loadCompletion;
}

- (void)setLoadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURLSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (RUIStyle)style
{
  return self->_style;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong(&self->_loadCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_SMSAutoFillToken, 0);
  objc_storeStrong((id *)&self->_listeningForSMSIdentifier, 0);
  objc_storeStrong((id *)&self->_pageOriginatingLoad, 0);
  objc_storeStrong((id *)&self->_elementChangeHandlers, 0);
  objc_storeStrong((id *)&self->_modalObjectModels, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_modalNavigationController, 0);
}

- (void)_replacePagesOfObjectModel:byObjectModel:sourceArray:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E87000, v0, v1, "New Object Model is nil, cannot insert object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_replacePagesOfObjectModel:byObjectModel:sourceArray:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E87000, v0, v1, "firstPageIndex is NSNOTFound, cannot insert object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loader:(uint64_t)a3 didFinishLoadWithError:(uint64_t)a4 forRequest:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_209E87000, a2, a3, "Loader failed with error: %@", a5, a6, a7, a8, 2u);
}

- (void)loader:receivedObjectModel:topActionSignal:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E87000, v0, v1, "Push action with no nav controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loader:receivedObjectModel:topActionSignal:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E87000, v0, v1, "Pop action with no navigation controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loader:receivedObjectModel:topActionSignal:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E87000, v0, v1, "Pop + Replace requires at least 2 existing object models.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loader:receivedObjectModel:topActionSignal:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E87000, v0, v1, "Replace action with no navigation controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loader:(uint64_t)a3 receivedObjectModel:(uint64_t)a4 topActionSignal:(uint64_t)a5 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_209E87000, a2, a3, "Warning: Received unknown signal %@", a5, a6, a7, a8, 2u);
}

@end

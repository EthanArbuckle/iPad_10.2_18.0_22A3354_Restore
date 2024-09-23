@implementation TSSubFlowViewController

- (TSSubFlowViewController)initWithOptions:(id)a3 navigationController:(id)a4
{
  id v6;
  id v7;
  TSSubFlowViewController *v8;
  uint64_t v9;
  TSSIMSetupFlow *subFlow;
  void *v11;
  TSSubFlowViewController *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSSubFlowViewController;
  v8 = -[TSSubFlowViewController initWithTitle:detailText:icon:](&v14, sel_initWithTitle_detailText_icon_, &stru_24DEF4290, 0, 0);
  if (v8)
  {
    +[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    subFlow = v8->_subFlow;
    v8->_subFlow = (TSSIMSetupFlow *)v9;

    -[TSSIMSetupFlow setDelegate:](v8->_subFlow, "setDelegate:", v8);
    objc_msgSend(v6, "valueForKey:", CFSTR("FlowTypeKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_subFlowType = objc_msgSend(v11, "unsignedIntegerValue");

    -[TSSIMSetupFlow setNavigationController:](v8->_subFlow, "setNavigationController:", v7);
    v8->_isViewControllerPresenting = 0;
    v8->_isViewControllerPresented = 0;
    v12 = v8;
  }

  return v8;
}

- (TSSubFlowViewController)initWithFlow:(id)a3 navigationController:(id)a4
{
  id v7;
  id v8;
  TSSubFlowViewController *v9;
  TSSubFlowViewController *v10;
  id *p_subFlow;
  TSSubFlowViewController *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSSubFlowViewController;
  v9 = -[TSSubFlowViewController initWithTitle:detailText:icon:](&v14, sel_initWithTitle_detailText_icon_, &stru_24DEF4290, 0, 0);
  v10 = v9;
  if (v9)
  {
    p_subFlow = (id *)&v9->_subFlow;
    objc_storeStrong((id *)&v9->_subFlow, a3);
    objc_msgSend(*p_subFlow, "setDelegate:", v10);
    v10->_subFlowType = objc_msgSend(v7, "flowType");
    objc_msgSend(*p_subFlow, "setNavigationController:", v8);
    v10->_isViewControllerPresenting = 0;
    v10->_isViewControllerPresented = 0;
    v12 = v10;
  }

  return v10;
}

- (void)takeScreenShot:(id)a3
{
  UIViewController **p_prevViewController;
  id v5;
  UIView *v6;
  UIView *snapshot;
  id v8;

  p_prevViewController = &self->_prevViewController;
  v5 = a3;
  objc_storeWeak((id *)p_prevViewController, v5);
  objc_msgSend(v5, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "snapshotViewAfterScreenUpdates:", 0);
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  snapshot = self->_snapshot;
  self->_snapshot = v6;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSSubFlowViewController;
  -[TSOBWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  if (self->_snapshot)
  {
    -[TSSubFlowViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", self->_snapshot);

  }
  -[TSSubFlowViewController _presentFirstViewController](self, "_presentFirstViewController");
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:animated:", 1, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  id WeakRetained;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)TSSubFlowViewController;
  -[TSSubFlowViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[TSSubFlowViewController _presentFirstViewController](self, "_presentFirstViewController");
  if (self->_isViewControllerPresented)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[TSSubFlowViewController viewWillAppear:]";
      _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "user tap back to cancel @%s", buf, 0xCu);
    }

    -[TSSubFlowViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_prevViewController);
    v7 = (id)objc_msgSend(v5, "popToViewController:animated:", WeakRetained, 0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  UIViewController *firstViewController;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)TSSubFlowViewController;
  -[TSSubFlowViewController viewDidDisappear:](&v18, sel_viewDidDisappear_, a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TSSubFlowViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        if (*(UIViewController **)(*((_QWORD *)&v14 + 1) + 8 * i) == self->_firstViewController)
        {
          _TSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            firstViewController = self->_firstViewController;
            *(_DWORD *)buf = 138412546;
            v20 = (uint64_t)firstViewController;
            v21 = 2080;
            v22 = "-[TSSubFlowViewController viewDidDisappear:]";
            _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "%@ presented @%s", buf, 0x16u);
          }

          self->_isViewControllerPresented = 1;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v7);
  }

  if (!self->_usingFirstViewControllerParadigm)
  {
    _TSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      v21 = 2080;
      v22 = "-[TSSubFlowViewController viewDidDisappear:]";
      _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "flow %@ presents ViewController by itself @%s", buf, 0x16u);
    }

    self->_isViewControllerPresented = 1;
  }
}

- (void)_presentFirstViewController
{
  void *v3;
  NSObject *v4;
  UIViewController *firstViewController;
  void *v6;
  int v7;
  UIViewController *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_firstViewController)
  {
    if (!self->_isViewControllerPresenting)
    {
      -[TSSubFlowViewController navigationController](self, "navigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        self->_isViewControllerPresenting = 1;
        _TSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          firstViewController = self->_firstViewController;
          v7 = 138412546;
          v8 = firstViewController;
          v9 = 2080;
          v10 = "-[TSSubFlowViewController _presentFirstViewController]";
          _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "presenting : %@ @%s", (uint8_t *)&v7, 0x16u);
        }

        -[TSSubFlowViewController navigationController](self, "navigationController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pushViewController:animated:", self->_firstViewController, 1);

      }
    }
  }
}

- (void)prepare:(id)a3
{
  id v4;
  void *v5;
  TSSIMSetupFlow *subFlow;
  void *v7;
  void *v8;
  id *v9;
  TSSIMSetupFlow *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_subFlow)
  {
    objc_initWeak(&location, self);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_usingFirstViewControllerParadigm = 0;
      subFlow = self->_subFlow;
      -[TSSIMSetupFlow navigationController](subFlow, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "topViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __35__TSSubFlowViewController_prepare___block_invoke;
      v14[3] = &unk_24DEF3938;
      v15 = v5;
      -[TSSIMSetupFlow showFirstViewControllerWithHostController:completion:](subFlow, "showFirstViewControllerWithHostController:completion:", v8, v14);
      v9 = &v15;

    }
    else
    {
      self->_usingFirstViewControllerParadigm = 1;
      v10 = self->_subFlow;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __35__TSSubFlowViewController_prepare___block_invoke_2;
      v11[3] = &unk_24DEF41F0;
      v12 = v5;
      objc_copyWeak(&v13, &location);
      -[TSSIMSetupFlow firstViewController:](v10, "firstViewController:", v11);
      v9 = &v12;
      objc_destroyWeak(&v13);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __35__TSSubFlowViewController_prepare___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __35__TSSubFlowViewController_prepare___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setFirstViewController:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)backOption
{
  return 1;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  NSObject *v5;
  TSSIMSetupFlow *subFlow;
  id WeakRetained;
  id v8;
  NSObject *v9;
  int v10;
  TSSIMSetupFlow *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    subFlow = self->_subFlow;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = 138413058;
    v11 = subFlow;
    v12 = 2048;
    v13 = a3;
    v14 = 2112;
    v15 = WeakRetained;
    v16 = 2080;
    v17 = "-[TSSubFlowViewController simSetupFlowCompleted:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "sub flow %@ completed with type:%ld, delegate: %@ @%s", (uint8_t *)&v10, 0x2Au);

  }
  if (a3 == 3)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "attemptFailed");
    goto LABEL_12;
  }
  if (a3 == 2)
  {
LABEL_11:
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "viewControllerDidComplete:", self);
    goto LABEL_12;
  }
  if (a3 != 1)
  {
    _TSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[TSSubFlowViewController simSetupFlowCompleted:].cold.1(v9);

    goto LABEL_11;
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "userDidTapCancel");
LABEL_12:

}

- (unint64_t)subFlowType
{
  return self->_subFlowType;
}

- (void)setSubFlowType:(unint64_t)a3
{
  self->_subFlowType = a3;
}

- (TSSIMSetupFlow)subFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setSubFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (BOOL)isOfferFallbackFlow
{
  return self->_isOfferFallbackFlow;
}

- (void)setIsOfferFallbackFlow:(BOOL)a3
{
  self->_isOfferFallbackFlow = a3;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)firstViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setFirstViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (BOOL)isViewControllerPresenting
{
  return self->_isViewControllerPresenting;
}

- (void)setIsViewControllerPresenting:(BOOL)a3
{
  self->_isViewControllerPresenting = a3;
}

- (BOOL)isViewControllerPresented
{
  return self->_isViewControllerPresented;
}

- (void)setIsViewControllerPresented:(BOOL)a3
{
  self->_isViewControllerPresented = a3;
}

- (BOOL)usingFirstViewControllerParadigm
{
  return self->_usingFirstViewControllerParadigm;
}

- (void)setUsingFirstViewControllerParadigm:(BOOL)a3
{
  self->_usingFirstViewControllerParadigm = a3;
}

- (UIView)snapshot
{
  return (UIView *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setSnapshot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (UIViewController)prevViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_prevViewController);
}

- (void)setPrevViewController:(id)a3
{
  objc_storeWeak((id *)&self->_prevViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_prevViewController);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_firstViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subFlow, 0);
}

- (void)simSetupFlowCompleted:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSSubFlowViewController simSetupFlowCompleted:]";
  _os_log_fault_impl(&dword_21B647000, log, OS_LOG_TYPE_FAULT, "[F]unhandled completion type @%s", (uint8_t *)&v1, 0xCu);
}

@end

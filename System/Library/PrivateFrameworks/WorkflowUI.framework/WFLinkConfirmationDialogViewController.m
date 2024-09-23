@implementation WFLinkConfirmationDialogViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WFLinkConfirmationDialogViewController;
  -[WFLinkDialogViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("junior_link_confirmation_platter_view"));

  -[WFCompactDialogViewController request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrimaryText:", v5);

  objc_initWeak(&location, self);
  v7 = (void *)objc_opt_new();
  -[WFCompactDialogViewController request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "yesButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__WFLinkConfirmationDialogViewController_viewDidLoad__block_invoke;
  v17[3] = &unk_24E604D60;
  objc_copyWeak(&v18, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v9, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  -[WFCompactDialogViewController request](self, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "noButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __53__WFLinkConfirmationDialogViewController_viewDidLoad__block_invoke_2;
  v15[3] = &unk_24E604D60;
  objc_copyWeak(&v16, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v13, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v14);

  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v7);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)finishWithResponseCode:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC1528]), "initWithConfirmationResponseCode:", a3);
  -[WFCompactDialogViewController finishWithResponse:](self, "finishWithResponse:", v4);

}

- (id)snippetInteractedResponseWithURL:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC1528]), "initWithConfirmationResponseCode:", 0);
  else
    return 0;
}

void __53__WFLinkConfirmationDialogViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishWithResponseCode:", 1);

}

void __53__WFLinkConfirmationDialogViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishWithResponseCode:", 2);

}

@end

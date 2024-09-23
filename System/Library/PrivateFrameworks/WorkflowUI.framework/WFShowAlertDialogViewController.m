@implementation WFShowAlertDialogViewController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WFShowAlertDialogViewController;
  -[WFCompactDialogViewController loadView](&v18, sel_loadView);
  -[WFCompactDialogViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryText:", v4);

  objc_initWeak(&location, self);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v3, "cancelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    objc_msgSend(v3, "cancelButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __43__WFShowAlertDialogViewController_loadView__block_invoke;
    v15[3] = &unk_24E604D60;
    objc_copyWeak(&v16, &location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v9, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

    objc_destroyWeak(&v16);
  }
  objc_msgSend(v3, "okButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __43__WFShowAlertDialogViewController_loadView__block_invoke_2;
  v13[3] = &unk_24E604D60;
  objc_copyWeak(&v14, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v11, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v6);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __43__WFShowAlertDialogViewController_loadView__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1468]), "initWithCancelled:", 1);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

void __43__WFShowAlertDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1468]), "initWithCancelled:", 0);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

@end

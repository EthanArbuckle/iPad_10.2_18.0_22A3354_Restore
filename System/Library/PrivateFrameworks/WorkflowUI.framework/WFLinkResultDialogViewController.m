@implementation WFLinkResultDialogViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFLinkResultDialogViewController;
  -[WFLinkDialogViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("junior_link_result_platter_view"));

  v4 = (void *)objc_opt_new();
  objc_initWeak(&location, self);
  -[WFCompactDialogViewController request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doneButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__WFLinkResultDialogViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_24E604D60;
  objc_copyWeak(&v12, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v4);
  -[WFCompactDialogViewController request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __47__WFLinkResultDialogViewController_viewDidLoad__block_invoke_2;
  v10[3] = &unk_24E6042D0;
  v10[4] = self;
  objc_msgSend(v9, "getCATResultWithCompletionHandler:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)snippetInteractedResponseWithURL:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BEC1538];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRequestedOpenURL:", v4);

  return v5;
}

void __47__WFLinkResultDialogViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1538]), "initWithCancelled:", 0);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

void __47__WFLinkResultDialogViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "captionPrint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryText:", v3);

}

@end

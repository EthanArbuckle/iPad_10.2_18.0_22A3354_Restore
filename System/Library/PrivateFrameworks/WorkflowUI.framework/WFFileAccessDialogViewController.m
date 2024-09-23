@implementation WFFileAccessDialogViewController

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
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)WFFileAccessDialogViewController;
  -[WFCompactDialogViewController loadView](&v23, sel_loadView);
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
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __44__WFFileAccessDialogViewController_loadView__block_invoke;
    v20[3] = &unk_24E604D60;
    objc_copyWeak(&v21, &location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v9, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

    objc_destroyWeak(&v21);
  }
  objc_msgSend(v3, "okButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15 = 3221225472;
  v16 = __44__WFFileAccessDialogViewController_loadView__block_invoke_2;
  v17 = &unk_24E603EB8;
  objc_copyWeak(&v19, &location);
  v12 = v3;
  v18 = v12;
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v11, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v13, v14, v15, v16, v17);

  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v6);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __44__WFFileAccessDialogViewController_loadView__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3D08]), "initWithFileResponseCode:error:", 0, 0);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

void __44__WFFileAccessDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_alloc_init(MEMORY[0x24BEC3D10]);
  objc_msgSend(*(id *)(a1 + 32), "URLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workflowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__WFFileAccessDialogViewController_loadView__block_invoke_3;
  v6[3] = &unk_24E6049E8;
  v6[4] = WeakRetained;
  objc_msgSend(v3, "extendDocumentURLs:workflowID:completion:", v4, v5, v6);

}

void __44__WFFileAccessDialogViewController_loadView__block_invoke_3(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = objc_alloc(MEMORY[0x24BEC3D08]);
  if (a2)
  {
    v7 = 1;
    v8 = 0;
  }
  else
  {
    v7 = 2;
    v8 = v10;
  }
  v9 = (void *)objc_msgSend(v6, "initWithFileResponseCode:error:", v7, v8);
  objc_msgSend(v5, "finishWithResponse:", v9);

}

@end

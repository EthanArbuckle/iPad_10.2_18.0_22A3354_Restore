@implementation PKAccountDebugViewController

- (PKAccountDebugViewController)initWithConfiguration:(id)a3
{
  id v5;
  PKAccountDebugViewController *v6;
  PKAccountDebugViewController *v7;
  _PKAccountDebugViewController *v8;
  _PKAccountDebugViewController *viewController;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountDebugViewController;
  v6 = -[PKAccountDebugViewController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = -[_PKAccountDebugViewController initWithConfiguration:]([_PKAccountDebugViewController alloc], "initWithConfiguration:", v5);
    viewController = v7->_viewController;
    v7->_viewController = v8;

    -[PKAccountDebugViewController addChildViewController:](v7, "addChildViewController:", v7->_viewController);
    -[PKAccountDebugViewController navigationItem](v7, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", CFSTR("Account Diagnostics"));
    objc_msgSend(v10, "setLargeTitleDisplayMode:", 2);
    objc_msgSend(v10, "setBackButtonDisplayMode:", 2);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, v7, sel__handleShareButton_);
    objc_msgSend(v10, "setRightBarButtonItem:", v11);

  }
  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountDebugViewController;
  -[PKAccountDebugViewController loadView](&v5, sel_loadView);
  -[_PKAccountDebugViewController didMoveToParentViewController:](self->_viewController, "didMoveToParentViewController:", self);
  -[_PKAccountDebugViewController view](self->_viewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountDebugViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKAccountDebugViewController;
  -[PKAccountDebugViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[PKAccountDebugViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_PKAccountDebugViewController view](self->_viewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)_handleShareButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  PKAccountDebugViewController *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  -[PKAccountDebugViewController navigationItem](self, "navigationItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  v6 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountViewInterfaceConfiguration account](self->_config, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("account_transaction_report_%@.json"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "temporaryDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke;
  v28[3] = &unk_1E3E66A08;
  v28[4] = self;
  v15 = v7;
  v29 = v15;
  v16 = v13;
  v30 = v16;
  v17 = v10;
  v31 = v17;
  objc_msgSend(v6, "addOperation:", v28);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke_2;
  v23[3] = &unk_1E3E75CC8;
  v24 = v17;
  v25 = v15;
  v26 = v16;
  v27 = self;
  v19 = v16;
  v20 = v15;
  v21 = v17;
  v22 = (id)objc_msgSend(v6, "evaluateWithInput:completion:", v18, v23);

}

void __51__PKAccountDebugViewController__handleShareButton___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(id, id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithJSONObject:options:error:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "createFileAtPath:contents:attributes:", v11, v9, 0);

  if ((_DWORD)v10)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 48));
  v6[2](v6, v12, 0);

}

void __51__PKAccountDebugViewController__handleShareButton___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke_3;
  v4[3] = &unk_1E3E62460;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v2 = *(id *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v7 = v2;
  v8 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __51__PKAccountDebugViewController__handleShareButton___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItems:applicationActivities:", *(_QWORD *)(a1 + 32), 0);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke_4;
  v9[3] = &unk_1E3E64020;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "setCompletionWithItemsHandler:", v9);
  objc_msgSend(v2, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarButtonItem:", v6);

  v7 = *(void **)(a1 + 56);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke_5;
  v8[3] = &unk_1E3E612E8;
  v8[4] = v7;
  objc_msgSend(v7, "presentViewController:animated:completion:", v2, 1, v8);

}

uint64_t __51__PKAccountDebugViewController__handleShareButton___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
}

void __51__PKAccountDebugViewController__handleShareButton___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end

@implementation PKTransactionDebugDetailsTabBarController

- (PKTransactionDebugDetailsTabBarController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v7;
  id v8;
  PKTransactionDebugDetailsTabBarController *v9;
  PKTransactionDebugDetailsTabBarController *v10;
  PKPaymentTransaction **p_transaction;
  PKTransactionDebugDetailsViewController *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PKTransactionCloudKitDebugDetailsViewController *v17;
  PKTransactionCloudKitDebugDetailsViewController *cloudKitViewController;
  id v19;
  void *v20;
  PKTransactionSpotlightDebugDetailsViewController *v21;
  PKTransactionSpotlightDebugDetailsViewController *spotlightViewController;
  id v23;
  void *v24;
  void *v25;
  PKTransactionReceiptDebugViewController *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  UIBarButtonItem *shareButton;
  void *v33;
  objc_super v35;

  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PKTransactionDebugDetailsTabBarController;
  v9 = -[PKTransactionDebugDetailsTabBarController init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    p_transaction = &v9->_transaction;
    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v10->_transactionSourceCollection, a4);
    v12 = -[PKTransactionDebugDetailsViewController initWithTransaction:]([PKTransactionDebugDetailsViewController alloc], "initWithTransaction:", *p_transaction);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = objc_alloc_init(MEMORY[0x1E0DC3D40]);
    objc_msgSend(v14, "setTitle:", CFSTR("Wallet"));
    PKUIImageNamed(CFSTR("passes-inactive"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v15);

    PKUIImageNamed(CFSTR("passes-active"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSelectedImage:", v16);

    -[PKTransactionDebugDetailsViewController setTabBarItem:](v12, "setTabBarItem:", v14);
    objc_msgSend(v13, "addObject:", v12);
    v17 = -[PKTransactionCloudKitDebugDetailsViewController initWithTransaction:]([PKTransactionCloudKitDebugDetailsViewController alloc], "initWithTransaction:", *p_transaction);
    cloudKitViewController = v10->_cloudKitViewController;
    v10->_cloudKitViewController = v17;

    v19 = objc_alloc_init(MEMORY[0x1E0DC3D40]);
    objc_msgSend(v19, "setTitle:", CFSTR("CloudKit"));
    PKUIImageNamed(CFSTR("CloudTabBarItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:", v20);

    -[PKTransactionCloudKitDebugDetailsViewController setTabBarItem:](v10->_cloudKitViewController, "setTabBarItem:", v19);
    objc_msgSend(v13, "addObject:", v10->_cloudKitViewController);
    v21 = -[PKTransactionSpotlightDebugDetailsViewController initWithTransaction:]([PKTransactionSpotlightDebugDetailsViewController alloc], "initWithTransaction:", *p_transaction);
    spotlightViewController = v10->_spotlightViewController;
    v10->_spotlightViewController = v21;

    v23 = objc_alloc_init(MEMORY[0x1E0DC3D40]);
    objc_msgSend(v23, "setTitle:", CFSTR("Spotlight"));
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setImage:", v24);

    -[PKTransactionSpotlightDebugDetailsViewController setTabBarItem:](v10->_spotlightViewController, "setTabBarItem:", v23);
    objc_msgSend(v13, "addObject:", v10->_spotlightViewController);
    objc_msgSend(v7, "associatedReceiptUniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = -[PKTransactionReceiptDebugViewController initWithPaymentTransaction:]([PKTransactionReceiptDebugViewController alloc], "initWithPaymentTransaction:", v7);
      v27 = objc_alloc(MEMORY[0x1E0DC3D40]);
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("list.bullet"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "initWithTitle:image:selectedImage:", CFSTR("Receipt"), v28, 0);

      -[PKTransactionReceiptDebugViewController setTabBarItem:](v26, "setTabBarItem:", v29);
      objc_msgSend(v13, "addObject:", v26);

      v23 = (id)v29;
    }
    v30 = (void *)objc_msgSend(v13, "copy");
    -[PKTransactionDebugDetailsTabBarController setViewControllers:](v10, "setViewControllers:", v30);

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, v10, sel__handleShareButton_);
    shareButton = v10->_shareButton;
    v10->_shareButton = (UIBarButtonItem *)v31;

    -[PKTransactionDebugDetailsTabBarController navigationItem](v10, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRightBarButtonItem:", v10->_shareButton);

  }
  return v10;
}

- (void)_handleShareButton:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;

  -[UIBarButtonItem setEnabled:](self->_shareButton, "setEnabled:", 0);
  v4 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction identifier](self->_transaction, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transaction_%@.txt"), v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporaryDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke;
  v51[3] = &unk_1E3E66A08;
  v51[4] = self;
  v10 = v5;
  v52 = v10;
  v11 = v9;
  v53 = v11;
  v12 = v7;
  v54 = v12;
  v13 = v4;
  objc_msgSend(v4, "addOperation:", v51);
  v34 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cloudRecordObject_%@.txt"), v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "temporaryDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:", v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_2;
  v47[3] = &unk_1E3E66A08;
  v47[4] = self;
  v16 = v10;
  v48 = v16;
  v17 = v15;
  v49 = v17;
  v18 = v12;
  v50 = v18;
  v19 = v13;
  objc_msgSend(v13, "addOperation:", v47);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spotlight_%@.txt"), v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "temporaryDirectory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URLByAppendingPathComponent:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_4;
  v43[3] = &unk_1E3E66A08;
  v43[4] = self;
  v24 = v16;
  v44 = v24;
  v25 = v22;
  v45 = v25;
  v26 = v18;
  v46 = v26;
  objc_msgSend(v19, "addOperation:", v43);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v23;
  v37[1] = 3221225472;
  v37[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_6;
  v37[3] = &unk_1E3E66AA8;
  v37[4] = self;
  v38 = v26;
  v39 = v24;
  v40 = v11;
  v41 = v17;
  v42 = v25;
  v28 = v25;
  v29 = v17;
  v30 = v11;
  v31 = v24;
  v32 = v26;
  v33 = (id)objc_msgSend(v19, "evaluateWithInput:completion:", v27, v37);

}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "dictionaryRepresentation");
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

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1232);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_3;
  v13[3] = &unk_1E3E66A30;
  v13[1] = 3221225472;
  v14 = v8;
  v15 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v17 = v6;
  v18 = v7;
  v16 = v10;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "cloudRecordObjectDescriptionWithCompletion:", v13);

}

uint64_t __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v6, v7, 0);
  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1240);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_5;
  v13[3] = &unk_1E3E66A30;
  v13[1] = 3221225472;
  v14 = v8;
  v15 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v17 = v6;
  v18 = v7;
  v16 = v10;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v9, "spotlightObjectDescriptionWithCompletion:", v13);

}

uint64_t __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v6, v7, 0);
  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_7;
  v3[3] = &unk_1E3E66A80;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_7(uint64_t a1)
{
  PKReprocessMerchantActivity *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PKReprocessMerchantActivity *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = [PKReprocessMerchantActivity alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 1216);
  objc_msgSend(*(id *)(v3 + 1224), "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKReprocessMerchantActivity initWithTransaction:paymentPass:](v2, "initWithTransaction:paymentPass:", v4, v5);

  v7 = objc_alloc(MEMORY[0x1E0D96D28]);
  v8 = *(_QWORD *)(a1 + 40);
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithActivityItems:applicationActivities:", v8, v9);

  v11 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_8;
  v15[3] = &unk_1E3E66A58;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 72);
  objc_msgSend(v10, "setCompletionWithItemsHandler:", v15);
  objc_msgSend(v10, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBarButtonItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1208));

  v13 = *(void **)(a1 + 32);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_9;
  v14[3] = &unk_1E3E612E8;
  v14[4] = v13;
  objc_msgSend(v13, "presentViewController:animated:completion:", v10, 1, v14);

}

uint64_t __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);
}

uint64_t __64__PKTransactionDebugDetailsTabBarController__handleShareButton___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setEnabled:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_cloudKitViewController, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
}

@end

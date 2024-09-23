@implementation PKAccountTermsAndConditionsController

- (PKAccountTermsAndConditionsController)initWithAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 termsIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKAccountTermsAndConditionsController *v13;
  PKAccountTermsAndConditionsController *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountTermsAndConditionsController;
  v13 = -[PKAccountTermsAndConditionsController init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeStrong((id *)&v14->_webService, a4);
    objc_storeStrong((id *)&v14->_termsIdentifier, a6);
  }

  return v14;
}

- (void)termsViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id completionBlock;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = _Block_copy(v4);
    completionBlock = self->_completionBlock;
    self->_completionBlock = v6;

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__PKAccountTermsAndConditionsController_termsViewControllerWithCompletion___block_invoke;
    v8[3] = &unk_1E3E61DB8;
    objc_copyWeak(&v9, &location);
    -[PKAccountTermsAndConditionsController _fetchTermsDataWithCompletion:](self, "_fetchTermsDataWithCompletion:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __75__PKAccountTermsAndConditionsController_termsViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_loadViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(v4[5] + 16))();
    v6 = (void *)v4[5];
    v4[5] = 0;

  }
}

- (void)_fetchTermsDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentWebService *webService;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15[2];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Fetching terms for account %@", buf, 0xCu);

  }
  v7 = objc_alloc_init(MEMORY[0x1E0D669E8]);
  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseURL:", v8);

  objc_msgSend(v7, "setTermsIdentifier:", self->_termsIdentifier);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountIdentifier:", v9);

  objc_initWeak((id *)buf, self);
  v10 = (void *)-[PKAccount feature](self->_account, "feature");
  webService = self->_webService;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__PKAccountTermsAndConditionsController__fetchTermsDataWithCompletion___block_invoke;
  v13[3] = &unk_1E3E6DDF8;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = v10;
  v12 = v4;
  v14 = v12;
  -[PKPaymentWebService accountTermsDataWithRequest:completion:](webService, "accountTermsDataWithRequest:completion:", v7, v13);

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);

}

void __71__PKAccountTermsAndConditionsController__fetchTermsDataWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13[2];

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKAccountTermsAndConditionsController__fetchTermsDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E62A90;
  objc_copyWeak(v13, a1 + 5);
  v10 = v5;
  v11 = v6;
  v13[1] = a1[6];
  v12 = a1[4];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v13);
}

void __71__PKAccountTermsAndConditionsController__fetchTermsDataWithCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "termsData");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9[6];
    v9[6] = v3;

    objc_msgSend(*(id *)(a1 + 32), "termsDataFileName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v9[7];
    v9[7] = v5;

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v7, *(_QWORD *)(a1 + 64), 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    WeakRetained = v9;
  }

}

- (id)_loadViewController
{
  NSObject *v3;
  NSString *termsFileName;
  int v5;
  id *v6;
  void *v7;
  QLItem *v8;
  QLItem *pdfItem;
  id v10;
  void *v11;
  QLPreviewController *v12;
  QLPreviewController *previewController;
  QLPreviewController *v14;
  uint64_t v15;
  QLPreviewController *v16;
  QLItem *v18;
  uint8_t buf[4];
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_termsData)
    return 0;
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    termsFileName = self->_termsFileName;
    *(_DWORD *)buf = 138412290;
    v20 = termsFileName;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Loading terms for file name %@", buf, 0xCu);
  }

  v5 = -[NSData hasPDFMIMEType](self->_termsData, "hasPDFMIMEType");
  v6 = (id *)MEMORY[0x1E0CEC570];
  if (!v5)
    v6 = (id *)MEMORY[0x1E0CEC518];
  objc_msgSend(*v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (QLItem *)objc_msgSend(objc_alloc(_MergedGlobals_660()), "initWithDataProvider:contentType:previewTitle:", self, v7, self->_termsFileName);
  pdfItem = self->_pdfItem;
  self->_pdfItem = v8;

  v10 = objc_alloc((Class)off_1ED06C4C0());
  v18 = self->_pdfItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (QLPreviewController *)objc_msgSend(v10, "initWithPreviewItems:", v11);
  previewController = self->_previewController;
  self->_previewController = v12;

  -[QLPreviewController setDelegate:](self->_previewController, "setDelegate:", self);
  -[QLPreviewController setDataSource:](self->_previewController, "setDataSource:", self);
  v14 = self->_previewController;
  if (-[QLPreviewController pkui_userInterfaceIdiomSupportsLargeLayouts](v14, "pkui_userInterfaceIdiomSupportsLargeLayouts"))v15 = 2;
  else
    v15 = 3;
  -[QLPreviewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", v15);
  v16 = self->_previewController;

  return v16;
}

- (id)provideDataForItem:(id)a3
{
  return self->_termsData;
}

- (void)previewControllerWillDismiss:(id)a3
{
  QLPreviewController *previewController;

  -[QLPreviewController dismissViewControllerAnimated:completion:](self->_previewController, "dismissViewControllerAnimated:completion:", 1, 0);
  previewController = self->_previewController;
  self->_previewController = 0;

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return self->_pdfItem != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  return self->_pdfItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_pdfItem, 0);
  objc_storeStrong((id *)&self->_termsFileName, 0);
  objc_storeStrong((id *)&self->_termsData, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end

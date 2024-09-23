@implementation SKUIReviewInAppController

- (SKUIReviewInAppController)init
{
  SKUIReviewInAppConfiguration *v3;
  SKUIReviewInAppController *v4;

  v3 = objc_alloc_init(SKUIReviewInAppConfiguration);
  v4 = -[SKUIReviewInAppController initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (SKUIReviewInAppController)initWithConfiguration:(id)a3
{
  id v5;
  SKUIReviewInAppController *v6;
  SKUIReviewInAppController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIReviewInAppController;
  v6 = -[SKUIReviewInAppController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (void)start
{
  SKUIProductReviewURLProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SKUIProductReviewURLProvider *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = [SKUIProductReviewURLProvider alloc];
  -[SKUIReviewInAppController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SKUIProductReviewURLProvider initWithClientContext:itemID:](v3, "initWithClientContext:itemID:", v5, v7);
  -[SKUIReviewInAppController setReviewURLProvider:](self, "setReviewURLProvider:", v8);

  -[SKUIReviewInAppController reviewURLProvider](self, "reviewURLProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__SKUIReviewInAppController_start__block_invoke;
  v10[3] = &unk_1E73A6970;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "fetchURLsWithCompletion:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __34__SKUIReviewInAppController_start__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD v4[4];
  id v5;
  char v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SKUIReviewInAppController_start__block_invoke_2;
  v4[3] = &unk_1E73A60E0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v6 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
}

void __34__SKUIReviewInAppController_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(WeakRetained, "_presentRatingPrompt");
  else
    objc_msgSend(WeakRetained, "_finishWithResult:error:", 0, 0);

}

- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4
{
  -[SKUIReviewInAppController _presentAlertForDialog:](self, "_presentAlertForDialog:", a4);
}

- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4
{
  -[SKUIReviewInAppController _presentAlertForDialog:](self, "_presentAlertForDialog:", a4);
}

- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4
{
  id v6;
  float v7;
  float v8;

  v6 = a3;
  objc_msgSend(a4, "rating");
  v8 = v7;
  if (v7 < 0.00000011921)
    -[SKUIReviewInAppController _promptForStarRatingDuringCompose:](self, "_promptForStarRatingDuringCompose:", v6);

  return v8 >= 0.00000011921;
}

- (void)composeReviewViewControllerDidCancel:(id)a3
{
  -[SKUIReviewInAppController _composeReviewViewControllerDidFinish:result:](self, "_composeReviewViewControllerDidFinish:result:", a3, 1);
}

- (void)composeReviewViewControllerDidSubmit:(id)a3
{
  -[SKUIReviewInAppController _composeReviewViewControllerDidFinish:result:](self, "_composeReviewViewControllerDidFinish:result:", a3, 3);
}

- (void)_composeReviewViewControllerDidFinish:(id)a3 result:(unint64_t)a4
{
  id v6;
  SKUIComposeReviewViewController *composeViewController;
  _QWORD v8[4];
  id v9[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SKUIReviewInAppController__composeReviewViewControllerDidFinish_result___block_invoke;
  v8[3] = &unk_1E73A2FA8;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a4;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);
  composeViewController = self->_composeViewController;
  self->_composeViewController = 0;

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

}

void __74__SKUIReviewInAppController__composeReviewViewControllerDidFinish_result___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishWithResult:error:", *(_QWORD *)(a1 + 40), 0);

}

- (void)_finishWithResult:(unint64_t)a3 error:(id)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a4;
  -[SKUIReviewInAppController completion](self, "completion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKUIReviewInAppController completion](self, "completion");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, unint64_t, id))v7)[2](v7, a3, v8);

  }
}

- (void)_presentRatingPrompt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SKUIReviewInAppRatingViewController *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD aBlock[4];
  id v34;
  id location;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_RATE_TITLE"), &stru_1E73A9FB0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IN_APP_REVIEW_RATE_MESSAGE"), &stru_1E73A9FB0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppController configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v8;
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[SKUIReviewInAppController configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@\n%@"), v13, v8, v8);
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = v8;
  }

  -[SKUIReviewInAppController configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "icon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SKUIReviewInAppController__presentRatingPrompt__block_invoke;
  aBlock[3] = &unk_1E73A6998;
  objc_copyWeak(&v34, &location);
  v17 = _Block_copy(aBlock);
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = __49__SKUIReviewInAppController__presentRatingPrompt__block_invoke_2;
  v31[3] = &unk_1E73A69C0;
  objc_copyWeak(&v32, &location);
  v18 = _Block_copy(v31);
  v19 = -[SKUIReviewInAppRatingViewController initWithTitle:message:icon:]([SKUIReviewInAppRatingViewController alloc], "initWithTitle:message:icon:", v30, v29, v15);
  -[SKUIReviewInAppController setRatingViewController:](self, "setRatingViewController:", v19);

  -[SKUIReviewInAppController configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isSandboxed");
  -[SKUIReviewInAppController ratingViewController](self, "ratingViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDisableSubmit:", v21);

  -[SKUIReviewInAppController ratingViewController](self, "ratingViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setRatingHandler:", v17);

  -[SKUIReviewInAppController ratingViewController](self, "ratingViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCompletion:", v18);

  -[SKUIReviewInAppController configuration](self, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "viewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppController ratingViewController](self, "ratingViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "presentViewController:animated:completion:", v27, 1, 0);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

void __49__SKUIReviewInAppController__presentRatingPrompt__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_submitRating:completion:", a2, v5);

}

void __49__SKUIReviewInAppController__presentRatingPrompt__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  switch(a2)
  {
    case 0:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2D50];
      v10[0] = CFSTR("An error occurred while submitting an in app rating.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", 0x1E73BC410, 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "_finishWithResult:error:", 0, v7);
      break;
    case 1:
      v8 = 1;
      goto LABEL_5;
    case 2:
      v8 = 2;
LABEL_5:
      objc_msgSend(WeakRetained, "_finishWithResult:error:", v8, 0);
      break;
    case 3:
      objc_msgSend(WeakRetained, "_presentReviewComposer");
      break;
    default:
      break;
  }

}

- (void)_presentReviewComposer
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[SKUIReviewInAppConfiguration viewController](self->_configuration, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppConfiguration itemID](self->_configuration, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SKUIReviewInAppController__presentReviewComposer__block_invoke;
  v5[3] = &unk_1E73A69E8;
  objc_copyWeak(&v6, &location);
  -[SKUIReviewInAppController presentReviewComposerRedesign:appID:completion:](self, "presentReviewComposerRedesign:appID:completion:", v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__SKUIReviewInAppController__presentReviewComposer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_finishWithResult:error:", a2, v5);

}

- (void)_submitRating:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  SKUIReviewConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SKUIReviewConfiguration *v13;
  SKUIStarRatingQueue *v14;
  void *v15;
  void *v16;
  SKUIStarRatingQueue *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SKUIReviewInAppController starRatingQueue](self, "starRatingQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [SKUIReviewConfiguration alloc];
    v29 = CFSTR("inlineRatingUrl");
    -[SKUIReviewInAppController reviewURLProvider](self, "reviewURLProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rateURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SKUIReviewConfiguration initWithConfigurationDictionary:](v8, "initWithConfigurationDictionary:", v12);

    v14 = [SKUIStarRatingQueue alloc];
    -[SKUIReviewInAppController configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clientContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SKUIStarRatingQueue initWithClientContext:reviewConfiguration:](v14, "initWithClientContext:reviewConfiguration:", v16, v13);
    -[SKUIReviewInAppController setStarRatingQueue:](self, "setStarRatingQueue:", v17);

    -[SKUIReviewInAppController configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIReviewInAppController starRatingQueue](self, "starRatingQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWindow:", v21);

  }
  -[SKUIReviewInAppController starRatingQueue](self, "starRatingQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReviewInAppController configuration](self, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "itemID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __54__SKUIReviewInAppController__submitRating_completion___block_invoke;
  v27[3] = &unk_1E73A6A10;
  v28 = v6;
  v26 = v6;
  objc_msgSend(v23, "setRating:forItemID:completionBlock:", a3, v25, v27);

}

void __54__SKUIReviewInAppController__submitRating_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SKUIReviewInAppController__submitRating_completion___block_invoke_2;
  v3[3] = &unk_1E73A33F8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __54__SKUIReviewInAppController__submitRating_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)_presentWriteReview
{
  SKUIComposeReviewViewController **p_composeViewController;
  SKUIComposeReviewViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, char, void *);
  void *v12;
  id v13;
  id location;

  p_composeViewController = &self->_composeViewController;
  if (!self->_composeViewController)
  {
    v4 = objc_alloc_init(SKUIComposeReviewViewController);
    -[SKUIComposeReviewViewController setDelegate:](v4, "setDelegate:", self);
    objc_storeStrong((id *)p_composeViewController, v4);
    objc_initWeak(&location, self);
    -[SKUIReviewInAppController reviewURLProvider](self, "reviewURLProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeReviewURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __48__SKUIReviewInAppController__presentWriteReview__block_invoke;
    v12 = &unk_1E73A2028;
    objc_copyWeak(&v13, &location);
    -[SKUIComposeReviewViewController loadReviewWithURL:completionBlock:](v4, "loadReviewWithURL:completionBlock:", v6, &v9);

    -[SKUIReviewInAppController configuration](self, "configuration", v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentViewController:animated:completion:", v4, 1, 0);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __48__SKUIReviewInAppController__presentWriteReview__block_invoke(uint64_t a1, char a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if ((a2 & 1) == 0)
    objc_msgSend(WeakRetained, "_finishWithResult:error:", 0, v7);

}

- (void)_presentAlertForDialog:(id)a3
{
  id v4;
  SKUIStoreDialogController *dialogController;
  SKUIStoreDialogController *v6;
  SKUIStoreDialogController *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    dialogController = self->_dialogController;
    if (!dialogController)
    {
      v6 = objc_alloc_init(SKUIStoreDialogController);
      v7 = self->_dialogController;
      self->_dialogController = v6;

      dialogController = self->_dialogController;
    }
    -[SKUIReviewInAppController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStoreDialogController presentDialog:fromViewController:](dialogController, "presentDialog:fromViewController:", v10, v9);

    v4 = v10;
  }

}

- (void)_promptForStarRatingDuringCompose:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, int, float);
  void *v8;
  id v9;
  id location;

  v3 = a3;
  objc_initWeak(&location, v3);
  objc_msgSend(MEMORY[0x1E0CD8050], "starRatingAlertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __63__SKUIReviewInAppController__promptForStarRatingDuringCompose___block_invoke;
  v8 = &unk_1E73A6A38;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "setCompletion:", &v5);
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __63__SKUIReviewInAppController__promptForStarRatingDuringCompose___block_invoke(uint64_t a1, int a2, float a3)
{
  double v4;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(float *)&v4 = a3;
    objc_msgSend(WeakRetained, "setRating:", v4);
    objc_msgSend(WeakRetained, "submitReview");

  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SKUIReviewInAppConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SKUIReviewInAppRatingViewController)ratingViewController
{
  return self->_ratingViewController;
}

- (void)setRatingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_ratingViewController, a3);
}

- (SKUIComposeReviewViewController)composeViewController
{
  return self->_composeViewController;
}

- (void)setComposeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_composeViewController, a3);
}

- (SKUIStoreDialogController)dialogController
{
  return self->_dialogController;
}

- (void)setDialogController:(id)a3
{
  objc_storeStrong((id *)&self->_dialogController, a3);
}

- (SKUIProductReviewURLProvider)reviewURLProvider
{
  return self->_reviewURLProvider;
}

- (void)setReviewURLProvider:(id)a3
{
  objc_storeStrong((id *)&self->_reviewURLProvider, a3);
}

- (SKUIStarRatingQueue)starRatingQueue
{
  return self->_starRatingQueue;
}

- (void)setStarRatingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_starRatingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starRatingQueue, 0);
  objc_storeStrong((id *)&self->_reviewURLProvider, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_ratingViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)presentReviewComposerRedesign:(id)a3 appID:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  SKUIReviewInAppController *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_1BBEA094C();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_1BBE5F2D4(a3, v9, (uint64_t)a4, v12, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

@end

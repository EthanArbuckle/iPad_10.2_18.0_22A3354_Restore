@implementation PKPayLaterView

- (PKPayLaterView)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode
{
  NSDecimalNumber *v7;
  NSString *v8;
  PKPayLaterView *v9;
  NSObject *v10;
  uint64_t v11;
  PKPayLaterMerchandisingUtilities *utilities;
  uint64_t v13;
  UIActivityIndicatorView *spinner;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSDecimalNumber *v24;
  objc_super v25;
  _QWORD v26[2];
  uint8_t buf[4];
  NSDecimalNumber *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = amount;
  v8 = currencyCode;
  v25.receiver = self;
  v25.super_class = (Class)PKPayLaterView;
  v9 = -[PKPayLaterView init](&v25, sel_init);
  if (v9)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Creating PKPayLaterView with amount %@ and currencyCode %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D67038], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    v24 = v7;
    utilities = v9->_utilities;
    v9->_utilities = (PKPayLaterMerchandisingUtilities *)v11;

    -[PKPayLaterView _registerForUserInterfaceStyleChanges](v9, "_registerForUserInterfaceStyleChanges");
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v9->_spinner;
    v9->_spinner = (UIActivityIndicatorView *)v13;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v9->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView startAnimating](v9->_spinner, "startAnimating");
    -[UIActivityIndicatorView sizeToFit](v9->_spinner, "sizeToFit");
    -[PKPayLaterView addSubview:](v9, "addSubview:", v9->_spinner);
    +[PKPayLaterView showSpinnerView:spinnerView:showWebView:webView:animate:completion:](PKPayLaterView, "showSpinnerView:spinnerView:showWebView:webView:animate:completion:", 1, v9->_spinner, 0, v9->_webView, 0, 0);
    objc_storeStrong((id *)&v9->_amount, amount);
    objc_storeStrong((id *)&v9->_currencyCode, currencyCode);
    v9->_displayStyle = 0;
    v9->_action = 0;
    v9->_theme = 0;
    v9->_environmentType = 0;
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[UIActivityIndicatorView centerXAnchor](v9->_spinner, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterView centerXAnchor](v9, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    -[UIActivityIndicatorView centerYAnchor](v9->_spinner, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterView centerYAnchor](v9, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v22);

    v7 = v24;
  }

  return v9;
}

- (void)setAmount:(NSDecimalNumber *)amount
{
  NSDecimalNumber *v5;
  NSObject *v6;
  int v7;
  NSDecimalNumber *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = amount;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, amount);
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView amount to %@", (uint8_t *)&v7, 0xCu);
    }

    -[PKPayLaterView _reloadViewContentsForProperty:completion:](self, "_reloadViewContentsForProperty:completion:", 1, 0);
  }

}

- (void)setCurrencyCode:(NSString *)currencyCode
{
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  NSObject *v11;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = currencyCode;
  v6 = self->_currencyCode;
  v7 = v5;
  v8 = v6;
  if (v8 == v7)
  {

  }
  else
  {
    v9 = v8;
    if (v7 && v8)
    {
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_currencyCode, currencyCode);
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView currencyCode to %@", (uint8_t *)&v12, 0xCu);
    }

    -[PKPayLaterView _reloadViewContentsForProperty:completion:](self, "_reloadViewContentsForProperty:completion:", 2, 0);
  }
LABEL_11:

}

- (void)setDisplayStyle:(PKPayLaterDisplayStyle)displayStyle
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_displayStyle != displayStyle)
  {
    self->_displayStyle = displayStyle;
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      PKPayLaterDisplayStyleToString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView displayStyle to %@", (uint8_t *)&v6, 0xCu);

    }
    -[PKPayLaterView _reloadViewContentsForProperty:completion:](self, "_reloadViewContentsForProperty:completion:", 16, 0);
  }
}

- (void)setAction:(PKPayLaterAction)action
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_action != action)
  {
    self->_action = action;
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      PKPayLaterActionToString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView action to %@", (uint8_t *)&v6, 0xCu);

    }
    -[PKPayLaterView _reloadViewContentsForProperty:completion:](self, "_reloadViewContentsForProperty:completion:", 64, 0);
  }
}

- (void)setTheme:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_theme != a3)
  {
    self->_theme = a3;
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      PKPayLaterThemeToString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView theme to %@", (uint8_t *)&v6, 0xCu);

    }
    -[PKPayLaterView _reloadViewContentsForProperty:completion:](self, "_reloadViewContentsForProperty:completion:", 32, 0);
  }
}

- (void)setEnvironmentType:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_environmentType != a3)
  {
    self->_environmentType = a3;
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      PKPayLaterEnvironmentTypeToString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView environmentType to %@", (uint8_t *)&v6, 0xCu);

    }
    -[PKPayLaterView _reloadViewContentsForProperty:completion:](self, "_reloadViewContentsForProperty:completion:", 128, 0);
  }
}

- (void)setInternalDelegate:(id)a3
{
  self->_internalDelegate = (PKPayLaterViewInternalDelegate *)a3;
  self->_delegate = (PKPayLaterViewDelegate *)a3;
}

- (void)_reloadViewContentsForProperty:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14[2];
  _QWORD aBlock[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PKPayLaterView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKPayLaterView _configuration](self, "_configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      PKPayLaterMerchandisingConfigurationPropertyToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKPayLaterView reloading for property %@ and configuration %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke;
    aBlock[3] = &unk_1E3E74458;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v6;
    v11 = _Block_copy(aBlock);
    objc_copyWeak(v14, (id *)buf);
    v13 = v11;
    v14[1] = (id)a3;
    v12 = v8;
    PKPayLaterValidateConfiguration();

    objc_destroyWeak(v14);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
}

void __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _BYTE *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  BOOL v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(*((id *)WeakRetained + 64), "payLaterView:didUpdateViewWithInvalidProperties:", WeakRetained, v6),
        v8[432]))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_2;
    v10[3] = &unk_1E3E6C5E8;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    v14 = v5 == 0;
    v12 = *(id *)(a1 + 32);
    v11 = v5;
    objc_msgSend(v8, "_recalculateSizeWithCompletion:", v10);

    objc_destroyWeak(&v13);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }

}

void __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_2(uint64_t a1)
{
  uint64_t *WeakRetained;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[53];
    v5 = WeakRetained[52];
    v6 = *(unsigned __int8 *)(a1 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_3;
    v7[3] = &unk_1E3E618A0;
    v9 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    +[PKPayLaterView showSpinnerView:spinnerView:showWebView:webView:animate:completion:](PKPayLaterView, "showSpinnerView:spinnerView:showWebView:webView:animate:completion:", 0, v4, v6, v5, 1, v7);

  }
}

uint64_t __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  void (*v9)(void);
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  if (v5)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_5:
    v9();
    goto LABEL_13;
  }
  objc_msgSend(WeakRetained, "_javaScriptQueryForUpdatedConfigurationProperty:configuration:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length") && *(_QWORD *)(*(_QWORD *)(a1 + 40) + 416))
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPayLaterView evaluating javascript query \"%@\", buf, 0xCu);
    }

    v12 = (void *)v8[52];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_13;
    v13[3] = &unk_1E3E74480;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v12, "evaluateJavaScript:completionHandler:", v10, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

LABEL_13:
}

void __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Javascript query evaluation response %@, error: %@", buf, 0x16u);
  }

  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D6A758];
    v10 = *MEMORY[0x1E0CB3388];
    v13[0] = *MEMORY[0x1E0CB2D50];
    v13[1] = v10;
    v14[0] = CFSTR("Error updating view with configuration");
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)clearWebViewCache
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPayLaterView clearing website data store cache", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CEF650], "defaultDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CEF7B8], *MEMORY[0x1E0CEF7D0], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDataOfTypes:modifiedSince:completionHandler:", v5, v6, &__block_literal_global_170);

  -[PKPayLaterMerchandisingUtilities clearWebRequestCache](self->_utilities, "clearWebRequestCache");
}

- (void)didMoveToWindow
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterView;
  -[PKPayLaterView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[PKPayLaterView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __33__PKPayLaterView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E3E61DB8;
    objc_copyWeak(&v5, &location);
    -[PKPayLaterView _reloadViewContentsForProperty:completion:](self, "_reloadViewContentsForProperty:completion:", 255, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __33__PKPayLaterView_didMoveToWindow__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEF630]);
    objc_msgSend(WeakRetained, "_webViewConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFrame:configuration:", v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v9 = WeakRetained[52];
    WeakRetained[52] = (id)v8;

    objc_msgSend(WeakRetained[52], "setUIDelegate:", WeakRetained);
    objc_msgSend(WeakRetained[52], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(WeakRetained[52], "setNavigationDelegate:", WeakRetained);
    v10 = WeakRetained[52];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__PKPayLaterView_didMoveToWindow__block_invoke_2;
    v11[3] = &unk_1E3E61310;
    objc_copyWeak(&v12, v4);
    objc_msgSend(WeakRetained, "_setupWebView:completion:", v10, v11);
    objc_destroyWeak(&v12);
  }

}

void __33__PKPayLaterView_didMoveToWindow__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
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
  void *v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addSubview:", WeakRetained[52]);
    v12 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v2[52], "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    objc_msgSend(v2[52], "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "leadingAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v4;
    objc_msgSend(v2[52], "bottomAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v7;
    objc_msgSend(v2[52], "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v11);

    objc_msgSend(v2, "setNeedsLayout");
  }

}

- (CGSize)intrinsicContentSize
{
  double v3;
  CGSize *p_size;
  UIActivityIndicatorView *spinner;
  double v6;
  double v7;
  double width;
  double v9;
  double height;
  CGSize result;

  if (self->_didFinishInitialViewLoad)
  {
    -[WKWebView alpha](self->_webView, "alpha");
    if (v3 > 0.0)
    {
      p_size = &self->_size;
LABEL_9:
      width = p_size->width;
      height = p_size->height;
      goto LABEL_10;
    }
    -[UIActivityIndicatorView alpha](self->_spinner, "alpha");
    if (v6 <= 0.0)
    {
      p_size = (CGSize *)MEMORY[0x1E0C9D820];
      goto LABEL_9;
    }
    spinner = self->_spinner;
  }
  else
  {
    spinner = self->_spinner;
  }
  -[UIActivityIndicatorView frame](spinner, "frame");
  width = v7;
  height = v9;
LABEL_10:
  result.height = height;
  result.width = width;
  return result;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView finished loading", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  self->_didFinishInitialViewLoad = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PKPayLaterView_webView_didFinishNavigation___block_invoke;
  v9[3] = &unk_1E3E61310;
  objc_copyWeak(&v10, buf);
  -[PKPayLaterView _recalculateSizeWithCompletion:](self, "_recalculateSizeWithCompletion:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

void __46__PKPayLaterView_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    +[PKPayLaterView showSpinnerView:spinnerView:showWebView:webView:animate:completion:](PKPayLaterView, "showSpinnerView:spinnerView:showWebView:webView:animate:completion:", 0, WeakRetained[53], 1, WeakRetained[52], 1, 0);
    WeakRetained = v2;
  }

}

- (void)webViewDidClose:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPayLaterView did close web view", v4, 2u);
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, uint64_t);
  PKPayLaterMerchandisingUtilities *utilities;
  unint64_t environmentType;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, uint64_t))a5;
  utilities = self->_utilities;
  environmentType = self->_environmentType;
  v10 = a4;
  -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](utilities, "merchandisingBaseURLForEnviornmentType:", environmentType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v13;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKPayLaterView deciding policy for action: \"%@\", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(v13, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  if (v17 == v18)
  {

    v21 = 1;
LABEL_12:

    goto LABEL_14;
  }
  v19 = v18;
  if (!v17 || !v18)
  {

    goto LABEL_10;
  }
  v20 = objc_msgSend(v17, "isEqualToString:", v18);

  if ((v20 & 1) == 0)
  {
LABEL_10:
    if (!v13)
    {
      v21 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "openURL:withOptions:", v13, 0);
    v21 = 0;
    goto LABEL_12;
  }
  v21 = 1;
LABEL_14:
  v7[2](v7, v21);

}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  void *v11;
  void *v12;
  PKPayLaterMerchandisingModalViewController *v13;
  PKPayLaterMerchandisingModalViewController *v14;
  PKPayLaterMerchandisingModalViewController *v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  PKPayLaterMerchandisingModalViewController *v20;
  void *v21;
  PKNavigationController *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterView received script message with name \"%@\", (uint8_t *)&v26, 0xCu);
  }

  v8 = v6;
  v9 = v8;
  if (v8 == CFSTR("applePayDetails")
    || v8
    && (v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("applePayDetails")), v9, v10))
  {
    objc_msgSend(v5, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)*MEMORY[0x1E0D6AC48];
      v13 = v9;
      v14 = v12;
      if (v13 == v14)
      {

LABEL_16:
        v17 = v11;
        if (v17 != CFSTR("show-modal"))
        {
          v18 = v17;
          v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("show-modal"));

          if (!v19)
            goto LABEL_28;
        }
        v20 = [PKPayLaterMerchandisingModalViewController alloc];
        -[PKPayLaterView _configuration](self, "_configuration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PKPayLaterMerchandisingModalViewController initWithConfiguration:](v20, "initWithConfiguration:", v21);

        v22 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v13);
        PKUIKeyWindow();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "rootViewController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v26 = 138412290;
            v27 = v25;
            _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterView presenting modal view controller with rootVC %@", (uint8_t *)&v26, 0xCu);
          }

          objc_msgSend(v25, "presentViewController:animated:completion:", v22, 1, 0);
        }
        else
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterView cannot find window to present modal view controller", (uint8_t *)&v26, 2u);
          }
          v25 = v7;
        }

        goto LABEL_27;
      }
      v15 = v14;
      if (v13 && v14)
      {
        v16 = -[PKPayLaterMerchandisingModalViewController isEqualToString:](v13, "isEqualToString:", v14);

        if (!v16)
          goto LABEL_28;
        goto LABEL_16;
      }

    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterView received script message with a nil message body", (uint8_t *)&v26, 2u);
      }
      v13 = (PKPayLaterMerchandisingModalViewController *)v7;
    }
LABEL_27:

LABEL_28:
  }

}

- (id)_javaScriptQueryForUpdatedConfigurationProperty:(unint64_t)a3 configuration:(id)a4
{
  id v6;
  id v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3)
  {
    v8 = 1;
    v9 = 1;
    do
    {
      if ((v9 & a3) != 0)
      {
        objc_msgSend(v6, "stringValueForProperty:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PKPayLaterMerchandisingConfigurationPropertyToString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterMerchandisingUtilities generateJavaScriptQueryForUpdatedProperty:newValue:](self->_utilities, "generateJavaScriptQueryForUpdatedProperty:newValue:", v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safelyAddObject:", v12);

      }
      v9 = 1 << v8++;
    }
    while (v9 <= a3);
  }
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_registerForUserInterfaceStyleChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PKPayLaterView__registerForUserInterfaceStyleChanges__block_invoke;
  v5[3] = &unk_1E3E744F0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v4 = (id)-[PKPayLaterView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__PKPayLaterView__registerForUserInterfaceStyleChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id WeakRetained;
  NSObject *v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = objc_msgSend(v5, "userInterfaceStyle");
  if (v8 != v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = v7;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPayLaterView did change trait collection to %ld", (uint8_t *)&v12, 0xCu);
      }

      if (v7 >= 3)
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528);
      else
        v11 = v7;
      objc_msgSend(WeakRetained, "setTheme:", v11);
    }

  }
}

+ (void)showSpinnerView:(BOOL)a3 spinnerView:(id)a4 showWebView:(BOOL)a5 webView:(id)a6 animate:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v11;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  double v32;
  double v33;

  v9 = a7;
  v11 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke;
  aBlock[3] = &unk_1E3E74518;
  v17 = v14;
  v30 = v17;
  v32 = (double)v11;
  v18 = v13;
  v31 = v18;
  v33 = (double)v12;
  v19 = (void (**)(_QWORD))_Block_copy(aBlock);
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_2;
  v27[3] = &unk_1E3E61590;
  v20 = v15;
  v28 = v20;
  v21 = (void (**)(_QWORD))_Block_copy(v27);
  if (v9)
  {
    v22 = (void *)MEMORY[0x1E0DC3F10];
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_3;
    v25[3] = &unk_1E3E61590;
    v26 = v19;
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_4;
    v23[3] = &unk_1E3E614F0;
    v24 = v21;
    objc_msgSend(v22, "pkui_animateUsingOptions:animations:completion:", 4, v25, v23);

  }
  else
  {
    v19[2](v19);
    v21[2](v21);
  }

}

uint64_t __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 56));
}

uint64_t __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (id)_webViewConfiguration
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  v3 = *MEMORY[0x1E0D6AC48];
  v4 = objc_alloc_init(MEMORY[0x1E0CEF608]);
  objc_msgSend(v4, "addScriptMessageHandler:name:", self, v3);
  v5 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  v6 = objc_alloc_init(MEMORY[0x1E0CEF5F8]);
  objc_msgSend(v5, "setProcessPool:", v6);

  objc_msgSend(v5, "setApplicationNameForUserAgent:", v3);
  v7 = objc_alloc_init(MEMORY[0x1E0CEF5F0]);
  objc_msgSend(v5, "setPreferences:", v7);

  objc_msgSend(v5, "setUserContentController:", v4);
  objc_msgSend(v5, "defaultWebpagePreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsContentJavaScript:", 1);

  return v5;
}

- (void)_setupWebView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPayLaterMerchandisingUtilities *utilities;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self->_utilities, "merchandisingBaseURLForEnviornmentType:", self->_environmentType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  utilities = self->_utilities;
  -[PKPayLaterView _configuration](self, "_configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__PKPayLaterView__setupWebView_completion___block_invoke;
  v13[3] = &unk_1E3E63CB8;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  -[PKPayLaterMerchandisingUtilities merchandisingWidgetHTMLWithConfiguration:completion:](utilities, "merchandisingWidgetHTMLWithConfiguration:completion:", v10, v13);

}

void __43__PKPayLaterView__setupWebView_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PKPayLaterView__setupWebView_completion___block_invoke_2;
  v6[3] = &unk_1E3E622D8;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v4 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __43__PKPayLaterView__setupWebView_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setOpaque:", 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setAllowsLinkPreview:", 0);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "loadHTMLString:baseURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v5);

  objc_msgSend(v8, "pinchGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  objc_msgSend(v8, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v8, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v8, "setMultipleTouchEnabled:", 0);
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

- (void)_recalculateSizeWithCompletion:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[6];
  id v15;
  _QWORD v16[6];
  id v17;
  _QWORD v18[5];
  id location;
  _QWORD v20[4];
  CGSize size;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3010000000;
  v20[3] = &unk_19E0C78CE;
  size = self->_size;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke;
  v18[3] = &unk_1E3E67120;
  v18[4] = self;
  objc_msgSend(v5, "addOperation:", v18);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_52;
  v16[3] = &unk_1E3E6AC28;
  v16[4] = self;
  objc_copyWeak(&v17, &location);
  v16[5] = v20;
  objc_msgSend(v5, "addOperation:", v16);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_56;
  v14[3] = &unk_1E3E6AC28;
  v14[4] = self;
  objc_copyWeak(&v15, &location);
  v14[5] = v20;
  objc_msgSend(v5, "addOperation:", v14);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_61;
  v10[3] = &unk_1E3E74540;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v11 = v8;
  v12 = v20;
  v9 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  _Block_object_dispose(v20, 8);

}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2;
  v11[3] = &unk_1E3E6ABD8;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "evaluateJavaScript:completionHandler:", CFSTR("document.readyState"), v11);

}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "stringValue");
  v3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 != CFSTR("complete") && v3)
    -[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("complete"));

  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPayLaterView readyState: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_52(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2_55;
  v14[3] = &unk_1E3E6AC00;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v13 = *(_QWORD *)(a1 + 40);
  v15 = v12;
  v17 = v13;
  objc_msgSend(v10, "evaluateJavaScript:completionHandler:", CFSTR("document.querySelector('apple-pay-merchandising').getBoundingClientRect().height"), v14);

  objc_destroyWeak(&v18);
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  float v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView encountered error getting height %@", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v5, "floatValue");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = fmin(v9, 350.0);
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v11 = WeakRetained[56];
      v12 = 134218240;
      v13 = v10;
      v14 = 2048;
      v15 = v11;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView recalcuated height to %f from old height %f", (uint8_t *)&v12, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_56(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2_59;
  v14[3] = &unk_1E3E6AC00;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v13 = *(_QWORD *)(a1 + 40);
  v15 = v12;
  v17 = v13;
  objc_msgSend(v10, "evaluateJavaScript:completionHandler:", CFSTR("document.querySelector('apple-pay-merchandising').getBoundingClientRect().width"), v14);

  objc_destroyWeak(&v18);
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  float v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView encountered error getting width %@", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v5, "floatValue");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v9;
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
      v11 = WeakRetained[55];
      v12 = 134218240;
      v13 = v10;
      v14 = 2048;
      v15 = v11;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView recalcuated width to %f from old width %f", (uint8_t *)&v12, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_61(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  char *WeakRetained;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  double v11;
  double v12;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  CGSize v25;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v5, "isCanceled"))
    {
      v7 = *((_QWORD *)WeakRetained + 57) + 1;
      *((_QWORD *)WeakRetained + 57) = v7;
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v21 = 25;
        v22 = 2048;
        v23 = v7;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView WKWebView document wasn't ready to load. Trying again in %ld miliseconds. Retry count %ld", buf, 0x16u);
      }

      v9 = dispatch_time(0, 25000000);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_62;
      v18[3] = &unk_1E3E61850;
      v18[4] = WeakRetained;
      v19 = *(id *)(a1 + 32);
      dispatch_after(v9, MEMORY[0x1E0C80D38], v18);

    }
    else
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *((double *)WeakRetained + 55);
      v12 = *((double *)WeakRetained + 56);
      if (*(double *)(v10 + 32) != v11 || *(double *)(v10 + 40) != v12)
      {
        PKLogFacilityTypeGetObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v25.width = v11;
          v25.height = v12;
          NSStringFromCGSize(v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromCGSize(*(CGSize *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v21 = (uint64_t)v15;
          v22 = 2112;
          v23 = (uint64_t)v16;
          _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "PKPayLaterView did update size from %@ to %@", buf, 0x16u);

        }
        *(_OWORD *)(WeakRetained + 440) = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
        objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");
        objc_msgSend(*((id *)WeakRetained + 59), "payLaterViewDidUpdateHeight:", WeakRetained);
      }
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
        (*(void (**)(void))(v17 + 16))();
    }
  }

}

uint64_t __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recalculateSizeWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (id)_configuration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D67030]);
  -[PKPayLaterView amount](self, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterView currencyCode](self, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithAmount:currency:displayStyle:action:theme:environmentType:", v4, v5, -[PKPayLaterView displayStyle](self, "displayStyle"), -[PKPayLaterView action](self, "action"), -[PKPayLaterView theme](self, "theme"), -[PKPayLaterView environmentType](self, "environmentType"));

  return v6;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (PKPayLaterViewDelegate *)delegate;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (PKPayLaterDisplayStyle)displayStyle
{
  return self->_displayStyle;
}

- (PKPayLaterAction)action
{
  return self->_action;
}

- (PKPayLaterViewInternalDelegate)internalDelegate
{
  return self->_internalDelegate;
}

- (unint64_t)environmentType
{
  return self->_environmentType;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end

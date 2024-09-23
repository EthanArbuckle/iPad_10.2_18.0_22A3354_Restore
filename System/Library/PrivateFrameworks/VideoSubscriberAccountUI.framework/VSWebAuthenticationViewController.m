@implementation VSWebAuthenticationViewController

- (void)dealloc
{
  objc_super v3;

  -[VSWebAuthenticationViewController _stopObservingViewModel:](self, "_stopObservingViewModel:", self->_viewModel);
  v3.receiver = self;
  v3.super_class = (Class)VSWebAuthenticationViewController;
  -[VSWebAuthenticationViewController dealloc](&v3, sel_dealloc);
}

- (void)setViewModel:(id)a3
{
  VSWebAuthenticationViewModel *v5;
  VSWebAuthenticationViewModel *v6;

  v5 = (VSWebAuthenticationViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    -[VSWebAuthenticationViewController _stopObservingViewModel:](self, "_stopObservingViewModel:");
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[VSWebAuthenticationViewController _startObservingViewModel:](self, "_startObservingViewModel:", self->_viewModel);
    v5 = v6;
  }

}

- (void)_didBeginActivity
{
  void *v3;
  id v4;

  -[VSWebAuthenticationViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[VSWebAuthenticationViewController activityIndicator](self, "activityIndicator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimating");

}

- (void)_didEndActivity
{
  void *v3;
  id v4;

  -[VSWebAuthenticationViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[VSWebAuthenticationViewController activityIndicator](self, "activityIndicator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  -[VSWebAuthenticationViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationViewControllerDidCancel:", self);

}

- (void)_sendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSWebAuthenticationViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSScriptMessageDispatchInjection(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "Will inject message to web: %@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__VSWebAuthenticationViewController__sendMessage___block_invoke;
  v9[3] = &unk_24FE1AC68;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "evaluateJavaScript:completionHandler:", v6, v9);

}

void __50__VSWebAuthenticationViewController__sendMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "Result of message injection: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__VSWebAuthenticationViewController__sendMessage___block_invoke_cold_1();
  }

  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Did inject message: %@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)_retrieveMessages
{
  void *v3;
  void *v4;
  VSScriptSecurityOrigin *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  VSScriptSecurityOrigin *v10;
  _QWORD v11[4];
  VSScriptSecurityOrigin *v12;
  VSWebAuthenticationViewController *v13;
  uint8_t buf[16];

  -[VSWebAuthenticationViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(VSScriptSecurityOrigin);
  objc_msgSend(v4, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setScheme:](v5, "setScheme:", v6);

  objc_msgSend(v4, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setHost:](v5, "setHost:", v7);

  objc_msgSend(v4, "port");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setPort:](v5, "setPort:", objc_msgSend(v8, "integerValue"));

  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v9, OS_LOG_TYPE_DEFAULT, "Will retrieve messages.", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke;
  v11[3] = &unk_24FE1AC90;
  v12 = v5;
  v13 = self;
  v10 = v5;
  objc_msgSend(v3, "evaluateJavaScript:completionHandler:", CFSTR("VideoSubscriberAccount._retrieveMessages();"), v11);

}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  char isKindOfClass;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_4();
LABEL_4:

    goto LABEL_5;
  }
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v10 = *MEMORY[0x24BDBCAB8];
        v11 = (void *)MEMORY[0x24BDBCE88];
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "raise:format:", v10, CFSTR("Unexpectedly, VSForceUnwrapNullable(result) was %@, instead of NSString."), v13);

      }
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v37 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v37);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v37;
        if (v14)
        {
          v16 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = v5;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v17 = (void *)MEMORY[0x24BDBCE88];
              v18 = *MEMORY[0x24BDBCAB8];
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "raise:format:", v18, CFSTR("Unexpectedly, messages was %@, instead of NSArray."), v20);

            }
            v21 = v16;
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
            if (v22)
            {
              v23 = v22;
              v29 = v16;
              v30 = v14;
              v31 = v15;
              v24 = *(_QWORD *)v34;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v34 != v24)
                    objc_enumerationMutation(v21);
                  VSScriptMessageForValueFromContextWithOrigin(*(void **)(*((_QWORD *)&v33 + 1) + 8 * i), *(void **)(a1 + 32));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v26)
                  {
                    objc_msgSend(*(id *)(a1 + 40), "viewModel");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "messagesFromWeb");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "addMessage:", v26);

                  }
                }
                v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
              }
              while (v23);
              v15 = v31;
              v5 = v32;
              v16 = v29;
              v14 = v30;
            }
            else
            {
              v5 = v32;
            }
          }
          else
          {
            VSErrorLogObject();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_3();
          }

        }
        else
        {
          VSErrorLogObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_2();
        }

      }
      else
      {
        VSErrorLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_1();
      }

      goto LABEL_4;
    }
  }
LABEL_5:

}

- (void)_sendMessages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  VSWebAuthenticationViewController *v9;

  v4 = a3;
  -[VSWebAuthenticationViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__VSWebAuthenticationViewController__sendMessages___block_invoke;
  v7[3] = &unk_24FE1AC90;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "evaluateJavaScript:completionHandler:", CFSTR("location.origin"), v7);

}

void __51__VSWebAuthenticationViewController__sendMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  VSScriptSecurityOrigin *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = (void *)MEMORY[0x24BDBCE88];
        v7 = *MEMORY[0x24BDBCAB8];
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, result was %@, instead of NSString."), v9);

      }
      v10 = v5;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v10);
      if (v11)
      {
        v12 = objc_alloc_init(VSScriptSecurityOrigin);
        objc_msgSend(v11, "scheme");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSScriptSecurityOrigin setScheme:](v12, "setScheme:", v13);

        objc_msgSend(v11, "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSScriptSecurityOrigin setHost:](v12, "setHost:", v14);

        v22 = v11;
        objc_msgSend(v11, "port");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSScriptSecurityOrigin setPort:](v12, "setPort:", objc_msgSend(v15, "integerValue"));

        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v16 = *(id *)(a1 + 32);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v24 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              if (VSShouldSendScriptMessageToContextWithOrigin(v21, v12))
                objc_msgSend(*(id *)(a1 + 40), "_sendMessage:", v21);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v18);
        }

        v11 = v22;
      }
      else
      {
        VSErrorLogObject();
        v12 = (VSScriptSecurityOrigin *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
          __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_2();
      }

    }
    else
    {
      VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_3();
    }

  }
  else
  {
    VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_1();
  }

}

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = kVSKeyValueObservingContext_SourceURL;
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("sourceURL"), 4, v4);
  objc_msgSend(v5, "messagesToWeb");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDelegate:", self);
}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = kVSKeyValueObservingContext_SourceURL;
  v5 = a3;
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("sourceURL"), v4);
  objc_msgSend(v5, "messagesToWeb");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDelegate:", 0);
}

- (id)_canonicalRequestForRequest:(id)a3
{
  id v3;
  id v4;

  v3 = objc_retainAutorelease((id)objc_msgSend(a3, "mutableCopy"));
  objc_msgSend(v3, "_CFURLRequest");
  objc_msgSend(MEMORY[0x24BDD15B0], "vs_sharedCookieStorage");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "_cookieStorage");
  CFURLRequestSetHTTPCookieStorage();
  objc_msgSend(v3, "setHTTPShouldHandleCookies:", 1);

  return v3;
}

- (void)didAddMessagesToMessageQueue:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  VSPerformBlockOnMainThread();

}

void __66__VSWebAuthenticationViewController_didAddMessagesToMessageQueue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "removeAllMessages");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_sendMessages:", v3);

  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  VSScriptMessageSupportInjection(0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateJavaScript:completionHandler:", v9, &__block_literal_global_13);

  -[VSWebAuthenticationViewController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messagesToWeb");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllMessages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSWebAuthenticationViewController _sendMessages:](self, "_sendMessages:", v8);

  -[VSWebAuthenticationViewController _didEndActivity](self, "_didEndActivity");
}

void __65__VSWebAuthenticationViewController_webView_didFinishNavigation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    VSErrorLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__VSWebAuthenticationViewController_webView_didFinishNavigation___block_invoke_cold_1();

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  -[VSWebAuthenticationViewController viewModel](self, "viewModel", a3, a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagesToWeb");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllMessages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSWebAuthenticationViewController _sendMessages:](self, "_sendMessages:", v7);

  -[VSWebAuthenticationViewController _didEndActivity](self, "_didEndActivity");
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, uint64_t))a5;
  objc_msgSend(a4, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = VSIsScriptMessageNotificationURL(v9);
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Web view will *not* load request: %@", (uint8_t *)&v14, 0xCu);
    }

    -[VSWebAuthenticationViewController _retrieveMessages](self, "_retrieveMessages");
    v13 = 0;
  }
  else
  {
    if (v12)
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Web view will load request %@", (uint8_t *)&v14, 0xCu);
    }

    v13 = 1;
  }
  v7[2](v7, v13);

}

- (void)setCancellationAllowed:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_cancellationAllowed != a3)
  {
    self->_cancellationAllowed = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANCEL_TITLE"), 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v5, 0, self, sel__cancelButtonPressed_);
    }
    else
    {
      v7 = 0;
    }
    -[VSWebAuthenticationViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", v7);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  if ((void *)kVSKeyValueObservingContext_SourceURL == a6)
  {
    if (-[VSWebAuthenticationViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[VSWebAuthenticationViewController webView](self, "webView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The objectOrNil parameter must not be nil."));
      v13 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = (void *)MEMORY[0x24BDBCE88];
        v15 = *MEMORY[0x24BDBCAB8];
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "raise:format:", v15, CFSTR("Unexpectedly, object was %@, instead of VSWebAuthenticationViewModel."), v17);

      }
      v18 = v13;
      if (!v10)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The keyPathOrNil parameter must not be nil."));
      objc_msgSend(v18, "valueForKeyPath:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSWebAuthenticationViewController _canonicalRequestForRequest:](self, "_canonicalRequestForRequest:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (id)objc_msgSend(v12, "loadRequest:", v21);
      }
      else
      {
        objc_msgSend(v12, "stopLoading");
      }

    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)VSWebAuthenticationViewController;
    -[VSWebAuthenticationViewController observeValueForKeyPath:ofObject:change:context:](&v23, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)VSWebAuthenticationViewController;
  -[VSWebAuthenticationViewController viewDidLoad](&v42, sel_viewDidLoad);
  -[VSWebAuthenticationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "groupTableViewBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_alloc_init(MEMORY[0x24BDFA920]);
  objc_msgSend(MEMORY[0x24BDFA928], "nonPersistentDataStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWebsiteDataStore:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA918]), "initWithFrame:configuration:", v13, v6, v8, v10, v12);
  objc_msgSend(v15, "setNavigationDelegate:", self);
  objc_msgSend(v15, "setHidden:", 1);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v15);
  -[VSWebAuthenticationViewController setWebView:](self, "setWebView:", v15);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 2);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v16);
  -[VSWebAuthenticationViewController setActivityIndicator:](self, "setActivityIndicator:", v16);
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v16, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v20);

  objc_msgSend(v16, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v23);

  objc_msgSend(v15, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v27);

  objc_msgSend(v15, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v30);

  objc_msgSend(v15, "leftAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v33);

  objc_msgSend(v15, "rightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v36);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v17);
  -[VSWebAuthenticationViewController viewModel](self, "viewModel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sourceURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSWebAuthenticationViewController _canonicalRequestForRequest:](self, "_canonicalRequestForRequest:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (id)objc_msgSend(v15, "loadRequest:", v40);
  VSAuthenticationViewControllerViewDidLoad(self);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSWebAuthenticationViewController;
  -[VSWebAuthenticationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  VSAuthenticationViewControllerViewWillAppear(self);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSWebAuthenticationViewController;
  -[VSWebAuthenticationViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  VSAuthenticationViewControllerViewDidAppear(self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSWebAuthenticationViewController;
  -[VSWebAuthenticationViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSWebAuthenticationViewController;
  -[VSWebAuthenticationViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  VSAuthenticationViewControllerViewDidDisappear(self);
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (VSAuthenticationViewControllerDelegate)delegate
{
  return (VSAuthenticationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSWebAuthenticationViewModel)viewModel
{
  return self->_viewModel;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __50__VSWebAuthenticationViewController__sendMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Error injecting message.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Unable to encode messages as UTF-8.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Error deserializing messages: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Top-level messages object was not an array.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __54__VSWebAuthenticationViewController__retrieveMessages__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Error retrieving messages from queue: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Unable to determine location origin.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Unable to parse location origin string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__VSWebAuthenticationViewController__sendMessages___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Location origin is not a string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __65__VSWebAuthenticationViewController_webView_didFinishNavigation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Unable to inject message support: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

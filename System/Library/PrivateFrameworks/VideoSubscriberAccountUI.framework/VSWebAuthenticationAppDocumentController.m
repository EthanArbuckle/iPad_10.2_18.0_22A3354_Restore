@implementation VSWebAuthenticationAppDocumentController

- (VSWebAuthenticationAppDocumentController)initWithAppDocument:(id)a3
{
  VSWebAuthenticationAppDocumentController *v3;
  VSWebAuthenticationAppDocumentController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VSWebAuthenticationAppDocumentController;
  v3 = -[VSAppDocumentController initWithAppDocument:](&v12, sel_initWithAppDocument_, a3);
  v4 = v3;
  if (v3)
  {
    -[VSAppDocumentController templateElement](v3, "templateElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, template was %@, instead of VSWebAuthenticationTemplateElement."), v9);

      }
      objc_msgSend(v5, "messagePort");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDelegate:", v4);

    }
  }
  return v4;
}

- (id)_webAuthenticationViewModelWithViewModel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v3 = a3;
  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    v5 = *MEMORY[0x24BDBCAB8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Unexpectedly, viewModel was %@, instead of VSWebAuthenticationViewModel."), v7);

  }
  return v3;
}

- (BOOL)_updateWebAuthenticationViewModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v11;

  v6 = a3;
  -[VSAppDocumentController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "vs_elementType") == 163)
  {
    v11 = 0;
    v8 = -[VSWebAuthenticationAppDocumentController _updateWebAuthenticationViewModel:withTemplate:error:](self, "_updateWebAuthenticationViewModel:withTemplate:error:", v6, v7, &v11);
    v9 = v11;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  VSPrivateError();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v9);
LABEL_6:

  return v8;
}

- (BOOL)_updateWebAuthenticationViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  BOOL v13;

  v7 = a3;
  objc_msgSend(a4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("src"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (v10 = (objc_class *)MEMORY[0x24BDBCF48],
        v11 = v9,
        v12 = (void *)objc_msgSend([v10 alloc], "initWithString:", v11),
        v11,
        v12))
  {
    objc_msgSend(v7, "setSourceURL:", v12);

    v13 = 1;
  }
  else if (a5)
  {
    VSPrivateError();
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_sendMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Will dispatch message event.", buf, 2u);
  }

  -[VSAppDocumentController templateElement](self, "templateElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCAB8];
    -[VSAppDocumentController templateElement](self, "templateElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Unexpectedly, [self templateElement] was %@, instead of VSWebAuthenticationTemplateElement."), v12);

  }
  -[VSAppDocumentController templateElement](self, "templateElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messagePort");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__VSWebAuthenticationAppDocumentController__sendMessage___block_invoke;
  v18[3] = &unk_24FE1A338;
  v19 = v4;
  v16 = v4;
  objc_msgSend(v15, "evaluate:completionBlock:", v18, &__block_literal_global_14);
  VSDefaultLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v17, OS_LOG_TYPE_DEFAULT, "Did dispatch message event.", buf, 2u);
  }

}

void __57__VSWebAuthenticationAppDocumentController__sendMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  VSScriptMessageDispatchInjection(*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "evaluateScript:", v3);

}

void __57__VSWebAuthenticationAppDocumentController__sendMessage___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "Did finish message event.", v1, 2u);
  }

}

- (void)messagePort:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[VSAppDocumentController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self viewModel] parameter must not be nil."));
  -[VSAppDocumentController viewModel](self, "viewModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[VSWebAuthenticationAppDocumentController _webAuthenticationViewModelWithViewModel:](self, "_webAuthenticationViewModelWithViewModel:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagesToWeb");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addMessage:", v5);

}

- (void)didAddMessagesToMessageQueue:(id)a3
{
  id v4;
  NSObject *v5;
  VSScriptSecurityOrigin *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  VSScriptSecurityOrigin *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Messages from web did change.", buf, 2u);
  }

  v6 = objc_alloc_init(VSScriptSecurityOrigin);
  -[VSAppDocumentController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = *MEMORY[0x24BDBCAB8];
    -[VSAppDocumentController templateElement](self, "templateElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("Unexpectedly, [self templateElement] was %@, instead of VSWebAuthenticationTemplateElement."), v13);

  }
  -[VSAppDocumentController templateElement](self, "templateElement");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "messagePort");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x24BDD1808]);
  v33 = v14;
  objc_msgSend(v14, "app");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appJSURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithURL:resolvingAgainstBaseURL:", v17, 1);

  objc_msgSend(v18, "scheme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setScheme:](v6, "setScheme:", v19);

  objc_msgSend(v18, "host");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setHost:](v6, "setHost:", v20);

  v32 = v18;
  objc_msgSend(v18, "port");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin setPort:](v6, "setPort:", objc_msgSend(v21, "integerValue"));

  v36 = v4;
  objc_msgSend(v4, "removeAllMessages");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134217984;
    v42 = v24;
    _os_log_impl(&dword_2303C5000, v23, OS_LOG_TYPE_DEFAULT, "Will process %lld messages", buf, 0xCu);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = v22;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (VSShouldSendScriptMessageToContextWithOrigin(v30, v6))
        {
          -[VSWebAuthenticationAppDocumentController _sendMessage:](self, "_sendMessage:", v30);
        }
        else
        {
          VSErrorLogObject();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v42 = (uint64_t)v30;
            v43 = 2112;
            v44 = v6;
            _os_log_error_impl(&dword_2303C5000, v31, OS_LOG_TYPE_ERROR, "Discarding message %@ to origin %@", buf, 0x16u);
          }

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v27);
  }

}

- (void)_startObservingViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSWebAuthenticationAppDocumentController;
  v4 = a3;
  -[VSAppDocumentController _startObservingViewModel:](&v7, sel__startObservingViewModel_, v4);
  -[VSWebAuthenticationAppDocumentController _webAuthenticationViewModelWithViewModel:](self, "_webAuthenticationViewModelWithViewModel:", v4, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "messagesFromWeb");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)_stopObservingViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSWebAuthenticationAppDocumentController;
  v4 = a3;
  -[VSAppDocumentController _stopObservingViewModel:](&v7, sel__stopObservingViewModel_, v4);
  -[VSWebAuthenticationAppDocumentController _webAuthenticationViewModelWithViewModel:](self, "_webAuthenticationViewModelWithViewModel:", v4, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "messagesFromWeb");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

}

- (id)_newViewModel
{
  return objc_alloc_init(VSWebAuthenticationViewModel);
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSWebAuthenticationAppDocumentController;
  -[VSAppDocumentController _updateViewModel:error:](&v13, sel__updateViewModel_error_, v6, a4);
  -[VSAppDocumentController appDocument](self, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[VSWebAuthenticationAppDocumentController _webAuthenticationViewModelWithViewModel:](self, "_webAuthenticationViewModelWithViewModel:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = -[VSWebAuthenticationAppDocumentController _updateWebAuthenticationViewModel:error:](self, "_updateWebAuthenticationViewModel:error:", v11, &v12);
    v8 = v12;

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v8);
LABEL_4:

  return v9;
}

@end

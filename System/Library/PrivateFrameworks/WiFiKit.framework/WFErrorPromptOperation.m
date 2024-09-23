@implementation WFErrorPromptOperation

+ (id)errorPromptOperationWithContext:(id)a3
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  _QWORD v24[4];
  id v25;
  id location;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLogForCategory(3uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]";
      v29 = 2112;
      v30 = v3;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_219FC8000, v6, v5, "%s: creating error prompt for context %@ (error %@)", buf, 0x20u);

    }
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v8, "setObject:forKey:", v10, *MEMORY[0x24BDBD6D8]);
    WFLogForCategory(3uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]";
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_219FC8000, v11, v12, "%s: prompt title %@", buf, 0x16u);
    }

  }
  objc_msgSend(v3, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedRecoverySuggestion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v8, "setObject:forKey:", v14, *MEMORY[0x24BDBD6E0]);
    WFLogForCategory(3uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]";
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_219FC8000, v15, v16, "%s: prompt message %@", buf, 0x16u);
    }

  }
  objc_msgSend(v3, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedRecoveryOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v19, *MEMORY[0x24BDBD6F8]);
  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SBUserNotificationDismissOnLock"));
  objc_msgSend(v8, "setObject:forKey:", &stru_24DC36C30, CFSTR("SBUserNotificationAlertMessageDelimiterKey"));
  v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:timeout:flags:", v8, 0, 0.0);
  objc_msgSend(v20, "setContext:", v3);
  objc_initWeak(&location, v20);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __58__WFErrorPromptOperation_errorPromptOperationWithContext___block_invoke;
  v24[3] = &unk_24DC347A0;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v20, "setCompletionBlock:", v24);
  WFLogForCategory(3uLL);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]";
    v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_219FC8000, v21, v22, "%s: password prompt %@", buf, 0x16u);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v20;
}

void __58__WFErrorPromptOperation_errorPromptOperationWithContext___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WFErrorPromptOperation_errorPromptOperationWithContext___block_invoke_2;
  block[3] = &unk_24DC347A0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __58__WFErrorPromptOperation_errorPromptOperationWithContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  os_log_type_t v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(3uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2)
  {
    v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v8 = 136315394;
      v9 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]_block_invoke_2";
      v10 = 2112;
      v11 = WeakRetained;
      _os_log_impl(&dword_219FC8000, v4, v3, "%s: user dismissed alert %@", (uint8_t *)&v8, 0x16u);

    }
  }

  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

}

- (WFErrorProviderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end

@implementation WFPickerViewProvider

- (WFPickerViewProvider)initWithRootViewController:(id)a3
{
  id v5;
  WFPickerViewProvider *v6;
  WFPickerViewProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFPickerViewProvider;
  v6 = -[WFPickerViewProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rootViewController, a3);

  return v7;
}

- (BOOL)_canHandleCredentialsContext:(id)a3
{
  return objc_msgSend(a3, "isEnterprise") ^ 1;
}

- (id)_promptForEnterpriseJoin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id from;
  id location;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[WFEnterpriseJoinPromptOperation enterpriseJoinPromptOperationWithDeviceCapability:](WFEnterpriseJoinPromptOperation, "enterpriseJoinPromptOperationWithDeviceCapability:", WFCurrentDeviceCapability());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(3uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[WFPickerViewProvider _promptForEnterpriseJoin:]";
    v25 = 2112;
    v26 = v5;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: prompt (%@) for enterprise join %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, v5);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__WFPickerViewProvider__promptForEnterpriseJoin___block_invoke;
  v15[3] = &unk_24DC35F50;
  objc_copyWeak(&v18, (id *)buf);
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  v9 = v6;
  v16 = v9;
  v10 = v4;
  v17 = v10;
  objc_msgSend(v5, "setCompletionBlock:", v15);
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v5);

  v12 = v17;
  v13 = v5;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v13;
}

void __49__WFPickerViewProvider__promptForEnterpriseJoin___block_invoke(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WFPickerViewProvider__promptForEnterpriseJoin___block_invoke_2;
  block[3] = &unk_24DC35F50;
  objc_copyWeak(&v5, a1 + 6);
  objc_copyWeak(&v6, a1 + 7);
  objc_copyWeak(&v7, a1 + 8);
  v3 = a1[4];
  v4 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __49__WFPickerViewProvider__promptForEnterpriseJoin___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "result");

  if (v4 == 2)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v6, "openSettingsForScanRecord:", v7);

    WFLogForCategory(3uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v8 = v8;
      if (os_log_type_enabled(v8, v9))
      {
        v10 = objc_loadWeakRetained(v2);
        v11 = *(_QWORD *)(a1 + 32);
        v14 = 136315650;
        v15 = "-[WFPickerViewProvider _promptForEnterpriseJoin:]_block_invoke_2";
        v16 = 2112;
        v17 = v10;
        v18 = 2112;
        v19 = v11;
        v12 = "%s: user accepted join prompt (%@) for enterprise network %@";
LABEL_10:
        _os_log_impl(&dword_219FC8000, v8, v9, v12, (uint8_t *)&v14, 0x20u);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "cancel");
    WFLogForCategory(3uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      v8 = v8;
      if (os_log_type_enabled(v8, v9))
      {
        v10 = objc_loadWeakRetained(v2);
        v13 = *(_QWORD *)(a1 + 32);
        v14 = 136315650;
        v15 = "-[WFPickerViewProvider _promptForEnterpriseJoin:]_block_invoke";
        v16 = 2112;
        v17 = v10;
        v18 = 2112;
        v19 = v13;
        v12 = "%s: user cancelled join prompt (%@) for enterprise network %@";
        goto LABEL_10;
      }
LABEL_11:

    }
  }

}

- (id)credentialsViewControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WFPickerViewProvider _canHandleCredentialsContext:](self, "_canHandleCredentialsContext:", v4))
  {
    +[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:](WFPasswordPromptOperation, "passwordPromptOperationWithCredentialsContext:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WFLogForCategory(3uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      v12 = 136315650;
      v13 = "-[WFPickerViewProvider credentialsViewControllerWithContext:]";
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_219FC8000, v6, v7, "%s: can handle credentials context %@, using prompt %@", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", v5);

  }
  else
  {
    WFLogForCategory(3uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      v12 = 136315394;
      v13 = "-[WFPickerViewProvider credentialsViewControllerWithContext:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_219FC8000, v9, v10, "%s: unhandled credentials context %@, launching settings", (uint8_t *)&v12, 0x16u);
    }

    -[WFPickerViewProvider _promptForEnterpriseJoin:](self, "_promptForEnterpriseJoin:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)certificateViewControllerWithContext:(id)a3
{
  return 0;
}

- (id)networkDetailsViewControllerWithContext:(id)a3
{
  return 0;
}

- (id)networkErrorViewControllerWithContext:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  int v8;
  void *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[WFErrorPromptOperation errorPromptOperationWithContext:](WFErrorPromptOperation, "errorPromptOperationWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(3uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (v4)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      v12 = 136315650;
      v13 = "-[WFPickerViewProvider networkErrorViewControllerWithContext:]";
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_219FC8000, v5, v6, "%s: error prompt %@ for context %@", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v4);

    v10 = v4;
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      v12 = 136315394;
      v13 = "-[WFPickerViewProvider networkErrorViewControllerWithContext:]";
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_219FC8000, v5, v6, "%s: failed to create error alert for context %@", (uint8_t *)&v12, 0x16u);
    }

  }
  return v4;
}

- (id)otherNetworkViewControllerWithContext:(id)a3
{
  return 0;
}

- (BOOL)wantsModalPresentation
{
  return self->wantsModalPresentation;
}

- (WFPickerViewProviderDelegate)delegate
{
  return (WFPickerViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

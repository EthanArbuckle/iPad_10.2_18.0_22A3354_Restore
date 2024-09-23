@implementation WFPasswordPromptOperation

+ (id)passwordPromptOperationWithCredentialsContext:(id)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id location;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLogForCategory(3uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]";
    v36 = 2112;
    v37 = v3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: creating password prompt for context %@", buf, 0x16u);
  }

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocPasswordAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "network");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ssid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v30, v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v6, "setObject:forKey:", v29, *MEMORY[0x24BDBD6D8]);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "network");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ssid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Enter the password for “%@”"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v14, *MEMORY[0x24BDBD6D8]);

  }
  objc_msgSend(v6, "setObject:forKey:", &unk_24DC5DB28, *MEMORY[0x24BDBD720]);
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocPasswordAlertCancelButton"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("Cancel");
  objc_msgSend(v6, "setObject:forKey:", v17, *MEMORY[0x24BDBD6F0]);
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("kWFLocPasswordAlertJoinButton"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = CFSTR("Join");
  objc_msgSend(v6, "setObject:forKey:", v20, *MEMORY[0x24BDBD6F8]);
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SBUserNotificationDismissOnLock"));
  objc_msgSend(v6, "setObject:forKey:", &stru_24DC36C30, CFSTR("SBUserNotificationAlertMessageDelimiterKey"));
  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:timeout:flags:", v6, 0x10000, 0.0);
  objc_msgSend(v21, "setCredentialsProviderContext:", v3);
  objc_initWeak(&location, v21);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __75__WFPasswordPromptOperation_passwordPromptOperationWithCredentialsContext___block_invoke;
  v31[3] = &unk_24DC347A0;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v21, "setCompletionBlock:", v31);
  WFLogForCategory(3uLL);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]";
    v36 = 2112;
    v37 = v21;
    _os_log_impl(&dword_219FC8000, v22, v23, "%s: password prompt %@", buf, 0x16u);
  }

  v24 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "network");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ssid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("Password prompt for '%@'"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setName:", v27);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v21;
}

void __75__WFPasswordPromptOperation_passwordPromptOperationWithCredentialsContext___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __75__WFPasswordPromptOperation_passwordPromptOperationWithCredentialsContext___block_invoke_2;
  v4[3] = &unk_24DC34778;
  v5 = WeakRetained;
  v3 = WeakRetained;
  objc_copyWeak(&v6, v1);
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
  objc_destroyWeak(&v6);

}

void __75__WFPasswordPromptOperation_passwordPromptOperationWithCredentialsContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  os_log_type_t v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "result");
  WFLogForCategory(3uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel())
    v5 = v3 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (v2 == 2)
  {
    if (v6)
    {
      v7 = v3;
      if (os_log_type_enabled(v7, v4))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        v22 = 136315394;
        v23 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]_block_invoke_2";
        v24 = 2112;
        v25 = WeakRetained;
        _os_log_impl(&dword_219FC8000, v7, v4, "%s: user entered password %@", (uint8_t *)&v22, 0x16u);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "userResponse");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_20;
    v10 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 32), "userResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDBD728];
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDBD728]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "userResponse");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v14, "objectForKey:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setPassword:", v15);

    }
    else
    {
LABEL_20:
      WFLogForCategory(3uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      v20 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v20))
      {
        v21 = *(void **)(a1 + 32);
        v22 = 136315394;
        v23 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]_block_invoke";
        v24 = 2112;
        v25 = v21;
        _os_log_impl(&dword_219FC8000, v14, v20, "%s: nil user response from prompt %@", (uint8_t *)&v22, 0x16u);
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "credentialsProviderContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "gatherCredentials:", 0);
  }
  else
  {
    if (v6)
    {
      v16 = v3;
      if (os_log_type_enabled(v16, v4))
      {
        v17 = *(void **)(a1 + 32);
        objc_msgSend(v17, "credentialsProviderContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136315650;
        v23 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]_block_invoke";
        v24 = 2112;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_219FC8000, v16, v4, "%s: user cancelled password prompt %@, cancelling context %@", (uint8_t *)&v22, 0x20u);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "setPassword:", 0);
    objc_msgSend(*(id *)(a1 + 32), "credentialsProviderContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cancel");
  }

}

- (NSString)password
{
  return self->password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (__SecIdentity)TLSIdentity
{
  return self->TLSIdentity;
}

- (NSString)username
{
  return self->username;
}

- (WFCredentialsProviderContext)credentialsProviderContext
{
  return self->_credentialsProviderContext;
}

- (void)setCredentialsProviderContext:(id)a3
{
  objc_storeStrong((id *)&self->_credentialsProviderContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialsProviderContext, 0);
  objc_storeStrong((id *)&self->username, 0);
  objc_storeStrong((id *)&self->password, 0);
}

@end

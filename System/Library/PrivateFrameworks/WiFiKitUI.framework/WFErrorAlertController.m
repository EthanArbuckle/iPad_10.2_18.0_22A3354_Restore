@implementation WFErrorAlertController

+ (id)errorAlertControllerWithContext:(id)a3
{
  id v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  __CFString *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLogForCategory(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v33 = "+[WFErrorAlertController errorAlertControllerWithContext:]";
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_2196CC000, v6, v5, "%s: error %@", buf, 0x16u);

    }
  }

  objc_msgSend(v3, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "code") == 19)
    goto LABEL_11;
  objc_msgSend(v3, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "code") == 17)
  {
LABEL_10:

LABEL_11:
    v11 = 1;
    v12 = &stru_24DB39F78;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v3, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "code") == 4)
  {

    goto LABEL_10;
  }
  objc_msgSend(v3, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "code") == 16;

  if (!v25)
  {
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 1;
  v12 = &stru_24DB39F78;
LABEL_13:
  if (!-[__CFString length](v12, "length"))
  {

    v12 = 0;
  }
  objc_msgSend(v3, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v11 & 1) != 0)
    objc_msgSend(v13, "localizedDescription");
  else
    objc_msgSend(v13, "localizedRecoverySuggestion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFErrorAlertController alertControllerWithTitle:message:preferredStyle:](WFErrorAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedRecoveryOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setContext:", v3);
  objc_initWeak((id *)buf, v3);
  v20 = (void *)MEMORY[0x24BEBD3A8];
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __58__WFErrorAlertController_errorAlertControllerWithContext___block_invoke;
  v29 = &unk_24DB373A0;
  v21 = v12;
  v30 = v21;
  objc_copyWeak(&v31, (id *)buf);
  objc_msgSend(v20, "actionWithTitle:style:handler:", v19, 0, &v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v22, v26, v27, v28, v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

  return v16;
}

void __58__WFErrorAlertController_errorAlertControllerWithContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2 && os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2196CC000, v2, v3, "user dismissed alert %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancel");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
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

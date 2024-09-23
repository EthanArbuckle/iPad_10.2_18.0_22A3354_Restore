@implementation WFPromptAlertController

+ (id)promptAlertControllerWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 successTitle:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  os_log_type_t v26;
  const char *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  if (!v11)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v26))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v27 = "Missing alert title";
LABEL_28:
    _os_log_impl(&dword_2196CC000, v23, v26, v27, buf, 2u);
    goto LABEL_7;
  }
  if (!v12)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v26))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v27 = "Missing alert message";
    goto LABEL_28;
  }
  if (!v15)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v26))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v27 = "Missing completion handler";
    goto LABEL_28;
  }
  if (!v13)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v23 || !os_log_type_enabled(v23, v26))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v27 = "Missing alert cancelTitle";
    goto LABEL_28;
  }
  if (v14)
  {
    +[WFPromptAlertController alertControllerWithTitle:message:preferredStyle:](WFPromptAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v32[5];
    v32[5] = v17;

    objc_msgSend((id)v32[5], "setCompletionHandler:", v16);
    v19 = (void *)v32[5];
    v20 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __109__WFPromptAlertController_promptAlertControllerWithTitle_message_cancelTitle_successTitle_completionHandler___block_invoke;
    v29[3] = &unk_24DB37378;
    v29[4] = &v31;
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 1, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v21);

    v22 = (void *)v32[5];
    v28[0] = v20;
    v28[1] = 3221225472;
    v28[2] = __109__WFPromptAlertController_promptAlertControllerWithTitle_message_cancelTitle_successTitle_completionHandler___block_invoke_2;
    v28[3] = &unk_24DB37378;
    v28[4] = &v31;
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v14, 0, v28);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v23);
    goto LABEL_7;
  }
  WFLogForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  v26 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v26))
  {
    *(_WORD *)buf = 0;
    v27 = "Missing alert cancelTitle";
    goto LABEL_28;
  }
LABEL_7:

  v24 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v24;
}

void __109__WFPromptAlertController_promptAlertControllerWithTitle_message_cancelTitle_successTitle_completionHandler___block_invoke(uint64_t a1)
{
  void (**v1)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "completionHandler");
  v1 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 0);

}

void __109__WFPromptAlertController_promptAlertControllerWithTitle_message_cancelTitle_successTitle_completionHandler___block_invoke_2(uint64_t a1)
{
  void (**v1)(id, uint64_t);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "completionHandler");
  v1 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 1);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end

@implementation WFActionContentPermissionRequestor

- (WFActionContentPermissionRequestor)initWithAction:(id)a3
{
  id v4;
  WFActionContentPermissionRequestor *v5;
  WFActionContentPermissionRequestor *v6;
  uint64_t v7;
  WFUserInterfaceHost *userInterface;
  NSObject *v9;
  WFActionContentPermissionRequestor *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFActionContentPermissionRequestor;
  v5 = -[WFActionContentPermissionRequestor init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_action, v4);
    objc_msgSend(v4, "userInterface");
    v7 = objc_claimAutoreleasedReturnValue();
    userInterface = v6->_userInterface;
    v6->_userInterface = (WFUserInterfaceHost *)v7;

    if (!v6->_userInterface)
    {
      getWFSecurityLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[WFActionContentPermissionRequestor initWithAction:]";
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Creating a WFActionContentPermissionRequestor without userInterface. We won't be able to present any prompts, and requests will be denied.", buf, 0xCu);
      }

    }
    v10 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_userInterface, 0);
  objc_destroyWeak((id *)&self->_action);
}

- (void)allowContactsAccessWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("WFContactAccessResource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__WFActionContentPermissionRequestor_allowContactsAccessWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E7AF4F88;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "requestSandboxExtensionForRunningActionWithAccessResources:completion:", v6, v8);

}

- (void)requestUserConsentToLoadWebContentAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD, id);
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (objc_msgSend(v6, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x1E0D13EE0], "webpagesLocation");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0D140C0], "locationWithURL:error:", v6, &v20);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (!v8)
    {
      objc_msgSend(v6, "scheme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("data")))
      {

      }
      else
      {
        objc_msgSend(v6, "scheme");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("about"));

        if (!v12)
        {
          v7[2](v7, 0, v9);
          goto LABEL_10;
        }
      }
      objc_msgSend(MEMORY[0x1E0D13EE0], "webpagesLocation");
      v8 = objc_claimAutoreleasedReturnValue();
    }

  }
  -[WFActionContentPermissionRequestor action](self, "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionContentPermissionRequestor userInterface](self, "userInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFActionContentPermissionRequestor action](self, "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "runningDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentItemCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__WFActionContentPermissionRequestor_requestUserConsentToLoadWebContentAtURL_completionHandler___block_invoke;
  v18[3] = &unk_1E7AF4FB0;
  v19 = v7;
  objc_msgSend(v13, "performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:completionHandler:", v14, v8, v17, 1, v18);

  v9 = (id)v8;
LABEL_10:

}

- (void)_allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void (**v15)(id, uint64_t, _QWORD);
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  void (**v27)(id, uint64_t, _QWORD);
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = a3;
  objc_msgSend(v7, "if_objectsPassingTest:", &__block_literal_global_47387);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");

  if (v9 && !objc_msgSend(v8, "count"))
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D140C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v10, "locationWithURLs:error:", v11, &v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v31;

    if (v13)
    {
      ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v13);
    }
    else
    {
      v14 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_2;
      aBlock[3] = &unk_1E7AF4FB0;
      v15 = v6;
      v30 = v15;
      v16 = _Block_copy(aBlock);
      v26[0] = v14;
      v26[1] = 3221225472;
      v26[2] = __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_3;
      v26[3] = &unk_1E7AF7048;
      v27 = v15;
      v28 = v16;
      v17 = v16;
      v18 = _Block_copy(v26);
      v19 = v18;
      if (v12)
      {
        -[WFActionContentPermissionRequestor action](self, "action");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFActionContentPermissionRequestor userInterface](self, "userInterface");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFActionContentPermissionRequestor action](self, "action");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "runningDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "contentItemCache");
        v25 = v17;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:completionHandler:", v21, v12, v24, 1, v19);

        v17 = v25;
      }
      else
      {
        (*((void (**)(void *, _QWORD))v18 + 2))(v18, 0);
      }

    }
  }

}

- (void)allowNetworkAccessAfterPromptingForURLs:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionContentPermissionRequestor.m"), 114, CFSTR("Programming error: at least 1 URLs must be passed into allowNetworkAccessAfterPromptingForURLs:"));

  }
  -[WFActionContentPermissionRequestor _allowNetworkAccessAfterPromptingForURLs:completionHandler:](self, "_allowNetworkAccessAfterPromptingForURLs:completionHandler:", v9, v7);

}

- (void)allowNetworkAccessWithoutPromptingWithCompletionHandler:(id)a3
{
  -[WFActionContentPermissionRequestor _allowNetworkAccessAfterPromptingForURLs:completionHandler:](self, "_allowNetworkAccessAfterPromptingForURLs:completionHandler:", MEMORY[0x1E0C9AA60], a3);
}

- (WFContactStore)contactStore
{
  WFContactStore *contactStore;
  WFContactStore *v4;
  WFContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (WFContactStore *)objc_opt_new();
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (WFUserInterfaceHost)userInterface
{
  return self->_userInterface;
}

- (void)setUserInterface:(id)a3
{
  objc_storeStrong((id *)&self->_userInterface, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

uint64_t __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("WFRemoteServerAccessResource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_4;
    v5[3] = &unk_1E7AF64E8;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "requestSandboxExtensionForRunningActionWithAccessResources:completion:", v4, v5);

  }
}

uint64_t __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__WFActionContentPermissionRequestor__allowNetworkAccessAfterPromptingForURLs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFileURL") ^ 1;
}

uint64_t __96__WFActionContentPermissionRequestor_requestUserConsentToLoadWebContentAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

void __79__WFActionContentPermissionRequestor_allowContactsAccessWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "contactStore");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

@end

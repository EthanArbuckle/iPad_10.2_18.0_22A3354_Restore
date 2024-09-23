@implementation SearchUIOpenFileProviderItemHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileProviderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setCoreSpotlightIdentifier:", v5);
    objc_msgSend(v7, "setFileProviderIdentifier:", v6);
  }

  return v7;
}

- (id)defaultSymbolName
{
  return CFSTR("magnifyingglass");
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SearchUIOpenFileProviderItemHandler *v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke;
  v12[3] = &unk_1EA1F8930;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  -[SearchUIOpenFileProviderItemHandler fetchFileProviderURLWithCompletionHandler:](self, "fetchFileProviderURLWithCompletionHandler:", v12);

}

void __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  char v29;
  objc_super v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
    v6 = *MEMORY[0x1E0C999D0];
    v7 = *MEMORY[0x1E0C99A00];
    v32[0] = *MEMORY[0x1E0C999D0];
    v32[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourceValuesForKeys:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "BOOLValue"))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue") ^ 1;

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
    v15 = objc_msgSend(*(id *)(a1 + 32), "shouldRevealFile");
    v16 = v15;
    if ((v12 & 1) != 0
      || (v15 & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "openFileURLInPlaceInDefaultApplicationIfPossible:", v4) & 1) == 0)
    {
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v17))
      {

      }
      else
      {
        v18 = objc_msgSend(MEMORY[0x1E0CD3250], "canPreviewItem:", v4);

        if (v18)
        {
          v19 = *(_QWORD *)(a1 + 32);
          v21 = *(_QWORD *)(a1 + 48);
          v20 = *(_QWORD *)(a1 + 56);
          v30.receiver = *(id *)(a1 + 40);
          v30.super_class = (Class)SearchUIOpenFileProviderItemHandler;
          objc_msgSendSuper2(&v30, sel_performCommand_triggerEvent_environment_, v19, v20, v21);
          goto LABEL_21;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setScheme:", CFSTR("shareddocuments"));
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("reveal"), CFSTR("true"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setQueryItems:", v24);

      }
      objc_msgSend(v22, "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke_2;
      v27[3] = &unk_1EA1F6318;
      v29 = v5;
      v4 = v25;
      v28 = v4;
      +[SearchUIUtilities openPunchout:completion:](SearchUIUtilities, "openPunchout:completion:", v26, v27);

    }
  }
  else
  {
    SearchUIGeneralLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(v13);

    v4 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "rowModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIOpenPunchoutHandler fallbackCommandForRowModel:environment:](SearchUIOpenPunchoutHandler, "fallbackCommandForRowModel:environment:", v9, *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performCommand:triggerEvent:environment:", v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
LABEL_21:

}

uint64_t __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAccessingSecurityScopedResource");
  return result;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setDataSource:", self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__SearchUIOpenFileProviderItemHandler_createViewControllerForCommand_environment___block_invoke;
  v8[3] = &unk_1EA1F8958;
  v6 = v5;
  v9 = v6;
  -[SearchUIOpenFileProviderItemHandler fetchFileProviderURLWithCompletionHandler:](self, "fetchFileProviderURLWithCompletionHandler:", v8);

  return v6;
}

void __82__SearchUIOpenFileProviderItemHandler_createViewControllerForCommand_environment___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __82__SearchUIOpenFileProviderItemHandler_createViewControllerForCommand_environment___block_invoke_2;
  v1[3] = &unk_1EA1F62F0;
  v2 = *(id *)(a1 + 32);
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v1);

}

uint64_t __82__SearchUIOpenFileProviderItemHandler_createViewControllerForCommand_environment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v3;
  int64_t v4;

  -[SearchUIOpenFileProviderItemHandler fileProviderURL](self, "fileProviderURL", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)fetchFileProviderURLWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[SearchUIOpenFileProviderItemHandler fileProviderURL](self, "fileProviderURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    -[SearchUICommandHandler command](self, "command");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coreSpotlightIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileProviderIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__SearchUIOpenFileProviderItemHandler_fetchFileProviderURLWithCompletionHandler___block_invoke;
    v9[3] = &unk_1EA1F8980;
    v9[4] = self;
    v10 = v4;
    +[SearchUIUtilities fetchURLForCoreSpotlightIdentifier:fileProviderIdentifier:completionHandler:](SearchUIUtilities, "fetchURLForCoreSpotlightIdentifier:fileProviderIdentifier:completionHandler:", v7, v8, v9);

  }
}

void __81__SearchUIOpenFileProviderItemHandler_fetchFileProviderURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setFileProviderURL:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)openFileURLInPlaceInDefaultApplicationIfPossible:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D96D38], "interactionControllerWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_defaultApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsOpenInPlace");

    if (v6)
      objc_msgSend(v4, "openDocumentWithDefaultApplication");

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)supportsShare
{
  return 1;
}

- (BOOL)supportsCopy
{
  return 1;
}

- (id)itemProvider
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SearchUIOpenFileProviderItemHandler_itemProvider__block_invoke;
  v6[3] = &unk_1EA1F8958;
  v4 = v3;
  v7 = v4;
  -[SearchUIOpenFileProviderItemHandler fetchFileProviderURLWithCompletionHandler:](self, "fetchFileProviderURLWithCompletionHandler:", v6);

  return v4;
}

void __51__SearchUIOpenFileProviderItemHandler_itemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v3, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeWithFilenameExtension:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_1EA1FB118;
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__SearchUIOpenFileProviderItemHandler_itemProvider__block_invoke_2;
    v13[3] = &unk_1EA1F89A8;
    v14 = v4;
    objc_msgSend(v12, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v11, 1, 0, v13);

  }
}

uint64_t __51__SearchUIOpenFileProviderItemHandler_itemProvider__block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 1, 0);
  return 0;
}

- (NSURL)fileProviderURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFileProviderURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviderURL, 0);
}

void __79__SearchUIOpenFileProviderItemHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "SearchUIOpenFileProviderItemHandler fetchFileProviderURLWithCompletionHandler returned nil URL", v1, 2u);
}

@end

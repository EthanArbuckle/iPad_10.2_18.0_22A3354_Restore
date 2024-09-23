@implementation SearchUIShareItemHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v6 = a3;
  -[SearchUIShareItemHandler handlerForSharing](self, "handlerForSharing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke;
    v11[3] = &unk_1EA1F6408;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v12, "fetchShareableURLWithCompletionHandler:", v11);
    v9 = v12;
  }
  else
  {
    objc_msgSend(v6, "shareItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke_6;
    v10[3] = &unk_1EA1F6430;
    v10[4] = self;
    objc_msgSend(v9, "searchUI_fetchShareableItemWithCompletionHandler:", v10);
  }

}

void __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "presentShareViewControllerForItem:", a2) & 1) == 0)
  {
    SearchUIPeekLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(a1, v3);

  }
}

uint64_t __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentShareViewControllerForItem:", a2);
}

- (BOOL)presentShareViewControllerForItem:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  SearchUIShareItemHandler *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__SearchUIShareItemHandler_presentShareViewControllerForItem___block_invoke;
    v7[3] = &unk_1EA1F6210;
    v8 = v4;
    v9 = self;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v7);

  }
  return v5 != 0;
}

void __62__SearchUIShareItemHandler_presentShareViewControllerForItem___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D96D28]);
  v5[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithActivityItems:applicationActivities:", v3, 0);

  objc_msgSend(*(id *)(a1 + 40), "requestAuthIfNecessaryAndPresentViewController:animated:", v4, 1);
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (id)defaultTitle
{
  return +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("SHARE"));
}

- (id)defaultSymbolName
{
  return CFSTR("square.and.arrow.up");
}

- (unint64_t)destination
{
  return 3;
}

- (SearchUICommandHandler)handlerForSharing
{
  return (SearchUICommandHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHandlerForSharing:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerForSharing, 0);
}

void __68__SearchUIShareItemHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_FAULT, "failed to fetch url for share for handler %@", (uint8_t *)&v3, 0xCu);
}

@end

@implementation SearchUIOpenUserActivityHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SearchUIOpenUserActivityHandler *v11;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke;
  v9[3] = &unk_1EA1F8308;
  v10 = v7;
  v11 = self;
  v8 = v7;
  -[SearchUIOpenUserActivityHandler getUserActivityForCommand:environment:completionHandler:](self, "getUserActivityForCommand:environment:completionHandler:", a3, v8, v9);

}

void __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SearchUIUtilities downloadDemotedAppIfNecessaryForBundleIdentifier:presentingViewControllerForExplanationAlert:](SearchUIUtilities, "downloadDemotedAppIfNecessaryForBundleIdentifier:presentingViewControllerForExplanationAlert:", v6, v7);

  if (!v8)
  {
    if (v5)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
      v10 = (void *)objc_opt_new();
      +[SearchUIUtilities openApplicationOptions](SearchUIUtilities, "openApplicationOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFrontBoardOptions:", v11);

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v5, v9, v10, &__block_literal_global_31);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "rowModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifyingResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      SearchUITapLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(v14, v15);

      if (v6)
        +[SearchUILaunchAppHandler openApplicationWithBundleIdentifier:environment:](SearchUILaunchAppHandler, "openApplicationWithBundleIdentifier:environment:", v6, *(_QWORD *)(a1 + 32));

    }
  }

}

void __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    SearchUIGeneralLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1((uint64_t)v4, v5);

  }
}

void __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_fault_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_FAULT, "nil user activity generated for result: %@ (id: %@)", (uint8_t *)&v5, 0x16u);

}

void __75__SearchUIOpenUserActivityHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Failed to open activity with error %@", (uint8_t *)&v2, 0xCu);
}

@end

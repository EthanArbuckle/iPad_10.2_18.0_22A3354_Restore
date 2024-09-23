@implementation SearchUILaunchAppHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "identifyingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 1 && (objc_msgSend(v5, "isLocalApplicationResult") & 1) != 0)
  {
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    v10 = 0;
    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setApplicationBundleIdentifier:", v6);
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a5;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v7, "applicationBundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "openApplicationWithBundleIdentifier:environment:", v9, v6);
}

+ (void)openApplicationWithBundleIdentifier:(id)a3 environment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (!+[SearchUIUtilities downloadDemotedAppIfNecessaryForBundleIdentifier:presentingViewControllerForExplanationAlert:](SearchUIUtilities, "downloadDemotedAppIfNecessaryForBundleIdentifier:presentingViewControllerForExplanationAlert:", v11, 0))
  {
    if (openApplicationWithBundleIdentifier_environment__onceToken != -1)
      dispatch_once(&openApplicationWithBundleIdentifier_environment__onceToken, &__block_literal_global_20);
    v6 = (void *)MEMORY[0x1E0C99E08];
    +[SearchUIUtilities openApplicationOptions](SearchUIUtilities, "openApplicationOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "modifierFlags") & 0x20000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0DAB878]);

    }
    objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)openApplicationWithBundleIdentifier_environment__openApplicationService, "openApplication:withOptions:completion:", v11, v10, &__block_literal_global_13_1);

  }
}

void __76__SearchUILaunchAppHandler_openApplicationWithBundleIdentifier_environment___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)openApplicationWithBundleIdentifier_environment__openApplicationService;
  openApplicationWithBundleIdentifier_environment__openApplicationService = v0;

}

void __76__SearchUILaunchAppHandler_openApplicationWithBundleIdentifier_environment___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    SearchUIGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__SearchUILaunchAppHandler_openApplicationWithBundleIdentifier_environment___block_invoke_2_cold_1((uint64_t)v3, v4);

  }
}

void __76__SearchUILaunchAppHandler_openApplicationWithBundleIdentifier_environment___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Failed to open application with error %@", (uint8_t *)&v2, 0xCu);
}

@end

@implementation SearchUISearchInAppHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "searchInAppType") == 1)
  {
    objc_msgSend(v8, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIMarketplaceKitUtilities requestSearchPageWithDistributorID:searchString:completionHandler:](_TtC8SearchUI31SearchUIMarketplaceKitUtilities, "requestSearchPageWithDistributorID:searchString:completionHandler:", v10, v11, &__block_literal_global_40);

  }
  else
  {
    objc_msgSend(v8, "applicationBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v15, "setScheme:", CFSTR("itms-apps"));
      objc_msgSend(v15, "setHost:", &stru_1EA1FB118);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("action"), CFSTR("search"));
      objc_msgSend(v16, "addObject:", v17);

      v18 = objc_alloc(MEMORY[0x1E0CB39D8]);
      objc_msgSend(v8, "searchString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("term"), v19);
      objc_msgSend(v16, "addObject:", v20);

      objc_msgSend(v15, "setQueryItems:", v16);
      v21 = (void *)MEMORY[0x1E0D8C5E0];
      objc_msgSend(v15, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "punchoutWithURL:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIUtilities openPunchout:](SearchUIUtilities, "openPunchout:", v23);

    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)SearchUISearchInAppHandler;
      -[SearchUIOpenUserActivityHandler performCommand:triggerEvent:environment:](&v24, sel_performCommand_triggerEvent_environment_, v8, a4, v9);
    }
  }

}

- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v6;
  objc_class *v7;
  void (**v8)(id, void *, void *);
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0CA5920];
  v8 = (void (**)(id, void *, void *))a5;
  v9 = [v7 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithActivityType:", *MEMORY[0x1E0CA5EF8]);
  objc_msgSend(v6, "searchString");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    SearchUITapLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[SearchUISearchInAppHandler getUserActivityForCommand:environment:completionHandler:].cold.1(v6, v13);

    v11 = &stru_1EA1FB118;
  }
  v17 = *MEMORY[0x1E0CA5F08];
  objc_msgSend(v6, "searchString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInfo:", v15);

  objc_msgSend(v6, "applicationBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10, v16);

}

- (void)getUserActivityForCommand:(void *)a1 environment:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "applicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_FAULT, "SearchUISearchInAppHandler has nil string for app: %@", (uint8_t *)&v4, 0xCu);

}

@end

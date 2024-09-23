@implementation SearchUIShowContactCardHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "contactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "contactIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContactIdentifier:", v7);

  }
  return v5;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactForContactViewController:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_msgSend(v4, "isSuggestedContact") & 1) != 0)
      +[SearchUIContactViewController viewControllerForUnknownContact:](SearchUIContactViewController, "viewControllerForUnknownContact:", v7);
    else
      +[SearchUIContactViewController viewControllerForContact:](SearchUIContactViewController, "viewControllerForContact:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C974D0];
    objc_msgSend(MEMORY[0x1E0C974D0], "spotlightStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentStyle:", v11);

    objc_msgSend(v9, "setActions:", objc_msgSend(v9, "actions") | 0x400);
    objc_msgSend(v9, "setAllowsDisplayModePickerActions:", 0);
    objc_msgSend(v9, "setAllowsEditPhoto:", 0);
    objc_msgSend(v6, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContactStore:", v12);

    objc_msgSend(v9, "setTitle:", &stru_1EA1FB118);
    objc_msgSend(v9, "setAllowsEditing:", 0);
  }
  else
  {
    SearchUITapLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SearchUIShowContactCardHandler createViewControllerForCommand:environment:].cold.1((uint64_t)v5, v8);

    v9 = 0;
  }

  return v9;
}

- (unint64_t)destination
{
  return 1;
}

- (void)createViewControllerForCommand:(uint64_t)a1 environment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "couldnt find contact for identifier %@", (uint8_t *)&v2, 0xCu);
}

@end

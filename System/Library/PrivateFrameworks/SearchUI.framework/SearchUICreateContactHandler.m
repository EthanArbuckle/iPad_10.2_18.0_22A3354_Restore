@implementation SearchUICreateContactHandler

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  __objc2_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (objc_msgSend(a3, "addToExistingContact"))
    v5 = SearchUIContactPickerViewController;
  else
    v5 = SearchUIContactViewNavigationController;
  v6 = [v5 alloc];
  -[SearchUICreateContactHandler contactFromCommand](self, "contactFromCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithContact:", v7);

  v9 = (void *)MEMORY[0x1E0C974D0];
  objc_msgSend(MEMORY[0x1E0C974D0], "defaultStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentStyle:", v10);

  return v8;
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (BOOL)prefersContextMenu
{
  return 0;
}

- (unint64_t)destination
{
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    return 2;
  else
    return 3;
}

- (id)contactFromCommand
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[SearchUICommandHandler command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    SearchUITapLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SearchUICreateContactHandler contactFromCommand].cold.1(v16);
    v4 = 0;
    goto LABEL_23;
  }
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v4;
  if (v5)
  {
    v24 = v2;
    v6 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v3, "phoneNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "labeledValueWithLabel:value:", 0, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v14);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setPhoneNumbers:", v6);
    v2 = v24;
  }
  objc_msgSend(v3, "emailAddresses", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "emailAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", CFSTR("email"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

    v4 = v25;
    objc_msgSend(v25, "setEmailAddresses:", v16);
LABEL_23:

  }
  return v4;
}

- (void)contactFromCommand
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "Error performing SearchUICreateContactHandler: No person set in SFCreateContactCommand", v1, 2u);
}

@end

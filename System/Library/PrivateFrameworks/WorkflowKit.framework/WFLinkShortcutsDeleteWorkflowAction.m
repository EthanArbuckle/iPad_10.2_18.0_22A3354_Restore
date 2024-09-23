@implementation WFLinkShortcutsDeleteWorkflowAction

- (id)localizedCategoryWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("ShortcutsSubcategoryShortcuts"), CFSTR("Shortcuts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)inputDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  WFLinkShortcutsDeleteWorkflowAction *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)WFLinkShortcutsDeleteWorkflowAction;
  -[WFLinkAction inputDictionary](&v14, sel_inputDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "objectForKey:", CFSTR("Types"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!objc_msgSend(v7, "count"))
  {
    getWFActionsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFLinkShortcutsDeleteWorkflowAction inputDictionary]";
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Unable to construct input type for %@", buf, 0x16u);
    }

    v7 = (id)MEMORY[0x1E0C9AA60];
  }
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v11, 0);

  v12 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Types"));

  return v4;
}

@end

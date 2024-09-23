@implementation SBHWidgetViewControllerSysdiagnoseDescription

void __SBHWidgetViewControllerSysdiagnoseDescription_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intent");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  v8 = CFSTR("Y");
  if (objc_msgSend(v3, "isViewLoaded"))
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  if (!objc_msgSend(v3, "bs_isAppearingOrAppeared"))
    v8 = CFSTR("N");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "_indexingHash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p l:%@ v:%@ i:%@>"), v7, v3, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
}

@end

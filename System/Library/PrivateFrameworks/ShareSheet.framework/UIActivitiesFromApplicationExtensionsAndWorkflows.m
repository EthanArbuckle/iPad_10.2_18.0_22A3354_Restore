@implementation UIActivitiesFromApplicationExtensionsAndWorkflows

void ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  _UIActivityFromApplicationExtension(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  UIShortcutActivity *v5;
  NSObject *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = -[UIShortcutActivity initWithPartial:]([UIShortcutActivity alloc], "initWithPartial:", v4);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  else
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke_2_cold_1((uint64_t)v3, v6);

  }
}

void ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Activity is not an expected UIShortcutActivity:%@", (uint8_t *)&v2, 0xCu);
}

@end

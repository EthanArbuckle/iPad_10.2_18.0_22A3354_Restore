@implementation WFPresentInitializationErrorIfNecessary

void __WFPresentInitializationErrorIfNecessary_block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *(id *)(a1 + 32);
  WFDestroyDB();
  v7 = (id)objc_opt_new();
  WFLocalizedString(CFSTR("Shortcuts Reset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v2);

  WFLocalizedString(CFSTR("Your shortcuts have been reset. Re-open the Shortcuts app to continue."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessage:", v3);

  v4 = (void *)MEMORY[0x1E0D13DE8];
  WFLocalizedString(CFSTR("Exit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonWithTitle:style:handler:", v5, 0, &__block_literal_global_179_40766);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addButton:", v6);

  objc_msgSend(v1, "presentAlert:", v7);
}

void __WFPresentInitializationErrorIfNecessary_block_invoke_2()
{
  exit(0);
}

@end

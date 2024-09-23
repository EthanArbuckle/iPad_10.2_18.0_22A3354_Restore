@implementation PXSearchRecentSearchesGadgetProvider

- (PXSearchRecentSearchesGadgetProvider)init
{
  PXSearchRecentSearchesGadgetProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSearchRecentSearchesGadgetProvider;
  v2 = -[PXGadgetProvider init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_generateGadgets, CFSTR("PXSearchHistoryNotificationRecentSearchesDidChange"), 0);

  }
  return v2;
}

- (void)generateGadgets
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  +[PXSearchHistoryManager sharedManager](PXSearchHistoryManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentSearches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[PXGadgetProvider gadgets](self, "gadgets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5)
  {
    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __55__PXSearchRecentSearchesGadgetProvider_generateGadgets__block_invoke;
      v10[3] = &unk_1E5145360;
      v11 = v8;
      v9 = v8;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v10);

    }
  }
  else if (v7)
  {
    -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_248122);
  }
}

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

void __55__PXSearchRecentSearchesGadgetProvider_generateGadgets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

uint64_t __55__PXSearchRecentSearchesGadgetProvider_generateGadgets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

@end

@implementation UISearchSuggestionsListViewController

void __67___UISearchSuggestionsListViewController_initWithSearchController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "searchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v11, "_dci_searchSuggestions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 < v14)
    {
      objc_msgSend(v11, "_dci_searchSuggestions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v9, "unsignedIntegerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRepresentedSuggestion:", v16);

      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        goto LABEL_11;
      objc_msgSend(v11, "_dci_searchSuggestions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v8;
      v23 = 2048;
      v24 = v12;
      v25 = 2112;
      v26 = v20;
      _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Suggestion list not in sync with cell at indexPath: %@. itemIndex=%lu, suggestion list: %@", (uint8_t *)&v21, 0x20u);
LABEL_10:

LABEL_11:
      goto LABEL_4;
    }
    v17 = SectionIdentifier_block_invoke___s_category;
    if (!SectionIdentifier_block_invoke___s_category)
    {
      v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&SectionIdentifier_block_invoke___s_category);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      objc_msgSend(v11, "_dci_searchSuggestions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v8;
      v23 = 2048;
      v24 = v12;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Suggestion list not in sync with cell at indexPath: %@. itemIndex=%lu, suggestion list: %@", (uint8_t *)&v21, 0x20u);
      goto LABEL_10;
    }
  }
LABEL_4:

}

uint64_t __67___UISearchSuggestionsListViewController_initWithSearchController___block_invoke_27(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

@end

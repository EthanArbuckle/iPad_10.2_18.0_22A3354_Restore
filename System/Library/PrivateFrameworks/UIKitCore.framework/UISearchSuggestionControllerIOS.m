@implementation UISearchSuggestionControllerIOS

id __52___UISearchSuggestionControllerIOS__suggestionsMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  id v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    v6 = (id *)(a1 + 32);
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "localizedSuggestion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(v8, "localizedAttributedSuggestion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
            continue;
          objc_msgSend(v8, "localizedAttributedSuggestion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "string");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "iconImage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __52___UISearchSuggestionControllerIOS__suggestionsMenu__block_invoke_2;
        v18[3] = &unk_1E16B50A0;
        objc_copyWeak(&v19, v6);
        v18[4] = v8;
        +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v9, v12, 0, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedAttributedSuggestion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAttributedTitle:", v14);

        objc_msgSend(v17, "addObject:", v13);
        objc_destroyWeak(&v19);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  return v17;
}

void __52___UISearchSuggestionControllerIOS__suggestionsMenu__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "searchSuggestionController:didSelectSuggestion:atIndexPath:", v5, *(_QWORD *)(a1 + 32), 0);

  }
}

void __64___UISearchSuggestionControllerIOS__dismissMenuWithoutAnimation__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "menuInteraction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissMenu");

}

uint64_t __68___UISearchSuggestionControllerIOS__updateMenuWithSuggestionGroups___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_suggestionsMenu");
}

uint64_t __90___UISearchSuggestionControllerIOS_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_suggestionsMenu");
}

void __73___UISearchSuggestionControllerIOS__suggestionsRecoveryGestureRecognized__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "suggestions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSearchSuggestions:");
  }
  else
  {
    objc_msgSend(v2, "searchTextField");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "suggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSearchSuggestions:", v4);

  }
}

@end

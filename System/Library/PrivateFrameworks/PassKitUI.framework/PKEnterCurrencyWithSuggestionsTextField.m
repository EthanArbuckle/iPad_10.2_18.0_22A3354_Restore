@implementation PKEnterCurrencyWithSuggestionsTextField

void __61___PKEnterCurrencyWithSuggestionsTextField_setInputDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "suggestionsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    objc_msgSend(v2, "textSuggestionsForTextField:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuggestions:", v6);

  }
}

@end

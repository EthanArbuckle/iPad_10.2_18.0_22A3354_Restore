@implementation UIKeyShortcutHUDSearchBar

void __49___UIKeyShortcutHUDSearchBar__createCancelButton__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    v5 = objc_loadWeakRetained(&to);
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v6, "searchBarDidPressCancelButton:", v7);

  }
  objc_destroyWeak(&to);

}

@end

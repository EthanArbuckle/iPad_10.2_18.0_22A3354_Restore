@implementation VUITVAppNavigationController

void __81___VUITVAppNavigationController__notifyObserversOfViewControllerChange_animated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (*(_QWORD *)(a1 + 40) != v5)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      objc_msgSend(v3[178], "allObjects", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "numberOfChildControllersDidChangeFor:from:to:animated:", v3, *(_QWORD *)(a1 + 40), v5, *(unsigned __int8 *)(a1 + 48));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

uint64_t __50___VUITVAppNavigationController_dismissAllModals___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83___VUITVAppNavigationController_iOS__accessibilityButtonBackgroundDefaultTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor = v0;

}

@end

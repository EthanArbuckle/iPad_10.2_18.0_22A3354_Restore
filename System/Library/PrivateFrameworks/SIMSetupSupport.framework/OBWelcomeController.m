@implementation OBWelcomeController

uint64_t __67__OBWelcomeController_Spinner___showButtonTraySpinnerWithBusyText___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(v3, "buttonTray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_containsSSOBBoldTrayButton");

    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v6, "buttonTray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "showButtonsBusy");
    }
    else
    {
      objc_msgSend(v6, "_prepareSpinner");
      objc_msgSend(*(id *)(a1 + 32), "buttonTray");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_hide");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setCachedButtons:", v9);

      objc_msgSend(*(id *)(a1 + 32), "buttonTray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "spinnerContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addButton:", v11);

      objc_msgSend(*(id *)(a1 + 32), "spinner");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startAnimating");
    }

    v3 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v3, "_updateBusyText:", *(_QWORD *)(a1 + 40));
}

void __54__OBWelcomeController_Spinner___hideButtonTraySpinner__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_containsSSOBBoldTrayButton");

  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  if (v3)
  {
    objc_msgSend(v4, "showButtonsAvailable");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "spinnerContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v12, "_containsButton:", v5);

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "buttonTray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "spinnerContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeButton:", v8);

    }
    objc_msgSend(*(id *)(a1 + 32), "spinner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAnimating");

    objc_msgSend(*(id *)(a1 + 32), "buttonTray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cachedButtons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_show:", v11);

    objc_msgSend(*(id *)(a1 + 32), "setCachedButtons:", 0);
  }
}

@end

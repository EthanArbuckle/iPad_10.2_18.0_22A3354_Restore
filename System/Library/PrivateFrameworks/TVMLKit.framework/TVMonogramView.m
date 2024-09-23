@implementation TVMonogramView

void __59___TVMonogramView__loadWithMonogramDescription_imageProxy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id *v7;
  id *WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v7 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a4)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "preferedMonogramType");
    if (a2 || !v9)
    {
      objc_msgSend(WeakRetained[105], "setHidden:", 1);
      objc_msgSend(WeakRetained[116], "setHidden:", 0);
      objc_msgSend(WeakRetained, "_updateAppearanceForSelectionStateWithCoordinator:", 0);
      if (a2)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postNotificationName:object:", CFSTR("TVMonogramViewImageDidUpdateNotification"), WeakRetained);

      }
    }
    else
    {
      if ((unint64_t)(v9 - 3) >= 3)
        v10 = v9 - 1;
      else
        v10 = 2;
      v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyWithType:", v10);
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __59___TVMonogramView__loadWithMonogramDescription_imageProxy___block_invoke_2;
      v17 = &unk_24EB85398;
      objc_copyWeak(&v19, v7);
      v18 = v11;
      v12 = v11;
      dispatch_async(MEMORY[0x24BDAC9B8], &v14);

      objc_destroyWeak(&v19);
      objc_msgSend(WeakRetained, "_updateAppearanceForSelectionStateWithCoordinator:", 0, v14, v15, v16, v17);
    }
  }

}

void __59___TVMonogramView__loadWithMonogramDescription_imageProxy___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_loadWithMonogramDescription:imageProxy:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = v3;
  }

}

@end

@implementation TVRUIUpNextViewControllerCell

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "openProductPageForKind:", 3);

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "openProductPageForKind:", 2);

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "openProductPageForKind:", 1);

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "openProductPageForKind:", 1);

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "upNextInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shareEpisodeForInfo:sourceView:", v2, v3);

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "upNextInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shareShowForInfo:sourceView:", v2, v3);

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_7(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "upNextInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sharePrimaryForInfo:sourceView:", v2, v3);

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_8(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "upNextInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sharePrimaryForInfo:sourceView:", v2, v3);

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "upNextInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemFromUpNext:", v3);

    WeakRetained = v4;
  }

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "upNextInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "markItemAsWatched:", v3);

    WeakRetained = v4;
  }

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_359(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "arrayByAddingObject:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_2_361(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "hasURLForProductPageKind:", a2))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __55___TVRUIUpNextViewControllerCell__updateForUpNextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "upNextInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length") && objc_msgSend(v12, "isEqualToString:", v10))
    {
      objc_msgSend(v7, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v5);

    }
  }

}

__CFString *__62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  v6 = &stru_24DE30718;
  if (v4)
    v6 = v4;
  v7 = v6;
  if (objc_msgSend(v5, "length"))
  {
    if (-[__CFString length](v4, "length"))
      v8 = CFSTR(" • %@");
    else
      v8 = CFSTR("%@");
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v9;
  }

  return v7;
}

@end

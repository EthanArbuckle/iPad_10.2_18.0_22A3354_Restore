@implementation TVBgImageLoadingViewController

void __64___TVBgImageLoadingViewController_configureAppearanceTransition__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  objc_msgSend(v5, "_setBackgroundOpacity:", *(double *)(a1 + 40));
  objc_msgSend(v5, "_setTitleOpacity:", *(double *)(a1 + 40));

}

void __64___TVBgImageLoadingViewController_configureAppearanceTransition__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "tvmlkit_keyColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  objc_msgSend(v5, "_setBackgroundOpacity:", *(double *)(a1 + 40));
  objc_msgSend(v5, "_setTitleOpacity:", *(double *)(a1 + 40));

}

void __69___TVBgImageLoadingViewController_loadFromViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;
  char v10;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69___TVBgImageLoadingViewController_loadFromViewController_completion___block_invoke_2;
  v5[3] = &unk_24EB86808;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v9 = *(_BYTE *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 49);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v8);
}

void __69___TVBgImageLoadingViewController_loadFromViewController_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "uiImage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)WeakRetained[121];
    WeakRetained[121] = 0;

    objc_msgSend(WeakRetained, "_configureWithBgImage:backdropImage:", v2, 0);
  }
  else
  {
    v2 = 0;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, BOOL))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 57), v2 != 0);
  }

}

@end

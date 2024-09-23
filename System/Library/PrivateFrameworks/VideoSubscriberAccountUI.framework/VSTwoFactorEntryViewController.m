@implementation VSTwoFactorEntryViewController

void __49__VSTwoFactorEntryViewController_iOS_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a2;
  v5 = a3;
  v17 = v4;
  objc_msgSend(v17, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
  {
    objc_msgSend(v17, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");

    objc_msgSend(v17, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferredLogoSize");
    objc_msgSend(v17, "vs_updateViewModel:withUserInterfaceStyle:andPreferredLogoSize:", v11, v10);

  }
  objc_msgSend(v17, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v14)
  {
    objc_msgSend(v17, "fontCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTraitCollection:", v16);

  }
}

void __52__VSTwoFactorEntryViewController_iOS_viewDidAppear___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "digitView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

@end

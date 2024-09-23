@implementation VSCredentialEntryViewController

void __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v7, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_specifierForTextField:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(WeakRetained, "_setText:forSpecifier:", v5, v6);

  }
}

void __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  double v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF7A20]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CGRectValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF79C0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF79B8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(WeakRetained, "setKeyboardHeight:", v8);
    objc_msgSend(WeakRetained, "table");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDF6F90];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_3;
    v17[3] = &unk_24FE1A108;
    v18 = WeakRetained;
    v19 = v14;
    v20 = v8;
    v16 = v14;
    objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", v13 << 16, v17, 0, v11, 0.0);

  }
}

uint64_t __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLinkButtonLayout");
  objc_msgSend(*(id *)(a1 + 40), "scrollIndicatorInsets");
  return objc_msgSend(*(id *)(a1 + 40), "setScrollIndicatorInsets:");
}

void __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  double v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF7A18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CGRectValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF79C0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF79B8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(WeakRetained, "setKeyboardHeight:", v8);
    objc_msgSend(WeakRetained, "table");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDF6F90];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_5;
    v17[3] = &unk_24FE1A108;
    v18 = WeakRetained;
    v19 = v14;
    v20 = v8;
    v16 = v14;
    objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", v13 << 16, v17, 0, v11, 0.0);

  }
}

uint64_t __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLinkButtonLayout");
  objc_msgSend(*(id *)(a1 + 40), "scrollIndicatorInsets");
  return objc_msgSend(*(id *)(a1 + 40), "setScrollIndicatorInsets:");
}

void __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  v6 = v2;
  objc_msgSend(v6, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredLogoSize");
  objc_msgSend(v6, "vs_updateViewModel:withUserInterfaceStyle:andPreferredLogoSize:", v5, v4);

}

void __86__VSCredentialEntryViewController_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pickerButtonSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pickerTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "pickerButtonSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifier:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "pickerSpecifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadSpecifier:", v7);

}

@end

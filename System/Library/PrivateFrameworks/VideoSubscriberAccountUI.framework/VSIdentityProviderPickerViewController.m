@implementation VSIdentityProviderPickerViewController

void __60__VSIdentityProviderPickerViewController_iOS_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "fontCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTraitCollection:", v3);
}

uint64_t __89__VSIdentityProviderPickerViewController_iOS_dismissSearchControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "selectedIdentityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_performSelectionForIdentityProvider:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setSelectedIdentityProvider:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __57__VSIdentityProviderPickerViewController_iOS_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

uint64_t __63__VSIdentityProviderPickerViewController_iOS_showPrivacySheet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showPrivacySheet:", *(_QWORD *)(a1 + 40));
}

void __79__VSIdentityProviderPickerViewController_iOS_handleSignInActionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "searchBarDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearText");

  objc_msgSend(*(id *)(a1 + 32), "setAdditionalProvidersMode:", 5);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79__VSIdentityProviderPickerViewController_iOS_handleSignInActionWithCompletion___block_invoke_2;
  v4[3] = &unk_24FE19C00;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "vs_scrollToTopAnimated:completion:", 1, v4);

}

uint64_t __79__VSIdentityProviderPickerViewController_iOS_handleSignInActionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

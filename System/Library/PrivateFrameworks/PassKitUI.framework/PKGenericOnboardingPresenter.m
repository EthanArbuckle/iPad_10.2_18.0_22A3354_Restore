@implementation PKGenericOnboardingPresenter

void __PKGenericOnboardingPresenter_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v3;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Presenting onboarding for identifiers: %@", (uint8_t *)&v14, 0xCu);
  }

  v5 = v3;
  v6 = objc_msgSend(v5, "count");
  v7 = (void *)MEMORY[0x1E0D65198];
  if (v6 == 1)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "presenterForPrivacySplashWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacyUnifiedAboutWithIdentifiers:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "setPresentingViewController:", WeakRetained);

  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(WeakRetained) = objc_msgSend(v11, "pkui_userInterfaceIdiomSupportsLargeLayouts");

  if ((_DWORD)WeakRetained)
    objc_msgSend(v9, "setModalPresentationStyle:", 2);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v9, "splashController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v9, "present");

}

@end

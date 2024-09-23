@implementation PKOpenOnboardingHyperlinkAction

void __PKOpenOnboardingHyperlinkAction_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  onboardingIdentifiersFromURL(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Couldn't present onboarding for link %@, no onboarding identifiers found.", (uint8_t *)&v6, 0xCu);
    }

  }
}

@end

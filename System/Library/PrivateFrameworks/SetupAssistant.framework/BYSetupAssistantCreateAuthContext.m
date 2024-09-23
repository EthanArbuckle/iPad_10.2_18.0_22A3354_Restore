@implementation BYSetupAssistantCreateAuthContext

void __BYSetupAssistantCreateAuthContext_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  BYBuddyDaemonGeneralClient *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _BYLoggingFacility();
    v8 = (BYBuddyDaemonGeneralClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
    {
      v9 = _BYIsInternalInstall();
      v10 = v7;
      if ((v9 & 1) == 0)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "domain");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v7, "code"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1A4E92000, &v8->super, OS_LOG_TYPE_DEFAULT, "Failed to create context for biometric: %{public}@", buf, 0xCu);
      if ((v9 & 1) == 0)
      {

      }
    }
  }
  else
  {
    v8 = objc_alloc_init(BYBuddyDaemonGeneralClient);
    -[BYBuddyDaemonGeneralClient storeAuthenticationContextforBiometric:](v8, "storeAuthenticationContextforBiometric:", v6);
    _BYLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v12, OS_LOG_TYPE_DEFAULT, "Creating and storing context for Apple Pay...", buf, 2u);
    }

    +[BYAuthenticationContext createContextWithSecret:policy:options:completion:](BYAuthenticationContext, "createContextWithSecret:policy:options:completion:", *(_QWORD *)(a1 + 32), 2, MEMORY[0x1E0C9AA70], &__block_literal_global_128);
  }

}

void __BYSetupAssistantCreateAuthContext_block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v5;
  id v6;
  BYBuddyDaemonGeneralClient *v7;
  char v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _BYLoggingFacility();
    v7 = (BYBuddyDaemonGeneralClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      v8 = _BYIsInternalInstall();
      v9 = v6;
      if ((v8 & 1) == 0)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "domain");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v6, "code"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1A4E92000, &v7->super, OS_LOG_TYPE_DEFAULT, "Failed to create context for Apple Pay: %{public}@", buf, 0xCu);
      if ((v8 & 1) == 0)
      {

      }
    }
  }
  else
  {
    v7 = objc_alloc_init(BYBuddyDaemonGeneralClient);
    -[BYBuddyDaemonGeneralClient storeAuthenticationContextforApplyPay:](v7, "storeAuthenticationContextforApplyPay:", v5);
  }

}

@end

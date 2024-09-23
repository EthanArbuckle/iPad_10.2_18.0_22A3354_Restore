@implementation ICSGPSpecifierProvider

- (ICSGPSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICSGPSpecifierProvider *v6;
  ICSGPSpecifierProvider *v7;
  PHPhotoLibraryManager *v8;
  PHPhotoLibraryManager *photoLibraryManager;
  uint64_t v10;
  PHPhotoLibraryIdentifier *photoLibraryIdentifier;
  PHPhotoLibraryManager *v12;
  PHPhotoLibraryIdentifier *v13;
  uint64_t v14;
  id v15;
  PHPhotoLibrary *photoLibrary;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ICSGPSpecifierProvider;
  v6 = -[ICSGPSpecifierProvider init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v8 = (PHPhotoLibraryManager *)objc_alloc_init(MEMORY[0x24BDE3620]);
    photoLibraryManager = v7->_photoLibraryManager;
    v7->_photoLibraryManager = v8;

    objc_msgSend(MEMORY[0x24BDE3618], "defaultApplicationLibraryIdentifierWithContainerIdentifier:", CFSTR("com.apple.GenerativePlayground"));
    v10 = objc_claimAutoreleasedReturnValue();
    photoLibraryIdentifier = v7->_photoLibraryIdentifier;
    v7->_photoLibraryIdentifier = (PHPhotoLibraryIdentifier *)v10;

    v12 = v7->_photoLibraryManager;
    v13 = v7->_photoLibraryIdentifier;
    v25 = 0;
    -[PHPhotoLibraryManager openPhotoLibraryWithIdentifier:options:error:](v12, "openPhotoLibraryWithIdentifier:options:error:", v13, 0, &v25);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v25;
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v14;

    if (v15)
    {
      LogSubsystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ICSGPSpecifierProvider initWithAccountManager:].cold.1((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);

    }
  }

  return v7;
}

- (id)account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPrimaryAccount
{
  void *v2;
  char v3;

  -[ICSGPSpecifierProvider account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

  return v3;
}

- (NSArray)specifiers
{
  uint64_t v3;
  void *v4;
  NSArray *v5;
  NSArray *specifiers;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_specifiers)
  {
    -[ICSGPSpecifierProvider _specifierForGP](self, "_specifierForGP");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      v8[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      specifiers = self->_specifiers;
      self->_specifiers = v5;

    }
  }
  if (-[ICSGPSpecifierProvider _shouldShowGPSpecifier](self, "_shouldShowGPSpecifier"))
    return self->_specifiers;
  else
    return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (id)_specifierForGP
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GP_TOGGLE_NAME"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_gpSwitchStateDidChange_, sel_gpSwitchState, 0, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSGPSpecifierProvider _appIcon](self, "_appIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v6;
}

- (id)gpSwitchState
{
  PHPhotoLibraryIdentifier *photoLibraryIdentifier;
  PHPhotoLibraryManager *photoLibraryManager;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;

  photoLibraryManager = self->_photoLibraryManager;
  photoLibraryIdentifier = self->_photoLibraryIdentifier;
  v9 = 0;
  -[PHPhotoLibraryManager attributesForLibraryWithIdentifier:error:](photoLibraryManager, "attributesForLibraryWithIdentifier:error:", photoLibraryIdentifier, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICSGPSpecifierProvider gpSwitchState].cold.1((uint64_t)v5, v6);

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isCloudSyncEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v7;
}

- (void)gpSwitchStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  PHPhotoLibrary *photoLibrary;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogSubsystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[ICSGPSpecifierProvider gpSwitchStateDidChange:]";
    v21 = 1024;
    v22 = objc_msgSend(v4, "BOOLValue");
    _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "%s: %d", buf, 0x12u);
  }

  photoLibrary = self->_photoLibrary;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __49__ICSGPSpecifierProvider_gpSwitchStateDidChange___block_invoke;
  v17[3] = &unk_251C60DC8;
  v7 = v4;
  v18 = v7;
  v16 = 0;
  -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v17, &v16);
  v8 = v16;
  if (v8)
  {
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICSGPSpecifierProvider gpSwitchStateDidChange:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

void __49__ICSGPSpecifierProvider_gpSwitchStateDidChange___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDE35F8]);
  objc_msgSend(v2, "setEnableCloudSync:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));

}

- (BOOL)_shouldShowGPSpecifier
{
  int isPlatformVersionAtLeast;
  void *v4;
  char v5;
  char v6;
  NSObject *v7;

  isPlatformVersionAtLeast = __isPlatformVersionAtLeast(2, 18, 1, 0);
  if (isPlatformVersionAtLeast)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "applicationIsInstalled:", CFSTR("com.apple.GenerativePlaygroundApp"));

    v6 = -[ICSGPSpecifierProvider isPrimaryAccount](self, "isPrimaryAccount");
    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ICSGPSpecifierProvider _shouldShowGPSpecifier].cold.1(v5, v6, v7);

    LOBYTE(isPlatformVersionAtLeast) = v5 & v6;
  }
  return isPlatformVersionAtLeast;
}

- (id)_appIcon
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;

  if (-[ICSGPSpecifierProvider _shouldShowGPSpecifier](self, "_shouldShowGPSpecifier"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", CFSTR("com.apple.GenerativePlaygroundApp"));
    objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AF0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "prepareImageForDescriptor:", v3);
    objc_msgSend(v2, "imageForDescriptor:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BEBD640];
      v8 = objc_msgSend(v5, "CGImage");
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      objc_msgSend(v7, "imageWithCGImage:scale:orientation:", v8, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      return v10;
    }

  }
  LogSubsystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[ICSGPSpecifierProvider _appIcon].cold.1(v11);

  v10 = objc_alloc_init(MEMORY[0x24BEBD640]);
  return v10;
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_photoLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_photoLibraryManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)initWithAccountManager:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "ICSGPSpecifierProvider init photo library failed with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)gpSwitchState
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[ICSGPSpecifierProvider gpSwitchState]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_ERROR, "%s fetching attributes failed with error %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)gpSwitchStateDidChange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "setting GP sync failed with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_shouldShowGPSpecifier
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[ICSGPSpecifierProvider _shouldShowGPSpecifier]";
  v5 = 1024;
  v6 = a1 & 1;
  v7 = 1024;
  v8 = a2 & 1;
  _os_log_debug_impl(&dword_24B4C1000, log, OS_LOG_TYPE_DEBUG, "%s: isAppInstalled: %d isPrimaryAccount: %d", (uint8_t *)&v3, 0x18u);
  OUTLINED_FUNCTION_3();
}

- (void)_appIcon
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24B4C1000, log, OS_LOG_TYPE_ERROR, "Unable to get GP icon, missing app or ISImage", v1, 2u);
}

@end

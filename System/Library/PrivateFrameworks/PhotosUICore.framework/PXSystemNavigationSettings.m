@implementation PXSystemNavigationSettings

+ (PXSystemNavigationSettings)sharedInstance
{
  if (sharedInstance_onceToken_154363 != -1)
    dispatch_once(&sharedInstance_onceToken_154363, &__block_literal_global_154364);
  return (PXSystemNavigationSettings *)(id)sharedInstance_sharedInstance_154365;
}

+ (id)settingsControllerModule
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke;
  v9[3] = &unk_1E51438B0;
  v10 = v2;
  v3 = v2;
  PXSystemNavigationEnumerateDestinations(v9);
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v3, CFSTR("Destinations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D83078];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moduleWithTitle:contents:", CFSTR("System Navigation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  unint64_t v15;

  PXSystemNavigationDestinationDescription(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D830A0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke_2;
  v13 = &unk_1E5144E90;
  v14 = v4;
  v15 = a2;
  v6 = v4;
  objc_msgSend(v5, "actionWithHandler:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", v6, v7, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

uint64_t __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Will navigate to destination: %{public}@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke_4;
  v6[3] = &unk_1E5148B78;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", v4, v6);

  return 1;
}

void __54__PXSystemNavigationSettings_settingsControllerModule__block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138543362;
      v15 = v8;
      v9 = "Did navigate to destination: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138543618;
    v15 = v13;
    v16 = 2114;
    v17 = v5;
    v9 = "Failed to navigate to destination: %{public}@, error: %{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __44__PXSystemNavigationSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemNavigationSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_154365;
  sharedInstance_sharedInstance_154365 = v0;

}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

@end

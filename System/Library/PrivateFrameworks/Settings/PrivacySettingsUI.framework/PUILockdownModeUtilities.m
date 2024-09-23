@implementation PUILockdownModeUtilities

+ (BOOL)getCanShowLockdownMode
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getUMUserManagerClass_softClass;
  v11 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getUMUserManagerClass_block_invoke;
    v7[3] = &unk_1EA26B260;
    v7[4] = &v8;
    __getUMUserManagerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSharedIPad") ^ 1;

  return v5;
}

+ (BOOL)getCanSetLockdownMode
{
  return objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode") ^ 1;
}

+ (BOOL)isLockdownModeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getLockdownModeManagerClass(), "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  return v3;
}

+ (BOOL)isLockdownModeEnabledInAccount
{
  void *v2;
  char v3;

  objc_msgSend(getLockdownModeManagerClass(), "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabledInAccount");

  return v3;
}

+ (void)setLockdownModeEnabled:(BOOL)a3 forAllDevices:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v5 = a4;
  v6 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(getLockdownModeManagerClass(), "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("allDevices");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PUILockdownModeUtilities_setLockdownModeEnabled_forAllDevices_completion___block_invoke;
  v12[3] = &unk_1EA26CBB8;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v8, "setEnabled:options:completion:", v6, v10, v12);

}

uint64_t __76__PUILockdownModeUtilities_setLockdownModeEnabled_forAllDevices_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isCaptivePortalModeIgnoredForContainerPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(get_WKSystemPreferencesClass(), "isCaptivePortalModeIgnored:", v3);

  return v4;
}

+ (void)setCaptivePortalModeIgnoredForContainerPath:(id)a3 ignored:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = a3;
  objc_msgSend(get_WKSystemPreferencesClass(), "setCaptivePortalModeIgnored:ignore:", v5, v4);

}

@end

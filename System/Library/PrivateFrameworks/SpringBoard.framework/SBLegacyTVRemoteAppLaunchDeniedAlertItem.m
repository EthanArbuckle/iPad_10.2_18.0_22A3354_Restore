@implementation SBLegacyTVRemoteAppLaunchDeniedAlertItem

- (BOOL)dismissOnLock
{
  return 1;
}

- (BOOL)ignoreIfAlreadyDisplaying
{
  return 1;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LEGACY_TVREMOTEAPP_LAUNCH_ALERT_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LEGACY_TVREMOTEAPP_LAUNCH_ALERT_MESSAGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v9);

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LEGACY_TVREMOTEAPP_LAUNCH_BUTTON_LEARN_MORE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__SBLegacyTVRemoteAppLaunchDeniedAlertItem_configure_requirePasscodeForActions___block_invoke;
  v20[3] = &unk_1E8E9DCB0;
  v20[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __80__SBLegacyTVRemoteAppLaunchDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v19[3] = &unk_1E8E9DCB0;
  v19[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v18);

}

uint64_t __80__SBLegacyTVRemoteAppLaunchDeniedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "_supportURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v4, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

uint64_t __80__SBLegacyTVRemoteAppLaunchDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (id)_supportURLString
{
  void *v3;
  uint64_t v4;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      return CFSTR("https://support.apple.com/ht201664?cid=mc-ols-appletv-article_ht201664-ipados_ui-10062021");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 1)
      return CFSTR("https://support.apple.com/ht201664?cid=mc-ols-appletv-article_ht201664-ipados_ui-10062021");
  }
  return CFSTR("https://support.apple.com/ht201664?cid=mc-ols-appletv-article_ht201664-ios_ui-10062021");
}

@end

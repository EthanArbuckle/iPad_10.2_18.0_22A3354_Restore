@implementation SBActivityAlert

- (SBActivityAlert)initWithItem:(id)a3 payloadIdentifier:(id)a4 options:(id)a5 title:(id)a6 body:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBActivityAlert *v17;
  SBActivityAlert *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBActivityAlert;
  v17 = -[SBActivityAlert init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_item, a3);
    objc_storeStrong((id *)&v18->_payloadIdentifier, a4);
    objc_storeStrong((id *)&v18->_options, a5);
    objc_storeStrong((id *)&v18->_title, a6);
    objc_storeStrong((id *)&v18->_body, a7);
  }

  return v18;
}

- (SBActivityAlert)alertWithScreenOn:(BOOL)a3 playSound:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SBActivityAlert *result;
  const __CFString *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v4 = a4;
  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  -[SBActivityItem identifier](self->_item, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SBLogActivity();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] alerting with sound", buf, 0xCu);
    }

    -[SBActivityAlert _playSound](self, "_playSound");
  }
  if (v5)
  {
    SBLogActivity();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Turn on screen", buf, 0xCu);
    }

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
    v14 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlockUIFromSource:withOptions:", 36, v11);

  }
  return result;
}

- (BOOL)canPresentInEnvironment:(int64_t)a3 alertType:(int64_t)a4
{
  BOOL result;

  BSDispatchQueueAssertMain();
  switch(a4)
  {
    case 0:
      result = -[SBActivityAlert canPresentAlertTypeNoneInEnvironment:](self, "canPresentAlertTypeNoneInEnvironment:", a3);
      break;
    case 1:
    case 2:
      result = -[SBActivityAlert canPresentAlertTypeBannerOrSystemApertureInEnvironment:](self, "canPresentAlertTypeBannerOrSystemApertureInEnvironment:", a3);
      break;
    case 3:
      result = -[SBActivityAlert canPresentAlertTypeAmbientInEnvironment:](self, "canPresentAlertTypeAmbientInEnvironment:", a3);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)canPresentAlertTypeNoneInEnvironment:(int64_t)a3
{
  return a3
      || -[SBActivityAlert canPresentAlertTypeBannerOrSystemApertureInEnvironment:](self, "canPresentAlertTypeBannerOrSystemApertureInEnvironment:");
}

- (BOOL)canPresentAlertTypeAmbientInEnvironment:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)canPresentAlertTypeBannerOrSystemApertureInEnvironment:(int64_t)a3
{
  int v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    +[SBLiveActivityDomain rootSettings](SBLiveActivityDomain, "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowAlertsOnHostApp");

    -[SBActivityAlert item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldSuppressAlertContentOnLockScreen");

    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isPresented");

    if (v6)
    {
      v13 = 0;
      v14 = v10 & v12;
    }
    else
    {
      v13 = -[SBActivityAlert _isHostApplicationForeground](self, "_isHostApplicationForeground");
      v14 = v13 | v10 & v12;
    }
    v3 = v14 ^ 1;
    SBLogActivity();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SBActivityItem identifier](self->_item, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544642;
      v19 = v16;
      v20 = 1024;
      v21 = v3;
      v22 = 1024;
      v23 = v13;
      v24 = 1024;
      v25 = v12;
      v26 = 1024;
      v27 = v10 ^ 1;
      v28 = 1024;
      v29 = v6;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] can present alert: %d,  isHostApplicationForeground: %d, isCoverSheetVisible: %d, allowAlertsOnCoverSheet: %d, allowAlertsOnHostApp: %d", (uint8_t *)&v18, 0x2Au);

    }
  }
  return v3;
}

- (BOOL)shouldAlertInEnvironment:(int64_t)a3
{
  BOOL v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v8;

  BSDispatchQueueAssertMain();
  v5 = -[SBActivityAlert _hasPresentationDestination:](self, "_hasPresentationDestination:", 3);
  v6 = -[SBActivityAlert _hasPresentationDestination:](self, "_hasPresentationDestination:", 1);
  v7 = -[SBActivityAlert _hasPresentationDestination:](self, "_hasPresentationDestination:", 0);
  v8 = (v6 || v7) | -[SBActivityAlert _hasPresentationDestination:](self, "_hasPresentationDestination:", 2);
  if (a3)
    LOBYTE(v8) = 0;
  if (a3 == 1)
    return v5;
  else
    return v8;
}

- (BOOL)_hasPresentationDestination:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[SBActivityAlert item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "presentationOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SBActivityAlert__hasPresentationDestination___block_invoke;
  v9[3] = &__block_descriptor_40_e43_B16__0__ACActivityPresentationDestination_8l;
  v9[4] = a3;
  LOBYTE(a3) = objc_msgSend(v7, "bs_containsObjectPassingTest:", v9);

  return a3;
}

BOOL __47__SBActivityAlert__hasPresentationDestination___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "destination") == *(_QWORD *)(a1 + 32);
}

- (void)_playSound
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ACUISActivityAlertOptions alertConfiguration](self->_options, "alertConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBF738]), "initWithType:", 16);
  v7 = (id)v2;
  v3 = objc_alloc(MEMORY[0x1E0DAC2A0]);
  objc_msgSend(MEMORY[0x1E0DBF730], "alertWithConfiguration:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithToneAlert:", v4);

  +[SBSoundController sharedInstance](SBSoundController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playSoundWithDefaultEnvironment:", v5);

}

- (BOOL)_isHostApplicationForeground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  BSDispatchQueueAssertMain();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[SBActivityItem descriptor](self->_item, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platterTargetBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeDisplayWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__SBActivityAlert__isHostApplicationForeground__block_invoke;
  v11[3] = &unk_1E8EA7360;
  v9 = v4;
  v12 = v9;
  v13 = &v14;
  objc_msgSend(v8, "enumerateSwitcherControllersWithBlock:", v11);

  LOBYTE(v7) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v7;
}

void __47__SBActivityAlert__isHostApplicationForeground__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a2, "layoutStateApplicationSceneHandles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "application");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v12)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityAlert;
  -[SBActivityAlert description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityAlert descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBActivityAlert succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBActivityAlert descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  -[SBActivityAlert succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_item, CFSTR("item"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_payloadIdentifier, CFSTR("payloadIdentifier"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_options, CFSTR("options"));
  return v4;
}

- (SBActivityItem)item
{
  return self->_item;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (ACUISActivityAlertOptions)options
{
  return self->_options;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void)setProminent:(BOOL)a3
{
  self->_prominent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end

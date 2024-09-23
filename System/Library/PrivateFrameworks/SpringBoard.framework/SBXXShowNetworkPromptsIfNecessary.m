@implementation SBXXShowNetworkPromptsIfNecessary

void ___SBXXShowNetworkPromptsIfNecessary_block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  char v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (!*(_BYTE *)(a1 + 40))
  {
LABEL_7:
    v5 = 1;
LABEL_8:
    +[SBAirplaneModeController sharedInstance](SBAirplaneModeController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isInAirplaneMode") & 1) != 0)
    {
      +[SBWiFiManager sharedInstance](SBWiFiManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPowered");

      if ((v8 & 1) != 0)
      {
        if (!v5)
          return;
        goto LABEL_14;
      }
      objc_msgSend((id)SBApp, "applicationLaunchAlertService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "showLaunchAlertOfType:forApplication:", 2, *(_QWORD *)(a1 + 32));
    }

    if (!v5)
      return;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DAC2D8];
    v10 = *(void **)(a1 + 32);
    v11 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v10, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, *MEMORY[0x1E0DAC428]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", v9, v10, v13);

    return;
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "dataUsage");
  v3 = v2;
  if (!*(_BYTE *)(a1 + 40))
  {
    if (v2)
      goto LABEL_14;
    goto LABEL_7;
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "dataUsage");
  v5 = (v4 & 2) == 0;
  if (!v3)
    goto LABEL_8;
  if ((v4 & 2) == 0)
    goto LABEL_14;
}

@end

@implementation UIApplication(VideosUI)

+ (BOOL)vuiIsActive
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "applicationState") == 0;

  return v1;
}

- (uint64_t)vuiIsNonLightningAVAdapterConnected
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "connectedScenes", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 |= objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "vui_isNonLightningSecondScreenScene");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4 & 1;
}

- (id)vuiDelegate
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "conformsToProtocol:", &unk_1F037D5B8))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

+ (BOOL)vuiIsRTL
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceLayoutDirection");

  return v1 == 1;
}

@end

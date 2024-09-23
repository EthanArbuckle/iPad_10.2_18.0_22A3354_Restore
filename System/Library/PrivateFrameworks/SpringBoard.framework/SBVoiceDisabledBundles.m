@implementation SBVoiceDisabledBundles

+ (void)setAppDisabledVoiceControl:(BOOL)a3 bundleIdentifier:(id)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v5 = (void *)__disabledVoiceControlBundleIds;
    if (v4)
    {
      v6 = v10;
      if (!__disabledVoiceControlBundleIds)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
        v8 = (void *)__disabledVoiceControlBundleIds;
        __disabledVoiceControlBundleIds = v7;

        v6 = v10;
        v5 = (void *)__disabledVoiceControlBundleIds;
      }
      objc_msgSend(v5, "addObject:", v6);
    }
    else
    {
      objc_msgSend((id)__disabledVoiceControlBundleIds, "removeObject:", v10);
      if (!objc_msgSend((id)__disabledVoiceControlBundleIds, "count"))
      {
        v9 = (void *)__disabledVoiceControlBundleIds;
        __disabledVoiceControlBundleIds = 0;

      }
    }
  }

}

+ (BOOL)voiceControlDisabledByCurrentlyRunningApp
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (id)objc_msgSend((id)__disabledVoiceControlBundleIds, "copy");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "applicationWithBundleIdentifier:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "processState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isRunning");

        if ((v12 & 1) != 0)
          v5 = 1;
        else
          objc_msgSend(a1, "setAppDisabledVoiceControl:bundleIdentifier:", 0, v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

@end

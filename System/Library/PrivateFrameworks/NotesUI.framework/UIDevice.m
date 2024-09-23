@implementation UIDevice

void __38__UIDevice_IC__ic_isLiveTextAvailable__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:inDomain:", CFSTR("AppleLiveTextEnabled"), *MEMORY[0x1E0CB2B58]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v2 = objc_msgSend(v1, "BOOLValue");
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(&unk_1E5C71A30, "arrayByAddingObjectsFromArray:", &unk_1E5C71A48);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = &unk_1E5C71A30;
    }
    v4 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = objc_msgSend(v7, "count") != 0;
  }

  ic_isLiveTextAvailable_isIPLiveTextEnabled = v2;
}

@end

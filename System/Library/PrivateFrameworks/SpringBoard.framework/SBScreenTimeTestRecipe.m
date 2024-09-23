@implementation SBScreenTimeTestRecipe

- (id)title
{
  return CFSTR("Screen Time Policy Test");
}

- (void)handleVolumeIncrease
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  -[SBScreenTimeTestRecipe _defaultIdentifiers](self, "_defaultIdentifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:", v4, 1);

}

- (void)handleVolumeDecrease
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  -[SBScreenTimeTestRecipe _defaultIdentifiers](self, "_defaultIdentifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:", v4, 0);

}

- (id)_defaultIdentifiers
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.mobilecal");
  v3[1] = CFSTR("com.apple.mobilesafari");
  v3[2] = CFSTR("com.apple.calculator");
  v3[3] = CFSTR("com.apple.MobileSMS");
  v3[4] = CFSTR("com.apple.Maps");
  v3[5] = CFSTR("com.apple.facetime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_setApplicationBundleIdentifiers:(id)a3 blockedForScreenTimeExpiration:(BOOL)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  _SBDMPolicyTestAppInfo *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v23 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 512);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v10, v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = -[_SBDMPolicyTestAppInfo initWithApplicationProxy:]([_SBDMPolicyTestAppInfo alloc], "initWithApplicationProxy:", v11);
          -[_SBDMPolicyTestAppInfo setTestAppBlocked:](v13, "setTestAppBlocked:", v23);
          +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "applicationWithBundleIdentifier:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "info");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v22, "setObject:forKey:", v13, v16);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }
  v17 = v5;

  v18 = objc_opt_class();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_appLibraryObserver");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "_didUpdateApplications:", v22);
}

@end

@implementation NSUserDefaults

void __87__NSUserDefaults_SafariSharedUIExtras__safari_resetWebKitExperimentalFeaturesIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stringForKey:", CFSTR("SafariVersionForExperimentalFeatures"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 40);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "safari_shortVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 || objc_msgSend(v2, "compare:options:", v4, 64) == -1)
  {
    v12 = v2;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, CFSTR("SafariVersionForExperimentalFeatures"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(MEMORY[0x1E0CEF5F0], "_experimentalFeatures");
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
          v10 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0C99EA0], "safari_keyForWebKitExperimentalFeature:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeObjectForKey:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v2 = v12;
  }

}

@end

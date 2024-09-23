@implementation NSExtension(SafariSharedExtras)

- (id)sf_uniqueIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_humanReadableDescription
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "_extensionBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedInfoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringForKey:", CFSTR("NSHumanReadableDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v1, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("NSHumanReadableDescription"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)safari_localizedDisplayName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_extensionBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_localizedDisplayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_displayVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_extensionBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_localizedShortVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_localizedContainingAppDisplayName
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "containingUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "localizedContainingName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v1, "containingUrl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleWithURL:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safari_localizedDisplayName");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)safari_launchServicesDeveloperIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_safari_containingAppRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "teamIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_launchServicesDeveloperName
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_safari_containingAppRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "iTunesMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artistName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_safari_containingAppRecord
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(a1, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = (void *)objc_msgSend(v2, "initWithURL:allowPlaceholder:error:", v4, 0, &v9);
  v6 = v9;

  if (!v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSExtension(SafariSharedExtras) _safari_containingAppRecord].cold.1(v7, a1, v6);
  }

  return v5;
}

- (id)safari_containingAppAdamID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_getAssociatedObject(a1, (const void *)safari_containingAppAdamID_containingAppAdamIDKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "_safari_containingAppRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "iTunesMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)objc_msgSend(v7, "storeItemIdentifier");

      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringValue");
        v4 = (id)objc_claimAutoreleasedReturnValue();

        objc_setAssociatedObject(a1, (const void *)safari_containingAppAdamID_containingAppAdamIDKey, v4, (void *)1);
      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (uint64_t)safari_containingAppIsTestFlightApp
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_safari_containingAppRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isBeta");

  return v2;
}

- (id)_safari_stringFromContainingAppInfoPlistWithKey:()SafariSharedExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "infoDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)safari_correspondingMacOSExtensionBundleIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_extensionBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringForKey:", CFSTR("SFSafariCorrespondingMacOSExtensionBundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)safari_correspondingMacOSContainingAppBundleIdentifier
{
  return objc_msgSend(a1, "_safari_stringFromContainingAppInfoPlistWithKey:", CFSTR("SFSafariCorrespondingMacOSAppBundleIdentifier"));
}

- (uint64_t)safari_isTestExtension
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.Safari.TestExtensions."));

  return v2;
}

- (void)_safari_containingAppRecord
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138478083;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Couldn't find LSApplicationRecord for %{private}@, error: %{public}@", (uint8_t *)&v8, 0x16u);

}

@end

@implementation NSUserDefaults(PBFUtilities)

+ (id)pbf_unprotectedUserDefaults
{
  if (pbf_unprotectedUserDefaults_onceToken != -1)
    dispatch_once(&pbf_unprotectedUserDefaults_onceToken, &__block_literal_global_169);
  return (id)pbf_unprotectedUserDefaults_unprotectedUserDefaults;
}

+ (id)pbf_snapshotsBuildVersion
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("SnapshotsBuildVersion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (void)pbf_setSnapshotsBuildVersion:()PBFUtilities
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("SnapshotsBuildVersion"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("SnapshotsBuildVersion"));

}

+ (BOOL)pbf_deviceIsCleanInstall
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("StashedDeviceType"));
  v1 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("SnapshotsBuildVersion"));
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("PBF_LOCALE_IDENTIFIER"));
  v5 = objc_claimAutoreleasedReturnValue();

  return (v1 | v3 | v5) == 0;
}

+ (uint64_t)pbf_stashedDeviceTypeOutOfSync
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("StashedDeviceType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "productType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = BSEqualStrings() ^ 1;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (uint64_t)pbf_updateStashedDeviceType
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("StashedDeviceType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = BSEqualStrings();
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("StashedDeviceType"));

  }
  return v4 ^ 1u;
}

+ (BOOL)pbf_clearStashedDeviceType
{
  void *v0;
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("StashedDeviceType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("StashedDeviceType"));

  v3 = objc_msgSend(v1, "length") != 0;
  return v3;
}

+ (id)pbf_snapshotsLocaleIdentifier
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("PBF_LOCALE_IDENTIFIER"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (void)pbf_setSnapshotsLocaleIdentifier:()PBFUtilities
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("PBF_LOCALE_IDENTIFIER"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("PBF_LOCALE_IDENTIFIER"));

}

+ (uint64_t)pbf_snapshotsLocaleDidChange
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("PBF_LOCALE_DID_CHANGE"));

  return v1;
}

+ (void)pbf_setSnapshotsLocaleDidChange:()PBFUtilities
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", a3, CFSTR("PBF_LOCALE_DID_CHANGE"));

}

+ (uint64_t)pbf_keynoteModeEnabled
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("KEYNOTE_MODE"));

  return v1;
}

+ (void)pbf_setKeynoteModeEnabled:()PBFUtilities
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("KEYNOTE_MODE"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("KEYNOTE_MODE"));

}

+ (void)pbf_setNeedsFileProtectionsReset:()PBFUtilities
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", a3, CFSTR("PBF_RESET_FILE_PROTECTIONS"));

}

+ (uint64_t)pbf_needsFileProtectionsReset
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("PBF_RESET_FILE_PROTECTIONS"));

  return v1;
}

+ (BOOL)pbf_hasHadFileProtectionsReset
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("PBF_RESET_FILE_PROTECTIONS"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

+ (id)pbf_activeChargerIdentifier
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("kPBFActiveChargerIdentifierUserDefaultKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (void)pbf_setActiveChargerIdentifier:()PBFUtilities
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("kPBFActiveChargerIdentifierUserDefaultKey"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("kPBFActiveChargerIdentifierUserDefaultKey"));

}

+ (void)pbf_ignoreExtension:()PBFUtilities
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a1, "pbf_ignoredExtensionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v13);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayForKey:", CFSTR("IgnoredExtensionIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    v11 = v10;

    objc_msgSend(v11, "addObject:", v13);
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("IgnoredExtensionIdentifiers"));

  }
}

+ (void)pbf_unignoreExtension:()PBFUtilities
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a1, "pbf_ignoredExtensionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v13);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayForKey:", CFSTR("IgnoredExtensionIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    v11 = v10;

    objc_msgSend(v11, "removeObject:", v13);
    objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("IgnoredExtensionIdentifiers"));

  }
}

+ (id)pbf_ignoredExtensionIdentifiers
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_unprotectedUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayForKey:", CFSTR("IgnoredExtensionIdentifiers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

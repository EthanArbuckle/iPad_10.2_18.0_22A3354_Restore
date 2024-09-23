@implementation SDSeedProgramManager

+ (int64_t)currentSeedProgram
{
  void *v2;
  int64_t v3;

  +[SDBetaManager _currentBetaProgram](SDBetaManager, "_currentBetaProgram");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "program");

  return v3;
}

+ (int64_t)_legacyCurrentSeedProgram
{
  CFPropertyListRef v2;
  int64_t v3;

  v2 = CFPreferencesCopyAppValue(CFSTR("SeedProgram"), CFSTR("com.apple.seeding"));
  v3 = +[SDSeedProgramManager _seedProgramForString:](SDSeedProgramManager, "_seedProgramForString:", v2);
  if (v2)
    CFRelease(v2);
  if ((unint64_t)(v3 - 1) >= 4)
    return 0;
  else
    return v3;
}

+ (void)_setSeedProgramPref:(int64_t)a3
{
  id v3;

  if (a3)
    v3 = +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:");
  else
    v3 = 0;
  CFPreferencesSetValue(CFSTR("SeedProgram"), v3, CFSTR("com.apple.seeding"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesAppSynchronize(CFSTR("com.apple.seeding"));
}

+ (int64_t)currentSeedProgramForDiskAtPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("/")))
    {
      +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 136315138;
        v40 = "+[SDSeedProgramManager currentSeedProgramForDiskAtPath:]";
        _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "%s called on local disk, using preferences instead.", (uint8_t *)&v39, 0xCu);
      }

      v7 = objc_msgSend(a1, "currentSeedProgram");
      goto LABEL_21;
    }
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Library"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("Preferences"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "stringByAppendingPathComponent:", CFSTR("com.apple.seeding.plist"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v19, "fileExistsAtPath:", v18);

    if ((v17 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v18);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        -[NSObject valueForKey:](v20, "valueForKey:", CFSTR("SeedProgram"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (int)objc_msgSend(v22, "intValue");

        if ((unint64_t)(v7 - 1) < 4)
        {
LABEL_20:

          goto LABEL_21;
        }
        +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          +[SDSeedProgramManager currentSeedProgramForDiskAtPath:].cold.3(v23, v24, v25, v26, v27, v28, v29, v30);
      }
      else
      {
        +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          +[SDSeedProgramManager currentSeedProgramForDiskAtPath:].cold.2(v23, v31, v32, v33, v34, v35, v36, v37);
      }

    }
    else
    {
      +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[SDSeedProgramManager currentSeedProgramForDiskAtPath:].cold.4();
    }
    v7 = 0;
    goto LABEL_20;
  }
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[SDSeedProgramManager currentSeedProgramForDiskAtPath:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  v7 = 0;
LABEL_21:

  return v7;
}

+ (BOOL)isEnrolledInSeedProgram
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = objc_msgSend((id)objc_opt_class(), "currentSeedProgram");
  if (!getuid())
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_DEFAULT, "Seeding: isEnrolledInSeedProgram called as root", v5, 2u);
    }

    v2 = objc_msgSend((id)objc_opt_class(), "_currentSeedProgramFromDisk");
  }
  return v2 != 0;
}

+ (BOOL)enrollInSeedProgram:(int64_t)a3 deletingSystemURL:(BOOL)a4
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "_canEnrollInBetaSoftware", a3, a4) & 1) == 0)
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D4F89000, v9, OS_LOG_TYPE_DEFAULT, "Prerelease software installation is not allowed. Will not enroll in seeding.", (uint8_t *)&v11, 2u);
    }

    return 0;
  }
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SDSeedProgramManager enrollInSeedProgram:deletingSystemURL:].cold.1();

    return 0;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "stringForSeedProgram:", a3);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = 136315138;
    v12 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Seeding: Enrolling in seed program: %s", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "_setSeedProgramPref:", a3);
  if (!objc_msgSend((id)objc_opt_class(), "_setCatalogForSeedProgram:", a3)
    || !objc_msgSend((id)objc_opt_class(), "_setAudienceForSeedProgram:", a3))
  {
    return 0;
  }
  v8 = 1;
  objc_msgSend((id)objc_opt_class(), "_setHelpFeedbackMenuEnabled:", 1);
  objc_msgSend((id)objc_opt_class(), "_setSeedOptOutUIDisabled:", 0);
  objc_msgSend((id)objc_opt_class(), "_createFeedbackAssistantSymlink");
  return v8;
}

+ (BOOL)enrollInSeedProgram:(int64_t)a3
{
  return objc_msgSend(a1, "enrollInSeedProgram:deletingSystemURL:", a3, 1);
}

+ (BOOL)unenrollFromSeedProgram
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_DEFAULT, "Seeding: Un-enrolling", (uint8_t *)&v12, 2u);
  }

  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(v4, "stringForSeedProgram:", objc_msgSend((id)objc_opt_class(), "currentSeedProgram"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");
    v12 = 136315138;
    v13 = v6;
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_DEFAULT, "Seeding: Un-enrolling from seed program: %s", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "_setSeedProgramPref:", 0);
  if (objc_msgSend((id)objc_opt_class(), "_currentCatalogIsSeed"))
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      +[SDCatalogUtilities _currentCatalog](SDCatalogUtilities, "_currentCatalog");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = (uint64_t)v8;
      _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Seeding: Clearing catalog: %@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend((id)objc_opt_class(), "_clearSeedCatalog");
  }
  if (objc_msgSend((id)objc_opt_class(), "_currentAudienceIsSeed"))
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      +[SDCatalogUtilities _currentAssetAudience](SDCatalogUtilities, "_currentAssetAudience");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = (uint64_t)v10;
      _os_log_impl(&dword_1D4F89000, v9, OS_LOG_TYPE_DEFAULT, "Seeding: Clearing audience: %@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend((id)objc_opt_class(), "_clearAudience");
  }
  return +[SDProfileUtilities removeSeedingProfile](SDProfileUtilities, "removeSeedingProfile");
}

+ (BOOL)_removeSeedEnrollmentCookie
{
  return 0;
}

+ (int64_t)_currentSeedProgramFromDisk
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/Managed Preferences/mobile/com.apple.seeding.plist"));

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/Managed Preferences/mobile/com.apple.seeding.plist"));
    v5 = objc_claimAutoreleasedReturnValue();
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        +[SDSeedProgramManager _currentSeedProgramFromDisk].cold.2();

      -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("SeedProgram"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "_seedProgramForString:", v7);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[SDSeedProgramManager _currentSeedProgramFromDisk].cold.1(v7, v9, v10);
      v8 = 0;
    }

  }
  else
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = CFSTR("/var/Managed Preferences/mobile/com.apple.seeding.plist");
      _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_INFO, "Seeding plist does not exist at path [%{public}@]", (uint8_t *)&v12, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)_loadSeedCatalogsFromPlist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("SeedCatalogs"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SDSeedProgramManager__loadSeedCatalogsFromPlist__block_invoke;
  v9[3] = &unk_1E98CF568;
  v7 = v6;
  v10 = v7;
  v11 = a1;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __50__SDSeedProgramManager__loadSeedCatalogsFromPlist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend((id)objc_opt_class(), "_seedProgramForString:", v7);

  objc_msgSend(v4, "numberWithInteger:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v9);

}

+ (id)_loadSeedAudiencesFromPlist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("SeedAudiences"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__SDSeedProgramManager__loadSeedAudiencesFromPlist__block_invoke;
  v9[3] = &unk_1E98CF568;
  v7 = v6;
  v10 = v7;
  v11 = a1;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __51__SDSeedProgramManager__loadSeedAudiencesFromPlist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend((id)objc_opt_class(), "_seedProgramForString:", v7);

  objc_msgSend(v4, "numberWithInteger:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v9);

}

+ (BOOL)_currentCatalogIsSeed
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "_loadSeedCatalogsFromPlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDCatalogUtilities _currentCatalog](SDCatalogUtilities, "_currentCatalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (BOOL)_currentAudienceIsSeed
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "_loadSeedAudiencesFromPlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDCatalogUtilities _currentAssetAudience](SDCatalogUtilities, "_currentAssetAudience");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (BOOL)_setCatalogForSeedProgram:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  objc_msgSend((id)objc_opt_class(), "_loadSeedCatalogsFromPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SDCatalogUtilities _setCatalog:](SDCatalogUtilities, "_setCatalog:", v7);
  }
  else
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SDSeedProgramManager _setCatalogForSeedProgram:].cold.1((uint64_t)a1, (void *)a3);

  }
  return v7 != 0;
}

+ (BOOL)fixUpAssetAudience
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  char v8;
  int v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_DEFAULT, "Fixing Asset Audience.", (uint8_t *)&v10, 2u);
  }

  v4 = objc_msgSend(a1, "currentSeedProgram");
  if ((unint64_t)(v4 - 1) >= 4)
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Current Program is not valid. Will not fix up Asset Audience", (uint8_t *)&v10, 2u);
    }
    v8 = 0;
  }
  else
  {
    v5 = v4;
    +[SDCatalogUtilities _currentAssetAudience](SDCatalogUtilities, "_currentAssetAudience");
    v6 = objc_claimAutoreleasedReturnValue();
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, "Current Asset Audience [%{public}@]", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_msgSend(a1, "_setAudienceForSeedProgram:", v5);
  }

  return v8;
}

+ (BOOL)_setAudienceForSeedProgram:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  objc_msgSend((id)objc_opt_class(), "_loadSeedAudiencesFromPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SDCatalogUtilities _setAudience:](SDCatalogUtilities, "_setAudience:", v7);
  }
  else
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SDSeedProgramManager _setAudienceForSeedProgram:].cold.1((uint64_t)a1, (void *)a3);

  }
  return v7 != 0;
}

+ (void)_clearSeedCatalog
{
  void *v0;
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  +[SDCatalogUtilities _currentCatalog](SDCatalogUtilities, "_currentCatalog");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_6(v1, v2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v3, v4, "Seeding: We're not pointed to a seed catalog: %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

+ (void)_clearAudience
{
  +[SDCatalogUtilities _resetAssetAudience](SDCatalogUtilities, "_resetAssetAudience");
}

+ (void)_setHelpFeedbackMenuEnabled:(BOOL)a3
{
  const void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  if (a3)
    v3 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  v4 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v6 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(CFSTR("NSShowFeedbackMenu"), v3, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(v4, v5, v6);
}

+ (void)_setSeedOptOutUIDisabled:(BOOL)a3
{
  const void *v3;
  const __CFString *v4;
  const __CFString *v5;

  if (a3)
    v3 = (const void *)*MEMORY[0x1E0C9AE50];
  else
    v3 = 0;
  v4 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(CFSTR("DisableSeedOptOut"), v3, CFSTR("com.apple.SoftwareUpdate"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(CFSTR("com.apple.SoftwareUpdate"), v4, v5);
}

+ (void)_createFeedbackAssistantSymlink
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(CFSTR("/System/Library/CoreServices/Applications/Feedback Assistant.app"), "UTF8String");
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v0, v1, "Seeding: FBA didn't exist at %s, skipping symlink creation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (BOOL)_canEnrollInBetaSoftware
{
  CFPropertyListRef v2;
  CFPropertyListRef v3;
  CFPropertyListRef v4;
  BOOL v5;
  NSObject *v6;
  const __CFString *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  CFPreferencesSynchronize(CFSTR("com.apple.SoftwareUpdate"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v2 = CFPreferencesCopyAppValue(CFSTR("AllowPreReleaseInstallation"), CFSTR("com.apple.SoftwareUpdate"));
  if (v2)
  {
    v3 = v2;
    v4 = (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
    v5 = v2 == (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
    CFRelease(v2);
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("NO");
      if (v3 == v4)
        v7 = CFSTR("YES");
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "AllowPreReleaseInstallation: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Prerelease configuration not set, assuming YES.", (uint8_t *)&v9, 2u);
    }
    v5 = 1;
  }

  return v5;
}

+ (NSDictionary)currentEnrollmentMetadata
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "currentSeedProgram");
  if (v4)
  {
    objc_msgSend(a1, "stringForSeedProgram:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("SeedProgram"));

  }
  +[SDCatalogUtilities _currentAssetAudience](SDCatalogUtilities, "_currentAssetAudience");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("AssetAudience"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

+ (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(a1, "_seedProgramForString:", v8);
  if (v11)
  {
    objc_msgSend(a1, "stringForSeedProgram:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SDHTTPClient sharedInstance](SDHTTPClient, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "baseURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v14;
    objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("migration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("v1"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v9;
    objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("mobileconfig"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathComponent:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathComponent:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:cachePolicy:timeoutInterval:", v19, 1, 120.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SDHTTPClient sharedInstance](SDHTTPClient, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "urlSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke;
    v29[3] = &unk_1E98CF590;
    v31 = v10;
    v23 = v12;
    v30 = v23;
    objc_msgSend(v22, "dataTaskWithRequest:completionHandler:", v20, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v23;
      _os_log_impl(&dword_1D4F89000, v25, OS_LOG_TYPE_DEFAULT, "Requesting profile from profile service for %{public}@.", buf, 0xCu);
    }

    objc_msgSend(v24, "resume");
    v9 = v28;
  }
  else
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[SDSeedProgramManager enrollInSeedProgramNamed:withAssetAudience:completion:].cold.1();

    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void (*v16)(void);
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_DEFAULT, "Received response from profile service.", buf, 2u);
  }

  if (v8)
  {
    if (v7)
    {
      if (!v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v8;
          if (objc_msgSend(v11, "statusCode") != 200)
          {
            +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_3(v11);

            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
            goto LABEL_26;
          }
          v22 = 0;
          +[SDProfileUtilities installProfileWithData:error:](SDProfileUtilities, "installProfileWithData:error:", v7, &v22);
          v12 = v22;
          +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v12)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_2(v12);

            v15 = *(_QWORD *)(a1 + 40);
            if (!v15)
              goto LABEL_25;
            v16 = *(void (**)(void))(v15 + 16);
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v20 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138543362;
              v24 = v20;
              _os_log_impl(&dword_1D4F89000, v14, OS_LOG_TYPE_DEFAULT, "Enrolled device in beta program: [%{public}@]", buf, 0xCu);
            }

            v21 = *(_QWORD *)(a1 + 40);
            if (!v21)
              goto LABEL_25;
            v16 = *(void (**)(void))(v21 + 16);
          }
          v16();
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
      }
    }
  }
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_1(v9);

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);
LABEL_27:

}

+ (int64_t)_seedProgramForString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CustomerSeed")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("DeveloperSeed")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PublicSeed")) & 1) != 0)
    {
      v5 = 3;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("OtherSeed")))
    {
      v5 = 4;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)stringForSeedProgram:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return *off_1E98CF5B0[a3 - 1];
}

+ (BOOL)canFileFeedback
{
  _BOOL4 v2;
  _BOOL4 v3;
  _BOOL4 v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = +[SDSeedProgramManager isEnrolledInSeedProgram](SDSeedProgramManager, "isEnrolledInSeedProgram");
  v3 = +[SDBuildInfo currentBuildIsSeed](SDBuildInfo, "currentBuildIsSeed");
  v4 = +[SDBuildInfo isFeedbackAssistantAvailable](SDBuildInfo, "isFeedbackAssistantAvailable");
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109888;
    v7[1] = v2;
    v8 = 1024;
    v9 = v3;
    v10 = 1024;
    v11 = v4;
    v12 = 1024;
    v13 = (v2 || v3) && v4;
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_DEFAULT, "canFileFeedback: enrolledInSeed: %d, onSeedBuild: %d, isFBAAvailable %d, -> result: %d", (uint8_t *)v7, 0x1Au);
  }

  return (v2 || v3) && v4;
}

+ (void)currentSeedProgramForDiskAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "Path is nil, returning no program.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

+ (void)currentSeedProgramForDiskAtPath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "Seeding program preference failed to open.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

+ (void)currentSeedProgramForDiskAtPath:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "Invalid seed program found in plist.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

+ (void)currentSeedProgramForDiskAtPath:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "Seeding program preference does not exist on disk at path [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)enrollInSeedProgram:deletingSystemURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "Seeding: Got invalid seed program: %ld", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)_currentSeedProgramFromDisk
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_1D4F89000, v0, OS_LOG_TYPE_DEBUG, "Loaded enrollment plist [%@]", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

+ (void)_setCatalogForSeedProgram:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend((id)objc_opt_class(), "stringForSeedProgram:", a2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v5, v6, "Seeding: Couldn't find seed catalog in plist for program: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

+ (void)_setAudienceForSeedProgram:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend((id)objc_opt_class(), "stringForSeedProgram:", a2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_6(v3, v4);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v5, v6, "Seeding: Couldn't find audience in plist for program: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

+ (void)enrollInSeedProgramNamed:withAssetAudience:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "No seed program exists for name %{public}@", v2);
  OUTLINED_FUNCTION_5();
}

void __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Error from profile service: [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Failed to enroll with profile: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __78__SDSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_completion___block_invoke_cold_3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "statusCode");
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v1, v2, "Received non-200 status: [%li]", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

@end

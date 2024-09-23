@implementation SDLocUtilities

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sSearchFrameworkBundle;
    sSearchFrameworkBundle = v2;

  }
}

+ (id)localizedSearchStringWithIdentifier:(id)a3
{
  return (id)objc_msgSend((id)sSearchFrameworkBundle, "localizedStringForKey:value:table:", a3, &stru_24CF64BB0, CFSTR("Search"));
}

+ (id)displayNameForBundleIdentifer:(id)a3
{
  __CFString *v3;
  __objc2_class *v4;
  void *v5;
  id v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  v3 = (__CFString *)a3;
  if (displayNameForBundleIdentifer__onceToken != -1)
    dispatch_once(&displayNameForBundleIdentifer__onceToken, &__block_literal_global_10);
  pthread_rwlock_rdlock(&sAppDisplayNameReadWriteLock);
  v4 = SFSearchResult_Compatibility;
  objc_msgSend((id)sAppDisplayNameDictionary, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(&sAppDisplayNameReadWriteLock);
  if (!v5)
  {
    pthread_rwlock_wrlock(&sAppDisplayNameReadWriteLock);
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB06D8]))
    {
      v7 = (__CFString *)(id)*MEMORY[0x24BEB05F0];

      v3 = v7;
    }
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB05E8]))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("com.apple.MobileAddressBook");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB06C0]))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_SYNDICATED_LINKS");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB06C8]))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_SYNDICATED_PHOTOS_FROM_APPS");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB06E0]))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_SYNDICATED_PHOTOS_FROM_MESSAGES");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB06E8]))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_SYNDICATED_PHOTOS_FROM_NOTES");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB06D0]))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_SYNDICATED_PHOTOS_FROM_FILES");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.application")))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_APPLICATION");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.app-clips")))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_APP_CLIPS");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.peopled")))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_PEOPLE");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.people.askToBuyRequest")))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_PEOPLE_ASK_TO_BUY");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.people.screenTimeRequest")))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_PEOPLE_SCREEN_TIME_REQUEST");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.people.findMy")))
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_PEOPLE_FIND_MY");
    }
    else if (-[__CFString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB0598])
           && _os_feature_enabled_impl())
    {
      v8 = (void *)sSearchFrameworkBundle;
      v9 = CFSTR("DOMAIN_EVENTS");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "applicationIsInstalled:", v3);

      if (v13)
      {
        SPFastApplicationsGetNoBuild();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "displayName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);
          objc_msgSend(v16, "localizedName");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v4 = SFSearchResult_Compatibility;
        goto LABEL_36;
      }
      +[SDAppUninstallMonitor applicationsExcludedFromUninstall](SDAppUninstallMonitor, "applicationsExcludedFromUninstall");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v3);

      if (!v18)
      {
        v5 = 0;
        goto LABEL_36;
      }
      v8 = (void *)sSearchFrameworkBundle;
      v9 = v3;
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24CF64BB0, CFSTR("Search"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    if (v5)
      v10 = v5;
    else
      v10 = (void *)*MEMORY[0x24BDBD430];
    -[__objc2_class setObject:forKey:](v4[72].isa, "setObject:forKey:", v10, v3);
    pthread_rwlock_unlock(&sAppDisplayNameReadWriteLock);
    goto LABEL_40;
  }
  if (v5 != (void *)*MEMORY[0x24BDBD430])
  {
LABEL_40:
    v6 = v5;
    v5 = v6;
    goto LABEL_41;
  }
  v6 = 0;
LABEL_41:

  return v6;
}

uint64_t __48__SDLocUtilities_displayNameForBundleIdentifer___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)sAppDisplayNameDictionary;
  sAppDisplayNameDictionary = (uint64_t)v0;

  objc_msgSend((id)sAppDisplayNameDictionary, "setObject:forKey:", *MEMORY[0x24BDBD430], CFSTR("com.apple.springboard"));
  return pthread_rwlock_init(&sAppDisplayNameReadWriteLock, 0);
}

+ (void)clearAppsDisplayNameMapping
{
  objc_msgSend((id)sAppDisplayNameDictionary, "removeAllObjects");
}

@end

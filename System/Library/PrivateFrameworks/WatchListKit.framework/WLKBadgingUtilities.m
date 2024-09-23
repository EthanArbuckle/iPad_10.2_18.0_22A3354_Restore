@implementation WLKBadgingUtilities

+ (void)clearSavedBadgeIdentifiers
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("badgeIdentifiers"));

}

+ (id)sharedUtilities
{
  if (sharedUtilities___once != -1)
    dispatch_once(&sharedUtilities___once, &__block_literal_global_14);
  return (id)sharedUtilities___singleInstance;
}

void __38__WLKBadgingUtilities_sharedUtilities__block_invoke()
{
  WLKBadgingUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(WLKBadgingUtilities);
  v1 = (void *)sharedUtilities___singleInstance;
  sharedUtilities___singleInstance = (uint64_t)v0;

}

- (id)_notificationCenter
{
  if (_notificationCenter_onceToken != -1)
    dispatch_once(&_notificationCenter_onceToken, &__block_literal_global_6);
  return (id)_notificationCenter__center;
}

void __42__WLKBadgingUtilities__notificationCenter__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0CEC7A0]);
  WLKTVAppBundleID();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithBundleIdentifier:", v3);
  v2 = (void *)_notificationCenter__center;
  _notificationCenter__center = v1;

}

+ (id)currentBadgeNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("badgeIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1E68C9890;
  }

  return v5;
}

+ (id)badgeIdentifiers
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("badgeIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)hasMigrated
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasMigratedToNewBadgingSystem"));

  return v3;
}

- (void)migrateToNewBadgingSystemIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if ((objc_msgSend((id)objc_opt_class(), "hasMigrated") & 1) == 0)
  {
    -[WLKBadgingUtilities _notificationCenter](self, "_notificationCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__WLKBadgingUtilities_migrateToNewBadgingSystemIfNeeded__block_invoke;
    v5[3] = &unk_1E68A8470;
    v5[4] = self;
    objc_msgSend(v3, "getBadgeNumberWithCompletionHandler:", v5);

    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("hasMigratedToNewBadgingSystem"));

  }
}

void __56__WLKBadgingUtilities_migrateToNewBadgingSystemIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "currentBadgeNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;

  v6 = objc_msgSend(v2, "integerValue");
  if (v6 == 1 && !objc_msgSend(v7, "integerValue"))
    objc_msgSend((id)objc_opt_class(), "addBadgeIdentifier:", CFSTR("defaultTVAppBadgeId"));

}

+ (BOOL)addBadgeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", CFSTR("badgeIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
LABEL_7:
    v9 = v8;
    objc_msgSend(v8, "addObject:", v3);
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("badgeIdentifiers"));

    v7 = 1;
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "containsObject:", v3) & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    goto LABEL_7;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

+ (BOOL)removeBadgeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("badgeIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count") && objc_msgSend(v6, "containsObject:", v3))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "removeObject:", v3);
    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("badgeIdentifiers"));

    }
    else
    {
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("badgeIdentifiers"));
    }

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end

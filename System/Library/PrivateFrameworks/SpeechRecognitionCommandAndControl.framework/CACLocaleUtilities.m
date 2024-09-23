@implementation CACLocaleUtilities

+ (id)systemUILocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v2, "localizations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocalizationsFromArray:forPreferences:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)localizedUIStringForKey:(id)a3
{
  return (id)objc_msgSend(a1, "_localizedUIStringForKey:forResource:", a3, CFSTR("Localizable"));
}

+ (id)localizedUIStringForBuiltinCommandsMiniDescriptionsKey:(id)a3
{
  return (id)objc_msgSend(a1, "_localizedUIStringForKey:forResource:", a3, CFSTR("BuiltinCommandsMiniDescriptions"));
}

+ (id)siriLocaleUIStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "spokenLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_localizedUIStringForKey:forResource:locale:", v4, CFSTR("Localizable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_localizedUIStringForKey:(id)a3 forResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "systemUILocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_localizedUIStringForKey:forResource:locale:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_localizedUIStringForKey:(id)a3 forResource:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    v13 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:localization:", v7, 0, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12 || (v14 = v12, objc_msgSend(v12, "isEqual:", v7)))
  {
LABEL_6:
    +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:localization:", v7, 0, v8, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_8;
  }
  if (!objc_msgSend(v14, "isEqual:", v7))
    goto LABEL_14;
LABEL_8:
  objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:localization:", v7, 0, v8, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && (objc_msgSend(v18, "isEqual:", v7) & 1) == 0)
    {

      v14 = v19;
      goto LABEL_14;
    }
  }
  else
  {
    v19 = 0;
  }

  if (!v14)
  {
LABEL_15:
    objc_msgSend(v11, "localizedStringForKey:value:table:", v7, &stru_24F2ADCC8, v8);
    v20 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v20;
    goto LABEL_16;
  }
LABEL_14:
  if (objc_msgSend(v14, "isEqual:", v7))
    goto LABEL_15;
LABEL_16:

  return v14;
}

+ (id)componentsFromLocaleIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    if (componentsFromLocaleIdentifier__staticLocaleComponentsCacheSetup != -1)
      dispatch_once(&componentsFromLocaleIdentifier__staticLocaleComponentsCacheSetup, &__block_literal_global_21);
    v4 = (id)sLocaleComponentsCache;
    objc_sync_enter(v4);
    objc_msgSend((id)sLocaleComponentsCache, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend((id)sLocaleComponentsCache, "setObject:forKey:", v5, v3);
    }
    objc_sync_exit(v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __53__CACLocaleUtilities_componentsFromLocaleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sLocaleComponentsCache;
  sLocaleComponentsCache = v0;

}

+ (id)systemLocaleIdentifier
{
  void *System;

  System = CFLocaleGetSystem();
  if (System)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", MEMORY[0x22E2D520C]());
    System = (void *)objc_claimAutoreleasedReturnValue();
  }
  return System;
}

+ (BOOL)isSameLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a4;
  +[CACLocaleUtilities componentsFromLocaleIdentifier:](CACLocaleUtilities, "componentsFromLocaleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities componentsFromLocaleIdentifier:](CACLocaleUtilities, "componentsFromLocaleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BDBCB20];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_4;
  v10 = (void *)v9;
  objc_msgSend(v7, "objectForKey:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v16 = 0;
    goto LABEL_17;
  }
  v12 = (void *)v11;
  objc_msgSend(v6, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "caseInsensitiveCompare:", v14);

  if (!v15)
  {
    v17 = *MEMORY[0x24BDBCAE8];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v7, "objectForKey:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v16 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_msgSend(v6, "objectForKey:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v7, "objectForKey:", v17);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(v6, "objectForKey:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v22, "caseInsensitiveCompare:", v23) == 0;

        if (!v10)
          goto LABEL_16;
LABEL_17:

        goto LABEL_18;
      }

    }
    v16 = 0;
    if (!v10)
      goto LABEL_16;
    goto LABEL_17;
  }
LABEL_4:
  v16 = 0;
LABEL_18:

  return v16;
}

+ (BOOL)isSameLangaugeFromLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v5 = a4;
  +[CACLocaleUtilities componentsFromLocaleIdentifier:](CACLocaleUtilities, "componentsFromLocaleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities componentsFromLocaleIdentifier:](CACLocaleUtilities, "componentsFromLocaleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BDBCB20];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "caseInsensitiveCompare:", v12) == 0;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isLocaleIdentifier:(id)a3 containedInLocaleIdentifiers:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if (+[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)normalizedLocaleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)displayStringForByteSize:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setFormatterBehavior:", 1040);
  objc_msgSend(v5, "setNumberStyle:", 1);
  objc_msgSend(v5, "setMinimumFractionDigits:", 0);
  if (a3 > 0x3E7)
  {
    if (a3 > 0xF423F)
    {
      if (a3 > 0x3B9AC9FF)
      {
        objc_msgSend(v5, "setMaximumFractionDigits:", 1);
        v6 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GBSize"), &stru_24F2ADCC8, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)a3 / 1000000000.0);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MBSize"), &stru_24F2ADCC8, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD16E0];
      v9 = (a3 + 500000) / 0xF4240uLL;
    }
    else
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("KBSize"), &stru_24F2ADCC8, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD16E0];
      v9 = (a3 + 500) / 0x3E8uLL;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ByteSize"), &stru_24F2ADCC8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = a3;
  }
  objc_msgSend(v8, "numberWithUnsignedLongLong:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v11 = (void *)v10;
  objc_msgSend(v5, "stringForObjectValue:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)displayStringForTimeRemaining:(double)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  if (a3 >= 120.0)
  {
    if (a3 >= 3300.0)
    {
      if (a3 < 7200.0)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DownloadingProgressTimeRemainingAboutAnHour"), &stru_24F2ADCC8, 0);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DownloadingProgressTimeRemainingNHours"), &stru_24F2ADCC8, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(a3 / 3600.0));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v8, v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DownloadingProgressTimeRemainingNMinutes"), &stru_24F2ADCC8, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(a3 / 60.0));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringFromNumber:numberStyle:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v11);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v12;

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DownloadingProgressTimeRemainingLessThanAMinute"), &stru_24F2ADCC8, 0);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v6 = (void *)v5;
LABEL_10:

  return v6;
}

+ (id)localizedDisplayStringForLocaleIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a3;
  objc_msgSend(v3, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForLocaleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

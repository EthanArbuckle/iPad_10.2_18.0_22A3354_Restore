@implementation OITSULocale

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sStaticLocaleLock = objc_opt_new();
    sOtherLocales = objc_opt_new();
    sCurrentLocale = 0;
    TSURegisterLocaleChangeObserver((uint64_t)&__block_literal_global_4);
  }
}

uint64_t __25__OITSULocale_initialize__block_invoke()
{
  objc_msgSend((id)sStaticLocaleLock, "lock");
  ++sAutoupdatingCurrentLocaleChangeCount;

  sCurrentLocale = 0;
  return objc_msgSend((id)sStaticLocaleLock, "unlock");
}

+ (void)setLocalizedStringBundle:(__CFBundle *)a3
{
  if (sLocalizedStringBundle)
    CFRelease((CFTypeRef)sLocalizedStringBundle);
  sLocalizedStringBundle = (uint64_t)a3;
  CFRetain(a3);
}

+ (unint64_t)autoupdatingCurrentLocaleChangeCount
{
  unint64_t v2;

  objc_msgSend((id)sStaticLocaleLock, "lock");
  v2 = sAutoupdatingCurrentLocaleChangeCount;
  objc_msgSend((id)sStaticLocaleLock, "unlock");
  return v2;
}

+ (id)cacheKeyForLocale:(id)a3
{
  if (+[OITSULocale localeIsAutoUpdating:](OITSULocale, "localeIsAutoUpdating:"))
    return CFSTR("NSAutoLocale");
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CFLocale:%@"), objc_msgSend(a3, "localeIdentifier"));
}

+ (id)preferredLanguages
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_msgSend((id)objc_msgSend(a1, "currentLocale"), "documentLanguageIdentifier");
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

+ (id)currentLocale
{
  void *v2;
  OITSULocale *v4;
  uint64_t v5;

  v2 = (void *)sCurrentLocale;
  if (!sCurrentLocale)
  {
    objc_sync_enter(a1);
    if (!sCurrentLocale)
    {
      v4 = [OITSULocale alloc];
      v5 = objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      sCurrentLocale = -[OITSULocale initWithLocale:documentLanguageIdentifier:useAutoupdating:](v4, "initWithLocale:documentLanguageIdentifier:useAutoupdating:", v5, objc_msgSend(MEMORY[0x24BDBCEA0], "tsu_firstPreferredLocalization"), 1);
    }
    objc_sync_exit(a1);
    v2 = (void *)sCurrentLocale;
  }
  return v2;
}

+ (id)preferredLocale
{
  void *v2;
  OITSULocale *v4;

  v2 = (void *)sPreferredLocale;
  if (!sPreferredLocale)
  {
    objc_sync_enter(a1);
    if (!sPreferredLocale)
    {
      v4 = [OITSULocale alloc];
      sPreferredLocale = -[OITSULocale initWithLocale:documentLanguageIdentifier:useAutoupdating:](v4, "initWithLocale:documentLanguageIdentifier:useAutoupdating:", TSUPreferredLocale(), objc_msgSend(MEMORY[0x24BDBCEA0], "tsu_firstPreferredLocalization"), 1);
    }
    objc_sync_exit(a1);
    v2 = (void *)sPreferredLocale;
  }
  return v2;
}

+ (id)applicationLocale
{
  return (id)objc_msgSend(+[OITSULocale currentLocale](OITSULocale, "currentLocale"), "locale");
}

+ (id)canonicalizeLocaleIdentifier:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", a3), "mutableCopy");
  v4 = *MEMORY[0x24BDBCB68];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB68]), "uppercaseString"), "isEqualToString:", CFSTR("POSIX")))objc_msgSend(v3, "removeObjectForKey:", v4);
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v3));
}

+ (id)canonicalizeLocaleIdentifierWithLanguageOnly:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", a3);
  return (id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB20]);
}

+ (id)canonicalizeLocaleIdentifierWithLanguageAndRegionOnly:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", a3);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = *MEMORY[0x24BDBCB20];
  if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB20]))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v5), v5);
  v6 = *MEMORY[0x24BDBCAE8];
  if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCAE8]))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v6), v6);
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v4));
}

+ (id)canonicalizeLocaleIdentifierWithLanguageAndScriptOnly:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", a3);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = *MEMORY[0x24BDBCB20];
  if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB20]))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v5), v5);
  v6 = *MEMORY[0x24BDBCB40];
  if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB40]))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v6), v6);
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v4));
}

+ (id)canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", a3);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = *MEMORY[0x24BDBCB20];
  if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB20]))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v5), v5);
  v6 = *MEMORY[0x24BDBCAE8];
  if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCAE8]))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v6), v6);
  v7 = *MEMORY[0x24BDBCB40];
  if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB40]))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v7), v7);
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v4));
}

+ (id)deducedScriptForLocale:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:"), "mutableCopy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(&unk_24F469E68, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
  v8 = *MEMORY[0x24BDBCB40];
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(&unk_24F469E68);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v8);
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v4)), "isEqualToString:", a3) & 1) != 0)return v10;
    if (v6 == ++v9)
    {
      v6 = objc_msgSend(&unk_24F469E68, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

+ (id)localeIDWithDefaultRegionCode:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", a3), "mutableCopy");
  v4 = *MEMORY[0x24BDBCB20];
  v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB20]), "isEqualToString:", CFSTR("zh"));
  v6 = (uint64_t *)MEMORY[0x24BDBCB40];
  if (v5)
  {
    v7 = *MEMORY[0x24BDBCB40];
    v8 = objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB40]);
    v9 = *MEMORY[0x24BDBCAE8];
    if (!v8)
    {
      if (objc_msgSend(&unk_24F469E80, "containsObject:", objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCAE8])))v10 = CFSTR("Hant");
      else
        v10 = CFSTR("Hans");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v7);
    }
    if (!objc_msgSend(v3, "objectForKeyedSubscript:", v9))
    {
      if (objc_msgSend(CFSTR("Hant"), "isEqualToString:", objc_msgSend(v3, "objectForKeyedSubscript:", v7)))v11 = CFSTR("TW");
      else
        v11 = CFSTR("CN");
      goto LABEL_17;
    }
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v4), "isEqualToString:", CFSTR("ko")))
    {
      v12 = *v6;
      if (objc_msgSend(&unk_24F469E98, "containsObject:", objc_msgSend(v3, "objectForKeyedSubscript:", *v6)))objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v12);
    }
    v9 = *MEMORY[0x24BDBCAE8];
    if (!objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBCAE8]))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", CFSTR("LocaleIDData"), CFSTR("plist"))), "objectForKeyedSubscript:", CFSTR("DefaultRegionCodes")), "objectForKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", v4)), v9);
      if (!objc_msgSend(v3, "objectForKeyedSubscript:", v9))
      {
        v11 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), "objectForKey:", v9);
LABEL_17:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);
      }
    }
  }
  v13 = (void *)objc_msgSend(v3, "allKeys");
  v26[0] = v4;
  v26[1] = v9;
  v26[2] = *v6;
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v14, "containsObject:", v19) & 1) == 0)
          objc_msgSend(v3, "removeObjectForKey:", v19);
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v3);
}

+ (id)localeIDWithoutDefaultRegionCode:(id)a3 avoidAmbiguousCases:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;

  v4 = a4;
  v6 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:"), "mutableCopy");
  v7 = v6;
  v8 = *MEMORY[0x24BDBCB20];
  if (v4
    && (objc_msgSend(&unk_24F469EB0, "containsObject:", objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB20])) & 1) != 0)
  {
    return a3;
  }
  if ((objc_msgSend(CFSTR("zh"), "isEqualToString:", objc_msgSend(v7, "objectForKeyedSubscript:", v8)) & 1) != 0)
  {
    v10 = objc_msgSend(CFSTR("Hant"), "isEqualToString:", objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB40]));
    v11 = *MEMORY[0x24BDBCAE8];
    if (v10
      && (objc_msgSend(CFSTR("TW"), "isEqualToString:", objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBCAE8])) & 1) != 0)
    {
      goto LABEL_10;
    }
  }
  else
  {
    v11 = *MEMORY[0x24BDBCAE8];
  }
  if (objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v11), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", CFSTR("LocaleIDData"), CFSTR("plist"))), "objectForKeyedSubscript:", CFSTR("DefaultRegionCodes")), "objectForKeyedSubscript:", objc_msgSend(v7, "objectForKeyedSubscript:", v8))))LABEL_10:objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v11);
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "localeIdentifierFromComponents:", v7);
}

+ (id)simplifiedDisplayNameForLocaleID:(id)a3 displayStandalone:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id result;
  uint64_t v7;

  v4 = a4;
  v5 = +[OITSULocale localeIDWithoutDefaultRegionCode:avoidAmbiguousCases:](OITSULocale, "localeIDWithoutDefaultRegionCode:avoidAmbiguousCases:", +[OITSULocale localeIDWithDefaultRegionCode:](OITSULocale, "localeIDWithDefaultRegionCode:", a3), 1);
  result = +[OITSULocale displayNameForCode:ofType:displayStandalone:](OITSULocale, "displayNameForCode:ofType:displayStandalone:", v5, *MEMORY[0x24BDBCB18], v4);
  if (!result)
  {
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OITSULocale simplifiedDisplayNameForLocaleID:displayStandalone:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULocale.m"), 407, 0, "Nil display name returned for locale ID %@", objc_msgSend(+[OITSULocale applicationLocale](OITSULocale, "applicationLocale"), "localeIdentifier"));
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    return &stru_24F3BFFF8;
  }
  return result;
}

+ (id)displayNameForCode:(id)a3 ofType:(id)a4 displayStandalone:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v12;

  v7 = +[OITSULocale applicationLocale](OITSULocale, "applicationLocale", a3, a4, a5);
  v8 = (id)*MEMORY[0x24BDBCB18];
  v9 = (id)*MEMORY[0x24BDBCB20];
  if ((id)*MEMORY[0x24BDBCAE8] == a4 || v9 == a4 || v8 == a4)
    v12 = a4;
  else
    v12 = (id)*MEMORY[0x24BDBCB18];
  if (v12 == v9)
  {
    if (objc_msgSend(a3, "containsString:", CFSTR("-")))
      v12 = v8;
    else
      v12 = v9;
  }
  return (id)objc_msgSend(v7, "displayNameForKey:value:", v12, a3);
}

+ (id)allSupportedTier1Languages
{
  if (allSupportedTier1Languages_once != -1)
    dispatch_once(&allSupportedTier1Languages_once, &__block_literal_global_76);
  return (id)allSupportedTier1Languages_supportedTiers0and1;
}

id __41__OITSULocale_allSupportedTier1Languages__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", CFSTR("LocaleIDData"), CFSTR("plist"))), "objectForKeyedSubscript:", CFSTR("Tiers0and1"));
  v1 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "localizations");
  v2 = (void *)objc_msgSend(v0, "mutableCopy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v0);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v1, "containsObject:", v7) & 1) == 0
          && (objc_msgSend(v1, "containsObject:", objc_msgSend(v7, "substringToIndex:", 2)) & 1) == 0)
        {
          objc_msgSend(v2, "removeObject:", v7);
        }
      }
      v4 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  allSupportedTier1Languages_supportedTiers0and1 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);

  return (id)allSupportedTier1Languages_supportedTiers0and1;
}

+ (id)allSupportedTier3Languages
{
  if (allSupportedTier3Languages_once != -1)
    dispatch_once(&allSupportedTier3Languages_once, &__block_literal_global_79);
  return (id)allSupportedTier3Languages_supportedLanguages;
}

id __41__OITSULocale_allSupportedTier3Languages__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", CFSTR("LocaleIDData"), CFSTR("plist"))), "objectForKeyedSubscript:", CFSTR("Tiers0thru3"));
  v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "localizations");
  v2 = (void *)objc_msgSend(v0, "mutableCopy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v0);
        v14 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v7 = v14;
        v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v1, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1)), "objectAtIndexedSubscript:", 0);
        if ((objc_msgSend(v7, "hasPrefix:", objc_msgSend(v8, "substringToIndex:", 2)) & 1) == 0
          && (!objc_msgSend(v7, "isEqualToString:", CFSTR("nb"))
           || (objc_msgSend(v8, "isEqualToString:", CFSTR("no")) & 1) == 0))
        {
          objc_msgSend(v2, "removeObject:", v7);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v4);
  }
  allSupportedTier3Languages_supportedLanguages = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);

  return (id)allSupportedTier3Languages_supportedLanguages;
}

+ (id)allSupportedTemplatePickerLanguages
{
  if (allSupportedTemplatePickerLanguages_once != -1)
    dispatch_once(&allSupportedTemplatePickerLanguages_once, &__block_literal_global_86);
  return (id)allSupportedTemplatePickerLanguages_supportedLanguages;
}

id __50__OITSULocale_allSupportedTemplatePickerLanguages__block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v0, "addObjectsFromArray:", +[OITSULocale allSupportedTier3Languages](OITSULocale, "allSupportedTier3Languages"));
  objc_msgSend(v0, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", objc_msgSend((id)SFUBundle(), "pathForResource:ofType:", CFSTR("LocaleIDData"), CFSTR("plist"))), "objectForKeyedSubscript:", CFSTR("AdditionalTemplatePickerLanguages")));
  allSupportedTemplatePickerLanguages_supportedLanguages = objc_msgSend(v0, "allObjects");

  return (id)allSupportedTemplatePickerLanguages_supportedLanguages;
}

+ (BOOL)localeIsAutoUpdating:(id)a3
{
  if (localeIsAutoUpdating__onceToken != -1)
    dispatch_once(&localeIsAutoUpdating__onceToken, &__block_literal_global_90);
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __36__OITSULocale_localeIsAutoUpdating___block_invoke()
{
  uint64_t result;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  result = objc_opt_class();
  localeIsAutoUpdating__s_autoupdatingCurrentLocaleClass = result;
  return result;
}

+ (id)localeForLocaleIdentifier:(id)a3 documentLanguageIdentifier:(id)a4
{
  id v6;

  if (!a3 || !a4)
    return 0;
  objc_msgSend((id)sStaticLocaleLock, "lock");
  v6 = (id)objc_msgSend((id)sOtherLocales, "objectForKey:", objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(",%@"), a4));
  objc_msgSend((id)sStaticLocaleLock, "unlock");
  return v6;
}

+ (void)saveLocaleForReuse:(id)a3
{
  objc_msgSend((id)sStaticLocaleLock, "lock");
  if (!objc_msgSend((id)sOtherLocales, "objectForKey:", objc_msgSend(a3, "localeIdentifier")))
    objc_msgSend((id)sOtherLocales, "setObject:forKey:", a3, objc_msgSend((id)objc_msgSend(a3, "localeIdentifier"), "stringByAppendingFormat:", CFSTR(",%@"), objc_msgSend(a3, "documentLanguageIdentifier")));
  objc_msgSend((id)sStaticLocaleLock, "unlock");
}

- (OITSULocale)initWithLocale:(id)a3 documentLanguageIdentifier:(id)a4
{
  return -[OITSULocale initWithLocale:documentLanguageIdentifier:useAutoupdating:](self, "initWithLocale:documentLanguageIdentifier:useAutoupdating:", a3, a4, 0);
}

- (OITSULocale)initWithLocale:(id)a3 documentLanguageIdentifier:(id)a4 useAutoupdating:(BOOL)a5
{
  _BOOL4 v5;
  OITSULocale *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSLocale *v13;
  _BOOL4 v14;
  __CFString *v15;
  __CFDateFormatter *UsingHarmonizedSymbols;
  NSCache *v17;
  objc_super v19;

  v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)OITSULocale;
  v8 = -[OITSULocale init](&v19, sel_init);
  if (!v8)
    return v8;
  if (a4)
  {
    if (!a3)
      goto LABEL_10;
  }
  else
  {
    a4 = (id)objc_msgSend(MEMORY[0x24BDBCEA0], "tsu_firstPreferredLocalization");
    if (!a3)
    {
LABEL_10:

      return 0;
    }
  }
  if (!a4)
    goto LABEL_10;
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLanguageIdentifierFromString:", a4);
  v10 = +[OITSULocale canonicalizeLocaleIdentifier:](OITSULocale, "canonicalizeLocaleIdentifier:", objc_msgSend(a3, "localeIdentifier"));
  if (v5
    || (v11 = +[OITSULocale localeForLocaleIdentifier:documentLanguageIdentifier:](OITSULocale, "localeForLocaleIdentifier:documentLanguageIdentifier:", v10, v9)) == 0)
  {
    pthread_mutex_init(&v8->_formattersMutex, 0);
    v8->_localeIdentifier = (NSString *)v10;
    if (v5)
      v13 = (NSLocale *)(id)objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    else
      v13 = (NSLocale *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", v8->_localeIdentifier);
    v8->_locale = v13;
    v8->_isAutoUpdating = v5;
    v8->_languageCode = (NSString *)-[NSLocale objectForKey:](v13, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v8->_documentLanguageIdentifier = (NSString *)v9;
    v8->_numberFormatters = (NSMutableArray *)objc_opt_new();
    v8->_scientificNumberFormatters = (NSMutableArray *)objc_opt_new();
    v8->_dateParserLibrary = -[OITSUDateParserLibrary initWithLocale:]([OITSUDateParserLibrary alloc], "initWithLocale:", v8);
    v8->_currencyCode = (NSString *)objc_msgSend(+[OITSUNumberFormatter defaultCurrencyCodeForLocale:](OITSUNumberFormatter, "defaultCurrencyCodeForLocale:", v8->_locale), "copy");
    v8->_numberFormatterStringFromDoubleWithFormatLock = (NSLock *)objc_opt_new();
    v8->_decimalSeparator = (NSString *)objc_msgSend(+[OITSUNumberFormatter decimalSeparatorForLocale:](OITSUNumberFormatter, "decimalSeparatorForLocale:", v8->_locale), "copy");
    v8->_groupingSeparator = (NSString *)objc_msgSend(+[OITSUNumberFormatter groupingSeparatorForLocale:](OITSUNumberFormatter, "groupingSeparatorForLocale:", v8->_locale), "copy");
    v8->_currencyDecimalSeparator = (NSString *)objc_msgSend(+[OITSUNumberFormatter currencyDecimalSeparatorForLocale:](OITSUNumberFormatter, "currencyDecimalSeparatorForLocale:", v8->_locale), "copy");
    v8->_currencyGroupingSeparator = (NSString *)objc_msgSend(+[OITSUNumberFormatter currencyGroupingSeparatorForLocale:](OITSUNumberFormatter, "currencyGroupingSeparatorForLocale:", v8->_locale), "copy");
    v8->_percentSymbol = (NSString *)objc_msgSend(+[OITSUNumberFormatter percentSymbolForLocale:](OITSUNumberFormatter, "percentSymbolForLocale:", v8->_locale), "copy");
    v14 = -[NSString isEqualToString:](v8->_decimalSeparator, "isEqualToString:", CFSTR("."));
    v15 = CFSTR(";");
    if (v14)
      v15 = CFSTR(",");
    v8->_listSeparator = (NSString *)v15;
    v8->_groupingSize = +[OITSUNumberFormatter groupingSizeForLocale:](OITSUNumberFormatter, "groupingSizeForLocale:", v8->_locale);
    v8->_localeSpecificStorageLock = (NSLock *)objc_opt_new();
    v8->_localeSpecificStorage = (NSMutableDictionary *)objc_opt_new();
    v8->_dateComponentOrdering = TSUDateComponentOrderingForLocale((void *)objc_msgSend(a3, "localeIdentifier"));
    v8->_gregorianCalendarLocale = (NSLocale *)TSUCopyLocaleWithGregorianCalendarFromLocale(v8->_locale);
    UsingHarmonizedSymbols = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v8->_locale, kCFDateFormatterMediumStyle, kCFDateFormatterMediumStyle);
    v8->_monthSymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD2E0]);
    v8->_standaloneMonthSymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD328]);
    v8->_weekdaySymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD368]);
    v8->_standaloneWeekdaySymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD338]);
    v8->_shortMonthSymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD2F8]);
    v8->_shortStandaloneMonthSymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD308]);
    v8->_shortWeekdaySymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD320]);
    v8->_shortStandaloneWeekdaySymbols = (NSArray *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD318]);
    v8->_amString = (NSString *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD2B8]);
    v8->_pmString = (NSString *)CFDateFormatterCopyProperty(UsingHarmonizedSymbols, (CFDateFormatterKey)*MEMORY[0x24BDBD2E8]);
    CFRelease(UsingHarmonizedSymbols);
    v8->_trueString = (NSString *)-[OITSULocale localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("TRUE"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v8->_falseString = (NSString *)-[OITSULocale localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("FALSE"), &stru_24F3BFFF8, CFSTR("TSUtility"));
    v17 = (NSCache *)objc_opt_new();
    v8->_cachedLocalizedStrings = v17;
    -[NSCache setName:](v17, "setName:", CFSTR("Docuemnt-language localized strings cache"));
    if (!v5)
      +[OITSULocale saveLocaleForReuse:](OITSULocale, "saveLocaleForReuse:", v8);
  }
  else
  {
    v12 = v11;

    return (OITSULocale *)v12;
  }
  return v8;
}

- (id)localeIdentifierWithLanguageAndRegionOnly
{
  return +[OITSULocale canonicalizeLocaleIdentifierWithLanguageAndRegionOnly:](OITSULocale, "canonicalizeLocaleIdentifierWithLanguageAndRegionOnly:", -[OITSULocale localeIdentifier](self, "localeIdentifier"));
}

- (id)localeIdentifierWithLanguageScriptAndRegionOnly
{
  return +[OITSULocale canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:](OITSULocale, "canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:", -[OITSULocale localeIdentifier](self, "localeIdentifier"));
}

- (id)copyWithDocumentLanguageIdentifier:(id)a3
{
  return -[OITSULocale initWithLocale:documentLanguageIdentifier:useAutoupdating:]([OITSULocale alloc], "initWithLocale:documentLanguageIdentifier:useAutoupdating:", -[OITSULocale locale](self, "locale"), a3, -[OITSULocale isAutoUpdating](self, "isAutoUpdating"));
}

- (void)dealloc
{
  __CFNumberFormatter *plainFormatter;
  __CFNumberFormatter *noMinusSignPlainFormatter;
  __CFNumberFormatter *currencyFormatter;
  __CFNumberFormatter *noMinusSignCurrencyFormatter;
  objc_super v7;

  self->_gregorianCalendarLocale = 0;
  plainFormatter = self->_plainFormatter;
  if (plainFormatter)
  {
    CFRelease(plainFormatter);
    self->_plainFormatter = 0;
  }
  noMinusSignPlainFormatter = self->_noMinusSignPlainFormatter;
  if (noMinusSignPlainFormatter)
  {
    CFRelease(noMinusSignPlainFormatter);
    self->_noMinusSignPlainFormatter = 0;
  }
  currencyFormatter = self->_currencyFormatter;
  if (currencyFormatter)
  {
    CFRelease(currencyFormatter);
    self->_currencyFormatter = 0;
  }
  noMinusSignCurrencyFormatter = self->_noMinusSignCurrencyFormatter;
  if (noMinusSignCurrencyFormatter)
  {
    CFRelease(noMinusSignCurrencyFormatter);
    self->_noMinusSignCurrencyFormatter = 0;
  }

  pthread_mutex_destroy(&self->_formattersMutex);
  v7.receiver = self;
  v7.super_class = (Class)OITSULocale;
  -[OITSULocale dealloc](&v7, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = (void *)TSUDynamicCast(v5, (uint64_t)a3);
    if (v6)
    {
      v7 = v6;
      LODWORD(v6) = -[NSString isEqualToString:](-[OITSULocale localeIdentifier](self, "localeIdentifier"), "isEqualToString:", objc_msgSend(v6, "localeIdentifier"));
      if ((_DWORD)v6)
      {
        v8 = -[OITSULocale isAutoUpdating](self, "isAutoUpdating");
        LOBYTE(v6) = v8 ^ objc_msgSend(v7, "isAutoUpdating") ^ 1;
      }
    }
  }
  return (char)v6;
}

- (unint64_t)hash
{
  return -[NSString hash](-[OITSULocale localeIdentifier](self, "localeIdentifier"), "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self->_isAutoUpdating)
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>: for %@ language %@ autoupdating: %@"), v4, self, self->_localeIdentifier, self->_documentLanguageIdentifier, v5);
}

- (id)simplifiedDisplayNameWithStandalone:(BOOL)a3
{
  return +[OITSULocale simplifiedDisplayNameForLocaleID:displayStandalone:](OITSULocale, "simplifiedDisplayNameForLocaleID:displayStandalone:", self->_localeIdentifier, a3);
}

- (id)displayLanguageNameWithStandalone:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v5 = *MEMORY[0x24BDBCB20];
  v6 = -[NSLocale objectForKey:](self->_locale, "objectForKey:", *MEMORY[0x24BDBCB20]);
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("zh"))
    && ((v7 = -[NSLocale objectForKey:](self->_locale, "objectForKey:", *MEMORY[0x24BDBCB40])) != 0
     || (v7 = +[OITSULocale deducedScriptForLocale:](OITSULocale, "deducedScriptForLocale:", self->_localeIdentifier)) != 0))
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
    v9 = *MEMORY[0x24BDBCB18];
  }
  else
  {
    v8 = (uint64_t)v6;
    v9 = v5;
  }
  return +[OITSULocale displayNameForCode:ofType:displayStandalone:](OITSULocale, "displayNameForCode:ofType:displayStandalone:", v8, v9, v3);
}

- (__CFLocale)cfLocale
{
  return (__CFLocale *)self->_locale;
}

- (__CFLocale)cfGregorianCalendarLocale
{
  return (__CFLocale *)self->_gregorianCalendarLocale;
}

- (NSString)arrayRowSeparator
{
  return (NSString *)CFSTR(";");
}

- (__CFNumberFormatter)checkoutNumberFormatter
{
  _opaque_pthread_mutex_t *p_formattersMutex;
  __CFNumberFormatter *v4;

  p_formattersMutex = &self->_formattersMutex;
  pthread_mutex_lock(&self->_formattersMutex);
  if (-[NSMutableArray count](self->_numberFormatters, "count"))
  {
    v4 = (__CFNumberFormatter *)(id)-[NSMutableArray lastObject](self->_numberFormatters, "lastObject");
    -[NSMutableArray removeLastObject](self->_numberFormatters, "removeLastObject");
    pthread_mutex_unlock(p_formattersMutex);
    if (v4)
      return v4;
  }
  else
  {
    pthread_mutex_unlock(p_formattersMutex);
  }
  v4 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)-[OITSULocale locale](self, "locale"), 0);
  CFNumberFormatterSetFormat(v4, CFSTR("0"));
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0));
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0x7FFFFFFFLL));
  if (v4)
    return v4;
  return 0;
}

- (void)returnNumberFormatter:(__CFNumberFormatter *)a3
{
  _opaque_pthread_mutex_t *p_formattersMutex;

  if (a3)
  {
    p_formattersMutex = &self->_formattersMutex;
    pthread_mutex_lock(&self->_formattersMutex);
    -[NSMutableArray addObject:](self->_numberFormatters, "addObject:", a3);
    pthread_mutex_unlock(p_formattersMutex);
  }
}

- (__CFNumberFormatter)checkoutScientificNumberFormatter
{
  _opaque_pthread_mutex_t *p_formattersMutex;
  __CFNumberFormatter *v4;

  p_formattersMutex = &self->_formattersMutex;
  pthread_mutex_lock(&self->_formattersMutex);
  if (-[NSMutableArray count](self->_scientificNumberFormatters, "count"))
  {
    v4 = (__CFNumberFormatter *)(id)-[NSMutableArray lastObject](self->_scientificNumberFormatters, "lastObject");
    -[NSMutableArray removeLastObject](self->_scientificNumberFormatters, "removeLastObject");
    pthread_mutex_unlock(p_formattersMutex);
    if (v4)
      return v4;
  }
  else
  {
    pthread_mutex_unlock(p_formattersMutex);
  }
  v4 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)-[OITSULocale locale](self, "locale"), 4);
  CFNumberFormatterSetFormat(v4, CFSTR("0E+0"));
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0));
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0x7FFFFFFFLL));
  if (v4)
    return v4;
  return 0;
}

- (void)returnScientificNumberFormatter:(__CFNumberFormatter *)a3
{
  _opaque_pthread_mutex_t *p_formattersMutex;

  if (a3)
  {
    p_formattersMutex = &self->_formattersMutex;
    pthread_mutex_lock(&self->_formattersMutex);
    -[NSMutableArray addObject:](self->_scientificNumberFormatters, "addObject:", a3);
    pthread_mutex_unlock(p_formattersMutex);
  }
}

- (void)_initializeNumberFormatterStringFromDoubleCache
{
  __CFNumberFormatter *v3;
  __CFNumberFormatter *v4;
  __CFNumberFormatter *v5;
  __CFNumberFormatter *v6;

  -[NSLock lock](self->_numberFormatterStringFromDoubleWithFormatLock, "lock");
  if (!self->_noMinusSignCurrencyFormatter)
  {
    v3 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)-[OITSULocale locale](self, "locale"), 0);
    self->_noMinusSignCurrencyFormatter = v3;
    CFNumberFormatterSetProperty(v3, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6));
    CFNumberFormatterSetProperty(self->_noMinusSignCurrencyFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], &unk_24F46A330);
  }
  if (!self->_currencyFormatter)
  {
    v4 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)-[OITSULocale locale](self, "locale"), 0);
    self->_currencyFormatter = v4;
    CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6));
    CFNumberFormatterSetProperty(self->_currencyFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], &unk_24F46A330);
  }
  if (!self->_noMinusSignPlainFormatter)
  {
    v5 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)-[OITSULocale locale](self, "locale"), 0);
    self->_noMinusSignPlainFormatter = v5;
    CFNumberFormatterSetProperty(v5, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6));
    CFNumberFormatterSetProperty(self->_noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], &unk_24F46A330);
  }
  if (!self->_plainFormatter)
  {
    v6 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)-[OITSULocale locale](self, "locale"), 0);
    self->_plainFormatter = v6;
    CFNumberFormatterSetProperty(v6, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6));
    CFNumberFormatterSetProperty(self->_plainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], &unk_24F46A330);
  }
  -[NSLock unlock](self->_numberFormatterStringFromDoubleWithFormatLock, "unlock");
}

- (id)numberFormatterStringFromDouble:(double)a3 withFormat:(id)a4 useDecimalPlaces:(BOOL)a5 minDecimalPlaces:(unsigned __int16)a6 decimalPlaces:(unsigned __int16)a7 showThousandsSeparator:(BOOL)a8 currencyCode:(id)a9 suppressMinusSign:(BOOL)a10
{
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v17;
  uint64_t v18;
  __CFNumberFormatter *noMinusSignPlainFormatter;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CFTypeRef *v24;
  const __CFString *v25;
  const __CFNumber *v26;
  CFNumberType Type;
  __CFString *v28;
  int valuePtr;
  double v31;

  v11 = a8;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v31 = a3;
  if (!self->_plainFormatter)
    -[OITSULocale _initializeNumberFormatterStringFromDoubleCache](self, "_initializeNumberFormatterStringFromDoubleCache");
  -[NSLock lock](self->_numberFormatterStringFromDoubleWithFormatLock, "lock");
  if (a9 && objc_msgSend(a9, "length"))
  {
    v17 = 296;
    if (a10)
    {
      v17 = 304;
      v18 = 320;
    }
    else
    {
      v18 = 312;
    }
    noMinusSignPlainFormatter = *(Class *)((char *)&self->super.isa + v17);
    if ((objc_msgSend(a9, "isEqualToString:", *(Class *)((char *)&self->super.isa + v18)) & 1) == 0)
    {
      TSUHarmonizedCFNumberFormatterSetCurrency(noMinusSignPlainFormatter, a9);

      *(Class *)((char *)&self->super.isa + v18) = (Class)objc_msgSend(a9, "copy");
    }
  }
  else if (a10)
  {
    noMinusSignPlainFormatter = self->_noMinusSignPlainFormatter;
  }
  else
  {
    noMinusSignPlainFormatter = self->_plainFormatter;
  }
  CFNumberFormatterSetFormat(noMinusSignPlainFormatter, (CFStringRef)a4);
  if (v14)
  {
    if ((unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary == (_DWORD)v12)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0x7FFFFFFFLL);
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], v20);
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], v21);

    }
    else
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v13);
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], v22);

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v12);
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], v23);

    }
  }
  if (a10)
    CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4D8], &stru_24F3BFFF8);
  v24 = (CFTypeRef *)MEMORY[0x24BDBD268];
  if (v11)
    v24 = (CFTypeRef *)MEMORY[0x24BDBD270];
  CFNumberFormatterSetProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD550], *v24);
  if (v11)
  {
    v25 = (const __CFString *)*MEMORY[0x24BDBD488];
    v26 = (const __CFNumber *)CFNumberFormatterCopyProperty(noMinusSignPlainFormatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD488]);
    valuePtr = 0;
    Type = CFNumberGetType(v26);
    CFNumberGetValue(v26, Type, &valuePtr);
    if (!valuePtr)
      CFNumberFormatterSetProperty(noMinusSignPlainFormatter, v25, (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[OITSULocale groupingSize](self, "groupingSize")));
  }
  v28 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x24BDBD240], noMinusSignPlainFormatter, kCFNumberDoubleType, &v31);
  -[NSLock unlock](self->_numberFormatterStringFromDoubleWithFormatLock, "unlock");
  return v28;
}

- (id)localeSpecificStorageForKey:(id)a3
{
  id v5;

  if (!a3)
    return 0;
  -[NSLock lock](self->_localeSpecificStorageLock, "lock");
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_localeSpecificStorage, "objectForKey:", a3);
  -[NSLock unlock](self->_localeSpecificStorageLock, "unlock");
  return v5;
}

- (void)setLocaleSpecificStorage:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *localeSpecificStorage;

  if (a4)
  {
    -[NSLock lock](self->_localeSpecificStorageLock, "lock");
    localeSpecificStorage = self->_localeSpecificStorage;
    if (a3)
      -[NSMutableDictionary setObject:forKey:](localeSpecificStorage, "setObject:forKey:", a3, a4);
    else
      -[NSMutableDictionary removeObjectForKey:](localeSpecificStorage, "removeObjectForKey:", a4);
    -[NSLock unlock](self->_localeSpecificStorageLock, "unlock");
  }
}

- (id)localizedStringWithFormat:(id)a3
{
  uint64_t v4;

  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:arguments:", a3, -[OITSULocale locale](self, "locale"), &v4);
}

- (int64_t)localizedCompare:(id)a3 toString:(id)a4
{
  return objc_msgSend(a3, "compare:options:range:locale:", a4, 0, 0, objc_msgSend(a3, "length"), -[OITSULocale locale](self, "locale"));
}

- (int64_t)localizedCaseInsensitiveCompare:(id)a3 toString:(id)a4
{
  return objc_msgSend(a3, "compare:options:range:locale:", a4, 1, 0, objc_msgSend(a3, "length"), -[OITSULocale locale](self, "locale"));
}

- (BOOL)localizedCaseInsensitiveIsEqual:(id)a3 toString:(id)a4
{
  return -[OITSULocale localizedCaseInsensitiveCompare:toString:](self, "localizedCaseInsensitiveCompare:toString:", a3, a4) == 0;
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  void *v7;
  CFURLRef v8;

  objc_sync_enter(self);
  if (!sLocalizedStringBundle)
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(v7, "setLocalizedStringBundle:", CFBundleGetMainBundle());
    v8 = CFBundleCopyBundleURL((CFBundleRef)sLocalizedStringBundle);
    CFRelease(v8);
  }
  objc_sync_exit(self);
  return a3;
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5
{
  return -[OITSULocale URLForResource:withExtension:subdirectory:inBundle:](self, "URLForResource:withExtension:subdirectory:inBundle:", a3, a4, a5, sLocalizedStringBundle);
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 inBundleWithURL:(id)a6
{
  CFBundleRef v10;
  id v11;

  v10 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFURLRef)a6);
  v11 = -[OITSULocale URLForResource:withExtension:subdirectory:inBundle:](self, "URLForResource:withExtension:subdirectory:inBundle:", a3, a4, a5, v10);
  CFRelease(v10);
  return v11;
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 inBundle:(__CFBundle *)a6
{
  const __CFArray *v11;
  const __CFArray *v12;
  const __CFString *ValueAtIndex;
  CFURLRef v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v11 = CFBundleCopyBundleLocalizations(a6);
  v16[0] = -[OITSULocale localeIdentifierWithLanguageAndRegionOnly](self, "localeIdentifierWithLanguageAndRegionOnly");
  v12 = CFBundleCopyLocalizationsForPreferences(v11, (CFArrayRef)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1));
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v12, 0);
  v14 = CFBundleCopyResourceURLForLocalization(a6, (CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, ValueAtIndex);
  CFRelease(v11);
  CFRelease(v12);
  return v14;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)documentLanguageIdentifier
{
  return self->_documentLanguageIdentifier;
}

- (BOOL)isAutoUpdating
{
  return self->_isAutoUpdating;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)decimalSeparator
{
  return self->_decimalSeparator;
}

- (NSString)currencyDecimalSeparator
{
  return self->_currencyDecimalSeparator;
}

- (NSString)groupingSeparator
{
  return self->_groupingSeparator;
}

- (NSString)currencyGroupingSeparator
{
  return self->_currencyGroupingSeparator;
}

- (NSString)listSeparator
{
  return self->_listSeparator;
}

- (unint64_t)groupingSize
{
  return self->_groupingSize;
}

- (NSString)percentSymbol
{
  return self->_percentSymbol;
}

- (NSLocale)gregorianCalendarLocale
{
  return self->_gregorianCalendarLocale;
}

- (int64_t)dateComponentOrdering
{
  return self->_dateComponentOrdering;
}

- (NSArray)monthSymbols
{
  return self->_monthSymbols;
}

- (NSArray)standaloneMonthSymbols
{
  return self->_standaloneMonthSymbols;
}

- (NSArray)weekdaySymbols
{
  return self->_weekdaySymbols;
}

- (NSArray)standaloneWeekdaySymbols
{
  return self->_standaloneWeekdaySymbols;
}

- (NSArray)shortMonthSymbols
{
  return self->_shortMonthSymbols;
}

- (NSArray)shortStandaloneMonthSymbols
{
  return self->_shortStandaloneMonthSymbols;
}

- (NSArray)shortWeekdaySymbols
{
  return self->_shortWeekdaySymbols;
}

- (NSArray)shortStandaloneWeekdaySymbols
{
  return self->_shortStandaloneWeekdaySymbols;
}

- (NSString)trueString
{
  return self->_trueString;
}

- (NSString)falseString
{
  return self->_falseString;
}

- (OITSUDateParserLibrary)dateParserLibrary
{
  return self->_dateParserLibrary;
}

- (NSString)amString
{
  return self->_amString;
}

- (NSString)pmString
{
  return self->_pmString;
}

@end

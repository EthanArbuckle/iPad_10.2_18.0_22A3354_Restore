@implementation NSBundle(SCROBundleExtras)

+ (id)brailleDriverBundles
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__NSBundle_SCROBundleExtras__brailleDriverBundles__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (brailleDriverBundles_onceToken != -1)
    dispatch_once(&brailleDriverBundles_onceToken, block);
  return (id)_DriverBundleArray;
}

+ (id)brailleDriverBundleWithIdentifier:()SCROBundleExtras
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (!_DriverBundleDictionary)
  {
    v7 = (id)objc_msgSend(a1, "brailleDriverBundles");
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)_DriverBundleDictionary, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

+ (id)brailleDriverDeviceDetectionInfo
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "brailleDriverBundles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v7, "objectForInfoDictionaryKey:", kSCROBrailleDriverAutoDetectDictionaries[0]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v9, "setObject:forKey:", v10, kSCROBrailleDriverAutoDetectDictionaries[0]);

          objc_msgSend(v7, "objectForInfoDictionaryKey:", kSCROBrailleDriverBluetoothSearchDictionary[0]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v9, "setObject:forKey:", v11, kSCROBrailleDriverBluetoothSearchDictionary[0]);

          if (objc_msgSend(v9, "count"))
            objc_msgSend(v13, "setObject:forKey:", v9, v8);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  return v13;
}

+ (id)_brailleTableBundles
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__NSBundle_SCROBundleExtras___brailleTableBundles__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_brailleTableBundles_onceToken != -1)
    dispatch_once(&_brailleTableBundles_onceToken, block);
  return (id)_TableBundleArray;
}

+ (id)brailleTableBundleWithTableIdentifier:()SCROBundleExtras
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "_brailleTableBundles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_msgSend(v4, "hasPrefix:", v10) & 1) != 0)
        {
          v6 = v9;

          goto LABEL_12;
        }

      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

+ (id)_brailleTableDictionaryForBrailleTableIdentifier:()SCROBundleExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v4 = a3;
  objc_msgSend(a1, "brailleTableBundleWithTableIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v6, "length") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("BrailleTables"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
      v15 = v12;
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (uint64_t)doesBrailleTableSupportContractions:()SCROBundleExtras
{
  void *v1;
  void *v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;

  objc_msgSend(a1, "_brailleTableDictionaryForBrailleTableIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("supportsContraction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = objc_msgSend(v2, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (uint64_t)doesBrailleTableSupportEightDot:()SCROBundleExtras
{
  void *v1;
  void *v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;

  objc_msgSend(a1, "_brailleTableDictionaryForBrailleTableIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("supports8dot"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = objc_msgSend(v2, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (id)languageIdentifiersForBrailleTableIdentifier:()SCROBundleExtras
{
  void *v1;
  void *v2;
  void *v3;
  char isKindOfClass;
  id v5;

  objc_msgSend(a1, "_brailleTableDictionaryForBrailleTableIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("languages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = v2;
  else
    v5 = 0;

  return v5;
}

- (id)tableIdentifierForBundleSpecificTableIdentifier:()SCROBundleExtras
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathExtension:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end

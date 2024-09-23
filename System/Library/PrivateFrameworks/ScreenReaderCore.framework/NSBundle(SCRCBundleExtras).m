@implementation NSBundle(SCRCBundleExtras)

+ (id)coreFrameworkBundle
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)_SCRCFrameworkBundle;
  if (!_SCRCFrameworkBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_SCRCFrameworkBundle;
    _SCRCFrameworkBundle = v1;

    v0 = (void *)_SCRCFrameworkBundle;
  }
  return v0;
}

+ (id)localizedCoreStringForKey:()SCRCBundleExtras
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "coreFrameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)screenReaderFrameworkBundle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v13;

  v2 = (void *)_SCRFrameworkBundle;
  if (!_SCRFrameworkBundle)
  {
    objc_msgSend(a1, "bundleWithIdentifier:", CFSTR("com.apple.ScreenReader"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_SCRFrameworkBundle;
    _SCRFrameworkBundle = v3;

    v2 = (void *)_SCRFrameworkBundle;
    if (!_SCRFrameworkBundle)
    {
      objc_msgSend(a1, "coreFrameworkBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundlePath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("ScreenReader.framework"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v13);

      if ((_DWORD)v6)
      {
        objc_msgSend(a1, "bundleWithPath:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)_SCRFrameworkBundle;
        _SCRFrameworkBundle = v10;

      }
      v2 = (void *)_SCRFrameworkBundle;
      if (!_SCRFrameworkBundle)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCRCBundleExtras"), CFSTR("Unable to locate ScreenReader bundle"));
        v2 = (void *)_SCRFrameworkBundle;
      }
    }
  }
  return v2;
}

+ (id)localizedScreenReaderStringForKey:()SCRCBundleExtras table:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "screenReaderFrameworkBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)preferredLocalizationsForLocale:()SCRCBundleExtras
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  if (preferredLocalizationsForLocale__onceToken != -1)
    dispatch_once(&preferredLocalizationsForLocale__onceToken, &__block_literal_global);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = preferredLocalizationsForLocale__preferredLocQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__NSBundle_SCRCBundleExtras__preferredLocalizationsForLocale___block_invoke_15;
  v8[3] = &unk_24CB25340;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_barrier_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (id)localeForString:()SCRCBundleExtras
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsForLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("en")))
    {
      v6 = objc_msgSend(CFSTR("English"), "length");
      if (objc_msgSend(v3, "compare:options:", CFSTR("en"), 1))
      {
        if (((unint64_t)objc_msgSend(v3, "length") < 2
           || objc_msgSend(v3, "compare:options:range:", CFSTR("en-"), 1, 0, 3)
           && objc_msgSend(v3, "compare:options:range:", CFSTR("en_"), 1, 0, 3))
          && (objc_msgSend(v3, "length") < v6
           || objc_msgSend(v3, "compare:options:range:", CFSTR("English"), 1, 0, v6)))
        {

          v5 = 0;
        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "length"))
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", v5);
  else
    v7 = 0;

  return v7;
}

- (id)bundleLocale
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "preferredLocalizations");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)localizedStringForKey:()SCRCBundleExtras table:locale:
{
  void *v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromString:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_32;
  v29 = v10;
  objc_msgSend(a1, "localizations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v12;
  v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v37;
LABEL_4:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v15)
        objc_enumerationMutation(v13);
      v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16);
      if ((objc_msgSend(v17, "isEqualToString:", v11) & 1) != 0)
        break;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_"), v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "hasPrefix:", v5);

      if (v18)
        objc_msgSend(v31, "addObject:", v17);
      if (v14 == (id)++v16)
      {
        v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v14)
          goto LABEL_4;
        v5 = v13;
        v10 = v29;
        goto LABEL_17;
      }
    }
    v14 = v17;

    if (!v14)
    {
      v28 = 0;
      v10 = v29;
      goto LABEL_19;
    }
    v10 = v29;
    objc_msgSend(a1, "localizedStringForKey:value:table:localization:", v9, CFSTR("__NULL__"), v29, v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("__NULL__")))
      goto LABEL_17;
    v19 = 1;
  }
  else
  {
    v5 = v13;
    v10 = v29;
LABEL_17:
    v28 = v14;

LABEL_19:
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = v31;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = v21;
      v30 = v13;
      v23 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          v25 = a1;
          objc_msgSend(a1, "localizedStringForKey:value:table:localization:", v9, CFSTR("__NULL__"), v10, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v26, "isEqualToString:", CFSTR("__NULL__")))
          {
            v19 = 1;
            v5 = v26;
            a1 = v25;
            v13 = v30;
            goto LABEL_30;
          }

          a1 = v25;
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v22)
          continue;
        break;
      }
      v19 = 0;
      v13 = v30;
    }
    else
    {
      v19 = 0;
    }
LABEL_30:

    v14 = v28;
  }

  if (!v19)
  {
LABEL_32:
    objc_msgSend(a1, "localizedStringForKey:value:table:", v9, v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end

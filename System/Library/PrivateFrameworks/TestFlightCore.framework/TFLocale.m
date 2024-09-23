@implementation TFLocale

+ (id)preferredLocaleKeyFromAvailableKeys:(id)a3 primaryLocaleKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v8))
    {
      v9 = v8;
    }
    else
    {
      v21 = v8;
      v23 = v6;
      objc_msgSend(v5, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v7;
      objc_msgSend(v7, "languageCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "languageCode");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v19, "isEqualToString:", v11) & 1) != 0)
            {
              v9 = v17;

              v6 = v23;
              goto LABEL_18;
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v14)
            continue;
          break;
        }
      }

      v6 = v23;
      if (v23 && objc_msgSend(v5, "containsObject:", v23))
      {
        v9 = v23;
LABEL_18:
        v8 = v21;
        v7 = v22;
      }
      else
      {
        v9 = CFSTR("en_US");
        v8 = v21;
        v7 = v22;
        if ((objc_msgSend(v5, "containsObject:", CFSTR("en_US")) & 1) == 0)
        {
          objc_msgSend(v12, "firstObject");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)preferredLocalizedDisplayNameFromDisplayNames:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "localizedNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "primaryLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFLocale preferredLocaleKeyFromAvailableKeys:primaryLocaleKey:](TFLocale, "preferredLocaleKeyFromAvailableKeys:primaryLocaleKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

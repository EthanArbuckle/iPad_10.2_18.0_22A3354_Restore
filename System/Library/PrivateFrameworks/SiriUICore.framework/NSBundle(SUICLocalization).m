@implementation NSBundle(SUICLocalization)

- (id)suic_localizedStringForKey:()SUICLocalization value:table:
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFArray *v19;
  const __CFArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[__CFString length](v10, "length"))
  {

    v10 = CFSTR("Localizable");
  }
  if (__currentLanguageCode)
  {
    v11 = (void *)__stringTables;
    if (!__stringTables)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)__stringTables;
      __stringTables = v12;

      v11 = (void *)__stringTables;
    }
    objc_msgSend(a1, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15
      || (objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = (void *)__stringTables,
          objc_msgSend(a1, "bundleIdentifier"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "setObject:forKey:", v15, v17),
          v17,
          v15))
    {
      objc_msgSend(v15, "objectForKey:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
LABEL_19:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v18, "objectForKey:", v8);
          v28 = (id)objc_claimAutoreleasedReturnValue();

          if (v28)
            goto LABEL_28;
          goto LABEL_23;
        }
      }
      else
      {
        v31 = v15;
        v32 = v9;
        v33 = v8;
        v19 = (const __CFArray *)objc_msgSend(a1, "localizations");
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v20 = CFBundleCopyLocalizationsForPreferences(v19, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", __currentLanguageCode));
        v21 = -[__CFArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v35;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v35 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(a1, "URLForResource:withExtension:subdirectory:localization:", v10, CFSTR("strings"), 0, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v25);
              v26 = objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                v18 = (void *)v26;
                v15 = v31;
                objc_msgSend(v31, "setObject:forKey:", v26, v10);

                v9 = v32;
                v8 = v33;
                goto LABEL_19;
              }

            }
            v22 = -[__CFArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            if (v22)
              continue;
            break;
          }
        }

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v31;
        objc_msgSend(v31, "setObject:forKey:", v27, v10);

        v18 = 0;
        v9 = v32;
        v8 = v33;
      }

    }
  }
LABEL_23:
  v29 = v8;
  if (v9)
  {
    if (objc_msgSend(v9, "length"))
      v29 = v9;
    else
      v29 = v8;
  }
  v28 = v29;
LABEL_28:

  return v28;
}

- (uint64_t)suic_localizedStringForKey:()SUICLocalization table:
{
  return objc_msgSend(a1, "suic_localizedStringForKey:value:table:", a3, 0, a4);
}

- (uint64_t)suic_localizedStringForKey:()SUICLocalization
{
  return objc_msgSend(a1, "suic_localizedStringForKey:table:", a3, 0);
}

@end

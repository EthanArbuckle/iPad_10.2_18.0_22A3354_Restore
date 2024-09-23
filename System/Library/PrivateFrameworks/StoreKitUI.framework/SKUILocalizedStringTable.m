@implementation SKUILocalizedStringTable

- (SKUILocalizedStringTable)initWithBundle:(id)a3 localeName:(id)a4 tableName:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKUILocalizedStringTable *v12;
  SKUILocalizedStringTable *v13;
  uint64_t v14;
  NSString *tableName;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)SKUILocalizedStringTable;
  v12 = -[SKUILocalizedStringTable init](&v38, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundle, a3);
    v14 = objc_msgSend(v11, "copy");
    tableName = v13->_tableName;
    v13->_tableName = (NSString *)v14;

    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("zh_Hans")) & 1) != 0)
    {
      v17 = CFSTR("zh_CN");
    }
    else
    {
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("zh_Hant")))
      {
LABEL_7:
        objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", v11, CFSTR("strings"), 0, v16);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (!v16 || v18)
        {
          v10 = v16;
          if (!v18)
          {
LABEL_32:

            goto LABEL_33;
          }
        }
        else
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v16);
          objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0C997E8]);
          v10 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", v11, CFSTR("strings"), 0, v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            -[SKUILocalizedStringTable _legacyLanguageNameForLanguageCode:](v13, "_legacyLanguageNameForLanguageCode:", v10);
            v21 = objc_claimAutoreleasedReturnValue();
            if (!v21
              || (v22 = (void *)v21,
                  objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", v11, CFSTR("strings"), 0, v21), v19 = (void *)objc_claimAutoreleasedReturnValue(), v22, !v19))
            {
              objc_msgSend(v9, "preferredLocalizations");
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v23 = (id)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
              if (v24)
              {
                v25 = v24;
                v33 = v20;
                v26 = *(_QWORD *)v35;
                while (2)
                {
                  for (i = 0; i != v25; ++i)
                  {
                    if (*(_QWORD *)v35 != v26)
                      objc_enumerationMutation(v23);
                    v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                    if (objc_msgSend(v28, "hasPrefix:", v10))
                    {
                      objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", v11, CFSTR("strings"), 0, v28);
                      v29 = objc_claimAutoreleasedReturnValue();
                      if (v29)
                      {
                        v19 = (void *)v29;
                        goto LABEL_25;
                      }
                    }
                  }
                  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
                  if (v25)
                    continue;
                  break;
                }
                v19 = 0;
LABEL_25:
                v20 = v33;
              }
              else
              {
                v19 = 0;
              }

            }
          }

          if (!v19)
            goto LABEL_32;
        }
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v19);
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v30, 0, 0, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&v13->_strings, v31);

        goto LABEL_32;
      }
      v17 = CFSTR("zh_TW");
    }

    v16 = (void *)v17;
    goto LABEL_7;
  }
LABEL_33:

  return v13;
}

- (id)localizedStringForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_strings, "objectForKey:", a3);
}

- (id)_legacyLanguageNameForLanguageCode:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("de")) & 1) != 0)
  {
    v4 = CFSTR("German");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("en")) & 1) != 0)
  {
    v4 = CFSTR("English");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("es")) & 1) != 0)
  {
    v4 = CFSTR("Spanish");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fr")) & 1) != 0)
  {
    v4 = CFSTR("French");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("it")) & 1) != 0)
  {
    v4 = CFSTR("Italian");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("jp")))
  {
    v4 = CFSTR("Japanese");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

@end

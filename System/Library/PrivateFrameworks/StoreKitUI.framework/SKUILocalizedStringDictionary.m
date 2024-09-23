@implementation SKUILocalizedStringDictionary

- (SKUILocalizedStringDictionary)initWithLocaleName:(id)a3 bundles:(id)a4
{
  id v6;
  id v7;
  SKUILocalizedStringDictionary *v8;
  uint64_t v9;
  NSArray *bundles;
  uint64_t v11;
  NSString *localeName;
  NSMutableArray *v13;
  NSMutableArray *stringTables;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUILocalizedStringDictionary initWithLocaleName:bundles:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUILocalizedStringDictionary;
  v8 = -[SKUILocalizedStringDictionary init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    bundles = v8->_bundles;
    v8->_bundles = (NSArray *)v9;

    v11 = objc_msgSend(v6, "copy");
    localeName = v8->_localeName;
    v8->_localeName = (NSString *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stringTables = v8->_stringTables;
    v8->_stringTables = v13;

  }
  return v8;
}

- (id)localizedStringForKey:(id)a3
{
  return -[SKUILocalizedStringDictionary localizedStringForKey:inTable:](self, "localizedStringForKey:inTable:", a3, 0);
}

- (id)localizedStringForKey:(id)a3 inTable:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("Localizable");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = self->_bundles;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(v9);
      -[SKUILocalizedStringDictionary _stringTableForBundle:tableName:](self, "_stringTableForBundle:tableName:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v11)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = self->_bundles;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
LABEL_14:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v19), "localizedStringForKey:value:table:", v6, &stru_1E73A9FB0, v8, (_QWORD)v25);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        if (v20 && v20 != v6)
          break;

        if (v17 == ++v19)
        {
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v17)
            goto LABEL_14;
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      v15 = 0;
    }
  }

  if (v15)
    v22 = v15;
  else
    v22 = v6;
  v23 = v22;

  return v23;
}

- (id)_stringTableForBundle:(id)a3 tableName:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  SKUILocalizedStringTable *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_stringTables;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
      objc_msgSend(v13, "bundle", (_QWORD)v19);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v6)
      {
        objc_msgSend(v13, "tableName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v7);

        if ((v16 & 1) != 0)
        {
          v17 = v13;

          if (v17)
            goto LABEL_14;
          goto LABEL_13;
        }
      }
      else
      {

      }
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

LABEL_13:
  v17 = -[SKUILocalizedStringTable initWithBundle:localeName:tableName:]([SKUILocalizedStringTable alloc], "initWithBundle:localeName:tableName:", v6, self->_localeName, v7);
  -[NSMutableArray addObject:](self->_stringTables, "addObject:", v17);
LABEL_14:

  return v17;
}

- (NSString)localeName
{
  return self->_localeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeName, 0);
  objc_storeStrong((id *)&self->_stringTables, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

- (void)initWithLocaleName:bundles:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILocalizedStringDictionary initWithLocaleName:bundles:]";
}

@end

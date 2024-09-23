@implementation SRCSSpokenCommandUtilities

+ (id)sharedSpokenCommandUtilities
{
  if (sharedSpokenCommandUtilities_instaniateReporter != -1)
    dispatch_once(&sharedSpokenCommandUtilities_instaniateReporter, &__block_literal_global_0);
  return (id)sSRCSSpokenCommandUtilities;
}

void __58__SRCSSpokenCommandUtilities_sharedSpokenCommandUtilities__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sSRCSSpokenCommandUtilities;
  sSRCSSpokenCommandUtilities = v0;

}

+ (__CFStringTokenizer)wordUnitStringTokenizerRefForLocaleIdentifier:(id)a3
{
  __CFString *v4;
  id v5;
  __CFString *v6;
  CFStringTokenizerRef v7;
  const __CFLocale *v8;
  CFRange v10;

  v4 = (__CFString *)a3;
  if (wordUnitStringTokenizerRefForLocaleIdentifier__onceToken != -1)
    dispatch_once(&wordUnitStringTokenizerRefForLocaleIdentifier__onceToken, &__block_literal_global_4);
  v5 = a1;
  objc_sync_enter(v5);
  if (-[__CFString length](v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("SystemUI");
  }
  v7 = (CFStringTokenizerRef)objc_msgSend((id)wordUnitStringTokenizerRefForLocaleIdentifier__sStringTokenizerForLocaleIdentifierTable, "objectForKey:", v6);
  if (!v7)
  {
    if (-[__CFString length](v4, "length"))
      v8 = CFLocaleCreate(0, v4);
    else
      v8 = 0;
    v10.location = 0;
    v10.length = 0;
    v7 = CFStringTokenizerCreate(0, &stru_24F657348, v10, 0, v8);
    if (v8)
      CFRelease(v8);
    if (v7)
    {
      objc_msgSend((id)wordUnitStringTokenizerRefForLocaleIdentifier__sStringTokenizerForLocaleIdentifierTable, "setObject:forKey:", v7, v6);
      CFRelease(v7);
    }
  }

  objc_sync_exit(v5);
  return v7;
}

void __76__SRCSSpokenCommandUtilities_wordUnitStringTokenizerRefForLocaleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)wordUnitStringTokenizerRefForLocaleIdentifier__sStringTokenizerForLocaleIdentifierTable;
  wordUnitStringTokenizerRefForLocaleIdentifier__sStringTokenizerForLocaleIdentifierTable = v0;

}

- (SRCSSpokenCommandUtilities)init
{
  SRCSSpokenCommandUtilities *v2;
  uint64_t v3;
  NSMutableDictionary *commandStringsTablesByLocaleIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRCSSpokenCommandUtilities;
  v2 = -[SRCSSpokenCommandUtilities init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    commandStringsTablesByLocaleIdentifier = v2->_commandStringsTablesByLocaleIdentifier;
    v2->_commandStringsTablesByLocaleIdentifier = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)commandAttributes
{
  NSDictionary *commandAttributes;
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *v7;

  commandAttributes = self->_commandAttributes;
  if (!commandAttributes)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("CommandAttributes"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v5);
    v7 = self->_commandAttributes;
    self->_commandAttributes = v6;

    commandAttributes = self->_commandAttributes;
  }
  return commandAttributes;
}

- (id)commandStringsTableForLocaleIdentifier:(id)a3
{
  id v4;
  SRCSSpokenCommandUtilities *v5;
  SRCSCommandStringsTable *v6;
  SRCSSpokenCommandUtilities *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_commandStringsTablesByLocaleIdentifier, "objectForKey:", v4);
  v6 = (SRCSCommandStringsTable *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (!v6)
  {
    v6 = -[SRCSCommandStringsTable initWithLocaleIdentifier:]([SRCSCommandStringsTable alloc], "initWithLocaleIdentifier:", v4);
    if (v6)
    {
      v7 = v5;
      objc_sync_enter(v7);
      -[NSMutableDictionary setObject:forKey:](v5->_commandStringsTablesByLocaleIdentifier, "setObject:forKey:", v6, v4);
      objc_sync_exit(v7);

    }
  }

  return v6;
}

- (void)_flushBuiltInCommandsStringsTable
{
  SRCSSpokenCommandUtilities *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_commandStringsTablesByLocaleIdentifier, "removeAllObjects");
  objc_sync_exit(obj);

}

- (id)dictionaryForLocaleIdentifier:(id)a3 resourceFileName:(id)a4 resourceFileExtension:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCSSpokenCommandUtilities dictionaryForLocaleIdentifier:bundle:resourceFileName:resourceFileExtension:](self, "dictionaryForLocaleIdentifier:bundle:resourceFileName:resourceFileExtension:", v11, v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_suffixedURLsForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v23 = (id)objc_opt_new();
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v4;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v12, "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "hasPrefix:", v17);

          if (v18)
          {
            objc_msgSend(v12, "pathExtension");
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v19;
            if (!(v24 | v19)
              || (v24 == 0) == (v19 == 0) && objc_msgSend((id)v24, "isEqualToString:", v19))
            {
              objc_msgSend(v23, "addObject:", v12);
            }

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v23;
}

- (id)dictionaryForLocaleIdentifier:(id)a3 bundle:(id)a4 resourceFileName:(id)a5 resourceFileExtension:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  __CFString *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  _QWORD v57[3];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[SRCSCommandStringsTable componentsFromLocaleIdentifier:](SRCSCommandStringsTable, "componentsFromLocaleIdentifier:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("nb")))
  {

    v14 = CFSTR("no");
  }
  objc_msgSend(v10, "pathForResource:ofType:inDirectory:forLocalization:", v11, v12, 0, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v30 = v9;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  if (!v16)
  {
LABEL_19:
    v47 = v15;
    v31 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v10, "localizations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_24F65AF38, "arrayByAddingObjectsFromArray:", v32);
    v33 = v14;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "preferredLocalizationsFromArray:forPreferences:", v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v33;
    objc_msgSend(v36, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (!v37
      || (objc_msgSend(v37, "isEqualToString:", CFSTR("zxx")) & 1) != 0
      || objc_msgSend(v38, "isEqualToString:", CFSTR("en"))
      && !-[__CFString isEqualToString:](v33, "isEqualToString:", CFSTR("en")))
    {

      v18 = 0;
      v15 = v47;
    }
    else
    {
      v18 = v38;

      objc_msgSend(v10, "pathForResource:ofType:inDirectory:forLocalization:", v11, v12, 0, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_29;
        goto LABEL_6;
      }
    }

    goto LABEL_29;
  }
  v18 = v17;
LABEL_6:
  v42 = v14;
  v43 = v12;
  v44 = v11;
  v45 = v10;
  v46 = v15;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_suffixedURLsForURL:", v41);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v49;
    do
    {
      v23 = 0;
      v24 = v16;
      do
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v23);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v25);
        SRCSLogGeneral();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v25, "lastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v28;
          _os_log_impl(&dword_22BD8C000, v27, OS_LOG_TYPE_DEFAULT, "Loaded override table: %@", buf, 0xCu);

        }
        objc_msgSend(v26, "dictionaryByMergingEntriesFromDictionary:", v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        ++v23;
        v24 = v16;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v21);
  }

  v10 = v45;
  if (v16)
  {
    SRCSLogGeneral();
    v29 = objc_claimAutoreleasedReturnValue();
    v15 = v46;
    v12 = v43;
    v11 = v44;
    v14 = v42;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v53 = v18;
      v54 = 2112;
      v55 = v9;
      _os_log_impl(&dword_22BD8C000, v29, OS_LOG_TYPE_DEFAULT, "Found commands localization: %@ for desired locale: %@", buf, 0x16u);
    }
    goto LABEL_32;
  }
  v15 = v46;
  v12 = v43;
  v11 = v44;
  v14 = v42;
LABEL_29:
  SRCSLogGeneral();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "localizations");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v53 = v9;
    v54 = 2112;
    v55 = v39;
    _os_log_impl(&dword_22BD8C000, v29, OS_LOG_TYPE_DEFAULT, "Failed to find commands for desired locale: %@ from localizations: %@", buf, 0x16u);

  }
  v16 = 0;
LABEL_32:

  return v16;
}

- (id)dictionaryForLocaleIdentifier:(id)a3 bundle:(id)a4 subDirectory:(id)a5 rootFileName:(id)a6 rootFileExtension:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = a5;
  v15 = a3;
  +[SRCSCommandStringsTable componentsFromLocaleIdentifier:](SRCSCommandStringsTable, "componentsFromLocaleIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[SRCSCommandStringsTable componentsFromLocaleIdentifier:](SRCSCommandStringsTable, "componentsFromLocaleIdentifier:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("nb")))
  {

    v17 = CFSTR("no");
  }
  objc_msgSend(v11, "resourcePath");
  v30 = v11;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingPathComponent:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%@.%@"), v12, v17, v19, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(v21, "stringByAppendingPathComponent:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionaryWithContentsOfFile:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@.%@"), v12, v17, v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v21, "stringByAppendingPathComponent:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryWithContentsOfFile:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandStringsTablesByLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_commandAttributes, 0);
}

@end

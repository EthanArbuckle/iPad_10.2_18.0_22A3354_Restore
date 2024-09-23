@implementation PSSearchableItemManifest

- (PSSearchableItemManifest)init
{
  PSSearchableItemManifest *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSSearchableItemManifest;
  v2 = -[PSSearchableItemManifest init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[PSSearchableItemManifest setSearchableItems:](v2, "setSearchableItems:", v3);

  }
  return v2;
}

- (void)addSearchableItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSSearchableItemManifest searchableItems](self, "searchableItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (void)addSearchableItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSSearchableItemManifest searchableItems](self, "searchableItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeSearchableItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSSearchableItemManifest searchableItems](self, "searchableItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)items
{
  void *v2;
  void *v3;

  -[PSSearchableItemManifest searchableItems](self, "searchableItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)writeToPlistAndStringsFilesAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  BOOL v54;
  id obj;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  PSSearchableItemManifest *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  const __CFString *v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v64 = self;
  -[PSSearchableItemManifest searchableItems](self, "searchableItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v81 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v13, "bundleID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15)
        {
          objc_msgSend(v13, "bundleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v18 = (void *)objc_opt_new();
            objc_msgSend(v13, "bundleID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v19);

          }
          objc_msgSend(v13, "bundleID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    }
    while (v10);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
  if (v60)
  {
    v57 = v7;
    v58 = *(_QWORD *)v77;
    v59 = v6;
    while (2)
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v77 != v58)
          objc_enumerationMutation(obj);
        v61 = v22;
        v23 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v22);
        v67 = (void *)objc_opt_new();
        v66 = (void *)objc_opt_new();
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v62 = v23;
        objc_msgSend(v7, "objectForKeyedSubscript:", v23);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
        if (v68)
        {
          v65 = *(_QWORD *)v73;
          do
          {
            for (j = 0; j != v68; ++j)
            {
              if (*(_QWORD *)v73 != v65)
                objc_enumerationMutation(v63);
              objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "toManifestDictionary");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)objc_msgSend(v25, "mutableCopy");

              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("label"));
              v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
              -[PSSearchableItemManifest _stringKeyForString:](v64, "_stringKeyForString:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("label"));
              v29 = (void *)MEMORY[0x1E0CB3940];
              if (v27)
                v30 = v27;
              else
                v30 = &stru_1E4A69238;
              -[PSSearchableItemManifest _escapedStringForString:](v64, "_escapedStringForString:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "stringWithFormat:", CFSTR("\"%@\" = \"%@\";"), v28, v31);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v66, "addObject:", v71);
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("keywords"));
              v32 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_KEYWORDS"), v28);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v33, CFSTR("keywords"));
              v34 = (void *)MEMORY[0x1E0CB3940];
              v70 = (void *)v32;
              if (v32)
                v35 = (const __CFString *)v32;
              else
                v35 = &stru_1E4A69238;
              -[PSSearchableItemManifest _escapedStringForString:](v64, "_escapedStringForString:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "stringWithFormat:", CFSTR("\"%@\" = \"%@\";"), v33, v36);
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v66, "addObject:", v69);
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("contentDescription"));
              v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_DESCRIPTION"), v28);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, CFSTR("contentDescription"));
              v39 = (void *)MEMORY[0x1E0CB3940];
              if (v37)
                v40 = v37;
              else
                v40 = &stru_1E4A69238;
              -[PSSearchableItemManifest _escapedStringForString:](v64, "_escapedStringForString:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "stringWithFormat:", CFSTR("\"%@\" = \"%@\";"), v38, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v66, "addObject:", v42);
              v43 = (void *)objc_msgSend(v26, "copy");
              objc_msgSend(v67, "addObject:", v43);

            }
            v68 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
          }
          while (v68);
        }

        objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringByAppendingString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SettingsSearchManifest-%@"), v62);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v59;
        objc_msgSend(v59, "URLByAppendingPathComponent:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "URLByAppendingPathExtension:", CFSTR("strings"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v45, "writeToURL:atomically:encoding:error:", v48, 1, 4, a4);

        if (!v49)
        {

          v54 = 0;
          v7 = v57;
          goto LABEL_41;
        }
        v84 = CFSTR("items");
        v85 = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "URLByAppendingPathComponent:", v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "URLByAppendingPathExtension:", CFSTR("plist"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v50, "writeToURL:error:", v52, a4);

        v7 = v57;
        if (!v53)
        {
          v54 = 0;
          goto LABEL_41;
        }
        v22 = v61 + 1;
      }
      while (v61 + 1 != v60);
      v54 = 1;
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
      if (v60)
        continue;
      break;
    }
  }
  else
  {
    v54 = 1;
  }
LABEL_41:

  return v54;
}

- (id)_stringKeyForString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = _stringKeyForString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_stringKeyForString__onceToken, &__block_literal_global_17);
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_stringKeyForString__allowedCharacters, "invertedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", &stru_1E4A69238);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __48__PSSearchableItemManifest__stringKeyForString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_stringKeyForString__allowedCharacters;
  _stringKeyForString__allowedCharacters = v0;

  return objc_msgSend((id)_stringKeyForString__allowedCharacters, "addCharactersInString:", CFSTR("_"));
}

- (id)_escapedStringForString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), CFSTR("\\\\"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), CFSTR("\\%"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMutableArray)searchableItems
{
  return self->_searchableItems;
}

- (void)setSearchableItems:(id)a3
{
  objc_storeStrong((id *)&self->_searchableItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableItems, 0);
}

@end

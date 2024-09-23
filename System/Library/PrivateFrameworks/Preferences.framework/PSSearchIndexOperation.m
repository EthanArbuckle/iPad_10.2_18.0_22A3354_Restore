@implementation PSSearchIndexOperation

+ (void)setPossibleBundleRoots:(id)a3
{
  objc_storeStrong((id *)&_possibleBundleRoots, a3);
}

+ (void)setTopLevelManifestBundlePath:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_topLevelManifestBundlePath;
  _topLevelManifestBundlePath = v3;

}

- (PSSearchIndexOperation)initWithSearchEntry:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PSSearchIndexOperation *v9;
  PSSearchIndexOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSSearchIndexOperation;
  v9 = -[PSSearchIndexOperation init](&v12, sel_init);
  if (v9)
  {
    if ((objc_msgSend(v7, "hasListController") & 1) == 0)
    {
      objc_msgSend(v7, "finishIndexing");
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_searchEntry, a3);
    -[PSSearchIndexOperation setDelegate:](v9, "setDelegate:", v8);
  }
  v10 = v9;
LABEL_6:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PSSearchIndexOperation setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSSearchIndexOperation;
  -[PSSearchIndexOperation dealloc](&v3, sel_dealloc);
}

- (void)_finishedIndexingWithEntries:(id)a3 cancelled:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[PSSearchEntry finishIndexing](self->_searchEntry, "finishIndexing");
  -[PSSearchIndexOperation delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v4)
  {
    objc_msgSend(v6, "searchIndexOperationDidFinish:searchEntries:", self, v9);
    goto LABEL_5;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PSSearchIndexOperation delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchIndexOperationDidCancel:", self);
LABEL_5:

  }
  -[PSSearchIndexOperation setDelegate:](self, "setDelegate:", 0);

}

- (void)_cancel
{
  -[PSSearchIndexOperation _finishedIndexingWithEntries:cancelled:](self, "_finishedIndexingWithEntries:cancelled:", 0, 1);
}

- (void)main
{
  PSSearchIndexOperation *v2;
  id v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  Class v14;
  void *v15;
  int v16;
  NSString *v17;
  Class v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  PSSearchIndexOperation *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  __CFString *v45;
  NSString *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  id obj;
  id obja;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  char v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v2 = self;
  v64 = *MEMORY[0x1E0C80C00];
  if (-[PSSearchIndexOperation isCancelled](self, "isCancelled"))
    -[PSSearchIndexOperation _cancel](v2, "_cancel");
  v61 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "_bundleForSearchEntry:thirdPartyApp:", v2->_searchEntry, &v61);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSearchEntry specifier](v2->_searchEntry, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("dataSourceClass"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[objc_class sharedInstance](NSClassFromString(v6), "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 1;
    else
      v8 = v4 == 0;
    if (!v8)
    {
      objc_msgSend(v4, "load");
      -[objc_class sharedInstance](NSClassFromString(v6), "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v7)
    {
      -[PSSearchIndexOperation delegate](v2, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "searchIndexOperation:didFindSpecifierDataSource:", v2, v7);

      -[PSSearchEntry specifier](v2->_searchEntry, "specifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSearchIndexOperation delegate](v2, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "specifiersForSpecifier:observer:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        SearchEntriesFromSpecifiers(v12, v2->_searchEntry, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v13);

      }
      v14 = 0;
LABEL_28:

      goto LABEL_29;
    }
  }
  if (v4)
  {
    if (v61)
    {
      v14 = 0;
LABEL_23:
      if (-[PSSearchIndexOperation isCancelled](v2, "isCancelled"))
        -[PSSearchIndexOperation _cancel](v2, "_cancel");
      if (v61)
      {
        objc_msgSend((id)objc_opt_class(), "_loadThirdPartySearchEntriesForEntry:bundle:", v2->_searchEntry, v4);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v3, "count"))
          goto LABEL_29;
        objc_msgSend((id)objc_opt_class(), "_loadSearchEntriesFromPlistForEntry:bundle:", v2->_searchEntry, v4);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v19;
      objc_msgSend(v3, "addObjectsFromArray:", v19);
      goto LABEL_28;
    }
    objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("PSSupportsSearch"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("PSSearchControllerClass"));
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v4, "load");
        v18 = NSClassFromString(v17);
        if (v18)
          goto LABEL_22;
      }
      v14 = (Class)objc_msgSend(v4, "principalClass");

      if (v14)
        goto LABEL_23;
    }
    -[PSSearchEntry specifier](v2->_searchEntry, "specifier");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = (Class)-[NSString detailControllerClass](v17, "detailControllerClass");
LABEL_22:
    v14 = v18;

    goto LABEL_23;
  }
  v14 = 0;
LABEL_29:
  v20 = -[PSSearchEntry isRootEntry](v2->_searchEntry, "isRootEntry");
  if (!v61 && v20)
  {
    v46 = v6;
    v52 = v3;
    +[PSSearchIndexOperation topLevelManifestBundlePath](PSSearchIndexOperation, "topLevelManifestBundlePath");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = CFSTR("/System/Library/PrivateFrameworks/PreferencesUI.framework");
    if (v21)
      v23 = (__CFString *)v21;
    v24 = v23;

    v45 = v24;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v2;
    v48 = v14;
    v49 = v4;
    v47 = v25;
    if (v25)
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      SearchEntriesFromManifest(v2->_searchEntry, v25);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v58 != v29)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v31, "sectionIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[PSSearchEntry sectionEntry](v2->_searchEntry, "sectionEntry");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v32, "isEqualToString:", v34);

            if (v35)
              objc_msgSend(v52, "addObject:", v31);
            v2 = v26;
          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        }
        while (v28);
      }

      v14 = v48;
      v4 = v49;
      v25 = v47;
    }
    if (v4 && v25 != v4)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      SearchEntriesFromManifest(v2->_searchEntry, v4);
      obja = (id)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v54 != v38)
              objc_enumerationMutation(obja);
            v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            objc_msgSend(v40, "sectionIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[PSSearchEntry sectionEntry](v2->_searchEntry, "sectionEntry");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "identifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v41, "isEqualToString:", v43);

            if (v44)
              objc_msgSend(v52, "addObject:", v40);
            v2 = v26;
          }
          v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        }
        while (v37);
      }

      v14 = v48;
      v4 = v49;
      v25 = v47;
    }

    v3 = v52;
    v6 = v46;
  }
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    -[objc_class formatSearchEntries:parent:](v14, "formatSearchEntries:parent:", v3, v2->_searchEntry);
  objc_msgSend(v3, "count");
  -[PSSearchIndexOperation _finishedIndexingWithEntries:cancelled:](v2, "_finishedIndexingWithEntries:cancelled:", v3, -[PSSearchIndexOperation isCancelled](v2, "isCancelled"));

}

+ (id)_bundleForSearchEntry:(id)a3 thirdPartyApp:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  int AppBooleanValue;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  Boolean keyExistsAndHasValidFormat;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "bundleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "detailControllerClass");

  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "searchBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  objc_msgSend(v6, "specifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "propertyForKey:", CFSTR("AppSettingsBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (a4)
      *a4 = 1;
    goto LABEL_28;
  }
  if (!v7)
  {
    v15 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v6, "specifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleForClass:", objc_msgSend(v16, "detailControllerClass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  objc_msgSend(a1, "possibleBundleRoots");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "addObjectsFromArray:", v12);
  }
  else
  {
    SFRuntimeAbsoluteFilePathForPath();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v17);

    SFDeveloperSettingsBundlesDirectoryPath();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SFRuntimeAbsoluteFilePathForPath();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v19);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "sf_isInternalInstall"))
    {
      keyExistsAndHasValidFormat = 0;
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PSShouldIndexInternalSettings"), CFSTR("com.apple.Preferences"), &keyExistsAndHasValidFormat);
      v22 = keyExistsAndHasValidFormat;

      if (!v22 || !AppBooleanValue)
        goto LABEL_16;
      SFRuntimeAbsoluteFilePathForPath();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v20);
    }

  }
LABEL_16:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = v14;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v24)
  {
    v25 = v24;
    v31 = v12;
    v26 = *(_QWORD *)v33;
LABEL_18:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v26)
        objc_enumerationMutation(v23);
      objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v27), "stringByAppendingPathComponent:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingPathExtension:", CFSTR("bundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        break;
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v25)
          goto LABEL_18;
        v10 = 0;
        break;
      }
    }
    v12 = v31;
  }
  else
  {
    v10 = 0;
  }

LABEL_28:
  return v10;
}

+ (id)_loadThirdPartySearchEntriesForEntry:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("File"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pathForResource:ofType:", v8, CFSTR("plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v26 = v8;
    v27 = v6;
    v25 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("StringsTable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByDeletingPathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PreferenceSpecifiers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v20 = v5;
          objc_msgSend(v5, "specifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSAppListController specifiersFromDictionary:stringsTable:parentSpecifier:target:](PSAppListController, "specifiersFromDictionary:stringsTable:parentSpecifier:target:", v19, v12, v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v28, "addObjectsFromArray:", v22);

          v5 = v20;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v16);
    }

    v8 = v26;
    SearchEntriesFromSpecifiers(v28, v5, v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v27;
    v9 = v25;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)_loadSearchEntriesFromPlistForEntry:(id)a3 bundle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  id v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _QWORD v61[3];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v46 = a4;
  objc_msgSend(v5, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("searchPlist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bundleName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (__CFString *)v8;
  if (v7)
  {
    v62[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v5, "parentEntry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString isEqualToString:](v9, "isEqualToString:", v12))
        v13 = &stru_1E4A69238;
      else
        v13 = v9;
      v14 = v5;
      v15 = v13;

    }
    else
    {
      v14 = v5;
      v15 = &stru_1E4A69238;
    }
    objc_msgSend(v14, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (const __CFString *)v16;
    else
      v18 = &stru_1E4A69238;
    v61[0] = v18;
    objc_msgSend(v14, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (const __CFString *)v19;
    else
      v21 = &stru_1E4A69238;
    v61[1] = v21;
    v61[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v14;
    v7 = 0;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v22 = v10;
  v50 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v50)
  {
    v45 = v7;
    v48 = v22;
    v49 = *(_QWORD *)v56;
    v47 = v5;
    while (2)
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v56 != v49)
          objc_enumerationMutation(v22);
        v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v24, "length", v45))
        {
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v5, "ancestorEntries");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "arrayByAddingObject:", v5);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v52;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v52 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                objc_msgSend(v31, "plistName");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v24, "isEqualToString:", v32) & 1) != 0)
                {
                  objc_msgSend(v31, "bundleName");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = -[__CFString isEqualToString:](v9, "isEqualToString:", v33);

                  if ((v34 & 1) != 0)
                  {

                    v5 = v47;
                    v22 = v48;
                    goto LABEL_35;
                  }
                }
                else
                {

                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
            }
            while (v28);
          }

          objc_msgSend(v46, "pathForResource:ofType:", v24, CFSTR("plist"));
          v35 = objc_claimAutoreleasedReturnValue();
          v5 = v47;
          v22 = v48;
          if (v35)
          {
            v37 = (void *)v35;
            v38 = v24;

            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("searchable"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v40;
            if (v40 && !objc_msgSend(v40, "BOOLValue"))
            {
              v36 = 0;
              v7 = v45;
            }
            else
            {
              objc_msgSend(v47, "specifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              SearchSpecifiersFromPlist(v39, v42, v38, v46);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              v7 = v45;
              if (v43)
              {
                SearchEntriesFromSpecifiers(v43, v47, v38);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v36 = 0;
              }

            }
            v22 = v48;
            goto LABEL_47;
          }
        }
LABEL_35:
        ;
      }
      v50 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v50)
        continue;
      break;
    }
    v37 = 0;
    v38 = 0;
    v36 = 0;
    v39 = v22;
    v7 = v45;
  }
  else
  {
    v37 = 0;
    v38 = 0;
    v36 = 0;
    v39 = v22;
  }
LABEL_47:

  return v36;
}

+ (id)possibleBundleRoots
{
  return (id)_possibleBundleRoots;
}

+ (id)topLevelManifestBundlePath
{
  return (id)_topLevelManifestBundlePath;
}

- (PSSearchEntry)searchEntry
{
  return self->_searchEntry;
}

- (PSSearchIndexOperationDelegate)delegate
{
  return (PSSearchIndexOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchEntry, 0);
}

@end

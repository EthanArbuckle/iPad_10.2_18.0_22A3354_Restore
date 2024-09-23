@implementation PSSearchEntry

+ (void)setSchemeNameOverride:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)_schemeNameOverride != a3)
  {
    v3 = objc_msgSend(a3, "copy");
    v4 = (void *)_schemeNameOverride;
    _schemeNameOverride = v3;

  }
}

+ (id)schemeNameOverride
{
  if (_schemeNameOverride)
    return (id)_schemeNameOverride;
  else
    return CFSTR("prefs");
}

- (PSSearchEntry)initWithSpecifier:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  PSSearchEntry *v9;
  PSSearchEntry *v10;
  uint64_t v11;
  NSMutableSet *childEntries;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *bundleName;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *keywords;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *identifier;
  uint64_t v26;
  NSString *sectionIdentifier;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSURL *url;
  uint64_t v33;
  NSArray *additionalDetailTextComponents;
  objc_super v36;

  v7 = a3;
  v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PSSearchEntry;
  v9 = -[PSSearchEntry init](&v36, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_specifier, a3);
    objc_storeWeak((id *)&v10->_parentEntry, v8);
    v11 = objc_opt_new();
    childEntries = v10->_childEntries;
    v10->_childEntries = (NSMutableSet *)v11;

    objc_msgSend(v7, "propertyForKey:", CFSTR("bundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v8, "bundleName");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    bundleName = v10->_bundleName;
    v10->_bundleName = v15;

    objc_msgSend(v7, "propertyForKey:", CFSTR("keywords"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");
    v19 = v18;
    if (v18)
      v20 = v18;
    else
      v20 = (NSMutableArray *)objc_opt_new();
    keywords = v10->_keywords;
    v10->_keywords = v20;

    objc_msgSend(v7, "name");
    v22 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v22;

    objc_msgSend(v7, "identifier");
    v24 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v24;

    objc_msgSend(v7, "propertyForKey:", CFSTR("searchSectionID"));
    v26 = objc_claimAutoreleasedReturnValue();
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = (NSString *)v26;

    -[PSSpecifier propertyForKey:](v10->_specifier, "propertyForKey:", CFSTR("isSection"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isSection = objc_msgSend(v28, "BOOLValue");

    v29 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "propertyForKey:", CFSTR("searchURL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "URLWithString:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    url = v10->_url;
    v10->_url = (NSURL *)v31;

    if (v10->_url)
      v10->_isRootURL = 1;
    -[PSSpecifier propertyForKey:](v10->_specifier, "propertyForKey:", CFSTR("searchDetailPath"));
    v33 = objc_claimAutoreleasedReturnValue();
    additionalDetailTextComponents = v10->_additionalDetailTextComponents;
    v10->_additionalDetailTextComponents = (NSArray *)v33;

    v10->_hasDetailController = -[PSSearchEntry _specifier:hasDetailController:](v10, "_specifier:hasDetailController:", v7, 0);
    v10->_hasListController = -[PSSearchEntry _specifier:hasDetailController:](v10, "_specifier:hasDetailController:", v7, 1);
  }

  return v10;
}

- (BOOL)hasFinishedIndexing
{
  return self->_specifier == 0;
}

- (BOOL)finishIndexing
{
  BOOL v3;
  PSSpecifier *specifier;
  PSSpecifier *groupSpecifier;

  v3 = -[PSSearchEntry hasFinishedIndexing](self, "hasFinishedIndexing");
  if (!v3)
  {
    specifier = self->_specifier;
    self->_specifier = 0;

    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = 0;

  }
  return !v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isRootEntry
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntry);
  v3 = WeakRetained == 0;

  return v3;
}

- (BOOL)isSectionEntry
{
  return -[PSSearchEntry isRootEntry](self, "isRootEntry") || self->_isSection;
}

- (BOOL)_specifier:(id)a3 hasDetailController:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v6, "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AppBundleID"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = -[PSSearchEntry isSectionEntry](self, "isSectionEntry");

        if (!v11)
        {
          LOBYTE(v7) = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("enabled"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "BOOLValue"))
        goto LABEL_11;
      if (v4)
      {
        v14 = (void *)objc_msgSend(v6, "detailControllerClass");
        if (v14 == (void *)objc_opt_class() || (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
LABEL_11:
          LOBYTE(v7) = 0;
LABEL_24:

          goto LABEL_25;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pane"));
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          v7 = objc_msgSend((id)objc_msgSend(v6, "editPaneClass"), "isSubclassOfClass:", objc_opt_class());

          if (!v7)
            goto LABEL_24;
        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cell"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        v18 = +[PSTableCell cellTypeFromString:](PSTableCell, "cellTypeFromString:", v17);
      else
        v18 = objc_msgSend(v6, "cellType");
      if ((unint64_t)(v18 - 1) > 1)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("detail"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v7) = 1;
        if (!v19 && !v4)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pane"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v7) = v20 == 0;

        }
      }

      goto LABEL_24;
    }
  }
  LOBYTE(v7) = 0;
LABEL_26:

  return v7;
}

- (BOOL)hasDetailController
{
  return self->_hasDetailController;
}

- (BOOL)hasListController
{
  return self->_hasListController;
}

- (void)setAction:(id)a3
{
  PSSpecifierAction *v5;
  PSSpecifierAction **p_action;
  PSSpecifierAction *action;
  PSSpecifierAction *v8;

  v5 = (PSSpecifierAction *)a3;
  action = self->_action;
  p_action = &self->_action;
  if (action != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_action, a3);
    v5 = v8;
  }

}

- (id)sectionEntry
{
  PSSearchEntry *v2;
  uint64_t v3;

  v2 = self;
  if (v2)
  {
    do
    {
      if (-[PSSearchEntry isSectionEntry](v2, "isSectionEntry"))
        break;
      -[PSSearchEntry parentEntry](v2, "parentEntry");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (PSSearchEntry *)v3;
    }
    while (v3);
  }
  return v2;
}

- (id)rootEntry
{
  PSSearchEntry *v2;
  void *v3;
  PSSearchEntry *v4;
  void *v5;

  v2 = self;
  -[PSSearchEntry parentEntry](v2, "parentEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[PSSearchEntry parentEntry](v2, "parentEntry");
      v4 = (PSSearchEntry *)objc_claimAutoreleasedReturnValue();

      -[PSSearchEntry parentEntry](v4, "parentEntry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (id)ancestorEntries
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntry);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    do
    {
      objc_msgSend(v3, "insertObject:atIndex:", v5, 0);
      objc_msgSend(v5, "parentEntry");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  return v3;
}

- (NSURL)url
{
  NSURL *url;
  NSURL *v4;
  NSURL *v5;

  url = self->_url;
  if (!url)
  {
    -[PSSearchEntry _prefsURLIsRoot:](self, "_prefsURLIsRoot:", &self->_isRootURL);
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v5 = self->_url;
    self->_url = v4;

    url = self->_url;
  }
  return url;
}

- (BOOL)isRootUrl
{
  NSURL *v3;
  NSURL *url;

  if (!self->_url)
  {
    -[PSSearchEntry _prefsURLIsRoot:](self, "_prefsURLIsRoot:", &self->_isRootURL);
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v3;

  }
  return self->_isRootURL;
}

- (id)_prefsURLIsRoot:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  uint64_t v26;

  -[PSSearchEntry hasFinishedIndexing](self, "hasFinishedIndexing");
  -[PSSearchEntry ancestorEntries](self, "ancestorEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSearchEntry schemeNameOverride](PSSearchEntry, "schemeNameOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasDetailController"))
  {
    v9 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:root=%@"), v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v6, "count");
    v15 = v14 - 1;
    if (v14 != 1)
    {
      objc_msgSend(v6, "subarrayWithRange:", 1, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __33__PSSearchEntry__prefsURLIsRoot___block_invoke;
      v24[3] = &unk_1E4A68C88;
      v26 = v15;
      v25 = v13;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v24);

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      *a3 = 1;
    v18 = (void *)MEMORY[0x1E0C99E98];
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@:root=ROOT#%@"), v8, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

void __33__PSSearchEntry__prefsURLIsRoot___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  const __CFString *v10;
  id v11;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "hasDetailController");
  if (a3 || (*(_QWORD *)(a1 + 40) > 1uLL ? (v9 = 1) : (v9 = v8), (v9 & 1) == 0))
  {
    if (*(_QWORD *)(a1 + 40) - (unint64_t)(v8 ^ 1u) <= a3)
      v10 = CFSTR("#%@");
    else
      v10 = CFSTR("/%@");
  }
  else
  {
    v10 = CFSTR("&path=%@");
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", v10, v11);

}

- (id)detailTextWithEffectiveTitle:(id *)a3
{
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v5 = PSLocaleLanguageDirection();
  v6 = CFSTR("→");
  if (v5 == 2)
    v6 = CFSTR("←");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@ "), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 == 2)
    objc_msgSend(v8, "addObject:", CFSTR("\u200F"));
  -[PSSearchEntry ancestorEntries](self, "ancestorEntries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__PSSearchEntry_detailTextWithEffectiveTitle___block_invoke;
  v20[3] = &unk_1E4A68CB0;
  v11 = v9;
  v21 = v11;
  objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 0, v20);

  objc_msgSend(v11, "addObjectsFromArray:", self->_additionalDetailTextComponents);
  -[PSSearchEntry groupName](self, "groupName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    PSSearchFormattedString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", v13, objc_msgSend(v11, "count"));

  }
  -[PSSearchEntry name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    if (a3)
    {
      -[PSSearchEntry name](self, "name");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (objc_msgSend(v11, "count"))
  {
    v16 = objc_msgSend(v11, "count");
    v17 = v16 - 1;
    if (v16 != 0x8000000000000000)
    {
      if (a3)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "removeObjectAtIndex:", v17);
    }
  }
  objc_msgSend(v11, "componentsJoinedByString:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __46__PSSearchEntry_detailTextWithEffectiveTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int AppBooleanValue;
  int v7;
  void *v8;
  void *v9;
  Boolean keyExistsAndHasValidFormat;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    goto LABEL_10;
  if (!objc_msgSend(v3, "isSectionEntry"))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "sf_isInternalInstall") & 1) == 0)
  {

LABEL_8:
LABEL_9:
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PSSearchFormattedString(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

LABEL_10:
    goto LABEL_11;
  }
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PSSearchShowSectionInDetailText"), CFSTR("com.apple.Preferences"), &keyExistsAndHasValidFormat);
  v7 = keyExistsAndHasValidFormat;

  if (!v7 || AppBooleanValue)
    goto LABEL_9;
LABEL_11:

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSSearchEntry;
  -[PSSearchEntry description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSearchEntry hierarchyDescription](self, "hierarchyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSSearchEntry identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("\nID: %@, bundle: %@, sectionEntry: %d, rootEntry: %d"), v6, self->_bundleName, -[PSSearchEntry isSectionEntry](self, "isSectionEntry"), -[PSSearchEntry isRootEntry](self, "isRootEntry"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)recursiveDescription
{
  return -[PSSearchEntry recursiveDescriptionForLevel:](self, "recursiveDescriptionForLevel:", 0);
}

- (id)recursiveDescriptionForLevel:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("    "));
      --v6;
    }
    while (v6);
  }
  v7 = (void *)MEMORY[0x1E0CB37A0];
  -[PSSearchEntry name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PSSearchEntry childEntries](self, "childEntries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    v14 = a3 + 1;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "recursiveDescriptionForLevel:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendFormat:", CFSTR("\n%@"), v16);

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[PSSearchEntry description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier debugDescription](self->_specifier, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\nspecifier: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hierarchyDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSearchEntry ancestorEntries](self, "ancestorEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__PSSearchEntry_hierarchyDescription__block_invoke;
  v9[3] = &unk_1E4A68CB0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __37__PSSearchEntry_hierarchyDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  const __CFString *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  if (a3)
    v4 = CFSTR(" > ");
  else
    v4 = &stru_1E4A69238;
  objc_msgSend(a2, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v4, v5);

}

- (PSSearchEntry)parentEntry
{
  return (PSSearchEntry *)objc_loadWeakRetained((id *)&self->_parentEntry);
}

- (void)setParentEntry:(id)a3
{
  objc_storeWeak((id *)&self->_parentEntry, a3);
}

- (NSMutableSet)childEntries
{
  return self->_childEntries;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (BOOL)isRootURL
{
  return self->_isRootURL;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)plistName
{
  return self->_plistName;
}

- (void)setPlistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)manifestBundleName
{
  return self->_manifestBundleName;
}

- (void)setManifestBundleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSMutableArray)keywords
{
  return self->_keywords;
}

- (PSSpecifierAction)action
{
  return self->_action;
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_manifestBundleName, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_plistName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_childEntries, 0);
  objc_destroyWeak((id *)&self->_parentEntry);
  objc_storeStrong((id *)&self->_additionalDetailTextComponents, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end

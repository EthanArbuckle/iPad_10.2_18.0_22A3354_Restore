@implementation CACSpokenCommandPresentation

- (CACSpokenCommandPresentation)init
{
  CACSpokenCommandPresentation *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACSpokenCommandPresentation;
  v2 = -[CACSpokenCommandPresentation init](&v6, sel_init);
  if (v2)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bestLocaleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommandPresentation setLocale:](v2, "setLocale:", v4);

  }
  return v2;
}

- (void)_flushCommands
{
  NSArray *allCommandGroups;
  NSArray *commandItems;

  allCommandGroups = self->_allCommandGroups;
  self->_allCommandGroups = 0;

  commandItems = self->_commandItems;
  self->_commandItems = 0;

  -[CACSpokenCommandPresentation resetConflicts](self, "resetConflicts");
}

- (void)_deepFlush
{
  NSArray *commandGroups;
  NSMutableArray *newCommandItems;
  NSMutableArray *deletedCommandIdentifiers;

  -[CACSpokenCommandPresentation _flushCommands](self, "_flushCommands");
  commandGroups = self->_commandGroups;
  self->_commandGroups = 0;

  newCommandItems = self->_newCommandItems;
  self->_newCommandItems = 0;

  deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
  self->_deletedCommandIdentifiers = 0;

}

- (void)setLocale:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *excludedSearchWordSet;
  id v13;

  v13 = a3;
  if (!-[NSString isEqualToString:](self->_locale, "isEqualToString:"))
  {
    -[CACSpokenCommandPresentation resetConflicts](self, "resetConflicts");
    objc_storeStrong((id *)&self->_locale, a3);
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "builtInCommandsStringsTableForLocaleIdentifier:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CommandManager.searchWordsToExclude"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    excludedSearchWordSet = self->_excludedSearchWordSet;
    self->_excludedSearchWordSet = v11;

    -[CACSpokenCommandPresentation _deepFlush](self, "_deepFlush");
  }

}

- (BOOL)hasConflicts
{
  NSDictionary *conflictDictionary;
  void *v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *v20;

  conflictDictionary = self->_conflictDictionary;
  if (!conflictDictionary)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CACSpokenCommandPresentation flattenedCommandGroupsAndItems](self, "flattenedCommandGroupsAndItems");
    v6 = -[NSArray count](self->_commandsOnly, "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      do
      {
        -[NSArray objectAtIndex:](self->_commandsOnly, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isGroup");
        if (++v8 < v7 && (v10 & 1) == 0)
        {
          v11 = v8;
          do
          {
            -[NSArray objectAtIndex:](self->_commandsOnly, "objectAtIndex:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "isGroup") & 1) == 0 && objc_msgSend(v9, "conflictsWithItem:", v12))
            {
              objc_msgSend(v9, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKey:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v14)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "identifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKey:", v14, v15);

              }
              objc_msgSend(v14, "addObject:", v12);
              objc_msgSend(v12, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKey:", v17, v18);

              }
              objc_msgSend(v17, "addObject:", v9);

            }
            ++v11;
          }
          while (v7 != v11);
        }

      }
      while (v8 != v7);
    }
    v19 = (NSDictionary *)objc_msgSend(v4, "copy");
    v20 = self->_conflictDictionary;
    self->_conflictDictionary = v19;

    conflictDictionary = self->_conflictDictionary;
  }
  return -[NSDictionary count](conflictDictionary, "count") != 0;
}

- (id)itemsConflictingWithItem:(id)a3
{
  id v4;
  NSDictionary *conflictDictionary;
  void *v6;
  void *v7;

  v4 = a3;
  -[CACSpokenCommandPresentation hasConflicts](self, "hasConflicts");
  conflictDictionary = self->_conflictDictionary;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKey:](conflictDictionary, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)resetConflicts
{
  NSDictionary *conflictDictionary;

  conflictDictionary = self->_conflictDictionary;
  self->_conflictDictionary = 0;

}

- (void)saveChanges
{
  void *v3;
  NSMutableArray *deletedCommandIdentifiers;
  id v5;
  _QWORD v6[4];
  id v7;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginPropertyTransaction");
  -[NSMutableArray makeObjectsPerformSelector:](self->_newCommandItems, "makeObjectsPerformSelector:", sel_saveToPreferences);
  -[NSArray makeObjectsPerformSelector:](self->_commandGroups, "makeObjectsPerformSelector:", sel_saveToPreferences);
  deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__CACSpokenCommandPresentation_saveChanges__block_invoke;
  v6[3] = &unk_24F2AD200;
  v7 = v3;
  v5 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](deletedCommandIdentifiers, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(v5, "endPropertyTransaction");

}

uint64_t __43__CACSpokenCommandPresentation_saveChanges__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePropertiesForCommandIdentifier:", a2);
}

- (void)refreshItemWithIdentifier:(id)a3
{
  unint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  CACSpokenCommandItem *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = -[CACSpokenCommandPresentation indexOfItemWithIdentifier:](self, "indexOfItemWithIdentifier:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v4;
    -[CACSpokenCommandPresentation flattenedCommandGroupsAndItems](self, "flattenedCommandGroupsAndItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "refreshDataFromPreferences");
    if (objc_msgSend(v8, "isCustom"))
      -[CACSpokenCommandPresentation sortCustomCommands](self, "sortCustomCommands");
    goto LABEL_7;
  }
  v5 = objc_msgSend(v13, "hasPrefix:", CFSTR("Custom"));
  v6 = v13;
  if (v5)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertiesForCommandIdentifier:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[CACSpokenCommandItem initWithIdentifier:properties:locale:]([CACSpokenCommandItem alloc], "initWithIdentifier:properties:locale:", v13, v8, self->_locale);
      -[NSDictionary objectForKey:](self->_additionalCommandInfo, "objectForKey:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACSpokenCommandItem setCommandInfo:](v9, "setCommandInfo:", v10);

      -[CACSpokenCommandPresentation addCustomCommandItem:](self, "addCustomCommandItem:", v9);
    }
LABEL_7:

    v6 = v13;
  }

}

- (void)sortCustomCommands
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSArray *commandItems;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_allCommandGroups;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isCustom", (_QWORD)v11))
        {
          objc_msgSend(v8, "commandsArray");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_40);

          commandItems = self->_commandItems;
          self->_commandItems = 0;

          goto LABEL_11;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __50__CACSpokenCommandPresentation_sortCustomCommands__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "sortString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (void)setExternalCommandGroups:(id)a3
{
  NSArray *v4;
  NSArray *externalCommandGroups;

  v4 = (NSArray *)a3;
  -[CACSpokenCommandPresentation _flushCommands](self, "_flushCommands");
  externalCommandGroups = self->_externalCommandGroups;
  self->_externalCommandGroups = v4;

}

- (void)setRelevantCommandIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *relevantCommandIdentifiers;

  v4 = (NSArray *)a3;
  -[CACSpokenCommandPresentation _flushCommands](self, "_flushCommands");
  relevantCommandIdentifiers = self->_relevantCommandIdentifiers;
  self->_relevantCommandIdentifiers = v4;

}

- (void)setAdditionalCommandInfo:(id)a3
{
  NSDictionary *v4;
  NSDictionary *additionalCommandInfo;

  v4 = (NSDictionary *)a3;
  -[CACSpokenCommandPresentation _flushCommands](self, "_flushCommands");
  additionalCommandInfo = self->_additionalCommandInfo;
  self->_additionalCommandInfo = v4;

}

- (NSArray)nestedCommandGroupsAndItems
{
  id *p_allCommandGroups;
  NSArray *externalCommandGroups;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CACSpokenCommandGroup *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  CACSpokenCommandItem *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *commandGroups;
  id v26;
  void *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  CACSpokenCommandGroup *v31;
  uint64_t v32;
  uint64_t j;
  CACSpokenCommandGroup *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  NSArray *relevantCommandIdentifiers;
  void *v52;
  void *v53;
  NSArray *v54;
  id *location;
  id *locationa;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id obj;
  id obja;
  CACSpokenCommandGroup *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  __int128 v71;
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
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  p_allCommandGroups = (id *)&self->_allCommandGroups;
  if (self->_allCommandGroups)
  {
    v70 = 0;
  }
  else
  {
    externalCommandGroups = self->_externalCommandGroups;
    if (externalCommandGroups)
      v5 = (id)-[NSArray mutableCopy](externalCommandGroups, "mutableCopy");
    else
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v70 = v5;
  }
  if (!self->_commandGroups)
  {
    location = p_allCommandGroups;
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginPropertyTransaction");
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(v6, "availableCommandSetIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v88;
      v58 = *(_QWORD *)v88;
      v59 = v6;
      do
      {
        v10 = 0;
        v62 = (id)v8;
        do
        {
          if (*(_QWORD *)v88 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v10);
          if (!self->_usedByPreferences
            || (objc_msgSend(v6, "hidePreferencesForCommandSetIdentifier:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v10)) & 1) == 0)
          {
            objc_msgSend(v6, "commandIdentifiersForCommandSetIdentifier:localeIdentifier:", v11, self->_locale);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count"))
            {
              v13 = -[CACSpokenCommandGroup initWithIdentifier:]([CACSpokenCommandGroup alloc], "initWithIdentifier:", v11);
              -[CACSpokenCommandGroup commandsArray](v13, "commandsArray");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v13;
              if (-[CACSpokenCommandGroup isCustom](v13, "isCustom"))
                objc_msgSend(v60, "insertObject:atIndex:", v13, 0);
              else
                objc_msgSend(v60, "addObject:", v13);
              v85 = 0u;
              v86 = 0u;
              v83 = 0u;
              v84 = 0u;
              v68 = v12;
              v15 = v12;
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v84;
                do
                {
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v84 != v18)
                      objc_enumerationMutation(v15);
                    v20 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
                    v21 = -[CACSpokenCommandItem initWithIdentifier:properties:locale:]([CACSpokenCommandItem alloc], "initWithIdentifier:properties:locale:", v20, 0, self->_locale);
                    if (-[CACSpokenCommandItem isVisible](v21, "isVisible"))
                    {
                      -[NSDictionary objectForKey:](self->_additionalCommandInfo, "objectForKey:", v20);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      -[CACSpokenCommandItem setCommandInfo:](v21, "setCommandInfo:", v22);

                      objc_msgSend(v14, "addObject:", v21);
                    }

                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
                }
                while (v17);
              }

              if (-[CACSpokenCommandGroup isCustom](v66, "isCustom"))
              {
                -[CACSpokenCommandGroup commandsArray](v66, "commandsArray");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "sortUsingComparator:", &__block_literal_global_13_1);

              }
              v9 = v58;
              v6 = v59;
              v8 = (uint64_t)v62;
              v12 = v68;
            }

          }
          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      }
      while (v8);
    }

    objc_msgSend(v6, "endPropertyTransaction");
    v24 = (NSArray *)objc_msgSend(v60, "copy");
    commandGroups = self->_commandGroups;
    self->_commandGroups = v24;

    p_allCommandGroups = location;
  }
  v26 = *p_allCommandGroups;
  if (!*p_allCommandGroups)
  {
    locationa = p_allCommandGroups;
    if (!-[NSMutableArray count](self->_newCommandItems, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_commandGroups);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v28 = self->_commandGroups;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v80 != v32)
            objc_enumerationMutation(v28);
          v34 = (CACSpokenCommandGroup *)*(id *)(*((_QWORD *)&v79 + 1) + 8 * j);
          if (-[CACSpokenCommandGroup isCustom](v34, "isCustom"))
          {
            -[CACSpokenCommandGroup cloneWithoutCommands](v34, "cloneWithoutCommands");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v35, "commandsArray");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[CACSpokenCommandGroup commandsArray](v34, "commandsArray");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObjectsFromArray:", v37);

            objc_msgSend(v35, "commandsArray");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObjectsFromArray:", self->_newCommandItems);

            v31 = v35;
            -[CACSpokenCommandGroup commandsArray](v31, "commandsArray");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "sortUsingComparator:", &__block_literal_global_14_0);

            v34 = v31;
          }
          objc_msgSend(v27, "addObject:", v34);

        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
      }
      while (v30);

      if (v31)
        goto LABEL_51;
    }
    else
    {

    }
    v31 = -[CACSpokenCommandGroup initWithIdentifier:]([CACSpokenCommandGroup alloc], "initWithIdentifier:", CFSTR("Custom"));
    objc_msgSend(v27, "insertObject:atIndex:", v31, 0);
    -[CACSpokenCommandGroup commandsArray](v31, "commandsArray");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObjectsFromArray:", self->_newCommandItems);

LABEL_51:
    p_allCommandGroups = locationa;
LABEL_52:
    if (self->_relevantCommandIdentifiers || self->_deletedCommandIdentifiers)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v61 = v27;
      v63 = v27;
      v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
      if (v67)
      {
        obja = *(id *)v76;
        do
        {
          v41 = 0;
          do
          {
            if (*(id *)v76 != obja)
              objc_enumerationMutation(v63);
            v69 = v41;
            v42 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v41);
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            objc_msgSend(v42, "commandsArray");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
            if (v44)
            {
              v45 = v44;
              v46 = 0;
              v47 = *(_QWORD *)v72;
              do
              {
                for (k = 0; k != v45; ++k)
                {
                  if (*(_QWORD *)v72 != v47)
                    objc_enumerationMutation(v43);
                  v49 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
                  objc_msgSend(v49, "identifier");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  relevantCommandIdentifiers = self->_relevantCommandIdentifiers;
                  if ((!relevantCommandIdentifiers
                     || -[NSArray containsObject:](relevantCommandIdentifiers, "containsObject:", v50))
                    && (-[NSMutableArray containsObject:](self->_deletedCommandIdentifiers, "containsObject:", v50) & 1) == 0)
                  {
                    if (!v46)
                    {
                      objc_msgSend(v42, "cloneWithoutCommands");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v70, "addObject:", v46);
                    }
                    objc_msgSend(v46, "commandsArray");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "addObject:", v49);

                    -[NSDictionary objectForKey:](self->_additionalCommandInfo, "objectForKey:", v50);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "setCommandInfo:", v53);

                  }
                }
                v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
              }
              while (v45);
            }
            else
            {
              v46 = 0;
            }

            v41 = v69 + 1;
          }
          while (v69 + 1 != v67);
          v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
        }
        while (v67);
      }

      p_allCommandGroups = locationa;
      v27 = v61;
    }
    else
    {
      objc_msgSend(v70, "addObjectsFromArray:", v27);
    }
    objc_storeStrong(p_allCommandGroups, v70);

    v26 = *p_allCommandGroups;
  }
  v54 = (NSArray *)v26;

  return v54;
}

uint64_t __59__CACSpokenCommandPresentation_nestedCommandGroupsAndItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "sortString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

uint64_t __59__CACSpokenCommandPresentation_nestedCommandGroupsAndItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "sortString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (void)setSearchString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *searchString;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  searchString = self->_searchString;
  self->_searchString = v7;

}

- (NSArray)flattenedCommandGroupsAndItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *commandsOnly;
  NSArray *v15;
  NSArray *commandItems;
  NSArray *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!self->_commandItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[CACSpokenCommandPresentation nestedCommandGroupsAndItems](self, "nestedCommandGroupsAndItems", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v4, "addObject:", v10);
          if (!-[CACSpokenCommandPresentation groupIsCollapsed:](self, "groupIsCollapsed:", v10))
          {
            objc_msgSend(v10, "commandsArray");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObjectsFromArray:", v11);

          }
          objc_msgSend(v10, "commandsArray");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    v13 = (NSArray *)objc_msgSend(v3, "copy");
    commandsOnly = self->_commandsOnly;
    self->_commandsOnly = v13;

    v15 = (NSArray *)objc_msgSend(v4, "copy");
    commandItems = self->_commandItems;
    self->_commandItems = v15;

  }
  if (-[NSString length](self->_searchString, "length"))
  {
    -[CACSpokenCommandPresentation _filteredCommandGroupsAndItemsWithSearchString:](self, "_filteredCommandGroupsAndItemsWithSearchString:", self->_searchString);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = self->_commandItems;
  }
  return v17;
}

- (id)_filteredCommandGroupsAndItemsWithSearchString:(id)a3
{
  __CFString *v4;
  __CFStringTokenizer *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  CACSpokenCommandGroup *v26;
  void *v27;
  id v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  __CFString *v48;
  id v49;
  unint64_t v50;
  NSArray *obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  CACSpokenCommandGroup *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;
  CFRange v80;
  CFRange CurrentTokenRange;

  v79 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  objc_msgSend(v49, "lowercaseString");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v80.length = -[__CFString length](v4, "length");
  v80.location = 0;
  v5 = CFStringTokenizerCreate(0, v4, v80, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  while (CFStringTokenizerAdvanceToNextToken(v5))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v5);
    v6 = (__CFString *)CFStringCreateWithSubstring(0, v4, CurrentTokenRange);
    if (!-[NSSet containsObject:](self->_excludedSearchWordSet, "containsObject:", v6))
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF BEGINSWITH[cd] %@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addObject:", v7);
      if (CFStringGetLength(v6) > 1
        || CFStringGetLength(v6) == 1
        && -[__CFString characterAtIndex:](v6, "characterAtIndex:", 0) >= 0x81)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("*%@*"), v6);
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF LIKE[cd] %@"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = (void *)v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("FALSEPREDICATE"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v62, "addObject:", v9);
    }
    CFRelease(v6);
  }
  CFRelease(v5);
  v10 = objc_msgSend(v63, "count");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = self->_allCommandGroups;
  v53 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  v48 = v4;
  if (!v53)
  {
    v50 = 0;
    goto LABEL_49;
  }
  v50 = 0;
  v52 = *(_QWORD *)v73;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v73 != v52)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v11);
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v59 = v12;
      objc_msgSend(v12, "commandsArray");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      if (!v57)
      {
        v61 = 0;
        v14 = 0;
        goto LABEL_42;
      }
      v14 = 0;
      v61 = 0;
      v54 = v11;
      v55 = *(_QWORD *)v69;
      v56 = v13;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v69 != v55)
            objc_enumerationMutation(v13);
          v60 = v15;
          v16 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v15);
          objc_msgSend(v16, "setSearchScore:", 0);
          if (v10)
          {
            v17 = 0;
            v18 = 1;
            v19 = v10;
            do
            {
              objc_msgSend(v63, "objectAtIndex:", v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "evaluateCommandPredicate:", v20))
              {
                v21 = v10 + objc_msgSend(v16, "searchScore") + v18;
              }
              else
              {
                objc_msgSend(v62, "objectAtIndex:", v17);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v16, "evaluateCommandPredicate:", v22);

                if (!v23)
                  goto LABEL_31;
                v21 = objc_msgSend(v16, "searchScore") + v19;
              }
              objc_msgSend(v16, "setSearchScore:", v21);
              v24 = v16;
              if (v16)
              {
                v25 = v24;
                if ((objc_msgSend(v14, "containsObject:", v24) & 1) == 0)
                {
                  if (!v61)
                  {
                    v26 = objc_alloc_init(CACSpokenCommandGroup);
                    objc_msgSend(v59, "displayString");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[CACSpokenCommandGroup setDisplayString:](v26, "setDisplayString:", v27);

                    v61 = v26;
                    objc_msgSend(v58, "addObject:", v26);
                    v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

                    v14 = v28;
                  }
                  objc_msgSend(v14, "addObject:", v25);
                }
                goto LABEL_32;
              }
LABEL_31:
              v25 = 0;
LABEL_32:
              --v19;

              ++v17;
              --v18;
            }
            while (v10 != v17);
          }
          v15 = v60 + 1;
          v13 = v56;
        }
        while (v60 + 1 != v57);
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v57);

      if (v61)
      {
        v11 = v54;
        if (v14)
        {
          objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
          {
            objc_msgSend(v13, "objectAtIndex:", 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "searchScore");

            -[CACSpokenCommandGroup setSearchScore:](v61, "setSearchScore:", v30);
            objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("searchScore == %ld"), v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "filteredArrayUsingPredicate:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[CACSpokenCommandGroup commandsArray](v61, "commandsArray");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObjectsFromArray:", v32);

            v34 = v50;
            if (v30 > v50)
              v34 = v30;
            v50 = v34;

          }
LABEL_42:

        }
      }
      else
      {
        v11 = v54;
      }

      ++v11;
    }
    while (v11 != v53);
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    v53 = v35;
  }
  while (v35);
LABEL_49:

  objc_msgSend(v58, "sortedArrayUsingComparator:", &__block_literal_global_29);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (objc_msgSend(v36, "count"))
  {
    v37 = v36;
    if (v50)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("searchScore >= %ld"), v50 - 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "filteredArrayUsingPredicate:", v38);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v40 = v37;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v65 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v39, "addObject:", v45);
        objc_msgSend(v45, "commandsArray");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObjectsFromArray:", v46);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    }
    while (v42);
  }

  return v39;
}

uint64_t __79__CACSpokenCommandPresentation__filteredCommandGroupsAndItemsWithSearchString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "searchScore");
  if (v6 >= objc_msgSend(v5, "searchScore"))
  {
    v8 = objc_msgSend(v4, "searchScore");
    if (v8 <= objc_msgSend(v5, "searchScore"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __79__CACSpokenCommandPresentation__filteredCommandGroupsAndItemsWithSearchString___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "searchScore");
  if (v6 >= objc_msgSend(v5, "searchScore"))
  {
    v8 = objc_msgSend(v4, "searchScore");
    if (v8 <= objc_msgSend(v5, "searchScore"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (unint64_t)indexOfItemWithIdentifier:(id)a3
{
  return -[CACSpokenCommandPresentation indexOfItemWithIdentifier:ignoreGroups:](self, "indexOfItemWithIdentifier:ignoreGroups:", a3, 1);
}

- (unint64_t)indexOfItemWithIdentifier:(id)a3 ignoreGroups:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  unint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[CACSpokenCommandPresentation flattenedCommandGroupsAndItems](self, "flattenedCommandGroupsAndItems", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        v13 = v10 + v9;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
          if (!v4 || (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "isGroup") & 1) == 0)
          {
            objc_msgSend(v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v6);

            if ((v16 & 1) != 0)
            {
              v17 = v10 + v12;
              goto LABEL_14;
            }
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v10 = v13;
        if (v9)
          continue;
        break;
      }
    }
    v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  }
  else
  {
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v17;
}

- (void)addCustomCommandItem:(id)a3
{
  id v4;
  NSMutableArray *deletedCommandIdentifiers;
  void *v6;
  uint64_t v7;
  NSMutableArray *newCommandItems;
  NSMutableArray *v9;
  NSMutableArray *v10;
  id v11;

  v4 = a3;
  deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
  v11 = v4;
  if (deletedCommandIdentifiers
    && (objc_msgSend(v4, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[NSMutableArray indexOfObject:](deletedCommandIdentifiers, "indexOfObject:", v6),
        v6,
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[NSMutableArray removeObjectAtIndex:](self->_deletedCommandIdentifiers, "removeObjectAtIndex:", v7);
  }
  else
  {
    newCommandItems = self->_newCommandItems;
    if (!newCommandItems)
    {
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v10 = self->_newCommandItems;
      self->_newCommandItems = v9;

      newCommandItems = self->_newCommandItems;
    }
    -[NSMutableArray addObject:](newCommandItems, "addObject:", v11);
  }
  objc_msgSend(v11, "setIsEdited:", 1);
  objc_msgSend(v11, "saveToPreferences");
  -[CACSpokenCommandPresentation _flushCommands](self, "_flushCommands");

}

- (void)deleteCustomCommandAtIndex:(unint64_t)a3
{
  id *v3;
  void *v6;
  void *v7;
  NSMutableArray *newCommandItems;
  uint64_t v9;
  NSMutableArray *deletedCommandIdentifiers;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;

  -[CACSpokenCommandPresentation flattenedCommandGroupsAndItems](self, "flattenedCommandGroupsAndItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromPreferences");
  newCommandItems = self->_newCommandItems;
  if (newCommandItems)
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __59__CACSpokenCommandPresentation_deleteCustomCommandAtIndex___block_invoke;
    v17 = &unk_24F2AD308;
    v3 = &v18;
    v18 = v7;
    v9 = -[NSMutableArray indexOfObjectPassingTest:](newCommandItems, "indexOfObjectPassingTest:", &v14);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_newCommandItems, "removeObjectAtIndex:", v9);
      -[CACSpokenCommandPresentation _flushCommands](self, "_flushCommands");
LABEL_9:

      goto LABEL_10;
    }
  }
  if ((-[NSMutableArray containsObject:](self->_deletedCommandIdentifiers, "containsObject:", v7, v13, v14, v15, v16, v17) & 1) == 0)
  {
    deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
    if (!deletedCommandIdentifiers)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v12 = self->_deletedCommandIdentifiers;
      self->_deletedCommandIdentifiers = v11;

      deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
    }
    -[NSMutableArray addObject:](deletedCommandIdentifiers, "addObject:", v7);
  }
  -[CACSpokenCommandPresentation _flushCommands](self, "_flushCommands");
  if (newCommandItems)
    goto LABEL_9;
LABEL_10:

}

uint64_t __59__CACSpokenCommandPresentation_deleteCustomCommandAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)groupIsCollapsed:(id)a3
{
  return 0;
}

- (BOOL)isSearching
{
  return -[NSString length](self->_searchString, "length") != 0;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSArray)externalCommandGroups
{
  return self->_externalCommandGroups;
}

- (NSArray)relevantCommandIdentifiers
{
  return self->_relevantCommandIdentifiers;
}

- (NSDictionary)additionalCommandInfo
{
  return self->_additionalCommandInfo;
}

- (NSString)locale
{
  return self->_locale;
}

- (BOOL)usedByPreferences
{
  return self->_usedByPreferences;
}

- (void)setUsedByPreferences:(BOOL)a3
{
  self->_usedByPreferences = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictDictionary, 0);
  objc_storeStrong((id *)&self->_excludedSearchWordSet, 0);
  objc_storeStrong((id *)&self->_additionalCommandInfo, 0);
  objc_storeStrong((id *)&self->_relevantCommandIdentifiers, 0);
  objc_storeStrong((id *)&self->_externalCommandGroups, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_allCommandGroups, 0);
  objc_storeStrong((id *)&self->_commandGroups, 0);
  objc_storeStrong((id *)&self->_deletedCommandIdentifiers, 0);
  objc_storeStrong((id *)&self->_newCommandItems, 0);
  objc_storeStrong((id *)&self->_commandsOnly, 0);
  objc_storeStrong((id *)&self->_commandItems, 0);
}

@end

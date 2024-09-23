@implementation WBSCyclerOperationContext

- (id)_availableSymbolImageNames
{
  return (id)objc_msgSend(MEMORY[0x1E0D89BC8], "availableSymbolImageNames");
}

- (void)setTitlePrefix:(id)a3
{
  NSString *v4;
  NSString *titlePrefix;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    titlePrefix = self->_titlePrefix;
    self->_titlePrefix = v4;
  }
  else
  {
    titlePrefix = self->_titlePrefix;
    self->_titlePrefix = 0;
  }

}

- (id)filterOutItemsWithoutTitlePrefixInList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __68__WBSCyclerOperationContext_filterOutItemsWithoutTitlePrefixInList___block_invoke;
  v24[3] = &unk_1E4B38880;
  v24[4] = self;
  objc_msgSend(v4, "allDescendantsPassingTest:", v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerOperationContext _buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:](self, "_buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "uniqueIdentifier", (_QWORD)v20);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          do
          {
            objc_msgSend(v9, "addObject:", v16);
            objc_msgSend(v6, "objectForKeyedSubscript:", v16);
            v17 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v17;
          }
          while (v17);
        }
        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v12);
  }

  v18 = -[WBSCyclerOperationContext _copyItem:filteringWithIdentifierWhitelist:](self, "_copyItem:filteringWithIdentifierWhitelist:", v4, v9);
  return v18;
}

uint64_t __68__WBSCyclerOperationContext_filterOutItemsWithoutTitlePrefixInList___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isItemPrefixed:", a2);
}

- (id)randomItemTitle
{
  void *v3;
  NSString *titlePrefix;
  uint64_t v5;

  +[WBSCyclerRandomnessUtilities randomStringWithMaximumLength:](WBSCyclerRandomnessUtilities, "randomStringWithMaximumLength:", *MEMORY[0x1E0D89F08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  titlePrefix = self->_titlePrefix;
  if (titlePrefix)
  {
    -[NSString stringByAppendingString:](titlePrefix, "stringByAppendingString:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)randomSymbolImageName
{
  void *v3;
  void *v4;
  void *v5;

  -[WBSCyclerOperationContext _availableSymbolImageNames](self, "_availableSymbolImageNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerOperationContext _availableSymbolImageNames](self, "_availableSymbolImageNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v4, "count") - 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)randomDescendantOfList:(id)a3 enforcingTitlePrefixValidity:(BOOL)a4 passingTest:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__WBSCyclerOperationContext_randomDescendantOfList_enforcingTitlePrefixValidity_passingTest___block_invoke;
  v12[3] = &unk_1E4B389A8;
  v14 = a4;
  v12[4] = self;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a3, "randomDescendantPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __93__WBSCyclerOperationContext_randomDescendantOfList_enforcingTitlePrefixValidity_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;

  v3 = a2;
  v5 = 0;
  if (!*(_BYTE *)(a1 + 48) || objc_msgSend(*(id *)(a1 + 32), "_isItemValid:", v3))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (!v4 || (*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3))
      v5 = 1;
  }

  return v5;
}

- (id)randomValidStrictDescendantOfList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__WBSCyclerOperationContext_randomValidStrictDescendantOfList___block_invoke;
  v8[3] = &unk_1E4B38880;
  v9 = v4;
  v5 = v4;
  -[WBSCyclerOperationContext randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:](self, "randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:", v5, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __63__WBSCyclerOperationContext_randomValidStrictDescendantOfList___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

- (id)randomValidStrictDescendantOfTopLevelItem
{
  void *v2;

  if (self->_topLevelItem)
  {
    -[WBSCyclerOperationContext randomValidStrictDescendantOfList:](self, "randomValidStrictDescendantOfList:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)randomValidStrictListDescendantOfList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__WBSCyclerOperationContext_randomValidStrictListDescendantOfList___block_invoke;
  v8[3] = &unk_1E4B38880;
  v9 = v4;
  v5 = v4;
  -[WBSCyclerOperationContext randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:](self, "randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:", v5, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __67__WBSCyclerOperationContext_randomValidStrictListDescendantOfList___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (*(void **)(a1 + 32) == a2)
  {
    isKindOfClass = 0;
  }
  else
  {
    v2 = a2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (id)randomValidStrictListDescendantOfTopLevelItem
{
  void *v2;

  if (self->_topLevelItem)
  {
    -[WBSCyclerOperationContext randomValidStrictListDescendantOfList:](self, "randomValidStrictListDescendantOfList:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_isItemPrefixed:(id)a3
{
  WBSCyclerOperationContext *v3;
  void *v4;

  if (!self->_titlePrefix)
    return 1;
  v3 = self;
  objc_msgSend(a3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "hasPrefix:", v3->_titlePrefix);

  return (char)v3;
}

- (BOOL)_isItemValid:(id)a3
{
  WBSCyclerItemListRepresentation *v4;
  WBSCyclerItemListRepresentation *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (WBSCyclerItemListRepresentation *)a3;
  if (self->_topLevelItem == v4)
    goto LABEL_13;
  if (!-[WBSCyclerOperationContext _isItemPrefixed:](self, "_isItemPrefixed:", v4))
  {
    v10 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    v10 = 1;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = -[WBSCyclerItemListRepresentation countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (!-[WBSCyclerOperationContext _isItemValid:](self, "_isItemValid:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12))
          {
            v10 = 0;
            goto LABEL_16;
          }
        }
        v7 = -[WBSCyclerItemListRepresentation countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_16:

  }
LABEL_17:

  return v10;
}

- (id)_buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(v6, "uniqueIdentifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[WBSCyclerOperationContext _buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:](self, "_buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addEntriesFromDictionary:", v14);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_copyItem:(id)a3 filteringWithIdentifierWhitelist:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  WBSCyclerItemListRepresentation *v10;
  void *v11;
  void *v12;
  WBSCyclerItemListRepresentation *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = [WBSCyclerItemListRepresentation alloc];
      objc_msgSend(v6, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WBSCyclerItemListRepresentation initWithTitle:uniqueIdentifier:](v10, "initWithTitle:uniqueIdentifier:", v11, v12);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = v6;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            v19 = -[WBSCyclerOperationContext _copyItem:filteringWithIdentifierWhitelist:](self, "_copyItem:filteringWithIdentifierWhitelist:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18), v7, (_QWORD)v21);
            if (v19)
              -[WBSCyclerItemListRepresentation addChild:](v13, "addChild:", v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v16);
      }

    }
    else
    {
      v13 = (WBSCyclerItemListRepresentation *)v6;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (WBSCyclerTestTarget)testTarget
{
  return self->_testTarget;
}

- (void)setTestTarget:(id)a3
{
  objc_storeStrong((id *)&self->_testTarget, a3);
}

- (WBSCyclerItemListRepresentation)topLevelItem
{
  return self->_topLevelItem;
}

- (void)setTopLevelItem:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelItem, a3);
}

- (WBSCyclerProfileRepresentation)tabGroupsParent
{
  return self->_tabGroupsParent;
}

- (void)setTabGroupsParent:(id)a3
{
  objc_storeStrong((id *)&self->_tabGroupsParent, a3);
}

- (NSString)titlePrefix
{
  return self->_titlePrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlePrefix, 0);
  objc_storeStrong((id *)&self->_tabGroupsParent, 0);
  objc_storeStrong((id *)&self->_topLevelItem, 0);
  objc_storeStrong((id *)&self->_testTarget, 0);
}

@end

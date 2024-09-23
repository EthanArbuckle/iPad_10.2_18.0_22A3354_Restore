@implementation STUIStatusBarDisplayItemPlacement

uint64_t __45__STUIStatusBarDisplayItemPlacement_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __45__STUIStatusBarDisplayItemPlacement_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "priority");
}

- (STUIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSDictionary)itemInfo
{
  return self->_itemInfo;
}

- (NSHashTable)anyRequiredPlacements
{
  return self->_anyRequiredPlacements;
}

- (NSSet)excludedRegionIdentifiers
{
  return self->_excludedRegionIdentifiers;
}

- (NSHashTable)excludedPlacements
{
  return self->_excludedPlacements;
}

- (NSHashTable)allRequiredPlacements
{
  return self->_allRequiredPlacements;
}

- (NSHashTable)includedPlacements
{
  return self->_includedPlacements;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  STUIStatusBarIdentifier *identifier;
  uint64_t v8;
  id v9;
  id v10;
  int64_t v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  identifier = self->_identifier;
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __45__STUIStatusBarDisplayItemPlacement_isEqual___block_invoke;
  v20[3] = &unk_1E8D63908;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendPointer:counterpart:", identifier, v20);
  v11 = -[STUIStatusBarDisplayItemPlacement priority](self, "priority");
  v15 = v8;
  v16 = 3221225472;
  v17 = __45__STUIStatusBarDisplayItemPlacement_isEqual___block_invoke_2;
  v18 = &unk_1E8D63930;
  v19 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v11, &v15);
  LOBYTE(v11) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return v11;
}

+ (STUIStatusBarDisplayItemPlacement)placementWithIdentifier:(id)a3 priority:(int64_t)a4
{
  id v6;
  _QWORD *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = (void *)v7[3];
  v7[3] = v6;

  v7[2] = a4;
  *((_BYTE *)v7 + 8) = 1;
  return (STUIStatusBarDisplayItemPlacement *)v7;
}

- (id)requiringAllPlacements:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSHashTable *v8;
  NSHashTable *allRequiredPlacements;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      if (!--v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (!v6)
          break;
      }
    }
  }
  if (!self->_allRequiredPlacements)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    allRequiredPlacements = self->_allRequiredPlacements;
    self->_allRequiredPlacements = v8;

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[NSHashTable addObject:](self->_allRequiredPlacements, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  return self;
}

+ (id)spacerPlacementWithSize:(CGSize)a3 priority:(int64_t)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  height = a3.height;
  width = a3.width;
  v14[1] = *MEMORY[0x1E0C80C00];
  +[STUIStatusBarSpacerItem randomDisplayIdentifier](STUIStatusBarSpacerItem, "randomDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "withItemInfo:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)withItemInfo:(id)a3
{
  objc_storeStrong((id *)&self->_itemInfo, a3);
  return self;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendPointer:", self->_identifier);
  v5 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarDisplayItemPlacement priority](self, "priority"));
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (id)requiringAnyPlacements:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSHashTable *v8;
  NSHashTable *anyRequiredPlacements;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      if (!--v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (!v6)
          break;
      }
    }
  }
  if (!self->_anyRequiredPlacements)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    anyRequiredPlacements = self->_anyRequiredPlacements;
    self->_anyRequiredPlacements = v8;

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[NSHashTable addObject:](self->_anyRequiredPlacements, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  return self;
}

- (id)excludingPlacements:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSHashTable *v8;
  NSHashTable *excludedPlacements;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      if (!--v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (!v6)
          break;
      }
    }
  }
  if (!self->_excludedPlacements)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    excludedPlacements = self->_excludedPlacements;
    self->_excludedPlacements = v8;

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[NSHashTable addObject:](self->_excludedPlacements, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  return self;
}

- (id)excludingAllPlacementsInRegions:(id)a3 exceptPlacements:(id)a4
{
  id v6;
  id v7;
  NSSet *excludedRegionIdentifiers;
  NSSet *v9;
  NSSet *v10;
  NSSet *v11;
  NSSet *v12;
  NSHashTable *v13;
  NSHashTable *includedPlacements;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  excludedRegionIdentifiers = self->_excludedRegionIdentifiers;
  if (excludedRegionIdentifiers)
  {
    -[NSSet setByAddingObjectsFromArray:](excludedRegionIdentifiers, "setByAddingObjectsFromArray:", v6);
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v10 = self->_excludedRegionIdentifiers;
    self->_excludedRegionIdentifiers = v9;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v12 = self->_excludedRegionIdentifiers;
    self->_excludedRegionIdentifiers = v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    includedPlacements = self->_includedPlacements;
    self->_includedPlacements = v13;

    -[NSHashTable addObject:](self->_includedPlacements, "addObject:", self);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[NSHashTable addObject:](self->_includedPlacements, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++), (_QWORD)v21);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

  return self;
}

- (id)excludingAllPlacementsInRegions:(id)a3
{
  return -[STUIStatusBarDisplayItemPlacement excludingAllPlacementsInRegions:exceptPlacements:](self, "excludingAllPlacementsInRegions:exceptPlacements:", a3, MEMORY[0x1E0C9AA60]);
}

- (id)disabledPlacement
{
  -[STUIStatusBarDisplayItemPlacement setEnabled:](self, "setEnabled:", 0);
  return self;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemInfo, 0);
  objc_storeStrong((id *)&self->_anyRequiredPlacements, 0);
  objc_storeStrong((id *)&self->_allRequiredPlacements, 0);
  objc_storeStrong((id *)&self->_includedPlacements, 0);
  objc_storeStrong((id *)&self->_excludedRegionIdentifiers, 0);
  objc_storeStrong((id *)&self->_excludedPlacements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)description
{
  return -[STUIStatusBarDisplayItemPlacement descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)debugDescription
{
  return -[STUIStatusBarDisplayItemPlacement debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarDisplayItemPlacement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItemPlacement descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItemPlacement _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarDisplayItemPlacement _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  STUIStatusBarDisplayItemPlacement *v14;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarDisplayItemPlacement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__STUIStatusBarDisplayItemPlacement__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E8D62C88;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v12);

  v10 = v9;
  return v10;
}

void __85__STUIStatusBarDisplayItemPlacement__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("identifier"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), CFSTR("enabled"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "priority"), CFSTR("priority"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "excludedPlacements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "appendInteger:withName:", objc_msgSend(v8, "count"), CFSTR("excludedPlacements"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allRequiredPlacements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendInteger:withName:", objc_msgSend(v11, "count"), CFSTR("allRequiredPlacements"));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "anyRequiredPlacements");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "appendInteger:withName:", objc_msgSend(v15, "count"), CFSTR("anyRequiredPlacements"));

}

@end

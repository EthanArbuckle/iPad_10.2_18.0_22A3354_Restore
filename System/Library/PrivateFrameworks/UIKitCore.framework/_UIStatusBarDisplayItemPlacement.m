@implementation _UIStatusBarDisplayItemPlacement

+ (_UIStatusBarDisplayItemPlacement)placementWithIdentifier:(id)a3 priority:(int64_t)a4
{
  id v7;
  _QWORD *v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarDisplayItemPlacement.m"), 21, CFSTR("identifier must not be nil"));

  }
  v9 = (void *)v8[3];
  v8[3] = v7;

  v8[2] = a4;
  *((_BYTE *)v8 + 8) = 1;
  return (_UIStatusBarDisplayItemPlacement *)v8;
}

- (id)disabledPlacement
{
  -[_UIStatusBarDisplayItemPlacement setEnabled:](self, "setEnabled:", 0);
  return self;
}

- (id)excludingPlacements:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSHashTable *v16;
  NSHashTable *excludedPlacements;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "priority");
        if (v11 >= -[_UIStatusBarDisplayItemPlacement priority](self, "priority"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemPlacement.m"), 39, CFSTR("Item placement %@ can't exclude item placement with higher priority %@"), self, v10);

        }
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarDisplayItemPlacement identifier](self, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemPlacement.m"), 40, CFSTR("Item placement %@ can't exclude item placement with same identifier %@"), self, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  if (!self->_excludedPlacements)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    excludedPlacements = self->_excludedPlacements;
    self->_excludedPlacements = v16;

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        -[NSHashTable addObject:](self->_excludedPlacements, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v20);
  }

  return self;
}

- (id)excludingAllPlacementsInRegions:(id)a3
{
  return -[_UIStatusBarDisplayItemPlacement excludingAllPlacementsInRegions:exceptPlacements:](self, "excludingAllPlacementsInRegions:exceptPlacements:", a3, MEMORY[0x1E0C9AA60]);
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

- (id)requiringAllPlacements:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSHashTable *v16;
  NSHashTable *allRequiredPlacements;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "priority");
        if (v11 <= -[_UIStatusBarDisplayItemPlacement priority](self, "priority"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemPlacement.m"), 80, CFSTR("Item placement %@ can't require item placement with lower priority %@"), self, v10);

        }
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarDisplayItemPlacement identifier](self, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemPlacement.m"), 81, CFSTR("Item placement %@ can't require item placement with same identifier %@"), self, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  if (!self->_allRequiredPlacements)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    allRequiredPlacements = self->_allRequiredPlacements;
    self->_allRequiredPlacements = v16;

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        -[NSHashTable addObject:](self->_allRequiredPlacements, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v20);
  }

  return self;
}

- (id)requiringAnyPlacements:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSHashTable *v16;
  NSHashTable *anyRequiredPlacements;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "priority");
        if (v11 <= -[_UIStatusBarDisplayItemPlacement priority](self, "priority"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemPlacement.m"), 98, CFSTR("Item placement %@ can't require item placement with lower priority %@"), self, v10);

        }
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarDisplayItemPlacement identifier](self, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemPlacement.m"), 99, CFSTR("Item placement %@ can't require item placement with same identifier %@"), self, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  if (!self->_anyRequiredPlacements)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    anyRequiredPlacements = self->_anyRequiredPlacements;
    self->_anyRequiredPlacements = v16;

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        -[NSHashTable addObject:](self->_anyRequiredPlacements, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v20);
  }

  return self;
}

- (id)withItemInfo:(id)a3
{
  objc_storeStrong((id *)&self->_itemInfo, a3);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_identifier == (_UIStatusBarIdentifier *)v4[3]
    && self->_priority == v4[2];

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  -[_UIStatusBarDisplayItemPlacement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_priority ^ objc_msgSend(v3, "hash");

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("identifier");
  -[_UIStatusBarDisplayItemPlacement identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_UIStatusBarDisplayItemPlacement isEnabled](self, "isEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v18[2] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIStatusBarDisplayItemPlacement priority](self, "priority"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  v18[3] = CFSTR("excludedPlacements");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[_UIStatusBarDisplayItemPlacement excludedPlacements](self, "excludedPlacements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v7;
  v18[4] = CFSTR("allRequiredPlacements");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[_UIStatusBarDisplayItemPlacement allRequiredPlacements](self, "allRequiredPlacements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v10;
  v18[5] = CFSTR("anyRequiredPlacements");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[_UIStatusBarDisplayItemPlacement anyRequiredPlacements](self, "anyRequiredPlacements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:namesAndObjects:](UIDescriptionBuilder, "descriptionForObject:namesAndObjects:", self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (_UIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (NSHashTable)excludedPlacements
{
  return self->_excludedPlacements;
}

- (NSSet)excludedRegionIdentifiers
{
  return self->_excludedRegionIdentifiers;
}

- (NSHashTable)includedPlacements
{
  return self->_includedPlacements;
}

- (NSHashTable)allRequiredPlacements
{
  return self->_allRequiredPlacements;
}

- (NSHashTable)anyRequiredPlacements
{
  return self->_anyRequiredPlacements;
}

- (NSDictionary)itemInfo
{
  return self->_itemInfo;
}

- (BOOL)isEnabled
{
  return self->_enabled;
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
  +[_UIStatusBarSpacerItem randomDisplayIdentifier](_UIStatusBarSpacerItem, "randomDisplayIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v7, a4);
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

@end

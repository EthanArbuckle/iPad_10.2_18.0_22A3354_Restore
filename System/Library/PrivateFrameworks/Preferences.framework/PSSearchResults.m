@implementation PSSearchResults

- (PSSearchResults)init
{
  PSSearchResults *v2;
  uint64_t v3;
  NSMutableArray *sectionEntries;
  uint64_t v5;
  NSMutableDictionary *entriesBySection;
  uint64_t v7;
  NSMutableSet *explicitlyAddedSectionEntries;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSSearchResults;
  v2 = -[PSSearchResults init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sectionEntries = v2->_sectionEntries;
    v2->_sectionEntries = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    entriesBySection = v2->_entriesBySection;
    v2->_entriesBySection = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    explicitlyAddedSectionEntries = v2->_explicitlyAddedSectionEntries;
    v2->_explicitlyAddedSectionEntries = (NSMutableSet *)v7;

  }
  return v2;
}

- (id)_initForCopyWithSectionEntries:(id)a3 entriesBySection:(id)a4 explicitlyAddedSectionEntries:(id)a5
{
  id v9;
  id v10;
  id v11;
  PSSearchResults *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PSSearchResults;
  v12 = -[PSSearchResults init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionEntries, a3);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *entriesBySection;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_sectionEntries);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_explicitlyAddedSectionEntries);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_entriesBySection, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  entriesBySection = self->_entriesBySection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __32__PSSearchResults_copyWithZone___block_invoke;
  v15[3] = &unk_1E4A67BA8;
  v16 = v6;
  v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entriesBySection, "enumerateKeysAndObjectsUsingBlock:", v15);
  v9 = -[PSSearchResults _initForCopyWithSectionEntries:entriesBySection:explicitlyAddedSectionEntries:]([PSSearchResults alloc], "_initForCopyWithSectionEntries:entriesBySection:explicitlyAddedSectionEntries:", v4, v8, v5);
  v10 = objc_msgSend(self->_sectionComparator, "copy");
  v11 = (void *)v9[5];
  v9[5] = v10;

  v12 = objc_msgSend(self->_entryComparator, "copy");
  v13 = (void *)v9[6];
  v9[6] = v12;

  *((_BYTE *)v9 + 32) = self->_needsSorting;
  return v9;
}

void __32__PSSearchResults_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (void)addEntry:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSMutableDictionary *entriesBySection;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = v4;
    if (objc_msgSend(v4, "isSectionEntry"))
    {
      v6 = -[NSMutableArray containsObject:](self->_sectionEntries, "containsObject:", v13);
      v5 = v13;
      if ((v6 & 1) == 0)
      {
        -[NSMutableArray addObject:](self->_sectionEntries, "addObject:", v13);
        -[NSMutableSet addObject:](self->_explicitlyAddedSectionEntries, "addObject:", v13);
        v5 = v13;
        self->_needsSorting = 1;
      }
    }
    else
    {
      objc_msgSend(v13, "sectionEntry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        entriesBySection = self->_entriesBySection;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](entriesBySection, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "addObject:", v13);
          self->_needsSorting = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = self->_entriesBySection;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

        }
        if ((-[NSMutableArray containsObject:](self->_sectionEntries, "containsObject:", v7) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_sectionEntries, "addObject:", v7);
          self->_needsSorting = 1;
        }

      }
      v5 = v13;
    }
  }

}

- (void)addEntries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PSSearchResults addEntry:](self, "addEntry:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)removeEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  NSMutableDictionary *entriesBySection;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  if (!objc_msgSend(v4, "isSectionEntry"))
  {
    objc_msgSend(v5, "sectionEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      entriesBySection = self->_entriesBySection;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](entriesBySection, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count") && (v12 = objc_msgSend(v11, "indexOfObject:", v5), v12 != 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_msgSend(v11, "removeObjectAtIndex:", v12);
        if (!objc_msgSend(v11, "count")
          && (-[NSMutableSet containsObject:](self->_explicitlyAddedSectionEntries, "containsObject:", v8) & 1) == 0)
        {
          v14 = self->_entriesBySection;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

          -[NSMutableArray removeObject:](self->_sectionEntries, "removeObject:", v8);
        }
        v7 = 1;
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
    goto LABEL_18;
  }
  v6 = -[NSMutableArray indexOfObject:](self->_sectionEntries, "indexOfObject:", v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v6;
    -[PSSearchResults entriesInSectionAtIndex:](self, "entriesInSectionAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
      -[NSMutableArray removeObjectAtIndex:](self->_sectionEntries, "removeObjectAtIndex:", v13);
    -[NSMutableSet removeObject:](self->_explicitlyAddedSectionEntries, "removeObject:", v5);
    v7 = 1;
LABEL_18:

    goto LABEL_19;
  }
LABEL_4:
  v7 = 0;
LABEL_19:

  return v7;
}

- (unint64_t)removeEntries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += -[PSSearchResults removeEntry:](self, "removeEntry:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)numberOfSectionEntries
{
  return -[NSMutableArray count](self->_sectionEntries, "count");
}

- (unint64_t)numberOfEntriesInSectionAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  if (-[NSMutableArray count](self->_sectionEntries, "count") <= a3)
    return 0;
  -[PSSearchResults entriesInSectionAtIndex:](self, "entriesInSectionAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (unint64_t)totalNumberOfEntries
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[PSSearchResults numberOfSectionEntries](self, "numberOfSectionEntries");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_entriesBySection, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "count");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)sectionEntryAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_sectionEntries, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sectionEntries, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)entriesInSectionAtIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  NSMutableDictionary *entriesBySection;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableArray count](self->_sectionEntries, "count");
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v5 > a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sectionEntries, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    entriesBySection = self->_entriesBySection;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](entriesBySection, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v6;
    v13 = v12;

    if (self->_treatSectionEntriesAsRegularEntries)
    {
      v18[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v13, "count"))
      {
        v15 = v13;
      }
      else
      {
        v17 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v15;
    }

  }
  return v6;
}

- (id)entryAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  -[PSSearchResults entriesInSectionAtIndex:](self, "entriesInSectionAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  if (v6 >= objc_msgSend(v5, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)allSectionEntries
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_sectionEntries);
}

- (void)sortResults
{
  id sectionComparator;
  void *v4;
  id entryComparator;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_needsSorting)
  {
    if (self->_sectionComparator)
      sectionComparator = self->_sectionComparator;
    else
      sectionComparator = &__block_literal_global_22;
    v4 = (void *)MEMORY[0x1A8594D10](sectionComparator, a2);
    if (self->_entryComparator)
      entryComparator = self->_entryComparator;
    else
      entryComparator = &__block_literal_global_22;
    v6 = (void *)MEMORY[0x1A8594D10](entryComparator);
    -[NSMutableArray sortUsingComparator:](self->_sectionEntries, "sortUsingComparator:", v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_entriesBySection, "allValues", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "sortUsingComparator:", v6);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

uint64_t __30__PSSearchResults_sortResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void)setSectionComparator:(id)a3
{
  void *v4;
  id sectionComparator;

  if (self->_sectionComparator != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    sectionComparator = self->_sectionComparator;
    self->_sectionComparator = v4;

    self->_needsSorting = 1;
  }
}

- (void)setEntryComparator:(id)a3
{
  void *v4;
  id entryComparator;

  if (self->_entryComparator != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    entryComparator = self->_entryComparator;
    self->_entryComparator = v4;

    self->_needsSorting = 1;
  }
}

- (void)mergeWithResults:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *sectionEntries;
  void *v13;
  NSMutableSet *explicitlyAddedSectionEntries;
  uint64_t v15;
  id v16;
  _QWORD v17[5];

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = *((_QWORD *)a3 + 1);
    v6 = a3;
    objc_msgSend(v4, "setWithArray:", v5);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_sectionEntries);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSMutableArray *)objc_msgSend(v9, "initWithArray:", v10);
    sectionEntries = self->_sectionEntries;
    self->_sectionEntries = v11;

    v13 = (void *)v6[3];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __36__PSSearchResults_mergeWithResults___block_invoke;
    v17[3] = &unk_1E4A67BA8;
    v17[4] = self;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v17);
    explicitlyAddedSectionEntries = self->_explicitlyAddedSectionEntries;
    v15 = v6[2];

    -[NSMutableSet unionSet:](explicitlyAddedSectionEntries, "unionSet:", v15);
    self->_needsSorting = 1;

  }
}

void __36__PSSearchResults_mergeWithResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v6, v9);

}

- (id)resultsByMergingWithResults:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[PSSearchResults copy](self, "copy");
  objc_msgSend(v5, "mergeWithResults:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  NSMutableDictionary *entriesBySection;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_entriesBySection, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  entriesBySection = self->_entriesBySection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__PSSearchResults_description__block_invoke;
  v11[3] = &unk_1E4A67BF0;
  v12 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entriesBySection, "enumerateKeysAndObjectsUsingBlock:", v11);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PSSearchResults;
  -[PSSearchResults description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __30__PSSearchResults_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "nonretainedObjectValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

}

- (id)sectionComparator
{
  return self->_sectionComparator;
}

- (id)entryComparator
{
  return self->_entryComparator;
}

- (BOOL)treatSectionEntriesAsRegularEntries
{
  return self->_treatSectionEntriesAsRegularEntries;
}

- (void)setTreatSectionEntriesAsRegularEntries:(BOOL)a3
{
  self->_treatSectionEntriesAsRegularEntries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entryComparator, 0);
  objc_storeStrong(&self->_sectionComparator, 0);
  objc_storeStrong((id *)&self->_entriesBySection, 0);
  objc_storeStrong((id *)&self->_explicitlyAddedSectionEntries, 0);
  objc_storeStrong((id *)&self->_sectionEntries, 0);
}

@end

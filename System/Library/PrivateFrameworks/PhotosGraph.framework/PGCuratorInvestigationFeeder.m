@implementation PGCuratorInvestigationFeeder

- (PGCuratorInvestigationFeeder)initWithItems:(id)a3
{
  id v4;
  PGCuratorInvestigationFeeder *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *items;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGCuratorInvestigationFeeder;
  v5 = -[CLSInvestigationFeeder init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cls_universalDate"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("clsIdentifier"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v9;

  }
  return v5;
}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_items, "count");
}

- (id)universalStartDate
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_items, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_universalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)universalEndDate
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_items, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_universalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localStartDateComponents
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_items, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_localDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localEndDateComponents
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_items, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cls_localDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)approximateLocation
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "clsLocation", (_QWORD)v10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)allItems
{
  return self->_items;
}

- (id)privateItems
{
  NSArray *items;
  void *v3;
  void *v4;

  items = self->_items;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clsIsInSharedLibrary == NO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](items, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sharedItems
{
  NSArray *items;
  void *v3;
  void *v4;

  items = self->_items;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("clsIsInSharedLibrary == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](items, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)itemAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  -[PGCuratorInvestigationFeeder enumerateItemsWithOptions:usingBlock:](self, "enumerateItemsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSArray enumerateObjectsWithOptions:usingBlock:](self->_items, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end

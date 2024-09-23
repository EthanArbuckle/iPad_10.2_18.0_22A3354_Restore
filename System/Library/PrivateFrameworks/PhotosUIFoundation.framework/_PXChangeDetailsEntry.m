@implementation _PXChangeDetailsEntry

- (_PXChangeDetailsEntry)initWithIndex:(int64_t)a3 changeDetails:(id)a4
{
  id v6;
  _PXChangeDetailsEntry *v7;
  _PXChangeDetailsEntry *v8;
  uint64_t v9;
  PXMutableArrayChangeDetails *changeDetails;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXChangeDetailsEntry;
  v7 = -[_PXChangeDetailsEntry init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_index = a3;
    v9 = objc_msgSend(v6, "mutableCopy");
    changeDetails = v8->_changeDetails;
    v8->_changeDetails = (PXMutableArrayChangeDetails *)v9;

  }
  return v8;
}

- (void)addSubitemEntry:(id)a3
{
  id v4;
  NSMutableArray *subitemEntries;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subitemEntries = self->_subitemEntries;
  v8 = v4;
  if (!subitemEntries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_subitemEntries;
    self->_subitemEntries = v6;

    v4 = v8;
    subitemEntries = self->_subitemEntries;
  }
  -[NSMutableArray addObject:](subitemEntries, "addObject:", v4);

}

- (void)updateWithSectionedChangeDetails:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _PXChangeDetailsEntry *v27;
  void *v28;
  void *v29;
  int64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[_PXChangeDetailsEntry index](self, "index");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedChangeDetailsCoalescer.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndex != NSNotFound"));

  }
  objc_msgSend(v5, "itemChangesInSection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXChangeDetailsEntry changeDetails](self, "changeDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addChangeDetails:", v7);

  -[_PXChangeDetailsEntry changeDetails](self, "changeDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasIncrementalChanges");

  if (v10)
  {
    v30 = v6;
    objc_msgSend(v5, "itemsWithSubitemChangesInSection:", -[_PXChangeDetailsEntry index](self, "index"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[_PXChangeDetailsEntry subitemEntries](self, "subitemEntries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    v29 = v7;
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v19 = objc_msgSend(v7, "indexAfterApplyingChangesToIndex:", objc_msgSend(v18, "index"));
          objc_msgSend(v18, "setIndex:", v19);
          if (v19 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v12, "containsIndex:", v19))
          {
            objc_msgSend(v5, "subitemChangesInItem:section:", v19, v30);
            v20 = v5;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "changeDetails");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addChangeDetails:", v21);

            objc_msgSend(v12, "removeIndex:", v19);
            v5 = v20;
            v7 = v29;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v15);
    }

    while (objc_msgSend(v12, "count"))
    {
      v23 = objc_msgSend(v12, "firstIndex");
      objc_msgSend(v12, "removeIndex:", v23);
      -[_PXChangeDetailsEntry changeDetails](self, "changeDetails");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "indexAfterRevertingChangesFromIndex:", v23);

      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "subitemChangesInItem:section:", v23, v30);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[_PXChangeDetailsEntry initWithIndex:changeDetails:]([_PXChangeDetailsEntry alloc], "initWithIndex:changeDetails:", v23, v26);
        -[_PXChangeDetailsEntry addSubitemEntry:](self, "addSubitemEntry:", v27);

      }
    }

    v7 = v29;
  }

}

- (NSDictionary)subitemChangesByItem
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_subitemEntries, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = self->_subitemEntries;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v8, "index", (_QWORD)v13) != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v8, "changeDetails");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)objc_msgSend(v9, "copy");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "index"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(0, "setObject:forKeyedSubscript:", v10, v11);

          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

  }
  return 0;
}

- (PXMutableArrayChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (NSMutableArray)subitemEntries
{
  return self->_subitemEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subitemEntries, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

@end

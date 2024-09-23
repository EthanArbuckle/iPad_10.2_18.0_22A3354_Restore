@implementation PUBarButtonItemCollection

- (PUBarButtonItemCollection)init
{
  return -[PUBarButtonItemCollection initWithOptions:](self, "initWithOptions:", 0);
}

- (PUBarButtonItemCollection)initWithOptions:(unint64_t)a3
{
  PUBarButtonItemCollection *v4;
  NSCache *v5;
  NSCache *configurationsCache;
  uint64_t v7;
  NSMutableDictionary *barButtonItems;
  uint64_t v9;
  UIBarButtonItem *flexibleSpaceBarButtonItem;
  uint64_t v11;
  UIBarButtonItem *placeholderBarButtonItem;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUBarButtonItemCollection;
  v4 = -[PUBarButtonItemCollection init](&v14, sel_init);
  if (v4)
  {
    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    configurationsCache = v4->__configurationsCache;
    v4->__configurationsCache = v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    barButtonItems = v4->__barButtonItems;
    v4->__barButtonItems = (NSMutableDictionary *)v7;

    v4->__options = a3;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    flexibleSpaceBarButtonItem = v4->__flexibleSpaceBarButtonItem;
    v4->__flexibleSpaceBarButtonItem = (UIBarButtonItem *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    placeholderBarButtonItem = v4->__placeholderBarButtonItem;
    v4->__placeholderBarButtonItem = (UIBarButtonItem *)v11;

    -[UIBarButtonItem setWidth:](v4->__placeholderBarButtonItem, "setWidth:", 44.0);
  }
  return v4;
}

- (void)_resetSet
{
  void *v3;

  -[PUBarButtonItemCollection _configurationsCache](self, "_configurationsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PUBarButtonItemCollection _setPreviousRequestedSet:](self, "_setPreviousRequestedSet:", 0);
  -[PUBarButtonItemCollection _setPreviousResult:](self, "_setPreviousResult:", 0);
}

- (void)setIdentifiersOrder:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  BOOL v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  v6 = v5;
  if (self->_identifiersOrder != v5)
  {
    v8 = v5;
    v7 = -[NSArray isEqualToArray:](v5, "isEqualToArray:");
    v6 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_identifiersOrder, a3);
      -[PUBarButtonItemCollection _resetSet](self, "_resetSet");
      v6 = v8;
    }
  }

}

- (NSDictionary)barButtonItems
{
  return (NSDictionary *)self->__barButtonItems;
}

- (id)barButtonItemForIdentifier:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PUBarButtonItemCollection _barButtonItems](self, "_barButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PUBarButtonItemCollection dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "barButtonItemCollection:newBarButtonItemForIdentifier:", self, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUBarButtonItemCollection _barButtonItems](self, "_barButtonItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v10);

  }
  return v7;
}

- (int64_t)identifierForBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[PUBarButtonItemCollection _barButtonItems](self, "_barButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__PUBarButtonItemCollection_identifierForBarButtonItem___block_invoke;
  v9[3] = &unk_1E589D4E0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (int64_t)identifierForCustomButton:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[PUBarButtonItemCollection _barButtonItems](self, "_barButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PUBarButtonItemCollection_identifierForCustomButton___block_invoke;
  v9[3] = &unk_1E589D4E0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)orderedBarButtonsItemsForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[PUBarButtonItemCollection _previousRequestedSet](self, "_previousRequestedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToIndexSet:", v6);

    if (!v7
      || (-[PUBarButtonItemCollection _previousResult](self, "_previousResult"),
          (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v9 = (void *)objc_msgSend(v5, "copy");
      -[PUBarButtonItemCollection _configurationsCache](self, "_configurationsCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v9);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v8 = -[PUBarButtonItemCollection _newEntryForIdentifiers:](self, "_newEntryForIdentifiers:", v9);
        -[PUBarButtonItemCollection _configurationsCache](self, "_configurationsCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v8)
        {
          objc_msgSend(v11, "setObject:forKey:", v8, v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v14, v9);

        }
      }
      -[PUBarButtonItemCollection _setPreviousRequestedSet:](self, "_setPreviousRequestedSet:", v9);
      -[PUBarButtonItemCollection _setPreviousResult:](self, "_setPreviousResult:", v8);

    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v15))
      v16 = 0;
    else
      v16 = v8;
    v13 = v16;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_newEntryForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSArray *identifiersOrder;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  PUBarButtonItemCollection *v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifiersOrder = self->_identifiersOrder;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PUBarButtonItemCollection__newEntryForIdentifiers___block_invoke;
  v11[3] = &unk_1E589D508;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v7 = v5;
  v8 = v4;
  -[NSArray enumerateObjectsUsingBlock:](identifiersOrder, "enumerateObjectsUsingBlock:", v11);
  -[PUBarButtonItemCollection _arrangedBarButtonItems:identifiers:](self, "_arrangedBarButtonItems:identifiers:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_arrangedBarButtonItems:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[PUBarButtonItemCollection _centersButtonsIfNeeded:identifiers:](self, "_centersButtonsIfNeeded:identifiers:", v6, v7);
    if ((-[PUBarButtonItemCollection _options](self, "_options") & 2) != 0 && objc_msgSend(v6, "count") == 1)
    {
      -[PUBarButtonItemCollection _flexibleSpaceBarButtonItem](self, "_flexibleSpaceBarButtonItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertObject:atIndex:", v8, 0);

      -[PUBarButtonItemCollection _flexibleSpaceBarButtonItem](self, "_flexibleSpaceBarButtonItem");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);
    }
    else if ((-[PUBarButtonItemCollection _options](self, "_options") & 4) != 0 && objc_msgSend(v6, "count") == 1)
    {
      -[PUBarButtonItemCollection _flexibleSpaceBarButtonItem](self, "_flexibleSpaceBarButtonItem");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertObject:atIndex:", v9, 0);
    }
    else
    {
      if ((-[PUBarButtonItemCollection _options](self, "_options") & 1) == 0
        || (unint64_t)objc_msgSend(v6, "count") < 2)
      {
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__PUBarButtonItemCollection__arrangedBarButtonItems_identifiers___block_invoke;
      v14[3] = &unk_1E589D530;
      v14[4] = self;
      v12 = v11;
      v15 = v12;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
      v9 = v12;

      v6 = v9;
    }

LABEL_14:
    v6 = v6;
    v10 = v6;
    goto LABEL_15;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (void)_centersButtonsIfNeeded:(id)a3 identifiers:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  NSArray *identifiersOrder;
  void *v12;
  unint64_t v13;
  NSArray *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") == 2 && -[NSIndexSet count](self->_centeredItemIdentifiers, "count"))
  {
    v7 = objc_msgSend(v6, "firstIndex");
    v8 = objc_msgSend(v6, "lastIndex");
    if (-[NSIndexSet containsIndex:](self->_centeredItemIdentifiers, "containsIndex:", v7))
    {
      v9 = v7;
      v7 = v8;
    }
    else
    {
      v10 = -[NSIndexSet containsIndex:](self->_centeredItemIdentifiers, "containsIndex:", v8);
      v9 = v8;
      if (!v10)
        goto LABEL_13;
    }
    if (v9)
    {
      identifiersOrder = self->_identifiersOrder;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSArray indexOfObject:](identifiersOrder, "indexOfObject:", v12);

      v14 = self->_identifiersOrder;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NSArray indexOfObject:](v14, "indexOfObject:", v15);

      if (v13 != 0x7FFFFFFFFFFFFFFFLL && v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PUBarButtonItemCollection _placeholderBarButtonItem](self, "_placeholderBarButtonItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 >= v16)
          objc_msgSend(v18, "addObject:", v17);
        else
          objc_msgSend(v18, "insertObject:atIndex:", v17, 0);

      }
    }
  }
LABEL_13:

}

- (NSArray)identifiersOrder
{
  return self->_identifiersOrder;
}

- (NSIndexSet)centeredItemIdentifiers
{
  return self->_centeredItemIdentifiers;
}

- (void)setCenteredItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_centeredItemIdentifiers, a3);
}

- (PUBarButtonItemCollectionDataSource)dataSource
{
  return (PUBarButtonItemCollectionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (unint64_t)_options
{
  return self->__options;
}

- (NSCache)_configurationsCache
{
  return self->__configurationsCache;
}

- (NSMutableDictionary)_barButtonItems
{
  return self->__barButtonItems;
}

- (NSIndexSet)_previousRequestedSet
{
  return self->__previousRequestedSet;
}

- (void)_setPreviousRequestedSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)_previousResult
{
  return self->__previousResult;
}

- (void)_setPreviousResult:(id)a3
{
  objc_storeStrong((id *)&self->__previousResult, a3);
}

- (UIBarButtonItem)_flexibleSpaceBarButtonItem
{
  return self->__flexibleSpaceBarButtonItem;
}

- (UIBarButtonItem)_placeholderBarButtonItem
{
  return self->__placeholderBarButtonItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__placeholderBarButtonItem, 0);
  objc_storeStrong((id *)&self->__flexibleSpaceBarButtonItem, 0);
  objc_storeStrong((id *)&self->__previousResult, 0);
  objc_storeStrong((id *)&self->__previousRequestedSet, 0);
  objc_storeStrong((id *)&self->__barButtonItems, 0);
  objc_storeStrong((id *)&self->__configurationsCache, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_centeredItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersOrder, 0);
}

void __65__PUBarButtonItemCollection__arrangedBarButtonItems_identifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_flexibleSpaceBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __53__PUBarButtonItemCollection__newEntryForIdentifiers___block_invoke(id *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a2, "integerValue");
  if (objc_msgSend(a1[4], "containsIndex:", v3))
  {
    objc_msgSend(a1[5], "barButtonItemForIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(a1[6], "addObject:", v4);
      v4 = v5;
    }

  }
}

void __55__PUBarButtonItemCollection_identifierForCustomButton___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(a3, "customView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isDescendantOfView:", v8);

  if ((_DWORD)v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "integerValue");
    *a4 = 1;
  }

}

uint64_t __56__PUBarButtonItemCollection_identifierForBarButtonItem___block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (*(_QWORD *)(result + 32) == a3)
  {
    v5 = result;
    result = objc_msgSend(a2, "integerValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

@end

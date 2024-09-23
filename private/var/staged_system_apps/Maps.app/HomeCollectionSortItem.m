@implementation HomeCollectionSortItem

- (HomeCollectionSortItem)initWithCollection:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HomeCollectionSortItem *v9;
  HomeCollectionSortItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeCollectionSortItem;
  v9 = -[HomeCollectionSortItem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)-[CollectionHandler hash](self->_collection, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HomeCollectionSortItem *v4;
  HomeCollectionSortItem *v5;
  uint64_t v6;
  HomeCollectionSortItem *v7;
  CollectionHandler *v8;
  CollectionHandler *v9;
  id v10;
  id WeakRetained;
  unsigned __int8 v12;

  v4 = (HomeCollectionSortItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (CollectionHandler *)objc_claimAutoreleasedReturnValue(-[HomeCollectionSortItem collection](v7, "collection"));
    v9 = v8;
    if (v8 == self->_collection || -[CollectionHandler isEqual:](v8, "isEqual:"))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[HomeCollectionSortItem delegate](v7, "delegate"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (v10 == WeakRetained)
        v12 = 1;
      else
        v12 = objc_msgSend(v10, "isEqual:", WeakRetained);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return (NSString *)CFSTR("SortBy");
}

- (id)cellModelWithBackgroundModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SmallDropDownOutlineCellModel *v13;
  void *v14;
  void *v15;
  SmallDropDownOutlineCellModel *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCollectionSortItem _sortTypes](self, "_sortTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCollectionSortItem _titleForCollectionSortType:](self, "_titleForCollectionSortType:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), "integerValue", (_QWORD)v18)));
        objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v13 = [SmallDropDownOutlineCellModel alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCollectionSortItem _titleForCollectionSortType:](self, "_titleForCollectionSortType:", -[CollectionHandler sortType](self->_collection, "sortType")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CollectionHandler sortType](self->_collection, "sortType")));
  v16 = -[SmallDropDownOutlineCellModel initWithButtonTitle:dropDownTitles:selectedIndex:delegate:backgroundModel:](v13, "initWithButtonTitle:dropDownTitles:selectedIndex:delegate:backgroundModel:", v14, v6, objc_msgSend(v7, "indexOfObject:", v15), self, v4);

  return v16;
}

- (id)_titleForCollectionSortType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Collection] Header Date Added");
      goto LABEL_7;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Collection] Header Name");
      goto LABEL_7;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[Collection] Header Distance");
LABEL_7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
  }
  return v3;
}

- (id)_sortTypes
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v3, "addObject:", &off_10126D1E0);
  if ((id)-[CollectionHandler contentType](self->_collection, "contentType") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v5 = objc_msgSend(v4, "isAuthorizedForPreciseLocation");

    if (v5)
      objc_msgSend(v3, "addObject:", &off_10126D1F8);
  }
  if ((id)-[CollectionHandler handlerType](self->_collection, "handlerType") != (id)3)
    objc_msgSend(v3, "addObject:", &off_10126D210);
  v6 = objc_msgSend(v3, "copy");

  return v6;
}

- (void)smallDropDownOutlineCell:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCollectionSortItem _sortTypes](self, "_sortTypes", a3));
  if ((a4 & 0x8000000000000000) == 0)
  {
    v11 = v6;
    v7 = (uint64_t)objc_msgSend(v6, "count") <= a4;
    v6 = v11;
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", a4));
      v9 = objc_msgSend(v8, "integerValue");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCollectionSortItem delegate](self, "delegate"));
      objc_msgSend(v10, "collectionSortItem:didSelectSortType:", self, v9);

      v6 = v11;
    }
  }

}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (HomeCollectionSortItemDelegate)delegate
{
  return (HomeCollectionSortItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end

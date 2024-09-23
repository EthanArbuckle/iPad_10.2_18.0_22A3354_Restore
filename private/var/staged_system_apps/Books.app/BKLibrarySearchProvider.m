@implementation BKLibrarySearchProvider

- (BKLibrarySearchProvider)initWithFetchRequest:(id)a3 name:(id)a4 searchTerm:(id)a5 limit:(unint64_t)a6 moc:(id)a7
{
  id v12;
  BKLibrarySearchProvider *v13;
  BKLibrarySearchProvider *v14;
  objc_super v16;

  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BKLibrarySearchProvider;
  v13 = -[BKLibraryProvider initWithFetchRequest:name:moc:](&v16, "initWithFetchRequest:name:moc:", a3, a4, a7);
  v14 = v13;
  if (v13)
    -[BKLibrarySearchProvider _commonInitWithSearchTerm:limit:](v13, "_commonInitWithSearchTerm:limit:", v12, a6);

  return v14;
}

- (BKLibrarySearchProvider)initWithFetchRequest:(id)a3 name:(id)a4 searchTerm:(id)a5 limit:(unint64_t)a6
{
  id v10;
  BKLibrarySearchProvider *v11;
  BKLibrarySearchProvider *v12;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BKLibrarySearchProvider;
  v11 = -[BKLibraryProvider initWithFetchRequest:name:](&v14, "initWithFetchRequest:name:", a3, a4);
  v12 = v11;
  if (v11)
    -[BKLibrarySearchProvider _commonInitWithSearchTerm:limit:](v11, "_commonInitWithSearchTerm:limit:", v10, a6);

  return v12;
}

- (void)_commonInitWithSearchTerm:(id)a3 limit:(unint64_t)a4
{
  self->_resultClassificationLimit = a4;
  -[BKLibrarySearchProvider updateSearchTerm:](self, "updateSearchTerm:", a3);
}

- (void)updateSearchTerm:(id)a3
{
  -[BKLibrarySearchProvider updateSearchTerm:resettingResultType:](self, "updateSearchTerm:resettingResultType:", a3, 1);
}

- (void)updateSearchTerm:(id)a3 resettingResultType:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;
  NSString *currentSearchTerm;
  int64_t currentSearchResultEntityType;
  NSString *previousSearchTerm;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v7));

  v9 = objc_msgSend(v8, "length");
  currentSearchTerm = self->_currentSearchTerm;
  if (v9)
  {
    objc_storeStrong((id *)&self->_previousSearchTerm, currentSearchTerm);
    objc_storeStrong((id *)&self->_currentSearchTerm, a3);
    self->_previousSearchResultEntityType = self->_currentSearchResultEntityType;
    if (v4)
    {
      currentSearchResultEntityType = 0;
      self->_currentSearchResultEntityType = 0;
    }
    else
    {
      currentSearchResultEntityType = self->_currentSearchResultEntityType;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager searchFetchRequestWithText:entityType:](BKLibraryManager, "searchFetchRequestWithText:entityType:", v8, currentSearchResultEntityType));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIAsset propertiesNeededFromBKLibraryAsset](BSUIAsset, "propertiesNeededFromBKLibraryAsset"));
    objc_msgSend(v13, "setPropertiesToFetch:", v14);

  }
  else
  {
    self->_currentSearchTerm = 0;

    previousSearchTerm = self->_previousSearchTerm;
    self->_previousSearchTerm = 0;

    v13 = 0;
    if (v4)
    {
      v13 = 0;
      self->_currentSearchResultEntityType = 0;
      self->_previousSearchResultEntityType = 0;
    }
  }
  -[BKLibraryProvider configureFetchedResultsControllerWithFetchRequest:](self, "configureFetchedResultsControllerWithFetchRequest:", v13);

}

- (void)updateSearchResultEntityType:(int64_t)a3
{
  int64_t currentSearchResultEntityType;
  NSString *currentSearchTerm;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  currentSearchResultEntityType = self->_currentSearchResultEntityType;
  if (currentSearchResultEntityType != a3)
  {
    self->_previousSearchResultEntityType = currentSearchResultEntityType;
    self->_currentSearchResultEntityType = a3;
    objc_storeStrong((id *)&self->_previousSearchTerm, self->_currentSearchTerm);
    currentSearchTerm = self->_currentSearchTerm;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v13 = (id)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](currentSearchTerm, "stringByTrimmingCharactersInSet:", v7));

    if (a3 == 4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider dynamicArray](self, "dynamicArray"));
      objc_msgSend(v8, "updateArray:", &__NSArray0__struct);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider delegate](self, "delegate"));
      v10 = objc_opt_respondsToSelector(v9, "libraryProvider:contentDidLoad:");

      if ((v10 & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider delegate](self, "delegate"));
        objc_msgSend(v11, "libraryProvider:contentDidLoad:", self, &__NSArray0__struct);
LABEL_7:

      }
    }
    else if (objc_msgSend(v13, "length"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager searchFetchRequestWithText:entityType:](BKLibraryManager, "searchFetchRequestWithText:entityType:", v13, a3));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIAsset propertiesNeededFromBKLibraryAsset](BSUIAsset, "propertiesNeededFromBKLibraryAsset"));
      objc_msgSend(v11, "setPropertiesToFetch:", v12);

      -[BKLibraryProvider configureFetchedResultsControllerWithFetchRequest:](self, "configureFetchedResultsControllerWithFetchRequest:", v11);
      goto LABEL_7;
    }

  }
}

- (id)_assetDictionariesForDynamicArrayWithFetchRequest:(id)a3 isInitialFetch:(BOOL)a4 matchedAssets:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  int64_t currentSearchResultEntityType;
  NSString *currentSearchTerm;
  uint64_t v12;
  BKLibrarySearchProvider *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v5 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BKLibrarySearchProvider;
  v7 = -[BKLibraryProvider _assetDictionariesForDynamicArrayWithFetchRequest:isInitialFetch:matchedAssets:](&v18, "_assetDictionariesForDynamicArrayWithFetchRequest:isInitialFetch:matchedAssets:", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5 && objc_msgSend(v8, "count"))
  {
    currentSearchResultEntityType = self->_currentSearchResultEntityType;
    if (currentSearchResultEntityType == self->_previousSearchResultEntityType)
    {
      if (!-[NSString hasPrefix:](self->_previousSearchTerm, "hasPrefix:", self->_currentSearchTerm))
      {
        if (self->_previousSearchTerm && -[NSString hasPrefix:](self->_currentSearchTerm, "hasPrefix:"))
          goto LABEL_15;
        goto LABEL_13;
      }
    }
    else
    {
      currentSearchTerm = self->_currentSearchTerm;
      if (currentSearchTerm != self->_previousSearchTerm)
      {
        if (!-[NSString isEqualToString:](currentSearchTerm, "isEqualToString:"))
          goto LABEL_13;
        currentSearchResultEntityType = self->_currentSearchResultEntityType;
      }
      if (currentSearchResultEntityType)
      {
        if (!self->_previousSearchResultEntityType)
        {
LABEL_15:
          v13 = self;
          v14 = v9;
          v15 = 0;
          goto LABEL_16;
        }
LABEL_13:
        v12 = objc_claimAutoreleasedReturnValue(-[BKLibrarySearchProvider _classifyAllResultsWithSearchItemStatus:searchItemStatus:](self, "_classifyAllResultsWithSearchItemStatus:searchItemStatus:", v9, 1));
LABEL_17:
        v16 = (void *)v12;

        v9 = v16;
        return v9;
      }
    }
    v13 = self;
    v14 = v9;
    v15 = 1;
LABEL_16:
    v12 = objc_claimAutoreleasedReturnValue(-[BKLibrarySearchProvider _classifyResultsSearchItemStatus:wideningSearch:](v13, "_classifyResultsSearchItemStatus:wideningSearch:", v14, v15));
    goto LABEL_17;
  }
  return v9;
}

- (id)_classifyAllResultsWithSearchItemStatus:(id)a3 searchItemStatus:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "mutableCopy", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("searchItemStatus"));

        objc_msgSend(v6, "addObject:", v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_classifyResultsSearchItemStatus:(id)a3 wideningSearch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider dynamicArray](self, "dynamicArray"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalArray"));

  if (objc_msgSend(v8, "count"))
  {
    v24 = objc_alloc_init((Class)NSMutableArray);
    v9 = BSUIAssetKeyAssetID;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", BSUIAssetKeyAssetID));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", v9));
    v25 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
    v14 = objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v14, "minusSet:", v13);
    v15 = objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v15, "minusSet:", v12);
    if (v4)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000C3108;
      v32[3] = &unk_1008E9BA0;
      v33 = v14;
      v16 = (uint64_t)objc_msgSend(v25, "indexOfObjectWithOptions:passingTest:", 2, v32);

    }
    else
    {
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000C313C;
    v26[3] = &unk_1008E9BC8;
    v27 = v14;
    v28 = v15;
    v31 = v16;
    v29 = v11;
    v18 = v24;
    v30 = v18;
    v19 = v11;
    v20 = v15;
    v21 = v14;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v26);
    v22 = v30;
    v17 = v18;

  }
  else
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(-[BKLibrarySearchProvider _classifyAllResultsWithSearchItemStatus:searchItemStatus:](self, "_classifyAllResultsWithSearchItemStatus:searchItemStatus:", v6, 1));
  }

  return v17;
}

- (unint64_t)resultClassificationLimit
{
  return self->_resultClassificationLimit;
}

- (void)setResultClassificationLimit:(unint64_t)a3
{
  self->_resultClassificationLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSearchTerm, 0);
  objc_storeStrong((id *)&self->_currentSearchTerm, 0);
}

@end

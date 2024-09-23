@implementation SearchResultsItemSource

- (SearchResultsItemSource)init
{
  SearchResultsItemSource *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *lockQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchResultsItemSource;
  v2 = -[SearchResultsItemSource init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("SearchResultsItemSource.lock", v4);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_searchResults;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "removeObserver:forKeyPath:", self, CFSTR("reverseGeocoded"));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SearchResultsItemSource;
  -[SearchResultsItemSource dealloc](&v8, "dealloc");
}

- (id)allItems
{
  NSObject *lockQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1009CA9E4;
  v10 = sub_1009CA9F4;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009CA9FC;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  objc_super v12;
  id v13;

  if (off_1014B83A0 == a6)
  {
    v13 = a4;
    v11 = a4;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

    -[SearchResultsItemSource _updateSearchResults:](self, "_updateSearchResults:", v10);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SearchResultsItemSource;
    v10 = a4;
    -[SearchResultsItemSource observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);
  }

}

- (void)setSearchResults:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  NSArray *searchResults;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSMapTable *v17;
  NSMapTable *allSearchResults;
  NSObject *lockQueue;
  _QWORD block[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_searchResults;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v9), "removeObserver:forKeyPath:", self, CFSTR("reverseGeocoded"));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v10 = (NSArray *)objc_msgSend(v4, "copy");
  searchResults = self->_searchResults;
  self->_searchResults = v10;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_searchResults;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16), "addObserver:forKeyPath:options:context:", self, CFSTR("reverseGeocoded"), 0, off_1014B83A0);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  v17 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  allSearchResults = self->_allSearchResults;
  self->_allSearchResults = v17;

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009CAD88;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(lockQueue, block);
  -[SearchResultsItemSource _updateSearchResults:](self, "_updateSearchResults:", self->_searchResults);

}

- (void)_updateSearchResults:(id)a3
{
  id v4;
  unint64_t mode;
  __objc2_class **v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *lockQueue;
  id v26;
  void *v27;
  _QWORD block[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v4 = a3;
  mode = self->_mode;
  if (!mode)
  {
    v6 = off_101197F58;
    goto LABEL_5;
  }
  if (mode == 1)
  {
    v6 = &off_101196168;
LABEL_5:
    v7 = (objc_class *)objc_opt_class(*v6);
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v12);
        v14 = objc_msgSend([v7 alloc], "initWithSearchResult:", v13);
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "setSource:", self);
          -[NSMapTable setObject:forKey:](self->_allSearchResults, "setObject:forKey:", v15, v13);
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v10);
  }
  v27 = v8;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_searchResults, "count")));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = self->_searchResults;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v31;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_allSearchResults, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v22)));
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "setSortOrder:", (char *)v22 + v20 + 1);
          objc_msgSend(v24, "setShouldBeHiddenFromMap:", self->_shouldHideSearchResults);
          objc_msgSend(v24, "setPreferredDisplayedSearchResultType:", self->_preferredDisplayedSearchResultType);
          objc_msgSend(v16, "addObject:", v24);
        }

        v22 = (char *)v22 + 1;
      }
      while (v19 != v22);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v20 += (uint64_t)v22;
    }
    while (v19);
  }

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009CB0A8;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v29 = v16;
  v26 = v16;
  dispatch_sync(lockQueue, block);
  -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");

}

- (id)keysForSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  DroppedPinMapItemKey *v6;
  DroppedPinMapItemKey *v7;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "personalizedItemKey"));
    objc_msgSend(v4, "addObject:", v5);

    if (objc_msgSend(v3, "type") == 3)
    {
      v6 = [DroppedPinMapItemKey alloc];
      objc_msgSend(v3, "coordinate");
      v7 = -[DroppedPinMapItemKey initWithCoordinate:](v6, "initWithCoordinate:");
      objc_msgSend(v4, "addObject:", v7);

    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }

  return v4;
}

- (void)setShouldHideSearchResults:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  SearchResultsItemSource *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  __CFString *v29;

  if (self->_shouldHideSearchResults == a3)
    return;
  v3 = a3;
  v5 = sub_100432BCC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    v14 = CFSTR("NO");
    if (v3)
      v14 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    v15 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set shouldHideSearchResults: %@", buf, 0x16u);

  }
  self->_shouldHideSearchResults = v3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource allItems](self, "allItems"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), "setShouldBeHiddenFromMap:", v3);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }
  -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");

}

- (void)setPreferredDisplayedSearchResultType:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->_preferredDisplayedSearchResultType != a3)
  {
    self->_preferredDisplayedSearchResultType = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource allItems](self, "allItems", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "setPreferredDisplayedSearchResultType:", a3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");
  }
}

- (id)description
{
  const __CFString *v2;

  if (self->_shouldHideSearchResults)
    v2 = CFSTR("TRUE");
  else
    v2 = CFSTR("FALSE");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SearchResultsItemSource: _shouldHideSearchResults: %@, SearchResults count: %lu, itemCount: %lu"), v2, -[NSArray count](self->_searchResults, "count"), -[NSArray count](self->_allItems, "count"));
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)shouldHideSearchResults
{
  return self->_shouldHideSearchResults;
}

- (int64_t)preferredDisplayedSearchResultType
{
  return self->_preferredDisplayedSearchResultType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_allSearchResults, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end

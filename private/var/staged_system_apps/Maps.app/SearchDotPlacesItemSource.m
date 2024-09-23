@implementation SearchDotPlacesItemSource

- (SearchDotPlacesItemSource)init
{
  SearchDotPlacesItemSource *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *lockQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchDotPlacesItemSource;
  v2 = -[SearchDotPlacesItemSource init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("SearchDotPlacesItemSource.lock", v4);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
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
  v9 = sub_1009BF684;
  v10 = sub_1009BF694;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009BF69C;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setSearchDotPlaces:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *searchDotPlaces;
  NSObject *lockQueue;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[5];

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  searchDotPlaces = self->_searchDotPlaces;
  self->_searchDotPlaces = v5;

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009BF830;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(lockQueue, block);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1009BF848;
  v13[3] = &unk_1011DE748;
  v13[4] = self;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);

  v9 = self->_lockQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009BF8CC;
  v11[3] = &unk_1011AC8B0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_sync(v9, v11);
  -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");

}

- (void)setShouldHideSearchDotPlaces:(BOOL)a3
{
  _BOOL8 v3;
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

  if (self->_shouldHideSearchDotPlaces != a3)
  {
    v3 = a3;
    self->_shouldHideSearchDotPlaces = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlacesItemSource allItems](self, "allItems", 0));
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "setShouldBeHiddenFromMap:", v3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");
  }
}

- (NSArray)searchDotPlaces
{
  return self->_searchDotPlaces;
}

- (BOOL)shouldHideSearchDotPlaces
{
  return self->_shouldHideSearchDotPlaces;
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_searchDotPlaces, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end

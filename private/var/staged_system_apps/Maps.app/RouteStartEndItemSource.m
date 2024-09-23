@implementation RouteStartEndItemSource

- (RouteStartEndItemSource)init
{
  RouteStartEndItemSource *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *lockQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RouteStartEndItemSource;
  v2 = -[RouteStartEndItemSource init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("RouteStartEndItemSource.lock", v4);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)clearStartAndEndLocations
{
  NSArray *v3;
  SearchResult *startLocation;
  NSArray *endLocations;
  NSObject *lockQueue;
  SearchResult *v7;
  _QWORD block[5];

  v7 = self->_startLocation;
  v3 = self->_endLocations;
  startLocation = self->_startLocation;
  self->_startLocation = 0;

  endLocations = self->_endLocations;
  self->_endLocations = 0;

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100312DD8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(lockQueue, block);
  if (v7 || -[NSArray count](v3, "count"))
    -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange", v7);

}

- (void)_updateItemVisibility
{
  NSArray *endItems;
  _QWORD v4[5];

  -[RouteStartEndItem setShouldBeHiddenFromMap:](self->_startItem, "setShouldBeHiddenFromMap:", (-[RouteStartEndItemSource visibilityMask](self, "visibilityMask") & 1) == 0);
  endItems = self->_endItems;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100312EA4;
  v4[3] = &unk_1011B1628;
  v4[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](endItems, "enumerateObjectsUsingBlock:", v4);
}

- (void)setVisibilityMask:(unint64_t)a3
{
  if (self->_visibilityMask != a3)
  {
    self->_visibilityMask = a3;
    -[RouteStartEndItemSource _updateItemVisibility](self, "_updateItemVisibility");
    -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");
  }
}

- (void)setStartLocation:(id)a3 endLocation:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    v8 = a3;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    -[RouteStartEndItemSource setStartLocation:endLocations:](self, "setStartLocation:endLocations:", v8, v9, v10);

  }
  else
  {
    v9 = a3;
    -[RouteStartEndItemSource setStartLocation:endLocations:](self, "setStartLocation:endLocations:", v9, 0);
  }

}

- (void)setStartLocation:(id)a3 endLocations:(id)a4
{
  id v7;
  SearchResult **p_startLocation;
  RouteStartEndItem *v9;
  NSArray *endLocations;
  unint64_t v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  NSObject *lockQueue;
  id v18;
  RouteStartEndItem *v19;
  SearchResult *v20;
  _QWORD block[5];
  RouteStartEndItem *v22;
  id v23;

  v20 = (SearchResult *)a3;
  v7 = a4;
  p_startLocation = &self->_startLocation;
  if (self->_startLocation != v20
    || (endLocations = self->_endLocations,
        v11 = (unint64_t)v7,
        v12 = endLocations,
        v11 | (unint64_t)v12)
    && (v13 = v12,
        v14 = objc_msgSend((id)v11, "isEqual:", v12),
        v13,
        (id)v11,
        (v14 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_startLocation, a3);
    objc_storeStrong((id *)&self->_endLocations, a4);
    if (*p_startLocation && !-[SearchResult isDynamicCurrentLocation](*p_startLocation, "isDynamicCurrentLocation"))
      v9 = -[RouteStartEndItem initWithSearchResult:routeFeatureType:]([RouteStartEndItem alloc], "initWithSearchResult:routeFeatureType:", *p_startLocation, 1);
    else
      v9 = 0;
    v15 = sub_10039DCD4(self->_endLocations, &stru_1011B1668);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    lockQueue = self->_lockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100313234;
    block[3] = &unk_1011AD238;
    block[4] = self;
    v22 = v9;
    v23 = v16;
    v18 = v16;
    v19 = v9;
    dispatch_sync(lockQueue, block);
    -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");

  }
}

- (id)allItems
{
  NSObject *lockQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1003128A8;
  v11 = sub_1003128B8;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  lockQueue = self->_lockQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100313368;
  v6[3] = &unk_1011AD318;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(lockQueue, v6);
  v4 = objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSSet)keysForStartLocation
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
  v9 = sub_1003128A8;
  v10 = sub_1003128B8;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100313480;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (NSArray)allKeysetsForEndLocations
{
  id v3;
  NSObject *lockQueue;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  RouteStartEndItemSource *v12;
  id v13;

  v3 = objc_alloc_init((Class)NSMutableArray);
  lockQueue = self->_lockQueue;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100313578;
  v11 = &unk_1011AC8B0;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(lockQueue, &v8);
  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

- (id)itemMatchingLocation:(id)a3
{
  id v4;
  void *v5;
  RouteStartEndItem *v6;
  NSArray *endLocations;
  _QWORD v9[4];
  id v10;
  RouteStartEndItemSource *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isEqualToSearchResult:forPurpose:", self->_startLocation, 5))
    {
      v6 = self->_startItem;
    }
    else
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x3032000000;
      v16 = sub_1003128A8;
      v17 = sub_1003128B8;
      v18 = 0;
      endLocations = self->_endLocations;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1003137E4;
      v9[3] = &unk_1011B1690;
      v11 = self;
      v12 = &v13;
      v10 = v5;
      -[NSArray enumerateObjectsUsingBlock:](endLocations, "enumerateObjectsUsingBlock:", v9);
      v6 = (RouteStartEndItem *)(id)v14[5];

      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SearchResult)startLocation
{
  return self->_startLocation;
}

- (NSArray)endLocations
{
  return self->_endLocations;
}

- (unint64_t)visibilityMask
{
  return self->_visibilityMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endLocations, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_endItems, 0);
  objc_storeStrong((id *)&self->_startItem, 0);
}

@end

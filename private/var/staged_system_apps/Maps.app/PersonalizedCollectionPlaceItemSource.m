@implementation PersonalizedCollectionPlaceItemSource

- (PersonalizedCollectionPlaceItemSource)init
{
  PersonalizedCollectionPlaceItemSource *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *updateQueue;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *lockQueue;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *placesQueryQueue;
  NSObject *v15;
  PersonalizedCollectionPlaceItemSource *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  PersonalizedCollectionPlaceItemSource *v22;
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PersonalizedCollectionPlaceItemSource;
  v2 = -[PersonalizedCollectionPlaceItemSource init](&v25, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("PersonalizedCollectionPlaceItemSource", v4);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("PersonalizedCollectionPlaceItem.lock", v8);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("PersonalizedCollectionPlaceItemSource.placesQuery", v12);
    placesQueryQueue = v2->_placesQueryQueue;
    v2->_placesQueryQueue = (OS_dispatch_queue *)v13;

    objc_initWeak(&location, v2);
    v15 = v2->_placesQueryQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002618F0;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v23, &location);
    v16 = v2;
    v22 = v16;
    dispatch_async(v15, block);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v17, "registerDefaults:", &off_101274480);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    byte_1014D1E58 = objc_msgSend(v18, "BOOLForKey:", CFSTR("__personalizedMapsShowFavorites"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v16, "userDefaultsDidChange:", NSUserDefaultsDidChangeNotification, 0);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)userDefaultsDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  NSObject *updateQueue;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("__personalizedMapsShowFavorites"));

  if (byte_1014D1E58 != v5)
  {
    updateQueue = self->_updateQueue;
    byte_1014D1E58 = v5;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100261AD0;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async(updateQueue, block);
  }
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
  v9 = sub_100261B94;
  v10 = sub_100261BA4;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100261BAC;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_reloadCollectionPlaceItems
{
  NSArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  PersonalizedCollectionPlaceItem *v17;
  NSObject *lockQueue;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD block[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _BYTE v32[128];

  if (byte_1014D1E58)
  {
    v3 = self->_queryContents;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](v3, "count")));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = v3;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "updatedMapItemStorage"));
          v11 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v10, 0);
          v12 = v11;
          if (v11)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_styleAttributes"));
            v14 = objc_msgSend(v13, "isLabelPOI");

            if ((v14 & 1) == 0)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "customName"));

              if (v15)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "customName"));
                objc_msgSend(v12, "setName:", v16);
              }
              else
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
              }
              v17 = -[PersonalizedCollectionPlaceItem initWithMapItem:title:libraryBadgeType:]([PersonalizedCollectionPlaceItem alloc], "initWithMapItem:title:libraryBadgeType:", v12, v16, -[PersonalizedCollectionPlaceItemSource _libraryBadgeTypeFromPlaceItem:](self, "_libraryBadgeTypeFromPlaceItem:", v9));
              objc_msgSend(v21, "addObject:", v17);

            }
          }

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v6);
    }

    lockQueue = self->_lockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100261F44;
    block[3] = &unk_1011AC8B0;
    block[4] = self;
    v25 = v21;
    v19 = v21;
    dispatch_sync(lockQueue, block);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100261F7C;
    v23[3] = &unk_1011AC860;
    v23[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);

  }
  else
  {
    v20 = self->_lockQueue;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100261F1C;
    v31[3] = &unk_1011AC860;
    v31[4] = self;
    dispatch_sync(v20, v31);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100261F3C;
    v30[3] = &unk_1011AC860;
    v30[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
  }
}

- (unint64_t)_libraryBadgeTypeFromPlaceItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;

  v3 = a3;
  if ((objc_msgSend(v3, "type") & 1) != 0)
  {
    v6 = 4;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchCollections"));
    v5 = objc_msgSend(v4, "count");

    if (v5)
      v6 = 5;
    else
      v6 = 6;
  }

  return v6;
}

- (void)storeDidChangeWithTypes:(id)a3
{
  NSObject *placesQueryQueue;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  placesQueryQueue = self->_placesQueryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100262090;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(placesQueryQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_placesQueryQueue, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_queryContents, 0);
}

@end

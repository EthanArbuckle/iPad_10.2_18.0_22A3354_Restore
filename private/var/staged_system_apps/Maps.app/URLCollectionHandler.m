@implementation URLCollectionHandler

- (URLCollectionHandler)initWithStorage:(id)a3 collectionOperation:(id)a4
{
  id v7;
  id v8;
  URLCollectionHandler *v9;
  URLCollectionHandler *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)URLCollectionHandler;
  v9 = -[CollectionHandler init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    -[CollectionHandler setCollectionOperation:](v9, "setCollectionOperation:", v8);
    objc_storeStrong((id *)&v10->_collectionStorage, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    v10->_isRefining = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    if (objc_msgSend(v14, "isAuthorizedForPreciseLocation"))
      v15 = 1;
    else
      v15 = 2;
    -[CollectionHandler setSortType:](v10, "setSortType:", v15);

    -[URLCollectionHandler _resolvePlaces](v10, "_resolvePlaces");
  }

  return v10;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)title
{
  return -[GEOURLCollectionStorage name](self->_collectionStorage, "name");
}

- (void)_resolvePlaces
{
  MKCollectionStorageRefiner *v3;
  MKCollectionStorageRefiner *storageRefiner;
  MKCollectionStorageRefiner *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id location;

  if (!self->_isRefining)
  {
    self->_isRefining = 1;
    v3 = (MKCollectionStorageRefiner *)objc_msgSend(objc_alloc((Class)MKCollectionStorageRefiner), "initWithCollectionStorage:", self->_collectionStorage);
    storageRefiner = self->_storageRefiner;
    self->_storageRefiner = v3;

    objc_initWeak(&location, self);
    v5 = self->_storageRefiner;
    objc_copyWeak(&v9, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collectionOperation](self, "collectionOperation", _NSConcreteStackBlock, 3221225472, sub_1002CE698, &unk_1011B0238));
    v7 = objc_msgSend(v6, "newTraits");
    -[MKCollectionStorageRefiner fetchMapItems:traits:](v5, "fetchMapItems:traits:", &v8, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (BOOL)loadingData
{
  return self->_isRefining;
}

- (void)rebuildContent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSArray *v23;
  NSArray *unsavedContent;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v10);
        if (v11)
        {
          v12 = objc_alloc((Class)MSCollectionPlaceItem);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
          v14 = objc_msgSend(v12, "initWithCollection:", v13);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          objc_msgSend(v14, "setCustomName:", v15);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v16));
          objc_msgSend(v14, "setMapItemStorage:", v17);

          objc_msgSend(v25, "addObject:", v14);
        }
        objc_msgSend(v5, "addObject:", v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler collection](self, "collection"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[URLCollectionHandler title](self, "title"));
  objc_msgSend(v18, "setTitle:", v19);

  v20 = objc_msgSend(v5, "copy");
  -[CollectionHandler setContent:](self, "setContent:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self, "content"));
  v22 = objc_msgSend(v21, "copy");
  -[CollectionHandler setOriginalContent:](self, "setOriginalContent:", v22);

  v23 = (NSArray *)objc_msgSend(v25, "copy");
  unsavedContent = self->_unsavedContent;
  self->_unsavedContent = v23;

  -[CollectionHandler updateSorting](self, "updateSorting");
  -[CollectionHandler loadImage](self, "loadImage");

}

- (void)createCollection:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002CEA80;
  v7[3] = &unk_1011B0260;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)URLCollectionHandler;
  -[CollectionHandler createCollection:](&v6, "createCollection:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (int64_t)handlerType
{
  return 3;
}

- (int64_t)contentType
{
  return 1;
}

- (int)showAction
{
  return 2067;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsavedContent, 0);
  objc_storeStrong((id *)&self->_storageRefiner, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_collectionStorage, 0);
}

@end

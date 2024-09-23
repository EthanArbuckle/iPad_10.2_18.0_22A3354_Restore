@implementation FMFFavoritesManager

- (id)favoritesHandlesInHandles:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("favoriteOrder != nil")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredSetUsingPredicate:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("favoriteOrder"), 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7));

  return v8;
}

- (void)updateHandlesWithFavorites:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  FMFFavoritesManager *v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager updateHandlesWithFavorites: (%ld)", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesManager favoritesHandlesUpdateQueue](self, "favoritesHandlesUpdateQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000079A4;
  v9[3] = &unk_100099348;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)setFavoriteHandles:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteHandles, a3);
}

- (OS_dispatch_queue)favoritesHandlesUpdateQueue
{
  return self->_favoritesHandlesUpdateQueue;
}

- (NSArray)favoritesData
{
  return self->_favoritesData;
}

- (FMFFavoritesManager)init
{
  FMFFavoritesManager *v2;
  NSArray *v3;
  NSArray *favoritesData;
  NSArray *v5;
  NSArray *favoriteHandles;
  dispatch_queue_t v7;
  OS_dispatch_queue *favoritesHandlesUpdateQueue;
  id v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMFFavoritesManager;
  v2 = -[FMFFavoritesManager init](&v13, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSArray);
    favoritesData = v2->_favoritesData;
    v2->_favoritesData = v3;

    v5 = objc_opt_new(NSArray);
    favoriteHandles = v2->_favoriteHandles;
    v2->_favoriteHandles = v5;

    v7 = dispatch_queue_create("com.apple.icloud.fmfd.favoritemanager.favoriteshandlesupdatequeue", 0);
    favoritesHandlesUpdateQueue = v2->_favoritesHandlesUpdateQueue;
    v2->_favoritesHandlesUpdateQueue = (OS_dispatch_queue *)v7;

    v9 = sub_100011D0C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager: initialized", v12, 2u);
    }

  }
  return v2;
}

- (void)reset
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesManager favoritesHandlesUpdateQueue](self, "favoritesHandlesUpdateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F584;
  block[3] = &unk_1000993C8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)addFavorite:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager: addFavoriteHandle: %@", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesManager favoritesHandlesUpdateQueue](self, "favoritesHandlesUpdateQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004F6DC;
  v9[3] = &unk_100099348;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

- (void)removeFavorite:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager: removeFavoriteHandle: %@", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesManager favoritesHandlesUpdateQueue](self, "favoritesHandlesUpdateQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004F938;
  v9[3] = &unk_100099348;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

- (void)updateHandles:(id)a3 withFavoriteArray:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    *(_DWORD *)buf = 134218240;
    v18 = objc_msgSend(v10, "count");
    v19 = 2048;
    v20 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFFavoritesManager: updateHandles: (%ld) withFavorites: (%ld)", buf, 0x16u);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesManager favoritesHandlesUpdateQueue](self, "favoritesHandlesUpdateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FC74;
  block[3] = &unk_10009A798;
  block[4] = self;
  v15 = v7;
  v16 = v6;
  v12 = v6;
  v13 = v7;
  dispatch_async(v11, block);

}

- (void)updateWithCachedHandles:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2048;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer updateWithCachedHandles: %@ (%ld)", buf, 0x16u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesManager favoritesHandlesUpdateQueue](self, "favoritesHandlesUpdateQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004FDC8;
  v9[3] = &unk_100099348;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

- (NSArray)favorites
{
  NSObject *v3;
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
  v10 = sub_10004FFA0;
  v11 = sub_10004FFB0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesManager favoritesHandlesUpdateQueue](self, "favoritesHandlesUpdateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004FFB8;
  v6[3] = &unk_100099E58;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)favoritesDataFromHandles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "favoriteOrder"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, CFSTR("id"), v11, CFSTR("order"), 0));

        objc_msgSend(v4, "addObject:", v12);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)handles:(id)a3 minusHandle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serverId", (_QWORD)v18));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverId"));
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)setFavoritesData:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesData, a3);
}

- (NSArray)favoriteHandles
{
  return self->_favoriteHandles;
}

- (void)setFavoritesHandlesUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesHandlesUpdateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesHandlesUpdateQueue, 0);
  objc_storeStrong((id *)&self->_favoriteHandles, 0);
  objc_storeStrong((id *)&self->_favoritesData, 0);
}

@end

@implementation FMFFavoritesSequencer

- (void)updateHandlesWithFavorites:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer favoritesManager](self, "favoritesManager"));
  objc_msgSend(v5, "updateHandlesWithFavorites:", v4);

}

- (FMFFavoritesManager)favoritesManager
{
  return self->_favoritesManager;
}

- (FMFFavoritesSequencer)init
{
  FMFFavoritesSequencer *v2;
  FMFFavoritesManager *v3;
  FMFFavoritesManager *favoritesManager;
  NSMutableArray *v5;
  NSMutableArray *saveFavoritesOperation;
  dispatch_queue_t v7;
  OS_dispatch_queue *saveFavoritesOperationUpdateQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *saveFavoritesOperationExecutionQueue;
  id v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FMFFavoritesSequencer;
  v2 = -[FMFFavoritesSequencer init](&v15, "init");
  if (v2)
  {
    v3 = objc_opt_new(FMFFavoritesManager);
    favoritesManager = v2->_favoritesManager;
    v2->_favoritesManager = v3;

    v5 = objc_opt_new(NSMutableArray);
    saveFavoritesOperation = v2->_saveFavoritesOperation;
    v2->_saveFavoritesOperation = v5;

    v7 = dispatch_queue_create("com.apple.icloud.fmfd.favoritesequencer.favoriteOperationUpdateQueue", 0);
    saveFavoritesOperationUpdateQueue = v2->_saveFavoritesOperationUpdateQueue;
    v2->_saveFavoritesOperationUpdateQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.icloud.fmfd.favoritesequencer.favoriteOperationExecutionQueue", 0);
    saveFavoritesOperationExecutionQueue = v2->_saveFavoritesOperationExecutionQueue;
    v2->_saveFavoritesOperationExecutionQueue = (OS_dispatch_queue *)v9;

    v11 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: initialized", v14, 2u);
    }

  }
  return v2;
}

- (void)reset
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer saveFavoritesOperationUpdateQueue](self, "saveFavoritesOperationUpdateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038BE8;
  block[3] = &unk_1000993C8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)addFavorite:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100011D0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: addFavoriteHandle: %@", buf, 0xCu);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer saveFavoritesOperationUpdateQueue](self, "saveFavoritesOperationUpdateQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100038DA4;
  v17[3] = &unk_10009A6B0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)removeFavorite:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100011D0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: removeFavoriteHandle: %@", buf, 0xCu);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer saveFavoritesOperationUpdateQueue](self, "saveFavoritesOperationUpdateQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100038FBC;
  v17[3] = &unk_10009A6B0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)executeNextOperation
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer saveFavoritesOperationExecutionQueue](self, "saveFavoritesOperationExecutionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000390E0;
  block[3] = &unk_1000993C8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)updateHandles:(id)a3 withFavoriteArray:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v14 = 134218240;
    v15 = objc_msgSend(v10, "count");
    v16 = 2048;
    v17 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: updateHandles: (%ld) withFavorites: (%ld)", (uint8_t *)&v14, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer currentOperation](self, "currentOperation"));

  if (v11)
  {
    v12 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer: skipping unmarshaller updates because an operation is in flight", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer favoritesManager](self, "favoritesManager"));
    -[NSObject updateHandles:withFavoriteArray:](v13, "updateHandles:withFavoriteArray:", v6, v7);
  }

}

- (void)updateWithCachedHandles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer favoritesManager](self, "favoritesManager"));
  objc_msgSend(v5, "updateWithCachedHandles:", v4);

}

- (NSArray)favorites
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFavoritesSequencer favoritesManager](self, "favoritesManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "favorites"));

  return (NSArray *)v3;
}

- (void)setFavoritesManager:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesManager, a3);
}

- (FMFSaveFavoritesOperations)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentOperation, a3);
}

- (NSMutableArray)saveFavoritesOperation
{
  return self->_saveFavoritesOperation;
}

- (void)setSaveFavoritesOperation:(id)a3
{
  objc_storeStrong((id *)&self->_saveFavoritesOperation, a3);
}

- (OS_dispatch_queue)saveFavoritesOperationUpdateQueue
{
  return self->_saveFavoritesOperationUpdateQueue;
}

- (void)setSaveFavoritesOperationUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_saveFavoritesOperationUpdateQueue, a3);
}

- (OS_dispatch_queue)saveFavoritesOperationExecutionQueue
{
  return self->_saveFavoritesOperationExecutionQueue;
}

- (void)setSaveFavoritesOperationExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_saveFavoritesOperationExecutionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveFavoritesOperationExecutionQueue, 0);
  objc_storeStrong((id *)&self->_saveFavoritesOperationUpdateQueue, 0);
  objc_storeStrong((id *)&self->_saveFavoritesOperation, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
}

@end

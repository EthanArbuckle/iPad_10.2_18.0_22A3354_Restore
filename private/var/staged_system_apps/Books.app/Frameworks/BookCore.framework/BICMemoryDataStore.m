@implementation BICMemoryDataStore

- (BICMemoryDataStore)initWithCachePath:(id)a3
{
  BICMemoryDataStore *v3;
  BICMemoryDataStore *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BICMemoryDataStore;
  v3 = -[BICMemoryDataStore init](&v7, "init", a3);
  v4 = v3;
  if (v3)
  {
    v3->_accessLock._os_unfair_lock_opaque = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[BICMemoryDataStore setImageSetStorage:](v4, "setImageSetStorage:", v5);

  }
  return v4;
}

- (signed)storingMedium
{
  return 0;
}

- (BOOL)canStoreDescribedImage:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "image"));
  v4 = v3 != 0;

  return v4;
}

- (void)storeImage:(id)a3 forRequest:(id)a4 forEntryLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_accessLock;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  BICMemoryDataStore *v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  p_accessLock = &self->_accessLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_40994;
  v17 = &unk_28D368;
  v18 = self;
  v12 = v8;
  v19 = v12;
  v13 = v10;
  v20 = v13;
  v21 = v22;
  v14 = v15;
  os_unfair_lock_lock(p_accessLock);
  v16((uint64_t)v14);
  os_unfair_lock_unlock(p_accessLock);

  _Block_object_dispose(v22, 8);
}

- (void)deleteImageForEntryLocation:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_40B94;
  v5[3] = &unk_28B808;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_40B94((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

}

- (void)markAsOldImageForEntryLocation:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_40DA8;
  v5[3] = &unk_28B808;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_40DA8((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

}

- (void)storeAddedEntries:(id)a3 forRequest:(id)a4 storingCompletedHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(id, id, void *);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v8 = a3;
  v9 = a4;
  v21 = (void (**)(id, id, void *))a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "entryLocation"));
        if (v15)
        {
          v16 = (void *)v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageDescription"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "image"));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageDescription"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "entryLocation"));
            -[BICMemoryDataStore storeImage:forRequest:forEntryLocation:](self, "storeImage:forRequest:forEntryLocation:", v19, v9, v20);

          }
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }
  v21[2](v21, v8, &__NSArray0__struct);

}

- (void)deleteRemovedEntries:(id)a3 deletingCompletedHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entryLocation"));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entryLocation"));
          -[BICMemoryDataStore deleteImageForEntryLocation:](self, "deleteImageForEntryLocation:", v14);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  v7[2](v7, v6);

}

- (id)imageForEntryLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void ***v8;
  id v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  BICMemoryDataStore *v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("|")));
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_41354;
  v23 = sub_41364;
  v24 = 0;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_4136C;
  v14 = &unk_28D390;
  v15 = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v16 = v6;
  v18 = &v19;
  v7 = v4;
  v17 = v7;
  v8 = &v11;
  os_unfair_lock_lock(&self->_accessLock);
  v13((uint64_t)v8);
  os_unfair_lock_unlock(&self->_accessLock);

  if (v20[5])
    +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterL1Hit[0], v11, v12);
  else
    -[BICMemoryDataStore deleteImageForEntryLocation:](self, "deleteImageForEntryLocation:", v7, v11, v12);
  v9 = objc_msgSend((id)v20[5], "copy");

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)afterAllStoreOperationsCompletedPerformBlock:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)fetchImagesForEntry:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entryLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryDataStore imageForEntryLocation:](self, "imageForEntryLocation:", v9));

  v11 = objc_msgSend(v8, "quality");
  objc_msgSend(v10, "setQuality:", v11);
  +[BICCacheStats logDescribedImage:withComment:](BICCacheStats, "logDescribedImage:withComment:", v10, CFSTR("MemoryDataStoreLoadImage"));
  v12 = (void (**)(id, void *))objc_retainBlock(v7);

  if (v12)
  {
    if (v10)
    {
      v14 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      v12[2](v12, v13);

    }
    else
    {
      v12[2](v12, 0);
    }
  }

}

- (int64_t)costFor:(signed __int16)a3
{
  int64_t v3;
  os_unfair_lock_s *p_accessLock;
  _QWORD *v5;
  _QWORD v7[2];
  id (*v8)(uint64_t);
  void *v9;
  BICMemoryDataStore *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (!a3)
  {
    p_accessLock = &self->_accessLock;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v8 = sub_41648;
    v9 = &unk_28B700;
    v10 = self;
    v11 = &v12;
    v5 = v7;
    os_unfair_lock_lock(p_accessLock);
    v8((uint64_t)v5);
    os_unfair_lock_unlock(p_accessLock);

    v3 = v13[3];
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  _BYTE v29[128];

  v5 = a4;
  v22 = a3;
  v21 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_418C8;
  v27[3] = &unk_28B808;
  v27[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = v8;
  os_unfair_lock_lock(&self->_accessLock);
  sub_418C8((uint64_t)v27);
  os_unfair_lock_unlock(&self->_accessLock);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BICMemoryDataStore imageForEntryLocation:](self, "imageForEntryLocation:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i)));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          if (v5)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-Level:%d"), v17, v22));
            objc_msgSend(v14, "setIdentifier:", v18);

          }
          objc_msgSend(v7, "addObject:", v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v11);
  }

  v19 = objc_retainBlock(v21);
  v20 = v19;
  if (v19)
    (*((void (**)(id, void *))v19 + 2))(v19, v7);

}

- (void)_clean:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  void (**v5)(_QWORD);
  _QWORD v6[5];

  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_41A8C;
  v6[3] = &unk_28B960;
  v6[4] = self;
  v4 = a3;
  os_unfair_lock_lock(p_accessLock);
  sub_41A8C((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);
  v5 = (void (**)(_QWORD))objc_retainBlock(v4);

  if (v5)
    v5[2](v5);

}

- (id)_imageSetIDFromImageEntryLocation:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (BICDataStoringDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->delegate, a3);
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)totalStoredCost
{
  return self->_totalStoredCost;
}

- (void)setTotalStoredCost:(int64_t)a3
{
  self->_totalStoredCost = a3;
}

- (NSMutableDictionary)imageSetStorage
{
  return self->_imageSetStorage;
}

- (void)setImageSetStorage:(id)a3
{
  objc_storeStrong((id *)&self->_imageSetStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSetStorage, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

@end

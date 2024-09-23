@implementation BICImageSetStore

- (BICImageSetStore)initWithLevelID:(signed __int16)a3 comparator:(id)a4 dataStore:(id)a5
{
  id v9;
  id v10;
  BICImageSetStore *v11;
  BICImageSetStore *v12;
  uint64_t v13;
  NSMutableSet *imagesInCacheSinceLaunch;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BICImageSetStore;
  v11 = -[BICImageSetStore init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    v11->_accessLock._os_unfair_lock_opaque = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    imagesInCacheSinceLaunch = v12->_imagesInCacheSinceLaunch;
    v12->_imagesInCacheSinceLaunch = (NSMutableSet *)v13;

    v12->_levelID = a3;
    objc_storeStrong((id *)&v12->_comparator, a4);
    objc_storeStrong((id *)&v12->_dataStore, a5);
  }

  return v12;
}

- (id)imageMatchingDescription:(id)a3 forRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned int v11;
  __CFString **v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore _imageEntryLocationMatchingDescription:](self, "_imageEntryLocationMatchingDescription:", a3));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageForEntryLocation:", v7));

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v6, "requestOptions");
  v11 = objc_msgSend(v9, "quality");
  if ((v10 & 0x80) != 0 && v11 == 101 || (v10 & 0x30) == 0 && v11 == 3)
  {

    +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationIgnoringLowQualityImageEntry[0], v6);
    v9 = 0;
  }
  v12 = BICCacheStatsOperationSyncFetchExactSuccess;
  if (!v9)
    v12 = BICCacheStatsOperationSyncFetchExactFail;
  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", *v12, v6);
  +[BICCacheStats logDescribedImage:withComment:](BICCacheStats, "logDescribedImage:withComment:", v9, CFSTR("ImageSetStoreLoadMatchedImage"));

  return v9;
}

- (void)incrementVersionForIdentifiers:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  _QWORD v6[4];
  id v7;
  BICImageSetStore *v8;

  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_62874;
  v6[3] = &unk_28B808;
  v7 = a3;
  v8 = self;
  v5 = v7;
  os_unfair_lock_lock(p_accessLock);
  sub_62874((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);

}

- (BOOL)supportsImageSets
{
  return 0;
}

- (void)withImageSetForDescribedImage:(id)a3 performBlock:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)getSortedBestMatchOf:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_accessLock;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  BICImageSetStore *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_62C84;
  v25 = sub_62C94;
  v26 = 0;
  if (objc_msgSend(v8, "length"))
  {
    p_accessLock = &self->_accessLock;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v15 = sub_62C9C;
    v16 = &unk_28D390;
    v17 = self;
    v18 = v8;
    v20 = &v21;
    v19 = v6;
    v10 = v14;
    os_unfair_lock_lock(p_accessLock);
    v15((uint64_t)v10);
    os_unfair_lock_unlock(p_accessLock);

  }
  else
  {
    v11 = (void *)v22[5];
    v22[5] = (uint64_t)&__NSArray0__struct;

  }
  v12 = objc_retainBlock(v7);
  v13 = v12;
  if (v12)
    (*((void (**)(id, uint64_t))v12 + 2))(v12, v22[5]);

  _Block_object_dispose(&v21, 8);
}

- (void)getPrimaryImageForRequest:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (id)fetchEntryFromImageSet:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5
{
  return 0;
}

- (void)fetchImagesFromImageEntry:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5 completion:(id)a6
{
  id v6;
  id v7;

  v6 = objc_retainBlock(a6);
  if (v6)
  {
    v7 = v6;
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v6 = v7;
  }

}

- (void)addDescribedImages:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  os_unfair_lock_t lock;
  id v28;
  _QWORD v29[2];
  void (*v30)(uint64_t);
  void *v31;
  BICImageSetStore *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v8 = a3;
  v28 = a4;
  v9 = a5;
  v10 = v8;
  v26 = v9;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    lock = &self->_accessLock;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
        v17 = objc_msgSend(v16, "canStoreDescribedImage:", v15);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entryLocationForLevelID:", -[BICImageSetStore levelID](self, "levelID")));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageForEntryLocation:", v18));

          LODWORD(v19) = objc_msgSend(v15, "quality");
          if (v19 > objc_msgSend(v20, "quality"))
          {
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v30 = sub_630F8;
            v31 = &unk_28B808;
            v32 = self;
            v21 = v18;
            v33 = v21;
            os_unfair_lock_lock(lock);
            v30((uint64_t)v29);
            os_unfair_lock_unlock(lock);
            v22 = v10;
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
            objc_msgSend(v23, "storeImage:forRequest:forEntryLocation:", v15, v28, v21);

            v10 = v22;
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }
  v24 = objc_retainBlock(v26);
  v25 = v24;
  if (v24)
    (*((void (**)(id))v24 + 2))(v24);

}

- (void)removeDescribedImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  void (*v21)(uint64_t);
  void *v22;
  BICImageSetStore *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v19 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
        v13 = objc_msgSend(v12, "canStoreDescribedImage:", v11);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entryLocationForLevelID:", -[BICImageSetStore levelID](self, "levelID")));
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v21 = sub_6332C;
          v22 = &unk_28B808;
          v23 = self;
          v24 = v14;
          v15 = v14;
          os_unfair_lock_lock(&self->_accessLock);
          v21((uint64_t)v20);
          os_unfair_lock_unlock(&self->_accessLock);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
          objc_msgSend(v16, "deleteImageForEntryLocation:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }
  v17 = objc_retainBlock(v19);
  v18 = v17;
  if (v17)
    (*((void (**)(id, id))v17 + 2))(v17, v6);

}

- (void)incrementVersionForIdentifier:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:"));
    -[BICImageSetStore incrementVersionForIdentifiers:](self, "incrementVersionForIdentifiers:", v4);

  }
}

- (id)_imageEntryLocationMatchingDescription:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessLock;
  id v6;
  _QWORD *v7;
  id *v8;
  _QWORD *v9;
  id v10;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  BICImageSetStore *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  void (*v18)(uint64_t);
  void *v19;
  BICImageSetStore *v20;
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_62C84;
  v28 = sub_62C94;
  v29 = 0;
  p_accessLock = &self->_accessLock;
  if ((objc_msgSend(v4, "requestOptions") & 0x30) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v18 = sub_635A4;
    v19 = &unk_28D368;
    v20 = self;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v21 = v6;
    v22 = v4;
    v23 = &v24;
    v7 = v17;
    os_unfair_lock_lock(p_accessLock);
    v18((uint64_t)v7);
    v8 = &v21;
    os_unfair_lock_unlock(p_accessLock);

    v9 = v22;
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v13 = sub_63700;
    v14 = &unk_28C430;
    v15 = self;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryLocationForLevelID:", -[BICImageSetStore levelID](self, "levelID")));
    v16[0] = v6;
    v16[1] = &v24;
    v9 = v12;
    os_unfair_lock_lock(p_accessLock);
    v13((uint64_t)v9);
    v8 = (id *)v16;
    os_unfair_lock_unlock(p_accessLock);
  }

  v10 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (void)gatherPrunableItemsForMedium:(signed __int16)a3 level:(signed __int16)a4 withCompletion:(id)a5
{
  void *v5;
  unsigned int v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id obj;
  void *v24;
  unsigned int v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  void (*v32)(uint64_t);
  void *v33;
  BICImageSetStore *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];

  v25 = a3;
  v22 = a5;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
  v6 = objc_msgSend(v5, "storingMedium");

  if (v6 == v25)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = sub_62C84;
    v40 = sub_62C94;
    v41 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v32 = sub_63A98;
    v33 = &unk_28B700;
    v34 = self;
    v35 = &v36;
    v7 = v31;
    os_unfair_lock_lock(&self->_accessLock);
    v32((uint64_t)v7);
    os_unfair_lock_unlock(&self->_accessLock);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)v37[5];
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageForEntryLocation:", v11));

          v14 = objc_msgSend(v13, "costFor:", v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastUsed"));
          objc_msgSend(v13, "imageSize");
          v18 = +[BICPruneableItem pruneScoreFrom:lastUsedDate:oldVersion:expired:processed:](BICPruneableItem, "pruneScoreFrom:lastUsedDate:oldVersion:expired:processed:", v15, objc_msgSend(v13, "isOldVersion"), 0, objc_msgSend(v13, "processingOptions") != 0, v16, v17);
          if ((v18 & 0x8000000000000000) == 0)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[BICPruneableItem pruneableItemFromEntryLocation:cost:pruneScore:](BICPruneableItem, "pruneableItemFromEntryLocation:cost:pruneScore:", v11, v14, v18));
            objc_msgSend(v24, "addObject:", v19);

          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
      }
      while (v8);
    }

    _Block_object_dispose(&v36, 8);
  }
  v20 = objc_retainBlock(v22);
  v21 = v20;
  if (v20)
    (*((void (**)(id, void *))v20 + 2))(v20, v24);

}

- (void)gatherPrunableItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4 level:(signed __int16)a5 withCompletion:(id)a6
{
  void *v7;
  unsigned int v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id obj;
  void *v27;
  unsigned int v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  void (*v35)(uint64_t);
  void *v36;
  BICImageSetStore *v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];

  v28 = a4;
  v24 = a3;
  v25 = a6;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
  v8 = objc_msgSend(v7, "storingMedium");

  if (v8 == v28)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = sub_62C84;
    v44 = sub_62C94;
    v45 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v35 = sub_63E48;
    v36 = &unk_28B7E0;
    v39 = &v40;
    v37 = self;
    v38 = v24;
    v9 = v34;
    os_unfair_lock_lock(&self->_accessLock);
    v35((uint64_t)v9);
    os_unfair_lock_unlock(&self->_accessLock);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)v41[5];
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v31;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore", v24));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageForEntryLocation:", v13));

          v16 = objc_msgSend(v15, "costFor:", v28);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastUsed"));
          objc_msgSend(v15, "imageSize");
          v20 = +[BICPruneableItem pruneScoreFrom:lastUsedDate:oldVersion:expired:processed:](BICPruneableItem, "pruneScoreFrom:lastUsedDate:oldVersion:expired:processed:", v17, objc_msgSend(v15, "isOldVersion"), 0, objc_msgSend(v15, "processingOptions") != 0, v18, v19);
          if ((v20 & 0x8000000000000000) == 0)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[BICPruneableItem pruneableItemFromEntryLocation:cost:pruneScore:](BICPruneableItem, "pruneableItemFromEntryLocation:cost:pruneScore:", v13, v16, v20));
            objc_msgSend(v27, "addObject:", v21);

          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
      }
      while (v10);
    }

    _Block_object_dispose(&v40, 8);
  }
  v22 = objc_retainBlock(v25);
  v23 = v22;
  if (v22)
    (*((void (**)(id, void *))v22 + 2))(v22, v27);

}

- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 withCompletion:(id)a5
{
  int v6;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id obj;
  _QWORD v22[2];
  void (*v23)(uint64_t);
  void *v24;
  BICImageSetStore *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
  v11 = objc_msgSend(v10, "storingMedium");

  if (v11 == v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "entryLocation"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
          objc_msgSend(v17, "deleteImageForEntryLocation:", v16);

          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v23 = sub_640D0;
          v24 = &unk_28B808;
          v25 = self;
          v26 = v16;
          v18 = v16;
          os_unfair_lock_lock(&self->_accessLock);
          v23((uint64_t)v22);
          os_unfair_lock_unlock(&self->_accessLock);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

  }
  v19 = objc_retainBlock(v9);
  v20 = v19;
  if (v19)
    (*((void (**)(id, _QWORD))v19 + 2))(v19, 0);

}

- (int64_t)costFor:(signed __int16)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
  v5 = objc_msgSend(v4, "costFor:", v3);

  return (int64_t)v5;
}

- (signed)storingMedium
{
  void *v2;
  signed __int16 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
  v3 = (unsigned __int16)objc_msgSend(v2, "storingMedium");

  return v3;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_64228;
  v11[3] = &unk_28DEF0;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "_inventoryLevel:addLevelID:completion:", v6, v5, v11);

}

- (void)_clean:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStore dataStore](self, "dataStore"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6430C;
  v7[3] = &unk_28BF90;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_clean:", v7);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BICDescribedImageComparing)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_storeStrong((id *)&self->_comparator, a3);
}

- (BICDataStoring)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (signed)levelID
{
  return self->_levelID;
}

- (void)setLevelID:(signed __int16)a3
{
  self->_levelID = a3;
}

- (NSMutableSet)imagesInCacheSinceLaunch
{
  return self->_imagesInCacheSinceLaunch;
}

- (void)setImagesInCacheSinceLaunch:(id)a3
{
  objc_storeStrong((id *)&self->_imagesInCacheSinceLaunch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesInCacheSinceLaunch, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_comparator, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

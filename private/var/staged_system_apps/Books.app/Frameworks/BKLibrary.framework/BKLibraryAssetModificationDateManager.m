@implementation BKLibraryAssetModificationDateManager

- (BKLibraryAssetModificationDateManager)initWithLibraryManager:(id)a3 annotationProvider:(id)a4
{
  id v7;
  id v8;
  BKLibraryAssetModificationDateManager *v9;
  BKLibraryAssetModificationDateManager *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[BKLibraryAssetModificationDateManager init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryManager, a3);
    objc_storeStrong((id *)&v10->_annotationProvider, a4);
  }

  return v10;
}

- (void)resetModificationDateForAssetIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "count"))
  {
    v10 = objc_retainBlock(v7);
    v11 = v10;
    if (v10)
      (*((void (**)(id))v10 + 2))(v10);

  }
  else
  {
    global_queue = dispatch_get_global_queue(-2, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_526D0;
    block[3] = &unk_C21D0;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    dispatch_async(v9, block);

  }
}

- (id)libraryAssetForAssetIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v5 = a3;
  v6 = a4;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:](BKLibraryManager, "predicateForAssetIDsTaggedLibraryAssets:", v5));
  else
    v7 = 0;
  v25[0] = CFSTR("assetID");
  v25[1] = CFSTR("modificationDate");
  v25[2] = CFSTR("creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
  v19 = v6;
  v9 = objc_msgSend(v6, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:", v8, CFSTR("BKLibraryAsset"), v7, 0, 0);

  v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v9, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("assetID")));
        if (v17)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v10;
}

- (void)annotationsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_52B88;
  v13[4] = sub_52B98;
  v14 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetModificationDateManager annotationProvider](self, "annotationProvider"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_52BA0;
    v9[3] = &unk_C2E48;
    v10 = v6;
    v12 = v13;
    v11 = v7;
    objc_msgSend(v8, "performBlockOnUserSideQueue:", v9);

  }
  _Block_object_dispose(v13, 8);

}

- (id)updatesFromLibraryAssets:(id)a3 annotations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v21 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v19 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation maxModificationDateColumnName](AEAnnotation, "maxModificationDateColumnName"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("annotationAssetID"), v18));
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v12));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));
            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("modificationDate")));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("creationDate")));
              if (!v15
                || objc_msgSend(v15, "compare:", v14) == (id)-1
                || objc_msgSend(v15, "isEqualToDate:", v16))
              {
                objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, v12);
              }

            }
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    v5 = v18;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)consumeUpdates:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v18 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager libraryAssetsWithAssetIDsContainedInList:tempAssetIDs:inManagedObjectContext:](BKLibraryManager, "libraryAssetsWithAssetIDsContainedInList:tempAssetIDs:inManagedObjectContext:", v7, 0, v6));

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13);
          if (objc_msgSend(v14, "isValid"))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetID"));
            if (v15)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v15));
              if (v16)
              {
                objc_msgSend(v14, "setDifferentObject:forKey:", v16, CFSTR("modificationDate"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "purchasedAndLocalParent"));
                objc_msgSend(v17, "setDifferentObject:forKey:", v16, CFSTR("modificationDate"));

              }
            }

          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v6 = v18;
    objc_msgSend(v18, "saveLibrary");

  }
}

- (BKLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (AEAnnotationProvider)annotationProvider
{
  return self->_annotationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_storeStrong((id *)&self->_libraryManager, 0);
}

@end

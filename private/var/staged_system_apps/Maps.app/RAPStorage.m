@implementation RAPStorage

+ (double)standardTimeToLive
{
  return GEOConfigGetDouble(MapsConfig_RAPDirectionsRecordStorageTTL, off_1014B4688);
}

- (RAPStorage)init
{
  RAPStorage *result;

  result = (RAPStorage *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)initByUsingOrCreatingStorageDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  RAPStorage *v7;
  void *v8;
  unsigned int v9;
  RAPStorage *v10;

  v6 = a3;
  v7 = -[RAPStorage initWithStorageDirectoryURL:](self, "initWithStorageDirectoryURL:", v6);
  if (!v7
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
        v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, a4), v8, v10 = 0, v9))
  {
    v10 = v7;
  }

  return v10;
}

- (RAPStorage)initWithStorageDirectoryURL:(id)a3
{
  return -[RAPStorage initWithStorageDirectoryURL:pathExtension:](self, "initWithStorageDirectoryURL:pathExtension:", a3, 0);
}

- (RAPStorage)initWithStorageDirectoryURL:(id)a3 pathExtension:(id)a4
{
  id v6;
  id v7;
  RAPStorage *v8;
  RAPStorage *v9;
  NSURL *v10;
  NSURL *directoryURL;
  NSString *v12;
  NSString *pathExtension;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPStorage;
  v8 = -[RAPStorage init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    v8->_itemTimeToLive = 1.79769313e308;
    v10 = (NSURL *)objc_msgSend(v6, "copy");
    directoryURL = v9->_directoryURL;
    v9->_directoryURL = v10;

    v12 = (NSString *)objc_msgSend(v7, "copy");
    pathExtension = v9->_pathExtension;
    v9->_pathExtension = v12;

  }
  return v9;
}

- (id)_itemURLForIdentifier:(id)a3
{
  NSURL *directoryURL;
  void *v5;
  void *v6;
  uint64_t v7;

  directoryURL = self->_directoryURL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](directoryURL, "URLByAppendingPathComponent:", v5));

  if (self->_pathExtension)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathExtension:"));

    v6 = (void *)v7;
  }
  return v6;
}

- (void)saveItemWithData:(id)a3 forIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  global_queue = dispatch_get_global_queue(-32768, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003D2504;
  v16[3] = &unk_1011B45F8;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (id)dataForItemWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[RAPStorage garbageCollectIfNeeded](self, "garbageCollectIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPStorage _itemURLForIdentifier:](self, "_itemURLForIdentifier:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v7, 1, a4));
  return v8;
}

- (BOOL)removeItemWithIdentifier:(id)a3 error:(id *)a4
{
  return -[RAPStorage _removeItemWithIdentifier:triggeringGarbageCollection:error:](self, "_removeItemWithIdentifier:triggeringGarbageCollection:error:", a3, 1, a4);
}

- (BOOL)_removeItemWithIdentifier:(id)a3 triggeringGarbageCollection:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a4;
  v8 = a3;
  if (v6)
    -[RAPStorage garbageCollectIfNeeded](self, "garbageCollectIfNeeded");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPStorage _itemURLForIdentifier:](self, "_itemURLForIdentifier:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = objc_msgSend(v10, "removeItemAtURL:error:", v9, a5);

  return v11;
}

- (void)_iterateAllItemIdentifiersUsingBlock:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003D28C8;
  v5[3] = &unk_1011B4620;
  v6 = a3;
  v4 = v6;
  -[RAPStorage _iterateAllItemIdentifiersIncludingURLPropertiesForKeys:usingBlock:](self, "_iterateAllItemIdentifiersIncludingURLPropertiesForKeys:usingBlock:", &__NSArray0__struct, v5);

}

- (void)_iterateAllItemIdentifiersIncludingURLPropertiesForKeys:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, _BYTE *);
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", self->_directoryURL, v6, 0, 0));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v10)
    goto LABEL_17;
  v11 = v10;
  v12 = *(_QWORD *)v23;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v23 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
      if (self->_pathExtension)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "pathExtension"));
        v16 = objc_msgSend(v15, "isEqual:", self->_pathExtension);

        if (!v16)
          continue;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByDeletingPathExtension"));

      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "lastPathComponent"));
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID _maps_UUIDWithUUIDString:](NSUUID, "_maps_UUIDWithUUIDString:", v18));
      if (v19)
      {
        v21 = 0;
        v7[2](v7, v19, v14, &v21);
        if (v21)
        {

          goto LABEL_17;
        }
      }

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
      continue;
    break;
  }
LABEL_17:

}

- (void)removeItemsPassingTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[RAPStorage garbageCollectIfNeeded](self, "garbageCollectIfNeeded");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003D2B58;
  v6[3] = &unk_1011B4648;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[RAPStorage _iterateAllItemIdentifiersUsingBlock:](self, "_iterateAllItemIdentifiersUsingBlock:", v6);

}

- (void)removeAllItems
{
  -[RAPStorage garbageCollectIfNeeded](self, "garbageCollectIfNeeded");
  -[RAPStorage removeItemsPassingTest:](self, "removeItemsPassingTest:", &stru_1011B4688);
}

- (NSArray)allItemIdentifiersByDescendingCreationDate
{
  return (NSArray *)-[RAPStorage _allItemIdentifiersByCreationDateSortedAscending:dates:](self, "_allItemIdentifiersByCreationDateSortedAscending:dates:", 0, 0);
}

- (id)_allItemIdentifiersByCreationDateSortedAscending:(BOOL)a3 dates:(id *)a4
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void *v25;
  NSURLResourceKey v26;

  v5 = a3;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v26 = NSURLCreationDateKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1003D2E04;
  v22[3] = &unk_1011B46B0;
  v10 = v7;
  v23 = v10;
  v11 = v8;
  v24 = v11;
  -[RAPStorage _iterateAllItemIdentifiersIncludingURLPropertiesForKeys:usingBlock:](self, "_iterateAllItemIdentifiersIncludingURLPropertiesForKeys:usingBlock:", v9, v22);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003D2E94;
  v20[3] = &unk_1011B46D8;
  v12 = v11;
  v21 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:](NSSortDescriptor, "sortDescriptorWithKey:ascending:comparator:", 0, v5, v20));
  v25 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  objc_msgSend(v10, "sortUsingDescriptors:", v14);

  if (a4)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1003D2F10;
    v18[3] = &unk_1011B4700;
    v19 = v12;
    v15 = sub_10039DCD4(v10, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v15);

  }
  v16 = v10;

  return v16;
}

- (BOOL)containsItems
{
  RAPStorage *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v2 = self;
  -[RAPStorage garbageCollectIfNeeded](self, "garbageCollectIfNeeded");
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003D2FC8;
  v4[3] = &unk_1011B4728;
  v4[4] = &v5;
  -[RAPStorage _iterateAllItemIdentifiersUsingBlock:](v2, "_iterateAllItemIdentifiersUsingBlock:", v4);
  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (id)creationDateForItemWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  id v13;

  v6 = a3;
  -[RAPStorage garbageCollectIfNeeded](self, "garbageCollectIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPStorage _itemURLForIdentifier:](self, "_itemURLForIdentifier:", v6));

  v13 = 0;
  v8 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v13, NSURLCreationDateKey, a4);
  v9 = v13;
  v10 = v9;
  v11 = 0;
  if (v8)
    v11 = v9;

  return v11;
}

- (void)garbageCollectIfNeeded
{
  double v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  -[RAPStorage itemTimeToLive](self, "itemTimeToLive");
  if (v3 != 1.79769313e308)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v3));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPStorage _allItemIdentifiersByCreationDateSortedAscending:dates:](self, "_allItemIdentifiersByCreationDateSortedAscending:dates:", 1, &v14));
    v6 = v14;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v5);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", (char *)i + v9));
          if (objc_msgSend(v13, "compare:", v4) == (id)-1)
            -[RAPStorage _removeItemWithIdentifier:triggeringGarbageCollection:error:](self, "_removeItemWithIdentifier:triggeringGarbageCollection:error:", v12, 0, 0);

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v9 += (uint64_t)i;
      }
      while (v8);
    }

  }
}

- (void)setItemTimeToLive:(double)a3
{
  if (self->_itemTimeToLive != a3)
  {
    self->_itemTimeToLive = a3;
    -[RAPStorage garbageCollectIfNeeded](self, "garbageCollectIfNeeded");
  }
}

- (double)itemTimeToLive
{
  return self->_itemTimeToLive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathExtension, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end

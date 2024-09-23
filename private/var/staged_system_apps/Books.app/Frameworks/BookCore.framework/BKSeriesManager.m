@implementation BKSeriesManager

+ (id)sharedManager
{
  if (qword_311610[0] != -1)
    dispatch_once(qword_311610, &stru_292BC8);
  return (id)qword_311608;
}

+ (id)itemFetchProperties
{
  _QWORD v3[29];

  v3[0] = CFSTR("adamId");
  v3[1] = CFSTR("author");
  v3[2] = CFSTR("authorCount");
  v3[3] = CFSTR("authorNames");
  v3[4] = CFSTR("coverAspectRatio");
  v3[5] = CFSTR("genre");
  v3[6] = CFSTR("genres");
  v3[7] = CFSTR("hasTooManyAuthors");
  v3[8] = CFSTR("hasTooManyNarrators");
  v3[9] = CFSTR("isAudiobook");
  v3[10] = CFSTR("isContainer");
  v3[11] = CFSTR("isExplicit");
  v3[12] = CFSTR("mappedItemId");
  v3[13] = CFSTR("mappedItemTypeRaw");
  v3[14] = CFSTR("narratorCount");
  v3[15] = CFSTR("narratorNames");
  v3[16] = CFSTR("objectID");
  v3[17] = CFSTR("position");
  v3[18] = CFSTR("popularity");
  v3[19] = CFSTR("releaseDate");
  v3[20] = CFSTR("sequenceDisplayName");
  v3[21] = CFSTR("sequenceNumber");
  v3[22] = CFSTR("seriesAdamId");
  v3[23] = CFSTR("seriesIsOrdered");
  v3[24] = CFSTR("seriesTitle");
  v3[25] = CFSTR("sortTitle");
  v3[26] = CFSTR("sortAuthor");
  v3[27] = CFSTR("title");
  v3[28] = CFSTR("url");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 29));
}

- (BKSeriesManager)initWithDatabase:(id)a3 catalogService:(id)a4
{
  id v7;
  id v8;
  BKSeriesManager *v9;
  BKSeriesManager *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKSeriesManager;
  v9 = -[BKSeriesManager init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    v10->_timeOut = 120.0;
    v11 = dispatch_queue_create("com.apple.BKSeriesManager", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_catalogService, a4);
  }

  return v10;
}

- (BKSeriesManager)init
{
  BKSeriesDatabase *v3;
  void *v4;
  BKSeriesManager *v5;

  v3 = objc_alloc_init(BKSeriesDatabase);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCMBridgedCatalogService sharedInstance](BCMBridgedCatalogService, "sharedInstance"));
  v5 = -[BKSeriesManager initWithDatabase:catalogService:](self, "initWithDatabase:catalogService:", v3, v4);

  return v5;
}

- (id)seriesContainerIdsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  _QWORD v22[2];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem fetchRequest](BKSeriesItem, "fetchRequest"));
  objc_msgSend(v7, "setPredicate:", v6);

  objc_msgSend(v7, "setResultType:", 2);
  v22[0] = CFSTR("objectID");
  v22[1] = CFSTR("seriesAdamId");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  objc_msgSend(v7, "setPropertiesToFetch:", v8);

  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v7, "setReturnsDistinctResults:", 1);
  objc_msgSend(v7, "setFetchBatchSize:", 128);
  v21 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v7, &v21));

  v10 = v21;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("seriesAdamId")));
  }
  else
  {
    v12 = BCSeriesManagerLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B9F88((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  return v11;
}

- (id)seriesItemAdamIdsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  _QWORD v22[2];

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem fetchRequest](BKSeriesItem, "fetchRequest"));
  objc_msgSend(v7, "setPredicate:", v6);

  objc_msgSend(v7, "setResultType:", 2);
  v22[0] = CFSTR("objectID");
  v22[1] = CFSTR("adamId");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  objc_msgSend(v7, "setPropertiesToFetch:", v8);

  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v7, "setReturnsDistinctResults:", 1);
  objc_msgSend(v7, "setFetchBatchSize:", 128);
  v21 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v7, &v21));

  v10 = v21;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("adamId")));
  }
  else
  {
    v12 = BCSeriesManagerLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B9F88((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  return v11;
}

- (id)allSeriesContainerIds
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager database](self, "database"));
  v4 = objc_msgSend(v3, "newManagedObjectContext");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager allSeriesContainerIdsInManagedObjectContext:](self, "allSeriesContainerIdsInManagedObjectContext:", v4));
  return v5;
}

- (id)allSeriesItemAdamIds
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager database](self, "database"));
  v4 = objc_msgSend(v3, "newManagedObjectContext");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager allSeriesItemAdamIdsInManagedObjectContext:](self, "allSeriesItemAdamIdsInManagedObjectContext:", v4));
  return v5;
}

- (id)allSeriesItemsForAdamIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager database](self, "database"));
  v6 = objc_msgSend(v5, "newManagedObjectContext");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager allSeriesItemsForAdamIDs:inManagedObjectContext:](self, "allSeriesItemsForAdamIDs:inManagedObjectContext:", v4, v6));
  return v7;
}

- (id)allSeriesItemsInSeries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager database](self, "database"));
  v6 = objc_msgSend(v5, "newManagedObjectContext");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager allSeriesItemsInSeries:inManagedObjectContext:](self, "allSeriesItemsInSeries:inManagedObjectContext:", v4, v6));
  return v7;
}

- (id)seriesContainerWithSeriesId:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager database](self, "database"));
  v6 = objc_msgSend(v5, "newManagedObjectContext");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager seriesContainerWithSeriesId:inManagedObjectContext:](self, "seriesContainerWithSeriesId:inManagedObjectContext:", v4, v6));
  return v7;
}

- (id)seriesItemWithAdamId:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager database](self, "database"));
  v6 = objc_msgSend(v5, "newManagedObjectContext");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager seriesItemWithAdamId:inManagedObjectContext:](self, "seriesItemWithAdamId:inManagedObjectContext:", v4, v6));
  return v7;
}

- (id)allSeriesContainerIdsInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem predicateForAllSeriesContainerItems](BKSeriesItem, "predicateForAllSeriesContainerItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager seriesContainerIdsMatchingPredicate:inManagedObjectContext:](self, "seriesContainerIdsMatchingPredicate:inManagedObjectContext:", v5, v4));

  return v6;
}

- (id)allSeriesItemAdamIdsInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem predicateForAllBookItems](BKSeriesItem, "predicateForAllBookItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager seriesItemAdamIdsMatchingPredicate:inManagedObjectContext:](self, "seriesItemAdamIdsMatchingPredicate:inManagedObjectContext:", v5, v4));

  return v6;
}

- (id)allSeriesItemsForAdamIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager seriesIDsReferencedByAdamIds:inManagedObjectContext:](self, "seriesIDsReferencedByAdamIds:inManagedObjectContext:", a3, v6));
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem predicateForAllItemsAndContainersInSeries:](BKSeriesItem, "predicateForAllItemsAndContainersInSeries:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager seriesItemAdamIdsMatchingPredicate:inManagedObjectContext:](self, "seriesItemAdamIdsMatchingPredicate:inManagedObjectContext:", v10, v6));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)seriesIDsReferencedByAdamIds:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem fetchRequest](BKSeriesItem, "fetchRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("adamId IN %@ AND seriesAdamId != NULL"), v6));

  objc_msgSend(v7, "setPredicate:", v8);
  v14 = CFSTR("seriesAdamId");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  objc_msgSend(v7, "setPropertiesToFetch:", v9);

  v13 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v7, &v13));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("seriesAdamId")));
  return v11;
}

- (id)allSeriesItemsInSeries:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem predicateForAllItemsAndContainersInSeries:](BKSeriesItem, "predicateForAllItemsAndContainersInSeries:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager seriesItemAdamIdsMatchingPredicate:inManagedObjectContext:](self, "seriesItemAdamIdsMatchingPredicate:inManagedObjectContext:", v8, v6));
  return v9;
}

- (id)seriesContainerWithSeriesId:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem predicateForContainerWithSeriesId:](BKSeriesItem, "predicateForContainerWithSeriesId:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem fetchRequest](BKSeriesItem, "fetchRequest"));
  objc_msgSend(v9, "setPredicate:", v8);
  objc_msgSend(v9, "setResultType:", 2);
  v10 = objc_msgSend((id)objc_opt_class(self), "itemFetchProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v9, "setPropertiesToFetch:", v11);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v9, "setReturnsDistinctResults:", 1);
  objc_msgSend(v9, "setFetchLimit:", 1);
  v20 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v9, &v20));

  v13 = v20;
  if (v12)
  {
    v14 = objc_msgSend(v12, "count");
    if (v14)
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
      v15 = v14;
      if (v14)
        v14 = (id)objc_claimAutoreleasedReturnValue(+[BKSeriesInfo seriesInfoWithDictionary:](BKSeriesInfo, "seriesInfoWithDictionary:", v14));
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v16 = BCSeriesManagerLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1B9FEC();

    v15 = 0;
    v14 = 0;
  }
  v18 = v14;

  return v18;
}

- (id)seriesItemsWithAdamIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem fetchRequest](BKSeriesItem, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem predicateForAllItemsAndContainerWithAdamIdInList:](BKSeriesItem, "predicateForAllItemsAndContainerWithAdamIdInList:", v4));

  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(v5, "setResultType:", 2);
  v7 = objc_msgSend((id)objc_opt_class(self), "itemFetchProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setPropertiesToFetch:", v8);

  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v5, "setReturnsDistinctResults:", 1);
  objc_msgSend(v5, "setFetchBatchSize:", 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager database](self, "database"));
  v10 = objc_msgSend(v9, "newManagedObjectContext");
  v13 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "executeFetchRequest:error:", v5, &v13));

  return v11;
}

- (id)seriesItemWithAdamId:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem predicateForItemWithAdamId:](BKSeriesItem, "predicateForItemWithAdamId:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesItem fetchRequest](BKSeriesItem, "fetchRequest"));
  objc_msgSend(v9, "setPredicate:", v8);
  objc_msgSend(v9, "setResultType:", 2);
  v10 = objc_msgSend((id)objc_opt_class(self), "itemFetchProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v9, "setPropertiesToFetch:", v11);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v9, "setReturnsDistinctResults:", 1);
  objc_msgSend(v9, "setFetchLimit:", 1);
  v20 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v9, &v20));

  v13 = v20;
  if (v12)
  {
    v14 = objc_msgSend(v12, "count");
    if (v14)
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
      v15 = v14;
      if (v14)
        v14 = (id)objc_claimAutoreleasedReturnValue(+[BKSeriesInfo seriesInfoWithDictionary:](BKSeriesInfo, "seriesInfoWithDictionary:", v14));
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v16 = BCSeriesManagerLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1B9FEC();

    v15 = 0;
    v14 = 0;
  }
  v18 = v14;

  return v18;
}

- (void)fetchBuyParametersForSeriesWithAdamID:(id)a3 isAudiobook:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a5;
  if (a4)
  {
    v21 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v11 = &__NSArray0__struct;
  }
  else
  {
    v22 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v10 = &__NSArray0__struct;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManager catalogService](self, "catalogService"));
  v13 = objc_alloc((Class)BFMRequestMetadata);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "BKSeriesManager.m"));
  v15 = objc_msgSend(v13, "initWithFileID:line:", v14, 389);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_16ABF0;
  v18[3] = &unk_292BF0;
  v19 = v8;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v12, "fetchMixedAssetsWithBookIds:audiobookIds:relationships:views:additionalParameters:batchSize:metadata:completionHandler:", v11, v10, 0, 0, 0, 150, v15, v18);

}

- (void)updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
  -[BKSeriesManager _updateSeriesForSeriesAdamIDsWithTypes:forceCheck:completion:](self, "_updateSeriesForSeriesAdamIDsWithTypes:forceCheck:completion:", a3, a4, 0);
}

- (void)_updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = BCSeriesManagerLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1BA04C((uint64_t)v8, v11);

  if (objc_msgSend(v8, "hasSeriesTypes"))
  {
    v12 = BCSeriesManagerLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Begin Updating Series Adam IDs", buf, 2u);
    }

    v14 = objc_claimAutoreleasedReturnValue(-[BKSeriesManager queue](self, "queue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_16AE10;
    v17[3] = &unk_2902F0;
    v17[4] = self;
    v18 = v8;
    v20 = a4;
    v19 = v9;
    dispatch_async(v14, v17);

  }
  else
  {
    v15 = objc_retainBlock(v9);
    v16 = v15;
    if (v15)
      (*((void (**)(id))v15 + 2))(v15);

  }
}

- (void)updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
  -[BKSeriesManager _updateSeriesForAssetAdamIDsWithTypes:forceCheck:completion:](self, "_updateSeriesForAssetAdamIDsWithTypes:forceCheck:completion:", a3, a4, 0);
}

- (void)_updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  unsigned int v20;

  v8 = a3;
  v9 = a5;
  v10 = BCSeriesManagerLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v20 = objc_msgSend(v8, "hasAssetTypes");
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "updateSeriesForAssetAdamIDsWithTypes: hasAsset=%{BOOL}d", buf, 8u);
  }

  if (objc_msgSend(v8, "hasAssetTypes"))
  {
    v12 = objc_claimAutoreleasedReturnValue(-[BKSeriesManager queue](self, "queue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_16B10C;
    v15[3] = &unk_2902F0;
    v15[4] = self;
    v16 = v8;
    v18 = a4;
    v17 = v9;
    dispatch_async(v12, v15);

  }
  else
  {
    v13 = objc_retainBlock(v9);
    v14 = v13;
    if (v13)
      (*((void (**)(id))v13 + 2))(v13);

  }
}

- (void)updateExpiredSeriesForAssetAdamIDsWithTypes:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "hasAssetTypes"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKSeriesManager queue](self, "queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_16B324;
    v6[3] = &unk_28B808;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)updateAssetsFromCloudSyncForAssetAdamIDsWithTypes:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];

  v5 = a3;
  v18 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v11 = BCSeriesManagerLog();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bu_prettyDescription"));
          *(_DWORD *)buf = 138543618;
          v27 = v10;
          v28 = 2112;
          v29 = v14;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Begin updating store cloud assets type=%{public}@, adamIds=%@", buf, 0x16u);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v5, "count", self))
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16B5E0;
    block[3] = &unk_28B750;
    block[4] = v17;
    v20 = v5;
    v21 = v18;
    dispatch_async(v15, block);

  }
}

- (BOOL)isFetchingSeries
{
  return self->_isFetchingSeries;
}

- (void)setIsFetchingSeries:(BOOL)a3
{
  self->_isFetchingSeries = a3;
}

- (NSArray)pendingAdamIds
{
  return self->_pendingAdamIds;
}

- (void)setPendingAdamIds:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAdamIds, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BCMBridgedCatalogService)catalogService
{
  return self->_catalogService;
}

- (void)setCatalogService:(id)a3
{
  objc_storeStrong((id *)&self->_catalogService, a3);
}

- (BKSeriesDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (double)timeOut
{
  return self->_timeOut;
}

- (void)setTimeOut:(double)a3
{
  self->_timeOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_catalogService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingAdamIds, 0);
}

@end

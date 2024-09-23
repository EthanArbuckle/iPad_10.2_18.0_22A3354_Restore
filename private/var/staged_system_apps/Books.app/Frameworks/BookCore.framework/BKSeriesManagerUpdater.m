@implementation BKSeriesManagerUpdater

- (BKSeriesManagerUpdater)initWithManager:(id)a3 database:(id)a4 catalogService:(id)a5 onFinished:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BKSeriesManagerUpdater *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  id v17;
  id onFinished;
  NSObject *v19;
  _QWORD block[4];
  BKSeriesManagerUpdater *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)BKSeriesManagerUpdater;
  v14 = -[BKSeriesManagerUpdater init](&v23, "init");
  if (v14)
  {
    v15 = dispatch_queue_create("com.apple.iBooks.BKSeriesManagerUpdater", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    v17 = objc_retainBlock(v13);
    onFinished = v14->_onFinished;
    v14->_onFinished = v17;

    objc_storeStrong((id *)&v14->_database, a4);
    objc_storeWeak((id *)&v14->_manager, v10);
    objc_storeStrong((id *)&v14->_catalogService, a5);
    v19 = v14->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_89914;
    block[3] = &unk_28B960;
    v22 = v14;
    dispatch_async(v19, block);

  }
  return v14;
}

- (void)recordAdamIDsAsChecked:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BKSeriesManagerUpdater *v9;

  v4 = objc_msgSend(a3, "copy");
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_899F4;
  v7[3] = &unk_28B808;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKSeriesManagerUpdater queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_89AB4;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)finish
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKSeriesManagerUpdater queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_89B50;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)updateExpiredSeriesForAssetAdamIDsWithTypes:(id)a3
{
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = BKSeriesManagerAssetTypeAudiobooks[0];
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BKSeriesManagerAssetTypeBooks[0]));

  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_8A154;
    v8[3] = &unk_28CA68;
    v8[4] = self;
    v9 = v7;
    v10 = v6;
    -[BKSeriesManagerUpdater _intervalInDaysWithCompletion:](self, "_intervalInDaysWithCompletion:", v8);

  }
}

- (void)updateSeriesForAssetAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
  -[BKSeriesManagerUpdater _updateSeriesForAssetIDsWithTypes:forceCheck:](self, "_updateSeriesForAssetIDsWithTypes:forceCheck:", a3, a4);
}

- (void)updateSeriesForSeriesAdamIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  BKSeriesManagerUpdater *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;

  v4 = a4;
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_8A70C;
  v26 = sub_8A71C;
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", BKSeriesManagerSeriesTypeBookSeries[0]));
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_8A70C;
  v20 = sub_8A71C;
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", BKSeriesManagerSeriesTypeAudiobookSeries));
  if (objc_msgSend((id)v17[5], "count") || objc_msgSend((id)v23[5], "count"))
  {
    v7 = BCSeriesManagerUpdaterLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v4)
        v9 = CFSTR("Force");
      else
        v9 = &stru_296430;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23[5], "bu_prettyDescription"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17[5], "bu_prettyDescription"));
      *(_DWORD *)buf = 134218754;
      v31 = self;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "<BKSeriesManagerUpdater: %p> %@ Updating series with adamIDs: books=%@, audiobooks=%@", buf, 0x2Au);

    }
    if (v4)
    {
      v12 = (void *)v23[5];
      if (!v12)
        v12 = &__NSArray0__struct;
      v28[0] = BKSeriesManagerSeriesTypeBookSeries[0];
      v28[1] = BKSeriesManagerSeriesTypeAudiobookSeries;
      v13 = (void *)v17[5];
      if (!v13)
        v13 = &__NSArray0__struct;
      v29[0] = v12;
      v29[1] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
      -[BKSeriesManagerUpdater _updateSeriesForSeriesAdamIDsWithFilteredTypes:](self, "_updateSeriesForSeriesAdamIDsWithFilteredTypes:", v14);

    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_8A724;
      v15[3] = &unk_28F990;
      v15[4] = self;
      v15[5] = &v22;
      v15[6] = &v16;
      -[BKSeriesManagerUpdater _intervalInDaysWithCompletion:](self, "_intervalInDaysWithCompletion:", v15);
    }
  }
  else
  {
    -[BKSeriesManagerUpdater finish](self, "finish");
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)_seriesInfoRequestBatchSizeWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesInfoRequestBatchSize"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8A9FC;
  v7[3] = &unk_28F9B8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "valueWithCompletion:", v7);

}

- (void)_updateSeriesForSeriesAdamIDsWithFilteredTypes:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  BKSeriesManagerUpdater *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_8A70C;
  v20 = sub_8A71C;
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BKSeriesManagerSeriesTypeBookSeries[0]));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_8A70C;
  v14 = sub_8A71C;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BKSeriesManagerSeriesTypeAudiobookSeries));
  if (objc_msgSend((id)v17[5], "count") || objc_msgSend((id)v11[5], "count"))
  {
    v5 = BCSeriesManagerUpdaterLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v17[5];
      v8 = v11[5];
      *(_DWORD *)buf = 134218498;
      v23 = self;
      v24 = 2112;
      v25 = v7;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "<BKSeriesManagerUpdater: %p> Fetching series with bookSeriesAdamIds: %@, audiobookSeriesAdamIDs: %@", buf, 0x20u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_8ACBC;
    v9[3] = &unk_28FA58;
    v9[4] = self;
    v9[5] = &v16;
    v9[6] = &v10;
    -[BKSeriesManagerUpdater _seriesInfoRequestBatchSizeWithCompletion:](self, "_seriesInfoRequestBatchSizeWithCompletion:", v9);
  }
  else
  {
    -[BKSeriesManagerUpdater finish](self, "finish");
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

- (void)_updateSeriesContainersWithSeriesIDs:(id)a3 withResources:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BKSeriesManagerUpdater *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[BKSeriesManagerUpdater recordAdamIDsAsChecked:](self, "recordAdamIDsAsChecked:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManagerUpdater managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_8B2CC;
  v11[3] = &unk_28C5F0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

- (void)_updateSeriesChildrenWithAdamIDs:(id)a3 forSeries:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManagerUpdater managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_8B75C;
  v11[3] = &unk_28C5F0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

- (void)_updateSeriesForAssetIDsWithTypes:(id)a3 forceCheck:(BOOL)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v6 = BKSeriesManagerAssetTypeAudiobooks[0];
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", BKSeriesManagerAssetTypeBooks[0]));

  if (objc_msgSend(v9, "count") || objc_msgSend(v8, "count"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_8BFB8;
    v10[3] = &unk_28FB70;
    v10[4] = self;
    v13 = a4;
    v11 = v9;
    v12 = v8;
    -[BKSeriesManagerUpdater _seriesInfoRequestBatchSizeWithCompletion:](self, "_seriesInfoRequestBatchSizeWithCompletion:", v10);

  }
  else
  {
    -[BKSeriesManagerUpdater finish](self, "finish");
  }

}

- (void)updateAssetsFromCloudSyncForAssetAdamIDsWithTypes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSNumberFormatter *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v20;
  BKSeriesManagerUpdater *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BKSeriesManagerAssetTypeUnknown[0]));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_new(NSNumberFormatter);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v12, "numberFromString:", v11));

        if (!v13)
          objc_msgSend(v5, "addObject:", v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v14 = BCSeriesManagerUpdaterLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      sub_1B5E74(v5, v15);

  }
  v16 = objc_claimAutoreleasedReturnValue(-[BKSeriesManagerUpdater queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8CD84;
  block[3] = &unk_28B808;
  v20 = v3;
  v21 = self;
  v17 = v3;
  dispatch_async(v16, block);

}

- (void)_updateAssetsFromCloudSyncWithAdamIDs:(id)a3 withAssetResources:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BKSeriesManagerUpdater *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManagerUpdater managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_8D4E8;
  v11[3] = &unk_28C5F0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

- (void)_intervalInDaysWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesInfoUpdateIntervalInDays"));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8DBFC;
  v7[3] = &unk_28F9B8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "valueWithCompletion:", v7);

}

- (id)_filteredAdamIDs:(id)a3 withIntervalInDays:(double)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSeriesManagerUpdater managedObjectContext](self, "managedObjectContext", (_QWORD)v17));
        v15 = +[BKSeriesCheck shouldRecheckAdamID:withIntervalInDays:inManagedObjectContext:](BKSeriesCheck, "shouldRecheckAdamID:withIntervalInDays:inManagedObjectContext:", v13, v14, a4);

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

+ (void)_populateItem:(id)a3 withSeriesResource:(id)a4 inMoc:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", &__kCFBooleanTrue, CFSTR("isContainer"), objc_opt_class(NSNumber));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v10, CFSTR("sortTitle"), objc_opt_class(NSString));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v11, CFSTR("seriesTitle"), objc_opt_class(NSString));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v12, CFSTR("title"), objc_opt_class(NSString));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "id"));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v13, CFSTR("seriesAdamId"), objc_opt_class(NSString));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v14, CFSTR("url"), objc_opt_class(NSURL));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isExplicit")));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v15, CFSTR("isExplicit"), objc_opt_class(NSNumber));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isOrdered")));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v16, CFSTR("seriesIsOrdered"), objc_opt_class(NSNumber));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "genres"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", CFSTR("name")));

  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v21, CFSTR("genres"), objc_opt_class(NSArray));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authorCount"));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v18, CFSTR("authorCount"), objc_opt_class(NSNumber));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authorNames"));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v19, CFSTR("authorNames"), objc_opt_class(NSArray));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "hasUniqueAuthors")));
  objc_msgSend(v9, "setDifferentValue:forKey:klass:", v20, CFSTR("hasTooManyAuthors"), objc_opt_class(NSNumber));

  +[BKSeriesManagerUpdaterHelper updateSeries:withResource:inMoc:](BKSeriesManagerUpdaterHelper, "updateSeries:withResource:inMoc:", v9, v8, v7);
}

+ (void)_populateItem:(id)a3 position:(unint64_t)a4 withAssetResource:(id)a5 seriesResource:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "id"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v11, CFSTR("adamId"), objc_opt_class(NSString));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artistName"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v12, CFSTR("author"), objc_opt_class(NSString));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "width"));
  if (!objc_msgSend(v13, "longValue"))
  {
    v18 = 0;
    goto LABEL_5;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "height"));
  v15 = objc_msgSend(v14, "longValue");

  if (v15)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "width"));
    v16 = (double)(uint64_t)objc_msgSend(v13, "longValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "height"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16 / (double)(uint64_t)objc_msgSend(v17, "longValue")));

LABEL_5:
    goto LABEL_7;
  }
  v18 = 0;
LABEL_7:
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v18, CFSTR("coverAspectRatio"), objc_opt_class(NSNumber));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "genreName"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v19, CFSTR("genre"), objc_opt_class(NSString));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "isSG")));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v20, CFSTR("hasRACSupport"), objc_opt_class(NSNumber));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "isAudiobook")));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v21, CFSTR("isAudiobook"), objc_opt_class(NSNumber));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "isExplicit")));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v22, CFSTR("isExplicit"), objc_opt_class(NSNumber));

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    objc_msgSend(v32, "setDifferentValue:forKey:klass:", v23, CFSTR("position"), objc_opt_class(NSNumber));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "releaseDate"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v24, CFSTR("releaseDate"), objc_opt_class(NSDate));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v25, CFSTR("seriesTitle"), objc_opt_class(NSString));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sequenceDisplayLabel"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v26, CFSTR("sequenceDisplayName"), objc_opt_class(NSString));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sequenceNumber"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v27, CFSTR("sequenceNumber"), objc_opt_class(NSDecimalNumber));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artistName"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v28, CFSTR("sortAuthor"), objc_opt_class(NSString));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v29, CFSTR("sortTitle"), objc_opt_class(NSString));

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v30, CFSTR("title"), objc_opt_class(NSString));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));
  objc_msgSend(v32, "setDifferentValue:forKey:klass:", v31, CFSTR("url"), objc_opt_class(NSURL));

}

- (BKSeriesDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (BKSeriesManager)manager
{
  return (BKSeriesManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BKSeriesDatabaseManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (id)onFinished
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setOnFinished:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSMutableSet)checkedAdamIDs
{
  return self->_checkedAdamIDs;
}

- (void)setCheckedAdamIDs:(id)a3
{
  objc_storeStrong((id *)&self->_checkedAdamIDs, a3);
}

- (BCMBridgedCatalogService)catalogService
{
  return self->_catalogService;
}

- (void)setCatalogService:(id)a3
{
  objc_storeStrong((id *)&self->_catalogService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogService, 0);
  objc_storeStrong((id *)&self->_checkedAdamIDs, 0);
  objc_storeStrong(&self->_onFinished, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_database, 0);
}

@end

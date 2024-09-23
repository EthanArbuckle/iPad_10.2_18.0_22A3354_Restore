@implementation BCReadingStatisticsController

- (BCReadingStatisticsController)initWithAssetID:(id)a3 versionString:(id)a4
{
  return -[BCReadingStatisticsController initWithAssetID:versionString:registerCloudSync:](self, "initWithAssetID:versionString:registerCloudSync:", a3, a4, 1);
}

- (BCReadingStatisticsController)initWithAssetID:(id)a3 versionString:(id)a4 registerCloudSync:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  BCReadingStatisticsController *v10;
  NSString *v11;
  NSString *assetID;
  BCCountedCFISet *v13;
  BCCountedCFISet *heatMap;
  BCMutableCFISet *v15;
  BCMutableCFISet *visibleCFIs;
  NSMutableIndexSet *v17;
  NSMutableIndexSet *tocEntriesRequiringProcessing;
  NSMutableIndexSet *v19;
  NSMutableIndexSet *haveTOCCFIIndices;
  NSMutableIndexSet *v21;
  NSMutableIndexSet *haveTextNodeLengthIndices;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_attr_t v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *accessQueue;
  uint64_t v29;
  NSMutableArray *observers;
  id v31;
  id *v32;
  id v33;
  id v34;
  id v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  id *v40;
  id v41;
  id v42;
  void *v43;
  id v45;
  _QWORD v46[4];
  id *v47;
  id v48;
  _QWORD v49[4];
  id *v50;
  id v51;
  _QWORD v52[4];
  id *v53;
  id v54;
  id location;
  objc_super v56;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v56.receiver = self;
  v56.super_class = (Class)BCReadingStatisticsController;
  v10 = -[BCReadingStatisticsController init](&v56, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    assetID = v10->_assetID;
    v10->_assetID = v11;

    objc_storeStrong((id *)&v10->_bookVersionString, a4);
    v13 = objc_alloc_init(BCCountedCFISet);
    heatMap = v10->_heatMap;
    v10->_heatMap = v13;

    -[BCCountedCFISet setLengthProvider:](v10->_heatMap, "setLengthProvider:", v10);
    -[BCCountedCFISet setMaximumCFICount:](v10->_heatMap, "setMaximumCFICount:", 1000);
    v15 = objc_alloc_init(BCMutableCFISet);
    visibleCFIs = v10->_visibleCFIs;
    v10->_visibleCFIs = v15;

    v17 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    tocEntriesRequiringProcessing = v10->_tocEntriesRequiringProcessing;
    v10->_tocEntriesRequiringProcessing = v17;

    v19 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    haveTOCCFIIndices = v10->_haveTOCCFIIndices;
    v10->_haveTOCCFIIndices = v19;

    v21 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    haveTextNodeLengthIndices = v10->_haveTextNodeLengthIndices;
    v10->_haveTextNodeLengthIndices = v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_DEFAULT, 0);
    v26 = objc_claimAutoreleasedReturnValue(v25);

    v27 = dispatch_queue_create("com.apple.iBooks.BCReadingStatistics.dispatchQueue", v26);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v27;

    v29 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    observers = v10->_observers;
    v10->_observers = (NSMutableArray *)v29;

    v10->_readingThreshold = 1.0;
    objc_initWeak(&location, v10);
    v31 = objc_alloc((Class)BUCoalescingCallBlock);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1A6B0;
    v52[3] = &unk_28C168;
    objc_copyWeak(&v54, &location);
    v32 = v10;
    v53 = v32;
    v33 = objc_msgSend(v31, "initWithNotifyBlock:blockDescription:", v52, CFSTR("BCReadingStatisticsController _saveHeatMapWithCompletion"));
    v45 = v8;
    v34 = v32[18];
    v32[18] = v33;

    objc_msgSend(v32[18], "setCoalescingDelay:", 1.0);
    objc_msgSend(v32[18], "setMaximumDelay:", 5.0);
    v35 = objc_alloc((Class)BUCoalescingCallBlock);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1A7FC;
    v49[3] = &unk_28C168;
    objc_copyWeak(&v51, &location);
    v36 = v32;
    v50 = v36;
    v37 = objc_msgSend(v35, "initWithNotifyBlock:blockDescription:", v49, CFSTR("BCReadingStatisticsController _processDirtyTOCEntriesWithCompletion"));
    v38 = v36[19];
    v36[19] = v37;

    objc_msgSend(v36[19], "setCoalescingDelay:", 0.1);
    objc_msgSend(v36[19], "setMaximumDelay:", 1.0);
    v39 = objc_alloc((Class)BUCoalescingCallBlock);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1A8B4;
    v46[3] = &unk_28C168;
    objc_copyWeak(&v48, &location);
    v40 = v36;
    v47 = v40;
    v41 = objc_msgSend(v39, "initWithNotifyBlock:blockDescription:", v46, CFSTR("BCReadingStatisticsController _connectOrdinalsWithCompletion"));
    v42 = v40[20];
    v40[20] = v41;

    objc_msgSend(v40[20], "setCoalescingDelay:", 1.0);
    objc_msgSend(v40[20], "setMaximumDelay:", 15.0);
    *((_BYTE *)v40 + 24) = v5;
    if (v5)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingStatisticsSyncManager sharedInstance](BCReadingStatisticsSyncManager, "sharedInstance"));
      objc_msgSend(v43, "registerReadingStatisticsController:", v40);

    }
    objc_destroyWeak(&v48);

    objc_destroyWeak(&v51);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);

    v8 = v45;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_registerCloudSync)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingStatisticsSyncManager sharedInstance](BCReadingStatisticsSyncManager, "sharedInstance"));
    objc_msgSend(v3, "unregisterReadingStatisticsController:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)BCReadingStatisticsController;
  -[BCReadingStatisticsController dealloc](&v4, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController assetID](self, "assetID"));
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController assetID](self, "assetID"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (void)tocEntryStatisticsForHref:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1AB60;
  v11[3] = &unk_28C190;
  v11[4] = self;
  v12 = v6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v14 = v7;
  v8 = v7;
  v9 = v13;
  v10 = v6;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)bookStatisticsWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1AE3C;
  v7[3] = &unk_28B750;
  v7[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v6, "performBlock:", v7);

}

- (void)tocCFIMapWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1B198;
  v7[3] = &unk_28B750;
  v7[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v6, "performBlock:", v7);

}

- (void)cfisDidAppear:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1B3D8;
  v7[3] = &unk_28B808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)cfisWillDisappear:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1B510;
  v7[3] = &unk_28B808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)setupWithCompletion:(id)a3
{
  NSManagedObjectContext *v4;
  NSManagedObjectContext *moc;
  NSManagedObjectContext *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
  moc = self->_moc;
  self->_moc = v4;

  v6 = self->_moc;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController assetID](self, "assetID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController _persistentStoreCoordinatorWithAssetID:](self, "_persistentStoreCoordinatorWithAssetID:", v7));
  -[NSManagedObjectContext setPersistentStoreCoordinator:](v6, "setPersistentStoreCoordinator:", v8);

  -[NSManagedObjectContext setUndoManager:](self->_moc, "setUndoManager:", 0);
  -[BCReadingStatisticsController _loadWithCompletion:](self, "_loadWithCompletion:", v9);

}

- (void)teardown
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B6D4;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController haveTextNodeLengthIndices](self, "haveTextNodeLengthIndices"));
  LOBYTE(a3) = objc_msgSend(v4, "containsIndex:", a3) ^ 1;

  return a3;
}

- (void)addTextNodeCharacterCounts:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  BCReadingStatisticsController *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  int64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v23 = self;
  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v13);
        v30 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v14, &v30, v23));
        v16 = v30;
        if (v16)
        {
          v18 = v16;
          v19 = BCReadingStatisticsLog();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            sub_1B365C();

          v21 = objc_retainBlock(v7);
          v22 = v21;
          if (v21)
            (*((void (**)(id, id))v21 + 2))(v21, v18);

          goto LABEL_15;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v15);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v11)
        continue;
      break;
    }
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1B988;
  v25[3] = &unk_28C200;
  v29 = a4;
  v25[4] = v23;
  v26 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](v23, "moc"));
  v27 = v8;
  v28 = v7;
  v18 = v26;
  objc_msgSend(v18, "performBlock:", v25);

LABEL_15:
}

- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController haveTOCCFIIndices](self, "haveTOCCFIIndices"));
  LOBYTE(a3) = objc_msgSend(v4, "containsIndex:", a3) ^ 1;

  return a3;
}

- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1C1F4;
  v12[3] = &unk_28C200;
  v15 = a5;
  v16 = a4;
  v12[4] = self;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v14 = v8;
  v9 = v15;
  v10 = v8;
  v11 = v13;
  objc_msgSend(v11, "performBlock:", v12);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C820;
  block[3] = &unk_28BD80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C924;
  block[3] = &unk_28BD80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (int64_t)characterCountForCFI:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  __int128 v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  __int128 v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  _QWORD v30[2];

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "characterCountIfComputable");
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headCFI"));
  v27 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController _textNodeCFIToCharacterLengthMapForOrdinal:error:](self, "_textNodeCFIToCharacterLengthMapForOrdinal:error:", objc_msgSend(v6, "spineIndex"), &v27));
  v8 = v27;
  if (v8)
  {
    v9 = BCReadingStatisticsLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1B3778();
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v30[0] = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v30[1] = v11;
  v10 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));

  v12 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v7, "count"), 1024, &stru_28C260);
  v13 = objc_msgSend(v7, "count");
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v15 = v13;
  v16 = (uint64_t)v12 <= 1 ? 1 : (uint64_t)v12;
  if (v16 > (uint64_t)v13)
    goto LABEL_10;
  v26 = v6;
  v5 = 0;
  v18 = v16 - 1;
  *(_QWORD *)&v14 = 138412290;
  v25 = v14;
  while (1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v18, v25));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "intersectWithCFI:", v20));
    if (!objc_msgSend(v21, "isRange"))
      break;
    if (objc_msgSend(v21, "isEqual:", v20))
    {
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
      v5 = &v5[(_QWORD)-[NSObject integerValue](v22, "integerValue")];
    }
    else
    {
      v23 = objc_msgSend(v21, "characterCountIfComputable");
      if (v23 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = &v5[(_QWORD)v23];
        goto LABEL_24;
      }
      v24 = BCReadingStatisticsLog();
      v22 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v25;
        v29 = v21;
        _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Unexpected failure to compute character count for CFI %@", buf, 0xCu);
      }
    }

LABEL_24:
    if (v15 == (id)++v18)
      goto LABEL_25;
  }
  if (objc_msgSend(v4, "compareTailToHead:", v20) != (id)-1)
    goto LABEL_24;

LABEL_25:
  v8 = 0;
  v6 = v26;
LABEL_11:

LABEL_12:
  return (int64_t)v5;
}

- (id)_textNodeCFIToCharacterLengthMapForOrdinal:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1CE8C;
  v29 = sub_1CE9C;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1CE8C;
  v23 = sub_1CE9C;
  v24 = 0;
  if (-[BCReadingStatisticsController cachedTextNodeCFIsAndCharacterCountsOrdinal](self, "cachedTextNodeCFIsAndCharacterCountsOrdinal") == a3)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController cachedTextNodeCFIsAndCharacterCounts](self, "cachedTextNodeCFIsAndCharacterCounts"));
    v8 = (void *)v26[5];
    v26[5] = v7;

  }
  if (!v26[5])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1CEA4;
    v14[3] = &unk_28C2A8;
    v14[4] = self;
    v18 = a3;
    v11 = v9;
    v15 = v11;
    v16 = &v19;
    v17 = &v25;
    objc_msgSend(v10, "performBlockAndWait:", v14);

    -[BCReadingStatisticsController setCachedTextNodeCFIsAndCharacterCounts:](self, "setCachedTextNodeCFIsAndCharacterCounts:", v26[5]);
    -[BCReadingStatisticsController setCachedTextNodeCFIsAndCharacterCountsOrdinal:](self, "setCachedTextNodeCFIsAndCharacterCountsOrdinal:", a3);

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v12 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (id)_appVersion
{
  if (qword_30D520 != -1)
    dispatch_once(&qword_30D520, &stru_28C2C8);
  return (id)qword_30D518;
}

- (void)_updateHeatMapWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  BCReadingStatisticsController *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  double v40;
  _BYTE v41[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController lastUpdate](self, "lastUpdate"));
  -[BCReadingStatisticsController setLastUpdate:](self, "setLastUpdate:", v5);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController visibleCFIs](self, "visibleCFIs")),
        v7,
        v7)
    && (objc_msgSend(v5, "timeIntervalSinceDate:", v6), v9 = v8, v8 > 1.0))
  {
    v30 = v6;
    v31 = v5;
    v32 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController heatMap](self, "heatMap"));
    v29 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController visibleCFIs](self, "visibleCFIs"));
    v12 = objc_msgSend(v11, "copy");

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allCFIs"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v17);
          v19 = BCReadingStatisticsLog();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "string"));
            *(_DWORD *)buf = 138412546;
            v38 = v21;
            v39 = 2048;
            v40 = v9;
            _os_log_debug_impl(&dword_0, v20, OS_LOG_TYPE_DEBUG, "Read %@ for %.1lf seconds", buf, 0x16u);

          }
          objc_msgSend(v10, "addCFI:count:", v18, v9);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v15);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allCFIs"));
    -[BCReadingStatisticsController _invalidateTOCEntriesIntersectingCFIs:](v29, "_invalidateTOCEntriesIntersectingCFIs:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController coalescedSave](v29, "coalescedSave"));
    objc_msgSend(v23, "signalWithCompletion:", &stru_28C2E8);

    v4 = v32;
    v24 = objc_retainBlock(v32);
    v25 = v24;
    if (v24)
      (*((void (**)(id, _QWORD))v24 + 2))(v24, 0);

    v6 = v30;
    v5 = v31;
  }
  else
  {
    v26 = objc_retainBlock(v4);
    v27 = v26;
    if (v26)
      (*((void (**)(id, _QWORD))v26 + 2))(v26, 0);

  }
}

- (void)_saveHeatMapWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BCReadingStatisticsController *v13;
  id v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController heatMap](self, "heatMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allCFIStringCounts"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1D5D4;
  v10[3] = &unk_28C190;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v12 = v6;
  v13 = self;
  v14 = v4;
  v7 = v4;
  v8 = v6;
  v9 = v11;
  objc_msgSend(v9, "performBlock:", v10);

}

- (void)_updateAppVersionOnMOC:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BCReadingStatsAppVersion")));
  v14 = CFSTR("appVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  objc_msgSend(v5, "setPropertiesToFetch:", v6);

  v13 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, &v13));
  v8 = v7;
  if (v13 || !objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BCReadingStatsAppVersion"), v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController _appVersion](self, "_appVersion"));
    v11 = v9;
    v12 = v10;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController _appVersion](self, "_appVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    v10 = v11;
    v12 = v9;
  }
  objc_msgSend(v11, "setAppVersion:", v12);

}

- (void)_loadWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BCReadingStatisticsController *v9;
  id v10;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1DAD0;
  v7[3] = &unk_28B750;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v9 = self;
  v10 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v6, "performBlock:", v7);

}

- (id)_predicateForCharacterCountsWithOrdinal:(int64_t)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ordinal == %d"), a3);
}

- (id)_predicateForTOCEntriesWithOrdinal:(int64_t)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ordinal == %d"), a3);
}

- (id)_predicateForTOCEntriesWithHref:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("href == %@"), a3);
}

- (id)_fetchRequestForTOCEntries
{
  return -[BCReadingStatisticsController _fetchRequestForTOCEntriesInRange:](self, "_fetchRequestForTOCEntriesInRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (id)_fetchRequestForTOCEntriesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[2];

  length = a3.length;
  location = a3.location;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BCReadingStatsTOCEntry")));
  v6 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("ordinal"), 1);
  v7 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("intraOrdinalOrder"), 1);
  v10[0] = v6;
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  objc_msgSend(v5, "setSortDescriptors:", v8);

  if (location != 0x7FFFFFFFFFFFFFFFLL && length)
  {
    objc_msgSend(v5, "setFetchOffset:", location);
    objc_msgSend(v5, "setFetchLimit:", length);
  }

  return v5;
}

- (void)_bulkUpdateTocEntryReadProportions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_msgSend(v6, "mutableCopy");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1E608;
    v15[3] = &unk_28C190;
    v15[4] = self;
    v16 = v9;
    v17 = v8;
    v18 = v7;
    v11 = v8;
    v12 = v9;
    objc_msgSend(v10, "performBlock:", v15);

  }
  else
  {
    v13 = objc_retainBlock(v7);
    v14 = v13;
    if (v13)
      (*((void (**)(id))v13 + 2))(v13);

  }
}

- (void)_setOfReadRangesWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[BCReadingStatisticsController readingThreshold](self, "readingThreshold");
  -[BCReadingStatisticsController _setOfRangesWithThreshold:completion:](self, "_setOfRangesWithThreshold:completion:", v4);

}

- (void)_setOfRangesWithThreshold:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1EB30;
  block[3] = &unk_28C338;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(accessQueue, block);

}

- (void)_bulkUpdateWithReadRanges:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  BCReadingStatisticsController *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  if ((uint64_t)objc_msgSend(v6, "cfiCount") < 1)
  {
    v9 = objc_retainBlock(v7);
    v10 = v9;
    if (v9)
      (*((void (**)(id))v9 + 2))(v9);

  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1ECC8;
    block[3] = &unk_28C360;
    objc_copyWeak(&v15, &location);
    v12 = v6;
    v13 = self;
    v14 = v7;
    dispatch_async(accessQueue, block);

    objc_destroyWeak(&v15);
  }
  objc_destroyWeak(&location);

}

- (void)_getHeatMapWithCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1EE38;
  v7[3] = &unk_28C388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)_setDisableCoalescing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController coalescedSave](self, "coalescedSave"));
  objc_msgSend(v3, "setCoalescingDelay:", 0.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController coalescedSave](self, "coalescedSave"));
  objc_msgSend(v4, "setMaximumDelay:", 0.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController coalescedChangeProcessing](self, "coalescedChangeProcessing"));
  objc_msgSend(v5, "setCoalescingDelay:", 0.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController coalescedChangeProcessing](self, "coalescedChangeProcessing"));
  objc_msgSend(v6, "setMaximumDelay:", 0.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController coalescedConnectOrdinals](self, "coalescedConnectOrdinals"));
  objc_msgSend(v7, "setCoalescingDelay:", 0.0);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController coalescedConnectOrdinals](self, "coalescedConnectOrdinals"));
  objc_msgSend(v8, "setMaximumDelay:", 0.0);

}

- (void)_getTextNodesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1F024;
  v9[3] = &unk_28C080;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performBlock:", v9);

}

- (void)_getTOCEntriesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1F1F4;
  v9[3] = &unk_28B750;
  v9[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performBlock:", v9);

}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(id, BOOL, id);
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationDocumentsDirectory](UIApplication, "applicationDocumentsDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BCReadingStatistics")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  objc_msgSend(v6, "removeItemAtPath:error:", v5, &v9);
  v7 = v9;

  v8 = (void (**)(id, BOOL, id))objc_retainBlock(v3);
  if (v8)
    v8[2](v8, v7 == 0, v7);

}

+ (id)_persistentStoreDirectory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationDocumentsDirectory](UIApplication, "applicationDocumentsDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("BCReadingStatistics")));

  return v3;
}

- (id)_persistentStoreFileNameWithAssetID:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.sqlite"), a3);
}

- (void)_recreatePersistentStoreDirectory
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend((id)objc_opt_class(self), "_persistentStoreDirectory");
  v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relativePath"));
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

}

- (id)_managedObjectModel
{
  NSManagedObjectModel *model;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  NSManagedObjectModel *v8;
  NSManagedObjectModel *v9;

  model = self->_model;
  if (!model)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", CFSTR("BCReadingStatistics"), CFSTR("momd")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 1));
    v8 = (NSManagedObjectModel *)objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v7);
    v9 = self->_model;
    self->_model = v8;

    model = self->_model;
  }
  return model;
}

- (id)_persistentStoreCoordinatorWithAssetID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v4 = a3;
  v5 = objc_alloc((Class)NSPersistentStoreCoordinator);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController _managedObjectModel](self, "_managedObjectModel"));
  v7 = objc_msgSend(v5, "initWithManagedObjectModel:", v6);

  v21[0] = NSInferMappingModelAutomaticallyOption;
  v21[1] = NSMigratePersistentStoresAutomaticallyOption;
  v22[0] = &__kCFBooleanTrue;
  v22[1] = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
  v9 = objc_msgSend((id)objc_opt_class(self), "_persistentStoreDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController _persistentStoreFileNameWithAssetID:](self, "_persistentStoreFileNameWithAssetID:", v4));

  -[BCReadingStatisticsController _recreatePersistentStoreDirectory](self, "_recreatePersistentStoreDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v12, 0));
  v20 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v13, v8, &v20));
  v15 = v20;
  if (!v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v16, "removeItemAtPath:error:", v10, 0);

    -[BCReadingStatisticsController _recreatePersistentStoreDirectory](self, "_recreatePersistentStoreDirectory");
    v19 = v15;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v13, v8, &v19));
    v17 = v19;

    v15 = v17;
  }

  return v7;
}

- (void)_invalidateTOCEntryCFICache
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F788;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (id)_TOCEntryCFIs
{
  void *v3;
  id v4;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController orderedTOCEntryCFICache](self, "orderedTOCEntryCFICache"));

  if (!v3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = sub_1CE8C;
    v13 = sub_1CE9C;
    v14 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1F8B0;
    v6[3] = &unk_28C430;
    v6[4] = self;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v4, "performBlockAndWait:", v6);
    -[BCReadingStatisticsController setOrderedTOCEntryCFICache:](self, "setOrderedTOCEntryCFICache:", v10[5]);

    _Block_object_dispose(&v9, 8);
  }
  return (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController orderedTOCEntryCFICache](self, "orderedTOCEntryCFICache"));
}

- (void)_invalidateTOCEntriesIntersectingCFIs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController tocEntriesRequiringProcessing](self, "tocEntriesRequiringProcessing"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v4, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController _TOCEntryCFIs](self, "_TOCEntryCFIs"));
      if (objc_msgSend(v8, "count"))
      {
        v11 = 0;
        v12 = &v11;
        v13 = 0x2020000000;
        v14 = 0;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1FD48;
        v10[3] = &unk_28C498;
        v10[4] = self;
        v10[5] = &v11;
        -[BCReadingStatisticsController _slideIterateSortedArray:andArray:index1:index2:comparator:executing:](self, "_slideIterateSortedArray:andArray:index1:index2:comparator:executing:", v4, v8, 0, 0, &stru_28C470, v10);
        if (*((_BYTE *)v12 + 24))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController coalescedChangeProcessing](self, "coalescedChangeProcessing"));
          objc_msgSend(v9, "signalWithCompletion:", &stru_28C4B8);

        }
        _Block_object_dispose(&v11, 8);
      }

    }
  }

}

- (void)_processDirtyTOCEntriesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController tocEntriesRequiringProcessing](self, "tocEntriesRequiringProcessing"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController heatMap](self, "heatMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allCFICounts"));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1FFB4;
    v12[3] = &unk_28C580;
    v12[4] = self;
    v13 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
    v14 = v7;
    v15 = v5;
    v16 = v4;
    v8 = v7;
    v9 = v13;
    objc_msgSend(v9, "performBlock:", v12);

  }
  else
  {
    v10 = objc_retainBlock(v4);
    v11 = v10;
    if (v10)
      (*((void (**)(id))v10 + 2))(v10);

  }
}

- (void)_connectOrdinalsWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BCReadingStatisticsController *v9;
  id v10;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_208A0;
  v7[3] = &unk_28B750;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsController moc](self, "moc"));
  v9 = self;
  v10 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v6, "performBlock:", v7);

}

- (void)_slideIterateSortedArray:(id)a3 andArray:(id)a4 index1:(unint64_t *)a5 index2:(unint64_t *)a6 comparator:(id)a7 executing:(id)a8
{
  id v13;
  uint64_t (**v14)(id, void *, void *);
  id v15;
  unint64_t *v16;
  id v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD *v26;
  unint64_t *v27;
  id v28;

  v28 = a3;
  v13 = a4;
  v14 = (uint64_t (**)(id, void *, void *))a7;
  v15 = a8;
  v16 = (unint64_t *)objc_msgSend(v28, "count");
  v17 = objc_msgSend(v13, "count");
  v18 = a5;
  v19 = (unint64_t)v17;
  if (a5)
    a5 = (unint64_t *)*a5;
  v26 = v18;
  if (a6)
    v20 = *a6;
  else
    v20 = 0;
  v27 = a6;
  if (a5 < v16 && v20 < (unint64_t)v17)
  {
    do
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", a5));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v20));
      v23 = objc_retainBlock(v15);
      v24 = v23;
      if (v23)
        (*((void (**)(id, void *, void *, unint64_t *, unint64_t))v23 + 2))(v23, v21, v22, a5, v20);

      if (v14[2](v14, v21, v22) == 1)
        ++v20;
      else
        a5 = (unint64_t *)((char *)a5 + 1);

    }
    while (a5 < v16 && v20 < v19);
  }
  if (v26)
    *v26 = a5;
  if (v27)
    *v27 = v20;

}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)bookVersionString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (double)readingThreshold
{
  return self->_readingThreshold;
}

- (void)setReadingThreshold:(double)a3
{
  self->_readingThreshold = a3;
}

- (NSMutableIndexSet)haveTOCCFIIndices
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHaveTOCCFIIndices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableIndexSet)haveTextNodeLengthIndices
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHaveTextNodeLengthIndices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)cachedTextNodeCFIsAndCharacterCounts
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedTextNodeCFIsAndCharacterCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)cachedTextNodeCFIsAndCharacterCountsOrdinal
{
  return self->_cachedTextNodeCFIsAndCharacterCountsOrdinal;
}

- (void)setCachedTextNodeCFIsAndCharacterCountsOrdinal:(unint64_t)a3
{
  self->_cachedTextNodeCFIsAndCharacterCountsOrdinal = a3;
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
}

- (BOOL)registerCloudSync
{
  return self->_registerCloudSync;
}

- (void)setRegisterCloudSync:(BOOL)a3
{
  self->_registerCloudSync = a3;
}

- (BCCountedCFISet)heatMap
{
  return self->_heatMap;
}

- (void)setHeatMap:(id)a3
{
  objc_storeStrong((id *)&self->_heatMap, a3);
}

- (BCMutableCFISet)visibleCFIs
{
  return self->_visibleCFIs;
}

- (void)setVisibleCFIs:(id)a3
{
  objc_storeStrong((id *)&self->_visibleCFIs, a3);
}

- (NSMutableIndexSet)tocEntriesRequiringProcessing
{
  return self->_tocEntriesRequiringProcessing;
}

- (void)setTocEntriesRequiringProcessing:(id)a3
{
  objc_storeStrong((id *)&self->_tocEntriesRequiringProcessing, a3);
}

- (NSArray)orderedTOCEntryCFICache
{
  return self->_orderedTOCEntryCFICache;
}

- (void)setOrderedTOCEntryCFICache:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTOCEntryCFICache, a3);
}

- (NSDate)lastUpdate
{
  return self->_lastUpdate;
}

- (void)setLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdate, a3);
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BUCoalescingCallBlock)coalescedSave
{
  return self->_coalescedSave;
}

- (void)setCoalescedSave:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedSave, a3);
}

- (BUCoalescingCallBlock)coalescedChangeProcessing
{
  return self->_coalescedChangeProcessing;
}

- (void)setCoalescedChangeProcessing:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedChangeProcessing, a3);
}

- (BUCoalescingCallBlock)coalescedConnectOrdinals
{
  return self->_coalescedConnectOrdinals;
}

- (void)setCoalescedConnectOrdinals:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedConnectOrdinals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedConnectOrdinals, 0);
  objc_storeStrong((id *)&self->_coalescedChangeProcessing, 0);
  objc_storeStrong((id *)&self->_coalescedSave, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_orderedTOCEntryCFICache, 0);
  objc_storeStrong((id *)&self->_tocEntriesRequiringProcessing, 0);
  objc_storeStrong((id *)&self->_visibleCFIs, 0);
  objc_storeStrong((id *)&self->_heatMap, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_cachedTextNodeCFIsAndCharacterCounts, 0);
  objc_storeStrong((id *)&self->_haveTextNodeLengthIndices, 0);
  objc_storeStrong((id *)&self->_haveTOCCFIIndices, 0);
  objc_storeStrong((id *)&self->_bookVersionString, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end

@implementation MTCoreSpotlightIndexBatchGenerator

- (MTCoreSpotlightIndexBatchGenerator)initWithStartingIndexPath:(id)a3
{
  id v4;
  MTCoreSpotlightIndexBatchGenerator *v5;
  int64_t v6;
  uint64_t v7;
  NSMutableArray *indexAllCompletions;
  uint64_t v9;
  NSMutableSet *externallyProcessedMOIDs;
  void *v11;
  uint64_t v12;
  NSManagedObjectContext *context;
  objc_super v15;
  _QWORD block[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTCoreSpotlightIndexBatchGenerator;
  v5 = -[MTCoreSpotlightIndexBatchGenerator init](&v15, "init");
  if (v5)
  {
    if (qword_10001A390 != -1)
      dispatch_once(&qword_10001A390, &stru_1000145A8);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005764;
    block[3] = &unk_1000145D0;
    block[4] = &v17;
    dispatch_sync((dispatch_queue_t)qword_10001A398, block);
    v6 = v18[3];
    _Block_object_dispose(&v17, 8);
    v5->_debugID = v6;
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    indexAllCompletions = v5->_indexAllCompletions;
    v5->_indexAllCompletions = (NSMutableArray *)v7;

    -[MTCoreSpotlightIndexBatchGenerator reset](v5, "reset");
    if (v4)
    {
      v5->_nextIndexPath.object = objc_msgSend(v4, "section");
      v5->_nextIndexPath.batch = (int64_t)objc_msgSend(v4, "row");
    }
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    externallyProcessedMOIDs = v5->_externallyProcessedMOIDs;
    v5->_externallyProcessedMOIDs = (NSMutableSet *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateQueueContext"));
    context = v5->_context;
    v5->_context = (NSManagedObjectContext *)v12;

  }
  return v5;
}

- (MTCoreSpotlightIndexBatchGenerator)init
{
  return -[MTCoreSpotlightIndexBatchGenerator initWithStartingIndexPath:](self, "initWithStartingIndexPath:", 0);
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTCoreSpotlightIndexBatchGenerator;
  v3 = -[MTCoreSpotlightIndexBatchGenerator description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_debugID));
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (self->_finished)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!self->_canceled)
    v7 = CFSTR("NO");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, debugID=%@, finished=%@, canceled=%@"), v4, v5, v8, v7));

  return v9;
}

- (id)nextBatchWithTransformationBlock:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;
  NSFetchRequest *v12;
  NSFetchRequest *currentFetchRequest;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  if (-[MTCoreSpotlightIndexBatchGenerator canceled](self, "canceled")
    || -[MTCoreSpotlightIndexBatchGenerator finished](self, "finished")
    || self->_nextIndexPath.object >= 3u)
  {
    -[MTCoreSpotlightIndexBatchGenerator setFinished:](self, "setFinished:", 1);
    v5 = 0;
  }
  else
  {
    -[NSFetchRequest setFetchOffset:](self->_currentFetchRequest, "setFetchOffset:", self->_nextIndexPath.batch);
    v7 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = sub_100005018;
    v33 = sub_100005028;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = sub_100005018;
    v27 = sub_100005028;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    while (!objc_msgSend(v7, "count") && !*((_BYTE *)v20 + 24))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightIndexBatchGenerator context](self, "context"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100005030;
      v14[3] = &unk_1000144D8;
      v14[4] = self;
      v16 = &v29;
      v17 = &v19;
      v18 = &v23;
      v15 = v4;
      objc_msgSend(v8, "performBlockAndWait:", v14);

      if (!objc_msgSend((id)v24[5], "count") && !*((_BYTE *)v20 + 24))
      {
        v9 = self->_nextIndexPath.batch + 1;
        self->_nextIndexPath.batch = v9;
        -[NSFetchRequest setFetchOffset:](self->_currentFetchRequest, "setFetchOffset:", v9);
      }

      v7 = (void *)v24[5];
    }
    v10 = (void *)v24[5];
    if (!v10)
    {
      objc_msgSend((id)v30[5], "logAndThrow:", 1);
      v10 = (void *)v24[5];
    }
    if (objc_msgSend(v10, "count"))
    {
      ++self->_nextIndexPath.batch;
      v11 = (id)v24[5];
    }
    else
    {
      ++self->_nextIndexPath.object;
      self->_nextIndexPath.batch = 0;
      v12 = (NSFetchRequest *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil fetchRequestForIndexType:](MTCoreSpotlightUtil, "fetchRequestForIndexType:"));
      currentFetchRequest = self->_currentFetchRequest;
      self->_currentFetchRequest = v12;

      v11 = (id)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightIndexBatchGenerator nextBatchWithTransformationBlock:](self, "nextBatchWithTransformationBlock:", v4));
    }
    v5 = v11;
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
  }

  return v5;
}

- (BOOL)collectNextBatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  MTCoreSpotlightIndexBatchGenerator *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  MTCoreSpotlightIndexBatchGenerator *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightIndexBatchGenerator nextBatchWithTransformationBlock:](self, "nextBatchWithTransformationBlock:", &stru_100014518));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCoreSpotlightIndexBatchGenerator context](self, "context"));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000052CC;
    v16 = &unk_100014540;
    v20 = v4;
    v17 = self;
    v7 = v5;
    v18 = v7;
    v19 = v6;
    v8 = v6;
    objc_msgSend(v8, "performBlockAndWait:", &v13);
    v9 = objc_msgSend(v7, "count", v13, v14, v15, v16, v17) != 0;

  }
  else
  {
    v10 = _MTLogCategorySpotlight();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Indexing] *** batch processing - no more entities for processing [%@]", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    v9 = 0;
  }

  return v9;
}

- (void)cancel
{
  -[MTCoreSpotlightIndexBatchGenerator setCanceled:](self, "setCanceled:", 1);
  -[MTCoreSpotlightIndexBatchGenerator setFinished:](self, "setFinished:", 1);
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
  if (a3)
    -[MTCoreSpotlightIndexBatchGenerator setFinished:](self, "setFinished:", 1);
}

- (void)reset
{
  NSFetchRequest *v3;
  NSFetchRequest *currentFetchRequest;
  NSMutableSet *v5;
  NSMutableSet *externallyProcessedMOIDs;

  self->_nextIndexPath.batch = 0;
  self->_nextIndexPath.object = 0;
  v3 = (NSFetchRequest *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil fetchRequestForIndexType:](MTCoreSpotlightUtil, "fetchRequestForIndexType:", 0));
  currentFetchRequest = self->_currentFetchRequest;
  self->_currentFetchRequest = v3;

  v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  externallyProcessedMOIDs = self->_externallyProcessedMOIDs;
  self->_externallyProcessedMOIDs = v5;

  -[MTCoreSpotlightIndexBatchGenerator setCanceled:](self, "setCanceled:", 0);
  -[MTCoreSpotlightIndexBatchGenerator setFinished:](self, "setFinished:", 0);
}

- (id)nextIndexPath
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", self->_nextIndexPath.batch, self->_nextIndexPath.object);
}

- (void)markUpdateUnnecessaryForObjectIDs:(id)a3
{
  if (a3)
    -[NSMutableSet addObjectsFromArray:](self->_externallyProcessedMOIDs, "addObjectsFromArray:");
}

- (id)_entitiesByRemovingAlreadyProcessedFrom:(id)a3
{
  id v3;
  void *v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  int v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000561C;
  v10[3] = &unk_100014568;
  v10[4] = self;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_filter:", v10));
  v5 = objc_msgSend(v3, "count");

  v6 = v5 - (_BYTE *)objc_msgSend(v4, "count");
  if (v6 >= 1)
  {
    v7 = _MTLogCategorySpotlight();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[BatchGenerator] filtering out %d already encountered items", buf, 8u);
    }

  }
  return v4;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableArray)indexAllCompletions
{
  return self->_indexAllCompletions;
}

- (int64_t)debugID
{
  return self->_debugID;
}

- (void)setDebugID:(int64_t)a3
{
  self->_debugID = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSFetchRequest)currentFetchRequest
{
  return self->_currentFetchRequest;
}

- (void)setCurrentFetchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentFetchRequest, a3);
}

- (NSMutableSet)externallyProcessedMOIDs
{
  return self->_externallyProcessedMOIDs;
}

- (void)setExternallyProcessedMOIDs:(id)a3
{
  objc_storeStrong((id *)&self->_externallyProcessedMOIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externallyProcessedMOIDs, 0);
  objc_storeStrong((id *)&self->_currentFetchRequest, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_indexAllCompletions, 0);
}

@end

@implementation GKDelayedRequestWriter

+ (id)writerWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  id v17;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "databaseConnection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "databaseConnection"));
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v15 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "databaseConnection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "databaseConnection"));
    v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cacheReader.databaseConnection (%@) is not shared by the cacheWriter.databaseConnection (%@) Exiting to reset"), v19, v20));

    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v21, 0));
    objc_exception_throw(v22);
  }
  v17 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v16)), "initWithCacheWriter:cacheReader:networkWriter:batchSubmissionInterval:", v10, v11, v12, a6);

  return v17;
}

- (GKDelayedRequestWriter)initWithCacheWriter:(id)a3 cacheReader:(id)a4 networkWriter:(id)a5 batchSubmissionInterval:(double)a6
{
  id v10;
  id v11;
  id v12;
  GKDelayedRequestWriter *v13;
  GKDelayedRequestWriter *v14;
  NSSet *v15;
  NSSet *resourcesPending;
  dispatch_queue_t v17;
  OS_dispatch_queue *operationQueue;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GKDelayedRequestWriter;
  v13 = -[GKDelayedRequestWriter init](&v20, "init");
  v14 = v13;
  if (v13)
  {
    -[GKDelayedRequestWriter setCacheWriter:](v13, "setCacheWriter:", v10);
    -[GKDelayedRequestWriter setCacheReader:](v14, "setCacheReader:", v11);
    -[GKDelayedRequestWriter setNetworkWriter:](v14, "setNetworkWriter:", v12);
    v15 = (NSSet *)objc_alloc_init((Class)NSSet);
    resourcesPending = v14->_resourcesPending;
    v14->_resourcesPending = v15;

    v14->_shouldWaitForNetworkError = 1;
    v14->_intervalInSeconds = a6;
    v17 = dispatch_queue_create("com.apple.gamed.delayedRequests.batchQueue", 0);
    operationQueue = v14->_operationQueue;
    v14->_operationQueue = (OS_dispatch_queue *)v17;

  }
  return v14;
}

- (void)batchAndPerformInGroup:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[5];
  void (**v10)(_QWORD);
  uint64_t v11;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = v7;
  if (self->_intervalInSeconds <= 0.0)
  {
    v7[2](v7);
  }
  else
  {
    ++qword_100317F18;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000D2470;
    v9[3] = &unk_1002C1C70;
    v9[4] = self;
    v11 = qword_100317F18;
    v10 = v7;
    objc_msgSend(v6, "perform:", v9);

  }
}

- (void)submitDelayedRequestsForPlayer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v10 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet _gkSetOfResourcesWithIDs:](NSSet, "_gkSetOfResourcesWithIDs:", v8));
  -[GKDelayedRequestWriter readAndSubmitDelayedRequestsOfResources:handler:](self, "readAndSubmitDelayedRequestsOfResources:handler:", v9, v7);

}

- (void)deleteSubmittedRequestsWithIDs:(id)a3 onConnection:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D2798;
  v9[3] = &unk_1002C1A08;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM requests WHERE request_id = %s;"),
                ":request_id"));
  v7 = v5;
  v11 = v7;
  v8 = v10;
  objc_msgSend(v6, "performAsyncTransaction:handler:", v9, &stru_1002C1C90);

}

- (void)readAndSubmitDelayedRequestsOfResources:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  dispatch_queue_global_t global_queue;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDelayedRequestWriter.mm", 129, "-[GKDelayedRequestWriter readAndSubmitDelayedRequestsOfResources:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000D2C00;
  v20[3] = &unk_1002C1D30;
  v20[4] = self;
  v10 = v6;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  v23 = v24;
  objc_msgSend(v11, "perform:", v20);
  global_queue = dispatch_get_global_queue(0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D3334;
  v16[3] = &unk_1002C1D58;
  v14 = v7;
  v18 = v14;
  v15 = v11;
  v17 = v15;
  v19 = v24;
  objc_msgSend(v15, "notifyOnQueue:block:", v13, v16);

  _Block_object_dispose(v24, 8);
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  NSObject *operationQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unsigned __int8 v15;

  v6 = a3;
  v7 = a4;
  v8 = -[GKDelayedRequestWriter shouldWaitForNetworkError](self, "shouldWaitForNetworkError");
  operationQueue = self->_operationQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D3468;
  v12[3] = &unk_1002C1EC0;
  v12[4] = self;
  v13 = v6;
  v15 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(operationQueue, v12);

}

- (void)writeResourcesToCacheOnly:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *operationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  operationQueue = self->_operationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3EC8;
  block[3] = &unk_1002C1DD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(operationQueue, block);

}

- (BOOL)shouldWaitForNetworkError
{
  return self->_shouldWaitForNetworkError;
}

- (void)setShouldWaitForNetworkError:(BOOL)a3
{
  self->_shouldWaitForNetworkError = a3;
}

- (double)intervalInSeconds
{
  return self->_intervalInSeconds;
}

- (void)setIntervalInSeconds:(double)a3
{
  self->_intervalInSeconds = a3;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSSet)resourcesPending
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResourcesPending:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (GKDatabaseWriter)cacheWriter
{
  return self->_cacheWriter;
}

- (void)setCacheWriter:(id)a3
{
  objc_storeStrong((id *)&self->_cacheWriter, a3);
}

- (GKDatabaseReader)cacheReader
{
  return self->_cacheReader;
}

- (void)setCacheReader:(id)a3
{
  objc_storeStrong((id *)&self->_cacheReader, a3);
}

- (GKDataWriter)networkWriter
{
  return self->_networkWriter;
}

- (void)setNetworkWriter:(id)a3
{
  objc_storeStrong((id *)&self->_networkWriter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkWriter, 0);
  objc_storeStrong((id *)&self->_cacheReader, 0);
  objc_storeStrong((id *)&self->_cacheWriter, 0);
  objc_storeStrong((id *)&self->_resourcesPending, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end

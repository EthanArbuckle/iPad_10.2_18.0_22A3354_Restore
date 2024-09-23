@implementation BCStackManager

- (BCStackManager)initWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 renderer:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCStackManager *v11;
  BCStackManager *v12;
  uint64_t v13;
  NSMutableArray *imagesProcessing;
  uint64_t v15;
  BICWorkQueue *workQueue;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BCStackManager;
  v11 = -[BCStackManager init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    v11->_accessLock._os_unfair_lock_opaque = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    imagesProcessing = v12->_imagesProcessing;
    v12->_imagesProcessing = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_renderer, a5);
    v15 = objc_claimAutoreleasedReturnValue(+[BICWorkQueue workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:](BICWorkQueue, "workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:", v8, v9, 6));
    workQueue = v12->_workQueue;
    v12->_workQueue = (BICWorkQueue *)v15;

    -[BICWorkQueue setIdentifier:](v12->_workQueue, "setIdentifier:", CFSTR("StackManager"));
    -[BICWorkQueue setManualCompletion:](v12->_workQueue, "setManualCompletion:", 1);
    -[BICWorkQueue setWorkItemTimeout:](v12->_workQueue, "setWorkItemTimeout:", 10.0);
  }

  return v12;
}

- (void)renderStackFromSource:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];
  void (*v22)(uint64_t);
  void *v23;
  BCStackManager *v24;
  id v25;
  _QWORD v26[2];
  void (*v27)(uint64_t);
  void *v28;
  BCStackManager *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  id v37;

  v6 = a3;
  v7 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v27 = sub_5BE0;
  v28 = &unk_28B7E0;
  v31 = &v32;
  v29 = self;
  v8 = v6;
  v30 = v8;
  v9 = v26;
  os_unfair_lock_lock(&self->_accessLock);
  v27((uint64_t)v9);
  os_unfair_lock_unlock(&self->_accessLock);

  if (!*((_BYTE *)v33 + 24))
    goto LABEL_5;
  v10 = BCImageCacheLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "BCStackManager: Already Rendering stack for: %@", buf, 0xCu);
  }

  if (!*((_BYTE *)v33 + 24))
  {
LABEL_5:
    v12 = BCImageCacheLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "BCStackManager: Rendering stack for: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterStacks[0]);
    +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationStackCreationQueueStart[0], v7);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v22 = sub_5C2C;
    v23 = &unk_28B808;
    v24 = self;
    v14 = v8;
    v25 = v14;
    v15 = v21;
    os_unfair_lock_lock(&self->_accessLock);
    v22((uint64_t)v15);
    os_unfair_lock_unlock(&self->_accessLock);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCStackManager workQueue](self, "workQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_5C6C;
    v17[3] = &unk_28B8A8;
    objc_copyWeak(&v20, (id *)buf);
    v18 = v7;
    v19 = v14;
    objc_msgSend(v16, "addWorkItemWithPriority:description:block:", v18, CFSTR("StackManager render stack"), v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v32, 8);
}

- (void)_renderCompleteSource:(id)a3 to:(id)a4 forRequest:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;

  v8 = a3;
  v9 = BICCacheStatsOperationStackCreationEnd[0];
  v10 = a5;
  v11 = a4;
  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", v9, v10);
  v12 = BCImageCacheLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "BCStackManager: Completed Rendering stack for: %@", (uint8_t *)&v15, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCStackManager delegate](self, "delegate"));
  objc_msgSend(v14, "stackRenderingResultSrc:result:forRequest:", v8, v11, v10);

}

- (BCCacheStackManagerDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (BCCacheStackManagerDelegate *)a3;
}

- (BCStackRendering)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (BICWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableArray)imagesProcessing
{
  return self->_imagesProcessing;
}

- (void)setImagesProcessing:(id)a3
{
  objc_storeStrong((id *)&self->_imagesProcessing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesProcessing, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end

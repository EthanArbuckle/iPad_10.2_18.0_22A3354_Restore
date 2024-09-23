@implementation BEPageSnapshotCacheOperation

- (BEPageSnapshotCacheOperation)initWithDataSource:(id)a3
{
  id v4;
  BEPageSnapshotCacheOperation *v5;
  BEPageSnapshotCacheOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BEPageSnapshotCacheOperation;
  v5 = -[BEPageSnapshotCacheOperation initWithOptions:](&v8, "initWithOptions:", 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v6->_extraCompletionsAccessLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (id)callbackInvocationWithImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCacheOperation renderingCacheCallbackInvocationWithImage:pageNumber:](self, "renderingCacheCallbackInvocationWithImage:pageNumber:", v4, -[BEPageSnapshotCacheOperation pageNumber](self, "pageNumber")));

  return v5;
}

- (id)generateImage:(CGSize)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  os_unfair_lock_s *p_extraCompletionsAccessLock;
  _QWORD *v8;
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  BEPageSnapshotCacheOperation *v13;
  uint64_t *v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if ((-[BEPageSnapshotCacheOperation isCancelled](self, "isCancelled", a3.width, a3.height) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = dispatch_semaphore_create(0);
    -[BEPageSnapshotCacheOperation setDispatchSemaphore:](self, "setDispatchSemaphore:", v5);

    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_9D8FC;
    v20 = sub_9D90C;
    v21 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9D914;
    block[3] = &unk_1C0E98;
    block[4] = self;
    block[5] = &v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v6 = objc_claimAutoreleasedReturnValue(-[BEPageSnapshotCacheOperation dispatchSemaphore](self, "dispatchSemaphore"));
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

    if ((-[BEPageSnapshotCacheOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      p_extraCompletionsAccessLock = &self->_extraCompletionsAccessLock;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v11 = sub_9DA14;
      v12 = &unk_1C0E98;
      v13 = self;
      v14 = &v16;
      v8 = v10;
      os_unfair_lock_lock(p_extraCompletionsAccessLock);
      v11((uint64_t)v8);
      os_unfair_lock_unlock(p_extraCompletionsAccessLock);

      v4 = (id)v17[5];
    }
    _Block_object_dispose(&v16, 8);

  }
  return v4;
}

- (void)addExtraCompletion:(id)a3
{
  os_unfair_lock_s *p_extraCompletionsAccessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_extraCompletionsAccessLock = &self->_extraCompletionsAccessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9DC54;
  v5[3] = &unk_1BFDB8;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_extraCompletionsAccessLock);
  sub_9DC54((uint64_t)v5);
  os_unfair_lock_unlock(p_extraCompletionsAccessLock);

}

- (unint64_t)pageNumber
{
  return self->pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->pageNumber = a3;
}

- (CGSize)snapshotSize
{
  double width;
  double height;
  CGSize result;

  width = self->snapshotSize.width;
  height = self->snapshotSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSnapshotSize:(CGSize)a3
{
  self->snapshotSize = a3;
}

- (NSMutableSet)extraCompletions
{
  return self->_extraCompletions;
}

- (void)setExtraCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_extraCompletions, a3);
}

- (BEPageSnapshotCacheDataSource)dataSource
{
  return (BEPageSnapshotCacheDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (OS_dispatch_semaphore)dispatchSemaphore
{
  return self->_dispatchSemaphore;
}

- (void)setDispatchSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSemaphore, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_extraCompletions, 0);
}

@end

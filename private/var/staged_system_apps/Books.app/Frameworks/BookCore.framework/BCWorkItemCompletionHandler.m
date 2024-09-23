@implementation BCWorkItemCompletionHandler

+ (id)newCompletionHandlerWithWorkItem:(id)a3 onQueue:(id)a4
{
  id v5;
  id v6;
  BCWorkItemCompletionHandler *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(BCWorkItemCompletionHandler);
  -[BCWorkItemCompletionHandler setWorkQueue:](v7, "setWorkQueue:", v5);

  -[BCWorkItemCompletionHandler setWorkItem:](v7, "setWorkItem:", v6);
  return v7;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;

  if (!self->_completionCount)
  {
    v3 = BCImageCacheLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1B4C74();

    -[BICWorkQueue workComplete:](self->_workQueue, "workComplete:", self->_workItem);
  }
  v5.receiver = self;
  v5.super_class = (Class)BCWorkItemCompletionHandler;
  -[BCWorkItemCompletionHandler dealloc](&v5, "dealloc");
}

- (void)workComplete
{
  id v3;
  NSObject *v4;
  void *v5;

  if (-[BCWorkItemCompletionHandler completionCount](self, "completionCount"))
  {
    v3 = BCImageCacheLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1B4CE0();
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(-[BCWorkItemCompletionHandler workQueue](self, "workQueue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCWorkItemCompletionHandler workItem](self, "workItem"));
    -[NSObject workComplete:](v4, "workComplete:", v5);

  }
  -[BCWorkItemCompletionHandler setCompletionCount:](self, "setCompletionCount:", (char *)-[BCWorkItemCompletionHandler completionCount](self, "completionCount") + 1);
}

- (BICWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (BICWorkItem)workItem
{
  return self->_workItem;
}

- (void)setWorkItem:(id)a3
{
  objc_storeStrong((id *)&self->_workItem, a3);
}

- (int64_t)completionCount
{
  return self->_completionCount;
}

- (void)setCompletionCount:(int64_t)a3
{
  self->_completionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workItem, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end

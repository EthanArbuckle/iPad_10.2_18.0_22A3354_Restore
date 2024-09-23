@implementation ISOperationQueue

- (ISOperationQueue)init
{
  ISOperationQueue *v3;
  NSOperationQueue *v4;
  NSOperationQueue *queue;
  objc_super v7;

  __ISRecordSPIClassUsage(self);
  v7.receiver = self;
  v7.super_class = (Class)ISOperationQueue;
  v3 = -[ISOperationQueue init](&v7, sel_init);
  if (v3)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v3->_queue;
    v3->_queue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_queue, "setMaxConcurrentOperationCount:", 3);
    -[NSOperationQueue addObserver:forKeyPath:options:context:](v3->_queue, "addObserver:forKeyPath:options:context:", v3, CFSTR("operationCount"), 0, 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue removeObserver:forKeyPath:context:](self->_queue, "removeObserver:forKeyPath:context:", self, CFSTR("operationCount"), 0);
  -[NSOperationQueue cancelAllOperations](self->_queue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)ISOperationQueue;
  -[ISOperationQueue dealloc](&v3, sel_dealloc);
}

+ (id)mainQueue
{
  pthread_once(&mainQueue_sInstanceGuard, __CreateMainQueue);
  return (id)__MainQueue;
}

- (void)addOperation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[ISUniqueOperationManager sharedInstance](ISUniqueOperationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkInOperation:", v5);

  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v5);
}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[ISUniqueOperationManager sharedInstance](ISUniqueOperationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "checkInOperation:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  -[NSOperationQueue addOperations:waitUntilFinished:](self->_queue, "addOperations:waitUntilFinished:", v8, v4);
}

- (BOOL)adjustsMaxConcurrentOperationCount
{
  return ISUniqueOperationQueueAdjustsConcurrentOperationCount(self->_queue);
}

- (void)cancelAllOperations
{
  -[NSOperationQueue cancelAllOperations](self->_queue, "cancelAllOperations");
}

- (int64_t)operationCount
{
  return -[NSOperationQueue operationCount](self->_queue, "operationCount");
}

- (int64_t)maxConcurrentOperationCount
{
  return -[NSOperationQueue maxConcurrentOperationCount](self->_queue, "maxConcurrentOperationCount");
}

- (id)name
{
  return -[NSOperationQueue name](self->_queue, "name");
}

- (id)operations
{
  return -[NSOperationQueue operations](self->_queue, "operations");
}

- (void)setAdjustsMaxConcurrentOperationCount:(BOOL)a3
{
  ISUniqueOperationQueueSetAdjustsConcurrentOperationCount(self->_queue, a3);
}

- (void)setMaxConcurrentOperationCount:(int64_t)a3
{
  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_queue, "setMaxConcurrentOperationCount:", a3);
}

- (void)setName:(id)a3
{
  -[NSOperationQueue setName:](self->_queue, "setName:", a3);
}

- (void)setSuspended:(BOOL)a3
{
  -[NSOperationQueue setSuspended:](self->_queue, "setSuspended:", a3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ISOperationQueueOperationCountChangedNotification"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

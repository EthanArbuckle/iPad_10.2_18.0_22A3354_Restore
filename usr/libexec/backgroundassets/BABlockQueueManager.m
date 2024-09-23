@implementation BABlockQueueManager

- (BABlockQueueManager)init
{
  BABlockQueueManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *identifiersToBlockQueues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BABlockQueueManager;
  v2 = -[BABlockQueueManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    identifiersToBlockQueues = v2->_identifiersToBlockQueues;
    v2->_identifiersToBlockQueues = v3;

  }
  return v2;
}

- (id)blockQueueWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  BABlockQueue *v8;
  void *v9;

  v4 = a3;
  v5 = self->_identifiersToBlockQueues;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueueManager identifiersToBlockQueues](self, "identifiersToBlockQueues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  if (v7)
  {
    objc_msgSend(v7, "_increment");
    v8 = v7;
  }
  else
  {
    v8 = -[BABlockQueue initWithIdentifier:]([BABlockQueue alloc], "initWithIdentifier:", v4);
    -[BABlockQueue _increment](v8, "_increment");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueueManager identifiersToBlockQueues](self, "identifiersToBlockQueues"));
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

  }
  objc_sync_exit(v5);

  return v8;
}

- (void)invalidateBlockQueue:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = objc_opt_class(BABlockQueue, v4);
  if ((objc_opt_isKindOfClass(v10, v5) & 1) == 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("Caller invoked invalidateBlockQueue on BABlockQueueManager with an object that was not a BABlockQueue."), 0));
    objc_exception_throw(v9);
  }
  v6 = self->_identifiersToBlockQueues;
  objc_sync_enter(v6);
  objc_msgSend(v10, "_decrement");
  if (!objc_msgSend(v10, "queueRetainCount"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BABlockQueueManager identifiersToBlockQueues](self, "identifiersToBlockQueues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    objc_msgSend(v7, "removeObjectForKey:", v8);

    objc_msgSend(v10, "drain");
  }
  objc_sync_exit(v6);

}

- (NSMutableDictionary)identifiersToBlockQueues
{
  return self->_identifiersToBlockQueues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToBlockQueues, 0);
}

@end

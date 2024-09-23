@implementation PLSpotlightAsyncOperation

- (void)setOperationState:(unint64_t)a3
{
  void *v4;
  void *v5;
  PLSpotlightAsyncOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PLSpotlightAsyncOperation _keyObserverStringForOperationState:](obj, "_keyObserverStringForOperationState:", obj->_operationState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpotlightAsyncOperation _keyObserverStringForOperationState:](obj, "_keyObserverStringForOperationState:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSpotlightAsyncOperation willChangeValueForKey:](obj, "willChangeValueForKey:", v4);
  -[PLSpotlightAsyncOperation willChangeValueForKey:](obj, "willChangeValueForKey:", v5);
  obj->_operationState = a3;
  -[PLSpotlightAsyncOperation didChangeValueForKey:](obj, "didChangeValueForKey:", v4);
  -[PLSpotlightAsyncOperation didChangeValueForKey:](obj, "didChangeValueForKey:", v5);

  objc_sync_exit(obj);
}

- (unint64_t)operationState
{
  PLSpotlightAsyncOperation *v2;
  unint64_t operationState;

  v2 = self;
  objc_sync_enter(v2);
  operationState = v2->_operationState;
  objc_sync_exit(v2);

  return operationState;
}

- (id)_keyObserverStringForOperationState:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E366CAA8[a3];
}

- (void)start
{
  if (-[PLSpotlightAsyncOperation isCancelled](self, "isCancelled"))
  {
    -[PLSpotlightAsyncOperation setOperationState:](self, "setOperationState:", 2);
  }
  else
  {
    -[PLSpotlightAsyncOperation setOperationState:](self, "setOperationState:", 1);
    -[PLSpotlightAsyncOperation main](self, "main");
  }
}

- (void)main
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSpotlightAsyncOperation.m"), 75, CFSTR("This method must be overridden by the subclass"));

}

- (void)cancel
{
  -[PLSpotlightAsyncOperation setOperationState:](self, "setOperationState:", 2);
}

- (BOOL)isExecuting
{
  return -[PLSpotlightAsyncOperation operationState](self, "operationState") == 1;
}

- (BOOL)isFinished
{
  return -[PLSpotlightAsyncOperation operationState](self, "operationState") == 2;
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end

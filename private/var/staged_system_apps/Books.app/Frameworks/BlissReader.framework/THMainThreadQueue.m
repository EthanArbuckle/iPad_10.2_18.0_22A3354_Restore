@implementation THMainThreadQueue

- (THMainThreadQueue)init
{
  THMainThreadQueue *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THMainThreadQueue;
  v2 = -[THMainThreadQueue init](&v4, "init");
  if (v2)
  {
    -[THMainThreadQueue setWaitingBlockTimers:](v2, "setWaitingBlockTimers:", +[NSMutableSet set](NSMutableSet, "set"));
    -[THMainThreadQueue setQueuedOperations:](v2, "setQueuedOperations:", +[NSMutableSet set](NSMutableSet, "set"));
  }
  return v2;
}

+ (id)queue
{
  return objc_alloc_init((Class)a1);
}

- (void)dealloc
{
  objc_super v3;

  -[THMainThreadQueue cancel](self, "cancel");
  -[THMainThreadQueue setQueuedOperations:](self, "setQueuedOperations:", 0);
  -[THMainThreadQueue setWaitingBlockTimers:](self, "setWaitingBlockTimers:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THMainThreadQueue;
  -[THMainThreadQueue dealloc](&v3, "dealloc");
}

- (void)cancel
{
  NSMutableSet *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableSet *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[128];

  objc_sync_enter(self);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = -[THMainThreadQueue waitingBlockTimers](self, "waitingBlockTimers");
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v6), "invalidate");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v4);
  }
  -[NSMutableSet removeAllObjects](-[THMainThreadQueue waitingBlockTimers](self, "waitingBlockTimers"), "removeAllObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = -[THMainThreadQueue queuedOperations](self, "queuedOperations", 0);
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "cancel");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v8);
  }
  -[NSMutableSet removeAllObjects](-[THMainThreadQueue queuedOperations](self, "queuedOperations"), "removeAllObjects");
  objc_sync_exit(self);
}

- (void)enqueueMainThreadBlock:(id)a3
{
  NSBlockOperation *v5;
  NSOperationQueue *v6;
  NSMutableSet *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  _QWORD v15[6];

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THMainThreadQueue enqueueMainThreadBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THMainThreadQueue.m"), 58, CFSTR("invalid nil value for '%s'"), "block");
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = sub_61A2C;
  v15[4] = sub_61A3C;
  v15[5] = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_61A2C;
  v13 = sub_61A3C;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_61A48;
  v8[3] = &unk_427F38;
  v8[5] = v15;
  v8[6] = &v9;
  v8[4] = a3;
  v5 = +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v8);
  v10[5] = (uint64_t)v5;
  objc_sync_enter(self);
  v6 = +[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue");
  -[NSOperationQueue addOperation:](v6, "addOperation:", v10[5]);
  v7 = -[THMainThreadQueue queuedOperations](self, "queuedOperations");
  -[NSMutableSet addObject:](v7, "addObject:", v10[5]);
  objc_sync_exit(self);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v15, 8);
}

- (void)p_dispatchTimedMainThreadBlock:(id)a3
{
  id v5;
  _QWORD v6[7];
  _QWORD v7[6];

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = sub_61A2C;
  v7[4] = sub_61A3C;
  v7[5] = self;
  v5 = objc_msgSend(a3, "userInfo");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_61BA8;
  v6[3] = &unk_427F60;
  v6[5] = v5;
  v6[6] = v7;
  v6[4] = a3;
  -[THMainThreadQueue enqueueMainThreadBlock:](self, "enqueueMainThreadBlock:", v6);

  _Block_object_dispose(v7, 8);
}

- (void)enqueueMainThreadBlock:(id)a3 afterDelay:(double)a4
{
  id v7;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THMainThreadQueue enqueueMainThreadBlock:afterDelay:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THMainThreadQueue.m"), 95, CFSTR("invalid nil value for '%s'"), "block");
  objc_sync_enter(self);
  v7 = objc_msgSend(a3, "copy");
  -[NSMutableSet addObject:](-[THMainThreadQueue waitingBlockTimers](self, "waitingBlockTimers"), "addObject:", +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_dispatchTimedMainThreadBlock:", v7, 0, a4));

  objc_sync_exit(self);
}

- (NSMutableSet)queuedOperations
{
  return self->mQueuedOperations;
}

- (void)setQueuedOperations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableSet)waitingBlockTimers
{
  return self->mWaitingBlockTimers;
}

- (void)setWaitingBlockTimers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

@implementation JSAThread

- (JSAThread)initWithName:(id)a3
{
  id v5;
  JSAThread *v6;
  JSAThread *v7;
  NSObject *v8;
  NSObject *scriptingThreadContext;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *accessQueue;
  uint64_t v16;
  NSMutableArray *pendingBlocks;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)JSAThread;
  v6 = -[JSAThread init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = objc_alloc_init((Class)NSObject);
    scriptingThreadContext = v7->_scriptingThreadContext;
    v7->_scriptingThreadContext = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.iBooks.JSAThread", v13);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v14;

    v7->_state = 0;
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingBlocks = v7->_pendingBlocks;
    v7->_pendingBlocks = (NSMutableArray *)v16;

  }
  return v7;
}

- (BOOL)isRunningOnThread
{
  void *v3;
  void *v4;
  NSObject *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "threadDictionary"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kScriptingThreadIdentifier));
  LOBYTE(self) = v5 == self->_scriptingThreadContext;

  return (char)self;
}

- (void)enqueueBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[JSAThread accessQueue](self, "accessQueue"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_12898;
  v11 = &unk_9E608;
  objc_copyWeak(&v14, &location);
  v13 = &v16;
  v6 = v4;
  v12 = v6;
  dispatch_sync(v5, &v8);

  v7 = v17[3];
  if (v7)
  {
    if (v7 == 2)
    {
      CFRunLoopSourceSignal(-[JSAThread runLoopSource](self, "runLoopSource", v8, v9, v10, v11));
      CFRunLoopWakeUp(-[JSAThread runLoop](self, "runLoop"));
    }
  }
  else
  {
    sub_1292C((uint64_t)self);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

}

- (void)enqueueBlockSync:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  id v13;

  v4 = a3;
  if (-[JSAThread isRunningOnThread](self, "isRunningOnThread"))
  {
    v7 = JSALog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_71FB8(v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s called on its own JSAThread"), "-[JSAThread enqueueBlockSync:]"));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v9, 0));

    objc_exception_throw(v10);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12AE0;
  v11[3] = &unk_9E630;
  v12 = dispatch_semaphore_create(0);
  v13 = v4;
  v5 = v12;
  v6 = v4;
  -[JSAThread enqueueBlock:](self, "enqueueBlock:", v11);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_performPendingBlocks
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];

  v3 = objc_autoreleasePoolPush();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_12CE4;
  v20 = sub_12CF4;
  v21 = 0;
  v4 = objc_claimAutoreleasedReturnValue(-[JSAThread accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12CFC;
  block[3] = &unk_9E0D8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(v4, block);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)v17[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        v10 = objc_autoreleasePoolPush();
        (*(void (**)(uint64_t))(v9 + 16))(v9);
        objc_autoreleasePoolPop(v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v16, 8);
  objc_autoreleasePoolPop(v3);
}

- (void)_scriptingThreadMain
{
  NSObject *scriptingThreadContext;
  void *v4;
  void *v5;
  __CFRunLoop *Current;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  CFRunLoopSourceContext context;

  scriptingThreadContext = self->_scriptingThreadContext;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "threadDictionary"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", scriptingThreadContext, kScriptingThreadIdentifier);

  context.version = 0;
  memset(&context.retain, 0, 56);
  context.info = self;
  context.perform = (void (__cdecl *)(void *))j__objc_msgSend__performPendingBlocks;
  self->_runLoopSource = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
  Current = CFRunLoopGetCurrent();
  self->_runLoop = Current;
  CFRunLoopAddSource(Current, self->_runLoopSource, kCFRunLoopDefaultMode);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[JSAThread accessQueue](self, "accessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12F04;
  block[3] = &unk_9E658;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v7, block);

  if (*((_BYTE *)v12 + 24))
  {
    CFRunLoopSourceSignal(self->_runLoopSource);
    CFRunLoopWakeUp(self->_runLoop);
  }
  CFRunLoopRun();
  v8 = objc_claimAutoreleasedReturnValue(-[JSAThread accessQueue](self, "accessQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_12F60;
  v9[3] = &unk_9E658;
  v9[4] = self;
  v9[5] = &v11;
  dispatch_sync(v8, v9);

  if (*((_BYTE *)v12 + 24))
    sub_1292C((uint64_t)self);
  _Block_object_dispose(&v11, 8);
}

- (NSString)name
{
  return self->_name;
}

- (NSObject)scriptingThreadContext
{
  return self->_scriptingThreadContext;
}

- (void)setScriptingThreadContext:(id)a3
{
  objc_storeStrong((id *)&self->_scriptingThreadContext, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void)setPendingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBlocks, a3);
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (__CFRunLoop)runLoop
{
  return self->_runLoop;
}

- (void)setRunLoop:(__CFRunLoop *)a3
{
  self->_runLoop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_scriptingThreadContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

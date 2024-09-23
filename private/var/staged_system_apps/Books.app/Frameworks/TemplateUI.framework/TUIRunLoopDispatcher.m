@implementation TUIRunLoopDispatcher

+ (id)sharedInstance
{
  if (qword_2CB7C8 != -1)
    dispatch_once(&qword_2CB7C8, &stru_242298);
  return (id)qword_2CB7C0;
}

- (id)initSharedInstance
{
  TUIRunLoopDispatcher *v2;
  TUIRunLoopDispatcher *v3;
  CFRunLoopRef Main;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *runLoopDispatchQueue;
  CFRunLoopSourceContext v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUIRunLoopDispatcher;
  v2 = -[TUIRunLoopDispatcher init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v12.version = 0;
    memset(&v12.retain, 0, 56);
    v12.info = v2;
    v12.perform = (void (__cdecl *)(void *))j__objc_msgSend__performPendingBlocks;
    v2->_runLoopSource = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &v12);
    Main = CFRunLoopGetMain();
    v3->_runLoop = Main;
    CFRetain(Main);
    CFRunLoopAddSource(v3->_runLoop, v3->_runLoopSource, kCFRunLoopDefaultMode);
    CFRunLoopAddSource(v3->_runLoop, v3->_runLoopSource, (CFRunLoopMode)UITrackingRunLoopMode);
    CFRunLoopAddSource(v3->_runLoop, v3->_runLoopSource, CFSTR("com.apple.iBooks.TemplateUI"));
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.iBooks.TUIRunLoopDispatcher.runLoopDispatchQueue", v8);
    runLoopDispatchQueue = v3->_runLoopDispatchQueue;
    v3->_runLoopDispatchQueue = (OS_dispatch_queue *)v9;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CFRunLoopSourceInvalidate(self->_runLoopSource);
  CFRelease(self->_runLoopSource);
  CFRelease(self->_runLoop);
  v3.receiver = self;
  v3.super_class = (Class)TUIRunLoopDispatcher;
  -[TUIRunLoopDispatcher dealloc](&v3, "dealloc");
}

+ (void)dispatchAsyncToMain:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v5, "_dispatchAsyncToMain:", v4);

}

+ (void)dispatchAfter:(unint64_t)a3 toMain:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v7, "_dispatchAfter:toMain:", a3, v6);

}

+ (int)drainWithTimeout:(double)a3
{
  void *v4;
  int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  v5 = objc_msgSend(v4, "_drainWithTimeout:", a3);

  return v5;
}

+ (void)dispatchGroup:(id)a3 notifyMain:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v8, "_dispatchGroup:notifyMain:", v7, v6);

}

- (void)_dispatchAsyncToMain:(id)a3
{
  id v4;
  NSMutableArray *pendingBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  v4 = -[NSMutableArray count](self->_pendingBlocks, "count");
  pendingBlocks = self->_pendingBlocks;
  if (!pendingBlocks)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_pendingBlocks;
    self->_pendingBlocks = v6;

    pendingBlocks = self->_pendingBlocks;
  }
  v8 = objc_retainBlock(v9);
  -[NSMutableArray addObject:](pendingBlocks, "addObject:", v8);

  os_unfair_lock_unlock(&self->_lock);
  if (!v4)
  {
    CFRunLoopSourceSignal(self->_runLoopSource);
    CFRunLoopWakeUp(self->_runLoop);
  }

}

- (void)_dispatchAfter:(unint64_t)a3 toMain:(id)a4
{
  id v6;
  NSObject *runLoopDispatchQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  runLoopDispatchQueue = self->_runLoopDispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1308F8;
  v9[3] = &unk_23E580;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_after(a3, runLoopDispatchQueue, v9);

}

- (int)_drainWithTimeout:(double)a3
{
  id v4;
  NSObject *v5;

  if (CFRunLoopGetCurrent() == self->_runLoop)
    return CFRunLoopRunInMode(CFSTR("com.apple.iBooks.TemplateUI"), a3, 1u);
  v4 = TUIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_17EF10(v5);

  if (_TUIDeviceHasInternalInstall())
    objc_exception_throw(objc_msgSend(objc_alloc((Class)NSException), "initWithName:reason:userInfo:", CFSTR("InvalidInvocation"), CFSTR("-drainWithTimeout should be called in main runloop only"), 0));
  return 1;
}

- (void)_dispatchGroup:(id)a3 notifyMain:(id)a4
{
  id v6;
  NSObject *runLoopDispatchQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  runLoopDispatchQueue = self->_runLoopDispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_130A48;
  v9[3] = &unk_23E580;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_group_notify((dispatch_group_t)a3, runLoopDispatchQueue, v9);

}

- (void)_performPendingBlocks
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  NSMutableArray *pendingBlocks;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  v4 = self->_pendingBlocks;
  pendingBlocks = self->_pendingBlocks;
  self->_pendingBlocks = 0;

  os_unfair_lock_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        (*(void (**)(uint64_t))(v11 + 16))(v11);
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (__CFRunLoop)runLoop
{
  return self->_runLoop;
}

- (OS_dispatch_queue)runLoopDispatchQueue
{
  return self->_runLoopDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoopDispatchQueue, 0);
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
}

@end

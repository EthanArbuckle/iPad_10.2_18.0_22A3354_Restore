@implementation _TUIFeedViewControllerQueueContext

- (_TUIFeedViewControllerQueueContext)init
{
  id v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_TUIFeedViewControllerQueueContext;
  v2 = -[_TUIFeedViewControllerQueueContext init](&v22, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("_TUIFeedViewControllerQueueContext.callbackQueue", v6);
    v8 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create_with_target_V2("_TUIFeedViewControllerQueueContext.userInteractiveCallbackQueue", v12, *((dispatch_queue_t *)v2 + 1));
    v14 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create_with_target_V2("_TUIFeedViewControllerQueueContext.userInitiatedCallbackQueue", v18, *((dispatch_queue_t *)v2 + 1));
    v20 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v19;

  }
  return (_TUIFeedViewControllerQueueContext *)v2;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_queue)userInteractiveCallbackQueue
{
  return self->_userInteractiveCallbackQueue;
}

- (OS_dispatch_queue)userInitiatedCallbackQueue
{
  return self->_userInitiatedCallbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInitiatedCallbackQueue, 0);
  objc_storeStrong((id *)&self->_userInteractiveCallbackQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end

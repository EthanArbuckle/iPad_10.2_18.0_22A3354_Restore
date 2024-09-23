@implementation RBSWorkloop

+ (id)sharedBackgroundWorkloop
{
  id *v2;
  id v3;

  v2 = (id *)+[RBSWorkloop sharedInstance]();
  v3 = v2[2];

  return v3;
}

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance___sharedInstance;
}

+ (void)performBackgroundWorkWithServiceClass:(unsigned int)a3 block:(id)a4
{
  dispatch_block_t v5;

  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, a4);
  objc_msgSend(a1, "performBackgroundWork:", v5);

}

+ (void)performBackgroundWork:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "sharedBackgroundWorkloop");
  dispatch_async(v5, v4);

}

+ (dispatch_queue_t)createCalloutQueue:(uint64_t)a1
{
  id v2;
  id v3;
  const char *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;

  v2 = a2;
  objc_opt_self();
  v3 = objc_retainAutorelease(v2);
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = +[RBSWorkloop sharedCalloutWorkloop]();
  v7 = dispatch_queue_create_with_target_V2(v4, v5, v6);

  return v7;
}

+ (id)sharedCalloutWorkloop
{
  id *v0;
  id v1;

  objc_opt_self();
  v0 = (id *)+[RBSWorkloop sharedInstance]();
  v1 = v0[1];

  return v1;
}

+ (id)createBackgroundQueue:(id)a3
{
  const char *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "sharedBackgroundWorkloop");
  v7 = dispatch_queue_create_with_target_V2(v4, v5, v6);

  return v7;
}

void __29__RBSWorkloop_sharedInstance__block_invoke()
{
  dispatch_workloop_t *v0;
  void *v1;

  v0 = -[RBSWorkloop _init]([RBSWorkloop alloc]);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (dispatch_workloop_t)_init
{
  dispatch_workloop_t *v1;
  dispatch_workloop_t inactive;
  dispatch_workloop_t v3;
  dispatch_workloop_t v4;
  dispatch_workloop_t v5;
  dispatch_workloop_t v6;
  dispatch_workloop_t v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)RBSWorkloop;
  v1 = (dispatch_workloop_t *)objc_msgSendSuper2(&v9, sel_init);
  if (v1)
  {
    inactive = dispatch_workloop_create_inactive("com.apple.runningboardservices.callout-workloop");
    v3 = v1[1];
    v1[1] = inactive;

    dispatch_workloop_set_autorelease_frequency(v1[1], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_set_qos_class_fallback();
    v4 = dispatch_workloop_create_inactive("com.apple.runningboardservices.background-workloop");
    v5 = v1[2];
    v1[2] = v4;

    dispatch_workloop_set_autorelease_frequency(v1[2], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_set_qos_class_fallback();
    v6 = dispatch_workloop_create_inactive("com.apple.runningboardservices.syncing-workloop");
    v7 = v1[3];
    v1[3] = v6;

    dispatch_workloop_set_autorelease_frequency(v1[3], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_set_qos_class_fallback();
    dispatch_activate(v1[1]);
    dispatch_activate(v1[2]);
    dispatch_activate(v1[3]);
  }
  return v1;
}

+ (id)sharedSyncingWorkloop
{
  id *v2;
  id v3;

  v2 = (id *)+[RBSWorkloop sharedInstance]();
  v3 = v2[3];

  return v3;
}

+ (void)performCallout:(uint64_t)a1
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_opt_self();
  v3 = +[RBSWorkloop sharedCalloutWorkloop]();
  dispatch_async(v3, v2);

}

+ (void)performCalloutWithServiceClass:(void *)a3 block:
{
  id v4;
  id v5;

  v4 = a3;
  objc_opt_self();
  v5 = +[RBSWorkloop sharedCalloutWorkloop]();
  RBSDispatchAsyncWithQoS(v5, a2, v4);

}

+ (id)createSyncingQueue:(id)a3
{
  id v3;
  id *v4;
  NSObject *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;

  v3 = a3;
  v4 = (id *)+[RBSWorkloop sharedInstance]();
  v5 = v4[3];

  v6 = objc_retainAutorelease(v3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create_with_target_V2(v7, v8, v5);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncingWorkloop, 0);
  objc_storeStrong((id *)&self->_backgroundWorkloop, 0);
  objc_storeStrong((id *)&self->_calloutWorkloop, 0);
}

@end

@implementation PFWorkloop

+ (OS_dispatch_workloop)sharedWorkloop
{
  if (sharedWorkloop_onceToken != -1)
    dispatch_once(&sharedWorkloop_onceToken, &__block_literal_global_2);
  return (OS_dispatch_workloop *)(id)sharedWorkloop_workloop;
}

void __28__PFWorkloop_sharedWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("com.apple.PosterUIFoundation.sharedWorkloop");
  v1 = (void *)sharedWorkloop_workloop;
  sharedWorkloop_workloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)sharedWorkloop_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedWorkloop_workloop);
}

+ (OS_dispatch_workloop)snapshotWorkloop
{
  if (snapshotWorkloop_onceToken != -1)
    dispatch_once(&snapshotWorkloop_onceToken, &__block_literal_global_2);
  return (OS_dispatch_workloop *)(id)snapshotWorkloop_workloop;
}

void __30__PFWorkloop_snapshotWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("com.apple.PosterUIFoundation.snapshotWorkloop");
  v1 = (void *)snapshotWorkloop_workloop;
  snapshotWorkloop_workloop = (uint64_t)inactive;

  dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)snapshotWorkloop_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)snapshotWorkloop_workloop);
}

+ (id)serialQueueTargetingSharedWorkloop:(id)a3
{
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  +[PFWorkloop sharedWorkloop](PFWorkloop, "sharedWorkloop");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);

  return v6;
}

+ (id)serialQueueTargetingSharedWorkloop:(id)a3 withQoS:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  +[PFWorkloop sharedWorkloop](PFWorkloop, "sharedWorkloop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serialQueueTargetingWorkloop:label:withQoS:", v7, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)serialQueueTargetingWorkloop:(id)a3 label:(id)a4 withQoS:(unsigned int)a5
{
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;

  v7 = objc_retainAutorelease(a4);
  v8 = a3;
  v9 = (const char *)objc_msgSend(v7, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)a5, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create_with_target_V2(v9, v11, v8);

  return v12;
}

+ (id)concurrentQueueTargetingWorkloop:(id)a3 label:(id)a4 withQoS:(unsigned int)a5
{
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;

  v7 = objc_retainAutorelease(a4);
  v8 = a3;
  v9 = (const char *)objc_msgSend(v7, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)a5, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create_with_target_V2(v9, v11, v8);

  return v12;
}

@end

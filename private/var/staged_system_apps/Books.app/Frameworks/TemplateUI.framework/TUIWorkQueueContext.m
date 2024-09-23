@implementation TUIWorkQueueContext

- (TUIWorkQueueContext)initWithQueue:(id)a3
{
  id v5;
  TUIWorkQueueContext *v6;
  dispatch_queue_t *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  dispatch_queue_t v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  dispatch_queue_t v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  dispatch_queue_t v25;
  dispatch_queue_attr_t v26;
  NSObject *v27;
  dispatch_queue_attr_t v28;
  NSObject *v29;
  dispatch_queue_t v30;
  dispatch_queue_t v31;
  dispatch_queue_attr_t v32;
  NSObject *v33;
  dispatch_queue_attr_t v34;
  NSObject *v35;
  dispatch_queue_t v36;
  dispatch_queue_t v37;
  dispatch_queue_attr_t v38;
  NSObject *v39;
  dispatch_queue_attr_t v40;
  NSObject *v41;
  dispatch_queue_t v42;
  dispatch_queue_t v43;
  dispatch_queue_attr_t v44;
  NSObject *v45;
  dispatch_queue_attr_t v46;
  NSObject *v47;
  dispatch_queue_t v48;
  dispatch_queue_t v49;
  objc_super v51;

  v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)TUIWorkQueueContext;
  v6 = -[TUIWorkQueueContext init](&v51, "init");
  v7 = (dispatch_queue_t *)v6;
  if (v6)
  {
    v6->_priority = 0.5;
    objc_storeStrong((id *)&v6->_workQueue, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.syncWorkQueue", v11, v7[6]);
    v13 = v7[7];
    v7[7] = v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.foregroundWorkQueue", v17, v7[6]);
    v19 = v7[8];
    v7[8] = v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_BACKGROUND, 0);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.backgroundWorkQueue", v23, v7[6]);
    v25 = v7[9];
    v7[9] = v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v28 = dispatch_queue_attr_make_with_qos_class(v27, QOS_CLASS_DEFAULT, 0);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v30 = dispatch_queue_create("TUIWorkQueueContext.callbackQueue", v29);
    v31 = v7[1];
    v7[1] = v30;

    v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v34 = dispatch_queue_attr_make_with_qos_class(v33, QOS_CLASS_USER_INTERACTIVE, 0);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    v36 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.syncCallbackQueue", v35, v7[1]);
    v37 = v7[2];
    v7[2] = v36;

    v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    v40 = dispatch_queue_attr_make_with_qos_class(v39, QOS_CLASS_USER_INITIATED, 0);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    v42 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.foregroundCallbackQueue", v41, v7[1]);
    v43 = v7[3];
    v7[3] = v42;

    v44 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = dispatch_queue_attr_make_with_qos_class(v45, QOS_CLASS_BACKGROUND, 0);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    v48 = dispatch_queue_create_with_target_V2("TUIWorkQueueContext.backgroundCallbackQueue", v47, v7[1]);
    v49 = v7[4];
    v7[4] = v48;

  }
  return (TUIWorkQueueContext *)v7;
}

- (TUIWorkQueueContext)init
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  TUIWorkQueueContext *v8;

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = dispatch_queue_create("TUIWorkQueueContext.workQueue", v6);
  v8 = -[TUIWorkQueueContext initWithQueue:](self, "initWithQueue:", v7);

  return v8;
}

- (id)activeQueue
{
  uint64_t v3;
  float v4;

  if (-[TUIWorkQueueContext synchronousTransactionInProgress](self, "synchronousTransactionInProgress"))
  {
    v3 = 56;
  }
  else
  {
    -[TUIWorkQueueContext priority](self, "priority");
    v3 = 64;
    if (v4 < 0.75)
      v3 = 72;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (id)activeCallbackQueue
{
  uint64_t v3;
  float v4;

  if (-[TUIWorkQueueContext synchronousTransactionInProgress](self, "synchronousTransactionInProgress"))
  {
    v3 = 16;
  }
  else
  {
    -[TUIWorkQueueContext priority](self, "priority");
    v3 = 24;
    if (v4 < 0.75)
      v3 = 32;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (BOOL)synchronousTransactionInProgress
{
  return self->_synchronousTransactionInProgress;
}

- (void)setSynchronousTransactionInProgress:(BOOL)a3
{
  self->_synchronousTransactionInProgress = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)syncWorkQueue
{
  return self->_syncWorkQueue;
}

- (OS_dispatch_queue)foregroundWorkQueue
{
  return self->_foregroundWorkQueue;
}

- (OS_dispatch_queue)backgroundWorkQueue
{
  return self->_backgroundWorkQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundWorkQueue, 0);
  objc_storeStrong((id *)&self->_foregroundWorkQueue, 0);
  objc_storeStrong((id *)&self->_syncWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_backgroundCallbackQueue, 0);
  objc_storeStrong((id *)&self->_foregroundCallbackQueue, 0);
  objc_storeStrong((id *)&self->_syncCallbackQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end

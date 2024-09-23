@implementation MSUCheckpointAsyncBlockContext

- (MSUCheckpointAsyncBlockContext)initWithQueue:(id)a3 block:(id)a4
{
  MSUCheckpointAsyncBlockContext *v6;
  MSUCheckpointAsyncBlockContext *v7;
  qos_class_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v12[6];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSUCheckpointAsyncBlockContext;
  v6 = -[MSUCheckpointAsyncContext init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      -[MSUCheckpointAsyncBlockContext setWorkQueue:](v6, "setWorkQueue:", a3);
    }
    else
    {
      v8 = qos_class_self();
      v9 = dispatch_queue_attr_make_with_qos_class(0, v8, 0);
      v10 = dispatch_queue_create(0, v9);
      -[MSUCheckpointAsyncBlockContext setWorkQueue:](v7, "setWorkQueue:", v10);
      dispatch_release(v10);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3254779904;
  v12[2] = sub_10000CCDC;
  v12[3] = &unk_100024A00;
  v12[4] = v7;
  v12[5] = a4;
  -[MSUCheckpointAsyncBlockContext setWorkBlock:](v7, "setWorkBlock:", dispatch_block_create((dispatch_block_flags_t)0, v12));
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSUCheckpointAsyncBlockContext;
  -[MSUCheckpointAsyncContext dealloc](&v3, "dealloc");
}

- (void)runSynchronousForCheckpoint:(void *)a3
{
  uint64_t step_desc;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[MSUCheckpointAsyncContext setCheckpoint_closure_context:](self, "setCheckpoint_closure_context:", a3);
  step_desc = checkpoint_closure_context_get_step_desc((uint64_t)-[MSUCheckpointAsyncContext checkpoint_closure_context](self, "checkpoint_closure_context"));
  ramrod_log_msg("[AsyncCP][DispatchSync] Checkpoint %s dispatched synchronously because async is disabled.\n", v5, v6, v7, v8, v9, v10, v11, *(_QWORD *)(step_desc + 8));
  dispatch_sync((dispatch_queue_t)-[MSUCheckpointAsyncBlockContext workQueue](self, "workQueue"), -[MSUCheckpointAsyncBlockContext workBlock](self, "workBlock"));
}

- (void)runForCheckpoint:(void *)a3
{
  uint64_t step_desc;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[MSUCheckpointAsyncContext setCheckpoint_closure_context:](self, "setCheckpoint_closure_context:", a3);
  step_desc = checkpoint_closure_context_get_step_desc((uint64_t)-[MSUCheckpointAsyncContext checkpoint_closure_context](self, "checkpoint_closure_context"));
  ramrod_log_msg("[AsyncCP][DispatchAsync] Checkpoint %s dispatched asynchronously.\n", v5, v6, v7, v8, v9, v10, v11, *(_QWORD *)(step_desc + 8));
  dispatch_async((dispatch_queue_t)-[MSUCheckpointAsyncBlockContext workQueue](self, "workQueue"), -[MSUCheckpointAsyncBlockContext workBlock](self, "workBlock"));
}

- (BOOL)wait
{
  return -[MSUCheckpointAsyncBlockContext waitUntilDate:](self, "waitUntilDate:", +[NSDate distantFuture](NSDate, "distantFuture"));
}

- (BOOL)waitUntilDate:(id)a3
{
  uint64_t step_desc;
  double v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  step_desc = checkpoint_closure_context_get_step_desc((uint64_t)-[MSUCheckpointAsyncContext checkpoint_closure_context](self, "checkpoint_closure_context"));
  objc_msgSend(a3, "timeIntervalSinceNow");
  v7 = dispatch_time(0, (uint64_t)rint(v6 * 1000000000.0));
  ramrod_log_msg("[AsyncCP][WaitStart] Start to Wait checkpoint %s.\n", v8, v9, v10, v11, v12, v13, v14, *(_QWORD *)(step_desc + 8));
  LOBYTE(v7) = dispatch_block_wait(-[MSUCheckpointAsyncBlockContext workBlock](self, "workBlock"), v7) == 0;
  ramrod_log_msg("[AsyncCP][WaitEnd] Wait checkpoint %s %s.\n", v15, v16, v17, v18, v19, v20, v21, *(_QWORD *)(step_desc + 8));
  return v7;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)workBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setWorkBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

@end

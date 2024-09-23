@implementation MZAsynchronousTask

- (MZAsynchronousTask)initWithHandlerQueue:(id)a3 taskTimeout:(double)a4 assertionTimeout:(double)a5 debugDescription:(id)a6
{
  id v11;
  id v12;
  MZAsynchronousTask *v13;
  MZAsynchronousTask *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  double v17;
  void *v18;
  NSObject *v19;
  dispatch_source_t v20;
  OS_dispatch_source *taskTimeoutTimer;
  NSObject *v22;
  dispatch_source_t *v23;
  dispatch_source_t v24;
  NSObject *v25;
  dispatch_source_t v26;
  dispatch_source_t v27;
  NSObject *v28;
  _QWORD v30[4];
  dispatch_source_t *v31;
  _QWORD handler[4];
  dispatch_source_t *v33;
  objc_super v34;

  v11 = a3;
  v12 = a6;
  v34.receiver = self;
  v34.super_class = (Class)MZAsynchronousTask;
  v13 = -[MZAsynchronousTask init](&v34, "init");
  v14 = v13;
  if (v13)
  {
    if (a5 > a4)
      a5 = a4;
    objc_storeStrong((id *)&v13->_handlerQueue, a3);
    v15 = dispatch_queue_create(0, 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    v17 = a4 - a5;
    if (a4 - a5 < 0.00000011920929)
      a5 = *(double *)&qword_100572D10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v17));
    -[MZAsynchronousTask setCompletions:](v14, "setCompletions:", v18);

    -[MZAsynchronousTask setTaskDebugDescription:](v14, "setTaskDebugDescription:", v12);
    v14->_taskTimeout = a4;
    v19 = dispatch_queue_create(0, 0);
    v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v19);
    taskTimeoutTimer = v14->_taskTimeoutTimer;
    v14->_taskTimeoutTimer = (OS_dispatch_source *)v20;

    dispatch_source_set_timer((dispatch_source_t)v14->_taskTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v22 = v14->_taskTimeoutTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10007E6D8;
    handler[3] = &unk_1004A6200;
    v23 = v14;
    v33 = v23;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_resume((dispatch_object_t)v14->_taskTimeoutTimer);
    *((double *)v23 + 13) = a5;
    v24 = v23[14];
    v23[14] = 0;

    if (*((double *)v23 + 13) != *(double *)&qword_100572D10)
    {
      *((double *)v23 + 13) = a5;
      v25 = dispatch_queue_create(0, 0);
      v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v25);
      v27 = v23[14];
      v23[14] = v26;

      dispatch_source_set_timer(v23[14], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      v28 = v23[14];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10007E790;
      v30[3] = &unk_1004A6200;
      v31 = v23;
      dispatch_source_set_event_handler(v28, v30);
      dispatch_resume(v23[14]);

    }
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  MZAsynchronousTask *v7;

  v3 = _MTLogCategoryAsyncTask(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dealloc task: %@", buf, 0xCu);
  }

  -[MZAsynchronousTask _invalidateTaskTimer](self, "_invalidateTaskTimer");
  -[MZAsynchronousTask _invalidateAssertionTimer](self, "_invalidateAssertionTimer");
  v5.receiver = self;
  v5.super_class = (Class)MZAsynchronousTask;
  -[MZAsynchronousTask dealloc](&v5, "dealloc");
}

- (void)_invalidateTaskTimer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007E96C;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_invalidateAssertionTimer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EA24;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MZAsynchronousTask;
  v3 = -[MZAsynchronousTask description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask taskDebugDescription](self, "taskDebugDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ '%@'"), v4, v5));

  return v6;
}

- (void)setExpirationHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EB90;
  block[3] = &unk_1004A7028;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)expirationHandler
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100046664;
  v10 = sub_1000469B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007ED34;
  v5[3] = &unk_1004A6F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setFinishedHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007EDE8;
  block[3] = &unk_1004A7028;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)finishedHandler
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100046664;
  v10 = sub_1000469B4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007EF8C;
  v5[3] = &unk_1004A6F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_onQueueFireExpirationHandlerIfNecesary
{
  id v3;
  id expirationHandler;
  int cancelType;
  NSObject *handlerQueue;
  _QWORD block[5];
  id v8;
  int v9;

  v3 = objc_retainBlock(self->_expirationHandler);
  if (v3)
  {
    expirationHandler = self->_expirationHandler;
    self->_expirationHandler = 0;

    cancelType = self->_cancelType;
    handlerQueue = self->_handlerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007F068;
    block[3] = &unk_1004A7F48;
    block[4] = self;
    v9 = cancelType;
    v8 = v3;
    dispatch_async(handlerQueue, block);

  }
}

- (void)setCancelType:(int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  int v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007F184;
  v4[3] = &unk_1004A7F70;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (int)cancelType
{
  NSObject *queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007F240;
  v5[3] = &unk_1004A6F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setResult:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F2D0;
  block[3] = &unk_1004A6640;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)result
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10007F390;
  v10 = sub_10007F3A0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007F3A8;
  v5[3] = &unk_1004A6F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F438;
  block[3] = &unk_1004A6640;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (NSError)error
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_10007F390;
  v10 = sub_10007F3A0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007F4F8;
  v5[3] = &unk_1004A6F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)beginTaskOperation
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *queue;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  MZAsynchronousTask *v11;

  v3 = _MTLogCategoryAsyncTask(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "beginTaskOperation %@", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007F658;
  v9[3] = &unk_1004A6200;
  v9[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask description](self, "description"));
  v6 = +[MZTaskAssertion newBackgroundTaskWithExpirationHandler:debugInfo:](MZTaskAssertion, "newBackgroundTaskWithExpirationHandler:debugInfo:", v9, v5);
  -[MZAsynchronousTask setTaskAssertion:](self, "setTaskAssertion:", v6);

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007F68C;
  v8[3] = &unk_1004A6200;
  v8[4] = self;
  dispatch_sync(queue, v8);
}

- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MZAsynchronousTask setResult:](self, "setResult:", v6);
  -[MZAsynchronousTask setError:](self, "setError:", v7);
  -[MZAsynchronousTask setExpirationHandler:](self, "setExpirationHandler:", 0);
  handlerQueue = self->_handlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F8B8;
  block[3] = &unk_1004A7398;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

- (void)endTaskOperation
{
  -[MZAsynchronousTask finishTaskOperationWithResult:error:](self, "finishTaskOperationWithResult:error:", 0, 0);
  -[MZAsynchronousTask invalidate](self, "invalidate");
}

- (void)_invalidateTaskAssertionForced:(BOOL)a3
{
  NSObject *queue;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[6];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  MZAsynchronousTask *v22;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10007F390;
  v17 = sub_10007F3A0;
  v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007FB3C;
  block[3] = &unk_1004A6F60;
  v12 = a3;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  v5 = (void *)v14[5];
  if (v5)
  {
    v6 = objc_msgSend(v5, "invalidate");
    v8 = _MTLogCategoryAsyncTask(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v14[5];
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Releasing the background task assertion %@ for task: %@.", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v13, 8);

}

- (void)invalidate
{
  -[MZAsynchronousTask _invalidateTaskTimer](self, "_invalidateTaskTimer");
  -[MZAsynchronousTask setExpirationHandler:](self, "setExpirationHandler:", 0);
  -[MZAsynchronousTask setFinishedHandler:](self, "setFinishedHandler:", 0);
  -[MZAsynchronousTask _invalidateTaskAssertionForced:](self, "_invalidateTaskAssertionForced:", 0);
}

- (void)addTaskCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = objc_retainBlock(v4);
    v9 = objc_msgSend(v6, "copy");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask completions](self, "completions"));
    v8 = objc_retainBlock(v9);
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)invokeTaskCompletionBlocksWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *queue;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[6];
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[6];
  _QWORD v21[3];
  char v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask completions](self, "completions"));
  v6 = objc_msgSend(v5, "copy");

  -[MZAsynchronousTask setCompletions:](self, "setCompletions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask result](self, "result"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZAsynchronousTask error](self, "error"));
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007FE5C;
  block[3] = &unk_1004A6B98;
  block[4] = self;
  block[5] = v21;
  dispatch_sync(queue, block);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007FEA0;
  v15[3] = &unk_1004A7FC0;
  v10 = dispatch_group_create();
  v16 = v10;
  v11 = v4;
  v19 = v11;
  v12 = v7;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007FFC8;
  v14[3] = &unk_1004A6F38;
  v14[4] = self;
  v14[5] = v21;
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, v14);

  _Block_object_dispose(v21, 8);
}

- (NSString)taskDebugDescription
{
  return self->_taskDebugDescription;
}

- (void)setTaskDebugDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MZTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_taskAssertion, a3);
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)taskInvalidationDisabled
{
  return self->_taskInvalidationDisabled;
}

- (void)setTaskInvalidationDisabled:(BOOL)a3
{
  self->_taskInvalidationDisabled = a3;
}

- (double)taskTimeout
{
  return self->_taskTimeout;
}

- (void)setTaskTimeout:(double)a3
{
  self->_taskTimeout = a3;
}

- (OS_dispatch_source)taskTimeoutTimer
{
  return self->_taskTimeoutTimer;
}

- (void)setTaskTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_taskTimeoutTimer, a3);
}

- (double)assertionTimeout
{
  return self->_assertionTimeout;
}

- (void)setAssertionTimeout:(double)a3
{
  self->_assertionTimeout = a3;
}

- (OS_dispatch_source)assertionTimeoutTimer
{
  return self->_assertionTimeoutTimer;
}

- (void)setAssertionTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_assertionTimeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_taskTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_taskDebugDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong(&self->_finishedHandler, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
}

@end

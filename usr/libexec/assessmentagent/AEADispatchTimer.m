@implementation AEADispatchTimer

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  v3 = objc_claimAutoreleasedReturnValue(-[AEADispatchTimer timerSource](self, "timerSource"));
  dispatch_source_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)AEADispatchTimer;
  -[AEADispatchTimer dealloc](&v4, "dealloc");
}

- (AEADispatchTimer)initWithDuration:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  AEADispatchTimer *v11;
  AEADispatchTimer *v12;
  id v13;
  id fireHandler;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AEADispatchTimer;
  v11 = -[AEADispatchTimer init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    v11->_duration = a3;
    v13 = objc_retainBlock(v10);
    fireHandler = v12->_fireHandler;
    v12->_fireHandler = v13;

    objc_storeStrong((id *)&v12->_targetQueue, a4);
    v15 = dispatch_queue_create(0, 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

  }
  return v12;
}

+ (id)scheduledTimerWithDuration:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithDuration:queue:handler:", v9, v8, a3);

  objc_msgSend(v10, "resume");
  return v10;
}

- (void)resume
{
  NSObject *v3;
  dispatch_source_t v4;
  NSObject *v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v3 = objc_claimAutoreleasedReturnValue(-[AEADispatchTimer queue](self, "queue"));
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  -[AEADispatchTimer setTimerSource:](self, "setTimerSource:", v4);

  v5 = objc_claimAutoreleasedReturnValue(-[AEADispatchTimer timerSource](self, "timerSource"));
  -[AEADispatchTimer duration](self, "duration");
  v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  dispatch_source_set_timer(v5, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[AEADispatchTimer timerSource](self, "timerSource"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100004A10;
  v13 = &unk_1000817D8;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v8, &v10);

  v9 = objc_claimAutoreleasedReturnValue(-[AEADispatchTimer timerSource](self, "timerSource", v10, v11, v12, v13));
  dispatch_resume(v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)timerDidFire
{
  void *v3;
  NSObject *v4;
  dispatch_block_t block;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEADispatchTimer fireHandler](self, "fireHandler"));

  if (v3)
  {
    block = (dispatch_block_t)objc_claimAutoreleasedReturnValue(-[AEADispatchTimer fireHandler](self, "fireHandler"));
    -[AEADispatchTimer setFireHandler:](self, "setFireHandler:", 0);
    v4 = objc_claimAutoreleasedReturnValue(-[AEADispatchTimer targetQueue](self, "targetQueue"));
    dispatch_async(v4, block);

  }
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[AEADispatchTimer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B5C;
  block[3] = &unk_100081800;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (double)duration
{
  return self->_duration;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (id)fireHandler
{
  return self->_fireHandler;
}

- (void)setFireHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireHandler, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

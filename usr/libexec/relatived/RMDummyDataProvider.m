@implementation RMDummyDataProvider

- (RMDummyDataProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4
{
  id v6;
  id v7;
  RMDummyDataProvider *v8;
  RMDummyDataProvider *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMDummyDataProvider;
  v8 = -[RMDummyDataProvider init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    -[RMDummyDataProvider setConfiguration:](v8, "setConfiguration:", v6);
    -[RMDummyDataProvider setReceiverQueue:](v9, "setReceiverQueue:", v7);
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("RMDummyDataProviderQueue", v11);
    -[RMDummyDataProvider setProducerQueue:](v9, "setProducerQueue:", v12);

  }
  return v9;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_source_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  RMDummyDataProvider *v16;
  id v17;

  v4 = a3;
  -[RMDummyDataProvider setRunning:](self, "setRunning:", 1);
  v5 = objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerQueue](self, "producerQueue"));
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v5);
  -[RMDummyDataProvider setProducerTimer:](self, "setProducerTimer:", v6);

  v7 = objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerTimer](self, "producerTimer"));
  dispatch_source_set_timer(v7, 0, -[RMDummyDataProviderConfiguration intervalInNanoSeconds](self->_configuration, "intervalInNanoSeconds"), 0);

  v8 = objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerTimer](self, "producerTimer"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10000DEF4;
  v15 = &unk_100024D80;
  v16 = self;
  v17 = v4;
  v9 = v4;
  dispatch_source_set_event_handler(v8, &v12);

  v10 = objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerTimer](self, "producerTimer", v12, v13, v14, v15, v16));
  dispatch_resume(v10);

  return 0;
}

- (void)stopProducingData
{
  NSObject *v3;

  -[RMDummyDataProvider setRunning:](self, "setRunning:", 0);
  v3 = objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerTimer](self, "producerTimer"));
  dispatch_source_cancel(v3);

  -[RMDummyDataProvider setProducerTimer:](self, "setProducerTimer:", 0);
}

- (OS_dispatch_queue)producerQueue
{
  return self->_producerQueue;
}

- (void)setProducerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_producerQueue, a3);
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_receiverQueue, a3);
}

- (RMDummyDataProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_source)producerTimer
{
  return self->_producerTimer;
}

- (void)setProducerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_producerTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_producerTimer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_receiverQueue, 0);
  objc_storeStrong((id *)&self->_producerQueue, 0);
}

@end

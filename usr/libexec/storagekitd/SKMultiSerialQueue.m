@implementation SKMultiSerialQueue

- (SKMultiSerialQueue)initWithName:(id)a3
{
  id v4;
  SKMultiSerialQueue *v5;
  int v6;
  NSMutableArray *v7;
  NSMutableArray *queues;
  dispatch_queue_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKMultiSerialQueue;
  v5 = -[SKMultiSerialQueue init](&v11, "init");
  if (v5)
  {
    if (qword_100051AC0 != -1)
      dispatch_once(&qword_100051AC0, &stru_1000450D8);
    v6 = dword_100051AC8;
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", dword_100051AC8);
    queues = v5->_queues;
    v5->_queues = v7;

    for (; v6; --v6)
    {
      v9 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), 0);
      -[NSMutableArray addObject:](v5->_queues, "addObject:", v9);

    }
    v5->_counter = 0;
  }

  return v5;
}

- (void)dispatchWithBlock:(id)a3
{
  SKMultiSerialQueue *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  dispatch_block_t block;

  block = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKMultiSerialQueue queues](v4, "queues"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", -[SKMultiSerialQueue counter](v4, "counter")));
  dispatch_async(v6, block);

  LODWORD(v6) = -[SKMultiSerialQueue counter](v4, "counter");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMultiSerialQueue queues](v4, "queues"));
  -[SKMultiSerialQueue setCounter:](v4, "setCounter:", ((_DWORD)v6 + 1) % (unint64_t)objc_msgSend(v7, "count"));

  objc_sync_exit(v4);
}

- (void)dispatchWithGroup:(id)a3 block:(id)a4
{
  id v6;
  SKMultiSerialQueue *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *group;

  group = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMultiSerialQueue queues](v7, "queues"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", -[SKMultiSerialQueue counter](v7, "counter")));
  dispatch_group_async(group, v9, v6);

  LODWORD(v9) = -[SKMultiSerialQueue counter](v7, "counter");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKMultiSerialQueue queues](v7, "queues"));
  -[SKMultiSerialQueue setCounter:](v7, "setCounter:", ((_DWORD)v9 + 1) % (unint64_t)objc_msgSend(v10, "count"));

  objc_sync_exit(v7);
}

- (NSMutableArray)queues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queues, 0);
}

@end

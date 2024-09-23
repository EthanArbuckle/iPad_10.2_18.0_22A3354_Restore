@implementation JSAPendingExecutionRecordQueue

- (JSAPendingExecutionRecordQueue)init
{
  JSAPendingExecutionRecordQueue *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JSAPendingExecutionRecordQueue;
  v2 = -[JSAPendingExecutionRecordQueue init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("JSAPendingExecutionRecordQueue.accessQueue", v6);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)enqueueRecord:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9B20;
  block[3] = &unk_9DCF8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (id)dequeueAllRecords
{
  NSObject *accessQueue;
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
  v9 = sub_9C14;
  v10 = sub_9C24;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9C2C;
  v5[3] = &unk_9E0D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSMutableArray)records
{
  NSMutableArray *records;
  NSMutableArray *v4;
  NSMutableArray *v5;

  records = self->_records;
  if (!records)
  {
    v4 = (NSMutableArray *)objc_opt_new(NSMutableArray, a2);
    v5 = self->_records;
    self->_records = v4;

    records = self->_records;
  }
  return records;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end

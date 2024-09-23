@implementation VMOperation

- (VMOperation)init
{
  VMOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VMOperation;
  v2 = -[VMOperation init](&v15, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_queue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;

  }
  return v2;
}

- (NSProgress)progress
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __23__VMOperation_progress__block_invoke;
  v4[3] = &unk_24CC5ABC0;
  v4[4] = self;
  v4[5] = &v5;
  -[VMOperation performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSProgress *)v2;
}

void __23__VMOperation_progress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 248));
}

- (void)configureProgressWithUnitCount:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[VMOperation queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__VMOperation_configureProgressWithUnitCount___block_invoke;
  v6[3] = &unk_24CC5ABE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __46__VMOperation_configureProgressWithUnitCount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 248);
  *(_QWORD *)(v3 + 248) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setCancellable:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setPausable:", 0);
}

- (void)performSynchronousBlock:(id)a3
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  if (dispatch_get_specific((const void *)VMOperationDispatchQueueContextKey) == self)
  {
    v6 = (void (*)(void))*((_QWORD *)a3 + 2);
    v7 = a3;
    v6();
  }
  else
  {
    v5 = a3;
    -[VMOperation queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v7, v5);

  }
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end

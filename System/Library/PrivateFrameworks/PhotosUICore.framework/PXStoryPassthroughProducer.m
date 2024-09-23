@implementation PXStoryPassthroughProducer

- (PXStoryPassthroughProducer)init
{
  return -[PXStoryPassthroughProducer initWithResult:](self, "initWithResult:", 0);
}

- (PXStoryPassthroughProducer)initWithResult:(id)a3
{
  return -[PXStoryPassthroughProducer initWithResult:options:](self, "initWithResult:options:", a3, 0);
}

- (PXStoryPassthroughProducer)initWithResult:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v7;
  PXStoryPassthroughProducer *v8;
  PXStoryPassthroughProducer *v9;
  objc_class *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  objc_super v18;

  v4 = a4;
  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryPassthroughProducer;
  v8 = -[PXStoryPassthroughProducer init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_result, a3);
    v9->_prefersAsynchronousDelivery = v4 & 1;
    v9->_allowsProgress = (v4 & 2) == 0;
    if ((v4 & 1) != 0)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (const char *)objc_msgSend(v11, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_queue_create(v12, v14);
      workQueue = v9->_workQueue;
      v9->_workQueue = (OS_dispatch_queue *)v15;

    }
  }

  return v9;
}

- (id)requestResultWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  char v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  BOOL v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD);
  _QWORD aBlock[4];
  id v21;
  id v22;

  v4 = a3;
  v6 = a4;
  -[PXStoryPassthroughProducer result](self, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PXStoryPassthroughProducer_requestResultWithOptions_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5148CE0;
  v9 = v6;
  v22 = v9;
  v10 = v7;
  v21 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  v12 = -[PXStoryPassthroughProducer prefersAsynchronousDelivery](self, "prefersAsynchronousDelivery");
  if ((v4 & 1) != 0 || !v12)
  {
    v11[2](v11);
    v14 = 0;
  }
  else
  {
    if (-[PXStoryPassthroughProducer allowsProgress](self, "allowsProgress"))
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    -[PXStoryPassthroughProducer workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __69__PXStoryPassthroughProducer_requestResultWithOptions_resultHandler___block_invoke_2;
    v17[3] = &unk_1E5148CE0;
    v14 = v13;
    v18 = v14;
    v19 = v11;
    dispatch_async(v15, v17);

  }
  return v14;
}

- (id)result
{
  return self->_result;
}

- (BOOL)prefersAsynchronousDelivery
{
  return self->_prefersAsynchronousDelivery;
}

- (BOOL)allowsProgress
{
  return self->_allowsProgress;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_result, 0);
}

void __69__PXStoryPassthroughProducer_requestResultWithOptions_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  PXStoryProducerResult *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, PXStoryProducerResult *))(v1 + 16))(v1, v2);

}

uint64_t __69__PXStoryPassthroughProducer_requestResultWithOptions_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

@end

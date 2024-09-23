@implementation PXStoryDummyProgressiveTimelineProducer

- (PXStoryDummyProgressiveTimelineProducer)init
{
  PXStoryDummyProgressiveTimelineProducer *v2;
  PXStoryDummyTimelineProducer *v3;
  PXStoryDummyTimelineProducer *timelineProducer;
  objc_class *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXStoryDummyProgressiveTimelineProducer;
  v2 = -[PXStoryDummyProgressiveTimelineProducer init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXStoryDummyTimelineProducer);
    timelineProducer = v2->_timelineProducer;
    v2->_timelineProducer = v3;

    v2->_numberOfIterations = 10;
    v2->_delayBetweenIterations = 1.0;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v7, v9);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v10;

  }
  return v2;
}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  char v6;
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PXStoryProducerResult *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void (**v18)(id, void *);
  id v19;
  id v20;
  id v21;
  void *v23;
  id v24;
  void *v25;
  void (**v26)(id, void *);
  _QWORD aBlock[5];
  id v28;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E51186A0;
  aBlock[4] = self;
  v10 = v8;
  v28 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if ((v6 & 2) != 0)
  {
    -[PXStoryDummyProgressiveTimelineProducer workQueue](self, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 1;
  }
  else
  {
    (*((void (**)(void *, double))v11 + 2))(v11, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v13);
    -[PXStoryProducerResult flags:](v14, "flags:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v15);

    -[PXStoryDummyProgressiveTimelineProducer workQueue](self, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXStoryDummyProgressiveTimelineProducer numberOfIterations](self, "numberOfIterations");
  }
  -[PXStoryDummyProgressiveTimelineProducer delayBetweenIterations](self, "delayBetweenIterations");
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", v17);
  v23 = v16;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = v12;
  v26 = v9;
  v18 = v9;
  v19 = v12;
  v20 = v16;
  PXIterateAsynchronously();
  v21 = v24;

  return v21;
}

- (int64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (void)setNumberOfIterations:(int64_t)a3
{
  self->_numberOfIterations = a3;
}

- (double)delayBetweenIterations
{
  return self->_delayBetweenIterations;
}

- (void)setDelayBetweenIterations:(double)a3
{
  self->_delayBetweenIterations = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PXStoryDummyTimelineProducer)timelineProducer
{
  return self->_timelineProducer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineProducer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

id __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke(uint64_t a1, double a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "timelineProducer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createTimelineWithConfiguration:detailsFraction:", *(_QWORD *)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E51186C8;
  v5 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v12 = *(_QWORD *)(a1 + 72);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_after(v4, v5, block);

}

void __98__PXStoryDummyProgressiveTimelineProducer_requestTimelineWithConfiguration_options_resultHandler___block_invoke_3(uint64_t a1)
{
  char v2;
  void *v3;
  double v4;
  uint64_t v5;
  PXStoryProducerResult *v6;
  void *v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(void **)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "stop");
  }
  else
  {
    v4 = (double)(unint64_t)(objc_msgSend(v3, "index") + 1) / (double)*(uint64_t *)(a1 + 64);
    (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 56);
    v6 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v8);
    -[PXStoryProducerResult flags:](v6, "flags:", v4 < 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    objc_msgSend(*(id *)(a1 + 40), "next");

  }
}

@end

@implementation VKFrameProcessor

+ (double)defaultProcessingInterval
{
  return 0.25;
}

+ (double)defaultInfrequentProcessingInterval
{
  return 1.5;
}

- (VKFrameProcessor)init
{
  VKFrameProcessor *v2;
  VKFrameProcessor *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VKFrameProcessor;
  v2 = -[VKFrameProcessor init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.visionkit.%@.serial"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), v5);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v11;

    *(_OWORD *)&v3->_processingInterval = xmmword_1D2ED0F40;
    v3->_currentProcessingInterval = 0.25;

  }
  return v3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  OS_dispatch_queue *v3;

  -[VKFrameProcessor lock](self, "lock");
  v3 = self->_resultHandlerQueue;
  -[VKFrameProcessor unlock](self, "unlock");
  return v3;
}

- (void)setResultHandlerQueue:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__VKFrameProcessor_setResultHandlerQueue___block_invoke;
  v6[3] = &unk_1E9462B58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  vk_performWhileLocked(self, v6);

}

void __42__VKFrameProcessor_setResultHandlerQueue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)enqueueFrame:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  v4 = a3;
  v5 = -[VKFrameProcessor wantsThrottling](self, "wantsThrottling");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__VKFrameProcessor_enqueueFrame___block_invoke;
  v7[3] = &unk_1E94634D8;
  v9 = v5;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  vk_performWhileLocked(self, v7);

}

void __33__VKFrameProcessor_enqueueFrame___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double Current;
  double v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    if (!*(_BYTE *)(a1 + 48))
    {
LABEL_9:
      *(_BYTE *)(v1 + 32) = 1;
      *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 56) = CFAbsoluteTimeGetCurrent();
      v9 = *(_QWORD **)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v10 = (void *)v9[3];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __33__VKFrameProcessor_enqueueFrame___block_invoke_2;
      v11[3] = &unk_1E94634B0;
      v12 = v8;
      vk_performBlockOnQueueWithStrongSelf(v10, v9, v11);

      return;
    }
    if (*(_BYTE *)(v1 + 34))
    {
      *(_BYTE *)(v1 + 34) = 0;
      v1 = *(_QWORD *)(a1 + 32);
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "info");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "sceneStability");

    v5 = 40;
    if (v4 == 3)
      v5 = 48;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + v5);
    Current = CFAbsoluteTimeGetCurrent();
    v1 = *(_QWORD *)(a1 + 32);
    v7 = *(double *)(v1 + 56);
    if (v7 == 0.0 || Current - v7 >= *(double *)(v1 + 64))
      goto LABEL_9;
  }
}

void __33__VKFrameProcessor_enqueueFrame___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  -[VKFrameProcessor _processFrame:](a2, *(void **)(a1 + 32));
}

- (void)_processFrame:(_QWORD *)a1
{
  NSObject *v3;
  id v4;
  _QWORD v5[5];

  if (a1)
  {
    v3 = a1[3];
    v4 = a2;
    dispatch_assert_queue_V2(v3);
    objc_msgSend(a1, "processFrame:", v4);

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__VKFrameProcessor__processFrame___block_invoke;
    v5[3] = &unk_1E94625B8;
    v5[4] = a1;
    vk_performWhileLocked(a1, v5);
  }
}

uint64_t __34__VKFrameProcessor__processFrame___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 33) = 0;
  return result;
}

- (BOOL)wantsThrottling
{
  return 0;
}

- (double)processingInterval
{
  double processingInterval;

  -[VKFrameProcessor lock](self, "lock");
  processingInterval = self->_processingInterval;
  -[VKFrameProcessor unlock](self, "unlock");
  return processingInterval;
}

- (void)setProcessingInterval:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__VKFrameProcessor_setProcessingInterval___block_invoke;
  v3[3] = &unk_1E9463500;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  vk_performWhileLocked(self, v3);
}

double __42__VKFrameProcessor_setProcessingInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

- (double)infrequentProcessingInterval
{
  double infrequentProcessingInterval;

  -[VKFrameProcessor lock](self, "lock");
  infrequentProcessingInterval = self->_infrequentProcessingInterval;
  -[VKFrameProcessor unlock](self, "unlock");
  return infrequentProcessingInterval;
}

- (void)setInfrequentProcessingInterval:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__VKFrameProcessor_setInfrequentProcessingInterval___block_invoke;
  v3[3] = &unk_1E9463500;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  vk_performWhileLocked(self, v3);
}

double __52__VKFrameProcessor_setInfrequentProcessingInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
}

- (void)requestImmediateProcessing
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__VKFrameProcessor_requestImmediateProcessing__block_invoke;
  v2[3] = &unk_1E94625B8;
  v2[4] = self;
  vk_performWhileLocked(self, v2);
}

uint64_t __46__VKFrameProcessor_requestImmediateProcessing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 34) = 1;
  return result;
}

- (BOOL)isExecuting
{
  BOOL isExecuting;

  -[VKFrameProcessor lock](self, "lock");
  isExecuting = self->_isExecuting;
  -[VKFrameProcessor unlock](self, "unlock");
  return isExecuting;
}

- (void)setExecuting:(void *)a1
{
  _QWORD v2[5];
  char v3;

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __33__VKFrameProcessor_setExecuting___block_invoke;
    v2[3] = &unk_1E9462568;
    v2[4] = a1;
    v3 = a2;
    vk_performWhileLocked(a1, v2);
  }
}

uint64_t __33__VKFrameProcessor_setExecuting___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isCancelled
{
  BOOL isCancelled;

  -[VKFrameProcessor lock](self, "lock");
  isCancelled = self->_isCancelled;
  -[VKFrameProcessor unlock](self, "unlock");
  return isCancelled;
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __26__VKFrameProcessor_cancel__block_invoke;
  v2[3] = &unk_1E94625B8;
  v2[4] = self;
  vk_performWhileLocked(self, v2);
}

uint64_t __26__VKFrameProcessor_cancel__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 33) = 1;
  return result;
}

- (void)reset
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __25__VKFrameProcessor_reset__block_invoke;
  v2[3] = &unk_1E94625B8;
  v2[4] = self;
  vk_performWhileLocked(self, v2);
}

uint64_t __25__VKFrameProcessor_reset__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 32))
    *(_BYTE *)(v1 + 33) = 1;
  return result;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
}

@end

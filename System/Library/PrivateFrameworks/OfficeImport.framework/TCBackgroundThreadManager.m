@implementation TCBackgroundThreadManager

- (BOOL)isCancelled
{
  return -[TCCancelDelegate isCancelled](self->mCancelDelegate, "isCancelled");
}

- (TCBackgroundThreadManager)initWithCancelDelegate:(id)a3
{
  id v5;
  TCBackgroundThreadManager *v6;
  uint64_t v7;
  OS_dispatch_queue *mQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *mProgressReportingQueue;
  dispatch_group_t v11;
  OS_dispatch_group *mGroup;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TCBackgroundThreadManager;
  v6 = -[TCBackgroundThreadManager init](&v20, sel_init);
  if (v6)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    mQueue = v6->mQueue;
    v6->mQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.iWork.TCBackgroundProgressQueue", 0);
    mProgressReportingQueue = v6->mProgressReportingQueue;
    v6->mProgressReportingQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_group_create();
    mGroup = v6->mGroup;
    v6->mGroup = (OS_dispatch_group *)v11;

    objc_storeStrong((id *)&v6->mCancelDelegate, a3);
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "threadDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("TCMessageContext Instance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCBackgroundThreadManager setMessageContext:](v6, "setMessageContext:", v15);

    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "threadDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("TCProgressContext Instance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCBackgroundThreadManager setProgressContext:](v6, "setProgressContext:", v18);

  }
  return v6;
}

- (void)dealloc
{
  OS_dispatch_queue *mQueue;
  OS_dispatch_group *mGroup;
  OS_dispatch_queue *mProgressReportingQueue;
  objc_super v6;

  mQueue = self->mQueue;
  if (mQueue)
  {
    self->mQueue = 0;

  }
  mGroup = self->mGroup;
  if (mGroup)
  {
    self->mGroup = 0;

  }
  mProgressReportingQueue = self->mProgressReportingQueue;
  if (mProgressReportingQueue)
  {
    self->mProgressReportingQueue = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)TCBackgroundThreadManager;
  -[TCBackgroundThreadManager dealloc](&v6, sel_dealloc);
}

- (void)addASyncBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *mQueue;
  NSObject *mGroup;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = v4;
  if (self->mIsWaiting)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TCBackgroundThreadManager addASyncBlock:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Common/Utilities/TCBackgroundThreadManager.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 83, 0, "TCBackgroundThreadManager: Cannot add blocks when waiting");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  else
  {
    mQueue = self->mQueue;
    ++self->mBlockCount;
    mGroup = self->mGroup;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__TCBackgroundThreadManager_addASyncBlock___block_invoke;
    v10[3] = &unk_24F39BAB0;
    v10[4] = self;
    v11 = v4;
    dispatch_group_async(mGroup, mQueue, v10);

  }
}

void __43__TCBackgroundThreadManager_addASyncBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 16))
  {
    v3 = *(NSObject **)(v2 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__TCBackgroundThreadManager_addASyncBlock___block_invoke_2;
    block[3] = &unk_24F39B528;
    block[4] = v2;
    dispatch_sync(v3, block);
    v2 = *(_QWORD *)(a1 + 32);
  }
  --*(_QWORD *)(v2 + 24);
}

uint64_t __43__TCBackgroundThreadManager_addASyncBlock___block_invoke_2(uint64_t a1)
{
  return +[TCProgressContext advanceProgressInContext:progress:](TCProgressContext, "advanceProgressInContext:progress:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), 1.0);
}

- (void)waitUntilComplete
{
  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("Background object processing"), (double)self->mBlockCount, 100.0);
  self->mIsWaiting = 1;
  dispatch_group_wait((dispatch_group_t)self->mGroup, 0xFFFFFFFFFFFFFFFFLL);
  +[TCProgressContext endStage](TCProgressContext, "endStage");
}

- (TCMessageContext)messageContext
{
  return (TCMessageContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (TCProgressContext)progressContext
{
  return (TCProgressContext *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProgressContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProgressContext, 0);
  objc_storeStrong((id *)&self->mMessageContext, 0);
  objc_storeStrong((id *)&self->mProgressReportingQueue, 0);
  objc_storeStrong((id *)&self->mGroup, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
}

@end

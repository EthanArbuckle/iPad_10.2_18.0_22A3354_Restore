@implementation SYBacklinkMonitor

- (SYBacklinkMonitor)init
{
  SYBacklinkMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *monitorQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SYBacklinkMonitor;
  v2 = -[SYBacklinkMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.BacklinkMonitor", v3);
    monitorQueue = v2->__monitorQueue;
    v2->__monitorQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)userActivityDidChange
{
  NSObject *v3;
  _QWORD block[5];

  -[SYBacklinkMonitor _monitorQueue](self, "_monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SYBacklinkMonitor_userActivityDidChange__block_invoke;
  block[3] = &unk_1E757B758;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __42__SYBacklinkMonitor_userActivityDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_needsActivityUpdate:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluatePendingRequests");
}

- (void)_evaluatePendingRequests
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  dispatch_block_t v17;
  dispatch_time_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD block[5];
  uint8_t buf[4];
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[SYBacklinkMonitor _monitorQueue](self, "_monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SYBacklinkMonitor _needsActivityUpdate](self, "_needsActivityUpdate"))
  {
    -[SYBacklinkMonitor _delayedChangeEvaluationBlock](self, "_delayedChangeEvaluationBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: ignoring request to process activity change because there is a pending delayed evaluation.", buf, 2u);
      }

    }
    else
    {
      -[SYBacklinkMonitor _lastOperationStartTime](self, "_lastOperationStartTime");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v8 = v7;
      -[SYBacklinkMonitor _lastOperationStartTime](self, "_lastOperationStartTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v11 = v8 - v10;

      -[SYBacklinkMonitor testingOperationCoalescingInterval](self, "testingOperationCoalescingInterval");
      v13 = v12;
      v14 = 2.0;
      if (v13 > 0.0)
        -[SYBacklinkMonitor testingOperationCoalescingInterval](self, "testingOperationCoalescingInterval", 2.0);
      if (v11 < v14)
      {
        v15 = v14 - v11;
        v16 = os_log_create("com.apple.synapse", "BacklinkMonitor");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v24 = v11;
          v25 = 2048;
          v26 = v15;
          _os_log_impl(&dword_1BCC38000, v16, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: ignoring request to process activity change because last request was %0.2fs ago, scheduling re-evaluation in %0.2fs.", buf, 0x16u);
        }

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __45__SYBacklinkMonitor__evaluatePendingRequests__block_invoke;
        block[3] = &unk_1E757B758;
        block[4] = self;
        v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
        -[SYBacklinkMonitor set_delayedChangeEvaluationBlock:](self, "set_delayedChangeEvaluationBlock:", v17);

        v18 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
        -[SYBacklinkMonitor _monitorQueue](self, "_monitorQueue");
        v19 = objc_claimAutoreleasedReturnValue();
        -[SYBacklinkMonitor _delayedChangeEvaluationBlock](self, "_delayedChangeEvaluationBlock");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_after(v18, v19, v20);

      }
      else
      {
LABEL_13:
        v21 = os_log_create("com.apple.synapse", "BacklinkMonitor");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCC38000, v21, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: will process request to process activity change.", buf, 2u);
        }

        -[SYBacklinkMonitor _beginNewOperation](self, "_beginNewOperation");
      }
    }
  }
}

uint64_t __45__SYBacklinkMonitor__evaluatePendingRequests__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: delayed re-evaluation fired.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "set_delayedChangeEvaluationBlock:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluatePendingRequests");
}

- (void)_beginNewOperation
{
  void *v4;
  NSObject *v5;
  SYBacklinkMonitorOperation *v6;
  void *v7;
  SYBacklinkMonitorOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  if (!-[SYBacklinkMonitor _needsActivityUpdate](self, "_needsActivityUpdate"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkMonitor.m"), 107, CFSTR("Cannot begin a new operation if there are no pending requests to process."));

  }
  -[SYBacklinkMonitor set_needsActivityUpdate:](self, "set_needsActivityUpdate:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYBacklinkMonitor set_lastOperationStartTime:](self, "set_lastOperationStartTime:", v4);

  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: will begin operation.", v13, 2u);
  }

  v6 = [SYBacklinkMonitorOperation alloc];
  -[SYBacklinkMonitor _monitorQueue](self, "_monitorQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SYBacklinkMonitorOperation initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:](v6, "initWithDelegate:processingQueue:inputUserActivityInfo:processIdentifier:", self, v7, 0, 0);
  -[SYBacklinkMonitor set_activeOperation:](self, "set_activeOperation:", v8);

  -[SYBacklinkMonitor testingDelegate](self, "testingDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYBacklinkMonitor _activeOperation](self, "_activeOperation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backlinkMonitor:willBeginOperation:", self, v10);

  -[SYBacklinkMonitor _activeOperation](self, "_activeOperation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginProcessing");

}

- (void)backlinkMonitorOperationDidFinish:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = a3;
  -[SYBacklinkMonitor _monitorQueue](self, "_monitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SYBacklinkMonitor _activeOperation](self, "_activeOperation");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    -[SYBacklinkMonitor set_activeOperation:](self, "set_activeOperation:", 0);
    if (-[SYBacklinkMonitor _needsActivityUpdate](self, "_needsActivityUpdate"))
    {
      v8 = os_log_create("com.apple.synapse", "BacklinkMonitor");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: operation finished. Has more pending work, requesting evaluation.", v12, 2u);
      }
    }
    else
    {
      -[SYBacklinkMonitor _delayedChangeEvaluationBlock](self, "_delayedChangeEvaluationBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkMonitor.m"), 133, CFSTR("There shuould be no delayed request if there are no more changes to process."));

      }
      v10 = os_log_create("com.apple.synapse", "BacklinkMonitor");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCC38000, v10, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: operation finished. No more pending work, notifying didFinishProcessing", buf, 2u);
      }

      -[SYBacklinkMonitor delegate](self, "delegate");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject backlinkMonitorDidFinishProcessingActivityChanges:](v8, "backlinkMonitorDidFinishProcessingActivityChanges:", self);
    }

    -[SYBacklinkMonitor _evaluatePendingRequests](self, "_evaluatePendingRequests");
  }
}

- (SYBacklinkMonitorDelegate)delegate
{
  return (SYBacklinkMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)_monitorQueue
{
  return self->__monitorQueue;
}

- (BOOL)_needsActivityUpdate
{
  return self->__needsActivityUpdate;
}

- (void)set_needsActivityUpdate:(BOOL)a3
{
  self->__needsActivityUpdate = a3;
}

- (SYBacklinkMonitorOperation)_activeOperation
{
  return self->__activeOperation;
}

- (void)set_activeOperation:(id)a3
{
  objc_storeStrong((id *)&self->__activeOperation, a3);
}

- (id)_delayedChangeEvaluationBlock
{
  return self->__delayedChangeEvaluationBlock;
}

- (void)set_delayedChangeEvaluationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)_lastOperationStartTime
{
  return self->__lastOperationStartTime;
}

- (void)set_lastOperationStartTime:(id)a3
{
  objc_storeStrong((id *)&self->__lastOperationStartTime, a3);
}

- (SYBacklinkMonitorTestingDelegate)testingDelegate
{
  return (SYBacklinkMonitorTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (void)setTestingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testingDelegate, a3);
}

- (double)testingOperationCoalescingInterval
{
  return self->_testingOperationCoalescingInterval;
}

- (void)setTestingOperationCoalescingInterval:(double)a3
{
  self->_testingOperationCoalescingInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->__lastOperationStartTime, 0);
  objc_storeStrong(&self->__delayedChangeEvaluationBlock, 0);
  objc_storeStrong((id *)&self->__activeOperation, 0);
  objc_storeStrong((id *)&self->__monitorQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

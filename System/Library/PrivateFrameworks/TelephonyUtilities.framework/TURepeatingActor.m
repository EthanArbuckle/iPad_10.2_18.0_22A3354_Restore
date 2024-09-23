@implementation TURepeatingActor

- (TURepeatingActor)init
{
  TURepeatingActor *v2;
  TURepeatingActor *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TURepeatingActor;
  v2 = -[TURepeatingActor init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.telephonyutilities.turepeatingactor", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (TURepeatingAction)currentRepeatingAction
{
  os_unfair_lock_s *p_accessorLock;
  TURepeatingAction *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_currentRepeatingAction;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setCurrentRepeatingAction:(id)a3
{
  TURepeatingAction *v5;
  os_unfair_lock_s *p_accessorLock;
  id *p_currentRepeatingAction;
  TURepeatingAction *currentRepeatingAction;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (TURepeatingAction *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  currentRepeatingAction = self->_currentRepeatingAction;
  p_currentRepeatingAction = (id *)&self->_currentRepeatingAction;
  if (currentRepeatingAction != v5)
  {
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *p_currentRepeatingAction;
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "setCurrentRepeatingAction to: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong(p_currentRepeatingAction, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);

}

- (BOOL)isRunning
{
  void *v2;
  BOOL v3;

  -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)beginRepeatingAction:(id)a3 iterations:(unint64_t)a4 completion:(id)a5
{
  -[TURepeatingActor beginRepeatingAction:iterations:pauseDurationBetweenIterations:completion:](self, "beginRepeatingAction:iterations:pauseDurationBetweenIterations:completion:", a3, a4, a5, 0.0);
}

- (void)beginRepeatingAction:(id)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  double v19;

  v10 = a3;
  v11 = a6;
  -[TURepeatingActor queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__TURepeatingActor_beginRepeatingAction_iterations_pauseDurationBetweenIterations_completion___block_invoke;
  block[3] = &unk_1E38A1BA0;
  v17 = v11;
  v18 = a4;
  v19 = a5;
  block[4] = self;
  v16 = v10;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __94__TURepeatingActor_beginRepeatingAction_iterations_pauseDurationBetweenIterations_completion___block_invoke(uint64_t a1)
{
  TURepeatingAction *v2;

  v2 = -[TURepeatingAction initWithAction:]([TURepeatingAction alloc], "initWithAction:", *(_QWORD *)(a1 + 40));
  -[TURepeatingAction setCompletion:](v2, "setCompletion:", *(_QWORD *)(a1 + 48));
  -[TURepeatingAction setRemainingIterations:](v2, "setRemainingIterations:", *(_QWORD *)(a1 + 56));
  -[TURepeatingAction setPauseDuration:](v2, "setPauseDuration:", *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_beginRepeatingAction:", v2);

}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[TURepeatingActor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__TURepeatingActor_stop__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __24__TURepeatingActor_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopWithDidFinish:", 0);
}

- (void)_beginRepeatingAction:(id)a3
{
  TURepeatingAction *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  TURepeatingAction *currentRepeatingAction;
  int v10;
  TURepeatingAction *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (TURepeatingAction *)a3;
  -[TURepeatingActor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "add to pendingRepeatingAction: %@", (uint8_t *)&v10, 0xCu);
    }

    -[TURepeatingActor setPendingRepeatingAction:](self, "setPendingRepeatingAction:", v4);
  }
  else
  {
    -[TURepeatingActor setCurrentRepeatingAction:](self, "setCurrentRepeatingAction:", v4);
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      currentRepeatingAction = self->_currentRepeatingAction;
      v10 = 138412290;
      v11 = currentRepeatingAction;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "currentRepeatingAction changed to: %@", (uint8_t *)&v10, 0xCu);
    }

    -[TURepeatingActor _attemptNextIteration](self, "_attemptNextIteration");
  }

}

- (void)_attemptNextIteration
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  _QWORD aBlock[5];

  -[TURepeatingActor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[TURepeatingActor isStopped](self, "isStopped");

    if (!v6)
    {
      if (-[TURepeatingActor _hasIterationsRemaining](self, "_hasIterationsRemaining"))
      {
        -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "remainingIterations");

        if (v8 != -1)
        {
          -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setRemainingIterations:", objc_msgSend(v9, "remainingIterations") - 1);

        }
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __41__TURepeatingActor__attemptNextIteration__block_invoke;
        aBlock[3] = &unk_1E38A1360;
        aBlock[4] = self;
        v10 = _Block_copy(aBlock);
        -[TURepeatingActor setCurrentlyPerformingAction:](self, "setCurrentlyPerformingAction:", 1);
        -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "action");
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v12)[2](v12, v10);

      }
      else
      {
        -[TURepeatingActor _stopWithDidFinish:](self, "_stopWithDidFinish:", 1);
      }
    }
  }
}

void __41__TURepeatingActor__attemptNextIteration__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__TURepeatingActor__attemptNextIteration__block_invoke_2;
  block[3] = &unk_1E38A1360;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __41__TURepeatingActor__attemptNextIteration__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  dispatch_block_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setCurrentlyPerformingAction:", 0);
  objc_msgSend(*(id *)(a1 + 32), "currentRepeatingAction");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (v3 = (void *)v2, v4 = objc_msgSend(*(id *)(a1 + 32), "isStopped"), v3, (v4 & 1) == 0))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_hasIterationsRemaining"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__TURepeatingActor__attemptNextIteration__block_invoke_3;
      block[3] = &unk_1E38A1360;
      block[4] = *(_QWORD *)(a1 + 32);
      v5 = dispatch_block_create((dispatch_block_flags_t)0, block);
      objc_msgSend(*(id *)(a1 + 32), "setAttemptNextIterationBlock:", v5);
      objc_msgSend(*(id *)(a1 + 32), "currentRepeatingAction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pauseDuration");
      v8 = v7;

      v9 = *(void **)(a1 + 32);
      if (v8 <= 0.0)
      {
        objc_msgSend(v9, "queue");
        v13 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v13, v5);
      }
      else
      {
        objc_msgSend(v9, "currentRepeatingAction");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pauseDuration");
        v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));

        objc_msgSend(*(id *)(a1 + 32), "queue");
        v13 = objc_claimAutoreleasedReturnValue();
        dispatch_after(v12, v13, v5);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_stopWithDidFinish:", 1);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeWithDidFinish:", objc_msgSend(*(id *)(a1 + 32), "_hasIterationsRemaining") ^ 1);
  }
}

uint64_t __41__TURepeatingActor__attemptNextIteration__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAttemptNextIterationBlock:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_attemptNextIteration");
}

- (BOOL)_hasIterationsRemaining
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[TURepeatingActor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "remainingIterations"))
  {
    v5 = 1;
  }
  else
  {
    -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "remainingIterations") == -1;

  }
  return v5;
}

- (void)_stopWithDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  -[TURepeatingActor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "_stopWithDidFinish: %d", (uint8_t *)v10, 8u);
  }

  -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TURepeatingActor setStopped:](self, "setStopped:", 1);
    -[TURepeatingActor attemptNextIterationBlock](self, "attemptNextIterationBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      dispatch_block_cancel(v8);
      -[TURepeatingActor setAttemptNextIterationBlock:](self, "setAttemptNextIterationBlock:", 0);
    }
    if (!-[TURepeatingActor isCurrentlyPerformingAction](self, "isCurrentlyPerformingAction"))
      -[TURepeatingActor _completeWithDidFinish:](self, "_completeWithDidFinish:", v3);

  }
}

- (void)_completeWithDidFinish:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  -[TURepeatingActor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TURepeatingActor setStopped:](self, "setStopped:", 0);
  -[TURepeatingActor setAttemptNextIterationBlock:](self, "setAttemptNextIterationBlock:", 0);
  -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TURepeatingActor currentRepeatingAction](self, "currentRepeatingAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completion");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, v3);

  }
  -[TURepeatingActor setCurrentRepeatingAction:](self, "setCurrentRepeatingAction:", 0);
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v3;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "completeWithDidFinish: %d currentRepeatingAction changed to nil", (uint8_t *)v13, 8u);
  }

  -[TURepeatingActor pendingRepeatingAction](self, "pendingRepeatingAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TURepeatingActor pendingRepeatingAction](self, "pendingRepeatingAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TURepeatingActor _beginRepeatingAction:](self, "_beginRepeatingAction:", v12);

    -[TURepeatingActor setPendingRepeatingAction:](self, "setPendingRepeatingAction:", 0);
  }
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isStopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)isCurrentlyPerformingAction
{
  return self->_currentlyPerformingAction;
}

- (void)setCurrentlyPerformingAction:(BOOL)a3
{
  self->_currentlyPerformingAction = a3;
}

- (TURepeatingAction)pendingRepeatingAction
{
  return self->_pendingRepeatingAction;
}

- (void)setPendingRepeatingAction:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRepeatingAction, a3);
}

- (id)attemptNextIterationBlock
{
  return self->_attemptNextIterationBlock;
}

- (void)setAttemptNextIterationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attemptNextIterationBlock, 0);
  objc_storeStrong((id *)&self->_pendingRepeatingAction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRepeatingAction, 0);
}

@end

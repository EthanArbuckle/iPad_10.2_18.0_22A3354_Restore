@implementation UIViewRunningAnimationEntry

uint64_t __47__UIViewRunningAnimationEntry_performWithLock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)performWithLock:(id)a3
{
  id v4;
  NSObject *transactionQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  transactionQueue = self->_transactionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__UIViewRunningAnimationEntry_performWithLock___block_invoke;
  block[3] = &unk_1E16B2F48;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(transactionQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composer, 0);
  objc_destroyWeak((id *)&self->_animationState);
  objc_storeStrong(&self->_completionCallback, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_animation, 0);
}

- (void)performCompletionCallbackFinished:(BOOL)a3
{
  _BOOL8 v3;
  id completionCallback;
  void *v6;
  id v7;

  v3 = a3;
  v7 = _Block_copy(self->_completionCallback);
  completionCallback = self->_completionCallback;
  self->_completionCallback = 0;

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _BOOL8))v7 + 2))(v7, v3);
    v6 = v7;
  }

}

- (void)setAnimationState:(id)a3
{
  objc_storeWeak((id *)&self->_animationState, a3);
}

- (UIViewRunningAnimationEntry)initWithAnimation:(id)a3 completion:(id)a4 composer:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIViewRunningAnimationEntry *v12;
  UIViewRunningAnimationEntry *v13;
  void *v14;
  id completionCallback;
  dispatch_queue_t v16;
  OS_dispatch_queue *transactionQueue;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIViewRunningAnimationEntry;
  v12 = -[UIViewRunningAnimationEntry init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_animation, a3);
    v13->_invalidated = 0;
    v14 = _Block_copy(v10);
    completionCallback = v13->_completionCallback;
    v13->_completionCallback = v14;

    v16 = dispatch_queue_create("com.apple.UIKit.animationsEntryTransactionQueue", MEMORY[0x1E0C80D50]);
    transactionQueue = v13->_transactionQueue;
    v13->_transactionQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v13->_composer, a5);
  }

  return v13;
}

- (void)setCompletionCallback:(id)a3
{
  void *v4;
  id completionCallback;

  v4 = _Block_copy(a3);
  completionCallback = self->_completionCallback;
  self->_completionCallback = v4;

}

- (UIViewAnimationState)animationState
{
  return (UIViewAnimationState *)objc_loadWeakRetained((id *)&self->_animationState);
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void)performWithoutLock:(id)a3
{
  (*((void (**)(id, UIIntervalAnimating *))a3 + 2))(a3, self->_animation);
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (UIViewAnimationComposing)composer
{
  return self->_composer;
}

- (void)setComposer:(id)a3
{
  objc_storeStrong((id *)&self->_composer, a3);
}

@end

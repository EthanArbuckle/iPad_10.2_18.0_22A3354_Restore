@implementation TPSOperationQueueCountObserver

- (void)dealloc
{
  id WeakRetained;
  id completionBlock;
  objc_super v5;

  if (self->_completionBlock)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_operationQueue);
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("operationCount"));

    completionBlock = self->_completionBlock;
    self->_completionBlock = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)TPSOperationQueueCountObserver;
  -[TPSOperationQueueCountObserver dealloc](&v5, sel_dealloc);
}

- (TPSOperationQueueCountObserver)init
{
  return -[TPSOperationQueueCountObserver initWithQueue:](self, "initWithQueue:", 0);
}

- (TPSOperationQueueCountObserver)initWithQueue:(id)a3
{
  id v4;
  TPSOperationQueueCountObserver *v5;
  TPSOperationQueueCountObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSOperationQueueCountObserver;
  v5 = -[TPSOperationQueueCountObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_operationQueue, v4);

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD block[4];
  id v15;
  TPSOperationQueueCountObserver *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("operationCount")))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__TPSOperationQueueCountObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E395B150;
    v15 = v12;
    v16 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TPSOperationQueueCountObserver;
    -[TPSOperationQueueCountObserver observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __81__TPSOperationQueueCountObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(void);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if (!v3)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "lastOperationCount"))
    {
      objc_msgSend(*(id *)(a1 + 40), "completionBlock");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "completionBlock");
        v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v5[2]();

      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "setLastOperationCount:", v3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)lastOperationCount
{
  return self->_lastOperationCount;
}

- (void)setLastOperationCount:(unint64_t)a3
{
  self->_lastOperationCount = a3;
}

- (TPSOperationQueue)operationQueue
{
  return (TPSOperationQueue *)objc_loadWeakRetained((id *)&self->_operationQueue);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeWeak((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operationQueue);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end

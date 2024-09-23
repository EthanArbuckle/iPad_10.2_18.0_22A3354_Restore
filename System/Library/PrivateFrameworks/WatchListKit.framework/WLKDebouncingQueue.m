@implementation WLKDebouncingQueue

- (WLKDebouncingQueue)init
{
  WLKDebouncingQueue *v2;
  WLKDebouncingQueue *v3;
  NSOperationQueue *v4;
  NSOperationQueue *queue;
  NSOperationQueue *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WLKDebouncingQueue;
  v2 = -[WLKDebouncingQueue init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_delay = 250000;
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v3->_queue;
    v3->_queue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v3->_queue, "setQualityOfService:", -1);
    v6 = v3->_queue;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WLKDebouncingQueue-%p"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v6, "setName:", v7);

  }
  return v3;
}

- (void)addOperationWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  if (!v4)
    -[WLKDebouncingQueue addOperationWithBlock:].cold.1();
  v5 = v4;
  -[WLKDebouncingQueue queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllOperations");

  v7 = objc_alloc_init(MEMORY[0x1E0CB34C8]);
  objc_initWeak(&location, v7);
  objc_initWeak(&from, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__WLKDebouncingQueue_addOperationWithBlock___block_invoke;
  v10[3] = &unk_1E68A7D38;
  objc_copyWeak(&v12, &from);
  objc_copyWeak(&v13, &location);
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "addExecutionBlock:", v10);
  -[WLKDebouncingQueue queue](self, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v7);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __44__WLKDebouncingQueue_addOperationWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    usleep(objc_msgSend(WeakRetained, "delay"));
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = objc_msgSend(v4, "isCancelled");

    WLKSystemLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v8 = objc_loadWeakRetained((id *)(a1 + 48));
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKDebouncingQueue - Debouncing op. %@", (uint8_t *)&v10, 0xCu);

      }
    }
    else
    {
      if (v7)
      {
        v9 = objc_loadWeakRetained((id *)(a1 + 48));
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKDebouncingQueue - Running op. %@", (uint8_t *)&v10, 0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

- (unsigned)delay
{
  return self->_delay;
}

- (void)setDelay:(unsigned int)a3
{
  self->_delay = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)addOperationWithBlock:.cold.1()
{
  __assert_rtn("-[WLKDebouncingQueue addOperationWithBlock:]", "WLKDebouncingQueue.m", 38, "block != nil");
}

@end

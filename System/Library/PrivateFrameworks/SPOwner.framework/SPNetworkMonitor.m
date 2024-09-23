@implementation SPNetworkMonitor

- (void)startMonitoringWithCallback:(id)a3
{
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  id v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = dispatch_queue_create("SPNetworkMonitor", v5);
  -[SPNetworkMonitor setCallbackQueue:](self, "setCallbackQueue:", v7);

  -[SPNetworkMonitor setBlock:](self, "setBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPNetworkMonitor setEvaluator:](self, "setEvaluator:", v8);

  -[SPNetworkMonitor evaluator](self, "evaluator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("path"), 5, 0);

}

- (void)stopMonitoring
{
  void *v3;

  -[SPNetworkMonitor setCallbackQueue:](self, "setCallbackQueue:", 0);
  -[SPNetworkMonitor setBlock:](self, "setBlock:", 0);
  -[SPNetworkMonitor evaluator](self, "evaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("path"), 0);

  -[SPNetworkMonitor setEvaluator:](self, "setEvaluator:", 0);
}

- (BOOL)isMonitoring
{
  void *v2;
  BOOL v3;

  -[SPNetworkMonitor evaluator](self, "evaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isNetworkUp
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[SPNetworkMonitor isMonitoring](self, "isMonitoring");
  if (v3)
  {
    -[SPNetworkMonitor evaluator](self, "evaluator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "status");

    LOBYTE(v3) = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  return v3;
}

- (void)setCachedIsNetworkUp:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  -[SPNetworkMonitor callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_cachedIsNetworkUp != v3)
  {
    self->_cachedIsNetworkUp = v3;
    -[SPNetworkMonitor notifyNetworkStateChange](self, "notifyNetworkStateChange");
  }
}

- (void)notifyNetworkStateChange
{
  NSObject *v3;
  _BOOL4 v4;
  const __CFString *v5;
  _QWORD activity_block[5];
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SPNetworkMonitor callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[SPNetworkMonitor cachedIsNetworkUp](self, "cachedIsNetworkUp");
    v5 = CFSTR("DOWN");
    if (v4)
      v5 = CFSTR("UP");
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AEA79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Network state changed: %@", buf, 0xCu);
  }
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __44__SPNetworkMonitor_notifyNetworkStateChange__block_invoke;
  activity_block[3] = &unk_1E5E16668;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1AEA79000, "Network state changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __44__SPNetworkMonitor_notifyNetworkStateChange__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "block");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__SPNetworkMonitor_notifyNetworkStateChange__block_invoke_2;
    v8[3] = &unk_1E5E16668;
    v8[4] = v3;
    dispatch_async(v4, v8);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("IsNetworkAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "cachedIsNetworkUp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("com.apple.icloud.SPOwner.SPNetworkMonitor.networkChanged"), 0, v7);

}

void __44__SPNetworkMonitor_notifyNetworkStateChange__block_invoke_2(uint64_t a1)
{
  void (**v2)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "block");
  v2 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v2[2](v2, objc_msgSend(*(id *)(a1 + 32), "cachedIsNetworkUp"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v8 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("path")))
  {
    -[SPNetworkMonitor callbackQueue](self, "callbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__SPNetworkMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v10[3] = &unk_1E5E16818;
    v10[4] = self;
    v11 = v8;
    dispatch_async(v9, v10);

  }
}

void __67__SPNetworkMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "evaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "setCachedIsNetworkUp:", objc_msgSend(*(id *)(a1 + 32), "isNetworkUp"));
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_evaluator, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (BOOL)cachedIsNetworkUp
{
  return self->_cachedIsNetworkUp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
}

@end

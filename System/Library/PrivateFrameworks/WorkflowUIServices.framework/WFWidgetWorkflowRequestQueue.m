@implementation WFWidgetWorkflowRequestQueue

- (WFWidgetWorkflowRequestQueue)init
{
  WFWidgetWorkflowRequestQueue *v2;
  uint64_t v3;
  NSMutableArray *requests;
  os_log_t v5;
  OS_os_log *log;
  WFWidgetWorkflowRequestQueue *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFWidgetWorkflowRequestQueue;
  v2 = -[WFWidgetWorkflowRequestQueue init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableArray *)v3;

    v2->_handlingRequest = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = os_log_create("com.apple.shortcuts", "WidgetWorkflowRequestQueue");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)getWidgetWorkflowWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WFWidgetWorkflowFetchRequest *v8;
  NSObject *v9;
  void *v10;
  int v11;
  WFWidgetWorkflowFetchRequest *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = -[WFWidgetWorkflowFetchRequest initWithFetchType:identifier:limit:retryCount:completionHandler:]([WFWidgetWorkflowFetchRequest alloc], "initWithFetchType:identifier:limit:retryCount:completionHandler:", 0, v7, 1, 0, v6);

  -[WFWidgetWorkflowRequestQueue log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_20CE0F000, v9, OS_LOG_TYPE_DEFAULT, "Adding request: %@", (uint8_t *)&v11, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  -[WFWidgetWorkflowRequestQueue requests](self, "requests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  os_unfair_lock_unlock(&self->_lock);
  -[WFWidgetWorkflowRequestQueue fetchNextQueuedItem](self, "fetchNextQueuedItem");

}

- (void)getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  WFWidgetWorkflowFetchRequest *v12;
  NSObject *v13;
  void *v14;
  int v15;
  WFWidgetWorkflowFetchRequest *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MyShortcuts")))
    v10 = 0;
  else
    v10 = v8;
  v11 = v10;
  v12 = -[WFWidgetWorkflowFetchRequest initWithFetchType:identifier:limit:retryCount:completionHandler:]([WFWidgetWorkflowFetchRequest alloc], "initWithFetchType:identifier:limit:retryCount:completionHandler:", 1, v11, a4, 0, v9);

  -[WFWidgetWorkflowRequestQueue log](self, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v12;
    _os_log_impl(&dword_20CE0F000, v13, OS_LOG_TYPE_DEFAULT, "Adding request: %@", (uint8_t *)&v15, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  -[WFWidgetWorkflowRequestQueue requests](self, "requests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v12);

  os_unfair_lock_unlock(&self->_lock);
  -[WFWidgetWorkflowRequestQueue fetchNextQueuedItem](self, "fetchNextQueuedItem");

}

- (void)_requeueFailedRequest:(id)a3
{
  id v4;
  WFWidgetWorkflowFetchRequest *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WFWidgetWorkflowFetchRequest *v11;
  NSObject *v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  int v15;
  WFWidgetWorkflowFetchRequest *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [WFWidgetWorkflowFetchRequest alloc];
  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "limit");
  v9 = objc_msgSend(v4, "retryCount") + 1;
  objc_msgSend(v4, "completionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFWidgetWorkflowFetchRequest initWithFetchType:identifier:limit:retryCount:completionHandler:](v5, "initWithFetchType:identifier:limit:retryCount:completionHandler:", v6, v7, v8, v9, v10);
  -[WFWidgetWorkflowRequestQueue log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_20CE0F000, v12, OS_LOG_TYPE_DEFAULT, "Re-adding failed request: %@", (uint8_t *)&v15, 0xCu);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WFWidgetWorkflowRequestQueue requests](self, "requests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertObject:atIndex:", v11, 0);

  os_unfair_lock_unlock(p_lock);
}

- (void)fetchNextQueuedItem
{
  os_unfair_lock_s *p_lock;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[WFWidgetWorkflowRequestQueue isHandlingRequest](self, "isHandlingRequest");
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    v6 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke;
    aBlock[3] = &unk_24C5AB6A0;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    os_unfair_lock_lock(p_lock);
    -[WFWidgetWorkflowRequestQueue requests](self, "requests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
    if (v8)
    {
      os_unfair_lock_lock(p_lock);
      -[WFWidgetWorkflowRequestQueue requests](self, "requests");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectAtIndex:", 0);

      -[WFWidgetWorkflowRequestQueue setHandlingRequest:](self, "setHandlingRequest:", 1);
      os_unfair_lock_unlock(p_lock);
      -[WFWidgetWorkflowRequestQueue log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v8;
        _os_log_impl(&dword_20CE0F000, v10, OS_LOG_TYPE_DEFAULT, "Handling request: %@", buf, 0xCu);
      }

      if (objc_msgSend(v8, "type"))
      {
        if (objc_msgSend(v8, "type") != 1)
        {
LABEL_14:

          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v8, "limit");
        v17[0] = v6;
        v17[1] = 3221225472;
        v17[2] = __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke_2;
        v17[3] = &unk_24C5AB6F0;
        v19 = v5;
        v18 = v8;
        objc_msgSend(v11, "getWidgetWorkflowsInCollectionWithIdentifier:limit:completion:", v12, v13, v17);

        v14 = v19;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v6;
        v20[1] = 3221225472;
        v20[2] = __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke_75;
        v20[3] = &unk_24C5AB6C8;
        v22 = v5;
        v21 = v8;
        objc_msgSend(v15, "getWidgetWorkflowWithIdentifier:completion:", v16, v20);

        v14 = v22;
      }
    }
    else
    {
      -[WFWidgetWorkflowRequestQueue log](self, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CE0F000, v14, OS_LOG_TYPE_DEFAULT, "No pending requests.", buf, 2u);
      }
    }

    goto LABEL_14;
  }
  -[WFWidgetWorkflowRequestQueue log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CE0F000, v5, OS_LOG_TYPE_DEFAULT, "Already handling request, dropping request to move forward", buf, 2u);
  }
LABEL_15:

}

- (BOOL)isHandlingRequest
{
  return self->_handlingRequest;
}

- (void)setHandlingRequest:(BOOL)a3
{
  self->_handlingRequest = a3;
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

void __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_20CE0F000, v10, OS_LOG_TYPE_DEFAULT, "Finished with result: %@, error: %@", (uint8_t *)&v13, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  objc_msgSend(*(id *)(a1 + 32), "setHandlingRequest:", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  if (v9 && !objc_msgSend(v7, "retryCount"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_requeueFailedRequest:", v7);
  }
  else
  {
    objc_msgSend(v7, "completionHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v11)[2](v11, v8, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_20CE0F000, v12, OS_LOG_TYPE_DEFAULT, "Onto the next...", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "fetchNextQueuedItem");
}

uint64_t __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke_75(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t __51__WFWidgetWorkflowRequestQueue_fetchNextQueuedItem__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

@end

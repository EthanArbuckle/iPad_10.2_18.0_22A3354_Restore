@implementation WBSettingsTaskHandler

- (WBSettingsTaskHandler)init
{
  WBSettingsTaskHandler *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSMutableArray *tasks;
  WBSettingsTaskHandler *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WBSettingsTaskHandler;
  v2 = -[WBSettingsTaskHandler init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.WebBookmarks.WBSettingsTaskHandler.%p"), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    tasks = v2->_tasks;
    v2->_tasks = (NSMutableArray *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)enqueueTask:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__WBSettingsTaskHandler_enqueueTask___block_invoke;
  v7[3] = &unk_24CB31830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __37__WBSettingsTaskHandler_enqueueTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueTask:", *(_QWORD *)(a1 + 40));
}

- (void)_enqueueTask:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WBSettingsTaskHandler _shouldEnqueueTask:](self, "_shouldEnqueueTask:", v4))
  {
    -[NSMutableArray addObject:](self->_tasks, "addObject:", v4);
    -[WBSettingsTaskHandler _performNextTask](self, "_performNextTask");
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      v7 = 134217984;
      v8 = objc_msgSend(v4, "taskType");
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "Not queueing settings task with type %ld since one has already been scheduled.", (uint8_t *)&v7, 0xCu);

    }
  }

}

- (BOOL)_shouldEnqueueTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  objc_msgSend(v4, "websiteDataRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_12:
    v13 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v4, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_12;
  v7 = -[NSMutableArray count](self->_tasks, "count");
  v8 = objc_msgSend(v4, "taskType");
  if (v7 < 2)
    goto LABEL_12;
  v9 = v8;
  v10 = 2;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_tasks, "objectAtIndexedSubscript:", v10 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "taskType");

    v13 = v12 != v9;
  }
  while (v12 != v9 && v7 != v10++);
LABEL_13:

  return v13;
}

- (void)_performNextTask
{
  uint64_t v3;
  WBSettingsTask *currentTask;
  BOOL v5;
  BOOL v6;
  void (**startBackgroundTaskAssertionBlock)(void);
  void *v8;
  id v9;
  WBSettingsTask *v10;
  WBSettingsTask *v11;
  id backgroundTaskAssertionToken;
  void (**finishBackgroundTaskAssertionBlock)(void);

  v3 = -[NSMutableArray count](self->_tasks, "count");
  currentTask = self->_currentTask;
  if (currentTask)
    v5 = 0;
  else
    v5 = v3 == 0;
  if (v5)
  {
    backgroundTaskAssertionToken = self->_backgroundTaskAssertionToken;
    if (backgroundTaskAssertionToken)
    {
      finishBackgroundTaskAssertionBlock = (void (**)(void))self->_finishBackgroundTaskAssertionBlock;
      if (finishBackgroundTaskAssertionBlock)
      {
        finishBackgroundTaskAssertionBlock[2]();
        backgroundTaskAssertionToken = self->_backgroundTaskAssertionToken;
      }
      self->_backgroundTaskAssertionToken = 0;

    }
  }
  else
  {
    if (currentTask)
      v6 = 1;
    else
      v6 = v3 == 0;
    if (!v6)
    {
      if (!self->_backgroundTaskAssertionToken)
      {
        startBackgroundTaskAssertionBlock = (void (**)(void))self->_startBackgroundTaskAssertionBlock;
        if (startBackgroundTaskAssertionBlock)
        {
          startBackgroundTaskAssertionBlock[2]();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = self->_backgroundTaskAssertionToken;
          self->_backgroundTaskAssertionToken = v8;

        }
      }
      -[NSMutableArray objectAtIndexedSubscript:](self->_tasks, "objectAtIndexedSubscript:", 0);
      v10 = (WBSettingsTask *)objc_claimAutoreleasedReturnValue();
      v11 = self->_currentTask;
      self->_currentTask = v10;

      self->_currentRetryCount = 0;
      -[NSMutableArray removeObjectAtIndex:](self->_tasks, "removeObjectAtIndex:", 0);
      -[WBSettingsTaskHandler _attemptCurrentTask](self, "_attemptCurrentTask");
    }
  }
}

- (void)_attemptCurrentTask
{
  OUTLINED_FUNCTION_0_0(&dword_211022000, a1, a3, "Skipping task with type %ld due to incorrect arguments", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

void __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_2;
  v7[3] = &unk_24CB31830;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentTaskAttemptDidFinishWithError:", *(_QWORD *)(a1 + 40));
}

void __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_2_6;
  v7[3] = &unk_24CB31830;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_6;
  v7[3] = &unk_24CB31830;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_2_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentTaskAttemptDidFinishWithError:", *(_QWORD *)(a1 + 40));
}

void __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_4;
  v7[3] = &unk_24CB31830;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentTaskAttemptDidFinishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentTaskAttemptDidFinishWithError:", *(_QWORD *)(a1 + 40));
}

void __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_8;
  v7[3] = &unk_24CB31830;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __44__WBSettingsTaskHandler__attemptCurrentTask__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_currentTaskAttemptDidFinishWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_finishCurrentTask
{
  NSObject *v3;
  WBSettingsTask *currentTask;
  NSObject *v5;
  WBSettingsTask *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    currentTask = self->_currentTask;
    v5 = v3;
    v7 = 134217984;
    v8 = -[WBSettingsTask taskType](currentTask, "taskType");
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "Marking current task with type %ld as finished. Attempting next available task", (uint8_t *)&v7, 0xCu);

  }
  v6 = self->_currentTask;
  self->_currentTask = 0;

  -[WBSettingsTaskHandler _performNextTask](self, "_performNextTask");
}

- (void)_currentTaskAttemptDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *queue;
  NSObject *v12;
  NSObject *v13;
  WBSettingsTask *currentTask;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id location;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("WebBookmarksXPCConnectionErrorDomain"));

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v7 = (id)WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[WBSettingsTask taskType](self->_currentTask, "taskType");
      objc_msgSend(v4, "wb_privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSettingsTaskHandler _currentTaskAttemptDidFinishWithError:].cold.1(v9, (uint64_t)buf, v8, v7);
    }

    v10 = dispatch_time(0, 200000000);
    queue = self->_queue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __63__WBSettingsTaskHandler__currentTaskAttemptDidFinishWithError___block_invoke;
    v16[3] = &unk_24CB318D0;
    objc_copyWeak(&v17, &location);
    dispatch_after(v10, queue, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    v13 = v12;
    if (v4)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WBSettingsTaskHandler _currentTaskAttemptDidFinishWithError:].cold.2((uint64_t)self, v13, v4);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      currentTask = self->_currentTask;
      v15 = v13;
      *(_DWORD *)buf = 134217984;
      v20 = -[WBSettingsTask taskType](currentTask, "taskType");
      _os_log_impl(&dword_211022000, v15, OS_LOG_TYPE_INFO, "Successfully performed settings task with type: %ld", buf, 0xCu);

    }
    -[WBSettingsTaskHandler _finishCurrentTask](self, "_finishCurrentTask");
  }

}

void __63__WBSettingsTaskHandler__currentTaskAttemptDidFinishWithError___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ++WeakRetained[4];
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_attemptCurrentTask");
    WeakRetained = v2;
  }

}

- (id)startBackgroundTaskAssertionBlock
{
  return self->_startBackgroundTaskAssertionBlock;
}

- (void)setStartBackgroundTaskAssertionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)finishBackgroundTaskAssertionBlock
{
  return self->_finishBackgroundTaskAssertionBlock;
}

- (void)setFinishBackgroundTaskAssertionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishBackgroundTaskAssertionBlock, 0);
  objc_storeStrong(&self->_startBackgroundTaskAssertionBlock, 0);
  objc_storeStrong(&self->_backgroundTaskAssertionToken, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_currentTaskAttemptDidFinishWithError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_9(&dword_211022000, a4, a3, "Received error while performing settings task with type: %ld, error: %{public}@", (uint8_t *)a2);

}

- (void)_currentTaskAttemptDidFinishWithError:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 24);
  v5 = a2;
  v6 = objc_msgSend(v4, "taskType");
  objc_msgSend(a3, "wb_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218242;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_9(&dword_211022000, v5, v8, "Settings task with type %ld finished with a non-xpc error %{public}@", (uint8_t *)&v9);

}

@end

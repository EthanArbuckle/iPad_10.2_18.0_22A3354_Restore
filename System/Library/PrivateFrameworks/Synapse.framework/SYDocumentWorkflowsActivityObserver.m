@implementation SYDocumentWorkflowsActivityObserver

- (void)_handleActiveUserActivityChangeAfterDelay:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_appStateObserver);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke;
  block[3] = &unk_1E757BB68;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)userActivityPersistentIdentifierWasChanged:(id)a3 persistentIdentifier:(id)a4 previousValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "user activity persistent identifier was changed from %@ to %@", (uint8_t *)&v12, 0x16u);
  }

  -[SYDocumentWorkflowsActivityObserver _handleActiveUserActivityChange:](self, "_handleActiveUserActivityChange:", v10);
}

- (void)userActivityDidBecomeCurrent:(id)a3 current:(BOOL)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_INFO, "user activity did become current", v7, 2u);
  }

  -[SYDocumentWorkflowsActivityObserver _handleActiveUserActivityChange:](self, "_handleActiveUserActivityChange:", v5);
}

- (void)_handleActiveUserActivityChange:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0DE7910];
  v5 = a3;
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleActiveUserActivityChangeAfterDelay_, v5);
  -[SYDocumentWorkflowsActivityObserver performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__handleActiveUserActivityChangeAfterDelay_, v5, 0.1);

}

uint64_t __62__SYDocumentWorkflowsActivityObserver__handleAppBecomeActive___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_handleActiveUserActivityChange:", a2);
  return result;
}

void __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[16];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)(a1 + 48));

    if (v5)
    {
      v6 = objc_loadWeakRetained(v2);
      objc_msgSend(v6, "handler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = objc_loadWeakRetained((id *)(a1 + 48));
      LOBYTE(v8) = objc_msgSend(v7, "canHandleUserActivityChange:appStateObserver:", v8, v9);

      if ((v8 & 1) != 0)
      {
        v12 = objc_loadWeakRetained(v2);
        objc_msgSend(v12, "handler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleActiveUserActivityChange:withCompletion:", *(_QWORD *)(a1 + 32), &__block_literal_global_6);

      }
      else
      {
        v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "Can't handle user activity change", buf, 2u);
        }

      }
    }
  }
}

- (SYDocumentWorkflowsActivityChangeHandler)handler
{
  return self->_handler;
}

- (void)registerForAppStateNotifications
{
  SYApplicationStateObserver *v3;
  uint64_t v4;
  SYApplicationStateObserver *v5;
  SYApplicationStateObserver *appStateObserver;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_appStateObserver)
  {
    objc_initWeak(&location, self);
    v3 = [SYApplicationStateObserver alloc];
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__SYDocumentWorkflowsActivityObserver_registerForAppStateNotifications__block_invoke;
    v9[3] = &unk_1E757BAF8;
    objc_copyWeak(&v10, &location);
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __71__SYDocumentWorkflowsActivityObserver_registerForAppStateNotifications__block_invoke_2;
    v7[3] = &unk_1E757BAF8;
    objc_copyWeak(&v8, &location);
    v5 = -[SYApplicationStateObserver initWithBecomeActiveHandler:resignActiveHandler:](v3, "initWithBecomeActiveHandler:resignActiveHandler:", v9, v7);
    appStateObserver = self->_appStateObserver;
    self->_appStateObserver = v5;

    -[SYApplicationStateObserver registerForAppStateNotifications](self->_appStateObserver, "registerForAppStateNotifications");
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (SYDocumentWorkflowsActivityObserver)init
{
  SYDocumentWorkflowsActivityObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *observerQueue;
  SYDocumentWorkflowsActivityChangeHandler *v6;
  SYDocumentWorkflowsActivityChangeHandler *handler;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SYDocumentWorkflowsActivityObserver;
  v2 = -[SYDocumentWorkflowsActivityObserver init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.DocumentWorkflowActivityObserver", v3);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SYDocumentWorkflowsActivityChangeHandler);
    handler = v2->_handler;
    v2->_handler = v6;

  }
  return v2;
}

void __71__SYDocumentWorkflowsActivityObserver_registerForAppStateNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAppBecomeActive:", v3);

}

- (void)_handleAppBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "application did become active: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SYDocumentWorkflowsActivityObserver__handleAppBecomeActive___block_invoke;
  v6[3] = &unk_1E757BB20;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CA5920], "_syFetchCurrentUserActivityWithCompletion:", v6);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SYDocumentWorkflowsActivityObserver *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1BCC38000, v3, OS_LOG_TYPE_INFO, "deallocating: %p", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)SYDocumentWorkflowsActivityObserver;
  -[SYDocumentWorkflowsActivityObserver dealloc](&v4, sel_dealloc);
}

void __71__SYDocumentWorkflowsActivityObserver_registerForAppStateNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleAppResignActive:", v3);

}

- (void)_handleAppResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_INFO, "application did resign active: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SYDocumentWorkflowsActivityObserver _updateLinkedDocuments](self, "_updateLinkedDocuments");
}

void __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke_12(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke_12_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)_updateLinkedDocuments
{
  NSObject *v2;
  SYDocumentWorkflowsClient *v3;
  uint8_t v4[16];

  if (SYIsMailApp())
  {
    v2 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1BCC38000, v2, OS_LOG_TYPE_INFO, "Updating linked documents started...", v4, 2u);
    }

    v3 = objc_alloc_init(SYDocumentWorkflowsClient);
    -[SYDocumentWorkflowsClient updateLinkedDocumentsWithCompletion:](v3, "updateLinkedDocumentsWithCompletion:", &__block_literal_global_16_0);

  }
}

void __61__SYDocumentWorkflowsActivityObserver__updateLinkedDocuments__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__SYDocumentWorkflowsActivityObserver__updateLinkedDocuments__block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_log_impl(&dword_1BCC38000, v12, OS_LOG_TYPE_INFO, "Updating linked documents finished, success: %d", (uint8_t *)v13, 8u);
  }

}

- (void)setHandler:(id)a3
{
  objc_storeStrong((id *)&self->_handler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_closeConfirmationSettings, 0);
  objc_storeStrong((id *)&self->_appStateObserver, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

void __81__SYDocumentWorkflowsActivityObserver__handleActiveUserActivityChangeAfterDelay___block_invoke_12_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Handling user activity change failed with error: %@", a5, a6, a7, a8, 2u);
}

void __61__SYDocumentWorkflowsActivityObserver__updateLinkedDocuments__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Unable to update linked documents, error: %@", a5, a6, a7, a8, 2u);
}

@end

@implementation STKUSSDAlertSessionManager

- (STKUSSDAlertSessionManager)initWithSubscriptionMonitor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  STKUSSDAlertSessionManager *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  CoreTelephonyClient *telephonyClient;
  NSMutableArray *v13;
  NSMutableArray *activeUSSDSessions;
  NSMutableArray *v15;
  NSMutableArray *finishedUSSDSessions;
  NSMutableArray *v17;
  NSMutableArray *activeSupplementaryServicesSessions;
  NSMutableArray *v19;
  NSMutableArray *finishedSupplementaryServicesSessions;
  NSObject *v21;
  _QWORD block[4];
  STKUSSDAlertSessionManager *v24;
  objc_super v25;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  STKUSSDLog();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)STKUSSDAlertSessionManager;
  v8 = -[STKAlertSessionManager initWithEventQueue:logger:](&v25, sel_initWithEventQueue_logger_, v6, v7);

  if (v8)
  {
    v9 = BSDispatchQueueCreateWithQualityOfService();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v8->_queue);
    telephonyClient = v8->_telephonyClient;
    v8->_telephonyClient = (CoreTelephonyClient *)v11;

    objc_storeStrong((id *)&v8->_subscriptionMonitor, a3);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    activeUSSDSessions = v8->_activeUSSDSessions;
    v8->_activeUSSDSessions = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    finishedUSSDSessions = v8->_finishedUSSDSessions;
    v8->_finishedUSSDSessions = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    activeSupplementaryServicesSessions = v8->_activeSupplementaryServicesSessions;
    v8->_activeSupplementaryServicesSessions = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    finishedSupplementaryServicesSessions = v8->_finishedSupplementaryServicesSessions;
    v8->_finishedSupplementaryServicesSessions = v19;

    v21 = v8->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__STKUSSDAlertSessionManager_initWithSubscriptionMonitor___block_invoke;
    block[3] = &unk_24D563080;
    v24 = v8;
    dispatch_sync(v21, block);

  }
  return v8;
}

uint64_t __58__STKUSSDAlertSessionManager_initWithSubscriptionMonitor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startListening");
}

- (void)_willPresentAlertHandle:(id)a3
{
  objc_msgSend(a3, "addObserver:", self);
}

- (id)remoteAlertDescriptorForSession:(id)a3
{
  id v4;
  STKUSSDSessionData *v5;
  STKUSSDSessionAction *v6;
  STKUSSDSessionAction *v7;
  _STKRemoteAlertDescriptor *v8;
  _STKRemoteAlertDescriptor *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  STKUSSDAlertSessionManager *v16;
  id v17;
  id location;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v5 = -[STKUSSDSessionData initWithText:allowsResponse:]([STKUSSDSessionData alloc], "initWithText:allowsResponse:", 0, 0);
    v6 = [STKUSSDSessionAction alloc];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __62__STKUSSDAlertSessionManager_remoteAlertDescriptorForSession___block_invoke;
    v14 = &unk_24D5630D0;
    objc_copyWeak(&v17, &location);
    v15 = v4;
    v16 = self;
    v7 = -[STKUSSDSessionAction initWithInputData:response:](v6, "initWithInputData:response:", v5, &v11);
    v8 = [_STKRemoteAlertDescriptor alloc];
    v9 = -[_STKRemoteAlertDescriptor initWithAction:viewControllerName:](v8, "initWithAction:viewControllerName:", v7, CFSTR("STKUSSDViewController"), v11, v12, v13, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __62__STKUSSDAlertSessionManager_remoteAlertDescriptorForSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v5 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[4];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__STKUSSDAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_2;
    block[3] = &unk_24D5630A8;
    block[4] = WeakRetained;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = v9;
    v13 = v10;
    v14 = v5;
    v15 = a2;
    dispatch_async(v8, block);

  }
}

uint64_t __62__STKUSSDAlertSessionManager_remoteAlertDescriptorForSession___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v6[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_216439000, v2, OS_LOG_TYPE_DEFAULT, "Sending response for active session - marking it as finished.", v6, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  if (*(_QWORD *)(a1 + 56))
    return objc_msgSend(v3, "sendResponse:withStringResult:", v4);
  else
    return objc_msgSend(v3, "sendResponse:", v4);
}

- (void)handleUSSDEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__STKUSSDAlertSessionManager_handleUSSDEvent_responder_userInfo___block_invoke;
  v13[3] = &unk_24D5630F8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

uint64_t __65__STKUSSDAlertSessionManager_handleUSSDEvent_responder_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleUSSDEvent:responder:userInfo:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
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
  v7[2] = __61__STKUSSDAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_24D563120;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __61__STKUSSDAlertSessionManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v59;
    *(_QWORD *)&v4 = 134217984;
    v42 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v59 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v8, "alertHandle", v42);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);

        if (v9 == v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v42;
            v66 = v8;
            _os_log_impl(&dword_216439000, v11, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated - ended active session", buf, 0xCu);
          }

          objc_msgSend(v8, "invalidate");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", v8);
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v5);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v55;
    *(_QWORD *)&v14 = 134217984;
    v43 = v14;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v18, "alertHandle", v43);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 40);

        if (v19 == v20)
        {
          objc_msgSend(v18, "invalidate");
          objc_msgSend(*(id *)(a1 + 32), "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v43;
            v66 = v18;
            _os_log_impl(&dword_216439000, v21, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated - Ended finished session", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", v18);
        }
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v15);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v22 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v51;
    *(_QWORD *)&v24 = 134217984;
    v44 = v24;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v51 != v26)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
        objc_msgSend(v28, "alertHandle", v44);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(void **)(a1 + 40);

        if (v29 == v30)
        {
          objc_msgSend(v28, "invalidate");
          objc_msgSend(*(id *)(a1 + 32), "log");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v44;
            v66 = v28;
            _os_log_impl(&dword_216439000, v31, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated - Ended active supplementary services session", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", v28);
        }
      }
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v25);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v32 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (v33)
  {
    v35 = v33;
    v36 = *(_QWORD *)v47;
    *(_QWORD *)&v34 = 134217984;
    v45 = v34;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
        objc_msgSend(v38, "alertHandle", v45);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *(void **)(a1 + 40);

        if (v39 == v40)
        {
          objc_msgSend(v38, "invalidate");
          objc_msgSend(*(id *)(a1 + 32), "log");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v45;
            v66 = v38;
            _os_log_impl(&dword_216439000, v41, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleDeactivated - Ended finished supplementary services session", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", v38);
        }
      }
      v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    }
    while (v35);
  }

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  objc_msgSend(v5, "removeObserver:", self);
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__STKUSSDAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke;
  v8[3] = &unk_24D563120;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __71__STKUSSDAlertSessionManager_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v65;
    *(_QWORD *)&v4 = 134217984;
    v48 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v65 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v8, "alertHandle", v48);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);

        if (v9 == v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v48;
            v72 = v8;
            _os_log_impl(&dword_216439000, v11, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended active session", buf, 0xCu);
          }

          objc_msgSend(v8, "invalidate");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", v8);
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v5);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v61;
    *(_QWORD *)&v14 = 134217984;
    v49 = v14;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v61 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        objc_msgSend(v18, "alertHandle", v49);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 40);

        if (v19 == v20)
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v49;
            v72 = v18;
            _os_log_impl(&dword_216439000, v21, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended finished session", buf, 0xCu);
          }

          objc_msgSend(v18, "invalidate");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", v18);
        }
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v15);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v22 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v57;
    *(_QWORD *)&v24 = 134217984;
    v50 = v24;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v57 != v26)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
        objc_msgSend(v28, "alertHandle", v50);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(void **)(a1 + 40);

        if (v29 == v30)
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v50;
            v72 = v28;
            _os_log_impl(&dword_216439000, v31, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended active supplementary services session", buf, 0xCu);
          }

          objc_msgSend(v28, "invalidate");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", v28);
        }
      }
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v25);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v32 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
  if (v33)
  {
    v35 = v33;
    v36 = *(_QWORD *)v53;
    *(_QWORD *)&v34 = 134217984;
    v51 = v34;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v53 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * m);
        objc_msgSend(v38, "alertHandle", v51);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *(void **)(a1 + 40);

        if (v39 == v40)
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v51;
            v72 = v38;
            _os_log_impl(&dword_216439000, v41, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended finished supplementary services session", buf, 0xCu);
          }

          objc_msgSend(v38, "invalidate");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", v38);
        }
      }
      v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    }
    while (v35);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "alertHandle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *(void **)(a1 + 40);

  if (v42 == v43)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      *(_DWORD *)buf = 134217984;
      v72 = v45;
      _os_log_impl(&dword_216439000, v44, OS_LOG_TYPE_DEFAULT, "Session <%p> - AlertHandleInvalidated - Ended coalescing session", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v46 = *(_QWORD *)(a1 + 32);
    v47 = *(void **)(v46 + 72);
    *(_QWORD *)(v46 + 72) = 0;

  }
}

- (void)suppServicesStarted:(id)a3
{
  id v4;

  -[STKUSSDAlertSessionManager _supplementaryServicesResponder](self, "_supplementaryServicesResponder", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STKUSSDAlertSessionManager _queue_handleUSSDEvent:responder:userInfo:](self, "_queue_handleUSSDEvent:responder:userInfo:", 6, v4, MEMORY[0x24BDBD1B8]);

}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("STKUSSDSupplementaryServiceEventTypeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("STKUSSDSupplementaryServiceSettingTypeKey"));

  if (v9)
  {
    v13 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("STKUSSDSupplementaryServiceNotificationDataKey"));

  }
  -[STKAlertSessionManager log](self, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isInternalInstall");

    if (!v16)
      goto LABEL_9;
  }
  -[STKAlertSessionManager log](self, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109890;
    v19[1] = v7;
    v20 = 1024;
    v21 = v6;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_216439000, v17, OS_LOG_TYPE_DEFAULT, "RAW: Event received: %d, settingsType: %d, data: %@, userInfo: %@", (uint8_t *)v19, 0x22u);
  }

LABEL_9:
  -[STKUSSDAlertSessionManager _supplementaryServicesResponder](self, "_supplementaryServicesResponder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[STKUSSDAlertSessionManager _queue_handleUSSDEvent:responder:userInfo:](self, "_queue_handleUSSDEvent:responder:userInfo:", 7, v18, v10);

}

- (void)suppServicesCompleted:(id)a3
{
  id v4;

  -[STKUSSDAlertSessionManager _supplementaryServicesResponder](self, "_supplementaryServicesResponder", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STKUSSDAlertSessionManager _queue_handleUSSDEvent:responder:userInfo:](self, "_queue_handleUSSDEvent:responder:userInfo:", 9, v4, MEMORY[0x24BDBD1B8]);

}

- (void)suppServicesError:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDC30F8]);

    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDC3108]);

    }
  }
  else
  {
    v7 = 0;
  }
  -[STKUSSDAlertSessionManager _supplementaryServicesResponder](self, "_supplementaryServicesResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STKUSSDAlertSessionManager _queue_handleUSSDEvent:responder:userInfo:](self, "_queue_handleUSSDEvent:responder:userInfo:", 8, v11, v7);

}

- (void)_executeOnQueue:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKUSSDAlertSessionManager.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__STKUSSDAlertSessionManager__executeOnQueue___block_invoke;
  block[3] = &unk_24D563148;
  v10 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

uint64_t __46__STKUSSDAlertSessionManager__executeOnQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_queue_handleUSSDEvent:(int64_t)a3 responder:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  STKUSSDAlertSession *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  STKUSSDAlertSession *v21;
  NSObject *v22;
  void *v23;
  int v24;
  __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  STKUSSDAlertSession *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  STKUSSDAlertSession *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  STKUSSDAlertSession *v42;
  void *v43;
  NSObject *v44;
  id *p_coalescingUSSDSession;
  id v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  int v51;
  _QWORD v52[4];
  NSObject *v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  NSObject *v58;
  uint64_t v59;
  _QWORD v60[4];
  NSObject *v61;
  char v62;
  _QWORD v63[5];
  STKUSSDAlertSession *v64;
  char v65;
  uint8_t buf[4];
  STKUSSDAlertSession *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  BSDispatchQueueAssert();
  switch(a3)
  {
    case 0:
      -[STKAlertSessionManager log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216439000, v10, OS_LOG_TYPE_DEFAULT, "Unknown STKUSSDEvent", buf, 2u);
      }
      goto LABEL_63;
    case 1:
      -[STKAlertSessionManager log](self, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216439000, v11, OS_LOG_TYPE_DEFAULT, "Event Begin", buf, 2u);
      }

      v12 = [STKUSSDAlertSession alloc];
      -[STKAlertSessionManager log](self, "log");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[STKUSSDAlertSession initWithLogger:responseProvider:event:options:sound:](v12, "initWithLogger:responseProvider:event:options:sound:", v13, v8, 1, v9, 0);

      -[NSMutableArray addObject:](self->_activeUSSDSessions, "addObject:", v10);
      v14 = &__block_literal_global_0;
      goto LABEL_26;
    case 2:
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC3118]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC3110]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v16, "BOOLValue");

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCallSimSlot"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      -[STKCarrierSubscriptionMonitor subscriptionInfoForSlot:](self->_subscriptionMonitor, "subscriptionInfoForSlot:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ussdFilter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray lastObject](self->_activeUSSDSessions, "lastObject");
      v21 = (STKUSSDAlertSession *)objc_claimAutoreleasedReturnValue();
      -[STKAlertSessionManager log](self, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v50 = v20;
        objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isInternalInstall");
        if (v24)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", string: %@"), v15);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = &stru_24D563A28;
        }
        *(_DWORD *)buf = 134218498;
        v67 = v21;
        v68 = 1024;
        v69 = v51;
        v70 = 2114;
        v71 = v25;
        _os_log_impl(&dword_216439000, v22, OS_LOG_TYPE_DEFAULT, "Session <%p> - String Event (should respond? %d%{public}@)", buf, 0x1Cu);
        if (v24)

        v20 = v50;
      }

      v65 = 0;
      if (!v21)
      {
        if ((v51 & 1) != 0 || (objc_msgSend(v20, "shouldFilterString:coalescable:", v15, &v65) & 1) == 0)
        {
          v42 = [STKUSSDAlertSession alloc];
          -[STKAlertSessionManager log](self, "log");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[STKUSSDAlertSession initWithLogger:responseProvider:event:options:sound:](v42, "initWithLogger:responseProvider:event:options:sound:", v43, v8, 2, v9, 0);

          if (v65)
          {
            -[STKAlertSessionManager log](self, "log");
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v67 = v21;
              _os_log_impl(&dword_216439000, v44, OS_LOG_TYPE_DEFAULT, "Session <%p> - String should coalesce.", buf, 0xCu);
            }

            p_coalescingUSSDSession = (id *)&self->_coalescingUSSDSession;
            if (self->_coalescingUSSDSession)
            {
              -[NSMutableArray addObject:](self->_finishedUSSDSessions, "addObject:");
              v46 = *p_coalescingUSSDSession;
              v63[0] = MEMORY[0x24BDAC760];
              v63[1] = 3221225472;
              v63[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_28;
              v63[3] = &unk_24D5631B0;
              v63[4] = self;
              v64 = v21;
              objc_msgSend(v46, "performUSSDUpdate:", v63);
              objc_msgSend(*p_coalescingUSSDSession, "invalidate");

            }
            objc_storeStrong((id *)&self->_coalescingUSSDSession, v21);
          }
          else
          {
            -[NSMutableArray addObject:](self->_activeUSSDSessions, "addObject:", v21);
          }
          -[STKAlertSessionManager enqueuePresentationForSession:completion:](self, "enqueuePresentationForSession:completion:", v21, &__block_literal_global_31);
        }
        else
        {
          v21 = 0;
        }
      }
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_2;
      v60[3] = &unk_24D5631F8;
      v10 = v15;
      v61 = v10;
      v62 = v51;
      -[STKUSSDAlertSession performUSSDUpdate:](v21, "performUSSDUpdate:", v60);
      -[STKUSSDAlertSession setHasReceivedContent:](v21, "setHasReceivedContent:", 1);
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC3120]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "BOOLValue");

      if ((v48 & 1) == 0)
      {
        +[STKSoundFactory soundForSystemSoundID:duration:](STKSoundFactory, "soundForSystemSoundID:duration:", 1050, 0.0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[STKAlertSession setSound:](v21, "setSound:", v49);
        objc_msgSend(v49, "playSound");

      }
      goto LABEL_63;
    case 3:
      v26 = 56;
      -[NSMutableArray lastObject](self->_activeUSSDSessions, "lastObject");
      v10 = objc_claimAutoreleasedReturnValue();
      -[STKAlertSessionManager log](self, "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v67 = (STKUSSDAlertSession *)v10;
        _os_log_impl(&dword_216439000, v27, OS_LOG_TYPE_DEFAULT, "Session <%p> - End Event", buf, 0xCu);
      }

      if (!v10)
        goto LABEL_63;
      if ((-[NSObject hasReceivedContent](v10, "hasReceivedContent") & 1) == 0)
        goto LABEL_42;
      -[NSMutableArray addObject:](self->_finishedUSSDSessions, "addObject:", v10);
      goto LABEL_43;
    case 4:
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC3108]);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC30F8]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "integerValue");

      -[NSMutableArray lastObject](self->_activeUSSDSessions, "lastObject");
      v30 = (STKUSSDAlertSession *)objc_claimAutoreleasedReturnValue();
      -[STKAlertSessionManager log](self, "log");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v67 = v30;
        v68 = 1024;
        v69 = v29;
        v70 = 2112;
        v71 = v10;
        _os_log_impl(&dword_216439000, v31, OS_LOG_TYPE_DEFAULT, "Session <%p> - Error Event, errorCode: %d, error: %@", buf, 0x1Cu);
      }

      if (!v30)
        goto LABEL_36;
      -[NSMutableArray addObject:](self->_finishedUSSDSessions, "addObject:", v30);
      -[NSMutableArray removeObject:](self->_activeUSSDSessions, "removeObject:", v30);
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_33;
      v57[3] = &unk_24D563220;
      v59 = v29;
      v58 = v10;
      -[STKUSSDAlertSession performUSSDUpdate:](v30, "performUSSDUpdate:", v57);
      -[STKUSSDAlertSession setHasReceivedContent:](v30, "setHasReceivedContent:", 1);
      v32 = v58;
      goto LABEL_35;
    case 5:
      -[NSMutableArray lastObject](self->_activeUSSDSessions, "lastObject");
      v10 = objc_claimAutoreleasedReturnValue();
      -[STKAlertSessionManager log](self, "log");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v67 = (STKUSSDAlertSession *)v10;
        _os_log_impl(&dword_216439000, v33, OS_LOG_TYPE_DEFAULT, "Session <%p> - Terminated Event", buf, 0xCu);
      }

      if (v10)
      {
        -[NSMutableArray addObject:](self->_finishedUSSDSessions, "addObject:", v10);
        -[NSMutableArray removeLastObject](self->_activeUSSDSessions, "removeLastObject");
        -[NSObject performUSSDUpdate:](v10, "performUSSDUpdate:", &__block_literal_global_35);
      }
      goto LABEL_63;
    case 6:
      -[STKAlertSessionManager log](self, "log");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216439000, v34, OS_LOG_TYPE_DEFAULT, "Supplementary Services Begin", buf, 2u);
      }

      v35 = [STKUSSDAlertSession alloc];
      -[STKAlertSessionManager log](self, "log");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[STKUSSDAlertSession initWithLogger:responseProvider:event:options:sound:](v35, "initWithLogger:responseProvider:event:options:sound:", v36, v8, 6, v9, 0);

      -[NSMutableArray addObject:](self->_activeSupplementaryServicesSessions, "addObject:", v10);
      v14 = &__block_literal_global_37;
LABEL_26:
      -[STKAlertSessionManager enqueuePresentationForSession:completion:](self, "enqueuePresentationForSession:completion:", v10, v14);
      goto LABEL_63;
    case 7:
      -[NSMutableArray lastObject](self->_activeSupplementaryServicesSessions, "lastObject");
      v10 = objc_claimAutoreleasedReturnValue();
      -[STKAlertSessionManager log](self, "log");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v67 = (STKUSSDAlertSession *)v10;
        _os_log_impl(&dword_216439000, v37, OS_LOG_TYPE_DEFAULT, "Session <%p> - Supplementary Services Event", buf, 0xCu);
      }

      if (v10)
      {
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_38;
        v55[3] = &unk_24D5632A8;
        v56 = v9;
        -[NSObject performUSSDUpdate:](v10, "performUSSDUpdate:", v55);
        -[NSObject setHasReceivedContent:](v10, "setHasReceivedContent:", 1);

      }
      goto LABEL_63;
    case 8:
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC3108]);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC30F8]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "integerValue");

      -[NSMutableArray lastObject](self->_activeSupplementaryServicesSessions, "lastObject");
      v30 = (STKUSSDAlertSession *)objc_claimAutoreleasedReturnValue();
      -[STKAlertSessionManager log](self, "log");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v67 = v30;
        v68 = 1024;
        v69 = v39;
        v70 = 2112;
        v71 = v10;
        _os_log_impl(&dword_216439000, v40, OS_LOG_TYPE_DEFAULT, "Session <%p> - Supplementary Services Error, errorCode: %d, error: %@", buf, 0x1Cu);
      }

      if (!v30)
        goto LABEL_36;
      -[NSMutableArray addObject:](self->_finishedSupplementaryServicesSessions, "addObject:", v30);
      -[NSMutableArray removeLastObject](self->_activeSupplementaryServicesSessions, "removeLastObject");
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_39;
      v52[3] = &unk_24D563220;
      v54 = v39;
      v53 = v10;
      -[STKUSSDAlertSession performUSSDUpdate:](v30, "performUSSDUpdate:", v52);
      -[STKUSSDAlertSession setHasReceivedContent:](v30, "setHasReceivedContent:", 1);
      v32 = v53;
LABEL_35:

LABEL_36:
      goto LABEL_63;
    case 9:
      v26 = 80;
      -[NSMutableArray lastObject](self->_activeSupplementaryServicesSessions, "lastObject");
      v10 = objc_claimAutoreleasedReturnValue();
      -[STKAlertSessionManager log](self, "log");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v67 = (STKUSSDAlertSession *)v10;
        _os_log_impl(&dword_216439000, v41, OS_LOG_TYPE_DEFAULT, "Session <%p> - Supplementary Services End", buf, 0xCu);
      }

      if (!v10)
        goto LABEL_63;
      if ((-[NSObject hasReceivedContent](v10, "hasReceivedContent") & 1) != 0)
      {
        -[NSMutableArray addObject:](self->_finishedSupplementaryServicesSessions, "addObject:", v10);
        -[NSObject performUSSDUpdate:](v10, "performUSSDUpdate:", &__block_literal_global_41);
      }
      else
      {
LABEL_42:
        -[NSObject invalidate](v10, "invalidate");
      }
LABEL_43:
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v26), "removeLastObject");
LABEL_63:

LABEL_64:
      return;
    default:
      goto LABEL_64;
  }
}

void __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_216439000, v5, OS_LOG_TYPE_DEFAULT, "Session <%p> - Dismissing prior coalesced session.", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v4, "dismissCoalescingSession");
}

void __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "sessionDidReceiveString:", v3);
  objc_msgSend(v4, "sessionWantsResponse:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_33(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sessionDidReceiveErrorCode:string:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_34(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sessionDidTerminate");
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_38(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sessionDidReceiveSupplementaryServicesEvent:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_39(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sessionDidReceiveErrorCode:string:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__STKUSSDAlertSessionManager__queue_handleUSSDEvent_responder_userInfo___block_invoke_40(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sessionDidReceiveString:", 0);
}

- (id)_supplementaryServicesResponder
{
  _STKUSSDResponseProvider *v3;
  OS_dispatch_queue *queue;
  CoreTelephonyClient *telephonyClient;
  void *v6;
  _STKUSSDResponseProvider *v7;

  v3 = [_STKUSSDResponseProvider alloc];
  queue = self->_queue;
  telephonyClient = self->_telephonyClient;
  -[STKAlertSessionManager log](self, "log");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_STKUSSDResponseProvider initWithQueue:telephonyClient:options:logger:](v3, "initWithQueue:telephonyClient:options:logger:", queue, telephonyClient, MEMORY[0x24BDBD1B8], v6);

  return v7;
}

- (void)_queue_startListening
{
  __CTServerConnection *v3;
  CoreTelephonyClient *telephonyClient;

  BSDispatchQueueAssert();
  if (!self->_serverConnection)
  {
    v3 = (__CTServerConnection *)_CTServerConnectionCreate();
    self->_serverConnection = v3;
    if (v3)
    {
      _CTServerConnectionSetTargetQueue();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
    }
  }
  telephonyClient = self->_telephonyClient;
  if (telephonyClient)
    -[CoreTelephonyClient setDelegate:](telephonyClient, "setDelegate:", self);
}

- (STKCarrierSubscriptionMonitor)subscriptionMonitor
{
  return self->_subscriptionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_finishedSupplementaryServicesSessions, 0);
  objc_storeStrong((id *)&self->_activeSupplementaryServicesSessions, 0);
  objc_storeStrong((id *)&self->_coalescingUSSDSession, 0);
  objc_storeStrong((id *)&self->_finishedUSSDSessions, 0);
  objc_storeStrong((id *)&self->_activeUSSDSessions, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

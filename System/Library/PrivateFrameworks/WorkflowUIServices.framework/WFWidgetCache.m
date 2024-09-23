@implementation WFWidgetCache

- (id)widgetWorkflowWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v12;
  _QWORD block[5];
  id v14;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[WFWidgetCache log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_20CE0F000, v6, OS_LOG_TYPE_DEFAULT, "Requesting widget workflow for identifier: %@", (uint8_t *)&buf, 0xCu);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWidgetCache.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[WFWidgetCache queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  -[WFWidgetCache queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WFWidgetCache_widgetWorkflowWithIdentifier___block_invoke;
  block[3] = &unk_24C5ABA68;
  block[4] = self;
  v14 = v5;
  p_buf = &buf;
  v9 = v5;
  dispatch_sync(v8, block);

  v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (id)widgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v14;
  _QWORD block[5];
  id v16;
  _BYTE *v17;
  unint64_t v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[WFWidgetCache log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    _os_log_impl(&dword_20CE0F000, v8, OS_LOG_TYPE_DEFAULT, "Requesting widget workflow collection for identifier: %@, limit: %lu", buf, 0x16u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWidgetCache.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[WFWidgetCache queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v9);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[WFWidgetCache queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WFWidgetCache_widgetWorkflowsInCollectionWithIdentifier_limit___block_invoke;
  block[3] = &unk_24C5ABA90;
  block[4] = self;
  v16 = v7;
  v17 = buf;
  v18 = a4;
  v11 = v7;
  dispatch_sync(v10, block);

  v12 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v12;
}

- (void)queue_getWidgetWorkflowWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFWidgetCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFWidgetCache log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_20CE0F000, v6, OS_LOG_TYPE_DEFAULT, "Requesting widget workflow with identifier: %@", buf, 0xCu);
  }

  -[WFWidgetCache requestQueue](self, "requestQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__WFWidgetCache_queue_getWidgetWorkflowWithIdentifier___block_invoke;
  v9[3] = &unk_24C5ABAE0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "getWidgetWorkflowWithIdentifier:completionHandler:", v8, v9);

}

- (void)queue_getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WFWidgetCache queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[WFWidgetCache log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_20CE0F000, v8, OS_LOG_TYPE_DEFAULT, "Requesting widget workflow collection with identifier: %@", buf, 0xCu);
  }

  -[WFWidgetCache requestQueue](self, "requestQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__WFWidgetCache_queue_getWidgetWorkflowsInCollectionWithIdentifier_limit___block_invoke;
  v11[3] = &unk_24C5ABB30;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v10 = v6;
  objc_msgSend(v9, "getWidgetWorkflowsInCollectionWithIdentifier:limit:completionHandler:", v10, a4, v11);

}

- (void)queue_storeAndNotifyWithResult:(id)a3 forIdentifier:(id)a4 resultsLimit:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  char isKindOfClass;
  void *v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[WFWidgetCache queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (!v8 || !v9)
    goto LABEL_42;
  v11 = v8;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  v15 = v11;
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();
  if ((v16 & 1) != 0)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v15, "addResultObserver:", self);
    -[WFWidgetCache resultsByIdentifier](self, "resultsByIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v15, v9);

    -[WFWidgetCache log](self, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 138412546;
      v36 = v15;
      v37 = 2112;
      v38 = v9;
      _os_log_impl(&dword_20CE0F000, v20, OS_LOG_TYPE_DEFAULT, "Storing single object result: %@ for identifier: %@", (uint8_t *)&v35, 0x16u);
    }
    goto LABEL_35;
  }
  if ((v16 & 1) != 0)
  {
    -[WFWidgetCache resultsByIdentifier](self, "resultsByIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v20 = v23;

    -[NSObject query](v20, "query");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
    }
    else
    {
      v25 = 0;
    }
    v26 = v25;

    -[WFWidgetCache log](self, "log");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v20 && v26)
    {
      if (v28)
      {
        v35 = 138412290;
        v36 = v9;
        _os_log_impl(&dword_20CE0F000, v27, OS_LOG_TYPE_DEFAULT, "Cached result found for collection with identifier: %@", (uint8_t *)&v35, 0xCu);
      }

      if (objc_msgSend(v26, "resultsLimit") >= a5)
        goto LABEL_34;
      -[WFWidgetCache log](self, "log");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 138412546;
        v36 = v15;
        v37 = 2112;
        v38 = v9;
        _os_log_impl(&dword_20CE0F000, v29, OS_LOG_TYPE_DEFAULT, "New results limit is more than cached results limit, removing old cached result and storing the new one: %@, identifier: %@", (uint8_t *)&v35, 0x16u);
      }

      -[NSObject removeResultObserver:](v20, "removeResultObserver:", self);
      -[WFWidgetCache resultsByIdentifier](self, "resultsByIdentifier");
      v27 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v27, "removeObjectForKey:", v9);
    }
    else if (v28)
    {
      v35 = 138412546;
      v36 = v15;
      v37 = 2112;
      v38 = v9;
      _os_log_impl(&dword_20CE0F000, v27, OS_LOG_TYPE_DEFAULT, "No cache hit, storing collection result: %@ for identifier: %@", (uint8_t *)&v35, 0x16u);
    }

    objc_msgSend(v15, "addResultObserver:", self);
    -[WFWidgetCache resultsByIdentifier](self, "resultsByIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v15, v9);

LABEL_34:
LABEL_35:

  }
  -[WFWidgetCache resultsByIdentifier](self, "resultsByIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
  }
  else
  {
    v33 = 0;
  }
  v34 = v33;

  -[WFWidgetCache queue_notifyObserversOfChange:forIdentifier:](self, "queue_notifyObserversOfChange:forIdentifier:", v34, v9);
LABEL_42:

}

- (void)queue_notifyObserversOfChange:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFWidgetCache queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = v6;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v12 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v11)
    {
      objc_msgSend(v11, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v14, "values");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
LABEL_12:
  -[WFWidgetCache log](self, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_20CE0F000, v17, OS_LOG_TYPE_DEFAULT, "Posting notification with workflows: %@ for identifier: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("WFWidgetCacheAssociatedIdentifier");
  v21 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("WFWidgetCacheUpdateNotification"), v16, v19);

}

- (void)observableResultDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WFWidgetCache *v9;

  v4 = a3;
  -[WFWidgetCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__WFWidgetCache_observableResultDidChange___block_invoke;
  v7[3] = &unk_24C5ABBB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (WFWidgetCache)init
{
  WFWidgetCache *v2;
  uint64_t v3;
  NSMutableDictionary *resultsByIdentifier;
  WFWidgetWorkflowRequestQueue *v5;
  WFWidgetWorkflowRequestQueue *requestQueue;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  os_log_t v11;
  OS_os_log *log;
  WFWidgetCache *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WFWidgetCache;
  v2 = -[WFWidgetCache init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    resultsByIdentifier = v2->_resultsByIdentifier;
    v2->_resultsByIdentifier = (NSMutableDictionary *)v3;

    v5 = objc_alloc_init(WFWidgetWorkflowRequestQueue);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.shortcuts.widget", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = os_log_create("com.apple.shortcuts", "WidgetCache");
    log = v2->_log;
    v2->_log = (OS_os_log *)v11;

    v13 = v2;
  }

  return v2;
}

- (NSMutableDictionary)resultsByIdentifier
{
  return self->_resultsByIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFWidgetWorkflowRequestQueue)requestQueue
{
  return self->_requestQueue;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_resultsByIdentifier, 0);
}

void __43__WFWidgetCache_observableResultDidChange___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  v5 = *(id *)(a1 + 32);
  if (!v5)
  {
    if (!v4)
      goto LABEL_20;
    v8 = 0;
LABEL_18:
    objc_msgSend(v4, "value");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = 1;
    v6 = v8;
LABEL_19:

    goto LABEL_21;
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v4)
    goto LABEL_18;
  if (v8)
  {
    objc_msgSend(v8, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    objc_msgSend(v11, "folderIdentifier");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "resultsLimit");
    if (v11)
    {
      objc_msgSend(v11, "folderIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v16 = CFSTR("MyShortcuts");

        v12 = CFSTR("MyShortcuts");
      }
    }
    goto LABEL_19;
  }
LABEL_20:
  v6 = 0;
  v13 = 0;
  v12 = 0;
LABEL_21:
  objc_msgSend(*(id *)(a1 + 40), "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v12;
    _os_log_impl(&dword_20CE0F000, v14, OS_LOG_TYPE_DEFAULT, "Received observable result change for identifier: %@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue_storeAndNotifyWithResult:forIdentifier:resultsLimit:", *(_QWORD *)(a1 + 32), v12, v13);
}

void __74__WFWidgetCache_queue_getWidgetWorkflowsInCollectionWithIdentifier_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_20CE0F000, v4, OS_LOG_TYPE_DEFAULT, "Received result %@ for identifier: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__WFWidgetCache_queue_getWidgetWorkflowsInCollectionWithIdentifier_limit___block_invoke_47;
  v11[3] = &unk_24C5ABB08;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  v13 = v8;
  v14 = v9;
  v10 = v3;
  dispatch_async(v6, v11);

}

uint64_t __74__WFWidgetCache_queue_getWidgetWorkflowsInCollectionWithIdentifier_limit___block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_storeAndNotifyWithResult:forIdentifier:resultsLimit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __55__WFWidgetCache_queue_getWidgetWorkflowWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_20CE0F000, v4, OS_LOG_TYPE_DEFAULT, "Received result %@ for identifier: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WFWidgetCache_queue_getWidgetWorkflowWithIdentifier___block_invoke_45;
  block[3] = &unk_24C5ABAB8;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  dispatch_async(v6, block);

}

uint64_t __55__WFWidgetCache_queue_getWidgetWorkflowWithIdentifier___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_storeAndNotifyWithResult:forIdentifier:resultsLimit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

void __65__WFWidgetCache_widgetWorkflowsInCollectionWithIdentifier_limit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "resultsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v5, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && v8)
  {
    v11 = objc_msgSend(v8, "resultsLimit");
    v12 = *(_QWORD *)(a1 + 56);

    if (v11 >= v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 40);
        v20 = 138412290;
        v21 = v14;
        _os_log_impl(&dword_20CE0F000, v13, OS_LOG_TYPE_DEFAULT, "Found cached widget workflow collection for id: %@", (uint8_t *)&v20, 0xCu);
      }

      objc_msgSend(v5, "values");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      goto LABEL_21;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 40);
    v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_20CE0F000, v18, OS_LOG_TYPE_DEFAULT, "No cached widget workflow collection for %@ found, kicking off a request", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue_getWidgetWorkflowsInCollectionWithIdentifier:limit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
LABEL_21:

}

void __46__WFWidgetCache_widgetWorkflowWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "resultsByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_20CE0F000, v4, OS_LOG_TYPE_DEFAULT, "Found cached widget workflow for id: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(v3, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {

    objc_msgSend(*(id *)(a1 + 32), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20CE0F000, v9, OS_LOG_TYPE_DEFAULT, "No cached widget workflow for %@ found, kicking off a request", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue_getWidgetWorkflowWithIdentifier:", *(_QWORD *)(a1 + 40));
  }
}

+ (WFWidgetCache)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_2620);
  return (WFWidgetCache *)(id)sharedCache_cache;
}

void __28__WFWidgetCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = v0;

}

@end

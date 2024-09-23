@implementation WFTriggerNotificationDebouncer

- (WFTriggerNotificationDebouncer)init
{
  WFTriggerNotificationDebouncer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *notificationItemTable;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  WFTriggerNotificationDebouncer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFTriggerNotificationDebouncer;
  v2 = -[WFTriggerNotificationDebouncer init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notificationItemTable = v2->_notificationItemTable;
    v2->_notificationItemTable = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.shortcuts.WFTriggerNotificationDebouncer", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)addEventsWithIdentifiers:(id)a3 configuredTrigger:(id)a4 workflowReference:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  WFTriggerNotificationDebouncer *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFTriggerNotificationDebouncer queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__WFTriggerNotificationDebouncer_addEventsWithIdentifiers_configuredTrigger_workflowReference___block_invoke;
  v15[3] = &unk_1E7AA5E20;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)debouncerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFTriggerNotificationDebouncer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "userInfo");
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

  -[WFTriggerNotificationDebouncer notificationItemTable](self, "notificationItemTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  getWFTriggersLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315394;
      v19 = "-[WFTriggerNotificationDebouncer debouncerDidFire:]";
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEBUG, "%s Debouncer fired with notification item: %{public}@", (uint8_t *)&v18, 0x16u);
    }

    -[WFTriggerNotificationDebouncer delegate](self, "delegate");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuredTrigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "triggerEventIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationForTrigger:workflowReference:pendingTriggerEventIDs:](v12, "postNotificationForTrigger:workflowReference:pendingTriggerEventIDs:", v13, v14, v16);

  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v18 = 136315394;
    v19 = "-[WFTriggerNotificationDebouncer debouncerDidFire:]";
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_FAULT, "%s No WFTriggerNotificationDebouncerItem item found for trigger identifier: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  -[WFTriggerNotificationDebouncer notificationItemTable](self, "notificationItemTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectForKey:", v8);

}

- (WFTriggerNotificationDebouncerDelegate)delegate
{
  return (WFTriggerNotificationDebouncerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)notificationItemTable
{
  return self->_notificationItemTable;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationItemTable, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __95__WFTriggerNotificationDebouncer_addEventsWithIdentifiers_configuredTrigger_workflowReference___block_invoke(uint64_t a1)
{
  NSObject *v2;
  WFTriggerNotificationDebouncerItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFTriggerNotificationDebouncerItem *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  WFTriggerNotificationDebouncerItem *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  WFTriggerNotificationDebouncerItem *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(WFTriggerNotificationDebouncerItem **)(a1 + 32);
    v20 = 136315394;
    v21 = "-[WFTriggerNotificationDebouncer addEventsWithIdentifiers:configuredTrigger:workflowReference:]_block_invoke";
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEBUG, "%s Adding eventIDs: %@", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "notificationItemTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "triggerEventIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [WFTriggerNotificationDebouncerItem alloc];
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "debouncer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFTriggerNotificationDebouncerItem initWithConfiguredTrigger:reference:triggerEventIDs:debouncer:](v9, "initWithConfiguredTrigger:reference:triggerEventIDs:debouncer:", v10, v11, v8, v12);

  }
  else
  {
    getWFTriggersLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = 136315138;
      v21 = "-[WFTriggerNotificationDebouncer addEventsWithIdentifiers:configuredTrigger:workflowReference:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEBUG, "%s Creating a new notification item and debouncer, because none were found", (uint8_t *)&v20, 0xCu);
    }

    v15 = objc_alloc(MEMORY[0x1E0DD9D10]);
    objc_msgSend(*(id *)(a1 + 48), "queue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v15, "initWithDelay:maximumDelay:queue:userInfo:unboundedFiringReasons:", v16, v4, 0, 4.0, 0.0);

    objc_msgSend(v8, "addTarget:action:", *(_QWORD *)(a1 + 48), sel_debouncerDidFire_);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFTriggerNotificationDebouncerItem initWithConfiguredTrigger:reference:triggerEventIDs:debouncer:]([WFTriggerNotificationDebouncerItem alloc], "initWithConfiguredTrigger:reference:triggerEventIDs:debouncer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v12, v8);
  }

  getWFTriggersLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v20 = 136315394;
    v21 = "-[WFTriggerNotificationDebouncer addEventsWithIdentifiers:configuredTrigger:workflowReference:]_block_invoke";
    v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_DEBUG, "%s Poking debouncer with notification item: %{public}@", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "notificationItemTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v13, v4);

  -[WFTriggerNotificationDebouncerItem debouncer](v13, "debouncer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "poke");

}

@end

@implementation WGDataSourceManager

+ (id)__sharedInstance
{
  if (__sharedInstance_onceToken != -1)
    dispatch_once(&__sharedInstance_onceToken, &__block_literal_global_5);
  return (id)__sharedInstance___sharedInstance;
}

void __39__WGDataSourceManager___sharedInstance__block_invoke()
{
  WGDataSourceManager *v0;
  void *v1;

  v0 = objc_alloc_init(WGDataSourceManager);
  v1 = (void *)__sharedInstance___sharedInstance;
  __sharedInstance___sharedInstance = (uint64_t)v0;

}

+ (void)requestSharedDataSourceManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "__sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__WGDataSourceManager_requestSharedDataSourceManager___block_invoke;
    v7[3] = &unk_24D731BC0;
    v8 = v5;
    v9 = v4;
    v6 = v5;
    objc_msgSend(v6, "_begin:", v7);

  }
}

uint64_t __54__WGDataSourceManager_requestSharedDataSourceManager___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_begin:(id)a3
{
  id v4;
  void *v5;
  WGWidgetDataSourceManager *v6;
  WGWidgetDataSourceManager *widgetDataSourceManager;
  dispatch_group_t v8;
  uint64_t v9;
  NSObject *v10;
  void (**v11)(_QWORD, _QWORD);
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  dispatch_group_t v15;

  v4 = a3;
  v5 = v4;
  if (self->_didBegin)
  {
    if (v4)
      (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    self->_didBegin = 1;
    v6 = objc_alloc_init(WGWidgetDataSourceManager);
    widgetDataSourceManager = self->_widgetDataSourceManager;
    self->_widgetDataSourceManager = v6;

    -[WGWidgetDataSourceManager setParentDataSourceManager:](self->_widgetDataSourceManager, "setParentDataSourceManager:", self);
    v8 = dispatch_group_create();
    v9 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __30__WGDataSourceManager__begin___block_invoke;
    v14[3] = &unk_24D732110;
    v15 = v8;
    v10 = v8;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A0A970](v14);
    ((void (**)(_QWORD, WGWidgetDataSourceManager *))v11)[2](v11, self->_widgetDataSourceManager);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __30__WGDataSourceManager__begin___block_invoke_3;
    v12[3] = &unk_24D7318B8;
    v13 = v5;
    dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], v12);

  }
}

void __30__WGDataSourceManager__begin___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__WGDataSourceManager__begin___block_invoke_2;
  v5[3] = &unk_24D7314D8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "_start:", v5);

}

void __30__WGDataSourceManager__begin___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __30__WGDataSourceManager__begin___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_start:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)_stop:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)addWidgetDataSourceChangeHandler:(id)a3 forIdentifier:(id)a4
{
  NSMutableDictionary *identifiersToWidgetChangeHandlers;
  id v7;
  id v8;
  void *v9;
  id v10;

  if (a3)
  {
    if (a4)
    {
      identifiersToWidgetChangeHandlers = self->_identifiersToWidgetChangeHandlers;
      v7 = a4;
      v8 = a3;
      v9 = (void *)objc_msgSend(v8, "copy");
      -[NSMutableDictionary setObject:forKey:](identifiersToWidgetChangeHandlers, "setObject:forKey:", v9, v7);

      -[WGWidgetDataSourceManager dataSources](self->_widgetDataSourceManager, "dataSources");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))v8 + 2))(v8, v10);

    }
  }
}

- (void)removeChangeHandlersWithIdentifier:(id)a3
{
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToWidgetChangeHandlers, "removeObjectForKey:");
}

- (id)discoverAvailableWidgetsWithError:(id *)a3
{
  return +[WGWidgetDataSourceManager discoverAvailableWidgetsWithError:](WGWidgetDataSourceManager, "discoverAvailableWidgetsWithError:", a3);
}

- (void)childDataSourceManagerDataSourcesDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_widgetDataSourceManager == a3)
  {
    objc_msgSend(a3, "dataSources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_identifiersToWidgetChangeHandlers, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetDataSourceManager, 0);
  objc_storeStrong((id *)&self->_identifiersToWidgetChangeHandlers, 0);
}

@end

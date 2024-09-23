@implementation STUIStatusBarDataBroadcaster

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__STUIStatusBarDataBroadcaster_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_43 != -1)
    dispatch_once(&_MergedGlobals_43, block);
  return (id)qword_1EDBEDF80;
}

- (STStatusBarData)currentData
{
  STStatusBarData *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = self->_broadcastData;
  -[STStatusBarOverridesStatusDomain data](self->_overridesDomain, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "isEmpty") & 1) == 0)
  {
    v6 = -[STStatusBarData mutableCopy](v3, "mutableCopy");
    objc_msgSend(v6, "applyUpdate:", v5);
    objc_msgSend(v6, "immutableCopy");
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (STStatusBarData *)v7;
  }

  return v3;
}

- (void)registerListener:(id)a3
{
  -[NSHashTable addObject:](self->_dataListeners, "addObject:", a3);
}

void __46__STUIStatusBarDataBroadcaster_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_1EDBEDF80;
  qword_1EDBEDF80 = v1;

}

- (id)_init
{
  STUIStatusBarDataBroadcaster *v2;
  uint64_t v3;
  NSHashTable *dataListeners;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  STStatusBarOverridesStatusDomain *overridesDomain;
  STStatusBarOverridesStatusDomain *v10;
  uint64_t v11;
  STUIStatusBarDataBroadcaster *v12;
  void *v13;
  STStatusBarOverridesStatusDomain *v14;
  id v15;
  STStatusBarData *v16;
  STStatusBarData *broadcastData;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  STUIStatusBarDataBroadcaster *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)STUIStatusBarDataBroadcaster;
  v2 = -[STUIStatusBarDataBroadcaster init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    dataListeners = v2->_dataListeners;
    v2->_dataListeners = (NSHashTable *)v3;

    v5 = (id *)MEMORY[0x1E0DC4730];
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "_isSpringBoard")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0DB0A18]);
      objc_msgSend(*v5, "systemStatusServer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithServerHandle:", v7);
      overridesDomain = v2->_overridesDomain;
      v2->_overridesDomain = (STStatusBarOverridesStatusDomain *)v8;

    }
    else
    {
      v10 = (STStatusBarOverridesStatusDomain *)objc_alloc_init(MEMORY[0x1E0DB0A18]);
      v7 = v2->_overridesDomain;
      v2->_overridesDomain = v10;
    }

    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__STUIStatusBarDataBroadcaster__init__block_invoke;
    aBlock[3] = &unk_1E8D62A38;
    v12 = v2;
    v22 = v12;
    v13 = _Block_copy(aBlock);
    v14 = v12->_overridesDomain;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __37__STUIStatusBarDataBroadcaster__init__block_invoke_2;
    v19[3] = &unk_1E8D63AF0;
    v20 = v13;
    v15 = v13;
    -[STStatusBarOverridesStatusDomain observeDataWithBlock:](v14, "observeDataWithBlock:", v19);
    v16 = (STStatusBarData *)objc_alloc_init(MEMORY[0x1E0DB0970]);
    broadcastData = v12->_broadcastData;
    v12->_broadcastData = v16;

  }
  return v2;
}

void __37__STUIStatusBarDataBroadcaster__init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateForDataChange:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __37__STUIStatusBarDataBroadcaster__init__block_invoke_2(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[STStatusBarOverridesStatusDomain invalidate](self->_overridesDomain, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarDataBroadcaster;
  -[STUIStatusBarDataBroadcaster dealloc](&v3, sel_dealloc);
}

- (void)unregisterListener:(id)a3
{
  -[NSHashTable removeObject:](self->_dataListeners, "removeObject:", a3);
}

- (void)updateWithData:(id)a3
{
  void *v4;
  STStatusBarData *v5;
  STStatusBarData *broadcastData;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  (*((void (**)(id, STStatusBarData *))a3 + 2))(a3, self->_broadcastData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", self->_broadcastData) & 1) == 0)
  {
    objc_msgSend(v4, "immutableCopy");
    v5 = (STStatusBarData *)objc_claimAutoreleasedReturnValue();
    broadcastData = self->_broadcastData;
    self->_broadcastData = v5;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_dataListeners, "allObjects", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "updateForDataChange:", self);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastData, 0);
  objc_storeStrong((id *)&self->_overridesDomain, 0);
  objc_storeStrong((id *)&self->_dataListeners, 0);
}

@end

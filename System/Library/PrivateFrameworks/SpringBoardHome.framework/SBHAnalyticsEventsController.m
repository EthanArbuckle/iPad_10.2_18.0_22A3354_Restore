@implementation SBHAnalyticsEventsController

- (SBHAnalyticsEventsController)initWithEventsControllerDomain:(id)a3
{
  id v5;
  SBHAnalyticsEventsController *v6;
  SBHAnalyticsEventsController *v7;
  uint64_t v8;
  NSHashTable *allProviders;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHAnalyticsEventsController;
  v6 = -[SBHAnalyticsEventsController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventsControllerDomain, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    allProviders = v7->_allProviders;
    v7->_allProviders = (NSHashTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_sendEventsForProvidersWhenSignificantTimeChanged, *MEMORY[0x1E0DC4838], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBHAnalyticsEventsController allProviders](self, "allProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v5.receiver = self;
  v5.super_class = (Class)SBHAnalyticsEventsController;
  -[SBHAnalyticsEventsController dealloc](&v5, sel_dealloc);
}

- (void)addProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHAnalyticsEventsController allProviders](self, "allProviders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHAnalyticsEventsController allProviders](self, "allProviders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)sendEventsForProvidersWhenSignificantTimeChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SBHAnalyticsEventsController_sendEventsForProvidersWhenSignificantTimeChanged__block_invoke;
  block[3] = &unk_1E8D84C50;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __80__SBHAnalyticsEventsController_sendEventsForProvidersWhenSignificantTimeChanged__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allProviders", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "significantTimeChanged");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (NSString)eventsControllerDomain
{
  return self->_eventsControllerDomain;
}

- (NSHashTable)allProviders
{
  return self->_allProviders;
}

- (void)setAllProviders:(id)a3
{
  objc_storeStrong((id *)&self->_allProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allProviders, 0);
  objc_storeStrong((id *)&self->_eventsControllerDomain, 0);
}

@end

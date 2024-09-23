@implementation PXContentSyndicationHighlightCenter

- (PXContentSyndicationHighlightCenter)init
{
  PXContentSyndicationHighlightCenter *v2;
  uint64_t v3;
  NSHashTable *observers;
  SLHighlightCenter *v5;
  SLHighlightCenter *socialLayerHighlightCenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXContentSyndicationHighlightCenter;
  v2 = -[PXContentSyndicationHighlightCenter init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    -[PXContentSyndicationHighlightCenter _updateValue](v2, "_updateValue");
    v5 = (SLHighlightCenter *)objc_alloc_init(MEMORY[0x1E0DA8880]);
    socialLayerHighlightCenter = v2->_socialLayerHighlightCenter;
    v2->_socialLayerHighlightCenter = v5;

    -[SLHighlightCenter setDelegate:](v2->_socialLayerHighlightCenter, "setDelegate:", v2);
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  PXContentSyndicationHighlightCenter *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (id)_allObservers
{
  PXContentSyndicationHighlightCenter *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSHashTable allObjects](v2->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateValue
{
  -[PXContentSyndicationHighlightCenter setIsAutomaticSharingEnabled:](self, "setIsAutomaticSharingEnabled:", objc_msgSend(MEMORY[0x1E0DA8880], "isAutomaticSharingEnabled"));
}

- (void)highlightCenterSettingsEnablementHasChanged:(id)a3
{
  _QWORD block[5];

  -[PXContentSyndicationHighlightCenter _updateValue](self, "_updateValue", a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PXContentSyndicationHighlightCenter_highlightCenterSettingsEnablementHasChanged___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)isAutomaticSharingEnabled
{
  return self->_isAutomaticSharingEnabled;
}

- (void)setIsAutomaticSharingEnabled:(BOOL)a3
{
  self->_isAutomaticSharingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialLayerHighlightCenter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __83__PXContentSyndicationHighlightCenter_highlightCenterSettingsEnablementHasChanged___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "_allObservers", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "contentSyndicationHighlightCenterDidChange:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_181405);
  return (id)shared_shared;
}

void __45__PXContentSyndicationHighlightCenter_shared__block_invoke()
{
  PXContentSyndicationHighlightCenter *v0;
  void *v1;

  v0 = objc_alloc_init(PXContentSyndicationHighlightCenter);
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

@end

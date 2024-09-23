@implementation SRUIFCardLoadingMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  return (id)sharedInstance_sCardLoadingMonitor;
}

void __41__SRUIFCardLoadingMonitor_sharedInstance__block_invoke()
{
  SRUIFCardLoadingMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SRUIFCardLoadingMonitor);
  v1 = (void *)sharedInstance_sCardLoadingMonitor;
  sharedInstance_sCardLoadingMonitor = (uint64_t)v0;

}

- (SRUIFCardLoadingMonitor)init
{
  SRUIFCardLoadingMonitor *v2;
  NSMutableArray *v3;
  NSMutableArray *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRUIFCardLoadingMonitor;
  v2 = -[SRUIFCardLoadingMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v2->_observers;
    v2->_observers = v3;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SRUIFCardLoadingMonitor isTrackingObserver:](self, "isTrackingObserver:"))
    -[NSMutableArray addObject:](self->_observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SRUIFCardLoadingMonitor isTrackingObserver:](self, "isTrackingObserver:"))
    -[NSMutableArray removeObject:](self->_observers, "removeObject:", v4);

}

- (BOOL)isTrackingObserver:(id)a3
{
  return -[NSMutableArray containsObject:](self->_observers, "containsObject:", a3);
}

- (void)broadcastCardSnippet:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "cardLoadingMonitor:didReceiveCardSnippet:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)broadcastVisualResponseSnippet:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "cardLoadingMonitor:didReceiveVisualResponseSnippet:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end

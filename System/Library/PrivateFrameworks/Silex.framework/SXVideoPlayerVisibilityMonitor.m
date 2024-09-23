@implementation SXVideoPlayerVisibilityMonitor

- (SXVideoPlayerVisibilityMonitor)initWithVisibilityMonitor:(id)a3
{
  id v5;
  SXVideoPlayerVisibilityMonitor *v6;
  SXVideoPlayerVisibilityMonitor *v7;
  uint64_t v8;
  NSMutableArray *willAppearBlocks;
  uint64_t v10;
  NSMutableArray *didAppearBlocks;
  uint64_t v12;
  NSMutableArray *visiblePercentageBlocks;
  uint64_t v14;
  NSMutableArray *willDisappearBlocks;
  uint64_t v16;
  NSMutableArray *didDisappearBlocks;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SXVideoPlayerVisibilityMonitor;
  v6 = -[SXVideoPlayerVisibilityMonitor init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visibilityMonitor, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    willAppearBlocks = v7->_willAppearBlocks;
    v7->_willAppearBlocks = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    didAppearBlocks = v7->_didAppearBlocks;
    v7->_didAppearBlocks = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    visiblePercentageBlocks = v7->_visiblePercentageBlocks;
    v7->_visiblePercentageBlocks = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    willDisappearBlocks = v7->_willDisappearBlocks;
    v7->_willDisappearBlocks = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    didDisappearBlocks = v7->_didDisappearBlocks;
    v7->_didDisappearBlocks = (NSMutableArray *)v16;

    -[SXVideoPlayerVisibilityMonitor configureVisibilityMonitor:](v7, "configureVisibilityMonitor:", v5);
  }

  return v7;
}

- (void)setVisibilityMonitor:(id)a3
{
  SXVisibilityMonitor *v5;

  v5 = (SXVisibilityMonitor *)a3;
  if (self->_visibilityMonitor != v5)
  {
    objc_storeStrong((id *)&self->_visibilityMonitor, a3);
    -[SXVideoPlayerVisibilityMonitor configureVisibilityMonitor:](self, "configureVisibilityMonitor:", v5);
  }

}

- (void)configureVisibilityMonitor:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke;
  v14[3] = &unk_24D689168;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v4, "onWillAppear:", v14);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_2;
  v12[3] = &unk_24D689168;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "onDidAppear:", v12);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_3;
  v10[3] = &unk_24D689168;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "onWillDisappear:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_4;
  v8[3] = &unk_24D689168;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "onDidDisappear:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_5;
  v6[3] = &unk_24D689190;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "onVisiblePercentageChange:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "willAppearBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = objc_loadWeakRetained(v1);
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didAppearBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = objc_loadWeakRetained(v1);
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "willDisappearBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = objc_loadWeakRetained(v1);
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didDisappearBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = objc_loadWeakRetained(v1);
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

void __61__SXVideoPlayerVisibilityMonitor_configureVisibilityMonitor___block_invoke_5(uint64_t a1, double a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visiblePercentageBlocks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        v12 = objc_loadWeakRetained(v3);
        (*(void (**)(uint64_t, id, double))(v11 + 16))(v11, v12, a2);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (unint64_t)state
{
  void *v2;
  unint64_t v3;

  -[SXVideoPlayerVisibilityMonitor visibilityMonitor](self, "visibilityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (BOOL)appeared
{
  void *v2;
  char v3;

  -[SXVideoPlayerVisibilityMonitor visibilityMonitor](self, "visibilityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appeared");

  return v3;
}

- (id)object
{
  void *v2;
  void *v3;

  -[SXVideoPlayerVisibilityMonitor visibilityMonitor](self, "visibilityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)visiblePercentage
{
  void *v2;
  double v3;
  double v4;

  -[SXVideoPlayerVisibilityMonitor visibilityMonitor](self, "visibilityMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visiblePercentage");
  v4 = v3;

  return v4;
}

- (void)onWillAppear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVideoPlayerVisibilityMonitor willAppearBlocks](self, "willAppearBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)onDidAppear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVideoPlayerVisibilityMonitor didAppearBlocks](self, "didAppearBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)onVisiblePercentageChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVideoPlayerVisibilityMonitor visiblePercentageBlocks](self, "visiblePercentageBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)onWillDisappear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVideoPlayerVisibilityMonitor willDisappearBlocks](self, "willDisappearBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)onDidDisappear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVideoPlayerVisibilityMonitor didDisappearBlocks](self, "didDisappearBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (SXVisibilityMonitor)visibilityMonitor
{
  return self->_visibilityMonitor;
}

- (NSMutableArray)willAppearBlocks
{
  return self->_willAppearBlocks;
}

- (NSMutableArray)didAppearBlocks
{
  return self->_didAppearBlocks;
}

- (NSMutableArray)visiblePercentageBlocks
{
  return self->_visiblePercentageBlocks;
}

- (NSMutableArray)willDisappearBlocks
{
  return self->_willDisappearBlocks;
}

- (NSMutableArray)didDisappearBlocks
{
  return self->_didDisappearBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didDisappearBlocks, 0);
  objc_storeStrong((id *)&self->_willDisappearBlocks, 0);
  objc_storeStrong((id *)&self->_visiblePercentageBlocks, 0);
  objc_storeStrong((id *)&self->_didAppearBlocks, 0);
  objc_storeStrong((id *)&self->_willAppearBlocks, 0);
  objc_storeStrong((id *)&self->_visibilityMonitor, 0);
}

@end

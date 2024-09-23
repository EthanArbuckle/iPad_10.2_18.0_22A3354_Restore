@implementation SBSceneHandleBlockObserver

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_didUpdateClientSettingsBlocks, "allValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_didUpdateSettingsBlocks, "allValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_didUpdateContentStateBlocks, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_createBlocks, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)observeCreate:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *createBlocks;
  _SBSceneHandleObserverToken *v7;
  NSMutableDictionary *v8;
  void *v9;

  v4 = a3;
  if (!self->_createBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    createBlocks = self->_createBlocks;
    self->_createBlocks = v5;

  }
  v7 = -[_SBSceneHandleObserverToken initWithOwner:]([_SBSceneHandleObserverToken alloc], "initWithOwner:", self->_createBlocks);
  v8 = self->_createBlocks;
  v9 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v7);

  return v7;
}

- (id)observeDidUpdateClientSettings:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *didUpdateClientSettingsBlocks;
  _SBSceneHandleObserverToken *v7;
  NSMutableDictionary *v8;
  void *v9;

  v4 = a3;
  if (!self->_didUpdateClientSettingsBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    didUpdateClientSettingsBlocks = self->_didUpdateClientSettingsBlocks;
    self->_didUpdateClientSettingsBlocks = v5;

  }
  v7 = -[_SBSceneHandleObserverToken initWithOwner:]([_SBSceneHandleObserverToken alloc], "initWithOwner:", self->_didUpdateClientSettingsBlocks);
  v8 = self->_didUpdateClientSettingsBlocks;
  v9 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v7);

  return v7;
}

- (id)observeDidUpdateSettings:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *didUpdateSettingsBlocks;
  _SBSceneHandleObserverToken *v7;
  NSMutableDictionary *v8;
  void *v9;

  v4 = a3;
  if (!self->_didUpdateSettingsBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    didUpdateSettingsBlocks = self->_didUpdateSettingsBlocks;
    self->_didUpdateSettingsBlocks = v5;

  }
  v7 = -[_SBSceneHandleObserverToken initWithOwner:]([_SBSceneHandleObserverToken alloc], "initWithOwner:", self->_didUpdateSettingsBlocks);
  v8 = self->_didUpdateSettingsBlocks;
  v9 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v7);

  return v7;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneHandleBlockObserver.m"), 52, CFSTR("Cannot deallocate a SBSceneHandleBlockObserver without invalidating first."));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSceneHandleBlockObserver;
  -[SBSceneHandleBlockObserver dealloc](&v5, sel_dealloc);
}

- (id)observeDestroy:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *destroyBlocks;
  _SBSceneHandleObserverToken *v7;
  NSMutableDictionary *v8;
  void *v9;

  v4 = a3;
  if (!self->_destroyBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    destroyBlocks = self->_destroyBlocks;
    self->_destroyBlocks = v5;

  }
  v7 = -[_SBSceneHandleObserverToken initWithOwner:]([_SBSceneHandleObserverToken alloc], "initWithOwner:", self->_destroyBlocks);
  v8 = self->_destroyBlocks;
  v9 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v7);

  return v7;
}

- (id)observeDidUpdateContentState:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *didUpdateContentStateBlocks;
  _SBSceneHandleObserverToken *v7;
  NSMutableDictionary *v8;
  void *v9;

  v4 = a3;
  if (!self->_didUpdateContentStateBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    didUpdateContentStateBlocks = self->_didUpdateContentStateBlocks;
    self->_didUpdateContentStateBlocks = v5;

  }
  v7 = -[_SBSceneHandleObserverToken initWithOwner:]([_SBSceneHandleObserverToken alloc], "initWithOwner:", self->_didUpdateContentStateBlocks);
  v8 = self->_didUpdateContentStateBlocks;
  v9 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v7);

  return v7;
}

- (id)observeDidUpdatePairingStatusForExternalIdentifiers:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *didUpdatePairingStatusBlocks;
  _SBSceneHandleObserverToken *v7;
  NSMutableDictionary *v8;
  void *v9;

  v4 = a3;
  if (!self->_didUpdatePairingStatusBlocks)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    didUpdatePairingStatusBlocks = self->_didUpdatePairingStatusBlocks;
    self->_didUpdatePairingStatusBlocks = v5;

  }
  v7 = -[_SBSceneHandleObserverToken initWithOwner:]([_SBSceneHandleObserverToken alloc], "initWithOwner:", self->_didUpdatePairingStatusBlocks);
  v8 = self->_didUpdatePairingStatusBlocks;
  v9 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v7);

  return v7;
}

- (void)removeObserverForToken:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "owner");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v3);

  }
}

- (void)invalidate
{
  NSMutableDictionary *createBlocks;
  NSMutableDictionary *destroyBlocks;
  NSMutableDictionary *didUpdateContentStateBlocks;
  NSMutableDictionary *didUpdateSettingsBlocks;
  NSMutableDictionary *didUpdateClientSettingsBlocks;
  NSMutableDictionary *didUpdatePairingStatusBlocks;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    createBlocks = self->_createBlocks;
    self->_createBlocks = 0;

    destroyBlocks = self->_destroyBlocks;
    self->_destroyBlocks = 0;

    didUpdateContentStateBlocks = self->_didUpdateContentStateBlocks;
    self->_didUpdateContentStateBlocks = 0;

    didUpdateSettingsBlocks = self->_didUpdateSettingsBlocks;
    self->_didUpdateSettingsBlocks = 0;

    didUpdateClientSettingsBlocks = self->_didUpdateClientSettingsBlocks;
    self->_didUpdateClientSettingsBlocks = 0;

    didUpdatePairingStatusBlocks = self->_didUpdatePairingStatusBlocks;
    self->_didUpdatePairingStatusBlocks = 0;

  }
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_destroyBlocks, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_didUpdatePairingStatusBlocks, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didUpdatePairingStatusBlocks, 0);
  objc_storeStrong((id *)&self->_didUpdateClientSettingsBlocks, 0);
  objc_storeStrong((id *)&self->_didUpdateSettingsBlocks, 0);
  objc_storeStrong((id *)&self->_didUpdateContentStateBlocks, 0);
  objc_storeStrong((id *)&self->_destroyBlocks, 0);
  objc_storeStrong((id *)&self->_createBlocks, 0);
}

@end

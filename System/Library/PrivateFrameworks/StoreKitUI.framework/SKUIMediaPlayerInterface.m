@implementation SKUIMediaPlayerInterface

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SKUIMediaPlayerInterface_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_sOnce != -1)
    dispatch_once(&sharedInstance_sOnce, block);
  return (id)sharedInstance_smpi;
}

void __42__SKUIMediaPlayerInterface_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_smpi;
  sharedInstance_smpi = (uint64_t)v1;

}

- (SKUIMediaPlayerInterface)init
{
  SKUIMediaPlayerInterface *v3;
  uint64_t v4;
  NSMapTable *players;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *observerQueue;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v25;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaPlayerInterface init].cold.1();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIMediaPlayerInterface;
  v3 = -[SKUIMediaPlayerInterface init](&v25, sel_init);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    players = v3->_players;
    v3->_players = (NSMapTable *)v4;

    v6 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaPlayerInterface", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaPlayerInterface.dispatch", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.StoreKitUI.SKUIMediaPlayerInterface.observers", 0);
    observerQueue = v3->_observerQueue;
    v3->_observerQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)SKUIMediaPlayerFramework();
    v14 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerItemChangedNotification", v13);
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__playerItemDidChangeNotification_, v14, 0);
    v15 = (void *)SKUIMediaPlayerFramework();
    v16 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerItemWillChangeNotification", v15);
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__playerItemWillChangeNotification_, v16, 0);
    v17 = (void *)SKUIMediaPlayerFramework();
    v18 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerItemReadyToPlayNotification", v17);
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__playerItemReady_, v18, 0);
    v19 = (void *)SKUIMediaPlayerFramework();
    v20 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerRateDidChangeNotification", v19);
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__playerRateDidChangeNotification_, v20, 0);
    v21 = (void *)SKUIMediaPlayerFramework();
    v22 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerBufferingStateChangedNotification", v21);
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__bufferingStateChangedNotification_, v22, 0);
    v23 = (void *)SKUIMediaPlayerFramework();
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__playbackErrorNotification_, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPAVControllerPlaybackErrorNotification", v23), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)SKUIMediaPlayerFramework();
  v5 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerItemChangedNotification", v4);
  objc_msgSend(v3, "removeObserver:name:object:", self, v5, 0);
  v6 = (void *)SKUIMediaPlayerFramework();
  v7 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerItemWillChangeNotification", v6);
  objc_msgSend(v3, "removeObserver:name:object:", self, v7, 0);
  v8 = (void *)SKUIMediaPlayerFramework();
  v9 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerItemReadyToPlayNotification", v8);
  objc_msgSend(v3, "removeObserver:name:object:", self, v9, 0);
  v10 = (void *)SKUIMediaPlayerFramework();
  v11 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerRateDidChangeNotification", v10);
  objc_msgSend(v3, "removeObserver:name:object:", self, v11, 0);
  v12 = (void *)SKUIMediaPlayerFramework();
  v13 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerBufferingStateChangedNotification", v12);
  objc_msgSend(v3, "removeObserver:name:object:", self, v13, 0);
  v14 = (void *)SKUIMediaPlayerFramework();
  objc_msgSend(v3, "removeObserver:name:object:", self, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPAVControllerPlaybackErrorNotification", v14), 0);

  v15.receiver = self;
  v15.super_class = (Class)SKUIMediaPlayerInterface;
  -[SKUIMediaPlayerInterface dealloc](&v15, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SKUIMediaPlayerInterface_addObserver___block_invoke;
  v7[3] = &unk_1E739FD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __40__SKUIMediaPlayerInterface_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isItemWithIdentifierActive:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable keyEnumerator](self->_players, "keyEnumerator");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "playerItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "player");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13
          && +[SKUIMediaPlayerInterface identifierMatches:item:](SKUIMediaPlayerInterface, "identifierMatches:item:", v4, v11))
        {

          v14 = 1;
          goto LABEL_12;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

+ (BOOL)identifierMatches:(id)a3 item:(id)a4
{
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "storeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "storeID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqualToString:", v7) & 1) != 0)
      {
        v11 = 1;
        goto LABEL_13;
      }
    }
    objc_msgSend(v9, "storeAlbumID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (objc_msgSend(v9, "storeAlbumID"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0))
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v9, "itemIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v9, "itemIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v15, "isEqualToString:", v7);

        if (!v12)
          goto LABEL_12;
      }
      else
      {
        v11 = 0;
        if (!v12)
        {
LABEL_12:
          if (!v10)
          {
LABEL_14:

            goto LABEL_15;
          }
LABEL_13:

          goto LABEL_14;
        }
      }
    }

    goto LABEL_12;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

+ (BOOL)isRadioItemIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ra.")) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("st."));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)identifierIsOnDeck:(id)a3
{
  id v4;
  SKUIMediaPlayerItemStatus *onDeckItem;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  v8 = 0;
  if (v4)
  {
    onDeckItem = self->_onDeckItem;
    if (onDeckItem)
    {
      -[SKUIMediaPlayerItemStatus itemIdentifier](onDeckItem, "itemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", v4);

      if ((v7 & 1) != 0)
        v8 = 1;
    }
  }

  return v8;
}

- (void)notifyWillChangeToItemWithItemIdentifer:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  SKUIMediaPlayerItemStatus *onDeckItem;
  void *v14;
  char v15;
  SKUIMediaPlayerItemStatus *v16;
  SKUIMediaPlayerItemStatus *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable keyEnumerator](self->_players, "keyEnumerator");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9), (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "playerItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12
          && +[SKUIMediaPlayerInterface identifierMatches:item:](SKUIMediaPlayerInterface, "identifierMatches:item:", v4, v12))
        {

          goto LABEL_18;
        }
        if (v11)
          -[SKUIMediaPlayerInterface _unregisterForNotificationsForCurrentItem:](self, "_unregisterForNotificationsForCurrentItem:", v11);
        -[SKUIMediaPlayerInterface _destroyPeridicTimeObseverIfNeeded:](self, "_destroyPeridicTimeObseverIfNeeded:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }

  onDeckItem = self->_onDeckItem;
  if (!onDeckItem)
    goto LABEL_16;
  -[SKUIMediaPlayerItemStatus itemIdentifier](onDeckItem, "itemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v4);

  if ((v15 & 1) == 0)
  {
    if (self->_onDeckItem)
      -[SKUIMediaPlayerInterface _cancelOnDeckItem](self, "_cancelOnDeckItem");
LABEL_16:
    v16 = (SKUIMediaPlayerItemStatus *)objc_opt_new();
    v17 = self->_onDeckItem;
    self->_onDeckItem = v16;

    -[SKUIMediaPlayerItemStatus setItemIdentifier:](self->_onDeckItem, "setItemIdentifier:", v4);
    -[SKUIMediaPlayerItemStatus setPlayState:](self->_onDeckItem, "setPlayState:", 1);
    -[SKUIMediaPlayerInterface _notifiyObserversOfItemChange:](self, "_notifiyObserversOfItemChange:", self->_onDeckItem);
    -[SKUIMediaPlayerInterface _startOnDeckTimer](self, "_startOnDeckTimer");
  }
LABEL_18:

}

- (id)playerForItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable keyEnumerator](self->_players, "keyEnumerator");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "playerItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "player");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13
          && +[SKUIMediaPlayerInterface identifierMatches:item:](SKUIMediaPlayerInterface, "identifierMatches:item:", v4, v11))
        {

          goto LABEL_12;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SKUIMediaPlayerInterface_removeObserver___block_invoke;
  block[3] = &unk_1E739FD10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

uint64_t __43__SKUIMediaPlayerInterface_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)togglePlayStateForItemWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  -[SKUIMediaPlayerInterface playerForItemWithIdentifier:](self, "playerForItemWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPlaying");

    objc_msgSend(v8, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "pause");
    else
      objc_msgSend(v6, "play");

    v3 = v8;
  }

}

- (void)_bufferingStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = (void *)SKUIMediaPlayerFramework();
  v6 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerNewStateParameter", v5);
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  -[SKUIMediaPlayerInterface _playerForNotification:](self, "_playerForNotification:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIMediaPlayerInterface _updateBufferingState:player:](self, "_updateBufferingState:player:", v9, v10);
  -[SKUIMediaPlayerInterface _notifyObserversOfItemStateChange](self, "_notifyObserversOfItemStateChange");

}

- (void)_currentItemDurationAvailableNotification:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable keyEnumerator](self->_players, "keyEnumerator");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "currentItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v4)
          {
            objc_msgSend(v11, "playerItem");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUIMediaPlayerInterface _updateDurationForPlayerItem:withMPAVItem:](self, "_updateDurationForPlayerItem:withMPAVItem:", v13, v4);

            -[SKUIMediaPlayerInterface _notifyObserversOfItemStateChange](self, "_notifyObserversOfItemStateChange");
            goto LABEL_12;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)_notifiyObserversOfItemChange:(id)a3
{
  id v4;
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *observerQueue;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    observerQueue = self->_observerQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__SKUIMediaPlayerInterface__notifiyObserversOfItemChange___block_invoke;
    v13[3] = &unk_1E739FD10;
    v14 = v5;
    v15 = v4;
    dispatch_async(observerQueue, v13);

  }
}

void __58__SKUIMediaPlayerInterface__notifiyObserversOfItemChange___block_invoke(uint64_t a1)
{
  id v2;
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
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "mediaPlayer:itemStateChanged:", 0, *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_playerItemReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SKUIMediaPlayerInterface _playerForNotification:](self, "_playerForNotification:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIMediaPlayerInterface _itemFromNotification:](self, "_itemFromNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v5)
      -[SKUIMediaPlayerInterface _itemDidChange:incomingItem:](self, "_itemDidChange:incomingItem:", v7, v5);
  }

}

- (void)_playbackErrorNotification:(id)a3
{
  id v4;

  -[SKUIMediaPlayerInterface _cancelOnDeckItem](self, "_cancelOnDeckItem", a3);
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setPlayState:", 4);
  -[SKUIMediaPlayerInterface _notifiyObserversOfItemChange:](self, "_notifiyObserversOfItemChange:", v4);

}

- (void)_playerItemDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SKUIMediaPlayerInterface _playerForNotification:](self, "_playerForNotification:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMediaPlayerInterface _itemDidChange:incomingItem:](self, "_itemDidChange:incomingItem:", v6, v5);

}

- (void)_playerItemWillChangeNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  id v9;

  v4 = a3;
  -[SKUIMediaPlayerInterface _playerForNotification:](self, "_playerForNotification:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIMediaPlayerInterface _itemFromNotification:](self, "_itemFromNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = SKUIMediaPlayerFramework();
  SKUIWeakLinkedClassForString(CFSTR("MPPlaceholderAVItem"), v6);
  if (v5)
  {
    objc_msgSend(v9, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v5)
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v9, "playerItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPlayState:", 5);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)_playerRateDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[SKUIMediaPlayerInterface _playerForNotification:](self, "_playerForNotification:", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v17, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMediaPlayerInterface _updateTimeValuesUsingItemTime:player:item:](self, "_updateTimeValuesUsingItemTime:player:item:", 0, v17, v7);

    objc_msgSend(v17, "playerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "playState");

    objc_msgSend(v17, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldDisplayAsPlaying");

    if ((v11 & 1) != 0)
    {
      v9 = 2;
    }
    else
    {
      -[SKUIMediaPlayerInterface _cancelOnDeckItem](self, "_cancelOnDeckItem");
      objc_msgSend(v17, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "state");

      if (v13 == 1)
      {
        v9 = 3;
      }
      else if (v13 == 7)
      {
        v9 = 4;
      }
    }
    objc_msgSend(v17, "playerItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "playState");

    if (v9 != v15)
    {
      objc_msgSend(v17, "playerItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPlayState:", v9);

      -[SKUIMediaPlayerInterface _notifyObserversOfItemStateChange](self, "_notifyObserversOfItemStateChange");
    }
  }

}

- (id)_itemFromNotification:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  v4 = (void *)SKUIMediaPlayerFramework();
  v5 = *(id *)SKUIWeakLinkedSymbolForString("MPAVControllerItemParameter", v4);
  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = SKUIMediaPlayerFramework();
  SKUIWeakLinkedClassForString(CFSTR("MPAVItem"), v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v7;
  else
    v9 = 0;

  return v9;
}

- (id)_playerForNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  SKUIMediaPlayer *v7;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SKUIMediaPlayerFramework();
  SKUIWeakLinkedClassForString(CFSTR("MPAVController"), v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[NSMapTable objectForKey:](self->_players, "objectForKey:", v6);
    v7 = (SKUIMediaPlayer *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(SKUIMediaPlayer);
      -[SKUIMediaPlayer setPlayer:](v7, "setPlayer:", v6);
      -[NSMapTable setObject:forKey:](self->_players, "setObject:forKey:", v7, v6);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_createPeriodicTimeObserverIfNeeded:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, double);
  void *v13;
  id v14;
  id v15;
  id from;
  id location;

  v4 = a3;
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rate");
  v7 = v6;
  if (v6 > 0.00000011921)
  {
    objc_msgSend(v4, "periodicTimeObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v4);
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __64__SKUIMediaPlayerInterface__createPeriodicTimeObserverIfNeeded___block_invoke;
      v13 = &unk_1E73A7BF0;
      objc_copyWeak(&v14, &location);
      objc_copyWeak(&v15, &from);
      objc_msgSend(v5, "addPeriodicTimeObserverForInterval:usingBlock:", &v10, 1.0 / v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPeriodicTimeObserver:", v9, v10, v11, v12, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }

}

void __64__SKUIMediaPlayerInterface__createPeriodicTimeObserverIfNeeded___block_invoke(uint64_t a1, double a2)
{
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v4)
    objc_msgSend(WeakRetained, "_setCurrentTimeIfPossible:player:", v4, a2);

}

- (void)_destroyPeridicTimeObseverIfNeeded:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "periodicTimeObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v6, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "periodicTimeObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeTimeObserver:", v5);

    objc_msgSend(v6, "setPeriodicTimeObserver:", 0);
  }

}

- (void)_notifyObserversOfItemStateChange
{
  id v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *observerQueue;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    -[NSMapTable keyEnumerator](self->_players, "keyEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          -[NSMapTable objectForKey:](self->_players, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            observerQueue = self->_observerQueue;
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __61__SKUIMediaPlayerInterface__notifyObserversOfItemStateChange__block_invoke;
            v17[3] = &unk_1E739FD10;
            v18 = v3;
            v19 = v15;
            dispatch_async(observerQueue, v17);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v12);
    }

  }
}

void __61__SKUIMediaPlayerInterface__notifyObserversOfItemStateChange__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "playerItem", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v7, "mediaPlayer:itemStateChanged:", *(_QWORD *)(a1 + 40), v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)_notifyFinishedItem:(id)a3
{
  objc_msgSend(a3, "setPlayState:", 5);
  -[SKUIMediaPlayerInterface _notifyObserversOfItemStateChange](self, "_notifyObserversOfItemStateChange");
}

- (void)_itemDidChange:(id)a3 incomingItem:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  SKUIMediaPlayerItemStatus *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  objc_msgSend(v28, "currentItem");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((id)v7 != v6)
  {
    if (v7)
      -[SKUIMediaPlayerInterface _unregisterForNotificationsForCurrentItem:](self, "_unregisterForNotificationsForCurrentItem:", v7);
    v9 = SKUIMediaPlayerFramework();
    SKUIWeakLinkedClassForString(CFSTR("MPPlaceholderAVItem"), v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v28, "setCurrentItem:", v6);
      SKUIMPUFoundationFramework();
      objc_msgSend(v6, "feeder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "MPU_contentItemIdentifierCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "MPU_contentItemIdentifierCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifierForIdentifierType:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "longLongValue");

      if (!v14)
      {
        objc_msgSend(v12, "identifierForIdentifierType:", 8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v15, "longLongValue");

      }
      if (objc_msgSend(v11, "itemType") == 4)
      {
        objc_msgSend(v11, "identifierForIdentifierType:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "longLongValue");

        if (!v17)
        {
          objc_msgSend(v11, "identifierForIdentifierType:", 8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v18, "longLongValue");

        }
      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(v11, "identifierForIdentifierType:", 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifierForIdentifierType:", 2);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (!v14 && !v17 && !v19 && !v20)
      {
        v22 = 0;
LABEL_26:
        -[SKUIMediaPlayerInterface _updateDurationForPlayerItem:withMPAVItem:](self, "_updateDurationForPlayerItem:withMPAVItem:", v22, v6);
        if (v6)
        {
          -[SKUIMediaPlayerInterface _updateTimeValuesUsingItemTime:player:item:](self, "_updateTimeValuesUsingItemTime:player:item:", 1, v28, v6);
          -[SKUIMediaPlayerInterface _registerForNotificationsForCurrentItem:](self, "_registerForNotificationsForCurrentItem:", v6);
        }

        goto LABEL_29;
      }
      v22 = objc_alloc_init(SKUIMediaPlayerItemStatus);
      v27 = v12;
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIMediaPlayerItemStatus setStoreID:](v22, "setStoreID:", v23);
        if (v17)
          goto LABEL_18;
      }
      else
      {
        v23 = 0;
        if (v17)
        {
LABEL_18:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v17);
          v24 = (id)objc_claimAutoreleasedReturnValue();

          -[SKUIMediaPlayerItemStatus setStoreAlbumID:](v22, "setStoreAlbumID:", v24);
          if (v14)
            v25 = 1;
          else
            v25 = 2;
          goto LABEL_24;
        }
      }
      if (!v21)
      {
        if (v19)
        {
          v26 = v19;

          v25 = 4;
          v23 = v26;
        }
        else
        {
          v25 = 0;
        }
        goto LABEL_25;
      }
      v24 = v21;

      v25 = 3;
LABEL_24:
      v23 = v24;
LABEL_25:
      -[SKUIMediaPlayerItemStatus setItemType:](v22, "setItemType:", v25);
      -[SKUIMediaPlayerItemStatus setItemIdentifier:](v22, "setItemIdentifier:", v23);
      -[SKUIMediaPlayerItemStatus setPlayState:](v22, "setPlayState:", 1);
      objc_msgSend(v28, "setPlayerItem:", v22);

      v12 = v27;
      goto LABEL_26;
    }
  }
LABEL_29:

}

- (void)_registerForNotificationsForCurrentItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)SKUIMediaPlayerFramework();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__currentItemDurationAvailableNotification_, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPAVItemDurationAvailableNotification", v6), v5);

  }
}

- (void)_setCurrentTimeIfPossible:(double)a3 player:(id)a4
{
  void *v6;
  double v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "playerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTime");
  if (v7 != a3)
  {
    -[SKUIMediaPlayerInterface _updateItemForPlayer:currentTime:](self, "_updateItemForPlayer:currentTime:", v8, a3);
    -[SKUIMediaPlayerInterface _notifyObserversOfItemStateChange](self, "_notifyObserversOfItemStateChange");
  }

}

- (void)_unregisterForNotificationsForCurrentItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)SKUIMediaPlayerFramework();
    objc_msgSend(v7, "removeObserver:name:object:", self, *(_QWORD *)SKUIWeakLinkedSymbolForString("MPAVItemDurationAvailableNotification", v6), v5);

  }
}

- (void)_updateBufferingState:(unint64_t)a3 player:(id)a4
{
  char v4;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend(a4, "playerItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "playState") != 5)
  {
    if ((v4 & 0xB) != 0)
    {
      -[SKUIMediaPlayerInterface _cancelOnDeckItem](self, "_cancelOnDeckItem");
      v6 = 2;
    }
    else
    {
      v6 = 1;
    }
    if (v6 != objc_msgSend(v7, "playState"))
      objc_msgSend(v7, "setPlayState:", v6);
  }

}

- (void)_cancelOnDeckItem
{
  NSObject *timeoutTimer;
  OS_dispatch_source *v4;
  SKUIMediaPlayerItemStatus *onDeckItem;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  onDeckItem = self->_onDeckItem;
  self->_onDeckItem = 0;

}

- (void)_onDeckTimedOut
{
  void *v3;
  SKUIMediaPlayerItemStatus *onDeckItem;

  if (self->_onDeckItem)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setPlayState:", 4);
    -[SKUIMediaPlayerInterface _notifiyObserversOfItemChange:](self, "_notifiyObserversOfItemChange:", v3);

    onDeckItem = self->_onDeckItem;
  }
  else
  {
    onDeckItem = 0;
  }
  self->_onDeckItem = 0;

}

- (void)_startOnDeckTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v3;

  v5 = self->_timeoutTimer;
  v6 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v7 = self->_timeoutTimer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SKUIMediaPlayerInterface__startOnDeckTimer__block_invoke;
  v8[3] = &unk_1E739FF68;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__SKUIMediaPlayerInterface__startOnDeckTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onDeckTimedOut");
    WeakRetained = v2;
  }

}

- (void)_updateDurationForPlayerItem:(id)a3 withMPAVItem:(id)a4
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  id v10;

  if (a3)
  {
    v5 = a4;
    v10 = a3;
    objc_msgSend(v5, "durationIfAvailable");
    v7 = v6;
    v8 = objc_msgSend(v5, "isAlwaysLive");

    objc_msgSend(v10, "setHideDuration:", v8);
    v9 = 0.0;
    if (v7 >= 2.22044605e-16)
      v9 = v7;
    objc_msgSend(v10, "setDuration:", v9);

  }
}

- (void)_updateItemForPlayer:(id)a3 currentTime:(double)a4
{
  id v5;

  objc_msgSend(a3, "playerItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentTime:", a4);

}

- (void)_updateTimeValuesUsingItemTime:(BOOL)a3 player:(id)a4 item:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double (*v23)(__int128 *);
  void *v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "rate");
  v11 = v10;
  objc_msgSend(v8, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rate");
  v14 = v13;

  v15 = vabds_f32(v11, v14);
  HIDWORD(v16) = 872415232;
  if (v15 > 0.00000011921)
  {
    *(float *)&v16 = v14;
    objc_msgSend(v8, "setRate:", v16);
  }
  objc_msgSend(v9, "currentTimeDisplayOverride");
  v18 = v17;
  if (v17 <= 2.22044605e-16)
  {
    if (!v6)
    {
      objc_msgSend(v8, "player");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentTime");
      goto LABEL_12;
    }
    v18 = 0.0;
    if (objc_msgSend(v9, "isAssetLoaded"))
    {
      objc_msgSend(v9, "playerItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "currentTime");
      }
      else
      {
        v25 = 0uLL;
        v26 = 0;
      }
      v22 = (void *)SKUICoreMediaFramework();
      v23 = (double (*)(__int128 *))SKUIWeakLinkedSymbolForString("CMTimeGetSeconds", v22);
      if (!v23)
        goto LABEL_13;
      v27 = v25;
      v28 = v26;
      v21 = v23(&v27);
LABEL_12:
      v18 = v21;
LABEL_13:

    }
  }
  -[SKUIMediaPlayerInterface _setCurrentTimeIfPossible:player:](self, "_setCurrentTimeIfPossible:player:", v8, v18);
  if (v15 > 0.00000011921
    || (objc_msgSend(v8, "periodicTimeObserver"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        !v24))
  {
    -[SKUIMediaPlayerInterface _destroyPeridicTimeObseverIfNeeded:](self, "_destroyPeridicTimeObseverIfNeeded:", v8);
    -[SKUIMediaPlayerInterface _createPeriodicTimeObserverIfNeeded:](self, "_createPeriodicTimeObserverIfNeeded:", v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_onDeckItem, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaPlayerInterface init]";
}

@end

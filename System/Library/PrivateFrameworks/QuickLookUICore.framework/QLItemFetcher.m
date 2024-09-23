@implementation QLItemFetcher

- (QLItemFetcher)init
{
  QLItemFetcher *v2;
  uint64_t v3;
  NSMapTable *observersToBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLItemFetcher;
  v2 = -[QLItemFetcher init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observersToBlocks = v2->_observersToBlocks;
    v2->_observersToBlocks = (NSMapTable *)v3;

    -[QLItemFetcher setFetchingState:](v2, "setFetchingState:", 0);
  }
  return v2;
}

- (void)registerObserver:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_observersToBlocks, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    -[NSMapTable setObject:forKey:](self->_observersToBlocks, "setObject:forKey:", v7, v9);
  }
  v8 = (void *)MEMORY[0x1DF089CE8](v6);
  objc_msgSend(v7, "addObject:", v8);

}

- (void)unregisterObserver:(id)a3
{
  -[NSMapTable setObject:forKey:](self->_observersToBlocks, "setObject:forKey:", 0, a3);
}

- (void)setFetchingState:(int64_t)a3
{
  self->_fetchingState = a3;
  -[QLItemFetcher _notifyObservers](self, "_notifyObservers");
}

- (void)_notifyObservers
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[NSMapTable keyEnumerator](self->_observersToBlocks, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__QLItemFetcher__notifyObservers__block_invoke;
  v5[3] = &unk_1E9EFC240;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __33__QLItemFetcher__notifyObservers__block_invoke(uint64_t a1, uint64_t a2)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
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
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)shareableItem
{
  return 0;
}

- (void)prepareShareableItem:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)fetchedContent
{
  return 0;
}

- (BOOL)isLongFetchOperation
{
  return 0;
}

- (BOOL)canBeCanceled
{
  return 0;
}

- (id)urlForThumbnail
{
  return 0;
}

- (NSNumber)itemSize
{
  return 0;
}

- (id)newItemProvider
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[QLItemFetcher fetchingState](self, "fetchingState"), CFSTR("fetchingState"));

}

- (QLItemFetcher)initWithCoder:(id)a3
{
  id v4;
  QLItemFetcher *v5;
  QLItemFetcher *v6;

  v4 = a3;
  v5 = -[QLItemFetcher init](self, "init");
  if (v5)
  {
    -[QLItemFetcher setFetchingState:](v5, "setFetchingState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fetchingState")));
    v6 = v5;
  }

  return v5;
}

- (int64_t)fetchingState
{
  return self->_fetchingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersToBlocks, 0);
}

@end

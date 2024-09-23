@implementation TUIRenderUpdateArrayTracker

- (TUIRenderUpdateArrayTracker)init
{
  TUIRenderUpdateArrayTracker *v2;
  NSCountedSet *v3;
  NSCountedSet *deletedIdentifiers;
  NSMutableDictionary *v5;
  NSMutableDictionary *deletedModels;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIRenderUpdateArrayTracker;
  v2 = -[TUIRenderUpdateArrayTracker init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSCountedSet);
    deletedIdentifiers = v2->_deletedIdentifiers;
    v2->_deletedIdentifiers = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    deletedModels = v2->_deletedModels;
    v2->_deletedModels = v5;

  }
  return v2;
}

- (id)addDeletedInterestInDeletedModels:(id)a3
{
  id v4;
  _TUIRenderUpdateDeletionInterest *v5;

  v4 = a3;
  v5 = -[_TUIRenderUpdateDeletionInterest initWithModels:tracker:]([_TUIRenderUpdateDeletionInterest alloc], "initWithModels:tracker:", v4, self);

  return v5;
}

- (void)incrementInterestInDeletedModels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        -[NSCountedSet addObject:](self->_deletedIdentifiers, "addObject:", v10);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deletedModels, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)decrementInterestInDeletedModels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "identifier"));
        -[NSCountedSet removeObject:](self->_deletedIdentifiers, "removeObject:", v9);
        if (!-[NSCountedSet countForObject:](self->_deletedIdentifiers, "countForObject:", v9))
          -[NSMutableDictionary removeObjectForKey:](self->_deletedModels, "removeObjectForKey:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)submodelTrackerForIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_submodelTrackers, "objectForKeyedSubscript:", a3);
}

- (void)setSubmodelTracker:(id)a3 forIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *submodelTrackers;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  submodelTrackers = self->_submodelTrackers;
  if (!submodelTrackers)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_submodelTrackers;
    self->_submodelTrackers = v8;

    submodelTrackers = self->_submodelTrackers;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](submodelTrackers, "setObject:forKeyedSubscript:", v10, v6);

}

- (NSCountedSet)deletedIdentifiers
{
  return self->_deletedIdentifiers;
}

- (NSMutableDictionary)deletedModels
{
  return self->_deletedModels;
}

- (void)setDeletedModels:(id)a3
{
  objc_storeStrong((id *)&self->_deletedModels, a3);
}

- (NSMutableDictionary)submodelTrackers
{
  return self->_submodelTrackers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodelTrackers, 0);
  objc_storeStrong((id *)&self->_deletedModels, 0);
  objc_storeStrong((id *)&self->_deletedIdentifiers, 0);
}

@end

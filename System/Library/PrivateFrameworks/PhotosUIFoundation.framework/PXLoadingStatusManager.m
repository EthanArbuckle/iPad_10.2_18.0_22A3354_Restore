@implementation PXLoadingStatusManager

- (void)_updateNowIfNeeded
{
  -[PXLoadingStatusManager _setUpdateScheduled:](self, "_setUpdateScheduled:", 0);
  -[PXLoadingStatusManager _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)didCompleteLoadOperationWithTrackingID:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  PXOperationStatus *v12;
  uint64_t v13;
  id v14;
  PXOperationStatus *v15;
  void *v16;
  id v17;

  v6 = a4;
  v17 = a3;
  v9 = a5;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLoadingStatusManager.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loadOperationTrackingID"));

  }
  -[PXLoadingStatusManager _loadingStatusByLoadOperationTrackingID](self, "_loadingStatusByLoadOperationTrackingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [PXOperationStatus alloc];
    if (v6)
    {
      v13 = 2;
      v14 = 0;
    }
    else
    {
      v13 = 3;
      v14 = v9;
    }
    v15 = -[PXOperationStatus initWithState:progress:error:](v12, "initWithState:progress:error:", v13, v14, 1.0);

    -[PXLoadingStatusManager _setLoadingStatus:forLoadOperationTrackingID:](self, "_setLoadingStatus:forLoadOperationTrackingID:", v15, v17);
  }

}

- (void)_updateLoadingStatusForItemIdentifiersIfNeeded
{
  void *v3;
  void *v4;
  id v5;
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
  -[PXLoadingStatusManager _invalidLoadingStatusItemIdentifiers](self, "_invalidLoadingStatusItemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v3, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
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
        -[PXLoadingStatusManager _updateLoadingStatusForItemIdentifier:](self, "_updateLoadingStatusForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_updateLoadingStatusForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PXLoadingStatusManager _loadOperationTrackingIDsByItemIdentifier](self, "_loadOperationTrackingIDsByItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PXLoadingStatusManager _loadingStatusByLoadOperationTrackingID](self, "_loadingStatusByLoadOperationTrackingID", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          if (v12 == 0.0)
          {
            v17 = v16;

            v12 = v12 + 1.0;
          }
          else
          {
            v12 = v12 + 1.0;
            objc_msgSend(v10, "operationStatusByMixingOperationStatus:withMixFactor:", v16, 1.0 / v12);
            v17 = (id)objc_claimAutoreleasedReturnValue();

          }
          v10 = v17;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  -[PXLoadingStatusManager _setLoadingStatus:forItemIdentifier:](self, "_setLoadingStatus:forItemIdentifier:", v10, v4);
}

- (id)willBeginLoadOperationWithItemIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLoadingStatusManager.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  }
  -[PXLoadingStatusManager _loadingStatusByItemIdentifier](self, "_loadingStatusByItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "state") == 3)
    -[PXLoadingStatusManager _resetLoadingStatusForItemIdentifierIfAppropriate:](self, "_resetLoadingStatusForItemIdentifierIfAppropriate:", v5);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXLoadingStatusManager _loadOperationTrackingIDsByItemIdentifier](self, "_loadOperationTrackingIDsByItemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLoadingStatusManager _loadOperationTrackingIDsByItemIdentifier](self, "_loadOperationTrackingIDsByItemIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v5);

  }
  objc_msgSend(v11, "addObject:", v9);
  -[PXLoadingStatusManager _itemIdentifierByLoadOperationTrackingID](self, "_itemIdentifierByLoadOperationTrackingID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, v9);

  return v9;
}

- (NSMapTable)_loadOperationTrackingIDsByItemIdentifier
{
  return self->__loadOperationTrackingIDsByItemIdentifier;
}

- (void)_setLoadingStatus:(id)a3 forItemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PXLoadingStatusManager _loadingStatusByItemIdentifier](self, "_loadingStatusByItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != v6 && (objc_msgSend(v6, "isEqual:", v9) & 1) == 0)
  {
    if (v6)
      objc_msgSend(v8, "setObject:forKey:", v6, v7);
    else
      objc_msgSend(v8, "removeObjectForKey:", v7);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_observers;
    v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "loadingStatusManager:didUpdateLoadingStatus:forItemIdentifier:", self, v6, v7, (_QWORD)v15);
        }
        v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (NSMapTable)_loadingStatusByItemIdentifier
{
  return self->__loadingStatusByItemIdentifier;
}

- (void)_didUpdateLoadOperationWithTrackingID:(id)a3 withProgress:(double)a4 indeterminate:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  PXOperationStatus *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLoadingStatusManager.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loadOperationTrackingID"));

  }
  -[PXLoadingStatusManager _itemIdentifierByLoadOperationTrackingID](self, "_itemIdentifierByLoadOperationTrackingID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXLoadingStatusManager _resetLoadingStatusForItemIdentifierIfAppropriate:](self, "_resetLoadingStatusForItemIdentifierIfAppropriate:", v10);
  v11 = [PXOperationStatus alloc];
  if (v5)
    v12 = -[PXOperationStatus initWithState:error:](v11, "initWithState:error:", 1, 0);
  else
    v12 = -[PXOperationStatus initWithState:progress:error:](v11, "initWithState:progress:error:", 1, 0, a4);
  v13 = (void *)v12;
  -[PXLoadingStatusManager _setLoadingStatus:forLoadOperationTrackingID:](self, "_setLoadingStatus:forLoadOperationTrackingID:", v12, v15);

}

- (void)_setLoadingStatus:(id)a3 forLoadOperationTrackingID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PXLoadingStatusManager _loadingStatusByLoadOperationTrackingID](self, "_loadingStatusByLoadOperationTrackingID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v11 && (objc_msgSend(v11, "isEqual:", v8) & 1) == 0)
  {
    if (v11)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v6);
    else
      objc_msgSend(v7, "removeObjectForKey:", v6);
    -[PXLoadingStatusManager _itemIdentifierByLoadOperationTrackingID](self, "_itemIdentifierByLoadOperationTrackingID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXLoadingStatusManager _invalidateLoadingStatusForItemIdentifier:](self, "_invalidateLoadingStatusForItemIdentifier:", v10);
  }

}

- (NSMutableDictionary)_itemIdentifierByLoadOperationTrackingID
{
  return self->__itemIdentifierByLoadOperationTrackingID;
}

- (void)_setNeedsUpdate
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (!-[PXLoadingStatusManager _isUpdateScheduled](self, "_isUpdateScheduled"))
  {
    -[PXLoadingStatusManager _setUpdateScheduled:](self, "_setUpdateScheduled:", 1);
    v4[0] = *MEMORY[0x24BDBCB80];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLoadingStatusManager performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__updateNowIfNeeded, 0, v3, 0.0);

  }
}

- (BOOL)_isUpdateScheduled
{
  return self->__isUpdateScheduled;
}

- (void)_setUpdateScheduled:(BOOL)a3
{
  self->__isUpdateScheduled = a3;
}

- (void)_resetLoadingStatusForItemIdentifierIfAppropriate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PXLoadingStatusManager _loadOperationTrackingIDsByItemIdentifier](self, "_loadOperationTrackingIDsByItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[PXLoadingStatusManager _loadingStatusByLoadOperationTrackingID](self, "_loadingStatusByLoadOperationTrackingID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "state") == 1)
        {
          objc_msgSend(v7, "removeAllObjects");

          goto LABEL_13;
        }
        if (v15)
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  if (objc_msgSend(v7, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
          -[PXLoadingStatusManager _loadingStatusByLoadOperationTrackingID](self, "_loadingStatusByLoadOperationTrackingID", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObjectForKey:", v21);

          -[PXLoadingStatusManager _itemIdentifierByLoadOperationTrackingID](self, "_itemIdentifierByLoadOperationTrackingID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObjectForKey:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

    objc_msgSend(v8, "minusSet:", v16);
    -[PXLoadingStatusManager _invalidateLoadingStatusForItemIdentifier:](self, "_invalidateLoadingStatusForItemIdentifier:", v4);
  }

}

- (NSMutableDictionary)_loadingStatusByLoadOperationTrackingID
{
  return self->__loadingStatusByLoadOperationTrackingID;
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PXLoadingStatusManager _needsUpdate](self, "_needsUpdate"))
  {
    -[PXLoadingStatusManager _updateLoadingStatusForItemIdentifiersIfNeeded](self, "_updateLoadingStatusForItemIdentifiersIfNeeded");
    if (-[PXLoadingStatusManager _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLoadingStatusManager.m"), 201, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  void *v2;
  BOOL v3;

  -[PXLoadingStatusManager _invalidLoadingStatusItemIdentifiers](self, "_invalidLoadingStatusItemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_invalidateLoadingStatusForItemIdentifier:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[PXLoadingStatusManager _invalidLoadingStatusItemIdentifiers](self, "_invalidLoadingStatusItemIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    -[PXLoadingStatusManager _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (NSMutableSet)_invalidLoadingStatusItemIdentifiers
{
  return self->__invalidLoadingStatusItemIdentifiers;
}

- (PXLoadingStatusManager)init
{
  PXLoadingStatusManager *v2;
  uint64_t v3;
  NSMapTable *loadOperationTrackingIDsByItemIdentifier;
  uint64_t v5;
  NSMapTable *loadingStatusByItemIdentifier;
  uint64_t v7;
  NSMutableDictionary *itemIdentifierByLoadOperationTrackingID;
  uint64_t v9;
  NSMutableDictionary *loadingStatusByLoadOperationTrackingID;
  uint64_t v11;
  NSMutableSet *invalidLoadingStatusItemIdentifiers;
  uint64_t v13;
  NSHashTable *observers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXLoadingStatusManager;
  v2 = -[PXLoadingStatusManager init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    loadOperationTrackingIDsByItemIdentifier = v2->__loadOperationTrackingIDsByItemIdentifier;
    v2->__loadOperationTrackingIDsByItemIdentifier = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    loadingStatusByItemIdentifier = v2->__loadingStatusByItemIdentifier;
    v2->__loadingStatusByItemIdentifier = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    itemIdentifierByLoadOperationTrackingID = v2->__itemIdentifierByLoadOperationTrackingID;
    v2->__itemIdentifierByLoadOperationTrackingID = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    loadingStatusByLoadOperationTrackingID = v2->__loadingStatusByLoadOperationTrackingID;
    v2->__loadingStatusByLoadOperationTrackingID = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    invalidLoadingStatusItemIdentifiers = v2->__invalidLoadingStatusItemIdentifiers;
    v2->__invalidLoadingStatusItemIdentifiers = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v13;

  }
  return v2;
}

- (void)didUpdateLoadOperationWithTrackingID:(id)a3 withProgress:(double)a4
{
  -[PXLoadingStatusManager _didUpdateLoadOperationWithTrackingID:withProgress:indeterminate:](self, "_didUpdateLoadOperationWithTrackingID:withProgress:indeterminate:", a3, 0, a4);
}

- (void)registerObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)loadingStatusForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXLoadingStatusManager _updateLoadingStatusForItemIdentifierIfNeeded:](self, "_updateLoadingStatusForItemIdentifierIfNeeded:", v4);
  -[PXLoadingStatusManager _loadingStatusByItemIdentifier](self, "_loadingStatusByItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didUpdateLoadOperationWithIndeterminateProgressWithTrackingID:(id)a3
{
  -[PXLoadingStatusManager _didUpdateLoadOperationWithTrackingID:withProgress:indeterminate:](self, "_didUpdateLoadOperationWithTrackingID:withProgress:indeterminate:", a3, 1, 0.0);
}

- (void)didCancelLoadOperationWithTrackingID:(id)a3
{
  void *v5;
  void *v6;
  PXOperationStatus *v7;
  double v8;
  double v9;
  void *v10;
  PXOperationStatus *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLoadingStatusManager.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loadOperationTrackingID"));

  }
  -[PXLoadingStatusManager _loadingStatusByLoadOperationTrackingID](self, "_loadingStatusByLoadOperationTrackingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [PXOperationStatus alloc];
    objc_msgSend(v6, "progress");
    v9 = v8;
    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXOperationStatus initWithState:progress:error:](v7, "initWithState:progress:error:", 4, v10, v9);

    -[PXLoadingStatusManager _setLoadingStatus:forLoadOperationTrackingID:](self, "_setLoadingStatus:forLoadOperationTrackingID:", v11, v13);
  }

}

- (void)_updateLoadingStatusForItemIdentifierIfNeeded:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXLoadingStatusManager _invalidLoadingStatusItemIdentifiers](self, "_invalidLoadingStatusItemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v4, "removeObject:", v5);
    -[PXLoadingStatusManager _updateLoadingStatusForItemIdentifier:](self, "_updateLoadingStatusForItemIdentifier:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loadingStatusByLoadOperationTrackingID, 0);
  objc_storeStrong((id *)&self->__itemIdentifierByLoadOperationTrackingID, 0);
  objc_storeStrong((id *)&self->__loadingStatusByItemIdentifier, 0);
  objc_storeStrong((id *)&self->__loadOperationTrackingIDsByItemIdentifier, 0);
  objc_storeStrong((id *)&self->__invalidLoadingStatusItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (PXLoadingStatusManager)defaultManager
{
  if (defaultManager_onceToken_3538 != -1)
    dispatch_once(&defaultManager_onceToken_3538, &__block_literal_global_3539);
  return (PXLoadingStatusManager *)(id)defaultManager_manager;
}

void __40__PXLoadingStatusManager_defaultManager__block_invoke()
{
  PXLoadingStatusManager *v0;
  void *v1;

  v0 = objc_alloc_init(PXLoadingStatusManager);
  v1 = (void *)defaultManager_manager;
  defaultManager_manager = (uint64_t)v0;

}

@end

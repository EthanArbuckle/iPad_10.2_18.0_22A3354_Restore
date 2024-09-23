@implementation GEOObserverHashTable

- (id)observersSnapshot
{
  return objc_getAssociatedObject(self, "observersSnapshot");
}

- (void)setObserversSnapshot:(id)a3
{
  objc_setAssociatedObject(self, "observersSnapshot", a3, (void *)1);
}

- (void)snapshotCurrentObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[GEOObserverHashTable allObservers](self, "allObservers"));
  -[GEOObserverHashTable setObserversSnapshot:](self, "setObserversSnapshot:", v3);

}

- (void)removeSnapshottedObservers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOObserverHashTable observersSnapshot](self, "observersSnapshot", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[GEOObserverHashTable unregisterObserver:](self, "unregisterObserver:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)restoreOriginalObservers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOObserverHashTable observersSnapshot](self, "observersSnapshot", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[GEOObserverHashTable registerObserver:](self, "registerObserver:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[GEOObserverHashTable setObserversSnapshot:](self, "setObserversSnapshot:", 0);
}

- (void)clearSnapshottedObservers
{
  -[GEOObserverHashTable setObserversSnapshot:](self, "setObserversSnapshot:", 0);
}

@end

@implementation SBActivityAmbientObserver

- (SBActivityAmbientObserver)init
{
  SBActivityAmbientObserver *v2;
  uint64_t v3;
  NSMutableOrderedSet *activeActivityItems;
  uint64_t v5;
  NSMutableOrderedSet *pendingItems;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)SBActivityAmbientObserver;
  v2 = -[SBActivityAmbientObserver init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    activeActivityItems = v2->_activeActivityItems;
    v2->_activeActivityItems = (NSMutableOrderedSet *)v3;

    v5 = objc_opt_new();
    pendingItems = v2->_pendingItems;
    v2->_pendingItems = (NSMutableOrderedSet *)v5;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    +[SBActivityManager sharedInstance](SBActivityManager, "sharedInstance", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (-[SBActivityAmbientObserver shouldHandleActivityItem:](v2, "shouldHandleActivityItem:", v13))
            -[NSMutableOrderedSet addObject:](v2->_activeActivityItems, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

  }
  return v2;
}

- (void)dealloc
{
  NSMutableOrderedSet *activeActivityItems;
  objc_super v4;

  -[NSMutableOrderedSet removeAllObjects](self->_activeActivityItems, "removeAllObjects");
  activeActivityItems = self->_activeActivityItems;
  self->_activeActivityItems = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBActivityAmbientObserver;
  -[SBActivityAmbientObserver dealloc](&v4, sel_dealloc);
}

- (void)addOverlaysForOngoingActivitiesIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBActivityAmbientObserver _sortActivityItems](self, "_sortActivityItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[SBActivityAmbientObserver delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addActivityItem:forOngoingActivity:", v8, 1);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)addPendingItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    SBLogActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] adding ambient item to pending items", (uint8_t *)&v7, 0xCu);

    }
    -[NSMutableOrderedSet addObject:](self->_pendingItems, "addObject:", v4);
  }

}

- (void)removePendingItem:(id)a3
{
  if (a3)
    -[NSMutableOrderedSet removeObject:](self->_pendingItems, "removeObject:");
}

- (BOOL)hasPendingItem
{
  return -[NSMutableOrderedSet count](self->_pendingItems, "count") != 0;
}

- (SBActivityItem)nextPendingItem
{
  void *v3;

  if (-[SBActivityAmbientObserver hasPendingItem](self, "hasPendingItem"))
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_pendingItems, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (SBActivityItem *)v3;
}

- (BOOL)isActiveActivityItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[SBActivityAmbientObserver activeActivityItems](self, "activeActivityItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)activityDidStart:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_activeActivityItems, "containsObject:") & 1) == 0)
    -[NSMutableOrderedSet addObject:](self->_activeActivityItems, "addObject:", v5);
  -[SBActivityAmbientObserver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addActivityItem:forOngoingActivity:", v5, 0);

}

- (void)activityDidEnd:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_activeActivityItems, "containsObject:"))
  {
    -[NSMutableOrderedSet removeObject:](self->_activeActivityItems, "removeObject:", v5);
    -[NSMutableOrderedSet removeObject:](self->_pendingItems, "removeObject:", v5);
    -[SBActivityAmbientObserver delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeActivityItem:", v5);

  }
}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  char v9;

  if (!a3)
    return 0;
  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_171);

  +[SBLiveActivityDomain rootSettings](SBLiveActivityDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hideActivitiesInAmbient");

  v9 = v6 & ~v8;
  return v9;
}

BOOL __54__SBActivityAmbientObserver_shouldHandleActivityItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "destination") == 3;
}

- (void)presentAlert:(id)a3
{
  id v4;
  NSMutableOrderedSet *activeActivityItems;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  activeActivityItems = self->_activeActivityItems;
  v8 = v4;
  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(activeActivityItems) = -[NSMutableOrderedSet containsObject:](activeActivityItems, "containsObject:", v6);

  if ((_DWORD)activeActivityItems)
  {
    -[SBActivityAmbientObserver delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "presentAmbientActivityAlert:", v8);

  }
}

- (void)dismissAlert:(id)a3
{
  id v4;
  NSMutableOrderedSet *activeActivityItems;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  activeActivityItems = self->_activeActivityItems;
  v8 = v4;
  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(activeActivityItems) = -[NSMutableOrderedSet containsObject:](activeActivityItems, "containsObject:", v6);

  if ((_DWORD)activeActivityItems)
  {
    -[SBActivityAmbientObserver delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "dismissAmbientActivityAlert:", v8);

  }
}

- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4
{
  _BOOL4 v4;
  void *v6;
  NSMutableOrderedSet *activeActivityItems;
  void *v8;
  SBActivityAlert *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(a4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  activeActivityItems = self->_activeActivityItems;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__SBActivityAmbientObserver_activityProminenceChanged_item___block_invoke;
  v11[3] = &unk_1E8EAF910;
  v10 = v6;
  v12 = v10;
  -[NSMutableOrderedSet bs_firstObjectPassingTest:](activeActivityItems, "bs_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[SBActivityAlert initWithItem:payloadIdentifier:options:title:body:]([SBActivityAlert alloc], "initWithItem:payloadIdentifier:options:title:body:", v8, 0, 0, 0, 0);
    if (v4)
      -[SBActivityAmbientObserver presentAlert:](self, "presentAlert:", v9);
    else
      -[SBActivityAmbientObserver dismissAlert:](self, "dismissAlert:", v9);

  }
}

uint64_t __60__SBActivityAmbientObserver_activityProminenceChanged_item___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_sortActivityItems
{
  NSMutableOrderedSet *activeActivityItems;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  activeActivityItems = self->_activeActivityItems;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SBActivityAmbientObserver__sortActivityItems__block_invoke;
  v6[3] = &unk_1E8EAF938;
  objc_copyWeak(&v7, &location);
  -[NSMutableOrderedSet sortedArrayUsingComparator:](activeActivityItems, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

uint64_t __47__SBActivityAmbientObserver__sortActivityItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "platterTargetBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "platterTargetBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
  {
    if (objc_msgSend(v9, "isEqualToString:", v11))
    {
      objc_msgSend(v5, "relevanceScore");
      v13 = v12;
      objc_msgSend(v6, "relevanceScore");
      v15 = v13 < v14;
    }
    else
    {
      +[SBActivityManager sharedInstance](SBActivityManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstPartyActivityGroupingIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "indexOfObject:", v9);
      v19 = objc_msgSend(v17, "indexOfObject:", v11);
      if (v19 == 0x7FFFFFFFFFFFFFFFLL || v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v19 == 0x7FFFFFFFFFFFFFFFLL || v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v5, "descriptor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "createdDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "descriptor");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "createdDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = objc_msgSend(v21, "compare:", v23);
          }
          else
          {
            v15 = -1;
          }
        }
        else if (v19 < v18)
        {
          v15 = 1;
        }
        else
        {
          v15 = -1;
        }
      }
      else
      {
        v15 = 1;
      }

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (SBActivityAmbientObserverDelegate)delegate
{
  return (SBActivityAmbientObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableOrderedSet)activeActivityItems
{
  return self->_activeActivityItems;
}

- (void)setActiveActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_activeActivityItems, a3);
}

- (NSMutableOrderedSet)pendingItems
{
  return self->_pendingItems;
}

- (void)setPendingItems:(id)a3
{
  objc_storeStrong((id *)&self->_pendingItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_activeActivityItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

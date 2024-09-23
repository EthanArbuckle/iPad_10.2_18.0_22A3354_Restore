@implementation _UISceneHostingGraph

- (void)_noteContextID:(unsigned int)a3 hostedByWindow:(id)a4
{
  uint64_t v4;
  id v6;
  NSMapTable *hostingGraph;
  void *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  BSDispatchQueueAssertMain();
  hostingGraph = self->_hostingGraph;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMapTable setObject:forKey:](hostingGraph, "setObject:forKey:", v6, v8);
  else
    -[NSMapTable removeObjectForKey:](hostingGraph, "removeObjectForKey:", v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_lazy_contextTrackingAssertions;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "isContextIDRelevant:", v4, (_QWORD)v16))
        {
          -[_UISceneHostingGraph localWindowGraphHostingContextID:](self, "localWindowGraphHostingContextID:", objc_msgSend(v14, "contextID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setWindowGraph:", v15);

        }
      }
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

+ (id)sharedInstance
{
  if (qword_1ECD79E20 != -1)
    dispatch_once(&qword_1ECD79E20, &__block_literal_global_253);
  return (id)_MergedGlobals_1_11;
}

- (id)_localWindowGraphHostingContextID:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSMapTable *hostingGraph;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v5 = 0;
  v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = v6;
    v6 = v5;

    +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v9;
    v5 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v10);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "_contextId") == (_DWORD)v3)
          {
            v5 = v13;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

    if (v6 == v5)
    {

    }
    else if (v5)
    {
      goto LABEL_17;
    }
    hostingGraph = self->_hostingGraph;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](hostingGraph, "objectForKey:", v15);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5)
      break;
LABEL_17:
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "addObject:", v5);
    v3 = objc_msgSend(v5, "_contextId");

  }
  objc_msgSend(0, "_contextId");

  return v7;
}

- (id)observeLocalWindowGraphHostingContextID:(unsigned int)a3 withHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSHashTable *v8;
  NSHashTable *lazy_contextTrackingAssertions;
  _UIContextGraphTrackingAssertion *v10;
  _UIContextGraphTrackingAssertion *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  BSDispatchQueueAssertMain();
  -[_UISceneHostingGraph localWindowGraphHostingContextID:](self, "localWindowGraphHostingContextID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_lazy_contextTrackingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    lazy_contextTrackingAssertions = self->_lazy_contextTrackingAssertions;
    self->_lazy_contextTrackingAssertions = v8;

  }
  objc_initWeak(&location, self);
  v10 = [_UIContextGraphTrackingAssertion alloc];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __76___UISceneHostingGraph_observeLocalWindowGraphHostingContextID_withHandler___block_invoke;
  v16 = &unk_1E16B7FF8;
  objc_copyWeak(&v17, &location);
  v11 = -[_UIContextGraphTrackingAssertion initWithContextID:windowGraph:clientHandlerBlock:invalidationBlock:](v10, "initWithContextID:windowGraph:clientHandlerBlock:invalidationBlock:", v4, v7, v6, &v13);
  -[NSHashTable addObject:](self->_lazy_contextTrackingAssertions, "addObject:", v11, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

- (id)localWindowGraphHostingContextID:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  BSDispatchQueueAssertMain();
  return -[_UISceneHostingGraph _localWindowGraphHostingContextID:](self, "_localWindowGraphHostingContextID:", v3);
}

- (id)_init
{
  _UISceneHostingGraph *v2;
  uint64_t v3;
  NSMapTable *hostingGraph;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISceneHostingGraph;
  v2 = -[_UISceneHostingGraph init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    hostingGraph = v2->_hostingGraph;
    v2->_hostingGraph = (NSMapTable *)v3;

  }
  return v2;
}

- (id)_rawWindowHostingContextID:(unsigned int)a3
{
  NSMapTable *hostingGraph;
  void *v4;
  void *v5;

  hostingGraph = self->_hostingGraph;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](hostingGraph, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazy_contextTrackingAssertions, 0);
  objc_storeStrong((id *)&self->_hostingGraph, 0);
}

@end

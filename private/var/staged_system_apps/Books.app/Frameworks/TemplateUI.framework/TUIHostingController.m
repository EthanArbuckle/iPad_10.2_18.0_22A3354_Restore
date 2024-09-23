@implementation TUIHostingController

- (TUIHostingController)initWithFeedId:(id)a3 delegate:(id)a4 viewController:(id)a5 manager:(id)a6
{
  id v10;
  UIViewController *v11;
  id v12;
  TUIHostingController *v13;
  TUIHostingController *v14;
  uint64_t v15;
  UITraitCollection *traitCollection;
  NSMutableDictionary *v17;
  NSMutableDictionary *statesMap;
  NSMutableDictionary *v19;
  NSMutableDictionary *geometryMap;
  NSMutableDictionary *v21;
  NSMutableDictionary *providerObserversMap;
  uint64_t v23;
  NSHashTable *contentObservers;
  NSMutableSet *v25;
  NSMutableSet *activeGroups;
  uint64_t v27;
  NSHashTable *controllerObservers;
  objc_super v30;

  v10 = a4;
  v11 = (UIViewController *)a5;
  v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)TUIHostingController;
  v13 = -[TUIHostingController init](&v30, "init");
  v14 = v13;
  if (v13)
  {
    v13->_feedId.uniqueIdentifier = a3.var0;
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14->_viewController = v11;
    v15 = objc_claimAutoreleasedReturnValue(-[UIViewController traitCollection](v11, "traitCollection"));
    traitCollection = v14->_traitCollection;
    v14->_traitCollection = (UITraitCollection *)v15;

    v17 = objc_opt_new(NSMutableDictionary);
    statesMap = v14->_statesMap;
    v14->_statesMap = v17;

    v19 = objc_opt_new(NSMutableDictionary);
    geometryMap = v14->_geometryMap;
    v14->_geometryMap = v19;

    v21 = objc_opt_new(NSMutableDictionary);
    providerObserversMap = v14->_providerObserversMap;
    v14->_providerObserversMap = v21;

    v23 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    contentObservers = v14->_contentObservers;
    v14->_contentObservers = (NSHashTable *)v23;

    v25 = objc_opt_new(NSMutableSet);
    activeGroups = v14->_activeGroups;
    v14->_activeGroups = v25;

    v27 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    controllerObservers = v14->_controllerObservers;
    v14->_controllerObservers = (NSHashTable *)v27;

    objc_storeStrong((id *)&v14->_manager, a6);
    *(_BYTE *)&v14->_flags = 0;
  }

  return v14;
}

- (void)addProvider:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  unint64_t uniqueIdentifier;
  _TUIHostedViewState *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statesMap, "objectForKeyedSubscript:", v7));

  if (v8)
    -[TUIHostingController removeProviderForIdentifier:](self, "removeProviderForIdentifier:", v7);
  v9 = TUIHostingLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    v13 = 134218498;
    v14 = uniqueIdentifier;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[fid:%lu] adding provider=%@ for identifier=%@", (uint8_t *)&v13, 0x20u);
  }

  v12 = -[_TUIHostedViewState initWithController:provider:identifier:]([_TUIHostedViewState alloc], "initWithController:provider:identifier:", self, v6, v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_statesMap, "setObject:forKeyedSubscript:", v12, v7);
  -[TUIHostingController _notifyProviderObserversForIdentifier:notifyControllerObservers:](self, "_notifyProviderObserversForIdentifier:notifyControllerObservers:", v7, 1);

}

- (BOOL)hasProviderForIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statesMap, "objectForKeyedSubscript:", a3));
  v4 = v3 != 0;

  return v4;
}

- (void)_removeProviderForViewState:(id)a3
{
  NSMutableDictionary *statesMap;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  statesMap = self->_statesMap;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](statesMap, "objectForKeyedSubscript:", v5));

  v7 = v9;
  if (v6 == v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    -[TUIHostingController removeProviderForIdentifier:](self, "removeProviderForIdentifier:", v8);

    v7 = v9;
  }

}

- (void)removeProviderForIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  unint64_t uniqueIdentifier;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = TUIHostingLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    v21 = uniqueIdentifier;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[fid:%lu] remove provider for identifier=%@", buf, 0x16u);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_statesMap, "setObject:forKeyedSubscript:", 0, v4);
  -[TUIHostingController _updateGeomtry:forIdentifier:](self, "_updateGeomtry:forIdentifier:", 0, v4);
  -[TUIHostingController _notifyProviderObserversForIdentifier:notifyControllerObservers:](self, "_notifyProviderObserversForIdentifier:notifyControllerObservers:", v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](self->_hostingMap, "objectForKeyedSubscript:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupIdentifier"));

  if (v9)
  {
    -[NSMutableSet removeObject:](self->_activeGroups, "removeObject:", v9);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap reverseEnumeratorForGroup:](self->_hostingMap, "reverseEnumeratorForGroup:", v9, 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[TUIHostingController _notifyProviderObserversForIdentifier:notifyControllerObservers:](self, "_notifyProviderObserversForIdentifier:notifyControllerObservers:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), 0);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (NSSet)contentIdentifiers
{
  return -[TUIHostingMap identifiers](self->_hostingMap, "identifiers");
}

- (void)updateHostingMap:(id)a3
{
  TUIHostingMap *v5;
  TUIHostingMap *v6;
  TUIHostingMap **p_hostingMap;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSHashTable *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  unint64_t uniqueIdentifier;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];

  v5 = (TUIHostingMap *)a3;
  v6 = v5;
  p_hostingMap = &self->_hostingMap;
  if (self->_hostingMap != v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap identifiers](v5, "identifiers"));
    v9 = objc_msgSend(v8, "mutableCopy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap identifiers](*p_hostingMap, "identifiers"));
    objc_msgSend(v9, "intersectSet:", v10);

    v11 = objc_msgSend(v8, "mutableCopy");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap identifiers](*p_hostingMap, "identifiers"));
    objc_msgSend(v11, "unionSet:", v12);

    v29 = v9;
    objc_msgSend(v11, "minusSet:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap identifiers](*p_hostingMap, "identifiers"));
    v14 = objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "minusSet:", v8);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          -[NSMutableDictionary removeObjectForKey:](self->_geometryMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v19));
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v17);
    }

    objc_storeStrong((id *)&self->_hostingMap, a3);
    if (objc_msgSend(v11, "count"))
    {
      v20 = TUIHostingLog();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uniqueIdentifier = self->_feedId.uniqueIdentifier;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap identifiers](self->_hostingMap, "identifiers"));
        *(_DWORD *)buf = 134218498;
        v40 = uniqueIdentifier;
        v41 = 2112;
        v42 = v28;
        v43 = 2112;
        v44 = v11;
        _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "[fid:%lu] updated hosting map: identifiers=%@, differences=%@", buf, 0x20u);

      }
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = self->_contentObservers;
    v23 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v26), "hostingController:didChangeContentIdentifiers:", self, v11);
          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v24);
    }

  }
}

- (void)beginViewUpdates
{
  ++self->_viewUpdates;
}

- (void)endViewUpdates
{
  -[TUIHostingController endViewUpdatesNotifyDelegate:](self, "endViewUpdatesNotifyDelegate:", 1);
}

- (void)endViewUpdatesNotifyDelegate:(BOOL)a3
{
  unint64_t viewUpdates;
  unint64_t v5;
  uint64_t flags;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  id WeakRetained;

  viewUpdates = self->_viewUpdates;
  if (viewUpdates)
  {
    v5 = viewUpdates - 1;
    self->_viewUpdates = v5;
    if (!v5)
    {
      flags = (uint64_t)self->_flags;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
      {
        *(_BYTE *)&self->_flags = flags & 0xFD;
        if ((flags & 1) == 0)
        {
          v7 = a3;
          v8 = TUIHostingLog();
          v9 = objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            sub_17E648();

          *(_BYTE *)&self->_flags |= 1u;
          if (v7)
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "hostingControllerGeometryUpdated:", self);

          }
        }
      }
    }
  }
}

- (void)reset
{
  void *v3;
  TUIHostingMap *hostingMap;
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[NSMutableDictionary removeAllObjects](self->_geometryMap, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap identifiers](self->_hostingMap, "identifiers"));
  hostingMap = self->_hostingMap;
  self->_hostingMap = 0;

  if (objc_msgSend(v3, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_contentObservers;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "hostingController:didChangeContentIdentifiers:", self, v3, (_QWORD)v10);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  *(_BYTE *)&self->_flags &= 0xFCu;
  -[TUIHostingController _notifyGeometryUpdated](self, "_notifyGeometryUpdated", (_QWORD)v10);

}

- (BOOL)_shouldVendViewForIdentifier:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_activeGroups, "containsObject:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap reverseEnumeratorForGroup:](self->_hostingMap, "reverseEnumeratorForGroup:", v7, 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if (v14 == v6
          || (objc_msgSend(v6, "isEqual:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13)) & 1) != 0)
        {
          break;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statesMap, "objectForKeyedSubscript:", v14));

        if (v15)
        {
          v8 = 0;
          goto LABEL_16;
        }
        if (v11 == (id)++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          v8 = 1;
          if (v11)
            goto LABEL_5;
          goto LABEL_16;
        }
      }
    }
    v8 = 1;
LABEL_16:

  }
  return v8;
}

- (id)viewStateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  _TUIHostedFactoryViewState *v8;
  void *v9;
  _TUIHostedFactoryViewState *v10;
  void *v11;
  void *v12;
  void *v13;
  UIViewController *viewController;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager viewRegistry](self->_manager, "viewRegistry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
  v7 = objc_msgSend(v5, "useHostedViewFactoryForType:", v6);

  if (v7)
  {
    v8 = (_TUIHostedFactoryViewState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierWithoutModelIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_reuseMap, "objectForKeyedSubscript:", v8));
    if (v9)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_reuseMap, "removeObjectForKey:", v8);
      v10 = v9;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager viewRegistry](self->_manager, "viewRegistry"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hostedViewFactoryForType:", v12));

      viewController = self->_viewController;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parameters"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewController:hostedViewWithType:identifier:parameters:", viewController, v15, v16, v17));

      if (v18)
        v10 = -[_TUIHostedFactoryViewState initWithIdentifier:view:flags:]([_TUIHostedFactoryViewState alloc], "initWithIdentifier:view:flags:", v4, v18, objc_msgSend(v13, "hostedViewFlags"));
      else
        v10 = 0;

    }
  }
  else
  {
    if (v4)
      v8 = (_TUIHostedFactoryViewState *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statesMap, "objectForKeyedSubscript:", v4));
    else
      v8 = 0;
    if (-[_TUIHostedFactoryViewState isAvailable](v8, "isAvailable"))
    {
      v8 = v8;
      v10 = v8;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)updateVisible:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3;
  if (a4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_statesMap, "objectForKeyedSubscript:", a4));
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v5, "setVisible:", v4);

}

- (void)updateGeometryForViewState:(id)a3 requestedSize:(CGSize)a4 insets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  TUIHostingGeometry *v18;
  void *v19;
  double v20;
  double v21;
  id v22;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.height;
  width = a4.width;
  v22 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](self->_hostingMap, "objectForKeyedSubscript:", v12));
  if (!objc_msgSend(v13, "presentation"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
    v15 = UIEdgeInsetsZero.left;
    v20 = UIEdgeInsetsZero.right;
    v21 = UIEdgeInsetsZero.bottom;
    objc_msgSend(v14, "bounds");
    v18 = -[TUIHostingGeometry initWithRequestedSize:layoutSize:erasableInsets:]([TUIHostingGeometry alloc], "initWithRequestedSize:layoutSize:erasableInsets:", width, height, left + right + v16, top + bottom + v17, UIEdgeInsetsZero.top, v15, v21, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_geometryMap, "objectForKeyedSubscript:", v12));
    if ((objc_msgSend(v19, "isEqualToGeometry:", v18) & 1) == 0)
      -[TUIHostingController _updateGeomtry:forIdentifier:](self, "_updateGeomtry:forIdentifier:", v18, v12);

  }
}

- (void)_updateGeomtry:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  unint64_t uniqueIdentifier;
  int v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = TUIHostingLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    v11 = 134218498;
    v12 = uniqueIdentifier;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "[fid:%lu] updated geometry=%@ for identifier=%@", (uint8_t *)&v11, 0x20u);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_geometryMap, "setObject:forKeyedSubscript:", v6, v7);
  -[TUIHostingController _notifyGeometryUpdated](self, "_notifyGeometryUpdated");

}

- (void)_notifyGeometryUpdated
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id WeakRetained;

  if (self->_viewUpdates)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      v3 = TUIHostingLog();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        sub_17E708();

      *(_BYTE *)&self->_flags |= 2u;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v5 = TUIHostingLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_17E6A8();

    *(_BYTE *)&self->_flags |= 1u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "hostingControllerGeometryUpdated:", self);

  }
}

- (BOOL)needsGeometryUpdateWithOldTraitCollection:(id)a3 newTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));
  if (v7 != v8
    || (v9 = objc_msgSend(v5, "horizontalSizeClass"), v9 != objc_msgSend(v6, "horizontalSizeClass"))
    || (v10 = objc_msgSend(v5, "verticalSizeClass"), v10 != objc_msgSend(v6, "verticalSizeClass"))
    || (v11 = objc_msgSend(v5, "layoutDirection"), v11 != objc_msgSend(v6, "layoutDirection")))
  {

    goto LABEL_8;
  }
  v12 = objc_msgSend(v5, "legibilityWeight");
  v13 = objc_msgSend(v6, "legibilityWeight");

  if (v12 != v13)
  {
LABEL_8:
    v14 = 1;
    goto LABEL_9;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (void)updateTraitCollection:(id)a3
{
  unsigned int v5;
  id v6;

  v6 = a3;
  v5 = -[TUIHostingController needsGeometryUpdateWithOldTraitCollection:newTraitCollection:](self, "needsGeometryUpdateWithOldTraitCollection:newTraitCollection:", self->_traitCollection);
  objc_storeStrong((id *)&self->_traitCollection, a3);
  if (v5)
  {
    -[NSMutableDictionary removeAllObjects](self->_geometryMap, "removeAllObjects");
    -[TUIHostingController _notifyGeometryUpdated](self, "_notifyGeometryUpdated");
  }

}

- (id)newGeometryMap
{
  TUIHostingGeometryMap *v3;
  NSMutableDictionary *geometryMap;
  void *v5;
  TUIHostingGeometryMap *v6;
  id v7;
  NSObject *v8;

  if (-[NSMutableDictionary count](self->_geometryMap, "count"))
  {
    v3 = [TUIHostingGeometryMap alloc];
    geometryMap = self->_geometryMap;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap identifiers](self->_hostingMap, "identifiers"));
    v6 = -[TUIHostingGeometryMap initWithMap:identifiers:](v3, "initWithMap:identifiers:", geometryMap, v5);

  }
  else
  {
    v6 = 0;
  }
  v7 = TUIHostingLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_17E768();

  return v6;
}

- (void)resetGeometryUpdatedFlag
{
  *(_BYTE *)&self->_flags &= ~1u;
}

- (BOOL)geometryUpdatedFlag
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)addProviderObserver:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  unint64_t uniqueIdentifier;
  void *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = TUIHostingLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    v12 = 134218498;
    v13 = uniqueIdentifier;
    v14 = 2048;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[fid:%lu] add observer=%p for identifier=%@", (uint8_t *)&v12, 0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_providerObserversMap, "objectForKeyedSubscript:", v7));
  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_providerObserversMap, "setObject:forKeyedSubscript:", v11, v7);
  }
  objc_msgSend(v11, "addObject:", v6);

}

- (void)removeProviderObserver:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  unint64_t uniqueIdentifier;
  void *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = TUIHostingLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    v12 = 134218498;
    v13 = uniqueIdentifier;
    v14 = 2048;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[fid:%lu] remove observer=%p for identifier=%@", (uint8_t *)&v12, 0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_providerObserversMap, "objectForKeyedSubscript:", v7));
  objc_msgSend(v11, "removeObject:", v6);
  if (v11 && !objc_msgSend(v11, "count"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_providerObserversMap, "setObject:forKeyedSubscript:", 0, v7);

}

- (void)_notifyProviderObserversForIdentifier:(id)a3 notifyControllerObservers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  unint64_t uniqueIdentifier;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  unint64_t v32;
  __int16 v33;
  id v34;

  v4 = a4;
  v6 = a3;
  v7 = TUIHostingLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    v32 = uniqueIdentifier;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[fid:%lu] notify observers for identifier=%@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_providerObserversMap, "objectForKeyedSubscript:", v6));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v15), "hostingProviderUpdatedForIdentifier:", v6);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v13);
  }

  if (v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_controllerObservers, "allObjects", 0));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), "hostingControllerProvidersUpdated:", self);
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

  }
}

- (void)updatePopoverLayoutForViewState:(id)a3 superview:(id)a4
{
  -[TUIHostingController _configurePopoverLayoutForViewState:superview:shouldPresentViewController:](self, "_configurePopoverLayoutForViewState:superview:shouldPresentViewController:", a3, a4, 0);
}

- (void)_presentPopoverLayoutForViewState:(id)a3 superview:(id)a4
{
  -[TUIHostingController _configurePopoverLayoutForViewState:superview:shouldPresentViewController:](self, "_configurePopoverLayoutForViewState:superview:shouldPresentViewController:", a3, a4, 1);
}

- (void)_configurePopoverLayoutForViewState:(id)a3 superview:(id)a4 shouldPresentViewController:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  TUIHostingMap *hostingMap;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  unint64_t uniqueIdentifier;
  _QWORD v30[4];
  NSObject *v31;
  TUIHostingController *v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  hostingMap = self->_hostingMap;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](hostingMap, "objectForKeyedSubscript:", v11));

  if (objc_msgSend(v12, "presentation") == (char *)&dword_0 + 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewController"));
    v14 = objc_msgSend(v13, "isBeingPresented");

    if ((v14 & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingController _determineSourceViewFromState:currentView:](self, "_determineSourceViewFromState:currentView:", v8, v9));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "popoverPresentationController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sourceView"));

      if (!v15 || v15 == v18)
      {
        v28 = TUIHostingLog();
        v27 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          uniqueIdentifier = self->_feedId.uniqueIdentifier;
          *(_DWORD *)buf = 134218498;
          v34 = uniqueIdentifier;
          v35 = 2112;
          v36 = v15;
          v37 = 2112;
          v38 = v18;
          _os_log_debug_impl(&dword_0, v27, OS_LOG_TYPE_DEBUG, "[fid:%lu] no need to update layout sourceView=%@ oldSourceView=%@", buf, 0x20u);
        }
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewController"));
        objc_msgSend(v19, "setModalPresentationStyle:", 7);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "popoverPresentationController"));
        objc_msgSend(v21, "setDelegate:", v8);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewController"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "popoverPresentationController"));
        objc_msgSend(v23, "setSourceView:", v15);

        v24 = -[TUIHostingController _popoverArrowDirectionFromProperties:](self, "_popoverArrowDirectionFromProperties:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewController"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "popoverPresentationController"));
        objc_msgSend(v26, "setPermittedArrowDirections:", v24);

        if (!v5)
        {
LABEL_10:

          goto LABEL_11;
        }
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_C2C98;
        v30[3] = &unk_23D7D0;
        v31 = v8;
        v32 = self;
        -[TUIHostingController _finishOngoingModalTransitionAnimationsWithCompletion:](self, "_finishOngoingModalTransitionAnimationsWithCompletion:", v30);
        v27 = v31;
      }

      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)runAppearanceTransitionForViewState:(id)a3 superview:(id)a4
{
  id v6;
  TUIHostingMap *hostingMap;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v13 = a3;
  v6 = a4;
  hostingMap = self->_hostingMap;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](hostingMap, "objectForKeyedSubscript:", v8));

  if (objc_msgSend(v9, "presentation"))
  {
    if (objc_msgSend(v9, "presentation") == (char *)&dword_0 + 1)
      -[TUIHostingController _presentPopoverLayoutForViewState:superview:](self, "_presentPopoverLayoutForViewState:superview:", v13, v6);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    objc_msgSend(v10, "setAutoresizingMask:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewController"));
    objc_msgSend(v11, "beginAppearanceTransition:animated:", 1, 0);

    objc_msgSend(v6, "addSubview:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewController"));
    objc_msgSend(v12, "endAppearanceTransition");

    if ((objc_msgSend(v13, "previouslyAppeared") & 1) == 0)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_C2F4C;
      v14[3] = &unk_23E2C8;
      v14[4] = self;
      v15 = v13;
      v16 = v10;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);

    }
  }

}

- (void)runAppearanceTransitionForViewState:(id)a3 barButtonItem:(id)a4
{
  id v6;
  id v7;
  TUIHostingMap *hostingMap;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  _QWORD v13[4];
  id v14;
  id v15;
  TUIHostingController *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  hostingMap = self->_hostingMap;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](hostingMap, "objectForKeyedSubscript:", v9));

  if (objc_msgSend(v10, "presentation") == (char *)&dword_0 + 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewController"));
    v12 = objc_msgSend(v11, "isBeingPresented");

    if ((v12 & 1) == 0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_C30B8;
      v13[3] = &unk_23E620;
      v14 = v6;
      v15 = v7;
      v16 = self;
      v17 = v10;
      -[TUIHostingController _finishOngoingModalTransitionAnimationsWithCompletion:](self, "_finishOngoingModalTransitionAnimationsWithCompletion:", v13);

    }
  }

}

- (id)_determineSourceViewFromState:(id)a3 currentView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](self->_hostingMap, "objectForKeyedSubscript:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "designatedIdentifier"));
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[TUIHostingController _reusableViewForRefId:inCurrentView:](self, "_reusableViewForRefId:inCurrentView:", v9, v6));
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v6;
    v13 = v12;

  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (id)_reusableViewForRefId:(id)a3 inCurrentView:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  v8 = TUIProtocolCast(&OBJC_PROTOCOL___TUIReusableRenderView, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutAttributes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "refId"));
    v13 = objc_msgSend(v12, "isEqualToString:", v6);

    if (v13)
    {
      v14 = v7;
      goto LABEL_15;
    }
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "descendentViewWithRefId:", v6));
    if (v14)
      goto LABEL_15;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews", 0));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_claimAutoreleasedReturnValue(-[TUIHostingController _reusableViewForRefId:inCurrentView:](self, "_reusableViewForRefId:inCurrentView:", v6, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v19)));
        if (v20)
        {
          v14 = (id)v20;

          goto LABEL_15;
        }
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v17)
        continue;
      break;
    }
  }

  v14 = 0;
LABEL_15:

  return v14;
}

- (void)_finishOngoingModalTransitionAnimationsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](self->_viewController, "presentedViewController"));
    if (((objc_msgSend(v5, "isBeingDismissed") & 1) != 0
       || objc_msgSend(v5, "isBeingPresented"))
      && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator")), v6, v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_C3600;
      v8[3] = &unk_240F70;
      v9 = v4;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", &stru_240F48, v8);

    }
    else
    {
      v4[2](v4);
    }

  }
}

- (void)runAppearanceAnimationIfNeededForViewState:(id)a3
{
  id v4;
  TUIHostingMap *hostingMap;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  unint64_t uniqueIdentifier;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  hostingMap = self->_hostingMap;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](hostingMap, "objectForKeyedSubscript:", v6));

  if (!objc_msgSend(v7, "presentation"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    if ((objc_msgSend(v4, "previouslyAppeared") & 1) == 0)
    {
      objc_msgSend(v4, "setPreviouslyAppeared:", 1);
      v9 = TUIHostingLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uniqueIdentifier = self->_feedId.uniqueIdentifier;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        *(_DWORD *)buf = 134218498;
        v19 = uniqueIdentifier;
        v20 = 2112;
        v21 = v13;
        v22 = 2048;
        v23 = v8;
        _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "[fid:%lu] show view for identifier=%@ view=%p", buf, 0x20u);

      }
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_C381C;
      v16[3] = &unk_23D938;
      v11 = v8;
      v17 = v11;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_C3888;
      v14[3] = &unk_23D938;
      v15 = v11;
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 32, v14, 0, 0.3, 0.1, 0.7, 0.1);

    }
  }

}

- (void)runDisappearanceTransitionForViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t uniqueIdentifier;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  unint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentViewController"));

    if (v8)
    {
      v9 = +[TUIFeedView areFeedUpdatesAnimated](TUIFeedView, "areFeedUpdatesAnimated");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
      v11 = v10;
      if (!v9)
      {
        objc_msgSend(v10, "beginAppearanceTransition:animated:", 0, 0);

        objc_msgSend(v4, "recycleViewWithController:", self);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
        objc_msgSend(v24, "endAppearanceTransition");

        goto LABEL_12;
      }
      objc_msgSend(v10, "beginAppearanceTransition:animated:", 0, 1);

      v12 = TUIHostingLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uniqueIdentifier = self->_feedId.uniqueIdentifier;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        *(_DWORD *)buf = 134218498;
        v37 = uniqueIdentifier;
        v38 = 2112;
        v39 = v26;
        v40 = 2048;
        v41 = v5;
        _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "[fid:%lu] removing view for identifier=%@ view=%p", buf, 0x20u);

      }
      v14 = objc_alloc((Class)UIViewPropertyAnimator);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_C3C80;
      v34[3] = &unk_23D938;
      v15 = v5;
      v35 = v15;
      v16 = objc_msgSend(v14, "initWithDuration:controlPoint1:controlPoint2:animations:", v34, 0.2, 0.33, 0.0, 0.67, 1.0);
      v17 = objc_alloc((Class)UIViewPropertyAnimator);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_C3C8C;
      v32[3] = &unk_23D938;
      v18 = v15;
      v33 = v18;
      v19 = objc_msgSend(v17, "initWithDuration:controlPoint1:controlPoint2:animations:", v32, 0.28, 0.33, 0.0, 0.83, 0.76);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_C3CE0;
      v29[3] = &unk_240F98;
      v30 = v18;
      v31 = v4;
      objc_msgSend(v19, "addCompletion:", v29);
      objc_msgSend(v16, "startAnimation");
      objc_msgSend(v19, "startAnimation");

      v20 = v35;
      goto LABEL_10;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentingViewController"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      -[TUIHostingController updateVisible:forIdentifier:](self, "updateVisible:forIdentifier:", 0, v23);

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_C3D24;
      v27[3] = &unk_23D938;
      v28 = v4;
      -[TUIHostingController _finishOngoingModalTransitionAnimationsWithCompletion:](self, "_finishOngoingModalTransitionAnimationsWithCompletion:", v27);
      v20 = v28;
LABEL_10:

    }
  }
  else
  {
    objc_msgSend(v4, "recycleViewWithController:", self);
  }
LABEL_12:

}

- (void)didEndDisplayForViewState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));
  objc_msgSend(v5, "beginAppearanceTransition:animated:", 0, 0);

  objc_msgSend(v4, "recycleViewWithController:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewController"));

  objc_msgSend(v6, "endAppearanceTransition");
}

- (void)makeAvailableForReuse:(id)a3
{
  id v4;
  NSMutableDictionary *reuseMap;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  reuseMap = self->_reuseMap;
  if (!reuseMap)
  {
    v6 = objc_opt_new(NSMutableDictionary);
    v7 = self->_reuseMap;
    self->_reuseMap = v6;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_C3EF8;
    v10[3] = &unk_23D938;
    v10[4] = self;
    TUIDispatchAsyncViaRunLoop((uint64_t)v10);
    reuseMap = self->_reuseMap;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierWithoutModelIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](reuseMap, "setObject:forKeyedSubscript:", v4, v9);

}

- (void)addContentObserver:(id)a3
{
  -[NSHashTable addObject:](self->_contentObservers, "addObject:", a3);
}

- (void)removeContentObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_contentObservers, "removeObject:", a3);
}

- (id)_groupIdentifierForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](self->_hostingMap, "objectForKeyedSubscript:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupIdentifier"));

  return v4;
}

- (void)_activateGroup:(id)a3
{
  -[NSMutableSet addObject:](self->_activeGroups, "addObject:", a3);
}

- (id)_propertiesForIdentifier:(id)a3
{
  return -[TUIHostingMap objectForKeyedSubscript:](self->_hostingMap, "objectForKeyedSubscript:", a3);
}

- (void)updateFrameIfNeeded:(BOOL)a3 forViewState:(id)a4 requestedSize:(CGSize)a5 insets:(UIEdgeInsets)a6
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  _BOOL8 v12;
  id v14;
  TUIHostingMap *hostingMap;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  unsigned __int8 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat x;
  CGFloat y;
  CGFloat v34;
  CGFloat v35;
  double v36;
  unint64_t uniqueIdentifier;
  void *v38;
  void *v39;
  NSString *v40;
  void *v41;
  NSString *v42;
  void *v43;
  int v44;
  unint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  CGSize v56;
  CGRect v57;
  CGRect v58;
  UIEdgeInsets v59;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  height = a5.height;
  width = a5.width;
  v12 = a3;
  v14 = a4;
  hostingMap = self->_hostingMap;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHostingMap objectForKeyedSubscript:](hostingMap, "objectForKeyedSubscript:", v16));
  v18 = objc_msgSend(v17, "presentation");

  if (!v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    v20 = TUIHostingLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uniqueIdentifier = self->_feedId.uniqueIdentifier;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
      v56.width = width;
      v56.height = height;
      v40 = NSStringFromCGSize(v56);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v59.top = top;
      v59.left = left;
      v59.bottom = bottom;
      v59.right = right;
      v42 = NSStringFromUIEdgeInsets(v59);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v44 = 134219266;
      v45 = uniqueIdentifier;
      v46 = 2112;
      v47 = v19;
      v48 = 2112;
      v49 = v38;
      v50 = 2112;
      v51 = v39;
      v52 = 2112;
      v53 = v41;
      v54 = 2112;
      v55 = v43;
      _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "[fid:%lu] updateFrameIfNeeded view=%@ identifier=%@ needsUpdate=%@ requestedSize=%@ insets=%@", (uint8_t *)&v44, 0x3Eu);

    }
    if (v12)
    {
      v22 = objc_msgSend(v14, "flags");
      v23 = fmax(width - left - right, 0.0);
      v24 = fmax(height - top - bottom, 0.0);
      if ((v22 & 1) != 0)
        v25 = 1.79769313e308;
      else
        v25 = v23;
      if ((v22 & 2) != 0)
        v26 = 1.79769313e308;
      else
        v26 = v24;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
      objc_msgSend(v27, "sizeThatFits:", v25, v26);
      v29 = v28;
      v31 = v30;

      objc_msgSend(v19, "setFrame:", left, top, v29, v31);
    }
    else
    {
      objc_msgSend(v19, "bounds");
      x = v57.origin.x;
      y = v57.origin.y;
      v34 = v57.size.width;
      v35 = v57.size.height;
      v36 = left + CGRectGetMidX(v57);
      v58.origin.x = x;
      v58.origin.y = y;
      v58.size.width = v34;
      v58.size.height = v35;
      objc_msgSend(v19, "setCenter:", v36, top + CGRectGetMidY(v58));
    }

  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_controllerObservers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_controllerObservers, "removeObject:", a3);
}

- (unint64_t)_popoverArrowDirectionFromProperties:(id)a3
{
  char *v3;

  v3 = (char *)objc_msgSend(a3, "arrowDirection");
  if ((unint64_t)(v3 - 1) > 3)
    return 15;
  else
    return qword_22F4A8[(_QWORD)(v3 - 1)];
}

- (NSMutableDictionary)statesMap
{
  return self->_statesMap;
}

- (TUIHostingMap)hostingMap
{
  return self->_hostingMap;
}

- (NSMutableDictionary)geometryMap
{
  return self->_geometryMap;
}

- (NSMutableDictionary)providerObserversMap
{
  return self->_providerObserversMap;
}

- (NSHashTable)contentObservers
{
  return self->_contentObservers;
}

- (NSMutableSet)activeGroups
{
  return self->_activeGroups;
}

- (NSHashTable)controllerObservers
{
  return self->_controllerObservers;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (TUIManager)manager
{
  return self->_manager;
}

- (NSMutableDictionary)reuseMap
{
  return self->_reuseMap;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (TUIHostingControllerDelegate)delegate
{
  return (TUIHostingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reuseMap, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_controllerObservers, 0);
  objc_storeStrong((id *)&self->_activeGroups, 0);
  objc_storeStrong((id *)&self->_contentObservers, 0);
  objc_storeStrong((id *)&self->_providerObserversMap, 0);
  objc_storeStrong((id *)&self->_geometryMap, 0);
  objc_storeStrong((id *)&self->_hostingMap, 0);
  objc_storeStrong((id *)&self->_statesMap, 0);
}

@end

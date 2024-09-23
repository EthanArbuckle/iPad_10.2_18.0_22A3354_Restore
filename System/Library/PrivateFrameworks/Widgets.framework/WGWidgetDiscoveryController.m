@implementation WGWidgetDiscoveryController

+ (int64_t)layoutModeForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  uint64_t v6;
  int64_t v7;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 3;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v7 = 1;
  if (width <= height)
    return 2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  else
    return v7;
}

- (WGWidgetDiscoveryController)init
{
  WGWidgetDiscoveryController *v2;
  NSMutableSet *v3;
  NSMutableSet *defaultEnabledIDs;
  WGWidgetPersistentStateController *v5;
  WGWidgetPersistentStateController *persistentStateController;
  WGWidgetStatsController *v7;
  WGWidgetStatsController *statsController;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WGWidgetDiscoveryController;
  v2 = -[WGWidgetDiscoveryController init](&v12, sel_init);
  if (v2)
  {
    WGRegisterWidgetsLogging();
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    defaultEnabledIDs = v2->_defaultEnabledIDs;
    v2->_defaultEnabledIDs = v3;

    v5 = -[WGWidgetPersistentStateController initWithDiscoveryController:]([WGWidgetPersistentStateController alloc], "initWithDiscoveryController:", v2);
    persistentStateController = v2->_persistentStateController;
    v2->_persistentStateController = v5;

    v7 = -[WGWidgetStatsController initWithDiscoveryController:]([WGWidgetStatsController alloc], "initWithDiscoveryController:", v2);
    statsController = v2->_statsController;
    v2->_statsController = v7;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__widgetViewControllerRequestsAdd_, CFSTR("WGWidgetViewControllerAddRequestNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__widgetViewControllerDidRemoveSnapshot_, CFSTR("WGWidgetViewControllerDidRemoveSnapshotNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__widgetListEditViewControllerWillDisappear_, CFSTR("WGWidgetListEditViewControllerWillDisappear"), 0);
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__applicationIconChanged_, CFSTR("com.apple.LaunchServices.applicationIconChanged"), 0);

  }
  return v2;
}

- (unint64_t)visibleWidgetsCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WGWidgetDiscoveryController _orderedVisibleIdentifiersForTodayGroup](self, "_orderedVisibleIdentifiersForTodayGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[WGWidgetDiscoveryController _orderedVisibleIdentifiersForWidgetGroup](self, "_orderedVisibleIdentifiersForWidgetGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;

  return v6;
}

- (void)setWidgetSnapshotTimestampsEnabled:(BOOL)a3
{
  +[WGWidgetHostingViewController setWidgetSnapshotTimestampsEnabled:](WGWidgetHostingViewController, "setWidgetSnapshotTimestampsEnabled:", a3);
}

- (void)addDiscoveryObserver:(id)a3
{
  id v4;
  NSPointerArray *observers;
  NSPointerArray *v6;
  NSPointerArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
      v6 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSPointerArray addPointer:](observers, "addPointer:", v8);
    v4 = v8;
  }

}

- (void)removeDiscoveryObserver:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    -[NSPointerArray compact](self->_observers, "compact");
    if (-[NSPointerArray count](self->_observers, "count"))
    {
      v4 = 0;
      while (-[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v4) != v5)
      {
        if (++v4 >= -[NSPointerArray count](self->_observers, "count"))
          goto LABEL_8;
      }
      -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v4);
    }
  }
LABEL_8:

}

- (BOOL)_isApplicationLockedOutWithProxy:(id)a3
{
  return a3 && objc_msgSend(a3, "deviceManagementPolicy") != 0;
}

- (void)_updateLockedOutStateForWidget:(id)a3 withContainingAppProxy:(id)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = -[WGWidgetDiscoveryController _isApplicationLockedOutWithProxy:](self, "_isApplicationLockedOutWithProxy:", v6);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BE60C48];
    if (v6)
    {
      objc_msgSend(v6, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "messageForApplicationName:style:", v9, 2);
    }
    else
    {
      objc_msgSend(v11, "widgetIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "messageForBundleIdentifier:style:", v9, 2);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v11, "setLockedOut:withExplanation:", v7, v10);

}

- (void)_updateLockedOutStateForWidget:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WGContainingBundleProxyForWidgetWithBundleIdentifer((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "bundleType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC14E8]) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC1508]) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC1518]))
    {
      v7 = v5;
    }
    else
    {
      v7 = 0;
    }
    -[WGWidgetDiscoveryController _updateLockedOutStateForWidget:withContainingAppProxy:](self, "_updateLockedOutStateForWidget:withContainingAppProxy:", v8, v7);

  }
}

- (id)_newWidgetWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WGWidgetHostingViewController *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_identifiersToDatums, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMutableDictionary objectForKey:](self->_identifiersToWidgetInfos, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = -[WGWidgetHostingViewController initWithWidgetInfo:delegate:host:]([WGWidgetHostingViewController alloc], "initWithWidgetInfo:delegate:host:", v9, v7, self);
        -[WGWidgetDiscoveryController _updateLockedOutStateForWidget:](self, "_updateLockedOutStateForWidget:", v10);
      }
      else
      {
        v12 = WGLogWidgets;
        if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138543362;
          v15 = v6;
          _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "Couldn't find widget info for widget with ID '%{public}@'", (uint8_t *)&v14, 0xCu);
        }
        v10 = 0;
      }

    }
    else
    {
      v11 = WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = v6;
        _os_log_impl(&dword_2172E1000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't find widget datum for widget with ID '%{public}@'", (uint8_t *)&v14, 0xCu);
      }
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)widgetWithIdentifier:(id)a3 delegate:(id)a4 forRequesterWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *widgetIDsToWidgets;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
    -[WGWidgetDiscoveryController widgetWithIdentifier:delegate:forRequesterWithIdentifier:].cold.1();
  if (objc_msgSend(v8, "length") && objc_msgSend(v10, "length"))
  {
    widgetIDsToWidgets = self->_widgetIDsToWidgets;
    if (!widgetIDsToWidgets)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v13 = self->_widgetIDsToWidgets;
      self->_widgetIDsToWidgets = v12;

      widgetIDsToWidgets = self->_widgetIDsToWidgets;
    }
    -[NSMutableDictionary objectForKey:](widgetIDsToWidgets, "objectForKey:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v14 = -[WGWidgetDiscoveryController _newWidgetWithIdentifier:delegate:](self, "_newWidgetWithIdentifier:delegate:", v8, v9);
      if (v14)
        -[NSMutableDictionary setObject:forKey:](self->_widgetIDsToWidgets, "setObject:forKey:", v14, v8);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_orderedEnabledIdentifiersForGroup:(id)a3
{
  int v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "isEqual:", CFSTR("WidgetGroup"));
  v5 = 64;
  if (v4)
    v5 = 80;
  return *(id *)((char *)&self->super.isa + v5);
}

- (id)_orderedVisibleIdentifiersForTodayGroup
{
  NSArray *orderedVisibleTodayIdentifiers;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[5];

  orderedVisibleTodayIdentifiers = self->_orderedVisibleTodayIdentifiers;
  if (!orderedVisibleTodayIdentifiers)
  {
    -[WGWidgetDiscoveryController _orderedEnabledIdentifiersForGroup:](self, "_orderedEnabledIdentifiersForGroup:", CFSTR("TodayGroup"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__WGWidgetDiscoveryController__orderedVisibleIdentifiersForTodayGroup__block_invoke;
    v9[3] = &unk_24D731868;
    v9[4] = self;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_orderedVisibleTodayIdentifiers;
    self->_orderedVisibleTodayIdentifiers = v6;

    orderedVisibleTodayIdentifiers = self->_orderedVisibleTodayIdentifiers;
  }
  return orderedVisibleTodayIdentifiers;
}

uint64_t __70__WGWidgetDiscoveryController__orderedVisibleIdentifiersForTodayGroup__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "doesWidgetWithIdentifierHaveContent:", a2);
}

- (id)_orderedVisibleIdentifiersForWidgetGroup
{
  NSArray *orderedVisibleWidgetsIdentifiers;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[5];

  orderedVisibleWidgetsIdentifiers = self->_orderedVisibleWidgetsIdentifiers;
  if (!orderedVisibleWidgetsIdentifiers)
  {
    -[WGWidgetDiscoveryController _orderedEnabledIdentifiersForGroup:](self, "_orderedEnabledIdentifiersForGroup:", CFSTR("WidgetGroup"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __71__WGWidgetDiscoveryController__orderedVisibleIdentifiersForWidgetGroup__block_invoke;
    v9[3] = &unk_24D731868;
    v9[4] = self;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_orderedVisibleWidgetsIdentifiers;
    self->_orderedVisibleWidgetsIdentifiers = v6;

    orderedVisibleWidgetsIdentifiers = self->_orderedVisibleWidgetsIdentifiers;
  }
  return orderedVisibleWidgetsIdentifiers;
}

uint64_t __71__WGWidgetDiscoveryController__orderedVisibleIdentifiersForWidgetGroup__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "doesWidgetWithIdentifierHaveContent:", a2);
}

- (void)invalidateVisibleIdentifiers
{
  -[WGWidgetDiscoveryController _invalidateVisibleIdentifiersForGroup:](self, "_invalidateVisibleIdentifiersForGroup:", CFSTR("TodayGroup"));
  -[WGWidgetDiscoveryController _notifyObserversOfSignificantWidgetsChange](self, "_notifyObserversOfSignificantWidgetsChange");
}

- (void)_invalidateVisibleIdentifiersForGroup:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", CFSTR("TodayGroup")) & 1) != 0)
  {
    v4 = 72;
LABEL_5:
    v5 = *(Class *)((char *)&self->super.isa + v4);
    *(Class *)((char *)&self->super.isa + v4) = 0;

    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqual:", CFSTR("WidgetGroup")))
  {
    v4 = 88;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_orderedVisibleIdentifiersForGroup:(id)a3
{
  if ((objc_msgSend(a3, "isEqual:", CFSTR("WidgetGroup")) & 1) != 0)
    -[WGWidgetDiscoveryController _orderedVisibleIdentifiersForWidgetGroup](self, "_orderedVisibleIdentifiersForWidgetGroup");
  else
    -[WGWidgetDiscoveryController _orderedVisibleIdentifiersForTodayGroup](self, "_orderedVisibleIdentifiersForTodayGroup");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_disabledIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[NSMutableDictionary allKeys](self->_identifiersToDatums, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__WGWidgetDiscoveryController__disabledIdentifiers__block_invoke;
  v7[3] = &unk_24D731868;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __51__WGWidgetDiscoveryController__disabledIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isElementWithIdentifierEnabled:", a2) ^ 1;
}

- (id)_orderedEnabledWidgetIdentifiersForGroup:(id)a3 includingNoContent:(BOOL)a4
{
  if (a4)
    -[WGWidgetDiscoveryController _orderedEnabledIdentifiersForGroup:](self, "_orderedEnabledIdentifiersForGroup:", a3);
  else
    -[WGWidgetDiscoveryController _orderedVisibleIdentifiersForGroup:](self, "_orderedVisibleIdentifiersForGroup:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)visibleWidgetIdentifiersForGroup:(id)a3
{
  return -[WGWidgetDiscoveryController _orderedEnabledWidgetIdentifiersForGroup:includingNoContent:](self, "_orderedEnabledWidgetIdentifiersForGroup:includingNoContent:", a3, 0);
}

- (id)enabledWidgetIdentifiersForAllGroups
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController _orderedEnabledIdentifiersForGroup:](self, "_orderedEnabledIdentifiersForGroup:", CFSTR("TodayGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObjectsFromArray:", v4);
  -[WGWidgetDiscoveryController _orderedEnabledIdentifiersForGroup:](self, "_orderedEnabledIdentifiersForGroup:", CFSTR("WidgetGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (void)setHasContent:(BOOL)a3 forWidgetWithIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "length"))
  {
    if (!a3)
    {
      -[NSMutableDictionary objectForKey:](self->_widgetIDsToWidgets, "objectForKey:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateCachedSnapshotWithCompletionHandler:", 0);

    }
    v7 = -[WGWidgetDiscoveryController _updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:](self, "_updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:", v8, 0, 1, 0, 1);
  }

}

- (int64_t)userSpecifiedDisplayModeForWidgetWithIdentifier:(id)a3
{
  return WGTodayViewArchiveGetDisplayModeForIdentifier(self->_archive, a3);
}

- (void)setUserSpecifiedDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4
{
  WGTodayViewArchiveSetDisplayModeForIdentifier(self->_archive, a4, a3, self->_archiveWriteQueue);
}

- (int64_t)largestAvailableDisplayModeForWidgetWithIdentifier:(id)a3
{
  return -[WGWidgetPersistentStateController largestAvailableDisplayModeForWidgetWithIdentifier:](self->_persistentStateController, "largestAvailableDisplayModeForWidgetWithIdentifier:", a3);
}

- (void)setLargestAvailableDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4
{
  -[WGWidgetPersistentStateController setLargestAvailableDisplayMode:forWidgetWithIdentifier:](self->_persistentStateController, "setLargestAvailableDisplayMode:forWidgetWithIdentifier:", a3, a4);
}

- (void)_externalSourceRequestsInsertionOfWidgetWithIdentifier:(id)a3 insertAtTop:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_identifiersToDatums, "objectForKey:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WGWidgetDiscoveryController _updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:](self, "_updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:", v8, -[WGWidgetDiscoveryController _setEnabled:forElementWithIdentifier:](self, "_setEnabled:forElementWithIdentifier:", 1, v8), 0, v4, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        -[WGWidgetDiscoveryController _defaultGroupForWidgetWithIdentifier:](self, "_defaultGroupForWidgetWithIdentifier:", v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      WGTodayViewArchiveSetKnownForIdentifier(self->_archive, v8, 0);
      WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, self->_orderedEnabledTodayIdentifiers, v7, self->_archiveWriteQueue);

    }
  }

}

- (void)_widgetViewControllerRequestsAdd:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("WGWidgetViewControllerAddRequestBundleIdentifierKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[WGWidgetDiscoveryController _externalSourceRequestsInsertionOfWidgetWithIdentifier:insertAtTop:](self, "_externalSourceRequestsInsertionOfWidgetWithIdentifier:insertAtTop:", v5, 0);
}

- (void)_widget:(id)a3 withIdentifier:(id)a4 didRemoveSnapshotAtURL:(id)a5
{
  NSMutableDictionary *widgetIDsToWidgets;
  id v9;
  id v10;
  id v11;

  v11 = a5;
  widgetIDsToWidgets = self->_widgetIDsToWidgets;
  v9 = a3;
  -[NSMutableDictionary objectForKey:](widgetIDsToWidgets, "objectForKey:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v9)
    objc_msgSend(v10, "invalidateCachedSnapshotWithURL:completionHandler:", v11, 0);

}

- (void)_widgetViewControllerDidRemoveSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WGWidgetViewControllerRemovedSnapshotWidgetIdentifierKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("WGWidgetViewControllerRemovedSnapshotURLKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WGWidgetDiscoveryController _widget:withIdentifier:didRemoveSnapshotAtURL:](self, "_widget:withIdentifier:didRemoveSnapshotAtURL:", 0, v8, v7);
}

- (void)_widgetListEditViewControllerWillDisappear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke;
  v16[3] = &unk_24D7316E8;
  objc_copyWeak(&v17, &location);
  v6 = (void *)MEMORY[0x219A0A970](v16);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke_2;
    v14[3] = &unk_24D731890;
    v15 = v6;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", v14, 0);
    v10 = &v15;

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDF6F90];
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke_3;
    v12[3] = &unk_24D7318B8;
    v13 = v6;
    objc_msgSend(v11, "animateWithDuration:animations:", v12, 0.35);
    v10 = &v13;
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentedEditViewControllerStatusBarAssertion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invalidateWidgetListEditViewControllerStatusBarAssertion:", v1);

  objc_msgSend(WeakRetained, "_setPresentedEditViewControllerStatusBarAssertion:", 0);
}

uint64_t __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__WGWidgetDiscoveryController__widgetListEditViewControllerWillDisappear___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_applicationIconChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = v5;
    WGPlugInBundleIdentifiersForContainingBundleIdentifier(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = WGLogWidgets;
          if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v20 = v11;
            _os_log_impl(&dword_2172E1000, v12, OS_LOG_TYPE_DEFAULT, "Widget icon changed for bundle ID: %{public}@)", buf, 0xCu);
          }
          -[NSMutableDictionary objectForKey:](self->_identifiersToWidgetInfos, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_resetIcons");

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v8);
    }

    v5 = v14;
  }

}

- (BOOL)areWidgetsPinned
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "areWidgetsPinnedForWidgetDiscoveryController:", self);
  else
    v4 = 0;

  return v4;
}

- (BOOL)alwaysShowsFavoriteWidgets
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WGAlwaysShowFavorites"));

  return v3;
}

- (int)_nextSequenceNumber
{
  unsigned int v2;

  do
    v2 = __ldxr((unsigned int *)&_nextSequenceNumber___sequenceNumber);
  while (__stxr(v2 + 1, (unsigned int *)&_nextSequenceNumber___sequenceNumber));
  return _nextSequenceNumber___sequenceNumber;
}

- (void)handleWidgetLaunchRecommendation:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  WGWidgetStatsController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  id obj;
  _QWORD block[4];
  id v20;
  __int128 *v21;
  _QWORD v22[5];
  WGWidgetStatsController *v23;
  NSObject *v24;
  __int128 *p_buf;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = a4;
  v7 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_2172E1000, v7, OS_LOG_TYPE_DEFAULT, "Handling recommendation to update widgets with bundle IDs: %{public}@)", (uint8_t *)&buf, 0xCu);
  }
  v8 = dispatch_group_create();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  v36 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v9 = self->_statsController;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[WGWidgetDiscoveryController widgetWithIdentifier:delegate:forRequesterWithIdentifier:](self, "widgetWithIdentifier:delegate:forRequesterWithIdentifier:", v13, 0, CFSTR("Duet"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          dispatch_group_enter(v8);
          v15 = -[WGWidgetDiscoveryController _nextSequenceNumber](self, "_nextSequenceNumber");
          -[WGWidgetStatsController notePreWarmHasStarted:withTriggerType:withSequence:](v9, "notePreWarmHasStarted:withTriggerType:withSequence:", v13, 1, v15);
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __75__WGWidgetDiscoveryController_handleWidgetLaunchRecommendation_completion___block_invoke;
          v22[3] = &unk_24D7318E0;
          v22[4] = v13;
          p_buf = &buf;
          v23 = v9;
          v26 = v15;
          v24 = v8;
          objc_msgSend(v14, "_updateWidgetWithCompletionHandler:", v22);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__WGWidgetDiscoveryController_handleWidgetLaunchRecommendation_completion___block_invoke_57;
  block[3] = &unk_24D731908;
  v20 = v17;
  v21 = &buf;
  v16 = v17;
  dispatch_group_notify(v8, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(&buf, 8);
}

void __75__WGWidgetDiscoveryController_handleWidgetLaunchRecommendation_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  _BYTE v9[12];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("is not");
    *(_DWORD *)v9 = 138543874;
    if (a3)
      v8 = CFSTR("is");
    *(_QWORD *)&v9[4] = v7;
    v10 = 2048;
    v11 = a2;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_2172E1000, v6, OS_LOG_TYPE_DEFAULT, "Widget with ID '%{public}@' did update with result %ld, %{public}@ implemented", v9, 0x20u);
  }
  if (!a2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "notePreWarmHasEnded:withResult:withTriggerType:withSequence:", *(_QWORD *)(a1 + 32), a2, 1, *(int *)(a1 + 64), *(_QWORD *)v9);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __75__WGWidgetDiscoveryController_handleWidgetLaunchRecommendation_completion___block_invoke_57(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_2172E1000, v2, OS_LOG_TYPE_DEFAULT, "Informing Duet of updated widget bundle IDs: %{public}@)", (uint8_t *)&v6, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)requestRefreshForWidget:(id)a3 afterDate:(id)a4
{
  -[WGWidgetStatsController requestRefreshForWidget:afterDate:](self->_statsController, "requestRefreshForWidget:afterDate:", a3, a4);
}

- (void)_dataSourcesDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  NSMutableDictionary *identifiersToDataSources;
  void *v30;
  NSMutableDictionary *dataSourceIdentifiersToDatumIdentifiers;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_identifiersToDataSources, "mutableCopy");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v12, "dataSourceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_identifiersToDataSources, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          if ((objc_msgSend(v14, "isEqual:", v12) & 1) == 0)
            objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v6, "removeObjectForKey:", v13);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v9);
  }
  v34 = v7;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v16, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_identifiersToDataSources, "removeObjectForKey:", v21);
        -[NSMutableDictionary removeObjectForKey:](self->_dataSourceIdentifiersToDatumIdentifiers, "removeObjectForKey:", v21);
        objc_msgSend(v22, "removeWidgetObserver:completion:", self, 0);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v18);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        identifiersToDataSources = self->_identifiersToDataSources;
        objc_msgSend(v28, "dataSourceIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](identifiersToDataSources, "setObject:forKey:", v28, v30);

        dataSourceIdentifiersToDatumIdentifiers = self->_dataSourceIdentifiersToDatumIdentifiers;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "dataSourceIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](dataSourceIdentifiersToDatumIdentifiers, "setObject:forKey:", v32, v33);

        objc_msgSend(v28, "addWidgetObserver:completion:", self, 0);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v25);
  }

}

- (void)_beginObservingDataSourcesIfNecessary
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *archiveWriteQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *archive;
  NSMutableDictionary *v7;
  NSMutableDictionary *identifiersToDataSources;
  NSMutableDictionary *v9;
  NSMutableDictionary *dataSourceIdentifiersToDatumIdentifiers;
  NSMutableDictionary *v11;
  NSMutableDictionary *identifiersToDatums;
  NSMutableDictionary *v13;
  NSMutableDictionary *identifiersToWidgetInfos;
  NSMutableArray *v15;
  NSMutableArray *orderedEnabledTodayIdentifiers;
  NSMutableArray *v17;
  NSMutableArray *orderedEnabledWidgetsIdentifiers;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id location;

  if (!self->_archive)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.widgets.todayviewarchive.diskwritequeue", 0);
    archiveWriteQueue = self->_archiveWriteQueue;
    self->_archiveWriteQueue = v3;

    WGTodayViewArchiveGetArchive(self->_defaultEnabledIDs, self->_archiveWriteQueue);
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    archive = self->_archive;
    self->_archive = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    identifiersToDataSources = self->_identifiersToDataSources;
    self->_identifiersToDataSources = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dataSourceIdentifiersToDatumIdentifiers = self->_dataSourceIdentifiersToDatumIdentifiers;
    self->_dataSourceIdentifiersToDatumIdentifiers = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    identifiersToDatums = self->_identifiersToDatums;
    self->_identifiersToDatums = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    identifiersToWidgetInfos = self->_identifiersToWidgetInfos;
    self->_identifiersToWidgetInfos = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    orderedEnabledTodayIdentifiers = self->_orderedEnabledTodayIdentifiers;
    self->_orderedEnabledTodayIdentifiers = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    orderedEnabledWidgetsIdentifiers = self->_orderedEnabledWidgetsIdentifiers;
    self->_orderedEnabledWidgetsIdentifiers = v17;

    objc_initWeak(&location, self);
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __68__WGWidgetDiscoveryController__beginObservingDataSourcesIfNecessary__block_invoke;
    v23 = &unk_24D731958;
    objc_copyWeak(&v24, &location);
    +[WGDataSourceManager requestSharedDataSourceManager:](WGDataSourceManager, "requestSharedDataSourceManager:", &v20);
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", v20, v21, v22, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:", self);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __68__WGWidgetDiscoveryController__beginObservingDataSourcesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__WGWidgetDiscoveryController__beginObservingDataSourcesIfNecessary__block_invoke_2;
  v4[3] = &unk_24D731930;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_msgSend(v3, "addWidgetDataSourceChangeHandler:forIdentifier:", v4, CFSTR("com.apple.widgets.widgetdiscoverycontroller.datasourcemanagerchangehandler"));
  objc_destroyWeak(&v5);

}

void __68__WGWidgetDiscoveryController__beginObservingDataSourcesIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_dataSourcesDidChange:", v3);

}

- (void)beginDiscovery
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_shouldPurgeNonCAMLSnapshots = objc_msgSend(WeakRetained, "didPurgeNonCAMLSnapshotsForWidgetDiscoveryController:", self) ^ 1;
  if (_WGSupportsASTC() && (objc_opt_respondsToSelector() & 1) != 0)
    self->_shouldPurgeNonASTCSnapshots = objc_msgSend(WeakRetained, "didPurgeNonASTCSnapshotsForWidgetDiscoveryController:", self) ^ 1;
  -[WGWidgetDiscoveryController _beginObservingDataSourcesIfNecessary](self, "_beginObservingDataSourcesIfNecessary");

}

- (BOOL)_isElementWithIdentifierEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_identifiersToDatums, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "representedExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "optedIn");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_setEnabled:(BOOL)a3 forElementWithIdentifier:(id)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  int v17;
  void *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    v7 = -[WGWidgetDiscoveryController _isElementWithIdentifierEnabled:](self, "_isElementWithIdentifierEnabled:", v6);
    -[NSMutableDictionary objectForKey:](self->_identifiersToDatums, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v8, "representedExtension"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      LOBYTE(v17) = 0;
LABEL_18:

      goto LABEL_19;
    }
    v10 = v9;
    v11 = objc_msgSend(v9, "optedIn");
    if (v4)
    {
      if ((v11 & 1) == 0)
      {
        v21 = 0;
        objc_msgSend(v10, "attemptOptIn:", &v21);
        v12 = v21;
        if (!v12)
          goto LABEL_16;
        v13 = (void *)WGLogWidgets;
        if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v14 = v13;
        objc_msgSend(v10, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v15;
        v24 = 2114;
        v25 = v12;
        v16 = "Encountered error attempting to opt in extension with ID '%{public}@': %{public}@";
LABEL_15:
        _os_log_impl(&dword_2172E1000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

LABEL_16:
      }
    }
    else if (v11)
    {
      v20 = 0;
      objc_msgSend(v10, "attemptOptOut:", &v20);
      v12 = v20;
      if (!v12)
        goto LABEL_16;
      v18 = (void *)WGLogWidgets;
      if (!os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v14 = v18;
      objc_msgSend(v10, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2114;
      v25 = v12;
      v16 = "Encountered error attempting to opt out extension with ID '%{public}@': %{public}@";
      goto LABEL_15;
    }
    v17 = v7 ^ -[WGWidgetDiscoveryController _isElementWithIdentifierEnabled:](self, "_isElementWithIdentifierEnabled:", v6);

    goto LABEL_18;
  }
  LOBYTE(v17) = 0;
LABEL_19:

  return v17;
}

- (BOOL)_isElementWithIdentifierKnown:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((WGTodayViewArchiveGetKnownForIdentifier(self->_archive, v4) & 1) != 0)
    v5 = 1;
  else
    v5 = WGIsWidgetWithBundleIdentifierInternal((uint64_t)v4);

  return v5;
}

- (BOOL)_isElementWithIdentifierFavorited:(id)a3
{
  NSMutableDictionary *archive;
  id v4;
  void *v5;
  char v6;

  archive = self->_archive;
  v4 = a3;
  WGTodayViewArchiveGetOrderedIdentifiersInGroup(archive, CFSTR("FavoriteGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)_calculateAndPostNewWidgetsCount
{
  void *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;
  NSObject *newWidgetsCountPostQueue;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  -[NSMutableDictionary allValues](self->_identifiersToDatums, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_newWidgetsCountPostQueue
    || (v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notificationcenter.newwidgetscountpostqueue", 0),
        v5 = self->_newWidgetsCountPostQueue,
        self->_newWidgetsCountPostQueue = v4,
        v5,
        self->_newWidgetsCountPostQueue))
  {
    objc_initWeak(&location, self);
    newWidgetsCountPostQueue = self->_newWidgetsCountPostQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke;
    block[3] = &unk_24D7319D0;
    v8 = v3;
    objc_copyWeak(&v9, &location);
    dispatch_async(newWidgetsCountPostQueue, block);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }

}

void __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id *v6;
  NSObject *v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  id obj;
  _QWORD v12[4];
  id v13[2];
  _QWORD block[6];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v10 = a1;
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v21;
    v6 = (id *)(a1 + 40);
    v7 = MEMORY[0x24BDAC9B8];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = 0;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke_2;
        block[3] = &unk_24D731980;
        objc_copyWeak(&v15, v6);
        block[4] = v9;
        block[5] = &v16;
        dispatch_sync(v7, block);
        v4 += *((unsigned __int8 *)v17 + 24);
        objc_destroyWeak(&v15);
        _Block_object_dispose(&v16, 8);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke_3;
  v12[3] = &unk_24D7319A8;
  v13[1] = v4;
  objc_copyWeak(v13, (id *)(v10 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], v12);
  objc_destroyWeak(v13);
}

void __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "datumIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "_isElementWithIdentifierKnown:", v2) ^ 1;

}

void __63__WGWidgetDiscoveryController__calculateAndPostNewWidgetsCount__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("WGNewWidgetsCountKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WGAvailableWidgetsUpdatedNotification"), WeakRetained, v3);

}

- (void)_notifyObserversOfVisibilityChange:(BOOL)a3 ofWidgetWithIdentifier:(id)a4 inGroup:(id)a5
{
  _BOOL4 v6;
  id v8;
  NSPointerArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v6 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v8 = a5;
  -[NSPointerArray compact](self->_observers, "compact");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_observers;
  v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if (v6)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "widgetDiscoveryController:widgetWithIdentifier:shouldBecomeVisibleInGroup:", self, v15, v8);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "widgetDiscoveryController:widgetWithIdentifier:shouldBecomeHiddenInGroup:", self, v15, v8);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)_notifyObserversOfSignificantWidgetsChange
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSPointerArray compact](self->_observers, "compact");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_observers;
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "widgetDiscoveryControllerSignificantWidgetsChange:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversOfOrderChangeForWidgetIdentifiers:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSPointerArray compact](self->_observers, "compact");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_observers;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "widgetDiscoveryController:orderDidChangeForWidgetIdentifiers:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_groupForWidgetWithIdentifier:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = CFSTR("TodayGroup");
    WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, CFSTR("TodayGroup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if ((v7 & 1) == 0)
    {
      WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, CFSTR("WidgetGroup"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v4);

      if (v9)
        v5 = CFSTR("WidgetGroup");
      else
        v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

- (id)_defaultGroupForWidgetWithIdentifier:(id)a3
{
  return CFSTR("TodayGroup");
}

- (id)_insertWidgetWithIdentifier:(id)a3 atTop:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[WGWidgetDiscoveryController _groupForWidgetWithIdentifier:](self, "_groupForWidgetWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[WGWidgetDiscoveryController _defaultGroupForWidgetWithIdentifier:](self, "_defaultGroupForWidgetWithIdentifier:", v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetDiscoveryController _orderedEnabledIdentifiersForGroup:](self, "_orderedEnabledIdentifiersForGroup:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetDiscoveryController _invalidateVisibleIdentifiersForGroup:](self, "_invalidateVisibleIdentifiersForGroup:", v10);
    if (v4)
    {
      objc_msgSend(v12, "insertObject:atIndex:", v6, 0);
    }
    else
    {
      objc_msgSend(v12, "addObject:", v6);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __65__WGWidgetDiscoveryController__insertWidgetWithIdentifier_atTop___block_invoke;
      v14[3] = &unk_24D7319F8;
      v14[4] = self;
      v15 = v11;
      objc_msgSend(v12, "sortWithOptions:usingComparator:", 16, v14);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __65__WGWidgetDiscoveryController__insertWidgetWithIdentifier_atTop___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(id *)(a1 + 40);
  objc_msgSend(v7, "datumIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "indexOfObject:", v10);

  objc_msgSend(v8, "datumIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "indexOfObject:", v12);

  if (v11 < v13)
    v14 = -1;
  else
    v14 = v11 > v13;

  return v14;
}

- (void)_removeWidgetWithIdentifier:(id)a3
{
  NSArray *orderedVisibleWidgetsIdentifiers;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[NSMutableArray removeObject:](self->_orderedEnabledTodayIdentifiers, "removeObject:", v5);
    -[WGWidgetDiscoveryController _invalidateVisibleIdentifiersForGroup:](self, "_invalidateVisibleIdentifiersForGroup:", CFSTR("TodayGroup"));
    -[NSMutableArray removeObject:](self->_orderedEnabledWidgetsIdentifiers, "removeObject:", v5);
    -[WGWidgetDiscoveryController _invalidateVisibleIdentifiersForGroup:](self, "_invalidateVisibleIdentifiersForGroup:", CFSTR("WidgetGroup"));
    orderedVisibleWidgetsIdentifiers = self->_orderedVisibleWidgetsIdentifiers;
    self->_orderedVisibleWidgetsIdentifiers = 0;

  }
}

- (id)_updatePublicationStateOfDatumWithIdentifier:(id)a3 visibilityChanged:(BOOL)a4 contentStateChanged:(BOOL)a5 insertAtTop:(BOOL)a6 notifyingObservers:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  int v22;
  id v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138544386;
    v23 = v12;
    v24 = 1024;
    v25 = v10;
    v26 = 1024;
    v27 = v9;
    v28 = 1024;
    v29 = v8;
    v30 = 1024;
    v31 = v7;
    _os_log_impl(&dword_2172E1000, v13, OS_LOG_TYPE_DEFAULT, "Will update publication state of %{public}@ visibilityChanged: %d contentStateChanged: %d insertAtTop: %d notifyingObservers: %d", (uint8_t *)&v22, 0x24u);
  }
  if (objc_msgSend(v12, "length"))
  {
    if (!v10 && !v9)
    {
      v14 = 0;
LABEL_24:
      -[WGWidgetDiscoveryController _calculateAndPostNewWidgetsCount](self, "_calculateAndPostNewWidgetsCount");
      goto LABEL_25;
    }
    -[NSMutableDictionary objectForKey:](self->_identifiersToDatums, "objectForKey:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = -[WGWidgetDiscoveryController _isElementWithIdentifierEnabled:](self, "_isElementWithIdentifierEnabled:", v12);
    else
      v16 = 0;

    v17 = -[WGWidgetPersistentStateController doesWidgetWithIdentifierHaveContent:](self->_persistentStateController, "doesWidgetWithIdentifierHaveContent:", v12);
    -[WGWidgetDiscoveryController _groupForWidgetWithIdentifier:](self, "_groupForWidgetWithIdentifier:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543874;
      v23 = v12;
      v24 = 1024;
      v25 = v16;
      v26 = 1024;
      v27 = v17;
      _os_log_impl(&dword_2172E1000, v18, OS_LOG_TYPE_DEFAULT, "Publication state of %{public}@ isVisible: %d hasContent: %d", (uint8_t *)&v22, 0x18u);
      if (!v9)
      {
LABEL_13:
        if (!v10)
          goto LABEL_14;
        goto LABEL_20;
      }
    }
    else if (!v9)
    {
      goto LABEL_13;
    }
    -[WGWidgetDiscoveryController _groupForWidgetWithIdentifier:](self, "_groupForWidgetWithIdentifier:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetDiscoveryController _invalidateVisibleIdentifiersForGroup:](self, "_invalidateVisibleIdentifiersForGroup:", v19);

    if (!v10)
    {
LABEL_14:
      if (!v7)
        goto LABEL_24;
LABEL_15:
      if (v10 && v17 || v16 && v9)
        -[WGWidgetDiscoveryController _notifyObserversOfVisibilityChange:ofWidgetWithIdentifier:inGroup:](self, "_notifyObserversOfVisibilityChange:ofWidgetWithIdentifier:inGroup:", v16 & v17, v12, v14);
      goto LABEL_24;
    }
LABEL_20:
    if (v16)
    {
      -[WGWidgetDiscoveryController _insertWidgetWithIdentifier:atTop:](self, "_insertWidgetWithIdentifier:atTop:", v12, v8);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
      if (!v7)
        goto LABEL_24;
    }
    else
    {
      -[WGWidgetDiscoveryController _removeWidgetWithIdentifier:](self, "_removeWidgetWithIdentifier:", v12);
      if (!v7)
        goto LABEL_24;
    }
    goto LABEL_15;
  }
  v14 = 0;
LABEL_25:

  return v14;
}

- (void)presentWidgetListEditViewControllerFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id location;

  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  v11 = WeakRetained;
  if (v8 && (objc_msgSend(WeakRetained, "wg_isAppearanceTransitioning") & 1) == 0)
  {
    objc_initWeak(&location, self);
    if (v11)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke;
      v19[3] = &unk_24D731A20;
      v12 = &v22;
      objc_copyWeak(&v22, &location);
      v20 = v8;
      v23 = a4;
      v21 = v9;
      -[WGWidgetDiscoveryController dismissWidgetListEditViewControllerAnimated:completion:](self, "dismissWidgetListEditViewControllerAnimated:completion:", 1, v19);

      v13 = v20;
    }
    else
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_2;
      v14[3] = &unk_24D731A70;
      v12 = &v17;
      objc_copyWeak(&v17, &location);
      v15 = v8;
      v18 = a4;
      v16 = v9;
      -[WGWidgetDiscoveryController _requestUnlockWithCompletion:](self, "_requestUnlockWithCompletion:", v14);

      v13 = v15;
    }

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "presentWidgetListEditViewControllerFromViewController:animated:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = (void *)objc_msgSend(WeakRetained, "_newWidgetListEditViewController");
    objc_msgSend(v4, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "_setPresentedEditViewController:", v4);
    objc_msgSend(WeakRetained, "_preferredViewControllerForPresentingFromViewController:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v7 = *(unsigned __int8 *)(a1 + 56);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_3;
    v11[3] = &unk_24D7318B8;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, v7, v11);

    objc_msgSend(v4, "transitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_4;
    v10[3] = &unk_24D731A48;
    v10[4] = WeakRetained;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", v10, 0);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }
}

uint64_t __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __105__WGWidgetDiscoveryController_presentWidgetListEditViewControllerFromViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(v1, "_newWidgetListEditViewControllerStatusBarAssertion");
  objc_msgSend(v1, "_setPresentedEditViewControllerStatusBarAssertion:", v2);

}

- (void)dismissWidgetListEditViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __86__WGWidgetDiscoveryController_dismissWidgetListEditViewControllerAnimated_completion___block_invoke;
    v8[3] = &unk_24D731A98;
    objc_copyWeak(&v10, &location);
    v9 = v6;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", v4, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

uint64_t __86__WGWidgetDiscoveryController_dismissWidgetListEditViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setPresentedEditViewController:", 0);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_newWidgetListEditViewController
{
  WGWidgetListEditViewController *v3;

  v3 = objc_alloc_init(WGWidgetListEditViewController);
  -[WGWidgetListEditViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 5);
  -[WGWidgetListEditViewController setDataSource:](v3, "setDataSource:", self);
  return v3;
}

- (id)_newWidgetListEditViewControllerStatusBarAssertion
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "statusBarAssertionForWidgetDiscoveryController:legibilityStyle:", self, -[WGWidgetDiscoveryController _widgetListEditViewControllerStatusBarLegibilityStyle](self, "_widgetListEditViewControllerStatusBarLegibilityStyle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_widgetListEditViewControllerStatusBarLegibilityStyle
{
  id WeakRetained;
  void *v3;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);
  objc_msgSend(WeakRetained, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
    v4 = 1;
  else
    v4 = 2;

  return v4;
}

- (void)_invalidateWidgetListEditViewControllerStatusBarAssertion:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "widgetDiscoveryController:didEndUsingStatusBarAssertion:", self, v5);

}

- (id)_preferredViewControllerForPresentingFromViewController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "widgetDiscoveryController:preferredViewControllerForPresentingFromViewController:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_requestUnlockWithCompletion:(id)a3
{
  id WeakRetained;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "widgetDiscoveryController:requestUnlockWithCompletion:", self, v5);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

- (void)dismissWidgetListEditViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedEditViewController);

  if (WeakRetained != v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGWidgetDiscoveryController.m"), 807, CFSTR("Unknown edit view controller (%@) requesting dismissal"), v12);

  }
  -[WGWidgetDiscoveryController dismissWidgetListEditViewControllerAnimated:completion:](self, "dismissWidgetListEditViewControllerAnimated:completion:", v6, v9);

}

- (void)widgetEditListViewController:(id)a3 traitCollectionDidChange:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  id WeakRetained;

  v6 = a4;
  objc_msgSend(a3, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  v9 = objc_msgSend(v6, "userInterfaceStyle");
  if (v9 != v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = -[WGWidgetDiscoveryController _widgetListEditViewControllerStatusBarLegibilityStyle](self, "_widgetListEditViewControllerStatusBarLegibilityStyle");
      -[WGWidgetDiscoveryController _presentedEditViewControllerStatusBarAssertion](self, "_presentedEditViewControllerStatusBarAssertion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "widgetDiscoveryController:updateStatusBarAssertion:withLegibilityStyle:", self, v11, v10);

    }
  }
}

- (void)widgetDataSource:(id)a3 replaceWithDatum:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *identifiersToDataSources;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *dataSourceIdentifiersToDatumIdentifiers;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  int v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "datumIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "representedExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_plugIn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v6;
    v33 = 2114;
    v34 = v10;
    v35 = 2114;
    v36 = v13;
    _os_log_impl(&dword_2172E1000, v9, OS_LOG_TYPE_DEFAULT, "Widget data source %{public}@ asking to replace with datum with ID '%{public}@ (%{public}@)'", (uint8_t *)&v31, 0x20u);

  }
  identifiersToDataSources = self->_identifiersToDataSources;
  objc_msgSend(v6, "dataSourceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](identifiersToDataSources, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v7, "datumIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_identifiersToDatums, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](self->_identifiersToDatums, "setObject:forKey:", v7, v17);
    -[NSMutableDictionary objectForKey:](self->_identifiersToWidgetInfos, "objectForKey:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(v7, "representedExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "widgetInfoWithExtension:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "representedExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[WGWidgetInfo widgetInfoWithExtension:](WGWidgetInfo, "widgetInfoWithExtension:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v22)
    {
      -[NSMutableDictionary setObject:forKey:](self->_identifiersToWidgetInfos, "setObject:forKey:", v22, v17);
    }
    else if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
    {
      -[WGWidgetDiscoveryController widgetDataSource:replaceWithDatum:].cold.2();
    }
    dataSourceIdentifiersToDatumIdentifiers = self->_dataSourceIdentifiersToDatumIdentifiers;
    objc_msgSend(v6, "dataSourceIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](dataSourceIdentifiersToDatumIdentifiers, "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v17);

    if (WGIsWidgetWithBundleIdentifierInternal((uint64_t)v17))
      WGTodayViewArchiveSetKnownForIdentifier(self->_archive, v17, self->_archiveWriteQueue);
    if (!v18
      && (WGTodayViewArchiveGetPenalizedForIdentifier(self->_archive, v17) & 1) == 0
      && !WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(v17, CFSTR("10.0")))
    {
      WGTodayViewArchiveRemoveFromOrderedIdentifiers(self->_archive, v17, 0);
      WGTodayViewArchiveSetPenalizedForIdentifier(self->_archive, v17, 0);
    }
    v27 = -[NSMutableSet containsObject:](self->_defaultEnabledIDs, "containsObject:", v17);
    if (v27)
      -[NSMutableSet removeObject:](self->_defaultEnabledIDs, "removeObject:", v17);
    v28 = -[WGWidgetDiscoveryController _setEnabled:forElementWithIdentifier:](self, "_setEnabled:forElementWithIdentifier:", v27 | -[WGWidgetDiscoveryController _isElementWithIdentifierEnabled:](self, "_isElementWithIdentifierEnabled:", v17), v17);
    if (v18)
    {
      v29 = 0;
    }
    else
    {
      v28 = -[WGWidgetDiscoveryController _isElementWithIdentifierEnabled:](self, "_isElementWithIdentifierEnabled:", v17) | v28;
      v29 = WGIsWidgetWithBundleIdentifierWantsTop(v17);
    }
    v30 = -[WGWidgetDiscoveryController _updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:](self, "_updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:", v17, v28, 0, v29, 1);

  }
  else
  {
    v23 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetDiscoveryController widgetDataSource:replaceWithDatum:].cold.1(v23, v6);
  }

}

- (void)widgetDataSource:(id)a3 removeDatum:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *identifiersToDataSources;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "datumIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "representedExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_plugIn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v6;
    v26 = 2114;
    v27 = v10;
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_2172E1000, v9, OS_LOG_TYPE_DEFAULT, "Widget data source %{public}@ asking to remove datum with ID '%{public}@ (%{public}@)'", (uint8_t *)&v24, 0x20u);

  }
  identifiersToDataSources = self->_identifiersToDataSources;
  objc_msgSend(v6, "dataSourceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](identifiersToDataSources, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetDiscoveryController widgetDataSource:removeDatum:].cold.2(v17, v6);
  }
  objc_msgSend(v7, "datumIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_identifiersToDatums, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (-[WGWidgetDiscoveryController _isElementWithIdentifierEnabled:](self, "_isElementWithIdentifierEnabled:", v18))
      v20 = -[WGWidgetPersistentStateController doesWidgetWithIdentifierHaveContent:](self->_persistentStateController, "doesWidgetWithIdentifierHaveContent:", v18);
    else
      v20 = 0;
    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToDatums, "removeObjectForKey:", v18);
    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToWidgetInfos, "removeObjectForKey:", v18);
    objc_msgSend(v6, "dataSourceIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_dataSourceIdentifiersToDatumIdentifiers, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObject:", v18);
    -[NSMutableDictionary removeObjectForKey:](self->_widgetIDsToWidgets, "removeObjectForKey:", v18);
    v23 = -[WGWidgetDiscoveryController _updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:](self, "_updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:", v18, 1, 0, 0, v20);

  }
  else if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
  {
    -[WGWidgetDiscoveryController widgetDataSource:removeDatum:].cold.1();
  }

}

- (int64_t)userSpecifiedDisplayModeForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "widgetInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isLinkedOnOrAfterSystemVersion:", CFSTR("10.0")))
  {
    objc_msgSend(v4, "widgetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WGWidgetDiscoveryController userSpecifiedDisplayModeForWidgetWithIdentifier:](self, "userSpecifiedDisplayModeForWidgetWithIdentifier:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)widget:(id)a3 didChangeUserSpecifiedDisplayMode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[WGWidgetDiscoveryController userSpecifiedDisplayModeForWidget:](self, "userSpecifiedDisplayModeForWidget:") != a4)
  {
    objc_msgSend(v9, "widgetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetDiscoveryController setUserSpecifiedDisplayMode:forWidgetWithIdentifier:](self, "setUserSpecifiedDisplayMode:forWidgetWithIdentifier:", a4, v6);

    +[WGWidgetEventTracker sharedInstance](WGWidgetEventTracker, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widgetIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widget:didChangeUserSpecifiedDisplayMode:", v8, a4);

  }
}

- (int64_t)largestAvailableDisplayModeForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "widgetInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isLinkedOnOrAfterSystemVersion:", CFSTR("10.0")))
  {
    objc_msgSend(v4, "widgetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WGWidgetDiscoveryController largestAvailableDisplayModeForWidgetWithIdentifier:](self, "largestAvailableDisplayModeForWidgetWithIdentifier:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)widget:(id)a3 didChangeLargestAvailableDisplayMode:(int64_t)a4
{
  id v6;

  objc_msgSend(a3, "widgetIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController setLargestAvailableDisplayMode:forWidgetWithIdentifier:](self, "setLargestAvailableDisplayMode:forWidgetWithIdentifier:", a4, v6);

}

- (void)widget:(id)a3 didEncounterProblematicSnapshotAtURL:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "widgetIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "widgetDiscoveryController:widgetWithBundleIdentifier:didEncounterProblematicSnapshotAtURL:", self, v8, v6);

  }
}

- (void)widget:(id)a3 didRemoveSnapshotAtURL:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "widgetIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WGWidgetDiscoveryController _widget:withIdentifier:didRemoveSnapshotAtURL:](self, "_widget:withIdentifier:didRemoveSnapshotAtURL:", v7, v8, v6);

}

- (BOOL)shouldPurgeArchivedSnapshotsForWidget:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "widgetIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(WeakRetained, "widgetDiscoveryController:shouldPurgeArchivedSnapshotsForWidgetWithBundleIdentifier:", self, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldPurgeNonCAMLSnapshotsForWidget:(id)a3
{
  return self->_shouldPurgeNonCAMLSnapshots;
}

- (BOOL)shouldPurgeNonASTCSnapshotsForWidget:(id)a3
{
  return self->_shouldPurgeNonASTCSnapshots;
}

- (id)groupsForWidgetListEditViewController:(id)a3
{
  return &unk_24D744448;
}

- (id)widgetListEditViewController:(id)a3 itemIdentifiersForGroup:(id)a4
{
  return -[WGWidgetDiscoveryController _orderedEnabledWidgetIdentifiersForGroup:includingNoContent:](self, "_orderedEnabledWidgetIdentifiersForGroup:includingNoContent:", a4, 1);
}

- (id)widgetListEditViewController:(id)a3 defaultGroupForItemWithIdentifier:(id)a4
{
  return -[WGWidgetDiscoveryController _defaultGroupForWidgetWithIdentifier:](self, "_defaultGroupForWidgetWithIdentifier:", a4);
}

- (void)widgetListEditViewController:(id)a3 didReorderItemsWithIdentifiersInGroups:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *orderedEnabledTodayIdentifiers;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *orderedEnabledWidgetsIdentifiers;
  NSArray *orderedVisibleWidgetsIdentifiers;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, v11, v10, self->_archiveWriteQueue);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, CFSTR("TodayGroup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (NSMutableArray *)objc_msgSend(v12, "mutableCopy");
  orderedEnabledTodayIdentifiers = self->_orderedEnabledTodayIdentifiers;
  self->_orderedEnabledTodayIdentifiers = v13;

  -[WGWidgetDiscoveryController _invalidateVisibleIdentifiersForGroup:](self, "_invalidateVisibleIdentifiersForGroup:", CFSTR("TodayGroup"));
  WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, CFSTR("WidgetGroup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSMutableArray *)objc_msgSend(v15, "mutableCopy");
  orderedEnabledWidgetsIdentifiers = self->_orderedEnabledWidgetsIdentifiers;
  self->_orderedEnabledWidgetsIdentifiers = v16;

  -[WGWidgetDiscoveryController _invalidateVisibleIdentifiersForGroup:](self, "_invalidateVisibleIdentifiersForGroup:", CFSTR("WidgetGroup"));
  orderedVisibleWidgetsIdentifiers = self->_orderedVisibleWidgetsIdentifiers;
  self->_orderedVisibleWidgetsIdentifiers = 0;

  -[WGWidgetDiscoveryController _notifyObserversOfSignificantWidgetsChange](self, "_notifyObserversOfSignificantWidgetsChange");
}

- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierEnabled:(id)a4
{
  return -[WGWidgetDiscoveryController _isElementWithIdentifierEnabled:](self, "_isElementWithIdentifierEnabled:", a4);
}

- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierNew:(id)a4
{
  return !-[WGWidgetDiscoveryController _isElementWithIdentifierKnown:](self, "_isElementWithIdentifierKnown:", a4);
}

- (BOOL)widgetListEditViewController:(id)a3 isItemWithIdentifierFavorited:(id)a4
{
  return -[WGWidgetDiscoveryController _isElementWithIdentifierFavorited:](self, "_isElementWithIdentifierFavorited:", a4);
}

- (void)widgetListEditViewController:(id)a3 setEnabled:(BOOL)a4 forItemsWithIdentifiers:(id)a5
{
  _BOOL8 v5;
  id v7;
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

  v5 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = -[WGWidgetDiscoveryController _updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:](self, "_updatePublicationStateOfDatumWithIdentifier:visibilityChanged:contentStateChanged:insertAtTop:notifyingObservers:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), -[WGWidgetDiscoveryController _setEnabled:forElementWithIdentifier:](self, "_setEnabled:forElementWithIdentifier:", v5, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11)), 0, 0, 1);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)widgetListEditViewController:(id)a3 updateFavoritesToIdentifiers:(id)a4
{
  -[WGWidgetDiscoveryController _updateFavoriteWidgetIDs:](self, "_updateFavoriteWidgetIDs:", a4);
}

- (BOOL)shouldShowWidgetsPinButtonForWidgetListEditViewController:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "shouldShowWidgetsPinButtonForWidgetDiscoveryController:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldShowWidgetsPinningTeachingView
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "shouldShowWidgetsPinningTeachingViewForWidgetDiscoveryController:", self);
  else
    v4 = 0;

  return v4;
}

- (void)noteWidgetsPinningViewControllerDidDismiss:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;

  v3 = a3;
  -[WGWidgetDiscoveryController _setWidgetsPinned:](self, "_setWidgetsPinned:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "widgetDiscoveryControllerDidDismissWidgetsPinningTeachingView:", self);
  if (v3)
    -[WGWidgetDiscoveryController _addDefaultPinnedWidgets](self, "_addDefaultPinnedWidgets");

}

- (void)_addDefaultPinnedWidgets
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *orderedEnabledTodayIdentifiers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if ((-[NSMutableArray containsObject:](self->_orderedEnabledTodayIdentifiers, "containsObject:", CFSTR("com.apple.weather.WeatherAppTodayWidget")) & 1) == 0)-[WGWidgetDiscoveryController _externalSourceRequestsInsertionOfWidgetWithIdentifier:insertAtTop:](self, "_externalSourceRequestsInsertionOfWidgetWithIdentifier:insertAtTop:", CFSTR("com.apple.weather.WeatherAppTodayWidget"), 0);
  if ((-[NSMutableArray containsObject:](self->_orderedEnabledTodayIdentifiers, "containsObject:", CFSTR("com.apple.UpNextWidget.extension")) & 1) == 0)-[WGWidgetDiscoveryController _externalSourceRequestsInsertionOfWidgetWithIdentifier:insertAtTop:](self, "_externalSourceRequestsInsertionOfWidgetWithIdentifier:insertAtTop:", CFSTR("com.apple.UpNextWidget.extension"), 0);
  v3 = -[NSMutableArray indexOfObject:](self->_orderedEnabledTodayIdentifiers, "indexOfObject:", CFSTR("com.apple.weather.WeatherAppTodayWidget"));
  v4 = -[NSMutableArray indexOfObject:](self->_orderedEnabledTodayIdentifiers, "indexOfObject:", CFSTR("com.apple.UpNextWidget.extension"));
  if (v3 > 1 || v4 >= 2)
  {
    v6 = (void *)-[NSMutableArray mutableCopy](self->_orderedEnabledTodayIdentifiers, "mutableCopy");
    objc_msgSend(v6, "removeObject:", CFSTR("com.apple.weather.WeatherAppTodayWidget"));
    objc_msgSend(v6, "insertObject:atIndex:", CFSTR("com.apple.weather.WeatherAppTodayWidget"), 0);
    objc_msgSend(v6, "removeObject:", CFSTR("com.apple.UpNextWidget.extension"));
    objc_msgSend(v6, "insertObject:atIndex:", CFSTR("com.apple.UpNextWidget.extension"), 1);
    WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, v6, CFSTR("TodayGroup"), self->_archiveWriteQueue);
    WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, CFSTR("TodayGroup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSMutableArray *)objc_msgSend(v7, "mutableCopy");
    orderedEnabledTodayIdentifiers = self->_orderedEnabledTodayIdentifiers;
    self->_orderedEnabledTodayIdentifiers = v8;

    -[WGWidgetDiscoveryController _invalidateVisibleIdentifiersForGroup:](self, "_invalidateVisibleIdentifiersForGroup:", CFSTR("TodayGroup"));
    v14[0] = CFSTR("com.apple.weather.WeatherAppTodayWidget");
    v14[1] = CFSTR("com.apple.UpNextWidget.extension");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetDiscoveryController _notifyObserversOfOrderChangeForWidgetIdentifiers:](self, "_notifyObserversOfOrderChangeForWidgetIdentifiers:", v11);

  }
  -[WGWidgetDiscoveryController favoriteWidgetIdentifiers](self, "favoriteWidgetIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if ((objc_msgSend(v13, "containsObject:", CFSTR("com.apple.weather.WeatherAppTodayWidget")) & 1) == 0)
    objc_msgSend(v13, "insertObject:atIndex:", CFSTR("com.apple.weather.WeatherAppTodayWidget"), 0);
  if ((objc_msgSend(v13, "containsObject:", CFSTR("com.apple.UpNextWidget.extension")) & 1) == 0)
    objc_msgSend(v13, "insertObject:atIndex:", CFSTR("com.apple.UpNextWidget.extension"), 1);
  -[WGWidgetDiscoveryController _updateFavoriteWidgetIDs:](self, "_updateFavoriteWidgetIDs:", v13);

}

- (void)widgetListEditViewController:(id)a3 didChangeWidgetsPinning:(BOOL)a4
{
  -[WGWidgetDiscoveryController _setWidgetsPinned:](self, "_setWidgetsPinned:", a4);
}

- (void)_setWidgetsPinned:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "widgetDiscoveryController:didChangeWidgetsPinning:", self, v3);

}

- (void)widgetListEditViewController:(id)a3 acknowledgeInterfaceItemsWithIdentifiers:(id)a4
{
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
  v5 = a4;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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
        WGTodayViewArchiveSetKnownForIdentifier(self->_archive, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  WGTodayViewArchiveSave(self->_archive, self->_archiveWriteQueue, 0);

}

- (id)widgetListEditViewController:(id)a3 displayNameForItemWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  if (!objc_msgSend(v5, "length"))
  {
    v6 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetDiscoveryController widgetListEditViewController:displayNameForItemWithIdentifier:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  -[NSMutableDictionary objectForKey:](self->_identifiersToWidgetInfos, "objectForKey:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetDiscoveryController widgetListEditViewController:displayNameForItemWithIdentifier:].cold.1();
    v16 = 0;
  }

  return v16;
}

- (void)widgetListEditViewController:(id)a3 requestsIconForItemWithIdentifier:(id)a4 withHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v7 = a4;
  v8 = a5;
  if (!objc_msgSend(v7, "length"))
  {
    v9 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetDiscoveryController widgetListEditViewController:displayNameForItemWithIdentifier:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  -[NSMutableDictionary objectForKey:](self->_identifiersToWidgetInfos, "objectForKey:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "requestSettingsIconWithHandler:", v8);
  }
  else if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
  {
    -[WGWidgetDiscoveryController widgetListEditViewController:displayNameForItemWithIdentifier:].cold.1();
  }

}

- (BOOL)widgetListEditViewControllerShouldIncludeInternalWidgets:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "widgetDiscoveryControllerShouldIncludeInternalWidgets:", self);
  else
    v5 = 0;

  return v5;
}

- (int64_t)layoutModeForWidgetListEditViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  int64_t v9;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v9 = objc_msgSend(v4, "layoutModeForSize:", v7, v8);

  return v9;
}

- (BOOL)widgetListEditViewControllerShouldShowFavorites:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "widgetDiscoveryControllerShouldRespectFavorites:", self);
  else
    v5 = 0;

  return v5;
}

- (void)remoteViewControllerDidConnectForWidgetViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "widgetHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_widgetIDsToPendingTestCompletions, "objectForKey:", v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
    -[NSMutableDictionary removeObjectForKey:](self->_widgetIDsToPendingTestCompletions, "removeObjectForKey:", v7);
  }

}

- (void)remoteViewControllerViewDidAppearForWidgetViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "widgetHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_widgetIDsToPendingTestTearDowns, "objectForKey:", v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    -[NSMutableDictionary removeObjectForKey:](self->_widgetIDsToPendingTestTearDowns, "removeObjectForKey:", v7);
  }

}

- (void)widgetViewControllerNeedsToBeUnregisteredForRefreshNotification:(id)a3
{
  WGWidgetStatsController *statsController;
  void *v4;
  id v5;

  statsController = self->_statsController;
  objc_msgSend(a3, "widgetHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetStatsController unregisterWidgetForPredictionEvents:](statsController, "unregisterWidgetForPredictionEvents:", v4);

}

- (void)widgetViewControllerNeedsToBeRegisteredForRefreshNotification:(id)a3
{
  WGWidgetStatsController *statsController;
  void *v4;
  id v5;

  statsController = self->_statsController;
  objc_msgSend(a3, "widgetHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WGWidgetStatsController registerWidgetForPredictionEvents:](statsController, "registerWidgetForPredictionEvents:", v4);

}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WGWidgetDiscoveryController_deviceManagementPolicyDidChange___block_invoke;
  block[3] = &unk_24D731620;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __63__WGWidgetDiscoveryController_deviceManagementPolicyDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *(id *)(a1 + 32);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v3);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v4, "plugInKitPlugins");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v18;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v18 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
              objc_msgSend(WeakRetained, "_widgetIDsToWidgets");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "bundleIdentifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKey:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(WeakRetained, "_updateLockedOutStateForWidget:withContainingAppProxy:", v13, v4);
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v7);
        }

        ++v3;
      }
      while (v3 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

}

- (void)debugWidgetWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  char v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v8;
    _os_log_impl(&dword_2172E1000, v11, OS_LOG_TYPE_DEFAULT, "Asked to debug widget with ID '%{public}@'", (uint8_t *)&v16, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_debuggingHandler);
  if (objc_msgSend(v8, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_identifiersToDatums, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && WeakRetained)
    {
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[WGWidgetDiscoveryController _externalSourceRequestsInsertionOfWidgetWithIdentifier:insertAtTop:](self, "_externalSourceRequestsInsertionOfWidgetWithIdentifier:insertAtTop:", v8, 0);
        objc_msgSend(WeakRetained, "makeVisibleWidgetWithIdentifier:completion:", v8, v10);
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  if (v10)
    v10[2](v10, 0);
LABEL_11:

}

- (BOOL)bootstrapFavoriteWidgets
{
  return -[WGWidgetStatsController bootstrapFavoriteWidgets](self->_statsController, "bootstrapFavoriteWidgets");
}

- (void)setBootstrapFavoriteWidgets:(BOOL)a3
{
  -[WGWidgetStatsController setBootstrapFavoriteWidgets:](self->_statsController, "setBootstrapFavoriteWidgets:", a3);
}

- (id)favoriteWidgetIdentifiers
{
  return WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, CFSTR("FavoriteGroup"));
}

- (id)todayWidgetIdentifiers
{
  return WGTodayViewArchiveGetOrderedIdentifiersInGroup(self->_archive, CFSTR("TodayGroup"));
}

- (void)removeWidgetIdentifiersFromToday:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *orderedEnabledTodayIdentifiers;
  id v9;

  v4 = a3;
  -[WGWidgetDiscoveryController todayWidgetIdentifiers](self, "todayWidgetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v9, "removeObjectsInArray:", v4);
  WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, v9, CFSTR("TodayGroup"), self->_archiveWriteQueue);
  -[WGWidgetDiscoveryController todayWidgetIdentifiers](self, "todayWidgetIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
  orderedEnabledTodayIdentifiers = self->_orderedEnabledTodayIdentifiers;
  self->_orderedEnabledTodayIdentifiers = v7;

  -[WGWidgetDiscoveryController invalidateVisibleIdentifiers](self, "invalidateVisibleIdentifiers");
}

- (void)_updateFavoriteWidgetIDs:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WGWidgetDiscoveryController favoriteWidgetIdentifiers](self, "favoriteWidgetIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToArray:", v6) & 1) == 0)
  {
    WGTodayViewArchiveSetOrderedIdentifiersInGroup(self->_archive, v6, CFSTR("FavoriteGroup"), self->_archiveWriteQueue);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("WGWidgetFavoritesDidChange"), self);

  }
}

- (void)registerIdentifierForRefreshEvents:(id)a3
{
  -[WGWidgetStatsController registerWidgetForPredictionEvents:](self->_statsController, "registerWidgetForPredictionEvents:", a3);
}

- (void)unregisterIdentifierForRefreshEvents:(id)a3
{
  -[WGWidgetStatsController unregisterWidgetForPredictionEvents:](self->_statsController, "unregisterWidgetForPredictionEvents:", a3);
}

- (WGWidgetDiscoveryControllerDelegate)delegate
{
  return (WGWidgetDiscoveryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)_widgetIDsToWidgets
{
  return self->_widgetIDsToWidgets;
}

- (WGWidgetDebugging)debuggingHandler
{
  return (WGWidgetDebugging *)objc_loadWeakRetained((id *)&self->_debuggingHandler);
}

- (void)setDebuggingHandler:(id)a3
{
  objc_storeWeak((id *)&self->_debuggingHandler, a3);
}

- (WGWidgetListEditViewController)presentedEditViewController
{
  return (WGWidgetListEditViewController *)objc_loadWeakRetained((id *)&self->_presentedEditViewController);
}

- (void)_setPresentedEditViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentedEditViewController, a3);
}

- (id)_presentedEditViewControllerStatusBarAssertion
{
  return self->_presentedEditViewControllerStatusBarAssertion;
}

- (void)_setPresentedEditViewControllerStatusBarAssertion:(id)a3
{
  objc_storeStrong(&self->_presentedEditViewControllerStatusBarAssertion, a3);
}

- (NSMutableDictionary)widgetIDsToPendingTestCompletions
{
  return self->_widgetIDsToPendingTestCompletions;
}

- (void)setWidgetIDsToPendingTestCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIDsToPendingTestCompletions, a3);
}

- (NSMutableDictionary)widgetIDsToPendingTestTearDowns
{
  return self->_widgetIDsToPendingTestTearDowns;
}

- (void)setWidgetIDsToPendingTestTearDowns:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIDsToPendingTestTearDowns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIDsToPendingTestTearDowns, 0);
  objc_storeStrong((id *)&self->_widgetIDsToPendingTestCompletions, 0);
  objc_storeStrong(&self->_presentedEditViewControllerStatusBarAssertion, 0);
  objc_destroyWeak((id *)&self->_presentedEditViewController);
  objc_destroyWeak((id *)&self->_debuggingHandler);
  objc_storeStrong((id *)&self->_widgetIDsToWidgets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_newWidgetsCountPostQueue, 0);
  objc_storeStrong((id *)&self->_statsController, 0);
  objc_storeStrong((id *)&self->_persistentStateController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_orderedVisibleWidgetsIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedEnabledWidgetsIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedVisibleTodayIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedEnabledTodayIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersToWidgetInfos, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifiersToDatumIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersToDatums, 0);
  objc_storeStrong((id *)&self->_identifiersToDataSources, 0);
  objc_storeStrong((id *)&self->_defaultEnabledIDs, 0);
  objc_storeStrong((id *)&self->_archiveWriteQueue, 0);
  objc_storeStrong((id *)&self->_archive, 0);
}

- (void)widgetWithIdentifier:delegate:forRequesterWithIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_2172E1000, v1, OS_LOG_TYPE_DEBUG, "Requester with ID '%{public}@' is requesting widget with ID '%{public}@'", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)widgetDataSource:(void *)a1 replaceWithDatum:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "dataSourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_2172E1000, v3, v5, "Unknown data source (%{public}@) called observer", v6);

  OUTLINED_FUNCTION_3();
}

- (void)widgetDataSource:replaceWithDatum:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2172E1000, v0, v1, "Failed to obtain or create widget info for datum with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)widgetDataSource:removeDatum:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2172E1000, v0, v1, "Asked to remove widget datum (%{public}@) we don't have", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)widgetDataSource:(void *)a1 removeDatum:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "dataSourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_2172E1000, v3, v5, "Unknown data source (%@{public}) called observer", v6);

  OUTLINED_FUNCTION_3();
}

- (void)widgetListEditViewController:displayNameForItemWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2172E1000, v0, v1, "Couldn't find widget info for identifier '%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)widgetListEditViewController:(uint64_t)a3 displayNameForItemWithIdentifier:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2172E1000, a1, a3, "Invalid parameter not satisfying: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end

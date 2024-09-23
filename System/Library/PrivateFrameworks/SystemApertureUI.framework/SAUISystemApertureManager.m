@implementation SAUISystemApertureManager

- (NSArray)orderedElementViewControllers
{
  return self->_orderedElementViewControllers;
}

- (void)hostWillPerformLayout
{
  SAUISystemApertureManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_promotedStateIsValid)
    -[SAUISystemApertureManager _reevaluatePromotedElements](obj, "_reevaluatePromotedElements");
  objc_sync_exit(obj);

}

- (id)_assertionForElementCreatingIfNecessary:(id)a3
{
  id v4;
  SAUISystemApertureManager *v5;
  SAUIElementAssertion *v6;
  SAUIElementAssertion *v7;
  NSMapTable *elementsToAssertions;
  uint64_t v9;
  NSMapTable *v10;
  NSPointerArray *elements;
  uint64_t v12;
  NSPointerArray *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[SAUISystemApertureManager _assertionForElement:](v5, "_assertionForElement:", v4);
    v6 = (SAUIElementAssertion *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "uniquelyIdentifyElement");
      objc_initWeak(&location, v5);
      v7 = [SAUIElementAssertion alloc];
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __69__SAUISystemApertureManager__assertionForElementCreatingIfNecessary___block_invoke;
      v18 = &unk_25193CD28;
      objc_copyWeak(&v19, &location);
      v6 = -[SAUIElementAssertion initWithElement:invalidationHandler:](v7, "initWithElement:invalidationHandler:", v4, &v15);
      if (v6)
      {
        elementsToAssertions = v5->_elementsToAssertions;
        if (!elementsToAssertions)
        {
          objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable", v15, v16, v17, v18);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = v5->_elementsToAssertions;
          v5->_elementsToAssertions = (NSMapTable *)v9;

          elementsToAssertions = v5->_elementsToAssertions;
        }
        -[NSMapTable setObject:forKey:](elementsToAssertions, "setObject:forKey:", v6, v4, v15, v16, v17, v18);
        elements = v5->_elements;
        if (!elements)
        {
          objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v5->_elements;
          v5->_elements = (NSPointerArray *)v12;

          elements = v5->_elements;
        }
        -[NSPointerArray addPointer:](elements, "addPointer:", v4);
        -[SAUISystemApertureManager _invalidateTemporallyOrderedElements](v5, "_invalidateTemporallyOrderedElements");
      }
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)registerElement:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)SAUILogManager;
  if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    MEMORY[0x24958F5B4](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v7;
    _os_log_impl(&dword_247C5B000, v6, OS_LOG_TYPE_DEFAULT, "Asked to register element: %{public}@", buf, 0xCu);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SAUISystemApertureManager registeredElements](self, "registeredElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v28;
    *(_QWORD *)&v10 = 138412802;
    v24 = v10;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[SAUISystemApertureManager _assertionForElement:](self, "_assertionForElement:", v13, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          if (objc_msgSend(v14, "isValid"))
          {
            if (SAElementIdentityEqualToIdentity())
            {
              v16 = SAUILogManager;
              if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v24;
                v32 = v4;
                v33 = 2112;
                v34 = v13;
                v35 = 2112;
                v36 = v15;
                _os_log_error_impl(&dword_247C5B000, v16, OS_LOG_TYPE_ERROR, "Invalid Client Request: Attempting to register element (%@) with same identity as already registered element (%@) with assertion: %@", buf, 0x20u);
              }
            }
          }
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v9);
  }

  -[SAUISystemApertureManager _assertionForElementCreatingIfNecessary:](self, "_assertionForElementCreatingIfNecessary:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (SAHasIndicatorBehavior())
    {
      v18 = -[SAUISystemApertureManager _elementViewControllerForElement:creatingIfNecessary:](self, "_elementViewControllerForElement:creatingIfNecessary:", v4, 1);
      -[SAUISystemApertureManager _requestHostNeedsLayout](self, "_requestHostNeedsLayout");
    }
    else
    {
      objc_msgSend(v4, "viewProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "systemApertureLayoutSpecifyingOverrider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addBehaviorOverridingParticipant:", self);

      -[SAUISystemApertureManager _elementViewControllerForElement:creatingIfNecessary:](self, "_elementViewControllerForElement:creatingIfNecessary:", v4, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAUISystemApertureManager _invalidatePromotedState](self, "_invalidatePromotedState");
      if (SAHasAlertBehavior() && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak((id *)buf, v17);
        objc_msgSend(v21, "alertAssertion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __45__SAUISystemApertureManager_registerElement___block_invoke;
        v25[3] = &unk_25193CD28;
        objc_copyWeak(&v26, (id *)buf);
        objc_msgSend(v22, "addInvalidationBlock:", v25);

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }

    }
  }

  return v17;
}

- (void)_invalidatePromotedState
{
  SAUISystemApertureManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_promotedStateIsValid)
  {
    obj->_promotedStateIsValid = 0;
    -[SAUISystemApertureManager _invalidateTemporallyOrderedElements](obj, "_invalidateTemporallyOrderedElements");
    -[SAUISystemApertureManager _requestHostNeedsLayout](obj, "_requestHostNeedsLayout");
  }
  objc_sync_exit(obj);

}

- (void)_requestHostNeedsLayout
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "systemApertureManagerRequestsHostNeedsLayout:", self);

}

- (void)_invalidateTemporallyOrderedElements
{
  NSArray *temporallyOrderedElements;
  SAUISystemApertureManager *obj;

  obj = self;
  objc_sync_enter(obj);
  temporallyOrderedElements = obj->_temporallyOrderedElements;
  obj->_temporallyOrderedElements = 0;

  objc_sync_exit(obj);
}

- (NSArray)registeredElements
{
  SAUISystemApertureManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSPointerArray sa_compact](v2->_elements, "sa_compact");
  -[NSPointerArray allObjects](v2->_elements, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)_elementViewControllerForElement:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SAUISystemApertureManager *v7;
  SAUIIndicatorElementViewController *v8;
  BOOL v9;
  NSObject *v10;
  SAUIIndicatorElementViewController *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  id *p_indicatorElementViewController;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  SAUIIndicatorElementViewController *v22;
  NSObject *v23;
  SAUIIndicatorElementViewController *v24;
  void *v25;
  void *v26;
  SAUIMonolithicElementViewController *v27;
  NSObject *v28;
  void *v29;
  NSMapTable *elementsToElementViewControllers;
  uint64_t v31;
  NSMapTable *v32;
  __int128 v34;
  SAUISystemApertureManager *obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  SAUIIndicatorElementViewController *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    obj = v7;
    -[NSMapTable objectForKey:](v7->_elementsToElementViewControllers, "objectForKey:", v6);
    v8 = (SAUIIndicatorElementViewController *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 1;
    else
      v9 = !v4;
    if (v9)
      goto LABEL_47;
    v10 = (id)SAUILogManager;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      MEMORY[0x24958F5B4](v6);
      v11 = (SAUIIndicatorElementViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v11;
      _os_log_impl(&dword_247C5B000, v10, OS_LOG_TYPE_DEFAULT, "Asked to add view controller for element: %{public}@", buf, 0xCu);

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = (void *)-[NSMutableSet copy](v7->_removedElementViewControllers, "copy");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v13)
    {
      v8 = 0;
      v15 = *(_QWORD *)v37;
      p_indicatorElementViewController = (id *)&v7->_indicatorElementViewController;
      *(_QWORD *)&v14 = 138543362;
      v34 = v14;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v18, "elementViewProvider", v34);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "element");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v21 = v20 == v6;

          if (v21)
          {
            v22 = v18;

            -[NSMutableSet removeObject:](obj->_removedElementViewControllers, "removeObject:", v22);
            if (SAHasIndicatorBehavior())
              objc_storeWeak(p_indicatorElementViewController, v22);
            v23 = SAUILogManager;
            if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              v42 = v22;
              _os_log_impl(&dword_247C5B000, v23, OS_LOG_TYPE_DEFAULT, "Adding back element view controller that had been removed: %{public}@", buf, 0xCu);
            }
            v8 = v22;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v13);

      if (v8)
        goto LABEL_44;
    }
    else
    {

    }
    if (SAHasIndicatorBehavior())
    {
      v24 = [SAUIIndicatorElementViewController alloc];
      objc_msgSend(v6, "viewProvider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SAUIIndicatorElementViewController initWithIndicatorElementViewProvider:](v24, "initWithIndicatorElementViewProvider:", v25);

      -[SAUIIndicatorElementViewController setLayoutHost:](v8, "setLayoutHost:", obj);
      objc_storeWeak((id *)&obj->_indicatorElementViewController, v8);
      goto LABEL_43;
    }
    if (((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v6, "hasAlertBehavior") & 1) == 0)
      && ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v6, "hasActivityBehavior")))
    {
      v28 = (id)SAUILogManager;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        MEMORY[0x24958F5B4](v6);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAUISystemApertureManager _elementViewControllerForElement:creatingIfNecessary:].cold.1(v29, buf, v28);
      }

      v8 = 0;
      goto LABEL_47;
    }
    objc_msgSend(v6, "viewProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v27 = -[SAUIMonolithicElementViewController initWithMonolithicElementViewProvider:]([SAUIMonolithicElementViewController alloc], "initWithMonolithicElementViewProvider:", v26);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0)
      {
        v8 = 0;
        goto LABEL_42;
      }
      v27 = -[SAUIElementViewController initWithElementViewProvider:]([SAUIElementViewController alloc], "initWithElementViewProvider:", v26);
    }
    v8 = (SAUIIndicatorElementViewController *)v27;
LABEL_42:
    -[SAUIIndicatorElementViewController setLayoutMode:reason:](v8, "setLayoutMode:reason:", 0, 4);
    -[SAUIIndicatorElementViewController setLayoutHost:](v8, "setLayoutHost:", obj);

LABEL_43:
    if (v8)
    {
LABEL_44:
      elementsToElementViewControllers = obj->_elementsToElementViewControllers;
      if (!elementsToElementViewControllers)
      {
        objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = obj->_elementsToElementViewControllers;
        obj->_elementsToElementViewControllers = (NSMapTable *)v31;

        elementsToElementViewControllers = obj->_elementsToElementViewControllers;
      }
      -[NSMapTable setObject:forKey:](elementsToElementViewControllers, "setObject:forKey:", v8, v6);
      -[SAUIIndicatorElementViewController addElementViewControllingObserver:](v8, "addElementViewControllingObserver:", obj);
    }
LABEL_47:
    objc_sync_exit(obj);

    goto LABEL_48;
  }
  v8 = 0;
LABEL_48:

  return v8;
}

- (SAUIElementViewControlling)indicatorElementViewController
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SAUIElementViewControlling *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_indicatorElementViewController);
  objc_msgSend(WeakRetained, "elementViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUISystemApertureManager _assertionForElement:](self, "_assertionForElement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isValid"))
    v7 = WeakRetained;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)_assertionForElement:(id)a3
{
  id v4;
  SAUISystemApertureManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](v5->_elementsToAssertions, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)_reevaluatePromotedElements
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_247C5B000, log, OS_LOG_TYPE_ERROR, "Element in custom layout mode or with alert behavior isn't first: element: %{public}@; ordered elements: %{public}@",
    buf,
    0x16u);

}

- (id)_temporallyOrderedVisibleAlertAndActivityElements
{
  SAUISystemApertureManager *v2;
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSArray *temporallyOrderedElements;
  NSArray *v14;
  NSArray *v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[SAUISystemApertureManager _compactElements](v2, "_compactElements");
  if (!v2->_temporallyOrderedElements && -[NSPointerArray count](v2->_elements, "count"))
  {
    v3 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSPointerArray count](v2->_elements, "count"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = (void *)-[NSPointerArray copy](v2->_elements, "copy");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
          -[NSMapTable objectForKey:](v2->_elementsToAssertions, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isValid") && (SAHasIndicatorBehavior() & 1) == 0)
          {
            SAUILayoutSpecifyingOverriderForElement(v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "preferredLayoutMode") > 0;

            if (v11)
              -[NSArray addObject:](v3, "addObject:", v8);
          }
          else
          {

          }
          ++v7;
        }
        while (v5 != v7);
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v5 = v12;
      }
      while (v12);
    }

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __78__SAUISystemApertureManager__temporallyOrderedVisibleAlertAndActivityElements__block_invoke;
    v17[3] = &unk_25193D038;
    v17[4] = v2;
    -[NSArray sortUsingComparator:](v3, "sortUsingComparator:", v17);
    temporallyOrderedElements = v2->_temporallyOrderedElements;
    v2->_temporallyOrderedElements = v3;
    v14 = v3;

  }
  v15 = v2->_temporallyOrderedElements;
  objc_sync_exit(v2);

  return v15;
}

- (unint64_t)_maximumNumberOfSimultaneouslyVisibleElements
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "systemApertureManagerMaximumNumberOfSimultaneouslyVisibleElements:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_compactElements
{
  SAUISystemApertureManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[NSPointerArray sa_compact](obj->_elements, "sa_compact"))
    -[SAUISystemApertureManager _invalidateTemporallyOrderedElements](obj, "_invalidateTemporallyOrderedElements");
  objc_sync_exit(obj);

}

- (CGRect)interSensorRegionInContentView:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "interSensorRegionInContentView:", v4);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SAUIRegisterSystemApertureLogging();
}

- (SAUISystemApertureManager)initWithElementAuthority:(id)a3
{
  id v6;
  SAUISystemApertureManager *v7;
  SAUISystemApertureManager *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUISystemApertureManager.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementAuthority"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SAUISystemApertureManager;
  v7 = -[SAUISystemApertureManager init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_elementAuthority, a3);

  return v8;
}

void __45__SAUISystemApertureManager_registerElement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "invalidateWithReason:", v4);

}

- (id)elementViewControllerForElement:(id)a3
{
  return -[SAUISystemApertureManager _elementViewControllerForElement:creatingIfNecessary:](self, "_elementViewControllerForElement:creatingIfNecessary:", a3, 0);
}

- (void)elementRequestsNegativeResponse:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "elementRequestsNegativeResponse:", v5);

}

- (void)elementRequestsSignificantUpdateTransition:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "elementRequestsSignificantUpdateTransition:", v5);

}

- (double)alertingDurationForHost:(id)a3
{
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  void *v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(WeakRetained, "alertingDurationForHost:", v5);
  v8 = v7;

  return v8;
}

- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3
{
  id v4;
  id WeakRetained;

  if (a3)
  {
    v4 = a3;
    -[SAUISystemApertureManager _invalidatePromotedState](self, "_invalidatePromotedState");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", v4);

  }
}

- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3
{
  SAUISystemApertureManagerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  if (a3)
  {
    p_delegate = &self->_delegate;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", v4);

  }
}

- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3
{
  SAUISystemApertureManagerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  if (a3)
  {
    p_delegate = &self->_delegate;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "menuPresentationRequestDidChangeForLayoutSpecifier:", v4);

  }
}

- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSDirectionalEdgeInsets result;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "edgeOutsetsForSize:", width, height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.trailing = v17;
  result.bottom = v16;
  result.leading = v15;
  result.top = v14;
  return result;
}

- (void)preferredPromotionDidInvalidateForLayoutSpecifier:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[SAUISystemApertureManager _invalidatePromotedState](self, "_invalidatePromotedState");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "preferredPromotionDidInvalidateForLayoutSpecifier:", v6);

    v4 = v6;
  }

}

- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "concentricPaddingForProvidedView:fromViewProvider:", v6, v7);
    v9 = v10;
  }

  return v9;
}

- (CGRect)sensorRegionObstructingViewProvider:(id)a3 inContentView:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sensorRegionObstructingViewProvider:inContentView:", v6, v7);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v10 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)sensorRegionInContentView:(id)a3 fromViewProvider:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "sensorRegionInContentView:fromViewProvider:", v6, v7);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v10 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)viewProviderShouldMakeSensorShadowVisible:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "viewProviderShouldMakeSensorShadowVisible:", v4);
  else
    v6 = 0;

  return v6;
}

- (double)viewProviderSensorShadowOpacityFactor:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "viewProviderSensorShadowOpacityFactor:", v4);
    v6 = v7;
  }

  return v6;
}

- (CGSize)maximumAvailableSizeForProvidedMinimalView:(id)a3 fromViewProvider:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "maximumAvailableSizeForProvidedMinimalView:fromViewProvider:", v6, v7);
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v10 = *MEMORY[0x24BDBF148];
    v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedLeadingView:(id)a3 fromViewProvider:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "maximumAvailableSizeForProvidedLeadingView:fromViewProvider:", v6, v7);
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v10 = *MEMORY[0x24BDBF148];
    v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedTrailingView:(id)a3 fromViewProvider:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "maximumAvailableSizeForProvidedTrailingView:fromViewProvider:", v6, v7);
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v10 = *MEMORY[0x24BDBF148];
    v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_axLayoutSpecifierRequestsDiminishment:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_axLayoutSpecifierRequestsDiminishment:", v5);

}

- (BOOL)_axLayoutSpecifierRequestsCollapseIfExpandedByUserInteraction:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "_axLayoutSpecifierRequestsCollapseIfExpandedByUserInteraction:", v4);
  else
    v6 = 0;

  return v6;
}

- (int64_t)behaviorOverridingRole
{
  return 2;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v8 = a5;
  v9 = objc_msgSend(v8, "layoutMode");
  objc_msgSend(v8, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_setLayoutMode_reason_forTargetWithOverrider_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLayoutMode:reason:forTargetWithOverrider:", a3, a4, v8);

  v11 = objc_msgSend(v8, "layoutMode");
  if (v9 != v11)
    -[SAUISystemApertureManager _invalidatePromotedState](self, "_invalidatePromotedState");
}

- (void)elementViewControllingDidDisappear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "elementViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUISystemApertureManager _assertionForElement:](self, "_assertionForElement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValid");

  if ((v7 & 1) == 0)
  {
    v8 = objc_opt_class();
    v9 = v12;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    -[SAUISystemApertureManager _removeElementViewController:](self, "_removeElementViewController:", v11);
    -[SAUISystemApertureManager _purgeRemovedElementViewControllers](self, "_purgeRemovedElementViewControllers");
  }

}

- (void)_removeElementViewController:(id)a3
{
  id v4;
  NSObject *v5;
  SAUISystemApertureManager *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSMutableSet *removedElementViewControllers;
  NSMutableSet *v12;
  NSMutableSet *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SAUILogManager;
  if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v4;
    _os_log_impl(&dword_247C5B000, v5, OS_LOG_TYPE_DEFAULT, "Asked to remove element view controller: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  if (v4)
  {
    v6 = self;
    objc_sync_enter(v6);
    objc_msgSend(v4, "elementViewProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "element");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SAUISystemApertureManager elementViewControllerForElement:](v6, "elementViewControllerForElement:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v4)
    {
      removedElementViewControllers = v6->_removedElementViewControllers;
      if (!removedElementViewControllers)
      {
        v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v13 = v6->_removedElementViewControllers;
        v6->_removedElementViewControllers = v12;

        removedElementViewControllers = v6->_removedElementViewControllers;
      }
      -[NSMutableSet addObject:](removedElementViewControllers, "addObject:", v4);
      -[NSMapTable removeObjectForKey:](v6->_elementsToElementViewControllers, "removeObjectForKey:", v8);
      objc_msgSend(v4, "removeElementViewControllingObserver:", v6);
      v14 = SAUILogManager;
      if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543362;
        v17 = v4;
        _os_log_impl(&dword_247C5B000, v14, OS_LOG_TYPE_DEFAULT, "Removed element view controller: %{public}@", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      v10 = (id)SAUILogManager;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        MEMORY[0x24958F5B4](v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v15;
        v18 = 2114;
        v19 = v9;
        v20 = 2114;
        v21 = v4;
        _os_log_error_impl(&dword_247C5B000, v10, OS_LOG_TYPE_ERROR, "Asked to remove element view controller with element that is associated with a different view controller: element: %{public}@; expected view controller: %{public}@; argument view controller: %{public}@",
          (uint8_t *)&v16,
          0x20u);

      }
    }

    objc_sync_exit(v6);
  }

}

- (void)_purgeRemovedElementViewControllers
{
  SAUISystemApertureManager *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)-[NSMutableSet copy](v2->_removedElementViewControllers, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138543362;
    v15 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = SAUILogManager;
        if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          v21 = v8;
          _os_log_impl(&dword_247C5B000, v9, OS_LOG_TYPE_DEFAULT, "Purging removed element view controller: %{public}@", buf, 0xCu);
        }
        -[NSMutableSet removeObject:](v2->_removedElementViewControllers, "removeObject:", v8, v15);
        objc_msgSend(v8, "elementViewProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "element");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SAUISystemApertureManager _invalidatedAssertionForElement:](v2, "_invalidatedAssertionForElement:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAUISystemApertureManager _removeInvalidatedAssertionForElement:](v2, "_removeInvalidatedAssertionForElement:", v11);
        SAUILayoutSpecifyingOverriderForElement(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          v14 = objc_msgSend(v12, "invalidationLayoutModeChangeReason");
        else
          v14 = 0;
        objc_msgSend(v13, "setLayoutMode:reason:", -1, v14);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __78__SAUISystemApertureManager__temporallyOrderedVisibleAlertAndActivityElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  _QWORD v12[5];

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__SAUISystemApertureManager__temporallyOrderedVisibleAlertAndActivityElements__block_invoke_2;
  v12[3] = &unk_25193D010;
  v12[4] = *(_QWORD *)(a1 + 32);
  v4 = a3;
  v5 = a2;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x24958F7F4](v12);
  ((void (**)(_QWORD, id))v6)[2](v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, id))v6)[2](v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  if (v9 > 0.0)
    v10 = 1;
  else
    v10 = -1;

  return v10;
}

id __78__SAUISystemApertureManager__temporallyOrderedVisibleAlertAndActivityElements__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (SAHasActivityBehavior())
  {
    objc_msgSend(*(id *)(a1 + 32), "elementViewControllerForElement:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "temporallyOrderedAlertingActivityAssertions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v8, "creationDate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v5;
    v12 = v11;

    v5 = v12;
  }

  return v5;
}

- (BOOL)_elementRequiresBeingDisplayedAlone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;

  v4 = a3;
  if ((SAHasAlertBehavior() & 1) != 0
    || (SAUILayoutSpecifyingOverriderForElement(v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "layoutModePreference"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "preferredLayoutMode"),
        v6,
        v5,
        v7 == 3))
  {
    v8 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = -[SAElementConsidering elementRequiresBeingDisplayedAlone:](self->_elementAuthority, "elementRequiresBeingDisplayedAlone:", v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __56__SAUISystemApertureManager__reevaluatePromotedElements__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "elementViewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __56__SAUISystemApertureManager__reevaluatePromotedElements__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "elementViewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x24958F5B4]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_elementAssertionDidInvalidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)SAUILogManager;
  if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    MEMORY[0x24958F5B4](v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_247C5B000, v7, OS_LOG_TYPE_DEFAULT, "Assertion for element did invalidate: %{public}@", (uint8_t *)&v14, 0xCu);

  }
  -[SAUISystemApertureManager _addInvalidatedAssertion:forElement:](self, "_addInvalidatedAssertion:forElement:", v4, v5);

  -[SAUISystemApertureManager _removeAssertionForElement:](self, "_removeAssertionForElement:", v5);
  -[SAUISystemApertureManager elementViewControllerForElement:](self, "elementViewControllerForElement:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (!objc_msgSend(v9, "isViewLoaded") || !objc_msgSend(v10, "_appearState")))
  {
    v11 = (void *)SAUILogManager;
    if (os_log_type_enabled((os_log_t)SAUILogManager, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      MEMORY[0x24958F5B4](v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_247C5B000, v12, OS_LOG_TYPE_DEFAULT, "Removing unpresented element view controller for invalidated element: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    -[SAUISystemApertureManager _removeElementViewController:](self, "_removeElementViewController:", v10);
    -[SAUISystemApertureManager _purgeRemovedElementViewControllers](self, "_purgeRemovedElementViewControllers");
  }
  if (SAHasIndicatorBehavior())
    -[SAUISystemApertureManager _requestHostNeedsLayout](self, "_requestHostNeedsLayout");
  else
    -[SAUISystemApertureManager _invalidatePromotedState](self, "_invalidatePromotedState");

}

void __69__SAUISystemApertureManager__assertionForElementCreatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_opt_class();
  v8 = v3;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(WeakRetained, "_elementAssertionDidInvalidate:", v7);
}

- (void)_removeAssertionForElement:(id)a3
{
  id v4;
  SAUISystemApertureManager *v5;
  void *v6;
  unint64_t i;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[SAUISystemApertureManager _assertionForElement:](v5, "_assertionForElement:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SAUISystemApertureManager _compactElements](v5, "_compactElements");
      for (i = 0; i < -[NSPointerArray count](v5->_elements, "count"); ++i)
      {
        if (-[NSPointerArray pointerAtIndex:](v5->_elements, "pointerAtIndex:", i) == v8)
        {
          if (i != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[NSPointerArray removePointerAtIndex:](v5->_elements, "removePointerAtIndex:", i);
            -[NSMapTable removeObjectForKey:](v5->_elementsToAssertions, "removeObjectForKey:", v8);
            -[SAUISystemApertureManager _compactElements](v5, "_compactElements");
            -[SAUISystemApertureManager _invalidateTemporallyOrderedElements](v5, "_invalidateTemporallyOrderedElements");
          }
          break;
        }
      }
    }

    objc_sync_exit(v5);
    v4 = v8;
  }

}

- (void)_addInvalidatedAssertion:(id)a3 forElement:(id)a4
{
  id v7;
  SAUISystemApertureManager *v8;
  NSMapTable *elementsToInvalidatedAssertions;
  uint64_t v10;
  NSMapTable *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (v7)
  {
    if (!v13 || objc_msgSend(v13, "isValid"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUISystemApertureManager.m"), 617, CFSTR("Invalidated assertion argument either missing, or valid: %@"), v13);

    }
    v8 = self;
    objc_sync_enter(v8);
    elementsToInvalidatedAssertions = v8->_elementsToInvalidatedAssertions;
    if (!elementsToInvalidatedAssertions)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v8->_elementsToInvalidatedAssertions;
      v8->_elementsToInvalidatedAssertions = (NSMapTable *)v10;

      elementsToInvalidatedAssertions = v8->_elementsToInvalidatedAssertions;
    }
    -[NSMapTable setObject:forKey:](elementsToInvalidatedAssertions, "setObject:forKey:", v13, v7);
    objc_sync_exit(v8);

  }
}

- (id)_invalidatedAssertionForElement:(id)a3
{
  id v4;
  SAUISystemApertureManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](v5->_elementsToInvalidatedAssertions, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)_removeInvalidatedAssertionForElement:(id)a3
{
  SAUISystemApertureManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMapTable removeObjectForKey:](v4->_elementsToInvalidatedAssertions, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (SAUISystemApertureManagerDelegate)delegate
{
  return (SAUISystemApertureManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedElementViewControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_indicatorElementViewController);
  objc_storeStrong((id *)&self->_mostPromotedElements, 0);
  objc_storeStrong((id *)&self->_temporallyOrderedElements, 0);
  objc_storeStrong((id *)&self->_elementsToInvalidatedAssertions, 0);
  objc_storeStrong((id *)&self->_elementsToAssertions, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_removedElementViewControllers, 0);
  objc_storeStrong((id *)&self->_elementsToElementViewControllers, 0);
  objc_storeStrong((id *)&self->_elementAuthority, 0);
}

- (void)_elementViewControllerForElement:(os_log_t)log creatingIfNecessary:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_247C5B000, log, OS_LOG_TYPE_ERROR, "Attempt to add element that has no known behavior: %{public}@", buf, 0xCu);

}

@end

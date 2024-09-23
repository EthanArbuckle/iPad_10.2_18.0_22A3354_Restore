@implementation _UISystemGestureManager

+ (id)sharedInstance
{
  if (_MergedGlobals_1072 != -1)
    dispatch_once(&_MergedGlobals_1072, &__block_literal_global_260);
  return (id)qword_1ECD7E050;
}

- (_UISystemGestureManager)init
{
  _UISystemGestureManager *v4;
  uint64_t v5;
  NSMutableDictionary *displayIdentityToManagerMap;
  FBSDisplayMonitor *v7;
  FBSDisplayMonitor *displayMonitor;
  void *v10;
  objc_super v11;

  if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 56, CFSTR("Only FrontBoard apps may use UISystemGestureManager."));

  }
  v11.receiver = self;
  v11.super_class = (Class)_UISystemGestureManager;
  v4 = -[_UISystemGestureManager init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    displayIdentityToManagerMap = v4->_displayIdentityToManagerMap;
    v4->_displayIdentityToManagerMap = (NSMutableDictionary *)v5;

    v7 = (FBSDisplayMonitor *)objc_alloc_init(MEMORY[0x1E0D23100]);
    displayMonitor = v4->_displayMonitor;
    v4->_displayMonitor = v7;

    -[FBSDisplayMonitor addObserver:](v4->_displayMonitor, "addObserver:", v4);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayMonitor invalidate](self->_displayMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UISystemGestureManager;
  -[_UISystemGestureManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISystemGestureManager;
  -[_UISystemGestureManager description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - _displayIdentityToManagerMap : %@"), self->_displayIdentityToManagerMap);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)addGestureRecognizer:(id)a3 toDisplayWithIdentity:(id)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

  }
  -[_UISystemGestureManager _displayIdentityForTrackingGestureManagers:](self, "_displayIdentityForTrackingGestureManagers:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    -[NSMapTable objectForKey:](self->_systemShellManagedDisplayIdentityToInvalidatableMap, "objectForKey:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 78, CFSTR("Attempting to manage gesture recognizers on an unmanaged display: %@"), v12);

    }
  }
  -[_UISystemGestureManager _systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:](self, "_systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addGestureRecognizer:", a3);

}

- (void)addGestureRecognizer:(id)a3 recognitionEvent:(int64_t)a4 toDisplayWithIdentity:(id)a5
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

  }
  -[_UISystemGestureManager _displayIdentityForTrackingGestureManagers:](self, "_displayIdentityForTrackingGestureManagers:", a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    -[NSMapTable objectForKey:](self->_systemShellManagedDisplayIdentityToInvalidatableMap, "objectForKey:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 86, CFSTR("Attempting to manage gesture recognizers on an unmanaged display: %@"), v14);

    }
  }
  -[_UISystemGestureManager _systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:](self, "_systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:recognitionEvent:", a3, a4);

}

- (void)removeGestureRecognizer:(id)a3 fromDisplayWithIdentity:(id)a4
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

    if (a4)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_10;
LABEL_3:
  -[_UISystemGestureManager _displayIdentityForTrackingGestureManagers:](self, "_displayIdentityForTrackingGestureManagers:", a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    -[NSMapTable objectForKey:](self->_systemShellManagedDisplayIdentityToInvalidatableMap, "objectForKey:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 95, CFSTR("Attempting to manage gesture recognizers on an unmanaged display: %@"), v15);

    }
  }
  -[NSMutableDictionary objectForKey:](self->_displayIdentityToManagerMap, "objectForKey:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeGestureRecognizer:", a3);
  objc_msgSend(v9, "gestureRecognizers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    -[NSMutableDictionary removeObjectForKey:](self->_displayIdentityToManagerMap, "removeObjectForKey:", v15);

}

- (id)windowForSystemGesturesForDisplayWithIdentity:(id)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 106, CFSTR("You can't get a window for system gestures without a display."));

  }
  -[_UISystemGestureManager _displayIdentityForTrackingGestureManagers:](self, "_displayIdentityForTrackingGestureManagers:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:", v6))
  {
    -[NSMapTable objectForKey:](self->_systemShellManagedDisplayIdentityToInvalidatableMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 108, CFSTR("Attempting to manage gesture recognizers on an unmanaged display: %@"), v6);

    }
  }
  -[NSMutableDictionary objectForKey:](self->_displayIdentityToManagerMap, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowForSystemGestures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)allowGestureRecognizersOnDisplayWithIdentity:(id)a3
{
  void *v6;
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSMapTable *systemShellManagedDisplayIdentityToInvalidatableMap;
  uint64_t v21;
  NSMapTable **p_systemShellManagedDisplayIdentityToInvalidatableMap;
  NSMapTable *v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 115, CFSTR("You cannot manage gesture recognizers without a display."));

  }
  -[NSMapTable objectForKey:](self->_systemShellManagedDisplayIdentityToInvalidatableMap, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 118, CFSTR("We're already tracking system gestures for this display: %@"), v6);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = self->_systemShellManagedDisplayIdentityToInvalidatableMap;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "rootIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", a3);

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 122, CFSTR("We're already tracking system gestures for a display with the same rootIdentity. These assertions must be mutually exclusive."));

        }
      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  -[_UISystemGestureManager _displayIdentityForTrackingGestureManagers:](self, "_displayIdentityForTrackingGestureManagers:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.UIKit._UISystemGestureManager.%@"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C80D38];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __72___UISystemGestureManager_allowGestureRecognizersOnDisplayWithIdentity___block_invoke;
  v27[3] = &unk_1E16C9090;
  objc_copyWeak(&v29, &location);
  v18 = v14;
  v28 = v18;
  v19 = (void *)objc_msgSend(v15, "initWithIdentifier:forReason:queue:invalidationBlock:", v16, CFSTR("__UISystemGestureManager.lifecycle"), MEMORY[0x1E0C80D38], v27);

  systemShellManagedDisplayIdentityToInvalidatableMap = self->_systemShellManagedDisplayIdentityToInvalidatableMap;
  if (!systemShellManagedDisplayIdentityToInvalidatableMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    v23 = self->_systemShellManagedDisplayIdentityToInvalidatableMap;
    p_systemShellManagedDisplayIdentityToInvalidatableMap = &self->_systemShellManagedDisplayIdentityToInvalidatableMap;
    *p_systemShellManagedDisplayIdentityToInvalidatableMap = (NSMapTable *)v21;

    systemShellManagedDisplayIdentityToInvalidatableMap = *p_systemShellManagedDisplayIdentityToInvalidatableMap;
  }
  -[NSMapTable setObject:forKey:](systemShellManagedDisplayIdentityToInvalidatableMap, "setObject:forKey:", v19, v18);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v19;
}

- (BOOL)gestureRecognizersAllowedOnDisplayWithIdentity:(id)a3
{
  void *v5;
  BOOL v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  if (!-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:", a3))
    return 1;
  -[NSMapTable objectForKey:](self->_systemShellManagedDisplayIdentityToInvalidatableMap, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)setTransform:(CGAffineTransform *)a3 onDisplayWithIdentity:(id)a4
{
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  void *v13;
  _OWORD v14[3];

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  -[_UISystemGestureManager _displayIdentityForTrackingGestureManagers:](self, "_displayIdentityForTrackingGestureManagers:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:", v8))
  {
    -[NSMapTable objectForKey:](self->_systemShellManagedDisplayIdentityToInvalidatableMap, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 164, CFSTR("Attempting to manage gesture recognizers on an unmanaged display: %@"), v8);

    }
  }
  -[_UISystemGestureManager _systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:](self, "_systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v11;
  v14[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v10, "setTransform:", v14);

}

- (void)clearTransformFromDisplayWithIdentity:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UISystemGestureManager _displayIdentityForTrackingGestureManagers:](self, "_displayIdentityForTrackingGestureManagers:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    -[NSMapTable objectForKey:](self->_systemShellManagedDisplayIdentityToInvalidatableMap, "objectForKey:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 171, CFSTR("Attempting to manage gesture recognizers on an unmanaged display: %@"), v8);

    }
  }
  -[_UISystemGestureManager _systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:](self, "_systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearTransform");

}

+ (void)_cancelTouchesWithIdentifiers:(id)a3 forDisplayWithIdentity:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "windowForSystemGesturesForDisplayWithIdentity:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend((id)UIApp, "_touchesEventForWindow:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "_touchesForWindow:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          v22 = v10;
          v23 = v7;
          v12 = (void *)objc_opt_new();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v21 = v11;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v18, "_touchIdentifier", v21));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(a3, "containsObject:", v19);

                if (v20)
                  objc_msgSend(v12, "addObject:", v18);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            }
            while (v15);
          }

          v10 = v22;
          objc_msgSend((id)UIApp, "_cancelTouchesOrPresses:withEvent:", v12, v22);

          v7 = v23;
          v11 = v21;
        }

      }
    }

  }
}

- (BOOL)_displayRequiresClientManagement:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "isExternal");
  if (v4)
  {
    if ((objc_msgSend(a3, "isMainDisplay") & 1) != 0 || (objc_msgSend(a3, "isCarDisplay") & 1) != 0)
      LOBYTE(v4) = 0;
    else
      LOBYTE(v4) = objc_msgSend(a3, "isCarInstrumentsDisplay") ^ 1;
  }
  return v4;
}

- (id)_displayIdentityForTrackingGestureManagers:(id)a3
{
  id v4;

  if (-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:"))
  {
    v4 = a3;
  }
  else
  {
    objc_msgSend(a3, "rootIdentity");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)_sharedInstanceIfExists
{
  return (id)qword_1ECD7E050;
}

- (id)_systemGestureManagerForDisplayWithIdentityCreatingIfNeeded:(id)a3
{
  __UISystemGestureManager *v6;
  void *v8;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  if (!-[_UISystemGestureManager _displayRequiresClientManagement:](self, "_displayRequiresClientManagement:", a3)
    && (objc_msgSend(a3, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemGestureManager.m"), 241, CFSTR("displayIdentity is not a rootIdentity"));

  }
  -[NSMutableDictionary objectForKey:](self->_displayIdentityToManagerMap, "objectForKey:", a3);
  v6 = (__UISystemGestureManager *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[__UISystemGestureManager initWithDisplayIdentity:]([__UISystemGestureManager alloc], "initWithDisplayIdentity:", a3);
    -[NSMutableDictionary setObject:forKey:](self->_displayIdentityToManagerMap, "setObject:forKey:", v6, a3);
  }
  return v6;
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  -[NSMutableDictionary removeObjectForKey:](self->_displayIdentityToManagerMap, "removeObjectForKey:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_systemShellManagedDisplayIdentityToInvalidatableMap, 0);
  objc_storeStrong((id *)&self->_displayIdentityToManagerMap, 0);
}

@end

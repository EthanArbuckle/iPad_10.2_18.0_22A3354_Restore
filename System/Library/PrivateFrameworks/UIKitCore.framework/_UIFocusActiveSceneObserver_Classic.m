@implementation _UIFocusActiveSceneObserver_Classic

- (id)_initWithScene:(id)a3
{
  _BYTE *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIFocusActiveSceneObserver_Classic;
  v3 = -[_UIFocusActiveSceneObserver _initWithScene:](&v15, sel__initWithScene_, a3);
  v4 = v3;
  if (v3)
  {
    v3[40] |= 1u;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[4];
    v4[4] = v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__screenUUIDDidChangeNotification_, CFSTR("_UIScreenUniqueIdDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel__keyWindowDidChangeNotification_, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);

    if (qword_1ECD79AC0 != -1)
      dispatch_once(&qword_1ECD79AC0, &__block_literal_global_59);
    if (_MergedGlobals_13_1)
    {
      v9 = (void *)MEMORY[0x1E0C99E88];
      v10 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusActiveSceneObserverLoggingInterval, (uint64_t)CFSTR("FocusActiveSceneObserverLoggingInterval"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      v11 = *(double *)&qword_1EDDA7DD8;
      if (v10)
        v11 = 10.0;
      objc_msgSend(v9, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v4, sel__fireInactiveFocusObserver_, 0, 1, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v4[6];
      v4[6] = v12;

    }
  }
  return v4;
}

- (void)_fireInactiveFocusObserver:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  _BOOL8 v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_inactiveSceneObserverTimer == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);
    objc_msgSend(WeakRetained, "_focusSystemSceneComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[_UIFocusActiveSceneObserver_Classic isActive](self, "isActive");
    if (objc_msgSend(v6, "_isEnabled"))
    {
      objc_msgSend(v6, "_overrideFocusDeferralBehavior");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v6, "_overrideFocusDeferralBehavior");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", &unk_1E1A96E40);

      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "focusedItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 & v10 && v11)
    {
      v12 = qword_1ECD79AC8;
      if (!qword_1ECD79AC8)
      {
        v12 = __UILogCategoryGetNode("FocusActiveSceneObserver", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&qword_1ECD79AC8);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        -[_UIFocusStateObserver description](self, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v15;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "Focus Active Scene Observer successfully detected focus.\n%@", (uint8_t *)&v25, 0xCu);

      }
    }
    else
    {
      v16 = qword_1ECD79AD0;
      if (!qword_1ECD79AD0)
      {
        v16 = __UILogCategoryGetNode("FocusActiveSceneObserver", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD79AD0);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v11 != 0;
        v19 = (void *)MEMORY[0x1E0CB37E8];
        v20 = v17;
        objc_msgSend(v19, "numberWithBool:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusStateObserver description](self, "description");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138413058;
        v26 = v21;
        v27 = 2112;
        v28 = v22;
        v29 = 2112;
        v30 = v23;
        v31 = 2112;
        v32 = v24;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "Focus Active Scene Observer failed to detect focus.\nEvent deferral active: %@, FocusSystem enabled: %@, has focused item: %@.\n%@", (uint8_t *)&v25, 0x2Au);

      }
    }

  }
  else
  {
    objc_msgSend(a3, "invalidate");
  }
}

- (void)beginMonitoringContextChangesForWindow:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__windowDidAttachContext_, _UIWindowDidAttachContextNotification, v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__windowDidDetachContext_, _UIWindowDidDetachContextNotification, v6);

    -[_UIFocusActiveSceneObserver_Classic _addDeliveryObserverForWindow:](self, "_addDeliveryObserverForWindow:", v6);
  }
  else
  {
    -[_UIFocusStateObserver notifyObserversIfNecessary](self, "notifyObserversIfNecessary");
  }

}

- (void)stopMonitoringContextChangesForWindow:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, _UIWindowDidAttachContextNotification, v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, _UIWindowDidDetachContextNotification, v6);

    -[_UIFocusActiveSceneObserver_Classic _removeDeliverObserverForWindow:](self, "_removeDeliverObserverForWindow:", v6);
  }
  else
  {
    -[_UIFocusStateObserver notifyObserversIfNecessary](self, "notifyObserversIfNecessary");
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSTimer *inactiveSceneObserverTimer;
  NSTimer *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("_UIWindowDidBecomeApplicationKeyNotification");
  v18[1] = _UIWindowDidAttachContextNotification;
  v18[2] = _UIWindowDidDetachContextNotification;
  v18[3] = CFSTR("_UIScreenUniqueIdDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_hidObserverMapTable, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "removeObserver:", self);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  inactiveSceneObserverTimer = self->_inactiveSceneObserverTimer;
  if (inactiveSceneObserverTimer)
  {
    -[NSTimer invalidate](inactiveSceneObserverTimer, "invalidate");
    v11 = self->_inactiveSceneObserverTimer;
    self->_inactiveSceneObserverTimer = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusActiveSceneObserver_Classic;
  -[_UIFocusActiveSceneObserver_Classic dealloc](&v12, sel_dealloc);
}

- (BOOL)isActive
{
  id v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned int v9;
  BOOL v10;
  id v11;
  id WeakRetained;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable keyEnumerator](self->_hidObserverMapTable, "keyEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(v4);
          v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          -[NSMapTable objectForKey:](self->_hidObserverMapTable, "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "canReceiveEvents"))
          {
            v3 = v7;

            goto LABEL_13;
          }

        }
        v3 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v3, sel_allowsWeakReference);
  if (v3)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v3, "windowScene");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);
    v13 = v11 == WeakRetained;

  }
  return v13;
}

- (void)_addDeliveryObserverForWindow:(id)a3
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "_contextId");
  if (v13)
  {
    if ((*(_BYTE *)&self->_flags & 1) != 0 && v4 != 0)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D00CD0]);
      objc_msgSend(v13, "screen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hardwareIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIFocusActiveSceneObserver_Classic _resolvedDisplayForWindow:](self, "_resolvedDisplayForWindow:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDisplay:", v10);

      objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDeferringEnvironment:", v11);

      objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForIdentifierOfCAContext:", objc_msgSend(v13, "_contextId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDeferringToken:", v12);

      objc_msgSend(v6, "addObserver:", self);
      -[NSMapTable setObject:forKey:](self->_hidObserverMapTable, "setObject:forKey:", v6, v13);
      -[_UIFocusStateObserver notifyObserversIfNecessary](self, "notifyObserversIfNecessary");

    }
  }

}

- (id)_resolvedDisplayForWindow:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:", v5);
  else
    objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeDeliverObserverForWindow:(id)a3
{
  NSMapTable *hidObserverMapTable;
  id v5;
  id v6;

  hidObserverMapTable = self->_hidObserverMapTable;
  v5 = a3;
  -[NSMapTable objectForKey:](hidObserverMapTable, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);
  -[NSMapTable removeObjectForKey:](self->_hidObserverMapTable, "removeObjectForKey:", v5);

  -[_UIFocusStateObserver notifyObserversIfNecessary](self, "notifyObserversIfNecessary");
}

- (void)_windowDidAttachContext:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v9 = v7;

  v8 = v9;
  if (v9)
  {
    -[_UIFocusActiveSceneObserver_Classic _addDeliveryObserverForWindow:](self, "_addDeliveryObserverForWindow:", v9);
    v8 = v9;
  }

}

- (void)_windowDidDetachContext:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v9 = v7;

  v8 = v9;
  if (v9)
  {
    -[_UIFocusActiveSceneObserver_Classic _removeDeliverObserverForWindow:](self, "_removeDeliverObserverForWindow:", v9);
    v8 = v9;
  }

}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___UIFocusActiveSceneObserver_Classic_observerDeliveryPolicyDidChange___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_screenUUIDDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _UIFocusActiveSceneObserver_Classic *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    NSAllMapTableKeys(self->_hidObserverMapTable);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72___UIFocusActiveSceneObserver_Classic__screenUUIDDidChangeNotification___block_invoke;
    v12[3] = &unk_1E16B51E8;
    v13 = v10;
    v14 = v9;
    v15 = self;
    v16 = v4;
    v11 = v10;
    -[_UIFocusStateObserver performUpdatesAndNotifyObservers:](self, "performUpdatesAndNotifyObservers:", v12);

  }
}

- (void)_keyWindowDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___UIFocusActiveSceneObserver_Classic__keyWindowDidChangeNotification___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (id)descriptionBuilder
{
  void *v3;
  id WeakRetained;
  _BYTE *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIFocusActiveSceneObserver_Classic;
  -[_UIFocusStateObserver descriptionBuilder](&v9, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);
  v5 = (_BYTE *)descriptionBuilder___s_category;
  if (!descriptionBuilder___s_category)
  {
    v5 = (_BYTE *)(__UILogCategoryGetNode("FocusActiveSceneObserver", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
    atomic_store((unint64_t)v5, (unint64_t *)&descriptionBuilder___s_category);
  }
  v6 = (id)objc_msgSend(v3, "appendName:object:usingLightweightDescription:", CFSTR("scene"), WeakRetained, (*v5 & 1) == 0);

  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("hidObserverMapTable"), self->_hidObserverMapTable);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveSceneObserverTimer, 0);
  objc_storeStrong((id *)&self->_hidObserverMapTable, 0);
}

@end

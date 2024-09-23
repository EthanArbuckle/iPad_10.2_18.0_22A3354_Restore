@implementation TUIHoverController

- (void)updateHoverInteractionWithView:(id)a3
{
  TUIHoverInteraction *hoverInteraction;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  TUIHoverInteraction *v9;
  TUIHoverInteraction *v10;
  id v11;

  v11 = a3;
  hoverInteraction = self->_hoverInteraction;
  if (!hoverInteraction)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_axChanged:", kAXSApplicationAccessibilityEnabledNotification, 0);

    hoverInteraction = self->_hoverInteraction;
    if (!hoverInteraction)
      goto LABEL_5;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TUIHoverInteraction view](hoverInteraction, "view"));

  v7 = v11;
  if (v6 != v11)
  {
    hoverInteraction = self->_hoverInteraction;
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHoverInteraction view](hoverInteraction, "view"));
    objc_msgSend(v8, "removeInteraction:", self->_hoverInteraction);

    v9 = -[TUIHoverInteraction initWithDelegate:view:]([TUIHoverInteraction alloc], "initWithDelegate:view:", self, v11);
    v10 = self->_hoverInteraction;
    self->_hoverInteraction = v9;

    objc_msgSend(v11, "addInteraction:", self->_hoverInteraction);
    v7 = v11;
  }

}

- (void)reset
{
  void *v3;
  void *v4;
  TUIHoverInteraction *hoverInteraction;

  if (self->_hoverInteraction)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, kAXSApplicationAccessibilityEnabledNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHoverInteraction view](self->_hoverInteraction, "view"));
    objc_msgSend(v4, "removeInteraction:", self->_hoverInteraction);

    hoverInteraction = self->_hoverInteraction;
    self->_hoverInteraction = 0;

  }
}

- (void)_axChanged:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHoverInteraction view](self->_hoverInteraction, "view", a3));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIHoverInteraction view](self->_hoverInteraction, "view"));
    -[TUIHoverController notifyHoverChangesAffectingView:changed:](self, "notifyHoverChangesAffectingView:changed:", v5, 0);

  }
}

- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4
{
  TUIHoverInteraction *hoverInteraction;
  id v6;
  id v7;

  hoverInteraction = self->_hoverInteraction;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[TUIHoverInteraction view](hoverInteraction, "view"));
  -[TUIHoverController notifyHoverChangesAffectingView:changed:](self, "notifyHoverChangesAffectingView:changed:", v7, v6);

}

- (BOOL)hoverStateForIdentifier:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    v5 = 1;
  }
  else
  {
    v5 = -[TUIHoverInteraction stateForRegionWithKey:](self->_hoverInteraction, "stateForRegionWithKey:", v4);
  }

  return v5;
}

- (void)registerHoverObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)unregisterHoverObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)notifyHoverChangesAffectingView:(id)a3 changed:(id)a4
{
  id v6;
  id v7;
  NSHashTable *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isDescendantOfView:", v6, (_QWORD)v14))
          objc_msgSend(v13, "hoverStateChanged:", v7);
      }
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (TUIHoverInteraction)hoverInteraction
{
  return self->_hoverInteraction;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_hoverInteraction, 0);
}

@end

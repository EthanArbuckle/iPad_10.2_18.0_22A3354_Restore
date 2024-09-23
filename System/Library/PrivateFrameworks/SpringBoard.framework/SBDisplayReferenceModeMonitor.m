@implementation SBDisplayReferenceModeMonitor

- (int64_t)referenceModeStatusForDisplayWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v9;

  v5 = a3;
  if (!+[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:](SBDisplayReferenceModeMonitor, "canAddObserverForDisplayWithConfiguration:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayReferenceModeMonitor.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:configuration]"));

  }
  -[SBDisplayReferenceModeMonitor _displayForConfiguration:](self, "_displayForConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDisplayReferenceModeMonitor _referenceModeStatusForDisplay:](self, "_referenceModeStatusForDisplay:", v6);

  return v7;
}

+ (BOOL)canAddObserverForDisplayWithConfiguration:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)_referenceModeStatusForDisplay:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isReference") & 1) != 0 || objc_msgSend(v3, "isReferenceLimited"))
  {
    if (objc_msgSend(v3, "isReferenceLimited"))
      v4 = 2;
    else
      v4 = 3;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "availablePresets", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      v4 = 1;
LABEL_8:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "isReference") & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v7)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      v4 = 0;
    }

  }
  return v4;
}

- (id)_displayForConfiguration:(id)a3
{
  return (id)objc_msgSend(a3, "caDisplay");
}

- (void)dealloc
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_observedDisplays, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[SBDisplayReferenceModeMonitor _stopObservingDisplay:](self, "_stopObservingDisplay:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)SBDisplayReferenceModeMonitor;
  -[SBDisplayReferenceModeMonitor dealloc](&v9, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  _QWORD v15[5];
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[NSMutableSet containsObject:](self->_observedDisplays, "containsObject:", v11))
  {
    v13 = v11;
    if (-[SBDisplayReferenceModeMonitor _shouldNotifyObserversOfReferenceModeStatusChangeForDisplay:](self, "_shouldNotifyObserversOfReferenceModeStatusChangeForDisplay:", v13))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __80__SBDisplayReferenceModeMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v15[3] = &unk_1E8EB9720;
      v15[4] = self;
      v16 = v13;
      -[SBDisplayReferenceModeMonitor _enumerateObserversOfDisplay:usingBlock:](self, "_enumerateObserversOfDisplay:usingBlock:", v16, v15);

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBDisplayReferenceModeMonitor;
    -[SBDisplayReferenceModeMonitor observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __80__SBDisplayReferenceModeMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(a2, "displayReferenceModeStatusDidChangeForDisplayWithConfiguration:newStatus:");
  return objc_msgSend(*(id *)(a1 + 32), "_setCachedStatus:forDisplay:", a4, *(_QWORD *)(a1 + 40));
}

- (void)addReferenceModeStatusObserver:(id)a3 forDisplayWithConfiguration:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayReferenceModeMonitor.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

  }
  if (!+[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:](SBDisplayReferenceModeMonitor, "canAddObserverForDisplayWithConfiguration:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayReferenceModeMonitor.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:configuration]"));

  }
  -[SBDisplayReferenceModeMonitor _displayForConfiguration:](self, "_displayForConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SBDisplayReferenceModeMonitor _addObserver:forDisplay:](self, "_addObserver:forDisplay:", v11, v8);
    -[SBDisplayReferenceModeMonitor _startObservingDisplayIfNeeded:](self, "_startObservingDisplayIfNeeded:", v8);
    -[SBDisplayReferenceModeMonitor _setConfig:forDisplay:](self, "_setConfig:forDisplay:", v7, v8);
  }

}

- (void)removeReferenceModeStatusObserver:(id)a3 forDisplayWithConfiguration:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayReferenceModeMonitor.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

  }
  if (!+[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:](SBDisplayReferenceModeMonitor, "canAddObserverForDisplayWithConfiguration:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayReferenceModeMonitor.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SBDisplayReferenceModeMonitor canAddObserverForDisplayWithConfiguration:configuration]"));

  }
  -[SBDisplayReferenceModeMonitor _displayForConfiguration:](self, "_displayForConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayReferenceModeMonitor _removeObserver:forDisplay:](self, "_removeObserver:forDisplay:", v13, v8);
  -[SBDisplayReferenceModeMonitor _observersForDisplay:](self, "_observersForDisplay:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    -[SBDisplayReferenceModeMonitor _stopObservingDisplay:](self, "_stopObservingDisplay:", v8);

}

- (BOOL)_shouldNotifyObserversOfReferenceModeStatusChangeForDisplay:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;

  v4 = a3;
  v5 = -[SBDisplayReferenceModeMonitor _cachedStatusForDisplay:](self, "_cachedStatusForDisplay:", v4);
  v6 = -[SBDisplayReferenceModeMonitor _referenceModeStatusForDisplay:](self, "_referenceModeStatusForDisplay:", v4);

  return v5 != v6;
}

- (void)_setCachedStatus:(int64_t)a3 forDisplay:(id)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *displayToCachedStatus;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a4;
  if (!self->_displayToCachedStatus)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    displayToCachedStatus = self->_displayToCachedStatus;
    self->_displayToCachedStatus = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_displayToCachedStatus;
  objc_msgSend(v11, "sb_referenceModeObserverUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

}

- (void)_removeCachedStatusForDisplay:(id)a3
{
  NSMutableDictionary *displayToCachedStatus;
  void *v5;
  NSMutableDictionary *v6;

  displayToCachedStatus = self->_displayToCachedStatus;
  objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](displayToCachedStatus, "setObject:forKeyedSubscript:", 0, v5);

  if (!-[NSMutableDictionary count](self->_displayToCachedStatus, "count"))
  {
    v6 = self->_displayToCachedStatus;
    self->_displayToCachedStatus = 0;

  }
}

- (int64_t)_cachedStatusForDisplay:(id)a3
{
  NSMutableDictionary *displayToCachedStatus;
  void *v4;
  void *v5;
  int64_t v6;

  displayToCachedStatus = self->_displayToCachedStatus;
  objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](displayToCachedStatus, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (id)_configurationForDisplay:(id)a3
{
  NSMutableDictionary *CADisplayIdentifierToFBSDisplayConfig;
  void *v4;
  void *v5;

  CADisplayIdentifierToFBSDisplayConfig = self->_CADisplayIdentifierToFBSDisplayConfig;
  objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](CADisplayIdentifierToFBSDisplayConfig, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setConfig:(id)a3 forDisplay:(id)a4
{
  id v6;
  NSMutableDictionary *CADisplayIdentifierToFBSDisplayConfig;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  CADisplayIdentifierToFBSDisplayConfig = self->_CADisplayIdentifierToFBSDisplayConfig;
  if (v12 && !CADisplayIdentifierToFBSDisplayConfig)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_CADisplayIdentifierToFBSDisplayConfig;
    self->_CADisplayIdentifierToFBSDisplayConfig = v8;

    CADisplayIdentifierToFBSDisplayConfig = self->_CADisplayIdentifierToFBSDisplayConfig;
  }
  objc_msgSend(v6, "sb_referenceModeObserverUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](CADisplayIdentifierToFBSDisplayConfig, "setObject:forKeyedSubscript:", v12, v10);

  if (!-[NSMutableDictionary count](self->_CADisplayIdentifierToFBSDisplayConfig, "count"))
  {
    v11 = self->_CADisplayIdentifierToFBSDisplayConfig;
    self->_CADisplayIdentifierToFBSDisplayConfig = 0;

  }
}

- (void)_addObserver:(id)a3 forDisplay:(id)a4
{
  id v6;
  NSMutableDictionary *CADisplayIdentifierToObservers;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  CADisplayIdentifierToObservers = self->_CADisplayIdentifierToObservers;
  if (!CADisplayIdentifierToObservers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_CADisplayIdentifierToObservers;
    self->_CADisplayIdentifierToObservers = v8;

    CADisplayIdentifierToObservers = self->_CADisplayIdentifierToObservers;
  }
  objc_msgSend(v6, "sb_referenceModeObserverUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](CADisplayIdentifierToObservers, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_CADisplayIdentifierToObservers;
    objc_msgSend(v6, "sb_referenceModeObserverUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  objc_msgSend(v11, "addObject:", v14);

}

- (void)_removeObserver:(id)a3 forDisplay:(id)a4
{
  NSMutableDictionary *CADisplayIdentifierToObservers;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *v16;
  id v17;

  v17 = a4;
  CADisplayIdentifierToObservers = self->_CADisplayIdentifierToObservers;
  v7 = a3;
  objc_msgSend(v17, "sb_referenceModeObserverUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](CADisplayIdentifierToObservers, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v7);

  v10 = self->_CADisplayIdentifierToObservers;
  objc_msgSend(v17, "sb_referenceModeObserverUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    v14 = self->_CADisplayIdentifierToObservers;
    objc_msgSend(v17, "sb_referenceModeObserverUniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0, v15);

  }
  if (!-[NSMutableDictionary count](self->_CADisplayIdentifierToObservers, "count"))
  {
    v16 = self->_CADisplayIdentifierToObservers;
    self->_CADisplayIdentifierToObservers = 0;

  }
}

- (id)_observersForDisplay:(id)a3
{
  NSMutableDictionary *CADisplayIdentifierToObservers;
  void *v4;
  void *v5;
  void *v6;

  CADisplayIdentifierToObservers = self->_CADisplayIdentifierToObservers;
  objc_msgSend(a3, "sb_referenceModeObserverUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](CADisplayIdentifierToObservers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_enumerateObserversOfDisplay:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *, int64_t);
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *, int64_t))a4;
  -[SBDisplayReferenceModeMonitor _configurationForDisplay:](self, "_configurationForDisplay:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayReferenceModeMonitor _observersForDisplay:](self, "_observersForDisplay:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBDisplayReferenceModeMonitor referenceModeStatusForDisplayWithConfiguration:](self, "referenceModeStatusForDisplayWithConfiguration:", v8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        v7[2](v7, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v8, v10);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)_startObservingDisplayIfNeeded:(id)a3
{
  id v4;
  NSMutableSet *observedDisplays;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  observedDisplays = self->_observedDisplays;
  v8 = v4;
  if (!observedDisplays)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observedDisplays;
    self->_observedDisplays = v6;

    v4 = v8;
    observedDisplays = self->_observedDisplays;
  }
  if ((-[NSMutableSet containsObject:](observedDisplays, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_observedDisplays, "addObject:", v8);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("isReference"), 0, 0);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("isReferenceLimited"), 0, 0);
    -[SBDisplayReferenceModeMonitor _setCachedStatus:forDisplay:](self, "_setCachedStatus:forDisplay:", -[SBDisplayReferenceModeMonitor _referenceModeStatusForDisplay:](self, "_referenceModeStatusForDisplay:", v8), v8);
  }

}

- (void)_stopObservingDisplay:(id)a3
{
  int v4;
  NSMutableSet *observedDisplays;
  id v6;

  v6 = a3;
  v4 = -[NSMutableSet containsObject:](self->_observedDisplays, "containsObject:", v6);
  -[SBDisplayReferenceModeMonitor _setConfig:forDisplay:](self, "_setConfig:forDisplay:", 0, v6);
  -[SBDisplayReferenceModeMonitor _removeCachedStatusForDisplay:](self, "_removeCachedStatusForDisplay:", v6);
  -[NSMutableSet removeObject:](self->_observedDisplays, "removeObject:", v6);
  if (!-[NSMutableSet count](self->_observedDisplays, "count"))
  {
    observedDisplays = self->_observedDisplays;
    self->_observedDisplays = 0;

    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("isReference"), 0);
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("isReferenceLimited"), 0);
  }
LABEL_4:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedDisplays, 0);
  objc_storeStrong((id *)&self->_CADisplayIdentifierToFBSDisplayConfig, 0);
  objc_storeStrong((id *)&self->_CADisplayIdentifierToObservers, 0);
  objc_storeStrong((id *)&self->_displayToCachedStatus, 0);
}

@end

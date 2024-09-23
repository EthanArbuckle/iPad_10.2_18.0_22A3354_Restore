@implementation VUINowPlayingFeatureMonitor

- (VUINowPlayingFeatureMonitor)init
{
  VUINowPlayingFeatureMonitor *v2;
  VUINowPlayingFeatureMonitor *v3;
  uint64_t v4;
  NSMutableSet *features;
  uint64_t v6;
  NSMapTable *featureDependencies;
  uint64_t v8;
  NSMapTable *featureBoundaryInfos;
  uint64_t v10;
  NSMapTable *featureTokens;
  uint64_t v12;
  NSMutableArray *elapsedTimes;
  uint64_t v14;
  NSMutableArray *enabledUIModes;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VUINowPlayingFeatureMonitor;
  v2 = -[VUINowPlayingFeatureMonitor init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_observingElapsedTime = 0;
    v4 = objc_opt_new();
    features = v3->_features;
    v3->_features = (NSMutableSet *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    featureDependencies = v3->_featureDependencies;
    v3->_featureDependencies = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    featureBoundaryInfos = v3->_featureBoundaryInfos;
    v3->_featureBoundaryInfos = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    featureTokens = v3->_featureTokens;
    v3->_featureTokens = (NSMapTable *)v10;

    v12 = objc_opt_new();
    elapsedTimes = v3->_elapsedTimes;
    v3->_elapsedTimes = (NSMutableArray *)v12;

    v14 = objc_msgSend(&unk_1EA0BB868, "mutableCopy");
    enabledUIModes = v3->_enabledUIModes;
    v3->_enabledUIModes = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v3, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[VUINowPlayingFeatureMonitor _cleanUpEverything](self, "_cleanUpEverything");
  v3.receiver = self;
  v3.super_class = (Class)VUINowPlayingFeatureMonitor;
  -[VUINowPlayingFeatureMonitor dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToFeatureDidChangeState = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToActiveFeatureChangedFrom = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setPlayer:(id)a3
{
  TVPAVFPlayback *v5;
  TVPAVFPlayback *player;
  TVPAVFPlayback *v7;

  v5 = (TVPAVFPlayback *)a3;
  player = self->_player;
  if (player != v5)
  {
    v7 = v5;
    if (player)
      -[VUINowPlayingFeatureMonitor _unregisterPlaybackStateNotification](self, "_unregisterPlaybackStateNotification");
    objc_storeStrong((id *)&self->_player, a3);
    -[VUINowPlayingFeatureMonitor _processAnyTimeBoundFeatures](self, "_processAnyTimeBoundFeatures");
    v5 = v7;
    if (v7)
    {
      -[VUINowPlayingFeatureMonitor _registerPlaybackStateChangeNotification](self, "_registerPlaybackStateChangeNotification");
      v5 = v7;
    }
  }

}

- (void)setPlaybackManager:(id)a3
{
  VUITransitionalPlaybackUIManager *v5;
  VUITransitionalPlaybackUIManager *v6;

  v5 = (VUITransitionalPlaybackUIManager *)a3;
  if (self->_playbackManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_playbackManager, a3);
    -[VUITransitionalPlaybackUIManager setDelegate:](self->_playbackManager, "setDelegate:", self);
    v5 = v6;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)__FeatureStartTimeContext == a6)
  {
    -[VUINowPlayingFeatureMonitor _updateBoundaryObserverForFeature:change:](self, "_updateBoundaryObserverForFeature:change:", a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUINowPlayingFeatureMonitor;
    -[VUINowPlayingFeatureMonitor observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSArray)allFeatures
{
  void *v2;
  void *v3;

  -[VUINowPlayingFeatureMonitor features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addFeature:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[VUINowPlayingFeatureMonitor features](self, "features");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if ((v6 & 1) == 0)
    {
      -[VUINowPlayingFeatureMonitor features](self, "features");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v4);

      -[VUINowPlayingFeatureMonitor _processFeature:](self, "_processFeature:", v4);
      VUIDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Feature [%@] added.", (uint8_t *)&v9, 0xCu);
      }

    }
  }

}

- (void)addFeature:(id)a3 withDependencyToPreferredFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[VUINowPlayingFeatureMonitor features](self, "features");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if ((v9 & 1) == 0)
    {
      -[VUINowPlayingFeatureMonitor features](self, "features");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v6);

      if (objc_msgSend(v7, "count"))
      {
        -[VUINowPlayingFeatureMonitor featureDependencies](self, "featureDependencies");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v7, v6);

      }
      -[VUINowPlayingFeatureMonitor _processFeature:](self, "_processFeature:", v6);
      VUIDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Feature [%@] added.", (uint8_t *)&v13, 0xCu);
      }

    }
  }

}

- (id)featuresForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[VUINowPlayingFeatureMonitor features](self, "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__VUINowPlayingFeatureMonitor_featuresForType___block_invoke;
  v8[3] = &__block_descriptor_40_e12_B24__0_8_B16l;
  v8[4] = a3;
  objc_msgSend(v4, "objectsPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __47__VUINowPlayingFeatureMonitor_featuresForType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F02A03A0))
    v4 = objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32);
  else
    v4 = 0;

  return v4;
}

- (id)activeFeatureForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[VUINowPlayingFeatureMonitor features](self, "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__VUINowPlayingFeatureMonitor_activeFeatureForType___block_invoke;
  v8[3] = &__block_descriptor_40_e12_B24__0_8_B16l;
  v8[4] = a3;
  objc_msgSend(v4, "objectsPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __52__VUINowPlayingFeatureMonitor_activeFeatureForType___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F02A03A0)
    && objc_msgSend(v5, "type") == *(_QWORD *)(a1 + 32)
    && objc_msgSend(v5, "isActive"))
  {
    v6 = 1;
    *a3 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeFeature:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isActive"))
    {
      objc_msgSend(v5, "setAutoRemove:", 1);
      -[VUINowPlayingFeatureMonitor featureLastRequestedUI](self, "featureLastRequestedUI");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6 && (void *)v6 == v5)
      {
        if (objc_msgSend(v5, "type") != 2)
        {
          -[VUINowPlayingFeatureMonitor playbackManager](self, "playbackManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "onSupplementaryUIShouldDismiss");

        }
      }
      else
      {
        -[VUINowPlayingFeatureMonitor _deactivateFeature:animated:](self, "_deactivateFeature:animated:", v5, -[VUINowPlayingFeatureMonitor _shouldAnimateFeature:](self, "_shouldAnimateFeature:", v5));
      }

    }
    else
    {
      -[VUINowPlayingFeatureMonitor _cleanupFeature:](self, "_cleanupFeature:", v5);
      -[VUINowPlayingFeatureMonitor features](self, "features");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v5);

      VUIDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Feature [%@] removed.", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)_cleanupFeature:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[VUINowPlayingFeatureMonitor _cancelTimerForFeature:](self, "_cancelTimerForFeature:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[VUINowPlayingFeatureMonitor _isTimerFeatureExpired:](self, "_isTimerFeatureExpired:", v4);
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "since timer feature: %@ has already expired, so not removing it.", (uint8_t *)&v10, 0xCu);
        }
      }
      else
      {
        if (v7)
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "timer feature: %@ has not expired, removing it.", (uint8_t *)&v10, 0xCu);
        }

        -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
        v6 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeObjectForKey:](v6, "removeObjectForKey:", v4);
      }

    }
    -[VUINowPlayingFeatureMonitor _removeAllObservedTokensForFeature:](self, "_removeAllObservedTokensForFeature:", v4);
    -[VUINowPlayingFeatureMonitor features](self, "features");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v4)
      && -[VUINowPlayingFeatureMonitor _isTimeBoundFeature:](self, "_isTimeBoundFeature:", v4))
    {
      v9 = objc_msgSend(v4, "conformsToProtocol:", &unk_1F02665E8);

      if (v9)
        objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("startTime"));
    }
    else
    {

    }
  }

}

- (void)removeFeaturesMatching:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
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

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          -[VUINowPlayingFeatureMonitor featuresForType:](self, "featuresForType:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "unsignedIntegerValue"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
          {
            v19 = 0u;
            v20 = 0u;
            v17 = 0u;
            v18 = 0u;
            v11 = v10;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v18;
              do
              {
                v15 = 0;
                do
                {
                  if (*(_QWORD *)v18 != v14)
                    objc_enumerationMutation(v11);
                  -[VUINowPlayingFeatureMonitor removeFeature:](self, "removeFeature:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++));
                }
                while (v13 != v15);
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              }
              while (v13);
            }

          }
          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v4 = v16;
  }

}

- (void)enableUIMode:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v4 = a4;
  -[VUINowPlayingFeatureMonitor enabledUIModes](self, "enabledUIModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v4)
  {
    if ((v9 & 1) != 0)
      return;
    -[VUINowPlayingFeatureMonitor enabledUIModes](self, "enabledUIModes");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);
  }
  else
  {
    if (!v9)
      return;
    -[VUINowPlayingFeatureMonitor enabledUIModes](self, "enabledUIModes");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v10);
  }

}

- (void)deactivateFeature:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v12 = v6;
    v8 = objc_msgSend(v6, "isActive");
    v7 = v12;
    if (v8)
    {
      -[VUINowPlayingFeatureMonitor featureLastRequestedUI](self, "featureLastRequestedUI");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9 && (id)v9 == v12)
      {
        -[VUINowPlayingFeatureMonitor playbackManager](self, "playbackManager", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "onSupplementaryUIShouldDismiss");

      }
      else
      {
        -[VUINowPlayingFeatureMonitor _deactivateFeature:animated:](self, "_deactivateFeature:animated:", v12, v4);
      }

      v7 = v12;
    }
  }

}

- (void)mediaPlaybackManager:(id)a3 shouldHideUI:(BOOL)a4 animated:(BOOL)a5 animations:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  _BOOL4 v10;
  void (**v12)(_QWORD);
  void (**v13)(id, uint64_t);
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v9 = a5;
  v10 = a4;
  v20 = a3;
  v12 = (void (**)(_QWORD))a6;
  v13 = (void (**)(id, uint64_t))a7;
  -[VUINowPlayingFeatureMonitor featureLastRequestedUI](self, "featureLastRequestedUI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    if (objc_msgSend(v20, "currentUIMode"))
    {
      -[VUINowPlayingFeatureMonitor featuresForType:](self, "featuresForType:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v18, "conformsToProtocol:", &unk_1F02A0400))
      {
        v16 = 0;
LABEL_9:

        if (!v16)
          goto LABEL_14;
        goto LABEL_10;
      }
      v19 = v18;
      v18 = v19;
    }
    else
    {
      -[VUINowPlayingFeatureMonitor featuresForType:](self, "featuresForType:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v19;
    goto LABEL_9;
  }
  v16 = v14;
LABEL_10:
  if (-[VUINowPlayingFeatureMonitor _isHybridFeature:](self, "_isHybridFeature:", v16)
    && !objc_msgSend(v16, "activationType"))
  {
    objc_msgSend(v16, "setActivationType:", 1);
  }
  -[VUINowPlayingFeatureMonitor _processUserTriggeredFeature:activate:animated:](self, "_processUserTriggeredFeature:activate:animated:", v16, !v10, v9);
LABEL_14:
  if (v12)
    v12[2](v12);
  if (v13)
    v13[2](v13, 1);

}

- (BOOL)mediaPlaybackManager:(id)a3 shouldEnableUIModeImplicitly:(int64_t)a4
{
  void *v5;
  void *v6;
  char v7;

  -[VUINowPlayingFeatureMonitor enabledUIModes](self, "enabledUIModes", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (void)_playbackStateChangedNottificaiton:(id)a3
{
  void *v4;
  id v5;
  BOOL v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v5)
  {
    v6 = -[VUINowPlayingFeatureMonitor observingElapsedTime](self, "observingElapsedTime");

    if (!v6)
    {
      -[VUINowPlayingFeatureMonitor setObservingElapsedTime:](self, "setObservingElapsedTime:", 1);
      -[VUINowPlayingFeatureMonitor _startObservingElapsedTime](self, "_startObservingElapsedTime");
    }
  }
  else
  {

  }
}

- (id)_activeFeatures
{
  void *v2;
  void *v3;

  -[VUINowPlayingFeatureMonitor features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __46__VUINowPlayingFeatureMonitor__activeFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F02A03A0))
    v3 = objc_msgSend(v2, "isActive");
  else
    v3 = 0;

  return v3;
}

- (id)_timeBoundFeatures
{
  void *v2;
  void *v3;

  -[VUINowPlayingFeatureMonitor features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_138);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __49__VUINowPlayingFeatureMonitor__timeBoundFeatures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1F02A04C8);
}

- (id)_activeFeature
{
  void *v2;
  void *v3;
  void *v4;

  -[VUINowPlayingFeatureMonitor features](self, "features");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_151);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __45__VUINowPlayingFeatureMonitor__activeFeature__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  uint64_t v5;

  v4 = a2;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F02A03A0)
    && objc_msgSend(v4, "isActive"))
  {
    v5 = 1;
    *a3 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasAnyActiveFeature
{
  void *v2;
  BOOL v3;

  -[VUINowPlayingFeatureMonitor _activeFeatures](self, "_activeFeatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_hasActiveFeaturesInArray:(id)a3
{
  return objc_msgSend(a3, "indexOfObjectPassingTest:", &__block_literal_global_153) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __57__VUINowPlayingFeatureMonitor__hasActiveFeaturesInArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F02A03A0)
    && objc_msgSend(v5, "isActive"))
  {
    v6 = 1;
    *a4 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_processFeature:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    if (-[VUINowPlayingFeatureMonitor _isTimeBoundFeature:](self, "_isTimeBoundFeature:", v4))
    {
      if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F02665E8))
        objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("startTime"), 3, __FeatureStartTimeContext);
      -[VUINowPlayingFeatureMonitor _processTimeBoundFeature:](self, "_processTimeBoundFeature:", v6);
      goto LABEL_8;
    }
    v5 = -[VUINowPlayingFeatureMonitor _isTimerTriggeredFeature:](self, "_isTimerTriggeredFeature:", v6);
    v4 = v6;
    if (v5)
    {
      -[VUINowPlayingFeatureMonitor _processTimerTriggeredFeature:](self, "_processTimerTriggeredFeature:", v6);
LABEL_8:
      v4 = v6;
    }
  }

}

- (BOOL)_isTimeBoundFeature:(id)a3
{
  return objc_msgSend(a3, "conformsToProtocol:", &unk_1F02A04C8);
}

- (BOOL)_isUserTriggeredFeature:(id)a3
{
  return objc_msgSend(a3, "conformsToProtocol:", &unk_1F02A0400);
}

- (BOOL)_isHybridFeature:(id)a3
{
  return objc_msgSend(a3, "conformsToProtocol:", &unk_1F02A0590);
}

- (BOOL)_isTVAdvisoryFeature:(id)a3
{
  return objc_msgSend(a3, "conformsToProtocol:", &unk_1F02A0640);
}

- (BOOL)_isTimerTriggeredFeature:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F02A03A0))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_shouldAnimateFeature:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[VUINowPlayingFeatureMonitor _isUserTriggeredFeature:](self, "_isUserTriggeredFeature:", v4)
    || objc_msgSend(v4, "type") == 2
    || objc_msgSend(v4, "type") == 1
    || objc_msgSend(v4, "type") == 9
    || objc_msgSend(v4, "type") == 7;

  return v5;
}

- (void)_activateFeature:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (!v8)
  {
    v11 = 0;
    if (!v9)
      goto LABEL_7;
LABEL_6:
    v10[2](v10, v11);
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isActive"))
  {
    v11 = -[VUINowPlayingFeatureMonitor _isTVAdvisoryFeature:](self, "_isTVAdvisoryFeature:", v8) ^ 1;
    if (!v10)
      goto LABEL_7;
    goto LABEL_6;
  }
  VUIDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Feature [%@] activated.", (uint8_t *)&v15, 0xCu);
  }

  -[VUINowPlayingFeatureMonitor delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUINowPlayingFeatureMonitor _activeFeature](self, "_activeFeature");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1F02A0400)
    && objc_msgSend(v8, "conformsToProtocol:", &unk_1F02A0400))
  {
    if (v14 != v8)
    {
      objc_msgSend(v14, "setActive:", 0);
      objc_msgSend(v8, "setActive:", 1);
      if (self->_delegateFlags.respondsToActiveFeatureChangedFrom)
        objc_msgSend(v13, "featureMonitor:activeFeatureDidChangeFrom:toFeature:animated:", self, v14, v8, v6);
    }
  }
  else
  {
    objc_msgSend(v8, "setActive:", 1);
    if (self->_delegateFlags.respondsToFeatureDidChangeState)
      objc_msgSend(v13, "featureMonitor:featureDidChangeState:animated:", self, v8, v6);
  }

  v11 = 1;
  if (v10)
    goto LABEL_6;
LABEL_7:

}

- (void)_deactivateFeature:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isActive"))
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v7;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Feature [%@] deactivated.", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v7, "setActive:", 0);
    -[VUINowPlayingFeatureMonitor featureLastRequestedUI](self, "featureLastRequestedUI");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9 && (void *)v9 == v7)
      -[VUINowPlayingFeatureMonitor setFeatureLastRequestedUI:](self, "setFeatureLastRequestedUI:", 0);
    if (self->_delegateFlags.respondsToFeatureDidChangeState)
    {
      -[VUINowPlayingFeatureMonitor delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "featureMonitor:featureDidChangeState:animated:", self, v7, v4);

    }
    if (-[VUINowPlayingFeatureMonitor _isTimeBoundFeature:](self, "_isTimeBoundFeature:", v7))
    {
      v12 = v7;
      objc_msgSend(v12, "startTime");
      v14 = v13;
      objc_msgSend(v12, "duration");
      -[VUINowPlayingFeatureMonitor _removeTimeObservingForFeature:withStartTime:](self, "_removeTimeObservingForFeature:withStartTime:", v12, v14 + v15);

    }
    if (objc_msgSend(v7, "shouldAutoRemove"))
    {
      -[VUINowPlayingFeatureMonitor _cleanupFeature:](self, "_cleanupFeature:", v7);
      -[VUINowPlayingFeatureMonitor features](self, "features");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v7);

      VUIDefaultLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Feature [%@] removed.", (uint8_t *)&v18, 0xCu);
      }

    }
  }

}

- (void)_registerPlaybackStateChangeNotification
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DB1F58];
  -[VUINowPlayingFeatureMonitor player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__playbackStateChangedNottificaiton_, v3, v4);

}

- (void)_unregisterPlaybackStateNotification
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DB1F58];
  -[VUINowPlayingFeatureMonitor player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v3, v4);

}

- (BOOL)_isElapsedTimeWithinFeatureTimeWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (-[VUINowPlayingFeatureMonitor player](self, "player"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[VUINowPlayingFeatureMonitor player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elapsedTime");
    v8 = v7;

    if (-[VUINowPlayingFeatureMonitor _isTVAdvisoryFeature:](self, "_isTVAdvisoryFeature:", v4))
    {
      objc_msgSend(v4, "advisoryDisabledTimeRanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "containsTime:", v8, (_QWORD)v21) & 1) != 0)
              {
                v15 = 0;
                goto LABEL_17;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v12)
              continue;
            break;
          }
        }
        v15 = 1;
LABEL_17:

      }
      else
      {
        v15 = 1;
      }
    }
    else
    {
      objc_msgSend(v4, "startTime");
      v18 = v17;
      objc_msgSend(v4, "duration");
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1980]), "initWithStartTime:endTime:", v18, v18 + v19);
      v15 = objc_msgSend(v9, "containsTime:", v8);
    }

    v16 = v15 != 0;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_startObservingElapsedTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, double);
  void *v12;
  id v13;
  id location;

  -[VUINowPlayingFeatureMonitor player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    -[VUINowPlayingFeatureMonitor player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __57__VUINowPlayingFeatureMonitor__startObservingElapsedTime__block_invoke;
    v12 = &unk_1E9F9B670;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v4, "addElapsedTimeObserver:", &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUINowPlayingFeatureMonitor elapsedTimeObserverToken](self, "elapsedTimeObserverToken", v9, v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUINowPlayingFeatureMonitor player](self, "player");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUINowPlayingFeatureMonitor elapsedTimeObserverToken](self, "elapsedTimeObserverToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeElapsedTimeObserverWithToken:", v8);

      -[VUINowPlayingFeatureMonitor setElapsedTimeObserverToken:](self, "setElapsedTimeObserverToken:", 0);
    }
    if (v5)
      -[VUINowPlayingFeatureMonitor setElapsedTimeObserverToken:](self, "setElapsedTimeObserverToken:", v5);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __57__VUINowPlayingFeatureMonitor__startObservingElapsedTime__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processElapsedTime:", a2);

}

- (void)_processElapsedTime:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[VUINowPlayingFeatureMonitor lastProcessedElapsedTime](self, "lastProcessedElapsedTime");
  if (v5 != a3)
  {
    -[VUINowPlayingFeatureMonitor setLastProcessedElapsedTime:](self, "setLastProcessedElapsedTime:", a3);
    -[VUINowPlayingFeatureMonitor elapsedTimes](self, "elapsedTimes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    -[VUINowPlayingFeatureMonitor elapsedTimes](self, "elapsedTimes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
      -[VUINowPlayingFeatureMonitor _processLastElapsedTime](self, "_processLastElapsedTime");
  }
}

- (void)_processLastElapsedTime
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  BOOL v33;
  double v34;
  void *v35;
  void *v36;
  void (**v37)(void);
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[VUINowPlayingFeatureMonitor elapsedTimes](self, "elapsedTimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[VUINowPlayingFeatureMonitor elapsedTimes](self, "elapsedTimes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUINowPlayingFeatureMonitor elapsedTimes](self, "elapsedTimes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") - 1;

      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        -[VUINowPlayingFeatureMonitor elapsedTimes](self, "elapsedTimes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObjectsAtIndexes:", v9);

      }
      objc_msgSend(v6, "doubleValue");
      v12 = v11;
      -[VUINowPlayingFeatureMonitor _timeBoundFeatures](self, "_timeBoundFeatures");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        v43 = v9;
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v15 = v13;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v49 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              if (objc_msgSend(v20, "type") == 7 && objc_msgSend(v20, "isActive"))
                objc_msgSend(v14, "insertObject:atIndex:", v20, 0);
              else
                objc_msgSend(v14, "addObject:", v20);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          }
          while (v17);
        }

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v21 = v14;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v45 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_msgSend(v26, "startTime");
              v28 = v27;
              objc_msgSend(v26, "duration");
              if (v29 == -9999.0)
                v30 = 0.0;
              else
                objc_msgSend(v26, "duration");
              v31 = v28 + v30;
              v32 = -[VUINowPlayingFeatureMonitor _isTVAdvisoryFeature:](self, "_isTVAdvisoryFeature:", v26);
              if ((v32 || (v12 >= v28 ? (v33 = v12 < v31) : (v33 = 0), v34 = v31, v33)) && (v34 = v28, v12 < v28)
                || (-[VUINowPlayingFeatureMonitor _observerInfoForFeature:matchingTime:](self, "_observerInfoForFeature:matchingTime:", v26, v34), (v35 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
              {
                if (v12 >= v28 && v12 < v31)
                {
                  v36 = 0;
                }
                else
                {
                  -[VUINowPlayingFeatureMonitor _observerInfoForFeature:matchingTime:](self, "_observerInfoForFeature:matchingTime:", v26, v28);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = v39;
                  if (v39 && objc_msgSend(v39, "notifiedOfEntry"))
                    objc_msgSend(v36, "setNotifiedOfEntry:", 0);
                }
              }
              else
              {
                v36 = v35;
                if ((objc_msgSend(v35, "notifiedOfEntry") & 1) == 0)
                {
                  objc_msgSend(v36, "setNotifiedOfEntry:", !v32);
                  objc_msgSend(v36, "handler");
                  v37 = (void (**)(void))objc_claimAutoreleasedReturnValue();
                  v37[2]();

                }
              }

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v23);
        }

        v9 = v43;
      }
      -[VUINowPlayingFeatureMonitor elapsedTimes](self, "elapsedTimes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "removeObjectAtIndex:", 0);

      -[VUINowPlayingFeatureMonitor elapsedTimes](self, "elapsedTimes");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count");

      if (v42)
        -[VUINowPlayingFeatureMonitor _processLastElapsedTime](self, "_processLastElapsedTime");

    }
  }
}

- (void)_processTimeBoundFeature:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[VUINowPlayingFeatureMonitor player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v5)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "startTime");
    v7 = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke;
    v8[3] = &unk_1E9F9B6C0;
    v9 = v4;
    objc_copyWeak(&v10, &location);
    -[VUINowPlayingFeatureMonitor _addTimeObservingForFeature:withStartTime:andHandler:](self, "_addTimeObservingForFeature:withStartTime:andHandler:", v9, v8, v7);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }

}

void __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  char v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void (**v13)(_QWORD);
  _QWORD aBlock[4];
  id v15;
  id v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Boundary time observer triggered for feature activation - %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_msgSend(WeakRetained, "_shouldAnimateFeature:", *(_QWORD *)(a1 + 32));
  v6 = objc_msgSend(WeakRetained, "_isElapsedTimeWithinFeatureTimeWindow:", *(_QWORD *)(a1 + 32));
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    VUIBoolLogString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Is elapsed time within feature time window - %@", buf, 0xCu);

  }
  if (v6)
  {
    objc_msgSend(WeakRetained, "featureDependencies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Dependent preferred features: [%@]", buf, 0xCu);
    }

    if (objc_msgSend(v10, "count") && (objc_msgSend(WeakRetained, "_hasActiveFeaturesInArray:", v10) & 1) != 0)
    {
      VUIDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Not activating this feature since there's a preferred feature already active.", buf, 2u);
      }

    }
    else
    {
      if (objc_msgSend(WeakRetained, "_isHybridFeature:", *(_QWORD *)(a1 + 32)))
        objc_msgSend(*(id *)(a1 + 32), "setActivationType:", 2);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke_172;
      aBlock[3] = &unk_1E9F9B698;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      v15 = *(id *)(a1 + 32);
      v17 = v5;
      v13 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(WeakRetained, "_needsUIForFeature:", *(_QWORD *)(a1 + 32));
      v13[2](v13);

      objc_destroyWeak(&v16);
    }

  }
}

void __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke_172(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke_2;
  v5[3] = &unk_1E9F9A240;
  v5[4] = WeakRetained;
  v6 = v3;
  objc_msgSend(WeakRetained, "_activateFeature:animated:completion:", v6, v4, v5);

}

uint64_t __56__VUINowPlayingFeatureMonitor__processTimeBoundFeature___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_scheduleDeactivationOfTimeBoundFeature:", *(_QWORD *)(result + 40));
  return result;
}

- (BOOL)_shouldActivateTimeBoundFeatureInitially:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "type") == 4
    || objc_msgSend(v3, "type") == 5
    || objc_msgSend(v3, "type") == 6
    || objc_msgSend(v3, "type") == 9;

  return v4;
}

- (void)_scheduleDeactivationOfTimeBoundFeature:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BOOL v25;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "startTime");
    v7 = v6;
    objc_msgSend(v5, "duration");
    v9 = v8;
    objc_initWeak(&location, self);
    v10 = -[VUINowPlayingFeatureMonitor _shouldAnimateFeature:](self, "_shouldAnimateFeature:", v5);
    if (-[VUINowPlayingFeatureMonitor _isTVAdvisoryFeature:](self, "_isTVAdvisoryFeature:", v5))
    {
      v11 = (void *)MEMORY[0x1E0C99E88];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __71__VUINowPlayingFeatureMonitor__scheduleDeactivationOfTimeBoundFeature___block_invoke;
      v22[3] = &unk_1E9F9B6E8;
      v12 = &v24;
      objc_copyWeak(&v24, &location);
      v13 = v5;
      v23 = v13;
      v25 = v10;
      objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 0, v22, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setOneTimeTimer:", v14);
      v17 = &v23;

    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __71__VUINowPlayingFeatureMonitor__scheduleDeactivationOfTimeBoundFeature___block_invoke_177;
      v18[3] = &unk_1E9F9B698;
      v12 = &v20;
      objc_copyWeak(&v20, &location);
      v19 = v5;
      v21 = v10;
      -[VUINowPlayingFeatureMonitor _addTimeObservingForFeature:withStartTime:andHandler:](self, "_addTimeObservingForFeature:withStartTime:andHandler:", v19, v18, v7 + v9);
      v17 = &v19;
    }

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

}

void __71__VUINowPlayingFeatureMonitor__scheduleDeactivationOfTimeBoundFeature___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "TV advisory deactivation timer fired.", v4, 2u);
  }

  objc_msgSend(WeakRetained, "deactivateFeature:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

void __71__VUINowPlayingFeatureMonitor__scheduleDeactivationOfTimeBoundFeature___block_invoke_177(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Boundary time observer triggered for feature deactivation - %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "deactivateFeature:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (void)_processAnyTimeBoundFeatures
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VUINowPlayingFeatureMonitor features](self, "features", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (-[VUINowPlayingFeatureMonitor _isTimeBoundFeature:](self, "_isTimeBoundFeature:", v8))
          -[VUINowPlayingFeatureMonitor _processTimeBoundFeature:](self, "_processTimeBoundFeature:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_observerInfoForFeature:(id)a3 matchingTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[VUINowPlayingFeatureMonitor featureTokens](self, "featureTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
          -[VUINowPlayingFeatureMonitor featureBoundaryInfos](self, "featureBoundaryInfos", (_QWORD)v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "time");
          if (v17 == a4)
            break;

          if (v11 == ++v13)
          {
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_addTimeObservingForFeature:(id)a3 withStartTime:(double)a4 andHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  if (v12 && v8 && a4 != -9999.0)
  {
    -[VUINowPlayingFeatureMonitor _observerInfoForFeature:matchingTime:](self, "_observerInfoForFeature:matchingTime:", v12, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setTime:", a4);
      objc_msgSend(v9, "setHandler:", v8);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setToken:", v10);
      -[VUINowPlayingFeatureMonitor featureBoundaryInfos](self, "featureBoundaryInfos");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v9, v10);

      -[VUINowPlayingFeatureMonitor _addObservedToken:forFeature:](self, "_addObservedToken:forFeature:", v10, v12);
    }

  }
}

- (void)_updateBoundaryObserverForFeature:(id)a3 change:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;

  v6 = a3;
  if (v6)
  {
    v13 = v6;
    v7 = *MEMORY[0x1E0CB2CC8];
    v8 = a4;
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v11 = v10 == 0;
    else
      v11 = 1;
    if (!v11 && (objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[VUINowPlayingFeatureMonitor _observerInfoForFeature:matchingTime:](self, "_observerInfoForFeature:matchingTime:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(v12, "setTime:");
      }

    }
    v6 = v13;
  }

}

- (void)_removeTimeObservingForFeature:(id)a3 withStartTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6 && a4 != -9999.0)
  {
    -[VUINowPlayingFeatureMonitor featureTokens](self, "featureTokens", -9999.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            -[VUINowPlayingFeatureMonitor featureBoundaryInfos](self, "featureBoundaryInfos", (_QWORD)v19);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "time");
            if (v17 == a4)
            {
              -[VUINowPlayingFeatureMonitor featureBoundaryInfos](self, "featureBoundaryInfos");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "removeObjectForKey:", v14);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

    }
  }

}

- (void)_addObservedToken:(id)a3 forFeature:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[VUINowPlayingFeatureMonitor featureTokens](self, "featureTokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count");
    -[VUINowPlayingFeatureMonitor featureTokens](self, "featureTokens");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v13 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v13, "arrayByAddingObject:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v14, v8);

    }
    else
    {
      v15[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, v8);
    }

  }
}

- (void)_removeAllObservedTokensForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[VUINowPlayingFeatureMonitor featureTokens](self, "featureTokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
            -[VUINowPlayingFeatureMonitor featureBoundaryInfos](self, "featureBoundaryInfos", (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObjectForKey:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }

      -[VUINowPlayingFeatureMonitor featureTokens](self, "featureTokens");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v4);

    }
  }

}

- (void)_processUserTriggeredFeature:(id)a3 activate:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      if ((objc_msgSend(v8, "isActive") & 1) == 0)
      {
        objc_initWeak(&location, self);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __78__VUINowPlayingFeatureMonitor__processUserTriggeredFeature_activate_animated___block_invoke;
        v10[3] = &unk_1E9F9B058;
        objc_copyWeak(&v12, &location);
        v11 = v9;
        -[VUINowPlayingFeatureMonitor _activateFeature:animated:completion:](self, "_activateFeature:animated:completion:", v11, v5, v10);

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[VUINowPlayingFeatureMonitor _deactivateFeature:animated:](self, "_deactivateFeature:animated:", v8, v5);
    }
  }

}

void __78__VUINowPlayingFeatureMonitor__processUserTriggeredFeature_activate_animated___block_invoke(uint64_t a1, int a2)
{
  int v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "_isTimeBoundFeature:", *(_QWORD *)(a1 + 32));
  if (a2 && v4)
    objc_msgSend(WeakRetained, "_scheduleDeactivationOfTimeBoundFeature:", *(_QWORD *)(a1 + 32));

}

- (void)_processTimerTriggeredFeature:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id from;
  id location;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "duration");
    v6 = v5;
    v7 = objc_msgSend(v4, "repeats");
    if (v6 > 0.0)
    {
      v8 = v7;
      -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 1);
        -[VUINowPlayingFeatureMonitor setFeatureTimers:](self, "setFeatureTimers:", v10);

      }
      objc_initWeak(&location, self);
      objc_initWeak(&from, v4);
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v26 = v6;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Scheduling a timer with interval:<%f> for feature: %@", buf, 0x16u);
      }

      v12 = (void *)MEMORY[0x1E0C99E88];
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __61__VUINowPlayingFeatureMonitor__processTimerTriggeredFeature___block_invoke;
      v20 = &unk_1E9F9B710;
      objc_copyWeak(&v21, &from);
      objc_copyWeak(&v22, &location);
      objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", v8, &v17, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setRepeatingTimer:", v13, v17, v18, v19, v20);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStartDate:", v15);

      -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v14, v4);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }

}

void __61__VUINowPlayingFeatureMonitor__processTimerTriggeredFeature___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "featureTimers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartDate:", v6);

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = WeakRetained;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Will activate timer triggered feature: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v3, "_activateFeature:animated:completion:", WeakRetained, 1, 0);
}

- (void)_cancelTimerForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "repeatingTimer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidate");

      objc_msgSend(v8, "oneTimeTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidate");

    }
  }
}

- (BOOL)_isTimerFeatureExpired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "backgroundedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v7);
    v14 = v13;

    v15 = v11 + v14;
LABEL_7:
    objc_msgSend(v4, "duration");
    LOBYTE(v9) = v15 >= v19;
    goto LABEL_8;
  }

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    v15 = v18;

    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  VUIDefaultLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    VUIBoolLogString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v4;
    v25 = 2112;
    v26 = v21;
    _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "timerFeature: %@ hasExpired:<%@>", (uint8_t *)&v23, 0x16u);

  }
  return (char)v9;
}

- (void)_setupTimerFeatureExpiration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "nextObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = (void *)v7;
      *(_QWORD *)&v8 = 138412546;
      v22 = v8;
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBackgroundedDate:", v13);

          if ((objc_msgSend(v10, "isBackgroundTimer") & 1) == 0)
          {
            objc_msgSend(v10, "duration");
            v15 = v14;
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timeIntervalSinceDate:", v17);
            v19 = v18;

            VUIDefaultLogObject();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              v24 = v10;
              v25 = 2048;
              v26 = v15 - v19;
              _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "cancelling timer for feature: %@, timeRemaining:<%f>", buf, 0x16u);
            }

            -[VUINowPlayingFeatureMonitor _cancelTimerForFeature:](self, "_cancelTimerForFeature:", v10);
          }

        }
        objc_msgSend(v6, "nextObject", v22);
        v21 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v21;
      }
      while (v21);
    }

  }
}

- (void)_expireTimerFeaturesIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  id v17;
  id v18;
  void (**v19)(void *, _QWORD);
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  _QWORD v36[4];
  void (**v37)(void *, _QWORD);
  _QWORD aBlock[4];
  id v39;
  id v40;
  id location;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v43 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Will expire feature timers, count:<%lu>", buf, 0xCu);

  }
  -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      do
      {
        -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setObject:forKey:", v12, v10);
        objc_msgSend(v8, "nextObject");
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v13;
      }
      while (v13);
    }
    objc_msgSend(v9, "keyEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "nextObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      *(_QWORD *)&v16 = 138412546;
      v35 = v16;
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v15;
          objc_initWeak(&location, self);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __59__VUINowPlayingFeatureMonitor__expireTimerFeaturesIfNeeded__block_invoke;
          aBlock[3] = &unk_1E9F9B738;
          objc_copyWeak(&v40, &location);
          v18 = v17;
          v39 = v18;
          v19 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
          -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[VUINowPlayingFeatureMonitor _isTimerFeatureExpired:](self, "_isTimerFeatureExpired:", v18))
          {
            VUIDefaultLogObject();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = (uint64_t)v18;
              _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "activating feature after application entered foreground: %@", buf, 0xCu);
            }

            v19[2](v19, 0);
          }
          else if ((objc_msgSend(v18, "isBackgroundTimer") & 1) != 0)
          {
            VUIDefaultLogObject();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = (uint64_t)v18;
              _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "background timer feature %@ did not expire while in background. Cancelling feature now that it is in the foreground", buf, 0xCu);
            }

            -[VUINowPlayingFeatureMonitor _cancelTimerForFeature:](self, "_cancelTimerForFeature:", v18);
          }
          else
          {
            objc_msgSend(v21, "backgroundedDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "startDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "timeIntervalSinceDate:", v25);
            v27 = v26;

            objc_msgSend(v18, "duration");
            v29 = v28;
            VUIDefaultLogObject();
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = v29 - v27;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v35;
              v43 = (uint64_t)v18;
              v44 = 2048;
              v45 = v31;
              _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "timer feature %@ has not expired yet after entering to foreground. creating a one time timer with interval: %f", buf, 0x16u);
            }

            v32 = (void *)MEMORY[0x1E0C99E88];
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __59__VUINowPlayingFeatureMonitor__expireTimerFeaturesIfNeeded__block_invoke_183;
            v36[3] = &unk_1E9F9B760;
            v37 = v19;
            objc_msgSend(v32, "scheduledTimerWithTimeInterval:repeats:block:", 0, v36, v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setOneTimeTimer:", v33);

          }
          objc_msgSend(v21, "setBackgroundedDate:", 0, v35);

          objc_destroyWeak(&v40);
          objc_destroyWeak(&location);

        }
        objc_msgSend(v14, "nextObject", v35);
        v34 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v34;
      }
      while (v34);
    }

  }
}

void __59__VUINowPlayingFeatureMonitor__expireTimerFeaturesIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_activateFeature:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
  objc_msgSend(WeakRetained, "featureTimers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  if (objc_msgSend(*(id *)(a1 + 32), "repeats"))
    objc_msgSend(WeakRetained, "_processTimerTriggeredFeature:", *(_QWORD *)(a1 + 32));

}

uint64_t __59__VUINowPlayingFeatureMonitor__expireTimerFeaturesIfNeeded__block_invoke_183(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_cleanUpEverything
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[VUINowPlayingFeatureMonitor _unregisterPlaybackStateNotification](self, "_unregisterPlaybackStateNotification");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VUINowPlayingFeatureMonitor features](self, "features", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[VUINowPlayingFeatureMonitor _cleanupFeature:](self, "_cleanupFeature:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[VUINowPlayingFeatureMonitor featureTimers](self, "featureTimers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[VUINowPlayingFeatureMonitor setFeatureTimers:](self, "setFeatureTimers:", 0);
  -[VUINowPlayingFeatureMonitor features](self, "features");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (VUINowPlayingFeatureMonitorDelegate)delegate
{
  return (VUINowPlayingFeatureMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TVPAVFPlayback)player
{
  return self->_player;
}

- (VUITransitionalPlaybackUIManager)playbackManager
{
  return self->_playbackManager;
}

- (NSMutableSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (NSMapTable)featureDependencies
{
  return self->_featureDependencies;
}

- (void)setFeatureDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_featureDependencies, a3);
}

- (NSMapTable)featureTokens
{
  return self->_featureTokens;
}

- (void)setFeatureTokens:(id)a3
{
  objc_storeStrong((id *)&self->_featureTokens, a3);
}

- (NSMapTable)featureBoundaryInfos
{
  return self->_featureBoundaryInfos;
}

- (void)setFeatureBoundaryInfos:(id)a3
{
  objc_storeStrong((id *)&self->_featureBoundaryInfos, a3);
}

- (NSMapTable)featureTimers
{
  return self->_featureTimers;
}

- (void)setFeatureTimers:(id)a3
{
  objc_storeStrong((id *)&self->_featureTimers, a3);
}

- (VUINowPlayingFeature)featureLastRequestedUI
{
  return self->_featureLastRequestedUI;
}

- (void)setFeatureLastRequestedUI:(id)a3
{
  objc_storeStrong((id *)&self->_featureLastRequestedUI, a3);
}

- (NSMutableArray)enabledUIModes
{
  return self->_enabledUIModes;
}

- (void)setEnabledUIModes:(id)a3
{
  objc_storeStrong((id *)&self->_enabledUIModes, a3);
}

- (BOOL)observingElapsedTime
{
  return self->_observingElapsedTime;
}

- (void)setObservingElapsedTime:(BOOL)a3
{
  self->_observingElapsedTime = a3;
}

- (double)lastProcessedElapsedTime
{
  return self->_lastProcessedElapsedTime;
}

- (void)setLastProcessedElapsedTime:(double)a3
{
  self->_lastProcessedElapsedTime = a3;
}

- (NSMutableDictionary)boundaryTimeObserverInfos
{
  return self->_boundaryTimeObserverInfos;
}

- (void)setBoundaryTimeObserverInfos:(id)a3
{
  objc_storeStrong((id *)&self->_boundaryTimeObserverInfos, a3);
}

- (id)elapsedTimeObserverToken
{
  return self->_elapsedTimeObserverToken;
}

- (void)setElapsedTimeObserverToken:(id)a3
{
  objc_storeStrong(&self->_elapsedTimeObserverToken, a3);
}

- (NSMutableArray)elapsedTimes
{
  return self->_elapsedTimes;
}

- (void)setElapsedTimes:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elapsedTimes, 0);
  objc_storeStrong(&self->_elapsedTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_boundaryTimeObserverInfos, 0);
  objc_storeStrong((id *)&self->_enabledUIModes, 0);
  objc_storeStrong((id *)&self->_featureLastRequestedUI, 0);
  objc_storeStrong((id *)&self->_featureTimers, 0);
  objc_storeStrong((id *)&self->_featureBoundaryInfos, 0);
  objc_storeStrong((id *)&self->_featureTokens, 0);
  objc_storeStrong((id *)&self->_featureDependencies, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

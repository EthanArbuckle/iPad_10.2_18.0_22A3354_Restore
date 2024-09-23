@implementation RERelevanceEnginePreferencesController

- (RERelevanceEnginePreferences)effectivePreferences
{
  os_unfair_lock_s *p_lock;
  RERelevanceEnginePreferences *effectivePreferences;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RERelevanceEnginePreferences *v16;
  RERelevanceEnginePreferences *v17;
  RERelevanceEnginePreferences *v18;
  void *v19;
  os_unfair_lock_s *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  effectivePreferences = self->_effectivePreferences;
  if (!effectivePreferences)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_preferences;
    v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v21 = p_lock;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v5);
          -[NSMapTable objectForKey:](self->_preferences, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            if (v9)
            {
              objc_msgSend(v12, "disabledDataSourceIdentifiers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "intersectSet:", v14);
            }
            else
            {
              v15 = (void *)MEMORY[0x24BDBCEF0];
              objc_msgSend(v12, "disabledDataSourceIdentifiers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setWithSet:", v14);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v8 |= objc_msgSend(v13, "mode");
          }

        }
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);

      p_lock = v21;
      if (v9)
      {
        v16 = objc_alloc_init(RERelevanceEnginePreferences);
        v17 = self->_effectivePreferences;
        self->_effectivePreferences = v16;

        -[RERelevanceEnginePreferences setDisabledDataSourceIdentifiers:](self->_effectivePreferences, "setDisabledDataSourceIdentifiers:", v9);
        -[RERelevanceEnginePreferences setMode:](self->_effectivePreferences, "setMode:", v8);
LABEL_18:

        effectivePreferences = self->_effectivePreferences;
        goto LABEL_19;
      }
    }
    else
    {

    }
    +[RERelevanceEnginePreferences defaultPreferences](RERelevanceEnginePreferences, "defaultPreferences");
    v18 = (RERelevanceEnginePreferences *)objc_claimAutoreleasedReturnValue();
    v9 = self->_effectivePreferences;
    self->_effectivePreferences = v18;
    goto LABEL_18;
  }
LABEL_19:
  v19 = (void *)-[RERelevanceEnginePreferences copy](effectivePreferences, "copy");
  os_unfair_lock_unlock(p_lock);
  return (RERelevanceEnginePreferences *)v19;
}

- (RERelevanceEnginePreferencesController)initWithQueue:(id)a3
{
  id v5;
  RERelevanceEnginePreferencesController *v6;
  RERelevanceEnginePreferencesController *v7;
  uint64_t v8;
  NSMapTable *preferences;
  RERelevanceEnginePreferences *effectivePreferences;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RERelevanceEnginePreferencesController;
  v6 = -[RERelevanceEnginePreferencesController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    preferences = v7->_preferences;
    v7->_preferences = (NSMapTable *)v8;

    effectivePreferences = v7->_effectivePreferences;
    v7->_effectivePreferences = 0;

  }
  return v7;
}

- (void)setPreferences:(id)a3 forObject:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v8, "setDelegate:", self);
  -[NSMapTable setObject:forKey:](self->_preferences, "setObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_lock);
  -[RERelevanceEnginePreferencesController _resetEffectivePreferences](self, "_resetEffectivePreferences");
}

- (void)removePreferencesForObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable objectForKey:](self->_preferences, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);
  -[NSMapTable removeObjectForKey:](self->_preferences, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
  -[RERelevanceEnginePreferencesController _resetEffectivePreferences](self, "_resetEffectivePreferences");

}

- (void)_resetEffectivePreferences
{
  os_unfair_lock_s *p_lock;
  RERelevanceEnginePreferences *effectivePreferences;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  effectivePreferences = self->_effectivePreferences;
  self->_effectivePreferences = 0;

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("RERelevanceEnginePreferencesDidUpdate"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_effectivePreferences, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end

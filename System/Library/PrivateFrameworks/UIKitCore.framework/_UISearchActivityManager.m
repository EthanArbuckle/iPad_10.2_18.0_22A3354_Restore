@implementation _UISearchActivityManager

- (_UISearchActivityManager)initWithScene:(id)a3
{
  id v4;
  _UISearchActivityManager *v5;
  _UISearchActivityManager *v6;
  NSMapTable *v7;
  NSMapTable *activeAssertions;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISearchActivityManager;
  v5 = -[_UISearchActivityManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E0CB3748]);
    activeAssertions = v6->__activeAssertions;
    v6->__activeAssertions = v7;

  }
  return v6;
}

- (id)beginTrackingActiveSearchParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UISearchActivityManager _activeAssertions](self, "_activeAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Attempt to begin tracking an already tracked active search participant. Participant: %@", buf, 0xCu);
      }

    }
    else
    {
      v7 = beginTrackingActiveSearchParticipant____s_category;
      if (!beginTrackingActiveSearchParticipant____s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&beginTrackingActiveSearchParticipant____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Attempt to begin tracking an already tracked active search participant. Participant: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SearchParticipant:%p"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D01868]);
    v11 = MEMORY[0x1E0C80D38];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65___UISearchActivityManager_beginTrackingActiveSearchParticipant___block_invoke;
    v15[3] = &unk_1E16CD530;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, (id *)buf);
    v6 = (void *)objc_msgSend(v10, "initWithIdentifier:forReason:queue:invalidationBlock:", v9, CFSTR("Active search participant"), MEMORY[0x1E0C80D38], v15);

    -[_UISearchActivityManager _activeAssertions](self, "_activeAssertions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v6, v4);

    -[_UISearchActivityManager _updateClientSettingsIfNecessary](self, "_updateClientSettingsIfNecessary");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

- (id)windowHostingScene
{
  return objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_updateClientSettingsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _QWORD v9[4];
  BOOL v10;

  -[_UISearchActivityManager windowHostingScene](self, "windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "_hasInvalidated") & 1) == 0)
    {
      -[_UISearchActivityManager _activeAssertions](self, "_activeAssertions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      objc_msgSend(v4, "_effectiveUIClientSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsSearchView");

      if ((v6 != 0) != v8)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __60___UISearchActivityManager__updateClientSettingsIfNecessary__block_invoke;
        v9[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
        v10 = v6 != 0;
        objc_msgSend(v4, "_updateUIClientSettingsWithBlock:", v9);
      }
    }
  }

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (NSMapTable)_activeAssertions
{
  return self->__activeAssertions;
}

- (void)set_activeAssertions:(id)a3
{
  objc_storeStrong((id *)&self->__activeAssertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAssertions, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end

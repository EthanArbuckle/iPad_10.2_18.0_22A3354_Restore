@implementation _UIChildRemoteContentRegistry

- (_UIChildRemoteContentRegistry)initWithParentScene:(id)a3
{
  id v5;
  _UIChildRemoteContentRegistry *v6;
  _UIChildRemoteContentRegistry *v7;
  id v8;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIChildRemoteContentRegistry.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentScene"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_UIChildRemoteContentRegistry;
  v6 = -[_UIChildRemoteContentRegistry init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = objc_storeWeak((id *)&v6->_parentScene, v5);
    objc_msgSend(v5, "addObserver:", v7);

  }
  return v7;
}

- (void)addChildScene:(id)a3
{
  id v4;
  NSHashTable *childScenes;
  NSHashTable *v6;
  NSHashTable *v7;
  id WeakRetained;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  childScenes = self->_childScenes;
  if (!childScenes)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_childScenes;
    self->_childScenes = v6;

    childScenes = self->_childScenes;
  }
  -[NSHashTable addObject:](childScenes, "addObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  objc_msgSend(v4, "setParentScene:", WeakRetained);

  v9 = addChildScene____s_category[0];
  if (!addChildScene____s_category[0])
  {
    v9 = __UILogCategoryGetNode("_UIChildRemoteContentRegistry", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, addChildScene____s_category);
  }
  v10 = *(id *)(v9 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[_UIChildRemoteContentRegistry succinctDescription](self, "succinctDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = CFSTR("(nil)");
    }

    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%@ Registry is now tracking child scene %@", buf, 0x16u);

  }
  if (!-[_UIChildRemoteContentRegistry parentSettingsAvailable](self, "parentSettingsAvailable"))
  {
    v17 = objc_loadWeakRetained((id *)&self->_parentScene);
    objc_msgSend(v17, "removeObserver:", self);

    v18 = objc_loadWeakRetained((id *)&self->_parentScene);
    objc_msgSend(v18, "addObserver:", self);

  }
}

- (void)removeChildScene:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  int v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  NSMutableDictionary *enqueuedSettingsAvailabilityBlocks;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "parentScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  v7 = objc_msgSend(v5, "isEqual:", WeakRetained);

  if (v7)
    objc_msgSend(v4, "setParentScene:", 0);
  -[NSHashTable removeObject:](self->_childScenes, "removeObject:", v4);
  v8 = removeChildScene____s_category;
  if (!removeChildScene____s_category)
  {
    v8 = __UILogCategoryGetNode("_UIChildRemoteContentRegistry", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&removeChildScene____s_category);
  }
  v9 = *(id *)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[_UIChildRemoteContentRegistry succinctDescription](self, "succinctDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("(nil)");
    }

    *(_DWORD *)buf = 138412546;
    v20 = v10;
    v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%@ Registry is no longer tracking child scene %@", buf, 0x16u);

  }
  enqueuedSettingsAvailabilityBlocks = self->_enqueuedSettingsAvailabilityBlocks;
  objc_msgSend(v4, "identityToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](enqueuedSettingsAvailabilityBlocks, "removeObjectForKey:", v18);

}

- (NSSet)childScenes
{
  return -[NSHashTable setRepresentation](self->_childScenes, "setRepresentation");
}

- (void)addChildViewService:(id)a3
{
  id v4;
  NSHashTable *childViewServices;
  NSHashTable *v6;
  NSHashTable *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  id WeakRetained;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  childViewServices = self->_childViewServices;
  if (!childViewServices)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_childViewServices;
    self->_childViewServices = v6;

    childViewServices = self->_childViewServices;
  }
  -[NSHashTable addObject:](childViewServices, "addObject:", v4);
  v8 = addChildViewService____s_category;
  if (!addChildViewService____s_category)
  {
    v8 = __UILogCategoryGetNode("_UIChildRemoteContentRegistry", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&addChildViewService____s_category);
  }
  v9 = *(id *)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[_UIChildRemoteContentRegistry succinctDescription](self, "succinctDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("(nil)");
    }

    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%@ Registry is now tracking child view service %@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  objc_msgSend(WeakRetained, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_movedToParentSceneWithSettings:", v17);

}

- (void)removeChildViewService:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSHashTable removeObject:](self->_childViewServices, "removeObject:", v4);
  v5 = removeChildViewService____s_category;
  if (!removeChildViewService____s_category)
  {
    v5 = __UILogCategoryGetNode("_UIChildRemoteContentRegistry", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&removeChildViewService____s_category);
  }
  v6 = *(id *)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[_UIChildRemoteContentRegistry succinctDescription](self, "succinctDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v8);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = CFSTR("(nil)");
    }

    *(_DWORD *)buf = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%@ Registry is no longer tracking child view service %@", buf, 0x16u);

  }
}

- (NSSet)childViewServices
{
  return -[NSHashTable setRepresentation](self->_childViewServices, "setRepresentation");
}

- (FBSSceneSettings)parentSettings
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSSceneSettings *)v3;
}

- (BOOL)parentSettingsAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UIChildRemoteContentRegistry parentSettings](self, "parentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)executeWhenParentSettingsAreAvailable:(id)a3 forChildScene:(id)a4
{
  id v7;
  NSMutableDictionary *enqueuedSettingsAvailabilityBlocks;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id aBlock;

  aBlock = a3;
  v7 = a4;
  if (-[_UIChildRemoteContentRegistry parentSettingsAvailable](self, "parentSettingsAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIChildRemoteContentRegistry.m"), 115, CFSTR("Unable to enqueue a parent scene setting availability block when parent scene settings are currently available"));

  }
  if (!-[NSHashTable containsObject:](self->_childScenes, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIChildRemoteContentRegistry.m"), 116, CFSTR("Unable to enqueue a parent scene availability block for a child that is not being tracked by this registry"));

  }
  enqueuedSettingsAvailabilityBlocks = self->_enqueuedSettingsAvailabilityBlocks;
  if (!enqueuedSettingsAvailabilityBlocks)
  {
    v9 = (NSMutableDictionary *)objc_opt_new();
    v10 = self->_enqueuedSettingsAvailabilityBlocks;
    self->_enqueuedSettingsAvailabilityBlocks = v9;

    enqueuedSettingsAvailabilityBlocks = self->_enqueuedSettingsAvailabilityBlocks;
  }
  v11 = _Block_copy(aBlock);
  objc_msgSend(v7, "identityToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](enqueuedSettingsAvailabilityBlocks, "setValue:forKey:", v11, v13);

}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableDictionary *enqueuedSettingsAvailabilityBlocks;
  void *v14;
  NSMutableDictionary *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSHashTable allObjects](self->_childViewServices, "allObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(v5, "settingsDiff");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_parentSceneDidUpdateWithDiff:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  enqueuedSettingsAvailabilityBlocks = self->_enqueuedSettingsAvailabilityBlocks;
  if (enqueuedSettingsAvailabilityBlocks)
  {
    -[NSMutableDictionary allValues](enqueuedSettingsAvailabilityBlocks, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_653);

    v15 = self->_enqueuedSettingsAvailabilityBlocks;
    self->_enqueuedSettingsAvailabilityBlocks = 0;

  }
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIChildRemoteContentRegistry debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIChildRemoteContentRegistry succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained((id *)&self->_parentScene);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }

  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("parentScene"));
  v10 = (id)objc_msgSend(v3, "appendInt:withName:", -[NSHashTable count](self->_childScenes, "count"), CFSTR("childScenes"));
  v11 = (id)objc_msgSend(v3, "appendInt:withName:", -[NSHashTable count](self->_childViewServices, "count"), CFSTR("childViewServices"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIChildRemoteContentRegistry descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIChildRemoteContentRegistry descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  id v12;
  id v13;
  id v15;
  _QWORD v16[4];
  id v17;
  _UIChildRemoteContentRegistry *v18;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  v7 = objc_loadWeakRetained((id *)&self->_parentScene);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v7);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("(nil)");
  }

  v12 = (id)objc_msgSend(v6, "appendObject:withName:", v11, CFSTR("parentScene"));
  if (-[NSHashTable count](self->_childScenes, "count") || -[NSHashTable count](self->_childViewServices, "count"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71___UIChildRemoteContentRegistry_descriptionBuilderWithMultilinePrefix___block_invoke;
    v16[3] = &unk_1E16B1B50;
    v17 = v6;
    v18 = self;
    v13 = (id)objc_msgSend(v17, "modifyBody:", v16);

  }
  else
  {
    v15 = (id)objc_msgSend(v6, "appendObject:withName:", CFSTR("none"), CFSTR("children"));
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuedSettingsAvailabilityBlocks, 0);
  objc_storeStrong((id *)&self->_childViewServices, 0);
  objc_storeStrong((id *)&self->_childScenes, 0);
  objc_destroyWeak((id *)&self->_parentScene);
}

@end

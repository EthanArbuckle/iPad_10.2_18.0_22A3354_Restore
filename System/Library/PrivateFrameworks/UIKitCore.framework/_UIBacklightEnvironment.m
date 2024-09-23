@implementation _UIBacklightEnvironment

- (_UIBacklightEnvironment)initWithScene:(id)a3
{
  id v4;
  _UIBacklightEnvironment *v5;
  _UIBacklightEnvironment *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIBacklightEnvironment;
  v5 = -[_UIBacklightEnvironment init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    objc_msgSend(v4, "_backlightSceneEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v7, "setDelegate:", v6);
      objc_msgSend(v7, "setSupportsAlwaysOn:", objc_msgSend((id)objc_opt_class(), "_alwaysOnSupported"));
    }

  }
  return v6;
}

- (UITraitCollection)_traitOverrides
{
  BLSBacklightSceneVisualState *visualState;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_opt_class(), "_backlightEnvironmentSupported"))
    return (UITraitCollection *)0;
  visualState = self->_visualState;
  if (visualState)
  {
    v4 = -[BLSBacklightSceneVisualState updateFidelity](visualState, "updateFidelity");
    v5 = -[BLSBacklightSceneVisualState adjustedLuminance](self->_visualState, "adjustedLuminance");
    v6 = 1;
    if (v5 != 1)
      v6 = 2;
    if (!v5)
      v6 = 0;
  }
  else
  {
    v6 = 2;
    v4 = 3;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42___UIBacklightEnvironment__traitOverrides__block_invoke;
  v11[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
  v11[4] = v4;
  v11[5] = v6;
  +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _traitOverrides___s_category[0];
  if (!_traitOverrides___s_category[0])
  {
    v9 = __UILogCategoryGetNode("UIBacklightEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, _traitOverrides___s_category);
  }
  v10 = *(NSObject **)(v9 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Updated traitOverrides: %{public}@", buf, 0xCu);
  }
  return (UITraitCollection *)v8;
}

+ (BOOL)_backlightEnvironmentSupported
{
  if ((objc_msgSend((id)objc_opt_class(), "_alwaysOnSupported") & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)UIApp, "_supportsBacklightEnvironment");
}

+ (BOOL)_alwaysOnSupported
{
  return objc_msgSend((id)UIApp, "_supportsAlwaysOnDisplay");
}

- (void)_setScene:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_scene, a3);
  -[_UIBacklightEnvironment _windowScene](self, "_windowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_componentDidUpdateTraitOverrides:", self);

}

- (id)_windowScene
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[_UIBacklightEnvironment _scene](self, "_scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

+ (id)_postSynchronizeQueue
{
  if (_MergedGlobals_1089 != -1)
    dispatch_once(&_MergedGlobals_1089, &__block_literal_global_103_1);
  return (id)qword_1ECD7E2D0;
}

+ (double)_defaultAnimationDuration
{
  return 0.5;
}

- (BOOL)isObserver:(id)a3
{
  return a3 && -[NSHashTable containsObject:](self->_observers, "containsObject:");
}

- (void)addObserver:(id)a3
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
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_enumerateAllObserversWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_notifyObserversEnvironmentVisualStateWillChangeToState:(id)a3
{
  void *v4;

  if (BLSBacklightStateForVisuaState() == 2)
    v4 = &__block_literal_global_110_2;
  else
    v4 = &__block_literal_global_114_0;
  -[_UIBacklightEnvironment _enumerateAllObserversWithBlock:](self, "_enumerateAllObserversWithBlock:", v4);
}

- (void)_notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "visualState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BLSBacklightStateForVisuaState();

  if (v5 == 2)
    -[_UIBacklightEnvironment _enumerateAllObserversWithBlock:](self, "_enumerateAllObserversWithBlock:", &__block_literal_global_118);
}

- (void)_notifyObserversIfEnvironmentVisualStateDidChangeFromActiveOn:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "visualState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BLSBacklightStateForVisuaState();

  if (v5 != 2)
    -[_UIBacklightEnvironment _enumerateAllObserversWithBlock:](self, "_enumerateAllObserversWithBlock:", &__block_literal_global_122);
}

- (void)transitionTraitsInUpdate:(id)a3 animations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  void *v21;
  int v22;
  id WeakRetained;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD v47[5];
  void (**v48)(_QWORD);
  _QWORD v49[4];
  void (**v50)(_QWORD);
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD aBlock[4];
  id v56;
  _UIBacklightEnvironment *v57;
  id v58;
  char v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previousVisualState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visualState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();

  objc_msgSend(v8, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "visualState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[BLSBacklightSceneVisualState isEqual:](self->_visualState, "isEqual:", v16);
  if ((v17 & 1) == 0)
    objc_storeStrong((id *)&self->_visualState, v16);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke;
  aBlock[3] = &unk_1E16B1CF0;
  v59 = v17 ^ 1;
  v18 = v8;
  v56 = v18;
  v57 = self;
  v19 = v9;
  v58 = v19;
  v20 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v18, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isAnimated");

  if (v22)
  {
    v45 = v19;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(WeakRetained, "windows");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v52;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v52 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v28++), "layoutIfNeeded", v45);
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v26);
    }

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v29 = (void *)MEMORY[0x1E0CD28B0];
    objc_msgSend((id)objc_opt_class(), "_defaultAnimationDuration");
    objc_msgSend(v29, "setAnimationDuration:");
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v30 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      v31 = (void *)MEMORY[0x1E0CD28B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke_132;
      v49[3] = &unk_1E16B1BF8;
      v50 = v10;
      objc_msgSend(v31, "setCompletionBlock:", v49);

    }
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("com.apple.uikit.backlighttransition"), v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_defaultAnimationDuration");
    objc_msgSend(v32, "setDuration:");
    objc_msgSend(v32, "setFromValue:", &unk_1E1A958E0);
    objc_msgSend(v32, "setToValue:", &unk_1E1A958F0);
    v33 = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(v33, "keyWindow");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addAnimation:forKey:", v32, CFSTR("uikit.backlightTransition"));

    objc_msgSend((id)objc_opt_class(), "_defaultAnimationDuration");
    objc_msgSend(v18, "performBacklightRampWithDuration:");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_msgSend((id)objc_opt_class(), "_defaultAnimationDuration");
    v36 = v35;
    v47[0] = v30;
    v47[1] = 3221225472;
    v47[2] = __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke_140;
    v47[3] = &unk_1E16B2F48;
    v47[4] = self;
    v48 = v20;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v47, v36);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_msgSend(v18, "context");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "previousVisualState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "visualState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

    v19 = v46;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v20[2](v20);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_msgSend(v18, "context");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "previousVisualState");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "context");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "visualState");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

    objc_msgSend(v18, "performBacklightRampWithDuration:", 0.0);
    if (v10)
      v10[2](v10);
  }

}

+ (void)_performOnChildViewControllersForAlwaysOnTimelines:(id)a3 performBlock:(id)a4 withCompletion:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD *);
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id obj;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  void (**v21)(_QWORD);
  uint64_t *v22;
  SEL v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, uint64_t, _QWORD *))a4;
  v11 = (void (**)(_QWORD))a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "addObject:", v16);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __106___UIBacklightEnvironment__performOnChildViewControllersForAlwaysOnTimelines_performBlock_withCompletion___block_invoke;
        v18[3] = &unk_1E16CB828;
        v23 = a2;
        v24 = a1;
        v19 = v12;
        v20 = v16;
        v22 = &v29;
        v21 = v11;
        v10[2](v10, v16, v18);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(v12, "count"))
    v11[2](v11);
  *((_BYTE *)v30 + 24) = 1;

  _Block_object_dispose(&v29, 8);
}

- (void)updateSceneWithFrameSpecifier:(id)a3 layout:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _UIBacklightEnvironment *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "windows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v11;
  v29 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(obj);
        v30 = v12;
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v12), "rootViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_effectiveControllersForAlwaysOnTimelines");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v38;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v38 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v19);
              if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v9, "addObject:", v20);
              }
              else if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v20, "performSelector:withObject:", sel_puic_updateWithFrameSpecifier_, v7);
              }
              else
              {
                objc_msgSend(v20, "_updateWithFrameSpecifier:", v7);
              }
              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v17);
        }

        v12 = v30 + 1;
      }
      while (v30 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v29);
  }

  v21 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75___UIBacklightEnvironment_updateSceneWithFrameSpecifier_layout_completion___block_invoke;
  v33[3] = &unk_1E16CB850;
  v22 = v7;
  v35 = v9;
  v36 = v8;
  v34 = v22;
  v23 = v9;
  v24 = v8;
  -[_UIBacklightEnvironment _enumerateAllObserversWithBlock:](v26, "_enumerateAllObserversWithBlock:", v33);
  v31[0] = v21;
  v31[1] = 3221225472;
  v31[2] = __75___UIBacklightEnvironment_updateSceneWithFrameSpecifier_layout_completion___block_invoke_2;
  v31[3] = &unk_1E16CB878;
  v32 = v22;
  v25 = v22;
  +[_UIBacklightEnvironment _performOnChildViewControllersForAlwaysOnTimelines:performBlock:withCompletion:](_UIBacklightEnvironment, "_performOnChildViewControllersForAlwaysOnTimelines:performBlock:withCompletion:", v23, v31, v24);

}

- (void)_commit:(BOOL)a3 andPerformPostSynchronizeBlock:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  +[_UIBacklightEnvironment _postSynchronizeQueue](_UIBacklightEnvironment, "_postSynchronizeQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueuePostSynchronizeBlock:", v5);

  if (v4)
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)environment:(id)a3 performBacklightSceneUpdate:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  unint64_t v15;
  NSObject *v16;
  char v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _UIBacklightEnvironment *v42;
  id v43;
  _QWORD aBlock[5];
  id v45;
  SEL v46;
  _QWORD v47[4];
  id v48;
  _UIBacklightEnvironment *v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  BOOL v54;
  BOOL v55;
  _QWORD v56[4];
  id v57;
  _UIBacklightEnvironment *v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  SEL v66;
  BOOL v67;
  BOOL v68;
  _QWORD v69[5];
  id v70;
  id v71;
  uint8_t buf[4];
  _BOOL4 v73;
  __int16 v74;
  _BOOL4 v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v7 = a4;
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameSpecifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visualState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = BLSBacklightStateForVisuaState();
  v11 = v10 == 2;

  objc_msgSend(v8, "previousVisualState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "previousVisualState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BLSBacklightStateForVisuaState() == 2;

  }
  else
  {
    v14 = v10 != 2;
  }
  v15 = environment_performBacklightSceneUpdate____s_category;
  if (!environment_performBacklightSceneUpdate____s_category)
  {
    v15 = __UILogCategoryGetNode("UIBacklightEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v15, (unint64_t *)&environment_performBacklightSceneUpdate____s_category);
  }
  v16 = *(NSObject **)(v15 + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v73 = v10 == 2;
    v74 = 1024;
    v75 = v14;
    _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "performBacklightSceneUpdate isOn = %d wasOn = %d", buf, 0xEu);
  }
  v17 = (v10 == 2) ^ v14 ^ 1;
  if ((v10 != 2) | v17 & 1)
  {
    if (v10 == 2)
      v17 = 1;
    if ((v17 & 1) != 0)
    {
      v18 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_12;
      aBlock[3] = &unk_1E16B1C28;
      v46 = a2;
      aBlock[4] = self;
      v45 = v7;
      v19 = _Block_copy(aBlock);
      v40[0] = v18;
      v40[1] = 3221225472;
      v40[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_16;
      v40[3] = &unk_1E16BAD68;
      v41 = v38;
      v42 = self;
      v43 = v19;
      v20 = v19;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v40);

      v21 = v45;
    }
    else
    {
      objc_msgSend(v8, "visualState");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBacklightEnvironment _notifyObserversEnvironmentVisualStateWillChangeToState:](self, "_notifyObserversEnvironmentVisualStateWillChangeToState:", v36);

      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_11;
      v47[3] = &unk_1E16B47A8;
      v37 = v7;
      v48 = v37;
      v49 = self;
      v50 = v39;
      -[_UIBacklightEnvironment transitionTraitsInUpdate:animations:completion:](self, "transitionTraitsInUpdate:animations:completion:", v37, &__block_literal_global_149_1, v47);
      objc_msgSend(v37, "sceneContentsDidUpdate");

      v21 = v48;
    }
  }
  else
  {
    objc_msgSend(v8, "previousVisualState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visualState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

    objc_msgSend(v8, "visualState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBacklightEnvironment _notifyObserversEnvironmentVisualStateWillChangeToState:](self, "_notifyObserversEnvironmentVisualStateWillChangeToState:", v24);

    v25 = MEMORY[0x1E0C809B0];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke;
    v69[3] = &unk_1E16B47A8;
    v69[4] = self;
    v26 = v8;
    v70 = v26;
    v27 = v7;
    v71 = v27;
    v28 = _Block_copy(v69);
    v62[0] = v25;
    v62[1] = 3221225472;
    v62[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_2;
    v62[3] = &unk_1E16CB8A0;
    v66 = a2;
    v62[4] = self;
    v63 = v27;
    v67 = v14;
    v68 = v11;
    v29 = v28;
    v65 = v29;
    v64 = v39;
    v30 = _Block_copy(v62);
    v56[0] = v25;
    v56[1] = 3221225472;
    v56[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_7;
    v56[3] = &unk_1E16CB8C8;
    v57 = v26;
    v31 = v29;
    v60 = v31;
    v58 = self;
    v32 = v38;
    v59 = v32;
    v33 = v30;
    v61 = v33;
    v34 = _Block_copy(v56);
    v35 = v34;
    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      kdebug_trace();
      v51[0] = v25;
      v51[1] = 3221225472;
      v51[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_9;
      v51[3] = &unk_1E16CB968;
      v51[4] = self;
      v54 = v14;
      v55 = v11;
      v52 = v32;
      v53 = v35;
      -[_UIBacklightEnvironment updateSceneWithFrameSpecifier:layout:completion:](self, "updateSceneWithFrameSpecifier:layout:completion:", v52, 1, v51);

    }
    else
    {
      (*((void (**)(void *))v34 + 2))(v34);
    }

    v21 = v70;
  }

}

- (void)environment:(id)a3 timelinesForDateInterval:(id)a4 previousSpecifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _UIBacklightEnvironment *v35;
  id v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _UIBacklightEnvironment *v47;
  id v48;
  SEL v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v36 = a6;
  v11 = environment_timelinesForDateInterval_previousSpecifier_completion____s_category[0];
  if (!environment_timelinesForDateInterval_previousSpecifier_completion____s_category[0])
  {
    v11 = __UILogCategoryGetNode("UIBacklightEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, environment_timelinesForDateInterval_previousSpecifier_completion____s_category);
  }
  v12 = *(NSObject **)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v65 = v9;
    v66 = 2114;
    v67 = v10;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Fetching timelines for dateInterval : %{public}@ previousSpecifier : %{public}@", buf, 0x16u);
  }
  v37 = v10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v35 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "windows");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v16;
  v40 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v59;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v59 != v39)
          objc_enumerationMutation(obj);
        v41 = v17;
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v17), "rootViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_effectiveControllersForAlwaysOnTimelines");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v55 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v13, "addObject:", v25);
              }
              else
              {
                objc_msgSend(v25, "_timelinesForDateInterval:", v9);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "addObjectsFromArray:", v26);

              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          }
          while (v22);
        }

        v17 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v40);
  }

  v27 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke;
  v50[3] = &unk_1E16CB8F0;
  v28 = v9;
  v51 = v28;
  v29 = v14;
  v52 = v29;
  v53 = v13;
  v30 = v13;
  -[_UIBacklightEnvironment _enumerateAllObserversWithBlock:](v35, "_enumerateAllObserversWithBlock:", v50);
  v45[0] = v27;
  v45[1] = 3221225472;
  v45[2] = __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_2;
  v45[3] = &unk_1E16CB940;
  v49 = a2;
  v46 = v28;
  v47 = v35;
  v48 = v29;
  v42[0] = v27;
  v42[1] = 3221225472;
  v42[2] = __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_4;
  v42[3] = &unk_1E16B1D18;
  v43 = v48;
  v44 = v36;
  v31 = v28;
  v32 = v48;
  v33 = v36;
  +[_UIBacklightEnvironment _performOnChildViewControllersForAlwaysOnTimelines:performBlock:withCompletion:](_UIBacklightEnvironment, "_performOnChildViewControllersForAlwaysOnTimelines:performBlock:withCompletion:", v30, v45, v42);

}

- (BOOL)shouldDeferWakeAnimationStart
{
  return self->_shouldDeferWakeAnimationStart;
}

- (void)setShouldDeferWakeAnimationStart:(BOOL)a3
{
  self->_shouldDeferWakeAnimationStart = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_visualState, 0);
}

@end

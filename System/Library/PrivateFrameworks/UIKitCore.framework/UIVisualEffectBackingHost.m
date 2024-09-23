@implementation UIVisualEffectBackingHost

- (id)initForView:(id)a3
{
  id v4;
  UIVisualEffectBackingHost *v5;
  UIVisualEffectBackingHost *v6;
  _UIVisualEffectEnvironment *v7;
  _UIVisualEffectEnvironment *environment;
  id WeakRetained;
  void *v10;
  _BOOL8 v11;
  _UIVisualEffectViewBackdropCaptureGroup *v12;
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  NSArray *contentEffects;
  NSArray *v15;
  NSArray *backgroundEffects;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIVisualEffectBackingHost;
  v5 = -[UIVisualEffectBackingHost init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    v7 = -[_UIVisualEffectEnvironment initWithHost:]([_UIVisualEffectEnvironment alloc], "initWithHost:", v6);
    environment = v6->_environment;
    v6->_environment = v7;

    -[_UIVisualEffectEnvironment setAllowsBlurring:](v6->_environment, "setAllowsBlurring:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_view);
    objc_msgSend(WeakRetained, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom") != 3 && _AXSEnhanceBackgroundContrastEnabled() != 0;
    -[_UIVisualEffectEnvironment setReducedTransperancy:](v6->_environment, "setReducedTransperancy:", v11);

    v12 = objc_alloc_init(_UIVisualEffectViewBackdropCaptureGroup);
    captureGroup = v6->_captureGroup;
    v6->_captureGroup = v12;

    contentEffects = v6->_contentEffects;
    v15 = (NSArray *)MEMORY[0x1E0C9AA60];
    v6->_contentEffects = (NSArray *)MEMORY[0x1E0C9AA60];

    backgroundEffects = v6->_backgroundEffects;
    v6->_backgroundEffects = v15;

    -[UIVisualEffectBackingHost _registerNotifications](v6, "_registerNotifications");
    -[UIVisualEffectBackingHost invalidateCaptureGroupName](v6, "invalidateCaptureGroupName");
  }

  return v6;
}

- (void)invalidateCaptureGroupName
{
  void *v3;
  void *v4;
  id WeakRetained;

  if (self->_captureGroupName)
  {
    -[_UIVisualEffectViewBackdropCaptureGroup setGroupName:](self->_captureGroup, "setGroupName:");
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%p"), WeakRetained);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectViewBackdropCaptureGroup setGroupName:](self->_captureGroup, "setGroupName:", v4);

  }
}

- (void)_setCaptureGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_captureGroupName, a3);
  -[UIVisualEffectBackingHost invalidateCaptureGroupName](self, "invalidateCaptureGroupName");
}

- (void)setBackgroundEffects:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  void *v9;
  id WeakRetained;
  NSArray *v11;
  NSArray *backgroundEffects;
  NSArray *v13;

  v4 = a3;
  v5 = self->_backgroundEffects;
  v6 = (NSArray *)v4;
  v13 = v6;
  if (v5 == v6)
  {

    v9 = v13;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      v8 = v13;
      if ((v7 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_deferredAnimationForKey:", CFSTR("backgroundEffects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v13, 1);
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = v11;

    if (v9)
    {
      objc_msgSend(v9, "addAnimationFrameForValue:", self->_backgroundEffects);
    }
    else
    {
      *(_BYTE *)&self->_flags |= 1u;
      -[UIVisualEffectBackingHost _configureEffects](self, "_configureEffects");
    }
  }

  v8 = v13;
LABEL_12:

}

- (void)setVisualEffect:(id)a3
{
  UIVisualEffect *v4;
  UIVisualEffect *visualEffect;
  id v6;
  void *v7;

  v4 = (UIVisualEffect *)objc_msgSend(a3, "copy");
  visualEffect = self->_visualEffect;
  self->_visualEffect = v4;

  v6 = 0;
  v7 = 0;
  _UIVisualEffectViewUpgradeLegacyEffect(self->_visualEffect, &v7, &v6);
  -[UIVisualEffectBackingHost setContentEffects:](self, "setContentEffects:", v6);
  -[UIVisualEffectBackingHost setBackgroundEffects:](self, "setBackgroundEffects:", v7);

}

- (void)setContentEffects:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  void *v9;
  id WeakRetained;
  NSArray *v11;
  NSArray *contentEffects;
  NSArray *v13;

  v4 = a3;
  v5 = self->_contentEffects;
  v6 = (NSArray *)v4;
  v13 = v6;
  if (v5 == v6)
  {

    v9 = v13;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      v8 = v13;
      if ((v7 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_deferredAnimationForKey:", CFSTR("contentEffects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v13, 1);
    contentEffects = self->_contentEffects;
    self->_contentEffects = v11;

    if (v9)
    {
      objc_msgSend(v9, "addAnimationFrameForValue:", self->_contentEffects);
    }
    else
    {
      *(_BYTE *)&self->_flags |= 2u;
      -[UIVisualEffectBackingHost _configureEffects](self, "_configureEffects");
    }
  }

  v8 = v13;
LABEL_12:

}

- (BOOL)_hasDeferredAnimations
{
  UIView **p_view;
  id WeakRetained;
  char v4;
  id v5;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((-[UIView _hasDeferredAnimationForKey:]((uint64_t)WeakRetained, CFSTR("contentEffects")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)p_view);
    v4 = -[UIView _hasDeferredAnimationForKey:]((uint64_t)v5, CFSTR("backgroundEffects"));

  }
  return v4;
}

- (void)_updateEnvironmentAndFlagUpdatesIfNecessary:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  $AE0800C6C1830CBF550A377BF4428CA5 flags;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)-[_UIVisualEffectEnvironment copy](self->_environment, "copy");
  v4[2](v4);
  flags = self->_flags;
  if ((~*(_DWORD *)&flags & 3) != 0)
  {
    -[_UIVisualEffectEnvironment traitCollection](self->_environment, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedTraitsFromTraitCollection:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)&flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_16;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_backgroundEffects;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "_needsUpdateForTransitionFromEnvironment:toEnvironment:changedTraits:usage:", v5, self->_environment, v7, 1))
        {
          *(_BYTE *)&self->_flags |= 1u;
          goto LABEL_15;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

  *(_BYTE *)&flags = self->_flags;
LABEL_16:
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = self->_contentEffects;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      while (2)
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "_needsUpdateForTransitionFromEnvironment:toEnvironment:changedTraits:usage:", v5, self->_environment, v7, 2, (_QWORD)v20))
          {
            *(_BYTE *)&self->_flags |= 2u;
            goto LABEL_27;
          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v17)
          continue;
        break;
      }
    }
LABEL_27:

  }
}

- (void)_registerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateEffectForAccessibilityChanges_, CFSTR("UIAccessibilityReduceTransparencyStatusDidChangeNotification"), 0);

}

- (void)_unregisterNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityReduceTransparencyStatusDidChangeNotification"), 0);

}

- (void)_updateEffectForAccessibilityChanges:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__UIVisualEffectBackingHost__updateEffectForAccessibilityChanges___block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[UIVisualEffectBackingHost _updateEnvironmentAndFlagUpdatesIfNecessary:](self, "_updateEnvironmentAndFlagUpdatesIfNecessary:", v4);
  -[UIVisualEffectBackingHost _configureEffects](self, "_configureEffects");
}

void __66__UIVisualEffectBackingHost__updateEffectForAccessibilityChanges___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 3 && _AXSEnhanceBackgroundContrastEnabled() != 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setReducedTransperancy:", v3);

}

- (void)didMoveToSuperview
{
  -[UIVisualEffectBackingHost invalidateCaptureGroupName](self, "invalidateCaptureGroupName");
  -[UIVisualEffectBackingHost _configureEffects](self, "_configureEffects");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[_UIVisualEffectEnvironment traitCollection](self->_environment, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__UIVisualEffectBackingHost_traitCollectionDidChange___block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  -[UIVisualEffectBackingHost _updateEnvironmentAndFlagUpdatesIfNecessary:](self, "_updateEnvironmentAndFlagUpdatesIfNecessary:", v5);
  -[UIVisualEffectBackingHost _configureEffects](self, "_configureEffects");

}

void __54__UIVisualEffectBackingHost_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_mergedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTraitCollection:", v2);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") != 3 && _AXSEnhanceBackgroundContrastEnabled() != 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setReducedTransperancy:", v4);

}

- (id)_mergedTraitCollection
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_generateDeferredAnimations:(id)a3
{
  _UIVisualEffectEnvironment *environment;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;

  environment = self->_environment;
  v6 = a3;
  -[_UIVisualEffectEnvironment traitCollection](environment, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[UIVisualEffectBackingHost _mergedTraitCollection](self, "_mergedTraitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectEnvironment setTraitCollection:](self->_environment, "setTraitCollection:", v8);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundEffects"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentEffects"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("effect"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 || v9 || v10)
  {
    objc_msgSend(v15, "animationFrames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "count") >= 3)
    {

    }
    else
    {
      objc_msgSend(v9, "animationFrames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 <= 2)
      {
        -[UIVisualEffectBackingHost _generateBackgroundEffects:contentEffects:](self, "_generateBackgroundEffects:contentEffects:", v15, v9);
        goto LABEL_11;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectBackingHost.m"), 399, CFSTR("This should not exist."));

  }
LABEL_11:

}

- (void)_generateBackgroundEffects:(id)a3 contentEffects:(id)a4
{
  id v6;
  id v7;
  UIVisualEffectBackingHost *v8;
  UIVisualEffectBackingHost *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  void *v15;
  _UIVisualEffectHost *v16;
  uint64_t v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIVisualEffectHost *v24;
  _QWORD *v25;
  _QWORD *v26;
  UIVisualEffectBackingHost *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _UIVisualEffectHost *v42;
  id v43;
  _UIVisualEffectHost *v44;
  UIVisualEffectBackingHost *v45;
  id v46;
  id location;
  _QWORD v48[4];
  _UIVisualEffectHost *v49;
  _QWORD v50[4];
  _UIVisualEffectHost *v51;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = v8;
  ++v8->_reentrantCount;
  if (v6)
  {
    -[UIVisualEffectBackingHost _ensureBackgroundHost](v8, "_ensureBackgroundHost");
    objc_msgSend(v6, "animationFrames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIVisualEffectBackingHost _effectDescriptorForEffects:usage:](v9, "_effectDescriptorForEffects:usage:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectHost setPrimaryCaptureGroup:](v9->_backgroundHost, "setPrimaryCaptureGroup:", v9->_captureGroup);
    if ((*(_BYTE *)&v9->_flags & 8) == 0)
    {
      captureGroup = v9->_captureGroup;
      -[_UIVisualEffectHost contentView](v9->_backgroundHost, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCaptureGroup:", captureGroup);

    }
    v16 = v9->_backgroundHost;
    v17 = objc_msgSend(v13, "layerHitTestsAsOpaque");
    WeakRetained = objc_loadWeakRetained((id *)&v9->_view);
    objc_msgSend(WeakRetained, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHitTestsAsOpaque:", v17);

    if (v7)
      goto LABEL_5;
  }
  else
  {
    v13 = 0;
    v16 = 0;
    if (v7)
    {
LABEL_5:
      -[UIVisualEffectBackingHost _ensureContentHost](v9, "_ensureContentHost");
      objc_msgSend(v7, "animationFrames");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectBackingHost _effectDescriptorForEffects:usage:](v9, "_effectDescriptorForEffects:usage:", v22, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v9->_contentHost;
      goto LABEL_8;
    }
  }
  v23 = 0;
  v24 = 0;
LABEL_8:
  -[_UIVisualEffectHost prepareToTransitionToEffectDescriptor:](v16, "prepareToTransitionToEffectDescriptor:", v13);
  -[_UIVisualEffectHost prepareToTransitionToEffectDescriptor:](v24, "prepareToTransitionToEffectDescriptor:", v23);
  v25 = objc_loadWeakRetained((id *)&v9->_view);
  v26 = (_QWORD *)v25[22];
  if (v26)
    v26 = (_QWORD *)v26[5];
  v27 = v26;

  if (v27 == v9)
  {
    -[UIVisualEffectBackingHost _updateSubviews](v9, "_updateSubviews");
    v28 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      objc_msgSend(v6, "animationFrames");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count") - 1;
      v50[0] = v28;
      v50[1] = 3221225472;
      v50[2] = __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke;
      v50[3] = &unk_1E16B5540;
      v51 = v16;
      objc_msgSend(v6, "animateFrameAtIndex:animations:", v30, v50);

    }
    if (v7)
    {
      objc_msgSend(v7, "animationFrames");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count") - 1;
      v48[0] = v28;
      v48[1] = 3221225472;
      v48[2] = __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke_2;
      v48[3] = &unk_1E16B5540;
      v49 = v24;
      objc_msgSend(v7, "animateFrameAtIndex:animations:", v32, v48);

    }
    -[_UIVisualEffectHost transitionEffectDescriptor](v16, "transitionEffectDescriptor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectHost transitionEffectDescriptor](v24, "transitionEffectDescriptor");
    v34 = v28;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v9);
    v38[0] = v34;
    v38[1] = 3221225472;
    v38[2] = __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke_3;
    v38[3] = &unk_1E16C9610;
    objc_copyWeak(&v46, &location);
    v39 = v6;
    v40 = v7;
    v36 = v33;
    v41 = v36;
    v42 = v16;
    v37 = v35;
    v43 = v37;
    v44 = v24;
    v45 = v9;
    +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v38);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);

  }
}

uint64_t __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginTransition");
}

uint64_t __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginTransition");
}

void __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!a3)
  {
    if (*(_QWORD *)(a1 + 32)
      && (v9 = *(void **)(a1 + 48),
          objc_msgSend(*(id *)(a1 + 56), "transitionEffectDescriptor"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9 == v10))
    {
      objc_msgSend(*(id *)(a1 + 56), "endTransition");
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    if (*(_QWORD *)(a1 + 40)
      && (v12 = *(void **)(a1 + 64),
          objc_msgSend(*(id *)(a1 + 72), "transitionEffectDescriptor"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12 == v13))
    {
      objc_msgSend(*(id *)(a1 + 72), "endTransition");
    }
    else if (!v11)
    {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (a3 == 1)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "initialValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setBackgroundEffects:", v6);

    }
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v7, "initialValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setContentEffects:", v8);

    }
LABEL_16:
    objc_msgSend(WeakRetained, "_updateSubviews");
  }
LABEL_17:
  --*(_QWORD *)(*(_QWORD *)(a1 + 80) + 48);
  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 80) + 56));
  -[UIView _backing_unwrapIfPossible]((uint64_t)v14);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  return 1;
}

- (id)_initialValueForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(CFSTR("backgroundEffects"), "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 40;
  }
  else
  {
    if (!objc_msgSend(CFSTR("contentEffects"), "isEqualToString:", v4))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = 32;
  }
  v6 = *(id *)((char *)&self->super.isa + v5);
LABEL_7:

  return v6;
}

- (void)_configureEffects
{
  UIVisualEffectBackingHost *v3;
  void *v4;
  void *v5;
  _UIVisualEffectHost *v6;
  void *v7;
  void *v8;
  _UIVisualEffectHost *v9;
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  id v15;
  UIVisualEffectBackingHost *v16;

  if ((*(_BYTE *)&self->_flags & 3) != 0)
  {
    v3 = self;
    ++v3->_reentrantCount;
    v16 = v3;
    -[_UIVisualEffectEnvironment traitCollection](v3->_environment, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIVisualEffectBackingHost _mergedTraitCollection](v16, "_mergedTraitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisualEffectEnvironment setTraitCollection:](v16->_environment, "setTraitCollection:", v5);

    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      -[UIVisualEffectBackingHost _ensureBackgroundHost](v16, "_ensureBackgroundHost");
      -[UIVisualEffectBackingHost _effectDescriptorForEffects:usage:](v16, "_effectDescriptorForEffects:usage:", v16->_backgroundEffects, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisualEffectHost setPrimaryCaptureGroup:](v16->_backgroundHost, "setPrimaryCaptureGroup:", v16->_captureGroup);
      if ((*(_BYTE *)&self->_flags & 8) == 0)
      {
        captureGroup = v16->_captureGroup;
        -[_UIVisualEffectHost contentView](v16->_backgroundHost, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCaptureGroup:", captureGroup);

      }
      v6 = v16->_backgroundHost;
      *(_BYTE *)&self->_flags &= ~1u;
      v12 = objc_msgSend(v7, "layerHitTestsAsOpaque");
      WeakRetained = objc_loadWeakRetained((id *)&v16->_view);
      objc_msgSend(WeakRetained, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHitTestsAsOpaque:", v12);

      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_6;
    }
    else
    {
      v6 = 0;
      v7 = 0;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
      {
LABEL_6:
        -[UIVisualEffectBackingHost _ensureContentHost](v16, "_ensureContentHost");
        -[UIVisualEffectBackingHost _effectDescriptorForEffects:usage:](v16, "_effectDescriptorForEffects:usage:", v16->_contentEffects, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v16->_contentHost;
        *(_BYTE *)&self->_flags &= ~2u;
LABEL_12:
        -[_UIVisualEffectHost setCurrentEffectDescriptor:](v6, "setCurrentEffectDescriptor:", v7);
        -[_UIVisualEffectHost setCurrentEffectDescriptor:](v9, "setCurrentEffectDescriptor:", v8);
        -[UIVisualEffectBackingHost _updateSubviews](v16, "_updateSubviews");
        --v16->_reentrantCount;
        v15 = objc_loadWeakRetained((id *)&v16->_view);
        -[UIView _backing_unwrapIfPossible]((uint64_t)v15);

        return;
      }
    }
    v9 = 0;
    v8 = 0;
    goto LABEL_12;
  }
}

- (id)_effectDescriptorForEffects:(id)a3 usage:(int64_t)a4
{
  id v6;
  _UIVisualEffectDescriptor *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(_UIVisualEffectDescriptor);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "_updateEffectDescriptor:forEnvironment:usage:", v7, self->_environment, a4, (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)_ensureBackgroundHost
{
  void *v3;
  int isKindOfClass;
  void *v5;
  char v6;
  _UIVisualEffectHost *v7;
  _UIVisualEffectHost *backgroundHost;
  _UIVisualEffectBackdropView *v9;

  if (-[NSArray count](self->_backgroundEffects, "count") == 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_backgroundEffects, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  if (!self->_backgroundHost || ((isKindOfClass ^ ((*(_BYTE *)&self->_flags & 8) == 0)) & 1) == 0)
  {
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_alloc_init(_UIVisualEffectSubview);
      +[UIColor blackColor](UIColor, "blackColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v5);

      v6 = *(_BYTE *)&self->_flags | 8;
    }
    else
    {
      v9 = objc_alloc_init(_UIVisualEffectBackdropView);
      v6 = *(_BYTE *)&self->_flags & 0xF7;
    }
    *(_BYTE *)&self->_flags = v6;
    v7 = -[_UIVisualEffectHost initWithContentView:]([_UIVisualEffectHost alloc], "initWithContentView:", v9);
    backgroundHost = self->_backgroundHost;
    self->_backgroundHost = v7;

    -[_UIVisualEffectHost setPrimaryCaptureGroup:](self->_backgroundHost, "setPrimaryCaptureGroup:", self->_captureGroup);
  }
}

- (void)_ensureContentHost
{
  _UIVisualEffectHost *v3;
  _UIVisualEffectBackingFakeView *v4;
  id WeakRetained;
  _UIVisualEffectBackingFakeView *v6;
  _UIVisualEffectHost *v7;
  _UIVisualEffectHost *contentHost;

  if (!self->_contentHost)
  {
    v3 = [_UIVisualEffectHost alloc];
    v4 = [_UIVisualEffectBackingFakeView alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v6 = -[_UIVisualEffectBackingFakeView initWithClientView:](v4, "initWithClientView:", WeakRetained);
    v7 = -[_UIVisualEffectHost initWithContentView:](v3, "initWithContentView:", v6);
    contentHost = self->_contentHost;
    self->_contentHost = v7;

    -[_UIVisualEffectHost setContentViewRequired:](self->_contentHost, "setContentViewRequired:", 1);
  }
}

- (void)_updateSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[UIVisualEffectBackingHost visualEffectSubviews](self, "visualEffectSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIVisualEffectHost views](self->_backgroundHost, "views");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectHost views](self->_contentHost, "views");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (v15)
      v8 = v15;
    else
      v8 = v6;
    v9 = v8;
  }
  else
  {
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__UIVisualEffectBackingHost__updateSubviews__block_invoke;
  v16[3] = &unk_1E16B47A8;
  v16[4] = self;
  v17 = v9;
  v18 = v5;
  v11 = v5;
  v12 = v10;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
  v13 = (void *)objc_msgSend(v12, "copy");
  -[UIVisualEffectBackingHost setVisualEffectSubviews:](self, "setVisualEffectSubviews:", v13);

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  -[UIVisualEffectBackingHost _updateContentViewVibrancyTraitOverride:](self, "_updateContentViewVibrancyTraitOverride:", WeakRetained);

}

void __44__UIVisualEffectBackingHost__updateSubviews__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) |= 4u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD **)(*((_QWORD *)&v22 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
          v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
          objc_msgSend(v9, "_layer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (WeakRetained)
            -[UIView _backing_addPrivateSubview:positioned:relativeTo:]((uint64_t)WeakRetained, v7, -3, (uint64_t)v10);

        }
        objc_msgSend(*(id *)(a1 + 48), "removeObject:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *(id *)(a1 + 48);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
        v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
        -[UIView _backing_removePrivateSubview:]((uint64_t)v17, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) &= ~4u;
}

- (void)_updateContentViewVibrancyTraitOverride:(id)a3
{
  _UIVisualEffectHost *backgroundHost;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  backgroundHost = self->_backgroundHost;
  v7 = a3;
  -[_UIVisualEffectHost currentEffectDescriptor](backgroundHost, "currentEffectDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsVibrancyInContent");

  if (v5)
    v6 = 1;
  else
    v6 = -1;
  objc_msgSend(v7, "_setOverrideVibrancyTrait:", v6);

}

- (void)willGainDescendent:(id)a3
{
  -[_UIVisualEffectHost willGainDescendent:](self->_contentHost, "willGainDescendent:", a3);
}

- (void)willLoseDescendent:(id)a3
{
  -[_UIVisualEffectHost willLoseDescendent:](self->_contentHost, "willLoseDescendent:", a3);
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  UIVisualEffectBackingHost *v5;
  _UIVisualEffectHost *contentHost;
  id *p_view;
  id WeakRetained;
  _QWORD *v9;
  _QWORD *v10;
  UIVisualEffectBackingHost *v11;
  UIVisualEffectBackingHost *v12;
  UIVisualEffectBackingHost *v13;

  v5 = self;
  contentHost = v5->_contentHost;
  v13 = v5;
  p_view = (id *)&v5->_view;
  WeakRetained = objc_loadWeakRetained((id *)&v5->_view);
  -[_UIVisualEffectHost _view:willMoveToWindow:](contentHost, "_view:willMoveToWindow:", WeakRetained, a4);

  v9 = objc_loadWeakRetained(p_view);
  v10 = (_QWORD *)v9[22];
  if (v10)
    v10 = (_QWORD *)v10[5];
  v11 = v10;

  v12 = v13;
  if (v11 == v13)
  {
    -[UIVisualEffectBackingHost didMoveToWindow](v13, "didMoveToWindow");
    v12 = v13;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[UIVisualEffectBackingHost _unregisterNotifications](self, "_unregisterNotifications");
  v3.receiver = self;
  v3.super_class = (Class)UIVisualEffectBackingHost;
  -[UIVisualEffectBackingHost dealloc](&v3, sel_dealloc);
}

- (NSString)_captureGroupName
{
  return self->_captureGroupName;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (NSArray)contentEffects
{
  return self->_contentEffects;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (int64_t)reentrantCount
{
  return self->_reentrantCount;
}

- (void)setReentrantCount:(int64_t)a3
{
  self->_reentrantCount = a3;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (_UIVisualEffectEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup
{
  return self->_captureGroup;
}

- (void)setCaptureGroup:(id)a3
{
  objc_storeStrong((id *)&self->_captureGroup, a3);
}

- (_UIVisualEffectHost)backgroundHost
{
  return self->_backgroundHost;
}

- (void)setBackgroundHost:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundHost, a3);
}

- (_UIVisualEffectHost)contentHost
{
  return self->_contentHost;
}

- (void)setContentHost:(id)a3
{
  objc_storeStrong((id *)&self->_contentHost, a3);
}

- (NSArray)visualEffectSubviews
{
  return self->_visualEffectSubviews;
}

- (void)setVisualEffectSubviews:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectSubviews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectSubviews, 0);
  objc_storeStrong((id *)&self->_contentHost, 0);
  objc_storeStrong((id *)&self->_backgroundHost, 0);
  objc_storeStrong((id *)&self->_captureGroup, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_contentEffects, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_captureGroupName, 0);
}

@end

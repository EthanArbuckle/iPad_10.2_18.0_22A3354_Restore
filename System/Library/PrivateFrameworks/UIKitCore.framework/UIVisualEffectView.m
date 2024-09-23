@implementation UIVisualEffectView

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIVisualEffectView;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[UIVisualEffectView _configureEffects](self, "_configureEffects");
}

- (id)_maskView
{
  return self->_maskView;
}

- (BOOL)__isLandmarkView
{
  return 1;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIVisualEffectView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIVisualEffectView _configureEffects](self, "_configureEffects");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self, "_setCornerRadius:continuous:maskedCorners:", 1, 15, a3);
}

void __48__UIVisualEffectView__generateEffectAnimations___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "initialValue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 504);
    *(_QWORD *)(v5 + 504) = v4;

  }
}

- (UIView)contentView
{
  void *v3;
  UIVisualEffectView *v4;
  void *v5;

  -[UIVisualEffectView _ensureContentHostWithView:](self, "_ensureContentHostWithView:", 0);
  -[_UIVisualEffectHost setContentViewRequired:](self->_contentHost, "setContentViewRequired:", 1);
  -[_UIVisualEffectHost contentView](self->_contentHost, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    -[UIVisualEffectView _updateSubviews](self, "_updateSubviews");
  -[_UIVisualEffectHost contentView](self->_contentHost, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v5;
}

- (void)_ensureContentHostWithView:(id)a3
{
  id v4;
  _UIVisualEffectHost *v5;
  _UIVisualEffectHost *contentHost;
  id v7;

  v4 = a3;
  if (!self->_contentHost)
  {
    if (!v4)
      v4 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_contentViewClass"));
    v7 = v4;
    v5 = -[_UIVisualEffectHost initWithContentView:]([_UIVisualEffectHost alloc], "initWithContentView:", v4);
    contentHost = self->_contentHost;
    self->_contentHost = v5;

    -[_UIVisualEffectHost monitorSubviewsOf:](self->_contentHost, "monitorSubviewsOf:", v7);
    v4 = v7;
  }

}

- (void)setContentEffects:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *contentEffects;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  if (!v5)
    v5 = (id)MEMORY[0x1E0C9AA60];
  v11 = v5;
  if ((_UIVisualEffectAssertEffectConstraints(v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 985, CFSTR("contentEffects can contain at most 1 UIBlurEffect and 1 UIVibrancyEffect (%@)"), v11);

  }
  if (!-[NSArray isEqualToArray:](self->_contentEffects, "isEqualToArray:", v11))
  {
    if (-[UIView _hasDeferredAnimationForKey:]((uint64_t)self, CFSTR("effect")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 987, CFSTR("You cannot animate the effects property alongside the contentEffects property. Switch to using contentEffects exclusively."));

    }
    -[UIView _deferredAnimationForKey:](self, "_deferredAnimationForKey:", CFSTR("contentEffects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v11, 1);
    contentEffects = self->_contentEffects;
    self->_contentEffects = v7;

    if (v6)
    {
      objc_msgSend(v6, "addAnimationFrameForValue:", self->_contentEffects);
    }
    else
    {
      *(_WORD *)&self->_effectViewFlags |= 2u;
      -[UIVisualEffectView _configureEffects](self, "_configureEffects");
    }

  }
}

- (void)setBackgroundEffects:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *backgroundEffects;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 960, CFSTR("Setting background effects on a dependent visual effect view is not supported"));

  }
  if (v5)
    v7 = v5;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v7;
  if ((_UIVisualEffectAssertEffectConstraints(v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 964, CFSTR("backgroundEffects can contain at most 1 UIBlurEffect and 1 UIVibrancyEffect (%@)"), v14);

  }
  if (!-[NSArray isEqualToArray:](self->_backgroundEffects, "isEqualToArray:", v14))
  {
    if (-[UIView _hasDeferredAnimationForKey:]((uint64_t)self, CFSTR("effect")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 966, CFSTR("You cannot animate the effects property alongside the backgroundEffects property. Switch to using backgroundEffects exclusively."));

    }
    -[UIView _deferredAnimationForKey:](self, "_deferredAnimationForKey:", CFSTR("backgroundEffects"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v14, 1);
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = v9;

    if (v8)
    {
      objc_msgSend(v8, "addAnimationFrameForValue:", self->_backgroundEffects);
    }
    else
    {
      *(_WORD *)&self->_effectViewFlags |= 1u;
      -[UIVisualEffectView _configureEffects](self, "_configureEffects");
    }
    -[UIVisualEffectView _updateCaptureDependents](self, "_updateCaptureDependents");

  }
}

- (void)_updateEffectsFromLegacyEffect
{
  NSArray *v3;
  NSArray *backgroundEffects;
  NSArray *v5;
  __int16 v6;
  NSArray *contentEffects;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;

  v10 = 0;
  v11 = 0;
  _UIVisualEffectViewUpgradeLegacyEffect(self->_effect, (void **)&v11, (id *)&v10);
  v3 = v11;
  *(_WORD *)&self->_effectViewFlags = *(_WORD *)&self->_effectViewFlags & 0xFFFE | !-[NSArray isEqualToArray:](self->_backgroundEffects, "isEqualToArray:", v11);
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = v3;
  v9 = v3;

  v5 = v10;
  if (-[NSArray isEqualToArray:](self->_contentEffects, "isEqualToArray:", v10))
    v6 = 0;
  else
    v6 = 2;
  *(_WORD *)&self->_effectViewFlags = *(_WORD *)&self->_effectViewFlags & 0xFFFD | v6;
  contentEffects = self->_contentEffects;
  self->_contentEffects = v5;
  v8 = v5;

  -[UIVisualEffectView _configureEffects](self, "_configureEffects");
}

- (void)_configureEffects
{
  void *v3;
  void *v4;
  unsigned int effectViewFlags;
  void *v6;
  void *v7;
  _UIVisualEffectHost *v8;
  id WeakRetained;
  void *v10;
  NSArray *backgroundEffects;
  void *v12;
  void *v13;
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  uint64_t v15;
  void *v16;
  _UIVisualEffectHost *v17;

  if ((*(_WORD *)&self->_effectViewFlags & 3) != 0)
  {
    -[_UIVisualEffectEnvironment traitCollection](self->_environment, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[UIView traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisualEffectEnvironment setTraitCollection:](self->_environment, "setTraitCollection:", v4);

    }
    +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
    effectViewFlags = self->_effectViewFlags;
    if ((effectViewFlags & 1) != 0)
    {
      -[UIVisualEffectView _ensureBackgroundHost](self, "_ensureBackgroundHost");
      WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
      v10 = WeakRetained;
      backgroundEffects = self->_backgroundEffects;
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "_effectDescriptorForEffects:usage:", backgroundEffects, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_captureGroup");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIVisualEffectHost setPrimaryCaptureGroup:](self->_backgroundHost, "setPrimaryCaptureGroup:", v12);
        -[_UIVisualEffectHost contentView](self->_backgroundHost, "contentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCaptureGroup:", v12);

      }
      else
      {
        -[UIVisualEffectView _effectDescriptorForEffects:usage:](self, "_effectDescriptorForEffects:usage:", backgroundEffects, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIVisualEffectHost setPrimaryCaptureGroup:](self->_backgroundHost, "setPrimaryCaptureGroup:", self->_captureGroup);
        captureGroup = self->_captureGroup;
        -[_UIVisualEffectHost contentView](self->_backgroundHost, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCaptureGroup:", captureGroup);
      }

      v17 = self->_backgroundHost;
      *(_WORD *)&self->_effectViewFlags &= ~1u;
      v15 = objc_msgSend(v6, "layerHitTestsAsOpaque");
      -[UIView layer](self, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHitTestsAsOpaque:", v15);

      effectViewFlags = self->_effectViewFlags;
      if ((effectViewFlags & 2) != 0)
        goto LABEL_6;
    }
    else
    {
      v6 = 0;
      v17 = 0;
      if ((effectViewFlags & 2) != 0)
      {
LABEL_6:
        -[_UIVisualEffectEnvironment setUseSimpleVibrancy:](self->_environment, "setUseSimpleVibrancy:", (effectViewFlags >> 5) & 1);
        -[UIVisualEffectView _effectDescriptorForEffects:usage:](self, "_effectDescriptorForEffects:usage:", self->_contentEffects, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIVisualEffectView _ensureContentHostWithView:](self, "_ensureContentHostWithView:", 0);
        v8 = self->_contentHost;
        *(_WORD *)&self->_effectViewFlags &= ~2u;
LABEL_13:
        -[_UIVisualEffectHost setCurrentEffectDescriptor:](v17, "setCurrentEffectDescriptor:", v6);
        -[_UIVisualEffectHost setCurrentEffectDescriptor:](v8, "setCurrentEffectDescriptor:", v7);
        -[UIVisualEffectView _updateSubviews](self, "_updateSubviews");

        return;
      }
    }
    v8 = 0;
    v7 = 0;
    goto LABEL_13;
  }
}

- (void)_updateSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  UIVisualEffectView *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[UIView subviews](self, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIVisualEffectHost views](self->_backgroundHost, "views");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectHost views](self->_contentHost, "views");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v6)
      v10 = v6;
    else
      v10 = (void *)v7;
    v11 = v10;
  }
  else
  {
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __37__UIVisualEffectView__updateSubviews__block_invoke;
  v20[3] = &unk_1E16B47A8;
  v20[4] = self;
  v12 = v11;
  v21 = v12;
  v19 = v5;
  v22 = v19;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);
  -[_UIVisualEffectHost contentView](self->_contentHost, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "superview");
    v15 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();

    if (v15 == self)
    {
      objc_msgSend(v14, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _traitCollectionForChildEnvironment:](self, "_traitCollectionForChildEnvironment:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "_vibrancy");
      if (v18 != objc_msgSend(v17, "_vibrancy"))
        -[UIView _invalidateTraitCollectionAsRoot]((uint64_t)v14);

    }
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

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4;
  void *v5;
  _UIVisualEffectHost *contentHost;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  contentHost = self->_contentHost;
  if (contentHost)
  {
    -[_UIVisualEffectHost contentView](contentHost, "contentView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      -[_UIVisualEffectHost currentEffectDescriptor](self->_contentHost, "currentEffectDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "textShouldRenderWithTintColor");

      if ((v9 & 1) != 0)
      {
        v10 = 2;
LABEL_7:
        objc_msgSend(v5, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", v10, 0x1E1A996A8);
        v13 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v13;
        goto LABEL_8;
      }
      -[_UIVisualEffectHost currentEffectDescriptor](self->_backgroundHost, "currentEffectDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "allowsVibrancyInContent");

      if (v12)
      {
        v10 = 1;
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  v14 = v5;

  return v14;
}

- (UIVisualEffectView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[UIVisualEffectView initWithEffect:](self, "initWithEffect:", 0);
  v8 = v7;
  if (v7)
    -[UIView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (UIVisualEffectView)initWithEffect:(UIVisualEffect *)effect
{
  UIVisualEffect *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;
  uint64_t v7;
  UIVisualEffect *v8;
  objc_super v10;

  v4 = effect;
  v10.receiver = self;
  v10.super_class = (Class)UIVisualEffectView;
  v5 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[UIVisualEffectView _commonInit](v5, "_commonInit");
    v7 = -[UIVisualEffect copy](v4, "copy");
    v8 = v6->_effect;
    v6->_effect = (UIVisualEffect *)v7;

    -[UIVisualEffectView _updateEffectsFromLegacyEffect](v6, "_updateEffectsFromLegacyEffect");
  }

  return v6;
}

- (void)_registerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateEffectForAccessibilityChanges_, CFSTR("UIAccessibilityReduceTransparencyStatusDidChangeNotification"), 0);

}

- (void)_updateCaptureDependents
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_captureDependents;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        _UIVisualEffectViewConfigureDependent(self, *(id **)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)_commonInit
{
  NSArray *backgroundEffects;
  NSArray *v4;
  NSArray *contentEffects;
  _UIVisualEffectEnvironment *v6;
  _UIVisualEffectEnvironment *environment;
  _UIVisualEffectViewBackdropCaptureGroup *v8;
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  NSMutableArray *v10;
  NSMutableArray *captureDependents;
  void *v12;
  uint64_t v13;
  _UIVisualEffectEnvironment *v14;
  void *v15;
  _BOOL8 v16;
  _UIAssertionController *v17;
  _UIAssertionController *assertionController;

  backgroundEffects = self->_backgroundEffects;
  v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  self->_backgroundEffects = (NSArray *)MEMORY[0x1E0C9AA60];

  contentEffects = self->_contentEffects;
  self->_contentEffects = v4;

  v6 = -[_UIVisualEffectEnvironment initWithHost:]([_UIVisualEffectEnvironment alloc], "initWithHost:", self);
  environment = self->_environment;
  self->_environment = v6;

  self->_useLiveMasking = dyld_program_sdk_at_least();
  v8 = objc_alloc_init(_UIVisualEffectViewBackdropCaptureGroup);
  captureGroup = self->_captureGroup;
  self->_captureGroup = v8;

  v10 = (NSMutableArray *)objc_opt_new();
  captureDependents = self->_captureDependents;
  self->_captureDependents = v10;

  *(_WORD *)&self->_effectViewFlags |= 8u;
  -[UIView _setShouldAdaptToMaterials:](self, "_setShouldAdaptToMaterials:", 0);
  -[UIView setAllowsGroupBlending:](self, "setAllowsGroupBlending:", 0);
  -[UIView setAllowsGroupOpacity:](self, "setAllowsGroupOpacity:", 0);
  -[_UIVisualEffectEnvironment setAllowsDithering:](self->_environment, "setAllowsDithering:", (*(_WORD *)&self->_effectViewFlags >> 2) & 1);
  -[_UIVisualEffectEnvironment setAllowsBlurring:](self->_environment, "setAllowsBlurring:", (*(_WORD *)&self->_effectViewFlags >> 3) & 1);
  -[UIView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");
  v14 = self->_environment;
  if (v13 == 3)
  {
    -[_UIVisualEffectEnvironment setReducedTransperancy:](v14, "setReducedTransperancy:", 0);
  }
  else
  {
    -[_UIVisualEffectEnvironment traitCollection](v14, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom") != 6 && _AXSEnhanceBackgroundContrastEnabled() != 0;
    -[_UIVisualEffectEnvironment setReducedTransperancy:](self->_environment, "setReducedTransperancy:", v16);

  }
  v17 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", self);
  assertionController = self->_assertionController;
  self->_assertionController = v17;

  -[UIVisualEffectView _setIsContentViewStatic:](self, "_setIsContentViewStatic:", 1);
  -[UIVisualEffectView _registerNotifications](self, "_registerNotifications");
}

- (void)_updateSubView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _UIVisualEffectViewCornerMask *cornerMask;
  void *v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  objc_msgSend(v11, "setFrame:", x, y, width, height);
  objc_msgSend(v11, "setAutoresizingMask:", 18);
  objc_msgSend(v11, "_setShouldAdaptToMaterials:", 0);
  cornerMask = self->__cornerMask;
  objc_msgSend(v11, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (cornerMask)
    -[_UIVisualEffectViewCornerMask _applyToLayer:](cornerMask, "_applyToLayer:", v10);
  else
    +[_UIVisualEffectViewCornerMask _applyZeroMaskToLayer:](_UIVisualEffectViewCornerMask, "_applyZeroMaskToLayer:", v10);

  -[UIView addSubview:](self, "addSubview:", v11);
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  UIVisualEffectView *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if ((*(_WORD *)&self->_effectViewFlags & 0x40) != 0
    && (objc_msgSend(v9, "conformsToProtocol:", &unk_1EDE4BB08) & 1) != 0)
  {
LABEL_9:
    v14.receiver = self;
    v14.super_class = (Class)UIVisualEffectView;
    -[UIView _addSubview:positioned:relativeTo:](&v14, sel__addSubview_positioned_relativeTo_, v9, a4, v10);
    goto LABEL_10;
  }
  if (!dyld_program_sdk_at_least())
  {
    v12 = _addSubview_positioned_relativeTo____s_category;
    if (!_addSubview_positioned_relativeTo____s_category)
    {
      v12 = __UILogCategoryGetNode("VisualEffect", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_addSubview_positioned_relativeTo____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "%@ has been added as a subview to %@. Do not add subviews directly to the visual effect view itself, instead add them to the -contentView.", buf, 0x16u);
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 1559, CFSTR("%@ has been added as a subview to %@. Do not add subviews directly to the visual effect view itself, instead add them to the -contentView."), v9, self);

LABEL_10:
}

- (void)_setGroupName:(id)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)&self->_captureSource);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 1126, CFSTR("Dependent Visual Effect Views cannot have an independently set group name. Set your group name on on '%@'"), v7);

  }
  -[_UIVisualEffectViewBackdropCaptureGroup setGroupName:](self->_captureGroup, "setGroupName:", v8);

}

void __37__UIVisualEffectView__updateSubviews__block_invoke(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  *((_WORD *)a1[4] + 240) |= 0x40u;
  objc_msgSend(a1[4], "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = a1[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(a1[4], "_updateSubView:frame:", v15, v3, v5, v7, v9);
        objc_msgSend(a1[6], "removeObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = a1[6];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "removeFromSuperview", (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

  *((_WORD *)a1[4] + 240) &= ~0x40u;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__UIVisualEffectView_traitCollectionDidChange___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  v4 = a3;
  -[UIVisualEffectView _updateEnvironmentAndFlagUpdatesIfNecessary:](self, "_updateEnvironmentAndFlagUpdatesIfNecessary:", v6);
  -[UIVisualEffectView _configureEffects](self, "_configureEffects");
  v5.receiver = self;
  v5.super_class = (Class)UIVisualEffectView;
  -[UIView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);

}

- (void)_updateEnvironmentAndFlagUpdatesIfNecessary:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  int effectViewFlags;
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
  effectViewFlags = (int)self->_effectViewFlags;
  if ((~effectViewFlags & 3) != 0)
  {
    -[_UIVisualEffectEnvironment traitCollection](self->_environment, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedTraitsFromTraitCollection:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LOWORD(effectViewFlags) = self->_effectViewFlags;
    if ((effectViewFlags & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    v7 = 0;
    if ((effectViewFlags & 1) != 0)
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
          *(_WORD *)&self->_effectViewFlags |= 1u;
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

  LOWORD(effectViewFlags) = self->_effectViewFlags;
LABEL_16:
  if ((effectViewFlags & 2) == 0)
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
            *(_WORD *)&self->_effectViewFlags |= 2u;
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

void __47__UIVisualEffectView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setTraitCollection:", v2);

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "userInterfaceIdiom");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  if (v3 == 3)
  {
    objc_msgSend(v4, "setReducedTransperancy:", 0);
  }
  else
  {
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom") != 6 && _AXSEnhanceBackgroundContrastEnabled() != 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setReducedTransperancy:", v6);

  }
}

- (void)_setCaptureView:(id)a3
{
  id v5;
  id WeakRetained;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (!WeakRetained)
  {
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_loadWeakRetained((id *)&self->_captureSource);
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 1138, CFSTR("Dependent Visual Effect Views cannot have an independently set capture view. Set your capture view on '%@'"), v13);

  if (v5)
LABEL_3:
    -[UIVisualEffectView _ensureBackgroundHost](self, "_ensureBackgroundHost");
LABEL_4:
  -[_UIVisualEffectHost setCaptureView:](self->_backgroundHost, "setCaptureView:", v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_captureDependents;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "_setCaptureView:", v5);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_ensureBackgroundHost
{
  _UIVisualEffectHost *v3;
  _UIVisualEffectHost *backgroundHost;
  _UIVisualEffectBackdropView *v5;

  if (!self->_backgroundHost)
  {
    v5 = objc_alloc_init(_UIVisualEffectBackdropView);
    v3 = -[_UIVisualEffectHost initWithContentView:]([_UIVisualEffectHost alloc], "initWithContentView:", v5);
    backgroundHost = self->_backgroundHost;
    self->_backgroundHost = v3;

    -[_UIVisualEffectHost setPrimaryCaptureGroup:](self->_backgroundHost, "setPrimaryCaptureGroup:", self->_captureGroup);
  }
}

- (NSString)_groupName
{
  void *v2;
  void *v3;

  -[UIVisualEffectView _captureGroup](self, "_captureGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (_UIVisualEffectViewBackdropCaptureGroup)_captureGroup
{
  id WeakRetained;
  void *v4;
  _UIVisualEffectViewBackdropCaptureGroup *v5;
  _UIVisualEffectViewBackdropCaptureGroup *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_captureGroup");
    v5 = (_UIVisualEffectViewBackdropCaptureGroup *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_captureGroup;
  }
  v6 = v5;

  return v6;
}

- (void)_setMaskView:(id)a3
{
  UIView *p_super;
  UIView *maskView;
  BOOL v6;
  void *v7;
  UIView *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *v11;
  void *v12;
  UIImage *maskImage;
  UIView *v14;
  UIView *v15;
  void *v16;
  id v17;

  p_super = (UIView *)a3;
  maskView = self->_maskView;
  if (maskView)
    v6 = maskView == p_super;
  else
    v6 = 1;
  if (!v6)
  {
    -[UIView _window](maskView, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIView _recursivelyUpdateCachedWindowForMoveToWindow:](&self->_maskView->super.super.isa, 0);
      v8 = self->_maskView;
      -[UIView _window](v8, "_window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _didMoveFromWindow:toWindow:](v8, "_didMoveFromWindow:toWindow:", v9, 0);

    }
  }
  if (p_super && !self->_useLiveMasking)
  {
    v10 = [UIImageView alloc];
    -[UIView frame](p_super, "frame");
    v11 = -[UIImageView initWithFrame:](v10, "initWithFrame:");
    -[UIVisualEffectView _maskImageForMaskView:](self, "_maskImageForMaskView:", p_super);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v11, "setImage:", v12);

    p_super = &v11->super;
  }
  maskImage = self->_maskImage;
  self->_maskImage = 0;

  v14 = self->_maskView;
  self->_maskView = p_super;
  v15 = p_super;

  *((_QWORD *)&self->super._viewFlags + 1) = *((_QWORD *)&self->super._viewFlags + 1) & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)(v15 != 0) << 21);
  -[UIView layer](self->_maskView, "layer");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMask:", v17);

}

- (void)_setRenderMode:(int64_t)a3
{
  id v5;

  -[UIVisualEffectView _ensureBackgroundHost](self, "_ensureBackgroundHost");
  -[_UIVisualEffectHost contentView](self->_backgroundHost, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRenderMode:", a3);

}

- (void)dealloc
{
  objc_super v3;

  -[UIVisualEffectView _unregisterNotifications](self, "_unregisterNotifications");
  v3.receiver = self;
  v3.super_class = (Class)UIVisualEffectView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)_unregisterNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityReduceTransparencyStatusDidChangeNotification"), 0);

}

- (UIVisualEffectView)_captureSource
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_captureSource);
}

- (void)_addCaptureDependent:(id)a3
{
  id WeakRetained;
  UIVisualEffectView *v6;
  UIVisualEffectView *v7;
  void *v8;
  void *v9;
  id *v10;

  v10 = (id *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 1203, CFSTR("UIVisualEffectView does not support multi-level capture dependents"));

  }
  if (objc_msgSend(v10[55], "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 1204, CFSTR("Multi-level capture dependencies are not supported (visual effect view %@ has capture dependents)"), v10);

  }
  v6 = (UIVisualEffectView *)objc_loadWeakRetained(v10 + 62);
  v7 = v6;
  if (v6 != self)
  {
    if (v6)
      _UIVisualEffectViewRemoveDependent(v6, v10);
    -[NSMutableArray addObject:](self->_captureDependents, "addObject:", v10);
    _UIVisualEffectViewConfigureDependent(self, v10);
  }

}

- (UIVisualEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(UIVisualEffect *)effect
{
  UIVisualEffect *v5;
  UIVisualEffect *v6;
  UIVisualEffect *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_effect != effect)
  {
    v5 = effect;
    if ((-[UIView _hasDeferredAnimationForKey:]((uint64_t)self, CFSTR("backgroundEffects")) & 1) != 0
      || -[UIView _hasDeferredAnimationForKey:]((uint64_t)self, CFSTR("contentEffects")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 927, CFSTR("You cannot animate the effects property alongside the backgroundEffects or contentEffects properties. Switch to using backgroundEffects and contentEffects exclusively."));

    }
    -[UIView _deferredAnimationForKey:](self, "_deferredAnimationForKey:", CFSTR("effect"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (UIVisualEffect *)-[UIVisualEffect copy](v5, "copy");

    v7 = self->_effect;
    self->_effect = v6;

    if (self->_effect)
    {
      objc_msgSend(v11, "addAnimationFrameForValue:");
    }
    else
    {
      +[UIVisualEffect emptyEffect](UIVisualEffect, "emptyEffect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAnimationFrameForValue:", v8);

    }
    v9 = v11;
    if (!v11)
    {
      -[UIVisualEffectView _updateEffectsFromLegacyEffect](self, "_updateEffectsFromLegacyEffect");
      v9 = 0;
    }

  }
}

- (void)_setAllowsGroupFiltering:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  if (!a3 && !self->_contentHost)
    -[UIVisualEffectView _ensureContentHostWithView:](self, "_ensureContentHostWithView:", 0);
  -[_UIVisualEffectHost contentView](self->_contentHost, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisableGroupFiltering:", !v3);

}

- (id)_initialValueForKey:(id)a3
{
  id v4;
  UIVisualEffect *effect;
  UIVisualEffect *v6;
  uint64_t v7;
  UIVisualEffect *v8;
  objc_super v10;

  v4 = a3;
  if (!objc_msgSend(CFSTR("effect"), "isEqualToString:", v4))
  {
    if (objc_msgSend(CFSTR("backgroundEffects"), "isEqualToString:", v4))
    {
      v7 = 520;
    }
    else
    {
      if (!objc_msgSend(CFSTR("contentEffects"), "isEqualToString:", v4))
      {
        v10.receiver = self;
        v10.super_class = (Class)UIVisualEffectView;
        -[UIView _initialValueForKey:](&v10, sel__initialValueForKey_, v4);
        v6 = (UIVisualEffect *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v7 = 528;
    }
    effect = *(UIVisualEffect **)((char *)&self->super.super.super.isa + v7);
    goto LABEL_9;
  }
  effect = self->_effect;
  if (effect)
  {
LABEL_9:
    v6 = effect;
    goto LABEL_10;
  }
  +[UIVisualEffect emptyEffect](UIVisualEffect, "emptyEffect");
  v6 = (UIVisualEffect *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v8 = v6;

  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIVisualEffectView;
  -[UIView layoutSubviews](&v12, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  if (self->_maskImage)
  {
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    -[UIView _safeMaskView](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  }
}

- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5
{
  _BOOL8 v6;
  _UIVisualEffectViewCornerMask *v9;
  BOOL v10;
  _UIVisualEffectViewCornerMask *v11;
  void *v12;
  _UIVisualEffectViewCornerMask *v13;
  _UIVisualEffectViewCornerMask *v14;
  _UIVisualEffectViewCornerMask *v15;

  v6 = a4;
  v9 = self->__cornerMask;
  v13 = v9;
  if (!v9
    || (v10 = -[_UIVisualEffectViewCornerMask _isCornerWithRadius:continuous:mask:](v9, "_isCornerWithRadius:continuous:mask:", v6, a5, a3), v11 = v13, !v10))
  {
    if (v6)
      +[_UIVisualEffectViewCornerMask continuousCornerMaskWithRadius:](_UIVisualEffectViewCornerMask, "continuousCornerMaskWithRadius:", a3);
    else
      +[_UIVisualEffectViewCornerMask cornerMaskWithRadius:](_UIVisualEffectViewCornerMask, "cornerMaskWithRadius:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "cornerMaskAppliedToCorners:", a5);
    v14 = (_UIVisualEffectViewCornerMask *)objc_claimAutoreleasedReturnValue();

    v11 = v14;
  }
  v15 = v11;
  -[UIVisualEffectView _setCornerMask:](self, "_setCornerMask:", v11);

}

- (void)_setCornerMask:(id)a3
{
  _UIVisualEffectViewCornerMask *v4;
  _UIVisualEffectViewCornerMask *cornerMask;
  _UIVisualEffectViewCornerMask *v6;
  _UIVisualEffectViewCornerMask *v7;
  _UIVisualEffectViewCornerMask *v8;

  v4 = (_UIVisualEffectViewCornerMask *)a3;
  cornerMask = self->__cornerMask;
  if (cornerMask != v4)
  {
    v8 = v4;
    if (!v4 || !cornerMask || !-[_UIVisualEffectViewCornerMask isEqual:](cornerMask, "isEqual:", v4))
    {
      v6 = (_UIVisualEffectViewCornerMask *)-[_UIVisualEffectViewCornerMask copy](v8, "copy");
      v7 = self->__cornerMask;
      self->__cornerMask = v6;

      -[UIVisualEffectView _applyCornerRadiusToSubviews](self, "_applyCornerRadiusToSubviews");
    }
    -[UIVisualEffectView _updateCornerTraits](self, "_updateCornerTraits");
    v4 = v8;
  }

}

- (void)_applyCornerRadiusToSubviews
{
  _UIVisualEffectViewCornerMask *cornerMask;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _UIVisualEffectViewCornerMask *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
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
  if (-[UIVisualEffectView _applyCornerMaskToSelf](self, "_applyCornerMaskToSelf"))
  {
    cornerMask = self->__cornerMask;
    -[UIView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (cornerMask)
      -[_UIVisualEffectViewCornerMask _applyToLayer:](cornerMask, "_applyToLayer:", v4);
    else
      +[_UIVisualEffectViewCornerMask _applyZeroMaskToLayer:](_UIVisualEffectViewCornerMask, "_applyZeroMaskToLayer:", v4);

  }
  if (self->__cornerMask)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIView subviews](self, "subviews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = self->__cornerMask;
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIVisualEffectViewCornerMask _applyToLayer:](v10, "_applyToLayer:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v7);
    }
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[UIView subviews](self, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "layer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIVisualEffectViewCornerMask _applyZeroMaskToLayer:](_UIVisualEffectViewCornerMask, "_applyZeroMaskToLayer:", v16);

        }
        v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v13);
    }
  }

}

- (BOOL)_applyCornerMaskToSelf
{
  return 0;
}

- (void)_setCornerRadius:(double)a3
{
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](self, "_setCornerRadius:continuous:maskedCorners:", 0, 15, a3);
}

- (_UIVisualEffectBackdropView)_captureView
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_captureView");
  else
    -[_UIVisualEffectHost captureView](self->_backgroundHost, "captureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIVisualEffectBackdropView *)v5;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (void)_generateBackgroundEffects:(id)a3 contentEffects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _UIVisualEffectHost *v17;
  _UIVisualEffectHost *v18;
  uint64_t v19;
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _UIVisualEffectHost *v32;
  id v33;
  _UIVisualEffectHost *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  UIVisualEffectView *v41;
  id v42;
  id v43;
  _UIVisualEffectHost *v44;
  id v45;
  _UIVisualEffectHost *v46;
  _QWORD v47[4];
  _UIVisualEffectHost *v48;
  _QWORD v49[4];
  _UIVisualEffectHost *v50;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[UIVisualEffectView _ensureBackgroundHost](self, "_ensureBackgroundHost");
    objc_msgSend(v6, "animationFrames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
    v13 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_effectDescriptorForEffects:usage:", v11, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_captureGroup");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisualEffectHost setPrimaryCaptureGroup:](self->_backgroundHost, "setPrimaryCaptureGroup:", v15);
      -[_UIVisualEffectHost contentView](self->_backgroundHost, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCaptureGroup:", v15);

    }
    else
    {
      -[UIVisualEffectView _effectDescriptorForEffects:usage:](self, "_effectDescriptorForEffects:usage:", v11, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisualEffectHost setPrimaryCaptureGroup:](self->_backgroundHost, "setPrimaryCaptureGroup:", self->_captureGroup);
      captureGroup = self->_captureGroup;
      -[_UIVisualEffectHost contentView](self->_backgroundHost, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCaptureGroup:", captureGroup);
    }

    v17 = self->_backgroundHost;
    v21 = objc_msgSend(v14, "layerHitTestsAsOpaque");
    -[UIView layer](self, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHitTestsAsOpaque:", v21);

    if (v8)
      goto LABEL_8;
LABEL_5:
    v18 = 0;
    v19 = 0;
    goto LABEL_9;
  }
  v14 = 0;
  v17 = 0;
  if (!v7)
    goto LABEL_5;
LABEL_8:
  objc_msgSend(v8, "animationFrames");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "value");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView _effectDescriptorForEffects:usage:](self, "_effectDescriptorForEffects:usage:", v25, 2);
  v19 = objc_claimAutoreleasedReturnValue();

  -[UIVisualEffectView _ensureContentHostWithView:](self, "_ensureContentHostWithView:", 0);
  v18 = self->_contentHost;
LABEL_9:
  -[_UIVisualEffectHost prepareToTransitionToEffectDescriptor:](v17, "prepareToTransitionToEffectDescriptor:", v14);
  v38 = (void *)v19;
  -[_UIVisualEffectHost prepareToTransitionToEffectDescriptor:](v18, "prepareToTransitionToEffectDescriptor:", v19);
  -[UIVisualEffectView _updateSubviews](self, "_updateSubviews");
  v26 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    objc_msgSend(v6, "animationFrames");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count") - 1;
    v49[0] = v26;
    v49[1] = 3221225472;
    v49[2] = __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke;
    v49[3] = &unk_1E16B5540;
    v50 = v17;
    objc_msgSend(v6, "animateFrameAtIndex:animations:", v28, v49);

  }
  if (v8)
  {
    objc_msgSend(v8, "animationFrames");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count") - 1;
    v47[0] = v26;
    v47[1] = 3221225472;
    v47[2] = __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke_2;
    v47[3] = &unk_1E16B5540;
    v48 = v18;
    objc_msgSend(v8, "animateFrameAtIndex:animations:", v30, v47);

  }
  -[_UIVisualEffectHost transitionEffectDescriptor](v17, "transitionEffectDescriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectHost transitionEffectDescriptor](v18, "transitionEffectDescriptor");
  v39[0] = v26;
  v39[1] = 3221225472;
  v39[2] = __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke_3;
  v39[3] = &unk_1E16B5590;
  v40 = v6;
  v41 = self;
  v42 = v8;
  v43 = v31;
  v44 = v17;
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v18;
  v32 = v18;
  v33 = v45;
  v34 = v17;
  v35 = v31;
  v36 = v8;
  v37 = v6;
  +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v39);

}

- (void)_generateEffectAnimations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  objc_msgSend(v4, "animationFrames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = MEMORY[0x1E0C809B0];
  if (v6 >= 1)
  {
    v8 = v6;
    for (i = 0; i != v8; ++i)
    {
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __48__UIVisualEffectView__generateEffectAnimations___block_invoke;
      v13[3] = &unk_1E16B5540;
      v13[4] = self;
      objc_msgSend(v4, "animateFrameAtIndex:animations:", i, v13);
    }
  }
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __48__UIVisualEffectView__generateEffectAnimations___block_invoke_2;
  v11[3] = &unk_1E16B5568;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v11);

}

- (void)_generateDeferredAnimations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UIVisualEffectView;
  v4 = a3;
  -[UIView _generateDeferredAnimations:](&v15, sel__generateDeferredAnimations_, v4);
  -[_UIVisualEffectEnvironment traitCollection](self->_environment, "traitCollection", v15.receiver, v15.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectEnvironment setTraitCollection:](self->_environment, "setTraitCollection:", v6);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundEffects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentEffects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effect"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 || v8 || v9)
  {
    if (!v9
      || (objc_msgSend(v9, "animationFrames"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          v11 > 2))
    {
      objc_msgSend(v7, "animationFrames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v12, "count") >= 3)
      {

      }
      else
      {
        objc_msgSend(v8, "animationFrames");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14 <= 2)
        {
          -[UIVisualEffectView _generateBackgroundEffects:contentEffects:](self, "_generateBackgroundEffects:contentEffects:", v7, v8);
          goto LABEL_14;
        }
      }
      NSLog(CFSTR("True keyframe animations are not yet supported"));
      goto LABEL_14;
    }
    -[UIVisualEffectView _generateEffectAnimations:](self, "_generateEffectAnimations:", v9);
  }
LABEL_14:

}

void __48__UIVisualEffectView__generateEffectAnimations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v6 = 0;
  v7 = 0;
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVisualEffectViewUpgradeLegacyEffect(v3, &v7, &v6);

  v4 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setContentEffects:", v6);
  v5 = v7;
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundEffects:");

}

uint64_t __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginTransition");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->__cornerMask, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_destroyWeak((id *)&self->_captureSource);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contentHost, 0);
  objc_storeStrong((id *)&self->_backgroundHost, 0);
  objc_storeStrong((id *)&self->_captureDependents, 0);
  objc_storeStrong((id *)&self->_captureGroup, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
}

- (void)_removeCaptureDependent:(id)a3
{
  id WeakRetained;
  UIVisualEffectView *v6;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 1218, CFSTR("UIVisualEffectView does not support multi-level capture dependents"));

  }
  v6 = (UIVisualEffectView *)objc_loadWeakRetained(v8 + 62);

  if (v6 == self)
    _UIVisualEffectViewRemoveDependent(self, v8);

}

- (void)_updateEffectForAccessibilityChanges:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__UIVisualEffectView__updateEffectForAccessibilityChanges___block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[UIVisualEffectView _updateEnvironmentAndFlagUpdatesIfNecessary:](self, "_updateEnvironmentAndFlagUpdatesIfNecessary:", v4);
  -[UIVisualEffectView _configureEffects](self, "_configureEffects");
}

void __59__UIVisualEffectView__updateEffectForAccessibilityChanges___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setReducedTransperancy:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom") != 6 && _AXSEnhanceBackgroundContrastEnabled() != 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setReducedTransperancy:", v3);

  }
}

- (UIVisualEffectView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;
  void *v7;
  uint64_t v8;
  UIVisualEffect *effect;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = coder;
  v22.receiver = self;
  v22.super_class = (Class)UIVisualEffectView;
  v5 = -[UIView initWithCoder:](&v22, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UIVisualEffectView _commonInit](v5, "_commonInit");
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVisualEffectViewEffect"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    effect = v6->_effect;
    v6->_effect = (UIVisualEffect *)v8;

    if (!v6->_effect)
    {
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVisualEffectViewContentEffects"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      v12 = (void *)v11;
      v13 = (void *)MEMORY[0x1E0C9AA60];
      if (v11)
        v14 = (void *)v11;
      else
        v14 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)&v6->_contentEffects, v14);

      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVisualEffectViewBackgroundEffects"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      v17 = (void *)v16;
      if (v16)
        v18 = (void *)v16;
      else
        v18 = v13;
      objc_storeStrong((id *)&v6->_backgroundEffects, v18);

    }
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVisualEffectViewGroupName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectViewBackdropCaptureGroup setGroupName:](v6->_captureGroup, "setGroupName:", v19);

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIVisualEffectViewContentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[UIVisualEffectView _ensureContentHostWithView:](v6, "_ensureContentHostWithView:", v20);
      -[_UIVisualEffectHost setContentViewRequired:](v6->_contentHost, "setContentViewRequired:", 1);
    }
    if (v6->_effect)
    {
      -[UIVisualEffectView _updateEffectsFromLegacyEffect](v6, "_updateEffectsFromLegacyEffect");
    }
    else
    {
      *(_WORD *)&v6->_effectViewFlags = *(_WORD *)&v6->_effectViewFlags & 0xFFFE | (-[NSArray count](v6->_backgroundEffects, "count") != 0);
      *(_WORD *)&v6->_effectViewFlags = *(_WORD *)&v6->_effectViewFlags & 0xFFFD | (2
                                                                                  * (-[NSArray count](v6->_contentEffects, "count") != 0));
      -[UIVisualEffectView _configureEffects](v6, "_configureEffects");
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *effect;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIVisualEffectView;
  -[UIView encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  effect = self->_effect;
  if (effect)
  {
    v6 = CFSTR("UIVisualEffectViewEffect");
  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_contentEffects, CFSTR("UIVisualEffectViewContentEffects"));
    effect = self->_backgroundEffects;
    v6 = CFSTR("UIVisualEffectViewBackgroundEffects");
  }
  objc_msgSend(v4, "encodeObject:forKey:", effect, v6);
  -[_UIVisualEffectViewBackdropCaptureGroup groupName](self->_captureGroup, "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UIVisualEffectViewGroupName"));

  -[_UIVisualEffectHost contentView](self->_contentHost, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UIVisualEffectViewContentView"));

}

- (void)respondToSettingsUpdate
{
  *(_WORD *)&self->_effectViewFlags |= 1u;
  -[UIVisualEffectView _configureEffects](self, "_configureEffects");
}

uint64_t __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginTransition");
}

void __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  if (!a3)
  {
    if (*(_QWORD *)(a1 + 32)
      && (v8 = *(void **)(a1 + 56),
          objc_msgSend(*(id *)(a1 + 64), "transitionEffectDescriptor"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8 == v9))
    {
      objc_msgSend(*(id *)(a1 + 64), "endTransition");
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    if (*(_QWORD *)(a1 + 48)
      && (v11 = *(void **)(a1 + 72),
          objc_msgSend(*(id *)(a1 + 80), "transitionEffectDescriptor"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11 == v12))
    {
      objc_msgSend(*(id *)(a1 + 80), "endTransition");
    }
    else if (!v10)
    {
      return;
    }
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "_updateSubviews");
    return;
  }
  if (a3 == 1)
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v4, "initialValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setBackgroundEffects:", v5);

    }
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      objc_msgSend(v6, "initialValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setContentEffects:", v7);

    }
    goto LABEL_16;
  }
}

- (NSArray)_captureDependents
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_captureDependents, "copy");
}

- (void)_setCaptureDependents:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSMutableArray *v16;
  NSMutableArray *captureDependents;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  UIVisualEffectView *v24;
  UIVisualEffectView *v25;
  void *v26;
  void *v27;
  SEL v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVisualEffectView.m"), 1177, CFSTR("UIVisualEffectView does not support multi-level capture dependents"));

  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = v5;
  v8 = v7;

  if ((-[NSMutableArray isEqualToArray:](self->_captureDependents, "isEqualToArray:", v8) & 1) == 0)
  {
    v28 = a2;
    -[_UIVisualEffectViewBackdropCaptureGroup groupName](self->_captureGroup, "groupName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIVisualEffectViewCaptureGroupName(%p)"), self->_captureGroup);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisualEffectViewBackdropCaptureGroup setGroupName:](self->_captureGroup, "setGroupName:", v10);

    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = self->_captureDependents;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          objc_storeWeak((id *)(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i) + 496), 0);
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);
    }

    v16 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
    captureDependents = self->_captureDependents;
    self->_captureDependents = v16;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = self->_captureDependents;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          v23 = *(id **)(*((_QWORD *)&v29 + 1) + 8 * v22);
          if (objc_msgSend(v23[55], "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v28, self, CFSTR("UIVisualEffectView.m"), 1188, CFSTR("Multi-level capture dependencies are not supported (visual effect view %@ has capture dependents)"), v23);

          }
          v24 = (UIVisualEffectView *)objc_loadWeakRetained(v23 + 62);
          v25 = v24;
          if (v24 != self)
          {
            if (v24)
              _UIVisualEffectViewRemoveDependent(v24, v23);
            _UIVisualEffectViewConfigureDependent(self, v23);
          }

          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

  }
}

- (int64_t)_renderMode
{
  _UIVisualEffectHost *backgroundHost;
  void *v3;
  void *v4;

  backgroundHost = self->_backgroundHost;
  if (!backgroundHost)
    return 0;
  -[_UIVisualEffectHost contentView](backgroundHost, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v4 = (void *)objc_msgSend(v3, "renderMode");

  return (int64_t)v4;
}

- (double)_cornerRadius
{
  _UIVisualEffectViewCornerMask *cornerMask;
  double result;

  cornerMask = self->__cornerMask;
  if (!cornerMask)
    return 0.0;
  -[_UIVisualEffectViewCornerMask radius](cornerMask, "radius");
  return result;
}

- (double)_continuousCornerRadius
{
  _UIVisualEffectViewCornerMask *cornerMask;
  double result;

  cornerMask = self->__cornerMask;
  if (!cornerMask)
    return 0.0;
  -[_UIVisualEffectViewCornerMask radius](cornerMask, "radius");
  return result;
}

- (id)_cornerCurve
{
  id v3;
  id v4;

  v3 = (id)*MEMORY[0x1E0CD2A60];
  if (-[_UIVisualEffectViewCornerMask cornersAreContinuous](self->__cornerMask, "cornersAreContinuous"))
  {
    v4 = (id)*MEMORY[0x1E0CD2A68];

    v3 = v4;
  }
  return v3;
}

- (void)_updateCornerTraits
{
  id v3;
  _UIVisualEffectViewCornerMask *cornerMask;
  double v5;
  double v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (id)*MEMORY[0x1E0CD2A60];
  cornerMask = self->__cornerMask;
  v14 = v3;
  if (cornerMask)
  {
    -[_UIVisualEffectViewCornerMask radius](cornerMask, "radius");
    v6 = v5;
    v7 = -[_UIVisualEffectViewCornerMask appliedCorners](self->__cornerMask, "appliedCorners");
    v8 = -[_UIVisualEffectViewCornerMask cornersAreContinuous](self->__cornerMask, "cornersAreContinuous");
    v9 = (void *)*MEMORY[0x1E0CD2A68];
    if (!v8)
      v9 = v14;
    v10 = v9;

    v14 = v10;
  }
  else
  {
    v6 = 0.0;
    v7 = 15;
  }
  -[UIView traitOverrides](self, "traitOverrides");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCGFloatValue:forTrait:", objc_opt_class(), v6);

  -[UIView traitOverrides](self, "traitOverrides");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNSIntegerValue:forTrait:", v7, objc_opt_class());

  -[UIView traitOverrides](self, "traitOverrides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forTrait:", v14, objc_opt_class());

}

- (BOOL)_isNoiseEnabled
{
  return 0;
}

- (BOOL)allowsDithering
{
  return (*(_WORD *)&self->_effectViewFlags >> 2) & 1;
}

- (void)setAllowsDithering:(BOOL)a3
{
  __int16 effectViewFlags;
  __int16 v5;
  _QWORD v6[5];

  effectViewFlags = (__int16)self->_effectViewFlags;
  if (((((effectViewFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 4;
    else
      v5 = 0;
    *(_WORD *)&self->_effectViewFlags = effectViewFlags & 0xFFFB | v5;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__UIVisualEffectView_setAllowsDithering___block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    -[UIVisualEffectView _updateEnvironmentAndFlagUpdatesIfNecessary:](self, "_updateEnvironmentAndFlagUpdatesIfNecessary:", v6);
    -[UIVisualEffectView _configureEffects](self, "_configureEffects");
  }
}

uint64_t __41__UIVisualEffectView_setAllowsDithering___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAllowsDithering:", (*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 480) >> 2) & 1);
}

- (BOOL)allowsBlurring
{
  return (*(_WORD *)&self->_effectViewFlags >> 3) & 1;
}

- (void)setAllowsBlurring:(BOOL)a3
{
  __int16 effectViewFlags;
  __int16 v5;
  _QWORD v6[5];

  effectViewFlags = (__int16)self->_effectViewFlags;
  if (((((effectViewFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 8;
    else
      v5 = 0;
    *(_WORD *)&self->_effectViewFlags = effectViewFlags & 0xFFF7 | v5;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__UIVisualEffectView_setAllowsBlurring___block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    -[UIVisualEffectView _updateEnvironmentAndFlagUpdatesIfNecessary:](self, "_updateEnvironmentAndFlagUpdatesIfNecessary:", v6);
    -[UIVisualEffectView _configureEffects](self, "_configureEffects");
  }
}

uint64_t __40__UIVisualEffectView_setAllowsBlurring___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAllowsBlurring:", (*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 480) >> 3) & 1);
}

- (id)_maskImageForMaskView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIGraphicsImageRenderer *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v3 = a3;
  +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredRange:", 0x7FFFLL);
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[UIGraphicsImageRenderer initWithBounds:format:]([UIGraphicsImageRenderer alloc], "initWithBounds:format:", v4, v5, v7, v9, v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__UIVisualEffectView__maskImageForMaskView___block_invoke;
  v17[3] = &unk_1E16B55B8;
  v18 = v3;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  v22 = v12;
  v14 = v3;
  -[UIGraphicsImageRenderer imageWithActions:](v13, "imageWithActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __44__UIVisualEffectView__maskImageForMaskView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawViewHierarchyInRect:afterScreenUpdates:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_setMaskImage:(id)a3
{
  UIImage *v5;
  UIImageView *v6;
  UIView *v7;
  UIView *maskView;
  UIView *v9;
  void *v10;
  void *v11;
  UIImage *v12;

  v5 = (UIImage *)a3;
  if (self->_maskImage != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_maskImage, a3);
    v6 = [UIImageView alloc];
    -[UIView bounds](self, "bounds");
    v7 = -[UIImageView initWithFrame:](v6, "initWithFrame:");
    -[UIView setImage:](v7, "setImage:", self->_maskImage);
    maskView = self->_maskView;
    self->_maskView = v7;
    v9 = v7;

    -[UIView layer](self->_maskView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMask:", v10);

    v5 = v12;
  }

}

- (UIImage)_maskImage
{
  return self->_maskImage;
}

- (BOOL)_allowsGroupFiltering
{
  void *v2;
  char v3;

  -[_UIVisualEffectHost contentView](self->_contentHost, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableGroupFiltering") ^ 1;

  return v3;
}

- (BOOL)_isContentViewStatic
{
  return HIBYTE(*(_WORD *)&self->_effectViewFlags) & 1;
}

- (void)_setIsContentViewStatic:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v4;
  id v5;

  v3 = a3;
  if (a3)
    v4 = 256;
  else
    v4 = 0;
  *(_WORD *)&self->_effectViewFlags = *(_WORD *)&self->_effectViewFlags & 0xFEFF | v4;
  -[UIView traitOverrides](self, "traitOverrides");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNSIntegerValue:forTrait:", v3, objc_opt_class());

}

- (id)_obtainDynamicContentAssertionForReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:](self->_assertionController, "vendAssertionOfType:initialState:reason:", 0, 1, a3);
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return 0;
  else
    return !-[UIVisualEffectView _isContentViewStatic](self, "_isContentViewStatic", v3, v4);
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (!a4)
    -[UIVisualEffectView _setIsContentViewStatic:](self, "_setIsContentViewStatic:", !a3);
}

- (void)_didUpdateContentView
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_UIVisualEffectContentViewDidUpdateNotification"), self);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_debug
{
  void *v3;
  NSArray *backgroundEffects;
  _UIVisualEffectHost *backgroundHost;
  NSArray *contentEffects;
  _UIVisualEffectHost *contentHost;
  id WeakRetained;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  backgroundEffects = self->_backgroundEffects;
  backgroundHost = self->_backgroundHost;
  contentEffects = self->_contentEffects;
  contentHost = self->_contentHost;
  WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("backgroundEffects=%@ backgroundHost=%@ contentEffects=%@ contentHost=%@ capture=(source=%@, dependents=%@)"), backgroundEffects, backgroundHost, contentEffects, contentHost, WeakRetained, self->_captureDependents);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIVisualEffectView;
  -[UIView description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[_UIVisualEffectHost contentViewRequired](self->_contentHost, "contentViewRequired"))
    objc_msgSend(v4, "appendString:", CFSTR(" clientRequestedContentView"));
  if (self->_effect)
    objc_msgSend(v4, "appendFormat:", CFSTR(" effect=%@"), self->_effect);
  else
    objc_msgSend(v4, "appendString:", CFSTR(" effect=none"));
  return (NSString *)v4;
}

- (id)_whatsWrongWithThisEffect
{
  return CFSTR("Nothing appears to be wrong\n");
}

- (void)_setBackdropViewBackgroundColorAlpha:(double)a3
{
  void *v4;
  id v5;

  if (a3 <= 0.0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *(_WORD *)&self->_effectViewFlags = *(_WORD *)&self->_effectViewFlags & 0xFF7F | ((v4 != 0) << 7);
  v5 = v4;
  objc_setAssociatedObject(self, &_UIVisualEffectViewBackdropViewBackgroundColorAlpha, v4, (void *)0x301);

}

- (double)_backdropViewBackgroundColorAlpha
{
  void *v3;
  double v4;
  double v5;

  if ((*(_WORD *)&self->_effectViewFlags & 0x80) == 0)
    return 0.0;
  objc_getAssociatedObject(self, &_UIVisualEffectViewBackdropViewBackgroundColorAlpha);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)_setUseReducedTransparencyForContentEffects:(BOOL)a3
{
  __int16 effectViewFlags;
  __int16 v4;

  effectViewFlags = (__int16)self->_effectViewFlags;
  if (((((effectViewFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 32;
    else
      v4 = 0;
    *(_WORD *)&self->_effectViewFlags = effectViewFlags & 0xFFDF | v4;
    if (a3)
      -[UIVisualEffectView _updateEffectForReducedTransparency](self, "_updateEffectForReducedTransparency");
    else
      -[UIVisualEffectView _resetEffect](self, "_resetEffect");
  }
}

- (BOOL)_useReducedTransparencyForContentEffects
{
  return (*(_WORD *)&self->_effectViewFlags >> 5) & 1;
}

- (void)_updateEffectForSnapshotWillBegin:(id)a3
{
  void *v4;

  -[UIView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIVisualEffectView _updateEffectBackgroundColor](self, "_updateEffectBackgroundColor");
    -[UIVisualEffectView _updateEffectForReducedTransparency](self, "_updateEffectForReducedTransparency");
  }
}

- (void)_updateEffectForSnapshotDidEnd:(id)a3
{
  void *v4;

  -[UIView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIVisualEffectView _resetEffect](self, "_resetEffect");
}

- (void)_updateEffectBackgroundColor
{
  void *v3;
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v12;
  double v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_backgroundEffects;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "_isATVStyle", (_QWORD)v16)
            && objc_msgSend(v10, "_isAutomaticStyle"))
          {
            if (v4 == 1000 || v4 == 2)
              v12 = 0.0;
            else
              v12 = 0.7;
            -[UIVisualEffectView _backdropViewBackgroundColorAlpha](self, "_backdropViewBackgroundColorAlpha");
            +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v12, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIVisualEffectHost contentView](self->_backgroundHost, "contentView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setBackgroundColor:", v14);

            goto LABEL_19;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_19:

  }
}

- (void)_resetEffect
{
  void *v3;
  _QWORD v4[5];

  -[_UIVisualEffectHost contentView](self->_backgroundHost, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__UIVisualEffectView__resetEffect__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[UIVisualEffectView _updateEnvironmentAndFlagUpdatesIfNecessary:](self, "_updateEnvironmentAndFlagUpdatesIfNecessary:", v4);
  *(_WORD *)&self->_effectViewFlags = *(_WORD *)&self->_effectViewFlags & 0xFFDD | 2;
  -[UIVisualEffectView _configureEffects](self, "_configureEffects");
}

uint64_t __34__UIVisualEffectView__resetEffect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setUseSimpleVibrancy:", 0);
}

- (void)_updateEffectForReducedTransparency
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__UIVisualEffectView__updateEffectForReducedTransparency__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[UIVisualEffectView _updateEnvironmentAndFlagUpdatesIfNecessary:](self, "_updateEnvironmentAndFlagUpdatesIfNecessary:", v3);
  *(_WORD *)&self->_effectViewFlags |= 0x20u;
  -[UIVisualEffectView _configureEffects](self, "_configureEffects");
}

uint64_t __57__UIVisualEffectView__updateEffectForReducedTransparency__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setUseSimpleVibrancy:", 1);
}

- (id)_contentHost
{
  return self->_contentHost;
}

- (id)_backgroundHost
{
  return self->_backgroundHost;
}

- (id)_environment
{
  return self->_environment;
}

- (_UIVisualEffectViewCornerMask)_cornerMask
{
  return self->__cornerMask;
}

- (NSArray)contentEffects
{
  return self->_contentEffects;
}

- (BOOL)_useLiveMasking
{
  return self->_useLiveMasking;
}

- (void)_setUseLiveMasking:(BOOL)a3
{
  self->_useLiveMasking = a3;
}

- (id)_colorViewBoundsOverlayCreateIfNecessary:(BOOL)a3
{
  return 0;
}

@end

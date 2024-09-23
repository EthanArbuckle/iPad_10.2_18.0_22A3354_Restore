@implementation PBUIPortalReplicaView

- (PBUIPortalReplicaView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PBUIPortalReplicaView *v7;
  PBUIPortalReplicaView *v8;
  id v9;
  uint64_t v10;
  _UIPortalView *portalView;
  PBUIReplicaDebugView *v12;
  PBUIReplicaDebugView *debugView;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  PBUIReplicaDebugView *v18;
  void *v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)PBUIPortalReplicaView;
  v7 = -[PBUIPortalReplicaView initWithFrame:](&v22, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_subscribed = 0;
    v9 = objc_alloc(MEMORY[0x1E0CEAE58]);
    -[PBUIPortalReplicaView bounds](v8, "bounds");
    v10 = objc_msgSend(v9, "initWithFrame:");
    portalView = v8->_portalView;
    v8->_portalView = (_UIPortalView *)v10;

    -[_UIPortalView setAutoresizingMask:](v8->_portalView, "setAutoresizingMask:", 18);
    -[_UIPortalView setHidesSourceView:](v8->_portalView, "setHidesSourceView:", 0);
    -[_UIPortalView setMatchesPosition:](v8->_portalView, "setMatchesPosition:", 0);
    -[_UIPortalView setMatchesTransform:](v8->_portalView, "setMatchesTransform:", 0);
    -[_UIPortalView setAllowsBackdropGroups:](v8->_portalView, "setAllowsBackdropGroups:", 1);
    -[PBUIPortalReplicaView addSubview:](v8, "addSubview:", v8->_portalView);
    -[PBUIPortalReplicaView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[PBUIPortalReplicaView setClipsToBounds:](v8, "setClipsToBounds:", 1);
    -[PBUIPortalReplicaView setShouldMatchWallpaperPosition:](v8, "setShouldMatchWallpaperPosition:", 1);
    if (PBUIReplicaDebugModeIsEnabled())
    {
      v12 = -[PBUIReplicaDebugView initWithFrame:]([PBUIReplicaDebugView alloc], "initWithFrame:", x, y, width, height);
      debugView = v8->_debugView;
      v8->_debugView = v12;

      if (-[PBUIPortalReplicaView _traitsArbiterActive](v8, "_traitsArbiterActive"))
        -[PBUIReplicaDebugView setAutoresizingMask:](v8->_debugView, "setAutoresizingMask:", 18);
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (%p)"), v16, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PBUIReplicaDebugView setTitle:](v8->_debugView, "setTitle:", v17);
      v18 = v8->_debugView;
      objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "colorWithAlphaComponent:", 0.4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIReplicaDebugView setColor:](v18, "setColor:", v20);

      -[PBUIPortalReplicaView addSubview:](v8, "addSubview:", v8->_debugView);
    }
    else
    {
      v17 = v8->_debugView;
      v8->_debugView = 0;
    }

  }
  return v8;
}

- (int64_t)effectiveStyle
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_providerToken, "invalidate");
  -[BSInvalidatable invalidate](self->_sourceToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUIPortalReplicaView;
  -[PBUIPortalReplicaView dealloc](&v3, sel_dealloc);
}

- (void)setHidesSourceView:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[_UIPortalView hidesSourceView](self->_portalView, "hidesSourceView") != a3)
    -[_UIPortalView setHidesSourceView:](self->_portalView, "setHidesSourceView:", v3);
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  self->_shouldMatchWallpaperPosition = a3;
  -[_UIPortalView setMatchesPosition:](self->_portalView, "setMatchesPosition:");
}

- (void)setFullscreen:(BOOL)a3
{
  -[PBUIPortalReplicaView setShouldMatchWallpaperPosition:](self, "setShouldMatchWallpaperPosition:", !a3);
}

- (BOOL)isFullscreen
{
  return !-[PBUIPortalReplicaView shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
}

- (void)setReason:(id)a3
{
  NSString *v4;
  NSString *reason;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reason = self->_reason;
  self->_reason = v4;

  -[PBUIReplicaDebugView setTitle:](self->_debugView, "setTitle:", self->_reason);
}

- (void)setProvider:(id)a3
{
  id WeakRetained;
  char v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_provider, obj);
    -[PBUIPortalReplicaView setNeedsProviderUpdate](self, "setNeedsProviderUpdate");
  }

}

- (void)setNeedsSourceUpdate
{
  PBUIPosterReplicaPortalProviding **p_provider;
  id WeakRetained;
  _UILegibilitySettings *v5;
  _UILegibilitySettings *legibilitySettings;
  id *p_source;
  BSInvalidatable *sourceToken;
  BSInvalidatable *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  BSInvalidatable *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  id obj;

  p_provider = &self->_provider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "portalSourceForReplicaView:", self);
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(obj, "legibilitySettings");
  v5 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
  legibilitySettings = self->_legibilitySettings;
  self->_legibilitySettings = v5;

  p_source = (id *)&self->_source;
  if ((BSEqualObjects() & 1) == 0)
  {
    sourceToken = self->_sourceToken;
    if (sourceToken)
    {
      -[BSInvalidatable invalidate](sourceToken, "invalidate");
      v9 = self->_sourceToken;
      self->_sourceToken = 0;

    }
    objc_storeStrong((id *)&self->_source, obj);
    v10 = *p_source;
    if (*p_source)
    {
      v11 = objc_loadWeakRetained((id *)p_provider);
      if (v10 != v11)
      {
        v12 = v11;
        v13 = objc_opt_respondsToSelector();

        if ((v13 & 1) == 0)
          goto LABEL_9;
        objc_msgSend(*p_source, "acquireSourceUsageAssertionForView:", self);
        v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        v10 = self->_sourceToken;
        self->_sourceToken = v14;
      }

    }
  }
LABEL_9:
  objc_msgSend(obj, "targetView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPortalView sourceView](self->_portalView, "sourceView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = BSEqualObjects();

  if ((v17 & 1) == 0)
  {
    -[_UIPortalView setSourceView:](self->_portalView, "setSourceView:", 0);
    -[_UIPortalView setSourceView:](self->_portalView, "setSourceView:", v15);
    -[_UIPortalView setMatchesPosition:](self->_portalView, "setMatchesPosition:", self->_shouldMatchWallpaperPosition);
  }
  v18 = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled");
  -[PBUIPortalReplicaView setNeedsLayout](self, "setNeedsLayout");
  if (v18)
    -[PBUIPortalReplicaView layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PBUIReplicaDebugView *debugView;
  id v15;

  if (!-[PBUIPortalReplicaView _traitsArbiterActive](self, "_traitsArbiterActive"))
  {
    -[_UIPortalView sourceView](self->_portalView, "sourceView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[PBUIPortalReplicaView superview](self, "superview");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(v15, "window");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBUIPortalReplicaView window](self, "window");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4 == v5)
        {
          objc_msgSend(v15, "bounds");
          -[PBUIPortalReplicaView setBounds:](self, "setBounds:");
          objc_msgSend(v15, "center");
          -[PBUIPortalReplicaView setCenter:](self, "setCenter:");
        }
      }
      if (self->_debugView)
      {
        objc_msgSend(v15, "bounds");
        objc_msgSend(v15, "convertRect:toView:", self);
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;
        -[PBUIReplicaDebugView setHidden:](self->_debugView, "setHidden:", 0);
        -[PBUIReplicaDebugView setFrame:](self->_debugView, "setFrame:", v7, v9, v11, v13);
        -[PBUIReplicaDebugView setNeedsLayout](self->_debugView, "setNeedsLayout");
        -[PBUIReplicaDebugView layoutIfNeeded](self->_debugView, "layoutIfNeeded");
      }
    }
    else
    {
      debugView = self->_debugView;
      if (debugView)
        -[PBUIReplicaDebugView setHidden:](debugView, "setHidden:", 1);
    }

  }
}

- (BOOL)_traitsArbiterActive
{
  if ((soft_PUIFeatureEnabled(0) & 1) != 0)
    return 0;
  else
    return soft_PUIFeatureEnabled(1);
}

- (void)setNeedsProviderUpdate
{
  BSInvalidatable *providerToken;
  id WeakRetained;
  id v5;
  BSInvalidatable *v6;
  BSInvalidatable *v7;

  providerToken = self->_providerToken;
  if (providerToken)
    -[BSInvalidatable invalidate](providerToken, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  if (WeakRetained)
  {
    self->_subscribed = 1;
    v5 = objc_loadWeakRetained((id *)&self->_provider);
    objc_msgSend(v5, "registerPortalSourceObserver:", self);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_providerToken;
    self->_providerToken = v6;

    -[PBUIPortalReplicaView setNeedsSourceUpdate](self, "setNeedsSourceUpdate");
  }
}

- (void)setSubscribed:(BOOL)a3
{
  BSInvalidatable *providerToken;
  BSInvalidatable *v5;
  BSInvalidatable *sourceToken;
  BSInvalidatable *v7;
  PBUIReplicaPortalSource *source;

  if (!self->_invalidated && self->_subscribed != a3)
  {
    self->_subscribed = a3;
    if (a3)
    {
      -[PBUIPortalReplicaView setNeedsProviderUpdate](self, "setNeedsProviderUpdate");
    }
    else
    {
      providerToken = self->_providerToken;
      if (providerToken)
      {
        -[BSInvalidatable invalidate](providerToken, "invalidate");
        v5 = self->_providerToken;
        self->_providerToken = 0;

      }
      sourceToken = self->_sourceToken;
      if (sourceToken)
      {
        -[BSInvalidatable invalidate](sourceToken, "invalidate");
        v7 = self->_sourceToken;
        self->_sourceToken = 0;

      }
      source = self->_source;
      self->_source = 0;

    }
  }
}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    -[PBUIPortalReplicaView removeFromSuperview](self, "removeFromSuperview");
    -[PBUIPortalReplicaView setSubscribed:](self, "setSubscribed:", 0);
    self->_invalidated = 1;
  }
}

- (void)didMoveToWindow
{
  id v3;

  -[PBUIPortalReplicaView window](self, "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIPortalReplicaView setSubscribed:](self, "setSubscribed:", v3 != 0);

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if (!v4
    || (-[PBUIPortalReplicaView setSubscribed:](self, "setSubscribed:", 1),
        objc_msgSend(v4, "screen"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {
    -[_UIPortalView portalLayer](self->_portalView, "portalLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  else
  {
    PBUILogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PBUIPortalReplicaView willMoveToWindow:].cold.1((uint64_t)self, v7);

    -[_UIPortalView portalLayer](self->_portalView, "portalLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  objc_msgSend(v8, "setCrossDisplay:", v10);

}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (PBUIPosterReplicaPortalProviding)provider
{
  return (PBUIPosterReplicaPortalProviding *)objc_loadWeakRetained((id *)&self->_provider);
}

- (NSString)reason
{
  return self->_reason;
}

- (PBUIReplicaDebugView)debugView
{
  return self->_debugView;
}

- (PBUIReplicaPortalSource)source
{
  return self->_source;
}

- (BOOL)isSubscribed
{
  return self->_subscribed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_sourceToken, 0);
  objc_storeStrong((id *)&self->_providerToken, 0);
}

- (void)willMoveToWindow:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B71C0000, a2, OS_LOG_TYPE_ERROR, "Enabling %@ as a cross-display portal. I'm told this may have a significant perf impact.", (uint8_t *)&v2, 0xCu);
}

@end

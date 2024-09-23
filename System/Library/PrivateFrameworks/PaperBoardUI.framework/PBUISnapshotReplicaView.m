@implementation PBUISnapshotReplicaView

- (void)didMoveToSuperview
{
  id v3;

  -[PBUISnapshotReplicaView superview](self, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUISnapshotReplicaView setSubscribed:](self, "setSubscribed:", v3 != 0);

}

- (void)didMoveToWindow
{
  id v3;

  -[PBUISnapshotReplicaView window](self, "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUISnapshotReplicaView setSubscribed:](self, "setSubscribed:", v3 != 0);

}

- (void)setSubscribed:(BOOL)a3
{
  BSInvalidatable *providerToken;
  BSInvalidatable *v5;
  BSInvalidatable *sourceToken;
  BSInvalidatable *v7;
  PBUIReplicaSnapshotSource *source;

  if (!self->_invalidated && self->_subscribed != a3)
  {
    self->_subscribed = a3;
    if (a3)
    {
      -[PBUISnapshotReplicaView setNeedsProviderUpdate](self, "setNeedsProviderUpdate");
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

- (void)layoutSubviews
{
  PBUIReplicaDebugView *debugView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  UIImageView *imageView;
  UIImageView *v13;
  UIImageView *v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  debugView = self->_debugView;
  if (debugView)
  {
    -[PBUISnapshotReplicaView bounds](self, "bounds");
    -[PBUIReplicaDebugView setFrame:](debugView, "setFrame:");
  }
  -[PBUISnapshotReplicaView _updateImageViewRotation](self, "_updateImageViewRotation");
  -[PBUISnapshotReplicaView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  imageView = self->_imageView;
  if (imageView)
  {
    -[UIImageView transform](imageView, "transform");
    v13 = self->_imageView;
  }
  else
  {
    v13 = 0;
    memset(&v15, 0, sizeof(v15));
  }
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  v17 = CGRectApplyAffineTransform(v16, &v15);
  -[UIImageView setBounds:](v13, "setBounds:", 0.0, 0.0, v17.size.width, v17.size.height);
  v14 = self->_imageView;
  -[PBUISnapshotReplicaView center](self, "center");
  -[UIImageView setCenter:](v14, "setCenter:");
}

- (void)_updateImageViewRotation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  CGFloat v8;
  uint64_t v9;
  UIImageView *imageView;
  CGAffineTransform v11;
  _BYTE v12[48];

  -[PBUISnapshotReplicaView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  -[PBUISnapshotReplicaView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isEmbeddedScreen");

  v8 = 0.0;
  if (v7)
  {
LABEL_3:
    v8 = 0.0;
    if (soft_PUIDynamicRotationIsActive())
    {
      v9 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
      if ((unint64_t)(v9 - 2) <= 2)
        v8 = dbl_1B723FB68[v9 - 2];
    }
  }
  imageView = self->_imageView;
  CGAffineTransformMakeRotation(&v11, v8);
  UIIntegralTransform();
  -[UIImageView setTransform:](imageView, "setTransform:", v12);
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
    -[PBUISnapshotReplicaView setSubscribed:](self, "setSubscribed:", 1);
}

- (void)setEffectiveStyle:(int64_t)a3
{
  if (self->_effectiveStyle != a3)
  {
    self->_effectiveStyle = a3;
    -[PBUISnapshotReplicaView setNeedsSourceUpdate](self, "setNeedsSourceUpdate");
  }
}

- (void)setNeedsSourceUpdate
{
  PBUIPosterReplicaSnapshotProviding **p_provider;
  id WeakRetained;
  _UILegibilitySettings *v5;
  _UILegibilitySettings *legibilitySettings;
  id *p_source;
  BSInvalidatable *sourceToken;
  id v9;
  id v10;
  void *v11;
  char v12;
  BSInvalidatable *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  int v19;
  id obj;

  p_provider = &self->_provider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "snapshotSourceForObserver:", self);
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(obj, "legibilitySettings");
  v5 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
  legibilitySettings = self->_legibilitySettings;
  self->_legibilitySettings = v5;

  p_source = (id *)&self->_source;
  if ((BSEqualObjects() & 1) != 0)
    goto LABEL_7;
  -[BSInvalidatable invalidate](self->_sourceToken, "invalidate");
  sourceToken = self->_sourceToken;
  self->_sourceToken = 0;

  objc_storeStrong((id *)&self->_source, obj);
  v9 = *p_source;
  if (!*p_source)
    goto LABEL_7;
  v10 = objc_loadWeakRetained((id *)p_provider);
  if (v9 == v10)
    goto LABEL_6;
  v11 = v10;
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(*p_source, "acquireSourceUsageAssertionForView:", self);
    v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_sourceToken;
    self->_sourceToken = v13;
LABEL_6:

  }
LABEL_7:
  -[PBUISnapshotReplicaView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("valid"));
  objc_msgSend(obj, "snapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "size");
    if (v17 != *MEMORY[0x1E0C9D820] || v16 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      -[UIImageView setImage:](self->_imageView, "setImage:", v15);
  }
  -[PBUISnapshotReplicaView _updateImageViewRotation](self, "_updateImageViewRotation");
  -[PBUISnapshotReplicaView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("valid"));
  v19 = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled");
  -[PBUISnapshotReplicaView setNeedsLayout](self, "setNeedsLayout");
  if (v19)
    -[PBUISnapshotReplicaView layoutIfNeeded](self, "layoutIfNeeded");

}

- (int64_t)effectiveStyle
{
  return self->_effectiveStyle;
}

- (PBUISnapshotReplicaView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PBUISnapshotReplicaView *v7;
  PBUISnapshotReplicaView *v8;
  id v9;
  uint64_t v10;
  UIImageView *imageView;
  void *v12;
  PBUIReplicaDebugView *v13;
  PBUIReplicaDebugView *debugView;
  PBUIReplicaDebugView *v15;
  void *v16;
  void *v17;
  PBUIReplicaDebugView *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)PBUISnapshotReplicaView;
  v7 = -[PBUISnapshotReplicaView initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_subscribed = 0;
    v9 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[PBUISnapshotReplicaView bounds](v8, "bounds");
    v10 = objc_msgSend(v9, "initWithFrame:");
    imageView = v8->_imageView;
    v8->_imageView = (UIImageView *)v10;

    -[UIImageView setContentMode:](v8->_imageView, "setContentMode:", 2);
    -[UIImageView setOpaque:](v8->_imageView, "setOpaque:", 1);
    -[UIImageView layer](v8->_imageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentsOpaque:", 1);

    -[UIImageView setAutoresizingMask:](v8->_imageView, "setAutoresizingMask:", 18);
    -[PBUISnapshotReplicaView addSubview:](v8, "addSubview:", v8->_imageView);
    -[PBUISnapshotReplicaView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[PBUISnapshotReplicaView setShouldMatchWallpaperPosition:](v8, "setShouldMatchWallpaperPosition:", 1);
    if (PBUIReplicaDebugModeIsEnabled())
    {
      v13 = -[PBUIReplicaDebugView initWithFrame:]([PBUIReplicaDebugView alloc], "initWithFrame:", x, y, width, height);
      debugView = v8->_debugView;
      v8->_debugView = v13;

      v15 = v8->_debugView;
      objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "colorWithAlphaComponent:", 0.4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIReplicaDebugView setColor:](v15, "setColor:", v17);

      -[PBUISnapshotReplicaView addSubview:](v8, "addSubview:", v8->_debugView);
    }
    else
    {
      v18 = v8->_debugView;
      v8->_debugView = 0;

    }
  }
  return v8;
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  self->_shouldMatchWallpaperPosition = a3;
  -[PBUISnapshotReplicaView setNeedsLayout](self, "setNeedsLayout");
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
    -[PBUISnapshotReplicaView setNeedsProviderUpdate](self, "setNeedsProviderUpdate");
  }

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
    objc_msgSend(v5, "registerSnapshotSourceObserver:", self);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_providerToken;
    self->_providerToken = v6;

    -[PBUISnapshotReplicaView setNeedsSourceUpdate](self, "setNeedsSourceUpdate");
  }
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3)
    -[PBUISnapshotReplicaView setSubscribed:](self, "setSubscribed:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_providerToken, "invalidate");
  -[BSInvalidatable invalidate](self->_sourceToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUISnapshotReplicaView;
  -[PBUISnapshotReplicaView dealloc](&v3, sel_dealloc);
}

- (void)setFullscreen:(BOOL)a3
{
  -[PBUISnapshotReplicaView setShouldMatchWallpaperPosition:](self, "setShouldMatchWallpaperPosition:", !a3);
}

- (BOOL)isFullscreen
{
  return !-[PBUISnapshotReplicaView shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
}

+ (BOOL)automaticallyNotifiesObserversForValid
{
  return 0;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  if (!self->_source)
    return 0;
  -[UIImageView image](self->_imageView, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setReason:(id)a3
{
  NSString *v4;
  NSString *reason;
  PBUIReplicaDebugView *debugView;
  id v7;

  v7 = a3;
  v4 = (NSString *)objc_msgSend(v7, "copy");
  reason = self->_reason;
  self->_reason = v4;

  debugView = self->_debugView;
  if (debugView)
    -[PBUIReplicaDebugView setTitle:](debugView, "setTitle:", v7);

}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    -[PBUISnapshotReplicaView removeFromSuperview](self, "removeFromSuperview");
    -[PBUISnapshotReplicaView setSubscribed:](self, "setSubscribed:", 0);
    self->_invalidated = 1;
  }
}

- (PBUIFakeBlurObserver)observer
{
  return (PBUIFakeBlurObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (void)setTransformOptions:(unint64_t)a3
{
  self->_transformOptions = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (PBUIReplicaDebugView)debugView
{
  return self->_debugView;
}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (PBUIPosterReplicaSnapshotProviding)provider
{
  return (PBUIPosterReplicaSnapshotProviding *)objc_loadWeakRetained((id *)&self->_provider);
}

- (NSString)reason
{
  return self->_reason;
}

- (PBUIReplicaSnapshotSource)source
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
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_sourceToken, 0);
  objc_storeStrong((id *)&self->_providerToken, 0);
}

@end

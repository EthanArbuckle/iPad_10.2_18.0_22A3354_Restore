@implementation _UIVisualEffectBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setCaptureGroup:(id)a3
{
  _UIVisualEffectViewBackdropCaptureGroup *v5;
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  _UIVisualEffectViewBackdropCaptureGroup *v7;

  v5 = (_UIVisualEffectViewBackdropCaptureGroup *)a3;
  captureGroup = self->_captureGroup;
  if (captureGroup != v5)
  {
    v7 = v5;
    -[_UIVisualEffectViewBackdropCaptureGroup removeBackdrop:update:](captureGroup, "removeBackdrop:update:", self, v5 == 0);
    objc_storeStrong((id *)&self->_captureGroup, a3);
    -[_UIVisualEffectViewBackdropCaptureGroup addBackdrop:update:](self->_captureGroup, "addBackdrop:update:", self, 1);
    v5 = v7;
  }

}

- (void)applyRequestedFilterEffects
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectBackdropView;
  -[_UIVisualEffectSubview applyRequestedFilterEffects](&v3, sel_applyRequestedFilterEffects);
  -[_UIVisualEffectBackdropView _applyScaleHintAsRequested:](self, "_applyScaleHintAsRequested:", 1);
}

- (void)_applyScaleHintAsRequested:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_UIVisualEffectSubview filters](self, "filters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "scaleHintAsRequested:", v3);
        if (v9 < v11)
          v9 = v11;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  v12 = 1.0;
  if (v9 != 0.0)
    v12 = v9;
  -[_UIVisualEffectViewBackdropCaptureGroup applyScaleHint:](self->_captureGroup, "applyScaleHint:", v12);
}

- (void)willMoveToWindow:(id)a3
{
  void *v3;
  id v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIVisualEffectBackdropView;
  -[_UIVisualEffectSubview willMoveToWindow:](&v9, sel_willMoveToWindow_, v5);
  if (v5)
  {
    objc_msgSend(v5, "screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v7 = v6;
  }
  else
  {
    v7 = 1.0;
  }
  -[_UIVisualEffectBackdropView backdropLayer](self, "backdropLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRasterizationScale:", v7);

  if (v5)
}

- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup
{
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  _UIVisualEffectViewBackdropCaptureGroup *v4;
  _UIVisualEffectViewBackdropCaptureGroup *v5;

  captureGroup = self->_captureGroup;
  if (!captureGroup)
  {
    v4 = -[_UIVisualEffectViewBackdropCaptureGroup initWithBackdrop:]([_UIVisualEffectViewBackdropCaptureGroup alloc], "initWithBackdrop:", self);
    v5 = self->_captureGroup;
    self->_captureGroup = v4;

    captureGroup = self->_captureGroup;
  }
  return captureGroup;
}

- (void)setRenderMode:(int64_t)a3
{
  id v4;

  -[_UIVisualEffectBackdropView backdropLayer](self, "backdropLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", a3 != 0);
  objc_msgSend(v4, "setCaptureOnly:", a3 == 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureGroup, 0);
}

- (void)applyIdentityFilterEffects
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectBackdropView;
  -[_UIVisualEffectSubview applyIdentityFilterEffects](&v3, sel_applyIdentityFilterEffects);
  -[_UIVisualEffectBackdropView _applyScaleHintAsRequested:](self, "_applyScaleHintAsRequested:", 0);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectBackdropView;
  if (-[_UIVisualEffectSubview _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(CFSTR("scale"), "isEqualToString:", v4);

  return v5;
}

- (int64_t)renderMode
{
  void *v2;
  int64_t v3;

  -[_UIVisualEffectBackdropView backdropLayer](self, "backdropLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEnabled"))
  {
    if (objc_msgSend(v2, "captureOnly"))
      v3 = 1;
    else
      v3 = 2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)removeFromCurrentCaptureGroup
{
  _UIVisualEffectViewBackdropCaptureGroup *captureGroup;
  _UIVisualEffectViewBackdropCaptureGroup *v4;
  id v5;

  captureGroup = self->_captureGroup;
  if (captureGroup)
  {
    -[_UIVisualEffectViewBackdropCaptureGroup removeBackdrop:update:](captureGroup, "removeBackdrop:update:", self, 0);
    v4 = self->_captureGroup;
    self->_captureGroup = 0;

    -[_UIVisualEffectBackdropView backdropLayer](self, "backdropLayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGroupName:", 0);

  }
}

- (BOOL)isTransparentFocusItem
{
  void *v3;
  int v4;
  objc_super v6;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsViewTransparency");

  if (v4)
    return -[_UIVisualEffectBackdropView renderMode](self, "renderMode") != 2;
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectBackdropView;
  return -[UIView isTransparentFocusItem](&v6, sel_isTransparentFocusItem);
}

@end

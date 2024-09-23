@implementation _UIStackedImageContainerLayer

- (_UIStackedImageContainerLayer)init
{
  _UIStackedImageContainerLayer *v2;
  _UIStackedImageContainerLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStackedImageContainerLayer;
  v2 = -[_UIStackedImageContainerLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UIStackedImageContainerLayer setDelegate:](v2, "setDelegate:", v2);
  return v3;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_configuration)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend((id)objc_opt_class(), "_layerStackObservingKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[_UIStackedImageConfiguration removeObserver:forKeyPath:context:](self->_configuration, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), CFSTR("__layerStackObservingContext"));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer dealloc](&v8, sel_dealloc);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  _UIStackedImageContainerLayer *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v6 = (_UIStackedImageContainerLayer *)a3;
  v7 = a4;
  v8 = v7;
  if (v6 == self && objc_msgSend(v7, "isEqualToString:", CFSTR("sublayers")))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ((_UIStackedImageContainerLayer *)self->_shadowLayer != v6)
    goto LABEL_5;
  if (!self->_nonOpaqueShadow)
  {
    if (!-[_UIStackedImageConfiguration useSeparateUnfocusedShadowImage](self->_configuration, "useSeparateUnfocusedShadowImage")&& objc_msgSend(v8, "isEqualToString:", CFSTR("contentsScale")))
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer contentsScale](self->_shadowLayer, "contentsScale");
      v14 = v13;
      -[_UIStackedImageContainerLayer contentsScale](self, "contentsScale");
      if (v14 <= v15)
      {
        LODWORD(v15) = 0.75;
        LODWORD(v16) = 0;
        LODWORD(v17) = 0.5;
        LODWORD(v18) = 0.5;
      }
      else
      {
        LODWORD(v15) = 0;
        LODWORD(v16) = 0.75;
        LODWORD(v17) = 0.5;
        LODWORD(v18) = 1.0;
      }
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTimingFunction:", v19);

      if (v9)
        goto LABEL_8;
    }
    goto LABEL_5;
  }
  if (!objc_msgSend(v8, "hasPrefix:", CFSTR("shadow"))
    || (objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v8),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_5:
    if (_CASupportsAnimationForKey(v8))
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTimingFunction:", v10);

    }
    else
    {
      v9 = 0;
    }
  }
LABEL_8:
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  if ((-[_UIStackedImageContainerLayer hasBeenCommitted](v6, "hasBeenCommitted") & 1) == 0)
  {
    -[_UIStackedImageContainerLayer valueForKey:](v6, "valueForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromValue:", v11);

  }
LABEL_10:

  return v9;
}

- (void)removeAllAnimations
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer removeAllAnimations](&v12, sel_removeAllAnimations);
  -[CALayer removeAllAnimations](self->_imageLayersContainer, "removeAllAnimations");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_imageLayers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeAllAnimations", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

  -[CALayer removeAllAnimations](self->_flatLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_maskLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_radiosityLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_selectedPlaceholderLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_shadowLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_unfocusedShadowLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_specularLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_cursorLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_cursorLayerContainer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_focusKeylineStrokeLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_overlayLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_overlayContainerLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_unmaskedOverlayLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_unmaskedOverlayContainerLayer, "removeAllAnimations");
  -[CATransformLayer removeAllAnimations](self->_imagePerspectiveTransformLayer, "removeAllAnimations");
  -[CATransformLayer removeAllAnimations](self->_imageRotationTransformLayer, "removeAllAnimations");
  -[CATransformLayer removeAllAnimations](self->_maskPerspectiveTransformLayer, "removeAllAnimations");
  -[CATransformLayer removeAllAnimations](self->_maskRotationTransformLayer, "removeAllAnimations");
  -[CATransformLayer removeAllAnimations](self->_unmaskedOverlayPerspectiveTransformLayer, "removeAllAnimations");
  -[CATransformLayer removeAllAnimations](self->_unmaskedOverlayRotationTransformLayer, "removeAllAnimations");
  -[CATransformLayer removeAllAnimations](self->_cursorRotationTransformLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_frontmostPerspectiveTransformLayer, "removeAllAnimations");
  -[CATransformLayer removeAllAnimations](self->_frontmostRotationTransformLayer, "removeAllAnimations");
}

- (void)setContentsScale:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer setContentsScale:](&v14, sel_setContentsScale_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_UIStackedImageContainerLayer _contentLayers](self, "_contentLayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setContentsScale:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  -[_UIStackedImageContainerLayer _updateShadowWithAnimationCoordinator:](self, "_updateShadowWithAnimationCoordinator:", 0);
  -[_UIStackedImageContainerLayer _updateSpecularLayerContents](self, "_updateSpecularLayerContents");
}

- (void)setRasterizationScale:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer setRasterizationScale:](&v14, sel_setRasterizationScale_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_UIStackedImageContainerLayer _contentLayers](self, "_contentLayers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setRasterizationScale:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  -[CALayer setRasterizationScale:](self->_shadowLayer, "setRasterizationScale:", a3);
  -[CALayer setRasterizationScale:](self->_unfocusedShadowLayer, "setRasterizationScale:", a3);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  CGFloat v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer setBounds:](&v16, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    if (height <= width)
      v13 = width;
    else
      v13 = height;
    v14 = fmax(fmin(v13 / 1920.0, 1.0), 0.0);
    v15 = fmax(fmin(v14 * 30.0 + 6.0, 10.0), 0.0);
    self->_translationOffset.x = v15;
    self->_translationOffset.y = v15;
    self->_rotationAmount = fmax(fmin(v14 * -0.25 + 0.12, 0.12), 0.025);
    self->_maximumParallaxDepth = fmax(fmin(v14 * 400.0, 60.0), 20.0);
    -[_UIStackedImageContainerLayer _setDefaultParallaxLayerDepths](self, "_setDefaultParallaxLayerDepths");
    -[_UIStackedImageContainerLayer layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    -[_UIStackedImageContainerLayer _updateNonOpaqueShadowStateFromLayerStack](self, "_updateNonOpaqueShadowStateFromLayerStack");
  }
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSUInteger v16;
  double v17;
  double v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsEmpty;
  double v35;
  double v36;
  double v37;
  double v38;
  CALayer *cursorLayer;
  void *v40;
  CALayer *v41;
  CALayer *shadowLayer;
  void *v43;
  CALayer *unfocusedShadowLayer;
  void *v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  objc_super v50;
  CGRect v51;

  v50.receiver = self;
  v50.super_class = (Class)_UIStackedImageContainerLayer;
  -[_UIStackedImageContainerLayer layoutSublayers](&v50, sel_layoutSublayers);
  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CATransformLayer bounds](self->_imagePerspectiveTransformLayer, "bounds");
  v12 = vabdd_f64(v11, v10);
  -[CATransformLayer bounds](self->_imagePerspectiveTransformLayer, "bounds");
  v14 = vabdd_f64(v13, v8);
  if (v12 < 1.0 && v14 < 1.0)
  {
    if (!-[_UIStackedImageContainerLayer _radiosityEnabled](self, "_radiosityEnabled", v14)
      || !self->_radiosityNeedsLayout)
    {
      return;
    }
LABEL_28:
    v46 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[_UIStackedImageContainerLayer _layoutRadiosityLayer](self, "_layoutRadiosityLayer");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v46);
    self->_radiosityNeedsLayout = 0;
    return;
  }
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_imageLayersContainer, self, v4, v6, v8, v10);
  v16 = -[NSArray count](self->_imageLayers, "count");
  v17 = *MEMORY[0x1E0C9D538];
  v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v47 = v6;
  v49 = v4;
  if (v16)
  {
    v19 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_parallaxImages, "objectAtIndexedSubscript:", v19, *(_QWORD *)&v47);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_imageLayers, "objectAtIndexedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStackedImageContainerLayer _preferredLayoutDelegateForLayer:](self, "_preferredLayoutDelegateForLayer:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDelegate:", v23);

      -[_UIStackedImageContainerLayer _positionAndSizeForLayerImage:](self, "_positionAndSizeForLayerImage:", v20);
      v25 = v24;
      v27 = v26;
      objc_msgSend(v21, "setBounds:", v17, v18);
      objc_msgSend(v21, "setPosition:", v25, v27);
      objc_msgSend(v21, "setDelegate:", v22);

      ++v19;
    }
    while (v19 < -[NSArray count](self->_imageLayers, "count"));
  }
  -[UINamedLayerStack size](self->_layerStack, "size", *(_QWORD *)&v47);
  -[_UIStackedImageContainerLayer _displayFrameForModelFrame:](self, "_displayFrameForModelFrame:", v17, v18, v28, v29);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  IsEmpty = CGRectIsEmpty(v51);
  if (IsEmpty)
    v35 = v49;
  else
    v35 = x;
  if (IsEmpty)
    v36 = v48;
  else
    v36 = y;
  if (IsEmpty)
    v37 = v8;
  else
    v37 = width;
  if (IsEmpty)
    v38 = v10;
  else
    v38 = height;
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_flatLayer, self, v35, v36, v37, v38);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_imagePerspectiveTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_imageRotationTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_maskPerspectiveTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_maskRotationTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_unmaskedOverlayPerspectiveTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_unmaskedOverlayRotationTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_cursorRotationTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_cursorLayerContainer, self, v49, v48, v8, v10);
  cursorLayer = self->_cursorLayer;
  -[_UIStackedImageContainerLayer _preferredLayoutDelegateForLayer:](self, "_preferredLayoutDelegateForLayer:", cursorLayer);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setDelegate:](cursorLayer, "setDelegate:", v40);

  -[CALayer setPosition:](self->_cursorLayer, "setPosition:", v49 + v8 * 0.5, v48 + v10 * 0.5);
  v41 = self->_cursorLayer;
  -[_UIStackedImageContainerLayer _cursorBounds](self, "_cursorBounds");
  -[CALayer setBounds:](v41, "setBounds:");
  -[CALayer setDelegate:](self->_cursorLayer, "setDelegate:", self);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_maskLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_selectedPlaceholderLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_focusKeylineStrokeLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_specularLayer, self, v49, v48, v8, v10);
  if (!self->_animatingStateChange)
  {
    shadowLayer = self->_shadowLayer;
    -[_UIStackedImageContainerLayer _preferredLayoutDelegateForLayer:](self, "_preferredLayoutDelegateForLayer:", shadowLayer);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setDelegate:](shadowLayer, "setDelegate:", v43);

    unfocusedShadowLayer = self->_unfocusedShadowLayer;
    -[_UIStackedImageContainerLayer _preferredLayoutDelegateForLayer:](self, "_preferredLayoutDelegateForLayer:", unfocusedShadowLayer);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setDelegate:](unfocusedShadowLayer, "setDelegate:", v45);

    -[_UIStackedImageContainerLayer _updateShadowBounds](self, "_updateShadowBounds");
    -[_UIStackedImageContainerLayer _updateShadowPositionWithOffset:](self, "_updateShadowPositionWithOffset:", v17, v18);
    -[_UIStackedImageContainerLayer _updateShadowWithAnimationCoordinator:](self, "_updateShadowWithAnimationCoordinator:", 0);
    -[CALayer setDelegate:](self->_shadowLayer, "setDelegate:", self);
    -[CALayer setDelegate:](self->_unfocusedShadowLayer, "setDelegate:", self);
  }
  -[_UIStackedImageContainerLayer _updateOverlayLayout](self, "_updateOverlayLayout");
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_frontmostPerspectiveTransformLayer, self, v49, v48, v8, v10);
  __48___UIStackedImageContainerLayer_layoutSublayers__block_invoke(self->_frontmostRotationTransformLayer, self, v49, v48, v8, v10);
  if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
    -[_UIStackedImageContainerLayer _updateLayerForSelection](self, "_updateLayerForSelection");
  if (-[_UIStackedImageContainerLayer _radiosityEnabled](self, "_radiosityEnabled"))
    goto LABEL_28;
}

- (void)_updateOverlayLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle")
    && self->_selectionStyle == 1
    && -[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth"))
  {
    -[_UIStackedImageContainerLayer _scaledSizeForCurrentState](self, "_scaledSizeForCurrentState");
    v8 = v11;
    v10 = v12;
  }
  if (self->_overlayLayer)
  {
    __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(self->_overlayContainerLayer, self, v4, v6, v8, v10);
    __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(self->_overlayLayer, self, v4, v6, v8, v10);
  }
  if (self->_unmaskedOverlayLayer)
  {
    __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(self->_unmaskedOverlayContainerLayer, self, v4, v6, v8, v10);
    __53___UIStackedImageContainerLayer__updateOverlayLayout__block_invoke(self->_unmaskedOverlayLayer, self, v4, v6, v8, v10);
  }
}

- (void)_layoutRadiosityLayer
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
  double v12;
  double v13;
  double v14;
  double v15;
  CALayer *radiosityLayer;
  double v18;

  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CALayer contents](self->_radiosityLayer, "contents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = v8;
    v13 = v10;
    goto LABEL_8;
  }
  v12 = v8 * self->_radiosityImageScale.width;
  v13 = v10 * self->_radiosityImageScale.height;
  -[CALayer bounds](self->_radiosityLayer, "bounds");
  if (v12 != v15 || v13 != v14)
  {
    v4 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_8:
    -[CALayer setBounds:](self->_radiosityLayer, "setBounds:", v4, v6, v12, v13);
    radiosityLayer = self->_radiosityLayer;
    -[_UIStackedImageConfiguration radiosityOffset](self->_configuration, "radiosityOffset");
    -[CALayer setPosition:](radiosityLayer, "setPosition:", v8 * 0.5, v10 * 0.5 + v18);
  }
}

- (void)_setupFrontmostTransformLayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CALayer *v11;
  CALayer *frontmostPerspectiveTransformLayer;
  CATransformLayer *unmaskedOverlayPerspectiveTransformLayer;
  CATransformLayer *v14;
  CATransformLayer *frontmostRotationTransformLayer;

  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!self->_frontmostPerspectiveTransformLayer)
  {
    v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    frontmostPerspectiveTransformLayer = self->_frontmostPerspectiveTransformLayer;
    self->_frontmostPerspectiveTransformLayer = v11;

    -[CALayer setDelegate:](self->_frontmostPerspectiveTransformLayer, "setDelegate:", self);
    -[CALayer setFrame:](self->_frontmostPerspectiveTransformLayer, "setFrame:", v4, v6, v8, v10);
    -[CALayer setZPosition:](self->_frontmostPerspectiveTransformLayer, "setZPosition:", 50.0);
    unmaskedOverlayPerspectiveTransformLayer = self->_unmaskedOverlayPerspectiveTransformLayer;
    if (!unmaskedOverlayPerspectiveTransformLayer)
      unmaskedOverlayPerspectiveTransformLayer = (CATransformLayer *)self->_imageLayersContainer;
    -[_UIStackedImageContainerLayer insertSublayer:above:](self, "insertSublayer:above:", self->_frontmostPerspectiveTransformLayer, unmaskedOverlayPerspectiveTransformLayer);
  }
  if (!self->_frontmostRotationTransformLayer)
  {
    v14 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E0CD28C8]);
    frontmostRotationTransformLayer = self->_frontmostRotationTransformLayer;
    self->_frontmostRotationTransformLayer = v14;

    -[CATransformLayer setDelegate:](self->_frontmostRotationTransformLayer, "setDelegate:", self);
    -[CATransformLayer setFrame:](self->_frontmostRotationTransformLayer, "setFrame:", v4, v6, v8, v10);
    -[CALayer addSublayer:](self->_frontmostPerspectiveTransformLayer, "addSublayer:", self->_frontmostRotationTransformLayer);
  }
}

- (CGRect)_cursorBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double scale;
  CGAffineTransform *v8;
  CGAffineTransform *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BYTE v23[48];
  _BYTE v24[48];
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  if (!CGRectIsEmpty(v25))
  {
    if (self->_selectionStyle == 1
      && -[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth"))
    {
      scale = self->_scale;
      v8 = (CGAffineTransform *)v24;
      v9 = (CGAffineTransform *)v24;
      v10 = 1.0;
    }
    else
    {
      v10 = self->_scale;
      v8 = (CGAffineTransform *)v23;
      v9 = (CGAffineTransform *)v23;
      scale = v10;
    }
    CGAffineTransformMakeScale(v9, v10, scale);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v27 = CGRectApplyAffineTransform(v26, v8);
    v11 = v27.origin.x;
    v12 = v27.origin.y;
    v13 = v27.size.width;
    v14 = v27.size.height;
    -[_UIStackedImageConfiguration focusCursorBorderWidth](self->_configuration, "focusCursorBorderWidth");
    v16 = v15 * -2.0;
    -[_UIStackedImageConfiguration focusCursorBorderWidth](self->_configuration, "focusCursorBorderWidth");
    v18 = v17 * -2.0;
    v28.origin.x = v11;
    v28.origin.y = v12;
    v28.size.width = v13;
    v28.size.height = v14;
    v29 = CGRectInset(v28, v16, v18);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
  }
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_preferredLayoutDelegateForLayer:(id)a3
{
  id v4;
  _UIStackedImageContainerLayer *v5;
  void *v6;
  _UIStackedImageLayerDelegate *layoutDelegate;
  _UIStackedImageLayerDelegate *v8;
  _UIStackedImageLayerDelegate *v9;
  _UIStackedImageLayerDelegate *v10;
  _UIStackedImageLayerDelegate *v11;
  _UIStackedImageLayerDelegate *v12;

  v4 = a3;
  objc_msgSend(v4, "delegate");
  v5 = (_UIStackedImageContainerLayer *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || v5 == self)
  {
    layoutDelegate = self->_layoutDelegate;
    if (layoutDelegate)
    {
      v8 = layoutDelegate;

      v6 = v8;
    }
    else
    {
      v9 = [_UIStackedImageLayerDelegate alloc];
      v10 = -[UIView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v11 = self->_layoutDelegate;
      self->_layoutDelegate = v10;

      v12 = self->_layoutDelegate;
      v6 = v12;
      if (!v12)
      {
        objc_msgSend(v4, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  CALayer *radiosityLayer;
  double v13;
  objc_super v14;

  v10 = a3;
  v11 = v10;
  if (a6 != CFSTR("__layerStackObservingContext"))
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIStackedImageContainerLayer;
    -[_UIStackedImageContainerLayer observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
    goto LABEL_18;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("cornerRadius")))
  {
    -[_UIStackedImageContainerLayer _updateCornerRadiusFromConfig](self, "_updateCornerRadiusFromConfig");
LABEL_5:
    -[_UIStackedImageContainerLayer _updateLayerForSelection](self, "_updateLayerForSelection");
    goto LABEL_18;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("radiosityStrength")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("placeholderImage")))
    {
      -[_UIStackedImageContainerLayer _setFlatImage:](self, "_setFlatImage:", -[UINamedLayerStack flattenedImage](self->_layerStack, "flattenedImage"));
      goto LABEL_18;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("allowsNonOpaqueShadow")))
    {
      -[_UIStackedImageContainerLayer _updateNonOpaqueShadowStateFromLayerStack](self, "_updateNonOpaqueShadowStateFromLayerStack");
      goto LABEL_18;
    }
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("boostBrightness")) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", CFSTR("hueShift")))
    {
      -[_UIStackedImageContainerLayer _updateSingleLayerNoMaskFromLayerStack](self, "_updateSingleLayerNoMaskFromLayerStack");
      goto LABEL_18;
    }
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("focusCursorEnabled")))
      goto LABEL_18;
    goto LABEL_5;
  }
  if (-[_UIStackedImageContainerLayer _radiosityEnabled](self, "_radiosityEnabled") && !self->_radiosityLayer)
    -[_UIStackedImageContainerLayer _updateRadiosityFromLayerStack](self, "_updateRadiosityFromLayerStack");
  radiosityLayer = self->_radiosityLayer;
  -[_UIStackedImageConfiguration radiosityStrength](self->_configuration, "radiosityStrength");
  *(float *)&v13 = v13;
  -[CALayer setOpacity:](radiosityLayer, "setOpacity:", v13);
LABEL_18:

}

+ (id)_layerStackObservingKeys
{
  if (_MergedGlobals_23_7 != -1)
    dispatch_once(&_MergedGlobals_23_7, &__block_literal_global_164_2);
  return (id)qword_1ECD7B7D8;
}

- (void)_updateCornerRadiusFromConfig
{
  double v3;
  double v4;
  int v5;
  double v6;
  CALayer **p_flatLayer;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CALayer *cursorLayer;
  double v14;

  if (-[_UIStackedImageConfiguration flatImageContainsCornerRadius](self->_configuration, "flatImageContainsCornerRadius"))
  {
    -[_UIStackedImageConfiguration cornerRadius](self->_configuration, "cornerRadius");
    v4 = v3;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[_UIStackedImageConfiguration cornerRadius](self->_configuration, "cornerRadius");
      v4 = v9;
      goto LABEL_8;
    }
    v5 = -[UINamedLayerStack flatImageContainsCornerRadius](self->_layerStack, "flatImageContainsCornerRadius");
    -[_UIStackedImageConfiguration cornerRadius](self->_configuration, "cornerRadius");
    v4 = v6;
    if (!v5)
    {
LABEL_8:
      -[_UIStackedImageConfiguration isContinuousCornerRadiusEnabled](self->_configuration, "isContinuousCornerRadiusEnabled");
      p_flatLayer = &self->_flatLayer;
      _setCornerCurveOnLayer(v10 != 0.0, self->_flatLayer);
      v8 = v4;
      goto LABEL_9;
    }
  }
  if (!self->_flatImage)
    goto LABEL_8;
  p_flatLayer = &self->_flatLayer;
  v8 = 0.0;
LABEL_9:
  -[CALayer setCornerRadius:](*p_flatLayer, "setCornerRadius:", v8);
  -[_UIStackedImageConfiguration isContinuousCornerRadiusEnabled](self->_configuration, "isContinuousCornerRadiusEnabled");
  _setCornerCurveOnLayer(v11 != 0.0, self->_maskLayer);
  -[CALayer setCornerRadius:](self->_maskLayer, "setCornerRadius:", v4);
  -[_UIStackedImageConfiguration isContinuousCornerRadiusEnabled](self->_configuration, "isContinuousCornerRadiusEnabled");
  _setCornerCurveOnLayer(v12 != 0.0, self->_cursorLayer);
  cursorLayer = self->_cursorLayer;
  -[_UIStackedImageConfiguration focusCursorBorderWidth](self->_configuration, "focusCursorBorderWidth");
  -[CALayer setCornerRadius:](cursorLayer, "setCornerRadius:", v4 + v14 + v14);
}

- (void)setConfiguration:(id)a3
{
  id v5;
  _UIStackedImageConfiguration **p_configuration;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  CALayer *v29;
  CALayer *unfocusedShadowLayer;
  CALayer *v31;
  id v32;
  CALayer *v33;
  CALayer *shadowLayer;
  CALayer *v35;
  id v36;
  CALayer *v37;
  CALayer *cursorLayerContainer;
  CATransformLayer *v39;
  CATransformLayer *cursorRotationTransformLayer;
  CALayer *v41;
  CALayer *cursorLayer;
  CALayer *v43;
  id v44;
  CALayer *v45;
  id v46;
  CALayer *v47;
  uint64_t v48;
  CALayer *v49;
  CALayer *flatLayer;
  CALayer *v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  CALayer *v55;
  id v56;
  CALayer *v57;
  CALayer *imageLayersContainer;
  CATransformLayer *v59;
  CATransformLayer *imagePerspectiveTransformLayer;
  CATransformLayer *v61;
  CATransformLayer *imageRotationTransformLayer;
  CALayer *v63;
  CALayer *selectedPlaceholderLayer;
  CALayer *v65;
  void *v66;
  uint64_t v67;
  CALayer *v68;
  id v69;
  CALayer *v70;
  CALayer *maskLayer;
  CALayer *v72;
  id v73;
  CATransformLayer *v74;
  CATransformLayer *maskPerspectiveTransformLayer;
  CATransformLayer *v76;
  CATransformLayer *maskRotationTransformLayer;
  CALayer *v78;
  CALayer *focusKeylineStrokeLayer;
  CALayer *v80;
  id v81;
  CALayer *v82;
  CALayer *specularLayer;
  double v84;
  void *v85;
  UIView *v86;
  UIView *animationView;
  void *v88;
  void *v89;
  char isKindOfClass;
  UIView *v91;
  UIView *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;
  CGRect v109;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_configuration = &self->_configuration;
  if (!-[_UIStackedImageConfiguration isEqual:](self->_configuration, "isEqual:", v5))
  {
    -[_UIStackedImageContainerLayer bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    if (*p_configuration)
    {
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      objc_msgSend((id)objc_opt_class(), "_layerStackObservingKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v103;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v103 != v18)
              objc_enumerationMutation(v15);
            -[_UIStackedImageConfiguration removeObserver:forKeyPath:context:](*p_configuration, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i), CFSTR("__layerStackObservingContext"));
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
        }
        while (v17);
      }

    }
    objc_storeStrong((id *)&self->_configuration, a3);
    if (*p_configuration)
    {
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      objc_msgSend((id)objc_opt_class(), "_layerStackObservingKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v99;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v99 != v23)
              objc_enumerationMutation(v20);
            -[_UIStackedImageConfiguration addObserver:forKeyPath:options:context:](*p_configuration, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j), 1, CFSTR("__layerStackObservingContext"));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
        }
        while (v22);
      }

    }
    if (!self->_flatLayer)
    {
      v97 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      self->_idleModeFocusSizeOffset = 20.0;
      self->_scale = 1.0;
      -[_UIStackedImageContainerLayer setAllowsGroupOpacity:](self, "setAllowsGroupOpacity:", 0);
      -[_UIStackedImageContainerLayer setAllowsEdgeAntialiasing:](self, "setAllowsEdgeAntialiasing:", 0);
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "traitCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "userInterfaceStyle");

      v95 = v27;
      if (v27 == 1000)
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
      else
        +[UIColor blackColor](UIColor, "blackColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      unfocusedShadowLayer = self->_unfocusedShadowLayer;
      self->_unfocusedShadowLayer = v29;

      -[CALayer setDelegate:](self->_unfocusedShadowLayer, "setDelegate:", self);
      -[CALayer setAnchorPoint:](self->_unfocusedShadowLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setZPosition:](self->_unfocusedShadowLayer, "setZPosition:", -52.0);
      -[CALayer setFrame:](self->_unfocusedShadowLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer setAllowsGroupOpacity:](self->_unfocusedShadowLayer, "setAllowsGroupOpacity:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](self->_unfocusedShadowLayer, "setAllowsEdgeAntialiasing:", 0);
      v31 = self->_unfocusedShadowLayer;
      v32 = objc_retainAutorelease(v28);
      -[CALayer setShadowColor:](v31, "setShadowColor:", objc_msgSend(v32, "CGColor"));
      -[_UIStackedImageContainerLayer addSublayer:](self, "addSublayer:", self->_unfocusedShadowLayer);
      v33 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      shadowLayer = self->_shadowLayer;
      self->_shadowLayer = v33;

      -[CALayer setDelegate:](self->_shadowLayer, "setDelegate:", self);
      -[CALayer setAnchorPoint:](self->_shadowLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setZPosition:](self->_shadowLayer, "setZPosition:", -51.0);
      -[CALayer setFrame:](self->_shadowLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer setAllowsGroupOpacity:](self->_shadowLayer, "setAllowsGroupOpacity:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](self->_shadowLayer, "setAllowsEdgeAntialiasing:", 0);
      v35 = self->_shadowLayer;
      v36 = objc_retainAutorelease(v32);
      -[CALayer setShadowColor:](v35, "setShadowColor:", objc_msgSend(v36, "CGColor"));
      -[_UIStackedImageContainerLayer addSublayer:](self, "addSublayer:", self->_shadowLayer);

      v37 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      cursorLayerContainer = self->_cursorLayerContainer;
      self->_cursorLayerContainer = v37;

      -[CALayer setDelegate:](self->_cursorLayerContainer, "setDelegate:", self);
      -[CALayer setFrame:](self->_cursorLayerContainer, "setFrame:", v8, v10, v12, v14);
      -[_UIStackedImageContainerLayer addSublayer:](self, "addSublayer:", self->_cursorLayerContainer);
      v39 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E0CD28C8]);
      cursorRotationTransformLayer = self->_cursorRotationTransformLayer;
      self->_cursorRotationTransformLayer = v39;

      -[CATransformLayer setDelegate:](self->_cursorRotationTransformLayer, "setDelegate:", self);
      -[CATransformLayer setFrame:](self->_cursorRotationTransformLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer addSublayer:](self->_cursorLayerContainer, "addSublayer:", self->_cursorRotationTransformLayer);
      v41 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      cursorLayer = self->_cursorLayer;
      self->_cursorLayer = v41;

      -[CALayer setDelegate:](self->_cursorLayer, "setDelegate:", self);
      -[CALayer setAnchorPoint:](self->_cursorLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_cursorLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer setAllowsGroupOpacity:](self->_cursorLayer, "setAllowsGroupOpacity:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](self->_cursorLayer, "setAllowsEdgeAntialiasing:", 0);
      v43 = self->_cursorLayer;
      +[UIColor whiteColor](UIColor, "whiteColor");
      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBorderColor:](v43, "setBorderColor:", objc_msgSend(v44, "CGColor"));

      v45 = self->_cursorLayer;
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3);
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](v45, "setBackgroundColor:", objc_msgSend(v46, "CGColor"));

      v47 = self->_cursorLayer;
      -[_UIStackedImageConfiguration focusCursorBorderWidth](*p_configuration, "focusCursorBorderWidth");
      -[CALayer setBorderWidth:](v47, "setBorderWidth:");
      -[CALayer setHidden:](self->_cursorLayer, "setHidden:", 1);
      -[CATransformLayer addSublayer:](self->_cursorRotationTransformLayer, "addSublayer:", self->_cursorLayer);
      v48 = *MEMORY[0x1E0CD2F98];
      -[_UIStackedImageContainerLayer _setImageStackContentsGravity:](self, "_setImageStackContentsGravity:", *MEMORY[0x1E0CD2F98]);
      v49 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      flatLayer = self->_flatLayer;
      self->_flatLayer = v49;

      -[CALayer setAnchorPoint:](self->_flatLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_flatLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer setMasksToBounds:](self->_flatLayer, "setMasksToBounds:", 1);
      -[CALayer setContentsGravity:](self->_flatLayer, "setContentsGravity:", v48);
      -[CALayer setAllowsGroupOpacity:](self->_flatLayer, "setAllowsGroupOpacity:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](self->_flatLayer, "setAllowsEdgeAntialiasing:", 0);
      v51 = self->_flatLayer;
      -[_UIStackedImageConfiguration placeholderImage](*p_configuration, "placeholderImage");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v53 = 0;
        v54 = 0x1E0CD2000;
      }
      else
      {
        if (qword_1ECD7B818 != -1)
          dispatch_once(&qword_1ECD7B818, &__block_literal_global_464_0);
        v54 = 0x1E0CD2000uLL;
        v53 = qword_1ECD7B810;
      }
      -[CALayer setBackgroundColor:](v51, "setBackgroundColor:", v53, v95);

      v55 = self->_flatLayer;
      -[_UIStackedImageConfiguration placeholderImage](*p_configuration, "placeholderImage");
      v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setContents:](v55, "setContents:", objc_msgSend(v56, "CGImage"));

      -[_UIStackedImageContainerLayer addSublayer:](self, "addSublayer:", self->_flatLayer);
      v57 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      imageLayersContainer = self->_imageLayersContainer;
      self->_imageLayersContainer = v57;

      -[CALayer setAnchorPoint:](self->_imageLayersContainer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_imageLayersContainer, "setFrame:", v8, v10, v12, v14);
      -[CALayer setAllowsGroupOpacity:](self->_imageLayersContainer, "setAllowsGroupOpacity:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](self->_imageLayersContainer, "setAllowsEdgeAntialiasing:", 0);
      -[CALayer setHidden:](self->_imageLayersContainer, "setHidden:", 1);
      -[_UIStackedImageContainerLayer addSublayer:](self, "addSublayer:", self->_imageLayersContainer);
      v59 = (CATransformLayer *)objc_alloc_init(*(Class *)(v54 + 2248));
      imagePerspectiveTransformLayer = self->_imagePerspectiveTransformLayer;
      self->_imagePerspectiveTransformLayer = v59;

      -[CATransformLayer setDelegate:](self->_imagePerspectiveTransformLayer, "setDelegate:", self);
      -[CATransformLayer setAnchorPoint:](self->_imagePerspectiveTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CATransformLayer setFrame:](self->_imagePerspectiveTransformLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer addSublayer:](self->_imageLayersContainer, "addSublayer:", self->_imagePerspectiveTransformLayer);
      v61 = (CATransformLayer *)objc_alloc_init(*(Class *)(v54 + 2248));
      imageRotationTransformLayer = self->_imageRotationTransformLayer;
      self->_imageRotationTransformLayer = v61;

      -[CATransformLayer setDelegate:](self->_imageRotationTransformLayer, "setDelegate:", self);
      -[CATransformLayer setAnchorPoint:](self->_imageRotationTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CATransformLayer setFrame:](self->_imageRotationTransformLayer, "setFrame:", v8, v10, v12, v14);
      -[CATransformLayer addSublayer:](self->_imagePerspectiveTransformLayer, "addSublayer:", self->_imageRotationTransformLayer);
      v63 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      selectedPlaceholderLayer = self->_selectedPlaceholderLayer;
      self->_selectedPlaceholderLayer = v63;

      -[CALayer setDelegate:](self->_selectedPlaceholderLayer, "setDelegate:", self);
      -[CALayer setAnchorPoint:](self->_selectedPlaceholderLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_selectedPlaceholderLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer setAllowsGroupOpacity:](self->_selectedPlaceholderLayer, "setAllowsGroupOpacity:", 0);
      -[CALayer setContentsGravity:](self->_selectedPlaceholderLayer, "setContentsGravity:", v48);
      v65 = self->_selectedPlaceholderLayer;
      -[_UIStackedImageConfiguration placeholderImage](*p_configuration, "placeholderImage");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
      {
        v67 = 0;
      }
      else
      {
        if (qword_1ECD7B818 != -1)
          dispatch_once(&qword_1ECD7B818, &__block_literal_global_464_0);
        v67 = qword_1ECD7B810;
      }
      -[CALayer setBackgroundColor:](v65, "setBackgroundColor:", v67);

      v68 = self->_selectedPlaceholderLayer;
      -[_UIStackedImageConfiguration placeholderImage](*p_configuration, "placeholderImage");
      v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setContents:](v68, "setContents:", objc_msgSend(v69, "CGImage"));

      v70 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      maskLayer = self->_maskLayer;
      self->_maskLayer = v70;

      -[CALayer setDelegate:](self->_maskLayer, "setDelegate:", self);
      -[CALayer setAnchorPoint:](self->_maskLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_maskLayer, "setFrame:", v8, v10, v12, v14);
      v72 = self->_maskLayer;
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
      v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](v72, "setBackgroundColor:", objc_msgSend(v73, "CGColor"));

      -[CALayer setAllowsGroupOpacity:](self->_maskLayer, "setAllowsGroupOpacity:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](self->_maskLayer, "setAllowsEdgeAntialiasing:", 1);
      v74 = (CATransformLayer *)objc_alloc_init(*(Class *)(v54 + 2248));
      maskPerspectiveTransformLayer = self->_maskPerspectiveTransformLayer;
      self->_maskPerspectiveTransformLayer = v74;

      -[CATransformLayer setDelegate:](self->_maskPerspectiveTransformLayer, "setDelegate:", self);
      -[CATransformLayer setAnchorPoint:](self->_maskPerspectiveTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CATransformLayer setFrame:](self->_maskPerspectiveTransformLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer setMask:](self->_imageLayersContainer, "setMask:", self->_maskPerspectiveTransformLayer);
      v76 = (CATransformLayer *)objc_alloc_init(*(Class *)(v54 + 2248));
      maskRotationTransformLayer = self->_maskRotationTransformLayer;
      self->_maskRotationTransformLayer = v76;

      -[CATransformLayer setDelegate:](self->_maskRotationTransformLayer, "setDelegate:", self);
      -[CATransformLayer setAnchorPoint:](self->_maskRotationTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CATransformLayer setFrame:](self->_maskRotationTransformLayer, "setFrame:", v8, v10, v12, v14);
      -[CATransformLayer addSublayer:](self->_maskPerspectiveTransformLayer, "addSublayer:", self->_maskRotationTransformLayer);
      -[CATransformLayer addSublayer:](self->_maskRotationTransformLayer, "addSublayer:", self->_maskLayer);
      if (v96 == 1000)
      {
        -[_UIStackedImageContainerLayer _setupFrontmostTransformLayers](self, "_setupFrontmostTransformLayers");
        v78 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
        focusKeylineStrokeLayer = self->_focusKeylineStrokeLayer;
        self->_focusKeylineStrokeLayer = v78;

        -[CALayer setAnchorPoint:](self->_focusKeylineStrokeLayer, "setAnchorPoint:", 0.5, 0.5);
        -[CALayer setFrame:](self->_focusKeylineStrokeLayer, "setFrame:", v8, v10, v12, v14);
        v80 = self->_focusKeylineStrokeLayer;
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0);
        v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[CALayer setBorderColor:](v80, "setBorderColor:", objc_msgSend(v81, "CGColor"));

        -[CALayer setBorderWidth:](self->_focusKeylineStrokeLayer, "setBorderWidth:", 2.0);
        -[CALayer setAllowsGroupOpacity:](self->_focusKeylineStrokeLayer, "setAllowsGroupOpacity:", 0);
        -[CALayer setHidden:](self->_focusKeylineStrokeLayer, "setHidden:", 1);
        -[CALayer setDelegate:](self->_focusKeylineStrokeLayer, "setDelegate:", self);
        -[CATransformLayer addSublayer:](self->_frontmostRotationTransformLayer, "addSublayer:", self->_focusKeylineStrokeLayer);
      }
      v82 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      specularLayer = self->_specularLayer;
      self->_specularLayer = v82;

      -[CALayer setDelegate:](self->_specularLayer, "setDelegate:", self);
      -[CALayer setAnchorPoint:](self->_specularLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setFrame:](self->_specularLayer, "setFrame:", v8, v10, v12, v14);
      -[CALayer setAllowsGroupOpacity:](self->_specularLayer, "setAllowsGroupOpacity:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](self->_specularLayer, "setAllowsEdgeAntialiasing:", 0);
      -[_UIStackedImageContainerLayer _updateSpecularLayerContents](self, "_updateSpecularLayerContents");
      LODWORD(v84) = 0;
      -[CALayer setOpacity:](self->_specularLayer, "setOpacity:", v84);
      -[CATransformLayer addSublayer:](self->_imageRotationTransformLayer, "addSublayer:", self->_specularLayer);
      -[_UIStackedImageContainerLayer delegate](self, "delegate");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v86 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
        animationView = self->_animationView;
        self->_animationView = v86;

        objc_msgSend(v85, "addSubview:", self->_animationView);
      }
      else
      {
        -[_UIStackedImageContainerLayer superlayer](self, "superlayer");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "delegate");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v91 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
          v92 = self->_animationView;
          self->_animationView = v91;

          -[_UIStackedImageContainerLayer superlayer](self, "superlayer");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "delegate");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "addSubview:", self->_animationView);

        }
      }
      -[_UIStackedImageContainerLayer contentsScale](self, "contentsScale");
      -[_UIStackedImageContainerLayer setContentsScale:](self, "setContentsScale:");
      -[_UIStackedImageContainerLayer rasterizationScale](self, "rasterizationScale");
      -[_UIStackedImageContainerLayer setRasterizationScale:](self, "setRasterizationScale:");
      v109.origin.x = v8;
      v109.origin.y = v10;
      v109.size.width = v12;
      v109.size.height = v14;
      if (!CGRectIsEmpty(v109))
        -[_UIStackedImageContainerLayer _updateLayerForSelection](self, "_updateLayerForSelection");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v97);

    }
    -[_UIStackedImageContainerLayer _updateCornerRadiusFromConfig](self, "_updateCornerRadiusFromConfig");
    -[_UIStackedImageContainerLayer _updateSingleLayerNoMaskFromLayerStack](self, "_updateSingleLayerNoMaskFromLayerStack");
  }

}

- (void)setLayerStack:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UIStackedImageContainerLayer *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "size");
  v7 = v6;
  v8 = v5;
  if (fabs(v6) == INFINITY || fabs(v5) == INFINITY)
  {
    v11 = setLayerStack____s_category;
    if (!setLayerStack____s_category)
    {
      v11 = __UILogCategoryGetNode("LayeredImage", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&setLayerStack____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 134218240;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Image has an invalid size. (w: %g, h: %g)", (uint8_t *)&v13, 0x16u);
    }
    v9 = self;
    v10 = 0;
  }
  else
  {
    v9 = self;
    v10 = v4;
  }
  -[_UIStackedImageContainerLayer _setLayerStack:](v9, "_setLayerStack:", v10);

}

- (void)_setLayerStack:(id)a3
{
  UINamedLayerStack **p_layerStack;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  p_layerStack = &self->_layerStack;
  v12 = a3;
  if ((-[UINamedLayerStack isEqual:](*p_layerStack, "isEqual:") & 1) == 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    if (self->_animatingToNormalState)
      -[_UIStackedImageContainerLayer _resetAnimatingToNormalState](self, "_resetAnimatingToNormalState");
    objc_storeStrong((id *)&self->_layerStack, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_opt_respondsToSelector();
    else
      v7 = 0;
    self->_layerStackSupportsInflation = v7 & 1;
    -[UINamedLayerStack layers](*p_layerStack, "layers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageObj");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_layerStackInflated = v10 != 0;

    -[_UIStackedImageContainerLayer _setFlatImage:](self, "_setFlatImage:", objc_msgSend(v12, "flattenedImage"));
    objc_msgSend(v12, "layers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStackedImageContainerLayer _setParallaxImages:](self, "_setParallaxImages:", v11);

    if (self->_layerStackSupportsInflation
      && !self->_layerStackInflated
      && !-[_UIStackedImageContainerLayer _isNormal](self, "_isNormal")
      && !self->_deferredInflationPending)
    {
      -[_UIStackedImageContainerLayer _setLayerStackInflated:seed:](self, "_setLayerStackInflated:seed:", 1, self->_layerStackInflationSeed);
    }
    -[_UIStackedImageContainerLayer _updateSingleLayerNoMaskFromLayerStack](self, "_updateSingleLayerNoMaskFromLayerStack");
    -[_UIStackedImageContainerLayer _updateNonOpaqueShadowStateFromLayerStack](self, "_updateNonOpaqueShadowStateFromLayerStack");
    -[_UIStackedImageContainerLayer _updateRadiosityFromLayerStack](self, "_updateRadiosityFromLayerStack");
    -[_UIStackedImageContainerLayer _updateCornerRadiusFromConfig](self, "_updateCornerRadiusFromConfig");
    -[_UIStackedImageContainerLayer setNeedsLayout](self, "setNeedsLayout");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v6);
  }

}

- (BOOL)_aspectMatchesLayerStack
{
  UINamedLayerStack *layerStack;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  layerStack = self->_layerStack;
  if (layerStack)
  {
    -[UINamedLayerStack size](layerStack, "size");
    v5 = v4;
    v7 = v6;
    -[_UIStackedImageContainerLayer bounds](self, "bounds");
    LOBYTE(layerStack) = 0;
    if (v7 > 0.0 && v9 > 0.0)
      LOBYTE(layerStack) = vabdd_f64(v5 / v7, v8 / v9) <= 0.01;
  }
  return (char)layerStack;
}

- (void)_updateSingleLayerNoMaskFromLayerStack
{
  CATransformLayer *maskPerspectiveTransformLayer;
  void *v4;
  double v5;
  _BOOL4 v6;

  if (!-[_UIStackedImageConfiguration disableMask](self->_configuration, "disableMask"))
  {
    if (self->_selectionStyle)
    {
      if (!self->_singleLayerNoMask)
        return;
      self->_singleLayerNoMask = 0;
    }
    else
    {
      -[UINamedLayerStack layers](self->_layerStack, "layers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v4, "count") <= 1
        && (-[_UIStackedImageConfiguration cornerRadius](self->_configuration, "cornerRadius"), v5 == 0.0)
        && !-[_UIStackedImageConfiguration boostBrightness](self->_configuration, "boostBrightness"))
      {
        v6 = !-[_UIStackedImageConfiguration hueShift](self->_configuration, "hueShift");
      }
      else
      {
        v6 = 0;
      }

      if (self->_singleLayerNoMask == v6)
        return;
      self->_singleLayerNoMask = v6;
      if (v6)
        goto LABEL_4;
    }
    -[CATransformLayer setHidden:](self->_maskPerspectiveTransformLayer, "setHidden:", 0);
    maskPerspectiveTransformLayer = self->_maskPerspectiveTransformLayer;
    goto LABEL_9;
  }
  if (!self->_singleLayerNoMask)
  {
    self->_singleLayerNoMask = 1;
LABEL_4:
    -[CATransformLayer setHidden:](self->_maskPerspectiveTransformLayer, "setHidden:", 1);
    maskPerspectiveTransformLayer = 0;
LABEL_9:
    -[CALayer setMask:](self->_imageLayersContainer, "setMask:", maskPerspectiveTransformLayer);
  }
}

- (BOOL)_configuredForNonOpaqueShadow
{
  return self->_nonOpaqueShadow;
}

- (void)_updateNonOpaqueShadowStateFromLayerStack
{
  void *v3;
  uint64_t v4;
  CGImage *v5;
  CGImage *v6;
  CGImageAlphaInfo AlphaInfo;
  CGImageAlphaInfo v8;
  CGBitmapInfo BitmapInfo;
  uint32_t BitsPerComponent;
  uint32_t BitsPerPixel;
  vImagePixelCount Width;
  vImagePixelCount Height;
  vImage_Error v14;
  void *v15;
  void *v16;
  void *v17;
  CALayer *maskLayer;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  CALayer *v24;
  double v25;
  CALayer *specularLayer;
  unsigned int v27;
  vImage_Buffer *v28;
  vImage_Buffer *v29;
  vImage_Buffer *v30;
  vImage_Buffer *v31;
  vImage_Error v32;
  vImage_Buffer *p_destR;
  vImage_Buffer *p_destG;
  vImage_Buffer *p_destB;
  vImage_Buffer *p_destA;
  uint64_t v37;
  vImagePixelCount v38;
  _BYTE v40[128];
  _BYTE v41[128];
  vImage_CGImageFormat format;
  vImage_Buffer destB;
  vImage_Buffer destG;
  vImage_Buffer destR;
  vImage_Buffer destA;
  vImage_Buffer buf;
  vImagePixelCount histogram[2];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (-[_UIStackedImageConfiguration allowsNonOpaqueShadow](self->_configuration, "allowsNonOpaqueShadow"))
  {
    -[UINamedLayerStack layers](self->_layerStack, "layers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 == 1)
    {
      if (-[_UIStackedImageContainerLayer _aspectMatchesLayerStack](self, "_aspectMatchesLayerStack"))
      {
        v5 = (CGImage *)-[UINamedLayerStack flattenedImage](self->_layerStack, "flattenedImage");
        v6 = v5;
        if (!v5)
          goto LABEL_13;
        AlphaInfo = CGImageGetAlphaInfo(v5);
        if (AlphaInfo - 1 <= 3)
        {
          v8 = AlphaInfo;
          memset(&buf, 0, sizeof(buf));
          memset(&destA, 0, sizeof(destA));
          memset(&destR, 0, sizeof(destR));
          memset(&destG, 0, sizeof(destG));
          memset(&destB, 0, sizeof(destB));
          BitmapInfo = CGImageGetBitmapInfo(v6);
          BitsPerComponent = CGImageGetBitsPerComponent(v6);
          BitsPerPixel = CGImageGetBitsPerPixel(v6);
          Width = CGImageGetWidth(v6);
          Height = CGImageGetHeight(v6);
          *((_DWORD *)&format.renderingIntent + 1) = 0;
          format.bitsPerComponent = BitsPerComponent;
          format.bitsPerPixel = BitsPerPixel;
          format.colorSpace = CGImageGetColorSpace(v6);
          format.bitmapInfo = BitmapInfo;
          format.version = 0;
          format.decode = CGImageGetDecode(v6);
          format.renderingIntent = CGImageGetRenderingIntent(v6);
          v14 = vImageBuffer_InitWithCGImage(&buf, &format, 0, v6, 0);
          LODWORD(v6) = 0;
          if (v14
            || (LODWORD(v6) = 0, vImageBuffer_Init(&destA, Height, Width, BitsPerPixel, 0))
            || (LODWORD(v6) = 0, vImageBuffer_Init(&destR, Height, Width, BitsPerPixel, 0))
            || (LODWORD(v6) = 0, vImageBuffer_Init(&destG, Height, Width, BitsPerPixel, 0))
            || (LODWORD(v6) = 0, vImageBuffer_Init(&destB, Height, Width, BitsPerPixel, 0)))
          {
LABEL_11:
            free(buf.data);
            free(destA.data);
            free(destR.data);
            free(destG.data);
            free(destB.data);
            goto LABEL_13;
          }
          v27 = v8 & 0xFFFFFFFD;
          if ((BitmapInfo & 0x100) != 0)
          {
            if (v27 == 1)
            {
              p_destR = &destR;
              p_destG = &destG;
              p_destB = &destB;
              p_destA = &destA;
            }
            else
            {
              p_destR = &destA;
              p_destG = &destR;
              p_destB = &destG;
              p_destA = &destB;
            }
            LODWORD(v6) = 0;
            if (vImageConvert_ARGBFFFFtoPlanarF(&buf, p_destR, p_destG, p_destB, p_destA, 0))
              goto LABEL_11;
            v32 = vImageHistogramCalculation_PlanarF(&destA, histogram, 0x100u, 0.0, 1.0, 0);
          }
          else
          {
            if (v27 == 1)
            {
              v28 = &destR;
              v29 = &destG;
              v30 = &destB;
              v31 = &destA;
            }
            else
            {
              v28 = &destA;
              v29 = &destR;
              v30 = &destG;
              v31 = &destB;
            }
            LODWORD(v6) = 0;
            if (vImageConvert_ARGB8888toPlanar8(&buf, v28, v29, v30, v31, 0))
              goto LABEL_11;
            v32 = vImageHistogramCalculation_Planar8(&destA, histogram, 0);
          }
          LODWORD(v6) = 0;
          if (!v32)
          {
            v37 = 0;
            do
            {
              v38 = histogram[v37];
              LODWORD(v6) = v38 != 0;
              if (v38)
                break;
            }
            while (v37++ != 254);
          }
          goto LABEL_11;
        }
      }
    }
  }
  LODWORD(v6) = 0;
LABEL_13:
  if (self->_nonOpaqueShadow != (_DWORD)v6)
  {
    self->_nonOpaqueShadow = (char)v6;
    if ((_DWORD)v6)
    {
      -[NSArray firstObject](self->_imageLayers, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setHidden:](self->_shadowLayer, "setHidden:", 1);
      -[CALayer setHidden:](self->_unfocusedShadowLayer, "setHidden:", 1);
      -[CALayer setMask:](self->_imageLayersContainer, "setMask:", 0);
      objc_msgSend(v15, "contents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setContents:](self->_maskLayer, "setContents:", v16);

      objc_msgSend(v15, "contentsGravity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setContentsGravity:](self->_maskLayer, "setContentsGravity:", v17);

      -[CALayer setBackgroundColor:](self->_maskLayer, "setBackgroundColor:", 0);
      maskLayer = self->_maskLayer;
      v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v52 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v53 = v19;
      v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v54 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v55 = v20;
      v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)histogram = *MEMORY[0x1E0CD2610];
      v49 = v21;
      v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v51 = v22;
      -[CALayer setTransform:](maskLayer, "setTransform:", histogram);
      -[CALayer setMask:](self->_specularLayer, "setMask:", self->_maskPerspectiveTransformLayer);
      -[CALayer setMasksToBounds:](self->_flatLayer, "setMasksToBounds:", 0);

    }
    else
    {
      -[CALayer setHidden:](self->_shadowLayer, "setHidden:", 0);
      -[CALayer setHidden:](self->_unfocusedShadowLayer, "setHidden:", 0);
      -[CALayer setMask:](self->_imageLayersContainer, "setMask:", self->_maskPerspectiveTransformLayer);
      -[CALayer setMask:](self->_specularLayer, "setMask:", 0);
      -[CALayer setContents:](self->_maskLayer, "setContents:", 0);
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](self->_maskLayer, "setBackgroundColor:", objc_msgSend(v23, "CGColor"));

      v24 = self->_maskLayer;
      -[_UIStackedImageContainerLayer _scaleTransformForCurrentState](self, "_scaleTransformForCurrentState");
      -[CALayer setTransform:](v24, "setTransform:", v41);
      LODWORD(v25) = 0;
      -[CALayer setShadowOpacity:](self->_flatLayer, "setShadowOpacity:", v25);
      -[CALayer setMasksToBounds:](self->_flatLayer, "setMasksToBounds:", 1);
    }
    specularLayer = self->_specularLayer;
    -[_UIStackedImageContainerLayer _specularTransformForCurrentState](self, "_specularTransformForCurrentState");
    -[CALayer setTransform:](specularLayer, "setTransform:", v40);
    -[_UIStackedImageContainerLayer _updateShadowWithAnimationCoordinator:](self, "_updateShadowWithAnimationCoordinator:", 0);
  }
}

- (void)_updateRadiosityFromLayerStack
{
  _BOOL4 v3;
  CALayer *radiosityLayer;
  CALayer *v5;
  CALayer *v6;
  CALayer *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CALayer *v18;
  double v19;
  CALayer *v20;
  CALayer *v21;
  CALayer *v22;
  CGSize *p_radiosityImageScale;
  void *v24;
  double width;
  CGFloat v26;
  void *v27;
  void *v28;
  double Current;
  void *v30;
  uint64_t v31;
  _QWORD v32[6];
  CGRect v33;
  CGRect v34;

  v3 = -[_UIStackedImageContainerLayer _radiosityEnabled](self, "_radiosityEnabled");
  radiosityLayer = self->_radiosityLayer;
  if (v3)
  {
    if (!radiosityLayer)
    {
      v5 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v6 = self->_radiosityLayer;
      self->_radiosityLayer = v5;

      -[CALayer setAnchorPoint:](self->_radiosityLayer, "setAnchorPoint:", 0.5, 0.5);
      -[CALayer setZPosition:](self->_radiosityLayer, "setZPosition:", -50.0);
      v7 = self->_radiosityLayer;
      -[_UIStackedImageContainerLayer bounds](self, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[_UIStackedImageConfiguration radiosityOffset](self->_configuration, "radiosityOffset");
      v17 = v16;
      v33.origin.x = v9;
      v33.origin.y = v11;
      v33.size.width = v13;
      v33.size.height = v15;
      v34 = CGRectOffset(v33, 0.0, v17);
      -[CALayer setFrame:](v7, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
      -[CALayer setAllowsGroupOpacity:](self->_radiosityLayer, "setAllowsGroupOpacity:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](self->_radiosityLayer, "setAllowsEdgeAntialiasing:", 0);
      v18 = self->_radiosityLayer;
      -[_UIStackedImageConfiguration radiosityStrength](self->_configuration, "radiosityStrength");
      *(float *)&v19 = v19;
      -[CALayer setOpacity:](v18, "setOpacity:", v19);
      -[CALayer setDelegate:](self->_radiosityLayer, "setDelegate:", self);
      v20 = self->_radiosityLayer;
      -[_UIStackedImageContainerLayer contentsScale](self, "contentsScale");
      -[CALayer setContentsScale:](v20, "setContentsScale:");
      v21 = self->_radiosityLayer;
      -[_UIStackedImageContainerLayer contentsScale](self, "contentsScale");
      -[CALayer setRasterizationScale:](v21, "setRasterizationScale:");
      -[_UIStackedImageContainerLayer insertSublayer:above:](self, "insertSublayer:above:", self->_radiosityLayer, self->_shadowLayer);
    }
  }
  else
  {
    -[CALayer removeFromSuperlayer](radiosityLayer, "removeFromSuperlayer");
    v22 = self->_radiosityLayer;
    self->_radiosityLayer = 0;

  }
  if (-[_UIStackedImageContainerLayer _radiosityEnabled](self, "_radiosityEnabled")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    p_radiosityImageScale = &self->_radiosityImageScale;
    self->_radiosityImageScale = (CGSize)*MEMORY[0x1E0C9D820];
    -[UINamedLayerStack radiosityImage](self->_layerStack, "radiosityImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setContents:](self->_radiosityLayer, "setContents:", v24);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UINamedLayerStack radiosityImageScale](self->_layerStack, "radiosityImageScale");
      p_radiosityImageScale->width = width;
      self->_radiosityImageScale.height = v26;
    }
    else
    {
      width = p_radiosityImageScale->width;
    }
    if (width == 0.0 || self->_radiosityImageScale.height == 0.0)
      *p_radiosityImageScale = (CGSize)xmmword_186685950;
    -[_UIStackedImageContainerLayer _layoutRadiosityLayer](self, "_layoutRadiosityLayer");
  }
  else
  {
    -[CALayer contents](self->_radiosityLayer, "contents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[CALayer setContents:](self->_radiosityLayer, "setContents:", 0);
      self->_radiosityImageScale = (CGSize)*MEMORY[0x1E0C9D820];
    }
  }
  if (-[_UIStackedImageContainerLayer _radiosityEnabled](self, "_radiosityEnabled"))
  {
    -[CALayer contents](self->_radiosityLayer, "contents");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {

    }
    else if (-[UINamedLayerStack flattenedImage](self->_layerStack, "flattenedImage"))
    {
      Current = CFAbsoluteTimeGetCurrent();
      self->_radiosityRequestTime = Current;
      +[_UIRadiosityImageGenerator sharedInstance](_UIRadiosityImageGenerator, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[UINamedLayerStack flattenedImage](self->_layerStack, "flattenedImage");
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __63___UIStackedImageContainerLayer__updateRadiosityFromLayerStack__block_invoke;
      v32[3] = &unk_1E16EC538;
      *(double *)&v32[5] = Current;
      v32[4] = self;
      objc_msgSend(v30, "imageWithImage:completionHandler:", v31, v32);

    }
  }
}

- (void)setControlState:(unint64_t)a3
{
  -[_UIStackedImageContainerLayer setControlState:animated:](self, "setControlState:animated:", a3, 0);
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer _setControlState:animated:focusAnimationCoordinator:completion:](self, "_setControlState:animated:focusAnimationCoordinator:completion:", a3, a4, 0, 0);
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  -[_UIStackedImageContainerLayer _setControlState:animated:focusAnimationCoordinator:completion:](self, "_setControlState:animated:focusAnimationCoordinator:completion:", a3, a4, a5, 0);
}

- (void)_setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t controlState;
  unint64_t v16;
  _BOOL4 v17;
  int *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const void *v40;
  void (**v41)(_QWORD);
  void *layerStackInflationSeed;
  void (**v43)(_QWORD);
  void *v44;
  _UIStackedImageConfiguration *configuration;
  void *v46;
  _BOOL4 v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  unsigned int v53;
  id v54;
  _QWORD v55[5];
  id v56[2];
  id location;
  _QWORD v58[5];
  _QWORD aBlock[5];
  _QWORD v60[4];
  id v61;
  _QWORD v62[3];
  CGRect v63;

  v7 = a4;
  v62[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = -[_UIStackedImageContainerLayer _primaryControlStateForState:](self, "_primaryControlStateForState:", a3);
  if (self->_controlState == a3)
    goto LABEL_57;
  v13 = v12;
  v14 = -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
  controlState = self->_controlState;
  v16 = a3 & 0x10008;
  if ((a3 & 0x10008) == 0)
    a3 &= ~1uLL;
  if (v14 || v13 == 1)
  {
    v54 = v11;
    self->_controlState = a3;
    v17 = -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
    -[_UIStackedImageContainerLayer bounds](self, "bounds");
    if (CGRectIsEmpty(v63))
    {
      self->_scale = 1.0;
    }
    else
    {
      -[_UIStackedImageContainerLayer _roundedBoundsSize](self, "_roundedBoundsSize");
      v22 = v21;
      v24 = v23;
      -[_UIStackedImageConfiguration scaleSizeIncrease](self->_configuration, "scaleSizeIncrease");
      objc_msgSend((id)objc_opt_class(), "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", self->_selectionStyle, v22, v24, v25);
      -[_UIStackedImageContainerLayer _focusCursorInsetSizeForSize:](self, "_focusCursorInsetSizeForSize:");
      v27 = v26 / v22;
      v29 = v28 / v24;
      if (v27 < v29)
        v27 = v29;
      self->_scale = v27;
      if (v17)
      {
        -[_UIStackedImageConfiguration pressedScaleAdjustment](self->_configuration, "pressedScaleAdjustment");
        v30 = (void *)objc_opt_class();
        -[_UIStackedImageContainerLayer _roundedBoundsSize](self, "_roundedBoundsSize");
        objc_msgSend(v30, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", self->_selectionStyle);
        -[_UIStackedImageContainerLayer _focusCursorInsetSizeForSize:](self, "_focusCursorInsetSizeForSize:");
        v32 = v31 / v22;
        v34 = v33 / v24;
        if (v32 < v34)
          v32 = v34;
        self->_scale = v32;
        if (self->_selectionStyle == 1
          && !-[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth"))
        {
          -[_UIStackedImageConfiguration fullBleedOffset](self->_configuration, "fullBleedOffset");
          self->_scale = v35 * -0.25 / v24 + 1.0;
        }
      }
      else if (!v13)
      {
        self->_scale = 1.0;
      }
    }
    self->_focusDirection = (CGPoint)*MEMORY[0x1E0C9D538];
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v44 = (void *)MEMORY[0x1E0CD28B0];
    configuration = self->_configuration;
    if (v17)
      -[_UIStackedImageConfiguration pressedDuration](configuration, "pressedDuration");
    else
      -[_UIStackedImageConfiguration unpressedDuration](configuration, "unpressedDuration");
    objc_msgSend(v44, "setAnimationDuration:");
    v46 = (void *)MEMORY[0x1E0CD28B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke;
    v60[3] = &unk_1E16B1BF8;
    v61 = v11;
    objc_msgSend(v46, "setCompletionBlock:", v60);
    if ((v16 != 0) == ((controlState & 0x10008) != 0))
      -[_UIStackedImageContainerLayer _applyFocusDirectionTransform](self, "_applyFocusDirectionTransform");
    else
      -[_UIStackedImageContainerLayer _updateLayerForSelection](self, "_updateLayerForSelection");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    goto LABEL_56;
  }
  if (v13 > 7)
  {
    if (v13 != 0x10000 && v13 != 8)
      goto LABEL_57;
LABEL_14:
    v54 = v11;
    if (!v10)
    {
      v47 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
      if (!v13 && v47 && v7)
      {
        v48 = CACurrentMediaTime() - self->_selectionStartTime;
        -[_UIStackedImageConfiguration minimumFocusDuration](self->_configuration, "minimumFocusDuration");
        if (v48 < v49)
        {
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__deselect, 0);
          -[_UIStackedImageConfiguration minimumFocusDuration](self->_configuration, "minimumFocusDuration");
          v51 = v50;
          v62[0] = *MEMORY[0x1E0C99860];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIStackedImageContainerLayer performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__deselect, 0, v52, v51 - v48);

LABEL_56:
          v11 = v54;
          goto LABEL_57;
        }
      }
      else if (v13 == 0x10000 || v13 == 8)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__deselect, 0);
      }
    }
    self->_controlState = a3;
    if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
    {
      -[_UIStackedImageContainerLayer _showImageLayers](self, "_showImageLayers");
      -[_UIStackedImageContainerLayer _focusedScaleFactorForCurrentBounds](self, "_focusedScaleFactorForCurrentBounds");
      v18 = &OBJC_IVAR____UIStackedImageContainerLayer__selectionStartTime;
      self->_scale = v19;
      v20 = CACurrentMediaTime();
    }
    else
    {
      v36 = -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected");
      v20 = 1.13;
      if (!v36)
        v20 = 1.0;
      v18 = &OBJC_IVAR____UIStackedImageContainerLayer__scale;
    }
    *(double *)((char *)&self->super.super.isa + *v18) = v20;
    self->_animatingStateChange = 1;
    if (!v13)
      self->_animatingToNormalState = 1;
    v53 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[_UIStackedImageContainerLayer _updateImageLayerFilterChains](self, "_updateImageLayerFilterChains");
    v37 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_2;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v38 = _Block_copy(aBlock);
    v58[0] = v37;
    v58[1] = 3221225472;
    v58[2] = __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_3;
    v58[3] = &unk_1E16B1B28;
    v58[4] = self;
    v39 = _Block_copy(v58);
    if (-[_UIStackedImageContainerLayer _isNormal](self, "_isNormal"))
      v40 = v38;
    else
      v40 = v39;
    v41 = (void (**)(_QWORD))_Block_copy(v40);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", !v7);
    if (v10 != 0 && v7)
    {
      objc_initWeak(&location, v10);
      layerStackInflationSeed = (void *)self->_layerStackInflationSeed;
      v55[0] = v37;
      v55[1] = 3221225472;
      v55[2] = __96___UIStackedImageContainerLayer__setControlState_animated_focusAnimationCoordinator_completion___block_invoke_4;
      v55[3] = &unk_1E16EC560;
      v55[4] = self;
      v56[1] = layerStackInflationSeed;
      objc_copyWeak(v56, &location);
      v43 = (void (**)(_QWORD))_Block_copy(v55);
      if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
      {
        objc_msgSend(v10, "addCoordinatedAnimations:completion:", v43, v41);
      }
      else
      {
        v43[2](v43);
        v41[2](v41);
      }

      objc_destroyWeak(v56);
      objc_destroyWeak(&location);
    }
    else
    {
      if (self->_layerStackSupportsInflation)
        -[_UIStackedImageContainerLayer _setLayerStackInflated:seed:](self, "_setLayerStackInflated:seed:", 1, self->_layerStackInflationSeed);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v41);
      -[_UIStackedImageContainerLayer _updateLayerForSelection](self, "_updateLayerForSelection");
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v53);

    goto LABEL_56;
  }
  if (!v13)
    goto LABEL_14;
  if (v13 == 4)
  {
    self->_controlState = a3;
    -[_UIStackedImageContainerLayer _showImageLayers](self, "_showImageLayers");
    -[_UIStackedImageContainerLayer _updateLayerForSelection](self, "_updateLayerForSelection");
  }
LABEL_57:

}

- (BOOL)isPressed
{
  return -[_UIStackedImageContainerLayer controlState](self, "controlState") & 1;
}

- (void)setPressed:(BOOL)a3
{
  -[_UIStackedImageContainerLayer setPressed:animated:](self, "setPressed:animated:", a3, 0);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer setPressed:animated:completion:](self, "setPressed:animated:completion:", a3, a4, 0);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[_UIStackedImageContainerLayer _setControlState:animated:focusAnimationCoordinator:completion:](self, "_setControlState:animated:focusAnimationCoordinator:completion:", self->_controlState & 0xFFFFFFFFFFFFFFFELL | a3, a4, 0, a5);
}

- (BOOL)isSelected
{
  return (-[_UIStackedImageContainerLayer controlState](self, "controlState") >> 3) & 1;
}

- (void)setSelected:(BOOL)a3
{
  -[_UIStackedImageContainerLayer setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer setSelected:animated:focusAnimationCoordinator:](self, "setSelected:animated:focusAnimationCoordinator:", a3, a4, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  unint64_t controlState;
  uint64_t v6;

  controlState = self->_controlState;
  if (a3)
  {
    v6 = 8;
  }
  else
  {
    v6 = 0;
    controlState &= ~0x10000uLL;
    self->_controlState = controlState;
  }
  -[_UIStackedImageContainerLayer setControlState:animated:focusAnimationCoordinator:](self, "setControlState:animated:focusAnimationCoordinator:", controlState & 0xFFFFFFFFFFFFFFF7 | v6, a4, a5);
}

- (void)setFocusDirection:(CGPoint)a3
{
  -[_UIStackedImageContainerLayer _setFocusDirection:duration:](self, "_setFocusDirection:duration:", a3.x, a3.y, 0.0);
}

- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer _setFocusDirection:duration:](self, "_setFocusDirection:duration:", a4, a3.x, a3.y, 0.1);
}

+ (CGSize)_scaledSizeForSize:(CGSize)result focusSizeIncrease:(double)a4 selectionStyle:(int64_t)a5
{
  double v5;
  BOOL v6;
  double v7;

  if (a4 != 0.0)
  {
    if (a5 == 1)
    {
      result.height = result.height + a4;
    }
    else
    {
      v5 = fabs(result.width);
      v6 = fabs(result.height) < 2.22044605e-16 || v5 < 2.22044605e-16;
      v7 = result.width / result.height;
      if (v6)
        v7 = 1.0;
      if (result.width <= result.height)
      {
        result.height = result.height + a4;
        result.width = ceil(result.height * v7);
      }
      else
      {
        result.width = result.width + a4;
        result.height = ceil(result.width / v7);
      }
    }
  }
  return result;
}

- (CGSize)_focusCursorInsetSizeForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIStackedImageConfiguration focusCursorBorderWidth](self->_configuration, "focusCursorBorderWidth");
  v7 = v6;
  if (-[_UIStackedImageConfiguration focusCursorEnabled](self->_configuration, "focusCursorEnabled"))
  {
    v8 = fabs(width);
    if (fabs(height) < 2.22044605e-16 || v8 < 2.22044605e-16)
    {
      width = *MEMORY[0x1E0C9D820];
      height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      v10 = fmin(v7 * 4.0, fmin(width, height));
      if (width <= height)
      {
        v12 = height * v10 / width;
        width = width - v10;
        height = height - v12;
      }
      else
      {
        v11 = width * v10 / height;
        height = height - v10;
        width = width - v11;
      }
    }
  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)_scaledSizeForCurrentState
{
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[_UIStackedImageConfiguration scaleSizeIncrease](self->_configuration, "scaleSizeIncrease");
  v4 = v3;
  v5 = -[_UIStackedImageContainerLayer _isFocusedIdle](self, "_isFocusedIdle");
  v6 = 0.0;
  if (v5)
    -[_UIStackedImageContainerLayer _idleModeFocusSizeOffset](self, "_idleModeFocusSizeOffset", 0.0);
  v7 = v4 + v6;
  -[_UIStackedImageContainerLayer _roundedBoundsSize](self, "_roundedBoundsSize");
  objc_msgSend((id)objc_opt_class(), "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", self->_selectionStyle, v8, v9, v7);
  -[_UIStackedImageContainerLayer _focusCursorInsetSizeForSize:](self, "_focusCursorInsetSizeForSize:");
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_roundedBoundsSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v3 = round(v2);
  v5 = round(v4);
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)_imageLayersContainer
{
  return self->_imageLayersContainer;
}

- (id)_layerBelowTitles
{
  CALayer *radiosityLayer;

  radiosityLayer = self->_radiosityLayer;
  if (!radiosityLayer)
    radiosityLayer = self->_shadowLayer;
  return radiosityLayer;
}

- (id)_flatLayer
{
  return self->_flatLayer;
}

- (id)_shadowLayer
{
  return self->_shadowLayer;
}

- (int64_t)_selectionStyle
{
  return self->_selectionStyle;
}

- (void)_setSelectionStyle:(int64_t)a3
{
  self->_selectionStyle = a3;
  if (a3 == 1)
  {
    -[_UIStackedImageConfiguration setTranslationOffset:](self->_configuration, "setTranslationOffset:", 10.0, 0.0);
    -[_UIStackedImageConfiguration setRotationAmount:](self->_configuration, "setRotationAmount:", 0.0);
    -[_UIStackedImageConfiguration setSpecularOpacity:](self->_configuration, "setSpecularOpacity:", 0.0);
    -[_UIStackedImageConfiguration setBoostBrightness:](self->_configuration, "setBoostBrightness:", 0);
    -[_UIStackedImageConfiguration setRadiosityStrength:](self->_configuration, "setRadiosityStrength:", 0.0);
    -[_UIStackedImageConfiguration setScaleSizeIncrease:](self->_configuration, "setScaleSizeIncrease:", 0.0);
    -[_UIStackedImageContainerLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_imageStackContentsGravity
{
  return self->_imageStackContentsGravity;
}

- (void)_setImageStackContentsGravity:(id)a3
{
  id v5;
  NSString **p_imageStackContentsGravity;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_imageStackContentsGravity = &self->_imageStackContentsGravity;
  if ((-[NSString isEqual:](self->_imageStackContentsGravity, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageStackContentsGravity, a3);
    -[CALayer setContentsGravity:](self->_flatLayer, "setContentsGravity:", *p_imageStackContentsGravity);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_imageLayers;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setContentsGravity:", *p_imageStackContentsGravity, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (id)_overlayLayer
{
  return self->_overlayLayer;
}

- (void)_setOverlayLayer:(id)a3
{
  CALayer **p_overlayLayer;
  CALayer *overlayContainerLayer;
  void *v7;
  CALayer *v8;
  uint64_t v9;
  CALayer *v10;
  CALayer *v11;
  CALayer *v12;
  void *v13;
  int IsKindOfUIView;
  void *v15;
  int v16;
  void *v17;
  id v18;
  CALayer *v19;

  p_overlayLayer = &self->_overlayLayer;
  v19 = (CALayer *)a3;
  if (*p_overlayLayer != v19)
  {
    -[_UIStackedImageContainerLayer _removeLayerFromSuperlayer:](self, "_removeLayerFromSuperlayer:");
    -[_UIStackedImageContainerLayer _removeLayerFromSuperlayer:](self, "_removeLayerFromSuperlayer:", self->_overlayContainerLayer);
    overlayContainerLayer = self->_overlayContainerLayer;
    self->_overlayContainerLayer = 0;

    objc_storeStrong((id *)&self->_overlayLayer, a3);
    if (*p_overlayLayer)
    {
      -[CALayer delegate](*p_overlayLayer, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v7, "removeFromSuperview");
      v8 = *p_overlayLayer;
      -[_UIStackedImageContainerLayer bounds](self, "bounds");
      -[CALayer setFrame:](v8, "setFrame:");
      v9 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v11 = self->_overlayContainerLayer;
      self->_overlayContainerLayer = v10;

      v12 = self->_overlayContainerLayer;
      -[_UIStackedImageContainerLayer bounds](self, "bounds");
      -[CALayer setFrame:](v12, "setFrame:");
      -[CALayer addSublayer:](self->_overlayContainerLayer, "addSublayer:", *p_overlayLayer);
      -[CALayer setZPosition:](self->_overlayContainerLayer, "setZPosition:", 0.01);
      -[CALayer setDelegate:](self->_overlayContainerLayer, "setDelegate:", self);
      if (self->_animatingToNormalState
        || -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle")
        || -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected"))
      {
        -[CATransformLayer insertSublayer:below:](self->_imageRotationTransformLayer, "insertSublayer:below:", self->_overlayContainerLayer, self->_specularLayer);
      }
      else
      {
        -[CALayer addSublayer:](self->_flatLayer, "addSublayer:", self->_overlayContainerLayer);
      }
      CALayerGetDelegate();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      IsKindOfUIView = _IsKindOfUIView((uint64_t)v13);

      if (IsKindOfUIView)
      {
        CALayerGetDelegate();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = _IsKindOfUIView((uint64_t)v15);

        if (v16)
        {
          -[_UIStackedImageContainerLayer _wrapLayerInView:](self, "_wrapLayerInView:", self->_flatLayer);
          -[_UIStackedImageContainerLayer _wrapLayerInView:](self, "_wrapLayerInView:", self->_imageLayersContainer);
          -[_UIStackedImageContainerLayer _wrapLayerInView:](self, "_wrapLayerInView:", self->_imagePerspectiveTransformLayer);
          -[_UIStackedImageContainerLayer _wrapLayerInView:](self, "_wrapLayerInView:", self->_imageRotationTransformLayer);
          -[_UIStackedImageContainerLayer _wrapLayerInView:](self, "_wrapLayerInView:", self->_overlayContainerLayer);
          CALayerGetDelegate();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (_IsKindOfUIView((uint64_t)v17))
            v18 = v17;
          else
            v18 = 0;

          objc_msgSend(v18, "setAutoresizingMask:", 18);
          objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

        }
      }
      if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle")
        || -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected"))
      {
        -[_UIStackedImageContainerLayer _applyFocusDirectionTransformWithAnimationCoordinator:](self, "_applyFocusDirectionTransformWithAnimationCoordinator:", 0);
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v9);

    }
  }

}

- (id)_unmaskedOverlayLayer
{
  return self->_unmaskedOverlayLayer;
}

- (void)_setUnmaskedOverlayLayer:(id)a3
{
  CALayer **p_unmaskedOverlayLayer;
  CALayer *unmaskedOverlayContainerLayer;
  CATransformLayer *unmaskedOverlayRotationTransformLayer;
  CATransformLayer *unmaskedOverlayPerspectiveTransformLayer;
  void *v9;
  char isKindOfClass;
  void *v11;
  CALayer *v12;
  uint64_t v13;
  CATransformLayer *v14;
  CATransformLayer *v15;
  CATransformLayer *v16;
  CATransformLayer *v17;
  CATransformLayer *v18;
  CATransformLayer *v19;
  CALayer *v20;
  CALayer *v21;
  CALayer *v22;
  void *v23;
  void *v24;
  int IsKindOfUIView;
  CALayer *v26;

  p_unmaskedOverlayLayer = &self->_unmaskedOverlayLayer;
  v26 = (CALayer *)a3;
  if (*p_unmaskedOverlayLayer != v26)
  {
    -[_UIStackedImageContainerLayer _removeLayerFromSuperlayer:](self, "_removeLayerFromSuperlayer:");
    -[_UIStackedImageContainerLayer _removeLayerFromSuperlayer:](self, "_removeLayerFromSuperlayer:", self->_unmaskedOverlayContainerLayer);
    unmaskedOverlayContainerLayer = self->_unmaskedOverlayContainerLayer;
    self->_unmaskedOverlayContainerLayer = 0;

    -[_UIStackedImageContainerLayer _removeLayerFromSuperlayer:](self, "_removeLayerFromSuperlayer:", self->_unmaskedOverlayRotationTransformLayer);
    unmaskedOverlayRotationTransformLayer = self->_unmaskedOverlayRotationTransformLayer;
    self->_unmaskedOverlayRotationTransformLayer = 0;

    -[_UIStackedImageContainerLayer _removeLayerFromSuperlayer:](self, "_removeLayerFromSuperlayer:", self->_unmaskedOverlayPerspectiveTransformLayer);
    unmaskedOverlayPerspectiveTransformLayer = self->_unmaskedOverlayPerspectiveTransformLayer;
    self->_unmaskedOverlayPerspectiveTransformLayer = 0;

    objc_storeStrong((id *)&self->_unmaskedOverlayLayer, a3);
    if (*p_unmaskedOverlayLayer)
    {
      -[CALayer delegate](*p_unmaskedOverlayLayer, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[CALayer delegate](*p_unmaskedOverlayLayer, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");

      }
      v12 = *p_unmaskedOverlayLayer;
      -[_UIStackedImageContainerLayer bounds](self, "bounds");
      -[CALayer setFrame:](v12, "setFrame:");
      v13 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v14 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E0CD28C8]);
      v15 = self->_unmaskedOverlayPerspectiveTransformLayer;
      self->_unmaskedOverlayPerspectiveTransformLayer = v14;

      -[CATransformLayer setDelegate:](self->_unmaskedOverlayPerspectiveTransformLayer, "setDelegate:", self);
      -[CATransformLayer setAnchorPoint:](self->_unmaskedOverlayPerspectiveTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      v16 = self->_unmaskedOverlayPerspectiveTransformLayer;
      -[_UIStackedImageContainerLayer bounds](self, "bounds");
      -[CATransformLayer setFrame:](v16, "setFrame:");
      -[_UIStackedImageContainerLayer insertSublayer:above:](self, "insertSublayer:above:", self->_unmaskedOverlayPerspectiveTransformLayer, self->_imageLayersContainer);
      v17 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E0CD28C8]);
      v18 = self->_unmaskedOverlayRotationTransformLayer;
      self->_unmaskedOverlayRotationTransformLayer = v17;

      -[CATransformLayer setDelegate:](self->_unmaskedOverlayRotationTransformLayer, "setDelegate:", self);
      -[CATransformLayer setAnchorPoint:](self->_unmaskedOverlayRotationTransformLayer, "setAnchorPoint:", 0.5, 0.5);
      v19 = self->_unmaskedOverlayRotationTransformLayer;
      -[_UIStackedImageContainerLayer bounds](self, "bounds");
      -[CATransformLayer setFrame:](v19, "setFrame:");
      -[CATransformLayer addSublayer:](self->_unmaskedOverlayPerspectiveTransformLayer, "addSublayer:", self->_unmaskedOverlayRotationTransformLayer);
      v20 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
      v21 = self->_unmaskedOverlayContainerLayer;
      self->_unmaskedOverlayContainerLayer = v20;

      v22 = self->_unmaskedOverlayContainerLayer;
      -[_UIStackedImageContainerLayer bounds](self, "bounds");
      -[CALayer setFrame:](v22, "setFrame:");
      -[CALayer setZPosition:](self->_unmaskedOverlayContainerLayer, "setZPosition:", 0.011);
      -[CALayer setDelegate:](self->_unmaskedOverlayContainerLayer, "setDelegate:", self);
      -[CATransformLayer addSublayer:](self->_unmaskedOverlayRotationTransformLayer, "addSublayer:", self->_unmaskedOverlayContainerLayer);
      -[CALayer addSublayer:](self->_unmaskedOverlayContainerLayer, "addSublayer:", *p_unmaskedOverlayLayer);
      CALayerGetDelegate();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = _IsKindOfUIView((uint64_t)v23);

      if ((_DWORD)v22)
      {
        CALayerGetDelegate();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        IsKindOfUIView = _IsKindOfUIView((uint64_t)v24);

        if (IsKindOfUIView)
        {
          -[_UIStackedImageContainerLayer _wrapLayerInView:](self, "_wrapLayerInView:", self->_unmaskedOverlayPerspectiveTransformLayer);
          -[_UIStackedImageContainerLayer _wrapLayerInView:](self, "_wrapLayerInView:", self->_unmaskedOverlayRotationTransformLayer);
          -[_UIStackedImageContainerLayer _wrapLayerInView:](self, "_wrapLayerInView:", self->_unmaskedOverlayContainerLayer);
        }
      }
      if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle")
        || -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected"))
      {
        -[_UIStackedImageContainerLayer _applyFocusDirectionTransformWithAnimationCoordinator:](self, "_applyFocusDirectionTransformWithAnimationCoordinator:", 0);
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v13);
    }
  }

}

- (void)_removeLayerFromSuperlayer:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  CALayerGetDelegate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_IsKindOfUIView((uint64_t)v3) & 1) == 0)
  {

    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    objc_msgSend(v4, "removeFromSuperlayer");
    goto LABEL_6;
  }
  objc_msgSend(v3, "removeFromSuperview");

LABEL_6:
}

- (void)_wrapLayerInView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int IsKindOfUIView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_IsKindOfUIView((uint64_t)v6) & 1) == 0)
  {
    objc_msgSend(v5, "superlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CALayerGetDelegate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_IsKindOfUIView((uint64_t)v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStackedImageContainerLayer.m"), 1958, CFSTR("called _wrapLayerInView: on a layer whose superlayer is not in a view"));

    }
    v25 = v7;
    objc_msgSend(v7, "sublayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", v5);

    v11 = -[UIView _initWithLayer:]([_UIStackedImageLayerWrappingView alloc], "_initWithLayer:", v5);
    objc_msgSend(v11, "setActionDelegate:", v6);
    v24 = v8;
    objc_msgSend(v8, "insertSubview:atIndex:", v11, v10);
    objc_msgSend(v5, "sublayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v19, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          IsKindOfUIView = _IsKindOfUIView((uint64_t)v20);

          if (IsKindOfUIView)
          {
            objc_msgSend(v19, "removeFromSuperlayer");
            CALayerGetDelegate();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "insertSubview:atIndex:", v22, objc_msgSend(v14, "indexOfObject:", v19));

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

  }
}

- (id)_parallaxLayerDepths
{
  return self->_parallaxLayerDepths;
}

- (void)_setParallaxLayerDepths:(id)a3
{
  NSArray *v4;
  NSArray *parallaxLayerDepths;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_parallaxLayerDepths, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    parallaxLayerDepths = self->_parallaxLayerDepths;
    self->_parallaxLayerDepths = v4;

    -[_UIStackedImageContainerLayer _applyFocusDirectionTransform](self, "_applyFocusDirectionTransform");
  }

}

- (void)_setDefaultParallaxLayerDepths
{
  double maximumParallaxDepth;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  unint64_t v7;
  double v8;
  void *v9;
  NSArray *v10;
  NSArray *parallaxLayerDepths;
  id v12;

  maximumParallaxDepth = self->_maximumParallaxDepth;
  v4 = -[NSArray count](self->_parallaxImages, "count");
  if (v4 < 2)
  {
    v12 = &unk_1E1A95468;
  }
  else
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    v7 = 0;
    v8 = maximumParallaxDepth / (double)(v5 - 1);
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 * (double)v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      ++v7;
    }
    while (v5 != v7);
    v12 = (id)objc_msgSend(v6, "copy");

  }
  v10 = (NSArray *)objc_msgSend(v12, "copy");
  parallaxLayerDepths = self->_parallaxLayerDepths;
  self->_parallaxLayerDepths = v10;

}

- (CGImage)_cgImageForLayeredImage:(id)a3
{
  id v3;
  CGImage *v4;

  objc_msgSend(a3, "imageObj");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGImage *)objc_msgSend(v3, "CGImage");

  return v4;
}

- (void)_setLayerStackInflated:(BOOL)a3 seed:(unint64_t)a4
{
  UINamedLayerStack *layerStack;
  void *v7;
  NSArray *v8;
  NSArray *parallaxImages;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MidX;
  CGImage *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  NSArray *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;

  v45 = *MEMORY[0x1E0C80C00];
  if (self->_layerStackSupportsInflation)
  {
    if (a3)
      self->_deferredInflationPending = 0;
    if (self->_layerStackInflationSeed == a4 && self->_layerStackInflated != a3)
    {
      self->_layerStackInflated = a3;
      layerStack = self->_layerStack;
      if (a3)
        -[UINamedLayerStack _inflateLayerStack](layerStack, "_inflateLayerStack");
      else
        -[UINamedLayerStack _deflateLayerStack](layerStack, "_deflateLayerStack");
      -[UINamedLayerStack layers](self->_layerStack, "layers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSArray *)objc_msgSend(v7, "copy");
      parallaxImages = self->_parallaxImages;
      self->_parallaxImages = v8;

      v10 = -[NSArray count](self->_parallaxImages, "count");
      if (v10 != -[NSArray count](self->_imageLayers, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStackedImageContainerLayer.m"), 2064, CFSTR("The number of stack layers changed after inflation / deflation. Please keep the layer count the same and use NULL images for deflated layers"));

      }
      v37 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = self->_parallaxImages;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v41 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (objc_msgSend(v16, "contentProvider"), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v18 = (void *)v17;
              -[NSArray objectAtIndexedSubscript:](self->_imageLayers, "objectAtIndexedSubscript:", v13 + i);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "sublayers");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

              objc_msgSend(v18, "contentLayer");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v19, "bounds");
                v23 = v22;
                v25 = v24;
                v27 = v26;
                v29 = v28;
                objc_msgSend(v21, "setBounds:");
                v46.origin.x = v23;
                v46.origin.y = v25;
                v46.size.width = v27;
                v46.size.height = v29;
                MidX = CGRectGetMidX(v46);
                v47.origin.x = v23;
                v47.origin.y = v25;
                v47.size.width = v27;
                v47.size.height = v29;
                objc_msgSend(v21, "setPosition:", MidX, CGRectGetMidY(v47));
                objc_msgSend(v19, "addSublayer:", v21);
              }

            }
            else
            {
              v31 = -[_UIStackedImageContainerLayer _cgImageForLayeredImage:](self, "_cgImageForLayeredImage:", v16);
              -[NSArray objectAtIndexedSubscript:](self->_imageLayers, "objectAtIndexedSubscript:", v13 + i);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setContents:", v31);
            }

          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          v13 += i;
        }
        while (v12);
      }

      if (!a3)
      {
        -[NSArray firstObject](self->_imageLayers, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "contents");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          -[CALayer contents](self->_flatLayer, "contents");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray firstObject](self->_imageLayers, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setContents:", v34);

        }
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v37);
    }
  }
}

- (id)_contentLayers
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_flatLayer)
    objc_msgSend(v3, "addObject:");
  if (self->_radiosityLayer)
    objc_msgSend(v4, "addObject:");
  if (self->_selectedPlaceholderLayer)
    objc_msgSend(v4, "addObject:");
  if (self->_specularLayer)
    objc_msgSend(v4, "addObject:");
  if (self->_imageLayers)
    objc_msgSend(v4, "addObjectsFromArray:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)_updateSpecularLayerContents
{
  double v3;
  uint64_t *v4;
  dispatch_once_t *v5;
  void *v6;

  -[_UIStackedImageContainerLayer contentsScale](self, "contentsScale");
  if (v3 >= 2.0)
  {
    if (qword_1ECD7B7F8 == -1)
    {
      v4 = &qword_1ECD7B7F0;
      goto LABEL_6;
    }
    v4 = &qword_1ECD7B7F0;
    v5 = &qword_1ECD7B7F8;
    v6 = &__block_literal_global_208;
LABEL_9:
    dispatch_once(v5, v6);
    goto LABEL_6;
  }
  if (qword_1ECD7B7E8 != -1)
  {
    v4 = &qword_1ECD7B7E0;
    v5 = &qword_1ECD7B7E8;
    v6 = &__block_literal_global_201;
    goto LABEL_9;
  }
  v4 = &qword_1ECD7B7E0;
LABEL_6:
  -[CALayer setContents:](self->_specularLayer, "setContents:", *v4);
}

- (double)_focusedScaleFactorForCurrentBounds
{
  BOOL IsEmpty;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;

  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  IsEmpty = CGRectIsEmpty(v12);
  result = 1.0;
  if (!IsEmpty)
  {
    -[_UIStackedImageContainerLayer _roundedBoundsSize](self, "_roundedBoundsSize", 1.0);
    v6 = v5;
    v8 = v7;
    -[_UIStackedImageContainerLayer _scaledSizeForCurrentState](self, "_scaledSizeForCurrentState");
    result = v9 / v6;
    v11 = v10 / v8;
    if (result < v11)
      return v11;
  }
  return result;
}

- (BOOL)_radiosityEnabled
{
  double v2;

  -[_UIStackedImageConfiguration radiosityStrength](self->_configuration, "radiosityStrength");
  return fabs(v2) >= 2.22044605e-16;
}

- (CGPoint)_layerStackToDisplayScaleFactor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  BOOL v11;
  double v12;
  CGPoint result;

  -[UINamedLayerStack size](self->_layerStack, "size");
  v4 = v3;
  v6 = v5;
  -[_UIStackedImageContainerLayer _roundedBoundsSize](self, "_roundedBoundsSize");
  v9 = v4 == 0.0 || v7 == 0.0;
  v10 = v4 / v7;
  if (v9)
    v10 = 1.0;
  v11 = v6 == 0.0 || v8 == 0.0;
  v12 = v6 / v8;
  if (v11)
    v12 = 1.0;
  result.y = v12;
  result.x = v10;
  return result;
}

- (CGRect)_displayFrameForModelFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIStackedImageContainerLayer _layerStackToDisplayScaleFactor](self, "_layerStackToDisplayScaleFactor");
  v8 = width / v7;
  v9 = floor(x / v7);
  v10 = floor(v8);
  v12 = floor(height / v11);
  v13 = floor(y / v11);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v13;
  result.origin.x = v9;
  return result;
}

- (CGRect)_positionAndSizeForLayerImage:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int has_internal_diagnostics;
  void *v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  unint64_t v36;
  NSObject *v37;
  uint8_t v38[16];
  uint8_t buf[16];
  CGRect result;

  objc_msgSend(a3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v8 * 0.5;
  v13 = v10 * 0.5;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  -[_UIStackedImageContainerLayer _imageStackContentsGravity](self, "_imageStackContentsGravity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CD2F98]);

  if (has_internal_diagnostics)
  {
    if ((v16 & 1) == 0)
    {
      __UIFaultDebugAssertLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v35, OS_LOG_TYPE_FAULT, "_UIStackedImageContainerLayer: only ResizeAspectFill is supported for image stacks", buf, 2u);
      }

    }
  }
  else if ((v16 & 1) == 0)
  {
    v36 = _positionAndSizeForLayerImage____s_category;
    if (!_positionAndSizeForLayerImage____s_category)
    {
      v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v36, (unint64_t *)&_positionAndSizeForLayerImage____s_category);
    }
    v37 = *(NSObject **)(v36 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "_UIStackedImageContainerLayer: only ResizeAspectFill is supported for image stacks", v38, 2u);
    }
  }
  v17 = v5 + v12;
  v18 = v7 + v13;
  v19 = floor(v9);
  v20 = floor(v11);
  -[UINamedLayerStack size](self->_layerStack, "size");
  v22 = v21;
  v24 = v23;
  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  if (v22 > 0.0 && v24 > 0.0 && v25 > 0.0 && v26 > 0.0)
  {
    v27 = v22 / v25;
    v28 = v24 / v26;
    v29 = v22 / v25 < v24 / v26;
    if (v22 / v25 >= v24 / v26)
      v30 = v24 / v26;
    else
      v30 = v22 / v25;
    v17 = v17 / v30;
    v18 = v18 / v30;
    v19 = v19 / v30;
    v20 = v20 / v30;
    if (v29)
      v18 = v18 + round((v24 / v28 - v24 / v27) * 0.5);
    else
      v17 = v17 + round((v22 / v27 - v22 / v28) * 0.5);
  }
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = v20;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)_applyFocusDirectionTransform
{
  -[_UIStackedImageContainerLayer _applyFocusDirectionTransformWithAnimationCoordinator:](self, "_applyFocusDirectionTransformWithAnimationCoordinator:", 0);
}

- (void)_applyFocusDirectionTransformWithAnimationCoordinator:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  CALayer *specularLayer;
  CATransform3D *v9;
  CALayer *maskLayer;
  CGFloat v11;
  CALayer *overlayContainerLayer;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CALayer *v17;
  CALayer *v18;
  CALayer *unmaskedOverlayContainerLayer;
  CALayer *selectedPlaceholderLayer;
  CALayer *cursorLayer;
  CALayer *radiosityLayer;
  CATransform3D *v23;
  CALayer *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CATransform3D v37;
  CATransform3D v38;
  CATransform3D v39;
  _OWORD v40[8];
  _OWORD v41[2];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CATransform3D v48;
  CATransform3D v49;
  CATransform3D v50;
  CATransform3D v51;
  CATransform3D v52;
  CATransform3D v53;
  CATransform3D v54;
  CATransform3D v55;
  CATransform3D v56;
  CATransform3D v57;

  v4 = a3;
  v5 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  v6 = -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected");
  v7 = -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
  memset(&v57, 0, sizeof(v57));
  -[_UIStackedImageContainerLayer _scaleTransformForCurrentState](self, "_scaleTransformForCurrentState");
  if (self->_nonOpaqueShadow)
  {
    specularLayer = self->_specularLayer;
    v56 = v57;
    v9 = &v56;
LABEL_3:
    -[CALayer setTransform:](specularLayer, "setTransform:", v9);
    goto LABEL_11;
  }
  maskLayer = self->_maskLayer;
  v56 = v57;
  -[CALayer setTransform:](maskLayer, "setTransform:", &v56);
  if (self->_selectionStyle == 1
    && -[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth"))
  {
    if (v7)
    {
      v11 = 1.0 - (self->_scale + -1.0);
      CATransform3DMakeScale(&v55, v11, v11, 1.0);
      overlayContainerLayer = self->_overlayContainerLayer;
      v54 = v55;
      -[CALayer setTransform:](overlayContainerLayer, "setTransform:", &v54);
      CATransform3DMakeScale(&v53, v11, v11, 1.0);
      specularLayer = self->_unmaskedOverlayContainerLayer;
      v52 = v53;
      v9 = &v52;
      goto LABEL_3;
    }
    if (-[_UIStackedImageContainerLayer _isFocusedIdle](self, "_isFocusedIdle"))
    {
      -[_UIStackedImageContainerLayer _idleModeFocusSizeOffset](self, "_idleModeFocusSizeOffset");
      v14 = v13;
      -[_UIStackedImageContainerLayer bounds](self, "bounds");
      v16 = v14 / v15 + 1.0;
      CATransform3DMakeScale(&v51, 1.0, v16, 1.0);
      v17 = self->_overlayContainerLayer;
      v50 = v51;
      -[CALayer setTransform:](v17, "setTransform:", &v50);
      CATransform3DMakeScale(&v49, 1.0, v16, 1.0);
      specularLayer = self->_unmaskedOverlayContainerLayer;
      v48 = v49;
      v9 = &v48;
      goto LABEL_3;
    }
    v18 = self->_overlayContainerLayer;
    v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v35 = v44;
    v45 = v36;
    v34 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v46 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v33 = v46;
    v47 = v34;
    v32 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v41[0] = *MEMORY[0x1E0CD2610];
    v31 = v41[0];
    v41[1] = v32;
    v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v42 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v29 = v42;
    v43 = v30;
    -[CALayer setTransform:](v18, "setTransform:", v41);
    unmaskedOverlayContainerLayer = self->_unmaskedOverlayContainerLayer;
    v40[4] = v35;
    v40[5] = v36;
    v40[6] = v33;
    v40[7] = v34;
    v40[0] = v31;
    v40[1] = v32;
    v40[2] = v29;
    v40[3] = v30;
    -[CALayer setTransform:](unmaskedOverlayContainerLayer, "setTransform:", v40);
    -[_UIStackedImageContainerLayer _updateOverlayLayout](self, "_updateOverlayLayout");
  }
LABEL_11:
  if (!-[CALayer isHidden](self->_selectedPlaceholderLayer, "isHidden"))
  {
    v56 = v57;
    if (self->_selectionStyle == 1
      && -[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth")
      && (v5 || v6 || v7))
    {
      CATransform3DMakeScale(&v56, self->_scale, self->_scale, 1.0);
    }
    selectedPlaceholderLayer = self->_selectedPlaceholderLayer;
    v39 = v56;
    -[CALayer setTransform:](selectedPlaceholderLayer, "setTransform:", &v39);
  }
  if (-[_UIStackedImageConfiguration focusCursorEnabled](self->_configuration, "focusCursorEnabled"))
  {
    cursorLayer = self->_cursorLayer;
    -[_UIStackedImageContainerLayer _cursorBounds](self, "_cursorBounds");
    -[CALayer setBounds:](cursorLayer, "setBounds:");
  }
  -[_UIStackedImageContainerLayer _updatePerspective](self, "_updatePerspective");
  -[_UIStackedImageContainerLayer _updateRotationAndTranslation:](self, "_updateRotationAndTranslation:", v4);
  -[_UIStackedImageContainerLayer _updateFocusKeylineStrokeScale](self, "_updateFocusKeylineStrokeScale");
  if (v5 || v7 || v6)
  {
    if (self->_selectionStyle == 1
      && -[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth"))
    {
      radiosityLayer = self->_radiosityLayer;
      CATransform3DMakeScale(&v38, 1.0, self->_scale, 1.0);
      v23 = &v38;
    }
    else
    {
      radiosityLayer = self->_radiosityLayer;
      CATransform3DMakeScale(&v37, self->_scale, self->_scale, 1.0);
      v23 = &v37;
    }
    v24 = radiosityLayer;
  }
  else
  {
    v24 = self->_radiosityLayer;
    v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v56.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v56.m33 = v25;
    v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v56.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v56.m43 = v26;
    v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v56.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v56.m13 = v27;
    v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v56.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v56.m23 = v28;
    v23 = &v56;
  }
  -[CALayer setTransform:](v24, "setTransform:", v23);
  -[_UIStackedImageContainerLayer _updateFullBleedImageLayers](self, "_updateFullBleedImageLayers");
  -[_UIStackedImageContainerLayer _updateNormalImageLayers](self, "_updateNormalImageLayers");
  -[_UIStackedImageContainerLayer _updateContentProviderLayerFocusDirection](self, "_updateContentProviderLayerFocusDirection");
  -[_UIStackedImageContainerLayer _updateShadowWithAnimationCoordinator:](self, "_updateShadowWithAnimationCoordinator:", v4);
  -[_UIStackedImageContainerLayer _updateImageLayerFilterValues](self, "_updateImageLayerFilterValues");

}

- (void)_updateOverlayContainerLayerHierarchy:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  int IsKindOfUIView;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  if (self->_overlayContainerLayer)
  {
    v4 = a3;
    CALayerGetDelegate();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsKindOfUIView = _IsKindOfUIView((uint64_t)v5);

    if (v4)
    {
      if (IsKindOfUIView)
      {
        CALayerGetDelegate();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = _IsKindOfUIView((uint64_t)v7);

        if (v8)
        {
          -[CATransformLayer sublayers](self->_imageRotationTransformLayer, "sublayers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "indexOfObject:", self->_specularLayer);

          CALayerGetDelegate();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          CALayerGetDelegate();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "insertSubview:atIndex:", v11, v10);
LABEL_10:

          return;
        }
      }
      -[CATransformLayer insertSublayer:below:](self->_imageRotationTransformLayer, "insertSublayer:below:", self->_overlayContainerLayer, self->_specularLayer);
    }
    else
    {
      if (IsKindOfUIView)
      {
        CALayerGetDelegate();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = _IsKindOfUIView((uint64_t)v12);

        if (v13)
        {
          CALayerGetDelegate();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          CALayerGetDelegate();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addSubview:", v11);
          goto LABEL_10;
        }
      }
      -[CALayer addSublayer:](self->_flatLayer, "addSublayer:", self->_overlayContainerLayer);
    }
  }
}

- (void)_showImageLayers
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CALayer setHidden:](self->_flatLayer, "setHidden:", 1);
  -[CALayer setHidden:](self->_imageLayersContainer, "setHidden:", 0);
  if (!-[NSArray count](self->_parallaxImages, "count"))
    -[CATransformLayer insertSublayer:below:](self->_imageRotationTransformLayer, "insertSublayer:below:", self->_selectedPlaceholderLayer, self->_specularLayer);
  -[_UIStackedImageContainerLayer _updateOverlayContainerLayerHierarchy:](self, "_updateOverlayContainerLayerHierarchy:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v3);
}

- (void)_deselect
{
  -[_UIStackedImageContainerLayer setSelected:animated:](self, "setSelected:animated:", 0, 1);
}

- (double)_idleModeFocusSizeOffset
{
  return self->_idleModeFocusSizeOffset;
}

- (BOOL)_isFocused
{
  return -[_UIStackedImageContainerLayer _primaryControlStateForState:](self, "_primaryControlStateForState:", self->_controlState) == 8;
}

- (BOOL)_isFocusedIdle
{
  return -[_UIStackedImageContainerLayer _primaryControlStateForState:](self, "_primaryControlStateForState:", self->_controlState) == 0x10000;
}

- (BOOL)_isFocusedOrFocusedIdle
{
  return -[_UIStackedImageContainerLayer _isFocusedIdle](self, "_isFocusedIdle")
      || -[_UIStackedImageContainerLayer _isFocused](self, "_isFocused");
}

- (BOOL)_isHighlighted
{
  return -[_UIStackedImageContainerLayer _primaryControlStateForState:](self, "_primaryControlStateForState:", self->_controlState) == 1;
}

- (BOOL)_isNormal
{
  return -[_UIStackedImageContainerLayer _primaryControlStateForState:](self, "_primaryControlStateForState:", self->_controlState) == 0;
}

- (BOOL)_isSelected
{
  return -[_UIStackedImageContainerLayer _primaryControlStateForState:](self, "_primaryControlStateForState:", self->_controlState) == 4;
}

- (unint64_t)_primaryControlStateForState:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  v3 = 0x10000;
  v4 = a3 & 4;
  if ((a3 & 8) != 0)
    v4 = 8;
  if ((a3 & 0x10000) == 0)
    v3 = v4;
  if ((a3 & 1) != 0)
    return 1;
  else
    return v3;
}

- (void)_resetAnimatingToNormalState
{
  uint64_t v3;

  self->_animatingToNormalState = 0;
  if (-[_UIStackedImageContainerLayer _isNormal](self, "_isNormal"))
  {
    v3 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[CALayer setHidden:](self->_flatLayer, "setHidden:", 0);
    -[CALayer setHidden:](self->_imageLayersContainer, "setHidden:", 1);
    -[CALayer removeFromSuperlayer](self->_selectedPlaceholderLayer, "removeFromSuperlayer");
    -[_UIStackedImageContainerLayer _updateOverlayContainerLayerHierarchy:](self, "_updateOverlayContainerLayerHierarchy:", 0);
    -[CALayer removeAllAnimations](self->_shadowLayer, "removeAllAnimations");
    -[CALayer clearHasBeenCommitted](self->_shadowLayer, "clearHasBeenCommitted");
    -[CALayer removeAllAnimations](self->_unfocusedShadowLayer, "removeAllAnimations");
    -[CALayer clearHasBeenCommitted](self->_unfocusedShadowLayer, "clearHasBeenCommitted");
    -[CALayer removeAllAnimations](self->_radiosityLayer, "removeAllAnimations");
    -[CALayer clearHasBeenCommitted](self->_radiosityLayer, "clearHasBeenCommitted");
    -[CALayer removeAllAnimations](self->_overlayContainerLayer, "removeAllAnimations");
    -[CALayer clearHasBeenCommitted](self->_overlayContainerLayer, "clearHasBeenCommitted");
    -[CALayer removeAllAnimations](self->_unmaskedOverlayContainerLayer, "removeAllAnimations");
    -[CALayer clearHasBeenCommitted](self->_unmaskedOverlayContainerLayer, "clearHasBeenCommitted");
    -[_UIStackedImageContainerLayer _applyFocusDirectionTransform](self, "_applyFocusDirectionTransform");
    -[_UIStackedImageContainerLayer _setLayerStackInflated:seed:](self, "_setLayerStackInflated:seed:", 0, self->_layerStackInflationSeed++);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v3);
  }
}

- (void)_setFlatImage:(id)a3
{
  id v5;
  void *v6;
  id *p_flatImage;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  _UIStackedImageContainerLayer *v29;
  id v30;

  v5 = a3;
  v6 = v5;
  p_flatImage = &self->_flatImage;
  if (self->_flatImage != v5
    || !v5
    && (-[CALayer contents](self->_flatLayer, "contents"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        -[_UIStackedImageConfiguration placeholderImage](self->_configuration, "placeholderImage"),
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
        v12 = objc_msgSend(v11, "CGImage"),
        v11,
        v10,
        v10 != (void *)v12))
  {
    objc_storeStrong(&self->_flatImage, a3);
    -[CALayer contents](self->_flatLayer, "contents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*p_flatImage)
    {
      v9 = *p_flatImage;
    }
    else
    {
      -[_UIStackedImageConfiguration placeholderImage](self->_configuration, "placeholderImage");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = (id)objc_msgSend(v13, "CGImage");

    }
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __47___UIStackedImageContainerLayer__setFlatImage___block_invoke;
    v28 = &unk_1E16B1B50;
    v29 = self;
    v14 = v9;
    v30 = v14;
    v15 = (void (**)(_QWORD))_Block_copy(&v25);
    if (v8)
    {
      -[_UIStackedImageConfiguration placeholderImage](self->_configuration, "placeholderImage", v25, v26, v27, v28, v29);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (v8 == (void *)objc_msgSend(v16, "CGImage"))
      {
        v17 = *p_flatImage;

        if (v14 == v17)
        {
          if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
          {
            objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "currentMode");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("UITrackingRunLoopMode"));

            if ((v20 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
              v23 = v22;
              v24 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
              objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
              objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.35);
              v15[2](v15);
              objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v24);
              objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v23);
              goto LABEL_15;
            }
          }
        }
      }
      else
      {

      }
    }
    v21 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions", v25, v26, v27, v28, v29);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v15[2](v15);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v21);
LABEL_15:

  }
}

- (void)_setIdleModeFocusSizeOffset:(double)a3
{
  if (self->_idleModeFocusSizeOffset != a3)
    self->_idleModeFocusSizeOffset = a3;
}

- (id)_randomImage
{
  void *v3;
  void *v4;
  _UIStackedImageSimpleImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImage *v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD7B808 != -1)
    dispatch_once(&qword_1ECD7B808, &__block_literal_global_213_1);
  v3 = (void *)MEMORY[0x1E0CB3B18];
  -[UINamedLayerStack size](self->_layerStack, "size");
  objc_msgSend(v3, "valueWithCGSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7B800, "objectForKey:", v4);
  v5 = (_UIStackedImageSimpleImage *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UINamedLayerStack size](self->_layerStack, "size");
    v9 = v8;
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIRandomGenerator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "outputImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = CFSTR("inputRectangle");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageByApplyingFilter:withInputParameters:", CFSTR("CICrop"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[UIImage initWithCIImage:]([UIImage alloc], "initWithCIImage:", v16);
    _UIGraphicsBeginImageContextWithOptions(0, 0, v9, v11, 1.0);
    -[UIImage drawInRect:blendMode:alpha:](v17, "drawInRect:blendMode:alpha:", 0, v6, v7, v9, v11, 0.25);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v5 = objc_alloc_init(_UIStackedImageSimpleImage);
    -[_UIStackedImageSimpleImage setName:](v5, "setName:", CFSTR("noise"));
    -[_UIStackedImageSimpleImage setFrame:](v5, "setFrame:", v6, v7, v9, v11);
    -[_UIStackedImageSimpleImage setOpacity:](v5, "setOpacity:", 1.0);
    -[_UIStackedImageSimpleImage setBlendMode:](v5, "setBlendMode:", 0);
    -[_UIStackedImageSimpleImage setImageObj:](v5, "setImageObj:", v18);
    objc_msgSend((id)qword_1ECD7B800, "setObject:forKey:", v5, v4);

  }
  return v5;
}

- (void)_setParallaxImages:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  NSArray *v8;
  NSArray *parallaxImages;
  void *v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void (**v16)(void *, id, unint64_t);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double MidX;
  NSArray *v33;
  NSArray *imageLayers;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD aBlock[5];
  id v46;
  unint64_t v47;
  CGRect v48;
  CGRect v49;

  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_parallaxImages, "isEqualToArray:", v4))
  {
    v5 = -[_UIStackedImageConfiguration maximumParallaxImages](self->_configuration, "maximumParallaxImages");
    if (objc_msgSend(v4, "count") > v5)
    {
      NSLog(CFSTR("Image stacks with more than %1$ld images are not allowed; only the first %1$ld will be used"),
        v5);
      objc_msgSend(v4, "subarrayWithRange:", 0, v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v7 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v39 = _UIInternalPreference_ForceMaxParallaxLayers;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ForceMaxParallaxLayers)
      {
        while (v7 >= v39)
        {
          _UIInternalPreferenceSync(v7, &_UIInternalPreference_ForceMaxParallaxLayers, (uint64_t)CFSTR("ForceMaxParallaxLayers"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v39 = _UIInternalPreference_ForceMaxParallaxLayers;
          if (v7 == _UIInternalPreference_ForceMaxParallaxLayers)
            goto LABEL_7;
        }
        if (byte_1EDDA84F4)
          v40 = v4 == 0;
        else
          v40 = 1;
        if (!v40)
        {
          v41 = (void *)objc_msgSend(v4, "mutableCopy");
          v42 = v41;
          while (objc_msgSend(v41, "count") < v5)
          {
            -[_UIStackedImageContainerLayer _randomImage](self, "_randomImage");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v43);

            v41 = v42;
          }

          v4 = v42;
        }
      }
    }
LABEL_7:
    -[NSArray makeObjectsPerformSelector:withObject:](self->_imageLayers, "makeObjectsPerformSelector:withObject:", sel_setContents_, 0);
    -[NSArray makeObjectsPerformSelector:](self->_imageLayers, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
    v44 = v4;
    v8 = (NSArray *)objc_msgSend(v4, "copy");
    parallaxImages = self->_parallaxImages;
    self->_parallaxImages = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_parallaxImages, "count"));
    if (-[NSArray count](self->_parallaxImages, "count"))
    {
      v11 = 0;
      v12 = sel_contentProvider;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        -[NSArray objectAtIndex:](self->_parallaxImages, "objectAtIndex:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = v13;
        aBlock[1] = 3221225472;
        aBlock[2] = __52___UIStackedImageContainerLayer__setParallaxImages___block_invoke;
        aBlock[3] = &unk_1E16EC588;
        aBlock[4] = self;
        v15 = v14;
        v46 = v15;
        v47 = v11;
        v16 = (void (**)(void *, id, unint64_t))_Block_copy(aBlock);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v15, "contentProvider"), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v18 = (void *)v17;
          v19 = v13;
          v20 = v12;
          v21 = v10;
          v22 = objc_alloc_init(MEMORY[0x1E0CD28C8]);
          v16[2](v16, v22, v11);
          objc_msgSend(v18, "contentLayer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v22, "bounds");
            v25 = v24;
            v27 = v26;
            v29 = v28;
            v31 = v30;
            objc_msgSend(v23, "setBounds:");
            v48.origin.x = v25;
            v48.origin.y = v27;
            v48.size.width = v29;
            v48.size.height = v31;
            MidX = CGRectGetMidX(v48);
            v49.origin.x = v25;
            v49.origin.y = v27;
            v49.size.width = v29;
            v49.size.height = v31;
            objc_msgSend(v23, "setPosition:", MidX, CGRectGetMidY(v49));
            objc_msgSend(v22, "addSublayer:", v23);
          }

          v10 = v21;
          v12 = v20;
          v13 = v19;
        }
        else
        {
          v22 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
          v16[2](v16, v22, v11);
          objc_msgSend(v22, "setContents:", -[_UIStackedImageContainerLayer _cgImageForLayeredImage:](self, "_cgImageForLayeredImage:", v15));
        }
        -[CATransformLayer insertSublayer:below:](self->_imageRotationTransformLayer, "insertSublayer:below:", v22, self->_specularLayer);
        objc_msgSend(v10, "addObject:", v22);

        ++v11;
      }
      while (v11 < -[NSArray count](self->_parallaxImages, "count"));
    }
    v33 = (NSArray *)objc_msgSend(v10, "copy");
    imageLayers = self->_imageLayers;
    self->_imageLayers = v33;

    if (self->_layerStackSupportsInflation)
    {
      -[NSArray firstObject](self->_imageLayers, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "contents");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        -[CALayer contents](self->_flatLayer, "contents");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray firstObject](self->_imageLayers, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setContents:", v37);

      }
    }
    if (-[NSArray count](self->_parallaxImages, "count"))
      -[CALayer removeFromSuperlayer](self->_selectedPlaceholderLayer, "removeFromSuperlayer");
    else
      -[CATransformLayer insertSublayer:below:](self->_imageRotationTransformLayer, "insertSublayer:below:", self->_selectedPlaceholderLayer, self->_specularLayer);
    v4 = v44;
    -[_UIStackedImageContainerLayer _setDefaultParallaxLayerDepths](self, "_setDefaultParallaxLayerDepths");
    -[_UIStackedImageContainerLayer _updateImageLayerFilterChains](self, "_updateImageLayerFilterChains");
    -[_UIStackedImageContainerLayer _applyFocusDirectionTransform](self, "_applyFocusDirectionTransform");

  }
}

- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;

  y = a3.y;
  x = a3.x;
  if (!-[_UIStackedImageContainerLayer _isNormal](self, "_isNormal"))
  {
    v8 = fmax(fmin(x, 1.0), -1.0);
    v9 = fmax(fmin(y, 1.0), -1.0);
    if ((vabdd_f64(self->_focusDirection.x, v8) > 0.00000011920929
       || vabdd_f64(self->_focusDirection.y, v9) > 0.00000011920929)
      && !-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"))
    {
      self->_focusDirection.x = v8;
      self->_focusDirection.y = v9;
      objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
      v11 = v10;
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", a4);
      -[_UIStackedImageContainerLayer _updateRotationAndTranslation:](self, "_updateRotationAndTranslation:", 0);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v11);
    }
  }
}

- (CATransform3D)_scaleTransformForCurrentState
{
  _BOOL4 v5;
  _BOOL4 v6;
  CATransform3D *result;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double scale;
  double v18;
  CGFloat v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CATransform3D v40;
  CATransform3D v41;

  v5 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  v6 = -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected");
  result = (CATransform3D *)-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
  v8 = (__int128 *)MEMORY[0x1E0CD2610];
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = v10;
  *(_OWORD *)&retstr->m33 = v9;
  v12 = v8[6];
  v11 = v8[7];
  *(_OWORD *)&retstr->m41 = v12;
  *(_OWORD *)&retstr->m43 = v11;
  v14 = *v8;
  v13 = v8[1];
  *(_OWORD *)&retstr->m11 = *v8;
  *(_OWORD *)&retstr->m13 = v13;
  v16 = v8[2];
  v15 = v8[3];
  *(_OWORD *)&retstr->m21 = v16;
  *(_OWORD *)&retstr->m23 = v15;
  if (v5)
  {
    if (self->_selectionStyle == 1)
    {
      v36 = v16;
      v38 = v15;
      v32 = v14;
      v34 = v13;
      v28 = v12;
      v30 = v11;
      v24 = v10;
      v26 = v9;
      result = (CATransform3D *)-[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth");
      if (!(_DWORD)result)
        return result;
      scale = self->_scale;
      *(_OWORD *)&v40.m31 = v24;
      *(_OWORD *)&v40.m33 = v26;
      *(_OWORD *)&v40.m41 = v28;
      *(_OWORD *)&v40.m43 = v30;
      *(_OWORD *)&v40.m11 = v32;
      *(_OWORD *)&v40.m13 = v34;
      *(_OWORD *)&v40.m21 = v36;
      *(_OWORD *)&v40.m23 = v38;
      v18 = 1.0;
      v19 = 1.0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ((v6 | result) != 1)
    return result;
  if (self->_selectionStyle != 1)
  {
LABEL_9:
    v18 = self->_scale;
    *(_OWORD *)&v40.m31 = v10;
    *(_OWORD *)&v40.m33 = v9;
    *(_OWORD *)&v40.m41 = v12;
    *(_OWORD *)&v40.m43 = v11;
    *(_OWORD *)&v40.m11 = v14;
    *(_OWORD *)&v40.m13 = v13;
    *(_OWORD *)&v40.m21 = v16;
    *(_OWORD *)&v40.m23 = v15;
LABEL_10:
    v19 = 1.0;
    scale = v18;
    goto LABEL_11;
  }
  v37 = v16;
  v39 = v15;
  v33 = v14;
  v35 = v13;
  v29 = v12;
  v31 = v11;
  v25 = v10;
  v27 = v9;
  if (!-[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth"))
  {
    v18 = self->_scale;
    *(_OWORD *)&v40.m31 = v25;
    *(_OWORD *)&v40.m33 = v27;
    *(_OWORD *)&v40.m41 = v29;
    *(_OWORD *)&v40.m43 = v31;
    *(_OWORD *)&v40.m11 = v33;
    *(_OWORD *)&v40.m13 = v35;
    *(_OWORD *)&v40.m21 = v37;
    *(_OWORD *)&v40.m23 = v39;
    goto LABEL_10;
  }
  scale = self->_scale;
  v19 = 1.0;
  v18 = 1.0 - (scale + -1.0);
  *(_OWORD *)&v40.m31 = v25;
  *(_OWORD *)&v40.m33 = v27;
  *(_OWORD *)&v40.m41 = v29;
  *(_OWORD *)&v40.m43 = v31;
  *(_OWORD *)&v40.m11 = v33;
  *(_OWORD *)&v40.m13 = v35;
  *(_OWORD *)&v40.m21 = v37;
  *(_OWORD *)&v40.m23 = v39;
LABEL_11:
  result = CATransform3DScale(&v41, &v40, v18, scale, v19);
  v20 = *(_OWORD *)&v41.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v41.m31;
  *(_OWORD *)&retstr->m33 = v20;
  v21 = *(_OWORD *)&v41.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v41.m41;
  *(_OWORD *)&retstr->m43 = v21;
  v22 = *(_OWORD *)&v41.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v41.m11;
  *(_OWORD *)&retstr->m13 = v22;
  v23 = *(_OWORD *)&v41.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v41.m21;
  *(_OWORD *)&retstr->m23 = v23;
  return result;
}

- (CATransform3D)_rotationTransformForCurrentFocusDirection
{
  _BOOL4 v5;
  CATransform3D *result;
  double v7;
  double rotationAmount;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGPoint *p_focusDirection;
  CGFloat v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGFloat v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CATransform3D v33;
  CATransform3D v34;

  v5 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  result = (CATransform3D *)-[_UIStackedImageConfiguration rotationAmount](self->_configuration, "rotationAmount");
  rotationAmount = v7;
  if (!self->_selectionStyle)
  {
    result = (CATransform3D *)-[_UIStackedImageConfiguration adjustMotionForSize](self->_configuration, "adjustMotionForSize");
    if ((_DWORD)result)
      rotationAmount = self->_rotationAmount;
  }
  v9 = (__int128 *)MEMORY[0x1E0CD2610];
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = v10;
  *(_OWORD *)&retstr->m33 = v11;
  v12 = v9[6];
  v13 = v9[7];
  *(_OWORD *)&retstr->m41 = v12;
  *(_OWORD *)&retstr->m43 = v13;
  v14 = *v9;
  v15 = v9[1];
  *(_OWORD *)&retstr->m11 = *v9;
  *(_OWORD *)&retstr->m13 = v15;
  v16 = v9[2];
  v17 = v9[3];
  *(_OWORD *)&retstr->m21 = v16;
  *(_OWORD *)&retstr->m23 = v17;
  if (v5 && self->_selectionStyle != 1)
  {
    p_focusDirection = &self->_focusDirection;
    v19 = -(p_focusDirection->x * rotationAmount);
    *(_OWORD *)&v33.m31 = v10;
    *(_OWORD *)&v33.m33 = v11;
    *(_OWORD *)&v33.m41 = v12;
    *(_OWORD *)&v33.m43 = v13;
    *(_OWORD *)&v33.m11 = v14;
    *(_OWORD *)&v33.m13 = v15;
    *(_OWORD *)&v33.m21 = v16;
    *(_OWORD *)&v33.m23 = v17;
    CATransform3DRotate(&v34, &v33, v19, 0.0, 1.0, 0.0);
    v20 = *(_OWORD *)&v34.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v34.m31;
    *(_OWORD *)&retstr->m33 = v20;
    v21 = *(_OWORD *)&v34.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v34.m41;
    *(_OWORD *)&retstr->m43 = v21;
    v22 = *(_OWORD *)&v34.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v34.m11;
    *(_OWORD *)&retstr->m13 = v22;
    v23 = *(_OWORD *)&v34.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v34.m21;
    *(_OWORD *)&retstr->m23 = v23;
    v24 = rotationAmount * p_focusDirection->y;
    v25 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v33.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v33.m33 = v25;
    v26 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v33.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v33.m43 = v26;
    v27 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v33.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v33.m13 = v27;
    v28 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v33.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v33.m23 = v28;
    result = CATransform3DRotate(&v34, &v33, v24, 1.0, 0.0, 0.0);
    v29 = *(_OWORD *)&v34.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v34.m31;
    *(_OWORD *)&retstr->m33 = v29;
    v30 = *(_OWORD *)&v34.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v34.m41;
    *(_OWORD *)&retstr->m43 = v30;
    v31 = *(_OWORD *)&v34.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v34.m11;
    *(_OWORD *)&retstr->m13 = v31;
    v32 = *(_OWORD *)&v34.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v34.m21;
    *(_OWORD *)&retstr->m23 = v32;
  }
  return result;
}

- (CATransform3D)_perspectiveTransformForCurrentState
{
  _BOOL4 v5;
  _BOOL4 v6;
  CATransform3D *result;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;

  v5 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  v6 = -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected");
  result = (CATransform3D *)-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
  v8 = (_OWORD *)MEMORY[0x1E0CD2610];
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m33 = v9;
  v10 = v8[7];
  *(_OWORD *)&retstr->m41 = v8[6];
  *(_OWORD *)&retstr->m43 = v10;
  v11 = v8[1];
  *(_OWORD *)&retstr->m11 = *v8;
  *(_OWORD *)&retstr->m13 = v11;
  v12 = v8[3];
  *(_OWORD *)&retstr->m21 = v8[2];
  *(_OWORD *)&retstr->m23 = v12;
  if ((v5 || (v6 | result) == 1) && self->_selectionStyle != 1)
  {
    result = (CATransform3D *)-[_UIStackedImageConfiguration zDepth](self->_configuration, "zDepth");
    retstr->m34 = -1.0 / v13;
  }
  return result;
}

- (void)_updatePerspective
{
  _OWORD v3[8];
  _OWORD v4[8];
  _OWORD v5[8];
  _OWORD v6[8];
  _OWORD v7[8];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[_UIStackedImageContainerLayer _perspectiveTransformForCurrentState](self, "_perspectiveTransformForCurrentState");
  v7[4] = v12;
  v7[5] = v13;
  v7[6] = v14;
  v7[7] = v15;
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  v7[3] = v11;
  -[CATransformLayer setTransform:](self->_imagePerspectiveTransformLayer, "setTransform:", v7);
  v6[4] = v12;
  v6[5] = v13;
  v6[6] = v14;
  v6[7] = v15;
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  v6[3] = v11;
  -[CATransformLayer setTransform:](self->_maskPerspectiveTransformLayer, "setTransform:", v6);
  v5[4] = v12;
  v5[5] = v13;
  v5[6] = v14;
  v5[7] = v15;
  v5[0] = v8;
  v5[1] = v9;
  v5[2] = v10;
  v5[3] = v11;
  -[CATransformLayer setTransform:](self->_unmaskedOverlayPerspectiveTransformLayer, "setTransform:", v5);
  v4[4] = v12;
  v4[5] = v13;
  v4[6] = v14;
  v4[7] = v15;
  v4[0] = v8;
  v4[1] = v9;
  v4[2] = v10;
  v4[3] = v11;
  -[CALayer setSublayerTransform:](self->_frontmostPerspectiveTransformLayer, "setSublayerTransform:", v4);
  if (-[_UIStackedImageConfiguration focusCursorEnabled](self->_configuration, "focusCursorEnabled"))
  {
    v3[4] = v12;
    v3[5] = v13;
    v3[6] = v14;
    v3[7] = v15;
    v3[0] = v8;
    v3[1] = v9;
    v3[2] = v10;
    v3[3] = v11;
    -[CALayer setSublayerTransform:](self->_cursorLayerContainer, "setSublayerTransform:", v3);
  }
}

- (void)_updateRotationAndTranslation:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double v16;
  CGFloat x;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double y;
  _OWORD v40[8];
  _OWORD v41[8];
  _OWORD v42[8];
  _OWORD v43[8];
  _OWORD v44[8];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v4 = a3;
  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  v14 = -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected");
  v15 = -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
  -[_UIStackedImageConfiguration translationOffset](self->_configuration, "translationOffset");
  x = v16;
  y = v18;
  if (!self->_selectionStyle
    && -[_UIStackedImageConfiguration adjustMotionForSize](self->_configuration, "adjustMotionForSize"))
  {
    x = self->_translationOffset.x;
    y = self->_translationOffset.y;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[_UIStackedImageContainerLayer _rotationTransformForCurrentFocusDirection](self, "_rotationTransformForCurrentFocusDirection", *(_QWORD *)&x);
  v44[4] = v49;
  v44[5] = v50;
  v44[6] = v51;
  v44[7] = v52;
  v44[0] = v45;
  v44[1] = v46;
  v44[2] = v47;
  v44[3] = v48;
  -[CATransformLayer setTransform:](self->_imageRotationTransformLayer, "setTransform:", v44);
  v43[4] = v49;
  v43[5] = v50;
  v43[6] = v51;
  v43[7] = v52;
  v43[0] = v45;
  v43[1] = v46;
  v43[2] = v47;
  v43[3] = v48;
  -[CATransformLayer setTransform:](self->_maskRotationTransformLayer, "setTransform:", v43);
  v42[4] = v49;
  v42[5] = v50;
  v42[6] = v51;
  v42[7] = v52;
  v42[0] = v45;
  v42[1] = v46;
  v42[2] = v47;
  v42[3] = v48;
  -[CATransformLayer setTransform:](self->_unmaskedOverlayRotationTransformLayer, "setTransform:", v42);
  v41[4] = v49;
  v41[5] = v50;
  v41[6] = v51;
  v41[7] = v52;
  v41[0] = v45;
  v41[1] = v46;
  v41[2] = v47;
  v41[3] = v48;
  -[CATransformLayer setTransform:](self->_frontmostRotationTransformLayer, "setTransform:", v41);
  if (-[_UIStackedImageConfiguration focusCursorEnabled](self->_configuration, "focusCursorEnabled"))
  {
    v40[4] = v49;
    v40[5] = v50;
    v40[6] = v51;
    v40[7] = v52;
    v40[0] = v45;
    v40[1] = v46;
    v40[2] = v47;
    v40[3] = v48;
    -[CATransformLayer setTransform:](self->_cursorRotationTransformLayer, "setTransform:", v40);
  }
  -[CALayer bounds](self->_imageLayersContainer, "bounds");
  v19 = CGRectGetWidth(v53) * 0.5;
  -[CALayer bounds](self->_imageLayersContainer, "bounds");
  v20 = CGRectGetHeight(v54) * 0.5;
  v55.origin.x = v6;
  v55.origin.y = v8;
  v55.size.width = v10;
  v55.size.height = v12;
  v21 = CGRectGetWidth(v55) * 0.5;
  v56.origin.x = v6;
  v56.origin.y = v8;
  v56.size.width = v10;
  v56.size.height = v12;
  v22 = CGRectGetHeight(v56) * 0.5;
  -[_UIStackedImageConfiguration radiosityOffset](self->_configuration, "radiosityOffset");
  v24 = v22 + v23;
  if (v13)
  {
    v25 = v38;
    v26 = y;
    v27 = v38 * self->_focusDirection.x;
    v20 = v20 + y * self->_focusDirection.y;
    if (self->_selectionStyle == 1
      && !-[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth"))
    {
      -[_UIStackedImageConfiguration fullBleedOffset](self->_configuration, "fullBleedOffset");
      v20 = v20 + v28;
    }
    v19 = v19 + v27;
    v29 = v38 * self->_focusDirection.x * 1.5;
    v21 = v21 + v29;
    v30 = y * self->_focusDirection.y * 1.5;
    v24 = v24 + v30;
  }
  else
  {
    v29 = *MEMORY[0x1E0C9D538];
    v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v25 = v38;
    v26 = y;
  }
  if ((v14 || v15)
    && self->_selectionStyle == 1
    && !-[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth"))
  {
    -[_UIStackedImageConfiguration fullBleedOffset](self->_configuration, "fullBleedOffset");
    v20 = v20 + v31;
  }
  -[_UIStackedImageContainerLayer _updateFocusKeylineStrokeTranslation:](self, "_updateFocusKeylineStrokeTranslation:", v25, v26);
  objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
  v33 = v32;
  if (-[_UIStackedImageContainerLayer _isNormal](self, "_isNormal"))
  {
    -[_UIStackedImageConfiguration repositionUnselectionDuration](self->_configuration, "repositionUnselectionDuration");
    if (v4)
    {
      objc_msgSend(v4, "_unfocusingRepositionAnimationDuration");
    }
    else
    {
      v36 = v34;
      +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
      if (v37 <= 0.0)
      {
LABEL_22:
        objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v36);
        goto LABEL_23;
      }
      +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
    }
    v36 = v35;
    goto LABEL_22;
  }
LABEL_23:
  -[CALayer setPosition:](self->_flatLayer, "setPosition:", v19, v20);
  -[CALayer setPosition:](self->_imageLayersContainer, "setPosition:", v19, v20);
  -[CALayer setPosition:](self->_unmaskedOverlayContainerLayer, "setPosition:", v19, v20);
  -[CALayer setPosition:](self->_cursorLayer, "setPosition:", v19, v20);
  -[_UIStackedImageContainerLayer _updateShadowPositionWithOffset:](self, "_updateShadowPositionWithOffset:", v29, v30);
  -[CALayer setPosition:](self->_radiosityLayer, "setPosition:", v21, v24);
  if (-[_UIStackedImageContainerLayer _isNormal](self, "_isNormal"))
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v33);
  -[_UIStackedImageContainerLayer _updateFullBleedImageLayers](self, "_updateFullBleedImageLayers");
  -[_UIStackedImageContainerLayer _updateSpecularLayerContentsRect](self, "_updateSpecularLayerContentsRect");
  -[_UIStackedImageContainerLayer _updateContentProviderLayerFocusDirection](self, "_updateContentProviderLayerFocusDirection");
  -[_UIStackedImageContainerLayer _updateImageLayerFilterValues](self, "_updateImageLayerFilterValues");

}

- (void)_updateFocusKeylineStrokeTranslation:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGRect v11;
  CGRect v12;

  if (self->_focusKeylineStrokeLayer)
  {
    y = a3.y;
    x = a3.x;
    -[_UIStackedImageContainerLayer bounds](self, "bounds");
    v6 = v11.origin.x;
    v7 = v11.origin.y;
    width = v11.size.width;
    height = v11.size.height;
    v10 = CGRectGetWidth(v11) * 0.5;
    v12.origin.x = v6;
    v12.origin.y = v7;
    v12.size.width = width;
    v12.size.height = height;
    -[CALayer setPosition:](self->_focusKeylineStrokeLayer, "setPosition:", v10 + x * self->_focusDirection.x, CGRectGetHeight(v12) * 0.5 + y * self->_focusDirection.y);
  }
}

- (void)_updateFocusKeylineStrokeScale
{
  CALayer *focusKeylineStrokeLayer;
  CATransform3D v4;
  CATransform3D v5;

  if (self->_focusKeylineStrokeLayer)
  {
    memset(&v5, 0, sizeof(v5));
    CATransform3DMakeScale(&v5, self->_scale, self->_scale, 1.0);
    focusKeylineStrokeLayer = self->_focusKeylineStrokeLayer;
    v4 = v5;
    -[CALayer setTransform:](focusKeylineStrokeLayer, "setTransform:", &v4);
    -[CALayer setBorderWidth:](self->_focusKeylineStrokeLayer, "setBorderWidth:", 2.0 / self->_scale);
  }
}

- (CATransform3D)_fixedFrameTransformForDepth:(SEL)a3 fudgeFactor:(double)a4
{
  double v9;
  double v10;
  CATransform3D v12;
  CATransform3D a;

  -[_UIStackedImageConfiguration zDepth](self->_configuration, "zDepth");
  v10 = (1.0 - a4 / v9) * a5;
  CATransform3DMakeTranslation(&a, 0.0, 0.0, a4);
  CATransform3DMakeScale(&v12, self->_scale * v10, self->_scale * v10, 1.0);
  return CATransform3DConcat(retstr, &a, &v12);
}

- (void)_updateNormalImageLayers
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  char *v6;
  int *v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  char *v13;
  void *v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CALayer *overlayContainerLayer;
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  CALayer *unmaskedOverlayContainerLayer;
  NSUInteger v64;
  uint64_t v65;
  _BOOL4 v66;
  CATransform3D v67;
  CATransform3D v68;
  CATransform3D v69;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v72;
  CATransform3D v73;
  CATransform3D v74;

  if (self->_selectionStyle != 1)
  {
    HIDWORD(v65) = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
    v66 = -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected");
    LODWORD(v65) = -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
    memset(&v74, 0, sizeof(v74));
    -[_UIStackedImageContainerLayer _scaleTransformForCurrentState](self, "_scaleTransformForCurrentState");
    v3 = -[NSArray count](self->_imageLayers, "count");
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = sel_fixedFrame;
      v7 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
      v64 = v3;
      do
      {
        -[NSArray objectAtIndex:](self->_imageLayers, "objectAtIndex:", v5, v64);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v7[754]), "objectAtIndexedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = objc_msgSend(v9, "fixedFrame");
          if (v65)
            goto LABEL_9;
        }
        else
        {
          v10 = 0;
          if (v65)
          {
LABEL_9:
            v13 = v6;
            -[NSArray objectAtIndex:](self->_parallaxLayerDepths, "objectAtIndex:", v5);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "doubleValue");
            v16 = v15;

            memset(&v73, 0, sizeof(v73));
            if (v10)
            {
              -[_UIStackedImageContainerLayer _fixedFrameTransformForDepth:fudgeFactor:](self, "_fixedFrameTransformForDepth:fudgeFactor:", v16, 1.035);
            }
            else
            {
              CATransform3DMakeTranslation(&a, 0.0, 0.0, v16);
              b = v74;
              CATransform3DConcat(&v72, &a, &b);
              v73 = v72;
            }
            objc_msgSend(v8, "position");
            v24 = v23;
            v26 = v25;
            -[NSArray firstObject](self->_imageLayers, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "position");
            v29 = v28 - v24;
            v31 = v30 - v26;
            CATransform3DMakeTranslation(&v69, v29, v31, 0.0);
            b = v73;
            CATransform3DConcat(&v72, &b, &v69);
            v73 = v72;
            b = v72;
            CATransform3DTranslate(&v72, &b, -v29, -v31, 0.0);
            v73 = v72;
            -[CATransformLayer animationForKey:](self->_imagePerspectiveTransformLayer, "animationForKey:", CFSTR("transform"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32
              && objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions")
              && (objc_msgSend(v8, "hasBeenCommitted") & 1) == 0)
            {
              -[_UIStackedImageContainerLayer actionForLayer:forKey:](self, "actionForLayer:forKey:", v8, CFSTR("transform"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v32, "beginTime");
                objc_msgSend(v33, "setBeginTime:");
                objc_msgSend(v32, "duration");
                objc_msgSend(v33, "setDuration:");
                v72 = v73;
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v72);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setToValue:", v34);

                v4 = v64;
                objc_msgSend(v8, "addAnimation:forKey:", v33, CFSTR("transform"));
              }

            }
            v72 = v73;
            objc_msgSend(v8, "setTransform:", &v72);

            v6 = v13;
            v7 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
            goto LABEL_23;
          }
        }
        if (v66)
        {
          *(_OWORD *)&v73.m31 = *(_OWORD *)&v74.m31;
          *(_OWORD *)&v73.m33 = *(_OWORD *)&v74.m33;
          *(_OWORD *)&v73.m41 = *(_OWORD *)&v74.m41;
          *(_OWORD *)&v73.m43 = *(_OWORD *)&v74.m43;
          *(_OWORD *)&v73.m11 = *(_OWORD *)&v74.m11;
          *(_OWORD *)&v73.m13 = *(_OWORD *)&v74.m13;
          v11 = *(_OWORD *)&v74.m21;
          v12 = *(_OWORD *)&v74.m23;
        }
        else
        {
          v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
          *(_OWORD *)&v73.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
          *(_OWORD *)&v73.m33 = v17;
          v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
          *(_OWORD *)&v73.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
          *(_OWORD *)&v73.m43 = v18;
          v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
          *(_OWORD *)&v73.m11 = *MEMORY[0x1E0CD2610];
          *(_OWORD *)&v73.m13 = v19;
          v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
          v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        }
        *(_OWORD *)&v73.m21 = v11;
        *(_OWORD *)&v73.m23 = v12;
        if (v10)
        {
          -[NSArray objectAtIndex:](self->_parallaxLayerDepths, "objectAtIndex:", v5);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v21;

          v72 = v73;
          CATransform3DTranslate(&v73, &v72, 0.0, 0.0, v22);
        }
        v72 = v73;
        objc_msgSend(v8, "setTransform:", &v72);
LABEL_23:

        ++v5;
      }
      while (v4 != v5);
    }
    if (self->_overlayLayer)
    {
      v35 = -[_UIStackedImageConfiguration overlayFixedFrame](self->_configuration, "overlayFixedFrame");
      -[NSArray lastObject](self->_parallaxLayerDepths, "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v38 = v37;
      -[_UIStackedImageConfiguration overlayDepth](self->_configuration, "overlayDepth");
      v40 = v38 + v39;

      memset(&v73, 0, sizeof(v73));
      if ((HIDWORD(v65) | v65) == 1)
      {
        if (v35)
        {
          -[_UIStackedImageContainerLayer _fixedFrameTransformForDepth:fudgeFactor:](self, "_fixedFrameTransformForDepth:fudgeFactor:", v40, 1.015);
        }
        else
        {
          CATransform3DMakeTranslation(&v68, 0.0, 0.0, v40);
          v72 = v74;
          CATransform3DConcat(&v73, &v68, &v72);
        }
      }
      else if (v66)
      {
        v73 = v74;
      }
      else
      {
        v41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        v42 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        *(_OWORD *)&v73.m31 = v41;
        *(_OWORD *)&v73.m33 = v42;
        v43 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        *(_OWORD *)&v73.m41 = v43;
        *(_OWORD *)&v73.m43 = v44;
        v45 = *MEMORY[0x1E0CD2610];
        v46 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        *(_OWORD *)&v73.m11 = *MEMORY[0x1E0CD2610];
        *(_OWORD *)&v73.m13 = v46;
        v47 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        v48 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        *(_OWORD *)&v73.m21 = v47;
        *(_OWORD *)&v73.m23 = v48;
        if (v35)
        {
          *(_OWORD *)&v72.m31 = v41;
          *(_OWORD *)&v72.m33 = v42;
          *(_OWORD *)&v72.m41 = v43;
          *(_OWORD *)&v72.m43 = v44;
          *(_OWORD *)&v72.m11 = v45;
          *(_OWORD *)&v72.m13 = v46;
          *(_OWORD *)&v72.m21 = v47;
          *(_OWORD *)&v72.m23 = v48;
          CATransform3DTranslate(&v73, &v72, 0.0, 0.0, v40);
        }
      }
      overlayContainerLayer = self->_overlayContainerLayer;
      v72 = v73;
      -[CALayer setTransform:](overlayContainerLayer, "setTransform:", &v72);
    }
    if (self->_unmaskedOverlayLayer)
    {
      v50 = HIDWORD(v65) | v65 | v66;
      if (v50 == 1)
      {
        *(_OWORD *)&v73.m31 = *(_OWORD *)&v74.m31;
        *(_OWORD *)&v73.m33 = *(_OWORD *)&v74.m33;
        *(_OWORD *)&v73.m41 = *(_OWORD *)&v74.m41;
        *(_OWORD *)&v73.m43 = *(_OWORD *)&v74.m43;
        *(_OWORD *)&v73.m11 = *(_OWORD *)&v74.m11;
        *(_OWORD *)&v73.m13 = *(_OWORD *)&v74.m13;
        v51 = *(_OWORD *)&v74.m21;
        v52 = *(_OWORD *)&v74.m23;
      }
      else
      {
        v53 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        *(_OWORD *)&v73.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        *(_OWORD *)&v73.m33 = v53;
        v54 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        *(_OWORD *)&v73.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        *(_OWORD *)&v73.m43 = v54;
        v55 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        *(_OWORD *)&v73.m11 = *MEMORY[0x1E0CD2610];
        *(_OWORD *)&v73.m13 = v55;
        v51 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        v52 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      }
      *(_OWORD *)&v73.m21 = v51;
      *(_OWORD *)&v73.m23 = v52;
      -[NSArray lastObject](self->_parallaxLayerDepths, "lastObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "doubleValue");
      v58 = v57;

      if (-[NSArray count](self->_imageLayers, "count") == 1)
      {
        v59 = self->_maximumParallaxDepth * 0.5;
      }
      else
      {
        -[_UIStackedImageConfiguration overlayDepth](self->_configuration, "overlayDepth");
        v59 = v58 + v60;
      }
      CATransform3DMakeTranslation(&v67, 0.0, 0.0, v59);
      v72 = v73;
      CATransform3DConcat(&v73, &v67, &v72);
      if (v50)
      {
        -[_UIStackedImageConfiguration unmaskedOverlayScaleFactor](self->_configuration, "unmaskedOverlayScaleFactor");
        if (fabs(v61 + -1.0) >= 2.22044605e-16)
        {
          -[_UIStackedImageConfiguration unmaskedOverlayScaleFactor](self->_configuration, "unmaskedOverlayScaleFactor");
          b = v73;
          CATransform3DScale(&v72, &b, v62, v62, 1.0);
          v73 = v72;
        }
      }
      unmaskedOverlayContainerLayer = self->_unmaskedOverlayContainerLayer;
      v72 = v73;
      -[CALayer setTransform:](unmaskedOverlayContainerLayer, "setTransform:", &v72);
    }
  }
}

- (void)_updateFullBleedImageLayers
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  int v10;
  _OWORD *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double scale;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  double v35;
  double v36;
  _BOOL4 v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CALayer *overlayContainerLayer;
  CALayer *unmaskedOverlayContainerLayer;
  double v50;
  double v51;
  _BOOL4 v52;
  _BOOL4 v53;
  CATransform3D v54;
  CATransform3D v55;
  CATransform3D v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;

  if (self->_selectionStyle == 1)
  {
    v3 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
    v52 = -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected");
    v53 = -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[_UIStackedImageContainerLayer _scaleTransformForCurrentState](self, "_scaleTransformForCurrentState");
    v4 = -[NSArray count](self->_imageLayers, "count");
    v5 = v4 - 1;
    v6 = v4 - 1 <= 1 ? 1 : v4 - 1;
    if (v4)
    {
      v7 = v4;
      v8 = 0;
      v9 = 0.064 / (double)(unint64_t)v6;
      v10 = v3 || v53;
      v51 = 20.0 / (double)v4;
      v11 = (_OWORD *)MEMORY[0x1E0CD2610];
      v50 = 10.0 / (double)v4;
      do
      {
        -[NSArray objectAtIndex:](self->_imageLayers, "objectAtIndex:", v8, *(_QWORD *)&v50);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v10)
        {
          v14 = v9 * (double)v8 + 1.031;
          objc_msgSend(v12, "position");
          v16 = v15;
          v18 = v17;
          -[NSArray firstObject](self->_imageLayers, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "position");
          v21 = v20;
          v23 = v22;
          if (v53)
          {
            v24 = -[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth");
            scale = self->_scale;
            v26 = v14 * scale;
            v27 = v14 * (1.0 - (scale + -1.0));
            if (v24)
              v14 = v27;
            else
              v14 = v26;
          }
          -[CALayer bounds](self->_imageLayersContainer, "bounds");
          v29 = v28;
          v30 = v11[5];
          *(_OWORD *)&v56.m31 = v11[4];
          *(_OWORD *)&v56.m33 = v30;
          v31 = v11[7];
          *(_OWORD *)&v56.m41 = v11[6];
          *(_OWORD *)&v56.m43 = v31;
          v32 = v11[1];
          *(_OWORD *)&v56.m11 = *v11;
          *(_OWORD *)&v56.m13 = v32;
          v33 = v11[3];
          *(_OWORD *)&v56.m21 = v11[2];
          *(_OWORD *)&v56.m23 = v33;
          -[NSArray objectAtIndex:](self->_parallaxImages, "objectAtIndex:", v8);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v34, "fixedFrame") & 1) == 0)
          {
            v35 = v21 - v16;
            v36 = v23 - v18;
            v37 = -[_UIStackedImageConfiguration fullBleedCenteredGrowth](self->_configuration, "fullBleedCenteredGrowth");
            v38 = v29 * 0.61 + v29 * -0.5;
            if (v37)
              v38 = -0.0;
            v39 = v36 + v38;
            v40 = (double)(v8 + 1);
            v41 = v51 * v40 * self->_focusDirection.x;
            v42 = v50 * v40 * self->_focusDirection.y;
            CATransform3DMakeTranslation(&v56, v35, v39, 0.0);
            v54 = v56;
            CATransform3DScale(&v55, &v54, v14, v14, 1.0);
            v56 = v55;
            v54 = v55;
            CATransform3DTranslate(&v55, &v54, v41 - v35, v42 - v39, 0.0);
            v56 = v55;
            objc_msgSend(v13, "setTransform:", &v55);
          }

        }
        else
        {
          if (v52)
          {
            *(_OWORD *)&v56.m31 = v61;
            *(_OWORD *)&v56.m33 = v62;
            *(_OWORD *)&v56.m41 = v63;
            *(_OWORD *)&v56.m43 = v64;
            *(_OWORD *)&v56.m11 = v57;
            *(_OWORD *)&v56.m13 = v58;
            v43 = v59;
            v44 = v60;
          }
          else
          {
            v45 = v11[5];
            *(_OWORD *)&v56.m31 = v11[4];
            *(_OWORD *)&v56.m33 = v45;
            v46 = v11[7];
            *(_OWORD *)&v56.m41 = v11[6];
            *(_OWORD *)&v56.m43 = v46;
            v47 = v11[1];
            *(_OWORD *)&v56.m11 = *v11;
            *(_OWORD *)&v56.m13 = v47;
            v43 = v11[2];
            v44 = v11[3];
          }
          *(_OWORD *)&v56.m21 = v43;
          *(_OWORD *)&v56.m23 = v44;
          *(_OWORD *)&v55.m31 = *(_OWORD *)&v56.m31;
          *(_OWORD *)&v55.m33 = *(_OWORD *)&v56.m33;
          *(_OWORD *)&v55.m41 = *(_OWORD *)&v56.m41;
          *(_OWORD *)&v55.m43 = *(_OWORD *)&v56.m43;
          *(_OWORD *)&v55.m11 = *(_OWORD *)&v56.m11;
          *(_OWORD *)&v55.m13 = *(_OWORD *)&v56.m13;
          *(_OWORD *)&v55.m21 = v43;
          *(_OWORD *)&v55.m23 = v44;
          objc_msgSend(v12, "setTransform:", &v55);
          if (v5 == v8 && self->_overlayLayer)
          {
            overlayContainerLayer = self->_overlayContainerLayer;
            v55 = v56;
            -[CALayer setTransform:](overlayContainerLayer, "setTransform:", &v55);
          }
          if (v5 == v8 && self->_unmaskedOverlayLayer)
          {
            unmaskedOverlayContainerLayer = self->_unmaskedOverlayContainerLayer;
            v55 = v56;
            -[CALayer setTransform:](unmaskedOverlayContainerLayer, "setTransform:", &v55);
          }
        }

        ++v8;
      }
      while (v7 != v8);
    }
  }
}

- (void)_updateSpecularLayerContentsRect
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  double y;
  double v20;
  double v21;
  double v22;
  double v23;
  double scale;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;

  v3 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  if (v3)
  {
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if (v6 >= v7)
      v12 = v6;
    else
      v12 = v7;
    v13 = v12 * 1.75;
    v26 = v6 / (v12 * 1.75);
    x = self->_focusDirection.x;
    v15 = v7 / (v12 * 1.75);
    -[_UIStackedImageConfiguration specularHighlightHorizontalPositionSensitivity](self->_configuration, "specularHighlightHorizontalPositionSensitivity");
    v17 = v16 * x;
    v27.origin.x = v8;
    v27.origin.y = v9;
    v27.size.width = v10;
    v27.size.height = v11;
    v18 = v17 * CGRectGetWidth(v27);
    y = self->_focusDirection.y;
    -[_UIStackedImageConfiguration specularHighlightVerticalPositionSensitivity](self->_configuration, "specularHighlightVerticalPositionSensitivity");
    v21 = v20 * y;
    v28.origin.x = v8;
    v28.origin.y = v9;
    v28.size.width = v10;
    v28.size.height = v11;
    v22 = v21 * CGRectGetHeight(v28);
    -[_UIStackedImageConfiguration specularHighlightVerticalPosition](self->_configuration, "specularHighlightVerticalPosition");
    scale = self->_scale;
    v25 = v13 * v23 - v22;
    if (scale < 1.3)
      scale = 1.3;
    -[CALayer setContentsRect:](self->_specularLayer, "setContentsRect:", 0.5 - v18 / scale / v13 - v26 * 0.5, v25 / scale / v13 + 0.5 - v15 * 0.5, v26, v15);
  }
}

- (void)_updateContentProviderLayerFocusDirection
{
  unint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  CGPoint focusDirection;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_imageLayers, "count"))
  {
    v3 = 0;
    v4 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
    do
    {
      -[NSArray objectAtIndex:](self->_imageLayers, "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v4[755]), "layers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "contentProvider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v16 = v7;
          v17 = v5;
          v18 = v3;
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v5, "sublayers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v21 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
                focusDirection = self->_focusDirection;
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &focusDirection, "{CGPoint=dd}");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("focusDirection"));

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            }
            while (v11);
          }

          v7 = v16;
          v5 = v17;
          v3 = v18;
          v4 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
        }
      }

      ++v3;
    }
    while (v3 < -[NSArray count](self->_imageLayers, "count"));
  }
}

- (void)_updateImageLayerFilterChains
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[_UIStackedImageConfiguration boostBrightness](self->_configuration, "boostBrightness")
    && -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BB8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", &unk_1E1A963C0, CFSTR("inputAmount"));
    objc_msgSend(v3, "setName:", CFSTR("brightness"));
    objc_msgSend(v5, "addObject:", v3);

  }
  if (-[_UIStackedImageConfiguration hueShift](self->_configuration, "hueShift")
    && -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BD8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", &unk_1E1A963C0, CFSTR("inputAngle"));
    objc_msgSend(v4, "setName:", CFSTR("hue"));
    objc_msgSend(v5, "addObject:", v4);

  }
  -[CALayer setFilters:](self->_imageLayersContainer, "setFilters:", v5);

}

- (void)_updateImageLayerFilterValues
{
  _BOOL4 v3;
  BOOL v4;
  double v5;
  CALayer *imageLayersContainer;
  void *v7;
  double v8;
  CALayer *v9;
  id v10;

  v3 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  if (-[_UIStackedImageConfiguration boostBrightness](self->_configuration, "boostBrightness"))
    v4 = !v3;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = self->_focusDirection.y * 0.05;
    if (fabs(v5) < 0.01)
      v5 = 0.0;
    imageLayersContainer = self->_imageLayersContainer;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setValue:forKeyPath:](imageLayersContainer, "setValue:forKeyPath:", v7, CFSTR("filters.brightness.inputAmount"));

  }
  if (-[_UIStackedImageConfiguration hueShift](self->_configuration, "hueShift") && v3)
  {
    v8 = self->_focusDirection.x * -0.15;
    if (fabs(v8) < 0.01)
      v8 = 0.0;
    v9 = self->_imageLayersContainer;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CALayer setValue:forKeyPath:](v9, "setValue:forKeyPath:", v10, CFSTR("filters.hue.inputAngle"));

  }
}

- (void)_updateLayerForSelection
{
  -[_UIStackedImageContainerLayer _updateLayerForSelectionWithAnimationCoordinator:](self, "_updateLayerForSelectionWithAnimationCoordinator:", 0);
}

- (CATransform3D)_specularTransformForCurrentState
{
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CATransform3D *result;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CATransform3D v16;
  CATransform3D v17;

  v5 = (_OWORD *)MEMORY[0x1E0CD2610];
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m33 = v6;
  v7 = v5[7];
  *(_OWORD *)&retstr->m41 = v5[6];
  *(_OWORD *)&retstr->m43 = v7;
  v8 = v5[1];
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v8;
  v9 = v5[3];
  *(_OWORD *)&retstr->m21 = v5[2];
  *(_OWORD *)&retstr->m23 = v9;
  if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle")
    || (result = (CATransform3D *)-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"), (_DWORD)result))
  {
    v11 = 0.0;
    if (!self->_nonOpaqueShadow && !self->_singleLayerNoMask)
      v11 = self->_maximumParallaxDepth * 1.3;
    -[_UIStackedImageContainerLayer _scaleTransformForCurrentState](self, "_scaleTransformForCurrentState");
    result = CATransform3DTranslate(&v17, &v16, 0.0, 0.0, v11);
    v12 = *(_OWORD *)&v17.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v17.m31;
    *(_OWORD *)&retstr->m33 = v12;
    v13 = *(_OWORD *)&v17.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v17.m41;
    *(_OWORD *)&retstr->m43 = v13;
    v14 = *(_OWORD *)&v17.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v17.m11;
    *(_OWORD *)&retstr->m13 = v14;
    v15 = *(_OWORD *)&v17.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v17.m21;
    *(_OWORD *)&retstr->m23 = v15;
  }
  return result;
}

- (void)_updateLayerForSelectionWithAnimationCoordinator:(id)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  _BOOL4 v8;
  _UIStackedImageConfiguration *configuration;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CALayer *specularLayer;
  double v16;
  CALayer *v17;
  __int128 *v18;
  CALayer *v19;
  _BOOL4 v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  CALayer *focusKeylineStrokeLayer;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "animationDuration");
  v7 = v6;
  v8 = -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  configuration = self->_configuration;
  if (v8)
    -[_UIStackedImageConfiguration layerSelectionDuration](configuration, "layerSelectionDuration");
  else
    -[_UIStackedImageConfiguration layerUnselectionDuration](configuration, "layerUnselectionDuration");
  v11 = v10;
  if (v5 || (+[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration"), v12 > 0.0))
  {
    +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
    v11 = v13;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v11);
  self->_selectionDuration = v11;
  if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
  {
    -[_UIStackedImageContainerLayer _focusedScaleFactorForCurrentBounds](self, "_focusedScaleFactorForCurrentBounds");
    self->_scale = v14;
    self->_focusDirection = (CGPoint)*MEMORY[0x1E0C9D538];
    specularLayer = self->_specularLayer;
    -[_UIStackedImageConfiguration specularOpacity](self->_configuration, "specularOpacity");
    *(float *)&v16 = v16;
    -[CALayer setOpacity:](specularLayer, "setOpacity:", v16);
    v17 = self->_specularLayer;
    -[_UIStackedImageContainerLayer _specularTransformForCurrentState](self, "_specularTransformForCurrentState");
    v18 = (__int128 *)&v42;
    v19 = v17;
  }
  else
  {
    v20 = -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected");
    v21 = 1.13;
    if (!v20)
      v21 = 1.0;
    self->_scale = v21;
    v22 = *MEMORY[0x1E0C9D538];
    self->_focusDirection = (CGPoint)*MEMORY[0x1E0C9D538];
    LODWORD(v22) = 0;
    -[CALayer setOpacity:](self->_specularLayer, "setOpacity:", *(double *)&v22);
    v19 = self->_specularLayer;
    v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v38 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v39 = v23;
    v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v40 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v41 = v24;
    v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v34 = *MEMORY[0x1E0CD2610];
    v35 = v25;
    v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v37 = v26;
    v18 = &v34;
  }
  -[CALayer setTransform:](v19, "setTransform:", v18, v34, v35, v36, v37, v38, v39, v40, v41);
  -[_UIStackedImageContainerLayer _applyFocusDirectionTransformWithAnimationCoordinator:](self, "_applyFocusDirectionTransformWithAnimationCoordinator:", v5);

  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v7);
  if (self->_cursorLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
    v28 = v27;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
    if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
      v29 = -[_UIStackedImageConfiguration focusCursorEnabled](self->_configuration, "focusCursorEnabled") ^ 1;
    else
      v29 = 1;
    -[CALayer setHidden:](self->_cursorLayer, "setHidden:", v29);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v28);
  }
  if (self->_focusKeylineStrokeLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
    v31 = v30;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
    focusKeylineStrokeLayer = self->_focusKeylineStrokeLayer;
    if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
      v33 = 0;
    else
      v33 = -[_UIStackedImageConfiguration focusCursorEnabled](self->_configuration, "focusCursorEnabled") ^ 1;
    -[CALayer setHidden:](focusKeylineStrokeLayer, "setHidden:", v33);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v31);
  }
}

- (double)_focusedShadowRadius
{
  int64_t selectionStyle;
  double result;
  _BOOL4 v5;
  _UIStackedImageConfiguration *configuration;
  void *v8;

  selectionStyle = self->_selectionStyle;
  if ((unint64_t)(selectionStyle - 1) >= 2)
  {
    if (selectionStyle)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStackedImageContainerLayer.m"), 3542, CFSTR("unknown selection style"));

      return 0.0;
    }
    else
    {
      v5 = -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted");
      configuration = self->_configuration;
      if (v5)
        -[_UIStackedImageConfiguration defaultHighlightedShadowRadius](configuration, "defaultHighlightedShadowRadius");
      else
        -[_UIStackedImageConfiguration defaultFocusedShadowRadius](configuration, "defaultFocusedShadowRadius");
    }
  }
  else
  {
    -[_UIStackedImageConfiguration fullBleedFocusedShadowRadius](self->_configuration, "fullBleedFocusedShadowRadius");
  }
  return result;
}

- (double)_unfocusedShadowRadius
{
  int64_t selectionStyle;
  double result;
  void *v6;

  selectionStyle = self->_selectionStyle;
  switch(selectionStyle)
  {
    case 2:
      goto LABEL_4;
    case 1:
      -[_UIStackedImageConfiguration fullBleedUnfocusedShadowRadius](self->_configuration, "fullBleedUnfocusedShadowRadius");
      break;
    case 0:
LABEL_4:
      -[_UIStackedImageConfiguration defaultUnfocusedShadowRadius](self->_configuration, "defaultUnfocusedShadowRadius");
      return result;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStackedImageContainerLayer.m"), 3562, CFSTR("unknown selection style"));

      return 0.0;
  }
  return result;
}

- (double)_getShadowOpacity
{
  int64_t selectionStyle;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  double result;
  void *v15;
  void *v16;
  SEL v17;
  _UIStackedImageContainerLayer *v18;
  uint64_t v19;

  if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle")
    || -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"))
  {
    selectionStyle = self->_selectionStyle;
    if ((unint64_t)(selectionStyle - 1) < 2)
    {
      -[_UIStackedImageConfiguration fullBleedFocusedShadowOpacity](self->_configuration, "fullBleedFocusedShadowOpacity");
      v6 = v5;
      goto LABEL_5;
    }
    if (!selectionStyle)
    {
      -[_UIStackedImageConfiguration defaultFocusedShadowOpacity](self->_configuration, "defaultFocusedShadowOpacity");
      v6 = v8;
      if (-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"))
      {
        -[_UIStackedImageConfiguration defaultHighlightedShadowOpacity](self->_configuration, "defaultHighlightedShadowOpacity");
        v6 = v9;
LABEL_7:
        if (-[_UIStackedImageConfiguration focusCursorEnabled](self->_configuration, "focusCursorEnabled"))
        {
          -[_UIStackedImageConfiguration focusCursorShadowOpacityAdjustment](self->_configuration, "focusCursorShadowOpacityAdjustment");
          return v6 + v7;
        }
        return v6;
      }
LABEL_5:
      if (-[_UIStackedImageContainerLayer _isFocusedIdle](self, "_isFocusedIdle"))
        v6 = v6 + 0.1;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = a2;
    v18 = self;
    v19 = 3598;
    goto LABEL_21;
  }
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceStyle");

  v13 = self->_selectionStyle;
  if (v13 == 2)
  {
LABEL_15:
    v6 = 0.0;
    if (v12 != 1000)
    {
      -[_UIStackedImageConfiguration defaultUnfocusedShadowOpacity](self->_configuration, "defaultUnfocusedShadowOpacity");
      return result;
    }
    return v6;
  }
  if (v13 != 1)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = a2;
      v18 = self;
      v19 = 3619;
LABEL_21:
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("_UIStackedImageContainerLayer.m"), v19, CFSTR("unknown selection style"));

      return 0.0;
    }
    goto LABEL_15;
  }
  v6 = 0.0;
  if (v12 != 1000)
  {
    -[_UIStackedImageConfiguration fullBleedUnfocusedShadowOpacity](self->_configuration, "fullBleedUnfocusedShadowOpacity");
    return result;
  }
  return v6;
}

- (void)_updateShadowBounds
{
  BOOL v3;
  _BOOL4 v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  _UIStackedImageConfiguration *configuration;
  CGFloat v22;
  double v23;
  double v24;
  double scale;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CALayer *unfocusedShadowLayer;
  double v56;
  CALayer *shadowLayer;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  _BOOL4 v62;
  _UIStackedImageConfiguration *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CALayer *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CATransform3D v83;
  CATransform3D v84;
  CATransform3D v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  if (self->_nonOpaqueShadow)
    return;
  v3 = -[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted")
    || -[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
  v4 = -[_UIStackedImageConfiguration useSeparateUnfocusedShadowImage](self->_configuration, "useSeparateUnfocusedShadowImage");
  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (v4 && !v3)
  {
    -[_UIStackedImageContainerLayer _unfocusedShadowRadius](self, "_unfocusedShadowRadius");
    v14 = v13 + v13;
    v15 = -(v13 + v13);
    v86.origin.x = v6;
    v86.origin.y = v8;
    v86.size.width = v10;
    v86.size.height = v12;
    v87 = CGRectInset(v86, v15, v15);
    v16 = v87.size.width + -4.0;
    v17 = v87.size.height + -2.0;
    if ((self->_selectionStyle | 2) == 2 && -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected"))
    {
      v16 = v16 * 1.13;
      v17 = v17 * 1.13;
    }
    v18 = *MEMORY[0x1E0C9D538];
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v20 = -[_UIStackedImageContainerLayer isSelected](self, "isSelected");
    configuration = self->_configuration;
    if (v20)
      -[_UIStackedImageConfiguration defaultSelectedShadowVerticalOffset](configuration, "defaultSelectedShadowVerticalOffset");
    else
      -[_UIStackedImageConfiguration defaultUnfocusedShadowVerticalOffset](configuration, "defaultUnfocusedShadowVerticalOffset");
    v51 = v22;
    v52 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v85.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v85.m33 = v52;
    v81 = *(_OWORD *)&v85.m31;
    v82 = v52;
    v53 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v85.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v85.m43 = v53;
    v78 = *(_OWORD *)&v85.m41;
    v79 = v53;
    v54 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v80 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v85.m11 = v80;
    *(_OWORD *)&v85.m13 = v54;
    v76 = v54;
    v77 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v75 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v85.m21 = v77;
    *(_OWORD *)&v85.m23 = v75;
    *(_OWORD *)&v84.m31 = *(_OWORD *)&v85.m31;
    *(_OWORD *)&v84.m33 = v52;
    *(_OWORD *)&v84.m41 = *(_OWORD *)&v85.m41;
    *(_OWORD *)&v84.m43 = v53;
    *(_OWORD *)&v84.m11 = v80;
    *(_OWORD *)&v84.m13 = v54;
    *(_OWORD *)&v84.m21 = v77;
    *(_OWORD *)&v84.m23 = v75;
    CATransform3DTranslate(&v85, &v84, 0.0, v22, 0.0);
    unfocusedShadowLayer = self->_unfocusedShadowLayer;
    v84 = v85;
    -[CALayer setTransform:](unfocusedShadowLayer, "setTransform:", &v84);
    -[CALayer setBounds:](self->_unfocusedShadowLayer, "setBounds:", v18, v19, v16, v17);
    *(_OWORD *)&v84.m31 = v81;
    *(_OWORD *)&v84.m33 = v82;
    *(_OWORD *)&v84.m41 = v78;
    *(_OWORD *)&v84.m43 = v79;
    *(_OWORD *)&v84.m11 = v80;
    *(_OWORD *)&v84.m13 = v76;
    *(_OWORD *)&v84.m21 = v77;
    *(_OWORD *)&v84.m23 = v75;
    -[_UIStackedImageConfiguration defaultFocusedShadowVerticalOffset](self->_configuration, "defaultFocusedShadowVerticalOffset");
    *(_OWORD *)&v83.m31 = v81;
    *(_OWORD *)&v83.m33 = v82;
    *(_OWORD *)&v83.m41 = v78;
    *(_OWORD *)&v83.m43 = v79;
    *(_OWORD *)&v83.m11 = v80;
    *(_OWORD *)&v83.m13 = v76;
    *(_OWORD *)&v83.m21 = v77;
    *(_OWORD *)&v83.m23 = v75;
    CATransform3DTranslate(&v84, &v83, 0.0, (v51 + v56) * 0.5, 0.0);
    shadowLayer = self->_shadowLayer;
    v83 = v84;
    -[CALayer setTransform:](shadowLayer, "setTransform:", &v83);
    -[_UIStackedImageContainerLayer _focusedShadowRadius](self, "_focusedShadowRadius");
    v59 = (v58 + v58 - v14) * -0.5;
    v91.origin.x = v18;
    v91.origin.y = v19;
    v91.size.width = v16;
    v91.size.height = v17;
    v92 = CGRectInset(v91, v59, v59);
    -[CALayer setBounds:](self->_shadowLayer, "setBounds:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
    return;
  }
  if (-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"))
  {
    -[_UIStackedImageContainerLayer _focusedShadowRadius](self, "_focusedShadowRadius");
    v24 = v23;
    -[_UIStackedImageContainerLayer bounds](self, "bounds");
    scale = self->_scale;
    v27 = v26 * scale;
    v29 = v28 * scale;
    -[_UIStackedImageContainerLayer bounds](self, "bounds");
    v88.origin.x = round(v31 + (v30 - v27) * 0.5);
    v88.origin.y = round(v33 + (v32 - v29) * 0.5);
    v88.size.width = v27;
    v88.size.height = v29;
    v89 = CGRectInset(v88, v24 * -2.0, v24 * -2.0);
    v34 = v89.size.width + -8.0;
    v35 = -4.0;
  }
  else
  {
    if (!-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
    {
      -[_UIStackedImageContainerLayer _unfocusedShadowRadius](self, "_unfocusedShadowRadius");
      v61 = v60 * -2.0;
      v93.origin.x = v6;
      v93.origin.y = v8;
      v93.size.width = v10;
      v93.size.height = v12;
      v94 = CGRectInset(v93, v61, v61);
      v34 = v94.size.width + -4.0;
      v47 = v94.size.height + -2.0;
      if ((self->_selectionStyle | 2) == 2 && -[_UIStackedImageContainerLayer _isSelected](self, "_isSelected"))
      {
        v34 = v34 * 1.13;
        v47 = v47 * 1.13;
      }
      goto LABEL_17;
    }
    -[_UIStackedImageContainerLayer _focusedShadowRadius](self, "_focusedShadowRadius");
    v37 = v36;
    -[_UIStackedImageContainerLayer _scaledSizeForCurrentState](self, "_scaledSizeForCurrentState");
    v39 = v38;
    v41 = v40;
    -[_UIStackedImageContainerLayer bounds](self, "bounds");
    v90.origin.x = round(v43 + (v42 - v39) * 0.5);
    v90.origin.y = round(v45 + (v44 - v41) * 0.5);
    v90.size.width = v39;
    v90.size.height = v41;
    v89 = CGRectInset(v90, v37 * -2.0, v37 * -2.0);
    v34 = v46 + -12.0;
    v35 = -6.0;
  }
  v47 = v89.size.height + v35;
LABEL_17:
  v48 = *MEMORY[0x1E0C9D538];
  v49 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"))
  {
    -[_UIStackedImageConfiguration defaultHighlightedShadowVerticalOffset](self->_configuration, "defaultHighlightedShadowVerticalOffset");
  }
  else if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
  {
    -[_UIStackedImageConfiguration defaultFocusedShadowVerticalOffset](self->_configuration, "defaultFocusedShadowVerticalOffset");
  }
  else
  {
    v62 = -[_UIStackedImageContainerLayer isSelected](self, "isSelected");
    v63 = self->_configuration;
    if (v62)
      -[_UIStackedImageConfiguration defaultSelectedShadowVerticalOffset](v63, "defaultSelectedShadowVerticalOffset");
    else
      -[_UIStackedImageConfiguration defaultUnfocusedShadowVerticalOffset](v63, "defaultUnfocusedShadowVerticalOffset");
  }
  v64 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v85.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v85.m33 = v64;
  v65 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v85.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v85.m43 = v65;
  v66 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v85.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v85.m13 = v66;
  v67 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v85.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v85.m23 = v67;
  *(_OWORD *)&v84.m31 = *(_OWORD *)&v85.m31;
  *(_OWORD *)&v84.m33 = v64;
  *(_OWORD *)&v84.m41 = *(_OWORD *)&v85.m41;
  *(_OWORD *)&v84.m43 = v65;
  *(_OWORD *)&v84.m11 = *(_OWORD *)&v85.m11;
  *(_OWORD *)&v84.m13 = v66;
  *(_OWORD *)&v84.m21 = *(_OWORD *)&v85.m21;
  *(_OWORD *)&v84.m23 = v67;
  CATransform3DTranslate(&v85, &v84, 0.0, v50, 0.0);
  v68 = self->_shadowLayer;
  v84 = v85;
  -[CALayer setTransform:](v68, "setTransform:", &v84);
  -[CALayer setBounds:](self->_shadowLayer, "setBounds:", v48, v49, v34, v47);
  -[_UIStackedImageContainerLayer contentsScale](self, "contentsScale");
  v70 = v69;
  if (!-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle")
    && !-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"))
  {
    -[_UIStackedImageContainerLayer _focusedShadowRadius](self, "_focusedShadowRadius");
    v72 = v71;
    -[_UIStackedImageContainerLayer _unfocusedShadowRadius](self, "_unfocusedShadowRadius");
    if (v73 > 0.0)
      v70 = v70 * (v72 / v73);
  }
  -[CALayer contentsScale](self->_shadowLayer, "contentsScale");
  if (v70 != v74)
    -[CALayer setContentsScale:](self->_shadowLayer, "setContentsScale:", v70);
}

- (void)_updateShadowPositionWithOffset:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  -[_UIStackedImageContainerLayer bounds](self, "bounds");
  v6 = v13.origin.x;
  v7 = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v10 = CGRectGetWidth(v13) * 0.5;
  v14.origin.x = v6;
  v14.origin.y = v7;
  v14.size.width = width;
  v14.size.height = height;
  v11 = x + v10;
  v12 = y + CGRectGetHeight(v14) * 0.5;
  -[CALayer setPosition:](self->_shadowLayer, "setPosition:", v11, v12);
  -[CALayer setPosition:](self->_unfocusedShadowLayer, "setPosition:", v11, v12);
}

- (void)_updateShadowWithAnimationCoordinator:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL IsEmpty;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CALayer *v23;
  CALayer *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  _BOOL4 v42;
  double v43;
  CALayer *shadowLayer;
  CALayer *unfocusedShadowLayer;
  double v46;
  double v47;
  id v48;
  CGRect v49;

  v4 = a3;
  v5 = v4;
  if (self->_nonOpaqueShadow)
  {
    v48 = v4;
    if (-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"))
    {
      -[_UIStackedImageContainerLayer _focusedShadowRadius](self, "_focusedShadowRadius");
      v7 = v6;
      -[_UIStackedImageConfiguration defaultHighlightedShadowVerticalOffset](self->_configuration, "defaultHighlightedShadowVerticalOffset");
    }
    else if (-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle"))
    {
      -[_UIStackedImageContainerLayer _focusedShadowRadius](self, "_focusedShadowRadius");
      v7 = v33;
      -[_UIStackedImageConfiguration defaultFocusedShadowVerticalOffset](self->_configuration, "defaultFocusedShadowVerticalOffset");
    }
    else if (-[_UIStackedImageContainerLayer isSelected](self, "isSelected"))
    {
      -[_UIStackedImageContainerLayer _focusedShadowRadius](self, "_focusedShadowRadius");
      v7 = v34;
      -[_UIStackedImageConfiguration defaultSelectedShadowVerticalOffset](self->_configuration, "defaultSelectedShadowVerticalOffset");
    }
    else
    {
      -[_UIStackedImageContainerLayer _unfocusedShadowRadius](self, "_unfocusedShadowRadius");
      v7 = v35;
      -[_UIStackedImageConfiguration defaultUnfocusedShadowVerticalOffset](self->_configuration, "defaultUnfocusedShadowVerticalOffset");
    }
    v36 = v8;
    -[_UIStackedImageContainerLayer _getShadowOpacity](self, "_getShadowOpacity");
    v38 = v37;
    -[NSArray firstObject](self->_imageLayers, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setShadowRadius:", v7);
    objc_msgSend(v39, "setShadowOffset:", 0.0, v36);
    *(float *)&v38 = v38;
    LODWORD(v40) = LODWORD(v38);
    objc_msgSend(v39, "setShadowOpacity:", v40);
    v23 = self->_flatLayer;

    -[CALayer setShadowRadius:](v23, "setShadowRadius:", v7);
    -[CALayer setShadowOffset:](v23, "setShadowOffset:", 0.0, v36);
    LODWORD(v41) = LODWORD(v38);
    -[CALayer setShadowOpacity:](v23, "setShadowOpacity:", v41);
LABEL_24:

    v5 = v48;
    goto LABEL_25;
  }
  if (self->_shadowLayer)
  {
    v48 = v4;
    -[_UIStackedImageContainerLayer bounds](self, "bounds");
    IsEmpty = CGRectIsEmpty(v49);
    v5 = v48;
    if (!IsEmpty)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceStyle");

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      -[_UIStackedImageContainerLayer _focusedShadowRadius](self, "_focusedShadowRadius");
      v14 = v13;
      if (v12 == 1000)
        v15 = 1.0;
      else
        v15 = 0.0;
      if (v12 == 1000)
        v16 = 0.3;
      else
        v16 = 1.0;
      -[_UIStackedImageContainerLayer contentsScale](self, "contentsScale");
      v18 = v17;
      -[_UIStackedImageConfiguration cornerRadius](self->_configuration, "cornerRadius");
      v19 = v14 * v18;
      v21 = v18 * v20;
      -[_UIStackedImageConfiguration isContinuousCornerRadiusEnabled](self->_configuration, "isContinuousCornerRadiusEnabled");
      CachedShadowContents(v22 != 0.0, v19, v21, v15, v16);
      v23 = (CALayer *)objc_claimAutoreleasedReturnValue();
      -[CALayer contents](self->_shadowLayer, "contents");
      v24 = (CALayer *)objc_claimAutoreleasedReturnValue();

      if (v24 != v23)
      {
        -[CALayer setContents:](self->_shadowLayer, "setContents:", v23);
        -[CALayer setContentsCenter:](self->_shadowLayer, "setContentsCenter:", 0.5, 0.5, 0.0, 0.0);
      }
      -[_UIStackedImageContainerLayer _unfocusedShadowRadius](self, "_unfocusedShadowRadius");
      v26 = v18 * v25;
      -[_UIStackedImageConfiguration isContinuousCornerRadiusEnabled](self->_configuration, "isContinuousCornerRadiusEnabled");
      CachedShadowContents(v27 != 0.0, v26, v21, v15, v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer contents](self->_unfocusedShadowLayer, "contents");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29 != v28)
      {
        -[CALayer setContents:](self->_unfocusedShadowLayer, "setContents:", v28);
        -[CALayer setContentsCenter:](self->_unfocusedShadowLayer, "setContentsCenter:", 0.5, 0.5, 0.0, 0.0);
      }
      -[_UIStackedImageContainerLayer _updateShadowBounds](self, "_updateShadowBounds");
      v30 = (void *)MEMORY[0x1E0CD28B0];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAnimationTimingFunction:", v31);

      if (-[_UIStackedImageContainerLayer _isHighlighted](self, "_isHighlighted"))
        v32 = 0;
      else
        v32 = !-[_UIStackedImageContainerLayer _isFocusedOrFocusedIdle](self, "_isFocusedOrFocusedIdle");
      v42 = -[_UIStackedImageConfiguration useSeparateUnfocusedShadowImage](self->_configuration, "useSeparateUnfocusedShadowImage");
      shadowLayer = self->_shadowLayer;
      if (v42 && (v32 & 1) != 0)
      {
        LODWORD(v43) = 0;
        -[CALayer setOpacity:](self->_shadowLayer, "setOpacity:", v43);
        unfocusedShadowLayer = self->_unfocusedShadowLayer;
        -[_UIStackedImageContainerLayer _getShadowOpacity](self, "_getShadowOpacity");
        *(float *)&v46 = v46;
      }
      else
      {
        -[_UIStackedImageContainerLayer _getShadowOpacity](self, "_getShadowOpacity");
        *(float *)&v47 = v47;
        -[CALayer setOpacity:](shadowLayer, "setOpacity:", v47);
        unfocusedShadowLayer = self->_unfocusedShadowLayer;
        LODWORD(v46) = 0;
      }
      -[CALayer setOpacity:](unfocusedShadowLayer, "setOpacity:", v46);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

      goto LABEL_24;
    }
  }
LABEL_25:

}

- (_UIStackedImageConfiguration)configuration
{
  return self->_configuration;
}

- (UINamedLayerStack)layerStack
{
  return self->_layerStack;
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (CGPoint)focusDirection
{
  double x;
  double y;
  CGPoint result;

  x = self->_focusDirection.x;
  y = self->_focusDirection.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerStack, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_layoutDelegate, 0);
  objc_storeStrong((id *)&self->_frontmostRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_frontmostPerspectiveTransformLayer, 0);
  objc_storeStrong((id *)&self->_cursorRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayPerspectiveTransformLayer, 0);
  objc_storeStrong((id *)&self->_maskRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_maskPerspectiveTransformLayer, 0);
  objc_storeStrong((id *)&self->_imageRotationTransformLayer, 0);
  objc_storeStrong((id *)&self->_imagePerspectiveTransformLayer, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayContainerLayer, 0);
  objc_storeStrong((id *)&self->_unmaskedOverlayLayer, 0);
  objc_storeStrong((id *)&self->_overlayContainerLayer, 0);
  objc_storeStrong((id *)&self->_overlayLayer, 0);
  objc_storeStrong((id *)&self->_focusKeylineStrokeLayer, 0);
  objc_storeStrong((id *)&self->_cursorLayerContainer, 0);
  objc_storeStrong((id *)&self->_cursorLayer, 0);
  objc_storeStrong((id *)&self->_specularLayer, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_selectedPlaceholderLayer, 0);
  objc_storeStrong((id *)&self->_radiosityLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_flatLayer, 0);
  objc_storeStrong((id *)&self->_imageLayers, 0);
  objc_storeStrong((id *)&self->_imageLayersContainer, 0);
  objc_storeStrong((id *)&self->_parallaxLayerDepths, 0);
  objc_storeStrong((id *)&self->_parallaxImages, 0);
  objc_storeStrong(&self->_flatImage, 0);
  objc_storeStrong((id *)&self->_imageStackContentsGravity, 0);
}

@end

@implementation PUParallaxLayerStackViewModel

- (PUParallaxLayerStackViewModel)initWithSegmentationItem:(id)a3 initialStyle:(id)a4 compoundLayerStack:(id)a5 deviceOrientation:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PUParallaxLayerStackViewModel *v14;
  void *v15;
  void *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackViewModel.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item != nil"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v11, "originalStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PUParallaxLayerStackViewModel initWithSegmentationItem:compoundLayerStack:style:deviceOrientation:](self, "initWithSegmentationItem:compoundLayerStack:style:deviceOrientation:", v11, v13, v16, a6);

    goto LABEL_6;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v14 = -[PUParallaxLayerStackViewModel initWithSegmentationItem:compoundLayerStack:style:deviceOrientation:](self, "initWithSegmentationItem:compoundLayerStack:style:deviceOrientation:", v11, v13, v12, a6);
LABEL_6:

  return v14;
}

- (PUParallaxLayerStackViewModel)initWithCompoundLayerStack:(id)a3 style:(id)a4 deviceOrientation:(int64_t)a5
{
  return -[PUParallaxLayerStackViewModel initWithSegmentationItem:compoundLayerStack:style:deviceOrientation:](self, "initWithSegmentationItem:compoundLayerStack:style:deviceOrientation:", 0, a3, a4, a5);
}

- (PUParallaxLayerStackViewModel)initWithSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 deviceOrientation:(int64_t)a6
{
  id v12;
  id v13;
  id v14;
  PUParallaxLayerStackViewModel *v15;
  uint64_t v16;
  PFParallaxLayerStack *portraitLayerStack;
  uint64_t v18;
  PFParallaxLayerStack *landscapeLayerStack;
  void *v20;
  PUParallaxLayerStackViewManager *v21;
  PUParallaxLayerStackViewManager *viewManager;
  uint64_t v23;
  uint64_t v24;
  PXUpdater *updater;
  void *v27;
  _QWORD v28[4];
  PUParallaxLayerStackViewModel *v29;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackViewModel.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compoundLayerStack != nil"));

  }
  v30.receiver = self;
  v30.super_class = (Class)PUParallaxLayerStackViewModel;
  v15 = -[PUParallaxLayerStackViewModel init](&v30, sel_init);
  if (v15)
  {
    objc_msgSend(v13, "portraitLayerStack");
    v16 = objc_claimAutoreleasedReturnValue();
    portraitLayerStack = v15->_portraitLayerStack;
    v15->_portraitLayerStack = (PFParallaxLayerStack *)v16;

    objc_msgSend(v13, "landscapeLayerStack");
    v18 = objc_claimAutoreleasedReturnValue();
    landscapeLayerStack = v15->_landscapeLayerStack;
    v15->_landscapeLayerStack = (PFParallaxLayerStack *)v18;

    v15->_needsToAdjustVisibleFrame = v15->_landscapeLayerStack == 0;
    objc_storeStrong((id *)&v15->_segmentationItem, a3);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_storeStrong((id *)&v15->_style, v20);
    if (v14)

    v21 = -[PUParallaxLayerStackViewManager initWithViewModel:]([PUParallaxLayerStackViewManager alloc], "initWithViewModel:", v15);
    viewManager = v15->_viewManager;
    v15->_viewManager = v21;

    v15->_visibilityAmount = 1.0;
    v15->_backlightLuminance = -1;
    v15->_deviceOrientation = a6;
    v23 = 1;
    if ((unint64_t)(a6 - 3) < 2)
      v23 = 2;
    v15->_orientation = v23;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA0]), "initWithTarget:needsUpdateSelector:", v15, sel__setNeedsUpdate);
    updater = v15->_updater;
    v15->_updater = (PXUpdater *)v24;

    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateOrientation);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateVisibleFrameWithContainerFrame);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateCurrentLayerStack);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateCurrentLayout);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateCurrentNormalizedVisibleRect);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateVisibleFrameCrossesHeadroomBoundary);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateDesiredHeadroomVisibilityAmount);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateHeadroomVisibilityAmount);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateInitialPortraitLayout);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateClockAppearsAboveForeground);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateLayoutConfiguration);
    -[PXUpdater addUpdateSelector:](v15->_updater, "addUpdateSelector:", sel__updateDebugHUDRepresentation);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __101__PUParallaxLayerStackViewModel_initWithSegmentationItem_compoundLayerStack_style_deviceOrientation___block_invoke;
    v28[3] = &unk_1E58AB148;
    v29 = v15;
    -[PUParallaxLayerStackViewModel performChanges:](v29, "performChanges:", v28);

  }
  return v15;
}

- (PUParallaxLayerStackViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUParallaxLayerStackViewModel.m"), 118, CFSTR("%s is not available as initializer"), "-[PUParallaxLayerStackViewModel init]");

  abort();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PUParallaxLayerStackViewModel updater](self, "updater", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIfNeeded");

  -[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc((Class)objc_opt_class());
  if (v5)
  {
    -[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackViewModel style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bakedStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackViewModel compoundLayerStack](self, "compoundLayerStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithSegmentationItem:initialStyle:compoundLayerStack:deviceOrientation:", v7, v9, v10, -[PUParallaxLayerStackViewModel deviceOrientation](self, "deviceOrientation"));

  }
  else
  {
    -[PUParallaxLayerStackViewModel compoundLayerStack](self, "compoundLayerStack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxLayerStackViewModel style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bakedStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithCompoundLayerStack:style:deviceOrientation:", v7, v9, -[PUParallaxLayerStackViewModel deviceOrientation](self, "deviceOrientation"));
  }

  -[PUParallaxLayerStackViewModel containerFrame](self, "containerFrame");
  objc_msgSend(v11, "setContainerFrame:");
  return v11;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUParallaxLayerStackViewModel;
  -[PUParallaxLayerStackViewModel debugDescription](&v8, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewModel style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" currentLayerStack = %@, style = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)environment
{
  void *v2;
  int64_t v3;

  -[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (CGRect)_layoutRectForViewRect:(CGRect)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageSize");

  PXRectFlippedVertically();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_viewRectForLayoutRect:(CGRect)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageSize");

  PXRectFlippedVertically();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGSize)imageSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)extendedImageRect
{
  void *v3;
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
  double v15;
  CGRect result;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedImageExtent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUParallaxLayerStackViewModel _viewRectForLayoutRect:](self, "_viewRectForLayoutRect:", v5, v7, v9, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)settlingEffectBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settlingEffectNormalizedBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageSize");
  v14 = v13;
  v16 = v15;

  -[PUParallaxLayerStackViewModel _viewRectForLayoutRect:](self, "_viewRectForLayoutRect:", v5 * v14 + 0.0, v7 * v16 + 0.0, v9 * v14, v11 * v16);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)contentRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _DWORD v23[2];
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[PUParallaxLayerStackViewModel settlingEffectEnabled](self, "settlingEffectEnabled"))
    -[PUParallaxLayerStackViewModel settlingEffectBounds](self, "settlingEffectBounds");
  else
    -[PUParallaxLayerStackViewModel extendedImageRect](self, "extendedImageRect");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (CGRectIsEmpty(*(CGRect *)&v3))
  {
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = -[PUParallaxLayerStackViewModel settlingEffectEnabled](self, "settlingEffectEnabled");
      -[PUParallaxLayerStackViewModel settlingEffectBounds](self, "settlingEffectBounds");
      NSStringFromCGRect(v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUParallaxLayerStackViewModel extendedImageRect](self, "extendedImageRect");
      NSStringFromCGRect(v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = 67109634;
      v23[1] = v12;
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v14;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Empty content rect. Settling effect enabled: %d, settlingEffectBounds: %{public}@, extendedImageRect: %{public}@", (uint8_t *)v23, 0x1Cu);

    }
    -[PUParallaxLayerStackViewModel extendedImageRect](self, "extendedImageRect");
    v7 = v15;
    v8 = v16;
    v9 = v17;
    v10 = v18;
  }
  v19 = v7;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)visibleFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageSize");

  -[PUParallaxLayerStackViewModel normalizedVisibleFrame](self, "normalizedVisibleFrame");
  PXRectDenormalize();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setVisibleFrame:(CGRect)a3
{
  void *v4;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageSize");

  PXRectNormalize();
  -[PUParallaxLayerStackViewModel setNormalizedVisibleFrame:](self, "setNormalizedVisibleFrame:");
}

- (CGRect)normalizedVisibleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PUParallaxLayerStackViewModel currentNormalizedVisibleFrame](self, "currentNormalizedVisibleFrame");
  PXRectFlippedVertically();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setNormalizedVisibleFrame:(CGRect)a3
{
  -[PUParallaxLayerStackViewModel setNormalizedVisibleFrame:animated:](self, "setNormalizedVisibleFrame:animated:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setNormalizedVisibleFrame:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect *p_currentNormalizedVisibleFrame;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29[5];
  id location;

  v4 = a4;
  PXRectFlippedVertically();
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  p_currentNormalizedVisibleFrame = &self->_currentNormalizedVisibleFrame;
  if (vabdd_f64(v6, self->_currentNormalizedVisibleFrame.origin.x) > 0.0001
    || vabdd_f64(v7, self->_currentNormalizedVisibleFrame.origin.y) > 0.0001
    || vabdd_f64(v8, self->_currentNormalizedVisibleFrame.size.width) > 0.0001
    || vabdd_f64(v9, self->_currentNormalizedVisibleFrame.size.height) > 0.0001)
  {
    p_currentNormalizedVisibleFrame->origin.x = v6;
    self->_currentNormalizedVisibleFrame.origin.y = v7;
    self->_currentNormalizedVisibleFrame.size.width = v8;
    self->_currentNormalizedVisibleFrame.size.height = v9;
    v15 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      objc_initWeak(&location, self);
      -[PUParallaxLayerStackViewModel viewManager](self, "viewManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v15;
      v28[1] = 3221225472;
      v28[2] = __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke;
      v28[3] = &unk_1E58A3358;
      objc_copyWeak(v29, &location);
      v29[1] = *(id *)&v10;
      v29[2] = *(id *)&v11;
      v29[3] = *(id *)&v12;
      v29[4] = *(id *)&v13;
      objc_msgSend(v16, "layoutViewsAnimated:", v28);

      objc_destroyWeak(v29);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0x4000);
    }
    -[PUParallaxLayerStackViewModel initialPortraitLayout](self, "initialPortraitLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "normalizedVisibleFrame");
    if (vabdd_f64(v21, p_currentNormalizedVisibleFrame->origin.x) <= 0.0001
      && vabdd_f64(v18, self->_currentNormalizedVisibleFrame.origin.y) <= 0.0001
      && vabdd_f64(v19, self->_currentNormalizedVisibleFrame.size.width) <= 0.0001)
    {
      v25 = vabdd_f64(v20, self->_currentNormalizedVisibleFrame.size.height);

      if (v25 <= 0.0001)
      {
        -[PUParallaxLayerStackViewModel initialPortraitLayout](self, "initialPortraitLayout");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          goto LABEL_13;
      }
    }
    else
    {

    }
    -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutByUpdatingNormalizedVisibleFrame:", v10, v11, v12, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke_3;
    v26[3] = &unk_1E58A3380;
    v27 = v23;
    v24 = v23;
    -[PUParallaxLayerStackViewModel _updateCurrentLayerStackProperties:changeDescriptor:](self, "_updateCurrentLayerStackProperties:changeDescriptor:", v26, 0);
    -[PUParallaxLayerStackViewModel _invalidateCurrentLayout](self, "_invalidateCurrentLayout");

  }
}

- (void)setNormalizedVisibleFrameForInactiveOrientation:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  PXRectFlippedVertically();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[PUParallaxLayerStackViewModel orientation](self, "orientation");
  if (v12 == 2)
  {
    -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutByUpdatingNormalizedVisibleFrame:", v5, v7, v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "layerStackByUpdatingLayout:", v14);
    v15 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v16 = 232;
  }
  else
  {
    if (v12 != 1)
      return;
    -[PUParallaxLayerStackViewModel landscapeLayerStack](self, "landscapeLayerStack");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutByUpdatingNormalizedVisibleFrame:", v5, v7, v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "layerStackByUpdatingLayout:", v14);
    v15 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v16 = 240;
  }
  v18 = *(Class *)((char *)&self->super.super.isa + v16);
  *(Class *)((char *)&self->super.super.isa + v16) = v15;

}

- (CGRect)inactiveFrame
{
  void *v3;
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
  double v15;
  CGRect result;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inactiveFrame");
  -[PUParallaxLayerStackViewModel _viewRectForLayoutRect:](self, "_viewRectForLayoutRect:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setPortraitLayerStack:(id)a3
{
  PFParallaxLayerStack *v5;
  PFParallaxLayerStack *v6;

  v5 = (PFParallaxLayerStack *)a3;
  if (self->_portraitLayerStack != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_portraitLayerStack, a3);
    -[PUParallaxLayerStackViewModel _invalidateLayoutConfiguration](self, "_invalidateLayoutConfiguration");
    v5 = v6;
  }

}

- (void)setLandscapeLayerStack:(id)a3
{
  PFParallaxLayerStack *v5;
  PFParallaxLayerStack *v6;

  v5 = (PFParallaxLayerStack *)a3;
  if (self->_landscapeLayerStack != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_landscapeLayerStack, a3);
    -[PUParallaxLayerStackViewModel _invalidateLayoutConfiguration](self, "_invalidateLayoutConfiguration");
    v5 = v6;
  }

}

- (BOOL)depthEnabled
{
  void *v2;
  char v3;

  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "depthEnabled");

  return v3;
}

- (void)setDepthEnabled:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[4];
  char v9;
  _QWORD v10[4];
  char v11;

  v3 = a3;
  if (-[PUParallaxLayerStackViewModel appliesDepthToAllOrientations](self, "appliesDepthToAllOrientations"))
  {
    -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "depthEnabled") == v3)
    {
      -[PUParallaxLayerStackViewModel landscapeLayerStack](self, "landscapeLayerStack");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "depthEnabled");

      if (v7 == v3)
        return;
    }
    else
    {

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__PUParallaxLayerStackViewModel_setDepthEnabled___block_invoke;
    v10[3] = &__block_descriptor_33_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    v11 = v3;
    -[PUParallaxLayerStackViewModel _updateLayerStackPropertiesForAllOrientations:changeDescriptor:](self, "_updateLayerStackPropertiesForAllOrientations:changeDescriptor:", v10, 4);
  }
  else
  {
    if (-[PUParallaxLayerStackViewModel depthEnabled](self, "depthEnabled") == v3)
      return;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__PUParallaxLayerStackViewModel_setDepthEnabled___block_invoke_2;
    v8[3] = &__block_descriptor_33_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    v9 = v3;
    -[PUParallaxLayerStackViewModel _updateCurrentLayerStackProperties:changeDescriptor:](self, "_updateCurrentLayerStackProperties:changeDescriptor:", v8, 4);
  }
  -[PUParallaxLayerStackViewModel _invalidateClockAppearsAboveForeground](self, "_invalidateClockAppearsAboveForeground");
}

- (void)setAppliesDepthToAllOrientations:(BOOL)a3
{
  if (self->_appliesDepthToAllOrientations != a3)
    self->_appliesDepthToAllOrientations = a3;
}

- (BOOL)settlingEffectEnabled
{
  void *v2;
  char v3;

  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "settlingEffectEnabled");

  return v3;
}

- (void)setSettlingEffectEnabled:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;

  if (-[PUParallaxLayerStackViewModel settlingEffectEnabled](self, "settlingEffectEnabled") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__PUParallaxLayerStackViewModel_setSettlingEffectEnabled___block_invoke;
    v5[3] = &__block_descriptor_33_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    v6 = a3;
    -[PUParallaxLayerStackViewModel _updateLayerStackPropertiesForAllOrientations:changeDescriptor:](self, "_updateLayerStackPropertiesForAllOrientations:changeDescriptor:", v5, 8);
    -[PUParallaxLayerStackViewModel _invalidateClockAppearsAboveForeground](self, "_invalidateClockAppearsAboveForeground");
  }
}

- (BOOL)parallaxDisabled
{
  void *v2;
  char v3;

  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "parallaxDisabled");

  return v3;
}

- (void)setParallaxDisabled:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;

  if (-[PUParallaxLayerStackViewModel parallaxDisabled](self, "parallaxDisabled") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__PUParallaxLayerStackViewModel_setParallaxDisabled___block_invoke;
    v5[3] = &__block_descriptor_33_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    v6 = a3;
    -[PUParallaxLayerStackViewModel _updateLayerStackPropertiesForAllOrientations:changeDescriptor:](self, "_updateLayerStackPropertiesForAllOrientations:changeDescriptor:", v5, 1);
  }
}

- (BOOL)canApplyParallax
{
  return !-[PUParallaxLayerStackViewModel parallaxDisabled](self, "parallaxDisabled")
      && -[PUParallaxLayerStackViewModel hasEnoughRoomForParallax](self, "hasEnoughRoomForParallax");
}

- (BOOL)hasEnoughRoomForParallax
{
  void *v2;
  char v3;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canApplyParallax");

  return v3;
}

- (BOOL)hasMatte
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentationMatte");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)canEnableDepthEffect
{
  void *v3;
  void *v4;
  BOOL result;

  result = -[PUParallaxLayerStackViewModel environment](self, "environment") == 2
        && -[PUParallaxLayerStackViewModel clockIntersection](self, "clockIntersection") != 3
        && (-[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "segmentationMatte"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v4,
            v3,
            v4)
        && -[PUParallaxLayerStackViewModel clockIntersection](self, "clockIntersection") == 1;
  return result;
}

- (BOOL)canEnableSettlingEffect
{
  void *v3;
  int v4;
  void *v5;
  BOOL IsEmpty;
  CGRect v8;

  -[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSettlingEffectAvailable");

  if (!v4)
    return 0;
  -[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settlingEffectNormalizedBounds");
  IsEmpty = CGRectIsEmpty(v8);

  return !IsEmpty;
}

- (BOOL)canCreateSettlingEffectLayerView
{
  int v3;
  void *v4;

  if (-[PUParallaxLayerStackViewModel environment](self, "environment") == 2
    || -[PUParallaxLayerStackViewModel shouldLoopSettlingEffectForGallery](self, "shouldLoopSettlingEffectForGallery"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isLowPowerModeEnabled") ^ 1;

  }
  return v3;
}

- (BOOL)mainLayersArePruned
{
  void *v3;
  int v4;
  void *v5;

  -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasMainLayers") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[PUParallaxLayerStackViewModel landscapeLayerStack](self, "landscapeLayerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasMainLayers") ^ 1;

  }
  return v4;
}

- (BOOL)representsPureStyle
{
  void *v2;
  void *v3;
  char v4;

  -[PUParallaxLayerStackViewModel style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755E0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755F8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755E8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D755F0]);
  }

  return v4;
}

- (BOOL)canApplyHeadroom
{
  void *v2;
  void *v3;
  char v4;

  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canApplyHeadroom");

  return v4;
}

- (BOOL)headroomLayoutUsesHeadroomArea
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = -[PUParallaxLayerStackViewModel orientation](self, "orientation");
  -[PUParallaxLayerStackViewModel segmentationItem](self, "segmentationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headroomLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 == 2)
    objc_msgSend(v5, "landscapeLayout");
  else
    objc_msgSend(v5, "portraitLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isUsingHeadroom");
  return v8;
}

- (void)setStyle:(id)a3
{
  PIParallaxStyle *v5;
  PIParallaxStyle *v6;
  char v7;
  uint64_t v8;
  PIParallaxStyle *v9;

  v9 = (PIParallaxStyle *)a3;
  v5 = self->_style;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PIParallaxStyle isEqual:](v5, "isEqual:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = objc_msgSend((id)objc_opt_class(), "_changeDescriptorBetweenOldStyle:newStyle:", self->_style, v9);
      objc_storeStrong((id *)&self->_style, a3);
      if (v8)
      {
        -[PUParallaxLayerStackViewModel _invalidateDebugHUDRepresentation](self, "_invalidateDebugHUDRepresentation");
        -[PUParallaxLayerStackViewModel _invalidateHeadroomVisibilityAmount](self, "_invalidateHeadroomVisibilityAmount");
        -[PUParallaxLayerStackViewModel _signalStylePropertiesChange:](self, "_signalStylePropertiesChange:", v8);
      }
    }
  }

}

- (void)setContainerFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_containerFrame;
  uint64_t v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_containerFrame = &self->_containerFrame;
  if (!CGRectEqualToRect(self->_containerFrame, a3))
  {
    p_containerFrame->origin.x = x;
    p_containerFrame->origin.y = y;
    p_containerFrame->size.width = width;
    p_containerFrame->size.height = height;
    v9 = -[PUParallaxLayerStackViewModel didSetContainerFrame](self, "didSetContainerFrame") ^ 1;
    -[PUParallaxLayerStackViewModel setDidSetContainerFrame:](self, "setDidSetContainerFrame:", 1);
    -[PUParallaxLayerStackViewModel _updateVisibleFrameWithContainerFrameSetFirstTime:](self, "_updateVisibleFrameWithContainerFrameSetFirstTime:", v9);
    -[PUParallaxLayerStackViewModel _invalidateOrientation](self, "_invalidateOrientation");
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 512);
  }
}

- (void)_updateVisibleFrameWithContainerFrameSetFirstTime:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  int v6;
  char v7;
  void (**v8)(_QWORD);
  _QWORD v9[5];
  char v10;

  v3 = a3;
  v5 = -[PUParallaxLayerStackViewModel orientation](self, "orientation");
  -[PUParallaxLayerStackViewModel containerFrame](self, "containerFrame");
  v6 = objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration");
  v7 = v6;
  if (v6 && -[PUParallaxLayerStackViewModel needsToAdjustVisibleFrame](self, "needsToAdjustVisibleFrame") && v5 == 2)
    PXRectTransposed();
  PXRectTransposed();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PUParallaxLayerStackViewModel__updateVisibleFrameWithContainerFrameSetFirstTime___block_invoke;
  v9[3] = &unk_1E58A33C8;
  v10 = v7;
  v9[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(v9);
  if (v3)
  {
    -[PUParallaxLayerStackViewModel visibleFrame](self, "visibleFrame");
    -[PUParallaxLayerStackViewModel setPortraitVisibleFrame:](self, "setPortraitVisibleFrame:");
    -[PUParallaxLayerStackViewModel portraitVisibleFrame](self, "portraitVisibleFrame");
    v8[2](v8);
    -[PUParallaxLayerStackViewModel setLandscapeVisibleFrame:](self, "setLandscapeVisibleFrame:");
  }
  if (v5 == 2)
    -[PUParallaxLayerStackViewModel landscapeVisibleFrame](self, "landscapeVisibleFrame");
  else
    -[PUParallaxLayerStackViewModel portraitVisibleFrame](self, "portraitVisibleFrame");
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    -[PUParallaxLayerStackViewModel portraitVisibleFrame](self, "portraitVisibleFrame");
    v8[2](v8);
    -[PUParallaxLayerStackViewModel setPortraitVisibleFrame:](self, "setPortraitVisibleFrame:");
    -[PUParallaxLayerStackViewModel portraitVisibleFrame](self, "portraitVisibleFrame");
    v8[2](v8);
    -[PUParallaxLayerStackViewModel setLandscapeVisibleFrame:](self, "setLandscapeVisibleFrame:");
    -[PUParallaxLayerStackViewModel setNeedsToAdjustVisibleFrame:](self, "setNeedsToAdjustVisibleFrame:", 1);
  }
  if (-[PUParallaxLayerStackViewModel needsToAdjustVisibleFrame](self, "needsToAdjustVisibleFrame"))
  {
    if (v5 == 2)
      -[PUParallaxLayerStackViewModel landscapeVisibleFrame](self, "landscapeVisibleFrame");
    else
      -[PUParallaxLayerStackViewModel portraitVisibleFrame](self, "portraitVisibleFrame");
    -[PUParallaxLayerStackViewModel setVisibleFrame:](self, "setVisibleFrame:");
  }

}

- (void)setParallaxVector:(CGPoint)a3
{
  if (self->_parallaxVector.x != a3.x || self->_parallaxVector.y != a3.y)
  {
    self->_parallaxVector = a3;
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0x2000);
  }
}

- (void)setVisibilityAmount:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_visibilityAmount = a3;
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 1024);
  }
}

- (void)setBacklightLuminance:(int64_t)a3
{
  if (self->_backlightLuminance != a3)
  {
    self->_backlightLuminance = a3;
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (void)setDeviceOrientation:(int64_t)a3
{
  if (self->_deviceOrientation != a3)
  {
    self->_deviceOrientation = a3;
    -[PUParallaxLayerStackViewModel _invalidateOrientation](self, "_invalidateOrientation");
    -[PUParallaxLayerStackViewModel _invalidateDebugHUDRepresentation](self, "_invalidateDebugHUDRepresentation");
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0x20000);
  }
}

- (void)setLayoutOrder:(int64_t)a3
{
  if (self->_layoutOrder != a3)
  {
    self->_layoutOrder = a3;
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 64);
  }
}

- (void)setShouldLoopSettlingEffectForGallery:(BOOL)a3
{
  if (self->_shouldLoopSettlingEffectForGallery != a3)
  {
    self->_shouldLoopSettlingEffectForGallery = a3;
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0x200000);
  }
}

- (void)setShowsDebugHUD:(BOOL)a3
{
  if (self->_showsDebugHUD != a3)
  {
    self->_showsDebugHUD = a3;
    -[PUParallaxLayerStackViewModel _invalidateDebugHUDRepresentation](self, "_invalidateDebugHUDRepresentation");
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0x80000);
  }
}

- (void)updateLayerStack:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PUParallaxLayerStackViewModel_updateLayerStack___block_invoke;
  v6[3] = &unk_1E58A3380;
  v5 = v4;
  v7 = v5;
  -[PUParallaxLayerStackViewModel _updateCurrentLayerStackProperties:changeDescriptor:](self, "_updateCurrentLayerStackProperties:changeDescriptor:", v6, 2);
  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration")
    && -[PUParallaxLayerStackViewModel needsToAdjustVisibleFrame](self, "needsToAdjustVisibleFrame")
    && -[PUParallaxLayerStackViewModel orientation](self, "orientation") == 2)
  {
    -[PUParallaxLayerStackViewModel setNeedsToAdjustVisibleFrame:](self, "setNeedsToAdjustVisibleFrame:", 0);
  }

}

- (void)updateBackfillLayersFromLayerStack:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PUParallaxLayerStackViewModel_updateBackfillLayersFromLayerStack___block_invoke;
  v6[3] = &unk_1E58A3380;
  v7 = v4;
  v5 = v4;
  -[PUParallaxLayerStackViewModel _updateLayerStackPropertiesForAllOrientations:changeDescriptor:](self, "_updateLayerStackPropertiesForAllOrientations:changeDescriptor:", v6, 2);

}

- (void)updateHeadroomLayerFromLayerStack:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PUParallaxLayerStackViewModel_updateHeadroomLayerFromLayerStack___block_invoke;
  v6[3] = &unk_1E58A3380;
  v7 = v4;
  v5 = v4;
  -[PUParallaxLayerStackViewModel _updateCurrentLayerStackProperties:changeDescriptor:](self, "_updateCurrentLayerStackProperties:changeDescriptor:", v6, 2);

}

- (void)pruneMainLayers
{
  -[PUParallaxLayerStackViewModel _updateLayerStackPropertiesForAllOrientations:changeDescriptor:](self, "_updateLayerStackPropertiesForAllOrientations:changeDescriptor:", &__block_literal_global_54614, 2);
}

- (NSString)clockLayerOrder
{
  void *v2;
  void *v3;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clockLayerOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setClockLayerOrder:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[PUParallaxLayerStackViewModel clockLayerOrder](self, "clockLayerOrder");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__PUParallaxLayerStackViewModel_setClockLayerOrder___block_invoke;
    v6[3] = &unk_1E58A3380;
    v7 = v4;
    -[PUParallaxLayerStackViewModel _updateCurrentLayerStackProperties:changeDescriptor:](self, "_updateCurrentLayerStackProperties:changeDescriptor:", v6, 16);
    -[PUParallaxLayerStackViewModel _invalidateCurrentLayout](self, "_invalidateCurrentLayout");

  }
}

- (void)setClockAreaLuminance:(double)a3
{
  void *v5;
  double v6;
  double v7;
  _QWORD v8[5];

  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clockAreaLuminance");
  v7 = vabdd_f64(a3, v6);

  if (v7 > 0.00000999999975)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__PUParallaxLayerStackViewModel_setClockAreaLuminance___block_invoke;
    v8[3] = &__block_descriptor_40_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    *(double *)&v8[4] = a3;
    -[PUParallaxLayerStackViewModel _updateCurrentLayerStackProperties:changeDescriptor:](self, "_updateCurrentLayerStackProperties:changeDescriptor:", v8, 32);
  }
}

- (unint64_t)clockIntersection
{
  void *v2;
  unint64_t v3;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clockIntersection");

  return v3;
}

- (void)setClockIntersection:(unint64_t)a3
{
  _QWORD v5[5];

  if (-[PUParallaxLayerStackViewModel clockIntersection](self, "clockIntersection") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__PUParallaxLayerStackViewModel_setClockIntersection___block_invoke;
    v5[3] = &__block_descriptor_40_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    v5[4] = a3;
    -[PUParallaxLayerStackViewModel _updateCurrentLayerStackProperties:changeDescriptor:](self, "_updateCurrentLayerStackProperties:changeDescriptor:", v5, 0);
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 256);
    -[PUParallaxLayerStackViewModel _invalidateCurrentLayout](self, "_invalidateCurrentLayout");
  }
}

- (void)updateSettlingEffectWithSegmentationItem:(id)a3 layerStack:(id)a4
{
  PISegmentationItem *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v7 = (PISegmentationItem *)a3;
  if (self->_segmentationItem != v7)
  {
    objc_storeStrong((id *)&self->_segmentationItem, a3);
    v8 = a4;
    objc_msgSend(v8, "settlingEffectLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __85__PUParallaxLayerStackViewModel_updateSettlingEffectWithSegmentationItem_layerStack___block_invoke;
      v10[3] = &unk_1E58A3380;
      v11 = v9;
      -[PUParallaxLayerStackViewModel _updateLayerStackPropertiesForAllOrientations:changeDescriptor:](self, "_updateLayerStackPropertiesForAllOrientations:changeDescriptor:", v10, 2);

    }
  }

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackViewModel;
  -[PUParallaxLayerStackViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUParallaxLayerStackViewModel;
  -[PUParallaxLayerStackViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0);
}

- (void)didEndChangeHandling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackViewModel;
  -[PUParallaxLayerStackViewModel didEndChangeHandling](&v3, sel_didEndChangeHandling);
  -[PUParallaxLayerStackViewModel setCurrentLayerStackPropertiesChange:](self, "setCurrentLayerStackPropertiesChange:", 0);
  -[PUParallaxLayerStackViewModel setStylePropertiesChange:](self, "setStylePropertiesChange:", 0);
}

- (void)_invalidateOrientation
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateOrientation);

}

- (void)_updateOrientation
{
  double v3;
  uint64_t v4;

  -[PUParallaxLayerStackViewModel containerFrame](self, "containerFrame");
  PXSizeGetAspectRatio();
  if (v3 <= 1.0)
  {
    if (-[PUParallaxLayerStackViewModel deviceOrientation](self, "deviceOrientation"))
    {
      if ((unint64_t)(-[PUParallaxLayerStackViewModel deviceOrientation](self, "deviceOrientation") - 3) >= 2)
        v4 = 1;
      else
        v4 = 2;
    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = 2;
  }
  -[PUParallaxLayerStackViewModel setOrientation:](self, "setOrientation:", v4);
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[PUParallaxLayerStackViewModel _invalidateCurrentLayerStack](self, "_invalidateCurrentLayerStack");
    -[PUParallaxLayerStackViewModel _invalidateVisibleFrameWithContainerFrame](self, "_invalidateVisibleFrameWithContainerFrame");
    -[PUParallaxLayerStackViewModel _invalidateDebugHUDRepresentation](self, "_invalidateDebugHUDRepresentation");
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)_invalidateVisibleFrameWithContainerFrame
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateVisibleFrameWithContainerFrame);

}

- (void)_updateVisibleFrameWithContainerFrame
{
  CGRect v3;

  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration")
    && -[PUParallaxLayerStackViewModel needsToAdjustVisibleFrame](self, "needsToAdjustVisibleFrame"))
  {
    -[PUParallaxLayerStackViewModel containerFrame](self, "containerFrame");
    if (!CGRectIsEmpty(v3))
      -[PUParallaxLayerStackViewModel _updateVisibleFrameWithContainerFrameSetFirstTime:](self, "_updateVisibleFrameWithContainerFrameSetFirstTime:", 0);
  }
}

- (void)_invalidateCurrentLayerStack
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentLayerStack);

}

- (void)_updateCurrentLayerStack
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = -[PUParallaxLayerStackViewModel orientation](self, "orientation");
  if (!v3)
  {
LABEL_4:
    -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v3 != 2)
  {
    if (v3 != 1)
    {
      v4 = 0;
      goto LABEL_10;
    }
    goto LABEL_4;
  }
  -[PUParallaxLayerStackViewModel landscapeLayerStack](self, "landscapeLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v4 = (uint64_t)v8;
LABEL_10:
  v9 = (id)v4;
  -[PUParallaxLayerStackViewModel setCurrentLayerStack:](self, "setCurrentLayerStack:", v4);

}

- (void)setCurrentLayerStack:(id)a3
{
  PFParallaxLayerStack *v5;
  PFParallaxLayerStack *v6;
  char v7;
  PFParallaxLayerStack *v8;

  v8 = (PFParallaxLayerStack *)a3;
  v5 = self->_currentLayerStack;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFParallaxLayerStack isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentLayerStack, a3);
      -[PUParallaxLayerStackViewModel _invalidateCurrentLayout](self, "_invalidateCurrentLayout");
      -[PUParallaxLayerStackViewModel _invalidateCurrentNormalizedVisibleRect](self, "_invalidateCurrentNormalizedVisibleRect");
      -[PUParallaxLayerStackViewModel _invalidateHeadroomVisibilityAmount](self, "_invalidateHeadroomVisibilityAmount");
      -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)_invalidateCurrentLayout
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentLayout);

}

- (void)_updateCurrentLayout
{
  void *v3;
  id v4;

  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewModel setCurrentLayout:](self, "setCurrentLayout:", v3);

}

- (void)setCurrentLayout:(id)a3
{
  PFPosterOrientedLayout *v5;
  PFPosterOrientedLayout *v6;
  char v7;
  PFPosterOrientedLayout *v8;

  v8 = (PFPosterOrientedLayout *)a3;
  v5 = self->_currentLayout;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFPosterOrientedLayout isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentLayout, a3);
      -[PUParallaxLayerStackViewModel _invalidateClockAppearsAboveForeground](self, "_invalidateClockAppearsAboveForeground");
      -[PUParallaxLayerStackViewModel _invalidateInitialPortraitLayout](self, "_invalidateInitialPortraitLayout");
      -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)_invalidateCurrentNormalizedVisibleRect
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentNormalizedVisibleRect);

}

- (void)_updateCurrentNormalizedVisibleRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedVisibleFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  if (CGRectIsEmpty(v30))
  {
    -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageSize");
    PXRectWithOriginAndSize();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deviceResolution");
    PXSizeGetAspectRatio();
    PXRectWithAspectRatioFittingRect();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v5 = v23 - v14;
    v11 = 0.0;
    v9 = 0.0;
    if (v18 != 0.0)
    {
      v5 = v5 / v18;
      v9 = v27 / v18;
    }
    v7 = v25 - v16;
    if (v20 != 0.0)
    {
      v7 = v7 / v20;
      v11 = v29 / v20;
    }
  }
  -[PUParallaxLayerStackViewModel setCurrentNormalizedVisibleFrame:](self, "setCurrentNormalizedVisibleFrame:", v5, v7, v9, v11);
}

- (void)setCurrentNormalizedVisibleFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_currentNormalizedVisibleFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_currentNormalizedVisibleFrame = &self->_currentNormalizedVisibleFrame;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_currentNormalizedVisibleFrame->origin.x = x;
    p_currentNormalizedVisibleFrame->origin.y = y;
    p_currentNormalizedVisibleFrame->size.width = width;
    p_currentNormalizedVisibleFrame->size.height = height;
    -[PUParallaxLayerStackViewModel _invalidateVisibleFrameCrossesHeadroomBoundary](self, "_invalidateVisibleFrameCrossesHeadroomBoundary");
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0x4000);
  }
}

- (void)_invalidateInitialPortraitLayout
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInitialPortraitLayout);

}

- (void)_updateInitialPortraitLayout
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[PUParallaxLayerStackViewModel currentLayout](self, "currentLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalizedVisibleFrame");
  PXSizeGetAspectRatio();
  v4 = v3;
  -[PUParallaxLayerStackViewModel initialPortraitLayout](self, "initialPortraitLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && v4 <= 1.0)
    -[PUParallaxLayerStackViewModel setInitialPortraitLayout:](self, "setInitialPortraitLayout:", v6);

}

- (void)_invalidateClockAppearsAboveForeground
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateClockAppearsAboveForeground);

}

- (void)_updateClockAppearsAboveForeground
{
  void *v3;
  _BOOL8 v4;
  id v5;

  -[PUParallaxLayerStackViewModel clockLayerOrder](self, "clockLayerOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUParallaxLayerStackViewModel clockLayerOrder](self, "clockLayerOrder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D75680]) & 1) != 0
      || !-[PUParallaxLayerStackViewModel depthEnabled](self, "depthEnabled")
      || -[PUParallaxLayerStackViewModel settlingEffectEnabled](self, "settlingEffectEnabled");
    -[PUParallaxLayerStackViewModel setClockAppearsAboveForeground:](self, "setClockAppearsAboveForeground:", v4);

  }
}

- (void)setClockAppearsAboveForeground:(BOOL)a3
{
  if (self->_clockAppearsAboveForeground != a3)
  {
    self->_clockAppearsAboveForeground = a3;
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 4096);
  }
}

- (PFWallpaperCompoundLayerStack)compoundLayerStack
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D75348]);
  -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewModel landscapeLayerStack](self, "landscapeLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithPortraitLayerStack:landscapeLayerStack:", v4, v5);

  return (PFWallpaperCompoundLayerStack *)v6;
}

- (void)_invalidateLayoutConfiguration
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateLayoutConfiguration);

}

- (void)_updateLayoutConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0D75340]);
  -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewModel landscapeLayerStack](self, "landscapeLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithPortraitConfiguration:landscapeConfiguration:", v5, v8);
  -[PUParallaxLayerStackViewModel setLayoutConfiguration:](self, "setLayoutConfiguration:", v9);

}

- (void)_invalidateVisibleFrameCrossesHeadroomBoundary
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateVisibleFrameCrossesHeadroomBoundary);

}

- (void)_updateVisibleFrameCrossesHeadroomBoundary
{
  CGRect v3;

  if (-[PUParallaxLayerStackViewModel environment](self, "environment") == 1)
  {
    -[PUParallaxLayerStackViewModel normalizedVisibleFrame](self, "normalizedVisibleFrame");
    -[PUParallaxLayerStackViewModel setVisibleFrameCrossesHeadroomBoundary:](self, "setVisibleFrameCrossesHeadroomBoundary:", CGRectGetMinY(v3) < 0.0);
  }
}

- (void)setVisibleFrameCrossesHeadroomBoundary:(BOOL)a3
{
  if (self->_visibleFrameCrossesHeadroomBoundary != a3)
  {
    self->_visibleFrameCrossesHeadroomBoundary = a3;
    -[PUParallaxLayerStackViewModel _invalidateDesiredHeadroomVisibilityAmount](self, "_invalidateDesiredHeadroomVisibilityAmount");
  }
}

- (void)_invalidateDesiredHeadroomVisibilityAmount
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDesiredHeadroomVisibilityAmount);

}

- (void)_updateDesiredHeadroomVisibilityAmount
{
  _BOOL4 v3;
  double v4;

  v3 = -[PUParallaxLayerStackViewModel visibleFrameCrossesHeadroomBoundary](self, "visibleFrameCrossesHeadroomBoundary");
  v4 = 0.0;
  if (v3)
    v4 = 1.0;
  -[PUParallaxLayerStackViewModel setDesiredHeadroomVisibilityAmount:](self, "setDesiredHeadroomVisibilityAmount:", v4);
}

- (void)setDesiredHeadroomVisibilityAmount:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_desiredHeadroomVisibilityAmount = a3;
    -[PUParallaxLayerStackViewModel _invalidateHeadroomVisibilityAmount](self, "_invalidateHeadroomVisibilityAmount");
  }
}

- (void)_invalidateHeadroomVisibilityAmount
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateHeadroomVisibilityAmount);

}

- (void)_updateHeadroomVisibilityAmount
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  double v9;

  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mayContainBakedHeadroom");

  v5 = -[PUParallaxLayerStackViewModel representsPureStyle](self, "representsPureStyle");
  -[PUParallaxLayerStackViewModel currentLayerStack](self, "currentLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canApplyHeadroom");

  v9 = 0.0;
  if ((v4 & 1) == 0 && v8 && !v5)
    -[PUParallaxLayerStackViewModel desiredHeadroomVisibilityAmount](self, "desiredHeadroomVisibilityAmount", 0.0);
  -[PUParallaxLayerStackViewModel setHeadroomVisibilityAmount:](self, "setHeadroomVisibilityAmount:", v9);
}

- (void)setHeadroomVisibilityAmount:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_headroomVisibilityAmount = a3;
    -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0x100000);
  }
}

- (void)_invalidateDebugHUDRepresentation
{
  id v2;

  -[PUParallaxLayerStackViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDebugHUDRepresentation);

}

- (void)_updateDebugHUDRepresentation
{
  id v3;
  int64_t v4;
  __CFString *v5;
  __CFString *v6;
  int64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (-[PUParallaxLayerStackViewModel showsDebugHUD](self, "showsDebugHUD"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18[0] = CFSTR("Device Orientation");
    v4 = -[PUParallaxLayerStackViewModel deviceOrientation](self, "deviceOrientation");
    v5 = CFSTR("unknown");
    if ((unint64_t)(v4 - 1) <= 3)
      v5 = off_1E589AEF0[v4 - 1];
    v6 = v5;
    v18[1] = CFSTR("Layout Orientation");
    v19[0] = v6;
    v7 = -[PUParallaxLayerStackViewModel orientation](self, "orientation");
    v8 = CFSTR("portrait");
    if (v7 != 1)
      v8 = CFSTR("unknown");
    if (v7 == 2)
      v8 = CFSTR("landscape");
    v9 = v8;
    v19[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v10);

    if (-[PUParallaxLayerStackViewModel environment](self, "environment") == 2)
    {
      v16 = CFSTR("Style");
      -[PUParallaxLayerStackViewModel style](self, "style");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "debugDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("none");
      if (v12)
        v14 = (const __CFString *)v12;
      v17 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addEntriesFromDictionary:", v15);

    }
    -[PUParallaxLayerStackViewModel setDebugHUDRepresentation:](self, "setDebugHUDRepresentation:", v3);

  }
}

- (void)setDebugHUDRepresentation:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *debugHUDRepresentation;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_debugHUDRepresentation;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      debugHUDRepresentation = self->_debugHUDRepresentation;
      self->_debugHUDRepresentation = v6;

      -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 0x40000);
    }
  }

}

- (void)_updateCurrentLayerStackProperties:(id)a3 changeDescriptor:(unint64_t)a4
{
  PFParallaxLayerStack **p_currentLayerStack;
  PFParallaxLayerStack *v7;
  int64_t v8;
  PFParallaxLayerStack *v9;

  p_currentLayerStack = &self->_currentLayerStack;
  (*((void (**)(id, PFParallaxLayerStack *))a3 + 2))(a3, self->_currentLayerStack);
  v7 = (PFParallaxLayerStack *)objc_claimAutoreleasedReturnValue();
  if (*p_currentLayerStack != v7)
  {
    v9 = v7;
    objc_storeStrong((id *)p_currentLayerStack, v7);
    v8 = -[PUParallaxLayerStackViewModel orientation](self, "orientation");
    if (v8 == 2)
    {
      -[PUParallaxLayerStackViewModel setLandscapeLayerStack:](self, "setLandscapeLayerStack:", v9);
    }
    else if (v8 == 1)
    {
      -[PUParallaxLayerStackViewModel setPortraitLayerStack:](self, "setPortraitLayerStack:", v9);
    }
    -[PUParallaxLayerStackViewModel _signalLayerStackPropertiesChange:](self, "_signalLayerStackPropertiesChange:", a4);
    -[PUParallaxLayerStackViewModel _invalidateDebugHUDRepresentation](self, "_invalidateDebugHUDRepresentation");
    v7 = v9;
    if ((a4 & 2) != 0)
    {
      -[PUParallaxLayerStackViewModel _invalidateHeadroomVisibilityAmount](self, "_invalidateHeadroomVisibilityAmount");
      v7 = v9;
    }
  }

}

- (void)_updateLayerStackPropertiesForAllOrientations:(id)a3 changeDescriptor:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  PFParallaxLayerStack *v13;
  PFParallaxLayerStack *currentLayerStack;

  v7 = a3;
  -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUParallaxLayerStackViewModel setPortraitLayerStack:](self, "setPortraitLayerStack:", v9);

  -[PUParallaxLayerStackViewModel landscapeLayerStack](self, "landscapeLayerStack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUParallaxLayerStackViewModel setLandscapeLayerStack:](self, "setLandscapeLayerStack:", v11);
  v12 = -[PUParallaxLayerStackViewModel orientation](self, "orientation");
  if (v12 == 2)
  {
    -[PUParallaxLayerStackViewModel landscapeLayerStack](self, "landscapeLayerStack");
    v13 = (PFParallaxLayerStack *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v12 == 1)
  {
    -[PUParallaxLayerStackViewModel portraitLayerStack](self, "portraitLayerStack");
    v13 = (PFParallaxLayerStack *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    currentLayerStack = self->_currentLayerStack;
    self->_currentLayerStack = v13;

  }
  -[PUParallaxLayerStackViewModel _signalLayerStackPropertiesChange:](self, "_signalLayerStackPropertiesChange:", a4);
  -[PUParallaxLayerStackViewModel _invalidateDebugHUDRepresentation](self, "_invalidateDebugHUDRepresentation");
}

- (void)_signalLayerStackPropertiesChange:(unint64_t)a3
{
  -[PUParallaxLayerStackViewModel setCurrentLayerStackPropertiesChange:](self, "setCurrentLayerStackPropertiesChange:", -[PUParallaxLayerStackViewModel currentLayerStackPropertiesChange](self, "currentLayerStackPropertiesChange") | a3);
  -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 4);
}

- (void)_signalStylePropertiesChange:(unint64_t)a3
{
  -[PUParallaxLayerStackViewModel setStylePropertiesChange:](self, "setStylePropertiesChange:", -[PUParallaxLayerStackViewModel stylePropertiesChange](self, "stylePropertiesChange") | a3);
  -[PUParallaxLayerStackViewModel signalChange:](self, "signalChange:", 16);
}

- (double)desiredHeadroomVisibilityAmount
{
  return self->_desiredHeadroomVisibilityAmount;
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setSegmentationItem:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationItem, a3);
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConfiguration, a3);
}

- (PUParallaxLayerStackViewManager)viewManager
{
  return self->_viewManager;
}

- (PFParallaxLayerStack)currentLayerStack
{
  return self->_currentLayerStack;
}

- (unint64_t)currentLayerStackPropertiesChange
{
  return self->_currentLayerStackPropertiesChange;
}

- (void)setCurrentLayerStackPropertiesChange:(unint64_t)a3
{
  self->_currentLayerStackPropertiesChange = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)layoutOrder
{
  return self->_layoutOrder;
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (unint64_t)stylePropertiesChange
{
  return self->_stylePropertiesChange;
}

- (void)setStylePropertiesChange:(unint64_t)a3
{
  self->_stylePropertiesChange = a3;
}

- (CGRect)containerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerFrame.origin.x;
  y = self->_containerFrame.origin.y;
  width = self->_containerFrame.size.width;
  height = self->_containerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)clockAppearsAboveForeground
{
  return self->_clockAppearsAboveForeground;
}

- (BOOL)appliesDepthToAllOrientations
{
  return self->_appliesDepthToAllOrientations;
}

- (CGPoint)parallaxVector
{
  double x;
  double y;
  CGPoint result;

  x = self->_parallaxVector.x;
  y = self->_parallaxVector.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)headroomVisibilityAmount
{
  return self->_headroomVisibilityAmount;
}

- (int64_t)backlightLuminance
{
  return self->_backlightLuminance;
}

- (double)visibilityAmount
{
  return self->_visibilityAmount;
}

- (BOOL)showsDebugHUD
{
  return self->_showsDebugHUD;
}

- (NSDictionary)debugHUDRepresentation
{
  return self->_debugHUDRepresentation;
}

- (BOOL)shouldLoopSettlingEffectForGallery
{
  return self->_shouldLoopSettlingEffectForGallery;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PFParallaxLayerStack)portraitLayerStack
{
  return self->_portraitLayerStack;
}

- (PFParallaxLayerStack)landscapeLayerStack
{
  return self->_landscapeLayerStack;
}

- (CGRect)currentNormalizedVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentNormalizedVisibleFrame.origin.x;
  y = self->_currentNormalizedVisibleFrame.origin.y;
  width = self->_currentNormalizedVisibleFrame.size.width;
  height = self->_currentNormalizedVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)didSetContainerFrame
{
  return self->_didSetContainerFrame;
}

- (void)setDidSetContainerFrame:(BOOL)a3
{
  self->_didSetContainerFrame = a3;
}

- (CGRect)portraitVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_portraitVisibleFrame.origin.x;
  y = self->_portraitVisibleFrame.origin.y;
  width = self->_portraitVisibleFrame.size.width;
  height = self->_portraitVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPortraitVisibleFrame:(CGRect)a3
{
  self->_portraitVisibleFrame = a3;
}

- (CGRect)landscapeVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_landscapeVisibleFrame.origin.x;
  y = self->_landscapeVisibleFrame.origin.y;
  width = self->_landscapeVisibleFrame.size.width;
  height = self->_landscapeVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLandscapeVisibleFrame:(CGRect)a3
{
  self->_landscapeVisibleFrame = a3;
}

- (BOOL)needsToAdjustVisibleFrame
{
  return self->_needsToAdjustVisibleFrame;
}

- (void)setNeedsToAdjustVisibleFrame:(BOOL)a3
{
  self->_needsToAdjustVisibleFrame = a3;
}

- (BOOL)visibleFrameCrossesHeadroomBoundary
{
  return self->_visibleFrameCrossesHeadroomBoundary;
}

- (PFPosterOrientedLayout)initialPortraitLayout
{
  return self->_initialPortraitLayout;
}

- (void)setInitialPortraitLayout:(id)a3
{
  objc_storeStrong((id *)&self->_initialPortraitLayout, a3);
}

- (PFPosterOrientedLayout)currentLayout
{
  return self->_currentLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_initialPortraitLayout, 0);
  objc_storeStrong((id *)&self->_landscapeLayerStack, 0);
  objc_storeStrong((id *)&self->_portraitLayerStack, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_debugHUDRepresentation, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_currentLayerStack, 0);
  objc_storeStrong((id *)&self->_viewManager, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

id __85__PUParallaxLayerStackViewModel_updateSettlingEffectWithSegmentationItem_layerStack___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size", v7, v8);
  objc_msgSend(v3, "layerStackByUpdatingLayers:imageSize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __54__PUParallaxLayerStackViewModel_setClockIntersection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutByUpdatingClockIntersection:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "layerStackByUpdatingLayout:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __55__PUParallaxLayerStackViewModel_setClockAreaLuminance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layerStackByUpdatingClockAreaLuminance:", *(double *)(a1 + 32));
}

uint64_t __52__PUParallaxLayerStackViewModel_setClockLayerOrder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layerStackByUpdatingClockLayerOrder:", *(_QWORD *)(a1 + 32));
}

uint64_t __48__PUParallaxLayerStackViewModel_pruneMainLayers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layerStackByRemovingLayersWithOptions:", 1);
}

id __67__PUParallaxLayerStackViewModel_updateHeadroomLayerFromLayerStack___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  objc_msgSend(v3, "layerStackByUpdatingLayers:imageSize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __68__PUParallaxLayerStackViewModel_updateBackfillLayersFromLayerStack___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  objc_msgSend(v3, "layerStackByUpdatingLayers:imageSize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__PUParallaxLayerStackViewModel_updateLayerStack___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "layers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(v4, "layerStackByUpdatingLayers:imageSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

double __83__PUParallaxLayerStackViewModel__updateVisibleFrameWithContainerFrameSetFirstTime___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "needsToAdjustVisibleFrame", a2, 0.5);
  return a2 + (a4 - a8 * (1.0 / fmax(a8 / a4, a9 / a5))) * 0.5;
}

uint64_t __53__PUParallaxLayerStackViewModel_setParallaxDisabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layerStackByUpdatingParallaxDisabled:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __58__PUParallaxLayerStackViewModel_setSettlingEffectEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layerStackByUpdatingSettlingEffectEnabled:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __49__PUParallaxLayerStackViewModel_setDepthEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layerStackByUpdatingDepthEnabled:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __49__PUParallaxLayerStackViewModel_setDepthEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layerStackByUpdatingDepthEnabled:", *(unsigned __int8 *)(a1 + 32));
}

void __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;
  CGRect v7;

  v1 = a1;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentNormalizedVisibleFrame");
  LODWORD(v1) = CGRectEqualToRect(v7, *(CGRect *)(v1 + 40));

  if ((_DWORD)v1)
  {
    v4 = objc_loadWeakRetained(v2);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke_2;
    v5[3] = &unk_1E58A3330;
    objc_copyWeak(&v6, v2);
    objc_msgSend(v4, "performChanges:", v5);

    objc_destroyWeak(&v6);
  }
}

uint64_t __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layerStackByUpdatingLayout:", *(_QWORD *)(a1 + 32));
}

void __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "signalChange:", 0x8000);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "signalChange:", 0x4000);

}

uint64_t __101__PUParallaxLayerStackViewModel_initWithSegmentationItem_compoundLayerStack_style_deviceOrientation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentLayerStack");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLayoutConfiguration");
}

+ (unint64_t)_changeDescriptorBetweenOldStyle:(id)a3 newStyle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    if (objc_msgSend(v6, "hasTonalityMode"))
    {
      v10 = objc_msgSend(v5, "tonality");
      v11 = 2 * (v10 != objc_msgSend(v6, "tonality"));
    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v6, "hasColorParameter"))
    {
      objc_msgSend(v5, "color");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "color");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        v11 |= 4uLL;
    }
    if (objc_msgSend(v6, "hasBackgroundParameter"))
    {
      v15 = objc_msgSend(v5, "showsBackground");
      if (v15 != objc_msgSend(v6, "showsBackground"))
        v11 |= 8uLL;
    }
  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(v5, "clockColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clockColor");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v16 == (void *)v17)
  {

  }
  else
  {
    v18 = (void *)v17;
    v19 = objc_msgSend(v16, "isEqual:", v17);

    if (!v19)
      v11 |= 0x10uLL;
  }

  return v11;
}

@end

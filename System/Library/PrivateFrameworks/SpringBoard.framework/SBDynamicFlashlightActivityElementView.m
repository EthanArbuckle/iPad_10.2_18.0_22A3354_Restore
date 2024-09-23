@implementation SBDynamicFlashlightActivityElementView

- (SBDynamicFlashlightActivityElementView)initWithBeamState:(CGPoint)a3 optionsProvider:(id)a4
{
  return -[SBDynamicFlashlightActivityElementView initWithFrame:beamState:optionsProvider:](self, "initWithFrame:beamState:optionsProvider:", a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 238.666667, 339.333333, a3.x, a3.y);
}

- (SBDynamicFlashlightActivityElementView)initWithFrame:(CGRect)a3 beamState:(CGPoint)a4 optionsProvider:(id)a5
{
  double y;
  double x;
  double height;
  double width;
  double v10;
  double v11;
  id v13;
  SBDynamicFlashlightActivityElementView *v14;
  SBDynamicFlashlightActivityElementView *v15;
  NSString *packageState;
  void *v17;
  void *v18;
  uint64_t v19;
  BSUICAPackageView *packageView;
  SBDynamicFlashlightActivityElementPackageLayerController *v21;
  SBDynamicFlashlightActivityElementPackageLayerController *layerManager;
  void *v23;
  objc_super v25;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)SBDynamicFlashlightActivityElementView;
  v14 = -[SBDynamicFlashlightActivityElementView initWithFrame:](&v25, sel_initWithFrame_, v11, v10, width, height);
  v15 = v14;
  if (v14)
  {
    packageState = v14->_packageState;
    v14->_packageState = (NSString *)CFSTR("State 0");

    v15->_isExpanded = 0;
    objc_storeStrong((id *)&v15->_optionsProvider, a5);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLForResource:withExtension:", CFSTR("Flashlight-Dynamic-v9d"), CFSTR("ca"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01910]), "initWithURL:", v18);
    packageView = v15->_packageView;
    v15->_packageView = (BSUICAPackageView *)v19;

    v21 = -[SBDynamicFlashlightActivityElementPackageLayerController initWithPackageView:]([SBDynamicFlashlightActivityElementPackageLayerController alloc], "initWithPackageView:", v15->_packageView);
    layerManager = v15->_layerManager;
    v15->_layerManager = v21;

    -[SBDynamicFlashlightActivityElementView _setupLayers](v15, "_setupLayers");
    -[SBDynamicFlashlightActivityElementView _setupBeamState:](v15, "_setupBeamState:", x, y);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDynamicFlashlightActivityElementView setBackgroundColor:](v15, "setBackgroundColor:", v23);

    -[SBDynamicFlashlightActivityElementView setNeedsLayout](v15, "setNeedsLayout");
  }

  return v15;
}

- (void)_setupLayers
{
  CALayer *v3;
  CALayer *sensorShadowLayer;
  void *v5;

  -[SBDynamicFlashlightActivityElementView addSubview:](self, "addSubview:", self->_packageView);
  -[SBDynamicFlashlightActivityElementPackageLayerController sensorShadowPortalLayer](self->_layerManager, "sensorShadowPortalLayer");
  v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
  sensorShadowLayer = self->_sensorShadowLayer;
  self->_sensorShadowLayer = v3;

  -[SBDynamicFlashlightActivityElementView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", self->_sensorShadowLayer);

  -[SBDynamicFlashlightActivityElementView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setupBeamState:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  UIViewVectorAnimatableProperty *v6;
  UIViewVectorAnimatableProperty **p_beamState;
  UIViewVectorAnimatableProperty *beamState;
  UIViewVectorAnimatableProperty *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[6];
  _QWORD v17[2];

  y = a3.y;
  x = a3.x;
  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = (UIViewVectorAnimatableProperty *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABD8]), "initWithLength:", 2);
  p_beamState = &self->_beamState;
  beamState = self->_beamState;
  self->_beamState = v6;

  v9 = self->_beamState;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__SBDynamicFlashlightActivityElementView__setupBeamState___block_invoke;
  v16[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v16[4] = x;
  *(CGFloat *)&v16[5] = y;
  -[UIViewVectorAnimatableProperty _mutateValue:](v9, "_mutateValue:", v16);
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0CEABB0];
  v17[0] = *p_beamState;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __58__SBDynamicFlashlightActivityElementView__setupBeamState___block_invoke_2;
  v13[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v11, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

double __58__SBDynamicFlashlightActivityElementView__setupBeamState___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

void __58__SBDynamicFlashlightActivityElementView__setupBeamState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applyBeamState");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 238.666667;
  v4 = 339.333333;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  BSUICAPackageView *packageView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDynamicFlashlightActivityElementView;
  -[SBDynamicFlashlightActivityElementView layoutSubviews](&v4, sel_layoutSubviews);
  -[SBDynamicFlashlightActivityElementView bounds](self, "bounds");
  packageView = self->_packageView;
  BSRectWithSize();
  -[BSUICAPackageView setBounds:](packageView, "setBounds:");
  BSRectGetCenter();
  -[BSUICAPackageView setCenter:](self->_packageView, "setCenter:");
  if (!-[CALayer isHidden](self->_sensorShadowLayer, "isHidden"))
    -[SBDynamicFlashlightActivityElementView _layoutSensorShadow](self, "_layoutSensorShadow");
}

- (void)_layoutSensorShadow
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;

  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultIslandFrameInCoordinateSpace:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  if (!CGRectEqualToRect(self->_sensorAreaRect, v17))
  {
    self->_sensorAreaRect.origin.x = v5;
    self->_sensorAreaRect.origin.y = v7;
    self->_sensorAreaRect.size.width = v9;
    self->_sensorAreaRect.size.height = v11;
    BSRectGetCenter();
    v13 = v12;
    v15 = v14;
    -[CALayer frame](self->_sensorShadowLayer, "frame");
    -[CALayer setPosition:](self->_sensorShadowLayer, "setPosition:", v13, v15 + v16 * 0.5);
  }
}

- (void)setSensorShadowHidden:(BOOL)a3
{
  self->_sensorShadowHidden = a3;
  -[CALayer setHidden:](self->_sensorShadowLayer, "setHidden:");
}

- (void)setExpanded:(BOOL)a3 intensity:(double)a4 width:(double)a5
{
  _BOOL8 v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a3;
  SBLogFlashlightHUD();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SBDynamicFlashlightActivityElementView setExpanded:intensity:width:].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);

  self->_isExpanded = v7;
  if (v7)
    -[SBDynamicFlashlightActivityElementView _transitionToExpandedStateWithIntensity:width:](self, "_transitionToExpandedStateWithIntensity:width:", a4, a5);
  else
    -[SBDynamicFlashlightActivityElementView _transitionToCollapsedState](self, "_transitionToCollapsedState");
}

- (void)_transitionToExpandedStateWithIntensity:(double)a3 width:(double)a4
{
  NSString *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *packageState;
  NSString *v16;

  -[BSUICAPackageView setState:animated:](self->_packageView, "setState:animated:", CFSTR("State 0"), 0);
  -[SBDynamicFlashlightActivityElementPackageLayerController setBeamIntensity:width:animated:](self->_layerManager, "setBeamIntensity:width:animated:", 0, a3, a4);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[SBDynamicFlashlightActivityElementView _flashlightStateForWidth:intensity:](self, "_flashlightStateForWidth:intensity:", a4, a3);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  SBLogFlashlightHUD();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBDynamicFlashlightActivityElementView _transitionToExpandedStateWithIntensity:width:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  -[BSUICAPackageView setState:](self->_packageView, "setState:", v7);
  packageState = self->_packageState;
  self->_packageState = v7;
  v16 = v7;

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_transitionToCollapsedState
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[BSUICAPackageView setState:animated:](self->_packageView, "setState:animated:", CFSTR("State 0"), 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setBeamState:(CGPoint)a3
{
  UIViewVectorAnimatableProperty *beamState;
  _QWORD v4[4];
  CGPoint v5;

  beamState = self->_beamState;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SBDynamicFlashlightActivityElementView_setBeamState___block_invoke;
  v4[3] = &__block_descriptor_48_e9_v16__0_d8l;
  v5 = a3;
  -[UIViewVectorAnimatableProperty _mutateValue:](beamState, "_mutateValue:", v4);
}

__n128 __55__SBDynamicFlashlightActivityElementView_setBeamState___block_invoke(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a1[2];
  *a2 = result;
  return result;
}

- (void)_applyBeamState
{
  double *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (double *)-[UIViewVectorAnimatableProperty _presentationValue](self->_beamState, "_presentationValue");
  v4 = *v3;
  v5 = v3[1];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[SBDynamicFlashlightActivityElementView _flashlightStateForWidth:intensity:](self, "_flashlightStateForWidth:intensity:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", self->_packageState) & 1) == 0)
  {
    SBLogFlashlightHUD();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBDynamicFlashlightActivityElementView _transitionToExpandedStateWithIntensity:width:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    -[BSUICAPackageView setState:](self->_packageView, "setState:", v6);
    objc_storeStrong((id *)&self->_packageState, v6);
  }
  -[SBDynamicFlashlightActivityElementPackageLayerController setBeamIntensity:width:animated:](self->_layerManager, "setBeamIntensity:width:animated:", 0, v5, v4);
  -[SBDynamicFlashlightActivityElementPackageLayerController setTouching:animated:](self->_layerManager, "setTouching:animated:", self->_touching, 1);
  -[SBDynamicFlashlightActivityElementView _layoutSensorShadow](self, "_layoutSensorShadow");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (id)_flashlightStateForWidth:(double)a3 intensity:(double)a4
{
  double v6;
  const __CFString *v7;

  -[SBDynamicFlashlightOptionsProvider minimumIntensity](self->_optionsProvider, "minimumIntensity");
  v7 = CFSTR("State 1");
  if (a3 < 0.12)
    v7 = CFSTR("State 1 - narrowest");
  if (v6 <= a4)
    return (id)v7;
  else
    return CFSTR("Off");
}

- (void)setTouching:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  SBLogFlashlightHUD();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBDynamicFlashlightActivityElementView setTouching:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);

  self->_touching = v3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (BOOL)isTouching
{
  return self->_touching;
}

- (BOOL)sensorShadowHidden
{
  return self->_sensorShadowHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageState, 0);
  objc_storeStrong((id *)&self->_optionsProvider, 0);
  objc_storeStrong((id *)&self->_sensorShadowLayer, 0);
  objc_storeStrong((id *)&self->_layerManager, 0);
  objc_storeStrong((id *)&self->_beamState, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
}

- (void)setExpanded:(uint64_t)a3 intensity:(uint64_t)a4 width:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1D0540000, a2, a3, "View Expanded -> %{BOOL}i", a5, a6, a7, a8, 0);
}

- (void)_transitionToExpandedStateWithIntensity:(uint64_t)a3 width:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "View State -> %@", a5, a6, a7, a8, 2u);
}

- (void)setTouching:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1D0540000, a2, a3, "View Touching -> %{BOOL}u", a5, a6, a7, a8, 0);
}

@end

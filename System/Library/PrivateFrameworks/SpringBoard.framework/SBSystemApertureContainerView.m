@implementation SBSystemApertureContainerView

- (NSUUID)interfaceElementIdentifier
{
  return self->_interfaceElementIdentifier;
}

- (UIView)scalingContentView
{
  return self->_scalingContentView;
}

- (SBSAContainerViewDescription)containerViewDescription
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__SBSystemApertureContainerView_containerViewDescription__block_invoke;
  v3[3] = &unk_1E8E9E9D0;
  v3[4] = self;
  v3[5] = a2;
  +[SBSAViewDescription instanceWithBlock:](SBSAContainerViewDescription, "instanceWithBlock:", v3);
  return (SBSAContainerViewDescription *)(id)objc_claimAutoreleasedReturnValue();
}

void __57__SBSystemApertureContainerView_containerViewDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v3 = a2;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSystemApertureContainerView.m"), 340, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "interfaceElementIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterfaceElementIdentifier:", v14);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 720));
  objc_msgSend(WeakRetained, "elementViewProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "element");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssociatedSystemApertureElementIdentity:", v17);

  objc_msgSend(*(id *)(a1 + 32), "center");
  objc_msgSend(v7, "setCenter:");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v7, "setBounds:");
  objc_msgSend(*(id *)(a1 + 32), "_velocityForKey:", CFSTR("bounds"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CGRectValue");
  objc_msgSend(v7, "setBoundsVelocity:");

  objc_msgSend(*(id *)(a1 + 32), "IDCornerRadius");
  objc_msgSend(v7, "setCornerRadius:");
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  objc_msgSend(v7, "setAlpha:");
  objc_msgSend(v7, "setKeyLineMode:", objc_msgSend(*(id *)(a1 + 32), "keyLineMode"));
  objc_msgSend(*(id *)(a1 + 32), "keyLineTintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyLineTintColor:", v19);

  objc_msgSend(v7, "setSampledBackgroundLuminanceLevel:", objc_msgSend(*(id *)(a1 + 32), "sampledBackgroundLuminanceLevel"));
  v20 = *(void **)(a1 + 32);
  if (v20)
    objc_msgSend(v20, "renderingConfiguration");
  else
    memset(v21, 0, sizeof(v21));
  objc_msgSend(v7, "setRenderingConfiguration:", v21);

}

- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration
{
  SBSystemApertureContainerRenderingConfiguration *result;

  result = (SBSystemApertureContainerRenderingConfiguration *)self->_gainMapView;
  if (result)
    return (SBSystemApertureContainerRenderingConfiguration *)-[SBSystemApertureContainerRenderingConfiguration renderingConfiguration](result, "renderingConfiguration");
  retstr->renderingStyle = 0;
  retstr->cloningStyle = 0;
  *(_QWORD *)&retstr->alwaysRenderInSnapshots = 0;
  return result;
}

- (UIColor)keyLineTintColor
{
  return (UIColor *)(id)-[UIColor copy](self->_keyLineTintColor, "copy");
}

- (int64_t)keyLineMode
{
  return self->_keyLineMode;
}

- (int64_t)sampledBackgroundLuminanceLevel
{
  return self->_sampledBackgroundLuminanceLevel;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  UIView *hitTestView;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSystemApertureContainerView;
  if (-[SBSystemApertureContainerView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    hitTestView = self->_hitTestView;
    -[SBSystemApertureContainerView convertPoint:toView:](self, "convertPoint:toView:", hitTestView, x, y);
    v8 = -[UIView pointInside:withEvent:](hitTestView, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (int64_t)shadowStyle
{
  return self->_shadowStyle;
}

- (SAUIElementViewControlling)elementViewController
{
  return (SAUIElementViewControlling *)objc_loadWeakRetained((id *)&self->_elementViewController);
}

- (void)setElementViewController:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_elementViewController);
    objc_storeWeak((id *)&self->_outgoingElementViewController, v5);
    objc_storeWeak((id *)&self->_elementViewController, obj);
    -[SBSystemApertureContainerView _updateContentViewTransformImmediately](self, "_updateContentViewTransformImmediately");
    -[SBSystemApertureContainerView setContentClippingEnabled:](self, "setContentClippingEnabled:", 1);
    -[SBSystemApertureContainerView _generateAccessibilityIdentifier](self, "_generateAccessibilityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureContainerView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v6);

  }
}

- (void)setRank:(unint64_t)a3
{
  id v4;

  if (self->_rank != a3)
  {
    self->_rank = a3;
    -[SBSystemApertureContainerView _generateAccessibilityIdentifier](self, "_generateAccessibilityIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureContainerView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v4);

  }
}

- (void)elementOrientationDidChangeWithTransitionCoordinator:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  v6 = SBSAIsElementViewControllerFixedInOrientation(WeakRetained);

  if ((v6 & 1) == 0)
  {
    v8 = *(_OWORD *)&self->_activeContentRotationTransform.c;
    v7 = *(_OWORD *)&self->_activeContentRotationTransform.tx;
    *(_OWORD *)&self->_previousContentTransform.a = *(_OWORD *)&self->_activeContentRotationTransform.a;
    *(_OWORD *)&self->_previousContentTransform.c = v8;
    *(_OWORD *)&self->_previousContentTransform.tx = v7;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    if (v4)
      objc_msgSend(v4, "targetTransform");
    v9 = v18;
    v10 = v19;
    *(_OWORD *)&self->_activeContentRotationTransform.a = v18;
    *(_OWORD *)&self->_activeContentRotationTransform.c = v10;
    v11 = v20;
    v12 = MEMORY[0x1E0C809B0];
    *(_OWORD *)&self->_activeContentRotationTransform.tx = v20;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __86__SBSystemApertureContainerView_elementOrientationDidChangeWithTransitionCoordinator___block_invoke;
    v17[3] = &unk_1E8E9EA28;
    v17[4] = self;
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __86__SBSystemApertureContainerView_elementOrientationDidChangeWithTransitionCoordinator___block_invoke_2;
    v13[3] = &unk_1E8EA25B8;
    v15 = v10;
    v14 = v9;
    v16 = v11;
    v13[4] = self;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v17, v13);
  }

}

- (int64_t)activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:(id)a3
{
  id WeakRetained;
  char v5;
  id v7;
  int64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  v5 = SBSAIsElementViewControllerFixedInOrientation(WeakRetained);

  if ((v5 & 1) != 0)
    return 1;
  v7 = objc_loadWeakRetained((id *)&self->_elementOrientationAuthority);
  v8 = objc_msgSend(v7, "activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:", self);

  return v8;
}

uint64_t __86__SBSystemApertureContainerView_elementOrientationDidChangeWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];

  v2 = objc_msgSend(*(id *)(a1 + 32), "activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(v3 + 648);
  v5 = *(_OWORD *)(v3 + 680);
  v7[1] = *(_OWORD *)(v3 + 664);
  v7[2] = v5;
  v7[0] = v4;
  return objc_msgSend((id)v3, "_setContentViewTransform:elementViewControllerInterfaceOrientation:", v7, v2);
}

- (void)_setContentViewTransform:(CGAffineTransform *)a3 elementViewControllerInterfaceOrientation:(int64_t)a4
{
  UIView *rotatingContentView;
  __int128 v7;
  UIView *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  rotatingContentView = self->_rotatingContentView;
  v7 = *(_OWORD *)&a3->c;
  v13 = *(_OWORD *)&a3->a;
  v14 = v7;
  v15 = *(_OWORD *)&a3->tx;
  v8 = rotatingContentView;
  -[UIView setTransform:](v8, "setTransform:", &v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  objc_msgSend(WeakRetained, "elementViewProvider", v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "element");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(WeakRetained) = objc_opt_respondsToSelector();
  if ((WeakRetained & 1) != 0)
  {
    if ((unint64_t)a4 > 4)
      v12 = 0;
    else
      v12 = qword_1D0E88758[a4];
    objc_msgSend(v11, "setObstructionEdge:", v12);
  }

}

- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  _SBSystemApertureGainMapView *gainMapView;
  _BOOL8 v6;
  SBSystemApertureContainerRenderingConfiguration v7;

  gainMapView = self->_gainMapView;
  v7 = *a3;
  -[_SBSystemApertureGainMapView setRenderingConfiguration:](gainMapView, "setRenderingConfiguration:", &v7);
  v6 = a3->renderingStyle == 1;
  -[_UILumaTrackingBackdropView setHidden:](self->_backgroundLumaSamplingBackdrop, "setHidden:", v6);
  -[UIView setHidden:](self->_darkBkgKeyLineView, "setHidden:", v6);
  -[_SBAdaptiveKeyLineBackdropView setHidden:](self->_lightBkgKeyLineView, "setHidden:", v6);
  -[UIView setHidden:](self->_blobEnablingBlackFillView, "setHidden:", v6);
  -[UIView setHidden:](self->_contentClippingView, "setHidden:", v6);
  -[UIView setHidden:](self->_rotatingContentView, "setHidden:", v6);
  -[UIView setHidden:](self->_scalingContentView, "setHidden:", v6);
  -[UIView setHidden:](self->_shadowView, "setHidden:", v6);
}

__n128 __86__SBSystemApertureContainerView_elementOrientationDidChangeWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  CGAffineTransform v7;
  CGAffineTransform t1;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&t1.c = v2;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 72);
  v3 = *(_OWORD *)(v1 + 648);
  v4 = *(_OWORD *)(v1 + 680);
  *(_OWORD *)&v7.c = *(_OWORD *)(v1 + 664);
  *(_OWORD *)&v7.tx = v4;
  *(_OWORD *)&v7.a = v3;
  if (CGAffineTransformEqualToTransform(&t1, &v7))
  {
    v6 = *(_OWORD *)(v1 + 664);
    result = *(__n128 *)(v1 + 680);
    *(_OWORD *)(v1 + 600) = *(_OWORD *)(v1 + 648);
    *(_OWORD *)(v1 + 616) = v6;
    *(__n128 *)(v1 + 632) = result;
  }
  return result;
}

- (SBSystemApertureContainerView)initWithInterfaceElementIdentifier:(id)a3
{
  id v5;
  SBSystemApertureContainerView *v6;
  uint64_t v7;
  NSUUID *interfaceElementIdentifier;
  uint64_t v9;
  SBSystemApertureSettings *settings;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIView *v20;
  UIView *hitTestView;
  void *v22;
  uint64_t v23;
  UIView *contentClippingView;
  uint64_t v25;
  UIView *subBackgroundGroupingView;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  _UILumaTrackingBackdropView *backgroundLumaSamplingBackdrop;
  UIView *v38;
  UIView *darkBkgKeyLineView;
  uint64_t v40;
  void *v41;
  void *v42;
  _SBAdaptiveKeyLineBackdropView *v43;
  _SBAdaptiveKeyLineBackdropView *lightBkgKeyLineView;
  void *v45;
  UIView *v46;
  UIView *shadowView;
  void *v48;
  id v49;
  void *v50;
  double v51;
  void *v52;
  SBSystemApertureContainerView *v53;
  _SBSystemApertureGainMapView *v54;
  _SBSystemApertureGainMapView *gainMapView;
  uint64_t v56;
  UIView *backgroundGroupingView;
  UIView *v58;
  UIView *blobEnablingBlackFillView;
  UIView *v60;
  void *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _SBSystemApertureContainerViewScalingContentView *v66;
  UIView *scalingContentView;
  _SBSystemApertureContainerViewRotatingContentView *v68;
  UIView *rotatingContentView;
  UIView *v70;
  uint64_t v71;
  UIView *v72;
  UIView *v73;
  UIView *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v91;
  void *v92;
  id v93;
  SBSystemApertureContainerView *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  objc_super v99;
  void *v100;
  _QWORD v101[3];
  _BYTE v102[128];
  _QWORD v103[3];

  v103[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContainerView.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interfaceElementIdentifier"));

  }
  v99.receiver = self;
  v99.super_class = (Class)SBSystemApertureContainerView;
  v6 = -[SBSystemApertureContainerView initWithFrame:](&v99, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    v93 = v5;
    v7 = objc_msgSend(v5, "copy");
    interfaceElementIdentifier = v6->_interfaceElementIdentifier;
    v6->_interfaceElementIdentifier = (NSUUID *)v7;

    +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    settings = v6->_settings;
    v6->_settings = (SBSystemApertureSettings *)v9;

    -[PTSettings addKeyObserver:](v6->_settings, "addKeyObserver:", v6);
    -[SBSystemApertureSettings adaptiveKeyLineColorMatrix](v6->_settings, "adaptiveKeyLineColorMatrix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addKeyObserver:", v6);

    -[SBSystemApertureContainerView _applySettingsValues](v6, "_applySettingsValues");
    -[SBSystemApertureContainerView bounds](v6, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    hitTestView = v6->_hitTestView;
    v6->_hitTestView = v20;

    -[UIView layer](v6->_hitTestView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v6;
    objc_msgSend(v22, "setHitTestsAsOpaque:", 1);

    -[SBSystemApertureContainerView addSubview:](v94, "addSubview:", v94->_hitTestView);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v13, v15, v17, v19);
    contentClippingView = v6->_contentClippingView;
    v6->_contentClippingView = (UIView *)v23;

    -[UIView setClipsToBounds:](v6->_contentClippingView, "setClipsToBounds:", 1);
    -[SBSystemApertureContainerView addSubview:](v94, "addSubview:", v94->_contentClippingView);
    -[UIView setAutoresizingMask:](v6->_contentClippingView, "setAutoresizingMask:", 18);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v13, v15, v17, v19);
    subBackgroundGroupingView = v6->_subBackgroundGroupingView;
    v6->_subBackgroundGroupingView = (UIView *)v25;

    -[UIView addSubview:](v94->_contentClippingView, "addSubview:", v94->_subBackgroundGroupingView);
    v27 = objc_alloc(MEMORY[0x1E0CEAE00]);
    -[SBSystemApertureSettings keyLineDarkToMixedMinLuma](v6->_settings, "keyLineDarkToMixedMinLuma");
    v29 = v28;
    -[SBSystemApertureSettings keyLineMixedToDarkMaxLuma](v6->_settings, "keyLineMixedToDarkMaxLuma");
    v31 = v30;
    -[SBSystemApertureContainerView bounds](v6, "bounds");
    v36 = objc_msgSend(v27, "initWithTransitionBoundaries:delegate:frame:", v6, v29, v31, v32, v33, v34, v35);
    backgroundLumaSamplingBackdrop = v6->_backgroundLumaSamplingBackdrop;
    v6->_backgroundLumaSamplingBackdrop = (_UILumaTrackingBackdropView *)v36;

    v6->_sampledBackgroundLuminanceLevel = 0;
    -[UIView addSubview:](v94->_subBackgroundGroupingView, "addSubview:", v94->_backgroundLumaSamplingBackdrop);
    v38 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    darkBkgKeyLineView = v6->_darkBkgKeyLineView;
    v6->_darkBkgKeyLineView = v38;

    -[UIView setAlpha:](v6->_darkBkgKeyLineView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v40 = objc_claimAutoreleasedReturnValue();
    -[UIView layer](v6->_darkBkgKeyLineView, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)v40;
    v103[0] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFilters:", v42);

    -[UIView addSubview:](v94->_subBackgroundGroupingView, "addSubview:", v94->_darkBkgKeyLineView);
    v43 = objc_alloc_init(_SBAdaptiveKeyLineBackdropView);
    lightBkgKeyLineView = v94->_lightBkgKeyLineView;
    v94->_lightBkgKeyLineView = v43;

    -[_SBAdaptiveKeyLineBackdropView backdropLayer](v94->_lightBkgKeyLineView, "backdropLayer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAllowsInPlaceFiltering:", 1);

    -[_SBAdaptiveKeyLineBackdropView setAlpha:](v94->_lightBkgKeyLineView, "setAlpha:", 0.0);
    -[SBSystemApertureContainerView _updateKeyLineFilters](v94, "_updateKeyLineFilters");
    -[UIView addSubview:](v94->_subBackgroundGroupingView, "addSubview:", v94->_lightBkgKeyLineView);
    v46 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    shadowView = v94->_shadowView;
    v94->_shadowView = v46;

    -[UIView layer](v94->_shadowView, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v48, "setShadowColor:", objc_msgSend(v49, "CGColor"));

    -[UIView layer](v94->_shadowView, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v51) = 0;
    objc_msgSend(v50, "setShadowOpacity:", v51);

    -[UIView layer](v94->_shadowView, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setShadowPathIsBounds:", 1);

    v94->_needsShadowStyleUpdate = 1;
    v53 = v94;
    -[UIView addSubview:](v94->_subBackgroundGroupingView, "addSubview:", v94->_shadowView);
    v54 = objc_alloc_init(_SBSystemApertureGainMapView);
    gainMapView = v94->_gainMapView;
    v94->_gainMapView = v54;

    -[UIView addSubview:](v53->_subBackgroundGroupingView, "addSubview:", v53->_gainMapView);
    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v13, v15, v17, v19);
    backgroundGroupingView = v94->_backgroundGroupingView;
    v94->_backgroundGroupingView = (UIView *)v56;

    -[UIView addSubview:](v53->_contentClippingView, "addSubview:", v53->_backgroundGroupingView);
    v58 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    blobEnablingBlackFillView = v94->_blobEnablingBlackFillView;
    v94->_blobEnablingBlackFillView = v58;

    v60 = v94->_blobEnablingBlackFillView;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v60, "setBackgroundColor:", v61);

    -[UIView setClipsToBounds:](v94->_blobEnablingBlackFillView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v53->_backgroundGroupingView, "addSubview:", v53->_blobEnablingBlackFillView);
    v62 = MEMORY[0x1E0C9BAA8];
    v63 = *MEMORY[0x1E0C9BAA8];
    v64 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v94->_previousContentTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v94->_previousContentTransform.c = v64;
    v65 = *(_OWORD *)(v62 + 32);
    *(_OWORD *)&v94->_previousContentTransform.tx = v65;
    *(_OWORD *)&v94->_activeContentRotationTransform.a = v63;
    *(_OWORD *)&v94->_activeContentRotationTransform.c = v64;
    *(_OWORD *)&v94->_activeContentRotationTransform.tx = v65;
    v66 = objc_alloc_init(_SBSystemApertureContainerViewScalingContentView);
    scalingContentView = v94->_scalingContentView;
    v94->_scalingContentView = &v66->super.super;

    v68 = objc_alloc_init(_SBSystemApertureContainerViewRotatingContentView);
    rotatingContentView = v94->_rotatingContentView;
    v94->_rotatingContentView = &v68->super.super;

    v70 = v94->_scalingContentView;
    v71 = objc_opt_class();
    v72 = v70;
    if (v71)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v73 = v72;
      else
        v73 = 0;
    }
    else
    {
      v73 = 0;
    }
    v74 = v73;

    -[UIView setContentView:](v74, "setContentView:", v94->_rotatingContentView);
    -[UIView addSubview:](v94->_contentClippingView, "addSubview:", v94->_scalingContentView);
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    -[SBSystemApertureContainerView layer](v94, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v101[0] = v75;
    -[UIView layer](v94->_subBackgroundGroupingView, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v76;
    -[UIView layer](v94->_backgroundGroupingView, "layer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v101[2] = v77;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 3);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v96;
      v82 = *MEMORY[0x1E0CD2BE8];
      v83 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (i = 0; i != v80; ++i)
        {
          if (*(_QWORD *)v96 != v81)
            objc_enumerationMutation(v78);
          v85 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v82);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setValue:forKey:", v83, CFSTR("inputReversed"));
          v100 = v86;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setFilters:", v87);

        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
      }
      while (v80);
    }

    v6 = v94;
    -[SBSystemApertureContainerView layer](v94, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setHitTestsAsOpaque:", 1);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addObserver:selector:name:object:", v94, sel__invertColorsChanged_, *MEMORY[0x1E0CEB018], 0);

    v5 = v93;
  }

  return v6;
}

- (BOOL)isContentClippingEnabled
{
  return -[UIView clipsToBounds](self->_contentClippingView, "clipsToBounds");
}

- (void)setContentClippingEnabled:(BOOL)a3
{
  -[UIView setClipsToBounds:](self->_contentClippingView, "setClipsToBounds:", a3);
}

- (void)addContentSubview:(id)a3
{
  id v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  _QWORD v8[4];
  UIView *v9;
  id v10;

  v4 = a3;
  v5 = self->_rotatingContentView;
  objc_msgSend(v4, "superview");
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__SBSystemApertureContainerView_addContentSubview___block_invoke;
    v8[3] = &unk_1E8E9E820;
    v9 = v5;
    v10 = v4;
    objc_msgSend(v7, "_performWithoutRetargetingAnimations:", v8);

  }
}

uint64_t __51__SBSystemApertureContainerView_addContentSubview___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "setContentView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

- (void)setKeyLineMode:(int64_t)a3
{
  int64_t v3;
  double v5;

  if (self->_keyLineMode != a3)
  {
    v3 = a3;
    self->_keyLineMode = a3;
    if (!-[SBSystemApertureSettings keyLineEnabled](self->_settings, "keyLineEnabled"))
      v3 = 0;
    -[_UILumaTrackingBackdropView setPaused:](self->_backgroundLumaSamplingBackdrop, "setPaused:", v3 == 0);
    switch(v3)
    {
      case 2:
        -[UIView setAlpha:](self->_darkBkgKeyLineView, "setAlpha:", *(double *)&SBSystemApertureKeyLineDarkBkgEnabledOpacity);
        v5 = 0.0;
        goto LABEL_11;
      case 1:
        -[UIView setAlpha:](self->_darkBkgKeyLineView, "setAlpha:", 0.0);
        v5 = 1.0;
        goto LABEL_11;
      case 0:
        v5 = 0.0;
        -[UIView setAlpha:](self->_darkBkgKeyLineView, "setAlpha:", 0.0);
LABEL_11:
        -[_SBAdaptiveKeyLineBackdropView setAlpha:](self->_lightBkgKeyLineView, "setAlpha:", v5);
        break;
    }
  }
}

- (void)setKeyLineTintColor:(id)a3
{
  UIColor *v4;
  UIColor *keyLineTintColor;
  UIColor *cachedValidatedKeyLineTintColor;
  UIView *darkBkgKeyLineView;
  void *v8;
  id v9;

  v9 = a3;
  if ((-[UIColor isEqual:](self->_keyLineTintColor, "isEqual:") & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v9, "copy");
    keyLineTintColor = self->_keyLineTintColor;
    self->_keyLineTintColor = v4;

    cachedValidatedKeyLineTintColor = self->_cachedValidatedKeyLineTintColor;
    self->_cachedValidatedKeyLineTintColor = 0;

    darkBkgKeyLineView = self->_darkBkgKeyLineView;
    -[SBSystemApertureContainerView _validatedKeyLineTintColor](self, "_validatedKeyLineTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](darkBkgKeyLineView, "setBackgroundColor:", v8);

  }
}

- (void)setShadowStyle:(int64_t)a3
{
  if (self->_shadowStyle != a3)
  {
    self->_shadowStyle = a3;
    self->_needsShadowStyleUpdate = 1;
    -[SBSystemApertureContainerView _updateShadowStyleIfNeeded](self, "_updateShadowStyleIfNeeded");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBSystemApertureContainerView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  -[SBSystemApertureContainerView frame](self, "frame");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
    -[SBSystemApertureContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  -[SBSystemApertureContainerView center](self, "center");
  v7 = v6;
  v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView setCenter:](&v13, sel_setCenter_, x, y);
  -[SBSystemApertureContainerView center](self, "center");
  if (v7 != v11 || v9 != v10)
    -[SBSystemApertureContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBSystemApertureContainerView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView setBounds:](&v20, sel_setBounds_, x, y, width, height);
  -[SBSystemApertureContainerView bounds](self, "bounds");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
    -[SBSystemApertureContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_layoutHitTestViewWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView *hitTestView;
  id v18;
  id v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = 0;
    objc_msgSend(WeakRetained, "systemApertureContainerView:hitRectForBounds:debugColor:", self, &v19, x, y, width, height);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    hitTestView = self->_hitTestView;
    v18 = v19;
    -[UIView setFrame:](hitTestView, "setFrame:", v10, v12, v14, v16);
    -[UIView setBackgroundColor:](self->_hitTestView, "setBackgroundColor:", v18);

  }
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double top;
  double left;
  double v21;
  double v22;
  double v23;
  double v24;
  UIView *rotatingContentView;
  __int128 v26;
  _OWORD v27[3];
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView layoutSubviews](&v28, sel_layoutSubviews);
  -[SBSystemApertureContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBSystemApertureContainerView frame](self, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIView setFrame:](self->_subBackgroundGroupingView, "setFrame:");
  -[UIView setFrame:](self->_backgroundGroupingView, "setFrame:", v12, v14, v16, v18);
  top = self->_gainMapLayerInsets.top;
  left = self->_gainMapLayerInsets.left;
  v21 = v4 + left;
  v22 = v6 + top;
  v23 = v8 - (left + self->_gainMapLayerInsets.right);
  v24 = v10 - (top + self->_gainMapLayerInsets.bottom);
  -[_UILumaTrackingBackdropView setFrame:](self->_backgroundLumaSamplingBackdrop, "setFrame:", v4 + left, v6 + top, v23, v24);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v21 + 1.0, v22 + 1.0, v23 + -2.0, v24 + -2.0);
  -[UIView setFrame:](self->_darkBkgKeyLineView, "setFrame:", v21 - *(double *)&SBSystemApertureKeyLineThickness, v22 - *(double *)&SBSystemApertureKeyLineThickness, v23 - (-*(double *)&SBSystemApertureKeyLineThickness - *(double *)&SBSystemApertureKeyLineThickness), v24 - (-*(double *)&SBSystemApertureKeyLineThickness - *(double *)&SBSystemApertureKeyLineThickness));
  -[_SBAdaptiveKeyLineBackdropView setFrame:](self->_lightBkgKeyLineView, "setFrame:", v21 - *(double *)&SBSystemApertureAdaptiveKeyLineThickness, v22 - *(double *)&SBSystemApertureAdaptiveKeyLineThickness, v23 - (-*(double *)&SBSystemApertureAdaptiveKeyLineThickness - *(double *)&SBSystemApertureAdaptiveKeyLineThickness), v24 - (-*(double *)&SBSystemApertureAdaptiveKeyLineThickness - *(double *)&SBSystemApertureAdaptiveKeyLineThickness));
  -[_SBSystemApertureGainMapView setFrame:](self->_gainMapView, "setFrame:", v21, v22, v23, v24);
  -[UIView setFrame:](self->_blobEnablingBlackFillView, "setFrame:", v21 + 0.666666667, v22 + 0.666666667, v23 + -1.33333333, v24 + -1.33333333);
  -[SBSystemApertureContainerView _layoutHitTestViewWithBounds:](self, "_layoutHitTestViewWithBounds:", v4, v6, v8, v10);
  rotatingContentView = self->_rotatingContentView;
  v26 = *(_OWORD *)&self->_activeContentRotationTransform.c;
  v27[0] = *(_OWORD *)&self->_activeContentRotationTransform.a;
  v27[1] = v26;
  v27[2] = *(_OWORD *)&self->_activeContentRotationTransform.tx;
  -[UIView setTransform:](rotatingContentView, "setTransform:", v27);
  -[SBSystemApertureContainerView _updateShadowStyleIfNeeded](self, "_updateShadowStyleIfNeeded");
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[UIView setNeedsLayout](self->_rotatingContentView, "setNeedsLayout");
  -[UIView setNeedsLayout](self->_scalingContentView, "setNeedsLayout");
}

- (void)willMoveToSuperview:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView willMoveToSuperview:](&v8, sel_willMoveToSuperview_);
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "parentViewForSubBackgroundForSystemApertureContainerView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_subBackgroundGroupingView);

    objc_msgSend(WeakRetained, "parentViewForBackgroundForSystemApertureContainerView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_backgroundGroupingView);

  }
  else
  {
    -[UIView insertSubview:atIndex:](self->_contentClippingView, "insertSubview:atIndex:", self->_subBackgroundGroupingView, 0);
    -[UIView insertSubview:atIndex:](self->_contentClippingView, "insertSubview:atIndex:", self->_backgroundGroupingView, 1);
  }
}

- (void)setIDCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemApertureContainerView;
  -[UIView setIDCornerRadius:](&v5, sel_setIDCornerRadius_);
  -[_UILumaTrackingBackdropView setIDCornerRadius:](self->_backgroundLumaSamplingBackdrop, "setIDCornerRadius:", a3);
  -[UIView setIDCornerRadius:](self->_shadowView, "setIDCornerRadius:", a3 + -1.0);
  -[UIView setIDCornerRadius:](self->_darkBkgKeyLineView, "setIDCornerRadius:", *(double *)&SBSystemApertureKeyLineThickness + a3);
  -[UIView setIDCornerRadius:](self->_lightBkgKeyLineView, "setIDCornerRadius:", *(double *)&SBSystemApertureAdaptiveKeyLineThickness + a3);
  -[_SBSystemApertureGainMapView setIDCornerRadius:](self->_gainMapView, "setIDCornerRadius:", a3);
  -[UIView setIDCornerRadius:](self->_blobEnablingBlackFillView, "setIDCornerRadius:", a3 + -0.666666667);
  -[UIView setIDCornerRadius:](self->_scalingContentView, "setIDCornerRadius:", a3);
  -[UIView setIDCornerRadius:](self->_contentClippingView, "setIDCornerRadius:", a3);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContainerView.m"), 450, CFSTR("use -[UIView setIDCornerRadius:] instead"));

  v7.receiver = self;
  v7.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView _setContinuousCornerRadius:](&v7, sel__setContinuousCornerRadius_, a3);
}

- (void)_setCornerRadius:(double)a3
{
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContainerView.m"), 455, CFSTR("use -[UIView setIDCornerRadius:] instead"));

  v7.receiver = self;
  v7.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView _setCornerRadius:](&v7, sel__setCornerRadius_, a3);
}

- (void)_updateContentViewTransformImmediately
{
  int64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = -[SBSystemApertureContainerView activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:](self, "activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:", self);
  +[SBSystemApertureViewControllerRotationTransitionContext transformForRotationToInterfaceOrientation:](SBSystemApertureViewControllerRotationTransitionContext, "transformForRotationToInterfaceOrientation:", v3);
  v4 = v9;
  *(_OWORD *)&self->_activeContentRotationTransform.a = v8;
  *(_OWORD *)&self->_activeContentRotationTransform.c = v4;
  *(_OWORD *)&self->_activeContentRotationTransform.tx = v10;
  v6 = *(_OWORD *)&self->_activeContentRotationTransform.c;
  v5 = *(_OWORD *)&self->_activeContentRotationTransform.tx;
  *(_OWORD *)&self->_previousContentTransform.a = *(_OWORD *)&self->_activeContentRotationTransform.a;
  *(_OWORD *)&self->_previousContentTransform.c = v6;
  *(_OWORD *)&self->_previousContentTransform.tx = v5;
  v7 = *(_OWORD *)&self->_activeContentRotationTransform.c;
  v8 = *(_OWORD *)&self->_activeContentRotationTransform.a;
  v9 = v7;
  v10 = *(_OWORD *)&self->_activeContentRotationTransform.tx;
  -[SBSystemApertureContainerView _setContentViewTransform:elementViewControllerInterfaceOrientation:](self, "_setContentViewTransform:elementViewControllerInterfaceOrientation:", &v8, v3);
}

- (void)setElementOrientationAuthority:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementOrientationAuthority);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_elementOrientationAuthority, obj);
    -[SBSystemApertureContainerView _updateContentViewTransformImmediately](self, "_updateContentViewTransformImmediately");
    v5 = obj;
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  UIColor *cachedValidatedKeyLineTintColor;
  id v6;

  v6 = a4;
  -[SBSystemApertureContainerView _applySettingsValues](self, "_applySettingsValues");
  if ((objc_msgSend(v6, "containsString:", CFSTR("keyLineColorFixedLstar")) & 1) != 0
    || objc_msgSend(v6, "containsString:", CFSTR("activityKeyLineColorEnabled")))
  {
    cachedValidatedKeyLineTintColor = self->_cachedValidatedKeyLineTintColor;
    self->_cachedValidatedKeyLineTintColor = 0;

  }
  -[SBSystemApertureContainerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_applySettingsValues
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[SBSystemApertureSettings keyLineThickness](self->_settings, "keyLineThickness");
  SBSystemApertureKeyLineThickness = v3;
  -[SBSystemApertureSettings adaptiveKeyLineThickness](self->_settings, "adaptiveKeyLineThickness");
  SBSystemApertureAdaptiveKeyLineThickness = v4;
  -[SBSystemApertureSettings keyLineAlpha](self->_settings, "keyLineAlpha");
  SBSystemApertureKeyLineDarkBkgEnabledOpacity = v5;
  -[SBSystemApertureContainerView _updateKeyLineFilters](self, "_updateKeyLineFilters");
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id WeakRetained;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_AXSClassicInvertColorsEnabled())
  {
    if (a4 == 2)
      v6 = 1;
    else
      v6 = 2;
    goto LABEL_12;
  }
  v7 = _AXSInvertColorsEnabled();
  v8 = a4 == 2;
  v9 = 1;
  if (a4 == 2)
    v6 = 2;
  else
    v6 = 1;
  if (!v8)
    v9 = 2;
  if (v7)
  {
    v6 = v9;
LABEL_12:
    v10 = 1;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_13:
  SBLogSystemApertureController();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    SBStringFromSystemApertureBackgroundLuminanceLevel(self->_sampledBackgroundLuminanceLevel);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromSystemApertureBackgroundLuminanceLevel(v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = &stru_1E8EC7EC0;
    v17 = 138543874;
    v18 = v12;
    if (v10)
      v15 = CFSTR("(Inverted)");
    v19 = 2114;
    v20 = v13;
    v21 = 2112;
    v22 = v15;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Key Line: Sampled background luma (%{public}@) -> (%{public}@) %@", (uint8_t *)&v17, 0x20u);

  }
  self->_sampledBackgroundLuminanceLevel = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemApertureContainerView:sampledLuminanceLevelChangedTo:", self, v6);

}

+ (double)_defaultCornerRadiusForBounds:(CGRect)a3 inWindow:(id)a4
{
  double v4;
  void *v5;
  double v6;
  double v7;

  v4 = CGRectGetHeight(a3) * 0.5;
  objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumContinuousCornerRadius");
  v7 = v6;

  if (v4 <= v7)
    return v4;
  else
    return v7;
}

- (id)_validatedKeyLineTintColor
{
  UIColor *cachedValidatedKeyLineTintColor;
  id WeakRetained;
  void *v5;
  UIColor *v6;
  UIColor *v7;

  cachedValidatedKeyLineTintColor = self->_cachedValidatedKeyLineTintColor;
  if (!cachedValidatedKeyLineTintColor)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "keyLineColorValidatorForSystemApertureContainerView:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "validateKeyLineColor:", self->_keyLineTintColor);
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedValidatedKeyLineTintColor;
    self->_cachedValidatedKeyLineTintColor = v6;

    cachedValidatedKeyLineTintColor = self->_cachedValidatedKeyLineTintColor;
  }
  return cachedValidatedKeyLineTintColor;
}

- (void)_updateKeyLineFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _OWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  -[SBSystemApertureSettings adaptiveKeyLineColorMatrix](self->_settings, "adaptiveKeyLineColorMatrix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "colorMatrix");
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
  }

  v19[2] = v22;
  v19[3] = v23;
  v19[4] = v24;
  v19[0] = v20;
  v19[1] = v21;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v19, "{CAColorMatrix=ffffffffffffffffffff}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("inputColorMatrix"));

  v26[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_AXSClassicInvertColorsEnabled() || _AXSInvertColorsEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BE0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v8;
    v9 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  else
  {
    v9 = 0;
  }
  -[_SBAdaptiveKeyLineBackdropView backdropLayer](self->_lightBkgKeyLineView, "backdropLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowsInPlaceFiltering:", v9 ^ 1u);

  -[_SBAdaptiveKeyLineBackdropView layer](self->_lightBkgKeyLineView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFilters:", v7);

  -[SBSystemApertureSettings keyLineDarkToMixedMinLuma](self->_settings, "keyLineDarkToMixedMinLuma");
  v15 = v14;
  if (((v9 ^ 1) & 1) != 0)
  {
    -[SBSystemApertureSettings keyLineMixedToDarkMaxLuma](self->_settings, "keyLineMixedToDarkMaxLuma");
    v17 = v18;
  }
  else
  {
    v15 = 1.0 - v14;
    -[SBSystemApertureSettings keyLineMixedToDarkMaxLuma](self->_settings, "keyLineMixedToDarkMaxLuma");
    v17 = 1.0 - v16;
  }
  -[_UILumaTrackingBackdropView setTransitionBoundaries:](self->_backgroundLumaSamplingBackdrop, "setTransitionBoundaries:", v15, v17);

}

- (void)_updateShadowStyleIfNeeded
{
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromSystemApertureShadowStyle(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v7;
  v11 = 2050;
  v12 = a1;
  v13 = 2114;
  v14 = v8;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p>: Updating Container to Shadow Style: %{public}@", (uint8_t *)&v9, 0x20u);

}

- (BOOL)_isInRotationTransition
{
  __int128 v2;
  __int128 v3;
  CGAffineTransform v5;
  CGAffineTransform t1;

  v2 = *(_OWORD *)&self->_previousContentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_previousContentTransform.a;
  *(_OWORD *)&t1.c = v2;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_previousContentTransform.tx;
  v3 = *(_OWORD *)&self->_activeContentRotationTransform.c;
  *(_OWORD *)&v5.a = *(_OWORD *)&self->_activeContentRotationTransform.a;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)&self->_activeContentRotationTransform.tx;
  return !CGAffineTransformEqualToTransform(&t1, &v5);
}

- (id)_generateAccessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("jindo-container-view:%lu"), self->_rank + 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureContainerView elementViewController](self, "elementViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "elementViewProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "elementViewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "element");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "elementIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(",client-identifier:%@,element-identifier:%@"), v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
  }

  return v3;
}

- (SAUIElementViewControlling)outgoingElementViewController
{
  return (SAUIElementViewControlling *)objc_loadWeakRetained((id *)&self->_outgoingElementViewController);
}

- (SBSystemApertureElementOrientationAuthority)elementOrientationAuthority
{
  return (SBSystemApertureElementOrientationAuthority *)objc_loadWeakRetained((id *)&self->_elementOrientationAuthority);
}

- (SBSystemApertureContainerViewDelegate)delegate
{
  return (SBSystemApertureContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_elementOrientationAuthority);
  objc_destroyWeak((id *)&self->_outgoingElementViewController);
  objc_destroyWeak((id *)&self->_elementViewController);
  objc_storeStrong((id *)&self->_interfaceElementIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionIDsToReasons, 0);
  objc_storeStrong((id *)&self->_cachedValidatedKeyLineTintColor, 0);
  objc_storeStrong((id *)&self->_keyLineTintColor, 0);
  objc_storeStrong((id *)&self->_rotatingContentView, 0);
  objc_storeStrong((id *)&self->_scalingContentView, 0);
  objc_storeStrong((id *)&self->_hitTestView, 0);
  objc_storeStrong((id *)&self->_subBackgroundGroupingView, 0);
  objc_storeStrong((id *)&self->_backgroundGroupingView, 0);
  objc_storeStrong((id *)&self->_gainMapView, 0);
  objc_storeStrong((id *)&self->_blobEnablingBlackFillView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_lightBkgKeyLineView, 0);
  objc_storeStrong((id *)&self->_darkBkgKeyLineView, 0);
  objc_storeStrong((id *)&self->_backgroundLumaSamplingBackdrop, 0);
  objc_storeStrong((id *)&self->_contentClippingView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (unint64_t)rank
{
  return self->_rank;
}

@end

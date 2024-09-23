@implementation VKCVisualSearchResultItemView

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->_observingInteractionDidFinish)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    getkDDRVInteractionDidFinishNotification_0();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB450], 0);

  v6.receiver = self;
  v6.super_class = (Class)VKCVisualSearchResultItemView;
  -[VKCVisualSearchResultItemView dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "queryID");
  -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "analysis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> queryID: %llu analysisID: %d"), v4, self, v6, objc_msgSend(v8, "analysisRequestID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (VKCVisualSearchResultItemView)initWithVisualSearchResultItem:(id)a3
{
  id v5;
  VKCVisualSearchResultItemView *v6;
  VKCVisualSearchResultItemView *v7;
  VKCLookupButton *v8;
  VKCLookupButton *lookupButton;
  double v10;
  uint64_t v11;
  CALayer *iconInLookupButtonLayer;
  uint64_t v13;
  CALayer *pulsingLayer;
  void *v15;
  id v16;
  void *v17;
  VKCLookupButton *v18;
  void *v19;
  NSObject *v20;
  VKCVisualSearchResultItemView *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v27;
  VKCVisualSearchResultItemView *v28;
  id v29;
  id location;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VKCVisualSearchResultItemView;
  v6 = -[VKCVisualSearchResultItemView init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualSearchResultItem, a3);
    v8 = objc_alloc_init(VKCLookupButton);
    lookupButton = v7->_lookupButton;
    v7->_lookupButton = v8;

    -[VKCVisualSearchResultItemView lookupButtonSize](v7, "lookupButtonSize");
    -[VKCLookupButton setFrame:](v7->_lookupButton, "setFrame:", 0.0, 0.0, v10, v10);
    -[VKCVisualSearchResultItemView addSubview:](v7, "addSubview:", v7->_lookupButton);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    iconInLookupButtonLayer = v7->_iconInLookupButtonLayer;
    v7->_iconInLookupButtonLayer = (CALayer *)v11;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v13 = objc_claimAutoreleasedReturnValue();
    pulsingLayer = v7->_pulsingLayer;
    v7->_pulsingLayer = (CALayer *)v13;

    -[VKCLookupButton setAccessibilityIdentifier:](v7->_lookupButton, "setAccessibilityIdentifier:", CFSTR("com.apple.visionkit.visualSearchIndicator"));
    -[VKCVisualSearchResultItemView setPulsing:](v7, "setPulsing:", 1);
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)-[VKCVisualSearchResultItemView registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v15, sel__updateLayout);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v7, sel_didTap_);
    -[VKCLookupButton addGestureRecognizer:](v7->_lookupButton, "addGestureRecognizer:", v17);
    -[VKCVisualSearchResultItemView setTapGestureRecognizer:](v7, "setTapGestureRecognizer:", v17);
    v18 = v7->_lookupButton;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v7);
    -[VKCLookupButton addInteraction:](v18, "addInteraction:", v19);

    objc_initWeak(&location, v7);
    dispatch_get_global_queue(-2, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__VKCVisualSearchResultItemView_initWithVisualSearchResultItem___block_invoke;
    block[3] = &unk_1E94658E8;
    v27 = v5;
    v21 = v7;
    v28 = v21;
    objc_copyWeak(&v29, &location);
    dispatch_async(v20, block);

    v21->_interfaceOrientation = 0;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "beginGeneratingDeviceOrientationNotifications");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v21, sel_deviceOrientationDidChange_, *MEMORY[0x1E0CEB450], v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __64__VKCVisualSearchResultItemView_initWithVisualSearchResultItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_INFO, "Pre loading image for visual search item: %@, %@", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = (id)objc_msgSend(WeakRetained, "tintedImageForButton");

}

- (double)lookupButtonSize
{
  double v2;

  -[VKCVisualSearchResultItemView contentSizeScaleFactor](self, "contentSizeScaleFactor");
  return v2 * 22.0;
}

- (double)contentSizeScaleFactor
{
  void *v2;
  double v3;
  double v4;

  -[VKCVisualSearchResultItemView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_contentSizeScaleFactor");
  v4 = v3;

  return fmax(v4, 1.0);
}

- (CGRect)boundsFromVisualSearchResult
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
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGRect result;

  -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedBoundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentsRect");
  v14 = v13;
  -[VKCVisualSearchResultItemView superview](self, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v14 * v16;
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentsRect");
  v20 = v19;
  -[VKCVisualSearchResultItemView superview](self, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v20 * v22;
  -[VKCVisualSearchResultItemView superview](self, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentsRect");
  v29 = v26 * v28;
  -[VKCVisualSearchResultItemView superview](self, "superview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "contentsRect");
  v35 = v32 * v34;

  -[VKCVisualSearchResultItemView superview](self, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v9 * v37;
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "contentsRect");
  v41 = v38 * v40;

  -[VKCVisualSearchResultItemView superview](self, "superview");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bounds");
  v44 = v11 * v43;
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "contentsRect");
  v47 = v44 * v46;

  v48 = round(v17 + v5 * v29);
  v49 = round(v23 + v7 * v35);
  v50 = round(v41);
  v51 = round(v47);
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (CGPoint)pointForVisualSearchIcon
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedIconLocation");
  v5 = v4;
  v7 = v6;

  -[VKCVisualSearchResultItemView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v5 * v9;
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentsRect");
  v13 = v10 * v12;
  -[VKCVisualSearchResultItemView superview](self, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v7 * v15;
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentsRect");
  v19 = v16 * v18;

  v20 = v13;
  v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  int64_t interfaceOrientation;

  interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != a3)
  {
    if (interfaceOrientation)
      objc_msgSend(getDDRevealBridgeClass(), "underlyingViewDisappeared:", self->_lookupButton);
    if (a3)
      self->_interfaceOrientation = a3;
  }
}

- (int64_t)interfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[VKCVisualSearchResultItemView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (void)deviceOrientationDidChange:(id)a3
{
  void *v4;
  id v5;

  -[VKCVisualSearchResultItemView window](self, "window", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchResultItemView setInterfaceOrientation:](self, "setInterfaceOrientation:", objc_msgSend(v4, "interfaceOrientation"));

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCVisualSearchResultItemView;
  -[VKCVisualSearchResultItemView layoutSubviews](&v3, sel_layoutSubviews);
  -[VKCVisualSearchResultItemView _updateLayout](self, "_updateLayout");
}

- (void)_updateLayout
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[VKCVisualSearchResultItemView boundsFromVisualSearchResult](self, "boundsFromVisualSearchResult");
  -[VKCVisualSearchResultItemView setFrame:](self, "setFrame:");
  -[VKCVisualSearchResultItemView updateIndicatorDotForState](self, "updateIndicatorDotForState");
  -[VKCVisualSearchResultItemView updatePulsingLayer](self, "updatePulsingLayer");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CGRect)rectForIndicatorDot
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[VKCVisualSearchResultItemView lookupButtonSize](self, "lookupButtonSize");
  -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:", 0.0, 0.0, v3, v3);
  v5 = v4;
  -[VKCVisualSearchResultItemView bounds](self, "bounds");
  v10 = VKMCenterOfRect(v6, v7, v8, v9);
  v12 = VKMRectWithCenterAndSize(v10, v11, v5);
  v16 = VKMAliasRoundedRectForScale(v12, v13, v14, v15, 1.0);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)updateIndicatorDotForState
{
  int64_t status;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  CALayer *iconInLookupButtonLayer;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  double v31;
  _OWORD v32[16];
  CATransform3D v33;
  CATransform3D v34;

  status = self->_status;
  if (status == 1)
  {
    -[VKCVisualSearchResultItemView lookupButtonSize](self, "lookupButtonSize");
    v23 = v22;
    -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:", 0.0, 0.0, v23, v23);
    v25 = v24 / v23;
    -[VKCVisualSearchResultItemView _transformForButtonScale](self, "_transformForButtonScale");
    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v32[12];
    v32[5] = v32[13];
    v32[6] = v32[14];
    v32[7] = v32[15];
    v32[0] = v32[8];
    v32[1] = v32[9];
    v32[2] = v32[10];
    v32[3] = v32[11];
    objc_msgSend(v26, "setTransform:", v32);

    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBorderWidth:", v25 + v25);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBorderColor:", v29);

    LODWORD(v31) = 0;
    -[CALayer setOpacity:](self->_iconInLookupButtonLayer, "setOpacity:", v31);
  }
  else
  {
    if (status)
      return;
    -[VKCVisualSearchResultItemView rectForIndicatorDot](self, "rectForIndicatorDot");
    -[VKCLookupButton setFrame:](self->_lookupButton, "setFrame:");
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setVk_backgroundColor:](self->_lookupButton, "setVk_backgroundColor:", v4);

    -[VKCVisualSearchResultItemView rectForIndicatorDot](self, "rectForIndicatorDot");
    v6 = v5 * 0.5;
    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowColor:", v9);

    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1053609165;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowRadius:", 4.0);

    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowOffset:", 0.0, 5.0);

    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMasksToBounds:", 0);

    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderWidth:", 0.0);

    CATransform3DMakeScale(&v34, 1.0, 1.0, 1.0);
    -[VKCLookupButton layer](self->_lookupButton, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v34;
    objc_msgSend(v17, "setTransform:", &v33);

    -[CALayer superlayer](self->_iconInLookupButtonLayer, "superlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[VKCLookupButton layer](self->_lookupButton, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSublayer:", self->_iconInLookupButtonLayer);

    }
    LODWORD(v19) = 1.0;
    -[CALayer setOpacity:](self->_iconInLookupButtonLayer, "setOpacity:", v19);
    iconInLookupButtonLayer = self->_iconInLookupButtonLayer;
    -[VKCLookupButton bounds](self->_lookupButton, "bounds");
    -[VKCVisualSearchResultItemView setImageContentsInLayer:withRect:](self, "setImageContentsInLayer:withRect:", iconInLookupButtonLayer);
  }
  -[VKCVisualSearchResultItemView updatePulsingLayer](self, "updatePulsingLayer");
}

- (CGRect)_rectForViewSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
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
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCVisualSearchResultItemView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fixedCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchResultItemView coordinateSpace](self, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (UIImage)imageForButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CEA638];
  -[VKCVisualSearchResultItemView _symbolNameForItem](self, "_symbolNameForItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_symbolImageWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CEA638];
    -[VKCVisualSearchResultItemView _defaultSymbolName](self, "_defaultSymbolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vk_symbolImageWithName:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIImage *)v5;
}

- (UIImage)tintedImageForButton
{
  UIImage *tintedImageForButton;
  VKCVisualSearchResultItemView *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *v10;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  tintedImageForButton = self->_tintedImageForButton;
  if (!tintedImageForButton)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_tintedImageForButton)
    {
      -[VKCVisualSearchResultItemView imageForButton](v4, "imageForButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          -[VKCVisualSearchResultItemView visualSearchResultItem](v4, "visualSearchResultItem");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[VKCVisualSearchResultItemView tintedImageForButton].cold.1(v7, (uint64_t)v12, v6);
        }

        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((image) != nil)", "-[VKCVisualSearchResultItemView tintedImageForButton]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "image");
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "size");
      objc_msgSend(v5, "vk_imageWithTint:size:", v8);
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v10 = self->_tintedImageForButton;
      self->_tintedImageForButton = v9;

    }
    objc_sync_exit(v4);

    tintedImageForButton = self->_tintedImageForButton;
  }
  return tintedImageForButton;
}

- (id)_symbolNameForItem
{
  void *v2;
  void *v3;

  -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "glyphName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_defaultSymbolName
{
  return CFSTR("doc.text.magnifyingglass");
}

- (void)removePulsing
{
  double v2;

  LODWORD(v2) = 0;
  -[CALayer setOpacity:](self->_pulsingLayer, "setOpacity:", v2);
  -[CALayer removeAllAnimations](self->_pulsingLayer, "removeAllAnimations");
}

- (void)animateToVisualResultsPane:(BOOL)a3
{
  _BOOL8 v3;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  _OWORD v25[8];
  _OWORD v26[8];
  _OWORD v27[8];
  _OWORD v28[8];
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v3 = a3;
  v5 = CFSTR("animateOut");
  if (a3)
    v5 = CFSTR("animateIn");
  v6 = v5;
  if (self->_pinLayer)
    -[VKCVisualSearchResultItemView _animatePin:](self, "_animatePin:", v3);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDamping:", 20.0);
  objc_msgSend(v7, "setStiffness:", 380.0);
  objc_msgSend(v7, "setDuration:", 0.4936);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[VKCVisualSearchResultItemView _transformForButtonScale](self, "_transformForButtonScale");
  if (v3)
  {
    v33 = v41;
    v34 = v42;
    v35 = v43;
    v36 = v44;
    v29 = v37;
    v30 = v38;
    v31 = v39;
    v32 = v40;
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v28[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v28[7] = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v28[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v28[5] = v9;
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v28[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v28[3] = v10;
    v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v28[0] = *MEMORY[0x1E0CD2610];
    v28[1] = v11;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v28, "{CATransform3D=dddddddddddddddd}");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = &unk_1E94951D8;
    v14 = 0.0;
    v15 = &unk_1E94951E8;
  }
  else
  {
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v33 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v34 = v16;
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v35 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v36 = v17;
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v29 = *MEMORY[0x1E0CD2610];
    v30 = v18;
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v32 = v19;
    v27[6] = v43;
    v27[7] = v44;
    v27[4] = v41;
    v27[5] = v42;
    v27[2] = v39;
    v27[3] = v40;
    v27[0] = v37;
    v27[1] = v38;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v27, "{CATransform3D=dddddddddddddddd}");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = &unk_1E94951E8;
    v14 = 1.0;
    v15 = &unk_1E94951D8;
  }
  objc_msgSend(v7, "setFromValue:", v12);

  v26[4] = v33;
  v26[5] = v34;
  v26[6] = v35;
  v26[7] = v36;
  v26[0] = v29;
  v26[1] = v30;
  v26[2] = v31;
  v26[3] = v32;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v26, "{CATransform3D=dddddddddddddddd}");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v20);

  -[VKCLookupButton layer](self->_lookupButton, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v33;
  v25[5] = v34;
  v25[6] = v35;
  v25[7] = v36;
  v25[0] = v29;
  v25[1] = v30;
  v25[2] = v31;
  v25[3] = v32;
  objc_msgSend(v21, "setTransform:", v25);

  -[VKCLookupButton layer](self->_lookupButton, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAnimation:forKey:", v7, CFSTR("buttonScaleAnimation"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDuration:", 0.2);
  objc_msgSend(v23, "setFromValue:", v13);
  objc_msgSend(v23, "setToValue:", v15);
  *(float *)&v24 = v14;
  -[CALayer setOpacity:](self->_iconInLookupButtonLayer, "setOpacity:", v24);
  objc_msgSend(v23, "setDelegate:", self);
  objc_msgSend(v23, "setValue:forKey:", v6, CFSTR("animationName"));
  -[CALayer addAnimation:forKey:](self->_iconInLookupButtonLayer, "addAnimation:forKey:", v23, CFSTR("iconImageAnimation"));

}

- (CATransform3D)_transformForButtonScale
{
  CATransform3D *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CATransform3D v9;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  result = CATransform3DMakeScale(&v9, 0.3, 0.3, 1.0);
  v5 = *(_OWORD *)&v9.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v9.m31;
  *(_OWORD *)&retstr->m33 = v5;
  v6 = *(_OWORD *)&v9.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v9.m41;
  *(_OWORD *)&retstr->m43 = v6;
  v7 = *(_OWORD *)&v9.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v9.m11;
  *(_OWORD *)&retstr->m13 = v7;
  v8 = *(_OWORD *)&v9.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v9.m21;
  *(_OWORD *)&retstr->m23 = v8;
  return result;
}

- (void)_animatePin:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _OWORD *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  float v29;
  CALayer *pinLayer;
  double v31;
  _OWORD v32[8];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _OWORD v42[8];
  _OWORD v43[8];
  _BYTE v44[128];
  _QWORD v45[3];

  v3 = a3;
  v45[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDamping:", 20.0);
  objc_msgSend(v5, "setStiffness:", 380.0);
  objc_msgSend(v5, "setDuration:", 0.4936);
  v6 = (void *)MEMORY[0x1E0CB3B18];
  v7 = (_OWORD *)MEMORY[0x1E0CD2610];
  if (v3)
  {
    -[VKCVisualSearchResultItemView _pinEndTransform](self, "_pinEndTransform");
    objc_msgSend(v6, "valueWithBytes:objCType:", v44, "{CATransform3D=dddddddddddddddd}");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFromValue:", v8);

    v9 = v7[5];
    v43[4] = v7[4];
    v43[5] = v9;
    v10 = v7[7];
    v43[6] = v7[6];
    v43[7] = v10;
    v11 = v7[1];
    v43[0] = *v7;
    v43[1] = v11;
    v12 = v7[3];
    v43[2] = v7[2];
    v43[3] = v12;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v43, "{CATransform3D=dddddddddddddddd}");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &unk_1E9494FD0;
    v15 = &unk_1E9494FE8;
  }
  else
  {
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v42[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v42[5] = v16;
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v42[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v42[7] = v17;
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v42[0] = *MEMORY[0x1E0CD2610];
    v42[1] = v18;
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v42[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v42[3] = v19;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v42, "{CATransform3D=dddddddddddddddd}");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFromValue:", v20);

    v21 = (void *)MEMORY[0x1E0CB3B18];
    -[VKCVisualSearchResultItemView _pinEndTransform](self, "_pinEndTransform");
    objc_msgSend(v21, "valueWithBytes:objCType:", v41, "{CATransform3D=dddddddddddddddd}");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &unk_1E9494FE8;
    v15 = &unk_1E9494FD0;
  }
  objc_msgSend(v5, "setToValue:", v13);

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDamping:", 20.0);
  objc_msgSend(v22, "setStiffness:", 380.0);
  objc_msgSend(v22, "setDuration:", 0.4936);
  objc_msgSend(v22, "setFromValue:", v14);
  objc_msgSend(v22, "setToValue:", v15);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v5;
  v45[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAnimations:", v24);

  objc_msgSend(v23, "setDuration:", 0.4936);
  if (v3)
  {
    v25 = v7[5];
    v37 = v7[4];
    v38 = v25;
    v26 = v7[7];
    v39 = v7[6];
    v40 = v26;
    v27 = v7[1];
    v33 = *v7;
    v34 = v27;
    v28 = v7[3];
    v35 = v7[2];
    v36 = v28;
    v29 = 1.0;
  }
  else
  {
    -[VKCVisualSearchResultItemView _pinEndTransform](self, "_pinEndTransform");
    v29 = 0.0;
  }
  pinLayer = self->_pinLayer;
  v32[4] = v37;
  v32[5] = v38;
  v32[6] = v39;
  v32[7] = v40;
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v35;
  v32[3] = v36;
  -[CALayer setTransform:](pinLayer, "setTransform:", v32);
  *(float *)&v31 = v29;
  -[CALayer setOpacity:](self->_pinLayer, "setOpacity:", v31);
  -[CALayer addAnimation:forKey:](self->_pinLayer, "addAnimation:forKey:", v23, CFSTR("pinAnimation"));

}

- (CATransform3D)_pinEndTransform
{
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CATransform3D v15;
  CATransform3D a;
  CATransform3D v17;
  CATransform3D v18;

  -[VKCVisualSearchResultItemView _pinSizeForViewScale](self, "_pinSizeForViewScale");
  v6 = v5;
  v8 = v7;
  memset(&v18, 0, sizeof(v18));
  CATransform3DMakeScale(&v18, 0.01, 0.01, 0.01);
  memset(&v17, 0, sizeof(v17));
  v9 = -[VKCVisualSearchResultItemView _pinArrowDirection](self, "_pinArrowDirection");
  if (v9 == 3)
  {
    v11 = -0.5;
LABEL_9:
    v13 = v6 * v11;
    v12 = 0.0;
    goto LABEL_10;
  }
  if (v9 == 1)
  {
    v10 = 0.5;
    goto LABEL_7;
  }
  if (v9)
  {
    v11 = 0.5;
    goto LABEL_9;
  }
  v10 = -0.5;
LABEL_7:
  v12 = v8 * v10;
  v13 = 0.0;
LABEL_10:
  CATransform3DMakeTranslation(&v17, v13, v12, 0.0);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  a = v18;
  v15 = v17;
  return CATransform3DConcat(retstr, &a, &v15);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  CALayer *pinLayer;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  CATransform3D v12;
  CATransform3D v13;

  objc_msgSend(a3, "valueForKey:", CFSTR("animationName"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("animateOut")))
  {
    -[CALayer removeFromSuperlayer](self->_pinLayer, "removeFromSuperlayer");
    pinLayer = self->_pinLayer;
    self->_pinLayer = 0;

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("animateIn")))
  {
    -[VKCVisualSearchResultItemView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "normalizedBoundingBox");
    objc_msgSend(v7, "visualSearchItemView:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self);

    -[VKCVisualSearchResultItemView showLookupUIPaneForResultItem](self, "showLookupUIPaneForResultItem");
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("dotAnimateIn")))
  {
    -[VKCVisualSearchResultItemView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1.0;
    objc_msgSend(v9, "setOpacity:", v10);

    CATransform3DMakeScale(&v13, 1.0, 1.0, 1.0);
    -[VKCVisualSearchResultItemView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    objc_msgSend(v11, "setTransform:", &v12);

  }
}

- (void)setImageContentsInLayer:(id)a3 withRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CALayer *v40;
  CGRect v41;
  CGRect v42;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v40 = (CALayer *)a3;
  VKMScaledRect(x, y, width, height, 0.5);
  v9 = VKMRectWithSize();
  v13 = VKMCenterRectOverRect(v9, v10, v11, v12, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (self->_iconInLookupButtonLayer != v40
    || (-[VKCVisualSearchResultItemView currentImageRectForLayerContents](self, "currentImageRectForLayerContents"),
        v42.origin.x = v13,
        v42.origin.y = v15,
        v42.size.width = v17,
        v42.size.height = v19,
        !CGRectEqualToRect(v41, v42)))
  {
    -[VKCVisualSearchResultItemView setCurrentImageRectForLayerContents:](self, "setCurrentImageRectForLayerContents:", v13, v15, v17, v19);
    -[VKCVisualSearchResultItemView tintedImageForButton](self, "tintedImageForButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setContents:](v40, "setContents:", objc_msgSend(v20, "vk_cgImage"));
    objc_msgSend(v20, "size");
    v23 = VKMFitOrFillSizeInRect(0, v21, v22, v13, v15, v17, v19);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    -[VKCVisualSearchResultItemView window](self, "window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "screen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");
    v33 = VKMAliasRoundedRectForScale(v23, v25, v27, v29, v32);
    v35 = v34;
    v37 = v36;
    v39 = v38;

    -[CALayer setFrame:](v40, "setFrame:", v33, v35, v37, v39);
  }

}

- (void)setImageContentsInLayer:(id)a3 withMaterialLayer:(id)a4 withRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  id v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  -[VKCVisualSearchResultItemView setImageContentsInLayer:withRect:](self, "setImageContentsInLayer:withRect:", v12, x, y, width, height);
  objc_msgSend(v11, "visualStylingProviderForCategory:", *MEMORY[0x1E0D16BD8]);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "visualStylingForStyle:", *MEMORY[0x1E0D16BF0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mt_replaceAllVisualStylingWithStyling:", v13);

}

- (void)showPinForTappedDot
{
  CALayer *pinLayer;
  CALayer *v4;
  CALayer *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;

  -[CALayer removeFromSuperlayer](self->_pinLayer, "removeFromSuperlayer");
  pinLayer = self->_pinLayer;
  self->_pinLayer = 0;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
  v5 = self->_pinLayer;
  self->_pinLayer = v4;

  LODWORD(v6) = 1.0;
  -[CALayer setOpacity:](self->_pinLayer, "setOpacity:", v6);
  -[VKCVisualSearchResultItemView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", self->_pinLayer);

  -[VKCVisualSearchResultItemView _pinSizeForViewScale](self, "_pinSizeForViewScale");
  v9 = v8;
  -[VKCVisualSearchResultItemView _screenZoomScale](self, "_screenZoomScale");
  v11 = v9 + v10 * -6.0;
  v12 = -[VKCVisualSearchResultItemView _pinArrowDirection](self, "_pinArrowDirection");
  -[VKCVisualSearchResultItemView updatePinLayerFrame](self, "updatePinLayerFrame");
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[CALayer bounds](self->_pinLayer, "bounds");
  objc_msgSend(v25, "setFrame:");
  -[VKCVisualSearchResultItemView trianglePathForPinBubbleWithDirection:withRadius:](self, "trianglePathForPinBubbleWithDirection:withRadius:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchResultItemView circlePathForPinBubbleWithDirection:withRadius:](self, "circlePathForPinBubbleWithDirection:withRadius:", v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "vk_appendBezierPath:", v14);

  objc_msgSend(v25, "setPath:", objc_msgSend(v13, "vk_CGPath"));
  v15 = objc_alloc_init(MEMORY[0x1E0D16C08]);
  objc_msgSend(v15, "setRecipe:", *MEMORY[0x1E0D16B78]);
  objc_msgSend(v15, "setWeighting:", 1.0);
  -[CALayer bounds](self->_pinLayer, "bounds");
  objc_msgSend(v15, "setFrame:");
  objc_msgSend(v15, "setMask:", v25);
  -[CALayer addSublayer:](self->_pinLayer, "addSublayer:", v15);
  -[UIView vk_viewPointRatioFromWindow](self, "vk_viewPointRatioFromWindow");
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setShadowColor:](self->_pinLayer, "setShadowColor:", objc_msgSend(v18, "CGColor"));

  v19 = v17 * 0.1;
  *(float *)&v19 = v17 * 0.1;
  -[CALayer setShadowOpacity:](self->_pinLayer, "setShadowOpacity:", v19);
  -[CALayer setShadowRadius:](self->_pinLayer, "setShadowRadius:", v17 * 10.0);
  -[CALayer setShadowOffset:](self->_pinLayer, "setShadowOffset:", 0.0, v17 + v17);
  -[CALayer setMasksToBounds:](self->_pinLayer, "setMasksToBounds:", 0);
  v26.origin.x = VKMRectWithSize();
  v27 = CGRectInset(v26, (v9 - v11) * 0.5, (v9 - v11) * 0.5);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchResultItemView setImageContentsInLayer:withMaterialLayer:withRect:](self, "setImageContentsInLayer:withMaterialLayer:withRect:", v24, v15, x, y, width, height);
  -[CALayer addSublayer:](self->_pinLayer, "addSublayer:", v24);

}

- (CGRect)_pinButtonRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 66.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 66.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)_pinSizeForViewScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[VKCVisualSearchResultItemView _pinButtonRect](self, "_pinButtonRect");
  -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:");
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (double)_screenZoomScale
{
  double v3;
  double v4;
  double v5;

  -[VKCVisualSearchResultItemView _pinButtonRect](self, "_pinButtonRect");
  -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:");
  v4 = v3;
  -[VKCVisualSearchResultItemView _pinButtonRect](self, "_pinButtonRect");
  return v4 / v5;
}

- (int64_t)_pinArrowDirection
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("com.apple.argos.domain_key.dogs"));

  if ((v6 & 1) != 0)
    return 0;
  -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domainInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("com.apple.argos.domain_key.cats"));

  return v11 ^ 1u;
}

- (void)updatePinLayerFrame
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;

  v3 = -[VKCVisualSearchResultItemView _pinArrowDirection](self, "_pinArrowDirection");
  -[VKCVisualSearchResultItemView _pinSizeForViewScale](self, "_pinSizeForViewScale");
  v5 = v4;
  v7 = v6;
  -[VKCVisualSearchResultItemView _offsetForPinBubbleFrameWithDirection:pinBubbleBounds:](self, "_offsetForPinBubbleFrameWithDirection:pinBubbleBounds:", v3, VKMRectWithSize());
  v9 = v8;
  v11 = v10;
  -[VKCLookupButton frame](self->_lookupButton, "frame");
  v16 = VKMCenterOfRect(v12, v13, v14, v15);
  v17 = VKMAddPoints(v9, v11, v16);
  -[CALayer setFrame:](self->_pinLayer, "setFrame:", VKMRectWithOriginAndSize(v18, v17, v19, v5, v7));
}

- (CGPoint)_offsetForPinBubbleFrameWithDirection:(int64_t)a3 pinBubbleBounds:(CGRect)a4
{
  double height;
  double width;
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
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  -[VKCVisualSearchResultItemView _screenZoomScale](self, "_screenZoomScale", a4.origin.x, a4.origin.y);
  v9 = v8 * 3.0;
  switch(a3)
  {
    case 0:
      v10 = width * -0.5;
      -[VKCLookupButton frame](self->_lookupButton, "frame");
      v12 = v9 + v11 * 0.5;
      break;
    case 1:
      v10 = width * -0.5;
      -[VKCLookupButton frame](self->_lookupButton, "frame");
      v12 = v13 * -0.5 - height - v9;
      break;
    case 2:
      -[VKCLookupButton frame](self->_lookupButton, "frame");
      v14 = -0.5;
      v10 = v15 * -0.5 - width - v9;
      goto LABEL_7;
    case 3:
      -[VKCLookupButton frame](self->_lookupButton, "frame");
      v10 = v9 + v16 * 0.5;
      v14 = -0.5;
LABEL_7:
      v12 = height * v14;
      break;
    default:
      v10 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      break;
  }
  v17 = v10;
  result.y = v12;
  result.x = v17;
  return result;
}

- (id)circlePathForPinBubbleWithDirection:(int64_t)a3 withRadius:(double)a4
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;

  -[CALayer bounds](self->_pinLayer, "bounds", a3);
  v9 = VKMCenterOfRect(v5, v6, v7, v8);
  return (id)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", VKMRectWithCenterAndSize(v9, v10, a4));
}

- (id)trianglePathForPinBubbleWithDirection:(int64_t)a3 withRadius:(double)a4
{
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double MidX;
  double v15;
  double MaxY;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double MaxX;
  double v23;
  double MinX;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[CALayer bounds](self->_pinLayer, "bounds");
  v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  v10 = a4 / 6.0;
  v11 = (v8 - a4) * 0.5 + 1.0;
  switch(a3)
  {
    case 0:
      -[CALayer bounds](self->_pinLayer, "bounds");
      v12 = v10 * 0.5;
      v13 = CGRectGetMidX(v26) - v12;
      -[CALayer bounds](self->_pinLayer, "bounds");
      objc_msgSend(v9, "moveToPoint:", v13, v11 + CGRectGetMinY(v27));
      -[CALayer bounds](self->_pinLayer, "bounds");
      MidX = CGRectGetMidX(v28);
      -[CALayer bounds](self->_pinLayer, "bounds");
      objc_msgSend(v9, "vk_addLineToPoint:", MidX, CGRectGetMinY(v29));
      -[CALayer bounds](self->_pinLayer, "bounds");
      v15 = v12 + CGRectGetMidX(v30);
      -[CALayer bounds](self->_pinLayer, "bounds");
      MaxY = v11 + CGRectGetMinY(v31);
      goto LABEL_7;
    case 1:
      -[CALayer bounds](self->_pinLayer, "bounds");
      v17 = v10 * 0.5;
      v18 = CGRectGetMidX(v32) - v17;
      -[CALayer bounds](self->_pinLayer, "bounds");
      objc_msgSend(v9, "moveToPoint:", v18, CGRectGetMaxY(v33) - v11);
      -[CALayer bounds](self->_pinLayer, "bounds");
      v19 = v17 + CGRectGetMidX(v34);
      -[CALayer bounds](self->_pinLayer, "bounds");
      objc_msgSend(v9, "vk_addLineToPoint:", v19, CGRectGetMaxY(v35) - v11);
      -[CALayer bounds](self->_pinLayer, "bounds");
      v15 = CGRectGetMidX(v36);
      -[CALayer bounds](self->_pinLayer, "bounds");
      MaxY = CGRectGetMaxY(v37);
      goto LABEL_7;
    case 2:
      -[CALayer bounds](self->_pinLayer, "bounds");
      v20 = CGRectGetMaxX(v38) - v11;
      -[CALayer bounds](self->_pinLayer, "bounds");
      v21 = v10 * 0.5;
      objc_msgSend(v9, "moveToPoint:", v20, CGRectGetMidY(v39) - v21);
      -[CALayer bounds](self->_pinLayer, "bounds");
      MaxX = CGRectGetMaxX(v40);
      -[CALayer bounds](self->_pinLayer, "bounds");
      objc_msgSend(v9, "vk_addLineToPoint:", MaxX, CGRectGetMidY(v41));
      -[CALayer bounds](self->_pinLayer, "bounds");
      v15 = CGRectGetMaxX(v42) - v11;
      goto LABEL_6;
    case 3:
      -[CALayer bounds](self->_pinLayer, "bounds");
      v23 = v11 + CGRectGetMinX(v43);
      -[CALayer bounds](self->_pinLayer, "bounds");
      v21 = v10 * 0.5;
      objc_msgSend(v9, "moveToPoint:", v23, CGRectGetMidY(v44) - v21);
      -[CALayer bounds](self->_pinLayer, "bounds");
      MinX = CGRectGetMinX(v45);
      -[CALayer bounds](self->_pinLayer, "bounds");
      objc_msgSend(v9, "vk_addLineToPoint:", MinX, CGRectGetMidY(v46));
      -[CALayer bounds](self->_pinLayer, "bounds");
      v15 = v11 + CGRectGetMinX(v47);
LABEL_6:
      -[CALayer bounds](self->_pinLayer, "bounds");
      MaxY = v21 + CGRectGetMidY(v48);
LABEL_7:
      objc_msgSend(v9, "vk_addLineToPoint:", v15, MaxY);
      objc_msgSend(v9, "closePath");
      break;
    default:
      return v9;
  }
  return v9;
}

- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGPoint v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  -[VKCVisualSearchResultItemView _rectForViewSpace:](self, "_rectForViewSpace:", VKMRectWithSize());
  v7 = v6;
  -[VKCVisualSearchResultItemView lookupButton](self, "lookupButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v13 = VKMCenterOfRect(v9, v10, v11, v12);
  v15 = VKMRectWithCenterAndSize(v13, v14, v7);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  v23.x = x;
  v23.y = y;
  return CGRectContainsPoint(v24, v23);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;

  y = a3.y;
  x = a3.x;
  if ((-[VKCVisualSearchResultItemView isHidden](self, "isHidden", a4) & 1) != 0
    || !-[VKCVisualSearchResultItemView containsVisualSearchItemAtPoint:](self, "containsVisualSearchItemAtPoint:", x, y))
  {
    v7 = 0;
  }
  else
  {
    -[VKCVisualSearchResultItemView lookupButton](self, "lookupButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)didTap:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  void *v10;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "visualSearchItemView:shouldBeginAtPoint:", self, v5, v7);

  if (v9)
  {
    -[VKCVisualSearchResultItemView visualSearchResultItem](self, "visualSearchResultItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentInvocationType:", 1);

    -[VKCVisualSearchResultItemView showVisualResultsPane](self, "showVisualResultsPane");
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self->_lookupButton);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)beginAnimatingDotAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
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
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  -[VKCVisualSearchResultItemView hideDots](self, "hideDots");
  -[VKCVisualSearchResultItemView setShouldShowDots:](self, "setShouldShowDots:", 1);
  -[VKCVisualSearchResultItemView _updateLayout](self, "_updateLayout");
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", &unk_1E94951E8);
  objc_msgSend(v5, "setToValue:", &unk_1E94951D8);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDamping:", 20.0);
  objc_msgSend(v6, "setStiffness:", 770.0);
  objc_msgSend(v6, "setDuration:", 0.73763);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VKCVisualSearchResultItemView _initialDotAnimationTransform](self, "_initialDotAnimationTransform");
  v20 = v28;
  v21 = v29;
  v22 = v30;
  v23 = v31;
  v16 = v24;
  v17 = v25;
  v18 = v26;
  v19 = v27;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v7);

  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v21 = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v23 = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v16 = *MEMORY[0x1E0CD2610];
  v17 = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v12);

  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDuration:", 0.4);
  v32[0] = v5;
  v32[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnimations:", v14);

  objc_msgSend(v13, "setBeginTime:", CACurrentMediaTime() + a3);
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "setValue:forKey:", CFSTR("dotAnimateIn"), CFSTR("animationName"));
  objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v13, "setRemovedOnCompletion:", 0);
  -[VKCVisualSearchResultItemView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v13, CFSTR("animateIn"));

}

- (CATransform3D)_initialDotAnimationTransform
{
  CATransform3D *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CATransform3D v9;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  result = CATransform3DMakeScale(&v9, 0.1, 0.1, 0.1);
  v5 = *(_OWORD *)&v9.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v9.m31;
  *(_OWORD *)&retstr->m33 = v5;
  v6 = *(_OWORD *)&v9.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v9.m41;
  *(_OWORD *)&retstr->m43 = v6;
  v7 = *(_OWORD *)&v9.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v9.m11;
  *(_OWORD *)&retstr->m13 = v7;
  v8 = *(_OWORD *)&v9.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v9.m21;
  *(_OWORD *)&retstr->m23 = v8;
  return result;
}

- (void)didFinishAnimatingDots
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  int v8;

  if (-[VKCVisualSearchResultItemView shouldShowDots](self, "shouldShowDots")
    && self->_automaticallyShowVisualSearchResults)
  {
    -[VKCVisualSearchResultItemView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCVisualSearchResultItemView bounds](self, "bounds");
    v8 = objc_msgSend(v3, "visualSearchItemView:shouldBeginAtPoint:", self, VKMCenterOfRect(v4, v5, v6, v7));

    if (v8)
      -[VKCVisualSearchResultItemView showVisualResultsPane](self, "showVisualResultsPane");
  }
}

- (void)hideDots
{
  double v3;
  id v4;

  -[VKCVisualSearchResultItemView setShouldShowDots:](self, "setShouldShowDots:", 0);
  -[VKCVisualSearchResultItemView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v4, "setOpacity:", v3);

}

- (void)showVisualResultsPane
{
  NSObject *v3;
  void *v4;
  int v5;
  double v6;
  int v7;
  VKCVisualSearchResultItemView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Visual search activated: %@", (uint8_t *)&v7, 0xCu);
  }

  if (!self->_isShowingVisualResultsPane)
  {
    self->_status = 1;
    self->_isShowingVisualResultsPane = 1;
    -[VKCVisualSearchResultItemView updateIndicatorDotForState](self, "updateIndicatorDotForState");
    -[VKCVisualSearchResultItemView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "vk_hasCompactWidth");

    if (v5)
    {
      -[VKCVisualSearchResultItemView showPinForTappedDot](self, "showPinForTappedDot");
      LODWORD(v6) = 0;
      -[CALayer setOpacity:](self->_pinLayer, "setOpacity:", v6);
    }
    -[VKCVisualSearchResultItemView animateToVisualResultsPane:](self, "animateToVisualResultsPane:", 1);
  }
}

- (void)_didDismissVisualResultsPane:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v5, (uint64_t)v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  objc_msgSend(v14, "clientHints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v7, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[VKCVisualSearchResultItemView currentRVItemID](self, "currentRVItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      getkDDRVInteractionDidFinishNotification_0();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObserver:name:object:", self, v13, 0);

      -[VKCVisualSearchResultItemView setObservingInteractionDidFinish:](self, "setObservingInteractionDidFinish:", 0);
      -[VKCVisualSearchResultItemView setCurrentRVItemID:](self, "setCurrentRVItemID:", 0);
      -[VKCVisualSearchResultItemView didDismissVisualResultsPane](self, "didDismissVisualResultsPane");
    }
  }

}

- (void)didDismissVisualResultsPane
{
  NSObject *v3;
  void *v4;
  int v5;
  VKCVisualSearchResultItemView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Visual search pane was dismissed: %@", (uint8_t *)&v5, 0xCu);
  }

  self->_isShowingVisualResultsPane = 0;
  self->_status = 0;
  -[VKCVisualSearchResultItemView animateToVisualResultsPane:](self, "animateToVisualResultsPane:", 0);
  -[VKCVisualSearchResultItemView updateIndicatorDotForState](self, "updateIndicatorDotForState");
  -[VKCVisualSearchResultItemView setNeedsLayout](self, "setNeedsLayout");
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualSearchItemViewDidDismissController:", self);

}

- (id)_queryString
{
  void *v2;
  void *v3;

  VKBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("VK_RESULTS_LOOKUP_PANEL_TITLE"), CFSTR("VK_RESULTS_LOOKUP_PANEL_TITLE"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_queryForProcessingResult
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  v3 = +[VKCImageAnalyzerRequest newQueryIDForParsec](VKCImageAnalyzerRequest, "newQueryIDForParsec");
  v4 = objc_alloc(MEMORY[0x1E0D87C68]);
  -[VKCVisualSearchResultItemView _queryString](self, "_queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke;
  v8[3] = &unk_1E94622B8;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = v3;
  v6 = (void *)objc_msgSend(v4, "initWithTitle:clientIdentifier:userAgent:queryID:queryProvider:", v5, CFSTR("com.apple.mediaanalysisd"), CFSTR("VisualIntelligence/1"), v3, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  void (**v7)(id, void *, _QWORD);
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  void *v28;
  void (**v29)(id, void *, _QWORD);
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a2 && a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      if ((objc_msgSend(WeakRetained, "didProcessResult") & 1) != 0)
      {
        objc_msgSend(v9, "visualSearchResultItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "searchItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "searchSections");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v12, 0);

        objc_msgSend(v9, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "visualSearchItemView:didProcessResultsWithDuration:", v9, 0.0);

        +[VKImageAnalyzerMadInterface sharedInterface](VKImageAnalyzerMadInterface, "sharedInterface");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v9, "visualSearchResultItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "queryID");
        objc_msgSend(v9, "visualSearchResultItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "didShowVisualSearchCachedResultsForQueryID:cachedResultQueryID:item:", v15, v17, v18);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "visualSearchResultItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_2;
        v26[3] = &unk_1E9462290;
        v27 = v21;
        v28 = v9;
        v30 = *(_QWORD *)(a1 + 48);
        v29 = v7;
        v25 = v21;
        objc_msgSend(v22, "generateVisualSearchResultForItems:queryID:completionHandler:", v24, v30, v26);

      }
    }

  }
  else
  {
    v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_cold_1(a1, v19, v20);

    v7[2](v7, 0, 0);
  }

}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_3;
  v11[3] = &unk_1E9462268;
  v12 = *(id *)(a1 + 32);
  v13 = v7;
  v8 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = v6;
  v17 = *(_QWORD *)(a1 + 56);
  v16 = v8;
  v9 = v6;
  v10 = v7;
  vk_performBlockOnMainThread(v11);

}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = v3;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_3_cold_1((uint64_t *)(a1 + 40), a1, v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_DEFAULT, "Successfully processed visual search results: %@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "userFeedbackPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setUserReportPayload:", v9);

    objc_msgSend(*(id *)(a1 + 48), "setDidProcessResult:", 1);
    objc_msgSend(*(id *)(a1 + 56), "resultItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "visualSearchResultItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSearchItem:", v12);

    v14 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 48), "visualSearchResultItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setQueryID:", v14);

    v16 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "visualSearchResultItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "searchSections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v19, 0);

    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "visualSearchItemView:didProcessResultsWithDuration:", *(_QWORD *)(a1 + 48), v4);

  }
}

- (void)showLookupUIPaneForResultItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[VKCVisualSearchResultItemView _queryForProcessingResult](self, "_queryForProcessingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D87C60]);
  -[VKCVisualSearchResultItemView _queryString](self, "_queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSearchQuery:rangeInContext:", v3, 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v5, "length"));

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__VKCVisualSearchResultItemView_showLookupUIPaneForResultItem__block_invoke;
  v13[3] = &unk_1E94622E0;
  v13[4] = self;
  objc_msgSend(v6, "setReportAnIssueExtendedBlock:", v13);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCVisualSearchResultItemView setCurrentRVItemID:](self, "setCurrentRVItemID:", v8);
  objc_msgSend(v6, "setClientHints:", v8);
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addMetadataToVSFeedbackItem:", v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getkDDRVInteractionDidFinishNotification_0();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__didDismissVisualResultsPane_, v11, 0);

  -[VKCVisualSearchResultItemView setObservingInteractionDidFinish:](self, "setObservingInteractionDidFinish:", 1);
  objc_msgSend(getDDRevealBridgeClass(), "performDefaultActionForRVItem:view:location:fallbackMenuInteraction:context:", v6, self->_lookupButton, 0, MEMORY[0x1E0C9AA70], *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[VKCVisualSearchResultItemView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visualSearchItemViewDidActivateVSItem:", self);

}

void __62__VKCVisualSearchResultItemView_showLookupUIPaneForResultItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userReportPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitVisualSearchUserFeedbackForReportIdentifier:userFeedbackPayload:sfReportData:", v7, v8, v6);

}

- (VKCVisualSearchResultItemViewDelegate)delegate
{
  return (VKCVisualSearchResultItemViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VKCVisualSearchResultItem)visualSearchResultItem
{
  return self->_visualSearchResultItem;
}

- (void)setVisualSearchResultItem:(id)a3
{
  objc_storeStrong((id *)&self->_visualSearchResultItem, a3);
}

- (NSData)userReportPayload
{
  return self->_userReportPayload;
}

- (void)setUserReportPayload:(id)a3
{
  objc_storeStrong((id *)&self->_userReportPayload, a3);
}

- (BOOL)pulsing
{
  return self->_pulsing;
}

- (BOOL)automaticallyShowVisualSearchResults
{
  return self->_automaticallyShowVisualSearchResults;
}

- (void)setAutomaticallyShowVisualSearchResults:(BOOL)a3
{
  self->_automaticallyShowVisualSearchResults = a3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (VKCLookupButton)lookupButton
{
  return self->_lookupButton;
}

- (void)setLookupButton:(id)a3
{
  objc_storeStrong((id *)&self->_lookupButton, a3);
}

- (CALayer)iconInLookupButtonLayer
{
  return self->_iconInLookupButtonLayer;
}

- (void)setIconInLookupButtonLayer:(id)a3
{
  objc_storeStrong((id *)&self->_iconInLookupButtonLayer, a3);
}

- (CGSize)cachedDotSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedDotSize.width;
  height = self->_cachedDotSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedDotSize:(CGSize)a3
{
  self->_cachedDotSize = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (CALayer)pinLayer
{
  return self->_pinLayer;
}

- (void)setPinLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pinLayer, a3);
}

- (CALayer)pulsingLayer
{
  return self->_pulsingLayer;
}

- (void)setPulsingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pulsingLayer, a3);
}

- (BOOL)didProcessResult
{
  return self->_didProcessResult;
}

- (void)setDidProcessResult:(BOOL)a3
{
  self->_didProcessResult = a3;
}

- (BOOL)isShowingVisualResultsPane
{
  return self->_isShowingVisualResultsPane;
}

- (void)setIsShowingVisualResultsPane:(BOOL)a3
{
  self->_isShowingVisualResultsPane = a3;
}

- (NSString)currentRVItemID
{
  return self->_currentRVItemID;
}

- (void)setCurrentRVItemID:(id)a3
{
  objc_storeStrong((id *)&self->_currentRVItemID, a3);
}

- (BOOL)observingInteractionDidFinish
{
  return self->_observingInteractionDidFinish;
}

- (void)setObservingInteractionDidFinish:(BOOL)a3
{
  self->_observingInteractionDidFinish = a3;
}

- (BOOL)shouldShowDots
{
  return self->_shouldShowDots;
}

- (void)setShouldShowDots:(BOOL)a3
{
  self->_shouldShowDots = a3;
}

- (CGRect)currentImageRectForLayerContents
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentImageRectForLayerContents.origin.x;
  y = self->_currentImageRectForLayerContents.origin.y;
  width = self->_currentImageRectForLayerContents.size.width;
  height = self->_currentImageRectForLayerContents.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentImageRectForLayerContents:(CGRect)a3
{
  self->_currentImageRectForLayerContents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRVItemID, 0);
  objc_storeStrong((id *)&self->_pulsingLayer, 0);
  objc_storeStrong((id *)&self->_pinLayer, 0);
  objc_storeStrong((id *)&self->_iconInLookupButtonLayer, 0);
  objc_storeStrong((id *)&self->_lookupButton, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_userReportPayload, 0);
  objc_storeStrong((id *)&self->_visualSearchResultItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tintedImageForButton, 0);
}

- (void)tintedImageForButton
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_2(&dword_1D2E0D000, a3, (uint64_t)a3, "imageForButton returned nil for Result item: %@", (uint8_t *)a2);

}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_2(&dword_1D2E0D000, a2, a3, "Server access was not permitted: %@", (uint8_t *)&v4);
}

void __58__VKCVisualSearchResultItemView__queryForProcessingResult__block_invoke_3_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_ERROR, "Could not process analysis result with error: %@, %@", (uint8_t *)&v5, 0x16u);
}

@end

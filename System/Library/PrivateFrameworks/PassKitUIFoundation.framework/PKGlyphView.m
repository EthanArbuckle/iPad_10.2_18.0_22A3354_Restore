@implementation PKGlyphView

+ (BOOL)automaticallyNotifiesObserversOfState
{
  return 0;
}

+ (id)sharedStaticResources
{
  void *v2;

  if (PKPearlIsAvailable())
  {
    objc_msgSend(MEMORY[0x24BE60870], "sharedStaticResources");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (void)invokeSuccessFeedback
{
  if (PKPearlIsAvailable())
    objc_msgSend(MEMORY[0x24BE60870], "invokeSuccessFeedback");
}

- (PKGlyphView)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This class is not NSCoding compliant"));
  return -[PKGlyphView init](self, "init");
}

- (PKGlyphView)initWithFrame:(CGRect)a3
{
  return -[PKGlyphView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKGlyphView)initWithStyle:(int64_t)a3
{
  double v4;
  double v5;
  PKGlyphView *v6;
  PKGlyphView *v7;
  NSMutableArray *v8;
  NSMutableArray *transitionCompletionHandlers;
  dispatch_group_t v10;
  OS_dispatch_group *lastAnimationGroup;
  void *v12;
  PKFingerprintGlyphView *v13;
  PKFingerprintGlyphView *fingerprintView;
  double v15;
  double v16;
  void *v17;
  unint64_t style;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  LAUIPearlGlyphView *pearlView;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  PKPhoneGlyphLayer *v33;
  PKPhoneGlyphLayer *phoneLayer;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CALayer *v40;
  CALayer *userIntentLayer;
  int v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  int IsWithinScreen;
  void *v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  PKMicaLayer *userIntentDeviceLayer;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  PKMicaLayer *userIntentArrowLayer;
  PKMicaLayer *v64;
  LAUICheckmarkLayer *v65;
  LAUICheckmarkLayer *checkLayer;
  uint64_t v67;
  CALayer *customImageLayer;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  UIColor *primaryHighlightColor;
  uint64_t v82;
  UIColor *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  UIColor *intentPrimaryHighlightColor;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  UIColor *secondaryHighlightColor;
  uint64_t v94;
  UIColor *v95;
  int64_t v97;
  _QWORD v98[4];
  UIColor *v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[4];
  UIColor *v103;
  CATransform3D v104;
  _OWORD v105[5];
  uint64_t v106;
  unint64_t v107;
  __int128 v108;
  __int128 v109;
  objc_super v110;

  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v110.receiver = self;
  v110.super_class = (Class)PKGlyphView;
  v6 = -[PKGlyphView initWithFrame:](&v110, sel_initWithFrame_, v4, v5, 63.0, 63.0);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_style = a3;
  v6->_userIntentEdge = 1;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  transitionCompletionHandlers = v7->_transitionCompletionHandlers;
  v7->_transitionCompletionHandlers = v8;

  v10 = dispatch_group_create();
  lastAnimationGroup = v7->_lastAnimationGroup;
  v7->_lastAnimationGroup = (OS_dispatch_group *)v10;

  -[PKGlyphView setAutoresizesSubviews:](v7, "setAutoresizesSubviews:", 0);
  if (PKPearlIsAvailable())
  {
    if (PKSystemApertureIsAvailable())
      v12 = (void *)objc_msgSend(MEMORY[0x24BE60868], "createSystemApertureConfiguration");
    else
      v12 = (void *)objc_msgSend(MEMORY[0x24BE60868], "createDefaultConfiguration");
    v17 = v12;
    style = v7->_style;
    v16 = 1.0;
    if (style - 3 < 4)
    {
      v19 = 3;
    }
    else
    {
      if (style >= 3)
      {
        if (style == 7)
        {
          objc_msgSend(v12, "setInitialStyle:", 7);
          objc_msgSend(v17, "setLineThicknessScale:", 1.4285712);
          objc_msgSend(v17, "setCheckmarkThicknessScale:", 2.16);
          v16 = 1.71;
        }
        goto LABEL_12;
      }
      v19 = 0;
    }
    objc_msgSend(v12, "setInitialStyle:", v19);
LABEL_12:
    objc_msgSend(v17, "lineThicknessScale");
    v21 = v20;
    objc_msgSend(v17, "checkmarkThicknessScale");
    v15 = v21 * v22;
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE60870]), "initWithConfiguration:", v17);
    pearlView = v7->_pearlView;
    v7->_pearlView = (LAUIPearlGlyphView *)v23;

    -[LAUIPearlGlyphView setDelegate:](v7->_pearlView, "setDelegate:", v7);
    -[PKGlyphView addSubview:](v7, "addSubview:", v7->_pearlView);

    goto LABEL_13;
  }
  v13 = objc_alloc_init(PKFingerprintGlyphView);
  fingerprintView = v7->_fingerprintView;
  v7->_fingerprintView = v13;

  -[PKFingerprintGlyphView setDelegate:](v7->_fingerprintView, "setDelegate:", v7);
  -[PKGlyphView addSubview:](v7, "addSubview:", v7->_fingerprintView);
  v15 = 1.0;
  v16 = 1.0;
LABEL_13:
  -[LAUIPearlGlyphView contentLayer](v7->_pearlView, "contentLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    -[PKFingerprintGlyphView contentLayer](v7->_fingerprintView, "contentLayer");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;

  v29 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v105[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v105[3] = v29;
  v105[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v30 = *(_QWORD *)(MEMORY[0x24BDE5598] + 80);
  v31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v105[0] = *MEMORY[0x24BDE5598];
  v105[1] = v31;
  v106 = v30;
  v107 = 0xBF4F4DA659A413CFLL;
  v32 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v108 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v109 = v32;
  objc_msgSend(v28, "setSublayerTransform:", v105);
  v33 = objc_alloc_init(PKPhoneGlyphLayer);
  phoneLayer = v7->_phoneLayer;
  v7->_phoneLayer = v33;

  -[PKPhoneGlyphLayer setAnchorPoint:](v7->_phoneLayer, "setAnchorPoint:", 0.5, 1.0);
  -[PKPhoneGlyphLayer setAllowsEdgeAntialiasing:](v7->_phoneLayer, "setAllowsEdgeAntialiasing:", 1);
  -[PKPhoneGlyphLayer setShouldRasterize:](v7->_phoneLayer, "setShouldRasterize:", 1);
  objc_msgSend(v28, "addSublayer:", v7->_phoneLayer);
  -[PKMicaLayer rootLayer](v7->_phoneLayer, "rootLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = v36;
  v39 = v38;

  v7->_phoneAspectRatio = v37 / v39;
  v97 = a3;
  if (PKUserIntentIsAvailable())
  {
    v40 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    userIntentLayer = v7->_userIntentLayer;
    v7->_userIntentLayer = v40;

    objc_msgSend(v28, "addSublayer:", v7->_userIntentLayer);
    v42 = PKIsPad();
    v7->_isPad = v42;
    if (v42)
    {
      PKPassKitUIFoundationBundle();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "URLForResource:withExtension:", CFSTR("Payment_glyph_intent_pad"), CFSTR("caar"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0.5;
      v46 = 0.977777778;
    }
    else
    {
      IsWithinScreen = PKFrontFaceCameraIsWithinScreen();
      PKPassKitUIFoundationBundle();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v48;
      if (IsWithinScreen)
        v49 = CFSTR("Payment_glyph_intent_phone-D73");
      else
        v49 = CFSTR("Payment_glyph_intent_phone");
      objc_msgSend(v48, "URLForResource:withExtension:", v49, CFSTR("caar"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0.00561797753;
      v45 = 0.494444444;
    }

    v50 = *MEMORY[0x24BDE5D48];
    objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v44, *MEMORY[0x24BDE5D48], 0, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_alloc(MEMORY[0x24BE6EBA8]);
    v53 = *MEMORY[0x24BDBF070];
    v54 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v55 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v56 = *(double *)(MEMORY[0x24BDBF070] + 24);
    v57 = objc_msgSend(v52, "initWithFrame:package:", v51, *MEMORY[0x24BDBF070], v54, v55, v56);
    userIntentDeviceLayer = v7->_userIntentDeviceLayer;
    v7->_userIntentDeviceLayer = (PKMicaLayer *)v57;

    -[PKMicaLayer setAnchorPoint:](v7->_userIntentDeviceLayer, "setAnchorPoint:", v45, v46);
    PKPassKitUIFoundationBundle();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "URLForResource:withExtension:", CFSTR("Payment_glyph_intent_arrow"), CFSTR("caar"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v60, v50, 0, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = objc_msgSend(objc_alloc(MEMORY[0x24BE6EBA8]), "initWithFrame:package:", v61, v53, v54, v55, v56);
    userIntentArrowLayer = v7->_userIntentArrowLayer;
    v7->_userIntentArrowLayer = (PKMicaLayer *)v62;

    -[PKMicaLayer setAnchorPoint:](v7->_userIntentArrowLayer, "setAnchorPoint:", 0.0, 0.484375);
    if (v7->_isPad)
    {
      v64 = v7->_userIntentArrowLayer;
      CATransform3DMakeRotation(&v104, 1.57079633, 0.0, 0.0, 1.0);
      -[PKMicaLayer setTransform:](v64, "setTransform:", &v104);
    }
    -[CALayer addSublayer:](v7->_userIntentLayer, "addSublayer:", v7->_userIntentDeviceLayer);
    -[CALayer addSublayer:](v7->_userIntentLayer, "addSublayer:", v7->_userIntentArrowLayer);

    a3 = v97;
  }
  v7->_checkScale = v16;
  v65 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x24BE60860]);
  checkLayer = v7->_checkLayer;
  v7->_checkLayer = v65;

  -[LAUICheckmarkLayer setLineWidthScale:](v7->_checkLayer, "setLineWidthScale:", v15 / v7->_checkScale);
  -[LAUICheckmarkLayer setRevealed:animated:](v7->_checkLayer, "setRevealed:animated:", 0, 0);
  -[PKGlyphView createCustomImageLayer](v7, "createCustomImageLayer");
  v67 = objc_claimAutoreleasedReturnValue();
  customImageLayer = v7->_customImageLayer;
  v7->_customImageLayer = (CALayer *)v67;

  objc_msgSend(v28, "addSublayer:", v7->_customImageLayer);
  objc_msgSend(v28, "addSublayer:", v7->_checkLayer);
  -[PKGlyphView layer](v7, "layer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (a3 == 3)
  {
    objc_msgSend(v69, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v70, "setAllowsGroupBlending:", 0);
    -[LAUIPearlGlyphView layer](v7->_pearlView, "layer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71;
    if (v71)
    {
      v73 = v71;
    }
    else
    {
      -[PKFingerprintGlyphView layer](v7->_fingerprintView, "layer");
      v73 = (id)objc_claimAutoreleasedReturnValue();
    }
    v74 = v73;

    objc_msgSend(v74, "setAllowsGroupOpacity:", 0);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59E8]);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setCompositingFilter:", v75);

  }
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.8745098, 0.9372549, 0.9960784, 1.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  v78 = (void *)MEMORY[0x24BDF6950];
  v79 = MEMORY[0x24BDAC760];
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
    v80 = objc_claimAutoreleasedReturnValue();
    primaryHighlightColor = v7->_primaryHighlightColor;
    v7->_primaryHighlightColor = (UIColor *)v80;
  }
  else
  {
    v102[0] = MEMORY[0x24BDAC760];
    v102[1] = 3221225472;
    v102[2] = __29__PKGlyphView_initWithStyle___block_invoke;
    v102[3] = &unk_24D0A17B0;
    v103 = v76;
    objc_msgSend(v78, "colorWithDynamicProvider:", v102);
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = v7->_primaryHighlightColor;
    v7->_primaryHighlightColor = (UIColor *)v82;

    primaryHighlightColor = v103;
  }

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.6784314, 0.827451, 1.0, 1.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)MEMORY[0x24BDF6950];
  v100[0] = v79;
  v100[1] = 3221225472;
  v100[2] = __29__PKGlyphView_initWithStyle___block_invoke_2;
  v100[3] = &unk_24D0A17B0;
  v86 = v84;
  v101 = v86;
  objc_msgSend(v85, "colorWithDynamicProvider:", v100);
  v87 = objc_claimAutoreleasedReturnValue();
  intentPrimaryHighlightColor = v7->_intentPrimaryHighlightColor;
  v7->_intentPrimaryHighlightColor = (UIColor *)v87;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v89;
  v91 = (void *)MEMORY[0x24BDF6950];
  if (v97 == 3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.5723, 1.0);
    v92 = objc_claimAutoreleasedReturnValue();
    secondaryHighlightColor = v7->_secondaryHighlightColor;
    v7->_secondaryHighlightColor = (UIColor *)v92;
  }
  else
  {
    v98[0] = v79;
    v98[1] = 3221225472;
    v98[2] = __29__PKGlyphView_initWithStyle___block_invoke_3;
    v98[3] = &unk_24D0A17B0;
    v99 = v89;
    objc_msgSend(v91, "colorWithDynamicProvider:", v98);
    v94 = objc_claimAutoreleasedReturnValue();
    v95 = v7->_secondaryHighlightColor;
    v7->_secondaryHighlightColor = (UIColor *)v94;

    secondaryHighlightColor = v99;
  }

  v7->_colorMode = 0;
  -[PKGlyphView _applyColorMode:](v7, "_applyColorMode:", 0);
  -[PKGlyphView _applyEffectiveHighlightColorsToLayersAnimated:](v7, "_applyEffectiveHighlightColorsToLayersAnimated:", 0);
  objc_msgSend(v70, "contentsScale");
  -[PKGlyphView updateRasterizationScale:](v7, "updateRasterizationScale:");
  -[PKGlyphView setNeedsLayout](v7, "setNeedsLayout");
  -[PKGlyphView _updateUserIntentLayerRotation](v7, "_updateUserIntentLayerRotation");
  -[PKGlyphView updateRotation](v7, "updateRotation");
  -[PKGlyphView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("glyph"));

  return v7;
}

id __29__PKGlyphView_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  if (v3 >= 2)
  {
    if (v3 != 2)
    {
LABEL_6:
      v5 = 0;
      v4 = *(id *)(a1 + 32);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.1607843, 0.3137255, 1.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(id *)(a1 + 32);
  }
  v5 = v4;
  if (!v4)
    goto LABEL_6;
LABEL_7:
  v6 = v4;

  return v6;
}

id __29__PKGlyphView_initWithStyle___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  if (v3 >= 2)
  {
    if (v3 != 2)
    {
LABEL_6:
      v5 = 0;
      v4 = *(id *)(a1 + 32);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0313725, 0.4156863, 0.8, 1.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(id *)(a1 + 32);
  }
  v5 = v4;
  if (!v4)
    goto LABEL_6;
LABEL_7:
  v6 = v4;

  return v6;
}

id __29__PKGlyphView_initWithStyle___block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  if (v3 >= 2)
  {
    if (v3 != 2)
    {
LABEL_6:
      v5 = 0;
      v4 = *(id *)(a1 + 32);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.01960784, 0.2627451, 0.509804, 1.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(id *)(a1 + 32);
  }
  v5 = v4;
  if (!v4)
    goto LABEL_6;
LABEL_7:
  v6 = v4;

  return v6;
}

- (void)dealloc
{
  CGImage *customImage;
  objc_super v4;

  if (self->_transitioning)
    -[PKGlyphView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", 1);
  customImage = self->_customImage;
  if (customImage)
    CFRelease(customImage);
  -[LAUIPearlGlyphView setDelegate:](self->_pearlView, "setDelegate:", 0);
  -[PKFingerprintGlyphView setDelegate:](self->_fingerprintView, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PKGlyphView;
  -[PKGlyphView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKGlyphView;
  -[PKGlyphView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PKGlyphView updateRotation](self, "updateRotation");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKGlyphView;
  -[PKGlyphView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKGlyphView _applyEffectiveHighlightColorsToLayersAnimated:](self, "_applyEffectiveHighlightColorsToLayersAnimated:", 1);
  -[PKGlyphView _applyEffectivePrimaryColorToLayersAnimated:](self, "_applyEffectivePrimaryColorToLayersAnimated:", 1);
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
  PKFingerprintGlyphView *fingerprintView;
  LAUIPearlGlyphView *pearlView;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v13.receiver = self;
  v13.super_class = (Class)PKGlyphView;
  -[PKGlyphView layoutSubviews](&v13, sel_layoutSubviews);
  -[PKGlyphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  fingerprintView = self->_fingerprintView;
  if (fingerprintView)
  {
    -[PKFingerprintGlyphView bounds](fingerprintView, "bounds");
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    if (!CGRectEqualToRect(v14, v16))
    {
      -[PKFingerprintGlyphView setFrame:](self->_fingerprintView, "setFrame:", v4, v6, v8, v10);
      -[PKFingerprintGlyphView setNeedsLayout](self->_fingerprintView, "setNeedsLayout");
    }
  }
  pearlView = self->_pearlView;
  if (pearlView)
  {
    -[LAUIPearlGlyphView bounds](pearlView, "bounds");
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    if (!CGRectEqualToRect(v15, v17))
    {
      -[LAUIPearlGlyphView setFrame:](self->_pearlView, "setFrame:", v4, v6, v8, v10);
      -[LAUIPearlGlyphView setNeedsLayout](self->_pearlView, "setNeedsLayout");
    }
  }
}

- (void)_layoutContentLayer:(id)a3
{
  id v4;
  void *v5;
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
  CALayer *userIntentLayer;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double left;
  double top;
  double bottom;
  double right;
  CGImage *customImage;
  CGImage *v29;
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
  LAUICheckmarkLayer *checkLayer;
  double v46;
  double v47;

  v4 = a3;
  -[PKGlyphView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsScale");
  v7 = v6;

  objc_msgSend(v4, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  userIntentLayer = self->_userIntentLayer;
  v17 = (double *)MEMORY[0x24BDBEFB0];
  if (userIntentLayer)
  {
    -[CALayer anchorPoint](userIntentLayer, "anchorPoint");
    v19 = v18;
    v21 = v20;
    -[CALayer setBounds:](self->_userIntentLayer, "setBounds:", *v17, v17[1], v13, v15);
    -[CALayer setPosition:](self->_userIntentLayer, "setPosition:", v9 + v19 * v13, v11 + v21 * v15);
    -[PKGlyphView _updateUserIntentLayoutAnimated:](self, "_updateUserIntentLayoutAnimated:", 0);
  }
  v47 = v13;
  -[PKGlyphView _updatePhoneLayoutWithTransitionIndex:animated:](self, "_updatePhoneLayoutWithTransitionIndex:animated:", self->_transitionIndex, 0);
  -[CALayer contentsScale](self->_customImageLayer, "contentsScale");
  v23 = v22;
  top = self->_customImageAlignmentEdgeInsets.top;
  left = self->_customImageAlignmentEdgeInsets.left;
  bottom = self->_customImageAlignmentEdgeInsets.bottom;
  right = self->_customImageAlignmentEdgeInsets.right;
  customImage = self->_customImage;
  if (!customImage || (CGImageGetWidth(customImage), (v29 = self->_customImage) == 0))
  {
    v46 = right / v23;
    v30 = bottom / v23;
    v31 = left / v23;
    v32 = top / v23;
    goto LABEL_8;
  }
  CGImageGetHeight(v29);
  v30 = bottom / v23;
  v31 = left / v23;
  v32 = top / v23;
  v46 = right / v23;
  if (!self->_customImage)
  {
LABEL_8:
    v33 = v31;
    goto LABEL_9;
  }
  v33 = left / v23;
LABEL_9:
  PKSizeAlignedInRectWithScale();
  v34 = v7;
  v36 = v35 - v33;
  v38 = v37 - v32;
  v40 = v46 + v33 + v39;
  v42 = v30 + v32 + v41;
  -[CALayer anchorPoint](self->_customImageLayer, "anchorPoint");
  -[CALayer setPosition:](self->_customImageLayer, "setPosition:", v36 + v43 * v40, v38 + v44 * v42);
  -[CALayer setBounds:](self->_customImageLayer, "setBounds:", *v17, v17[1], v40, v42);
  -[LAUICheckmarkLayer defaultSizeForCircleWithDiameter:scale:](self->_checkLayer, "defaultSizeForCircleWithDiameter:scale:", v47 * self->_checkScale, v34);
  checkLayer = self->_checkLayer;
  PKSizeAlignedInRectWithScale();
  -[LAUICheckmarkLayer setFrame:](checkLayer, "setFrame:");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKGlyphView;
  -[PKGlyphView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PKGlyphView _applyColorMode:](self, "_applyColorMode:", 1);
}

- (void)updateRotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
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
  unsigned int v31;
  double v32;
  id WeakRetained;
  id v34;
  CGRect v35;
  CGRect v36;

  if (self->_userIntentLayer && self->_isPad)
  {
    -[PKGlyphView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v3;
    if (v3)
      objc_msgSend(v3, "screen");
    else
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fixedCoordinateSpace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    LAUIPhysicalButtonNormalizedFrame();
    objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v5, v8 + v23 * v12, v10 + v24 * v14, v12 * v25, v14 * v26);
    if (v29 <= 0.0)
    {
      v32 = v28;
      v36.origin.x = v16;
      v36.origin.y = v18;
      v36.size.width = v20;
      v36.size.height = v22;
      if (v32 < CGRectGetMidY(v36))
        v31 = 1;
      else
        v31 = 3;
    }
    else
    {
      v30 = v27;
      v35.origin.x = v16;
      v35.origin.y = v18;
      v35.size.width = v20;
      v35.size.height = v22;
      v31 = 2 * (v30 >= CGRectGetMidX(v35));
    }
    if (self->_userIntentEdge != v31)
    {
      self->_userIntentEdge = v31;
      -[PKGlyphView _updateUserIntentLayerRotation](self, "_updateUserIntentLayerRotation");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "glyphViewUserIntentEdgeDidChange:", self);
      }

    }
  }
}

- (void)updateRasterizationScale:(double)a3
{
  void *v5;

  -[PKGlyphView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentsScale:", a3);

  -[PKPhoneGlyphLayer setRasterizationScale:](self->_phoneLayer, "setRasterizationScale:", a3);
}

- (void)_updateLastAnimationTimeWithAnimationOfDuration:(double)a3
{
  self->_lastAnimationWillFinish = fmax(CFAbsoluteTimeGetCurrent() + a3, self->_lastAnimationWillFinish);
}

- (void)_executeAfterMinimumAnimationDurationForStateTransition:(id)a3
{
  -[PKGlyphView _executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio:handler:](self, "_executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio:handler:", a3, 1.0);
}

- (void)_executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio:(double)a3 handler:(id)a4
{
  id v6;
  CFAbsoluteTime Current;
  double v8;
  NSObject *lastAnimationGroup;
  _QWORD block[4];
  id v11;
  double v12;
  CFAbsoluteTime v13;

  v6 = a4;
  if (v6)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v8 = fmax(self->_lastAnimationWillFinish - Current, 0.0);
    lastAnimationGroup = self->_lastAnimationGroup;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __93__PKGlyphView__executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio_handler___block_invoke;
    block[3] = &unk_24D0A17D8;
    v12 = fmax(a3, 0.0) * v8;
    v13 = Current;
    v11 = v6;
    dispatch_group_notify(lastAnimationGroup, MEMORY[0x24BDAC9B8], block);

  }
}

void __93__PKGlyphView__executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio_handler___block_invoke(uint64_t a1)
{
  double v2;
  dispatch_time_t v3;

  v2 = *(double *)(a1 + 40) - (CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
  if (v2 <= 0.0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
    dispatch_after(v3, MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
  }
}

- (void)setState:(int64_t)a3
{
  -[PKGlyphView setState:animated:completionHandler:](self, "setState:animated:completionHandler:", a3, 0, 0);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSMutableArray *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  NSMutableArray *transitionCompletionHandlers;
  void *v14;
  id v15;

  v5 = a4;
  v8 = a5;
  if (self->_state != a3)
  {
    v15 = v8;
    if (self->_transitioning)
    {
      self->_transitioning = 0;
      -[PKGlyphView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", 1);
      v11 = self->_transitioningAnimated || v5;
      -[PKGlyphView setState:animated:completionHandler:](self, "setState:animated:completionHandler:", a3, v11, v15);
    }
    else
    {
      v12 = self->_transitionIndex + 1;
      self->_transitionIndex = v12;
      self->_transitioning = 1;
      self->_transitioningAnimated = v5;
      self->_priorState = self->_state;
      if (v8)
      {
        transitionCompletionHandlers = self->_transitionCompletionHandlers;
        v14 = (void *)objc_msgSend(v8, "copy");
        -[NSMutableArray addObject:](transitionCompletionHandlers, "addObject:", v14);

      }
      -[PKGlyphView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
      self->_state = a3;
      -[PKGlyphView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
      -[PKGlyphView _performTransitionWithTransitionIndex:animated:](self, "_performTransitionWithTransitionIndex:animated:", v12, v5);
    }
    goto LABEL_14;
  }
  if (v8)
  {
    v15 = v8;
    if (self->_transitioning)
    {
      v9 = self->_transitionCompletionHandlers;
      v10 = (void *)objc_msgSend(v8, "copy");
      -[NSMutableArray addObject:](v9, "addObject:", v10);

    }
    else
    {
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    }
LABEL_14:
    v8 = v15;
  }

}

- (void)_executeTransitionCompletionHandlers:(BOOL)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[NSMutableArray copy](self->_transitionCompletionHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_transitionCompletionHandlers, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_finishTransitionForIndex:(unint64_t)a3 cancelled:(BOOL)a4
{
  if (self->_transitioning && self->_transitionIndex == a3)
  {
    self->_transitioning = 0;
    -[PKGlyphView _executeTransitionCompletionHandlers:](self, "_executeTransitionCompletionHandlers:", a4);
  }
}

- (void)_performTransitionWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  char layoutFlags;
  char v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void (**v11)(_QWORD, _QWORD);
  unint64_t v12;
  LAUIPearlGlyphView *pearlView;
  void *v14;
  PKFingerprintGlyphView *fingerprintView;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  id v20;
  id v21;
  LAUIPearlGlyphView *v22;
  id *v23;
  void *v24;
  LAUIPearlGlyphView *v25;
  LAUIPearlGlyphView *v26;
  LAUIPearlGlyphView *v27;
  char v28;
  void (**v29)(_QWORD, _QWORD);
  uint64_t v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD);
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  LAUIPearlGlyphView *v39;
  _QWORD *v40;
  id *v41;
  LAUIPearlGlyphView *v42;
  uint64_t v43;
  LAUIPearlGlyphView *v44;
  PKFingerprintGlyphView *v45;
  PKFingerprintGlyphView *v46;
  id WeakRetained;
  PKFingerprintGlyphView *v48;
  PKFingerprintGlyphView *v49;
  id v50;
  void (**v51)(_QWORD, _QWORD);
  _QWORD v52[4];
  void (**v53)(_QWORD, _QWORD);
  id v54[2];
  _QWORD v55[5];
  id v56[2];
  _QWORD v57[5];
  id v58[2];
  _QWORD v59[4];
  void (**v60)(_QWORD, _QWORD);
  id v61[2];
  BOOL v62;
  _QWORD v63[4];
  id v64;
  id v65[2];
  _QWORD v66[4];
  void (**v67)(_QWORD, _QWORD);
  id v68[2];
  BOOL v69;
  _QWORD v70[4];
  void (**v71)(_QWORD, _QWORD);
  _QWORD v72[4];
  void (**v73)(_QWORD, _QWORD);
  _QWORD v74[4];
  id v75;
  void (**v76)(_QWORD, _QWORD);
  id v77[2];
  _QWORD v78[4];
  id v79;
  id v80;
  BOOL v81;
  _QWORD v82[4];
  id v83;
  id v84[2];
  _QWORD v85[4];
  id v86;
  id v87[2];
  BOOL v88;
  char v89;
  _QWORD v90[4];
  void (**v91)(_QWORD, _QWORD);
  _QWORD v92[4];
  void (**v93)(_QWORD, _QWORD);
  _QWORD v94[4];
  void (**v95)(_QWORD, _QWORD);
  _QWORD v96[4];
  void (**v97)(_QWORD, _QWORD);
  id v98[2];
  BOOL v99;
  _QWORD v100[4];
  id v101;
  id v102;
  void (**v103)(_QWORD, _QWORD);
  _QWORD v104[4];
  id v105[2];
  BOOL v106;
  _QWORD v107[4];
  id v108[2];
  BOOL v109;
  _QWORD v110[4];
  id v111[2];
  BOOL v112;
  _QWORD v113[4];
  void (**v114)(_QWORD, _QWORD);
  _QWORD v115[4];
  id v116[2];
  id location[2];

  v4 = a4;
  -[PKGlyphView layoutIfNeeded](self, "layoutIfNeeded");
  layoutFlags = (char)self->_layoutFlags;
  v8 = layoutFlags;
  if (self->_state != 9)
  {
    -[PKPhoneGlyphLayer setHighlighted:animated:](self->_phoneLayer, "setHighlighted:animated:", 0, v4);
    *(_BYTE *)&self->_layoutFlags &= 0xFCu;
    -[PKGlyphView _updatePhoneLayoutWithTransitionIndex:animated:](self, "_updatePhoneLayoutWithTransitionIndex:animated:", a3, v4);
    -[PKGlyphView _updatePhoneWiggleIfNecessary](self, "_updatePhoneWiggleIfNecessary");
    if (self->_state == 2)
      goto LABEL_5;
    v8 = (char)self->_layoutFlags;
  }
  *(_BYTE *)&self->_layoutFlags = v8 & 0xF3;
  -[PKGlyphView _updateUserIntentLayoutAnimated:](self, "_updateUserIntentLayoutAnimated:", v4);
  if (self->_state == 10)
  {
LABEL_6:
    -[PKGlyphView _updateCheckViewStateAnimated:withCompletion:](self, "_updateCheckViewStateAnimated:withCompletion:", v4, 0);
    goto LABEL_7;
  }
LABEL_5:
  -[PKGlyphView _updateCustomImageLayerOpacityAnimated:](self, "_updateCustomImageLayerOpacityAnimated:", v4);
  if (self->_state != 11)
    goto LABEL_6;
LABEL_7:
  objc_initWeak(location, self);
  v9 = MEMORY[0x24BDAC760];
  v115[0] = MEMORY[0x24BDAC760];
  v115[1] = 3221225472;
  v115[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke;
  v115[3] = &unk_24D0A1800;
  objc_copyWeak(v116, location);
  v116[1] = (id)a3;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199BB0CC](v115);
  v11 = v10;
  v12 = 0x254D15000uLL;
  switch(self->_state)
  {
    case 0:
      -[PKGlyphView setColorMode:animated:](self, "setColorMode:animated:", 0, v4);
      pearlView = self->_pearlView;
      if (pearlView)
      {
        v113[0] = v9;
        v113[1] = 3221225472;
        v113[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_3;
        v113[3] = &unk_24D0A1828;
        v114 = v11;
        -[LAUIPearlGlyphView setState:animated:withCompletion:](pearlView, "setState:animated:withCompletion:", 0, v4, v113);
        v14 = v114;
        goto LABEL_60;
      }
      fingerprintView = self->_fingerprintView;
      if (!fingerprintView)
        goto LABEL_61;
      v16 = 0;
      goto LABEL_51;
    case 1:
      -[PKGlyphView setColorMode:animated:](self, "setColorMode:animated:", 0, v4);
      fingerprintView = self->_fingerprintView;
      if (!fingerprintView)
        goto LABEL_61;
      v16 = 1;
      goto LABEL_51;
    case 2:
      -[PKGlyphView setColorMode:animated:](self, "setColorMode:animated:", 0, v4);
      v110[0] = v9;
      v110[1] = 3221225472;
      v110[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_4;
      v110[3] = &unk_24D0A1850;
      objc_copyWeak(v111, location);
      v111[1] = (id)a3;
      v112 = v4;
      v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199BB0CC](v110);
      v107[0] = v9;
      v107[1] = 3221225472;
      v107[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_7;
      v107[3] = &unk_24D0A1850;
      objc_copyWeak(v108, location);
      v108[1] = (id)a3;
      v109 = v4;
      v18 = (void *)MEMORY[0x2199BB0CC](v107);
      v104[0] = v9;
      v104[1] = 3221225472;
      v104[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_8;
      v104[3] = &unk_24D0A1850;
      objc_copyWeak(v105, location);
      v105[1] = (id)a3;
      v106 = v4;
      v19 = (void *)MEMORY[0x2199BB0CC](v104);
      v100[0] = v9;
      v100[1] = 3221225472;
      v100[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_9;
      v100[3] = &unk_24D0A18A0;
      v20 = v18;
      v101 = v20;
      v21 = v19;
      v102 = v21;
      v103 = v11;
      ((void (**)(_QWORD, _QWORD *))v17)[2](v17, v100);

      objc_destroyWeak(v105);
      objc_destroyWeak(v108);

      objc_destroyWeak(v111);
      v12 = 0x254D15000;
      goto LABEL_62;
    case 3:
      -[PKGlyphView setColorMode:animated:](self, "setColorMode:animated:", 0, v4);
      v22 = self->_pearlView;
      if (!v22)
        goto LABEL_61;
      v96[0] = v9;
      v96[1] = 3221225472;
      v96[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_12;
      v96[3] = &unk_24D0A18F0;
      v23 = v98;
      objc_copyWeak(v98, location);
      v98[1] = (id)a3;
      v99 = v4;
      v97 = v11;
      -[LAUIPearlGlyphView setState:animated:withCompletion:](v22, "setState:animated:withCompletion:", 4, v4, v96);
      v24 = v97;
      goto LABEL_48;
    case 4:
      -[PKGlyphView setColorMode:animated:](self, "setColorMode:animated:", 0, v4);
      v25 = self->_pearlView;
      if (!v25)
        goto LABEL_61;
      v94[0] = v9;
      v94[1] = 3221225472;
      v94[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_15;
      v94[3] = &unk_24D0A1828;
      v95 = v11;
      -[LAUIPearlGlyphView setState:animated:withCompletion:](v25, "setState:animated:withCompletion:", 1, v4, v94);
      v14 = v95;
      goto LABEL_60;
    case 5:
      -[PKGlyphView setColorMode:animated:](self, "setColorMode:animated:", 0, v4);
      v26 = self->_pearlView;
      if (!v26)
        goto LABEL_61;
      v92[0] = v9;
      v92[1] = 3221225472;
      v92[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_16;
      v92[3] = &unk_24D0A1828;
      v93 = v11;
      -[LAUIPearlGlyphView setState:animated:withCompletion:](v26, "setState:animated:withCompletion:", 2, v4, v92);
      v14 = v93;
      goto LABEL_60;
    case 6:
      v27 = self->_pearlView;
      if (v27)
      {
        v90[0] = v9;
        v90[1] = 3221225472;
        v90[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_17;
        v90[3] = &unk_24D0A1828;
        v91 = v10;
        -[LAUIPearlGlyphView setState:animated:withCompletion:](v27, "setState:animated:withCompletion:", 7, v4, v90);
        v14 = v91;
        goto LABEL_60;
      }
      fingerprintView = self->_fingerprintView;
      if (!fingerprintView)
        goto LABEL_61;
      v16 = 2;
LABEL_51:
      -[PKFingerprintGlyphView setState:animated:completionHandler:](fingerprintView, "setState:animated:completionHandler:", v16, v4, v11);
      goto LABEL_62;
    case 7:
      v28 = layoutFlags & 1;
      v85[0] = v9;
      v85[1] = 3221225472;
      v85[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_18;
      v85[3] = &unk_24D0A18C8;
      v23 = v87;
      objc_copyWeak(v87, location);
      v88 = v4;
      v29 = v11;
      v89 = v28;
      v86 = v29;
      v87[1] = (id)a3;
      v30 = MEMORY[0x2199BB0CC](v85);
      v31 = (void *)v30;
      if (v4)
      {
        v82[0] = v9;
        v82[1] = 3221225472;
        v82[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_22;
        v82[3] = &unk_24D0A1968;
        objc_copyWeak(v84, location);
        v84[1] = (id)a3;
        v83 = v31;
        -[PKGlyphView _setRecognizedIfNecessaryWithTransitionIndex:completion:](self, "_setRecognizedIfNecessaryWithTransitionIndex:completion:", a3, v82);

        objc_destroyWeak(v84);
      }
      else
      {
        (*(void (**)(uint64_t))(v30 + 16))(v30);
      }

      v24 = v86;
      goto LABEL_48;
    case 8:
      v78[0] = v9;
      v78[1] = 3221225472;
      v78[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_23;
      v78[3] = &unk_24D0A1918;
      v23 = &v80;
      objc_copyWeak(&v80, location);
      v81 = v4;
      v32 = v11;
      v79 = v32;
      v33 = MEMORY[0x2199BB0CC](v78);
      v34 = (void *)v33;
      if (v4)
      {
        v74[0] = v9;
        v74[1] = 3221225472;
        v74[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_25;
        v74[3] = &unk_24D0A1990;
        objc_copyWeak(v77, location);
        v77[1] = (id)a3;
        v75 = v34;
        v76 = v32;
        -[PKGlyphView _setRecognizedIfNecessaryWithTransitionIndex:completion:](self, "_setRecognizedIfNecessaryWithTransitionIndex:completion:", a3, v74);

        objc_destroyWeak(v77);
      }
      else
      {
        (*(void (**)(uint64_t))(v33 + 16))(v33);
      }
      v12 = 0x254D15000;

      v24 = v79;
      goto LABEL_48;
    case 9:
      v66[0] = v9;
      v66[1] = 3221225472;
      v66[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_28;
      v66[3] = &unk_24D0A19B8;
      v23 = v68;
      objc_copyWeak(v68, location);
      v68[1] = (id)a3;
      v69 = v4;
      v67 = v11;
      v35 = MEMORY[0x2199BB0CC](v66);
      v36 = (void *)v35;
      if (v4)
      {
        v63[0] = v9;
        v63[1] = 3221225472;
        v63[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_34;
        v63[3] = &unk_24D0A1968;
        objc_copyWeak(v65, location);
        v65[1] = (id)a3;
        v64 = v36;
        -[PKGlyphView _setRecognizedIfNecessaryWithTransitionIndex:completion:](self, "_setRecognizedIfNecessaryWithTransitionIndex:completion:", a3, v63);

        objc_destroyWeak(v65);
      }
      else
      {
        (*(void (**)(uint64_t))(v35 + 16))(v35);
      }

      v24 = v67;
      goto LABEL_48;
    case 0xALL:
      v59[0] = v9;
      v59[1] = 3221225472;
      v59[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_35;
      v59[3] = &unk_24D0A19B8;
      v23 = v61;
      objc_copyWeak(v61, location);
      v61[1] = (id)a3;
      v62 = v4;
      v51 = v11;
      v60 = v11;
      v37 = MEMORY[0x2199BB0CC](v59);
      v38 = (void *)v37;
      v39 = self->_pearlView;
      if (v39)
      {
        v57[0] = v9;
        v57[1] = 3221225472;
        v57[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_37;
        v57[3] = &unk_24D0A1968;
        v40 = v57;
        v41 = v58;
        objc_copyWeak(v58, location);
        v58[1] = (id)a3;
        v57[4] = v38;
        -[LAUIPearlGlyphView setState:animated:withCompletion:](v39, "setState:animated:withCompletion:", 6, v4, v57);
LABEL_46:
        v11 = v51;

        objc_destroyWeak(v41);
        v12 = 0x254D15000;
        goto LABEL_47;
      }
      v45 = self->_fingerprintView;
      if (v45)
      {
        v55[0] = v9;
        v55[1] = 3221225472;
        v55[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_38;
        v55[3] = &unk_24D0A1968;
        v40 = v55;
        v41 = v56;
        objc_copyWeak(v56, location);
        v56[1] = (id)a3;
        v55[4] = v38;
        -[PKFingerprintGlyphView setState:animated:completionHandler:](v45, "setState:animated:completionHandler:", 5, v4, v55);
        goto LABEL_46;
      }
      (*(void (**)(uint64_t))(v37 + 16))(v37);
      v11 = v51;
LABEL_47:

      v24 = v60;
LABEL_48:

      objc_destroyWeak(v23);
      goto LABEL_62;
    case 0xBLL:
      -[PKGlyphView setColorMode:animated:](self, "setColorMode:animated:", 2, v4);
      v42 = self->_pearlView;
      if (v42)
      {
        if (self->_style == 7)
          v43 = 8;
        else
          v43 = 6;
        -[LAUIPearlGlyphView setState:animated:](v42, "setState:animated:", v43, v4);
      }
      else
      {
        v46 = self->_fingerprintView;
        if (v46)
          -[PKFingerprintGlyphView setState:animated:completionHandler:](v46, "setState:animated:completionHandler:", 5, v4, 0);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "glyphView:revealingCheckmark:", self, v4);
      self->_lastAnimationWillFinish = 0.0;
      v52[0] = v9;
      v52[1] = 3221225472;
      v52[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_39;
      v52[3] = &unk_24D0A1968;
      objc_copyWeak(v54, location);
      v54[1] = (id)a3;
      v53 = v11;
      -[PKGlyphView _updateCheckViewStateAnimated:withCompletion:](self, "_updateCheckViewStateAnimated:withCompletion:", v4, v52);

      objc_destroyWeak(v54);
      goto LABEL_62;
    case 0xCLL:
      -[PKGlyphView setColorMode:animated:](self, "setColorMode:animated:", 1, v4);
      v44 = self->_pearlView;
      if (v44)
      {
        v72[0] = v9;
        v72[1] = 3221225472;
        v72[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_26;
        v72[3] = &unk_24D0A1828;
        v73 = v11;
        -[LAUIPearlGlyphView setState:animated:withCompletion:](v44, "setState:animated:withCompletion:", 6, v4, v72);
        v14 = v73;
LABEL_60:

        goto LABEL_62;
      }
      v48 = self->_fingerprintView;
      if (v48)
      {
        -[PKFingerprintGlyphView setFadeOnRecognized:](v48, "setFadeOnRecognized:", 0);
        v49 = self->_fingerprintView;
        v70[0] = v9;
        v70[1] = 3221225472;
        v70[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_27;
        v70[3] = &unk_24D0A1828;
        v71 = v11;
        -[PKFingerprintGlyphView setState:animated:completionHandler:](v49, "setState:animated:completionHandler:", 4, v4, v70);
        v14 = v71;
        goto LABEL_60;
      }
LABEL_61:
      v11[2](v11, 0);
LABEL_62:
      v50 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + *(int *)(v12 + 1416)));
      if (v50 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v50, "glyphView:transitioningToState:", self, self->_state);

      objc_destroyWeak(v116);
      objc_destroyWeak(location);
      return;
    default:
      goto LABEL_62;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8[2];

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "_finishTransitionForIndex:cancelled:", *(_QWORD *)(a1 + 40), 1);
    }
    else
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_2;
      v7[3] = &unk_24D0A1580;
      objc_copyWeak(v8, v4);
      v8[1] = *(id *)(a1 + 40);
      objc_msgSend(v6, "_executeAfterMinimumAnimationDurationForStateTransition:", v7);
      objc_destroyWeak(v8);
    }
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_finishTransitionForIndex:cancelled:", *(_QWORD *)(a1 + 40), 0);
    WeakRetained = v3;
  }

}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_4(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD v13[4];
  void (**v14)(_QWORD);

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 40))
  {
    v6 = (void *)WeakRetained[64];
    if (v6)
    {
      v7 = *(unsigned __int8 *)(a1 + 48);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_5;
      v13[3] = &unk_24D0A1828;
      v14 = v3;
      objc_msgSend(v6, "setState:animated:withCompletion:", 6, v7, v13);
      v8 = v14;
LABEL_7:

      goto LABEL_8;
    }
    v9 = (void *)WeakRetained[63];
    if (v9)
    {
      v10 = *(unsigned __int8 *)(a1 + 48);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_6;
      v11[3] = &unk_24D0A1828;
      v12 = v3;
      objc_msgSend(v9, "setState:animated:completionHandler:", 5, v10, v11);
      v8 = v12;
      goto LABEL_7;
    }
    if (v3)
      v3[2](v3);
  }
LABEL_8:

}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_7(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  dispatch_time_t v5;
  void (**block)(void);

  block = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 54) == *(_QWORD *)(a1 + 40))
    {
      *((_BYTE *)WeakRetained + 496) |= 4u;
      objc_msgSend(WeakRetained, "_updateUserIntentLayoutAnimated:", *(unsigned __int8 *)(a1 + 48));
      if (block)
      {
        if (*(_BYTE *)(a1 + 48))
        {
          v5 = dispatch_time(0, 255000000);
          dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
        }
        else
        {
          block[2]();
        }
      }
    }
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(void);

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 54) == *(_QWORD *)(a1 + 40))
    {
      *((_BYTE *)WeakRetained + 496) |= 8u;
      objc_msgSend(WeakRetained, "_updateUserIntentLayoutAnimated:", *(unsigned __int8 *)(a1 + 48));
      if (v5)
        v5[2]();
    }
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_10;
  v3[3] = &unk_24D0A1878;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_11;
  v2[3] = &unk_24D0A0B30;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_12(uint64_t a1, char a2)
{
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id v7[2];
  char v8;
  char v9;

  v4 = dispatch_time(0, 500000000);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_13;
  v5[3] = &unk_24D0A18C8;
  objc_copyWeak(v7, (id *)(a1 + 40));
  v8 = a2;
  v7[1] = *(id *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 56);
  v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(v7);
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (v4 || *((_QWORD *)WeakRetained + 54) != *(_QWORD *)(a1 + 48))
  {
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 56) == 0);
  }
  else
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 64);
    v6 = *(unsigned __int8 *)(a1 + 57);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_14;
    v7[3] = &unk_24D0A1828;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setState:animated:withCompletion:", 0, v6, v7);

  }
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_18(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_19;
    v10[3] = &unk_24D0A1918;
    objc_copyWeak(&v12, v2);
    v13 = *(_BYTE *)(a1 + 56);
    v11 = *(id *)(a1 + 32);
    v5 = MEMORY[0x2199BB0CC](v10);
    v6 = (void *)v5;
    if (*(_BYTE *)(a1 + 57))
    {
      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_21;
      v7[3] = &unk_24D0A1940;
      objc_copyWeak(v9, v2);
      v9[1] = *(id *)(a1 + 48);
      v8 = v6;
      objc_msgSend(WeakRetained, "_executeAfterMinimumAnimationDurationForStateTransition:", v7);

      objc_destroyWeak(v9);
    }
    else
    {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }

    objc_destroyWeak(&v12);
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_19(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setColorMode:animated:", 1, *(unsigned __int8 *)(a1 + 48));
    v4 = (void *)v3[64];
    if (v4)
    {
      v5 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_20;
      v7[3] = &unk_24D0A1828;
      v8 = *(id *)(a1 + 32);
      objc_msgSend(v4, "setState:animated:withCompletion:", 5, v5, v7);

    }
    else
    {
      v6 = (void *)v3[63];
      if (v6)
        objc_msgSend(v6, "setState:animated:completionHandler:", 3, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
      else
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_21(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_22(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0 && WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v5 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_23(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setColorMode:animated:", 1, *(unsigned __int8 *)(a1 + 48));
    v4 = (void *)v3[64];
    if (v4)
    {
      v5 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_24;
      v7[3] = &unk_24D0A1828;
      v8 = *(id *)(a1 + 32);
      objc_msgSend(v4, "setState:animated:withCompletion:", 6, v5, v7);

    }
    else
    {
      v6 = (void *)v3[63];
      if (v6)
        objc_msgSend(v6, "setState:animated:completionHandler:", 5, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
      else
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_25(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 56))
  {
    v5 = WeakRetained;
    if ((a2 & 1) != 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_28(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14[2];
  _QWORD v15[5];
  id v16[2];
  _QWORD v17[4];
  id v18;
  id v19[2];
  char v20;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v5 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_29;
    v17[3] = &unk_24D0A19B8;
    objc_copyWeak(v19, v2);
    v19[1] = *(id *)(a1 + 48);
    v20 = *(_BYTE *)(a1 + 56);
    v18 = *(id *)(a1 + 32);
    v6 = (void (**)(_QWORD))MEMORY[0x2199BB0CC](v17);
    objc_msgSend(v4, "setColorMode:animated:", 1, *(unsigned __int8 *)(a1 + 56));
    v7 = (void *)v4[64];
    if (v7)
    {
      v8 = *(unsigned __int8 *)(a1 + 56);
      v15[0] = v5;
      v15[1] = 3221225472;
      v15[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_32;
      v15[3] = &unk_24D0A1968;
      v9 = v15;
      v10 = v16;
      objc_copyWeak(v16, v2);
      v16[1] = *(id *)(a1 + 48);
      v15[4] = v6;
      objc_msgSend(v7, "setState:animated:withCompletion:", 6, v8, v15);
    }
    else
    {
      v11 = (void *)v4[63];
      if (!v11)
      {
        v6[2](v6);
        goto LABEL_8;
      }
      v12 = *(unsigned __int8 *)(a1 + 56);
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_33;
      v13[3] = &unk_24D0A1968;
      v9 = v13;
      v10 = v14;
      objc_copyWeak(v14, v2);
      v14[1] = *(id *)(a1 + 48);
      v13[4] = v6;
      objc_msgSend(v11, "setState:animated:completionHandler:", 5, v12, v13);
    }

    objc_destroyWeak(v10);
LABEL_8:

    objc_destroyWeak(v19);
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_29(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7[2];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[496] |= 1u;
    objc_msgSend(WeakRetained, "_updatePhoneLayoutWithTransitionIndex:animated:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_30;
    v5[3] = &unk_24D0A1940;
    objc_copyWeak(v7, v2);
    v7[1] = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "_executeAfterMinimumAnimationDurationForStateTransition:", v5);

    objc_destroyWeak(v7);
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_30(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8[2];

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[54] == *(id *)(a1 + 48))
  {
    *((_BYTE *)WeakRetained + 496) |= 2u;
    objc_msgSend(WeakRetained[65], "setHighlighted:animated:", 1, 1);
    objc_msgSend(v4, "_updatePhoneLayoutWithTransitionIndex:animated:", *(_QWORD *)(a1 + 48), 1);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_31;
    v7[3] = &unk_24D0A1580;
    objc_copyWeak(v8, v2);
    v8[1] = *(id *)(a1 + 48);
    objc_msgSend(v4, "_executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio:handler:", v7, 0.9);
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v5, v6);
    objc_destroyWeak(v8);
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_31(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updatePhoneWiggleIfNecessary");
    WeakRetained = v3;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_32(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v5 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_33(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0 && WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v5 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_34(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0 && WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v5 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_35(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7[2];
  char v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 54) == *(_QWORD *)(a1 + 48))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_36;
    v5[3] = &unk_24D0A19B8;
    objc_copyWeak(v7, v2);
    v7[1] = *(id *)(a1 + 48);
    v8 = *(_BYTE *)(a1 + 56);
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "_executeAfterMinimumAnimationDurationForStateTransition:", v5);

    objc_destroyWeak(v7);
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_36(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateCustomImageLayerOpacityAnimated:", *(unsigned __int8 *)(a1 + 56));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_37(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v5 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_38(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0 && WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v5 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v5;
  }

}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_39(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[54] == *(_QWORD *)(a1 + 48))
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)_updatePhoneLayoutWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
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
  PKPhoneGlyphLayer *phoneLayer;
  double v24;
  double v25;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  $D7D2A1320813818F577E2AD43327F629 layoutFlags;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  $D7D2A1320813818F577E2AD43327F629 v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  float v57;
  double v58;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  id v71;
  PKPhoneGlyphLayer *v72;
  double v73;
  double v74;
  double v75;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v78[2];

  if (self->_transitionIndex == a3)
  {
    v4 = a4;
    -[LAUIPearlGlyphView contentLayer](self->_pearlView, "contentLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKFingerprintGlyphView contentLayer](self->_fingerprintView, "contentLayer");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    objc_msgSend(v9, "bounds");
    v11 = v10;
    v75 = v12;
    v14 = v13;
    -[PKPhoneGlyphLayer bounds](self->_phoneLayer, "bounds");
    v16 = v15;
    v18 = v17;
    -[PKPhoneGlyphLayer position](self->_phoneLayer, "position");
    v20 = v19;
    v22 = v21;
    memset(&v78[1], 0, sizeof(CATransform3D));
    phoneLayer = self->_phoneLayer;
    if (phoneLayer)
      -[PKPhoneGlyphLayer transform](phoneLayer, "transform");
    v24 = v14 * 0.75 / 0.675;
    v25 = v24 * self->_phoneAspectRatio;
    if (v25 != v16 || v24 != v18)
    {
      v73 = v11;
      v74 = v22;
      v27 = v20;
      v28 = *MEMORY[0x24BDBEFB0];
      v29 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("bounds.size.width"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v16, v25);
        v31 = (id)-[PKPhoneGlyphLayer pkui_addAdditiveAnimation:](self->_phoneLayer, "pkui_addAdditiveAnimation:", v30);
        objc_msgSend(v30, "duration");
        -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:");
        objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("bounds.size.height"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v18, v14 * 0.75 / 0.675);
        v33 = (id)-[PKPhoneGlyphLayer pkui_addAdditiveAnimation:](self->_phoneLayer, "pkui_addAdditiveAnimation:", v32);
        objc_msgSend(v32, "duration");
        -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:");

      }
      -[PKPhoneGlyphLayer setBounds:](self->_phoneLayer, "setBounds:", v28, v29, v25, v14 * 0.75 / 0.675);
      v20 = v27;
      v11 = v73;
      v22 = v74;
    }
    -[PKPhoneGlyphLayer anchorPoint](self->_phoneLayer, "anchorPoint");
    layoutFlags = self->_layoutFlags;
    if ((*(_BYTE *)&layoutFlags & 1) != 0)
    {
      -[PKGlyphView _phonePositionWhileShownWithRotationPercentage:](self, "_phonePositionWhileShownWithRotationPercentage:", (double)((*(unsigned int *)&layoutFlags >> 1) & 1));
      v37 = v39;
      v38 = v40;
    }
    else
    {
      v37 = (v75 - v25) * 0.5 + v11 + v34 * v25;
      v38 = v14 + v35 * v24;
    }
    if (v37 != v20 || v38 != v22)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDE5638], "animation");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setAdditive:", 1);
        v49 = self->_layoutFlags;
        if ((~*(_DWORD *)&v49 & 3) != 0)
        {
          if ((*(_BYTE *)&v49 & 1) != 0)
          {
            LODWORD(v45) = 0;
            LODWORD(v46) = 0;
            LODWORD(v47) = 0.25;
          }
          else
          {
            LODWORD(v45) = 0.75;
            LODWORD(v46) = 0;
            LODWORD(v47) = 1.0;
          }
          LODWORD(v48) = 1.0;
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v45, v46, v47, v48);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setTimingFunction:", v53);

          objc_msgSend(v44, "setDuration:", dbl_213A5DF80[(*(_BYTE *)&self->_layoutFlags & 1) == 0]);
          objc_msgSend(v44, "duration");
          v55 = 0.9;
          if ((*(_BYTE *)&self->_layoutFlags & 1) == 0)
            v55 = 0.75;
          v52 = v54 * v55;
        }
        else
        {
          LODWORD(v45) = 1058642330;
          LODWORD(v47) = *(_DWORD *)"ff&?";
          LODWORD(v46) = 0;
          LODWORD(v48) = 1.0;
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v45, v46, v47, v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setTimingFunction:", v50);

          objc_msgSend(v44, "setDuration:", 1.3);
          objc_msgSend(v44, "duration");
          v52 = v51;
        }
        objc_msgSend(v44, "duration");
        objc_msgSend(v42, "setDuration:");
        objc_msgSend(v43, "addObject:", v44);
        objc_msgSend(v44, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v20, v22, v37, v38);
        if ((*(_BYTE *)&self->_layoutFlags & 1) == 0 && (self->_state & 0xFFFFFFFFFFFFFFFELL) == 0xA)
        {
          objc_msgSend(v44, "timingFunction");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPhoneGlyphLayer opacity](self->_phoneLayer, "opacity");
          v58 = v57;
          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "setAdditive:", 1);
          objc_msgSend(v59, "setDuration:", 0.1);
          objc_msgSend(v59, "setTimingFunction:", v56);
          objc_msgSend(v59, "setFillMode:", *MEMORY[0x24BDE5978]);
          objc_msgSend(v43, "addObject:", v59);
          objc_msgSend(v59, "pkui_updateForAdditiveAnimationFromScalar:toScalar:withLayerScalar:", v58, 0.0, v58);

          v44 = v59;
        }
        objc_msgSend(v42, "setAnimations:", v43);
        v60 = (id)-[PKPhoneGlyphLayer pkui_addAdditiveAnimation:](self->_phoneLayer, "pkui_addAdditiveAnimation:", v42);
        -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:", v52);

      }
      -[PKPhoneGlyphLayer setPosition:](self->_phoneLayer, "setPosition:", v37, v38);
    }
    memset(v78, 0, 128);
    if ((*(_BYTE *)&self->_layoutFlags & 2) != 0)
    {
      -[PKGlyphView _phoneTransformDeltaWhileShownFromRotationPercentage:toPercentage:](self, "_phoneTransformDeltaWhileShownFromRotationPercentage:toPercentage:", 0.0, 1.0);
    }
    else
    {
      v61 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
      *(_OWORD *)&v78[0].m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      *(_OWORD *)&v78[0].m33 = v61;
      v62 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      *(_OWORD *)&v78[0].m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      *(_OWORD *)&v78[0].m43 = v62;
      v63 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      *(_OWORD *)&v78[0].m11 = *MEMORY[0x24BDE5598];
      *(_OWORD *)&v78[0].m13 = v63;
      v64 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      *(_OWORD *)&v78[0].m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      *(_OWORD *)&v78[0].m23 = v64;
    }
    a = v78[0];
    b = v78[1];
    if (!CATransform3DEqualToTransform(&a, &b))
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setAdditive:", 1);
        LODWORD(v66) = 1058642330;
        LODWORD(v67) = *(_DWORD *)"ff&?";
        LODWORD(v68) = 0;
        LODWORD(v69) = 1.0;
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v66, v68, v67, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setTimingFunction:", v70);

        objc_msgSend(v65, "setDuration:", 1.3);
        a = v78[1];
        b = v78[0];
        objc_msgSend(v65, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &b);
        v71 = (id)-[PKPhoneGlyphLayer pkui_addAdditiveAnimation:](self->_phoneLayer, "pkui_addAdditiveAnimation:", v65);
        if ((*(_BYTE *)&self->_layoutFlags & 1) != 0)
        {
          objc_msgSend(v65, "duration");
          -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:");
        }

      }
      v72 = self->_phoneLayer;
      a = v78[0];
      -[PKPhoneGlyphLayer setTransform:](v72, "setTransform:", &a);
    }

  }
}

- (void)_updatePhoneWiggleIfNecessary
{
  BOOL v2;

  v2 = self->_state == 9;
  if (self->_state == 9)
  {
    if (!self->_phoneWiggling)
    {
      self->_phoneWiggling = v2;
      -[PKGlyphView _startPhoneWiggle](self, "_startPhoneWiggle");
    }
  }
  else if (self->_phoneWiggling)
  {
    self->_phoneWiggling = v2;
    -[PKGlyphView _endPhoneWiggle](self, "_endPhoneWiggle");
  }
}

- (void)_startPhoneWiggle
{
  void *v3;
  double v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *phoneWiggleAnimationKey;
  uint64_t v21;
  _OWORD v22[8];

  if (!self->_phoneWiggleAnimationKey)
  {
    -[PKPhoneGlyphLayer _startPhoneWiggle](self->_phoneLayer, "_startPhoneWiggle");
    objc_msgSend(MEMORY[0x24BDE5638], "animation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDuration:", 2.6);
    LODWORD(v4) = 2139095040;
    objc_msgSend(v3, "setRepeatCount:", v4);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v22[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v22[5] = v6;
    v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v22[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v22[7] = v7;
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v22[0] = *MEMORY[0x24BDE5598];
    v22[1] = v8;
    v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v22[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v22[3] = v9;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1968];
    -[PKGlyphView _phoneTransformDeltaWhileShownFromRotationPercentage:toPercentage:](self, "_phoneTransformDeltaWhileShownFromRotationPercentage:toPercentage:", 1.0, 0.35);
    objc_msgSend(v11, "valueWithCATransform3D:", &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __32__PKGlyphView__startPhoneWiggle__block_invoke((uint64_t)v12, (uint64_t)CFSTR("transform"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v5, "addObject:", v13);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1968];
    -[PKGlyphView _phonePositionDeltaWhileShownFromRotationPercentage:toPercentage:](self, "_phonePositionDeltaWhileShownFromRotationPercentage:toPercentage:", 1.0, 0.35);
    objc_msgSend(v15, "valueWithPoint:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __32__PKGlyphView__startPhoneWiggle__block_invoke((uint64_t)v16, (uint64_t)CFSTR("position"), v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v5, "addObject:", v17);
    objc_msgSend(v3, "setAnimations:", v5);
    -[PKPhoneGlyphLayer pkui_addAdditiveAnimation:](self->_phoneLayer, "pkui_addAdditiveAnimation:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (NSString *)objc_msgSend(v18, "copy");
    phoneWiggleAnimationKey = self->_phoneWiggleAnimationKey;
    self->_phoneWiggleAnimationKey = v19;

  }
}

id __32__PKGlyphView__startPhoneWiggle__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDE56C0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "animationWithKeyPath:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdditive:", 1);
  objc_msgSend(v9, "setKeyTimes:", &unk_24D0AA148);
  v24[0] = v8;
  v24[1] = v7;
  v24[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValues:", v10);

  LODWORD(v11) = 0.75;
  LODWORD(v12) = 0;
  LODWORD(v13) = 1.0;
  LODWORD(v14) = *(_DWORD *)"ff&?";
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v11, v12, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1058642330;
  LODWORD(v17) = 0;
  LODWORD(v18) = 1.0;
  LODWORD(v19) = *(_DWORD *)"ff&?";
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v16, v17, v19, v18, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTimingFunctions:", v21);
  objc_msgSend(v9, "setDuration:", 2.6);
  return v9;
}

- (void)_endPhoneWiggle
{
  NSString *v3;
  void *v4;
  NSString *phoneWiggleAnimationKey;
  double v6;
  long double v7;
  long double v8;
  int64_t v9;
  dispatch_time_t v10;
  _QWORD block[4];
  NSString *v12;
  id v13;
  id location;

  if (self->_phoneWiggleAnimationKey)
  {
    -[PKPhoneGlyphLayer _endPhoneWiggle](self->_phoneLayer, "_endPhoneWiggle");
    v3 = self->_phoneWiggleAnimationKey;
    -[PKPhoneGlyphLayer animationForKey:](self->_phoneLayer, "animationForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    phoneWiggleAnimationKey = self->_phoneWiggleAnimationKey;
    self->_phoneWiggleAnimationKey = 0;

    -[PKPhoneGlyphLayer pkui_elapsedDurationForAnimationWithKey:](self->_phoneLayer, "pkui_elapsedDurationForAnimationWithKey:", v3);
    if (v6 <= 0.0)
    {
      -[PKPhoneGlyphLayer removeAnimationForKey:](self->_phoneLayer, "removeAnimationForKey:", v3);
    }
    else
    {
      v7 = v6;
      objc_msgSend(v4, "duration");
      if (!v3)
      {
LABEL_7:

        return;
      }
      v9 = (uint64_t)((v8 - fmod(v7, v8)) * 1000000000.0);
      objc_initWeak(&location, self);
      v10 = dispatch_time(0, v9);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __30__PKGlyphView__endPhoneWiggle__block_invoke;
      block[3] = &unk_24D0A0F90;
      objc_copyWeak(&v13, &location);
      v12 = v3;
      v3 = v3;
      dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

    goto LABEL_7;
  }
}

void __30__PKGlyphView__endPhoneWiggle__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[65], "removeAnimationForKey:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_updateUserIntentLayoutAnimated:(BOOL)a3
{
  CALayer *userIntentLayer;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, double, double, double, double);
  _BOOL4 isPad;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  __n128 v35;
  __n128 v36;
  void (**v37)(_QWORD, _QWORD, double, __n128);
  __n128 v38;
  double v39;
  double v40;
  double v41;
  _QWORD v42[5];
  BOOL v43;
  _QWORD v44[5];
  BOOL v45;

  userIntentLayer = self->_userIntentLayer;
  if (userIntentLayer)
  {
    -[CALayer bounds](userIntentLayer, "bounds");
    v7 = v6;
    v9 = v8;
    -[PKMicaLayer rootLayer](self->_userIntentDeviceLayer, "rootLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    -[PKMicaLayer rootLayer](self->_userIntentArrowLayer, "rootLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;

    v20 = *MEMORY[0x24BDBEFB0];
    v21 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v41 = v7;
    if (self->_isPad)
    {
      v22 = v12;
      v23 = v7 * 0.697674419 / 0.697674419;
      v24 = v23 * (v14 / v22);
    }
    else
    {
      v24 = v9 * 0.857142857 / 0.612359551;
      v23 = v24 * (v12 / v14);
    }
    v25 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __47__PKGlyphView__updateUserIntentLayoutAnimated___block_invoke;
    v44[3] = &unk_24D0A19E0;
    v45 = a3;
    v44[4] = self;
    v26 = (void (**)(_QWORD, _QWORD, double, double, double, double))MEMORY[0x2199BB0CC](v44);
    ((void (**)(_QWORD, PKMicaLayer *, double, double, double, double))v26)[2](v26, self->_userIntentDeviceLayer, v20, v21, v23, v24);
    ((void (**)(_QWORD, PKMicaLayer *, double, double, double, double))v26)[2](v26, self->_userIntentArrowLayer, v20, v21, v9 * 0.253968254 * (v17 / v19), v9 * 0.253968254);
    isPad = self->_isPad;
    v28 = v41 * dbl_213A5DF90[!isPad];
    v29 = v9 * dbl_213A5DFA0[!isPad];
    v30 = 0.5;
    v31 = v9 * 1.07936508;
    if (self->_isPad)
      v32 = v41 + v23 * 0.5;
    else
      v32 = v41 * dbl_213A5DF90[!isPad];
    if (!self->_isPad)
      v30 = 0.615079365;
    v40 = v30;
    v42[0] = v25;
    v42[1] = 3221225472;
    if (isPad)
      v33 = v29 + v9 * 0.0465116279;
    else
      v33 = v9 * 0.492063492;
    v42[2] = __47__PKGlyphView__updateUserIntentLayoutAnimated___block_invoke_2;
    v42[3] = &unk_24D0A1A08;
    if (!isPad)
      v9 = v9 * 0.492063492;
    v43 = a3;
    v42[4] = self;
    v34 = MEMORY[0x2199BB0CC](v42);
    v37 = (void (**)(_QWORD, _QWORD, double, __n128))v34;
    if ((*(_BYTE *)&self->_layoutFlags & 4) != 0)
      v35.n128_f64[0] = v28;
    else
      v35.n128_f64[0] = v32;
    if (*(_BYTE *)&self->_layoutFlags & 4 | isPad)
      v36.n128_f64[0] = v29;
    else
      v36.n128_f64[0] = v31;
    (*(void (**)(uint64_t, PKMicaLayer *, __n128, __n128))(v34 + 16))(v34, self->_userIntentDeviceLayer, v35, v36);
    if ((*(_BYTE *)&self->_layoutFlags & 8) != 0)
      v38.n128_f64[0] = v33;
    else
      v38.n128_f64[0] = v9;
    v39 = 1.17460317;
    if (*(_BYTE *)&self->_layoutFlags & 8 | isPad)
      v39 = v40;
    ((void (**)(_QWORD, PKMicaLayer *, double, __n128))v37)[2](v37, self->_userIntentArrowLayer, v41 * v39, v38);

  }
}

void __47__PKGlyphView__updateUserIntentLayoutAnimated___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v11;
  double v12;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "bounds");
  if (a5 != v11 || a6 != v12)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v14 = v11;
      v15 = v12;
      objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("bounds.size.width"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v14, a5);
      v17 = (id)objc_msgSend(v22, "pkui_addAdditiveAnimation:", v16);
      v18 = *(void **)(a1 + 32);
      objc_msgSend(v16, "duration");
      objc_msgSend(v18, "_updateLastAnimationTimeWithAnimationOfDuration:");
      objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("bounds.size.height"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v15, a6);
      v20 = (id)objc_msgSend(v22, "pkui_addAdditiveAnimation:", v19);
      v21 = *(void **)(a1 + 32);
      objc_msgSend(v19, "duration");
      objc_msgSend(v21, "_updateLastAnimationTimeWithAnimationOfDuration:");

    }
    objc_msgSend(v22, "setBounds:", a3, a4, a5, a6);
  }

}

void __47__PKGlyphView__updateUserIntentLayoutAnimated___block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  double v7;
  double v8;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "position");
  if (a3 != v7 || a4 != v8)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v10 = v7;
      v11 = v8;
      objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("position"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAdditive:", 1);
      objc_msgSend(v12, "setMass:", 2.0);
      objc_msgSend(v12, "setStiffness:", 300.0);
      objc_msgSend(v12, "setDamping:", 400.0);
      objc_msgSend(v12, "durationForEpsilon:", 0.001);
      objc_msgSend(v12, "setDuration:");
      objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v10, v11, a3, a4);
      v13 = (id)objc_msgSend(v15, "pkui_addAdditiveAnimation:", v12);
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v12, "duration");
      objc_msgSend(v14, "_updateLastAnimationTimeWithAnimationOfDuration:");

    }
    objc_msgSend(v15, "setPosition:", a3, a4);
  }

}

- (void)_updateUserIntentLayerRotation
{
  CALayer *userIntentLayer;
  uint64_t userIntentEdge;
  CGFloat v4;
  CATransform3D v5;

  userIntentLayer = self->_userIntentLayer;
  if (userIntentLayer && self->_isPad)
  {
    userIntentEdge = (int)self->_userIntentEdge;
    v4 = 0.0;
    if (userIntentEdge <= 2)
      v4 = dbl_213A5DF60[userIntentEdge];
    CATransform3DMakeRotation(&v5, v4, 0.0, 0.0, 1.0);
    -[CALayer setTransform:](userIntentLayer, "setTransform:", &v5);
  }
}

- (void)_updateCustomImageLayerOpacityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t state;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v3 = a3;
  -[CALayer opacity](self->_customImageLayer, "opacity");
  state = self->_state;
  v6 = *(float *)&v7;
  HIDWORD(v7) = 0;
  if (state == 10)
    v8 = 1.0;
  else
    v8 = 0.0;
  if (v6 != v8)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v6, v8);
      v10 = (id)-[CALayer pkui_addAdditiveAnimation:](self->_customImageLayer, "pkui_addAdditiveAnimation:", v9);
      objc_msgSend(v9, "duration");
      -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:");

    }
    LODWORD(v7) = 0;
    if (state == 10)
      *(float *)&v7 = 1.0;
    -[CALayer setOpacity:](self->_customImageLayer, "setOpacity:", v7);
  }
}

- (void)_updateCheckViewStateAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  OS_dispatch_group *v8;
  LAUICheckmarkLayer *checkLayer;
  _BOOL8 v10;
  OS_dispatch_group *v11;
  _QWORD v12[4];
  OS_dispatch_group *v13;
  id v14;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_checkLayer)
  {
    v8 = self->_lastAnimationGroup;
    dispatch_group_enter((dispatch_group_t)v8);
    checkLayer = self->_checkLayer;
    v10 = self->_state == 11;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __60__PKGlyphView__updateCheckViewStateAnimated_withCompletion___block_invoke;
    v12[3] = &unk_24D0A1A30;
    v13 = v8;
    v14 = v7;
    v11 = v8;
    -[LAUICheckmarkLayer setRevealed:animated:withCompletion:](checkLayer, "setRevealed:animated:withCompletion:", v10, v4, v12);

  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

void __60__PKGlyphView__updateCheckViewStateAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_setRecognizedIfNecessaryWithTransitionIndex:(unint64_t)a3 completion:(id)a4
{
  id v6;
  LAUIPearlGlyphView *pearlView;
  LAUIPearlGlyphView *v8;
  PKFingerprintGlyphView *fingerprintView;
  _QWORD v10[4];
  id v11;
  id v12[2];
  _QWORD v13[4];
  id v14;
  id v15[2];
  id location;

  v6 = a4;
  if (self->_transitionIndex == a3)
  {
    objc_initWeak(&location, self);
    pearlView = self->_pearlView;
    if (pearlView)
    {
      if ((unint64_t)(-[LAUIPearlGlyphView state](pearlView, "state") - 1) <= 3)
      {
        v8 = self->_pearlView;
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __71__PKGlyphView__setRecognizedIfNecessaryWithTransitionIndex_completion___block_invoke;
        v13[3] = &unk_24D0A1A58;
        v14 = v6;
        objc_copyWeak(v15, &location);
        v15[1] = (id)a3;
        -[LAUIPearlGlyphView setState:animated:withCompletion:](v8, "setState:animated:withCompletion:", 6, 1, v13);
        objc_destroyWeak(v15);

LABEL_11:
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
      if (!v6)
        goto LABEL_11;
    }
    else
    {
      fingerprintView = self->_fingerprintView;
      if (fingerprintView)
      {
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __71__PKGlyphView__setRecognizedIfNecessaryWithTransitionIndex_completion___block_invoke_2;
        v10[3] = &unk_24D0A1968;
        objc_copyWeak(v12, &location);
        v11 = v6;
        v12[1] = (id)a3;
        -[PKFingerprintGlyphView setRecognizedIfNecessaryWithCompletion:](fingerprintView, "setRecognizedIfNecessaryWithCompletion:", v10);

        objc_destroyWeak(v12);
        goto LABEL_11;
      }
      if (!v6)
        goto LABEL_11;
    }
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    goto LABEL_11;
  }
LABEL_12:

}

void __71__PKGlyphView__setRecognizedIfNecessaryWithTransitionIndex_completion___block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _BOOL8 v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 1;
    if (a2)
    {
      if (WeakRetained)
        v5 = WeakRetained[54] != *(_QWORD *)(a1 + 48);
    }
    v6 = WeakRetained;
    (*(void (**)(_QWORD, _BOOL8))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5);

  }
}

void __71__PKGlyphView__setRecognizedIfNecessaryWithTransitionIndex_completion___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  uint64_t v5;
  _BOOL8 v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = 1;
    if ((a2 & 1) == 0 && WeakRetained)
      v6 = WeakRetained[54] != *(_QWORD *)(a1 + 48);
    v7 = WeakRetained;
    (*(void (**)(uint64_t, _BOOL8))(v5 + 16))(v5, v6);
    WeakRetained = v7;
  }

}

- (void)_applyEffectiveHighlightColorsToLayersAnimated:(BOOL)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  UIColor *intentPrimaryHighlightColor;
  UIColor *primaryHighlightColor;
  _QWORD v7[5];
  BOOL v8;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__PKGlyphView__applyEffectiveHighlightColorsToLayersAnimated___block_invoke;
  v7[3] = &unk_24D0A1AA8;
  v8 = a3;
  v7[4] = self;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199BB0CC](v7, a2);
  ((void (**)(_QWORD, PKPhoneGlyphLayer *, UIColor *))v4)[2](v4, self->_phoneLayer, self->_primaryHighlightColor);
  intentPrimaryHighlightColor = self->_intentPrimaryHighlightColor;
  if (!intentPrimaryHighlightColor)
    intentPrimaryHighlightColor = self->_primaryHighlightColor;
  ((void (**)(_QWORD, PKMicaLayer *, UIColor *))v4)[2](v4, self->_userIntentArrowLayer, intentPrimaryHighlightColor);
  primaryHighlightColor = self->_intentPrimaryHighlightColor;
  if (!primaryHighlightColor)
    primaryHighlightColor = self->_primaryHighlightColor;
  ((void (**)(_QWORD, PKMicaLayer *, UIColor *))v4)[2](v4, self->_userIntentDeviceLayer, primaryHighlightColor);

}

void __62__PKGlyphView__applyEffectiveHighlightColorsToLayersAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;

  if (a2)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v6, "publishedColorLayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publishedColorShapeLayers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__PKGlyphView__applyEffectiveHighlightColorsToLayersAnimated___block_invoke_2;
    v12[3] = &unk_24D0A1A80;
    v15 = *(_BYTE *)(a1 + 40);
    v13 = v7;
    v14 = v8;
    v9 = v8;
    v10 = v7;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199BB0CC](v12);
    ((void (**)(_QWORD, id, const __CFString *, uint64_t))v11)[2](v11, v5, CFSTR("primary_highlight"), 15);
    ((void (**)(_QWORD, id, const __CFString *, uint64_t))v11)[2](v11, v5, CFSTR("primary-border/primary_highlight-background"), 1);

    ((void (**)(_QWORD, _QWORD, const __CFString *, uint64_t))v11)[2](v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608), CFSTR("secondary_highlight"), 15);
  }
}

void __62__PKGlyphView__applyEffectiveHighlightColorsToLayersAnimated___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        LayerApplyColor(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v13++), v7, a4, *(unsigned __int8 *)(a1 + 48));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        ShapeLayerApplyColor(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v18++), v7, a4, *(unsigned __int8 *)(a1 + 48));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)_setPrimaryColor:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIColor *v6;
  UIColor *primaryColor;
  id v8;

  v4 = a4;
  v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v6 = (UIColor *)objc_msgSend(v8, "copy");
    primaryColor = self->_primaryColor;
    self->_primaryColor = v6;

    -[PKFingerprintGlyphView setPrimaryColor:animated:](self->_fingerprintView, "setPrimaryColor:animated:", self->_primaryColor, v4);
    -[PKGlyphView _applyEffectivePrimaryColorToLayersAnimated:](self, "_applyEffectivePrimaryColorToLayersAnimated:", v4);
  }

}

- (void)_applyEffectivePrimaryColorToLayersAnimated:(BOOL)a3
{
  void *v3;
  PKGlyphView *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke;
  v8[3] = &unk_24D0A1AF8;
  v8[4] = self;
  v9 = a3;
  v3 = (void *)MEMORY[0x24BDF6F30];
  v4 = self;
  objc_msgSend(v3, "currentTraitCollection", v8[0], 3221225472);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDF6F30];
  -[PKGlyphView traitCollection](v4, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCurrentTraitCollection:", v7);
  __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke((uint64_t)v8);
  objc_msgSend(MEMORY[0x24BDF6F30], "setCurrentTraitCollection:", v5);

}

void __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];
  char v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setFinishedColor:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632), *(unsigned __int8 *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "CGColor");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setColor:animated:", v2, *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setPrimaryColor:animated:", v2, *(unsigned __int8 *)(a1 + 40));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke_2;
  v4[3] = &unk_24D0A1AD0;
  v5 = *(_BYTE *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199BB0CC](v4);
  v3[2](v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
  v3[2](v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
  v3[2](v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560));

}

void __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  if (a2)
  {
    v3 = a2;
    objc_msgSend(v3, "publishedColorLayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "publishedColorShapeLayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke_3;
    v9[3] = &unk_24D0A1A80;
    v12 = *(_BYTE *)(a1 + 40);
    v10 = v4;
    v11 = v5;
    v6 = v5;
    v7 = v4;
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199BB0CC](v9);
    ((void (**)(_QWORD, _QWORD, const __CFString *, uint64_t))v8)[2](v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632), CFSTR("primary"), 15);
    ((void (**)(_QWORD, _QWORD, const __CFString *, uint64_t))v8)[2](v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632), CFSTR("primary-border/primary_highlight-background"), 2);

  }
}

void __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke_3(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        LayerApplyColor(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v13++), v7, a4, *(unsigned __int8 *)(a1 + 48));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        ShapeLayerApplyColor(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v18++), v7, a4, *(unsigned __int8 *)(a1 + 48));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)_setSecondaryColor:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIColor *v6;
  UIColor *secondaryColor;
  id v8;

  v4 = a4;
  v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v6 = (UIColor *)objc_msgSend(v8, "copy");
    secondaryColor = self->_secondaryColor;
    self->_secondaryColor = v6;

    -[PKFingerprintGlyphView setSecondaryColor:animated:](self->_fingerprintView, "setSecondaryColor:animated:", self->_secondaryColor, v4);
  }

}

- (id)_primaryColorForStyle:(int64_t)a3 mode:(int64_t)a4
{
  LAUIPearlGlyphView *pearlView;
  BOOL v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;

  pearlView = self->_pearlView;
  switch(a3)
  {
    case 0:
      if (!pearlView)
      {
        switch(a4)
        {
          case 0:
            goto LABEL_27;
          case 1:
          case 2:
          case 4:
            goto LABEL_11;
          case 3:
            goto LABEL_26;
          default:
            goto LABEL_25;
        }
      }
      goto LABEL_5;
    case 1:
      if (!pearlView)
      {
        switch(a4)
        {
          case 0:
          case 1:
            goto LABEL_27;
          case 2:
          case 4:
            goto LABEL_11;
          case 3:
            goto LABEL_26;
          default:
            goto LABEL_25;
        }
      }
      goto LABEL_5;
    case 2:
LABEL_5:
      v6 = a4 == 3;
      if ((unint64_t)a4 < 3)
        goto LABEL_11;
      goto LABEL_9;
    case 3:
      v7 = (void *)MEMORY[0x24BDF6950];
      v8 = 0.744;
      v12 = 1.0;
      v9 = 0.744;
      v10 = 0.744;
      goto LABEL_30;
    case 4:
      v6 = a4 == 3;
      if ((unint64_t)a4 < 3)
      {
        v7 = (void *)MEMORY[0x24BDF6950];
        v8 = 1.0;
        v9 = 1.0;
        v10 = 1.0;
        goto LABEL_29;
      }
LABEL_9:
      if (v6)
      {
LABEL_26:
        objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a4 != 4)
          goto LABEL_25;
LABEL_11:
        objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_31;
    case 5:
      goto LABEL_21;
    case 6:
      if (!pearlView)
      {
        switch(a4)
        {
          case 0:
LABEL_27:
            objc_msgSend(MEMORY[0x24BDF6950], "systemPinkColor");
            v11 = objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          case 1:
          case 2:
          case 4:
            goto LABEL_24;
          case 3:
            goto LABEL_26;
          default:
            goto LABEL_25;
        }
      }
      if ((unint64_t)a4 < 3)
        goto LABEL_24;
      if (a4 == 3)
        goto LABEL_26;
      if (a4 != 4)
        goto LABEL_25;
LABEL_24:
      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 7:
      if ((unint64_t)a4 < 3)
        goto LABEL_21;
      if (a4 == 3)
      {
        v7 = (void *)MEMORY[0x24BDF6950];
        v8 = 0.9451;
        v9 = 0.3686;
        v10 = 0.3098;
LABEL_29:
        v12 = 1.0;
LABEL_30:
        objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v8, v9, v10, v12);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a4 != 4)
        {
LABEL_25:
          v13 = 0;
          goto LABEL_32;
        }
LABEL_21:
        objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
        v11 = objc_claimAutoreleasedReturnValue();
      }
LABEL_31:
      v13 = (void *)v11;
LABEL_32:
      -[PKGlyphView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v13, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
    default:
      goto LABEL_25;
  }
}

- (id)_secondaryColorForStyle:(int64_t)a3 mode:(int64_t)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  switch(a3)
  {
    case 0:
    case 6:
      objc_msgSend(MEMORY[0x24BDF6950], "systemGray3Color");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
    case 2:
    case 7:
      -[PKGlyphView _primaryColorForStyle:mode:](self, "_primaryColorForStyle:mode:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    case 3:
      v7 = (void *)MEMORY[0x24BDF6950];
      v8 = 0.468;
      v9 = 1.0;
      v10 = 0.468;
      v11 = 0.468;
      goto LABEL_7;
    case 4:
      v7 = (void *)MEMORY[0x24BDF6950];
      v8 = 1.0;
      v10 = 1.0;
      v11 = 1.0;
      v9 = 0.5;
LABEL_7:
      objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v8, v10, v11, v9);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = (void *)v6;
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)_applyColorMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PKGlyphView _primaryColorForStyle:mode:](self, "_primaryColorForStyle:mode:", self->_style, self->_colorMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKGlyphView _setPrimaryColor:animated:](self, "_setPrimaryColor:animated:", v5, v3);

  -[PKGlyphView _secondaryColorForStyle:mode:](self, "_secondaryColorForStyle:mode:", self->_style, self->_colorMode);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKGlyphView _setSecondaryColor:animated:](self, "_setSecondaryColor:animated:", v6, v3);

}

- (void)setColorMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_colorMode != a3)
  {
    self->_colorMode = a3;
    -[PKGlyphView _applyColorMode:](self, "_applyColorMode:", a4);
  }
}

- (BOOL)fadeOnRecognized
{
  return -[PKFingerprintGlyphView fadeOnRecognized](self->_fingerprintView, "fadeOnRecognized");
}

- (void)setFadeOnRecognized:(BOOL)a3
{
  -[PKFingerprintGlyphView setFadeOnRecognized:](self->_fingerprintView, "setFadeOnRecognized:", a3);
}

- (void)setCustomImage:(CGImage *)a3 withAlignmentEdgeInsets:(UIEdgeInsets)a4
{
  CGImage *customImage;
  _BOOL4 v7;
  CALayer *v8;
  float v9;
  float v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  CALayer *v14;
  CALayer *customImageLayer;
  uint64_t v16;
  void *v17;
  CALayer *v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[4];
  CALayer *v26;

  self->_customImageAlignmentEdgeInsets = a4;
  customImage = self->_customImage;
  if (customImage == a3)
  {
    -[PKGlyphView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    v7 = customImage != 0;
    if (customImage)
    {
      CFRelease(self->_customImage);
      self->_customImage = 0;
    }
    if (a3)
      CFRetain(a3);
    self->_customImage = a3;
    v8 = self->_customImageLayer;
    -[CALayer opacity](v8, "opacity");
    v10 = v9;
    if ((v9 <= 0.0 || -[CALayer isHidden](v8, "isHidden"))
      && ((-[CALayer animationKeys](v8, "animationKeys"),
           v11 = (void *)objc_claimAutoreleasedReturnValue(),
           v12 = objc_msgSend(v11, "count"),
           v11,
           customImage)
        ? (v13 = v12 == 0)
        : (v13 = 1),
          v13 ? (v7 = 0) : (v7 = 1),
          !v12))
    {
      v7 = 0;
    }
    else
    {
      LODWORD(v12) = self->_customImage != 0;
    }
    -[PKGlyphView createCustomImageLayer](self, "createCustomImageLayer");
    v14 = (CALayer *)objc_claimAutoreleasedReturnValue();
    customImageLayer = self->_customImageLayer;
    self->_customImageLayer = v14;

    v16 = MEMORY[0x24BDAC760];
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v10, 0.0);
      v25[0] = v16;
      v25[1] = 3221225472;
      v25[2] = __54__PKGlyphView_setCustomImage_withAlignmentEdgeInsets___block_invoke;
      v25[3] = &unk_24D0A1B20;
      v18 = v8;
      v26 = v18;
      objc_msgSend(v17, "pkui_setCompletionHandler:", v25);
      v19 = (id)-[CALayer pkui_addAdditiveAnimation:](v18, "pkui_addAdditiveAnimation:", v17);
      LODWORD(v20) = 0;
      -[CALayer setOpacity:](v18, "setOpacity:", v20);

    }
    else
    {
      -[CALayer removeFromSuperlayer](v8, "removeFromSuperlayer");
    }
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __54__PKGlyphView_setCustomImage_withAlignmentEdgeInsets___block_invoke_2;
    v24[3] = &unk_24D0A0BA8;
    v24[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v24);
    if ((_DWORD)v12)
    {
      objc_msgSend(MEMORY[0x24BE6EF08], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 0.0, v10);
      v23 = (id)-[CALayer pkui_addAdditiveAnimation:](self->_customImageLayer, "pkui_addAdditiveAnimation:", v22);

    }
    *(float *)&v21 = v10;
    -[CALayer setOpacity:](self->_customImageLayer, "setOpacity:", v21);

  }
}

uint64_t __54__PKGlyphView_setCustomImage_withAlignmentEdgeInsets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

uint64_t __54__PKGlyphView_setCustomImage_withAlignmentEdgeInsets___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  CGImage *v3;
  void *v4;
  double v5;
  double v6;
  double Width;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (CGImage *)v2[80];
  if (v3)
  {
    v4 = (void *)v2[72];
    v5 = *MEMORY[0x24BDBEFB0];
    v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    Width = (double)CGImageGetWidth(v3);
    objc_msgSend(v4, "setBounds:", v5, v6, Width, (double)CGImageGetHeight(*(CGImageRef *)(*(_QWORD *)(a1 + 32) + 640)));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setContents:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 640));
    v2 = *(_QWORD **)(a1 + 32);
  }
  v8 = (void *)v2[64];
  if (!v8)
    v8 = (void *)v2[63];
  objc_msgSend(v8, "setNeedsLayout");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 512);
  if (!v10)
    v10 = *(void **)(v9 + 504);
  return objc_msgSend(v10, "layoutIfNeeded");
}

- (id)createCustomImageLayer
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  CALayer *customImageLayer;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  PKLayerNullActions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActions:", v4);

  LODWORD(v5) = 0;
  objc_msgSend(v3, "setOpacity:", v5);
  -[PKGlyphView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsScale");
  objc_msgSend(v3, "setContentsScale:");

  customImageLayer = self->_customImageLayer;
  if (customImageLayer)
  {
    -[CALayer superlayer](customImageLayer, "superlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSublayer:above:", v3, self->_customImageLayer);

  }
  return v3;
}

- (void)setShowQRCode:(BOOL)a3
{
  if (((!self->_showQRCode ^ a3) & 1) == 0)
  {
    self->_showQRCode = a3;
    -[PKPhoneGlyphLayer setShowQRCode:](self->_phoneLayer, "setShowQRCode:");
  }
}

- (CATransform3D)_phoneTransformDeltaWhileShownFromRotationPercentage:(SEL)a3 toPercentage:(double)a4
{
  double v6;
  double v7;
  double v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double v23;
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
  __int128 v40;
  CATransform3D v41;
  CATransform3D v42;

  v6 = fmin(fmax(a4, 0.0), 1.0);
  v7 = fmin(fmax(a5, 0.0), 1.0);
  v8 = (1.0 - v7 + v7 * 0.79) / (1.0 - v6 + v6 * 0.79);
  v9 = (__int128 *)MEMORY[0x24BDE5598];
  v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  *(_OWORD *)&retstr->m31 = v10;
  *(_OWORD *)&retstr->m33 = v11;
  v12 = v9[6];
  v13 = v9[7];
  v14 = v6 * 0.855211333;
  *(_OWORD *)&retstr->m41 = v12;
  *(_OWORD *)&retstr->m43 = v13;
  v15 = *v9;
  v16 = v9[1];
  *(_OWORD *)&retstr->m11 = *v9;
  *(_OWORD *)&retstr->m13 = v16;
  v17 = v9[2];
  v18 = v9[3];
  *(_OWORD *)&retstr->m21 = v17;
  *(_OWORD *)&retstr->m23 = v18;
  if (v14 != 0.0)
  {
    *(_OWORD *)&v41.m31 = v10;
    *(_OWORD *)&v41.m33 = v11;
    *(_OWORD *)&v41.m41 = v12;
    *(_OWORD *)&v41.m43 = v13;
    *(_OWORD *)&v41.m11 = v15;
    *(_OWORD *)&v41.m13 = v16;
    *(_OWORD *)&v41.m21 = v17;
    *(_OWORD *)&v41.m23 = v18;
    self = CATransform3DRotate(&v42, &v41, -v14, 1.0, 0.0, 0.0);
    v19 = *(_OWORD *)&v42.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v42.m31;
    *(_OWORD *)&retstr->m33 = v19;
    v20 = *(_OWORD *)&v42.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v42.m41;
    *(_OWORD *)&retstr->m43 = v20;
    v21 = *(_OWORD *)&v42.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v42.m11;
    *(_OWORD *)&retstr->m13 = v21;
    v22 = *(_OWORD *)&v42.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v42.m21;
    *(_OWORD *)&retstr->m23 = v22;
  }
  v23 = v7 * 0.855211333;
  if (v8 != 0.0 && v8 != 1.0)
  {
    v25 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v41.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v41.m33 = v25;
    v26 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v41.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v41.m43 = v26;
    v27 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v41.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v41.m13 = v27;
    v28 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v41.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v41.m23 = v28;
    self = CATransform3DScale(&v42, &v41, v8, v8, 1.0);
    v29 = *(_OWORD *)&v42.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v42.m31;
    *(_OWORD *)&retstr->m33 = v29;
    v30 = *(_OWORD *)&v42.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v42.m41;
    *(_OWORD *)&retstr->m43 = v30;
    v31 = *(_OWORD *)&v42.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v42.m11;
    *(_OWORD *)&retstr->m13 = v31;
    v32 = *(_OWORD *)&v42.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v42.m21;
    *(_OWORD *)&retstr->m23 = v32;
  }
  if (v23 != 0.0)
  {
    v33 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v41.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v41.m33 = v33;
    v34 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v41.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v41.m43 = v34;
    v35 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v41.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v41.m13 = v35;
    v36 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v41.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v41.m23 = v36;
    self = CATransform3DRotate(&v42, &v41, v23, 1.0, 0.0, 0.0);
    v37 = *(_OWORD *)&v42.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v42.m31;
    *(_OWORD *)&retstr->m33 = v37;
    v38 = *(_OWORD *)&v42.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v42.m41;
    *(_OWORD *)&retstr->m43 = v38;
    v39 = *(_OWORD *)&v42.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v42.m11;
    *(_OWORD *)&retstr->m13 = v39;
    v40 = *(_OWORD *)&v42.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v42.m21;
    *(_OWORD *)&retstr->m23 = v40;
  }
  return self;
}

- (CGPoint)_phonePositionWhileShownWithRotationPercentage:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGPoint result;

  -[LAUIPearlGlyphView contentLayer](self->_pearlView, "contentLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PKFingerprintGlyphView contentLayer](self->_fingerprintView, "contentLayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = fmin(fmax(a3, 0.0), 1.0);

  objc_msgSend(v8, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PKPhoneGlyphLayer bounds](self->_phoneLayer, "bounds");
  v19 = v18;
  v21 = v20;
  -[PKPhoneGlyphLayer anchorPoint](self->_phoneLayer, "anchorPoint");
  v24 = v11 + v23 * v19 + (v15 - v19) * 0.5;
  v25 = v13 + (1.0 - v9) * (v17 * 0.25 + v22 * v21) + v9 * (v17 + v17 * -0.024 - v21 + v22 * v21);

  v26 = v24;
  v27 = v25;
  result.y = v27;
  result.x = v26;
  return result;
}

- (CGPoint)_phonePositionDeltaWhileShownFromRotationPercentage:(double)a3 toPercentage:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  -[PKGlyphView _phonePositionWhileShownWithRotationPercentage:](self, "_phonePositionWhileShownWithRotationPercentage:", a3);
  v7 = v6;
  v9 = v8;
  -[PKGlyphView _phonePositionWhileShownWithRotationPercentage:](self, "_phonePositionWhileShownWithRotationPercentage:", a4);
  v11 = v10 - v7;
  v13 = v12 - v9;
  result.y = v13;
  result.x = v11;
  return result;
}

- (void)fingerprintGlyphView:(id)a3 didLayoutContentLayer:(id)a4
{
  -[PKGlyphView _layoutContentLayer:](self, "_layoutContentLayer:", a4);
}

- (void)pearlGlyphView:(id)a3 didLayoutContentLayer:(id)a4
{
  -[PKGlyphView _layoutContentLayer:](self, "_layoutContentLayer:", a4);
}

- (int64_t)colorMode
{
  return self->_colorMode;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (UIEdgeInsets)customImageAlignmentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_customImageAlignmentEdgeInsets.top;
  left = self->_customImageAlignmentEdgeInsets.left;
  bottom = self->_customImageAlignmentEdgeInsets.bottom;
  right = self->_customImageAlignmentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGImage)customImage
{
  return self->_customImage;
}

- (int64_t)state
{
  return self->_state;
}

- (unsigned)userIntentEdge
{
  return self->_userIntentEdge;
}

- (PKGlyphViewDelegate)delegate
{
  return (PKGlyphViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showQRCode
{
  return self->_showQRCode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryHighlightColor, 0);
  objc_storeStrong((id *)&self->_intentPrimaryHighlightColor, 0);
  objc_storeStrong((id *)&self->_primaryHighlightColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_customImageLayer, 0);
  objc_storeStrong((id *)&self->_userIntentDeviceLayer, 0);
  objc_storeStrong((id *)&self->_userIntentArrowLayer, 0);
  objc_storeStrong((id *)&self->_userIntentLayer, 0);
  objc_storeStrong((id *)&self->_checkLayer, 0);
  objc_storeStrong((id *)&self->_phoneLayer, 0);
  objc_storeStrong((id *)&self->_pearlView, 0);
  objc_storeStrong((id *)&self->_fingerprintView, 0);
  objc_storeStrong((id *)&self->_phoneWiggleAnimationKey, 0);
  objc_storeStrong((id *)&self->_lastAnimationGroup, 0);
  objc_storeStrong((id *)&self->_transitionCompletionHandlers, 0);
}

@end

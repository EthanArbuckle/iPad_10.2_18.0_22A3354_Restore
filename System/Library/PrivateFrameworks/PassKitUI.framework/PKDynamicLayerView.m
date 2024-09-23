@implementation PKDynamicLayerView

- (PKDynamicLayerView)initWithFrame:(CGRect)a3 pass:(id)a4
{
  return -[PKDynamicLayerView initWithFrame:pass:automaticallyLoadContent:](self, "initWithFrame:pass:automaticallyLoadContent:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKDynamicLayerView)initWithFrame:(CGRect)a3 pass:(id)a4 automaticallyLoadContent:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  PKDynamicLayerView *v13;
  PKDynamicLayerView *v14;
  id *p_pass;
  void *v16;
  uint64_t v17;
  PKDynamicLayerConfiguration *dynamicLayerConfiguration;
  uint64_t v19;
  PKDynamicLayerTransactionEffectConfiguration *transactionEffectConfiguration;
  uint64_t v21;
  PKDynamicLayerCrossDissolveConfiguration *crossDissolveConfiguration;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PKDynamicLayerView;
  v13 = -[PKDynamicLayerView initWithFrame:](&v30, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    p_pass = (id *)&v13->_pass;
    objc_storeStrong((id *)&v13->_pass, a4);
    objc_msgSend(*p_pass, "paymentPass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dynamicLayerConfiguration");
    v17 = objc_claimAutoreleasedReturnValue();
    dynamicLayerConfiguration = v14->_dynamicLayerConfiguration;
    v14->_dynamicLayerConfiguration = (PKDynamicLayerConfiguration *)v17;

    -[PKDynamicLayerConfiguration transactionEffect](v14->_dynamicLayerConfiguration, "transactionEffect");
    v19 = objc_claimAutoreleasedReturnValue();
    transactionEffectConfiguration = v14->_transactionEffectConfiguration;
    v14->_transactionEffectConfiguration = (PKDynamicLayerTransactionEffectConfiguration *)v19;

    -[PKDynamicLayerConfiguration crossDissolve](v14->_dynamicLayerConfiguration, "crossDissolve");
    v21 = objc_claimAutoreleasedReturnValue();
    crossDissolveConfiguration = v14->_crossDissolveConfiguration;
    v14->_crossDissolveConfiguration = (PKDynamicLayerCrossDissolveConfiguration *)v21;

    v14->_automaticallyLoadContent = a5;
    v14->_loaded = 0;
    objc_msgSend(*p_pass, "style");
    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    PKFloatRoundToPixel();
    PKFloatRoundToPixel();
    v14->_parallaxOffset.horizontal = v23;
    PKFloatRoundToPixel();
    v14->_parallaxOffset.vertical = v24;
    if (v14->_automaticallyLoadContent)
      -[PKDynamicLayerView loadContent](v14, "loadContent");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v14, sel__updateVisibility, *MEMORY[0x1E0DC45B0], 0);

    if ((-[PKDynamicLayerConfiguration isSupported](v14->_dynamicLayerConfiguration, "isSupported") & 1) == 0)
    {
      PKLogFacilityTypeGetObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *MEMORY[0x1E0D69E38];
        v28 = -[PKDynamicLayerConfiguration version](v14->_dynamicLayerConfiguration, "version");
        *(_DWORD *)buf = 134218240;
        v32 = v27;
        v33 = 2048;
        v34 = v28;
        _os_log_impl(&dword_19D178000, v26, OS_LOG_TYPE_DEFAULT, "Using static fallback asset for dynamic pass. Client supported dynamic layer configuration version: %lu pass's version: %lu", buf, 0x16u);
      }

    }
  }

  return v14;
}

- (void)loadContent
{
  if (!self->_loaded)
  {
    if (self->_automaticallyLoadContent)
      -[PKPass loadImageSetSync:preheat:](self->_pass, "loadImageSetSync:preheat:", 0, 1);
    -[PKDynamicLayerView _configureViews](self, "_configureViews");
  }
}

- (void)dealloc
{
  objc_super v3;

  -[PKDynamicLayerView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKDynamicLayerView;
  -[PKDynamicLayerView dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  CALayer *dimmingLayer;
  CAEmitterLayer *transactionEffectLayer;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKDynamicContentView invalidate](self->_foregroundParallaxView, "invalidate");
    -[PKDynamicContentView invalidate](self->_neutralView, "invalidate");
    -[PKDynamicContentView invalidate](self->_backgroundParallaxView, "invalidate");
    -[PKDynamicContentView invalidate](self->_staticOverlayView, "invalidate");
    -[CALayer removeAllAnimations](self->_dimmingLayer, "removeAllAnimations");
    -[CALayer removeFromSuperlayer](self->_dimmingLayer, "removeFromSuperlayer");
    dimmingLayer = self->_dimmingLayer;
    self->_dimmingLayer = 0;

    -[CAEmitterLayer removeAllAnimations](self->_transactionEffectLayer, "removeAllAnimations");
    -[CAEmitterLayer removeFromSuperlayer](self->_transactionEffectLayer, "removeFromSuperlayer");
    transactionEffectLayer = self->_transactionEffectLayer;
    self->_transactionEffectLayer = 0;

    -[PKDynamicLayerView _removeParallaxMotionEffect](self, "_removeParallaxMotionEffect");
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
  void *v11;
  UIImageView *staticFallbackView;
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
  double v28;
  void *v29;
  CAGradientLayer *backgroundRadialGradientLayer;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  CAGradientLayer *foregroundRadialGradientLayer;
  CALayer *dimmingLayer;
  CAEmitterLayer *transactionEffectLayer;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)PKDynamicLayerView;
  -[PKDynamicLayerView layoutSubviews](&v43, sel_layoutSubviews);
  -[PKDynamicLayerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView image](self->_staticFallbackView, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");

  PKSizeAspectFit();
  staticFallbackView = self->_staticFallbackView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](staticFallbackView, "setFrame:");
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  if (-[PKDynamicLayerConfiguration parallaxEnabled](self->_dynamicLayerConfiguration, "parallaxEnabled"))
  {
    PKFloatRoundToPixel();
    PKFloatRoundToPixel();
    PKSizeAlignedInRect();
    v13 = v17;
    v14 = v18;
    v15 = v19;
    v16 = v20;
  }
  -[PKDynamicContentView setFrame:](self->_backgroundParallaxView, "setFrame:", v13, v14, v15, v16);
  -[UIImageView setFrame:](self->_backgroundParallaxCrossDissolveView, "setFrame:", v13, v14, v15, v16);
  -[PKDynamicContentView setFrame:](self->_neutralView, "setFrame:", v4, v6, v8, v10);
  -[PKDynamicContentView setFrame:](self->_foregroundParallaxView, "setFrame:", v13, v14, v15, v16);
  -[UIImageView setFrame:](self->_foregroundParallaxCrossDissolveView, "setFrame:", v13, v14, v15, v16);
  -[PKDynamicContentView setFrame:](self->_staticOverlayView, "setFrame:", v4, v6, v8, v10);
  -[UIImageView bounds](self->_backgroundParallaxCrossDissolveView, "bounds");
  PKFloatRoundToPixel();
  PKSizeAlignedInRect();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[UIImageView maskView](self->_backgroundParallaxCrossDissolveView, "maskView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);
  backgroundRadialGradientLayer = self->_backgroundRadialGradientLayer;
  objc_msgSend(v29, "bounds");
  -[CAGradientLayer setFrame:](backgroundRadialGradientLayer, "setFrame:");
  -[UIImageView bounds](self->_foregroundParallaxCrossDissolveView, "bounds");
  PKFloatRoundToPixel();
  PKSizeAlignedInRect();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[UIImageView maskView](self->_foregroundParallaxCrossDissolveView, "maskView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);
  foregroundRadialGradientLayer = self->_foregroundRadialGradientLayer;
  objc_msgSend(v39, "bounds");
  -[CAGradientLayer setFrame:](foregroundRadialGradientLayer, "setFrame:");
  dimmingLayer = self->_dimmingLayer;
  if (dimmingLayer)
  {
    -[CALayer setFrame:](dimmingLayer, "setFrame:", v4, v6, v8, v10);
    -[CALayer setPosition:](self->_dimmingLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
  }
  transactionEffectLayer = self->_transactionEffectLayer;
  if (transactionEffectLayer)
  {
    -[CAEmitterLayer setFrame:](transactionEffectLayer, "setFrame:", v4, v6, v8, v10);
    -[CAEmitterLayer setPosition:](self->_transactionEffectLayer, "setPosition:", v8 * 0.5, v10 * 0.5);
    -[PKDynamicLayerTransactionEffectConfiguration configureTransactionEffectEmitterLayer:withBounds:](self->_transactionEffectConfiguration, "configureTransactionEffectEmitterLayer:withBounds:", self->_transactionEffectLayer, v4, v6, v8, v10);
  }

}

- (void)setPaused:(BOOL)a3
{
  if (((!self->_paused ^ a3) & 1) == 0)
  {
    self->_paused = a3;
    -[PKDynamicLayerView _updateVisibility](self, "_updateVisibility");
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setAutomaticallyLoadContent:(BOOL)a3
{
  if (((!self->_automaticallyLoadContent ^ a3) & 1) == 0)
  {
    self->_automaticallyLoadContent = a3;
    -[PKDynamicLayerView loadContent](self, "loadContent");
  }
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setMotionEnabled:(BOOL)a3
{
  if (((!self->_motionEnabled ^ a3) & 1) == 0)
  {
    self->_motionEnabled = a3;
    -[PKDynamicLayerView _updateVisibility](self, "_updateVisibility");
  }
}

- (void)_configureViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *staticFallbackView;
  id v9;

  -[PKPass frontFaceImageSet](self->_pass, "frontFaceImageSet");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_staticFallbackView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v9, "dynamicLayerStaticFallbackImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithPKImage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v6);
    staticFallbackView = self->_staticFallbackView;
    self->_staticFallbackView = v7;

    -[UIImageView setContentMode:](self->_staticFallbackView, "setContentMode:", 1);
    -[PKDynamicLayerView addSubview:](self, "addSubview:", self->_staticFallbackView);
  }
  -[PKDynamicLayerView _configureDynamicViewsWithImageSet:](self, "_configureDynamicViewsWithImageSet:", v9);
  self->_loaded = 1;
  -[PKDynamicLayerView _updateVisibility](self, "_updateVisibility");

}

- (void)_configureDynamicViewsWithImageSet:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKDynamicContentView *v13;
  PKDynamicContentView *backgroundParallaxView;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  UIImageView *v22;
  UIImageView *backgroundParallaxCrossDissolveView;
  CAGradientLayer *v24;
  CAGradientLayer *backgroundRadialGradientLayer;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  PKDynamicContentView *v34;
  PKDynamicContentView *neutralView;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PKDynamicContentView *v42;
  PKDynamicContentView *foregroundParallaxView;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  UIImageView *v52;
  UIImageView *foregroundParallaxCrossDissolveView;
  CAGradientLayer *v54;
  CAGradientLayer *foregroundRadialGradientLayer;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  PKDynamicContentView *v64;
  PKDynamicContentView *staticOverlayView;
  void *v66;
  void *v67;
  UIImage *v68;
  UIImage *transactionEffectEmitterImage;
  NSData *v70;
  NSData *transactionEffectShapeData;
  CALayer *v72;
  CALayer *dimmingLayer;
  void *v74;
  CALayer *v75;
  id v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;

  v86 = a3;
  -[PKDynamicLayerConfiguration backgroundParallaxEmitter](self->_dynamicLayerConfiguration, "backgroundParallaxEmitter");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PKDynamicLayerConfiguration neutralEmitter](self->_dynamicLayerConfiguration, "neutralEmitter");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PKDynamicLayerConfiguration foregroundParallaxEmitter](self->_dynamicLayerConfiguration, "foregroundParallaxEmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicLayerConfiguration staticOverlayEmitter](self->_dynamicLayerConfiguration, "staticOverlayEmitter");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v86, "backgroundParallaxImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithPKImage:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v86, "backgroundParallaxEmitterImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithPKImage:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  if (!self->_backgroundParallaxView)
  {
    v13 = -[PKDynamicContentView initWithImage:emitterImage:dynamicLayerEmitterConfiguration:]([PKDynamicContentView alloc], "initWithImage:emitterImage:dynamicLayerEmitterConfiguration:", v9, v12, v4);
    backgroundParallaxView = self->_backgroundParallaxView;
    self->_backgroundParallaxView = v13;

    -[PKDynamicLayerView addSubview:](self, "addSubview:", self->_backgroundParallaxView);
  }
  v81 = (void *)v12;
  v84 = (void *)v4;
  v15 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v86, "backgroundParallaxCrossDissolveImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithPKImage:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v9
    && self->_backgroundParallaxView
    && v17
    && !self->_backgroundParallaxCrossDissolveView
    && self->_crossDissolveConfiguration)
  {
    v18 = objc_alloc(MEMORY[0x1E0DC3890]);
    v19 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v86, "backgroundParallaxCrossDissolveImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithPKImage:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (UIImageView *)objc_msgSend(v18, "initWithImage:", v21);
    backgroundParallaxCrossDissolveView = self->_backgroundParallaxCrossDissolveView;
    self->_backgroundParallaxCrossDissolveView = v22;

    -[UIImageView setContentMode:](self->_backgroundParallaxCrossDissolveView, "setContentMode:", 1);
    if (!self->_backgroundRadialGradientLayer)
    {
      RadialGradientLayer();
      v24 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
      backgroundRadialGradientLayer = self->_backgroundRadialGradientLayer;
      self->_backgroundRadialGradientLayer = v24;

      v26 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v26, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSublayer:", self->_backgroundRadialGradientLayer);

      -[UIImageView setMaskView:](self->_backgroundParallaxCrossDissolveView, "setMaskView:", v26);
    }
    -[PKDynamicLayerView addSubview:](self, "addSubview:", self->_backgroundParallaxCrossDissolveView);
  }
  v28 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v86, "neutralImage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageWithPKImage:", v29);
  v30 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v31 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v86, "neutralEmitterImage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "imageWithPKImage:", v32);
    v33 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }
  if (!self->_neutralView)
  {
    v34 = -[PKDynamicContentView initWithImage:emitterImage:dynamicLayerEmitterConfiguration:]([PKDynamicContentView alloc], "initWithImage:emitterImage:dynamicLayerEmitterConfiguration:", v30, v33, v5);
    neutralView = self->_neutralView;
    self->_neutralView = v34;

    -[PKDynamicLayerView addSubview:](self, "addSubview:", self->_neutralView);
  }
  v82 = (void *)v9;
  v83 = (void *)v5;
  v36 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v86, "foregroundParallaxImage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "imageWithPKImage:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = (void *)v30;
  if (v6)
  {
    v39 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v86, "foregroundParallaxEmitterImage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "imageWithPKImage:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = 0;
  }
  v80 = (void *)v17;
  if (!self->_foregroundParallaxView)
  {
    v42 = -[PKDynamicContentView initWithImage:emitterImage:dynamicLayerEmitterConfiguration:]([PKDynamicContentView alloc], "initWithImage:emitterImage:dynamicLayerEmitterConfiguration:", v38, v41, v6);
    foregroundParallaxView = self->_foregroundParallaxView;
    self->_foregroundParallaxView = v42;

    -[PKDynamicLayerView addSubview:](self, "addSubview:", self->_foregroundParallaxView);
  }
  v44 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v86, "foregroundParallaxCrossDissolveImage");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "imageWithPKImage:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)v33;
  if (v38
    && self->_foregroundParallaxView
    && v46
    && !self->_foregroundParallaxCrossDissolveView
    && self->_crossDissolveConfiguration)
  {
    v48 = objc_alloc(MEMORY[0x1E0DC3890]);
    v49 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v86, "foregroundParallaxCrossDissolveImage");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "imageWithPKImage:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (UIImageView *)objc_msgSend(v48, "initWithImage:", v51);
    foregroundParallaxCrossDissolveView = self->_foregroundParallaxCrossDissolveView;
    self->_foregroundParallaxCrossDissolveView = v52;

    -[UIImageView setContentMode:](self->_foregroundParallaxCrossDissolveView, "setContentMode:", 1);
    if (!self->_foregroundRadialGradientLayer)
    {
      RadialGradientLayer();
      v54 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
      foregroundRadialGradientLayer = self->_foregroundRadialGradientLayer;
      self->_foregroundRadialGradientLayer = v54;

      v56 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v56, "layer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addSublayer:", self->_foregroundRadialGradientLayer);

      -[UIImageView setMaskView:](self->_foregroundParallaxCrossDissolveView, "setMaskView:", v56);
    }
    -[PKDynamicLayerView addSubview:](self, "addSubview:", self->_foregroundParallaxCrossDissolveView);
  }
  v58 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v86, "staticOverlayImage");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "imageWithPKImage:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    v61 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v86, "staticOverlayEmitterImage");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "imageWithPKImage:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v63 = 0;
  }
  if (!self->_staticOverlayView)
  {
    v64 = -[PKDynamicContentView initWithImage:emitterImage:dynamicLayerEmitterConfiguration:]([PKDynamicContentView alloc], "initWithImage:emitterImage:dynamicLayerEmitterConfiguration:", v60, v63, v85);
    staticOverlayView = self->_staticOverlayView;
    self->_staticOverlayView = v64;

    -[PKDynamicLayerView addSubview:](self, "addSubview:", self->_staticOverlayView);
  }
  v66 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v86, "transactionEffectEmitterImage");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "imageWithPKImage:", v67);
  v68 = (UIImage *)objc_claimAutoreleasedReturnValue();
  transactionEffectEmitterImage = self->_transactionEffectEmitterImage;
  self->_transactionEffectEmitterImage = v68;

  objc_msgSend(v86, "transactionEffectEmitterShapeSVGData");
  v70 = (NSData *)objc_claimAutoreleasedReturnValue();
  transactionEffectShapeData = self->_transactionEffectShapeData;
  self->_transactionEffectShapeData = v70;

  if (!self->_dimmingLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v72 = (CALayer *)objc_claimAutoreleasedReturnValue();
    dimmingLayer = self->_dimmingLayer;
    self->_dimmingLayer = v72;

    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3658]), "initWithWhite:alpha:", 0.0, 0.5);
    v75 = self->_dimmingLayer;
    v76 = objc_retainAutorelease(v74);
    -[CALayer setBackgroundColor:](v75, "setBackgroundColor:", objc_msgSend(v76, "CGColor"));
    LODWORD(v77) = 0;
    -[CALayer setOpacity:](self->_dimmingLayer, "setOpacity:", v77);
    -[PKDynamicLayerView layer](self, "layer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addSublayer:", self->_dimmingLayer);

  }
}

- (void)_updateVisibility
{
  int v3;
  int v4;
  _BOOL4 v5;

  v3 = -[PKDynamicLayerConfiguration isSupported](self->_dynamicLayerConfiguration, "isSupported");
  v4 = v3 & !UIAccessibilityIsReduceMotionEnabled();
  if (self->_motionEnabled)
    v5 = v4;
  else
    v5 = 0;
  self->_effectiveMotionEnabled = v5;
  -[PKDynamicContentView setHidden:](self->_backgroundParallaxView, "setHidden:", !v5);
  -[UIImageView setHidden:](self->_backgroundParallaxCrossDissolveView, "setHidden:", !self->_effectiveMotionEnabled);
  -[PKDynamicContentView setHidden:](self->_neutralView, "setHidden:", !self->_effectiveMotionEnabled);
  -[PKDynamicContentView setHidden:](self->_foregroundParallaxView, "setHidden:", !self->_effectiveMotionEnabled);
  -[UIImageView setHidden:](self->_foregroundParallaxCrossDissolveView, "setHidden:", !self->_effectiveMotionEnabled);
  -[PKDynamicContentView setHidden:](self->_staticOverlayView, "setHidden:", !self->_effectiveMotionEnabled);
  -[UIImageView setHidden:](self->_staticFallbackView, "setHidden:", self->_effectiveMotionEnabled);
  if (self->_paused || !self->_effectiveMotionEnabled)
    -[PKDynamicLayerView _removeParallaxMotionEffect](self, "_removeParallaxMotionEffect");
  else
    -[PKDynamicLayerView _addParallaxAndMotionEffects](self, "_addParallaxAndMotionEffects");
  -[PKDynamicContentView setPaused:](self->_backgroundParallaxView, "setPaused:", self->_paused);
  -[PKDynamicContentView setPaused:](self->_neutralView, "setPaused:", self->_paused);
  -[PKDynamicContentView setPaused:](self->_foregroundParallaxView, "setPaused:", self->_paused);
  -[PKDynamicContentView setPaused:](self->_staticOverlayView, "setPaused:", self->_paused);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDynamicLayerView;
  -[PKDynamicLayerView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PKDynamicLayerView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PKDynamicLayerView _updateVisibility](self, "_updateVisibility");
  else
    -[PKDynamicLayerView _removeParallaxMotionEffect](self, "_removeParallaxMotionEffect");
}

- (void)_addParallaxAndMotionEffects
{
  void *v3;
  _UIParallaxMotionEffect *v4;
  _UIParallaxMotionEffect *bottomEffect;
  _UIParallaxMotionEffect *v6;
  _UIParallaxMotionEffect *topEffect;
  void *v8;
  id v9;

  -[PKDynamicLayerView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[PKDynamicLayerConfiguration parallaxEnabled](self->_dynamicLayerConfiguration, "parallaxEnabled"))
    {
      if (!self->_bottomEffect)
      {
        v4 = (_UIParallaxMotionEffect *)objc_alloc_init(MEMORY[0x1E0DC42B0]);
        bottomEffect = self->_bottomEffect;
        self->_bottomEffect = v4;

        -[_UIParallaxMotionEffect setSlideMagnitude:](self->_bottomEffect, "setSlideMagnitude:", -self->_parallaxOffset.horizontal, -self->_parallaxOffset.vertical);
        -[PKDynamicContentView addMotionEffect:](self->_backgroundParallaxView, "addMotionEffect:", self->_bottomEffect);
        if (self->_crossDissolveConfiguration)
          -[UIImageView addMotionEffect:](self->_backgroundParallaxCrossDissolveView, "addMotionEffect:", self->_bottomEffect);
      }
      if (!self->_topEffect)
      {
        v6 = (_UIParallaxMotionEffect *)objc_alloc_init(MEMORY[0x1E0DC42B0]);
        topEffect = self->_topEffect;
        self->_topEffect = v6;

        -[_UIParallaxMotionEffect setSlideMagnitude:](self->_topEffect, "setSlideMagnitude:", self->_parallaxOffset.horizontal, self->_parallaxOffset.vertical);
        -[PKDynamicContentView addMotionEffect:](self->_foregroundParallaxView, "addMotionEffect:", self->_topEffect);
        if (self->_crossDissolveConfiguration)
          -[UIImageView addMotionEffect:](self->_foregroundParallaxCrossDissolveView, "addMotionEffect:", self->_topEffect);
      }
    }
    if (self->_crossDissolveConfiguration)
    {
      -[UIImageView maskView](self->_backgroundParallaxCrossDissolveView, "maskView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDynamicLayerView _addRadialMaskEffectsToView:](self, "_addRadialMaskEffectsToView:", v8);

      -[UIImageView maskView](self->_foregroundParallaxCrossDissolveView, "maskView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[PKDynamicLayerView _addRadialMaskEffectsToView:](self, "_addRadialMaskEffectsToView:", v9);

    }
  }
}

- (void)_addRadialMaskEffectsToView:(id)a3
{
  id v4;
  UIMotionEffectGroup *v5;
  UIMotionEffectGroup *radialMaskEffects;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!self->_radialMaskEffects)
  {
    -[PKDynamicLayerView _configureMotionEffectGroupForCrossDissolveConfiguration:](self, "_configureMotionEffectGroupForCrossDissolveConfiguration:", self->_crossDissolveConfiguration);
    v5 = (UIMotionEffectGroup *)objc_claimAutoreleasedReturnValue();
    radialMaskEffects = self->_radialMaskEffects;
    self->_radialMaskEffects = v5;

    v4 = v9;
  }
  objc_msgSend(v4, "motionEffects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    objc_msgSend(v9, "addMotionEffect:", self->_radialMaskEffects);

}

- (id)_configureMotionEffectGroupForCrossDissolveConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DC3A08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38D0]), "initWithKeyPath:type:", CFSTR("layer.transform.translation.x"), 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38D0]), "initWithKeyPath:type:", CFSTR("layer.transform.translation.y"), 1);
  v8 = objc_msgSend(v4, "intensity");

  if (!v8)
  {
    objc_msgSend(v6, "setMinimumRelativeValue:", &unk_1E3FAD6D8);
    objc_msgSend(v6, "setMaximumRelativeValue:", &unk_1E3FAD6F0);
    objc_msgSend(v7, "setMinimumRelativeValue:", &unk_1E3FAD6D8);
    objc_msgSend(v7, "setMaximumRelativeValue:", &unk_1E3FAD6F0);
  }
  v11[0] = v6;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMotionEffects:", v9);

  return v5;
}

- (void)_removeParallaxMotionEffect
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PKDynamicLayerView__removeParallaxMotionEffect__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v2, 0, 0.25, 0.0);
}

void __49__PKDynamicLayerView__removeParallaxMotionEffect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 552))
  {
    objc_msgSend(*(id *)(v2 + 424), "removeMotionEffect:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeMotionEffect:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 552);
    *(_QWORD *)(v3 + 552) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 560))
  {
    objc_msgSend(*(id *)(v2 + 456), "removeMotionEffect:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "removeMotionEffect:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 560);
    *(_QWORD *)(v5 + 560) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 568))
  {
    objc_msgSend(*(id *)(v2 + 432), "maskView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeMotionEffect:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "maskView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeMotionEffect:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568));

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 568);
    *(_QWORD *)(v9 + 568) = 0;

  }
}

- (void)runTransactionEffect
{
  CAEmitterLayer *v3;
  CAEmitterLayer *transactionEffectLayer;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CAEmitterLayer *v10;
  _QWORD v11[4];
  id v12;
  _BYTE location[12];
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PKDynamicLayerConfiguration isSupported](self->_dynamicLayerConfiguration, "isSupported")
    && self->_transactionEffectConfiguration)
  {
    if (self->_transactionEffectLayer)
      return;
    objc_msgSend(MEMORY[0x1E0CD2770], "layer");
    v3 = (CAEmitterLayer *)objc_claimAutoreleasedReturnValue();
    transactionEffectLayer = self->_transactionEffectLayer;
    self->_transactionEffectLayer = v3;

    -[PKDynamicLayerTransactionEffectConfiguration configureTransactionEffectEmitterLayer:withImage:andEmitterShapeData:](self->_transactionEffectConfiguration, "configureTransactionEffectEmitterLayer:withImage:andEmitterShapeData:", self->_transactionEffectLayer, -[UIImage CGImage](self->_transactionEffectEmitterImage, "CGImage"), self->_transactionEffectShapeData);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak((id *)location, self);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42__PKDynamicLayerView_runTransactionEffect__block_invoke;
      v11[3] = &unk_1E3E61C58;
      objc_copyWeak(&v12, (id *)location);
      -[NSObject pkui_setCompletionHandler:](v5, "pkui_setCompletionHandler:", v11);
      -[NSObject duration](v5, "duration");
      -[PKDynamicLayerView _dimmingLayerAnimationWithDuration:](self, "_dimmingLayerAnimationWithDuration:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDynamicLayerView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSublayer:", self->_transactionEffectLayer);

      -[CALayer addAnimation:forKey:](self->_dimmingLayer, "addAnimation:forKey:", v6, CFSTR("dimmingLayerFadeInFadeOut"));
      -[CAEmitterLayer addAnimation:forKey:](self->_transactionEffectLayer, "addAnimation:forKey:", v5, CFSTR("transactionEffectAnimation"));

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v10 = self->_transactionEffectLayer;
      self->_transactionEffectLayer = 0;

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *MEMORY[0x1E0D69E38];
      v9 = -[PKDynamicLayerConfiguration version](self->_dynamicLayerConfiguration, "version");
      *(_DWORD *)location = 134218240;
      *(_QWORD *)&location[4] = v8;
      v14 = 2048;
      v15 = v9;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Boop Effect unsupported. Client supported dynamic layer configuration version: %lu pass's version: %lu", location, 0x16u);
    }
  }

}

void __42__PKDynamicLayerView_runTransactionEffect__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[67], "removeFromSuperlayer");
    v2 = v3[67];
    v3[67] = 0;

    WeakRetained = v3;
  }

}

- (id)_dimmingLayerAnimationWithDuration:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", a3);
  objc_msgSend(v4, "setKeyTimes:", &unk_1E3FAE7E8);
  objc_msgSend(v4, "setValues:", &unk_1E3FAE800);
  return v4;
}

- (BOOL)automaticallyLoadContent
{
  return self->_automaticallyLoadContent;
}

- (BOOL)isMotionEnabled
{
  return self->_motionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radialMaskEffects, 0);
  objc_storeStrong((id *)&self->_topEffect, 0);
  objc_storeStrong((id *)&self->_bottomEffect, 0);
  objc_storeStrong((id *)&self->_dimmingLayer, 0);
  objc_storeStrong((id *)&self->_transactionEffectLayer, 0);
  objc_storeStrong((id *)&self->_transactionEffectShapeData, 0);
  objc_storeStrong((id *)&self->_transactionEffectEmitterImage, 0);
  objc_storeStrong((id *)&self->_crossDissolveConfiguration, 0);
  objc_storeStrong((id *)&self->_transactionEffectConfiguration, 0);
  objc_storeStrong((id *)&self->_dynamicLayerConfiguration, 0);
  objc_storeStrong((id *)&self->_staticFallbackView, 0);
  objc_storeStrong((id *)&self->_staticOverlayView, 0);
  objc_storeStrong((id *)&self->_foregroundRadialGradientLayer, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxCrossDissolveView, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxView, 0);
  objc_storeStrong((id *)&self->_neutralView, 0);
  objc_storeStrong((id *)&self->_backgroundRadialGradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxCrossDissolveView, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end

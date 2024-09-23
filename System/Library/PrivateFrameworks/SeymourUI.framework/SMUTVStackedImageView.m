@implementation SMUTVStackedImageView

- (SMUTVStackedImageView)initWithFrame:(CGRect)a3
{
  SMUTVStackedImageView *v3;
  SMUTVStackedImageView *v4;
  UILayoutGuide *v5;
  UILayoutGuide *focusLayoutGuide;
  void *v7;
  void *v8;
  uint64_t v9;
  NSLayoutConstraint *widthConstraint;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *heightConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _UIStackedImageContainerLayer *v23;
  _UIStackedImageContainerLayer *imageStackLayer;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;
  objc_super v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)SMUTVStackedImageView;
  v3 = -[SMUTVStackedImageView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_state = 0;
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BEBD718]);
    focusLayoutGuide = v4->_focusLayoutGuide;
    v4->_focusLayoutGuide = v5;

    -[UILayoutGuide widthAnchor](v4->_focusLayoutGuide, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMUTVStackedImageView widthAnchor](v4, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 0.0);
    v9 = objc_claimAutoreleasedReturnValue();
    widthConstraint = v4->_widthConstraint;
    v4->_widthConstraint = (NSLayoutConstraint *)v9;

    -[UILayoutGuide heightAnchor](v4->_focusLayoutGuide, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMUTVStackedImageView heightAnchor](v4, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0);
    v13 = objc_claimAutoreleasedReturnValue();
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v13;

    -[SMUTVStackedImageView addLayoutGuide:](v4, "addLayoutGuide:", v4->_focusLayoutGuide);
    v15 = (void *)MEMORY[0x24BDD1628];
    v33[0] = v4->_widthConstraint;
    v33[1] = v4->_heightConstraint;
    -[UILayoutGuide centerYAnchor](v4->_focusLayoutGuide, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMUTVStackedImageView centerYAnchor](v4, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v18;
    -[UILayoutGuide centerXAnchor](v4->_focusLayoutGuide, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMUTVStackedImageView centerXAnchor](v4, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v22);

    v23 = (_UIStackedImageContainerLayer *)objc_alloc_init(MEMORY[0x24BEBDD40]);
    imageStackLayer = v4->_imageStackLayer;
    v4->_imageStackLayer = v23;

    -[_UIStackedImageContainerLayer _setSelectionStyle:](v4->_imageStackLayer, "_setSelectionStyle:", 0);
    -[SMUTVStackedImageView layer](v4, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", v4->_imageStackLayer);

    -[SMUTVStackedImageView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[SMUTVStackedImageView layer](v4, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAllowsGroupOpacity:", 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31.receiver = v4;
    v31.super_class = (Class)SMUTVStackedImageView;
    -[SMUTVStackedImageView setBackgroundColor:](&v31, sel_setBackgroundColor_, v27);

    -[SMUTVStackedImageView _updateStackedImageConfiguration](v4, "_updateStackedImageConfiguration");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v4, sel__updateStackedImageConfiguration, *MEMORY[0x24BEBDEB8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v4, sel__updateStackedImageConfiguration, *MEMORY[0x24BED27B0], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIStackedImageContainerLayer setLayerStack:](self->_imageStackLayer, "setLayerStack:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SMUTVStackedImageView;
  -[SMUTVStackedImageView dealloc](&v4, sel_dealloc);
}

- (UIImage)image
{
  return self->_staticImage;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_staticImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_staticImage, a3);
    self->_state = 0;
    -[SMUTVStackedImageView _loadImage](self, "_loadImage");
    v5 = v6;
  }

}

- (UIImage)placeholderImage
{
  return (UIImage *)-[_UIStackedImageConfiguration placeholderImage](self->_imageStackConfig, "placeholderImage");
}

- (void)setPlaceholderImage:(id)a3
{
  -[_UIStackedImageConfiguration setPlaceholderImage:](self->_imageStackConfig, "setPlaceholderImage:", a3);
}

- (unint64_t)primaryControlState
{
  return -[_UIStackedImageContainerLayer _primaryControlStateForState:](self->_imageStackLayer, "_primaryControlStateForState:", -[_UIStackedImageContainerLayer controlState](self->_imageStackLayer, "controlState"));
}

- (void)setShadow:(id)a3
{
  id v5;
  NSShadow **p_shadow;
  NSShadow *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = a3;
  p_shadow = &self->_shadow;
  if ((-[NSShadow isEqual:](self->_shadow, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadow, a3);
    v7 = *p_shadow;
    if (*p_shadow)
    {
      v13 = 0.0;
      -[NSShadow shadowColor](v7, "shadowColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getRed:green:blue:alpha:", 0, 0, 0, &v13);

      -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](self->_imageStackConfig, "setDefaultFocusedShadowOpacity:", v13);
      -[_UIStackedImageConfiguration setDefaultHighlightedShadowOpacity:](self->_imageStackConfig, "setDefaultHighlightedShadowOpacity:", v13);
      -[_UIStackedImageConfiguration setDefaultUnfocusedShadowOpacity:](self->_imageStackConfig, "setDefaultUnfocusedShadowOpacity:", v13);
      objc_msgSend(v5, "shadowBlurRadius");
      v10 = v9;
      -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](self->_imageStackConfig, "setDefaultFocusedShadowRadius:");
      -[_UIStackedImageConfiguration setDefaultHighlightedShadowRadius:](self->_imageStackConfig, "setDefaultHighlightedShadowRadius:", v10);
      -[_UIStackedImageConfiguration setDefaultUnfocusedShadowRadius:](self->_imageStackConfig, "setDefaultUnfocusedShadowRadius:", v10);
      objc_msgSend(v5, "shadowOffset");
      v12 = v11;
      -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](self->_imageStackConfig, "setDefaultFocusedShadowVerticalOffset:", v11);
      -[_UIStackedImageConfiguration setDefaultHighlightedShadowVerticalOffset:](self->_imageStackConfig, "setDefaultHighlightedShadowVerticalOffset:", v12);
      -[_UIStackedImageConfiguration setDefaultUnfocusedShadowVerticalOffset:](self->_imageStackConfig, "setDefaultUnfocusedShadowVerticalOffset:", v12);
    }
    else
    {
      -[_UIStackedImageConfiguration resetShadowSettings](self->_imageStackConfig, "resetShadowSettings");
    }
  }

}

- (BOOL)allowsNonOpaqueShadow
{
  return -[_UIStackedImageConfiguration allowsNonOpaqueShadow](self->_imageStackConfig, "allowsNonOpaqueShadow");
}

- (void)setAllowsNonOpaqueShadow:(BOOL)a3
{
  -[_UIStackedImageConfiguration allowsNonOpaqueShadow](self->_imageStackConfig, "allowsNonOpaqueShadow", a3);
}

- (double)cornerRadius
{
  double result;

  -[_UIStackedImageConfiguration cornerRadius](self->_imageStackConfig, "cornerRadius");
  return result;
}

- (void)setCornerRadius:(double)a3
{
  -[_UIStackedImageConfiguration setCornerRadius:](self->_imageStackConfig, "setCornerRadius:", a3);
}

- (BOOL)flatImageContainsCornerRadius
{
  return -[_UIStackedImageConfiguration flatImageContainsCornerRadius](self->_imageStackConfig, "flatImageContainsCornerRadius");
}

- (void)setFlatImageContainsCornerRadius:(BOOL)a3
{
  -[_UIStackedImageConfiguration setFlatImageContainsCornerRadius:](self->_imageStackConfig, "setFlatImageContainsCornerRadius:", a3);
}

- (double)focusSizeIncrease
{
  double result;

  -[_UIStackedImageConfiguration scaleSizeIncrease](self->_imageStackConfig, "scaleSizeIncrease");
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
  -[_UIStackedImageConfiguration setScaleSizeIncrease:](self->_imageStackConfig, "setScaleSizeIncrease:", a3);
}

- (void)setOverlayComposited:(BOOL)a3
{
  _UIStackedImageConfiguration *imageStackConfig;
  double v4;

  self->_overlayComposited = a3;
  imageStackConfig = self->_imageStackConfig;
  v4 = 1.0;
  if (a3)
    v4 = 0.0;
  -[_UIStackedImageConfiguration setOverlayDepth:](imageStackConfig, "setOverlayDepth:", v4);
}

- (void)setOverlayView:(id)a3
{
  _UIStackedImageContainerLayer *imageStackLayer;
  void *v6;
  UIView *v7;

  v7 = (UIView *)a3;
  if (self->_overlayView != v7)
  {
    objc_storeStrong((id *)&self->_overlayView, a3);
    imageStackLayer = self->_imageStackLayer;
    -[UIView layer](v7, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStackedImageContainerLayer _setOverlayLayer:](imageStackLayer, "_setOverlayLayer:", v6);

  }
}

- (void)setUnmaskedOverlayView:(id)a3
{
  _UIStackedImageContainerLayer *imageStackLayer;
  void *v6;
  UIView *v7;

  v7 = (UIView *)a3;
  if (self->_unmaskedOverlayView != v7)
  {
    objc_storeStrong((id *)&self->_unmaskedOverlayView, a3);
    imageStackLayer = self->_imageStackLayer;
    -[UIView layer](v7, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStackedImageContainerLayer _setUnmaskedOverlayLayer:](imageStackLayer, "_setUnmaskedOverlayLayer:", v6);

  }
}

- (void)_updateFocusLayoutGuideForControlState:(unint64_t)a3
{
  char v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = a3;
  -[SMUTVStackedImageView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[SMUTVStackedImageView _scaledSize](self, "_scaledSize");
  v11 = v10 - v6;
  if ((v3 & 8) == 0)
    v11 = 0.0;
  v12 = v9 - v8;
  if ((v3 & 8) != 0)
    v13 = v12;
  else
    v13 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_widthConstraint, "setConstant:", v11);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v13);
}

- (unint64_t)controlState
{
  return -[_UIStackedImageContainerLayer controlState](self->_imageStackLayer, "controlState");
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer setControlState:animated:](self->_imageStackLayer, "setControlState:animated:", a3, a4);
  -[SMUTVStackedImageView _updateMotionEffectsForState:](self, "_updateMotionEffectsForState:", a3);
}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = a4;
  -[_UIStackedImageContainerLayer setControlState:animated:focusAnimationCoordinator:](self->_imageStackLayer, "setControlState:animated:focusAnimationCoordinator:", a3, v6 != 0, v6);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__SMUTVStackedImageView_setControlState_withAnimationCoordinator___block_invoke;
  v9[3] = &unk_24F555D90;
  v9[4] = self;
  v9[5] = a3;
  v7 = _Block_copy(v9);
  v8 = v7;
  if (v6)
    objc_msgSend(v6, "addCoordinatedAnimations:completion:", v7, 0);
  else
    (*((void (**)(void *))v7 + 2))(v7);
  -[SMUTVStackedImageView _updateMotionEffectsForState:](self, "_updateMotionEffectsForState:", a3);

}

uint64_t __66__SMUTVStackedImageView_setControlState_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFocusLayoutGuideForControlState:", *(_QWORD *)(a1 + 40));
}

- (void)_updateMotionEffectsForState:(unint64_t)a3
{
  if ((a3 & 8) != 0)
    -[SMUTVStackedImageView _attachMotionEffects](self, "_attachMotionEffects");
  else
    -[SMUTVStackedImageView _detachMotionEffects](self, "_detachMotionEffects");
}

- (CGPoint)focusDirection
{
  double v2;
  double v3;
  CGPoint result;

  -[_UIStackedImageContainerLayer focusDirection](self->_imageStackLayer, "focusDirection");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
  -[_UIStackedImageContainerLayer setFocusDirection:](self->_imageStackLayer, "setFocusDirection:", a3.x, a3.y);
}

- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer setFocusDirection:animated:](self->_imageStackLayer, "setFocusDirection:animated:", a4, a3.x, a3.y);
}

- (BOOL)isSelected
{
  return -[_UIStackedImageContainerLayer isSelected](self->_imageStackLayer, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  -[_UIStackedImageContainerLayer setSelected:](self->_imageStackLayer, "setSelected:", a3);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer setSelected:animated:](self->_imageStackLayer, "setSelected:animated:", a3, a4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  -[_UIStackedImageContainerLayer setSelected:animated:focusAnimationCoordinator:](self->_imageStackLayer, "setSelected:animated:focusAnimationCoordinator:", a3, a4, a5);
}

- (BOOL)isPressed
{
  return -[_UIStackedImageContainerLayer isPressed](self->_imageStackLayer, "isPressed");
}

- (void)setPressed:(BOOL)a3
{
  -[_UIStackedImageContainerLayer setPressed:](self->_imageStackLayer, "setPressed:", a3);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer setPressed:animated:](self->_imageStackLayer, "setPressed:animated:", a3, a4);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMUTVStackedImageView;
  -[SMUTVStackedImageView willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  -[SMUTVStackedImageView _loadImage](self, "_loadImage");
}

- (void)layoutSubviews
{
  _UIStackedImageContainerLayer *imageStackLayer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMUTVStackedImageView;
  -[SMUTVStackedImageView layoutSubviews](&v4, sel_layoutSubviews);
  imageStackLayer = self->_imageStackLayer;
  -[SMUTVStackedImageView bounds](self, "bounds");
  -[_UIStackedImageContainerLayer setFrame:](imageStackLayer, "setFrame:");
  -[SMUTVStackedImageView _loadImage](self, "_loadImage");
}

- (CGSize)_scaledSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)MEMORY[0x24BDE56D0];
  -[SMUTVStackedImageView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[SMUTVStackedImageView focusSizeIncrease](self, "focusSizeIncrease");
  objc_msgSend(v3, "smu_scaledSizeForSize:focusSizeIncrease:selectionStyle:", -[_UIStackedImageContainerLayer _selectionStyle](self->_imageStackLayer, "_selectionStyle"), v5, v7, v8);
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_loadImage
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _SMUTVStackedImageNamedLayerStack *v8;
  _SMUTVStackedImageNamedLayerStack *uiLayerStack;
  void *v10;
  void *v11;
  void *v12;
  UIImage *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  UIImage *v19;
  id v20;
  void (**v21)(void *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  NSObject *v26;
  _QWORD block[4];
  UIImage *v28;
  void (**v29)(void *, uint64_t);
  double v30;
  double v31;
  uint64_t v32;
  _QWORD aBlock[4];
  UIImage *v34;
  id v35;
  id v36[3];
  id location;

  if (!-[SMUTVStackedImageView state](self, "state"))
  {
    self->_state = 1;
    v3 = objc_msgSend(MEMORY[0x24BEBD620], "smu_canDecodeOnRenderThread");
    -[SMUTVStackedImageView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v8 = (_SMUTVStackedImageNamedLayerStack *)objc_opt_new();
    uiLayerStack = self->_uiLayerStack;
    self->_uiLayerStack = v8;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SMUTVStackedImageNamedLayerStack setName:](self->_uiLayerStack, "setName:", v11);

    -[_SMUTVStackedImageNamedLayerStack setSize:](self->_uiLayerStack, "setSize:", *(double *)&v5, *(double *)&v7);
    -[_SMUTVStackedImageNamedLayerStack setScale:](self->_uiLayerStack, "setScale:", 1.0);
    -[_SMUTVStackedImageNamedLayerStack setFlattenedImage:](self->_uiLayerStack, "setFlattenedImage:", 0);
    -[_SMUTVStackedImageNamedLayerStack setLayers:](self->_uiLayerStack, "setLayers:", MEMORY[0x24BDBD1A8]);
    -[_SMUTVStackedImageNamedLayerStack setRadiosityImage:](self->_uiLayerStack, "setRadiosityImage:", 0);
    -[_SMUTVStackedImageNamedLayerStack setRadiosityImageScale:](self->_uiLayerStack, "setRadiosityImageScale:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[_SMUTVStackedImageNamedLayerStack setFlatImageContainsCornerRadius:](self->_uiLayerStack, "setFlatImageContainsCornerRadius:", 0);
    -[_UIStackedImageContainerLayer setLayerStack:](self->_imageStackLayer, "setLayerStack:", self->_uiLayerStack);
    if (self->_staticImage)
    {
      objc_initWeak(&location, self);
      v12 = (void *)-[_SMUTVStackedImageNamedLayerStack copy](self->_uiLayerStack, "copy");
      v13 = self->_staticImage;
      -[SMUTVStackedImageView _scaledSize](self, "_scaledSize");
      v15 = v14;
      v17 = v16;
      v18 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __35__SMUTVStackedImageView__loadImage__block_invoke;
      aBlock[3] = &unk_24F555DB8;
      objc_copyWeak(v36, &location);
      v19 = v13;
      v34 = v19;
      v20 = v12;
      v35 = v20;
      v36[1] = v5;
      v36[2] = v7;
      v21 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
      v22 = 0;
      if ((v3 & 1) == 0)
      {
        -[_UIStackedImageConfiguration cornerRadius](self->_imageStackConfig, "cornerRadius");
        v22 = v23;
      }
      -[UIImage size](self->_staticImage, "size");
      if (v15 == v25 && v17 == v24)
      {
        v21[2](v21, (uint64_t)-[UIImage CGImage](objc_retainAutorelease(v19), "CGImage"));
      }
      else
      {
        dispatch_get_global_queue(21, 0);
        v26 = objc_claimAutoreleasedReturnValue();
        block[0] = v18;
        block[1] = 3221225472;
        block[2] = __35__SMUTVStackedImageView__loadImage__block_invoke_2;
        block[3] = &unk_24F555E08;
        v30 = v15;
        v31 = v17;
        v28 = v19;
        v32 = v22;
        v29 = v21;
        dispatch_async(v26, block);

      }
      objc_destroyWeak(v36);

      objc_destroyWeak(&location);
    }
    else
    {
      self->_state = 2;
    }
  }
}

void __35__SMUTVStackedImageView__loadImage__block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v5;
  BOOL v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v5 = objc_msgSend(WeakRetained[52], "CGImage");
    v6 = v5 == objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage");
    WeakRetained = v7;
    if (v6)
    {
      objc_msgSend(v7, "_updateLayerStack:withImage:size:", *(_QWORD *)(a1 + 40), a2, *(double *)(a1 + 56), *(double *)(a1 + 64));
      objc_msgSend(v7, "_commitLayerStack:", *(_QWORD *)(a1 + 40));
      WeakRetained = v7;
      v7[66] = (id)2;
    }
  }

}

void __35__SMUTVStackedImageView__loadImage__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEBD640];
  v10[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositedImageWithSize:images:cornerRadius:blendMode:legacyMode:", v3, 0, 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SMUTVStackedImageView__loadImage__block_invoke_3;
  v7[3] = &unk_24F555DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __35__SMUTVStackedImageView__loadImage__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage"));
}

- (void)_updateLayerStack:(id)a3 withImage:(CGImage *)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  height = a5.height;
  width = a5.width;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(v8, "setFlattenedImage:", a4);
  v9 = (double)CGImageGetWidth(a4);
  v10 = (double)CGImageGetHeight(a4);
  if (v9 / v10 != width / height)
  {
    v11 = fmin(width / v9, height / v10);
    width = floor(v11 * v9);
    height = floor(v11 * v10);
    objc_msgSend(v8, "setSize:", width, height);
  }
  if (!a4)
    goto LABEL_6;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImageObj:", v13);

  objc_msgSend(v12, "setImage:", a4);
  objc_msgSend(v12, "setName:", CFSTR("0"));
  objc_msgSend(v12, "setOpacity:", 1.0);
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, width, height);
  if (v12)
  {
    v15[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayers:", v14);

  }
  else
  {
LABEL_6:
    objc_msgSend(v8, "setLayers:", MEMORY[0x24BDBD1A8]);
  }

}

- (void)_commitLayerStack:(id)a3
{
  _SMUTVStackedImageNamedLayerStack *v4;
  uint64_t v5;
  _SMUTVStackedImageNamedLayerStack *uiLayerStack;
  _SMUTVStackedImageNamedLayerStack *v7;

  v4 = (_SMUTVStackedImageNamedLayerStack *)a3;
  v5 = objc_msgSend(MEMORY[0x24BDE57D8], "disableActions");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  uiLayerStack = self->_uiLayerStack;
  self->_uiLayerStack = v4;
  v7 = v4;

  -[_UIStackedImageContainerLayer setLayerStack:](self->_imageStackLayer, "setLayerStack:", self->_uiLayerStack);
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", v5);

}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return (id)-[_UIStackedImageConfiguration focusAnimationConfiguration](self->_imageStackConfig, "focusAnimationConfiguration", a3, a4);
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("focusDirectionX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "objectForKey:", CFSTR("focusDirectionY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  -[SMUTVStackedImageView setFocusDirection:](self, "setFocusDirection:", v8, v11);
  return 1;
}

- (void)_attachMotionEffects
{
  UIMotionEffectGroup *motionEffectGroup;
  void *v4;
  void *v5;
  UIMotionEffectGroup *v6;
  UIMotionEffectGroup *v7;
  UIMotionEffectGroup *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  motionEffectGroup = self->_motionEffectGroup;
  if (!motionEffectGroup)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD690]), "initWithKeyPath:type:", CFSTR("focusDirectionX"), 0);
    objc_msgSend(v4, "setMinimumRelativeValue:", &unk_24F6313D0);
    objc_msgSend(v4, "setMaximumRelativeValue:", &unk_24F6313E0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD690]), "initWithKeyPath:type:", CFSTR("focusDirectionY"), 1);
    objc_msgSend(v5, "setMinimumRelativeValue:", &unk_24F6313D0);
    objc_msgSend(v5, "setMaximumRelativeValue:", &unk_24F6313E0);
    v6 = (UIMotionEffectGroup *)objc_alloc_init(MEMORY[0x24BEBD770]);
    v7 = self->_motionEffectGroup;
    self->_motionEffectGroup = v6;

    v8 = self->_motionEffectGroup;
    v10[0] = v4;
    v10[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMotionEffectGroup setMotionEffects:](v8, "setMotionEffects:", v9);

    motionEffectGroup = self->_motionEffectGroup;
  }
  -[SMUTVStackedImageView addMotionEffect:](self, "addMotionEffect:", motionEffectGroup);
}

- (void)_detachMotionEffects
{
  -[SMUTVStackedImageView removeMotionEffect:](self, "removeMotionEffect:", self->_motionEffectGroup);
}

- (void)_updateStackedImageConfiguration
{
  _UIStackedImageConfiguration *v3;
  _UIStackedImageConfiguration *imageStackConfig;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double repositionUnselectionDuration;

  if (!self->_imageStackConfig)
  {
    objc_msgSend(MEMORY[0x24BEBDD38], "smu_newImageConfiguration");
    v3 = (_UIStackedImageConfiguration *)objc_claimAutoreleasedReturnValue();
    imageStackConfig = self->_imageStackConfig;
    self->_imageStackConfig = v3;

    -[_UIStackedImageConfiguration layerSelectionDuration](self->_imageStackConfig, "layerSelectionDuration");
    self->_layerSelectionDuration = v5;
    -[_UIStackedImageConfiguration layerUnselectionDuration](self->_imageStackConfig, "layerUnselectionDuration");
    self->_layerUnselectionDuration = v6;
    -[_UIStackedImageConfiguration shadowSelectionDuration](self->_imageStackConfig, "shadowSelectionDuration");
    self->_shadowSelectionDuration = v7;
    -[_UIStackedImageConfiguration shadowUnselectionDuration](self->_imageStackConfig, "shadowUnselectionDuration");
    self->_shadowUnselectionDuration = v8;
    -[_UIStackedImageConfiguration repositionUnselectionDuration](self->_imageStackConfig, "repositionUnselectionDuration");
    self->_repositionUnselectionDuration = v9;
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    repositionUnselectionDuration = 0.0;
    -[_UIStackedImageConfiguration setLayerSelectionDuration:](self->_imageStackConfig, "setLayerSelectionDuration:", 0.0);
    -[_UIStackedImageConfiguration setLayerUnselectionDuration:](self->_imageStackConfig, "setLayerUnselectionDuration:", 0.0);
    -[_UIStackedImageConfiguration setShadowSelectionDuration:](self->_imageStackConfig, "setShadowSelectionDuration:", 0.0);
    -[_UIStackedImageConfiguration setShadowUnselectionDuration:](self->_imageStackConfig, "setShadowUnselectionDuration:", 0.0);
  }
  else
  {
    -[_UIStackedImageConfiguration setLayerSelectionDuration:](self->_imageStackConfig, "setLayerSelectionDuration:", self->_layerSelectionDuration);
    -[_UIStackedImageConfiguration setLayerUnselectionDuration:](self->_imageStackConfig, "setLayerUnselectionDuration:", self->_layerUnselectionDuration);
    -[_UIStackedImageConfiguration setShadowSelectionDuration:](self->_imageStackConfig, "setShadowSelectionDuration:", self->_shadowSelectionDuration);
    -[_UIStackedImageConfiguration setShadowUnselectionDuration:](self->_imageStackConfig, "setShadowUnselectionDuration:", self->_shadowUnselectionDuration);
    repositionUnselectionDuration = self->_repositionUnselectionDuration;
  }
  -[_UIStackedImageConfiguration setRepositionUnselectionDuration:](self->_imageStackConfig, "setRepositionUnselectionDuration:", repositionUnselectionDuration);
  if (_AXSHighContrastFocusIndicatorsEnabled())
    -[_UIStackedImageConfiguration setFocusCursorEnabled:](self->_imageStackConfig, "setFocusCursorEnabled:", 1);
  -[_UIStackedImageContainerLayer setConfiguration:](self->_imageStackLayer, "setConfiguration:", self->_imageStackConfig);
}

- (UILayoutGuide)focusLayoutGuide
{
  return self->_focusLayoutGuide;
}

- (int64_t)state
{
  return self->_state;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (BOOL)isOverlayComposited
{
  return self->_overlayComposited;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIView)unmaskedOverlayView
{
  return self->_unmaskedOverlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmaskedOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_focusLayoutGuide, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_motionEffectGroup, 0);
  objc_storeStrong((id *)&self->_uiLayerStack, 0);
  objc_storeStrong((id *)&self->_imageStackConfig, 0);
  objc_storeStrong((id *)&self->_imageStackLayer, 0);
  objc_storeStrong((id *)&self->_staticImage, 0);
}

@end

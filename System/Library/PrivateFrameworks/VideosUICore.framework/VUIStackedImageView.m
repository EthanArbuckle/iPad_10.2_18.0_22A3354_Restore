@implementation VUIStackedImageView

- (VUIStackedImageView)initWithImageProxy:(id)a3
{
  id v5;
  VUIStackedImageView *v6;
  VUIStackedImageView *v7;

  v5 = a3;
  objc_msgSend(v5, "expectedSize");
  v6 = -[VUIStackedImageView initWithImage:size:](self, "initWithImage:size:", 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_imageProxy, a3);

  return v7;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (VUIStackedImageView)initWithImage:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  VUIStackedImageView *v8;
  VUIStackedImageView *v9;
  void *v10;
  uint64_t v11;
  _UIStackedImageContainerLayer *imageStackLayer;
  void *v13;
  void *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v16.receiver = self;
  v16.super_class = (Class)VUIStackedImageView;
  v8 = -[VUIStackedImageView initWithFrame:](&v16, sel_initWithFrame_, a3, v6, v7, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_stackSize.width = width;
    v8->_stackSize.height = height;
    -[VUIStackedImageView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    -[VUIStackedImageView layer](v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

    -[VUIStackedImageView layer](v9, "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    imageStackLayer = v9->_imageStackLayer;
    v9->_imageStackLayer = (_UIStackedImageContainerLayer *)v11;

    -[VUIStackedImageView _updateStackedImageConfiguration](v9, "_updateStackedImageConfiguration");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel__updateStackedImageConfiguration, *MEMORY[0x1E0CEB090], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, sel__updateStackedImageConfiguration, *MEMORY[0x1E0DDE128], 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIStackedImageContainerLayer setLayerStack:](self->_imageStackLayer, "setLayerStack:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIStackedImageView;
  -[VUIStackedImageView dealloc](&v4, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  width = self->_stackSize.width;
  if (width <= 0.0 || (height = self->_stackSize.height, height <= 0.0))
  {
    v9.receiver = self;
    v9.super_class = (Class)VUIStackedImageView;
    -[VUIStackedImageView sizeThatFits:](&v9, sel_sizeThatFits_, a3.width, a3.height);
    width = v5;
    height = v6;
  }
  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  BOOL v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIStackedImageView;
  -[VUIStackedImageView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  v5 = -[VUIStackedImageView isImageLoaded](self, "isImageLoaded");
  if (a3)
  {
    if (!v5)
      -[VUIStackedImageView _loadImage](self, "_loadImage");
  }
  else if (!v5)
  {
    -[VUIImageProxy cancel](self->_imageProxy, "cancel");
  }
}

- (void)setImageProxy:(id)a3
{
  VUIImageProxy **p_imageProxy;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  VUIImageProxy *v10;

  p_imageProxy = &self->_imageProxy;
  v10 = (VUIImageProxy *)a3;
  if (*p_imageProxy != v10)
  {
    -[VUIStackedImageView window](self, "window");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[VUIStackedImageView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;

    }
    else
    {
      v8 = 0;
    }
    -[VUIImageProxy setImageDirection:](v10, "setImageDirection:", v8);
    if (!-[VUIImageProxy isEqual:](v10, "isEqual:", *p_imageProxy))
    {
      if (!-[VUIStackedImageView isImageLoaded](self, "isImageLoaded"))
        -[VUIImageProxy cancel](*p_imageProxy, "cancel");
      -[VUIStackedImageView setImageLoaded:](self, "setImageLoaded:", 0);
      objc_storeStrong((id *)&self->_imageProxy, a3);
      -[VUIStackedImageView window](self, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        -[VUIStackedImageView _loadImage](self, "_loadImage");
    }
  }

}

- (UIImage)image
{
  return self->_staticImage;
}

- (void)setImage:(id)a3 withSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v7;

  height = a4.height;
  width = a4.width;
  objc_storeStrong((id *)&self->_staticImage, a3);
  self->_stackSize.width = width;
  self->_stackSize.height = height;
  -[VUIStackedImageView setImageProxy:](self, "setImageProxy:", 0);
  -[VUIStackedImageView setImageLoaded:](self, "setImageLoaded:", 0);
  -[VUIStackedImageView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[VUIStackedImageView _loadImage](self, "_loadImage");
}

- (UIImage)placeholderImage
{
  return (UIImage *)-[_UIStackedImageConfiguration placeholderImage](self->_imageStackConfig, "placeholderImage");
}

- (void)setPlaceholderImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v10 = a3;
  -[VUIStackedImageView placeholderImage](self, "placeholderImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "traitCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUICoreUtilities defaultPlaceholderImageForUserInterfaceStyle:](VUICoreUtilities, "defaultPlaceholderImageForUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
    }
    else
    {
      v6 = 0;
    }
    v11 = v6;
    -[_UIStackedImageConfiguration setPlaceholderImage:](self->_imageStackConfig, "setPlaceholderImage:", v6);
    v5 = v11;
  }

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

- (void)setShadow:(id)a3
{
  id v5;
  NSShadow **p_shadow;
  NSShadow *v7;
  void *v8;
  double v9;
  double v10;

  v5 = a3;
  p_shadow = &self->_shadow;
  if ((-[NSShadow isEqual:](self->_shadow, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadow, a3);
    v7 = *p_shadow;
    if (*p_shadow)
    {
      v10 = 0.0;
      -[NSShadow shadowColor](v7, "shadowColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getRed:green:blue:alpha:", 0, 0, 0, &v10);

      -[VUIStackedImageView _setShadowOpacity:](self, "_setShadowOpacity:", v10);
      objc_msgSend(v5, "shadowBlurRadius");
      -[VUIStackedImageView _setShadowRadius:](self, "_setShadowRadius:");
      objc_msgSend(v5, "shadowOffset");
      -[VUIStackedImageView _setShadowVerticalOffset:](self, "_setShadowVerticalOffset:", v9);
    }
    else
    {
      -[VUIStackedImageView _resetShadowSettings](self, "_resetShadowSettings");
    }
  }

}

- (BOOL)allowsNonOpaqueShadow
{
  return -[_UIStackedImageConfiguration allowsNonOpaqueShadow](self->_imageStackConfig, "allowsNonOpaqueShadow");
}

- (void)setAllowsNonOpaqueShadow:(BOOL)a3
{
  -[_UIStackedImageConfiguration setAllowsNonOpaqueShadow:](self->_imageStackConfig, "setAllowsNonOpaqueShadow:", a3);
}

- (int64_t)selectionStyle
{
  return -[_UIStackedImageContainerLayer _selectionStyle](self->_imageStackLayer, "_selectionStyle");
}

- (void)setSelectionStyle:(int64_t)a3
{
  -[_UIStackedImageContainerLayer _setSelectionStyle:](self->_imageStackLayer, "_setSelectionStyle:", a3);
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

    -[VUIStackedImageView _updateImageSamplingOverlays](self, "_updateImageSamplingOverlays");
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

    -[VUIStackedImageView _updateImageSamplingOverlays](self, "_updateImageSamplingOverlays");
  }

}

- (BOOL)isSelected
{
  return -[_UIStackedImageContainerLayer isSelected](self->_imageStackLayer, "isSelected");
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

  -[VUIStackedImageView setFocusDirection:](self, "setFocusDirection:", v8, v11);
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

  v10[2] = *MEMORY[0x1E0C80C00];
  motionEffectGroup = self->_motionEffectGroup;
  if (!motionEffectGroup)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA6A8]), "initWithKeyPath:type:", CFSTR("focusDirectionX"), 0);
    objc_msgSend(v4, "setMinimumRelativeValue:", &unk_1E9F3E140);
    objc_msgSend(v4, "setMaximumRelativeValue:", &unk_1E9F3E150);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA6A8]), "initWithKeyPath:type:", CFSTR("focusDirectionY"), 1);
    objc_msgSend(v5, "setMinimumRelativeValue:", &unk_1E9F3E140);
    objc_msgSend(v5, "setMaximumRelativeValue:", &unk_1E9F3E150);
    v6 = (UIMotionEffectGroup *)objc_alloc_init(MEMORY[0x1E0CEA778]);
    v7 = self->_motionEffectGroup;
    self->_motionEffectGroup = v6;

    v8 = self->_motionEffectGroup;
    v10[0] = v4;
    v10[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMotionEffectGroup setMotionEffects:](v8, "setMotionEffects:", v9);

    motionEffectGroup = self->_motionEffectGroup;
  }
  -[VUIStackedImageView addMotionEffect:](self, "addMotionEffect:", motionEffectGroup);
}

- (void)_detachMotionEffects
{
  -[VUIStackedImageView removeMotionEffect:](self, "removeMotionEffect:", self->_motionEffectGroup);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[_UIStackedImageContainerLayer setSelected:](self->_imageStackLayer, "setSelected:");
  -[VUIStackedImageView setFocused:](self, "setFocused:", v3);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[_UIStackedImageContainerLayer setSelected:animated:](self->_imageStackLayer, "setSelected:animated:");
  -[UIView vui_setSelected:animated:withAnimationCoordinator:](self->_overlayView, "vui_setSelected:animated:withAnimationCoordinator:", v5, v4, 0);
  -[VUIStackedImageView setFocused:](self, "setFocused:", v5);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _UIStackedImageContainerLayer *imageStackLayer;
  id v9;

  v5 = a4;
  v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  v9 = a5;
  -[_UIStackedImageContainerLayer setSelected:animated:focusAnimationCoordinator:](imageStackLayer, "setSelected:animated:focusAnimationCoordinator:", v6, v5, v9);
  -[UIView vui_setSelected:animated:withAnimationCoordinator:](self->_overlayView, "vui_setSelected:animated:withAnimationCoordinator:", v6, v5, v9);

  -[VUIStackedImageView setFocused:](self, "setFocused:", v6);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _UIStackedImageContainerLayer *imageStackLayer;
  id v9;

  v5 = a4;
  v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  v9 = a5;
  -[_UIStackedImageContainerLayer setSelected:animated:focusAnimationCoordinator:](imageStackLayer, "setSelected:animated:focusAnimationCoordinator:", v6, v5, v9);
  -[UIView vui_setSelected:animated:withAnimationCoordinator:](self->_overlayView, "vui_setSelected:animated:withAnimationCoordinator:", v6, v5, v9);

  -[VUIStackedImageView setFocused:](self, "setFocused:", v6);
}

- (void)setFocused:(BOOL)a3
{
  if (a3)
    -[VUIStackedImageView _attachMotionEffects](self, "_attachMotionEffects");
  else
    -[VUIStackedImageView _detachMotionEffects](self, "_detachMotionEffects");
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

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[_UIStackedImageContainerLayer setPressed:animated:completion:](self->_imageStackLayer, "setPressed:animated:completion:", a3, a4, a5);
}

- (void)setPressed:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  _BOOL8 v6;
  _UIStackedImageContainerLayer *imageStackLayer;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a3;
  imageStackLayer = self->_imageStackLayer;
  v9 = a5;
  v19 = v9;
  if (a4 >= 0.0)
  {
    -[_UIStackedImageContainerLayer configuration](imageStackLayer, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pressedDuration");
    v12 = v11;

    -[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPressedDuration:", a4);

    -[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unpressedDuration");
    v16 = v15;

    -[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUnpressedDuration:", a4);

    -[_UIStackedImageContainerLayer setPressed:animated:completion:](self->_imageStackLayer, "setPressed:animated:completion:", v6, 1, v19);
    -[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPressedDuration:", v12);

    -[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUnpressedDuration:", v16);
  }
  else
  {
    -[_UIStackedImageContainerLayer setPressed:animated:completion:](imageStackLayer, "setPressed:animated:completion:", v6, 1, v9);
  }

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

- (unint64_t)controlState
{
  return -[_UIStackedImageContainerLayer controlState](self->_imageStackLayer, "controlState");
}

- (void)setControlState:(unint64_t)a3
{
  -[_UIStackedImageContainerLayer setControlState:](self->_imageStackLayer, "setControlState:", a3);
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
  -[_UIStackedImageContainerLayer setControlState:animated:](self->_imageStackLayer, "setControlState:animated:", a3, a4);
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  -[_UIStackedImageContainerLayer setControlState:animated:focusAnimationCoordinator:](self->_imageStackLayer, "setControlState:animated:focusAnimationCoordinator:", a3, a4, a5);
}

- (unint64_t)primaryControlState
{
  return -[_UIStackedImageContainerLayer _primaryControlStateForState:](self->_imageStackLayer, "_primaryControlStateForState:", -[VUIStackedImageView controlState](self, "controlState"));
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  if (a3.width == 0.0 || (height = a3.height, a3.height == 0.0))
  {
    -[VUIStackedImageView stackSize](self, "stackSize");
    width = v6;
    height = v7;
  }
  else
  {
    width = a3.width;
  }
  v8 = (void *)objc_opt_class();
  -[_UIStackedImageConfiguration scaleSizeIncrease](self->_imageStackConfig, "scaleSizeIncrease");
  objc_msgSend(v8, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", -[VUIStackedImageView selectionStyle](self, "selectionStyle"), width, height, v9);
  v11 = floor((v10 - width) * 0.5);
  v13 = floor((v12 - height) * 0.5);
  v14 = v11;
  v15 = v13;
  result.right = v11;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)animateWithAuxiliarySelectionState:(BOOL)a3 animations:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _UIStackedImageConfiguration *imageStackConfig;
  id v9;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    v9 = v6;
    v7 = (void *)MEMORY[0x1E0CEABB0];
    imageStackConfig = self->_imageStackConfig;
    if (v4)
      -[_UIStackedImageConfiguration layerSelectionDuration](imageStackConfig, "layerSelectionDuration");
    else
      -[_UIStackedImageConfiguration layerUnselectionDuration](imageStackConfig, "layerUnselectionDuration");
    objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 327684, v9, 0);
    v6 = v9;
  }

}

- (id)_newImageConfiguration
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CEAEB8], "newStandardConfiguration");
  objc_msgSend(v2, "setMaximumParallaxImages:", 6);
  objc_msgSend(v2, "setRadiosityStrength:", 0.0);
  return v2;
}

- (id)_imageConfiguration
{
  return (id)-[_UIStackedImageContainerLayer configuration](self->_imageStackLayer, "configuration");
}

- (id)_layeredImageContainerLayer
{
  return self->_imageStackLayer;
}

- (double)_idleModeFocusSizeOffset
{
  double result;

  -[_UIStackedImageContainerLayer _idleModeFocusSizeOffset](self->_imageStackLayer, "_idleModeFocusSizeOffset");
  return result;
}

- (id)_layerBelowTitles
{
  return (id)-[_UIStackedImageContainerLayer _layerBelowTitles](self->_imageStackLayer, "_layerBelowTitles");
}

- (void)_loadImage
{
  VUIStackedImageNamedLayerStack *v3;
  VUIStackedImageNamedLayerStack *uiLayerStack;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  double height;
  double width;
  id v11;
  VUIImageProxy *imageProxy;
  id *v13;
  UIImage *staticImage;
  CGImage *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD);
  double v24;
  double v25;
  NSObject *v26;
  _QWORD v27[4];
  void (**v28)(_QWORD, _QWORD);
  double v29;
  double v30;
  CGImage *v31;
  _QWORD v32[4];
  id v33;
  id v34[4];
  _QWORD v35[4];
  id v36;
  id v37;
  id v38[3];
  id from;
  id location;

  v3 = (VUIStackedImageNamedLayerStack *)objc_opt_new();
  uiLayerStack = self->_uiLayerStack;
  self->_uiLayerStack = v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStackedImageNamedLayerStack setName:](self->_uiLayerStack, "setName:", v6);

  -[VUIStackedImageNamedLayerStack setSize:](self->_uiLayerStack, "setSize:", self->_stackSize.width, self->_stackSize.height);
  -[VUIStackedImageNamedLayerStack setScale:](self->_uiLayerStack, "setScale:", 1.0);
  -[VUIStackedImageNamedLayerStack setFlattenedImage:](self->_uiLayerStack, "setFlattenedImage:", 0);
  -[VUIStackedImageNamedLayerStack setLayers:](self->_uiLayerStack, "setLayers:", MEMORY[0x1E0C9AA60]);
  -[VUIStackedImageNamedLayerStack setRadiosityImage:](self->_uiLayerStack, "setRadiosityImage:", 0);
  -[VUIStackedImageNamedLayerStack setRadiosityImageScale:](self->_uiLayerStack, "setRadiosityImageScale:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v7 = !+[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread")&& -[VUIStackedImageView selectionStyle](self, "selectionStyle") != 1;
  -[VUIStackedImageNamedLayerStack setFlatImageContainsCornerRadius:](self->_uiLayerStack, "setFlatImageContainsCornerRadius:", v7);
  -[_UIStackedImageContainerLayer setLayerStack:](self->_imageStackLayer, "setLayerStack:", self->_uiLayerStack);
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_imageProxy);
  v8 = (void *)-[VUIStackedImageNamedLayerStack copy](self->_uiLayerStack, "copy");
  width = self->_stackSize.width;
  height = self->_stackSize.height;
  v11 = objc_loadWeakRetained(&from);

  if (v11)
  {
    -[VUIImageProxy setCacheOnLoad:](self->_imageProxy, "setCacheOnLoad:", +[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread") ^ 1);
    imageProxy = self->_imageProxy;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __33__VUIStackedImageView__loadImage__block_invoke;
    v35[3] = &unk_1E9F2BF28;
    v13 = &v37;
    objc_copyWeak(&v37, &from);
    objc_copyWeak(v38, &location);
    v36 = v8;
    v38[1] = *(id *)&width;
    v38[2] = *(id *)&height;
    -[VUIImageProxy setCompletionHandler:](imageProxy, "setCompletionHandler:", v35);
    -[VUIImageProxy setImageDirection:](self->_imageProxy, "setImageDirection:", -[VUIStackedImageView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1);
    -[VUIImageProxy load](self->_imageProxy, "load");

    objc_destroyWeak(v38);
  }
  else
  {
    staticImage = self->_staticImage;
    if (!staticImage)
    {
      -[VUIStackedImageView setImageLoaded:](self, "setImageLoaded:", 1);
      goto LABEL_14;
    }
    v15 = -[UIImage CGImage](staticImage, "CGImage");
    v16 = (void *)objc_opt_class();
    -[VUIStackedImageView focusSizeIncrease](self, "focusSizeIncrease");
    objc_msgSend(v16, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", -[VUIStackedImageView selectionStyle](self, "selectionStyle"), width, height, v17);
    v19 = v18;
    v21 = v20;
    v22 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __33__VUIStackedImageView__loadImage__block_invoke_3;
    v32[3] = &unk_1E9F2BF50;
    v13 = v34;
    objc_copyWeak(v34, &location);
    v34[1] = v15;
    v33 = v8;
    v34[2] = *(id *)&width;
    v34[3] = *(id *)&height;
    v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF08E588](v32);
    -[UIImage size](self->_staticImage, "size");
    if (v19 == v25 && v21 == v24
      || !+[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread"))
    {
      ((void (**)(_QWORD, CGImage *))v23)[2](v23, v15);
    }
    else
    {
      dispatch_get_global_queue(21, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27[0] = v22;
      v27[1] = 3221225472;
      v27[2] = __33__VUIStackedImageView__loadImage__block_invoke_4;
      v27[3] = &unk_1E9F2BFA0;
      v29 = v19;
      v30 = v21;
      v31 = v15;
      v28 = v23;
      dispatch_async(v26, v27);

    }
  }
  objc_destroyWeak(v13);
LABEL_14:

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __33__VUIStackedImageView__loadImage__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "setEnableCache:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "image");
  v12 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v12, "_updateLayerStack:withImage:size:", *(_QWORD *)(a1 + 32), v11, *(double *)(a1 + 56), *(double *)(a1 + 64));

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __33__VUIStackedImageView__loadImage__block_invoke_2;
  v16[3] = &unk_1E9F2B700;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  v13 = WeakRetained;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  v21 = a4;
  v19 = *(id *)(a1 + 32);
  v15 = (void (**)(_QWORD))MEMORY[0x1DF08E588](v16);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v15[2](v15);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  objc_destroyWeak(&v20);
}

void __33__VUIStackedImageView__loadImage__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "imageProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
    if (v4)
    {
      if (*(_QWORD *)(a1 + 40) && *(_BYTE *)(a1 + 64))
        objc_msgSend(v5, "_commitLayerStack:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v5, "setImageLoaded:", *(unsigned __int8 *)(a1 + 64));
      WeakRetained = v5;
    }
  }

}

void __33__VUIStackedImageView__loadImage__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  BOOL v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_msgSend(WeakRetained[52], "CGImage") == *(_QWORD *)(a1 + 48);
    WeakRetained = v6;
    if (v5)
    {
      objc_msgSend(v6, "_updateLayerStack:withImage:size:", *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 56), *(double *)(a1 + 64));
      objc_msgSend(v6, "_commitLayerStack:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v6, "setImageLoaded:", 1);
      WeakRetained = v6;
    }
  }

}

void __33__VUIStackedImageView__loadImage__block_invoke_4(uint64_t a1)
{
  void *v2;
  CGImage *v3;
  _QWORD v4[4];
  id v5;
  CGImage *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = VUICompositeBitmapImageOfSizeForImages(v2, 0, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), 0.0);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__VUIStackedImageView__loadImage__block_invoke_5;
  v4[3] = &unk_1E9F2BF78;
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __33__VUIStackedImageView__loadImage__block_invoke_5(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(void **)(a1 + 40);
  if (v2)

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
  v15[1] = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImageObj:", v13);

  objc_msgSend(v12, "setImage:", a4);
  objc_msgSend(v12, "setName:", CFSTR("0"));
  objc_msgSend(v12, "setOpacity:", 1.0);
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, width, height);
  if (v12)
  {
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayers:", v14);

  }
  else
  {
LABEL_6:
    objc_msgSend(v8, "setLayers:", MEMORY[0x1E0C9AA60]);
  }

}

- (void)_commitLayerStack:(id)a3
{
  VUIStackedImageNamedLayerStack *v4;
  uint64_t v5;
  VUIStackedImageNamedLayerStack *uiLayerStack;
  VUIStackedImageNamedLayerStack *v7;
  id v8;

  v4 = (VUIStackedImageNamedLayerStack *)a3;
  v5 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  uiLayerStack = self->_uiLayerStack;
  self->_uiLayerStack = v4;
  v7 = v4;

  -[_UIStackedImageContainerLayer setLayerStack:](self->_imageStackLayer, "setLayerStack:", self->_uiLayerStack);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v5);
  -[VUIStackedImageView _updateImageSamplingOverlays](self, "_updateImageSamplingOverlays");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:", CFSTR("VUIStackedImageViewImageDidUpdateNotification"), self);
}

- (void)_updateImageSamplingOverlays
{
  int v3;
  int v4;
  BOOL v5;
  CGImage *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = -[UIView conformsToProtocol:](self->_overlayView, "conformsToProtocol:", &unk_1F0204170);
  v4 = -[UIView conformsToProtocol:](self->_unmaskedOverlayView, "conformsToProtocol:", &unk_1F0204170);
  if (-[VUIStackedImageNamedLayerStack flattenedImage](self->_uiLayerStack, "flattenedImage"))
    v5 = (v3 | v4) == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = -[VUIStackedImageNamedLayerStack flattenedImage](self->_uiLayerStack, "flattenedImage");
    v7 = (void *)objc_opt_class();
    -[VUIStackedImageNamedLayerStack size](self->_uiLayerStack, "size");
    v9 = v8;
    v11 = v10;
    -[_UIStackedImageConfiguration scaleSizeIncrease](self->_imageStackConfig, "scaleSizeIncrease");
    objc_msgSend(v7, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", -[VUIStackedImageView selectionStyle](self, "selectionStyle"), v9, v11, v12);
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v6, 0, (double)CGImageGetWidth(v6) / v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = (void *)v14;
    if (v3)
    {
      -[UIView sampleWithImage:](self->_overlayView, "sampleWithImage:", v14);
      v15 = v16;
    }
    if (v4)
    {
      -[UIView sampleWithImage:](self->_unmaskedOverlayView, "sampleWithImage:", v16);
      v15 = v16;
    }

  }
}

- (void)_setShadowOpacity:(double)a3
{
  -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](self->_imageStackConfig, "setDefaultFocusedShadowOpacity:");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowOpacity:](self->_imageStackConfig, "setDefaultHighlightedShadowOpacity:", a3);
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowOpacity:](self->_imageStackConfig, "setDefaultUnfocusedShadowOpacity:", a3);
}

- (void)_setShadowRadius:(double)a3
{
  -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](self->_imageStackConfig, "setDefaultFocusedShadowRadius:");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowRadius:](self->_imageStackConfig, "setDefaultHighlightedShadowRadius:", a3);
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowRadius:](self->_imageStackConfig, "setDefaultUnfocusedShadowRadius:", a3);
}

- (void)_setShadowVerticalOffset:(double)a3
{
  -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](self->_imageStackConfig, "setDefaultFocusedShadowVerticalOffset:");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowVerticalOffset:](self->_imageStackConfig, "setDefaultHighlightedShadowVerticalOffset:", a3);
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowVerticalOffset:](self->_imageStackConfig, "setDefaultUnfocusedShadowVerticalOffset:", a3);
}

- (void)_resetShadowSettings
{
  _UIStackedImageConfiguration *imageStackConfig;
  _UIStackedImageConfiguration *v4;
  _UIStackedImageConfiguration *v5;
  _UIStackedImageConfiguration *v6;
  _UIStackedImageConfiguration *v7;
  _UIStackedImageConfiguration *v8;
  _UIStackedImageConfiguration *v9;
  _UIStackedImageConfiguration *v10;
  _UIStackedImageConfiguration *v11;
  id v12;

  v12 = -[VUIStackedImageView _newImageConfiguration](self, "_newImageConfiguration");
  imageStackConfig = self->_imageStackConfig;
  objc_msgSend(v12, "defaultFocusedShadowOpacity");
  -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](imageStackConfig, "setDefaultFocusedShadowOpacity:");
  v4 = self->_imageStackConfig;
  objc_msgSend(v12, "defaultHighlightedShadowOpacity");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowOpacity:](v4, "setDefaultHighlightedShadowOpacity:");
  v5 = self->_imageStackConfig;
  objc_msgSend(v12, "defaultUnfocusedShadowOpacity");
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowOpacity:](v5, "setDefaultUnfocusedShadowOpacity:");
  v6 = self->_imageStackConfig;
  objc_msgSend(v12, "defaultFocusedShadowRadius");
  -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](v6, "setDefaultFocusedShadowRadius:");
  v7 = self->_imageStackConfig;
  objc_msgSend(v12, "defaultHighlightedShadowRadius");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowRadius:](v7, "setDefaultHighlightedShadowRadius:");
  v8 = self->_imageStackConfig;
  objc_msgSend(v12, "defaultUnfocusedShadowRadius");
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowRadius:](v8, "setDefaultUnfocusedShadowRadius:");
  v9 = self->_imageStackConfig;
  objc_msgSend(v12, "defaultFocusedShadowVerticalOffset");
  -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](v9, "setDefaultFocusedShadowVerticalOffset:");
  v10 = self->_imageStackConfig;
  objc_msgSend(v12, "defaultHighlightedShadowVerticalOffset");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowVerticalOffset:](v10, "setDefaultHighlightedShadowVerticalOffset:");
  v11 = self->_imageStackConfig;
  objc_msgSend(v12, "defaultUnfocusedShadowVerticalOffset");
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowVerticalOffset:](v11, "setDefaultUnfocusedShadowVerticalOffset:");

}

- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4
{
  -[_UIStackedImageContainerLayer _setFocusDirection:duration:](self->_imageStackLayer, "_setFocusDirection:duration:", a3.x, a3.y, a4);
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
    v3 = -[VUIStackedImageView _newImageConfiguration](self, "_newImageConfiguration");
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

+ (CGSize)_scaledSizeForSize:(CGSize)a3 selectionStyle:(int64_t)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CEAEB8], "newStandardConfiguration");
  objc_msgSend(v8, "scaleSizeIncrease");
  objc_msgSend(a1, "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", a4, width, height, v9);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (CGSize)_scaledSizeForSize:(CGSize)a3 focusSizeIncrease:(double)a4 selectionStyle:(int64_t)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEAEC0], "_scaledSizeForSize:focusSizeIncrease:selectionStyle:", a5, a3.width, a3.height, a4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return (id)-[_UIStackedImageConfiguration focusAnimationConfiguration](self->_imageStackConfig, "focusAnimationConfiguration", a3, a4);
}

- (VUIImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (CGSize)stackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_stackSize.width;
  height = self->_stackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setStackSize:(CGSize)a3
{
  self->_stackSize = a3;
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

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void)setImageLoaded:(BOOL)a3
{
  self->_imageLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmaskedOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_motionEffectGroup, 0);
  objc_storeStrong((id *)&self->_uiLayerStack, 0);
  objc_storeStrong((id *)&self->_imageStackConfig, 0);
  objc_storeStrong((id *)&self->_imageStackLayer, 0);
  objc_storeStrong((id *)&self->_staticImage, 0);
}

@end

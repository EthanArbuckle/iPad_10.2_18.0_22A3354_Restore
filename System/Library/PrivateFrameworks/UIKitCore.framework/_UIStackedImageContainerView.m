@implementation _UIStackedImageContainerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIStackedImageContainerView)initWithFrame:(CGRect)a3
{
  _UIStackedImageContainerView *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStackedImageContainerView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[_UIStackedImageConfiguration newStandardConfiguration](_UIStackedImageConfiguration, "newStandardConfiguration");
    -[_UIStackedImageContainerView setConfig:](v3, "setConfig:", v4);
    v3->_installsMotionEffectsWhenFocused = 1;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayerStack:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIStackedImageContainerView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIStackedImageContainerView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIStackedImageContainerView _updateFocusedFrameGuideConstraintsIfApplicable](self, "_updateFocusedFrameGuideConstraintsIfApplicable");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIStackedImageContainerView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIStackedImageContainerView _updateFocusedFrameGuideConstraintsIfApplicable](self, "_updateFocusedFrameGuideConstraintsIfApplicable");
}

- (void)_updateContainerLayerImages
{
  void *v3;
  UINamedLayerStack *v4;
  UINamedLayerStack *constructedStackImage;
  _UIStackedImageSingleNamedLayerImage *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIStackedImageSingleNamedStack *v10;

  -[UIImage _primitiveImageAsset](self->_stackImage, "_primitiveImageAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_layerStack");
  v4 = (UINamedLayerStack *)objc_claimAutoreleasedReturnValue();
  constructedStackImage = v4;
  if (!v4)
    constructedStackImage = self->_constructedStackImage;
  v10 = constructedStackImage;

  if (!v10)
  {
    if (self->_stackImage)
    {
      v6 = objc_alloc_init(_UIStackedImageSingleNamedLayerImage);
      -[_UIStackedImageSingleNamedLayerImage setImageObj:](v6, "setImageObj:", self->_stackImage);
      v10 = objc_alloc_init(_UIStackedImageSingleNamedStack);
      -[_UIStackedImageSingleNamedStack setLayerImage:](v10, "setLayerImage:", v6);

    }
    else
    {
      v10 = 0;
    }
  }
  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStackedImageContainerView config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v8);

  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLayerStack:", v10);

}

- (void)setConfig:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[_UIStackedImageConfiguration isEqual:](self->_config, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_config, a3);
    -[_UIStackedImageContainerView _updateContainerLayerImages](self, "_updateContainerLayerImages");
    -[_UIStackedImageContainerView _updateFocusedFrameGuideConstraintsIfApplicable](self, "_updateFocusedFrameGuideConstraintsIfApplicable");
  }

}

- (void)setStackImage:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIImage isEqual:](self->_stackImage, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_stackImage, a3);
    -[_UIStackedImageContainerView _updateContainerLayerImages](self, "_updateContainerLayerImages");
  }

}

- (void)setConstructedStackImage:(id)a3
{
  UINamedLayerStack *v5;
  UINamedLayerStack *v6;

  v5 = (UINamedLayerStack *)a3;
  if (self->_constructedStackImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_constructedStackImage, a3);
    -[_UIStackedImageContainerView _updateContainerLayerImages](self, "_updateContainerLayerImages");
    v5 = v6;
  }

}

- (BOOL)isStackFocused
{
  void *v2;
  int v3;

  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "controlState");

  return (*(_QWORD *)&v3 & 0x10008) != 0;
}

- (void)setStackFocused:(BOOL)a3
{
  -[_UIStackedImageContainerView _setStackFocused:animated:focusAnimationCoordinator:](self, "_setStackFocused:animated:focusAnimationCoordinator:", a3, 1, 0);
}

- (void)setStackFocused:(BOOL)a3 withFocusAnimationCoordinator:(id)a4
{
  -[_UIStackedImageContainerView _setStackFocused:animated:focusAnimationCoordinator:](self, "_setStackFocused:animated:focusAnimationCoordinator:", a3, 1, a4);
}

- (void)_setStackFocused:(BOOL)a3 animated:(BOOL)a4 focusAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "controlState");

  if (v6)
  {
    v11 = v10 | 8;
    -[_UIStackedImageContainerView _installMotionEffects](self, "_installMotionEffects");
  }
  else
  {
    v11 = v10 & 0xFFFFFFFFFFFFFFF7;
    -[_UIStackedImageContainerView _uninstallMotionEffects](self, "_uninstallMotionEffects");
  }
  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setControlState:animated:focusAnimationCoordinator:", v11, v5, v8);

}

- (BOOL)isPressed
{
  void *v2;
  char v3;

  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "controlState");

  return v3 & 1;
}

- (void)setPressed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "controlState");

  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setControlState:animated:", v6 & 0xFFFFFFFFFFFFFFFELL | v3, 1);

}

- (CGPoint)focusDirection
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusDirection");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  if (-[_UIStackedImageContainerView installsMotionEffectsWhenFocused](self, "installsMotionEffectsWhenFocused")
    && setFocusDirection__once != -1)
  {
    dispatch_once(&setFocusDirection__once, &__block_literal_global_674);
  }
  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFocusDirection:animated:", 1, x, y);

}

- (void)setInstallsMotionEffectsWhenFocused:(BOOL)a3
{
  if (self->_installsMotionEffectsWhenFocused != a3)
  {
    self->_installsMotionEffectsWhenFocused = a3;
    if (a3)
    {
      if (-[_UIStackedImageContainerView isStackFocused](self, "isStackFocused"))
        -[_UIStackedImageContainerView _installMotionEffects](self, "_installMotionEffects");
    }
    else
    {
      -[_UIStackedImageContainerView _uninstallMotionEffects](self, "_uninstallMotionEffects");
    }
  }
}

- (void)_installMotionEffects
{
  UIInterpolatingMotionEffect *v3;
  UIInterpolatingMotionEffect *v4;
  UIMotionEffectGroup *v5;
  UIMotionEffectGroup *stackMotionEffects;
  UIMotionEffectGroup *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!self->_stackMotionEffects)
  {
    if (-[_UIStackedImageContainerView installsMotionEffectsWhenFocused](self, "installsMotionEffectsWhenFocused"))
    {
      v3 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("focusDirectionX"), 0);
      -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v3, "setMinimumRelativeValue:", &unk_1E1A963D0);
      -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v3, "setMaximumRelativeValue:", &unk_1E1A963E0);
      v4 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("focusDirectionY"), 1);
      -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v4, "setMinimumRelativeValue:", &unk_1E1A963D0);
      -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v4, "setMaximumRelativeValue:", &unk_1E1A963E0);
      v5 = objc_alloc_init(UIMotionEffectGroup);
      stackMotionEffects = self->_stackMotionEffects;
      self->_stackMotionEffects = v5;

      v7 = self->_stackMotionEffects;
      v9[0] = v3;
      v9[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMotionEffectGroup setMotionEffects:](v7, "setMotionEffects:", v8);

      -[UIView addMotionEffect:](self, "addMotionEffect:", self->_stackMotionEffects);
    }
  }
}

- (void)_updateOverlayLayer
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[UIView clipsToBounds](self->_overlayView, "clipsToBounds");
  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_setUnmaskedOverlayLayer:", 0);

    -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_overlayView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setOverlayLayer:", v6);
  }
  else
  {
    objc_msgSend(v4, "_setOverlayLayer:", 0);

    -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_overlayView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setUnmaskedOverlayLayer:", v6);
  }

}

- (void)setOverlayView:(id)a3
{
  UIView *v5;
  UIView **p_overlayView;
  UIView *v7;

  v5 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  if (self->_overlayView != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIView setOverlayViewDelegate:](*p_overlayView, "setOverlayViewDelegate:", 0);
    objc_storeStrong((id *)&self->_overlayView, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIView setOverlayViewDelegate:](*p_overlayView, "setOverlayViewDelegate:", self);
    -[_UIStackedImageContainerView _updateOverlayLayer](self, "_updateOverlayLayer");
    v5 = v7;
  }

}

- (void)_uninstallMotionEffects
{
  UIMotionEffectGroup *stackMotionEffects;

  if (self->_stackMotionEffects)
  {
    -[UIView removeMotionEffect:](self, "removeMotionEffect:");
    stackMotionEffects = self->_stackMotionEffects;
    self->_stackMotionEffects = 0;

  }
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
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("focusDirectionX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "objectForKey:", CFSTR("focusDirectionY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  -[_UIStackedImageContainerView _imageContainerLayer](self, "_imageContainerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFocusDirection:animated:", 1, v8, v11);

  return 1;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  void *v4;
  void *v5;

  -[_UIStackedImageContainerView config](self, "config", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusAnimationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_focusedFrameGuide
{
  return -[_UIStackedImageContainerView _focusedFrameGuideCreateIfNecessary:](self, "_focusedFrameGuideCreateIfNecessary:", 1);
}

- (id)_focusedFrameGuideCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  UILayoutGuide *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v3 = a3;
  v15[4] = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(self, &_focusedFrameGuideCreateIfNecessary__focusedFrameGuideKey_0);
  v5 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    v5 = objc_alloc_init(UILayoutGuide);
    objc_setAssociatedObject(self, &_focusedFrameGuideCreateIfNecessary__focusedFrameGuideKey_0, v5, (void *)1);
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v5);
    -[UILayoutGuide _setLockedToOwningView:](v5, "_setLockedToOwningView:", 1);
    -[UILayoutGuide setIdentifier:](v5, "setIdentifier:", CFSTR("_UIStackedImageContainerViewFocusedFrameGuide"));
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v5, 3, 0, self, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v5, 1, 0, self, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", self, 4, 0, v5, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", self, 2, 0, v5, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", CFSTR("focusedFrameGuide-topConstraint"));
    objc_msgSend(v8, "setIdentifier:", CFSTR("focusedFrameGuide-leftConstraint"));
    objc_msgSend(v9, "setIdentifier:", CFSTR("focusedFrameGuide-bottomConstraint"));
    objc_msgSend(v10, "setIdentifier:", CFSTR("focusedFrameGuide-rightConstraint"));
    v15[0] = v7;
    v15[1] = v8;
    v15[2] = v9;
    v15[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](v5, "_setSystemConstraints:", v11);

    -[_UIStackedImageContainerView _updateFocusedFrameGuideConstraintsIfApplicable](self, "_updateFocusedFrameGuideConstraintsIfApplicable");
    v12 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](v5, "_systemConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v13);

  }
  return v5;
}

- (void)_updateFocusedFrameGuideConstraintsIfApplicable
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  id v32;

  -[_UIStackedImageContainerView _focusedFrameGuideCreateIfNecessary:](self, "_focusedFrameGuideCreateIfNecessary:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v32 = v3;
    -[_UIStackedImageContainerView config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaleSizeIncrease");
    v6 = v5;

    -[UIView bounds](self, "bounds");
    v9 = 0.0;
    if (v7 <= 0.0)
    {
      v10 = 0.0;
      v11 = v32;
    }
    else
    {
      v10 = 0.0;
      v11 = v32;
      if (v8 > 0.0)
      {
        v12 = v7 <= v8;
        v13 = v6 * -0.5 * (v7 / v8);
        v14 = v6 * -0.5 * (v8 / v7);
        if (v12)
          v9 = v13;
        else
          v9 = v6 * -0.5;
        if (v12)
          v10 = v6 * -0.5;
        else
          v10 = v14;
      }
    }
    objc_msgSend(v11, "_systemConstraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constant");
    v18 = v17;

    if (v18 != v10)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setConstant:", v10);

    }
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constant");
    v22 = v21;

    if (v22 != v9)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setConstant:", v9);

    }
    objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constant");
    v26 = v25;

    if (v26 != v10)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setConstant:", v10);

    }
    objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constant");
    v30 = v29;

    if (v30 != v9)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setConstant:", v9);

    }
    v3 = v32;
  }

}

- (UIImage)stackImage
{
  return self->_stackImage;
}

- (UINamedLayerStack)constructedStackImage
{
  return self->_constructedStackImage;
}

- (_UIStackedImageConfiguration)config
{
  return self->_config;
}

- (BOOL)installsMotionEffectsWhenFocused
{
  return self->_installsMotionEffectsWhenFocused;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_constructedStackImage, 0);
  objc_storeStrong((id *)&self->_stackImage, 0);
  objc_storeStrong((id *)&self->_stackMotionEffects, 0);
}

@end

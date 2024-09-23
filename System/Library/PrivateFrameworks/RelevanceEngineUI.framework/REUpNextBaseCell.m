@implementation REUpNextBaseCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    kActiveLayout_0_5 = 0x4018000000000000;
}

+ (id)_shadowImage
{
  if (_shadowImage_onceToken != -1)
    dispatch_once(&_shadowImage_onceToken, &__block_literal_global_5);
  return (id)_shadowImage_shadowImage;
}

void __32__REUpNextBaseCell__shadowImage__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("platter_shadow"), v1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, *(double *)&kActiveLayout_0_5, 0.0, *(double *)&kActiveLayout_0_5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_shadowImage_shadowImage;
  _shadowImage_shadowImage = v2;

}

- (REUpNextBaseCell)initWithFrame:(CGRect)a3
{
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)REUpNextBaseCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v3 + 100);
    *((_QWORD *)v3 + 100) = v4;

    objc_msgSend((id)objc_opt_class(), "_shadowImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    *((_QWORD *)v3 + 81) = v7;
    *((_QWORD *)v3 + 82) = v8;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v6);
    v10 = (void *)*((_QWORD *)v3 + 83);
    *((_QWORD *)v3 + 83) = v9;

    objc_msgSend(*((id *)v3 + 83), "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setZPosition:", -2.0);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v3 + 84);
    *((_QWORD *)v3 + 84) = v12;

    objc_msgSend(*((id *)v3 + 84), "setAllowsGroupBlending:", 0);
    v14 = (void *)*((_QWORD *)v3 + 84);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    objc_msgSend(v14, "setContentsScale:");

    v16 = objc_alloc(MEMORY[0x24BDF6F90]);
    v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v18 = (void *)*((_QWORD *)v3 + 85);
    *((_QWORD *)v3 + 85) = v17;

    v19 = (void *)*((_QWORD *)v3 + 85);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    objc_msgSend(*((id *)v3 + 85), "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setZPosition:", 1.0);

    *((_QWORD *)v3 + 87) = 0;
    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 83));
    objc_msgSend(v3, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackgroundColor:", v23);

    objc_msgSend(v3, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", *((_QWORD *)v3 + 85));

    objc_msgSend(v3, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", *((_QWORD *)v3 + 84));

    objc_msgSend(*((id *)v3 + 84), "setZPosition:", -2.0);
    v26 = *MEMORY[0x24BDE58E8];
    objc_msgSend(*((id *)v3 + 84), "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    objc_msgSend(*((id *)v3 + 84), "setCornerRadius:", *(double *)&kActiveLayout_0_5);
    objc_msgSend(*((id *)v3 + 84), "setMasksToBounds:", 1);
    objc_msgSend(*((id *)v3 + 85), "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerCurve:", v26);

    objc_msgSend(*((id *)v3 + 85), "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setCornerRadius:", *(double *)&kActiveLayout_0_5);

    objc_msgSend(*((id *)v3 + 85), "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMasksToBounds:", 1);

    *((_QWORD *)v3 + 90) = 0;
    v30 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)(v3 + 728) = *MEMORY[0x24BDF7718];
    *(_OWORD *)(v3 + 744) = v30;
    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v3, sel_didLongPress_);
    v32 = (void *)*((_QWORD *)v3 + 86);
    *((_QWORD *)v3 + 86) = v31;

    objc_msgSend(*((id *)v3 + 86), "setDelegate:", v3);
    objc_msgSend(*((id *)v3 + 86), "setCancelsTouchesInView:", 0);
    objc_msgSend(v3, "addGestureRecognizer:", *((_QWORD *)v3 + 86));

  }
  return (REUpNextBaseCell *)v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v5 = -[REUpNextBaseCell isHighlighted](self, "isHighlighted");
  v7.receiver = self;
  v7.super_class = (Class)REUpNextBaseCell;
  -[REUpNextBaseCell setHighlighted:](&v7, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    if (v3)
    {
      -[REUpNextBaseCell _updateColorOverlay](self, "_updateColorOverlay");
    }
    else
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __35__REUpNextBaseCell_setHighlighted___block_invoke;
      v6[3] = &unk_24CF79F88;
      v6[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v6, 0.25);
    }
  }
}

uint64_t __35__REUpNextBaseCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateColorOverlay");
}

- (void)didLongPress:(id)a3
{
  id v4;

  -[REUpNextBaseCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellDidLongPress:", self);

}

- (void)setHighlightBehavior:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;

  if (self->_behavior != a3)
  {
    self->_behavior = a3;
    if (a3 == 1)
    {
      -[UIView layer](self->_overlayView, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = -1.0;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        -[REUpNextBaseCell _updateColorOverlay](self, "_updateColorOverlay");
        return;
      }
      -[UIView layer](self->_overlayView, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 0.0;
    }
    objc_msgSend(v4, "setZPosition:", v6);

    goto LABEL_7;
  }
}

- (void)setHighlightInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_overlayInsets.left
    || a3.top != self->_overlayInsets.top
    || a3.right != self->_overlayInsets.right
    || a3.bottom != self->_overlayInsets.bottom)
  {
    self->_overlayInsets = a3;
    -[REUpNextBaseCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REUpNextBaseCell;
  -[REUpNextBaseCell prepareForReuse](&v3, sel_prepareForReuse);
  -[REUpNextBaseCell setContentBrightness:animated:](self, "setContentBrightness:animated:", 0, 1.0);
}

- (void)layoutSubviews
{
  double x;
  double width;
  CGFloat v5;
  double height;
  UIView *overlayView;
  double v8;
  double v9;
  double v10;
  double v11;
  CALayer *imageLayer;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)REUpNextBaseCell;
  -[REUpNextBaseCell layoutSubviews](&v13, sel_layoutSubviews);
  -[REUpNextBaseCell bounds](self, "bounds");
  x = v14.origin.x;
  width = v14.size.width;
  v5 = CGRectGetMaxY(v14) - *(double *)&kActiveLayout_0_5;
  height = self->_shadowSize.height;
  overlayView = self->_overlayView;
  -[REUpNextBaseCell bounds](self, "bounds");
  -[UIView setFrame:](overlayView, "setFrame:", v8 + self->_overlayInsets.left, v9 + self->_overlayInsets.top, v10 - (self->_overlayInsets.left + self->_overlayInsets.right), v11 - (self->_overlayInsets.top + self->_overlayInsets.bottom));
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  imageLayer = self->_imageLayer;
  -[REUpNextBaseCell bounds](self, "bounds");
  -[CALayer setFrame:](imageLayer, "setFrame:");
  -[UIImageView setFrame:](self->_shadowView, "setFrame:", x, v5, width, height);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)setContentBrightness:(double)a3 animated:(BOOL)a4
{
  float contentBrightness;
  float v6;
  _BOOL4 v7;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  contentBrightness = self->_contentBrightness;
  v6 = a3;
  if (vabds_f32(contentBrightness, v6) >= 0.00000011921)
  {
    v7 = a4;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", a3, 1.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", self->_contentBrightness, 1.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("contentsMultiplyColor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setToValue:", v10);
      objc_msgSend(v13, "setFromValue:", v12);
      objc_msgSend(v13, "setDuration:", 0.5);
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTimingFunction:", v14);

      objc_msgSend(v13, "setFillMode:", *MEMORY[0x24BDE5968]);
      -[CALayer addAnimation:forKey:](self->_imageLayer, "addAnimation:forKey:", v13, CFSTR("brightnessBoost"));

    }
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[CALayer setContentsMultiplyColor:](self->_imageLayer, "setContentsMultiplyColor:", v10);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    self->_contentBrightness = a3;
  }
}

- (void)setContentImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  UIImage **p_contentImage;
  void *v9;
  void *v10;
  UIImage *v11;

  v4 = a4;
  v7 = (UIImage *)a3;
  p_contentImage = &self->_contentImage;
  if (self->_contentImage != v7)
  {
    v11 = v7;
    if (!self->_overrideContentImage)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("contents"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setToValue:", -[UIImage CGImage](objc_retainAutorelease(v11), "CGImage"));
        objc_msgSend(v9, "setFromValue:", -[UIImage CGImage](*p_contentImage, "CGImage"));
        objc_msgSend(v9, "setDuration:", 1.0);
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTimingFunction:", v10);

        -[CALayer addAnimation:forKey:](self->_imageLayer, "addAnimation:forKey:", v9, CFSTR("contentsFade"));
      }
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      -[CALayer setContents:](self->_imageLayer, "setContents:", -[UIImage CGImage](objc_retainAutorelease(v11), "CGImage"));
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    }
    objc_storeStrong((id *)p_contentImage, a3);
    v7 = v11;
  }

}

- (void)setOverrideContentImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_overrideContentImage != v5)
  {
    objc_storeStrong((id *)&self->_overrideContentImage, a3);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[CALayer setContents:](self->_imageLayer, "setContents:", -[UIImage CGImage](objc_retainAutorelease(v5), "CGImage"));
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (void)setShadowViewHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIImageView isHidden](self->_shadowView, "isHidden") != a3)
    -[UIImageView setHidden:](self->_shadowView, "setHidden:", v3);
}

- (void)configureWithContent:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_content, a3);
  v5 = a3;
  objc_msgSend(v5, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[REUpNextBaseCell setTintColor:](self, "setTintColor:", v6);
}

- (void)setForegroundTextColorToColor:(id)a3 shouldOverrideContentHeaderColor:(BOOL)a4
{
  UIColor *v6;
  UIColor *defaultTextColor;

  v6 = (UIColor *)objc_msgSend(a3, "copy");
  defaultTextColor = self->_defaultTextColor;
  self->_defaultTextColor = v6;

  self->_shouldOverrideContentHeaderColor = a4;
  -[REUpNextBaseCell defaultTextColorDidChange](self, "defaultTextColorDidChange");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  char v5;
  CALayer *imageLayer;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)REUpNextBaseCell;
  -[REUpNextBaseCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  -[REUpNextBaseCell setHidden:](self, "setHidden:", objc_msgSend(v4, "isHidden"));
  v5 = objc_msgSend(MEMORY[0x24BDF6F90], "_isInAnimationBlock");
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  }
  self->_darkeningAmount = 0.0;
  -[REUpNextBaseCell _updateColorOverlay](self, "_updateColorOverlay");
  if (!self->_overrideContentImage)
  {
    imageLayer = self->_imageLayer;
    objc_msgSend(v4, "unitFrameOnScreen");
    -[CALayer setContentsRect:](imageLayer, "setContentsRect:");
  }
  -[UIImageView setAlpha:](self->_shadowView, "setAlpha:", 1.0);
  if ((v5 & 1) == 0)
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)_updateColorOverlay
{
  unint64_t behavior;
  UIView *overlayView;
  void *v5;
  double v6;
  double v7;
  UIView *v8;
  uint64_t v9;
  UIView *v10;
  id v11;

  if (-[REUpNextBaseCell isHighlighted](self, "isHighlighted"))
  {
    behavior = self->_behavior;
    if (behavior == 1)
    {
      overlayView = self->_overlayView;
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 0.3;
      v7 = 0.1;
    }
    else
    {
      if (behavior)
        return;
      overlayView = self->_overlayView;
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 1.0;
      v7 = 0.25;
    }
    objc_msgSend(v5, "colorWithWhite:alpha:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = overlayView;
  }
  else
  {
    v8 = self->_overlayView;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, self->_darkeningAmount);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v8;
  }
  v11 = (id)v9;
  -[UIView setBackgroundColor:](v10, "setBackgroundColor:");

}

- (id)transitionContext
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (UIImage)contentImage
{
  return self->_contentImage;
}

- (REUpNextCellDelegate)delegate
{
  return (REUpNextCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)overrideContentImage
{
  return self->_overrideContentImage;
}

- (REContent)content
{
  return self->_content;
}

- (NSString)representedElementIdentifier
{
  return self->_representedElementIdentifier;
}

- (void)setRepresentedElementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_representedElementIdentifier, a3);
}

- (UIColor)defaultTextColor
{
  return self->_defaultTextColor;
}

- (BOOL)shouldOverrideContentHeaderColor
{
  return self->_shouldOverrideContentHeaderColor;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextColor, 0);
  objc_storeStrong((id *)&self->_representedElementIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideContentImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentImage, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end

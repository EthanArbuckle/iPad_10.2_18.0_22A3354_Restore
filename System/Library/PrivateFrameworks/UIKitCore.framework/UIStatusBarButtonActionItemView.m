@implementation UIStatusBarButtonActionItemView

- (BOOL)extendsHitTestingFrame
{
  return 0;
}

- (id)_createButton
{
  void *v3;
  double v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  UILongPressGestureRecognizer *v7;
  UILongPressGestureRecognizer *v8;

  +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__pressButton_, 64);
  objc_msgSend(v3, "setShowsTouchWhenHighlighted:", -[UIStatusBarButtonActionItemView showsTouchWhenHighlighted](self, "showsTouchWhenHighlighted"));
  if (-[UIStatusBarButtonActionItemView extendsHitTestingFrame](self, "extendsHitTestingFrame"))
  {
    LODWORD(v4) = -0.5;
    objc_msgSend(v3, "setCharge:", v4);
  }
  v5 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__pressButton_);
  -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &unk_1E1A94868);
  -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", v5);
  -[UIView addSubview:](self, "addSubview:", v3);
  if (-[UIStatusBarButtonActionItemView usesAdvancedActions](self, "usesAdvancedActions"))
  {
    v6 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__doubleTapButton_);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v6, "setNumberOfTapsRequired:", 2);
    -[UIGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", &unk_1E1A94880);
    objc_msgSend(v3, "addGestureRecognizer:", v6);
    v7 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__pressAndHoldButton_);
    -[UIGestureRecognizer setAllowedTouchTypes:](v7, "setAllowedTouchTypes:", &unk_1E1A94898);
    objc_msgSend(v3, "addGestureRecognizer:", v7);
    v8 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__pressAndHoldButton_);
    -[UIGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:", &unk_1E1A948B0);
    -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", v8);

  }
  return v3;
}

- (id)highlightImage
{
  return 0;
}

- (BOOL)allowsUserInteraction
{
  return 1;
}

- (double)updateContentsAndWidth
{
  double v3;
  double v4;
  UIButton *v5;
  UIButton *button;
  UIButton *v7;
  UIButton *externalButton;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UIStatusBarButtonActionItemView;
  -[UIStatusBarItemView updateContentsAndWidth](&v20, sel_updateContentsAndWidth);
  v4 = v3;
  if (!self->_button)
  {
    if (-[UIStatusBarButtonActionItemView allowsUserInteraction](self, "allowsUserInteraction"))
    {
      -[UIStatusBarButtonActionItemView _createButton](self, "_createButton");
      v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
      button = self->_button;
      self->_button = v5;

      if (-[UIStatusBarButtonActionItemView extendsHitTestingFrame](self, "extendsHitTestingFrame"))
      {
        -[UIStatusBarButtonActionItemView _createButton](self, "_createButton");
        v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
        externalButton = self->_externalButton;
        self->_externalButton = v7;

        -[UIView layer](self->_externalButton, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHitTestsAsOpaque:", 1);

      }
    }
  }
  if (-[UIStatusBarButtonActionItemView selected](self, "selected")
    && -[UIStatusBarButtonActionItemView showsTouchWhenHighlighted](self, "showsTouchWhenHighlighted"))
  {
    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    LODWORD(v12) = 1058642330;
  }
  else
  {
    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    LODWORD(v12) = 1.0;
  }
  objc_msgSend(v10, "setOpacity:", v12);

  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == 3)
  {
    if (-[UIView isFocused](self, "isFocused"))
    {
      -[UIStatusBarButtonActionItemView highlightImage](self, "highlightImage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          -[UIStatusBarButtonActionItemView setLayerHighlightImage:](self, "setLayerHighlightImage:", v16);
      }

    }
    else
    {
      -[UIStatusBarButtonActionItemView ringLayer](self, "ringLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeFromSuperlayer");

      -[UIStatusBarButtonActionItemView setRingLayer:](self, "setRingLayer:", 0);
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarButtonActionItemView;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIButton setFrame:](self->_button, "setFrame:");
  if (-[UIStatusBarButtonActionItemView extendsHitTestingFrame](self, "extendsHitTestingFrame"))
  {
    -[UIView _touchSloppinessFactor](self, "_touchSloppinessFactor");
    v4 = v3;
    -[UIView bounds](self, "bounds");
    v7 = CGRectInset(v6, v4 * -10.0, 0.0);
    -[UIButton setFrame:](self->_externalButton, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
  }
}

- (void)_triggerButtonWithAction:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 0x1E16F26E0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UIStatusBarButtonActionItemView buttonType](self, "buttonType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = 0x1E176EAE0;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", 0x1E176EAC0, self, v8);

}

- (void)_pressButton:(id)a3
{
  -[UIStatusBarButtonActionItemView _triggerButtonWithAction:](self, "_triggerButtonWithAction:", 0);
}

- (void)_doubleTapButton:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[UIStatusBarButtonActionItemView _triggerButtonWithAction:](self, "_triggerButtonWithAction:", 1);
}

- (void)_pressAndHoldButton:(id)a3
{
  if (objc_msgSend(a3, "state") == 1)
    -[UIStatusBarButtonActionItemView _triggerButtonWithAction:](self, "_triggerButtonWithAction:", 2);
}

- (int64_t)buttonType
{
  return 0;
}

- (BOOL)showsTouchWhenHighlighted
{
  return 1;
}

- (BOOL)usesAdvancedActions
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  UIButton *externalButton;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarButtonActionItemView;
  if (-[UIView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else if (-[UIStatusBarButtonActionItemView extendsHitTestingFrame](self, "extendsHitTestingFrame"))
  {
    externalButton = self->_externalButton;
    -[UIView convertPoint:fromView:](externalButton, "convertPoint:fromView:", self, x, y);
    v8 = -[UIView pointInside:withEvent:](externalButton, "pointInside:withEvent:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarButtonActionItemView;
  v6 = a3;
  -[UIResponder pressesBegan:withEvent:](&v7, sel_pressesBegan_withEvent_, v6, a4);
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if ((_DWORD)a4)
  {
    -[UIStatusBarButtonActionItemView setSelected:](self, "setSelected:", 1, v7.receiver, v7.super_class);
    -[UIStatusBarButtonActionItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarButtonActionItemView;
  v6 = a3;
  -[UIResponder pressesChanged:withEvent:](&v7, sel_pressesChanged_withEvent_, v6, a4);
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if ((_DWORD)a4)
  {
    -[UIStatusBarButtonActionItemView setSelected:](self, "setSelected:", 0, v7.receiver, v7.super_class);
    -[UIStatusBarButtonActionItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarButtonActionItemView;
  v6 = a3;
  -[UIResponder pressesEnded:withEvent:](&v7, sel_pressesEnded_withEvent_, v6, a4);
  LODWORD(a4) = _UIPressesContainsPressType(v6, 4);

  if ((_DWORD)a4)
  {
    -[UIStatusBarButtonActionItemView setSelected:](self, "setSelected:", 0, v7.receiver, v7.super_class);
    -[UIStatusBarButtonActionItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  }
}

- (CGRect)_contentsImageFrame
{
  void *v3;
  double v4;
  double v5;
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
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  -[UIStatusBarItemView contentsImage](self, "contentsImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v3, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;

  -[UIView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  UIRectCenteredXInRectScale(v4, v5, v8, v10, v12, v14, v16, v18, v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)setLayerHighlightImage:(id)a3
{
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  double v18;
  void *v19;
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
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a3;
  if (!-[UIStatusBarItemView legibilityStyle](self, "legibilityStyle"))
  {
    -[UIStatusBarButtonActionItemView ringLayer](self, "ringLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBarButtonActionItemView setRingLayer:](self, "setRingLayer:", v5);

      v6 = *MEMORY[0x1E0C9D538];
      v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v40, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      v10 = v9;
      v12 = v11;

      -[UIStatusBarButtonActionItemView _contentsImageFrame](self, "_contentsImageFrame");
      v15 = v14 + v13 * 0.5;
      v18 = v17 + v16 * 0.5;
      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scale");
      UIRectCenteredAboutPointScale(v6, v7, v10, v12, v15, v18, v20);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      -[UIStatusBarButtonActionItemView ringLayer](self, "ringLayer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

      -[UIView contentScaleFactor](self, "contentScaleFactor");
      v31 = v30;
      -[UIStatusBarButtonActionItemView ringLayer](self, "ringLayer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setContentsScale:", v31);

      -[UIStatusBarButtonActionItemView ringLayer](self, "ringLayer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "image");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "imageWithRenderingMode:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor externalSystemTealColor](UIColor, "externalSystemTealColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_flatImageWithColor:", v36);
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v33, "setContents:", objc_msgSend(v37, "CGImage"));

      -[UIView layer](self, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBarButtonActionItemView ringLayer](self, "ringLayer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addSublayer:", v39);

    }
  }

}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (CALayer)ringLayer
{
  return self->_ringLayer;
}

- (void)setRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_ringLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_externalButton, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end

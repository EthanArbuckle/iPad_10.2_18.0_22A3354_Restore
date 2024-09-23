@implementation PGButtonView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (UIColor)disabledTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
}

+ (id)buttonWithDelegate:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  +[_PGButton buttonWithType:](_PGButton, "buttonWithType:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[64];
  v5[64] = (id)v6;

  objc_msgSend(v5[64], "setAdjustsImageWhenHighlighted:", 0);
  objc_msgSend(v5[64], "setButtonView:", v5);
  objc_msgSend(v5, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v5[64]);

  objc_storeWeak(v5 + 60, v4);
  objc_msgSend(v5[64], "addTarget:action:forControlEvents:", v5, sel__handleTouchUpInside_, 64);
  objc_msgSend(v5[64], "addTarget:action:forControlEvents:", v5, sel__handleTouchDown_, 1);
  objc_msgSend(v5[64], "addTarget:action:forControlEvents:", v5, sel__handleDragEnter_, 16);
  objc_msgSend(v5[64], "addTarget:action:forControlEvents:", v5, sel__handleDragExit_, 32);
  objc_msgSend(v5[64], "addTarget:action:forControlEvents:", v5, sel__handleTouchUpOrCancel_, 448);
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 44.0, 44.0);
  objc_msgSend(v5, "setEnabled:", 1);
  objc_msgSend(v5, "actualButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actualButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentEdgeInsets");
  objc_msgSend(v4, "buttonView:contentEdgeInsetsForProposedInsets:", v5);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v9, "setContentEdgeInsets:", v12, v14, v16, v18);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v5);
  objc_msgSend(v5, "setPointerInteraction:", v19);
  objc_msgSend(v5, "addInteraction:", v19);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_preventAutoHideOfControlsAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PGButtonView;
  -[PGButtonView dealloc](&v3, sel_dealloc);
}

- (id)accessibilityIdentifier
{
  return (id)-[_PGButton accessibilityIdentifier](self->_actualButton, "accessibilityIdentifier");
}

- (void)setAccessibilityIdentifier:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[_PGButton accessibilityIdentifier](self->_actualButton, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
    -[_PGButton setAccessibilityIdentifier:](self->_actualButton, "setAccessibilityIdentifier:", v6);

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[PGButtonView actualButton](self, "actualButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PGButtonView text](self, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v13)
  {

  }
  else
  {
    -[PGButtonView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v13);

    if ((v6 & 1) == 0)
    {
      -[PGButtonView actualButton](self, "actualButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v13, 0);

      -[PGButtonView actualButton](self, "actualButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGButtonView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGButtonView actualButton](self, "actualButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentEdgeInsets");
      objc_msgSend(v9, "buttonView:contentEdgeInsetsForProposedInsets:", self);
      objc_msgSend(v8, "setContentEdgeInsets:");

      -[PGButtonView actualButton](self, "actualButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLineBreakMode:", 4);

      -[PGButtonView _updateGlyphConfigurationIfNeeded](self, "_updateGlyphConfigurationIfNeeded");
    }
  }

}

- (UIFont)font
{
  void *v2;
  void *v3;
  void *v4;

  -[PGButtonView actualButton](self, "actualButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PGButtonView actualButton](self, "actualButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)layoutSubviews
{
  _PGButton *actualButton;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGButtonView;
  -[PGMaterialView layoutSubviews](&v4, sel_layoutSubviews);
  actualButton = self->_actualButton;
  -[PGButtonView bounds](self, "bounds");
  -[_PGButton setFrame:](actualButton, "setFrame:");
  -[PGButtonView _updateForCircularAppearanceIfNeeded](self, "_updateForCircularAppearanceIfNeeded");
}

- (BOOL)_shouldHitTest
{
  if ((-[PGButtonView isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[PGButtonView alpha](self, "alpha");
  return BSFloatGreaterThanOrEqualToFloat();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _PGButton *actualButton;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[PGButtonView _shouldHitTest](self, "_shouldHitTest"))
  {
    actualButton = self->_actualButton;
    -[PGButtonView convertPoint:toView:](self, "convertPoint:toView:", actualButton, x, y);
    -[_PGButton hitTest:withEvent:](actualButton, "hitTest:withEvent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _PGButton *actualButton;
  char v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[PGButtonView _shouldHitTest](self, "_shouldHitTest"))
  {
    actualButton = self->_actualButton;
    -[PGButtonView convertPoint:toView:](self, "convertPoint:toView:", actualButton, x, y);
    v9 = -[_PGButton pointInside:withEvent:](actualButton, "pointInside:withEvent:", v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)sizeToFit
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[PGButtonView actualButton](self, "actualButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[PGButtonView frame](self, "frame");
  v5 = v4;
  v7 = v6;
  -[PGButtonView actualButton](self, "actualButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  -[PGButtonView setFrame:](self, "setFrame:", v5, v7, v10, v12);
}

- (BOOL)isEnabled
{
  return -[_PGButton isEnabled](self->_actualButton, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  -[_PGButton setEnabled:](self->_actualButton, "setEnabled:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_pointerInteraction);
  objc_msgSend(WeakRetained, "setEnabled:", v3);

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[PGButtonView _updateGlyphConfigurationIfNeeded](self, "_updateGlyphConfigurationIfNeeded");
    v5 = v6;
  }

}

- (void)setSystemImageName:(id)a3
{
  NSString *v4;
  NSString *systemImageName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_systemImageName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    systemImageName = self->_systemImageName;
    self->_systemImageName = v4;

    -[PGButtonView _updateGlyphConfigurationIfNeeded](self, "_updateGlyphConfigurationIfNeeded");
  }

}

- (void)setGlyphSize:(double)a3
{
  if (self->_glyphSize != a3)
  {
    self->_glyphSize = a3;
    -[PGButtonView _updateGlyphConfigurationIfNeeded](self, "_updateGlyphConfigurationIfNeeded");
  }
}

- (void)setCircular:(BOOL)a3
{
  if (self->_circular != a3)
  {
    self->_circular = a3;
    -[PGButtonView _updateForCircularAppearanceIfNeeded](self, "_updateForCircularAppearanceIfNeeded");
  }
}

- (UIColor)enabledTintColor
{
  if (-[PGMaterialView isBackdropHidden](self, "isBackdropHidden"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGButtonView;
  -[PGButtonView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PGButtonView _updateGlyphConfigurationIfNeeded](self, "_updateGlyphConfigurationIfNeeded");
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self);
  if (-[PGMaterialView isBackdropHidden](self, "isBackdropHidden")
    && (-[PGMaterialView backgroundColor](self, "backgroundColor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    v7 = (id *)0x1E0CEA850;
  }
  else
  {
    v7 = (id *)0x1E0CEA868;
  }
  objc_msgSend(*v7, "effectWithPreview:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[_PGButton setHovered:](self->_actualButton, "setHovered:", 1, a4, a5);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  -[_PGButton setHovered:](self->_actualButton, "setHovered:", 0, a4, a5);
}

- (void)_updateGlyphConfigurationIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double currentGlyphSize;
  NSString *currentGlyphImageName;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v12;
  NSString *v13;
  NSString *v14;
  UIImage *v15;
  UIImage *v16;
  void *currentCustomImage;
  void *v18;
  uint64_t v19;
  id v20;

  -[PGButtonView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PGButtonView glyphSize](self, "glyphSize");
    UIRoundToViewScale();
    v5 = v4;
    currentGlyphSize = self->_currentGlyphSize;
    currentGlyphImageName = self->_currentGlyphImageName;
    -[PGButtonView systemImageName](self, "systemImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSString isEqualToString:](currentGlyphImageName, "isEqualToString:", v8);

    v10 = currentGlyphSize != v5 || !v9;
    if (v10 || self->_image != self->_currentCustomImage)
    {
      -[PGButtonView systemImageName](self, "systemImageName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (NSString *)objc_msgSend(v12, "copy");
      v14 = self->_currentGlyphImageName;
      self->_currentGlyphImageName = v13;

      self->_currentGlyphSize = v5;
      v15 = self->_image;
      if (self->_image)
      {
        v16 = v15;
        currentCustomImage = self->_currentCustomImage;
        v20 = v16;
        self->_currentCustomImage = v16;
      }
      else
      {
        v20 = v15;
        if (!self->_currentGlyphImageName)
        {
LABEL_15:
          -[_PGButton setImage:forState:](self->_actualButton, "setImage:forState:", v20, 0);
          -[PGButtonView _updateForCircularAppearanceIfNeeded](self, "_updateForCircularAppearanceIfNeeded");

          return;
        }
        objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v5, *MEMORY[0x1E0CEB5E8]);
        currentCustomImage = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", currentCustomImage);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", self->_currentGlyphImageName, v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v20 = (id)v19;
      }

      goto LABEL_15;
    }
  }
}

- (void)_updateForCircularAppearanceIfNeeded
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;

  if (self->_circular)
  {
    -[PGButtonView bounds](self, "bounds");
    x = v11.origin.x;
    y = v11.origin.y;
    width = v11.size.width;
    height = v11.size.height;
    v7 = CGRectGetWidth(v11);
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v8 = CGRectGetHeight(v12);
    if (v7 < v8)
      v8 = v7;
    v9 = v8 * 0.5;
    -[PGMaterialView _cornerRadius](self, "_cornerRadius");
    if (v10 != v9)
      -[PGMaterialView _setCornerRadius:](self, "_setCornerRadius:", v9);
  }
}

- (void)_handleTouchDown:(id)a3
{
  void *v4;
  BSInvalidatable *v5;
  BSInvalidatable *preventAutoHideOfControlsAssertion;
  id v7;

  v7 = a3;
  -[PGButtonView setHighlighted:](self, "setHighlighted:", 1);
  if (!self->_preventAutoHideOfControlsAssertion)
  {
    objc_msgSend(v7, "accessibilityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView PG_acquireAssertionToPreventAutoHideOfControlsWithReason:](self, "PG_acquireAssertionToPreventAutoHideOfControlsWithReason:", v4);
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    preventAutoHideOfControlsAssertion = self->_preventAutoHideOfControlsAssertion;
    self->_preventAutoHideOfControlsAssertion = v5;

  }
}

- (void)_handleTouchUpOrCancel:(id)a3
{
  BSInvalidatable *preventAutoHideOfControlsAssertion;

  -[BSInvalidatable invalidate](self->_preventAutoHideOfControlsAssertion, "invalidate", a3);
  preventAutoHideOfControlsAssertion = self->_preventAutoHideOfControlsAssertion;
  self->_preventAutoHideOfControlsAssertion = 0;

  -[PGButtonView setHighlighted:](self, "setHighlighted:", 0);
}

- (void)_handleTouchUpInside:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "buttonViewDidReceiveTouchUpInside:", self);

  -[PGButtonView setHighlighted:](self, "setHighlighted:", 0);
}

- (void)_handleDragEnter:(id)a3
{
  -[PGButtonView setHighlighted:](self, "setHighlighted:", 1);
}

- (void)_handleDragExit:(id)a3
{
  -[PGButtonView setHighlighted:](self, "setHighlighted:", 0);
}

- (void)setHighlighted:(BOOL)a3
{
  id WeakRetained;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (-[PGButtonView isHighlighted](self, "isHighlighted") != a3)
  {
    self->_highlighted = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_highlightAnimator);
    if (objc_msgSend(WeakRetained, "isRunning"))
    {
      if (objc_msgSend(WeakRetained, "isInterruptible"))
      {
        objc_msgSend(WeakRetained, "stopAnimation:", 0);
        objc_msgSend(WeakRetained, "finishAnimationAtPosition:", 2);
      }
    }
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__4;
    v15 = __Block_byref_object_dispose__4;
    v6 = objc_alloc(MEMORY[0x1E0CEABC8]);
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__PGButtonView_setHighlighted___block_invoke;
    v10[3] = &unk_1E622F8C0;
    v10[4] = self;
    v16 = (id)objc_msgSend(v6, "initWithDuration:curve:animations:", 0, v10, 0.2);
    objc_storeWeak((id *)&self->_highlightAnimator, (id)v12[5]);
    v8 = (void *)v12[5];
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __31__PGButtonView_setHighlighted___block_invoke_2;
    v9[3] = &unk_1E6231270;
    v9[4] = &v11;
    objc_msgSend(v8, "addCompletion:", v9);
    objc_msgSend((id)v12[5], "startAnimation");
    _Block_object_dispose(&v11, 8);

  }
}

uint64_t __31__PGButtonView_setHighlighted___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  CGAffineTransform *v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    CGAffineTransformMakeScale(&v10, 0.85, 0.85);
    v4 = &v10;
  }
  else
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7 = *MEMORY[0x1E0C9BAA8];
    v8 = v5;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v4 = (CGAffineTransform *)&v7;
  }
  return objc_msgSend(v3, "setTransform:", v4, v7, v8, v9);
}

void __31__PGButtonView_setHighlighted___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (PGButtonViewDelegate)delegate
{
  return (PGButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (double)glyphSize
{
  return self->_glyphSize;
}

- (_PGButton)actualButton
{
  return self->_actualButton;
}

- (void)setActualButton:(id)a3
{
  objc_storeStrong((id *)&self->_actualButton, a3);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIViewPropertyAnimator)highlightAnimator
{
  return (UIViewPropertyAnimator *)objc_loadWeakRetained((id *)&self->_highlightAnimator);
}

- (void)setHighlightAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_highlightAnimator, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return (UIPointerInteraction *)objc_loadWeakRetained((id *)&self->_pointerInteraction);
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pointerInteraction);
  objc_destroyWeak((id *)&self->_highlightAnimator);
  objc_storeStrong((id *)&self->_actualButton, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preventAutoHideOfControlsAssertion, 0);
  objc_storeStrong((id *)&self->_currentCustomImage, 0);
  objc_storeStrong((id *)&self->_currentGlyphImageName, 0);
}

@end

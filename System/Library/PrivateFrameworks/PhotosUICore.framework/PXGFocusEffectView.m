@implementation PXGFocusEffectView

- (PXGFocusEffectView)initWithFrame:(CGRect)a3
{
  PXGFocusEffectView *v3;
  PXGFocusEffectView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *hostedContentView;
  uint64_t v15;
  _UIFloatingContentView *floatingContentView;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PXGFocusEffectView;
  v3 = -[PXGFocusEffectView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXGFocusEffectView bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v7, v9, v11);
    hostedContentView = v4->_hostedContentView;
    v4->_hostedContentView = (UIView *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4168]), "initWithFrame:", v6, v8, v10, v12);
    floatingContentView = v4->_floatingContentView;
    v4->_floatingContentView = (_UIFloatingContentView *)v15;

    -[PXGFocusEffectView addSubview:](v4, "addSubview:", v4->_floatingContentView);
    -[_UIFloatingContentView contentView](v4->_floatingContentView, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_hostedContentView);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__handleSelectTap_);
    objc_msgSend(v18, "setAllowedPressTypes:", &unk_1E53EA470);
    objc_msgSend(v18, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v18, "setCancelsTouchesInView:", 0);
    -[PXGFocusEffectView addGestureRecognizer:](v4, "addGestureRecognizer:", v18);

  }
  return v4;
}

- (UIView)hostedContentView
{
  return self->_hostedContentView;
}

- (UIView)contentView
{
  return -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
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
  _UIFloatingContentView *floatingContentView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _UIFloatingContentView *v18;
  _UIFloatingContentView *v19;
  void *v20;
  id v21;

  -[PXGFocusEffectView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGFocusEffectView setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[PXGFocusableView userData](self, "userData");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingContentView setFrame:](self->_floatingContentView, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v21, "cornerRadius");
  -[_UIFloatingContentView setCornerRadius:](self->_floatingContentView, "setCornerRadius:");
  floatingContentView = self->_floatingContentView;
  objc_msgSend(v21, "contentMotionRotation");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v21, "contentMotionTranslation");
  -[_UIFloatingContentView setContentMotionRotation:translation:](floatingContentView, "setContentMotionRotation:translation:", v13, v15, v16, v17);
  objc_msgSend(v21, "focusedSizeIncrease");
  -[_UIFloatingContentView setFocusedSizeIncrease:](self->_floatingContentView, "setFocusedSizeIncrease:");
  objc_msgSend(v21, "shadowVerticalOffset");
  -[_UIFloatingContentView setShadowVerticalOffset:](self->_floatingContentView, "setShadowVerticalOffset:");
  v18 = self->_floatingContentView;
  objc_msgSend(v21, "shadowOpacity");
  -[_UIFloatingContentView setShadowOpacity:forUserInterfaceStyle:](v18, "setShadowOpacity:forUserInterfaceStyle:", 1);
  v19 = self->_floatingContentView;
  objc_msgSend(v21, "shadowOpacity");
  -[_UIFloatingContentView setShadowOpacity:forUserInterfaceStyle:](v19, "setShadowOpacity:forUserInterfaceStyle:", 2);
  -[_UIFloatingContentView layoutIfNeeded](self->_floatingContentView, "layoutIfNeeded");
  -[_UIFloatingContentView contentView](self->_floatingContentView, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  -[UIView setFrame:](self->_hostedContentView, "setFrame:");

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGFocusEffectView;
  -[PXGFocusEffectView pressesBegan:withEvent:](&v17, sel_pressesBegan_withEvent_, v6, a4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "type", (_QWORD)v13) == 4)
        {
          ++self->_activeSelectPressesCount;
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      -[PXGFocusEffectView _updatePressedAppearance](self, "_updatePressedAppearance");
  }
  else
  {

  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGFocusEffectView;
  -[PXGFocusEffectView pressesEnded:withEvent:](&v17, sel_pressesEnded_withEvent_, v6, a4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "type", (_QWORD)v13) == 4)
        {
          --self->_activeSelectPressesCount;
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      -[PXGFocusEffectView _updatePressedAppearance](self, "_updatePressedAppearance");
  }
  else
  {

  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGFocusEffectView;
  -[PXGFocusEffectView pressesCancelled:withEvent:](&v17, sel_pressesCancelled_withEvent_, v6, a4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "type", (_QWORD)v13) == 4)
        {
          --self->_activeSelectPressesCount;
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      -[PXGFocusEffectView _updatePressedAppearance](self, "_updatePressedAppearance");
  }
  else
  {

  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PXGFocusEffectView;
  -[PXGFocusableView didUpdateFocusInContext:withAnimationCoordinator:](&v10, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, v6);
  if (-[PXGFocusEffectView isFocused](self, "isFocused"))
  {
    -[PXGFocusEffectView superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bringSubviewToFront:", self);

    v8 = 8;
  }
  else
  {
    v8 = 0;
  }
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self->_floatingContentView, "setControlState:withAnimationCoordinator:", v8, v6);
  -[PXGFocusEffectView setNeedsLayout](self, "setNeedsLayout");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PXGFocusEffectView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v9[3] = &unk_1E5149198;
  v9[4] = self;
  objc_msgSend(v6, "addCoordinatedAnimations:completion:", v9, 0);

}

- (void)_handleSelectTap:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "state") == 3)
  {
    -[PXGFocusEffectView superview](self, "superview");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v6, "superview");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
        if (!v7)
          goto LABEL_10;
      }
      v8 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "px_descriptionForAssertionMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGFocusEffectView.m"), 208, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("ancestor"), v11, v12);

      }
      objc_msgSend(v13, "locationInView:", v8);
      objc_msgSend(v8, "handlePrimaryInteractionAtPoint:");

    }
  }
LABEL_10:

}

- (void)_updatePressedAppearance
{
  uint64_t v3;

  if (-[PXGFocusEffectView isFocused](self, "isFocused"))
  {
    if (self->_activeSelectPressesCount <= 0)
      v3 = 8;
    else
      v3 = 9;
    -[_UIFloatingContentView setControlState:animated:](self->_floatingContentView, "setControlState:animated:", v3, 1);
  }
}

- (void)addHostedView:(id)a3
{
  -[UIView addSubview:](self->_hostedContentView, "addSubview:", a3);
}

- (void)addHostedLayer:(id)a3
{
  UIView *hostedContentView;
  id v4;
  id v5;

  hostedContentView = self->_hostedContentView;
  v4 = a3;
  -[UIView layer](hostedContentView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v4);

}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXGFocusEffectView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedContentView, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
}

uint64_t __71__PXGFocusEffectView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end

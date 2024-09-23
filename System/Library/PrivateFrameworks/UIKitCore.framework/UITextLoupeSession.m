@implementation UITextLoupeSession

+ (id)_makeLoupeViewForSourceView:(id)a3 selectionWidget:(id)a4 orientation:(unint64_t)a5
{
  id v7;
  id v8;
  _UITextMagnifiedLoupeView *v9;

  v7 = a4;
  v8 = a3;
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    v9 = -[_UITextMagnifiedLoupeView initWithSourceView:]([_UITextMagnifiedLoupeView alloc], "initWithSourceView:", v8);

    -[_UITextMagnifiedLoupeView setAnimatableSelectionWidget:](v9, "setAnimatableSelectionWidget:", v7);
    -[_UITextMagnifiedLoupeView setOrientation:](v9, "setOrientation:", a5);
  }
  else
  {
    v9 = -[_UITextLightLoupeView initWithSourceView:]([_UITextLightLoupeView alloc], "initWithSourceView:", v8);

  }
  return v9;
}

+ (UITextLoupeSession)beginLoupeSessionAtPoint:(CGPoint)point fromSelectionWidgetView:(UIView *)selectionWidget inView:(UIView *)interactionView
{
  return (UITextLoupeSession *)objc_msgSend(a1, "_beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:", selectionWidget, interactionView, 1, point.x, point.y);
}

+ (id)_beginLoupeSessionAtPoint:(CGPoint)a3 fromSelectionWidgetView:(id)a4 inView:(id)a5 orientation:(unint64_t)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double width;
  double height;
  UITextLoupeSession *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  void *v48;
  UITextLoupeSession *v49;
  NSObject *v51;
  unint64_t v52;
  NSObject *v53;
  NSObject *v54;
  unint64_t v55;
  NSObject *v56;
  CATransform3D v57;
  CATransform3D v58;
  uint8_t buf[4];
  id v60;
  uint64_t v61;
  CGRect v62;

  y = a3.y;
  x = a3.x;
  v61 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_isRemoteKeyboardWindow");

  if (v14)
  {
    objc_msgSend(v12, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
      objc_msgSend(v12, "keyboardSceneDelegate");
    else
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_diagnostics())
    {
      if (!v16)
      {
        __UIFaultDebugAssertLog();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v12;
          _os_log_fault_impl(&dword_185066000, v54, OS_LOG_TYPE_FAULT, "Could not find keyboard scene delegate for interaction view %@.", buf, 0xCu);
        }

      }
    }
    else if (!v16)
    {
      v55 = _MergedGlobals_1335;
      if (!_MergedGlobals_1335)
      {
        v55 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v55, (unint64_t *)&_MergedGlobals_1335);
      }
      v56 = *(NSObject **)(v55 + 8);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v12;
        _os_log_impl(&dword_185066000, v56, OS_LOG_TYPE_ERROR, "Could not find keyboard scene delegate for interaction view %@.", buf, 0xCu);
      }
    }
    objc_msgSend(v16, "containerWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (os_variant_has_internal_diagnostics())
  {
    if (v15)
      goto LABEL_11;
    __UIFaultDebugAssertLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v51, OS_LOG_TYPE_FAULT, "Could not find window to attach loupe view.", buf, 2u);
    }

LABEL_37:
    v49 = 0;
    goto LABEL_28;
  }
  if (!v15)
  {
    v52 = qword_1ECD828E0;
    if (!qword_1ECD828E0)
    {
      v52 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v52, (unint64_t *)&qword_1ECD828E0);
    }
    v53 = *(NSObject **)(v52 + 8);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v53, OS_LOG_TYPE_ERROR, "Could not find window to attach loupe view.", buf, 2u);
    }
    goto LABEL_37;
  }
LABEL_11:
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EDE56A48) & 1) == 0)
  {

    v11 = 0;
  }
  objc_msgSend(a1, "_makeLoupeViewForSourceView:selectionWidget:orientation:", v12, v11, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v17);
  objc_msgSend(v17, "containerCoordinateSpace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v11, "bounds");
    v19 = v62.origin.x;
    v20 = v62.origin.y;
    width = v62.size.width;
    height = v62.size.height;
    if (!CGRectIsNull(v62) && vabdd_f64(x, v19) < 10.0)
    {
      x = v19 + width * 0.5;
      y = v20 + height * 0.5;
    }
    v23 = objc_alloc_init(UITextLoupeSession);
    -[UITextLoupeSession setInteractionView:](v23, "setInteractionView:", v12);
    -[UITextLoupeSession setLoupeView:](v23, "setLoupeView:", v17);
    -[UITextLoupeSession setContainerWindow:](v23, "setContainerWindow:", v15);
    objc_msgSend(v17, "preferredSize");
    v25 = v24;
    v27 = v26;
    if (v11
      && (objc_msgSend(v11, "superview"),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "convertRect:fromCoordinateSpace:", v28, v19, v20, width, height),
          v30 = v29,
          v28,
          v30 > v27))
    {
      -[UITextLoupeSession invalidate](v23, "invalidate");
      v49 = 0;
    }
    else
    {
      objc_msgSend(v17, "setBounds:", 0.0, 0.0, v25, v27);
      -[UITextLoupeSession _locationInContainerCoordinateSpace:](v23, "_locationInContainerCoordinateSpace:", x, y);
      v32 = v31;
      v34 = v33;
      objc_msgSend(v17, "setModelPosition:");
      objc_msgSend(v17, "constrainedModelPositionForPosition:", v32, v34);
      objc_msgSend(v17, "setCenter:");
      objc_msgSend(v12, "tintColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "insertionPointColor");
        v36 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v36;
      }
      objc_msgSend(v17, "setTintColor:", v35);
      objc_msgSend(v12, "window");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 != v37)
      {
        objc_msgSend(v12, "window");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "bounds");
        v40 = v39;
        v42 = v41;
        objc_msgSend(v12, "window");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "convertPoint:fromWindow:", v43, v40, v42);
        v45 = v44;
        v47 = v46;

        CATransform3DMakeTranslation(&v58, v45, v47, 0.0);
        objc_msgSend(v17, "layer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v58;
        objc_msgSend(v48, "setSublayerTransform:", &v57);

      }
      objc_msgSend(v17, "setVisible:animated:completion:", 0, 0, 0);
      objc_msgSend(v17, "setVisible:animated:completion:", 1, 1, 0);
      -[UITextLoupeSession _updateStatusBarVisibility](v23, "_updateStatusBarVisibility");
      v49 = v23;

    }
  }
  else
  {
    os_variant_has_internal_diagnostics();
    v49 = 0;
  }

LABEL_28:
  return v49;
}

- (CGPoint)_locationInContainerCoordinateSpace:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
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
  -[UITextLoupeSession interactionView](self, "interactionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextLoupeSession loupeView](self, "loupeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerCoordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v6, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)moveToPoint:(CGPoint)point withCaretRect:(CGRect)caretRect trackingCaret:(BOOL)tracksCaret
{
  _BOOL4 v5;
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  CGRect v26;

  if (!self->_invalidated)
  {
    v5 = tracksCaret;
    height = caretRect.size.height;
    width = caretRect.size.width;
    y = caretRect.origin.y;
    x = caretRect.origin.x;
    v10 = point.y;
    v11 = point.x;
    -[UITextLoupeSession loupeView](self, "loupeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerCoordinateSpace");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v25
      && (-[UITextLoupeSession interactionView](self, "interactionView"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "window"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      if (CGRectIsNull(v26) || !v5)
        v16 = v10;
      else
        v16 = y + height * 0.5;
      -[UITextLoupeSession setModelPosition:](self, "setModelPosition:", v11, v16);
      if (self->_gestureTuning)
      {
        -[UITextLoupeSession gestureTuning](self, "gestureTuning");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lineBreakProgress");
        v19 = v18;

        -[UITextLoupeSession loupeView](self, "loupeView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setDismissalProgress:", v19);

        if (v19 >= 0.85)
        {
          -[UITextLoupeSession loupeView](self, "loupeView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "visible");

          if (v22)
          {
            -[UITextLoupeSession loupeView](self, "loupeView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setVisible:animated:completion:", 0, 1, 0);

          }
        }
      }
      -[UITextLoupeSession _updateStatusBarVisibility](self, "_updateStatusBarVisibility");
    }
    else
    {
      -[UITextLoupeSession loupeView](self, "loupeView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setVisible:", 0);

    }
  }
}

- (void)setModelPosition:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[UITextLoupeSession _locationInContainerCoordinateSpace:](self, "_locationInContainerCoordinateSpace:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[UITextLoupeSession loupeView](self, "loupeView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModelPosition:", v5, v7);

}

- (void)_updateStatusBarVisibility
{
  id WeakRetained;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  id v21;
  CGRect v22;
  CGRect v23;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerWindow);
  __UIStatusBarManagerForWindow(WeakRetained);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextLoupeSession loupeView](self, "loupeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UITextLoupeSession loupeView](self, "loupeView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "visible"))
  {
    objc_msgSend(v21, "_statusBarFrameIgnoringVisibility");
    v23.origin.x = v14;
    v23.origin.y = v15;
    v23.size.width = v16;
    v23.size.height = v17;
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    v18 = CGRectIntersectsRect(v22, v23);

    if (v18)
    {
      if (!self->_isHidingStatusBar)
      {
        v19 = 1;
        self->_isHidingStatusBar = 1;
LABEL_8:
        LoupeStatusBarAnimationParameters();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_setOverridingStatusBarHidden:animationParameters:", v19, v20);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (self->_isHidingStatusBar)
  {
    v19 = 0;
    self->_isHidingStatusBar = 0;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)invalidate
{
  -[UITextLoupeSession _invalidateAnimated:](self, "_invalidateAnimated:", 1);
}

- (void)_invalidateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  _UITextLoupeView *loupeView;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a3;
  self->_invalidated = 1;
  if (self->_isHidingStatusBar)
  {
    self->_isHidingStatusBar = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerWindow);
    __UIStatusBarManagerForWindow(WeakRetained);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LoupeStatusBarAnimationParameters();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setOverridingStatusBarHidden:animationParameters:", 0, v7);

  }
  if (v3)
  {
    objc_initWeak(&location, self);
    loupeView = self->_loupeView;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__UITextLoupeSession__invalidateAnimated___block_invoke;
    v10[3] = &unk_1E16B44C0;
    objc_copyWeak(&v11, &location);
    -[_UITextLoupeView setVisible:animated:completion:](loupeView, "setVisible:animated:completion:", 0, 1, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[_UITextLoupeView setVisible:animated:completion:](self->_loupeView, "setVisible:animated:completion:", 0, 0, 0);
    -[_UITextLoupeView removeFromSuperview](self->_loupeView, "removeFromSuperview");
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "_loupeSessionDidInvalidate:", self);

  }
}

void __42__UITextLoupeSession__invalidateAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "loupeView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(v4, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_loupeSessionDidInvalidate:", v4);

    WeakRetained = v4;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_invalidated)
  {
    -[UITextLoupeSession delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[_UITextLoupeView removeFromSuperview](self->_loupeView, "removeFromSuperview");
  }
  else
  {
    -[UITextLoupeSession _invalidateAnimated:](self, "_invalidateAnimated:", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)UITextLoupeSession;
  -[UITextLoupeSession dealloc](&v4, sel_dealloc);
}

- (UITextGestureTuning)gestureTuning
{
  return self->_gestureTuning;
}

- (void)setGestureTuning:(id)a3
{
  objc_storeStrong((id *)&self->_gestureTuning, a3);
}

- (UIView)interactionView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_interactionView);
}

- (void)setInteractionView:(id)a3
{
  objc_storeWeak((id *)&self->_interactionView, a3);
}

- (UIWindow)containerWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_containerWindow);
}

- (void)setContainerWindow:(id)a3
{
  objc_storeWeak((id *)&self->_containerWindow, a3);
}

- (_UITextLoupeView)loupeView
{
  return self->_loupeView;
}

- (void)setLoupeView:(id)a3
{
  objc_storeStrong((id *)&self->_loupeView, a3);
}

- (_UITextLoupeSessionDelegate)delegate
{
  return (_UITextLoupeSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loupeView, 0);
  objc_destroyWeak((id *)&self->_containerWindow);
  objc_destroyWeak((id *)&self->_interactionView);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
}

@end

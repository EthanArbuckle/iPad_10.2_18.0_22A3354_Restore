@implementation _UIKBCompatInputView

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIKBCompatInputView;
  -[UIView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIKBCompatInputView touchableView](self, "touchableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)_UIKBCompatInputView;
  -[UIView setBounds:](&v12, sel_setBounds_);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferencesActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentInputModeSupportsCrescendo");

  if ((v10 & 1) == 0)
  {
    -[_UIKBCompatInputView touchableView](self, "touchableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", x, y, width, height);

  }
}

- (CGRect)_compatibleBounds
{
  void *v3;
  void *v4;
  double v5;
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
  double v16;
  objc_super v17;
  CGRect result;

  -[_UIKBCompatInputView touchableView](self, "touchableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_compatibleBounds");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)_UIKBCompatInputView;
    -[UIView _compatibleBounds](&v17, sel__compatibleBounds);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setTouchableView:(id)a3
{
  objc_storeStrong((id *)&self->_touchableView, a3);
}

- (void)addSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIKBCompatInputView;
  -[UIView addSubview:](&v4, sel_addSubview_, a3);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  CGSize result;

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isRotating"))
    goto LABEL_13;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExtensionInputMode");

  if (v6)
  {
    v7 = +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation");
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentInputMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICompatibilityInputViewController inputSnapshotViewForInputMode:orientation:](UICompatibilityInputViewController, "inputSnapshotViewForInputMode:orientation:", v9, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICompatibilityInputViewController inputSnapshotViewForInputMode:orientation:](UICompatibilityInputViewController, "inputSnapshotViewForInputMode:orientation:", v11, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3 || !v12)
      goto LABEL_12;
    v13 = v7 - 3;
    -[_UIKBCompatInputView touchableView](self, "touchableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    if (v13 > 1)
    {
      objc_msgSend(v12, "bounds");
      v25 = v24;
      v27 = v26;

      if (v16 != v25)
        goto LABEL_12;
      v23 = v3;
      if (v18 != v27)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(v3, "bounds");
      v20 = v19;
      v22 = v21;

      if (v16 != v20 || (v23 = v12, v18 != v22))
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    objc_msgSend(v23, "bounds");
    v29 = v28;
    v31 = v30;

    goto LABEL_19;
  }
LABEL_14:
  -[_UIKBCompatInputView snapshotView](self, "snapshotView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_UIKBCompatInputView snapshotView](self, "snapshotView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    v29 = v34;
    v31 = v35;
  }
  else
  {
    -[_UIKBCompatInputView touchableView](self, "touchableView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      v43.receiver = self;
      v43.super_class = (Class)_UIKBCompatInputView;
      -[UIView intrinsicContentSize](&v43, sel_intrinsicContentSize);
      v29 = v41;
      v31 = v42;
      goto LABEL_19;
    }
    -[_UIKBCompatInputView touchableView](self, "touchableView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "intrinsicContentSize");
    v29 = v37;
    v31 = v38;
  }

LABEL_19:
  v39 = v29;
  v40 = v31;
  result.height = v40;
  result.width = v39;
  return result;
}

- (UIView)touchableView
{
  UIView *touchableView;
  UIView *v3;
  void *v4;

  touchableView = self->_touchableView;
  if (touchableView)
  {
    v3 = touchableView;
  }
  else
  {
    -[UIView subviews](self, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "sizeDidChange"))
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v5.receiver = self;
  v5.super_class = (Class)_UIKBCompatInputView;
  -[UIView _didChangeKeyplaneWithContext:](&v5, sel__didChangeKeyplaneWithContext_, v4);

}

- (void)dealloc
{
  UIView *snapshotView;
  UIView *touchableView;
  objc_super v5;

  snapshotView = self->_snapshotView;
  self->_snapshotView = 0;

  touchableView = self->_touchableView;
  self->_touchableView = 0;

  v5.receiver = self;
  v5.super_class = (Class)_UIKBCompatInputView;
  -[UIView dealloc](&v5, sel_dealloc);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIKBCompatInputView touchableView](self, "touchableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIKBCompatInputView touchableView](self, "touchableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    objc_msgSend(v8, "hitTest:withEvent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIKBCompatInputView touchableView](self, "touchableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", width, height);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIKBCompatInputView;
    -[UIView sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
  }
  v10 = v8;
  v11 = v9;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)_hasAutolayoutHeightConstraint
{
  void *v3;
  void *v4;
  char v5;

  -[_UIKBCompatInputView touchableView](self, "touchableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[_UIKBCompatInputView touchableView](self, "touchableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_hasAutolayoutHeightConstraint");

  return v5;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_touchableView, 0);
}

@end

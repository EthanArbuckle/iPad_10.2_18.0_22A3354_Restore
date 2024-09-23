@implementation UIInputSetHostView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)_updateSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  void *v6;
  UIInputSetHostView *v7;
  void *v8;
  objc_super v9;

  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v9.receiver = self;
  v9.super_class = (Class)UIInputSetHostView;
  -[UIView _updateSafeAreaInsets](&v9, sel__updateSafeAreaInsets);
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  if (v4 != v5)
  {
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomEdgeView");
    v7 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {
      -[UIView _rootInputWindowController](self, "_rootInputWindowController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateSupportsDockViewController");

    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIInputSetHostView *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  UIInputSetHostView *v24;
  UIInputSetHostView *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  UIInputSetHostView *v43;
  void *v44;
  void *v45;
  objc_super v47;
  CGPoint v48;
  CGPoint v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)objc_opt_class(), "_shouldHitTestInputViewFirst"))
  {
    objc_msgSend(v8, "placement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isFloatingAssistantView");

    if (v19)
    {
      objc_msgSend(v8, "inputViewSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "assistantViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v12, "isInputAssistantItemEmpty") & 1) != 0
        || (objc_msgSend(v8, "placement"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "isCompactAssistantView"),
            v21,
            v22))
      {
        objc_msgSend(v12, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "superview");
        v24 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();

        -[UIView superview](v24, "superview");
        v25 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();

        if (v25 == self)
        {
          objc_msgSend(v12, "barFrame");
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v33 = v32;
          objc_msgSend(v12, "view");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v34, v27, v29, v31, v33);
          v36 = v35;
          v38 = v37;
          v40 = v39;
          v42 = v41;

          v50.origin.x = v36;
          v50.origin.y = v38;
          v50.size.width = v40;
          v50.size.height = v42;
          v51 = CGRectInset(v50, -v42, 0.0);
          v48.x = x;
          v48.y = y;
          if (CGRectContainsPoint(v51, v48))
          {
            v52.origin.x = v36;
            v52.origin.y = v38;
            v52.size.width = v40;
            v52.size.height = v42;
            v49.x = x;
            v49.y = y;
            if (!CGRectContainsPoint(v52, v49))
              goto LABEL_25;
          }
        }

      }
      goto LABEL_15;
    }
LABEL_16:
    v12 = 0;
LABEL_17:
    v47.receiver = self;
    v47.super_class = (Class)UIInputSetHostView;
    -[UIView hitTest:withEvent:](&v47, sel_hitTest_withEvent_, v7, x, y);
    v17 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(v8, "inputViewSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInputViewPlaceholder");

  if ((v10 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v8, "inputViewSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    && (objc_msgSend(v12, "isDescendantOfView:", self) & 1) == 0)
  {
LABEL_15:

    goto LABEL_16;
  }
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
  if (!v12)
    goto LABEL_17;
  v15 = v13;
  v16 = v14;
  if (!objc_msgSend(v12, "pointInside:withEvent:", v7))
    goto LABEL_17;
  objc_msgSend(v12, "hitTest:withEvent:", v7, v15, v16);
  v17 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v43 = v17;
  if (v17 == self)
  {
    -[UIView layer](self, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "animationKeys");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "count"))
      v24 = self;
    else
      v24 = 0;

  }
  else
  {
    v24 = v17;
  }

LABEL_25:
  return v24;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearKeyboardSnapshot");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "isUserInteractionEnabled"))
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          if ((objc_msgSend(v14, "pointInside:withEvent:", v7) & 1) != 0)
          {
            v15 = 1;
            goto LABEL_12;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

+ (BOOL)_shouldHitTestInputViewFirst
{
  return 1;
}

- (void)layoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  if (objc_msgSend((id)objc_opt_class(), "_notifyOnExplicitLayout"))
  {
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_forcePreLayoutHostViewFrame");

  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteInputViewHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "inputViewSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostedCustomInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "inputViewWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layoutIfNeeded");

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIInputSetHostView;
  -[UIView layoutIfNeeded](&v9, sel_layoutIfNeeded);
}

- (int)textEffectsVisibilityLevel
{
  void *v2;
  int v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEmojiPopoverPresented")
    && (objc_msgSend(v2, "_showsScribbleIconsInAssistantView") & 1) != 0)
  {
    v3 = 301;
  }
  else
  {
    v3 = 10;
  }

  return v3;
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__UIInputSetHostView__didChangeKeyplaneWithContext___block_invoke;
  v6[3] = &unk_1E16D5CB8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performOnControllers:", v6);

}

uint64_t __52__UIInputSetHostView__didChangeKeyplaneWithContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateForKeyplaneChangeWithContext:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  if (!a3)
    return -1;
  v4 = a3;
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_clipCornersOfView:", v4);

  return v6;
}

+ (BOOL)_notifyOnExplicitLayout
{
  return 1;
}

@end

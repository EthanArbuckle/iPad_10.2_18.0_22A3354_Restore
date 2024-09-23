@implementation UIEditingOverlayGestureView

- (id)_gestureRecognizersForEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());

  if (!v6)
  {
LABEL_11:
    -[UIView window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "activationState");

    if (v17 > 1)
    {
      v13 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_26;
    }
    v13 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[UIView gestureRecognizers](self, "gestureRecognizers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (!v18)
      goto LABEL_24;
    v19 = v18;
    v20 = *(_QWORD *)v28;
LABEL_14:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v20)
        objc_enumerationMutation(v9);
      v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v21);
      objc_msgSend(v22, "_activeEvents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v22, "_activeEvents");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "containsObject:", v4);

        if (!v25)
          goto LABEL_22;
      }
      else
      {

      }
      objc_msgSend(v13, "addObject:", v22);
LABEL_22:
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (!v19)
          goto LABEL_24;
        goto LABEL_14;
      }
    }
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[UIView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v10)
    goto LABEL_10;
  v11 = v10;
  v12 = *(_QWORD *)v32;
  v13 = (void *)MEMORY[0x1E0C9AA60];
LABEL_4:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v32 != v12)
      objc_enumerationMutation(v9);
    if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v14), "isMemberOfClass:", objc_opt_class()) & 1) != 0)
      break;
    if (v11 == ++v14)
    {
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (!v11)
      {
LABEL_10:

        goto LABEL_11;
      }
      goto LABEL_4;
    }
  }
LABEL_24:

LABEL_26:
  return v13;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  UIEditingOverlayGestureView *v9;
  UIEditingOverlayGestureView *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  +[UIKeyShortcutHUDService _existingHUDService](UIKeyShortcutHUDService, "_existingHUDService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleTouchEvent:", v7);

  v12.receiver = self;
  v12.super_class = (Class)UIEditingOverlayGestureView;
  -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v9 = (UIEditingOverlayGestureView *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  -[UIEditingOverlayGestureView previousWindow](self, "previousWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)UIApp;
    -[UIEditingOverlayGestureView previousWindow](self, "previousWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id *)(id)objc_msgSend(v4, "_touchesEventForWindow:", v5);

    if (v6)
      objc_msgSend(v6[8], "removeObject:", self);
    if (_os_feature_enabled_impl())
    {
      v7 = (void *)UIApp;
      -[UIEditingOverlayGestureView previousWindow](self, "previousWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id *)(id)objc_msgSend(v7, "_hoverEventForWindow:", v8);

      if (v9)
        objc_msgSend(v9[8], "removeObject:", self);
    }
  }
  -[UIView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)UIApp;
    -[UIView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v11, "_touchesEventForWindow:", v12);

    -[UIEvent _addEventObserver:]((uint64_t)v13, self);
    if (_os_feature_enabled_impl())
    {
      v14 = (void *)UIApp;
      -[UIView window](self, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v14, "_hoverEventForWindow:", v15);

      -[UIEvent _addEventObserver:]((uint64_t)v16, self);
    }
  }
  -[UIView window](self, "window");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UIEditingOverlayGestureView setPreviousWindow:](self, "setPreviousWindow:", v17);

}

- (void)setPreviousWindow:(id)a3
{
  objc_storeWeak((id *)&self->_previousWindow, a3);
}

- (UIWindow)previousWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_previousWindow);
}

- (int)textEffectsVisibilityLevel
{
  return 225;
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousWindow);
}

@end

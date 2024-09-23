@implementation _UIEditMenuInteractionMenuController

- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v4 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64___UIEditMenuInteractionMenuController_setMenuVisible_animated___block_invoke;
  v7[3] = &unk_1E16B1B78;
  v8 = a3;
  v7[4] = self;
  v5 = _Block_copy(v7);
  v6 = v5;
  if (v4)
    (*((void (**)(void *))v5 + 2))(v5);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);

}

- (void)_dismissEditMenu
{
  -[UIEditMenuInteraction dismissMenu](self->_currentMenuInteraction, "dismissMenu");
}

- (BOOL)isMenuVisible
{
  return -[UIEditMenuInteraction isDisplayingMenu](self->_currentMenuInteraction, "isDisplayingMenu");
}

- (_UIEditMenuInteractionMenuController)init
{
  _UIEditMenuInteractionMenuController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuInteractionMenuController;
  v2 = -[UIMenuController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationDidAddDeactivationReason_, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);

  }
  return v2;
}

- (void)_applicationDidAddDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[_UIEditMenuInteractionMenuController setMenuVisible:animated:](self, "setMenuVisible:animated:", 0, v6 != 5);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), UIApp);

  v4.receiver = self;
  v4.super_class = (Class)_UIEditMenuInteractionMenuController;
  -[_UIEditMenuInteractionMenuController dealloc](&v4, sel_dealloc);
}

- (void)setTargetRect:(CGRect)a3 inView:(id)a4
{
  -[_UIEditMenuInteractionMenuController _setTargetRect:inView:animated:](self, "_setTargetRect:inView:animated:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)showMenuFromView:(id)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _BOOL8 v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  -[_UIEditMenuInteractionMenuController _setTargetRect:inView:animated:](self, "_setTargetRect:inView:animated:", v9, v10, x, y, width, height);

  if (-[UIEditMenuInteraction isDisplayingMenu](self->_currentMenuInteraction, "isDisplayingMenu"))
    -[UIEditMenuInteraction updateVisibleMenuPositionAnimated:](self->_currentMenuInteraction, "updateVisibleMenuPositionAnimated:", v10);
  else
    -[_UIEditMenuInteractionMenuController _presentEditMenu](self, "_presentEditMenu");
}

- (void)hideMenuFromView:(id)a3
{
  UIEditMenuInteraction *currentMenuInteraction;
  id v5;
  id v6;

  currentMenuInteraction = self->_currentMenuInteraction;
  v5 = a3;
  -[UIEditMenuInteraction view](currentMenuInteraction, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[_UIEditMenuInteractionMenuController hideMenu](self, "hideMenu");
}

- (id)menuItems
{
  return self->_extraMenuItems;
}

- (void)setMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraMenuItems, a3);
  self->_menuNeedsUpdate = 1;
}

- (void)update
{
  if (-[UIEditMenuInteraction isDisplayingMenu](self->_currentMenuInteraction, "isDisplayingMenu"))
  {
    if (self->_menuNeedsUpdate)
    {
      -[UIEditMenuInteraction reloadVisibleMenu](self->_currentMenuInteraction, "reloadVisibleMenu");
      self->_menuNeedsUpdate = 0;
    }
    -[UIEditMenuInteraction updateVisibleMenuPositionAnimated:](self->_currentMenuInteraction, "updateVisibleMenuPositionAnimated:", 0);
  }
}

- (CGRect)menuFrame
{
  void *v3;
  void *v4;
  void *v5;
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
  CGRect result;

  -[UIEditMenuInteraction view](self->_currentMenuInteraction, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIEditMenuInteraction menuFrameInCoordinateSpace:](self->_currentMenuInteraction, "menuFrameInCoordinateSpace:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_targetView
{
  return objc_loadWeakRetained((id *)&self->_targetView);
}

- (CGRect)_targetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetRect.origin.x;
  y = self->_targetRect.origin.y;
  width = self->_targetRect.size.width;
  height = self->_targetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setTargetRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  UIView **p_targetView;
  id v8;
  id WeakRetained;

  v5 = a5;
  self->_targetRect = a3;
  p_targetView = &self->_targetView;
  objc_storeWeak((id *)&self->_targetView, a4);
  -[UIEditMenuInteraction view](self->_currentMenuInteraction, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)p_targetView);

  if (v8 == WeakRetained)
    -[UIEditMenuInteraction updateVisibleMenuPositionAnimated:](self->_currentMenuInteraction, "updateVisibleMenuPositionAnimated:", v5);
  else
    -[_UIEditMenuInteractionMenuController _prepareEditMenuInteractionIfNeeded](self, "_prepareEditMenuInteractionIfNeeded");
}

- (void)_prepareEditMenuInteractionIfNeeded
{
  UIView **p_targetView;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  UIEditMenuInteraction *currentMenuInteraction;
  void *v9;
  UIEditMenuInteraction *v10;
  void *v11;
  id v12;
  UIEditMenuInteraction *v13;

  p_targetView = &self->_targetView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    -[UIEditMenuInteraction view](self->_currentMenuInteraction, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)p_targetView);

    if (v6 != v7)
    {
      currentMenuInteraction = self->_currentMenuInteraction;
      if (currentMenuInteraction)
      {
        -[UIEditMenuInteraction view](currentMenuInteraction, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeInteraction:", self->_currentMenuInteraction);

      }
      v10 = -[UIEditMenuInteraction initWithDelegate:]([UIEditMenuInteraction alloc], "initWithDelegate:", self);
      -[UIEditMenuInteraction setPresentsContextMenuAsSecondaryAction:](v10, "setPresentsContextMenuAsSecondaryAction:", 0);
      -[UIEditMenuInteraction set_includeMenuControllerItems:](v10, "set_includeMenuControllerItems:", 1);
      -[UIEditMenuInteraction _setUseSenderAsResponderSender:](v10, "_setUseSenderAsResponderSender:", 1);
      +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIEditMenuInteraction _setProxySender:](v10, "_setProxySender:", v11);

      -[UIEditMenuInteraction _setEnforcesMenuControllerLifecycle:](v10, "_setEnforcesMenuControllerLifecycle:", 1);
      v12 = objc_loadWeakRetained((id *)p_targetView);
      objc_msgSend(v12, "addInteraction:", v10);

      v13 = self->_currentMenuInteraction;
      self->_currentMenuInteraction = v10;

    }
  }
}

- (void)_presentEditMenu
{
  id v8;

  if (self->_currentMenuInteraction)
  {
    __asm { FMOV            V2.2D, #0.5 }
    +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, vaddq_f64((float64x2_t)self->_targetRect.origin, vmulq_f64((float64x2_t)self->_targetRect.size, _Q2)));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredArrowDirection:", -[_UIEditMenuInteractionMenuController _resolvedEditMenuArrowDirection](self, "_resolvedEditMenuArrowDirection"));
    objc_msgSend(v8, "set_ignoresPassthroughInView:", -[_UIEditMenuInteractionMenuController _shouldPassthroughInView](self, "_shouldPassthroughInView") ^ 1);
    -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_currentMenuInteraction, "presentEditMenuWithConfiguration:", v8);
    self->_menuNeedsUpdate = 0;

  }
}

- (BOOL)_shouldPassthroughInView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;

  v2 = objc_loadWeakRetained((id *)&self->_targetView);
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "textInputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = v4;
  if (v2 == v6)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v2, "isDescendantOfView:", v4) ^ 1;
    else
      LOBYTE(v7) = 1;
  }

  return v7;
}

- (int64_t)_resolvedEditMenuArrowDirection
{
  int64_t result;

  result = -[UIMenuController arrowDirection](self, "arrowDirection");
  if ((unint64_t)(result - 1) >= 4)
    return 0;
  return result;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetRect.origin.x;
  y = self->_targetRect.origin.y;
  width = self->_targetRect.size.width;
  height = self->_targetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a5;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("UIMenuControllerWillShowMenuNotification"), self);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __101___UIEditMenuInteractionMenuController_editMenuInteraction_willPresentMenuForConfiguration_animator___block_invoke;
  v9[3] = &unk_1E16B1B28;
  v9[4] = self;
  objc_msgSend(v7, "addCompletion:", v9);

}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _UIEditMenuInteractionMenuController *v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB37D0];
  v9 = a5;
  objc_msgSend(v8, "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("UIMenuControllerWillHideMenuNotification"), self);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101___UIEditMenuInteractionMenuController_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
  v12[3] = &unk_1E16B1B50;
  v13 = v7;
  v14 = self;
  v11 = v7;
  objc_msgSend(v9, "addCompletion:", v12);

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;

  v6 = a5;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  objc_msgSend(v7, "stopDictationMenuElementsForTextInputView:", WeakRetained);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_editMenuInteraction:(id)a3 firstResponderTargetForConfiguration:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  +[UIWindow _externalKeyWindow](UIWindow, "_externalKeyWindow", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[_UIEditMenuInteractionMenuController _targetView](self, "_targetView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _keyWindow](v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "firstResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_responderForEditing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputDelegateManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "forwardingInputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputDelegateManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "forwardingInputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_responderForEditing");
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v19;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_extraMenuItems, 0);
  objc_storeStrong((id *)&self->_currentMenuInteraction, 0);
}

@end

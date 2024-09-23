@implementation _UICalloutBarMenuController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowWillRotateNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UICalloutBarMenuController;
  -[_UICalloutBarMenuController dealloc](&v4, sel_dealloc);
}

- (void)_removeWindowWillRotateObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowWillRotateNotification"), 0);

}

- (BOOL)isMenuVisible
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  +[UICalloutBar activeCalloutBar](UICalloutBar, "activeCalloutBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UICalloutBar activeCalloutBar](UICalloutBar, "activeCalloutBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    v6 = v5 == 1.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_menuHidden
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  +[UICalloutBar activeCalloutBar](UICalloutBar, "activeCalloutBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UICalloutBar activeCalloutBar](UICalloutBar, "activeCalloutBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    v6 = v5 < 1.0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_showMenuAnimated:(BOOL)a3
{
  _BOOL8 v3;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v3 = a3;
  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "hasReplacements"))
    objc_msgSend(v14, "setReplacements:", 0);
  objc_msgSend(v14, "setDelegate:", self);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v16.origin.y = v6;
  v16.size.width = v7;
  v16.size.height = v8;
  if (CGRectEqualToRect(self->_targetRect, v16))
  {
    objc_msgSend(v14, "targetRect");
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
    v17.origin.x = v5;
    v17.origin.y = v6;
    v17.size.width = v7;
    v17.size.height = v8;
    if (!CGRectEqualToRect(v15, v17))
    {
      self->_targetRect.origin.x = x;
      self->_targetRect.origin.y = y;
      self->_targetRect.size.width = width;
      self->_targetRect.size.height = height;
    }
  }
  if (-[_UICalloutBarMenuController _updateAnimated:checkVisible:](self, "_updateAnimated:checkVisible:", v3, 0))
  {
    -[_UICalloutBarMenuController _reparentCalloutBarIfNeeded](self, "_reparentCalloutBarIfNeeded");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__windowWillRotate_, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("UIMenuControllerMenuFrameDidChangeNotification"), self);
    if (v3)
      objc_msgSend(v14, "appear");
    else
      objc_msgSend(v14, "show");
    if ((objc_msgSend(v14, "visible") & 1) == 0)
    {
      objc_msgSend(v14, "removeFromSuperview");
      -[_UICalloutBarMenuController _removeWindowWillRotateObserver](self, "_removeWindowWillRotateObserver");
    }

  }
}

- (void)_hideMenuAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (!-[_UICalloutBarMenuController _menuHidden](self, "_menuHidden"))
  {
    +[UICalloutBar activeCalloutBar](UICalloutBar, "activeCalloutBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "fade");
    else
      objc_msgSend(v5, "hide");
    -[_UICalloutBarMenuController _removeWindowWillRotateObserver](self, "_removeWindowWillRotateObserver");

  }
}

- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
    -[_UICalloutBarMenuController _showMenuAnimated:](self, "_showMenuAnimated:", a4);
  else
    -[_UICalloutBarMenuController _hideMenuAnimated:](self, "_hideMenuAnimated:", a4);
}

- (void)showMenuFromView:(id)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_targetRect;
  id v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  _BOOL8 v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_targetRect = &self->_targetRect;
  v10 = a3;
  p_targetRect->origin.x = ConvertRectToScene(v10, x, y, width, height);
  p_targetRect->origin.y = v11;
  p_targetRect->size.width = v12;
  p_targetRect->size.height = v13;
  objc_storeWeak((id *)&self->_targetView, v10);

  v14 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  if (-[_UICalloutBarMenuController _menuHidden](self, "_menuHidden"))
  {
    -[_UICalloutBarMenuController _showMenuAnimated:](self, "_showMenuAnimated:", v14);
  }
  else if (-[_UICalloutBarMenuController _updateAnimated:checkVisible:](self, "_updateAnimated:checkVisible:", v14, 1))
  {
    -[_UICalloutBarMenuController _reparentCalloutBarIfNeeded](self, "_reparentCalloutBarIfNeeded");
  }
}

- (void)hideMenuFromView:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  +[UICalloutBar activeCalloutBar](UICalloutBar, "activeCalloutBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isOwnedByView:", v4);

  if (v6)
    -[_UICalloutBarMenuController hideMenu](self, "hideMenu");
}

- (void)hideMenu
{
  -[_UICalloutBarMenuController _hideMenuAnimated:](self, "_hideMenuAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (void)setTargetRect:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_targetRect;
  id v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_targetRect = &self->_targetRect;
  v10 = a4;
  p_targetRect->origin.x = ConvertRectToScene(v10, x, y, width, height);
  p_targetRect->origin.y = v11;
  p_targetRect->size.width = v12;
  p_targetRect->size.height = v13;
  objc_storeWeak((id *)&self->_targetView, v10);

  if (-[_UICalloutBarMenuController _updateAnimated:checkVisible:](self, "_updateAnimated:checkVisible:", 1, 1))
    -[_UICalloutBarMenuController _reparentCalloutBarIfNeeded](self, "_reparentCalloutBarIfNeeded");
}

- (void)_setTargetRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  CGRect *p_targetRect;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;

  v5 = a5;
  p_targetRect = &self->_targetRect;
  self->_targetRect.origin.x = ConvertRectToScene(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  p_targetRect->origin.y = v8;
  p_targetRect->size.width = v9;
  p_targetRect->size.height = v10;
  if (-[_UICalloutBarMenuController _updateAnimated:checkVisible:](self, "_updateAnimated:checkVisible:", v5, 1))
    -[_UICalloutBarMenuController _reparentCalloutBarIfNeeded](self, "_reparentCalloutBarIfNeeded");
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

- (void)setMenuItems:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtraItems:", v3);

  objc_msgSend(v4, "resetPage");
}

- (id)menuItems
{
  void *v2;
  void *v3;

  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extraItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)update
{
  -[_UICalloutBarMenuController _updateAnimated:checkVisible:](self, "_updateAnimated:checkVisible:", 1, 1);
}

- (CGRect)menuFrame
{
  void *v2;
  double v3;
  double v4;
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
  double v17;
  CGRect result;

  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v7 = ConvertRectToScene(v2, v3, v4, v5, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_reparentCalloutBarIfNeeded
{
  UIView **p_targetView;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  p_targetView = &self->_targetView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_targetView);
    objc_msgSend(v4, "keyboardSceneDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v8, "containerWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
    objc_msgSend(v5, "addSubview:", v6);

}

- (BOOL)_updateAnimated:(BOOL)a3 checkVisible:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  _UICalloutBarMenuController *v12;
  _UICalloutBarMenuController *v13;
  void *v14;
  id WeakRetained;
  id v16;
  _UICalloutBarMenuController *v17;
  id v18;
  void *v19;
  double x;
  double y;
  double width;
  double height;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  void *v65;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  _UICalloutBarMenuController *v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v4 = a4;
  v5 = a3;
  v7 = -[_UICalloutBarMenuController _menuHidden](self, "_menuHidden");
  v8 = v7;
  if (!v4 || !v7)
  {
    +[UICalloutBar sharedCalloutBar](UICalloutBar, "sharedCalloutBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v4)
    {
      objc_msgSend(v10, "delegate");
      v12 = (_UICalloutBarMenuController *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        if (v12 != self)
        {
          v9 = 0;
LABEL_22:

LABEL_23:
          return v9;
        }
      }
      else
      {
        objc_msgSend(v11, "setDelegate:", self);
      }
      objc_msgSend(v11, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v9 = 0;
        goto LABEL_23;
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    if (WeakRetained)
    {
      v16 = objc_loadWeakRetained((id *)&self->_targetView);
      objc_msgSend(v16, "keyboardSceneDelegate");
      v17 = (_UICalloutBarMenuController *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v17 = (_UICalloutBarMenuController *)objc_claimAutoreleasedReturnValue();
    }

    v18 = objc_loadWeakRetained((id *)&self->_targetView);
    v71 = v17;
    -[_UICalloutBarMenuController containerWindow](v17, "containerWindow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    x = self->_targetRect.origin.x;
    y = self->_targetRect.origin.y;
    width = self->_targetRect.size.width;
    height = self->_targetRect.size.height;
    v24 = v18;
    objc_msgSend(v19, "windowScene");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_topVisibleWindowPassingTest:", &__block_literal_global_393);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "windowScene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "coordinateSpace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertRect:fromCoordinateSpace:", v29, x, y, width, height);
    objc_msgSend(v19, "convertRect:fromWindow:", v26);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    if (v8)
    {
      v39 = *MEMORY[0x1E0C9D648];
      v38 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v41 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v40 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v69 = v38;
      v70 = *MEMORY[0x1E0C9D648];
      v67 = v40;
      v68 = v41;
    }
    else
    {
      objc_msgSend(v11, "bounds");
      v39 = ConvertRectToScene(v11, v42, v43, v44, v45);
      v38 = v46;
      v41 = v47;
      v40 = v48;
      objc_msgSend(v11, "targetRect");
      v69 = v50;
      v70 = v49;
      v67 = v52;
      v68 = v51;
    }
    v13 = v71;
    v53 = objc_loadWeakRetained((id *)&self->_targetView);
    objc_msgSend(v11, "setTargetRect:view:arrowDirection:", v53, -[UIMenuController arrowDirection](self, "arrowDirection"), v31, v33, v35, v37);

    if (!v8 && !-[_UICalloutBarMenuController _menuHidden](self, "_menuHidden"))
    {
      objc_msgSend(v11, "updateAnimated:", v5);
      objc_msgSend(v11, "bounds");
      v74.origin.x = ConvertRectToScene(v11, v54, v55, v56, v57);
      v74.origin.y = v58;
      v74.size.width = v59;
      v74.size.height = v60;
      v72.origin.x = v39;
      v72.origin.y = v38;
      v72.size.width = v41;
      v72.size.height = v40;
      if (!CGRectEqualToRect(v72, v74))
        goto LABEL_20;
      objc_msgSend(v11, "targetRect");
      v75.origin.x = v61;
      v75.origin.y = v62;
      v75.size.width = v63;
      v75.size.height = v64;
      v73.origin.y = v69;
      v73.origin.x = v70;
      v73.size.height = v67;
      v73.size.width = v68;
      if (!CGRectEqualToRect(v73, v75))
      {
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", *(_QWORD *)&v67, *(_QWORD *)&v68, *(_QWORD *)&v69, *(_QWORD *)&v70);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "postNotificationName:object:", CFSTR("UIMenuControllerMenuFrameDidChangeNotification"), self);

      }
    }
    v9 = 1;
    goto LABEL_22;
  }
  return 0;
}

- (void)calloutBar:(id)a3 willStartAnimation:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  const __CFString *v13;
  id v14;

  v5 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("UICalloutBarInfoKeyWillDidShowReplacements"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("UICalloutBarInfoKeyDidPromptForReplacements"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("UICalloutBarInfoKeyAnimationID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("UICalloutBarAnimationAppear"));
  if (!v7 || (v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    if (!v11)
    {
      v13 = CFSTR("UIMenuControllerWillHideMenuNotification");
      goto LABEL_8;
    }
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("UIMenuControllerWillShowMenuNotification"), self);

  }
  if (((v11 & v7 ^ 1 | v9) & 1) != 0)
    return;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("_UIMenuControllerWillShowReplacementsMenuNotification");
  v14 = v12;
LABEL_8:
  objc_msgSend(v12, "postNotificationName:object:", v13, self);

}

- (void)calloutBar:(id)a3 didFinishAnimation:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  _UICalloutBarMenuController *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("UICalloutBarInfoKeyWillDidShowReplacements"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("UICalloutBarInfoKeyDidPromptForReplacements"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("UICalloutBarInfoKeyAnimationID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("UICalloutBarAnimationAppear"));
  if (v8 && (v10 & 1) != 0)
  {
LABEL_5:
    if (((v12 & v8 ^ 1 | v10) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:", CFSTR("_UIMenuControllerDidShowReplacementsMenuNotification"), self);

    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("UIMenuControllerDidShowMenuNotification"), self);

    goto LABEL_5;
  }
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("UIMenuControllerDidHideMenuNotification"), self);

  objc_msgSend(v17, "delegate");
  v16 = (_UICalloutBarMenuController *)objc_claimAutoreleasedReturnValue();

  if (v16 == self)
    objc_msgSend(v17, "setDelegate:", 0);
LABEL_9:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetView);
}

@end

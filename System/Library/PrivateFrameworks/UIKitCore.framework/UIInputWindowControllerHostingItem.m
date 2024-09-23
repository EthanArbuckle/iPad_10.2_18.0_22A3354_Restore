@implementation UIInputWindowControllerHostingItem

- (CGRect)notificationsFrame
{
  void *v3;
  void *v4;
  char v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;
  CGRect v45;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowingModeEnabled");

  if ((v5 & 1) != 0)
  {
    -[UIInputWindowControllerHostingItem fullScreenFrame](self, "fullScreenFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "_isHostedInAnotherProcess") & 1) != 0)
    {
      -[UIInputWindowControllerHostingItem hostView](self, "hostView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "_isTextEffectsWindowNotificationOwner");

      if (v18)
      {
        -[UIInputWindowControllerHostingItem hostView](self, "hostView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        v45.origin.x = v20;
        v45.origin.y = v21;
        v45.size.width = v22;
        v45.size.height = v23;
        v41.origin.x = v7;
        v41.origin.y = v9;
        v41.size.width = v11;
        v41.size.height = v13;
        v42 = CGRectIntersection(v41, v45);
        x = v42.origin.x;
        y = v42.origin.y;
        width = v42.size.width;
        height = v42.size.height;

        v43.origin.x = x;
        v43.origin.y = y;
        v43.size.width = width;
        v43.size.height = height;
        if (!CGRectIsEmpty(v43))
        {
          -[UIInputWindowControllerHostingItem hostView](self, "hostView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "frame");
          v7 = v29;
          v9 = v30;
          v11 = v31;
          v13 = v32;

        }
      }
    }
    else
    {

    }
  }
  else
  {
    -[UIInputWindowControllerHostingItem visibleFrame](self, "visibleFrame");
    v7 = v33;
    v9 = v34;
    v11 = v35;
    v13 = v36;
  }
  v37 = v7;
  v38 = v9;
  v39 = v11;
  v40 = v13;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (void)prepareTranslationFromPlacement:(id)a3 to:(id)a4
{
  -[UISplitKeyboardSupport willPerformPlacementFrom:to:forController:](self->_cachedSplitKeyboardController, "willPerformPlacementFrom:to:forController:", a3, a4, self);
}

- (UIView)inputAssistantView
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (objc_msgSend(WeakRetained, "host:isForPurpose:", self, 102))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_inputAssistantView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIView *)v5;
}

- (UIView)inputView
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (objc_msgSend(WeakRetained, "host:isForPurpose:", self, 100))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_inputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIView *)v5;
}

- (void)refreshApplicator
{
  UIInputViewSetPlacementApplicator *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !-[UIKBInputBackdropView _isTransitioning](self->_inputBackdropView, "_isTransitioning"))
  {
    if (objc_msgSend(v6, "isFloating"))
      +[UIKeyboardImpl floatingNormalizedPersistentOffset](UIKeyboardImpl, "floatingNormalizedPersistentOffset");
    else
      +[UIKeyboardImpl normalizedPersistentOffset](UIKeyboardImpl, "normalizedPersistentOffset");
    objc_msgSend(v6, "setOffset:");
  }
  v3 = self->_applicator;
  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicatorInfoForOwner:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSetPlacementApplicator applyChanges:](v3, "applyChanges:", v5);

}

- (void)updateVisibilityConstraintsForPlacement:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIInputViewSetPlacementApplicator **p_applicator;
  void *v12;
  void *v13;
  char v14;
  UIInputViewSetPlacementApplicator *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  UIInputViewSetPlacementApplicator *v31;
  void *v32;
  id v33;

  v33 = a3;
  -[UIInputWindowControllerHostingItem container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useCrescendoHostingItem");

  if ((v5 & 1) == 0)
  {
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      v6 = 1;
    }
    else
    {
      -[UIInputWindowControllerHostingItem owner](self, "owner");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "shouldNotifyRemoteKeyboards"))
      {
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "visualModeManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "shouldShowWithinAppWindow");

      }
      else
      {
        v6 = 1;
      }

    }
    objc_msgSend((id)objc_msgSend(v33, "applicatorClassForKeyboard:", v6), "applicatorForOwner:withPlacement:", self, v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_24;
    p_applicator = &self->_applicator;
    if ((-[UIInputViewSetPlacementApplicator isEqual:](self->_applicator, "isEqual:", v10) & 1) == 0)
    {
      objc_msgSend(v10, "draggableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isHidden"))
      {

      }
      else
      {
        objc_msgSend(v10, "twoFingerDraggableView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isHidden");

        if ((v14 & 1) == 0)
        {
          -[UIInputWindowControllerHostingItem inputAccessoryView](self, "inputAccessoryView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            -[UIInputViewSetPlacementApplicator inputAccessoryPadding](*p_applicator, "inputAccessoryPadding");
            v20 = v19;
            objc_msgSend(v10, "inputAccessoryPadding");
            v22 = v20 != v21;
          }
          else
          {
            v22 = 0;
          }

          -[UIInputWindowControllerHostingItem owner](self, "owner");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInputViewSetPlacementApplicator constraints](self->_applicator, "constraints");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeConstraints:", v25);

          v15 = self->_applicator;
          objc_storeStrong((id *)&self->_applicator, v10);
          -[UIInputViewSetPlacementApplicator prepare](self->_applicator, "prepare");
          -[UIInputWindowControllerHostingItem owner](self, "owner");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInputViewSetPlacementApplicator constraints](self->_applicator, "constraints");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addConstraints:", v28);

          if (v22)
          {
            -[NSMutableDictionary objectForKey:](self->_accessoryViewEdgeConstraints, "objectForKey:", &unk_1E1A98D78);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIInputViewSetPlacementApplicator inputAccessoryPadding](self->_applicator, "inputAccessoryPadding");
            objc_msgSend(v29, "setConstant:", v30);

          }
          -[UISplitKeyboardSupport updatedControllerApplicator:](self->_cachedSplitKeyboardController, "updatedControllerApplicator:", self);
          -[UIInputViewSetPlacementApplicator invalidate](v15, "invalidate");
          goto LABEL_22;
        }
      }
    }
    if (!*p_applicator
      || (-[UIInputViewSetPlacementApplicator allConstraintsActive](*p_applicator, "allConstraintsActive") & 1) != 0)
    {
      goto LABEL_23;
    }
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v15 = (UIInputViewSetPlacementApplicator *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSetPlacementApplicator view](v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSetPlacementApplicator constraints](self->_applicator, "constraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addConstraints:", v17);

LABEL_22:
LABEL_23:
    v31 = self->_applicator;
    objc_msgSend(v33, "applicatorInfoForOwner:", self);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSetPlacementApplicator applyChanges:](v31, "applyChanges:", v32);

LABEL_24:
  }

}

- (UIView)containerView
{
  void *v2;
  void *v3;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (CGRect)visibleFrame
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
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isVisible") & 1) == 0)
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating")
         || objc_msgSend(v4, "isFloatingAssistantView")
         && (-[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet"),
             v13 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v13, "inputAccessoryView"),
             v14 = (void *)objc_claimAutoreleasedReturnValue(),
             v14,
             v13,
             !v14))
  {
    -[UIInputViewSetPlacementApplicator popoverFrame](self->_applicator, "popoverFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v6 = v16;
    v8 = v17;
    v10 = v18;
    v12 = v19;

  }
  v20 = v6;
  v21 = v8;
  v22 = v10;
  v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (UIInputViewSetPlacement)placement
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  objc_msgSend(WeakRetained, "placementForHost:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInputViewSetPlacement *)v4;
}

- (UIInputViewSet)inputViewSet
{
  void *v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputViewSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  v6 = objc_msgSend(WeakRetained, "host:isForPurpose:", self, 100);
  v7 = objc_loadWeakRetained((id *)&self->_container);
  v8 = objc_msgSend(v7, "host:isForPurpose:", self, 101);
  v9 = objc_loadWeakRetained((id *)&self->_container);
  +[UIInputViewSet inputSetWithOriginalInputSet:duplicateInputView:duplicateInputAccessoryView:duplicateInputAssistantView:](UIInputViewSet, "inputSetWithOriginalInputSet:duplicateInputView:duplicateInputAccessoryView:duplicateInputAssistantView:", v4, v6, v8, objc_msgSend(v9, "host:isForPurpose:", self, 102));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInputViewSet *)v10;
}

- (UIInputWindowController)owner
{
  void *v2;
  void *v3;

  -[UIInputWindowControllerHostingItem container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInputWindowController *)v3;
}

- (UIInputWindowControllerHosting)container
{
  return (UIInputWindowControllerHosting *)objc_loadWeakRetained((id *)&self->_container);
}

- (UIInputSetHostView)hostView
{
  return self->_hostView;
}

- (void)setHideInputViewBackdrops:(BOOL)a3
{
  double v5;

  if (a3)
    v5 = 0.0;
  else
    v5 = 1.0;
  -[UIView setAlpha:](self->_inputBackdropView, "setAlpha:", v5);
  -[UIView setAlpha:](self->_inputAccessoryBackdropView, "setAlpha:", v5);
  if (!-[UIInputWindowControllerHostingItem useCombinedBackdrop](self, "useCombinedBackdrop") || !a3)
    -[UIView setAlpha:](self->_inputCombinedBackdropView, "setAlpha:", v5);
}

- (void)setPlacement
{
  UIInputWindowControllerHostingItem *v3;
  UIInputViewSetPlacement *v4;
  UIInputViewSetPlacement *cachedPlacement;

  -[UIInputViewSetPlacement delegate](self->_cachedPlacement, "delegate");
  v3 = (UIInputWindowControllerHostingItem *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[UIInputViewSetPlacement setDelegate:](self->_cachedPlacement, "setDelegate:", 0);
  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v4 = (UIInputViewSetPlacement *)objc_claimAutoreleasedReturnValue();
  cachedPlacement = self->_cachedPlacement;
  self->_cachedPlacement = v4;

  -[UIInputViewSetPlacement setDelegate:](self->_cachedPlacement, "setDelegate:", self);
}

- (void)setDontDismissReachability:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDontDismissReachability:", v3);

}

- (BOOL)isOnScreenRotating
{
  void *v2;
  char v3;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnScreenRotating");

  return v3;
}

- (void)resetPlacement
{
  UIInputWindowControllerHostingItem *v3;
  UIInputViewSetPlacement *cachedPlacement;

  -[UIInputViewSetPlacement delegate](self->_cachedPlacement, "delegate");
  v3 = (UIInputWindowControllerHostingItem *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[UIInputViewSetPlacement setDelegate:](self->_cachedPlacement, "setDelegate:", 0);
  cachedPlacement = self->_cachedPlacement;
  self->_cachedPlacement = 0;

}

- (void)updateInputBackdropView
{
  void *v3;
  void *v4;
  UIKBInputBackdropView *v5;
  BOOL v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  UIKBInputBackdropView *v21;
  void *v22;
  void *v23;
  UIKBInputBackdropView *v24;
  UIKBInputBackdropView *v25;

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_msgSend(v3, "isInputViewPlaceholder") & 1) != 0)
  {
    v24 = 0;
LABEL_4:

    goto LABEL_5;
  }
  v6 = -[UIInputWindowControllerHostingItem useCombinedBackdrop](self, "useCombinedBackdrop");

  if (v6)
  {
    v5 = 0;
    goto LABEL_6;
  }
  -[UIInputWindowControllerHostingItem _inputBackdropView](self, "_inputBackdropView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "inputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  -[UIInputWindowControllerHostingItem hostView](self, "hostView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;

  -[UIInputWindowControllerHostingItem hostView](self, "hostView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;

  -[UIInputWindowControllerHostingItem _inputBackdropView](self, "_inputBackdropView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    v21 = v19;
  else
    v21 = -[UIKBInputBackdropView initWithFrame:]([UIKBInputBackdropView alloc], "initWithFrame:", v15, v10, v18, v12);
  v24 = v21;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (!v7)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_inheritedRenderConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView _setRenderConfig:](v24, "_setRenderConfig:", v23);

    goto LABEL_4;
  }
LABEL_5:
  v5 = v24;
LABEL_6:
  v25 = v5;
  -[UIInputWindowControllerHostingItem setInputBackdropView:](self, "setInputBackdropView:", v5);
  -[UIInputWindowControllerHostingItem updateInputBackdropViewVisibility](self, "updateInputBackdropViewVisibility");

}

- (void)updateInputBackdropViewVisibility
{
  void *v3;
  uint64_t v4;
  UIKBInputBackdropView *inputBackdropView;
  id v6;

  if (-[UIInputWindowControllerHostingItem useCombinedBackdrop](self, "useCombinedBackdrop"))
  {
    -[UIInputWindowControllerHostingItem updateCombinedBackdropViewAnimated:forKeyboardUp:](self, "updateCombinedBackdropViewAnimated:forKeyboardUp:", 1, -[UIView isHidden](self->_inputBackdropView, "isHidden") ^ 1);
  }
  else
  {
    -[UIInputWindowControllerHostingItem setCombinedBackdropView:](self, "setCombinedBackdropView:", 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    if (v3)
      v4 = objc_msgSend(v3, "_isBackdropVisible") ^ 1;
    else
      v4 = 0;
    -[UIView setHidden:](self->_inputBackdropView, "setHidden:", v4);
    inputBackdropView = self->_inputBackdropView;
    if (inputBackdropView)
      -[UIView setHidden:](self->_inputAssistantBackdropView, "setHidden:", -[UIView isHidden](inputBackdropView, "isHidden"));

  }
}

- (void)setInputBackdropView:(id)a3
{
  UIKBInputBackdropView *v5;
  UIView *inputBackdropBackgroundView;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = self->_inputBackdropView;
  objc_storeStrong((id *)&self->_inputBackdropView, a3);
  if (self->_inputBackdropView)
  {
    inputBackdropBackgroundView = self->_inputBackdropBackgroundView;
    if (!inputBackdropBackgroundView)
    {
      v7 = [UIView alloc];
      -[UIView frame](self->_inputBackdropView, "frame");
      v8 = -[UIView initWithFrame:](v7, "initWithFrame:");
      v9 = self->_inputBackdropBackgroundView;
      self->_inputBackdropBackgroundView = v8;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_inputBackdropBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
        -[UIView setUserInteractionEnabled:](self->_inputBackdropBackgroundView, "setUserInteractionEnabled:", 0);
      -[UIInputWindowControllerHostingItem hostView](self, "hostView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:atIndex:", self->_inputBackdropBackgroundView, 0);

      inputBackdropBackgroundView = self->_inputBackdropBackgroundView;
    }
    -[UIView addSubview:](inputBackdropBackgroundView, "addSubview:");
  }
  else
  {
    if (v5)
    {
      -[UIView removeFromSuperview](v5, "removeFromSuperview");
      v11 = (void *)MEMORY[0x1E0D156E0];
      -[NSMutableDictionary allValues](self->_inputBackdropViewEdgeConstraints, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deactivateConstraints:", v12);

      -[NSMutableDictionary removeAllObjects](self->_inputBackdropViewEdgeConstraints, "removeAllObjects");
    }
    v13 = self->_inputBackdropBackgroundView;
    if (v13)
    {
      -[UIView removeFromSuperview](v13, "removeFromSuperview");
      v14 = self->_inputBackdropBackgroundView;
      self->_inputBackdropBackgroundView = 0;

      v15 = (void *)MEMORY[0x1E0D156E0];
      -[NSMutableDictionary allValues](self->_inputBackdropBackgroundViewEdgeConstraints, "allValues");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deactivateConstraints:", v16);

      -[NSMutableDictionary removeAllObjects](self->_inputBackdropBackgroundViewEdgeConstraints, "removeAllObjects");
    }
  }

}

- (UIKBInputBackdropView)_inputBackdropView
{
  return self->_inputBackdropView;
}

- (void)clearInputAssistantViewEdgeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D156E0];
  -[NSMutableDictionary allValues](self->_assistantViewEdgeConstraints, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[NSMutableDictionary removeAllObjects](self->_assistantViewEdgeConstraints, "removeAllObjects");
  if (-[NSMutableDictionary count](self->_assistantBackdropViewEdgeConstraints, "count"))
  {
    v5 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](self->_assistantBackdropViewEdgeConstraints, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    -[NSMutableDictionary removeAllObjects](self->_assistantBackdropViewEdgeConstraints, "removeAllObjects");
  }
}

- (void)clearInputViewEdgeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0D156E0];
  -[NSMutableDictionary allValues](self->_inputViewEdgeConstraints, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[NSMutableDictionary removeAllObjects](self->_inputViewEdgeConstraints, "removeAllObjects");
  if (-[NSMutableDictionary count](self->_inputDockViewEdgeConstraints, "count"))
  {
    v5 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](self->_inputDockViewEdgeConstraints, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    -[NSMutableDictionary removeAllObjects](self->_inputDockViewEdgeConstraints, "removeAllObjects");
  }
  if (-[NSMutableDictionary count](self->_inputBackdropBackgroundViewEdgeConstraints, "count"))
  {
    v7 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](self->_inputBackdropBackgroundViewEdgeConstraints, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateConstraints:", v8);

    -[NSMutableDictionary removeAllObjects](self->_inputBackdropBackgroundViewEdgeConstraints, "removeAllObjects");
  }
  if (-[NSMutableDictionary count](self->_inputBackdropViewEdgeConstraints, "count"))
  {
    v9 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](self->_inputBackdropViewEdgeConstraints, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    -[NSMutableDictionary removeAllObjects](self->_inputBackdropViewEdgeConstraints, "removeAllObjects");
  }
}

- (void)updateInputAssistantBackdropView
{
  void *v3;
  void *v4;
  UIKBInputBackdropView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  UIKBInputBackdropView *v18;
  void *v19;
  void *v20;
  void *v21;
  UIKBInputBackdropView *v22;
  UIKBInputBackdropView *v23;

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputAssistantView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v3, "isInputAssistantViewPlaceholder") & 1) != 0
    || -[UIInputWindowControllerHostingItem useCombinedBackdrop](self, "useCombinedBackdrop"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "frame");
    v7 = v6;
    v9 = v8;
    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;

    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;

    -[UIInputWindowControllerHostingItem _inputAssistantBackdropView](self, "_inputAssistantBackdropView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = -[UIKBInputBackdropView initWithFrame:]([UIKBInputBackdropView alloc], "initWithFrame:", v12, v7, v15, v9);
    v23 = v18;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_inheritedRenderConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView _setRenderConfig:](v23, "_setRenderConfig:", v21);

    v5 = v23;
  }
  v22 = v5;
  -[UIInputWindowControllerHostingItem setInputAssistantBackdropView:](self, "setInputAssistantBackdropView:", v5);

}

- (void)setInputAssistantBackdropView:(id)a3
{
  UIKBInputBackdropView **p_inputAssistantBackdropView;
  UIKBInputBackdropView *v6;
  UIKBInputBackdropView *inputBackdropView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIKBInputBackdropView *inputAssistantBackdropView;
  UIKBInputBackdropView *inputBackdropBackgroundView;
  id v16;

  v16 = a3;
  p_inputAssistantBackdropView = &self->_inputAssistantBackdropView;
  v6 = self->_inputAssistantBackdropView;
  objc_storeStrong((id *)&self->_inputAssistantBackdropView, a3);
  inputBackdropView = self->_inputBackdropView;
  if (inputBackdropView)
    -[UIView setHidden:](*p_inputAssistantBackdropView, "setHidden:", -[UIView isHidden](inputBackdropView, "isHidden"));
  if (*p_inputAssistantBackdropView)
  {
    -[UIView superview](self->_inputBackdropBackgroundView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      -[UIInputWindowControllerHostingItem hostView](self, "hostView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      inputAssistantBackdropView = self->_inputAssistantBackdropView;
      inputBackdropBackgroundView = (UIKBInputBackdropView *)self->_inputBackdropBackgroundView;
    }
    else
    {
      -[UIView superview](self->_inputBackdropView, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowControllerHostingItem hostView](self, "hostView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIInputWindowControllerHostingItem hostView](self, "hostView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      inputAssistantBackdropView = self->_inputAssistantBackdropView;
      if (v10 != v11)
      {
        objc_msgSend(v12, "insertSubview:atIndex:", inputAssistantBackdropView, 0);
LABEL_11:

        goto LABEL_12;
      }
      inputBackdropBackgroundView = self->_inputBackdropView;
    }
    objc_msgSend(v12, "insertSubview:aboveSubview:", inputAssistantBackdropView, inputBackdropBackgroundView);
    goto LABEL_11;
  }
  -[UIView removeFromSuperview](v6, "removeFromSuperview");
LABEL_12:

}

- (UIKBInputBackdropView)_inputAssistantBackdropView
{
  return self->_inputAssistantBackdropView;
}

- (void)someViewDidLayoutSubviews
{
  void *v3;
  void *v4;
  UIInputWindowControllerHostingItem *v5;
  id v6;

  -[UIInputWindowControllerHostingItem controllerDelegate](self, "controllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controllerDidLayoutSubviews:", self);

  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (UIInputWindowControllerHostingItem *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[UIInputWindowControllerHostingItem placement](self, "placement");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkSizeForOwner:", self);

  }
}

- (_UIRemoteKeyboardControllerDelegate)controllerDelegate
{
  return self->_controllerDelegate;
}

- (UISplitKeyboardSupport)splitKeyboardController
{
  return self->_cachedSplitKeyboardController;
}

- (BOOL)scrollKeyboardActive
{
  return self->_scrolling;
}

- (BOOL)_shouldShowInputDockView
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isCustomInputView"))
  {
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "shouldShowDockView"))
      v5 = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally");
    else
      v5 = 0;

  }
  else
  {
    v5 = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally");
  }

  return v5;
}

- (UIInputWindowControllerHostingItem)initWithContainer:(id)a3
{
  id v4;
  UIInputWindowControllerHostingItem *v5;
  void *v6;
  UIInputSetHostView *v7;
  uint64_t v8;
  UIInputSetHostView *hostView;
  uint64_t v10;
  NSLayoutConstraint *emptyHeightConstraint;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UIInputWindowControllerHostingItem;
  v5 = -[UIInputWindowControllerHostingItem init](&v22, sel_init);
  if (v5)
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerController:", v5);

    objc_storeWeak((id *)&v5->_container, v4);
    v7 = [UIInputSetHostView alloc];
    v8 = -[UIView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    hostView = v5->_hostView;
    v5->_hostView = (UIInputSetHostView *)v8;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_hostView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_hostView, 8, 0, 0, 0, 0.0, 0.0);
    v10 = objc_claimAutoreleasedReturnValue();
    emptyHeightConstraint = v5->_emptyHeightConstraint;
    v5->_emptyHeightConstraint = (NSLayoutConstraint *)v10;

    -[NSLayoutConstraint setIdentifier:](v5->_emptyHeightConstraint, "setIdentifier:", CFSTR("emptyHeight"));
    WeakRetained = objc_loadWeakRetained((id *)&v5->_container);
    -[NSLayoutConstraint setActive:](v5->_emptyHeightConstraint, "setActive:", objc_msgSend(WeakRetained, "useCrescendoHostingItem") ^ 1);

    -[UIInputWindowControllerHostingItem owner](v5, "owner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "placement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isFloatingAssistantView") & 1) != 0)
    {
      -[UIInputWindowControllerHostingItem owner](v5, "owner");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_isAlwaysKeyboardWindow");

      if ((v17 & 1) == 0)
      {
        -[UIInputWindowControllerHostingItem owner](v5, "owner");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "insertSubview:atIndex:", v5->_hostView, 0);
LABEL_7:

        -[UIInputWindowControllerHostingItem updateSupportsDockViewController](v5, "updateSupportsDockViewController");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObserver:selector:name:object:", v5, sel_inputModeDidChange_, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);

        goto LABEL_8;
      }
    }
    else
    {

    }
    -[UIInputWindowControllerHostingItem owner](v5, "owner");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v5->_hostView);
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (void)updateSupportsDockViewController
{
  _BOOL4 supportsDockViewController;
  _BOOL4 v4;
  void *v6;
  UISystemKeyboardDockController *dockViewController;

  supportsDockViewController = self->_supportsDockViewController;
  v4 = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally");
  self->_supportsDockViewController = v4;
  if (!supportsDockViewController && v4)
  {
    -[UIView window](self->_hostView, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      dockViewController = self->_dockViewController;

      if (!dockViewController)
      {
        -[UIInputWindowControllerHostingItem updateKeyboardDockViewVisibility](self, "updateKeyboardDockViewVisibility");
        -[UIInputWindowControllerHostingItem updateViewConstraints](self, "updateViewConstraints");
      }
    }
  }
}

- (void)setControllerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_controllerDelegate, a3);
}

- (void)willBeginTranslationFromPlacement:(id)a3 to:(id)a4
{
  if (-[UISplitKeyboardSupport startedPlacementFrom:to:forController:](self->_cachedSplitKeyboardController, "startedPlacementFrom:to:forController:", a3, a4, self))
  {
    -[UIInputWindowControllerHostingItem willBeginTranslation](self, "willBeginTranslation");
  }
}

- (void)_updateBackdropViews
{
  void *v3;
  void *v4;
  void *v5;
  UIKBInputBackdropView *inputAccessoryBackdropView;
  double v7;
  double v8;
  _UIKBLightEffectsBackground *inputCombinedBackdropView;
  double v10;
  double v11;
  UIKBInputBackdropView *inputAssistantBackdropView;
  double v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  double Width;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double Height;
  double v27;
  double v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  double v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "splitTransitionInProgress") & 1) != 0
    || -[UIKBInputBackdropView _isTransitioning](self->_inputBackdropView, "_isTransitioning")
    || (objc_msgSend(v36, "isEmpty") & 1) != 0
    || !self->_inputBackdropView && !self->_inputAccessoryBackdropView && !self->_inputAssistantBackdropView)
  {
    goto LABEL_18;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 && (objc_msgSend(v3, "centerFilled") & 1) == 0)
  {
    v16 = objc_msgSend(v36, "isSplit");
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutIfNeeded");

    if (!v16)
      goto LABEL_10;
    objc_msgSend(v36, "_leftInputViewSetFrame");
    Width = CGRectGetWidth(v37);
    objc_msgSend(v36, "inputViewBounds");
    v20 = CGRectGetWidth(v38);
    objc_msgSend(v36, "_rightInputViewSetFrame");
    v21 = v20 - CGRectGetWidth(v39) - Width;
    objc_msgSend(v36, "inputViewSplitHeight");
    v23 = v22;
    -[NSLayoutConstraint constant](self->_assistantViewHeightConstraint, "constant");
    v25 = v24;
    objc_msgSend(v36, "inputAccessoryViewBounds");
    Height = CGRectGetHeight(v40);
    v27 = Width + v21;
    objc_msgSend(v36, "inputViewBounds");
    v28 = CGRectGetWidth(v41) - Width;
    objc_msgSend(v36, "inputAccessoryView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v36, "inputAccessoryViewBounds");
      -[UIKBInputBackdropView layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:](self->_inputAccessoryBackdropView, "layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:", 3, 0.0, 0.0, Width, Height, Width + v21, 0.0, CGRectGetWidth(v42) - Width - v21, Height);
    }
    objc_msgSend(v36, "inputAssistantView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

    }
    else if (!self->_inputAssistantBackdropView)
    {
      v31 = 0;
LABEL_29:
      if (v29)
        v34 = 1;
      else
        v34 = v31;
      if (v34)
        v35 = 12;
      else
        v35 = -1;
      -[UIKBInputBackdropView layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:](self->_inputBackdropView, "layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:", v35, 0.0, 0.0, Width, v23, v27, 0.0, v28 - v21, v23);
      goto LABEL_18;
    }
    v31 = v25 > 0.0;
    objc_msgSend(v36, "inputViewBounds");
    v32 = CGRectGetWidth(v43) - Width - v21;
    if (v29)
      v33 = 0;
    else
      v33 = 3;
    -[UIKBInputBackdropView layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:](self->_inputAssistantBackdropView, "layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:", v33, 0.0, 0.0, Width, v25, v27, 0.0, v32, v25);
    goto LABEL_29;
  }
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

LABEL_10:
  inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
  if (inputAccessoryBackdropView)
  {
    -[UIView frame](self->_inputAccessoryBackdropView, "frame");
    v8 = v7;
    -[UIView frame](self->_inputAccessoryBackdropView, "frame");
    -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](inputAccessoryBackdropView, "layoutInputBackdropToFullWithRect:", 0.0, 0.0, v8);
  }
  inputCombinedBackdropView = self->_inputCombinedBackdropView;
  if (inputCombinedBackdropView)
  {
    -[UIView bounds](self->_inputCombinedBackdropView, "bounds");
    v11 = v10;
    -[UIView bounds](self->_inputCombinedBackdropView, "bounds");
  }
  else
  {
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
    if (inputAssistantBackdropView)
    {
      -[UIView frame](self->_inputAssistantBackdropView, "frame");
      v14 = v13;
      -[UIView frame](self->_inputAssistantBackdropView, "frame");
      -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](inputAssistantBackdropView, "layoutInputBackdropToFullWithRect:", 0.0, 0.0, v14);
    }
    inputCombinedBackdropView = (_UIKBLightEffectsBackground *)self->_inputBackdropView;
    -[UIView frame](inputCombinedBackdropView, "frame");
    v11 = v15;
    -[UIView frame](self->_inputBackdropView, "frame");
  }
  -[_UIKBLightEffectsBackground layoutInputBackdropToFullWithRect:](inputCombinedBackdropView, "layoutInputBackdropToFullWithRect:", 0.0, 0.0, v11);
LABEL_18:

}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "leadingAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", CFSTR("inputBackdrop.leading"));
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", CFSTR("inputBackdrop.top"));
  return v4;
}

- (void)resetInputViewVisibility
{
  void *v2;
  id v3;

  -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (void)setInputView:(id)a3
{
  id v4;
  void *v5;
  UIInputSetHostView *v6;
  UIInputSetHostView *hostView;
  UIInputSetHostView *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  UIView *v16;
  void *v17;
  UIInputSetHostView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIInputSetHostView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIInputWindowControllerHostingItem inputAssistantView](self, "inputAssistantView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
  hostView = self->_hostView;

  v8 = self->_hostView;
  if (v6 == hostView)
    -[UIView insertSubview:belowSubview:](v8, "insertSubview:belowSubview:", v4, v5);
  else
    -[UIView addSubview:](v8, "addSubview:", v4);

  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating")
    && (-[UIInputWindowControllerHostingItem owner](self, "owner"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "inputViewSet"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isCustomInputView"),
        v10,
        v9,
        v11))
  {
    -[UIInputWindowControllerHostingItem floatingKeyboardMaskView](self, "floatingKeyboardMaskView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = [UIView alloc];
      v14 = -[UIView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      +[UIColor blackColor](UIColor, "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

      v16 = objc_alloc_init(UIView);
      -[UIInputWindowControllerHostingItem setFloatingKeyboardMaskView:](self, "setFloatingKeyboardMaskView:", v16);

      -[UIInputWindowControllerHostingItem floatingKeyboardMaskView](self, "floatingKeyboardMaskView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", v14);

      v18 = self->_hostView;
      -[UIInputWindowControllerHostingItem floatingKeyboardMaskView](self, "floatingKeyboardMaskView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](v18, "addSubview:", v19);

      v33 = (void *)MEMORY[0x1E0D156E0];
      -[UIView leadingAnchor](v14, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_hostView, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v37);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v36;
      -[UIView topAnchor](v14, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_hostView, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -100.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v32;
      -[UIView trailingAnchor](self->_hostView, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v14, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v22;
      -[UIView bottomAnchor](self->_hostView, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v14, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "activateConstraints:", v26);

    }
    -[UIView maskView](self->_hostView, "maskView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v28 = self->_hostView;
      -[UIInputWindowControllerHostingItem floatingKeyboardMaskView](self, "floatingKeyboardMaskView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setMaskView:](v28, "setMaskView:", v29);

    }
  }
  else
  {
    -[UIView maskView](self->_hostView, "maskView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[UIView setMaskView:](self->_hostView, "setMaskView:", 0);
      -[UIInputWindowControllerHostingItem floatingKeyboardMaskView](self, "floatingKeyboardMaskView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeFromSuperview");

      -[UIInputWindowControllerHostingItem setFloatingKeyboardMaskView:](self, "setFloatingKeyboardMaskView:", 0);
    }
  }

}

- (void)configureDockViewController:(BOOL)a3
{
  UISystemKeyboardDockController *v4;
  UISystemKeyboardDockController *dockViewController;

  if (self->_supportsDockViewController)
  {
    if (a3)
    {
      v4 = -[UIViewController initWithNibName:bundle:]([UISystemKeyboardDockController alloc], "initWithNibName:bundle:", 0, 0);
      dockViewController = self->_dockViewController;
      self->_dockViewController = v4;
    }
    else
    {
      dockViewController = self->_dockViewController;
      self->_dockViewController = 0;
    }

  }
}

- (void)updateKeyboardDockViewVisibility
{
  UIInputSetHostView *hostView;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (self->_supportsDockViewController)
  {
    if (!self->_dockViewController)
    {
      -[UIInputWindowControllerHostingItem configureDockViewController:](self, "configureDockViewController:", 1);
      hostView = self->_hostView;
      -[UIViewController view](self->_dockViewController, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](hostView, "addSubview:", v4);

    }
    v5 = -[UIInputWindowControllerHostingItem _shouldShowInputDockView](self, "_shouldShowInputDockView");
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isInputViewPlaceholder") & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v5 & (objc_msgSend(v10, "isMinimized") ^ 1);

      }
    }
    else
    {
      v9 = 0;
    }

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentInputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("autofillsignup"));

    -[UISystemKeyboardDockController dockView](self->_dockViewController, "dockView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", v14 & v9 | v9 ^ 1u);

    if ((((v14 & v9) | v9 ^ 1) & 1) != 0)
    {
      -[UISystemKeyboardDockController updateDockItemsVisibility](self->_dockViewController, "updateDockItemsVisibility");
    }
    else
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "responder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "inputAssistantItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_dictationReplacementAction");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      -[UISystemKeyboardDockController updateDockItemsVisibilityWithCustomDictationAction:](self->_dockViewController, "updateDockItemsVisibilityWithCustomDictationAction:", v19);
    }
  }
}

- (void)updateViewConstraints
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UIInputSetHostView *v13;
  UIInputSetHostView *v14;
  UIInputSetHostView *v15;
  UIInputSetHostView *hostView;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *inputViewEdgeConstraints;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSMutableDictionary *v32;
  UIInputSetHostView *v33;
  uint64_t v34;
  id v35;
  void *v36;
  NSMutableDictionary *v37;
  UIInputSetHostView *v38;
  id v39;
  void *v40;
  NSMutableDictionary *v41;
  void *v42;
  NSMutableDictionary *v43;
  void *v44;
  UIKBInputBackdropView *v45;
  NSMutableDictionary *v46;
  NSMutableDictionary *inputBackdropBackgroundViewEdgeConstraints;
  UIView *v48;
  NSMutableDictionary *v49;
  UIInputSetHostView *v50;
  UIView *v51;
  id v52;
  NSMutableDictionary *v53;
  UIInputSetHostView *v54;
  UIView *v55;
  id v56;
  NSMutableDictionary *v57;
  UIView *v58;
  id v59;
  void *v60;
  NSMutableDictionary *v61;
  id v62;
  id v63;
  NSMutableDictionary *inputBackdropViewEdgeConstraints;
  NSMutableDictionary *v65;
  NSMutableDictionary *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _UIKBLightEffectsBackground *inputCombinedBackdropView;
  void *v72;
  NSMutableDictionary *inputCombinedBackdropViewEdgeConstraints;
  NSMutableDictionary *v74;
  NSMutableDictionary *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _UIKBLightEffectsBackground *v84;
  NSMutableDictionary *v85;
  _UIKBLightEffectsBackground *v86;
  id v87;
  void *v88;
  NSMutableDictionary *v89;
  _UIKBLightEffectsBackground *v90;
  id v91;
  void *v92;
  NSMutableDictionary *v93;
  id v94;
  _UIKBLightEffectsBackground *v95;
  void *v96;
  NSMutableDictionary *v97;
  id v98;
  _UIKBLightEffectsBackground *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  NSMutableDictionary *v106;
  NSMutableDictionary *backdropInnerGuideConstraints;
  _UIKBLightEffectsBackground *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t i;
  void *v115;
  NSMutableDictionary *v116;
  void *v117;
  id v118;
  void *v119;
  NSMutableDictionary *v120;
  void *v121;
  id v122;
  void *v123;
  NSMutableDictionary *v124;
  void *v125;
  id v126;
  void *v127;
  NSMutableDictionary *v128;
  void *v129;
  id v130;
  void *v131;
  NSMutableDictionary *v132;
  void *v133;
  void *v134;
  NSMutableDictionary *v135;
  void *v136;
  void *v137;
  void *v138;
  UIInputSetHostView *v139;
  UIInputSetHostView *v140;
  _BOOL4 v141;
  NSMutableDictionary *inputDockViewEdgeConstraints;
  NSMutableDictionary *v143;
  NSMutableDictionary *v144;
  UIInputSetHostView *v145;
  id v146;
  void *v147;
  NSMutableDictionary *v148;
  UIInputSetHostView *v149;
  id v150;
  void *v151;
  UIInputSetHostView *v152;
  UIInputSetHostView *v153;
  NSMutableDictionary *v154;
  id v155;
  NSMutableDictionary *v156;
  UIInputSetHostView *v157;
  id v158;
  void *v159;
  void *v160;
  UIInputSetHostView *v161;
  UIInputSetHostView *v162;
  void *v163;
  void *v164;
  char v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  NSMutableDictionary *v169;
  NSMutableDictionary *assistantViewEdgeConstraints;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  double v174;
  double v175;
  uint64_t v176;
  uint64_t v177;
  double v178;
  double v179;
  NSMutableDictionary *v180;
  UIInputSetHostView *v181;
  uint64_t v182;
  UIInputSetHostView *v183;
  void *v184;
  NSMutableDictionary *v185;
  UIInputSetHostView *v186;
  UIInputSetHostView *v187;
  void *v188;
  NSMutableDictionary *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  NSMutableDictionary *v194;
  void *v195;
  UIKBInputBackdropView *v196;
  _BOOL4 v197;
  NSMutableDictionary *assistantBackdropViewEdgeConstraints;
  NSMutableDictionary *v199;
  NSMutableDictionary *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  UIInputSetHostView *v205;
  UIInputSetHostView *v206;
  UIInputSetHostView *v207;
  UIInputSetHostView *v208;
  uint64_t v209;
  void *v210;
  int v211;
  UIInputSetHostView *v212;
  NSMutableDictionary *accessoryViewEdgeConstraints;
  void *v214;
  int v215;
  NSMutableDictionary *v216;
  NSMutableDictionary *v217;
  void *v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  NSMutableDictionary *v227;
  UIInputSetHostView *v228;
  uint64_t v229;
  id v230;
  void *v231;
  NSMutableDictionary *v232;
  UIInputSetHostView *v233;
  id v234;
  void *v235;
  NSMutableDictionary *v236;
  UIInputSetHostView *v237;
  id v238;
  void *v239;
  NSMutableDictionary *v240;
  void *v241;
  UIKBInputBackdropView *v242;
  _BOOL4 v243;
  NSMutableDictionary *accessoryBackdropViewEdgeConstraints;
  unint64_t v245;
  NSMutableDictionary *v246;
  NSMutableDictionary *v247;
  void *v248;
  void *v249;
  void *v250;
  id v251;
  void *v252;
  _UIKBLightEffectsBackground *v253;
  id v254;
  UIKBInputBackdropView *v255;
  id v256;
  uint64_t v257;
  id v258;
  uint64_t v259;
  UIInputSetHostView *v260;
  id v261;
  UIInputSetHostView *v262;
  BOOL v263;
  id v264;
  uint64_t v265;
  void *v266;
  UIInputSetHostView *v267;
  UIInputSetHostView *v268;
  _QWORD v269[4];
  id v270;
  UIInputSetHostView *v271;
  uint64_t v272;
  _QWORD v273[4];
  id v274;
  UIInputWindowControllerHostingItem *v275;
  _QWORD v276[4];
  id v277;
  UIInputWindowControllerHostingItem *v278;
  double v279;
  double v280;
  double v281;
  double v282;
  _QWORD v283[4];
  id v284;
  UIInputWindowControllerHostingItem *v285;
  double v286;
  double v287;
  double v288;
  double v289;
  _QWORD v290[4];
  UIInputSetHostView *v291;
  id v292;
  uint64_t v293;
  _QWORD v294[4];
  UIInputSetHostView *v295;
  id v296;
  uint64_t v297;
  _QWORD v298[4];
  UIInputSetHostView *v299;
  UIInputWindowControllerHostingItem *v300;
  uint64_t v301;
  double v302;
  uint64_t v303;
  double v304;
  _QWORD v305[4];
  UIInputSetHostView *v306;
  UIInputWindowControllerHostingItem *v307;
  uint64_t v308;
  double v309;
  uint64_t v310;
  double v311;
  _QWORD v312[4];
  id v313;
  UIInputWindowControllerHostingItem *v314;
  _QWORD v315[4];
  id v316;
  id v317;
  _QWORD v318[4];
  id v319;
  UIInputWindowControllerHostingItem *v320;
  _QWORD v321[4];
  id v322;
  UIInputWindowControllerHostingItem *v323;
  _QWORD v324[4];
  id v325;
  UIInputWindowControllerHostingItem *v326;
  _QWORD v327[5];
  _QWORD v328[4];
  id v329;
  UIInputWindowControllerHostingItem *v330;
  _QWORD v331[4];
  id v332;
  UIInputWindowControllerHostingItem *v333;
  _QWORD v334[5];
  id v335;
  _QWORD v336[5];
  id v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  _QWORD v342[4];
  id v343;
  _UIKBLightEffectsBackground *v344;
  _QWORD v345[4];
  id v346;
  _UIKBLightEffectsBackground *v347;
  _QWORD v348[4];
  _UIKBLightEffectsBackground *v349;
  id v350;
  _QWORD v351[4];
  _UIKBLightEffectsBackground *v352;
  id v353;
  _QWORD v354[4];
  UIView *v355;
  id v356;
  _QWORD v357[4];
  UIView *v358;
  id v359;
  _QWORD v360[4];
  UIView *v361;
  UIInputWindowControllerHostingItem *v362;
  _QWORD v363[4];
  UIView *v364;
  UIInputWindowControllerHostingItem *v365;
  uint64_t v366;
  uint64_t v367;
  id (*v368)(uint64_t);
  void *v369;
  id v370;
  UIInputWindowControllerHostingItem *v371;
  double v372;
  double v373;
  double v374;
  double v375;
  _QWORD v376[4];
  id v377;
  id v378;
  uint64_t v379;
  double v380;
  double v381;
  double v382;
  double v383;
  _QWORD v384[4];
  id v385;
  UIInputWindowControllerHostingItem *v386;
  double v387;
  double v388;
  double v389;
  double v390;
  _QWORD v391[4];
  id v392;
  UIInputWindowControllerHostingItem *v393;
  double v394;
  double v395;
  double v396;
  double v397;
  _BYTE v398[128];
  _QWORD v399[5];

  v399[3] = *MEMORY[0x1E0C80C00];
  -[UIInputWindowControllerHostingItem container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useCrescendoHostingItem");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0x1E0D15000uLL;
    if (objc_msgSend(v6, "isRotating"))
    {
      v8 = -[NSMutableDictionary count](self->_inputViewEdgeConstraints, "count");

      if (v8)
      {
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateKeyboardDockViewVisibility");

        -[UIInputWindowControllerHostingItem updateViewSizingConstraints:](self, "updateViewSizingConstraints:", v5);
        objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v5);
        -[UIInputWindowControllerHostingItem updateConstraintInsets](self, "updateConstraintInsets");
LABEL_137:

        return;
      }
    }
    else
    {

    }
    -[UIInputWindowControllerHostingItem updateViewSizingConstraints:](self, "updateViewSizingConstraints:", v5);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v5);
    objc_msgSend(v5, "removeAllObjects");
    -[UIInputWindowControllerHostingItem inputView](self, "inputView");
    v10 = objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem inputAssistantView](self, "inputAssistantView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem inputAccessoryView](self, "inputAccessoryView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    if (+[UIKeyboardImpl shouldMergeAssistantBarWithKeyboardLayout](UIKeyboardImpl, "shouldMergeAssistantBarWithKeyboardLayout")|| (v14 = v13, -[UIView isHidden](v13, "isHidden")))
    {

      v14 = 0;
    }
    objc_msgSend((id)v10, "superview");
    v15 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
    hostView = self->_hostView;

    v265 = v10;
    v266 = v12;
    v263 = v15 == hostView;
    if (v15 != hostView)
    {
      if (-[NSMutableDictionary count](self->_inputViewEdgeConstraints, "count"))
        -[UIInputWindowControllerHostingItem clearInputViewEdgeConstraints](self, "clearInputViewEdgeConstraints");
LABEL_82:
      -[UIView superview](v13, "superview");
      v161 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
      v162 = self->_hostView;

      if (v161 != v162)
      {
        if (-[NSMutableDictionary count](self->_assistantViewEdgeConstraints, "count"))
        {
          -[UIInputWindowControllerHostingItem clearInputAssistantViewEdgeConstraints](self, "clearInputAssistantViewEdgeConstraints");
          if (-[NSMutableDictionary count](self->_assistantBackdropViewEdgeConstraints, "count"))
          {
            v163 = *(void **)(v7 + 1760);
            -[NSMutableDictionary allValues](self->_assistantBackdropViewEdgeConstraints, "allValues");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "deactivateConstraints:", v164);

            -[NSMutableDictionary removeAllObjects](self->_assistantBackdropViewEdgeConstraints, "removeAllObjects");
          }
        }
        v165 = v263;
LABEL_109:
        objc_msgSend(v12, "superview");
        v205 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
        v206 = self->_hostView;

        if (v205 == v206)
        {
          v262 = v13;
          -[NSLayoutConstraint setActive:](self->_emptyHeightConstraint, "setActive:", 0);
          v207 = v14;
          if (!v14)
          {
            v207 = (UIInputSetHostView *)v10;
            if (!v10)
              v207 = self->_hostView;
          }
          v208 = v207;
          if ((unint64_t)v14 | v10)
            v209 = 3;
          else
            v209 = 4;
          -[UIInputWindowControllerHostingItem owner](self, "owner");
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v211 = objc_msgSend(v210, "forceAccessoryViewToBottomOfHostView");

          if (v211)
          {
            v212 = self->_hostView;

            v209 = 4;
            v208 = v212;
          }
          accessoryViewEdgeConstraints = self->_accessoryViewEdgeConstraints;
          if (accessoryViewEdgeConstraints)
          {
            if (-[NSMutableDictionary count](accessoryViewEdgeConstraints, "count"))
            {
              -[UIInputWindowControllerHostingItem owner](self, "owner");
              v214 = (void *)objc_claimAutoreleasedReturnValue();
              v215 = objc_msgSend(v214, "isTransitioningBetweenKeyboardStates");

              if (v215)
                -[UIInputWindowControllerHostingItem clearInputAccessoryViewEdgeConstraints](self, "clearInputAccessoryViewEdgeConstraints");
            }
          }
          else
          {
            v216 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
            v217 = self->_accessoryViewEdgeConstraints;
            self->_accessoryViewEdgeConstraints = v216;

          }
          -[UIInputWindowControllerHostingItem inputAccessoryViewController](self, "inputAccessoryViewController");
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInputWindowControllerHostingItem _aligningInsetsForChildInputViewController:includeSceneBounds:](self, "_aligningInsetsForChildInputViewController:includeSceneBounds:", v218, 1);
          v220 = v219;
          v222 = v221;
          v224 = v223;
          v226 = v225;

          v227 = self->_accessoryViewEdgeConstraints;
          v228 = self->_hostView;
          v229 = MEMORY[0x1E0C809B0];
          v283[0] = MEMORY[0x1E0C809B0];
          v283[1] = 3221225472;
          v283[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_27;
          v283[3] = &unk_1E16D6178;
          v230 = v12;
          v284 = v230;
          v285 = self;
          v286 = v220;
          v287 = v222;
          v288 = v224;
          v289 = v226;
          -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v227, &unk_1E1A98D30, v230, v228, v5, v283);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v231, "setConstant:", v222);

          v232 = self->_accessoryViewEdgeConstraints;
          v233 = self->_hostView;
          v276[0] = v229;
          v276[1] = 3221225472;
          v276[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_28;
          v276[3] = &unk_1E16D6178;
          v234 = v230;
          v277 = v234;
          v278 = self;
          v279 = v220;
          v280 = v222;
          v281 = v224;
          v282 = v226;
          -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v232, &unk_1E1A98D48, v234, v233, v5, v276);
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v235, "setConstant:", v226);

          v236 = self->_accessoryViewEdgeConstraints;
          v237 = self->_hostView;
          v273[0] = v229;
          v273[1] = 3221225472;
          v273[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_29;
          v273[3] = &unk_1E16D61C8;
          v238 = v234;
          v274 = v238;
          v275 = self;
          -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v236, &unk_1E1A98D60, v238, v237, v5, v273);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "setConstant:", v220);

          if (-[UIView isDescendantOfView:](v208, "isDescendantOfView:", self->_hostView))
          {
            v240 = self->_accessoryViewEdgeConstraints;
            v269[0] = v229;
            v269[1] = 3221225472;
            v269[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_30;
            v269[3] = &unk_1E16D6218;
            v270 = v238;
            v271 = v208;
            v272 = v209;
            -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v240, &unk_1E1A98D78, v270, v271, v5, v269);
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v241, "setConstant:", v224);

          }
          v242 = self->_inputAccessoryBackdropView;
          v243 = -[UIView isDescendantOfView:](v242, "isDescendantOfView:", self->_hostView);
          accessoryBackdropViewEdgeConstraints = self->_accessoryBackdropViewEdgeConstraints;
          v10 = v265;
          if (v243)
          {
            v245 = 0x1E0D15000;
            if (!accessoryBackdropViewEdgeConstraints)
            {
              v246 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
              v247 = self->_accessoryBackdropViewEdgeConstraints;
              self->_accessoryBackdropViewEdgeConstraints = v246;

              accessoryBackdropViewEdgeConstraints = self->_accessoryBackdropViewEdgeConstraints;
            }
            -[UIInputWindowControllerHostingItem rebuildConstraints:forView:toMatchView:tracker:](self, "rebuildConstraints:forView:toMatchView:tracker:", accessoryBackdropViewEdgeConstraints, v242, v238, v5);
          }
          else
          {
            v245 = 0x1E0D15000uLL;
            if (-[NSMutableDictionary count](self->_accessoryBackdropViewEdgeConstraints, "count"))
            {
              v248 = (void *)MEMORY[0x1E0D156E0];
              -[NSMutableDictionary allValues](self->_accessoryBackdropViewEdgeConstraints, "allValues");
              v249 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v248, "deactivateConstraints:", v249);

              -[NSMutableDictionary removeAllObjects](self->_accessoryBackdropViewEdgeConstraints, "removeAllObjects");
            }
          }

          objc_msgSend(*(id *)(v245 + 1760), "activateConstraints:", v5);
          v12 = v266;
          v13 = v262;
        }
        else
        {
          if (-[NSMutableDictionary count](self->_accessoryViewEdgeConstraints, "count"))
            -[UIInputWindowControllerHostingItem clearInputAccessoryViewEdgeConstraints](self, "clearInputAccessoryViewEdgeConstraints");
          objc_msgSend(*(id *)(v7 + 1760), "activateConstraints:", v5);
          if ((v165 & 1) == 0)
            -[NSLayoutConstraint setActive:](self->_emptyHeightConstraint, "setActive:", 1);
        }
        -[UIInputWindowControllerHostingItem updateConstraintInsets](self, "updateConstraintInsets");
        -[UIInputWindowControllerHostingItem placement](self, "placement");
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowControllerHostingItem updateVisibilityConstraintsForPlacement:](self, "updateVisibilityConstraintsForPlacement:", v250);

        goto LABEL_137;
      }
      -[NSLayoutConstraint setActive:](self->_emptyHeightConstraint, "setActive:", 0);
      if (v12)
      {
        v264 = v12;
        if (v10)
        {
LABEL_89:
          v261 = (id)v10;
          v166 = 3;
LABEL_92:
          v257 = v166;
          v268 = v14;
          v167 = v7;
          v168 = 3;
          if (v12)
            v168 = 4;
          v259 = v168;
          if (!self->_assistantViewEdgeConstraints)
          {
            v169 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
            assistantViewEdgeConstraints = self->_assistantViewEdgeConstraints;
            self->_assistantViewEdgeConstraints = v169;

          }
          -[UIInputWindowControllerHostingItem inputAssistantViewController](self, "inputAssistantViewController");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInputWindowControllerHostingItem _aligningInsetsForChildInputViewController:includeSceneBounds:](self, "_aligningInsetsForChildInputViewController:includeSceneBounds:", v171, 0);
          v173 = v172;
          v175 = v174;
          v177 = v176;
          v179 = v178;

          v180 = self->_assistantViewEdgeConstraints;
          v181 = self->_hostView;
          v182 = MEMORY[0x1E0C809B0];
          v305[0] = MEMORY[0x1E0C809B0];
          v305[1] = 3221225472;
          v305[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_23;
          v305[3] = &unk_1E16D6178;
          v183 = v13;
          v306 = v183;
          v307 = self;
          v308 = v173;
          v309 = v175;
          v310 = v177;
          v311 = v179;
          -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v180, &unk_1E1A98D30, v183, v181, v5, v305);
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v184, "setConstant:", v175);

          v185 = self->_assistantViewEdgeConstraints;
          v186 = self->_hostView;
          v298[0] = v182;
          v298[1] = 3221225472;
          v298[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_24;
          v298[3] = &unk_1E16D6178;
          v187 = v183;
          v299 = v187;
          v300 = self;
          v301 = v173;
          v302 = v175;
          v303 = v177;
          v304 = v179;
          -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v185, &unk_1E1A98D48, v187, v186, v5, v298);
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v188, "setConstant:", v179);

          if (objc_msgSend(v264, "isDescendantOfView:", self->_hostView))
          {
            v189 = self->_assistantViewEdgeConstraints;
            v294[0] = v182;
            v294[1] = 3221225472;
            v294[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_25;
            v294[3] = &unk_1E16D6218;
            v295 = v187;
            v296 = v264;
            v297 = v259;
            -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v189, &unk_1E1A98D60, v295, v296, v5, v294);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v190, "setConstant:", 0.0);

          }
          v7 = v167;
          if (+[UIKeyboardImpl shouldMergeAssistantBarWithKeyboardLayout](UIKeyboardImpl, "shouldMergeAssistantBarWithKeyboardLayout"))
          {
            -[NSMutableDictionary objectForKey:](self->_assistantViewEdgeConstraints, "objectForKey:", &unk_1E1A98D78);
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "removeObject:", v191);

            -[NSMutableDictionary objectForKey:](self->_assistantViewEdgeConstraints, "objectForKey:", &unk_1E1A98D78);
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "setActive:", 0);

            -[NSMutableDictionary removeObjectForKey:](self->_assistantViewEdgeConstraints, "removeObjectForKey:", &unk_1E1A98D78);
            v193 = v261;
          }
          else
          {
            v193 = v261;
            if (objc_msgSend(v261, "isDescendantOfView:", self->_hostView))
            {
              v194 = self->_assistantViewEdgeConstraints;
              v290[0] = v182;
              v290[1] = 3221225472;
              v290[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_26;
              v290[3] = &unk_1E16D6218;
              v291 = v187;
              v292 = v261;
              v293 = v257;
              -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v194, &unk_1E1A98D78, v291, v292, v5, v290);
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v195, "setConstant:", 0.0);

            }
          }
          v196 = self->_inputAssistantBackdropView;
          v197 = -[UIView isDescendantOfView:](v196, "isDescendantOfView:", self->_hostView);
          assistantBackdropViewEdgeConstraints = self->_assistantBackdropViewEdgeConstraints;
          if (v197)
          {
            v14 = v268;
            if (!assistantBackdropViewEdgeConstraints)
            {
              v199 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
              v200 = self->_assistantBackdropViewEdgeConstraints;
              self->_assistantBackdropViewEdgeConstraints = v199;

              assistantBackdropViewEdgeConstraints = self->_assistantBackdropViewEdgeConstraints;
            }
            -[UIInputWindowControllerHostingItem rebuildConstraints:forView:toMatchView:tracker:](self, "rebuildConstraints:forView:toMatchView:tracker:", assistantBackdropViewEdgeConstraints, v196, v187, v5);
            -[NSMutableDictionary objectForKey:](self->_assistantBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D30);
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v201, "setConstant:", -v175);

            -[NSMutableDictionary objectForKey:](self->_assistantBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D48);
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v202, "setConstant:", -v179);

          }
          else
          {
            v14 = v268;
            if (-[NSMutableDictionary count](self->_assistantBackdropViewEdgeConstraints, "count"))
            {
              v203 = *(void **)(v7 + 1760);
              -[NSMutableDictionary allValues](self->_assistantBackdropViewEdgeConstraints, "allValues");
              v204 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v203, "deactivateConstraints:", v204);

              -[NSMutableDictionary removeAllObjects](self->_assistantBackdropViewEdgeConstraints, "removeAllObjects");
            }
          }

          v165 = 1;
          v10 = v265;
          v12 = v266;
          goto LABEL_109;
        }
      }
      else
      {
        -[UIInputWindowControllerHostingItem hostView](self, "hostView");
        v264 = (id)objc_claimAutoreleasedReturnValue();

        if (v10)
          goto LABEL_89;
      }
      -[UIInputWindowControllerHostingItem hostView](self, "hostView");
      v261 = (id)objc_claimAutoreleasedReturnValue();

      v166 = 4;
      goto LABEL_92;
    }
    -[NSLayoutConstraint setActive:](self->_emptyHeightConstraint, "setActive:", 0);
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
      && !+[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard"))
    {

    }
    else if (v14)
    {
      v17 = 1;
      v18 = v14;
      goto LABEL_19;
    }
    if (!v12)
    {
      -[UIInputWindowControllerHostingItem hostView](self, "hostView");
      v258 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v17 = 0;
LABEL_20:
      v267 = v14;
      v260 = v13;
      if (v12)
        v19 = 1;
      else
        v19 = v17;
      if (v19)
        v20 = 4;
      else
        v20 = 3;
      if (!self->_inputViewEdgeConstraints)
      {
        v21 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
        inputViewEdgeConstraints = self->_inputViewEdgeConstraints;
        self->_inputViewEdgeConstraints = v21;

      }
      -[UIInputWindowControllerHostingItem inputViewController](self, "inputViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowControllerHostingItem _aligningInsetsForChildInputViewController:includeSceneBounds:](self, "_aligningInsetsForChildInputViewController:includeSceneBounds:", v23, 0);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;

      v32 = self->_inputViewEdgeConstraints;
      v33 = self->_hostView;
      v34 = MEMORY[0x1E0C809B0];
      v391[0] = MEMORY[0x1E0C809B0];
      v391[1] = 3221225472;
      v391[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke;
      v391[3] = &unk_1E16D6178;
      v35 = (id)v10;
      v392 = v35;
      v393 = self;
      v394 = v25;
      v395 = v27;
      v396 = v29;
      v397 = v31;
      -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v32, &unk_1E1A98D30, v35, v33, v5, v391);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setConstant:", v27);

      v37 = self->_inputViewEdgeConstraints;
      v38 = self->_hostView;
      v384[0] = v34;
      v384[1] = 3221225472;
      v384[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_2;
      v384[3] = &unk_1E16D6178;
      v39 = v35;
      v385 = v39;
      v386 = self;
      v387 = v25;
      v388 = v27;
      v389 = v29;
      v390 = v31;
      -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v37, &unk_1E1A98D48, v39, v38, v5, v384);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setConstant:", v31);

      if (objc_msgSend(v258, "isDescendantOfView:", self->_hostView))
      {
        v41 = self->_inputViewEdgeConstraints;
        v376[0] = v34;
        v376[1] = 3221225472;
        v376[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_3;
        v376[3] = &unk_1E16D61A0;
        v377 = v39;
        v378 = v258;
        v379 = v20;
        v380 = v25;
        v381 = v27;
        v382 = v29;
        v383 = v31;
        -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v41, &unk_1E1A98D60, v377, v378, v5, v376);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setConstant:", v25);

      }
      v43 = self->_inputViewEdgeConstraints;
      v366 = v34;
      v367 = 3221225472;
      v368 = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_4;
      v369 = &unk_1E16D6178;
      v370 = v39;
      v371 = self;
      v372 = v25;
      v373 = v27;
      v374 = v29;
      v375 = v31;
      v256 = v370;
      -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v43, &unk_1E1A98D78);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setConstant:", v29);

      v45 = self->_inputBackdropView;
      if (-[UIView isDescendantOfView:](v45, "isDescendantOfView:", self->_hostView))
      {
        if (!self->_inputBackdropBackgroundViewEdgeConstraints)
        {
          v46 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
          inputBackdropBackgroundViewEdgeConstraints = self->_inputBackdropBackgroundViewEdgeConstraints;
          self->_inputBackdropBackgroundViewEdgeConstraints = v46;

        }
        v48 = self->_inputBackdropBackgroundView;
        v12 = v266;
        if (-[UIView isDescendantOfView:](v48, "isDescendantOfView:", self->_hostView))
        {
          v49 = self->_inputBackdropBackgroundViewEdgeConstraints;
          v50 = self->_hostView;
          v363[0] = v34;
          v363[1] = 3221225472;
          v363[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_5;
          v363[3] = &unk_1E16D61C8;
          v51 = v48;
          v364 = v51;
          v365 = self;
          v52 = -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v49, &unk_1E1A98D30, v51, v50, v5, v363);
          v53 = self->_inputBackdropBackgroundViewEdgeConstraints;
          v54 = self->_hostView;
          v360[0] = v34;
          v360[1] = 3221225472;
          v360[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_6;
          v360[3] = &unk_1E16D61C8;
          v55 = v51;
          v361 = v55;
          v362 = self;
          v56 = -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v53, &unk_1E1A98D48, v55, v54, v5, v360);
          v57 = self->_inputBackdropBackgroundViewEdgeConstraints;
          v357[0] = v34;
          v357[1] = 3221225472;
          v357[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_7;
          v357[3] = &unk_1E16D61C8;
          v58 = v55;
          v358 = v58;
          v59 = v256;
          v359 = v59;
          -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v57, &unk_1E1A98D60, v58, v59, v5, v357);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setConstant:", v25);

          v61 = self->_inputBackdropBackgroundViewEdgeConstraints;
          v354[0] = v34;
          v354[1] = 3221225472;
          v354[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_8;
          v354[3] = &unk_1E16D61C8;
          v355 = v58;
          v62 = v59;
          v7 = 0x1E0D15000;
          v356 = v62;
          v63 = -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v61, CFSTR("height"), v355, v62, v5, v354);

        }
        inputBackdropViewEdgeConstraints = self->_inputBackdropViewEdgeConstraints;
        if (!inputBackdropViewEdgeConstraints)
        {
          v65 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
          v66 = self->_inputBackdropViewEdgeConstraints;
          self->_inputBackdropViewEdgeConstraints = v65;

          inputBackdropViewEdgeConstraints = self->_inputBackdropViewEdgeConstraints;
        }
        -[UIInputWindowControllerHostingItem rebuildConstraints:forView:toMatchView:tracker:](self, "rebuildConstraints:forView:toMatchView:tracker:", inputBackdropViewEdgeConstraints, v45, self->_inputBackdropBackgroundView, v5);

      }
      else
      {
        if (-[NSMutableDictionary count](self->_inputBackdropViewEdgeConstraints, "count"))
        {
          v67 = (void *)MEMORY[0x1E0D156E0];
          -[NSMutableDictionary allValues](self->_inputBackdropViewEdgeConstraints, "allValues");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "deactivateConstraints:", v68);

          -[NSMutableDictionary removeAllObjects](self->_inputBackdropViewEdgeConstraints, "removeAllObjects");
        }
        v12 = v266;
        if (-[NSMutableDictionary count](self->_inputBackdropBackgroundViewEdgeConstraints, "count"))
        {
          v69 = (void *)MEMORY[0x1E0D156E0];
          -[NSMutableDictionary allValues](self->_inputBackdropBackgroundViewEdgeConstraints, "allValues");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "deactivateConstraints:", v70);

          -[NSMutableDictionary removeAllObjects](self->_inputBackdropBackgroundViewEdgeConstraints, "removeAllObjects");
        }
      }
      inputCombinedBackdropView = self->_inputCombinedBackdropView;
      -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(inputCombinedBackdropView) = -[UIView isDescendantOfView:](inputCombinedBackdropView, "isDescendantOfView:", v72);

      inputCombinedBackdropViewEdgeConstraints = self->_inputCombinedBackdropViewEdgeConstraints;
      if ((_DWORD)inputCombinedBackdropView)
      {
        if (!inputCombinedBackdropViewEdgeConstraints)
        {
          v74 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
          v75 = self->_inputCombinedBackdropViewEdgeConstraints;
          self->_inputCombinedBackdropViewEdgeConstraints = v74;

        }
        -[UIInputWindowControllerHostingItem applicator](self, "applicator");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "backdropContainer");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v77;
        if (v77)
        {
          v79 = v77;
        }
        else
        {
          -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
          v79 = (id)objc_claimAutoreleasedReturnValue();

        }
        v84 = self->_inputCombinedBackdropView;
        v85 = self->_inputCombinedBackdropViewEdgeConstraints;
        v351[0] = v34;
        v351[1] = 3221225472;
        v351[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_9;
        v351[3] = &unk_1E16D61C8;
        v86 = v84;
        v352 = v86;
        v87 = v79;
        v353 = v87;
        -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v85, &unk_1E1A98D60, v86, v87, v5, v351);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setConstant:", 0.0);

        v89 = self->_inputCombinedBackdropViewEdgeConstraints;
        v348[0] = v34;
        v348[1] = 3221225472;
        v348[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_10;
        v348[3] = &unk_1E16D61C8;
        v90 = v86;
        v349 = v90;
        v91 = v87;
        v350 = v91;
        -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v89, &unk_1E1A98D30, v90, v91, v5, v348);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setConstant:", 0.0);

        v93 = self->_inputCombinedBackdropViewEdgeConstraints;
        v345[0] = v34;
        v345[1] = 3221225472;
        v345[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_11;
        v345[3] = &unk_1E16D61C8;
        v94 = v91;
        v346 = v94;
        v95 = v90;
        v347 = v95;
        -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v93, &unk_1E1A98D78, v94, v95, v5, v345);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setConstant:", 0.0);

        v97 = self->_inputCombinedBackdropViewEdgeConstraints;
        v342[0] = v34;
        v342[1] = 3221225472;
        v342[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_12;
        v342[3] = &unk_1E16D61C8;
        v98 = v94;
        v343 = v98;
        v99 = v95;
        v344 = v99;
        -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v97, &unk_1E1A98D48, v98, v99, v5, v342);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setConstant:", 0.0);

        if (v256)
        {
          objc_msgSend(v256, "superview");
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          if (v101)
          {
            v254 = v98;
            -[UIInputWindowControllerHostingItem applicator](self, "applicator");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "backdropContainer");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v103;
            if (v103)
            {
              v105 = v103;
            }
            else
            {
              -[UIInputWindowControllerHostingItem hostView](self, "hostView");
              v105 = (id)objc_claimAutoreleasedReturnValue();

            }
            if (!self->_backdropInnerGuideConstraints)
            {
              v106 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              backdropInnerGuideConstraints = self->_backdropInnerGuideConstraints;
              self->_backdropInnerGuideConstraints = v106;

            }
            v253 = v99;
            v108 = self->_inputCombinedBackdropView;
            v399[0] = v256;
            v399[1] = v108;
            v399[2] = v105;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v399, 3);
            v109 = objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](self->_backdropInnerGuideConstraints, "objectForKey:", CFSTR("items"));
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = v109;
            if ((objc_msgSend(v252, "isEqual:", v109) & 1) == 0)
            {
              v255 = v45;
              v341 = 0u;
              v340 = 0u;
              v339 = 0u;
              v338 = 0u;
              v111 = objc_msgSend(&unk_1E1A94178, "countByEnumeratingWithState:objects:count:", &v338, v398, 16);
              if (v111)
              {
                v112 = v111;
                v113 = *(_QWORD *)v339;
                do
                {
                  for (i = 0; i != v112; ++i)
                  {
                    if (*(_QWORD *)v339 != v113)
                      objc_enumerationMutation(&unk_1E1A94178);
                    -[NSMutableDictionary objectForKey:](self->_backdropInnerGuideConstraints, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v338 + 1) + 8 * i));
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v115, "setActive:", 0);

                  }
                  v112 = objc_msgSend(&unk_1E1A94178, "countByEnumeratingWithState:objects:count:", &v338, v398, 16);
                }
                while (v112);
              }
              -[NSMutableDictionary removeAllObjects](self->_backdropInnerGuideConstraints, "removeAllObjects");
              v14 = v267;
              v45 = v255;
            }
            -[NSMutableDictionary setObject:forKey:](self->_backdropInnerGuideConstraints, "setObject:forKey:", v110, CFSTR("items"), v110);
            v116 = self->_backdropInnerGuideConstraints;
            -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self->_inputCombinedBackdropView, "fullBackdropLayoutGuide");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v336[0] = v34;
            v336[1] = 3221225472;
            v336[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_13;
            v336[3] = &unk_1E16D61C8;
            v336[4] = self;
            v118 = v105;
            v337 = v118;
            -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:", v116, &unk_1E1A98D60, v117, v118, v5, v336);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "setConstant:", 0.0);

            v120 = self->_backdropInnerGuideConstraints;
            -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self->_inputCombinedBackdropView, "fullBackdropLayoutGuide");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v334[0] = v34;
            v334[1] = 3221225472;
            v334[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_14;
            v334[3] = &unk_1E16D61C8;
            v334[4] = self;
            v122 = v118;
            v335 = v122;
            -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:", v120, &unk_1E1A98D30, v121, v122, v5, v334);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "setConstant:", 0.0);

            v124 = self->_backdropInnerGuideConstraints;
            -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self->_inputCombinedBackdropView, "fullBackdropLayoutGuide");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v331[0] = v34;
            v331[1] = 3221225472;
            v331[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_15;
            v331[3] = &unk_1E16D61C8;
            v126 = v122;
            v332 = v126;
            v333 = self;
            -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:", v124, &unk_1E1A98D78, v126, v125, v5, v331);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "setConstant:", 0.0);

            v128 = self->_backdropInnerGuideConstraints;
            -[_UIKBLightEffectsBackground fullBackdropLayoutGuide](self->_inputCombinedBackdropView, "fullBackdropLayoutGuide");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v328[0] = v34;
            v328[1] = 3221225472;
            v328[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_16;
            v328[3] = &unk_1E16D61C8;
            v130 = v126;
            v329 = v130;
            v330 = self;
            -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:", v128, &unk_1E1A98D48, v130, v129, v5, v328);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "setConstant:", 0.0);

            v132 = self->_backdropInnerGuideConstraints;
            -[_UIKBLightEffectsBackground assistantLayoutGuide](self->_inputCombinedBackdropView, "assistantLayoutGuide");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            v327[0] = v34;
            v327[1] = 3221225472;
            v327[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_17;
            v327[3] = &unk_1E16D61F0;
            v327[4] = self;
            -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:", v132, CFSTR("inputBackdropGuides.assistantTop"), v133, v130, v5, v327);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "setConstant:", 0.0);

            v135 = self->_backdropInnerGuideConstraints;
            -[_UIKBLightEffectsBackground assistantLayoutGuide](self->_inputCombinedBackdropView, "assistantLayoutGuide");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v324[0] = v34;
            v324[1] = 3221225472;
            v324[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_18;
            v324[3] = &unk_1E16D61C8;
            v325 = v256;
            v326 = self;
            -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromItem:toItem:tracker:creator:", v135, CFSTR("inputBackdropGuides.assistantBottom"), v325, v136, v5, v324);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "setConstant:", 0.0);

            v99 = v253;
            v98 = v254;
          }
        }

        v7 = 0x1E0D15000uLL;
        v12 = v266;
      }
      else
      {
        if (-[NSMutableDictionary count](inputCombinedBackdropViewEdgeConstraints, "count"))
        {
          v80 = *(void **)(v7 + 1760);
          -[NSMutableDictionary allValues](self->_inputCombinedBackdropViewEdgeConstraints, "allValues");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "deactivateConstraints:", v81);

          -[NSMutableDictionary removeAllObjects](self->_inputCombinedBackdropViewEdgeConstraints, "removeAllObjects");
        }
        if (-[NSMutableDictionary count](self->_backdropInnerGuideConstraints, "count"))
        {
          -[NSMutableDictionary removeObjectForKey:](self->_backdropInnerGuideConstraints, "removeObjectForKey:", CFSTR("items"));
          v82 = *(void **)(v7 + 1760);
          -[NSMutableDictionary allValues](self->_backdropInnerGuideConstraints, "allValues");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "deactivateConstraints:", v83);

          -[NSMutableDictionary removeAllObjects](self->_backdropInnerGuideConstraints, "removeAllObjects");
        }
      }
      -[UIInputWindowControllerHostingItem dockView](self, "dockView");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "superview");
      v139 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
      v140 = v139;
      if (v139 == self->_hostView)
      {
        v141 = -[UIInputWindowControllerHostingItem _shouldShowInputDockView](self, "_shouldShowInputDockView");

        if (v141)
        {
          inputDockViewEdgeConstraints = self->_inputDockViewEdgeConstraints;
          if (!inputDockViewEdgeConstraints)
          {
            v143 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v144 = self->_inputDockViewEdgeConstraints;
            self->_inputDockViewEdgeConstraints = v143;

            inputDockViewEdgeConstraints = self->_inputDockViewEdgeConstraints;
          }
          v145 = self->_hostView;
          v321[0] = v34;
          v321[1] = 3221225472;
          v321[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_19;
          v321[3] = &unk_1E16D61C8;
          v146 = v138;
          v322 = v146;
          v323 = self;
          -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", inputDockViewEdgeConstraints, &unk_1E1A98D30, v146, v145, v5, v321);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "setConstant:", 0.0);

          v148 = self->_inputDockViewEdgeConstraints;
          v149 = self->_hostView;
          v318[0] = v34;
          v318[1] = 3221225472;
          v318[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_20;
          v318[3] = &unk_1E16D61C8;
          v150 = v146;
          v319 = v150;
          v320 = self;
          -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v148, &unk_1E1A98D48, v150, v149, v5, v318);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "setConstant:", 0.0);

          objc_msgSend(v256, "superview");
          v152 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
          v153 = self->_hostView;

          if (v152 == v153)
          {
            v154 = self->_inputDockViewEdgeConstraints;
            v315[0] = v34;
            v315[1] = 3221225472;
            v315[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_21;
            v315[3] = &unk_1E16D61C8;
            v316 = v150;
            v317 = v256;
            v155 = -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v154, &unk_1E1A98D60, v316, v317, v5, v315);

          }
          v156 = self->_inputDockViewEdgeConstraints;
          v157 = self->_hostView;
          v312[0] = v34;
          v312[1] = 3221225472;
          v312[2] = __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_22;
          v312[3] = &unk_1E16D61C8;
          v313 = v150;
          v314 = self;
          v158 = -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v156, &unk_1E1A98D78, v313, v157, v5, v312);

          v7 = 0x1E0D15000;
          v12 = v266;
          v14 = v267;
          goto LABEL_81;
        }
      }
      else
      {

      }
      if (-[NSMutableDictionary count](self->_inputDockViewEdgeConstraints, "count"))
      {
        v159 = *(void **)(v7 + 1760);
        -[NSMutableDictionary allValues](self->_inputDockViewEdgeConstraints, "allValues");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "deactivateConstraints:", v160);

        -[NSMutableDictionary removeAllObjects](self->_inputDockViewEdgeConstraints, "removeAllObjects");
      }
LABEL_81:

      v10 = v265;
      v13 = v260;
      goto LABEL_82;
    }
    v17 = 0;
    v14 = 0;
    v18 = v12;
LABEL_19:
    v258 = v18;
    goto LABEL_20;
  }
}

- (void)updateConstraintInsets
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
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIKBInputBackdropView *inputAssistantBackdropView;
  NSMutableDictionary *assistantBackdropViewEdgeConstraints;
  UIKBInputBackdropView *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  id v45;

  -[UIInputWindowControllerHostingItem inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInputWindowControllerHostingItem inputViewController](self, "inputViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem _aligningInsetsForChildInputViewController:includeSceneBounds:](self, "_aligningInsetsForChildInputViewController:includeSceneBounds:", v4, 0);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    __60__UIInputWindowControllerHostingItem_updateConstraintInsets__block_invoke(self->_inputViewEdgeConstraints, v6, v8, v10, v12);
  }
  -[UIInputWindowControllerHostingItem inputAssistantView](self, "inputAssistantView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIInputWindowControllerHostingItem inputAssistantViewController](self, "inputAssistantViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem _aligningInsetsForChildInputViewController:includeSceneBounds:](self, "_aligningInsetsForChildInputViewController:includeSceneBounds:", v14, 0);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    __60__UIInputWindowControllerHostingItem_updateConstraintInsets__block_invoke(self->_assistantViewEdgeConstraints, v16, v18, v20, v22);
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
    if (inputAssistantBackdropView)
    {
      assistantBackdropViewEdgeConstraints = self->_assistantBackdropViewEdgeConstraints;
      v25 = inputAssistantBackdropView;
      -[NSMutableDictionary objectForKey:](assistantBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setConstant:", -v18);

      -[NSMutableDictionary objectForKey:](self->_assistantBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D48);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setConstant:", -v22);

      v28 = -self->_backdropHeightDelta;
      -[NSMutableDictionary objectForKey:](self->_assistantBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D60);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "setConstant:", v28);
    }
  }
  -[UIInputWindowControllerHostingItem inputAccessoryView](self, "inputAccessoryView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[UIInputWindowControllerHostingItem inputAccessoryViewController](self, "inputAccessoryViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem _aligningInsetsForChildInputViewController:includeSceneBounds:](self, "_aligningInsetsForChildInputViewController:includeSceneBounds:", v31, 1);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    __60__UIInputWindowControllerHostingItem_updateConstraintInsets__block_invoke(self->_accessoryViewEdgeConstraints, v33, v35, v37, v39);
  }
  if (self->_inputBackdropView)
  {
    -[UIInputWindowControllerHostingItem inputViewController](self, "inputViewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem _aligningInsetsForChildInputViewController:includeSceneBounds:](self, "_aligningInsetsForChildInputViewController:includeSceneBounds:", v40, 0);
    v42 = v41;

    -[NSMutableDictionary objectForKey:](self->_inputBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D60);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v43 = -v42;
    objc_msgSend(v45, "setConstant:", v43);
    -[NSMutableDictionary objectForKey:](self->_inputBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D78);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setConstant:", v43);

  }
}

- (UIView)inputAccessoryView
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (objc_msgSend(WeakRetained, "host:isForPurpose:", self, 101))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_inputAccessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIView *)v5;
}

- (UIEdgeInsets)_aligningInsetsForChildInputViewController:(id)a3 includeSceneBounds:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  void *v8;
  int v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL IsEmpty;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGRect v74;
  UIEdgeInsets result;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "_alignsToContentViewController");
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldNotifyRemoteKeyboards") & v4;

  }
  else
  {
    v9 = 0;
  }
  v10 = 0.0;
  if (!v6)
  {
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    goto LABEL_20;
  }
  -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((id)v11 == v6)
  {

  }
  else
  {
    v12 = (void *)v11;
    -[UIInputWindowControllerHostingItem inputAssistantViewController](self, "inputAssistantViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 != v6)
    {
      -[UIInputWindowControllerHostingItem inputAccessoryViewController](self, "inputAccessoryViewController");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      if (v14 != v6)
        goto LABEL_20;
      -[UIInputWindowControllerHostingItem applicator](self, "applicator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "inputAccessoryPadding");
      goto LABEL_19;
    }
  }
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isCustomInputView");

  if (v24)
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hostedCustomInputView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      if (v26)
        goto LABEL_40;
    }
    else
    {
      -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      IsEmpty = CGRectIsEmpty(v74);

      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      if (IsEmpty)
        goto LABEL_40;
    }
  }
  -[UIInputWindowControllerHostingItem inputAssistantViewController](self, "inputAssistantViewController");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (v30 == v6)
  {
    -[UIInputWindowControllerHostingItem applicator](self, "applicator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inputAssistantPadding");
  }
  else
  {
    -[UIInputWindowControllerHostingItem container](self, "container");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_inputViewPadding");
  }
LABEL_19:
  v17 = v19;
  v16 = v20;
  v15 = v21;
  v10 = v22;

LABEL_20:
  if ((v7 | v9) != 1)
    goto LABEL_40;
  if (!v7)
    goto LABEL_29;
  objc_msgSend(v6, "_primaryContentResponder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v31;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_29;
    }
    objc_msgSend(v31, "view");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = v32;

  if (v33)
  {
    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    objc_msgSend(v34, "convertRect:fromView:", v33);
    v36 = v35;
    v38 = v37;

    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bounds");
    v16 = v36 - v41;

    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v10 = v44 + v45 - (v36 + v38);
    goto LABEL_38;
  }
LABEL_29:
  if (v9)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "isRotating"))
    {

    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isRotating");

      if ((v48 & 1) == 0)
      {
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "_window");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "actualSceneBounds");
        v53 = v54;
LABEL_35:

        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "view");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "bounds");
        v10 = v53 - (v57 + v58);

        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "responder");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "_responderWindow");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = 0.0;
        if (!v33)
          goto LABEL_39;
        -[UIInputWindowControllerHostingItem inputAccessoryView](self, "inputAccessoryView");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "traitCollection");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "horizontalSizeClass");
        objc_msgSend(v33, "traitCollection");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "horizontalSizeClass");

        if (v63 == v65)
          goto LABEL_39;
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowControllerHostingItem inputAccessoryViewController](self, "inputAccessoryViewController");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setOverrideTraitCollection:forChildViewController:", 0, v67);

        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "traitCollection");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", objc_msgSend(v43, "horizontalSizeClass"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowControllerHostingItem inputAccessoryViewController](self, "inputAccessoryViewController");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setOverrideTraitCollection:forChildViewController:", v68, v69);

LABEL_38:
LABEL_39:

        goto LABEL_40;
      }
    }
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "_window");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "actualSceneBoundsForLandscape:", objc_msgSend(v51, "isViewLandscape"));
    v53 = v52;

    goto LABEL_35;
  }
LABEL_40:

  v70 = v17;
  v71 = v16;
  v72 = v15;
  v73 = v10;
  result.right = v73;
  result.bottom = v72;
  result.left = v71;
  result.top = v70;
  return result;
}

- (id)inputViewController
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (objc_msgSend(WeakRetained, "host:isForPurpose:", self, 100))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_inputViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)inputAssistantViewController
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (objc_msgSend(WeakRetained, "host:isForPurpose:", self, 102))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_inputAssistantViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIView)dockView
{
  return (UIView *)-[UISystemKeyboardDockController dockView](self->_dockViewController, "dockView");
}

- (void)updateViewSizingConstraints:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSLayoutConstraint *inputViewHeightConstraint;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *v29;
  double v30;
  NSLayoutConstraint *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  NSLayoutConstraint *assistantViewHeightConstraint;
  NSLayoutConstraint *v37;
  NSLayoutConstraint *v38;
  double v39;
  double v40;
  NSLayoutConstraint *accessoryViewHeightConstraint;
  NSLayoutConstraint *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *v44;
  double v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *v48;
  double v49;
  NSLayoutConstraint *v50;
  id v51;

  v51 = a3;
  -[UIInputWindowControllerHostingItem inputView](self, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHostingItem inputAssistantView](self, "inputAssistantView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHostingItem inputAccessoryView](self, "inputAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHostingItem disableViewSizingConstraints:forNewView:](self, "disableViewSizingConstraints:forNewView:", 1, v4);
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isInputViewPlaceholder"))
      goto LABEL_9;
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCustomInputView");

    if ((v9 & 1) == 0)
    {
      +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentUIState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "keyboardOrientation");

        v13 = objc_msgSend(v7, "orientation");
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isRotating") & 1) != 0)
        {

LABEL_8:
          v15 = objc_msgSend(v7, "assistantBarVisible");
          -[UIInputWindowControllerHostingItem owner](self, "owner");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInputWindowControllerHostingItem inputViewController](self, "inputViewController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sizeForInputViewController:inputView:includeAssistantBar:", v17, v4, v15);
          v19 = v18;
          v21 = v20;

          objc_msgSend(v4, "setFixedSize:", v19, v21);
          goto LABEL_9;
        }

        if ((unint64_t)(v12 - 3) < 2 != (unint64_t)(v13 - 3) < 2)
          goto LABEL_8;
      }
LABEL_9:

    }
  }
  if (v4
    && SubviewUsesClassicLayout(v4)
    && objc_msgSend(v4, "isDescendantOfView:", self->_hostView))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem inputViewController](self, "inputViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sizeForInputViewController:inputView:", v23, v4);
    v25 = v24;

    inputViewHeightConstraint = self->_inputViewHeightConstraint;
    if (inputViewHeightConstraint)
    {
      -[NSLayoutConstraint setConstant:](inputViewHeightConstraint, "setConstant:", v25);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, 0, 0, 0.0, v25);
      v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 1148846080;
      -[NSLayoutConstraint setPriority:](v29, "setPriority:", v30);
      -[NSLayoutConstraint setIdentifier:](v29, "setIdentifier:", CFSTR("inputHeight"));
      v31 = self->_inputViewHeightConstraint;
      self->_inputViewHeightConstraint = v29;

    }
    objc_msgSend(v51, "addObject:", self->_inputViewHeightConstraint);
  }
  else
  {
    v27 = self->_inputViewHeightConstraint;
    if (v27)
    {
      -[NSLayoutConstraint setActive:](v27, "setActive:", 0);
      v28 = self->_inputViewHeightConstraint;
      self->_inputViewHeightConstraint = 0;

    }
  }
  -[UIInputWindowControllerHostingItem disableViewSizingConstraints:forNewView:](self, "disableViewSizingConstraints:forNewView:", 2, v5);
  if (v5
    && (objc_msgSend(v5, "isHidden") & 1) == 0
    && SubviewUsesClassicLayout(v5)
    && objc_msgSend(v5, "isDescendantOfView:", self->_hostView))
  {
    -[UIInputWindowControllerHostingItem placement](self, "placement");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "inputAssistantViewHeightForInputViewSet:", v33);
    v35 = v34;

    assistantViewHeightConstraint = self->_assistantViewHeightConstraint;
    if (assistantViewHeightConstraint)
    {
      -[NSLayoutConstraint setConstant:](assistantViewHeightConstraint, "setConstant:", v35);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 8, 0, 0, 0, 0.0, v35);
      v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = 1148846080;
      -[NSLayoutConstraint setPriority:](v48, "setPriority:", v49);
      -[NSLayoutConstraint setIdentifier:](v48, "setIdentifier:", CFSTR("assistantHeight"));
      v50 = self->_assistantViewHeightConstraint;
      self->_assistantViewHeightConstraint = v48;

    }
    objc_msgSend(v51, "addObject:", self->_assistantViewHeightConstraint);
  }
  else
  {
    v37 = self->_assistantViewHeightConstraint;
    if (v37)
    {
      -[NSLayoutConstraint setActive:](v37, "setActive:", 0);
      v38 = self->_assistantViewHeightConstraint;
      self->_assistantViewHeightConstraint = 0;

    }
  }
  -[UIInputWindowControllerHostingItem disableViewSizingConstraints:forNewView:](self, "disableViewSizingConstraints:forNewView:", 4, v6);
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  if (v39 > 0.0
    && (v40 = v39, SubviewUsesClassicLayout(v6))
    && objc_msgSend(v6, "isDescendantOfView:", self->_hostView))
  {
    accessoryViewHeightConstraint = self->_accessoryViewHeightConstraint;
    if (accessoryViewHeightConstraint)
    {
      -[NSLayoutConstraint setConstant:](accessoryViewHeightConstraint, "setConstant:", v40);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 8, 0, 0, 0, 0.0, v40);
      v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      LODWORD(v45) = 1148846080;
      -[NSLayoutConstraint setPriority:](v44, "setPriority:", v45);
      -[NSLayoutConstraint setIdentifier:](v44, "setIdentifier:", CFSTR("accessoryHeight"));
      v46 = self->_accessoryViewHeightConstraint;
      self->_accessoryViewHeightConstraint = v44;
      v47 = v44;

      objc_msgSend(v51, "addObject:", self->_accessoryViewHeightConstraint);
    }
  }
  else
  {
    v42 = self->_accessoryViewHeightConstraint;
    if (v42)
    {
      -[NSLayoutConstraint setActive:](v42, "setActive:", 0);
      v43 = self->_accessoryViewHeightConstraint;
      self->_accessoryViewHeightConstraint = 0;

    }
  }

}

- (void)disableViewSizingConstraints:(unint64_t)a3 forNewView:(id)a4
{
  char v4;
  NSLayoutConstraint *inputViewHeightConstraint;
  id v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *assistantViewHeightConstraint;
  id v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *accessoryViewHeightConstraint;
  id v15;
  void *v16;
  NSLayoutConstraint *v17;
  id v18;

  v4 = a3;
  v18 = a4;
  if ((v4 & 1) != 0)
  {
    inputViewHeightConstraint = self->_inputViewHeightConstraint;
    if (inputViewHeightConstraint)
    {
      -[NSLayoutConstraint firstItem](inputViewHeightConstraint, "firstItem");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 != v18)
      {

LABEL_6:
        -[NSLayoutConstraint setActive:](self->_inputViewHeightConstraint, "setActive:", 0);
        v9 = self->_inputViewHeightConstraint;
        self->_inputViewHeightConstraint = 0;

        goto LABEL_7;
      }
      -[NSLayoutConstraint secondItem](self->_inputViewHeightConstraint, "secondItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_6;
    }
  }
LABEL_7:
  if ((v4 & 2) != 0)
  {
    assistantViewHeightConstraint = self->_assistantViewHeightConstraint;
    if (assistantViewHeightConstraint)
    {
      -[NSLayoutConstraint firstItem](assistantViewHeightConstraint, "firstItem");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 != v18)
      {

LABEL_12:
        -[NSLayoutConstraint setActive:](self->_assistantViewHeightConstraint, "setActive:", 0);
        v13 = self->_assistantViewHeightConstraint;
        self->_assistantViewHeightConstraint = 0;

        goto LABEL_13;
      }
      -[NSLayoutConstraint secondItem](self->_assistantViewHeightConstraint, "secondItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_12;
    }
  }
LABEL_13:
  if ((v4 & 4) != 0)
  {
    accessoryViewHeightConstraint = self->_accessoryViewHeightConstraint;
    if (accessoryViewHeightConstraint)
    {
      -[NSLayoutConstraint firstItem](accessoryViewHeightConstraint, "firstItem");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15 != v18)
      {

LABEL_18:
        -[NSLayoutConstraint setActive:](self->_accessoryViewHeightConstraint, "setActive:", 0);
        v17 = self->_accessoryViewHeightConstraint;
        self->_accessoryViewHeightConstraint = 0;

        goto LABEL_19;
      }
      -[NSLayoutConstraint secondItem](self->_accessoryViewHeightConstraint, "secondItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_18;
    }
  }
LABEL_19:

}

void __60__UIInputWindowControllerHostingItem_updateConstraintInsets__block_invoke(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v9 = a1;
  objc_msgSend(v9, "objectForKey:", &unk_1E1A98D30);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", a3);
  objc_msgSend(v9, "objectForKey:", &unk_1E1A98D48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", a5);
  objc_msgSend(v9, "objectForKey:", &unk_1E1A98D60);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", a2);
  objc_msgSend(v9, "objectForKey:", &unk_1E1A98D78);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setConstant:", a4);
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_4(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 4, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), 4, 1.0, *(double *)(a1 + 64));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("inputView.bottom"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_3(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 3, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1.0, *(double *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("inputView.top"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_2(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 2, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), 2, 1.0, *(double *)(a1 + 72));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("inputView.right"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", CFSTR("inputBackdrop.trailing"));
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", CFSTR("inputBackdrop.bottom"));
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 1, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), 1, 1.0, *(double *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("inputView.left"));
  return v1;
}

- (id)viewMatchingConstraintForAttribute:(int64_t)a3 primaryView:(id)a4 secondaryView:(id)a5
{
  void *v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a5, a3, 0, a4, a3, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1132068864;
  objc_msgSend(v5, "setPriority:", v6);
  objc_msgSend(v5, "setIdentifier:", CFSTR("viewMatching"));
  return v5;
}

- (void)rebuildConstraints:(id)a3 forView:(id)a4 toMatchView:(id)a5 tracker:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[UIInputWindowControllerHostingItem container](self, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "useCrescendoHostingItem");

  if ((v15 & 1) == 0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke;
    v36[3] = &unk_1E16D6150;
    v36[4] = self;
    v17 = v12;
    v37 = v17;
    v18 = v11;
    v38 = v18;
    -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v10, &unk_1E1A98D30, v18, v17, v13, v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConstant:", 0.0);

    v33[0] = v16;
    v33[1] = 3221225472;
    v33[2] = __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_2;
    v33[3] = &unk_1E16D6150;
    v33[4] = self;
    v20 = v17;
    v34 = v20;
    v21 = v18;
    v35 = v21;
    -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v10, &unk_1E1A98D48, v21, v20, v13, v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConstant:", 0.0);

    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_3;
    v30[3] = &unk_1E16D6150;
    v30[4] = self;
    v23 = v20;
    v31 = v23;
    v24 = v21;
    v32 = v24;
    -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v10, &unk_1E1A98D60, v24, v23, v13, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConstant:", 0.0);

    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_4;
    v27[3] = &unk_1E16D6150;
    v27[4] = self;
    v28 = v23;
    v29 = v24;
    -[UIInputWindowControllerHostingItem _updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:](self, "_updateOrCreateConstraintInDict:key:fromView:toView:tracker:creator:", v10, &unk_1E1A98D78, v29, v28, v13, v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", 0.0);

  }
}

- (UIInputViewSetPlacementApplicator)applicator
{
  return self->_applicator;
}

- (UIEdgeInsets)inputViewPadding
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
  UIEdgeInsets result;

  -[UIInputWindowControllerHostingItem container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inputViewPadding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

uint64_t __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewMatchingConstraintForAttribute:primaryView:secondaryView:", 4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewMatchingConstraintForAttribute:primaryView:secondaryView:", 8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewMatchingConstraintForAttribute:primaryView:secondaryView:", 2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __85__UIInputWindowControllerHostingItem_rebuildConstraints_forView_toMatchView_tracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewMatchingConstraintForAttribute:primaryView:secondaryView:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "heightAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", CFSTR("backgroundView.height"));
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", CFSTR("backgroundView.bottom"));
  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "rightAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("backgroundView.right"));
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "leftAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("backgroundView.left"));
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "fullBackdropLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("inputBackdropGuides.fullTrailing"));
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "fullBackdropLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("inputBackdropGuides.fullBottom"));
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "fullBackdropLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("inputBackdropGuides.fullLeading"));
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "fullBackdropLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("inputBackdropGuides.fullTop"));
  return v5;
}

- (void)setInputAssistantView:(id)a3
{
  UIInputSetHostView *v4;
  UIInputSetHostView *hostView;
  id v6;
  id v7;

  -[UIView addSubview:](self->_hostView, "addSubview:", a3);
  -[UIInputWindowControllerHostingItem updateInputAssistantViewLayering](self, "updateInputAssistantViewLayering");
  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isFloatingAssistantView") & 1) != 0)
  {
    -[TUIInputAssistantHostView superview](self->_inputAssistantHostView, "superview");
    v4 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
    hostView = self->_hostView;

    if (v4 != hostView)
      v6 = -[UIInputWindowControllerHostingItem inputAssistantHostView](self, "inputAssistantHostView");
  }
  else
  {

  }
}

- (void)didFinishTranslationFromPlacement:(id)a3 to:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[UISplitKeyboardSupport completedPlacementFrom:to:forController:](self->_cachedSplitKeyboardController, "completedPlacementFrom:to:forController:", v7, v6, self))
  {
    -[UIInputWindowControllerHostingItem didFinishTranslation](self, "didFinishTranslation");
  }
  -[UIScrollToDismissSupport completedPlacementFrom:to:forController:](self->_cachedScrollDismissController, "completedPlacementFrom:to:forController:", v7, v6, self);

}

- (void)configureFlickingAssistantViewController:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIFlickingAssistantViewSupport *cachedFlickingAssistantViewController;
  UIFlickingAssistantViewSupport *v8;
  UIFlickingAssistantViewSupport *v9;
  UIInputWindowControllerHostingItem *v10;
  UIFlickingAssistantViewSupport *obj;

  if (a3)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardMotionSupport supportForScreen:](UIFlickingAssistantViewSupport, "supportForScreen:", v6);
    obj = (UIFlickingAssistantViewSupport *)objc_claimAutoreleasedReturnValue();

    cachedFlickingAssistantViewController = self->_cachedFlickingAssistantViewController;
    v8 = obj;
    if (cachedFlickingAssistantViewController != obj)
    {
      -[UIKeyboardMotionSupport setMasterController:](cachedFlickingAssistantViewController, "setMasterController:", 0);
      objc_storeStrong((id *)&self->_cachedFlickingAssistantViewController, obj);
      v8 = self->_cachedFlickingAssistantViewController;
    }
    -[UIKeyboardMotionSupport setMasterController:](v8, "setMasterController:", self);
    v9 = obj;
  }
  else
  {
    -[UIKeyboardMotionSupport masterController](self->_cachedFlickingAssistantViewController, "masterController");
    v10 = (UIInputWindowControllerHostingItem *)objc_claimAutoreleasedReturnValue();

    if (v10 == self)
      -[UIKeyboardMotionSupport setMasterController:](self->_cachedFlickingAssistantViewController, "setMasterController:", 0);
    v9 = self->_cachedFlickingAssistantViewController;
    self->_cachedFlickingAssistantViewController = 0;
  }

}

- (void)initializeTranslateGestureRecognizerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  UIInputWindowControllerHostingItem *v7;
  UIInputWindowControllerHostingItem *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  char v21;
  uint64_t v22;
  void *v23;
  int v24;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isKeyWindowScene");

  if (+[UIKeyboardImpl rivenInstalled](UIKeyboardImpl, "rivenInstalled"))
  {
    -[UIKeyboardMotionSupport masterController](self->_cachedSplitKeyboardController, "masterController");
    v7 = (UIInputWindowControllerHostingItem *)objc_claimAutoreleasedReturnValue();
    if (v7 == self)
    {

      if (!v6)
        goto LABEL_9;
      goto LABEL_6;
    }
    v8 = v7;
    v9 = -[UIInputWindowControllerHostingItem _isForSplitKeyboard](self, "_isForSplitKeyboard");

    if (v9)
      -[UIInputWindowControllerHostingItem configureSplitKeyboardController:](self, "configureSplitKeyboardController:", 1);
  }
  if (!v6)
    goto LABEL_9;
LABEL_6:
  if (-[UIInputWindowControllerHostingItem _isForDragToDismiss](self, "_isForDragToDismiss"))
    -[UIInputWindowControllerHostingItem configureScrollDismissController:](self, "configureScrollDismissController:", 1);
LABEL_9:
  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isFloatingAssistantView") & 1) == 0)
  {

    goto LABEL_16;
  }
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assistantViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_usesCustomBackground");

  if ((v13 & 1) != 0)
  {
LABEL_16:
    v22 = 0;
    goto LABEL_17;
  }
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    goto LABEL_19;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visualModeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldShowWithinAppWindow");

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "_isAlwaysKeyboardWindow");
  v20 = v19;
  if (!v16)
  {

    if (!v20)
      return;
    goto LABEL_19;
  }
  v21 = v6 & ~(_BYTE)v19;

  if ((v21 & 1) != 0)
  {
LABEL_19:
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "keyboardActive");

    if (!v24)
      return;
    v22 = 1;
LABEL_17:
    -[UIInputWindowControllerHostingItem configureFlickingAssistantViewController:](self, "configureFlickingAssistantViewController:", v22);
  }
}

- (BOOL)_isForDragToDismiss
{
  void *v3;
  id WeakRetained;
  char v5;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldNotifyRemoteKeyboards"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    v5 = objc_msgSend(WeakRetained, "host:isForPurpose:", self, 3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)configureScrollDismissController:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIScrollToDismissSupport *cachedScrollDismissController;
  UIScrollToDismissSupport *v8;
  UIScrollToDismissSupport *v9;
  UIInputWindowControllerHostingItem *v10;
  UIScrollToDismissSupport *obj;

  if (a3)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardMotionSupport supportForScreen:](UIScrollToDismissSupport, "supportForScreen:", v6);
    obj = (UIScrollToDismissSupport *)objc_claimAutoreleasedReturnValue();

    cachedScrollDismissController = self->_cachedScrollDismissController;
    v8 = obj;
    if (cachedScrollDismissController != obj)
    {
      -[UIKeyboardMotionSupport setMasterController:](cachedScrollDismissController, "setMasterController:", 0);
      objc_storeStrong((id *)&self->_cachedScrollDismissController, obj);
      v8 = self->_cachedScrollDismissController;
    }
    -[UIKeyboardMotionSupport setMasterController:](v8, "setMasterController:", self);
    v9 = obj;
  }
  else
  {
    -[UIKeyboardMotionSupport masterController](self->_cachedScrollDismissController, "masterController");
    v10 = (UIInputWindowControllerHostingItem *)objc_claimAutoreleasedReturnValue();

    if (v10 == self)
      -[UIKeyboardMotionSupport setMasterController:](self->_cachedScrollDismissController, "setMasterController:", 0);
    v9 = self->_cachedScrollDismissController;
    self->_cachedScrollDismissController = 0;
  }

}

- (void)clearInteractiveTransitionStateIfNecessary
{
  void (**interactiveTransitionCleanupBlock)(id, SEL);
  id v4;

  interactiveTransitionCleanupBlock = (void (**)(id, SEL))self->_interactiveTransitionCleanupBlock;
  if (interactiveTransitionCleanupBlock)
  {
    interactiveTransitionCleanupBlock[2](interactiveTransitionCleanupBlock, a2);
    v4 = self->_interactiveTransitionCleanupBlock;
    self->_interactiveTransitionCleanupBlock = 0;

  }
}

- (void)checkPlaceholdersForRemoteKeyboards
{
  id v2;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:layoutSubviews:", 0, 0);

}

- (void)updateEmptyHeightConstraint
{
  void *v3;
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if ((objc_msgSend(WeakRetained, "host:isForPurpose:", self, 0) & 1) != 0)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl sizeForInterfaceOrientation:](UIKeyboardImpl, "sizeForInterfaceOrientation:", objc_msgSend(v3, "keyboardOrientation"));
    -[NSLayoutConstraint setConstant:](self->_emptyHeightConstraint, "setConstant:", v4);

  }
  else
  {
    -[NSLayoutConstraint setConstant:](self->_emptyHeightConstraint, "setConstant:", 0.0);
  }

}

- (void)removeInputAssistantHostView
{
  -[TUIInputAssistantHostView removeFromSuperview](self->_inputAssistantHostView, "removeFromSuperview");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIInputWindowControllerHostingItem resetPlacement](self, "resetPlacement");
  -[UIInputWindowControllerHostingItem configureSplitKeyboardController:](self, "configureSplitKeyboardController:", 0);
  -[UIInputWindowControllerHostingItem configureScrollDismissController:](self, "configureScrollDismissController:", 0);
  -[UIInputWindowControllerHostingItem configureFlickingAssistantViewController:](self, "configureFlickingAssistantViewController:", 0);
  -[UIView removeFromSuperview](self->_hostView, "removeFromSuperview");
  -[TUIInputAssistantHostView removeFromSuperview](self->_inputAssistantHostView, "removeFromSuperview");
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterController:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);

  v5.receiver = self;
  v5.super_class = (Class)UIInputWindowControllerHostingItem;
  -[UIInputWindowControllerHostingItem dealloc](&v5, sel_dealloc);
}

- (void)configureSplitKeyboardController:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  UISplitKeyboardSupport *cachedSplitKeyboardController;
  UISplitKeyboardSupport *v8;
  UISplitKeyboardSupport *v9;
  UIInputWindowControllerHostingItem *v10;
  UISplitKeyboardSupport *obj;

  if (a3)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardMotionSupport supportForScreen:](UISplitKeyboardSupport, "supportForScreen:", v6);
    obj = (UISplitKeyboardSupport *)objc_claimAutoreleasedReturnValue();

    cachedSplitKeyboardController = self->_cachedSplitKeyboardController;
    v8 = obj;
    if (cachedSplitKeyboardController != obj)
    {
      -[UIKeyboardMotionSupport setMasterController:](cachedSplitKeyboardController, "setMasterController:", 0);
      objc_storeStrong((id *)&self->_cachedSplitKeyboardController, obj);
      v8 = self->_cachedSplitKeyboardController;
    }
    -[UIKeyboardMotionSupport setMasterController:](v8, "setMasterController:", self);
    v9 = obj;
  }
  else
  {
    -[UIKeyboardMotionSupport masterController](self->_cachedSplitKeyboardController, "masterController");
    v10 = (UIInputWindowControllerHostingItem *)objc_claimAutoreleasedReturnValue();

    if (v10 == self)
      -[UIKeyboardMotionSupport setMasterController:](self->_cachedSplitKeyboardController, "setMasterController:", 0);
    v9 = self->_cachedSplitKeyboardController;
    self->_cachedSplitKeyboardController = 0;
  }

}

- (void)clearInputAccessoryViewEdgeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D156E0];
  -[NSMutableDictionary allValues](self->_accessoryViewEdgeConstraints, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[NSMutableDictionary removeAllObjects](self->_accessoryViewEdgeConstraints, "removeAllObjects");
  if (-[NSMutableDictionary count](self->_accessoryBackdropViewEdgeConstraints, "count"))
  {
    v5 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](self->_accessoryBackdropViewEdgeConstraints, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    -[NSMutableDictionary removeAllObjects](self->_accessoryBackdropViewEdgeConstraints, "removeAllObjects");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingKeyboardMaskView, 0);
  objc_storeStrong((id *)&self->_applicator, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_controllerDelegate, 0);
  objc_storeStrong((id *)&self->_inputAccessoryBackdropView, 0);
  objc_storeStrong((id *)&self->_inputAssistantBackdropView, 0);
  objc_storeStrong((id *)&self->_inputBackdropView, 0);
  objc_storeStrong((id *)&self->_inputCombinedBackdropView, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_inputAssistantHostView, 0);
  objc_storeStrong((id *)&self->_cachedPlacement, 0);
  objc_storeStrong((id *)&self->_dockViewController, 0);
  objc_storeStrong((id *)&self->_inputBackdropBackgroundView, 0);
  objc_storeStrong((id *)&self->_accessoryBackdropViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_assistantBackdropViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_inputDockViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_inputBackdropBackgroundViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_inputBackdropViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_backdropInnerGuideConstraints, 0);
  objc_storeStrong((id *)&self->_inputCombinedBackdropViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_assistantViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_inputViewEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_emptyHeightConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_assistantViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, 0);
  objc_storeStrong(&self->_interactiveTransitionCleanupBlock, 0);
  objc_storeStrong((id *)&self->_cachedFlickingAssistantViewController, 0);
  objc_storeStrong((id *)&self->_cachedScrollDismissController, 0);
  objc_storeStrong((id *)&self->_cachedSplitKeyboardController, 0);
}

- (id)ownerView
{
  void *v2;
  void *v3;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPlacement:(id)a3
{
  id WeakRetained;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  v5 = objc_msgSend(WeakRetained, "host:isForPurpose:", self, 200);

  if (v5)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlacement:", v7);

  }
}

- (void)updateInputAssistantViewLayering
{
  void *v3;
  UIInputSetHostView *v4;
  UIInputSetHostView *v5;
  UIInputSetHostView *hostView;
  void *v7;
  int v8;
  UIInputSetHostView *v9;
  void *v10;
  id v11;

  -[UIInputWindowControllerHostingItem inputAssistantView](self, "inputAssistantView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHostingItem inputView](self, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
  {
    objc_msgSend(v11, "superview");
    v4 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
    if (v4 == self->_hostView)
    {
      objc_msgSend(v3, "superview");
      v5 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
      hostView = self->_hostView;

      if (v5 != hostView)
        goto LABEL_5;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentInputMode");
      v4 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();

      v8 = -[UIInputSetHostView isEmojiInputMode](v4, "isEmojiInputMode");
      v9 = self->_hostView;
      if (v8)
      {
        -[UIInputWindowControllerHostingItem inputView](self, "inputView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView insertSubview:belowSubview:](v9, "insertSubview:belowSubview:", v11, v10);

      }
      else
      {
        -[UIView bringSubviewToFront:](self->_hostView, "bringSubviewToFront:", v11);
      }
    }

  }
LABEL_5:

}

- (void)setInputAccessoryView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  -[UIView addSubview:](self->_hostView, "addSubview:");
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFloatingAssistantView") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isAlwaysKeyboardWindow");

  if ((v8 & 1) == 0)
  {
    -[UIInputWindowControllerHostingItem inputAssistantHostView](self, "inputAssistantHostView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputAccessoryView:", v9);
LABEL_5:

  }
}

- (id)inputAccessoryViewController
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (objc_msgSend(WeakRetained, "host:isForPurpose:", self, 101))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_inputAccessoryViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (TUIInputAssistantHostView)inputAssistantHostView
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  TUIInputAssistantHostView *v7;
  TUIInputAssistantHostView *inputAssistantHostView;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *p_inputAssistantHostView;
  TUIInputAssistantHostView *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  TUIInputAssistantHostView *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[6];

  v39[4] = *MEMORY[0x1E0C80C00];
  -[UIInputWindowControllerHostingItem hostView](self, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_inputAssistantHostView)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2050000000;
    v4 = (void *)_MergedGlobals_1131;
    v38 = _MergedGlobals_1131;
    if (!_MergedGlobals_1131)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __getTUIInputAssistantHostViewClass_block_invoke;
      v34[3] = &unk_1E16B14C0;
      v34[4] = &v35;
      __getTUIInputAssistantHostViewClass_block_invoke((uint64_t)v34);
      v4 = (void *)v36[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v35, 8);
    v6 = [v5 alloc];
    objc_msgSend(v3, "frame");
    v7 = (TUIInputAssistantHostView *)objc_msgSend(v6, "initWithFrame:");
    inputAssistantHostView = self->_inputAssistantHostView;
    self->_inputAssistantHostView = v7;

    -[TUIInputAssistantHostView setTranslatesAutoresizingMaskIntoConstraints:](self->_inputAssistantHostView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  objc_msgSend(v3, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHostingItem inputAssistantView](self, "inputAssistantView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "indexOfObject:", v10);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v12 = 0;
  else
    v12 = v11 - 1;
  if (v11)
    v13 = v12;
  else
    v13 = 0;
  v15 = self->_inputAssistantHostView;
  p_inputAssistantHostView = (id *)&self->_inputAssistantHostView;
  objc_msgSend(v3, "insertSubview:atIndex:", v15, v13);
  v16 = *p_inputAssistantHostView;
  objc_msgSend(v3, "_inheritedRenderConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setRenderConfig:", v17);

  v28 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(*p_inputAssistantHostView, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v31;
  objc_msgSend(*p_inputAssistantHostView, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v18;
  objc_msgSend(*p_inputAssistantHostView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v21;
  objc_msgSend(*p_inputAssistantHostView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v25);

  v26 = (TUIInputAssistantHostView *)*p_inputAssistantHostView;
  return v26;
}

- (id)_updateOrCreateConstraintInDict:(id)a3 key:(id)a4 fromItem:(id)a5 toItem:(id)a6 tracker:(id)a7 creator:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  id v21;
  id v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(_QWORD))a8;
  objc_msgSend(v13, "objectForKey:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_6;
  v20 = v19;
  objc_msgSend(v19, "firstItem");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21 != v15)
  {

LABEL_5:
    objc_msgSend(v20, "setActive:", 0);
    objc_msgSend(v13, "removeObjectForKey:", v14);

LABEL_6:
    v18[2](v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);
    objc_msgSend(v13, "setObject:forKey:", v20, v14);
    goto LABEL_7;
  }
  objc_msgSend(v20, "secondItem");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22 != v16)
    goto LABEL_5;
  if ((objc_msgSend(v20, "isActive") & 1) == 0)
    objc_msgSend(v17, "addObject:", v20);
LABEL_7:

  return v20;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "assistantLayoutGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIdentifier:", CFSTR("inputBackdropGuides.assistantTop"));
  return v6;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "assistantLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("inputBackdropGuides.assistantBottom"));
  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_19(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "leftAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "leftAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_20(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "rightAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_21(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_23(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 1, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), 1, 1.0, *(double *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("assistantView.left"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_24(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 2, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), 2, 1.0, *(double *)(a1 + 72));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("assistantView.right"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_25(_QWORD *a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1[4], 3, 0, a1[5], a1[6], 1.0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("assistantView.top"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_26(_QWORD *a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1[4], 4, 0, a1[5], a1[6], 1.0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("assistantView.bottom"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_27(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 1, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), 1, 1.0, *(double *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("accessoryView.left"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_28(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 2, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), 2, 1.0, *(double *)(a1 + 72));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("accessoryView.right"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_29(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 3, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), 3, 1.0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("accessoryView.top"));
  return v1;
}

id __59__UIInputWindowControllerHostingItem_updateViewConstraints__block_invoke_30(_QWORD *a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1[4], 4, 0, a1[5], a1[6], 1.0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdentifier:", CFSTR("accessoryView.bottom"));
  return v1;
}

- (void)resetBackdropHeight
{
  if (self->_backdropHeightDelta != 0.0)
    -[UIInputWindowControllerHostingItem extendKeyboardBackdropHeight:withDuration:](self, "extendKeyboardBackdropHeight:withDuration:", 0.0, 0.0);
}

- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4
{
  void *v6;
  int v7;
  UIKBInputBackdropView *inputAssistantBackdropView;
  UIKBInputBackdropView *v9;
  void *v10;
  UIKBInputBackdropView *v11;
  UIKBInputBackdropView *v12;
  void *v13;
  _QWORD v14[5];

  self->_backdropHeightDelta = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMinimized");

  if (v7)
  {
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
    if (self->_backdropHeightDelta == 0.0)
    {
      self->_inputAssistantBackdropView = 0;

    }
    else if (!inputAssistantBackdropView)
    {
      v9 = [UIKBInputBackdropView alloc];
      -[UIInputWindowControllerHostingItem inputAssistantView](self, "inputAssistantView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v11 = -[UIKBInputBackdropView initWithFrame:](v9, "initWithFrame:");
      v12 = self->_inputAssistantBackdropView;
      self->_inputAssistantBackdropView = v11;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_inputAssistantBackdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    -[UIInputWindowControllerHostingItem container](self, "container");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateViewConstraints");

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__UIInputWindowControllerHostingItem_extendKeyboardBackdropHeight_withDuration___block_invoke;
  v14[3] = &unk_1E16B1B28;
  v14[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v14, 0, a4, 0.0);
}

void __80__UIInputWindowControllerHostingItem_extendKeyboardBackdropHeight_withDuration___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  double *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "placement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUndocked");

  if (v3)
  {
    v4 = *(double **)(a1 + 32);
    v5 = -v4[5];
    objc_msgSend(v4, "placement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExtendedHeight:", v5);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "placement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateVisibilityConstraintsForPlacement:", v8);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "objectForKey:", &unk_1E1A98D60);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "inputAssistantViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_aligningInsetsForChildInputViewController:includeSceneBounds:", v10, 0);
  v12 = v11;

  objc_msgSend(v14, "setConstant:", -*(double *)(*(_QWORD *)(a1 + 32) + 40) - v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

}

- (CGRect)fullScreenFrame
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v50;
  void *v51;
  double v52;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  double v76;
  void *v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect result;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isVisible") & 1) == 0)
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_15;
  }
  if (!+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    if (!objc_msgSend(v4, "isFloatingAssistantView")
      || (-[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "inputAccessoryView"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isInputViewPlaceholder"))
      {
        -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "inputAccessoryView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
LABEL_13:
          -[UIInputWindowControllerHostingItem hostView](self, "hostView");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "frame");
          v6 = v63;
          v8 = v64;
          v10 = v65;
          v12 = v66;

          goto LABEL_15;
        }
        -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "inputView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "placeheldView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "superview");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v15, "superview");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInputWindowControllerHostingItem hostView](self, "hostView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "window");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "windowScene");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "coordinateSpace");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "frame");
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v77 = v21;
          objc_msgSend(v21, "window");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "screen");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "coordinateSpace");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "convertRect:fromCoordinateSpace:", v36, v27, v29, v31, v33);
          v6 = v37;
          v8 = v38;
          v10 = v39;
          v12 = v40;

          -[UIInputWindowControllerHostingItem hostView](self, "hostView");
          v41 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v41, "frame");
          v87.origin.x = v42;
          v87.origin.y = v43;
          v87.size.width = v44;
          v87.size.height = v45;
          v78.origin.x = v6;
          v78.origin.y = v8;
          v78.size.width = v10;
          v78.size.height = v12;
          v79 = CGRectIntersection(v78, v87);
          x = v79.origin.x;
          y = v79.origin.y;
          width = v79.size.width;
          height = v79.size.height;

          v80.origin.x = x;
          v80.origin.y = y;
          v80.size.width = width;
          v80.size.height = height;
          LOBYTE(v41) = CGRectIsEmpty(v80);
          -[UIInputWindowControllerHostingItem hostView](self, "hostView");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if ((v41 & 1) != 0)
          {
            objc_msgSend(v50, "origin");
            v8 = v52;

            -[UIInputWindowControllerHostingItem hostView](self, "hostView");
            v53 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v53, "frame");
            v88.origin.x = v54;
            v88.origin.y = v55;
            v88.size.width = v56;
            v88.size.height = v57;
            v81.origin.x = v6;
            v81.origin.y = v8;
            v81.size.width = v10;
            v81.size.height = v12;
            v82 = CGRectIntersection(v81, v88);
            v58 = v82.origin.x;
            v59 = v82.origin.y;
            v60 = v82.size.width;
            v61 = v82.size.height;

            v83.origin.x = v58;
            v83.origin.y = v59;
            v83.size.width = v60;
            v83.size.height = v61;
            LOBYTE(v53) = CGRectIsEmpty(v83);

            if ((v53 & 1) != 0)
              goto LABEL_12;
          }
          else
          {
            objc_msgSend(v50, "frame");
            v72 = v71;
            -[UIInputWindowControllerHostingItem containerView](self, "containerView");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "frame");
            if (v72 >= CGRectGetMaxY(v84))
            {
              -[UIInputWindowControllerHostingItem containerView](self, "containerView");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "frame");
              v89.origin.x = v6;
              v89.origin.y = v8;
              v89.size.width = v10;
              v89.size.height = v12;
              v75 = CGRectIntersectsRect(v85, v89);

              v76 = -0.0;
              if (v75)
                v76 = v12;
              v8 = v8 + v76;
            }
            else
            {

            }
          }

          goto LABEL_15;
        }
      }
LABEL_12:

      goto LABEL_13;
    }
  }
  -[UIInputViewSetPlacementApplicator popoverFrame](self->_applicator, "popoverFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
LABEL_15:

  v67 = v6;
  v68 = v8;
  v69 = v10;
  v70 = v12;
  result.size.height = v70;
  result.size.width = v69;
  result.origin.y = v68;
  result.origin.x = v67;
  return result;
}

- (CGRect)fullInputViewAndAssistantFrame
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double x;
  double v14;
  double y;
  double v16;
  double width;
  double v18;
  double height;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
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
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;
  CGRect result;
  CGRect v61;

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isInputViewPlaceholder"))
    goto LABEL_12;
  -[UIInputWindowControllerHostingItem hostView](self, "hostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isHostedInAnotherProcess");

  if ((v6 & 1) != 0)
  {
LABEL_13:
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "inputViewSet");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "inputView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "frame");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;

    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "coordinateSpace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v28, v43, v45, v47, v49);
    v32 = v50;
    v34 = v51;
    v36 = v52;
    v38 = v53;
    goto LABEL_14;
  }
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeheldView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "associatedView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "frame");
  x = v12;
  y = v14;
  width = v16;
  height = v18;
  objc_msgSend(v3, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_9;
    objc_msgSend(v11, "frame");
    v61.origin.x = v23;
    v61.origin.y = v24;
    v61.size.width = v25;
    v61.size.height = v26;
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v59 = CGRectUnion(v58, v61);
  }
  else
  {
    objc_msgSend(v11, "superview");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
    objc_msgSend(v11, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
  }
  x = v59.origin.x;
  y = v59.origin.y;
  width = v59.size.width;
  height = v59.size.height;
LABEL_9:
  if (!v21)
    goto LABEL_11;
  -[UIInputWindowControllerHostingItem hostView](self, "hostView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "coordinateSpace");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "convertRect:toCoordinateSpace:", v30, x, y, width, height);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

LABEL_14:
  v54 = v32;
  v55 = v34;
  v56 = v36;
  v57 = v38;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (void)updateViewSizingConstraints
{
  void *v3;
  char v4;
  id v5;

  -[UIInputWindowControllerHostingItem container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useCrescendoHostingItem");

  if ((v4 & 1) == 0)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
    -[UIInputWindowControllerHostingItem updateViewSizingConstraints:](self, "updateViewSizingConstraints:", v5);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v5);

  }
}

- (void)setCombinedBackdropView:(id)a3
{
  _UIKBLightEffectsBackground **p_inputCombinedBackdropView;
  _UIKBLightEffectsBackground *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _UIKBLightEffectsBackground *inputCombinedBackdropView;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v30 = a3;
  p_inputCombinedBackdropView = &self->_inputCombinedBackdropView;
  v6 = self->_inputCombinedBackdropView;
  objc_storeStrong((id *)&self->_inputCombinedBackdropView, a3);
  if (self->_inputCombinedBackdropView)
  {
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet", v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem applicator](self, "applicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backdropContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v11;

    -[UIView superview](*p_inputCombinedBackdropView, "superview");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[UIView superview](*p_inputCombinedBackdropView, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 != v17)
      {
        -[NSMutableDictionary removeObjectForKey:](self->_backdropInnerGuideConstraints, "removeObjectForKey:", CFSTR("items"));
        v21 = (void *)MEMORY[0x1E0D156E0];
        -[NSMutableDictionary allValues](self->_backdropInnerGuideConstraints, "allValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "deactivateConstraints:", v22);

        -[NSMutableDictionary removeAllObjects](self->_backdropInnerGuideConstraints, "removeAllObjects");
        v23 = (void *)MEMORY[0x1E0D156E0];
        -[NSMutableDictionary allValues](self->_inputCombinedBackdropViewEdgeConstraints, "allValues");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deactivateConstraints:", v24);

        -[NSMutableDictionary removeAllObjects](self->_inputCombinedBackdropViewEdgeConstraints, "removeAllObjects");
        -[UIView removeFromSuperview](self->_inputCombinedBackdropView, "removeFromSuperview");
      }
    }
    objc_msgSend(v17, "insertSubview:atIndex:", self->_inputCombinedBackdropView, 0);
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hideGuideBackdrop:", 0);

    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "transitionGuideBackdrop:", -[UIInputWindowControllerHostingItem animatingBackdrops](self, "animatingBackdrops"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    inputCombinedBackdropView = self->_inputCombinedBackdropView;
    if (v27)
    {
      -[_UIKBLightEffectsBackground setClientBackdropInUse:](inputCombinedBackdropView, "setClientBackdropInUse:", 1);
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __62__UIInputWindowControllerHostingItem_setCombinedBackdropView___block_invoke;
      v32[3] = &unk_1E16D6240;
      v33 = v27;
      objc_msgSend(v29, "performOnDistributedControllers:", v32);

    }
    else
    {
      -[_UIKBLightEffectsBackground setClientBackdropInUse:](inputCombinedBackdropView, "setClientBackdropInUse:", 0);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](self->_inputCombinedBackdropViewEdgeConstraints, "allValues", v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deactivateConstraints:", v13);

    -[NSMutableDictionary removeAllObjects](self->_inputCombinedBackdropViewEdgeConstraints, "removeAllObjects");
    -[NSMutableDictionary removeObjectForKey:](self->_backdropInnerGuideConstraints, "removeObjectForKey:", CFSTR("items"));
    v14 = (void *)MEMORY[0x1E0D156E0];
    -[NSMutableDictionary allValues](self->_backdropInnerGuideConstraints, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deactivateConstraints:", v15);

    -[NSMutableDictionary removeAllObjects](self->_backdropInnerGuideConstraints, "removeAllObjects");
    if (v6)
    {
      -[UIView removeFromSuperview](v6, "removeFromSuperview");
      -[UIInputWindowControllerHostingItem owner](self, "owner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hideGuideBackdrop:", 1);

      -[UIInputWindowControllerHostingItem cleanUpLightEffectsTransition](self, "cleanUpLightEffectsTransition");
      -[UIInputWindowControllerHostingItem updateInputBackdropView](self, "updateInputBackdropView");
      -[UIInputWindowControllerHostingItem updateInputAssistantBackdropView](self, "updateInputAssistantBackdropView");
    }
  }

}

uint64_t __62__UIInputWindowControllerHostingItem_setCombinedBackdropView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startTransition:withInfo:", 0x1E174E660, *(_QWORD *)(a1 + 32));
}

- (void)setInputAccessoryBackdropView:(id)a3
{
  UIKBInputBackdropView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIKBInputBackdropView *inputAccessoryBackdropView;
  id v11;

  v11 = a3;
  v5 = self->_inputAccessoryBackdropView;
  objc_storeStrong((id *)&self->_inputAccessoryBackdropView, a3);
  if (self->_inputAccessoryBackdropView)
  {
    -[UIView superview](self->_inputBackdropView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
    if (v6 == v7)
      objc_msgSend(v8, "insertSubview:aboveSubview:", inputAccessoryBackdropView, self->_inputBackdropView);
    else
      objc_msgSend(v8, "insertSubview:atIndex:", inputAccessoryBackdropView, 0);

  }
  else
  {
    -[UIView removeFromSuperview](v5, "removeFromSuperview");
  }

}

- (BOOL)useCombinedBackdrop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_inheritedRenderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "animatedBackground") & 1) != 0
    || -[UIInputWindowControllerHostingItem animatingBackdrops](self, "animatingBackdrops"))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "expectedPlacement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFloatingAssistantView") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)updateCombinedBackdropView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UIKBLightEffectsBackground *v8;
  int v9;
  void *v10;
  void *v11;
  _UIKBLightEffectsBackground *v12;
  _UIKBLightEffectsBackground *v13;
  void *v14;
  uint64_t v15;
  _UIKBLightEffectsBackground *v16;
  _UIKBLightEffectsBackground *v17;

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_inheritedRenderConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "inputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v3, "isInputViewPlaceholder") & 1) != 0)
  {

LABEL_4:
    v8 = 0;
    goto LABEL_5;
  }
  v9 = objc_msgSend(v6, "animatedBackground");

  if (!v9)
    goto LABEL_4;
  -[UIInputWindowControllerHostingItem _inputCombinedBackdropView](self, "_inputCombinedBackdropView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = [_UIKBLightEffectsBackground alloc];
    v12 = -[_UIKBLightEffectsBackground initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v17 = v12;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIInputWindowControllerHostingItem setInputBackdropView:](self, "setInputBackdropView:", 0);
  -[UIInputWindowControllerHostingItem setInputAssistantBackdropView:](self, "setInputAssistantBackdropView:", 0);
  if (!-[UIInputWindowControllerHostingItem animatingBackdrops](self, "animatingBackdrops"))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "updateGuideBackdropRenderConfig:animated:", v6, 0);

    -[_UIKBLightEffectsBackground setClientBackdropInUse:](v17, "setClientBackdropInUse:", v15);
    -[_UIKBLightEffectsBackground _setRenderConfig:](v17, "_setRenderConfig:", v6);
  }
  v8 = v17;
LABEL_5:
  v16 = v8;
  -[UIInputWindowControllerHostingItem setCombinedBackdropView:](self, "setCombinedBackdropView:", v8);

}

- (void)updateInputAccessoryBackdropView
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  UIKBInputBackdropView *v28;
  void *v29;
  void *v30;
  void *v31;
  UIKBInputBackdropView *v32;

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "inputAccessoryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundEdgeInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v3, "inputAccessoryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;

    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;

    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;

    -[UIInputWindowControllerHostingItem _inputAccessoryBackdropView](self, "_inputAccessoryBackdropView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = -[UIKBInputBackdropView initWithFrame:]([UIKBInputBackdropView alloc], "initWithFrame:", v10 + v22, v8 + v17, v25 - (v14 + v10), v19 - (v8 + v12));
    v32 = v28;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_inheritedRenderConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBInputBackdropView _setRenderConfig:](v32, "_setRenderConfig:", v31);

    -[UIInputWindowControllerHostingItem setInputAccessoryBackdropView:](self, "setInputAccessoryBackdropView:", v32);
  }
  else
  {
    v32 = 0;
    -[UIInputWindowControllerHostingItem setInputAccessoryBackdropView:](self, "setInputAccessoryBackdropView:", 0);
  }

}

- (UIView)scrollTrackingView
{
  void *v3;

  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    -[UIInputWindowControllerHostingItem hostView](self, "hostView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIView *)v3;
}

- (void)clearVisibilityConstraints
{
  void *v3;
  void *v4;
  id v5;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSetPlacementApplicator constraints](self->_applicator, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", v4);

}

- (void)updateCombinedBackdropViewAnimated:(BOOL)a3 forKeyboardUp:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v4 = a4;
  if (!-[UIInputWindowControllerHostingItem animatingBackdrops](self, "animatingBackdrops"))
  {
    if (a3)
    {
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inputView");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_6:

LABEL_7:
        -[UIInputWindowControllerHostingItem setAnimatingBackdrops:](self, "setAnimatingBackdrops:", 0);
        return;
      }
      v9 = (void *)v8;
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isInputViewPlaceholder"))
      {

        goto LABEL_6;
      }
      -[UIInputWindowControllerHostingItem owner](self, "owner");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_inheritedRenderConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "animatedBackground");

      if ((v14 & 1) == 0)
        goto LABEL_7;
      -[UIInputWindowControllerHostingItem setAnimatingBackdrops:](self, "setAnimatingBackdrops:", 1);
      -[UIInputWindowControllerHostingItem updateCombinedBackdropView](self, "updateCombinedBackdropView");
      if (!self->_inputCombinedBackdropView)
        goto LABEL_7;
      -[UIInputWindowControllerHostingItem owner](self, "owner");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_inheritedRenderConfig");
      v22 = (id)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "inputView");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isInputViewPlaceholder");

          if ((v21 & 1) == 0)
          {
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __87__UIInputWindowControllerHostingItem_updateCombinedBackdropViewAnimated_forKeyboardUp___block_invoke;
            v23[3] = &unk_1E16B1B50;
            v23[4] = self;
            v24 = v22;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);

          }
        }
        else
        {

        }
      }
      -[UIInputWindowControllerHostingItem performAnimatedTransitionToRenderConfig:](self, "performAnimatedTransitionToRenderConfig:", v22);

    }
    else
    {
      -[UIInputWindowControllerHostingItem setAnimatingBackdrops:](self, "setAnimatingBackdrops:", 0);
      -[UIInputWindowControllerHostingItem updateCombinedBackdropView](self, "updateCombinedBackdropView");
      if (v4 && self->_inputCombinedBackdropView)
        -[UIInputWindowControllerHostingItem updateViewConstraints](self, "updateViewConstraints");
    }
  }
}

void __87__UIInputWindowControllerHostingItem_updateCombinedBackdropViewAnimated_forKeyboardUp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "lightKeyboard") & 1) != 0)
    +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
  else
    +[UIKBRenderConfig darkConfig](UIKBRenderConfig, "darkConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setRenderConfig:", v3);

}

- (void)performAnimatedTransitionToRenderConfig:(id)a3
{
  id v4;
  uint64_t v5;
  _UIKBLightEffectsBackground *inputCombinedBackdropView;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  if (objc_msgSend(v4, "animatedBackground"))
  {
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke;
    v11[3] = &unk_1E16B1B28;
    v11[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    inputCombinedBackdropView = self->_inputCombinedBackdropView;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke_2;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v10 = v4;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke_3;
    v7[3] = &unk_1E16B1B50;
    v7[4] = self;
    v8 = v10;
    -[_UIKBLightEffectsBackground performTransitionToRenderConfig:fromRenderConfig:alongsideAnimations:completion:](inputCombinedBackdropView, "performTransitionToRenderConfig:fromRenderConfig:alongsideAnimations:completion:", v8, 0, v9, v7);

  }
}

void __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionGuideBackdrop:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setClientBackdropInUse:", v3 != 0);
}

uint64_t __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionInAnimatedForRenderConfig:", *(_QWORD *)(a1 + 40));
}

uint64_t __78__UIInputWindowControllerHostingItem_performAnimatedTransitionToRenderConfig___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalizeTransitionToRenderConfig:", *(_QWORD *)(a1 + 40));
}

- (void)transitionInAnimatedForRenderConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIKBInputBackdropView *inputAccessoryBackdropView;
  uint64_t v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "animatedBackground"))
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateGuideBackdropRenderConfig:animated:", v4, 1);

    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setRenderConfig:", v4);

  }
  else
  {
    -[UIKBInputBackdropView transitionToStyle:isSplit:](self->_inputBackdropView, "transitionToStyle:isSplit:", objc_msgSend(v4, "backdropStyle"), 0);
    -[UIKBInputBackdropView transitionToStyle:isSplit:](self->_inputAssistantBackdropView, "transitionToStyle:isSplit:", objc_msgSend(v4, "backdropStyle"), 0);
    inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
    v8 = objc_msgSend(v4, "backdropStyle");

    -[UIKBInputBackdropView transitionToStyle:isSplit:](inputAccessoryBackdropView, "transitionToStyle:isSplit:", v8, 0);
  }
}

- (void)finalizeTransitionToRenderConfig:(id)a3
{
  if (objc_msgSend(a3, "animatedBackground"))
    -[UIInputWindowControllerHostingItem cleanUpLightEffectsTransition](self, "cleanUpLightEffectsTransition");
  -[UIInputWindowControllerHostingItem setAnimatingBackdrops:](self, "setAnimatingBackdrops:", 0);
}

- (void)cleanUpLightEffectsTransition
{
  id v2;

  -[_UIKBLightEffectsBackground layerForPositionMatchMove](self->_inputCombinedBackdropView, "layerForPositionMatchMove");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnimationForKey:", 0x1E174E680);

}

- (void)willBeginTranslation
{
  void *v3;
  char v4;
  id v5;

  -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willBeginTranslation");

  }
}

- (void)finishSplitTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishSplitTransition:", v3);

  }
}

- (void)didFinishTranslation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFinishTranslation");

  }
  -[UIInputWindowControllerHostingItem container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateBackdropViews");

  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUndocked");

  if ((v8 & 1) == 0)
    -[UIInputWindowControllerHostingItem resetVerticalConstraint](self, "resetVerticalConstraint");
}

- (void)updateProgress:(double)a3 startHeight:(double)a4 endHeight:(double)a5
{
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  double Height;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double verticalTranslationForSplitKeyboard;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  BOOL v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double Width;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  char v56;
  int v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  uint64_t v79;
  double v80;
  int v81;
  double v82;
  double v83;
  double v84;
  _QWORD v85[6];
  char v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[13];
  char v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v9 = a5 - a4;
  v10 = -(a5 - a4);
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSplitHeightDelta:", v10);

  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputViewBounds");
  v14 = v13;

  v84 = a3;
  v15 = v9 * a3;
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a5 - v9 * a3 == 0.0)
  {
    v18 = objc_msgSend(v16, "inputViewKeyboardCanSplit");

    if (v18)
    {
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_rightInputViewSetFrame");
      Height = CGRectGetHeight(v91);
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "inputViewBounds");
      v22 = CGRectGetHeight(v92);
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "inputAssistantViewBounds");
      v24 = v22 + CGRectGetHeight(v93);
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "inputAccessoryViewBounds");
      v26 = Height - (v24 + CGRectGetHeight(v94));

      self->_verticalTranslationForSplitKeyboard = v26 * a3;
      +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset");
      if (a3 >= 1.0)
      {
        verticalTranslationForSplitKeyboard = self->_verticalTranslationForSplitKeyboard;
        if (v27 < verticalTranslationForSplitKeyboard)
          self->_verticalTranslationForSplitKeyboard = verticalTranslationForSplitKeyboard + v27 - v26;
      }
    }
  }
  else
  {
    v80 = v14;
    objc_msgSend(v16, "inputAccessoryView");
    v29 = objc_claimAutoreleasedReturnValue();

    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "splitExemptSubview");
    v31 = objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "hideAccessoryViewsDuringSplit");

    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "_inputViewIsSplit");

    v36 = -[UIKBInputBackdropView _isTransitioning](self->_inputBackdropView, "_isTransitioning");
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "inputViewSplitHeight");
    v83 = a4;
    v39 = v38;

    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_leftInputViewSetFrame");
    Width = CGRectGetWidth(v95);

    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "inputViewBounds");
    v43 = CGRectGetWidth(v96);
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_rightInputViewSetFrame");
    v45 = v43 - CGRectGetWidth(v97) - Width;

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "centerFilled");

    -[UIInputWindowControllerHostingItem placement](self, "placement");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "inputAssistantViewHeightForInputViewSet:", v49);
    v51 = v50;

    v52 = a5 - v39;
    if (v39 >= a5)
      v52 = 0.0;
    v82 = v83 - v52;
    v53 = (v83 - v52) / 34.0;
    self->_verticalTranslationForSplitKeyboard = v15;
    if (v47)
      v54 = 0.0;
    else
      v54 = v45;
    -[UIKBInputBackdropView _beginSplitTransitionIfNeeded:gapWidth:](self->_inputBackdropView, "_beginSplitTransitionIfNeeded:gapWidth:", Width, v54, *(_QWORD *)&v39);
    v81 = v33;
    if (self->_inputAssistantBackdropView)
    {
      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isInputViewPlaceholder");

      v57 = 0;
      if ((v56 & 1) == 0 && v51 > 0.0)
      {
        -[UIKBInputBackdropView _beginSplitTransitionIfNeeded:gapWidth:](self->_inputAssistantBackdropView, "_beginSplitTransitionIfNeeded:gapWidth:", Width, v54);
        v57 = 1;
      }
    }
    else
    {
      v57 = 0;
    }
    v58 = floor(v53);
    v59 = MEMORY[0x1E0C809B0];
    if (!v36)
    {
      if (v29)
      {
        objc_msgSend((id)v29, "frame");
        v61 = v60;
        v62 = objc_msgSend((id)v29, "_disableLayoutFlushingCount");
        if (v62 >= 1)
          v63 = v62 + 1;
        else
          v63 = 1;
        objc_msgSend((id)v29, "_setDisableLayoutFlushingCount:", v63);
        objc_msgSend((id)v29, "_disableLayoutFlushing");
      }
      else
      {
        objc_msgSend((id)v31, "frame");
        v61 = v64;
      }
      v78 = v77 + v58;
      if ((v57 & 1) != 0)
      {
        v65 = v80;
        -[UIKBInputBackdropView setProgress:withFrame:innerCorners:](self->_inputAssistantBackdropView, "setProgress:withFrame:innerCorners:", 3, 0.0, 0.0, 0.0, v80, v51);
        v66 = 12;
      }
      else
      {
        v66 = -1;
        v65 = v80;
      }
      -[UIKBInputBackdropView setProgress:withFrame:innerCorners:](self->_inputBackdropView, "setProgress:withFrame:innerCorners:", v66, 0.0, 0.0, 0.0, v65, v83, *(_QWORD *)&v78);
      v89[0] = v59;
      v89[1] = 3221225472;
      v89[2] = __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke;
      v89[3] = &unk_1E16BF8D8;
      v90 = v57;
      v89[4] = self;
      *(double *)&v89[5] = v65;
      *(double *)&v89[6] = v51;
      *(double *)&v89[7] = v58;
      v89[8] = 0;
      v89[9] = v61;
      *(double *)&v89[10] = v65;
      v89[11] = v79;
      v89[12] = v66;
      v87[0] = v59;
      v87[1] = 3221225472;
      v87[2] = __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke_2;
      v87[3] = &unk_1E16B2218;
      v87[4] = self;
      v88 = (id)v29;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50530304, v89, v87, 1.0, 1.0e-100);

    }
    +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset");
    if (v67 >= -0.01 || v67 <= v9 || ((v35 ^ 1) & 1) != 0)
    {
      if (v9 < 0.0 && v67 < 0.0)
      {
        v69 = 0.0;
        if (v35)
          v69 = v9;
        self->_verticalTranslationForSplitKeyboard = v67 - v69 + self->_verticalTranslationForSplitKeyboard;
      }
    }
    else
    {
      +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setUndockedWithOffset:animated:", 0, 0.0, v9);

    }
    if (v9 > 0.0 && v82 != v83)
    {
      +[UIKeyboardImpl persistentOffset](UIKeyboardImpl, "persistentOffset", v82);
      if (v70 > -20.0)
      {
        +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setUndockedWithOffset:animated:", 0, 0.0, v84 * -20.0);

      }
    }
    -[UIKBInputBackdropView setGestureProgressForSplit:](self->_inputBackdropView, "setGestureProgressForSplit:", v84);
    if (v57)
    {
      v72 = (1.0 - v84) * (v58 + v58) + v51;
      v73 = -(1.0 - v84);
      if (!v35)
      {
        v73 = v84;
        v72 = v51 - (v58 + v58) * v84;
      }
      v74 = v58 * v73;
      -[NSLayoutConstraint setConstant:](self->_assistantViewHeightConstraint, "setConstant:", v72, v51 - (v58 + v58) * v84);
      -[NSMutableDictionary objectForKey:](self->_assistantBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D60);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setConstant:", v74);

      -[UIKBInputBackdropView setGestureProgressForSplit:](self->_inputAssistantBackdropView, "setGestureProgressForSplit:", v84);
    }
    if (v29 | v31)
    {
      if (v81)
      {
        -[UIInputWindowControllerHostingItem setAccessoryViewVisible:delay:](self, "setAccessoryViewVisible:delay:", 0, 0.0);
      }
      else
      {
        -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "_beginSplitTransitionIfNeeded");

      }
      v85[0] = v59;
      v85[1] = 3221225472;
      v85[2] = __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke_3;
      v85[3] = &unk_1E16BFE60;
      v86 = v81;
      v85[4] = self;
      *(double *)&v85[5] = v84;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2048, v85, &__block_literal_global_193, 0.0, 0.0);
    }

  }
}

uint64_t __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 104))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setProgress:withFrame:innerCorners:", 3, 1.0, 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48) + *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setProgress:withFrame:innerCorners:", *(_QWORD *)(a1 + 96), 1.0, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

void __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  double v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "_removeAllAnimations:", 1);
    -[UIView _popDisableLayoutFlushing](*(void **)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = 1.0;
    objc_msgSend(v3, "setSpeed:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeOffset:", 1.0);

  }
}

void __75__UIInputWindowControllerHostingItem_updateProgress_startHeight_endHeight___block_invoke_3(uint64_t a1)
{
  id v2;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setSplitProgress:", *(double *)(a1 + 40));

  }
}

- (BOOL)keyboardController
{
  void *v2;
  char v3;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldNotifyRemoteKeyboards") ^ 1;

  return v3;
}

- (BOOL)hideInputViewBackdrops
{
  double v2;

  -[UIView alpha](self->_inputBackdropView, "alpha");
  return v2 != 1.0;
}

- (BOOL)hideInputView
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4 != 1.0;

  return v5;
}

- (void)setHideInputView:(BOOL)a3
{
  double v3;
  void *v4;
  id v5;

  if (a3)
    v3 = 0.0;
  else
    v3 = 1.0;
  -[UIInputWindowControllerHostingItem _inputViewController](self, "_inputViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (int64_t)inputViewBackdropStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIInputWindowControllerHostingItem containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backdropStyle");

  return v4;
}

- (BOOL)hideInputAssistantBackdrop
{
  double v2;

  -[UIView alpha](self->_inputAssistantBackdropView, "alpha");
  return v2 != 1.0;
}

- (void)setHideInputAssistantBackdrop:(BOOL)a3
{
  double v3;

  v3 = 1.0;
  if (a3)
    v3 = 0.0;
  -[UIView setAlpha:](self->_inputAssistantBackdropView, "setAlpha:", v3);
}

- (BOOL)dontDismissReachability
{
  void *v2;
  char v3;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dontDismissReachability");

  return v3;
}

- (void)updateForKeyplaneChangeWithContext:(id)a3
{
  id v4;
  id v5;

  if (!self->_scrolling)
  {
    v4 = a3;
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateForKeyplaneChangeWithContext:", v4);

  }
}

- (UIView)view
{
  void *v2;
  void *v3;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)isChangingPlacement
{
  void *v2;
  char v3;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChangingPlacement");

  return v3;
}

- (CGPoint)positionConstraintConstant
{
  double v2;
  double v3;
  CGPoint result;

  -[UIInputViewSetPlacementApplicator origin](self->_applicator, "origin");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setInterfaceAutorotationDisabled:(BOOL)a3
{
  -[UIScrollToDismissSupport setInterfaceAutorotationDisabled:forController:](self->_cachedScrollDismissController, "setInterfaceAutorotationDisabled:forController:", a3, self);
}

- (id)constructNotificationInfoForScrollWithMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  UIInputViewSetNotificationInfo *v7;
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

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextAnimationStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "canDismissWithScrollView"))
  {
    v7 = objc_alloc_init(UIInputViewSetNotificationInfo);
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextAnimationStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSetNotificationInfo populateWithAnimationStyle:](v7, "populateWithAnimationStyle:", v9);

    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem notificationsFrame](self, "notificationsFrame");
    objc_msgSend(v10, "convertRectFromContainerCoordinateSpaceToScreenSpace:");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    -[UIInputViewSetNotificationInfo populateStartInfoWithFrame:](v7, "populateStartInfoWithFrame:", v12, v14, v16, v18);
    -[UIInputWindowControllerHostingItem _fillInNotificationInfo:forDismissMode:](self, "_fillInNotificationInfo:forDismissMode:", v7, a3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_fillInNotificationInfo:(id)a3 forDismissMode:(unint64_t)a4
{
  double v6;
  double height;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v39 = a3;
  if ((a4 & 1) != 0)
  {
    -[UIInputWindowControllerHostingItem dockView](self, "dockView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UIInputWindowControllerHostingItem inputView](self, "inputView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v42.origin.x = v18;
    v42.origin.y = v19;
    v42.size.width = v20;
    v42.size.height = v21;
    v40.origin.x = v10;
    v40.origin.y = v12;
    v40.size.width = v14;
    v40.size.height = v16;
    v41 = CGRectUnion(v40, v42);
    height = v41.size.height;

  }
  else if (a4)
  {
    -[UIView frame](self->_hostView, "frame");
    height = v6;
  }
  else
  {
    height = 0.0;
  }
  objc_msgSend(v39, "beginFrame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = height + v28;
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v23, v29, v25, v27);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  objc_msgSend(v39, "addKeyboardNotificationDebuggingInfo:", CFSTR("_fillInNotificationInfo: (hosting item)"));
  objc_msgSend(v39, "populateEndInfoWithFrame:", v32, v34, v36, v38);

}

- (void)prepareForSplitTransition
{
  id v2;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForSplitTransition");

}

- (void)finishSplitTransition
{
  id v2;

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishSplitTransition");

}

- (void)placementNeedsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a3;
  self->_scrolling = 0;
  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v4 == v13)
  {
    objc_msgSend(v13, "applicatorInfoForOwner:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "indexOfHost:", self));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, 0x1E174E440);

    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__UIInputWindowControllerHostingItem_placementNeedsUpdate___block_invoke;
    v14[3] = &unk_1E16D6240;
    v15 = v6;
    v12 = v6;
    objc_msgSend(v11, "performOnDistributedControllers:", v14);

    v5 = v13;
  }

}

uint64_t __59__UIInputWindowControllerHostingItem_placementNeedsUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", 0x1E174E460, *(_QWORD *)(a1 + 32));
}

- (void)startTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (!objc_msgSend(v11, "isEqualToString:", 0x1E174E660))
  {
    objc_msgSend(v6, "objectForKey:", 0x1E174E540);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) != 0)
      goto LABEL_10;
    if (objc_msgSend(v11, "isEqualToString:", 0x1E174E3E0))
    {
      -[UIInputWindowControllerHostingItem willBeginTranslation](self, "willBeginTranslation");
      v9 = (void *)MEMORY[0x1E0C9AAB0];
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", 0x1E174E480))
        goto LABEL_10;
      objc_msgSend(v6, "objectForKey:", 0x1E174E520);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowControllerHostingItem willBeginTranslation](self, "willBeginTranslation");
      if (!v9)
        goto LABEL_10;
    }
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generateNotificationsForStart:", objc_msgSend(v9, "BOOLValue"));

    goto LABEL_10;
  }
  if (self->_inputCombinedBackdropView)
    -[UIInputWindowControllerHostingItem createAnimationMatchWithInfo:](self, "createAnimationMatchWithInfo:", v6);
LABEL_10:

}

- (BOOL)_isForSelf:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  BOOL v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E174E440);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
    WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    v8 = v6 == objc_msgSend(WeakRetained, "indexOfHost:", self);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  char v15;
  void (**v16)(_QWORD);
  id v17;
  _BOOL4 v18;
  id WeakRetained;
  void *v20;
  id v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[4];
  void (**v39)(_QWORD);
  _QWORD aBlock[5];
  id v41;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v8 = v7;
  v41 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
    && !self->_scrolling
    && objc_msgSend(v6, "isEqualToString:", 0x1E174E5A0))
  {
    -[UIInputWindowControllerHostingItem createAnimationMatchWithInfo:](self, "createAnimationMatchWithInfo:", v8);
  }
  v10 = objc_msgSend(v6, "isEqualToString:", 0x1E174E5A0);
  if (!v10)
  {
    v14 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "showsKeyboard"))
  {
    v36 = v11;
    v14 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "dontDismissKeyboardOnScrolling") & 1) != 0)
  {
    v35 = v12;
    v36 = v11;
    v13 = 0;
    v14 = 1;
LABEL_11:
    v15 = objc_msgSend(v6, "isEqualToString:", 0x1E174E3E0, v32);
    goto LABEL_12;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (objc_msgSend(WeakRetained, "host:isForPurpose:", self, 3))
  {

    goto LABEL_33;
  }
  v34 = WeakRetained;
  v35 = v12;
  v36 = v11;
  v14 = 1;
  v13 = 1;
  v15 = objc_msgSend(v6, "isEqualToString:", 0x1E174E3E0, v34);
LABEL_12:
  if ((v15 & 1) != 0 || objc_msgSend(v6, "isEqualToString:", 0x1E174E420))
  {
    v16 = v9;
    v17 = objc_loadWeakRetained((id *)&self->_container);
    if ((objc_msgSend(v17, "host:isForPurpose:", self, 2) & 1) != 0)
    {
      v18 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", 0x1E174E460))
    {
      v18 = -[UIInputWindowControllerHostingItem _isForSelf:](self, "_isForSelf:", v8);
    }
    else
    {
      v18 = 0;
    }

    v9 = v16;
    if ((v13 & 1) != 0)
    {
LABEL_23:

      if ((v14 & 1) == 0)
        goto LABEL_24;
      goto LABEL_31;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", 0x1E174E460))
  {
    v18 = -[UIInputWindowControllerHostingItem _isForSelf:](self, "_isForSelf:", v8);
    if (v13)
      goto LABEL_23;
  }
  else
  {
    v18 = 0;
    if (v13)
      goto LABEL_23;
  }
  if (!v14)
  {
LABEL_24:
    if (v10)
      goto LABEL_25;
    goto LABEL_32;
  }
LABEL_31:

  if ((v10 & 1) != 0)
  {
LABEL_25:

    if (!v18)
      goto LABEL_36;
    goto LABEL_33;
  }
LABEL_32:
  if (!v18)
  {
LABEL_36:
    if (objc_msgSend(v6, "isEqualToString:", 0x1E174E480)
      && (v21 = objc_loadWeakRetained((id *)&self->_container),
          v22 = objc_msgSend(v21, "host:isForPurpose:", self, 2),
          v21,
          v22))
    {
      objc_msgSend(v8, "objectForKey:", 0x1E174E4A0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24;
      objc_msgSend(v8, "objectForKey:", 0x1E174E4C0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;
      objc_msgSend(v8, "objectForKey:", 0x1E174E4E0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      -[UIInputWindowControllerHostingItem updateProgress:startHeight:endHeight:](self, "updateProgress:startHeight:endHeight:", v25, v28, v30);

    }
    else if (objc_msgSend(v6, "isEqualToString:", 0x1E174E6E0))
    {
      v31 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke_2;
      v38[3] = &unk_1E16B1BF8;
      v39 = v9;
      v37[0] = v31;
      v37[1] = 3221225472;
      v37[2] = __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke_3;
      v37[3] = &unk_1E16B3FD8;
      v37[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v38, v37, 0.25, 0.0);

    }
    else if (objc_msgSend(v6, "isEqualToString:", 0x1E174E700))
    {
      v9[2](v9);
    }
    goto LABEL_43;
  }
LABEL_33:
  if (objc_msgSend(v6, "isEqualToString:", 0x1E174E5A0))
    self->_scrolling = 1;
  -[UIInputWindowControllerHostingItem applicator](self, "applicator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "applyChanges:", v8);

LABEL_43:
}

void __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "applicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applyChanges:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "owner");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__UIInputWindowControllerHostingItem_updateTransition_withInfo___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "didUpdateTransition");
  return result;
}

- (void)completeTransition:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD);
  void *v32;
  void *v33;
  dispatch_time_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id interactiveTransitionCleanupBlock;
  void (**v40)(_QWORD);
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD aBlock[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  _QWORD v50[4];
  id v51;
  UIInputWindowControllerHostingItem *v52;
  _QWORD v53[4];
  id v54;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", 0x1E174E5A0))
  {
    -[UIInputWindowControllerHostingItem placement](self, "placement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "showsKeyboard"))
    {

      goto LABEL_5;
    }
    v9 = +[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP");

    if (v9)
    {
LABEL_5:
      if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
        -[UIInputWindowControllerHostingItem createAnimationMatchWithInfo:](self, "createAnimationMatchWithInfo:", v7);
      self->_scrolling = 0;
      objc_msgSend(v7, "objectForKey:", 0x1E174E620);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", 0x1E174E600);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        || (-[UIInputWindowControllerHostingItem owner](self, "owner"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "dontDismissKeyboardOnScrolling"),
            v12,
            (v13 & 1) != 0))
      {
        -[UIScrollToDismissSupport cancelNotificationsForMode:](self->_cachedScrollDismissController, "cancelNotificationsForMode:", (int)objc_msgSend(v10, "intValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addKeyboardNotificationDebuggingInfo:", CFSTR("completeTransition: cancel (hosting item)"));
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "postStartNotifications:withInfo:", 2, v14);

        objc_msgSend(v11, "doubleValue");
        v17 = v16;
        v48 = v14;
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_4;
        v49[3] = &unk_1E16B1B28;
        v49[4] = self;
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_5;
        v47[3] = &unk_1E16B2218;
        v47[4] = self;
        v18 = v14;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v49, v47, v17, 0.0);

LABEL_10:
LABEL_30:

        goto LABEL_31;
      }
      objc_initWeak(&location, self);
      v37 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke;
      v53[3] = &unk_1E16B3F40;
      objc_copyWeak(&v54, &location);
      v38 = (void *)objc_msgSend(v53, "copy");
      interactiveTransitionCleanupBlock = self->_interactiveTransitionCleanupBlock;
      self->_interactiveTransitionCleanupBlock = v38;

      v50[0] = v37;
      v50[1] = 3221225472;
      v50[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_2;
      v50[3] = &unk_1E16B1B50;
      v51 = v7;
      v52 = self;
      v40 = (void (**)(_QWORD))_Block_copy(v50);
      if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
      {
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "pushAnimationStyle:", v42);

        v40[2](v40);
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "popAnimationStyle");
      }
      else
      {
        if (!v11)
        {
          v40[2](v40);
          goto LABEL_37;
        }
        -[UIInputWindowControllerHostingItem owner](self, "owner");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        +[UIInputViewAnimationStyle animationStyleAnimated:duration:](UIInputViewAnimationStyle, "animationStyleAnimated:duration:", 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "performOperations:withAnimationStyle:", v40, v44);

      }
LABEL_37:

      objc_destroyWeak(&v54);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "moveKeyboardLayoutGuideOffscreen");

  }
  if (!objc_msgSend(v6, "isEqualToString:", 0x1E174E6E0))
  {
    objc_msgSend(v7, "objectForKey:", 0x1E174E520);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v6, "isEqualToString:", 0x1E174E420);
    -[NSMutableDictionary objectForKey:](self->_assistantBackdropViewEdgeConstraints, "objectForKey:", &unk_1E1A98D60);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConstant:", 0.0);

    -[UIInputWindowControllerHostingItem placement](self, "placement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "inputAssistantViewHeightForInputViewSet:", v24);
    -[NSLayoutConstraint setConstant:](self->_assistantViewHeightConstraint, "setConstant:");

    objc_msgSend(v7, "objectForKey:", 0x1E174E560);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v25, "BOOLValue");

    if ((_DWORD)v24)
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setUndockedWithOffset:animated:", 0, 0.0, self->_verticalTranslationForSplitKeyboard);

      -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "refreshPresentation");

      -[UIInputWindowControllerHostingItem owner](self, "owner");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:layoutSubviews:", v10 != 0, 1);

    }
    objc_msgSend(v7, "objectForKey:", 0x1E174E500);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
      -[UIInputWindowControllerHostingItem transitionDidFinish:](self, "transitionDidFinish:", objc_msgSend(v29, "BOOLValue"));
    if (v21)
      -[UIInputSetHostView layoutIfNeeded](self->_hostView, "layoutIfNeeded");
    if (v10)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_6;
      aBlock[3] = &unk_1E16B1B50;
      aBlock[4] = self;
      v46 = v10;
      v31 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(v7, "objectForKey:", 0x1E174E580);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v34 = objc_msgSend(v32, "longLongValue");
        dispatch_after(v34, MEMORY[0x1E0C80D38], v31);
      }
      else
      {
        v31[2](v31);
      }

    }
    if (v21)
      -[UIInputWindowControllerHostingItem didFinishTranslation](self, "didFinishTranslation");
    objc_msgSend(v7, "objectForKey:", 0x1E174E400);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
      -[UIInputWindowControllerHostingItem finishSplitTransition:](self, "finishSplitTransition:", objc_msgSend(v35, "BOOLValue"));

    goto LABEL_30;
  }
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "generateNotificationsForCompactAssistantFlickGestureCompletion:", v7);

LABEL_31:
}

void __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishScrollViewTransition");
  objc_msgSend(WeakRetained, "removeMatchMoveAnimationIfNeeded");

}

void __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", 0x1E174E5E0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", 0x1E174E5C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_3;
  v5[3] = &unk_1E16B1B28;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "moveFromPlacement:toPlacement:starting:completion:", v4, v2, 0, v5);

}

uint64_t __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishScrollViewTransition");
}

uint64_t __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetVerticalConstraint");
}

void __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_5(uint64_t a1)
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
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "finishScrollViewTransition");
  objc_msgSend(*(id *)(a1 + 32), "removeMatchMoveAnimationIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "owner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "notificationsFrame");
  objc_msgSend(v2, "convertRectFromContainerCoordinateSpaceToScreenSpace:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 40), "populateEndInfoWithFrame:", v4, v6, v8, v10);
  objc_msgSend(*(id *)(a1 + 32), "owner");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postEndNotifications:withInfo:", 2, *(_QWORD *)(a1 + 40));

}

void __66__UIInputWindowControllerHostingItem_completeTransition_withInfo___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "owner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generateNotificationsForStart:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));

}

- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *WeakRetained;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v20 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (!objc_msgSend(WeakRetained, "host:isForPurpose:", self, 200))
    goto LABEL_7;
  if ((objc_msgSend(v20, "isFloatingAssistantView") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isFloating");

  if ((v12 & 1) == 0)
  {
LABEL_6:
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPlacement:quietly:animated:generateSplitNotification:", v20, v8, v7, v6);
LABEL_7:

  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "keyboardActive");

  if ((v14 & 1) == 0)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "screen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardMotionSupport supportForScreen:](UIFlickingAssistantViewSupport, "supportForScreen:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "isFloatingAssistantView"))
      v19 = v20;
    else
      v19 = 0;
    objc_msgSend(v18, "setRemotePlacement:", v19);

  }
}

- (void)transitionDidFinish:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIKBInputBackdropView *inputBackdropView;
  void *v7;
  UIKBInputBackdropView *inputAssistantBackdropView;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[UIInputWindowControllerHostingItem setAccessoryViewVisible:delay:](self, "setAccessoryViewVisible:delay:", 1, 0.15);
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_endSplitTransitionIfNeeded");

  inputBackdropView = self->_inputBackdropView;
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputBackdropView _endSplitTransitionIfNeeded:](inputBackdropView, "_endSplitTransitionIfNeeded:", objc_msgSend(v7, "isSplit"));

  inputAssistantBackdropView = self->_inputAssistantBackdropView;
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBInputBackdropView _endSplitTransitionIfNeeded:](inputAssistantBackdropView, "_endSplitTransitionIfNeeded:", objc_msgSend(v9, "isSplit"));

  -[UIInputWindowControllerHostingItem _updateBackdropViews](self, "_updateBackdropViews");
  if (v3)
  {
    -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "refreshPresentation");

  }
  -[UIView _popDisableLayoutFlushing](self->_inputBackdropView);
  -[UIInputWindowControllerHostingItem inputAccessoryView](self, "inputAccessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _popDisableLayoutFlushing](v11);

  -[UIView setNeedsLayout](self->_hostView, "setNeedsLayout");
  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:layoutSubviews:", 0, 1);

}

- (void)createAnimationMatchWithInfo:(id)a3
{
  id v4;
  void *v5;
  _UIKBLightEffectsBackground *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  void *v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E660);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self->_inputCombinedBackdropView;
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E680);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_UIKBLightEffectsBackground layerForPositionMatchMove](self->_inputCombinedBackdropView, "layerForPositionMatchMove");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "removeAnimationForKey:", 0x1E174E680);
        objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E680);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        objc_msgSend(v8, "objectForKeyedSubscript:", 0x1E174E6A0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSourceContextId:", objc_msgSend(v10, "integerValue"));

        objc_msgSend(v8, "objectForKeyedSubscript:", 0x1E174E6C0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSourceLayerRenderId:", objc_msgSend(v11, "integerValue"));

        objc_msgSend(v9, "setDuration:", INFINITY);
        objc_msgSend(v9, "setUsesNormalizedCoordinates:", 1);
        v36[0] = 0;
        v36[1] = 0;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v36, "{CGPoint=dd}");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v12;
        v35 = xmmword_1866721B0;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v35, "{CGPoint=dd}");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v13;
        __asm { FMOV            V0.2D, #1.0 }
        v34 = _Q0;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v34, "{CGPoint=dd}");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2] = v19;
        v33 = xmmword_18666F250;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v33, "{CGPoint=dd}");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38[3] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSourcePoints:", v21);

        v22 = v32;
        objc_msgSend(v32, "addAnimation:forKey:", v9, 0x1E174E680);

LABEL_8:
      }
    }
  }
  else
  {
    -[UIInputWindowControllerHostingItem scrollTrackingView](self, "scrollTrackingView");
    v6 = (_UIKBLightEffectsBackground *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E6A0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[UIView layer](v6, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeAnimationForKey:", CFSTR("KeyboardScrollToDismissAnimation"));

        v22 = (void *)objc_opt_new();
        objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E6A0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSourceContextId:", objc_msgSend(v25, "integerValue"));

        objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E6C0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSourceLayerRenderId:", objc_msgSend(v26, "integerValue"));

        objc_msgSend(v22, "setDuration:", INFINITY);
        objc_msgSend(v22, "setUsesNormalizedCoordinates:", 1);
        objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E640);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v29 = v28;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.5, v29 * 0.5 + 0.5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSourcePoints:", v31);

        -[UIView layer](v6, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAnimation:forKey:", v22, CFSTR("KeyboardScrollToDismissAnimation"));
        goto LABEL_8;
      }
    }
  }

}

- (double)offsetForSplitTransition
{
  return self->_verticalTranslationForSplitKeyboard;
}

- (void)resetVerticalConstraint
{
  void *v3;
  void *v4;
  id v5;

  -[UIInputWindowControllerHostingItem placement](self, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHostingItem updateVisibilityConstraintsForPlacement:](self, "updateVisibilityConstraintsForPlacement:", v3);

  -[UIInputWindowControllerHostingItem owner](self, "owner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)setAccessoryViewVisible:(BOOL)a3 delay:(double)a4
{
  _BOOL8 v5;
  void *v7;
  int v8;
  _QWORD v9[5];
  BOOL v10;

  v5 = a3;
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setAccessoryViewVisible:delay:", v5, a4);

  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__UIInputWindowControllerHostingItem_setAccessoryViewVisible_delay___block_invoke;
    v9[3] = &unk_1E16B1B78;
    v9[4] = self;
    v10 = v5;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v9, 0, 0.15, a4);
  }
}

uint64_t __68__UIInputWindowControllerHostingItem_setAccessoryViewVisible_delay___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setAlpha:", (double)*(unint64_t *)&a2);
}

- (BOOL)_isForSplitKeyboard
{
  void *v2;
  BOOL v4;
  char v5;
  id WeakRetained;

  v4 = +[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI");
  if (!v4)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "shouldNotifyRemoteKeyboards") & 1) != 0)
    {
      v5 = 0;
LABEL_5:

      return v5;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  v5 = objc_msgSend(WeakRetained, "host:isForPurpose:", self, 2);

  if (!v4)
    goto LABEL_5;
  return v5;
}

- (void)finishScrollViewTransition
{
  -[UIScrollToDismissSupport finishScrollViewTransitionForController:](self->_cachedScrollDismissController, "finishScrollViewTransitionForController:", self);
}

- (void)removeMatchMoveAnimationIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIInputWindowControllerHostingItem scrollTrackingView](self, "scrollTrackingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationForKey:", CFSTR("KeyboardScrollToDismissAnimation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIInputWindowControllerHostingItem scrollTrackingView](self, "scrollTrackingView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAnimationForKey:", CFSTR("KeyboardScrollToDismissAnimation"));

    }
  }
}

- (void)enumerateBoundingRects:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  -[UIInputWindowControllerHostingItem inputViewSet](self, "inputViewSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSplit"))
  {
    objc_msgSend(v6, "_leftInputViewSetFrame");
    v4[2](v4);
    objc_msgSend(v6, "_rightInputViewSetFrame");
    v4[2](v4);
  }
  else
  {
    -[UIInputWindowControllerHostingItem placement](self, "placement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adjustBoundsForNotificationsWithOwner:", self);
    v4[2](v4);

    v4 = (void (**)(_QWORD))v5;
  }

}

- (UIFlickingAssistantViewSupport)flickingAssistantViewSupport
{
  return self->_cachedFlickingAssistantViewController;
}

- (_UIKBLightEffectsBackground)_inputCombinedBackdropView
{
  return self->_inputCombinedBackdropView;
}

- (UIKBInputBackdropView)_inputAccessoryBackdropView
{
  return self->_inputAccessoryBackdropView;
}

- (void)setHostView:(id)a3
{
  objc_storeStrong((id *)&self->_hostView, a3);
}

- (void)setApplicator:(id)a3
{
  objc_storeStrong((id *)&self->_applicator, a3);
}

- (UIView)floatingKeyboardMaskView
{
  return self->_floatingKeyboardMaskView;
}

- (void)setFloatingKeyboardMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingKeyboardMaskView, a3);
}

- (BOOL)animatingBackdrops
{
  return self->_animatingBackdrops;
}

- (void)setAnimatingBackdrops:(BOOL)a3
{
  self->_animatingBackdrops = a3;
}

@end

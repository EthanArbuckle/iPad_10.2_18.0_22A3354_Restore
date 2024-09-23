@implementation UIInputViewSetPlacement_FloatingApplicator

- (id)draggableView
{
  void *v2;
  void *v3;

  -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "affordance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)twoFingerDraggableView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(WeakRetained, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)backdropContainer
{
  void *v2;
  void *v3;

  -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backdropParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)preBeginGesture:(id)a3 shouldBegin:(BOOL *)a4
{
  return 0;
}

- (BOOL)isGesture:(id)a3 inDraggableView:(CGPoint)a4
{
  return 1;
}

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isPopoverRequired
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(WeakRetained, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "isInputViewPlaceholder") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)applyChanges:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  UIKeyboardPopoverContainer *v25;
  id v26;
  void *v27;
  id v28;
  UIKeyboardPopoverContainer *v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(WeakRetained, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_window");
  v7 = (id *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "_isTextEffectsWindow"))
  {
    -[UIWindow _fbsScene](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "visualModeManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shouldShowWithinAppWindow");

      if ((v11 & 1) == 0)
      {
        +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "oldPathForSnapshot");

        if (!v13)
          goto LABEL_8;
      }
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "keyboardActive");

      if (v15)
      {
        -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {

        }
        else if (-[UIInputViewSetPlacement_FloatingApplicator isPopoverRequired](self, "isPopoverRequired"))
        {
          v25 = [UIKeyboardPopoverContainer alloc];
          v26 = objc_loadWeakRetained((id *)&self->super.super._owner);
          objc_msgSend(v26, "containerView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_loadWeakRetained((id *)&self->super.super._owner);
          v29 = -[UIKeyboardPopoverContainer initWithView:usingBackdropStyle:](v25, "initWithView:usingBackdropStyle:", v27, objc_msgSend(v28, "inputViewBackdropStyle"));
          -[UIInputViewSetPlacement_FloatingApplicator setPopover:](self, "setPopover:", v29);

        }
      }
      else
      {
LABEL_8:
        -[UIInputViewSetPlacement_FloatingApplicator invalidatePopover](self, "invalidatePopover");
      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)UIInputViewSetPlacement_FloatingApplicator;
  -[UIInputViewSetPlacement_UndockedApplicator applyChanges:](&v32, sel_applyChanges_, v4);
  objc_msgSend(v4, "objectForKey:", CFSTR("Origin"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "pointValue");
    objc_msgSend(v18, "pointValue");
    -[NSLayoutConstraint setConstant:](self->super.super._horizontalConstraint, "setConstant:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("PopoverRect"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "rectValue");
    -[UIInputViewSetPlacement_FloatingApplicator setPopoverRectPlaceholder:](self, "setPopoverRectPlaceholder:");
  }
  if (-[UIInputViewSetPlacement_FloatingApplicator isPopoverRequired](self, "isPopoverRequired"))
  {
    -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "applyProperties:", v4);

  }
  else
  {
    -[UIInputViewSetPlacement_FloatingApplicator invalidatePopover](self, "invalidatePopover");
  }
  v22 = objc_loadWeakRetained((id *)&self->super.super._owner);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __59__UIInputViewSetPlacement_FloatingApplicator_applyChanges___block_invoke;
  v30[3] = &unk_1E16B1B28;
  v31 = v22;
  v23 = v22;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v30);
  -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "updateBackdropStyle:", objc_msgSend(v23, "inputViewBackdropStyle"));

}

- (void)prepare
{
  id WeakRetained;
  UIKeyboardPopoverContainer *v4;
  void *v5;
  UIKeyboardPopoverContainer *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIInputViewSetPlacement_FloatingApplicator;
  -[UIInputViewSetPlacement_GenericApplicator prepare](&v13, sel_prepare);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  if (-[UIInputViewSetPlacement_FloatingApplicator isPopoverRequired](self, "isPopoverRequired"))
  {
    v4 = [UIKeyboardPopoverContainer alloc];
    objc_msgSend(WeakRetained, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIKeyboardPopoverContainer initWithView:usingBackdropStyle:](v4, "initWithView:usingBackdropStyle:", v5, objc_msgSend(WeakRetained, "inputViewBackdropStyle"));
    -[UIInputViewSetPlacement_FloatingApplicator setPopover:](self, "setPopover:", v6);

    objc_msgSend(WeakRetained, "placement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicatorInfoForOwner:", WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSetPlacement_FloatingApplicator startingPropertiesFromPlacementProperties:](self, "startingPropertiesFromPlacementProperties:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__UIInputViewSetPlacement_FloatingApplicator_prepare__block_invoke;
    v11[3] = &unk_1E16B1B50;
    v11[4] = self;
    v12 = v9;
    v10 = v9;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);

  }
}

- (id)startingPropertiesFromPlacementProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE v9[48];
  _BYTE v10[48];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", &unk_1E1A98CD0, CFSTR("Alpha"));
    v5 = (void *)MEMORY[0x1E0CB3B18];
    -[UIInputViewSetPlacement_FloatingApplicator scaledPopoverTransform](self, "scaledPopoverTransform");
    objc_msgSend(v5, "valueWithCGAffineTransform:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Transform"));
  }
  else
  {
    v11[0] = CFSTR("Alpha");
    v11[1] = CFSTR("Transform");
    v12[0] = &unk_1E1A98CD0;
    v7 = (void *)MEMORY[0x1E0CB3B18];
    -[UIInputViewSetPlacement_FloatingApplicator scaledPopoverTransform](self, "scaledPopoverTransform");
    objc_msgSend(v7, "valueWithCGAffineTransform:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (CGAffineTransform)scaledPopoverTransform
{
  CGAffineTransform *result;
  uint64_t v5;
  __int128 v6;
  CGAffineTransform v7;

  result = (CGAffineTransform *)_AXSReduceMotionReduceSlideTransitionsEnabled();
  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  if ((_DWORD)result)
  {
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  }
  else
  {
    *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7.c = v6;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    return CGAffineTransformScale(retstr, &v7, 0.5, 0.5);
  }
  return result;
}

- (void)invalidatePopover
{
  void *v3;
  void *v4;

  -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[UIInputViewSetPlacement_FloatingApplicator setPopover:](self, "setPopover:", 0);
  }
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInputViewSetPlacement_FloatingApplicator;
  -[UIInputViewSetPlacement_GenericApplicator invalidate](&v3, sel_invalidate);
  -[UIInputViewSetPlacement_FloatingApplicator invalidatePopover](self, "invalidatePopover");
}

- (CGRect)popoverFrame
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
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    -[UIInputViewSetPlacement_FloatingApplicator popoverRectPlaceholder](self, "popoverRectPlaceholder");
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  int v6;
  char v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIInputViewSetPlacement_FloatingApplicator;
  v5 = -[UIInputViewSetPlacement_GenericApplicator isEqual:](&v10, sel_isEqual_, v4);
  objc_opt_class();
  v6 = objc_opt_isKindOfClass() ^ 1;
  v7 = v6 & v5;
  if ((v6 & 1) == 0 && v5)
  {
    -[UIInputViewSetPlacement_FloatingApplicator popover](self, "popover");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  return v7;
}

- (UIKeyboardPopoverContainer)popover
{
  return self->_popover;
}

- (void)setPopover:(id)a3
{
  objc_storeStrong((id *)&self->_popover, a3);
}

- (CGRect)popoverRectPlaceholder
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_popoverRectPlaceholder.origin.x;
  y = self->_popoverRectPlaceholder.origin.y;
  width = self->_popoverRectPlaceholder.size.width;
  height = self->_popoverRectPlaceholder.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPopoverRectPlaceholder:(CGRect)a3
{
  self->_popoverRectPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popover, 0);
}

@end

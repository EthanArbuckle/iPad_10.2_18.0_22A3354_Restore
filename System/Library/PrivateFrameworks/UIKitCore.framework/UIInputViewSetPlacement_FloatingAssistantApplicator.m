@implementation UIInputViewSetPlacement_FloatingAssistantApplicator

- (void)prepare
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicator;
  -[UIInputViewSetPlacement_GenericApplicator prepare](&v3, sel_prepare);
  -[UIInputViewSetPlacement_FloatingAssistantApplicator setupHostViewIfNeeded](self, "setupHostViewIfNeeded");
}

- (void)setupHostViewIfNeeded
{
  UIInputViewSetPlacementOwner **p_owner;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v19;

  p_owner = &self->super.super._owner;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(WeakRetained, "hostView");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(v5, "inputViewSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "inputAssistantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      v11 = objc_loadWeakRetained((id *)p_owner);
      objc_msgSend(v11, "inputAssistantHostView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSetPlacement_FloatingAssistantApplicator setHostView:](self, "setHostView:", v12);

      -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSystemInputAssistantView:", v8);

    }
  }
  objc_msgSend(v6, "inputAccessoryView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_msgSend(v14, "isHidden") & 1) != 0)
    goto LABEL_8;
  v16 = objc_msgSend(v6, "isInputAccessoryViewPlaceholder");

  if ((v16 & 1) == 0)
  {
    v17 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v17, "inputAssistantHostView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSetPlacement_FloatingAssistantApplicator setHostView:](self, "setHostView:", v18);

    -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInputAccessoryView:", v14);
LABEL_8:

  }
}

- (void)applyChanges:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _OWORD v42[6];
  objc_super v43;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(v4, "objectForKey:", CFSTR("Transform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  memset(&v48, 0, sizeof(v48));
  if (v6)
  {
    objc_msgSend(v6, "CGAffineTransformValue");
  }
  else
  {
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v48.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v48.c = v8;
    *(_OWORD *)&v48.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  objc_msgSend(WeakRetained, "inputViewSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputViewBounds");
  v11 = v10;
  v12 = v10 * 0.5;

  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeTranslation(&t2, 0.0, -(v11 * 0.5));
  t1 = v48;
  CGAffineTransformConcat(&v46, &t1, &t2);
  CGAffineTransformTranslate(&v47, &v46, 0.0, v12);
  v13 = (void *)objc_msgSend(v4, "mutableCopy");
  t1 = v47;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", &t1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v14, CFSTR("Transform"));

  if (-[UIInputViewSetPlacement_FloatingAssistantApplicator shouldApplyOriginChange](self, "shouldApplyOriginChange"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Origin"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "pointValue");
      -[NSLayoutConstraint setConstant:](self->super.super._horizontalConstraint, "setConstant:");
    }

  }
  else
  {
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("Origin"));
  }
  v43.receiver = self;
  v43.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicator;
  -[UIInputViewSetPlacement_GenericApplicator applyChanges:](&v43, sel_applyChanges_, v13);
  objc_msgSend(v4, "objectForKey:", CFSTR("AlphaForAssistantBar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17
    || (objc_msgSend(v4, "objectForKey:", CFSTR("Alpha")), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v17, "doubleValue");
    v21 = v20;
    -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", v21);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("TransformForAssistantBar"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23
    || (objc_msgSend(v4, "objectForKey:", CFSTR("Transform")), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v23, "CGAffineTransformValue");
    -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v42[3];
    v42[1] = v42[4];
    v42[2] = v42[5];
    objc_msgSend(v24, "setTransformForContent:", v42);

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("IsCompact"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCompact:", v26);

  -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {

    goto LABEL_17;
  }
  objc_msgSend(WeakRetained, "inputViewSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "inputAssistantView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {

LABEL_25:
    -[UIInputViewSetPlacement_FloatingAssistantApplicator setupHostViewIfNeeded](self, "setupHostViewIfNeeded");
    goto LABEL_26;
  }
  objc_msgSend(WeakRetained, "inputViewSet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "inputAccessoryView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
    goto LABEL_25;
LABEL_17:
  -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(WeakRetained, "inputViewSet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "inputAssistantView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {

    }
    else
    {
      objc_msgSend(WeakRetained, "inputViewSet");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "inputAccessoryView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
        -[UIInputViewSetPlacement_FloatingAssistantApplicator setHostView:](self, "setHostView:", 0);
    }
  }
LABEL_26:
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __68__UIInputViewSetPlacement_FloatingAssistantApplicator_applyChanges___block_invoke;
  v40[3] = &unk_1E16B1B28;
  v41 = WeakRetained;
  v39 = WeakRetained;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v40);

}

- (BOOL)shouldApplyOriginChange
{
  return 1;
}

- (void)invalidate
{
  id WeakRetained;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicator;
  -[UIInputViewSetPlacement_GenericApplicator invalidate](&v6, sel_invalidate);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(WeakRetained, "setHideInputAssistantBackdrop:", 0);

  v4 = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(v4, "setHideInputViewBackdrops:", 0);

  v5 = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(v5, "setHideInputView:", 0);

  -[UIInputViewSetPlacement_FloatingAssistantApplicator setHostView:](self, "setHostView:", 0);
}

- (CGRect)popoverFrame
{
  UIInputViewSetPlacementOwner **p_owner;
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
  id v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v23;
  void *v24;
  double v25;
  CGFloat v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;
  CGRect v37;

  p_owner = &self->super.super._owner;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(WeakRetained, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(v13, "hostView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v37.origin.x = v15;
  v37.origin.y = v16;
  v37.size.width = v17;
  v37.size.height = v18;
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  v34 = CGRectIntersection(v33, v37);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;

  v23 = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(v23, "containerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;

  v27 = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(v27, "placement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "isCompactAssistantView") & 1) != 0
    || (v35.origin.x = x, v35.origin.y = y, v35.size.width = width, v35.size.height = height, CGRectIsEmpty(v35)))
  {
    x = 0.0;
    width = 0.0;
    height = 0.0;
  }
  else
  {
    v26 = y;
  }

  v29 = x;
  v30 = v26;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (UIEdgeInsets)inputAccessoryPadding
{
  void *v3;
  void *v4;
  int v5;
  UIInputViewSetPlacementOwner **p_owner;
  id WeakRetained;
  void *v8;
  int v9;
  int IsHidden;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  objc_super v32;
  UIEdgeInsets result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowingModeEnabled");

  p_owner = &self->super.super._owner;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  objc_msgSend(WeakRetained, "placement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCompactAssistantView");

  IsHidden = UIInputAssistantViewIsHidden();
  if (v5 && (v9 & 1) == 0 && IsHidden)
  {
    -[UIInputViewSetPlacement_GenericApplicator inputAccessoryPadding](&v32, sel_inputAccessoryPadding, v31.receiver, v31.super_class, self, UIInputViewSetPlacement_FloatingAssistantApplicator);
LABEL_8:
    v20 = v11;
    v22 = v12;
    v24 = v13;
    v26 = v14;
    goto LABEL_9;
  }
  if ((v9 | IsHidden) != 1)
  {
    -[UIInputViewSetPlacement_GenericApplicator inputAccessoryPadding](&v31, sel_inputAccessoryPadding, self, UIInputViewSetPlacement_FloatingAssistantApplicator, v32.receiver, v32.super_class);
    goto LABEL_8;
  }
  v15 = (void *)objc_opt_class();
  v16 = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(v16, "hostView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inputAccessoryPaddingForTraitCollection:", v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

LABEL_9:
  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.right = v30;
  result.bottom = v29;
  result.left = v28;
  result.top = v27;
  return result;
}

+ (UIEdgeInsets)inputAccessoryPaddingForTraitCollection:(id)a3
{
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", a3);
  v4 = v3;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || (v5 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"), v6 = 14.0, v5))
  {
    v6 = 0.0;
  }
  v7 = v4 + v6;
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  result.right = v10;
  result.bottom = v7;
  result.left = v9;
  result.top = v8;
  return result;
}

- (TUIInputAssistantHostView)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
  objc_storeStrong((id *)&self->_hostView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostView, 0);
}

@end

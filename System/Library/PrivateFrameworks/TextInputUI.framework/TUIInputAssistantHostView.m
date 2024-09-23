@implementation TUIInputAssistantHostView

- (int)textEffectsVisibilityLevel
{
  return *MEMORY[0x1E0DC54A8];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TUIInputAssistantHostView subviews](self, "subviews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isUserInteractionEnabled"))
        {
          -[TUIInputAssistantHostView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          if ((objc_msgSend(v13, "pointInside:withEvent:", v7) & 1) != 0)
          {
            v14 = 1;
            goto LABEL_12;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  TUIInputAssistantHostView *v5;
  TUIInputAssistantHostView *v6;
  TUIInputAssistantHostView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIInputAssistantHostView;
  -[TUIInputAssistantHostView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (TUIInputAssistantHostView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
  {
    -[TUIInputAssistantHostView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      v7 = self;
    else
      v7 = 0;

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)setSystemInputAssistantView:(id)a3
{
  TUISystemInputAssistantView *v5;

  v5 = (TUISystemInputAssistantView *)a3;
  if (self->_systemInputAssistantView == v5)
  {
    -[TUIInputAssistantHostView ensureInputAssistantConstraints](self, "ensureInputAssistantConstraints");
  }
  else
  {
    objc_storeStrong((id *)&self->_systemInputAssistantView, a3);
    -[TUIInputAssistantHostView updateInputAssistantBackdrop](self, "updateInputAssistantBackdrop");
  }

}

- (void)setInputAccessoryView:(id)a3
{
  void *v5;
  void *v6;
  UIView *v7;

  v7 = (UIView *)a3;
  if (self->_inputAccessoryView != v7)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[TUIInputAssistantHostView inputAccessoryBackdropConstraints](self, "inputAccessoryBackdropConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

    -[TUIInputAssistantHostView setInputAccessoryBackdropConstraints:](self, "setInputAccessoryBackdropConstraints:", 0);
    objc_storeStrong((id *)&self->_inputAccessoryView, a3);
  }
  -[TUIInputAssistantHostView updateInputAccessoryBackdrop](self, "updateInputAccessoryBackdrop");

}

- (void)setTransformForContent:(CGAffineTransform *)a3
{
  void *v3;
  __int128 v4;

  if (self->_inputAssistantBackdropView)
  {
    -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView", *(_QWORD *)&a3->a, *(_QWORD *)&a3->b, *(_QWORD *)&a3->c, *(_QWORD *)&a3->d, *(_QWORD *)&a3->tx, *(_QWORD *)&a3->ty);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTransform:", &v4);

  }
}

- (CGAffineTransform)transformForContent
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;

  if (*(_QWORD *)&self[9].a)
  {
    -[CGAffineTransform inputAssistantBackdropView](self, "inputAssistantBackdropView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = v4;
      objc_msgSend(v4, "transform");
      v4 = v7;
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }

  }
  else
  {
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  }
  return self;
}

- (void)setCompact:(BOOL)a3
{
  if (self->_isCompact == a3)
  {
    -[TUIInputAssistantHostView ensureInputAssistantConstraints](self, "ensureInputAssistantConstraints");
  }
  else
  {
    self->_isCompact = a3;
    -[TUIInputAssistantHostView updateInputAssistantBackdrop](self, "updateInputAssistantBackdrop");
  }
}

- (TUIInputAccessoryBackdropView)inputAccessoryBackdropView
{
  TUIInputAccessoryBackdropView *inputAccessoryBackdropView;
  TUIInputAccessoryBackdropView *v4;
  TUIInputAccessoryBackdropView *v5;
  TUIInputAccessoryBackdropView *v6;

  inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
  if (!inputAccessoryBackdropView)
  {
    v4 = [TUIInputAccessoryBackdropView alloc];
    v5 = -[TUIInputAccessoryBackdropView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_inputAccessoryBackdropView;
    self->_inputAccessoryBackdropView = v5;

    -[TUIInputAssistantHostView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_inputAccessoryBackdropView, 0);
    -[TUIInputAccessoryBackdropView setTranslatesAutoresizingMaskIntoConstraints:](self->_inputAccessoryBackdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    inputAccessoryBackdropView = self->_inputAccessoryBackdropView;
  }
  return inputAccessoryBackdropView;
}

- (void)updateInputAccessoryBackdrop
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  void *v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUIInputAssistantHostView inputAccessoryBackdropConstraints](self, "inputAccessoryBackdropConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v7, "topAnchor");
      else
        objc_msgSend(v7, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIInputAssistantHostView inputAccessoryBackdropView](self, "inputAccessoryBackdropView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v37;
      -[TUIInputAssistantHostView inputAccessoryBackdropView](self, "inputAccessoryBackdropView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView bottomAnchor](self, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v33);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v32;
      -[TUIInputAssistantHostView inputAccessoryBackdropView](self, "inputAccessoryBackdropView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2] = v11;
      -[TUIInputAssistantHostView inputAccessoryBackdropView](self, "inputAccessoryBackdropView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView setInputAccessoryBackdropConstraints:](self, "setInputAccessoryBackdropConstraints:", v17);

    }
    -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "conformsToProtocol:", &unk_1EE074D28);

    -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v19)
    {
      if (!objc_msgSend(v20, "isHidden"))
      {
        -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "alpha");

      }
      v21 = (void *)objc_opt_new();
    }
    -[TUIInputAssistantHostView inputAccessoryBackdropView](self, "inputAccessoryBackdropView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInputAccessoryViewTraits:", v21);

    -[TUIInputAssistantHostView inputAccessoryBackdropView](self, "inputAccessoryBackdropView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIInputAssistantHostView inputAccessoryView](self, "inputAccessoryView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 == v27)
    {
      v28 = (void *)MEMORY[0x1E0CB3718];
      -[TUIInputAssistantHostView inputAccessoryBackdropConstraints](self, "inputAccessoryBackdropConstraints");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "activateConstraints:", v29);

    }
  }
}

- (TUIInputAssistantBackdropView)inputAssistantBackdropView
{
  TUIInputAssistantBackdropView *inputAssistantBackdropView;
  _QWORD v5[5];

  inputAssistantBackdropView = self->_inputAssistantBackdropView;
  if (!inputAssistantBackdropView)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__TUIInputAssistantHostView_inputAssistantBackdropView__block_invoke;
    v5[3] = &unk_1E24FC068;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
    -[TUIInputAssistantBackdropView setTranslatesAutoresizingMaskIntoConstraints:](self->_inputAssistantBackdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    inputAssistantBackdropView = self->_inputAssistantBackdropView;
  }
  return inputAssistantBackdropView;
}

- (void)ensureInputAssistantConstraints
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_inputAssistantBackdropView)
  {
    -[TUISystemInputAssistantView window](self->_systemInputAssistantView, "window");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[TUIInputAssistantBackdropView window](self->_inputAssistantBackdropView, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUISystemInputAssistantView window](self->_systemInputAssistantView, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_inputAssistantBackdropConstraints);
        -[TUIInputAssistantBackdropView setHidden:](self->_inputAssistantBackdropView, "setHidden:", -[TUISystemInputAssistantView isHidden](self->_systemInputAssistantView, "isHidden"));
      }
    }
  }
}

- (void)updateInputAssistantBackdrop
{
  void *v3;
  _BOOL4 isCompact;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void **v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];

  v47[4] = *MEMORY[0x1E0C80C00];
  -[TUIInputAssistantHostView systemInputAssistantView](self, "systemInputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    isCompact = self->_isCompact;
    -[TUIInputAssistantHostView systemInputAssistantView](self, "systemInputAssistantView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (isCompact)
    {
      objc_msgSend(v5, "rightButtonBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centerYAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerYAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIInputAssistantHostView systemInputAssistantView](self, "systemInputAssistantView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerXAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "centerXAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToConstant:", 50.0);
      v19 = objc_claimAutoreleasedReturnValue();

      -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToConstant:", 65.0);
      v22 = objc_claimAutoreleasedReturnValue();

      v47[0] = v11;
      v23 = (void **)v47;
      v24 = (void *)v22;
      v25 = (void *)v19;
    }
    else
    {
      objc_msgSend(v5, "leftButtonBar");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "centerYAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "centerYAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v29);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leftAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView systemInputAssistantView](self, "systemInputAssistantView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "leftButtonBar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "leftAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "rightAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIInputAssistantHostView systemInputAssistantView](self, "systemInputAssistantView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "rightButtonBar");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "rightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v39);
      v22 = objc_claimAutoreleasedReturnValue();

      -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "heightAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToConstant:", 50.0);
      v19 = objc_claimAutoreleasedReturnValue();

      v46 = v11;
      v23 = &v46;
      v24 = (void *)v19;
      v25 = (void *)v22;
    }
    v23[1] = v16;
    v23[2] = (void *)v22;
    v23[3] = (void *)v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)MEMORY[0x1E0CB3718];
    -[TUIInputAssistantHostView inputAssistantBackdropConstraints](self, "inputAssistantBackdropConstraints");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "deactivateConstraints:", v44);

    -[TUIInputAssistantHostView setInputAssistantBackdropConstraints:](self, "setInputAssistantBackdropConstraints:", v42);
    -[TUIInputAssistantHostView ensureInputAssistantConstraints](self, "ensureInputAssistantConstraints");
    -[TUIInputAssistantHostView inputAssistantBackdropView](self, "inputAssistantBackdropView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setContentCornerRadius:", 10.0);

  }
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (TUISystemInputAssistantView)systemInputAssistantView
{
  return self->_systemInputAssistantView;
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (NSArray)inputAccessoryBackdropConstraints
{
  return self->_inputAccessoryBackdropConstraints;
}

- (void)setInputAccessoryBackdropConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_inputAccessoryBackdropConstraints, a3);
}

- (NSArray)inputAssistantBackdropConstraints
{
  return self->_inputAssistantBackdropConstraints;
}

- (void)setInputAssistantBackdropConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantBackdropConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantBackdropConstraints, 0);
  objc_storeStrong((id *)&self->_inputAccessoryBackdropConstraints, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_systemInputAssistantView, 0);
  objc_storeStrong((id *)&self->_inputAssistantBackdropView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryBackdropView, 0);
}

uint64_t __55__TUIInputAssistantHostView_inputAssistantBackdropView__block_invoke(uint64_t a1)
{
  TUIInputAssistantBackdropView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = [TUIInputAssistantBackdropView alloc];
  v3 = -[TUIInputAssistantBackdropView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 432);
  *(_QWORD *)(v4 + 432) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
}

@end

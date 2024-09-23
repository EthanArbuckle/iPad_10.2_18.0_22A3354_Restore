@implementation UIPasteControl

- (UIPasteControl)initWithConfiguration:(UIPasteControlConfiguration *)configuration
{
  UIPasteControlConfiguration *v4;
  UIPasteControl *v5;
  UIPasteControl *v6;
  objc_super v8;

  v4 = configuration;
  v8.receiver = self;
  v8.super_class = (Class)UIPasteControl;
  v5 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[UIPasteControl _commonInitWithConfiguration:target:]((uint64_t)v5, v4, 0);

  return v6;
}

- (void)_commonInitWithConfiguration:(void *)a3 target:
{
  id v5;
  _UIImmutablePasteControlConfiguration *v6;
  id v7;
  _UIImmutablePasteControlConfiguration *v8;
  void *v9;
  _UIImmutablePasteControlConfiguration *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _UISecureController *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  objc_super v20;

  v19 = a2;
  v5 = a3;
  if (v19)
  {
    v6 = [_UIImmutablePasteControlConfiguration alloc];
    v7 = v19;
    if (v6)
    {
      v20.receiver = v6;
      v20.super_class = (Class)UIPasteControlConfiguration;
      v8 = (_UIImmutablePasteControlConfiguration *)objc_msgSendSuper2(&v20, sel_init);
      v6 = v8;
      if (v8)
      {
        v8->super._displayMode = *((_QWORD *)v7 + 2);
        v8->super._cornerStyle = *((_QWORD *)v7 + 3);
        v8->super._cornerRadius = *((double *)v7 + 4);
        objc_storeStrong((id *)&v8->super._baseForegroundColor, *((id *)v7 + 6));
        objc_storeStrong((id *)&v6->super._baseBackgroundColor, *((id *)v7 + 7));
      }
    }

    v9 = *(void **)(a1 + 480);
    *(_QWORD *)(a1 + 480) = v6;
  }
  else
  {
    v10 = objc_alloc_init(_UIImmutablePasteControlConfiguration);
    v9 = *(void **)(a1 + 480);
    *(_QWORD *)(a1 + 480) = v10;
  }

  objc_storeWeak((id *)(a1 + 488), v5);
  switch(objc_msgSend(v19, "displayMode"))
  {
    case 0:
      v11 = objc_alloc(MEMORY[0x1E0DC5C78]);
      v12 = 1;
      goto LABEL_13;
    case 1:
      v11 = objc_alloc(MEMORY[0x1E0DC5C78]);
      v12 = 1;
      v14 = 0;
      goto LABEL_14;
    case 2:
      v11 = objc_alloc(MEMORY[0x1E0DC5C78]);
      v12 = 0;
      goto LABEL_13;
    case 3:
      v11 = objc_alloc(MEMORY[0x1E0DC5C78]);
      v12 = 2;
LABEL_13:
      v14 = 1;
LABEL_14:
      v13 = (void *)objc_msgSend(v11, "initWithType:iconIndex:labelIndex:", 1, v12, v14);
      break;
    default:
      v13 = 0;
      break;
  }
  v15 = -[_UISecureController initWithCategory:control:]([_UISecureController alloc], "initWithCategory:control:", v13, a1);
  v16 = *(void **)(a1 + 464);
  *(_QWORD *)(a1 + 464) = v15;

  objc_msgSend(v19, "cornerRadius");
  objc_msgSend(*(id *)(a1 + 464), "setCornerRadius:");
  objc_msgSend(*(id *)(a1 + 464), "setCornerStyle:", objc_msgSend(v19, "cornerStyle"));
  objc_msgSend(v19, "baseForegroundColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(a1 + 464), "setBaseForegroundColor:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(v19, "baseBackgroundColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)(a1 + 464), "setBaseBackgroundColor:", objc_msgSend(v18, "CGColor"));

  objc_msgSend(*(id *)(a1 + 464), "setImagePlacement:", objc_msgSend(v19, "imagePlacement"));
  objc_msgSend(*(id *)(a1 + 464), "setShouldLayoutSynchronously:", objc_msgSend(v19, "_shouldLayoutSynchronously"));
  -[UIPasteControl _observePasteboard:]((_BYTE *)a1, v5 != 0);

}

- (UIPasteControl)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIPasteControl *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = coder;
  v9.receiver = self;
  v9.super_class = (Class)UIPasteControl;
  v5 = -[UIControl initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPasteControlConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPasteControlTarget"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPasteControl _commonInitWithConfiguration:target:]((uint64_t)v5, v6, v7);

  }
  return v5;
}

- (UIPasteControl)initWithFrame:(CGRect)frame
{
  UIPasteControl *v3;
  UIPasteControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPasteControl;
  v3 = -[UIControl initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
    -[UIPasteControl _commonInitWithConfiguration:target:]((uint64_t)v3, 0, 0);
  return v4;
}

- (void)_observePasteboard:(_BYTE *)a1
{
  void *v4;
  BOOL v5;
  char v6;
  id v7;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[472])
      v5 = 1;
    else
      v5 = a2 == 0;
    v7 = v4;
    if (v5)
    {
      if (!a1[472] || (a2 & 1) != 0)
        goto LABEL_11;
      objc_msgSend(v4, "removeObserver:name:object:", a1, 0x1E1759BA0, 0);
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__updateEnabledWithNotification_, 0x1E1759BA0, 0);
      v6 = 1;
    }
    a1[472] = v6;
LABEL_11:
    objc_msgSend(a1, "_updateEnabledWithNotification:", 0);

  }
}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPasteControl;
  v4 = a3;
  -[UIControl encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("UIPasteControlConfiguration"), v6.receiver, v6.super_class);
  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(v4, "encodeObject:forKey:", WeakRetained, CFSTR("UIPasteControlTarget"));

}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "_authenticationMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  if (WeakRetained)
  {
    +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemProviders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = WeakRetained;
    v13 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v12;
      do
      {
        if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v14, "canPasteItemProviders:", v13) & 1) != 0)
          break;
        objc_msgSend(v14, "_nextResponderUsingTraversalStrategy:", 2);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v15;
      }
      while (v15);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v12, "canPasteItemProviders:", v13))
    {
      v14 = v12;
    }
    else
    {
      v14 = 0;
    }

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v14;
        v17 = objc_msgSend(v16, "_dataOwnerForPaste");
        if (objc_msgSend(v16, "canBecomeFirstResponder"))
          objc_msgSend(v16, "becomeFirstResponder");

      }
      else
      {
        v17 = 0;
      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __49__UIPasteControl_endTrackingWithTouch_withEvent___block_invoke;
      v19[3] = &unk_1E16B1B50;
      v20 = v14;
      v21 = v13;
      +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v17, v19);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)UIPasteControl;
  -[UIControl endTrackingWithTouch:withEvent:](&v18, sel_endTrackingWithTouch_withEvent_, v6, v7);

}

uint64_t __49__UIPasteControl_endTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pasteItemProviders:", *(_QWORD *)(a1 + 40));
}

- (unsigned)_secureName
{
  return -[_UISecureController secureName](self->_secureController, "secureName");
}

- (void)setTarget:(id)target
{
  id WeakRetained;
  id obj;

  obj = target;
  WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_target, obj);
    -[UIPasteControl _observePasteboard:](self, obj != 0);
  }

}

- (void)_updateEnabledWithNotification:(id)a3
{
  UIPasteConfigurationSupporting **p_target;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _BOOL4 v12;
  id WeakRetained;

  p_target = &self->_target;
  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_target);
    +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v9 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v8;
      if (v10)
      {
        do
        {
          if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "canPasteItemProviders:", v9) & 1) != 0)
            break;
          objc_msgSend(v10, "_nextResponderUsingTraversalStrategy:", 2);
          v11 = objc_claimAutoreleasedReturnValue();

          v10 = (id)v11;
        }
        while (v11);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "canPasteItemProviders:", v9))
    {
      v10 = v8;
    }
    else
    {
      v10 = 0;
    }

    v12 = v10 != 0;
  }
  else
  {
    v12 = 0;
  }
  if (self->_internallyEnabled != v12)
  {
    self->_internallyEnabled = v12;
    -[_UISecureController updateState](self->_secureController, "updateState");
  }

}

- (BOOL)isInternallyEnabled
{
  return self->_internallyEnabled;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UISecureController intrinsicContentSize](self->_secureController, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  -[_UISecureController updateSlotView](self->_secureController, "updateSlotView");
  v3.receiver = self;
  v3.super_class = (Class)UIPasteControl;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPasteControl;
  -[UIControl setEnabled:](&v4, sel_setEnabled_, a3);
  -[_UISecureController updateState](self->_secureController, "updateState");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPasteControl;
  -[UIControl setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[_UISecureController updateState](self->_secureController, "updateState");
}

- (BOOL)shouldTrack
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[_UISecureController enchanted](self->_secureController, "enchanted");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIPasteControl;
    LOBYTE(v3) = -[UIControl shouldTrack](&v5, sel_shouldTrack);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UISecureController intrinsicContentSize](self->_secureController, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIPasteControlConfiguration)configuration
{
  return self->_configuration;
}

- (id)target
{
  return objc_loadWeakRetained((id *)&self->_target);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_secureController, 0);
}

@end

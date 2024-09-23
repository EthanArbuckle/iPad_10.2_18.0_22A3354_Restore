@implementation UIToolTipInteraction

- (NSString)defaultToolTip
{
  return self->_defaultToolTip;
}

- (void)setDefaultToolTip:(NSString *)defaultToolTip
{
  NSString *v5;
  NSString *v6;
  NSString *v7;
  char v8;
  NSString *v9;

  v5 = defaultToolTip;
  v6 = self->_defaultToolTip;
  v7 = v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_defaultToolTip, defaultToolTip);
    -[UIToolTipInteraction _updateStyleForInteractionProperties](self, "_updateStyleForInteractionProperties");
  }
LABEL_9:

}

+ (id)_defaultToolTipInteractionFromInteractions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          v10 = v9;
          if (v9[9])
            goto LABEL_12;

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  v10 = 0;
LABEL_12:

  return v10;
}

+ (id)_newDefaultToolTipInteraction
{
  id result;

  result = (id)objc_opt_new();
  *((_BYTE *)result + 9) = 1;
  return result;
}

- (UIToolTipInteraction)init
{
  UIToolTipInteraction *v2;
  UIToolTipInteraction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIToolTipInteraction;
  v2 = -[UIToolTipInteraction init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    if (init_onceToken[0] != -1)
      dispatch_once(init_onceToken, &__block_literal_global_526);
  }
  return v3;
}

void __28__UIToolTipInteraction_init__block_invoke()
{
  uint64_t v0;
  id v1;

  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_opt_class();
  objc_msgSend(v1, "registerVisualStyleClass:forStylableClass:", v0, objc_opt_class());

}

- (UIToolTipInteraction)initWithDefaultToolTip:(NSString *)defaultToolTip
{
  NSString *v5;
  UIToolTipInteraction *v6;
  UIToolTipInteraction *v7;

  v5 = defaultToolTip;
  v6 = -[UIToolTipInteraction init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaultToolTip, defaultToolTip);

  return v7;
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  id v5;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateImplementsToolTipAtPoint = objc_opt_respondsToSelector() & 1;

    -[UIToolTipInteraction _updateStyleForInteractionProperties](self, "_updateStyleForInteractionProperties");
  }

}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[UIToolTipInteraction _updateStyleForInteractionProperties](self, "_updateStyleForInteractionProperties");
  }
}

- (id)toolTipAtPoint:(CGPoint)a3 boundingRect:(CGRect *)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIToolTipInteraction.m"), 99, CFSTR("boundingRect must not be nil"));

  }
  if (self->_enabled)
  {
    if (self->_delegateImplementsToolTipAtPoint)
    {
      -[UIToolTipInteraction delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "toolTipInteraction:configurationAtPoint:", self, x, y);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "sourceRect");
        if (CGRectIsNull(v28))
        {
          -[UIToolTipInteraction view](self, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bounds");
          a4->origin.x = v11;
          a4->origin.y = v12;
          a4->size.width = v13;
          a4->size.height = v14;

        }
        else
        {
          objc_msgSend(v9, "sourceRect");
          a4->origin.x = v21;
          a4->origin.y = v22;
          a4->size.width = v23;
          a4->size.height = v24;
        }
        objc_msgSend(v9, "toolTip");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      -[UIToolTipInteraction view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      a4->origin.x = v17;
      a4->origin.y = v18;
      a4->size.width = v19;
      a4->size.height = v20;

      -[UIToolTipInteraction defaultToolTip](self, "defaultToolTip");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  -[UIToolTipInteraction _refreshStyle](self, "_refreshStyle");
}

- (void)willMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, 0);
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UIToolTipInteraction");
}

- (void)_refreshStyle
{
  _UIToolTipInteractionStyle *style;
  id WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  _UIToolTipInteractionStyle *v12;
  _UIToolTipInteractionStyle *v13;

  style = self->_style;
  self->_style = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_msgSend(v8, "visualStyleClassForStylableClass:", objc_opt_class());

    v10 = [v9 alloc];
    v11 = objc_loadWeakRetained((id *)&self->_view);
    v12 = (_UIToolTipInteractionStyle *)objc_msgSend(v10, "initWithView:provider:", v11, self);

    v13 = self->_style;
    self->_style = v12;

    -[UIToolTipInteraction _updateStyleForInteractionProperties](self, "_updateStyleForInteractionProperties");
  }
}

- (void)_updateStyleForInteractionProperties
{
  -[_UIToolTipInteractionStyle providerDidUpdate](self->_style, "providerDidUpdate");
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_defaultToolTip, 0);
}

@end

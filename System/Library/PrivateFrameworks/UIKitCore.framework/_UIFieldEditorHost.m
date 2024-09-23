@implementation _UIFieldEditorHost

- (void)addFieldEditor:(id)a3
{
  UIFieldEditor *v5;
  UIFieldEditor *hostedFieldEditor;
  id v7;
  void *v8;
  UIFieldEditor *v9;
  UIFieldEditor *v10;
  id v11;

  v5 = (UIFieldEditor *)a3;
  -[_UIFieldEditorHost _viewForHostingFieldEditor](self, "_viewForHostingFieldEditor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  hostedFieldEditor = self->_hostedFieldEditor;
  if (hostedFieldEditor)
  {
    -[UIView superview](hostedFieldEditor, "superview");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFieldEditorHost.m"), 61, CFSTR("The field editor host (%@) is already hosting a field editor!"), self);

    }
  }
  v9 = self->_hostedFieldEditor;
  self->_hostedFieldEditor = v5;
  v10 = v5;

  objc_msgSend(v11, "addSubview:", self->_hostedFieldEditor);
}

- (id)_viewForHostingFieldEditor
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingView);
  objc_msgSend(WeakRetained, "_contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addPlaceholderLabel:(id)a3
{
  UIFieldEditor *hostedFieldEditor;
  _UIFieldEditorHostingViewRequirements **p_hostingView;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  hostedFieldEditor = self->_hostedFieldEditor;
  p_hostingView = &self->_hostingView;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_hostingView);
  objc_msgSend(WeakRetained, "_contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (hostedFieldEditor)
    objc_msgSend(v7, "insertSubview:below:", v6, self->_hostedFieldEditor);
  else
    objc_msgSend(v7, "addSubview:", v6);

}

+ (id)fieldEditorHostForTextField:(id)a3
{
  id v3;
  __objc2_class **v4;
  int v5;
  void *v6;

  v3 = a3;
  if (+[UISystemInputViewController canUseSystemInputViewControllerForResponder:](UISystemInputViewController, "canUseSystemInputViewControllerForResponder:", v3))
  {
    v4 = off_1E167C4E8;
  }
  else
  {
    v5 = objc_msgSend(v3, "_isPasscodeStyle");
    v4 = off_1E167C4D8;
    if (v5)
      v4 = off_1E167C4E0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v4), "initWithHostingView:", v3);

  return v6;
}

- (_UIFieldEditorHost)initWithHostingView:(id)a3
{
  id v4;
  _UIFieldEditorHost *v5;
  _UIFieldEditorHost *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFieldEditorHost;
  v5 = -[_UIFieldEditorHost init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_hostingView, v4);

  return v6;
}

- (void)removeFieldEditor
{
  UIFieldEditor *hostedFieldEditor;

  -[UIScrollView removeFromSuperview](self->_hostedFieldEditor, "removeFromSuperview");
  hostedFieldEditor = self->_hostedFieldEditor;
  self->_hostedFieldEditor = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedFieldEditor, 0);
  objc_destroyWeak((id *)&self->_hostingView);
}

- (BOOL)isHostingFieldEditor
{
  return self->_hostedFieldEditor != 0;
}

- (id)description
{
  return +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, &unk_1E1A92B28);
}

- (_UIFieldEditorHostingViewRequirements)hostingView
{
  return (_UIFieldEditorHostingViewRequirements *)objc_loadWeakRetained((id *)&self->_hostingView);
}

- (UIFieldEditor)hostedFieldEditor
{
  return self->_hostedFieldEditor;
}

@end
